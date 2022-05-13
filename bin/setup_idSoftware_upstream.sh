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
# A bash script that sets up a remote to the idSoftware repository and a branch
# named "upstream/idSoftware" that pulls from "idSoftware/master" and pushes to
# the origin repository.
#

set -e

git remote rm idSoftware 2> /dev/null > /dev/null || (echo "idSoftware remote not present")
git remote add --no-tags --track master idSoftware https://github.com/id-Software/Quake-III-Arena
git fetch idSoftware

git checkout idSoftware/master
git branch -D upstream/idSoftware 2> /dev/null > /dev/null || (echo "idSoftware upstream branch not present")
git checkout -B upstream/idSoftware
git config branch.upstream/idSoftware.remote idSoftware
git config branch.upstream/idSoftware.merge refs/heads/master
git config branch.upstream/idSoftware.pushRemote origin
git gc --prune=now --aggressive
git push

git checkout master
