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

load("@bazel_gazelle//:deps.bzl", _go_repository = "go_repository")

def configure_repository():
    if native.existing_rule("com_github_mvdan_sh"):
        return

    _go_repository(
        name = "cc_mvdan_sh",
        importpath = "mvdan.cc/sh",
        sum = "h1:eD6tDeh0pw+/TOTI1BBEryZ02rD2nMcFsgcvde7jffM=",
        version = "v2.6.4+incompatible",
    )

    _go_repository(
        name = "com_github_mvdan_sh",
        importpath = "github.com/mvdan/sh",
        sum = "h1:D4oEWW0J8cL7zeQkrXw76IAYXF0mJfDaBwjgzmKb6zs=",
        version = "v2.6.4+incompatible",
    )
