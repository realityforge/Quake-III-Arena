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

_VERSION = "dd1b157dc6a7a7e790c6fdb1e52b12eda8939119"

_SHA256 = "4957cabaee33e7f06e5ad829382eb4cda1bffdd61fedc9129af8e7170bf47ea9"

def load_repository():
    if native.existing_rule("braincheck"):
        return

    _http_archive(
        name = "braincheck",
        sha256 = _SHA256,
        strip_prefix = "braincheck-c-%s" % _VERSION,
        url = "https://github.com/realityforge/braincheck-c/archive/%s.tar.gz" % _VERSION,
    )
