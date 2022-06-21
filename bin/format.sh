#!/usr/bin/env bash
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

set -euo pipefail

SHFMT="$(./bazelw run --run_under=echo @com_github_mvdan_sh//cmd/shfmt)"

# Format Source code using clang-format
# shellcheck disable=SC2038
git ls-tree -r --name-only HEAD | grep -i -e "\.h$" -e "\.hpp$" -e "\.c$" -e "\.cc$" -e "\.cpp$" -e "\.m$"  -e "\.java$" | grep -v "^third_party/" | xargs clang-format -i

# Format Shell Scripts
git ls-tree -r --name-only HEAD | grep -e "\.sh$" -e "git-pre-commit$" | xargs "$SHFMT" -i=4 -s -w

# Format Bazel files
./bazelw run //:buildifier

# Format Bazel files for external repositories as if they are build files
git ls-tree -r --name-only HEAD | grep -e "\.BUILD\.bazel" | xargs buildifier -type build

./bazelw run //content/baseq3:baseq3_material_format
./bazelw run //content/teamarena:teamarena_material_format
