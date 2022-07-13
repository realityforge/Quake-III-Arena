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
    if native.existing_rule("libspng"):
        return

    _http_archive(
        name = "libspng",
        build_file = "//third_party/libspng:libspng.BUILD.bazel",
        sha256 = "2caa3a0cacabb3d56e0c6552cec60ff13cea1110cd5467d4053957b5b8e14fb1",
        strip_prefix = "libspng-0.7.2",
        urls = ["https://github.com/randy408/libspng/archive/refs/tags/v0.7.2.zip"],
    )
