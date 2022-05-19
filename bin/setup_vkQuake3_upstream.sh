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
# A bash script that sets up a remote to the vkQuake3 repository and a branch
# named "upstream/vkQuake3" that pulls from "vkQuake3/master" and pushes to
# the origin repository. A branch named "upstream/vkQuake3_formatted" is also
# setup that is the code from the vkQuake3 repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

export BRANCH_WITH_CLANG_FORMAT=origin/master

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm vkQuake3 2> /dev/null > /dev/null || (echo "vkQuake3 remote not present")
git remote add --no-tags --track master vkQuake3 https://github.com/suijingfeng/vkQuake3.git
git fetch vkQuake3

git checkout vkQuake3/master
git branch -D upstream/vkQuake3 2> /dev/null > /dev/null || (echo "vkQuake3 upstream branch not present")
git checkout -B upstream/vkQuake3
git config branch.upstream/vkQuake3.remote vkQuake3
git config branch.upstream/vkQuake3.merge refs/heads/master
git config branch.upstream/vkQuake3.pushRemote origin
git gc --prune=now --aggressive
git push

git branch -D upstream/vkQuake3_formatted 2> /dev/null > /dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/vkQuake3_formatted
git show ${BRANCH_WITH_CLANG_FORMAT}:.clang-format > .clang-format
# shellcheck disable=SC2038
find code \
     \( -name '*.h' -or -name '*.c' -or -name '*.m' \)  \
     ! -path 'code/AL/*' -and \
     ! -path 'code/curl-7.54.0/*' -and \
     ! -path 'code/jpeg-8c/*' -and \
     ! -path 'code/libogg-1.3.3/*' -and \
     ! -path 'code/libvorbis-1.3.6/*' -and \
     ! -path 'code/opus-1.2.1/*' -and \
     ! -path 'code/opusfile-0.9/*' -and \
     ! -path 'code/SDL2/*' -and \
     ! -path 'code/tools/*' -and \
     ! -path 'code/zlib/*' \
     | xargs clang-format -i
git add code/
rm .clang-format
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
git push origin :upstream/vkQuake3_formatted 2> /dev/null > /dev/null || echo "No upstream/vkQuake3_formatted branch to delete"
git push --set-upstream origin upstream/vkQuake3_formatted

# Return to master branch on completion
git checkout master
