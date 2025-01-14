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

_VERSION = "e5ee032225211d4fc5c2a06cbdaef3f839af0dba"

_SHA256 = "054d1ebf2bb6f54b8184197739c94a6d8b94fa387ed9b8e6d7221c536c53e56f"

def load_repository():
    if native.existing_rule("braincheck"):
        return

    _http_archive(
        name = "braincheck",
        sha256 = _SHA256,
        strip_prefix = "braincheck-c-%s" % _VERSION,
        url = "https://github.com/realityforge/braincheck-c/archive/%s.tar.gz" % _VERSION,
    )
