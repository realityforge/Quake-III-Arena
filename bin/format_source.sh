#!/bin/bash
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

#
# A simple shell script to format the entire set of source code using a single command
# This is probably not required when using the pre-commit hook and IDE integration
# but is present in case we ever need to perform large scale source code format changes
# again
#

# shellcheck disable=SC2038
find code/ -name '*.h' -o -name '*.c' | xargs clang-format -i
