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

#
# A bash script that sets up a remote to the cnq3 repository and a branch
# named "upstream/cnq3" that pulls from "cnq3/master" and pushes to
# the origin repository. A branch named "upstream/cnq3_formatted" is also
# setup that is the code from the cnq3 repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm cnq3 2>/dev/null >/dev/null || (echo "cnq3 remote not present")
git remote add --no-tags --track master cnq3 https://bitbucket.org/CPMADevs/cnq3.git
git fetch cnq3

git checkout cnq3/master
git branch -D upstream/cnq3 2>/dev/null >/dev/null || (echo "cnq3 upstream branch not present")
git checkout -B upstream/cnq3
git config branch.upstream/cnq3.remote cnq3
git config branch.upstream/cnq3.merge refs/heads/master
git config branch.upstream/cnq3.pushRemote origin
git gc --prune=now --aggressive
git push -f

git branch -D upstream/cnq3_formatted 2>/dev/null >/dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/cnq3_formatted
git show origin/master:.clang-format >.clang-format
# shellcheck disable=SC2038
find code \
    \( -name '*.h' -or -name '*.c' -or -name '*.m' -or -name '*.hpp' -or -name '*.cpp' -or -name '*.H' -or -name '*.HPP' -or -name '*.CPP' -or -name '*.java' \) \
    ! -path 'code/glew/*' -and \
    ! -path 'code/libjpeg-turbo/*' -and \
    ! -path 'code/libunwind/*' -and \
    ! -path 'code/tools/*' -and \
    ! -path 'code/renderer/dxgi/*' |
    xargs clang-format -i
git add code/
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
rm .clang-format
git push origin :upstream/cnq3_formatted || echo "No upstream/cnq3_formatted branch to delete"
git push --set-upstream origin upstream/cnq3_formatted

# Return to master branch on completion
git checkout master
