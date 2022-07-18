/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
#include "vm_local.h"
#include "lang_util.h"

static inline int loadWord(void* addr)
{
    int word;
    memcpy(&word, addr, 4);
    return LittleLong(word);
}

void VM_PrepareInterpreter(vm_t* vm, vmHeader_t* header)
{
    int op;
    int byte_pc;
    int int_pc;
    uint8_t* code;
    int instruction;
    int* codeBase;

    vm->codeBase = Hunk_Alloc(vm->codeLength * 4, h_high); // we're now int aligned
    //	memcpy( vm->codeBase, (uint8_t *)header + header->codeOffset, vm->codeLength );

    // we don't need to translate the instructions, but we still need
    // to find each instructions starting point for jumps
    int_pc = byte_pc = 0;
    instruction = 0;
    code = (uint8_t*)header + header->codeOffset;
    codeBase = (int*)vm->codeBase;

    // Copy and expand instructions to words while building instruction table
    while (instruction < header->instructionCount) {
        vm->instructionPointers[instruction] = int_pc;
        instruction++;

        op = (int)code[byte_pc];
        codeBase[int_pc] = op;
        if (byte_pc > header->codeLength)
            Com_Error(ERR_DROP, "VM_PrepareInterpreter: pc > header->codeLength");

        byte_pc++;
        int_pc++;

        // these are the only opcodes that aren't a single byte
        switch (op) {
        case OP_ENTER:
        case OP_CONST:
        case OP_LOCAL:
        case OP_LEAVE:
        case OP_EQ:
        case OP_NE:
        case OP_LTI:
        case OP_LEI:
        case OP_GTI:
        case OP_GEI:
        case OP_LTU:
        case OP_LEU:
        case OP_GTU:
        case OP_GEU:
        case OP_EQF:
        case OP_NEF:
        case OP_LTF:
        case OP_LEF:
        case OP_GTF:
        case OP_GEF:
        case OP_BLOCK_COPY:
            codeBase[int_pc] = loadWord(&code[byte_pc]);
            byte_pc += 4;
            int_pc++;
            break;
        case OP_ARG:
            codeBase[int_pc] = (int)code[byte_pc];
            byte_pc++;
            int_pc++;
            break;
        default:
            break;
        }
    }
    int_pc = 0;
    instruction = 0;

    // Now that the code has been expanded to int-sized opcodes, we'll translate instruction index
    // into an index into codeBase[], which contains opcodes and operands.
    while (instruction < header->instructionCount) {
        op = codeBase[int_pc];
        instruction++;
        int_pc++;

        switch (op) {
        // These ops need to translate addresses in jumps from instruction index to int index
        case OP_EQ:
        case OP_NE:
        case OP_LTI:
        case OP_LEI:
        case OP_GTI:
        case OP_GEI:
        case OP_LTU:
        case OP_LEU:
        case OP_GTU:
        case OP_GEU:
        case OP_EQF:
        case OP_NEF:
        case OP_LTF:
        case OP_LEF:
        case OP_GTF:
        case OP_GEF:
            if (codeBase[int_pc] < 0 || codeBase[int_pc] > vm->instructionCount)
                Com_Error(ERR_DROP, "VM_PrepareInterpreter: Jump to invalid instruction number");

            // codeBase[pc] is the instruction index. Convert that into an offset into
            // the int-aligned codeBase[] by the lookup table.
            codeBase[int_pc] = vm->instructionPointers[codeBase[int_pc]];
            int_pc++;
            break;

        // These opcodes have an operand that isn't an instruction index
        case OP_ENTER:
        case OP_CONST:
        case OP_LOCAL:
        case OP_LEAVE:
        case OP_BLOCK_COPY:
        case OP_ARG:
            int_pc++;
            break;

        default:
            break;
        }
    }
}

/*
==============
VM_Call


Upon a system call, the stack will look like:

sp+32	parm1
sp+28	parm0
sp+24	return stack
sp+20	return address
sp+16	local1
sp+14	local0
sp+12	arg1
sp+8	arg0
sp+4	return stack
sp		return address

An interpreted function will immediately execute
an OP_ENTER instruction, which will subtract space for
locals from sp
==============
*/

