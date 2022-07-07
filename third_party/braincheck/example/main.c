/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define BRAINCHECK_PRINTF(args...) printf(args)

#include <printf.h>
#include "braincheck.h"

void func1() { braincheck_backtrace_n(2); }
void func2() { func1(); }
void func3() { func2(); }
void func4() { func3(); }

int main()
{
    const char message[] = "This is a message\1\1\1\1";
    braincheck_debug_hexdump(message, sizeof(message));

    const int a = 2;
    braincheck_debug(3 * a);

    int numbers[] = { -1, 13 };
    braincheck_debug_array(numbers, 2);

    errno = EDOM;
    braincheck_perror("Some maths operation");

    func4();

    braincheck_assert_lt(1, 2);

    // This next assertion will fail
    braincheck_assert_lt_m(44, 2, "44 is not less than 2 - go figure?");
    return 0;
}
