#!/usr/bin/env python

#   This file is part of gl3w, hosted at https://github.com/skaslev/gl3w
#
#   This is free and unencumbered software released into the public domain.
#
#   Anyone is free to copy, modify, publish, use, compile, sell, or
#   distribute this software, either in source code form or as a compiled
#   binary, for any purpose, commercial or non-commercial, and by any
#   means.
#
#   In jurisdictions that recognize copyright laws, the author or authors
#   of this software dedicate any and all copyright interest in the
#   software to the public domain. We make this dedication for the benefit
#   of the public at large and to the detriment of our heirs and
#   successors. We intend this dedication to be an overt act of
#   relinquishment in perpetuity of all present and future rights to this
#   software under copyright law.
#
#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#   IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
#   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
#   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#   OTHER DEALINGS IN THE SOFTWARE.

# Allow Python 2.6+ to use the print() function
from __future__ import print_function

import argparse
import os
import re

parser = argparse.ArgumentParser(description='gl3w generator script')
parser.add_argument('--quiet', action='store_true', help='Verbose output')
parser.add_argument('--verbose', action='store_true', help='Verbose output')
parser.add_argument('--input_dir', type=str, default='', help='Input directory')
parser.add_argument('--output_directory', type=str, default='', help='Output directory')
parser.add_argument('--minimum_profile',
                    type=str,
                    default='1.0',
                    help='The lowest OpenGL profile that the generated code will support')
args = parser.parse_args()


quiet = args.quiet is not None and args.quiet
verbose = not quiet and args.verbose

if not quiet:
    print('Configuration:')
    print('  Minimum OpenGL Profile: ' + args.minimum_profile)

if verbose:
    print('Loading API Headers to scan')

procs = []
p = re.compile(r'GLAPI.*APIENTRY\s+(\w+)')
with open(os.path.join(args.input_dir, 'include/GL/glcorearb.h'), 'r') as f:
    for line in f:
        m = p.match(line)
        if not m:
            continue
        proc = m.group(1)
        procs.append(proc)

with open(os.path.join(args.input_dir, 'include/GL/glext.h'), 'r') as f:
    for line in f:
        m = p.match(line)
        if not m:
            continue
        proc = m.group(1)
        if proc in procs:
            continue
        procs.append(proc)

procs.sort()

print('Loading template')
header_template = open(os.path.join(args.input_dir, 'templates/include/GL3W/gl3w.h'), 'r')

procs_def_content = []

procs_def_content.append('union GL3WProcs {\n')
procs_def_content.append('    GL3WglProc ptr[{0}];\n'.format(len(procs)))
procs_def_content.append('    struct {\n')
for proc in procs:
    procs_def_content.append('        {0: <55} {1};\n'.format('PFN{0}PROC'.format(proc.upper()), proc[2:]))
procs_def_content.append(r'''  } gl;
};

GL3W_API extern union GL3WProcs gl3wProcs;

// OpenGL functions
''')
for proc in procs:
    procs_def_content.append('#define {0: <48} gl3wProcs.gl.{1}\n'.format(proc, proc[2:]))

procs_table_content = []
procs_table_content.append(r'#define GL3W_MIN_MAJOR_VERSION ' + args.minimum_profile.split('.')[0] + "\n")
procs_table_content.append(r'#define GL3W_MIN_MINOR_VERSION ' + args.minimum_profile.split('.')[1] + "\n")

procs_table_content.append(r'''

static const char* gl3w_proc_names[] = {
''')
for proc in procs:
    procs_table_content.append('    "{0}",\n'.format(proc))
procs_table_content.append(r'''};
''')

procs_def = ''.join(procs_def_content)
procs_table = ''.join(procs_table_content)

dir = os.path.join(args.output_directory, 'include/GL3W/')
if not os.path.exists(dir):
    os.makedirs(dir)
output_filename = os.path.join(dir, 'gl3w.h')

print('Generating {0}...'.format(output_filename))
with open(output_filename, 'wb') as f:
    for line in header_template:
        f.write(
            line.replace('GL3W_PROCS_DEFINITION;', procs_def).replace('GL3W_PROC_NAMES;', procs_table).encode('utf-8'))
