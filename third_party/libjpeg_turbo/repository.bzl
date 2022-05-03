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
    if native.existing_rule("libjpeg_turbo"):
        return

    _http_archive(
        name = "libjpeg_turbo",
        build_file = "//third_party/libjpeg_turbo:libjpeg_turbo.BUILD.bazel",
        sha256 = "dbda0c685942aa3ea908496592491e5ec8160d2cf1ec9d5fd5470e50768e7859",
        strip_prefix = "libjpeg-turbo-2.1.3",
        urls = ["https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.3.tar.gz"],
    )
