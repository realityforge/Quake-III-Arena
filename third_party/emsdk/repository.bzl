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
    if native.existing_rule("emsdk"):
        return

    _version = "3.1.13"
    _sha256 = "a84b34c087ce757f30daa4e1a5fc720caebb0429db02b563f2326aed080285df"
    _http_archive(
        name = "emsdk",
        strip_prefix = "emsdk-%s/bazel" % _version,
        url = "https://github.com/emscripten-core/emsdk/archive/refs/tags/%s.zip" % _version,
        sha256 = _sha256,
        patch_args = ["-p1"],
        patches = ["@org_realityforge_q3a//third_party/emsdk:emsdk.patch"],
    )
