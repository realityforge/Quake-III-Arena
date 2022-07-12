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

_VERSION = "3.0.1"

_SHA256 = "8c4173c68ae7da1b5b505194a0c2d6f1b2aef4ec1e3e7463bde451f26bbaf4e7"

def load_repository():
    if native.existing_rule("catch2"):
        return

    _http_archive(
        name = "catch2",
        sha256 = _SHA256,
        strip_prefix = "Catch2-%s" % _VERSION,
        urls = ["https://github.com/catchorg/Catch2/archive/v%s.tar.gz" % _VERSION],
    )
