#!/usr/bin/env python

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Note: This code was initially a refactoring of gl3w retrieved from the url below. It was gradually
# rewritten until little if any remained from the upstream code.
# https://github.com/skaslev/gl3w/blob/5f8d7fd191ba22ff2b60c1106d7135bb9a335533/gl3w_gen.py

# Allow Python 2.6+ to use the print() function
from __future__ import print_function

import argparse
import os
import re

parser = argparse.ArgumentParser(description='gla generator script')
parser.add_argument('--quiet', action='store_true', help='Quiet output')
parser.add_argument('--verbose', action='store_true', help='Verbose output')
parser.add_argument('--header_only',
                    action='store_true',
                    help='Should the output be a src file and a header or just a header '
                         'with a section guarded by GLA_IMPLEMENTATION')
parser.add_argument('--input_dir',
                    type=str,
                    default=os.path.dirname(os.path.realpath(__file__)),
                    help='Input directory')
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
                    default=[],
                    help='An extension that will be supported by wrapper')
args = parser.parse_args()

extensions = args.extensions
extensions.sort

quiet = args.quiet is not None and args.quiet
verbose = not quiet and args.verbose

header_only = args.header_only is not None and args.header_only

if not quiet:
    print('Configuration:')
    print('  Minimum OpenGL Profile: ' + args.minimum_profile)
    print('  Maximum OpenGL Profile: ' + (args.maximum_profile if '99.99' != args.maximum_profile else '-'))
    print('  Header Only: ' + ('true' if header_only else 'false'))
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
# list of versions that are in groups that are at or below minimum version.
required_functions = []
void_functions = []
group_pattern = re.compile(r'#ifndef (GL_\w+)')
version_group_pattern = re.compile(r'GL_VERSION_(\d)_(\d)')
function_pattern = re.compile(r'GLAPI(.*)APIENTRY\s+(\w+)')

group = None
skip_current_group = True
required_group = False

header_files = ['GL/glcorearb.h', 'GL/glext.h']

for filename in header_files:
    with open(os.path.join(args.input_dir, 'include/' + filename), 'r') as f:
        header_groups[filename] = []
        header_suppressed_groups[filename] = []
        for line in f:
            m = group_pattern.match(line)
            if m:
                group = m.group(1)
                required_group = False
                v = version_group_pattern.match(group)
                if v:
                    v = v.group(1) + '.' + v.group(2)
                    required_group = args.minimum_profile >= group
                    if args.minimum_profile < v <= args.maximum_profile and group not in optional_versions:
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
                function = m.group(2)
                if function in functions:
                    continue
                if not groups.get(group):
                    groups[group] = []
                groups[group].append(function)
                if required_group and function not in required_functions:
                    required_functions.append(function)
                functions.append(function)
                if ' void ' == m.group(1):
                    void_functions.append(function)

required_functions.sort()
optional_versions.sort()
functions.sort()

if verbose:
    print('Wrapper methods by version:')
    for group in groups.keys():
        print('  ' + group + ': ' + str(len(groups[group])))
    print('Group Count by Header:')
    for header in header_groups.keys():
        print('  ' + header + ': ' +
              str(len(header_groups[header])) + ' included, ' +
              str(len(header_suppressed_groups[header])) + ' excluded')

if verbose:
    print('Loading templates')
header_template = open(os.path.join(args.input_dir, 'templates/include/GLA/gla.h'), 'r')
implementation_template = open(os.path.join(args.input_dir, 'templates/src/GLA/gla.c'), 'r')

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
    interface_lines.append('union GLAVersions {\n')
    interface_lines.append('    bool versions[{0}];\n'.format(len(optional_versions)))
    interface_lines.append('    struct {\n')
    for version in optional_versions:
        interface_lines.append('        bool {0};\n'.format(version[3:]))
    interface_lines.append(r'''  } version;
};

GLA_API extern union GLAVersions glaVersions;

''')
    for version in optional_versions:
        interface_lines.append(
            '#define {0: <48} glaVersions.version.{1}\n'.format('GLA_' + version[3:], version[3:]))
    interface_lines.append('\n')

