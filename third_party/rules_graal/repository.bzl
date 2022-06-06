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

_GRAAL_GIT_COMMIT = "9fd38761df4ac293f952d10379c0c3520dd9ceed"
_GRAAL_GIT_COMMIT_SHA256 = "14e6d480fb2c0f03f2331efef316d2b8e07c32d34b1ea8a0eef83ea6a15d22df"

def load_repository():
    if native.existing_rule("rules_graal"):
        return

    _http_archive(
        name = "rules_graal",
        sha256 = _GRAAL_GIT_COMMIT_SHA256,
        strip_prefix = "rules_graal-%s" % _GRAAL_GIT_COMMIT,
        urls = ["https://github.com/andyscott/rules_graal/archive/%s.zip" % _GRAAL_GIT_COMMIT],
    )
