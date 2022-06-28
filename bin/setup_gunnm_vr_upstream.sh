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
# A bash script that sets up a remote to the gunnm_vr repository and a branch
# named "upstream/gunnm_vr" that pulls from "gunnm_vr/master" and pushes to
# the origin repository. A branch named "upstream/gunnm_vr_formatted" is also
# setup that is the code from the gunnm_vr repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm gunnm_vr 2>/dev/null >/dev/null || (echo "gunnm_vr remote not present")
git remote add --no-tags --track master gunnm_vr https://github.com/GUNNM-VR/Quake-III-Arena-VR-Edition.git
git fetch gunnm_vr

git checkout gunnm_vr/master
git branch -D upstream/gunnm_vr 2>/dev/null >/dev/null || (echo "gunnm_vr upstream branch not present")
git checkout -B upstream/gunnm_vr
git config branch.upstream/gunnm_vr.remote gunnm_vr
git config branch.upstream/gunnm_vr.merge refs/heads/master
git config branch.upstream/gunnm_vr.pushRemote origin
git gc --prune=now --aggressive
git push -f

git branch -D upstream/gunnm_vr_formatted 2>/dev/null >/dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/gunnm_vr_formatted
git show origin/master:.clang-format >.clang-format
# shellcheck disable=SC2038
find code \
    \( -name '*.h' -or -name '*.c' -or -name '*.m' -or -name '*.hpp' -or -name '*.cpp' -or -name '*.H' -or -name '*.HPP' -or -name '*.CPP' -or -name '*.java' \) -and \
    ! -path 'code/libsdl/windows/include/SDL2/*' \
    ! -path 'code/libcurl/windows/include/curl/*' \
    ! -path 'code/win32/msvc2017/packages/OpenXR.Headers.1.0.10.2/include/*' \
    ! -path 'code/vrmod/OpenXR/xr_linear.h' \
    ! -path 'code/vrmod/OpenXR/openxr/*' \
    ! -path 'code/renderercommon/vulkan/*' \
    ! -path 'code/libjpeg/*' | \
    xargs clang-format -i
git add code/
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
rm .clang-format
git push origin :upstream/gunnm_vr_formatted 2>/dev/null >/dev/null || echo "No upstream/gunnm_vr_formatted branch to delete"
git push -f --set-upstream origin upstream/gunnm_vr_formatted

# Return to master branch on completion
git checkout master
