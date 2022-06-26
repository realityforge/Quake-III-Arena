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
find code content tools -type f -name '*.h' -o -name '*.c' -o -name '*.m' -o -name '*.java' | xargs clang-format -i

# Format Shell Scripts
find . ! -path './tmp/*' -type f \( -name '*.sh' -or -name 'git-pre-commit' \) -print0 | xargs -0 "$SHFMT" -i=4 -s -w

# Format Bazel files
./bazelw run //:buildifier

find . -name '*.BUILD.bazel' -print0 | xargs -0 buildifier -type build

./bazelw run //content/baseq3:baseq3_material_format
./bazelw run //content/teamarena:teamarena_material_format