if extensions:
    interface_lines.append('union GLAExtensions {\n')
    interface_lines.append('    bool extensions[{0}];\n'.format(len(extensions)))
    interface_lines.append('    struct {\n')
    for extension in extensions:
        interface_lines.append('        bool {0};\n'.format(extension[3:]))
    interface_lines.append(r'''  } extension;
};

GLA_API extern union GLAExtensions glaExtensions;

''')
    for extension in extensions:
        interface_lines.append(
            '#define {0: <48} glaExtensions.extension.{1}\n'.format('GLA_' + extension[3:], extension[3:]))
    interface_lines.append('\n')

interface_lines.append('union GLAFunctions {\n')
interface_lines.append('    GLAglFunction functions[{0}];\n'.format(len(functions)))
interface_lines.append('    struct {\n')
for function in functions:
    interface_lines.append('        {0: <55} {1};\n'.format('PFN{0}PROC'.format(function.upper()), function[2:]))
interface_lines.append(r'''  } function;
};

GLA_API extern union GLAFunctions glaFunctions;

''')
for function in functions:
    interface_lines.append('#define {0: <48} {1}(glaFunctions.function.{2}(__VA_ARGS__))\n'.
                           format(function + '(...)', 'GLA_CHECK' if function in void_functions else '', function[2:]))

impl_lines = []
impl_lines.append(r'#define GLA_MIN_MAJOR_VERSION ' + args.minimum_profile.split('.')[0] + "\n")
impl_lines.append(r'#define GLA_MIN_MINOR_VERSION ' + args.minimum_profile.split('.')[1] + "\n")

if optional_versions:
    impl_lines.append(r'''
#define GLFW_SUPPORT_OPTIONAL_VERSIONS

typedef struct gla_version_s {
    int major;
    int minor;
} gla_version_t;

static const gla_version_t gla_versions[] = {
''')
    for version in optional_versions:
        impl_lines.append('    { ' + version[11:12] + ', ' + version[13:14] + ' },\n')
    impl_lines.append('};\n')

if extensions:
    impl_lines.append(r'''
#define GLFW_SUPPORT_EXTENSIONS

static const char* gla_extension_names[] = {
''')
    for extension in extensions:
        impl_lines.append('    "{0}",\n'.format(extension))
    impl_lines.append('};\n')

impl_lines.append(r'''

typedef struct gla_function_s {
    const char* name;
    bool required;
} gla_function_t;

static const gla_function_t gla_functions[] = {
''')
for function in functions:
    impl_lines.append(
        '    { \"' + function + '\", ' + ('true' if function in required_functions else 'false') + ' },\n')
impl_lines.append('};\n')

includes_content = ''.join(includes_lines)
interface_content = ''.join(interface_lines)
impl_content = ''.join(impl_lines)

if header_only:
    interface_content = interface_content + "\n#ifdef GLA_IMPLEMENTATION\n"
    for line in implementation_template:
        interface_content = interface_content + line.replace('GLA_IMPL_CONTENT;\n', impl_content).replace("#include \"GLA/gla.h\"\n", "")
    interface_content = interface_content + "\n#endif // GLA_IMPLEMENTATION\n"

include_dir = os.path.join(args.output_directory, 'include/GLA/')
if not os.path.exists(include_dir):
    os.makedirs(include_dir)
include_output_filename = os.path.join(include_dir, 'gla.h')

if not quiet:
    print('Generating {0}...'.format(include_output_filename))
with open(include_output_filename, 'wb') as f:
    for line in header_template:
        f.write(line.
                replace('GLA_INCLUDES_CONTENT;\n', includes_content).
                replace('GLA_INTERFACE_CONTENT;\n', interface_content).
                encode('utf-8'))
if not header_only:
    src_dir = os.path.join(args.output_directory, 'src/GLA/')
    if not os.path.exists(src_dir):
        os.makedirs(src_dir)

    impl_output_filename = os.path.join(src_dir, 'gla.c')

    if not quiet:
        print('Generating {0}...'.format(impl_output_filename))
    with open(impl_output_filename, 'wb') as f:
        for line in implementation_template:
            f.write(line.replace('GLA_IMPL_CONTENT;\n', impl_content).encode('utf-8'))
