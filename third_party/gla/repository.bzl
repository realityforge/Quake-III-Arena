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

_GLA_VERSION = "1.6"
_GLA_SHA256 = "16bde6864d1dc5a29c065059ca92e1ef20a5d7e57cdc421a807134a581420e93"

def load_repository():
    if native.existing_rule("gla"):
        return

    _http_archive(
        name = "gla",
        sha256 = _GLA_SHA256,
        strip_prefix = "gla-%s" % _GLA_VERSION,
        url = "https://github.com/realityforge/gla/archive/refs/tags/v%s.tar.gz" % _GLA_VERSION,
    )
