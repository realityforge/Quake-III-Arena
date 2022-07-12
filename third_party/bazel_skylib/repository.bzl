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
    if native.existing_rule("bazel_skylib"):
        return

    _http_archive(
        name = "bazel_skylib",
        sha256 = "d847b08d6702d2779e9eb399b54ff8920fa7521dc45e3e53572d1d8907767de7",
        strip_prefix = "bazel-skylib-2a87d4a62af886fb320883aba102255aba87275e",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/2a87d4a62af886fb320883aba102255aba87275e.tar.gz"],
    )
