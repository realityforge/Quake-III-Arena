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
# A bash script that sets up a remote to the ioq3quest_mrc repository and a branch
# named "upstream/ioq3quest_mrc" that pulls from "ioq3quest_mrc/MRC" and pushes to
# the origin repository. A branch named "upstream/ioq3quest_mrc_formatted" is also
# setup that is the code from the ioq3quest_mrc repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm ioq3quest_mrc 2>/dev/null >/dev/null || (echo "ioq3quest_mrc remote not present")
git remote add --no-tags --track MRC ioq3quest_mrc https://github.com/lvonasek/ioq3quest.git
git fetch ioq3quest_mrc

git checkout ioq3quest_mrc/MRC
git branch -D upstream/ioq3quest_mrc 2>/dev/null >/dev/null || (echo "ioq3quest_mrc upstream branch not present")
git checkout -B upstream/ioq3quest_mrc
git config branch.upstream/ioq3quest_mrc.remote ioq3quest_mrc
git config branch.upstream/ioq3quest_mrc.merge refs/heads/MRC
git config branch.upstream/ioq3quest_mrc.pushRemote origin
git rm --force -r .github/workflows
git commit -m "Remove workflows from upstream branch to avoid executing actions unnecessarily"
git gc --prune=now --aggressive
git push -f

git branch -D upstream/ioq3quest_mrc_formatted 2>/dev/null >/dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/ioq3quest_mrc_formatted
git show origin/master:.clang-format >.clang-format
# shellcheck disable=SC2038
find android/app/src/main/cpp/code \
    \( -name '*.h' -or -name '*.c' -or -name '*.m' -or -name '*.hpp' -or -name '*.cpp' -or -name '*.H' -or -name '*.HPP' -or -name '*.CPP' -or -name '*.java' \) \
    ! -path 'android/app/src/main/cpp/code/AL/*' -and \
    ! -path 'android/app/src/main/cpp/code/curl-7.54.0/*' -and \
    ! -path 'android/app/src/main/cpp/code/jpeg-8c/*' -and \
    ! -path 'android/app/src/main/cpp/code/libogg-1.3.3/*' -and \
    ! -path 'android/app/src/main/cpp/code/libvorbis-1.3.6/*' -and \
    ! -path 'android/app/src/main/cpp/code/opus-1.2.1/*' -and \
    ! -path 'android/app/src/main/cpp/code/opusfile-0.9/*' -and \
    ! -path 'android/app/src/main/cpp/code/SDL2/*' -and \
    ! -path 'android/app/src/main/cpp/code/tools/*' -and \
    ! -path 'android/app/src/main/cpp/code/zlib/*' |
    xargs clang-format -i
git add android/app/src/main/cpp/code/
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
rm .clang-format
git push origin :upstream/ioq3quest_mrc_formatted 2>/dev/null >/dev/null || echo "No upstream/ioq3quest_mrc_formatted branch to delete"
git push -f --set-upstream origin upstream/ioq3quest_mrc_formatted

# Return to master branch on completion
git checkout master