#define DEBUGSTR va("%s%i", VM_Indent(vm), opStackOfs)

int VM_CallInterpreted(vm_t* vm, int* args)
{
    uint8_t stack[OPSTACK_SIZE + 15];
    int* opStack;
    uint8_t opStackOfs;
    int programCounter;
    int programStack;
    int stackOnEntry;
    uint8_t* image;
    int* codeImage;
    int v1;
    int dataMask;
    int arg;

    // we might be called recursively, so this might not be the very top
    programStack = stackOnEntry = vm->programStack;

    // set up the stack frame
    image = vm->dataBase;
    codeImage = (int*)vm->codeBase;
    dataMask = vm->dataMask;

    programCounter = 0;

    programStack -= (8 + 4 * MAX_VMMAIN_ARGS);

    for (arg = 0; arg < MAX_VMMAIN_ARGS; arg++)
        *(int*)&image[programStack + 8 + arg * 4] = args[arg];

    *(int*)&image[programStack + 4] = 0; // return stack
    *(int*)&image[programStack] = -1; // will terminate the loop on return

    VM_Debug(0);

    // leave a free spot at start of stack so
    // that as long as opStack is valid, opStack-1 will
    // not corrupt anything
    opStack = PADP(stack, 16);
    *opStack = 0xDEADBEEF;
    opStackOfs = 0;

    //	vm_debugLevel=2;
    // main interpreter loop, will exit when a LEAVE instruction
    // grabs the -1 program counter

#define r2 codeImage[programCounter]

    while (1) {
        int opcode, r0, r1;
        //		unsigned int	r2;

    nextInstruction:
        r0 = opStack[opStackOfs];
        r1 = opStack[(uint8_t)(opStackOfs - 1)];
    nextInstruction2:
        opcode = codeImage[programCounter++];
        switch (opcode) {
        case OP_BREAK:
            vm->breakCount++;
            goto nextInstruction2;
        case OP_CONST:
            opStackOfs++;
            r1 = r0;
            r0 = opStack[opStackOfs] = r2;

            programCounter += 1;
            goto nextInstruction2;
        case OP_LOCAL:
            opStackOfs++;
            r1 = r0;
            r0 = opStack[opStackOfs] = r2 + programStack;

            programCounter += 1;
            goto nextInstruction2;

        case OP_LOAD4:
            r0 = opStack[opStackOfs] = *(int*)&image[r0 & dataMask];
            goto nextInstruction2;
        case OP_LOAD2:
            r0 = opStack[opStackOfs] = *(unsigned short*)&image[r0 & dataMask];
            goto nextInstruction2;
        case OP_LOAD1:
            r0 = opStack[opStackOfs] = image[r0 & dataMask];
            goto nextInstruction2;

        case OP_STORE4:
            *(int*)&image[r1 & dataMask] = r0;
            opStackOfs -= 2;
            goto nextInstruction;
        case OP_STORE2:
            *(short*)&image[r1 & dataMask] = r0;
            opStackOfs -= 2;
            goto nextInstruction;
        case OP_STORE1:
            image[r1 & dataMask] = r0;
            opStackOfs -= 2;
            goto nextInstruction;

        case OP_ARG:
            // single byte offset from programStack
            *(int*)&image[(codeImage[programCounter] + programStack) & dataMask] = r0;
            opStackOfs--;
            programCounter += 1;
            goto nextInstruction;

        case OP_BLOCK_COPY:
            VM_BlockCopy(r1, r0, r2);
            programCounter += 1;
            opStackOfs -= 2;
            goto nextInstruction;

        case OP_CALL:
            // save current program counter
            *(int*)&image[programStack] = programCounter;

            // jump to the location on the stack
            programCounter = r0;
            opStackOfs--;
            if (programCounter < 0) {
                // system call
                int r;
                // save the stack to allow recursive VM entry
                //				temp = vm->callLevel;
                vm->programStack = programStack - 4;
                *(int*)&image[programStack + 4] = -1 - programCounter;
                {
                    // the vm has ints on the stack, we expect
                    // pointers so we might have to convert it
                    if (sizeof(intptr_t) != sizeof(int)) {
                        intptr_t argarr[MAX_VMSYSCALL_ARGS];
                        int* imagePtr = (int*)&image[programStack];
                        for (int i = 0; i < COUNT_OF(argarr); ++i) {
                            argarr[i] = *(++imagePtr);
                        }
                        r = vm->systemCall(argarr);
                    } else {
                        intptr_t* argptr = (intptr_t*)&image[programStack + 4];
                        r = vm->systemCall(argptr);
                    }
                }

                // save return value
                opStackOfs++;
                opStack[opStackOfs] = r;
                programCounter = *(int*)&image[programStack];
            } else if ((unsigned)programCounter >= vm->instructionCount) {
                Com_Error(ERR_DROP, "VM program counter out of range in OP_CALL");
                return 0;
            } else {
                programCounter = vm->instructionPointers[programCounter];
            }
            goto nextInstruction;

        // push and pop are only needed for discarded or bad function return values
        case OP_PUSH:
            opStackOfs++;
            goto nextInstruction;
        case OP_POP:
            opStackOfs--;
            goto nextInstruction;

        case OP_ENTER:
            // get size of stack frame
            v1 = r2;

            programCounter += 1;
            programStack -= v1;
            goto nextInstruction;
        case OP_LEAVE:
            // remove our stack frame
            v1 = r2;

            programStack += v1;

            // grab the saved program counter
            programCounter = *(int*)&image[programStack];
            // check for leaving the VM
            if (programCounter == -1) {
                goto done;
            } else if ((unsigned)programCounter >= vm->codeLength) {
                Com_Error(ERR_DROP, "VM program counter out of range in OP_LEAVE");
                return 0;
            }
            goto nextInstruction;

            /*
            ===================================================================
            BRANCHES
            ===================================================================
            */

        case OP_JUMP:
            if ((unsigned)r0 >= vm->instructionCount) {
                Com_Error(ERR_DROP, "VM program counter out of range in OP_JUMP");
                return 0;
            }

            programCounter = vm->instructionPointers[r0];

            opStackOfs--;
            goto nextInstruction;

        case OP_EQ:
            opStackOfs -= 2;
            if (r1 == r0) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_NE:
            opStackOfs -= 2;
            if (r1 != r0) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_LTI:
            opStackOfs -= 2;
            if (r1 < r0) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_LEI:
            opStackOfs -= 2;
            if (r1 <= r0) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_GTI:
            opStackOfs -= 2;
            if (r1 > r0) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_GEI:
            opStackOfs -= 2;
            if (r1 >= r0) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_LTU:
            opStackOfs -= 2;
            if (((unsigned)r1) < ((unsigned)r0)) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_LEU:
            opStackOfs -= 2;
            if (((unsigned)r1) <= ((unsigned)r0)) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_GTU:
            opStackOfs -= 2;
            if (((unsigned)r1) > ((unsigned)r0)) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_GEU:
            opStackOfs -= 2;
            if (((unsigned)r1) >= ((unsigned)r0)) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_EQF:
            opStackOfs -= 2;

            if (((float*)opStack)[(uint8_t)(opStackOfs + 1)] == ((float*)opStack)[(uint8_t)(opStackOfs + 2)]) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_NEF:
            opStackOfs -= 2;

            if (((float*)opStack)[(uint8_t)(opStackOfs + 1)] != ((float*)opStack)[(uint8_t)(opStackOfs + 2)]) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_LTF:
            opStackOfs -= 2;

            if (((float*)opStack)[(uint8_t)(opStackOfs + 1)] < ((float*)opStack)[(uint8_t)(opStackOfs + 2)]) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_LEF:
            opStackOfs -= 2;

            if (((float*)opStack)[(uint8_t)((uint8_t)(opStackOfs + 1))] <= ((float*)opStack)[(uint8_t)((uint8_t)(opStackOfs + 2))]) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_GTF:
            opStackOfs -= 2;

            if (((float*)opStack)[(uint8_t)(opStackOfs + 1)] > ((float*)opStack)[(uint8_t)(opStackOfs + 2)]) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

        case OP_GEF:
            opStackOfs -= 2;

            if (((float*)opStack)[(uint8_t)(opStackOfs + 1)] >= ((float*)opStack)[(uint8_t)(opStackOfs + 2)]) {
                programCounter = r2; // vm->instructionPointers[r2];
                goto nextInstruction;
            } else {
                programCounter += 1;
                goto nextInstruction;
            }

            //===================================================================

        case OP_NEGI:
            opStack[opStackOfs] = -r0;
            goto nextInstruction;
        case OP_ADD:
            opStackOfs--;
            opStack[opStackOfs] = r1 + r0;
            goto nextInstruction;
        case OP_SUB:
            opStackOfs--;
            opStack[opStackOfs] = r1 - r0;
            goto nextInstruction;
        case OP_DIVI:
            opStackOfs--;
            opStack[opStackOfs] = r1 / r0;
            goto nextInstruction;
        case OP_DIVU:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) / ((unsigned)r0);
            goto nextInstruction;
        case OP_MODI:
            opStackOfs--;
            opStack[opStackOfs] = r1 % r0;
            goto nextInstruction;
        case OP_MODU:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) % ((unsigned)r0);
            goto nextInstruction;
        case OP_MULI:
            opStackOfs--;
            opStack[opStackOfs] = r1 * r0;
            goto nextInstruction;
        case OP_MULU:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) * ((unsigned)r0);
            goto nextInstruction;

        case OP_BAND:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) & ((unsigned)r0);
            goto nextInstruction;
        case OP_BOR:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) | ((unsigned)r0);
            goto nextInstruction;
        case OP_BXOR:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) ^ ((unsigned)r0);
            goto nextInstruction;
        case OP_BCOM:
            opStack[opStackOfs] = ~((unsigned)r0);
            goto nextInstruction;

        case OP_LSH:
            opStackOfs--;
            opStack[opStackOfs] = r1 << r0;
            goto nextInstruction;
        case OP_RSHI:
            opStackOfs--;
            opStack[opStackOfs] = r1 >> r0;
            goto nextInstruction;
        case OP_RSHU:
            opStackOfs--;
            opStack[opStackOfs] = ((unsigned)r1) >> r0;
            goto nextInstruction;

        case OP_NEGF:
            ((float*)opStack)[opStackOfs] = -((float*)opStack)[opStackOfs];
            goto nextInstruction;
        case OP_ADDF:
            opStackOfs--;
            ((float*)opStack)[opStackOfs] = ((float*)opStack)[opStackOfs] + ((float*)opStack)[(uint8_t)(opStackOfs + 1)];
            goto nextInstruction;
        case OP_SUBF:
            opStackOfs--;
            ((float*)opStack)[opStackOfs] = ((float*)opStack)[opStackOfs] - ((float*)opStack)[(uint8_t)(opStackOfs + 1)];
            goto nextInstruction;
        case OP_DIVF:
            opStackOfs--;
            ((float*)opStack)[opStackOfs] = ((float*)opStack)[opStackOfs] / ((float*)opStack)[(uint8_t)(opStackOfs + 1)];
            goto nextInstruction;
        case OP_MULF:
            opStackOfs--;
            ((float*)opStack)[opStackOfs] = ((float*)opStack)[opStackOfs] * ((float*)opStack)[(uint8_t)(opStackOfs + 1)];
            goto nextInstruction;

        case OP_CVIF:
            ((float*)opStack)[opStackOfs] = (float)opStack[opStackOfs];
            goto nextInstruction;
        case OP_CVFI:
            opStack[opStackOfs] = Q_ftol(((float*)opStack)[opStackOfs]);
            goto nextInstruction;
        case OP_SEX8:
            opStack[opStackOfs] = (signed char)opStack[opStackOfs];
            goto nextInstruction;
        case OP_SEX16:
            opStack[opStackOfs] = (short)opStack[opStackOfs];
            goto nextInstruction;
        }
    }

done:
    if (opStackOfs != 1 || *opStack != 0xDEADBEEF)
        Com_Error(ERR_DROP, "Interpreter error: opStack[0] = %X, opStackOfs = %d", opStack[0], opStackOfs);

    vm->programStack = stackOnEntry;

    // return the result
    return opStack[opStackOfs];
}
