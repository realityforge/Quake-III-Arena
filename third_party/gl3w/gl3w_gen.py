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
parser.add_argument('--maximum_profile',
                    type=str,
                    default='99.99',
                    help='The highest OpenGL profile that this tool will support')
parser.add_argument('--extension',
                    action='append',
                    type=str,
                    dest='extensions',
                    help='An extension that will be supported by wrapper')
args = parser.parse_args()

extensions = args.extensions
extensions.sort

quiet = args.quiet is not None and args.quiet
verbose = not quiet and args.verbose

if not quiet:
    print('Configuration:')
    print('  Minimum OpenGL Profile: ' + args.minimum_profile)
    print('  Maximum OpenGL Profile: ' + (args.maximum_profile if '99.99' != args.maximum_profile else '-'))
    print('  Supported Extensions:')
    for extension in extensions:
        print('    * ' + extension)

if verbose:
    print('Loading API Headers to scan')

# Maps name of header filename => group
header_groups = {}
# Maps name of header filename => [group] that have been skipped
header_suppressed_groups = {}
# Maps name of group => list of functions
groups = {}
# list of versions that are above minimum but below or equal to maximum.
# Used to generate guards in code.
optional_versions = []
functions = []
group_pattern = re.compile(r'#ifndef (GL_\w+)')
version_group_pattern = re.compile(r'GL_VERSION_(\d)_(\d)')
function_pattern = re.compile(r'GLAPI.*APIENTRY\s+(\w+)')

group = None
skip_current_group = True

header_files = ['GL/glcorearb.h', 'GL/glext.h']

for filename in header_files:
    with open(os.path.join(args.input_dir, 'include/' + filename), 'r') as f:
        header_groups[filename] = []
        header_suppressed_groups[filename] = []
        for line in f:
            m = group_pattern.match(line)
            if m:
                group = m.group(1)
                v = version_group_pattern.match(group)
                if v:
                    v = v.group(1) + '.' + v.group(2)
                    if args.minimum_profile < v <= args.maximum_profile and not group in optional_versions:
                        optional_versions.append(group)
                    if v > args.maximum_profile:
                        if verbose:
                            print('Skipping group ' + group + ' as it exceeds maximum supported profile version')
                        skip_current_group = True
                    else:
                        skip_current_group = False
                else:
                    skip_current_group = not (group in extensions)
                    if skip_current_group and verbose:
                        print('Skipping group ' + group + ' as this is not a supported extension')
                if skip_current_group:
                    header_suppressed_groups[filename].append(group)
                else:
                    header_groups[filename].append(group)
            if not skip_current_group:
                m = function_pattern.match(line)
                if not m:
                    continue
                function = m.group(1)
                if function in functions:
                    continue
                if not groups.get(group):
                    groups[group] = []
                groups[group].append(function)
                functions.append(function)

optional_versions.sort()
functions.sort()

if not quiet:
    print('Wrapper methods by Specification:')
    for group in groups.keys():
        print('  ' + group + ': ' + str(len(groups[group])))

print('Loading template')
header_template = open(os.path.join(args.input_dir, 'templates/include/GL3W/gl3w.h'), 'r')

groups_present = []
includes_lines = []
for filename in header_files:
    # We define all the groups we do not want so that they do not get defined and nor do their constants
    for group in header_suppressed_groups[filename]:
        includes_lines.append("#define " + group + "\n")
    for group in header_groups[filename]:
        if group in groups_present:
            # We have to undef guard that was defined in previous header as this header includes a similar section
            includes_lines.append("#undef " + group + "\n")
    includes_lines.append("#include \"" + filename + "\"\n")
    # We add any group that was defined in header to a list
    for group in header_groups[filename]:
        if not group in groups_present:
            groups_present.append(group)
    # We undefine the groups we do not want so not to leave incorrect defines present in context
    for group in header_suppressed_groups[filename]:
        includes_lines.append("#undef " + group + "\n")

interface_lines = []

if optional_versions:
    interface_lines.append('union GL3WVersions {\n')
    interface_lines.append('    bool versions[{0}];\n'.format(len(optional_versions)))
    interface_lines.append('    struct {\n')
    for version in optional_versions:
        interface_lines.append('        bool {0};\n'.format(version[3:]))
    interface_lines.append(r'''  } version;
};

GL3W_API extern union GL3WVersions gl3wVersions;

''')
    for version in optional_versions:
        interface_lines.append(
            '#define {0: <48} gl3wVersions.ext.{1}\n'.format('GL3W_' + version[3:], version[3:]))
    interface_lines.append('\n')

interface_lines.append('union GL3WExtensions {\n')
interface_lines.append('    bool extension[{0}];\n'.format(len(extensions)))
interface_lines.append('    struct {\n')
for extension in extensions:
    interface_lines.append('        bool {0};\n'.format(extension[3:]))
interface_lines.append(r'''  } ext;
};

''')
for extension in extensions:
    interface_lines.append(
        '#define {0: <48} gl3wExtensions.ext.{1}\n'.format('GL3W_' + extension[3:], extension[3:]))
interface_lines.append('\n')

interface_lines.append('union GL3WFunctions {\n')
interface_lines.append('    GL3WglProc functions[{0}];\n'.format(len(functions)))
interface_lines.append('    struct {\n')
for function in functions:
    interface_lines.append('        {0: <55} {1};\n'.format('PFN{0}PROC'.format(function.upper()), function[2:]))
interface_lines.append(r'''  } gl;
};

''')
for function in functions:
    interface_lines.append('#define {0: <48} gl3wFunctions.gl.{1}\n'.format(function, function[2:]))

impl_lines = []
impl_lines.append(r'#define GL3W_MIN_MAJOR_VERSION ' + args.minimum_profile.split('.')[0] + "\n")
impl_lines.append(r'#define GL3W_MIN_MINOR_VERSION ' + args.minimum_profile.split('.')[1] + "\n")

if optional_versions:
    impl_lines.append(r'''

#define GLFW_SUPPORT_OPTIONAL_VERSIONS

static const gl3w_version_t gl3w_versions[] = {
''')
    for version in optional_versions:
        impl_lines.append('    { ' + version[11:12] + ', ' + version[13:14] + ' },\n')
    impl_lines.append(r'''};
''')

impl_lines.append(r'''

static const char* gl3w_extension_names[] = {
''')
for extension in extensions:
    impl_lines.append('    "{0}",\n'.format(extension))
impl_lines.append(r'''};
''')

impl_lines.append(r'''

static const char* gl3w_proc_names[] = {
''')
for function in functions:
    impl_lines.append('    "{0}",\n'.format(function))
impl_lines.append(r'''};
''')

includes_content = ''.join(includes_lines)
interface_content = ''.join(interface_lines)
impl_content = ''.join(impl_lines)

dir = os.path.join(args.output_directory, 'include/GL3W/')
if not os.path.exists(dir):
    os.makedirs(dir)
output_filename = os.path.join(dir, 'gl3w.h')

print('Generating {0}...'.format(output_filename))
with open(output_filename, 'wb') as f:
    for line in header_template:
        f.write(line.
                replace('GL3W_SPEC_INCLUDES;', includes_content).
                replace('GL3W_PROCS_DEFINITION;', interface_content).
                replace('GL3W_PROC_NAMES;', impl_content).
                encode('utf-8'))
