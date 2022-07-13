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
    if native.existing_rule("libpng"):
        return

    # libpng is no longer used in the main application but continues to be used in pngcrush
    _http_archive(
        name = "libpng",
        build_file = "//third_party/libpng:libpng.BUILD.bazel",
        sha256 = "3d22d46c566b1761a0e15ea397589b3a5f36ac09b7c785382e6470156c04247f",
        strip_prefix = "libpng-1.6.35",
        urls = ["https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35.zip"],
    )
