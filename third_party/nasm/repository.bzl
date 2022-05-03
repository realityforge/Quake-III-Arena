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
    if native.existing_rule("nasm"):
        return

    _http_archive(
        name = "nasm",
        build_file = "//third_party/nasm:nasm.BUILD.bazel",
        sha256 = "34fd26c70a277a9fdd54cb5ecf389badedaf48047b269d1008fbc819b24e80bc",
        strip_prefix = "nasm-2.14.02",
        urls = ["http://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2"],
    )
