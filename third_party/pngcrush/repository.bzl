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
    if native.existing_rule("pngcrush"):
        return

    _http_archive(
        name = "pngcrush",
        build_file = "//third_party/pngcrush:pngcrush.BUILD.bazel",
        sha256 = "3d0fc5ccd1d0ff39e2a6544b36dc5832ac03ab61cfd266e2663988116ab65237",
        strip_prefix = "pcr010813",
        urls = ["https://ixpeering.dl.sourceforge.net/project/pmt/pngcrush/1.8.13/pngcrush-1.8.13.zip"],
    )
