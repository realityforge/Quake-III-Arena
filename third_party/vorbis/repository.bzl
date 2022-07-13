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
    if native.existing_rule("vorbis"):
        return

    _http_archive(
        name = "vorbis",
        build_file = "//third_party/vorbis:vorbis.BUILD.bazel",
        sha256 = "57c8bc92d2741934b8dc939af49c2639edc44b8879cba2ec14ad3189e2814582",
        strip_prefix = "libvorbis-1.3.7",
        urls = ["https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.zip"],
    )
