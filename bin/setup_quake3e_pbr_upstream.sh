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
# A bash script that sets up a remote to the quake3e_pbr repository and a branch
# named "upstream/quake3e_pbr" that pulls from "quake3e_pbr/master" and pushes to
# the origin repository. A branch named "upstream/quake3e_pbr_formatted" is also
# setup that is the code from the quake3e_pbr repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm quake3e_pbr 2>/dev/null >/dev/null || (echo "quake3e_pbr remote not present")
git remote add --no-tags --track master quake3e_pbr https://github.com/JKSunny/Quake3e.git
git fetch quake3e_pbr

git checkout quake3e_pbr/master
git branch -D upstream/quake3e_pbr 2>/dev/null >/dev/null || (echo "quake3e_pbr upstream branch not present")
git checkout -B upstream/quake3e_pbr
git config branch.upstream/quake3e_pbr.remote quake3e_pbr
git config branch.upstream/quake3e_pbr.merge refs/heads/master
git config branch.upstream/quake3e_pbr.pushRemote origin
git rm --force -r .github/workflows
git commit -m "Remove workflows from upstream branch to avoid executing actions unnecessarily"
git gc --prune=now --aggressive
git push -f

git branch -D upstream/quake3e_pbr_formatted 2>/dev/null >/dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/quake3e_pbr_formatted
git show origin/master:.clang-format >.clang-format
# shellcheck disable=SC2038
find code \
    \( -name '*.h' -or -name '*.c' -or -name '*.m' -or -name '*.hpp' -or -name '*.cpp' -or -name '*.H' -or -name '*.HPP' -or -name '*.CPP' -or -name '*.java' \) \
    ! -path 'code/libcurl/*' -and \
    ! -path 'code/libjpeg/*' -and \
    ! -path 'code/libsdl/*' -and \
    ! -path 'code/renderercommon/vulkan/*' |
    xargs clang-format -i
git add code/
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
rm .clang-format
git push origin :upstream/quake3e_pbr_formatted || echo "No upstream/quake3e_pbr_formatted branch to delete"
git push --set-upstream origin upstream/quake3e_pbr_formatted

# Return to master branch on completion
git checkout master
