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
    if native.existing_rule("opus"):
        return

    _http_archive(
        name = "opus",
        build_file = "//third_party/opus:opus.BUILD.bazel",
        sha256 = "65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d",
        strip_prefix = "opus-1.3.1",
        urls = ["https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz"],
    )
