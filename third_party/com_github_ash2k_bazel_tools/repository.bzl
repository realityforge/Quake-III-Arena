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

load("@bazel_tools//tools/build_defs/repo:git.bzl", _git_repository = "git_repository")

def load_repository():
    if native.existing_rule("com_github_ash2k_bazel_tools"):
        return

    _git_repository(
        name = "com_github_ash2k_bazel_tools",
        commit = "6ab63322e4c0c76a5e4cb669247cd22748e959ca",
        remote = "https://github.com/ash2k/bazel-tools.git",
        shallow_since = "1631879991 +0200",
    )
