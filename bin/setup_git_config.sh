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

git config --local blame.ignoreRevsFile bin/git-blame-ignore-revs
