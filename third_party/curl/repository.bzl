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
    if native.existing_rule("curl"):
        return

    _http_archive(
        name = "curl",
        build_file = "//third_party/curl:curl.BUILD.bazel",
        sha256 = "ac8e1087711084548d788ef18b9b732c8de887457b81f616fc681d1044b32f98",
        strip_prefix = "curl-7.81.0",
        urls = ["https://curl.haxx.se/download/curl-7.81.0.tar.gz"],
    )
