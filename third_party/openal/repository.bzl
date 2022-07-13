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
    if native.existing_rule("openal"):
        return

    _http_archive(
        name = "openal",
        build_file = "//third_party/openal:openal.BUILD.bazel",
        sha256 = "c8ad767e9a3230df66756a21cc8ebf218a9d47288f2514014832204e666af5d8",
        strip_prefix = "openal-soft-1.21.1",
        urls = ["https://openal-soft.org/openal-releases/openal-soft-1.21.1.tar.bz2"],
    )
