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
    if native.existing_rule("libsdl"):
        return

    _http_archive(
        name = "libsdl",
        build_file_content = """\
filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
""",
        sha256 = "826e83c7a602b2025647e93c6585908379179f68d479dfc1d9b03d2b9570c8d9",
        strip_prefix = "SDL-release-2.0.22",
        urls = ["https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.0.22.tar.gz"],
    )
