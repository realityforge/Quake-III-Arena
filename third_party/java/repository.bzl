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

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("rules_java"):
        return

    _http_archive(
        name = "rules_java",
        url = "https://github.com/bazelbuild/rules_java/releases/download/6.3.2/rules_java-6.3.2.tar.gz",
        sha256 = "7c82d4412fb837a40e049deea352cfc019d2a247ab9639aa7df12381fb39de60",
    )
