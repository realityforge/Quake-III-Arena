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
# A bash script that sets up a remote to the ioq3 repository and a branch
# named "upstream/ioq3" that pulls from "ioq3/main" and pushes to
# the origin repository. A branch named "upstream/ioq3_formatted" is also
# setup that is the code from the ioq3 repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm ioq3 2>/dev/null >/dev/null || (echo "ioq3 remote not present")
git remote add --no-tags --track main ioq3 https://github.com/ioquake/ioq3.git
git fetch ioq3

git checkout ioq3/main
git branch -D upstream/ioq3 2>/dev/null >/dev/null || (echo "ioq3 upstream branch not present")
git checkout -B upstream/ioq3
git config branch.upstream/ioq3.remote ioq3
git config branch.upstream/ioq3.merge refs/heads/main
git config branch.upstream/ioq3.pushRemote origin
git rm --force -r .github/workflows
git commit -m "Remove workflows from upstream branch to avoid executing actions unnecessarily"
git gc --prune=now --aggressive
git push -f

git branch -D upstream/ioq3_formatted 2>/dev/null >/dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/ioq3_formatted
git show origin/master:.clang-format >.clang-format
# shellcheck disable=SC2038
find code \
    \( -name '*.h' -or -name '*.c' -or -name '*.m' -or -name '*.hpp' -or -name '*.cpp' -or -name '*.H' -or -name '*.HPP' -or -name '*.CPP' -or -name '*.java' \) \
    ! -path 'code/AL/*' -and \
    ! -path 'code/curl-7.54.0/*' -and \
    ! -path 'code/jpeg-8c/*' -and \
    ! -path 'code/libogg-1.3.3/*' -and \
    ! -path 'code/libvorbis-1.3.6/*' -and \
    ! -path 'code/opus-1.2.1/*' -and \
    ! -path 'code/opusfile-0.9/*' -and \
    ! -path 'code/SDL2/*' -and \
    ! -path 'code/tools/*' -and \
    ! -path 'code/zlib/*' |
    xargs clang-format -i
git add code/
rm .clang-format
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
git push origin :upstream/ioq3_formatted 2>/dev/null >/dev/null || echo "No upstream/ioq3_formatted branch to delete"
git push -f --set-upstream origin upstream/ioq3_formatted

# Return to master branch on completion
git checkout master
