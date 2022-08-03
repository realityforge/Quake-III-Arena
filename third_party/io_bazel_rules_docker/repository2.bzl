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

load("@io_bazel_rules_docker//cc:image.bzl", _cc_image_repos = "repositories")
load("@io_bazel_rules_docker//repositories:deps.bzl", _container_deps = "deps")
load("@io_bazel_rules_docker//repositories:repositories.bzl", _container_repositories = "repositories")

def configure_repository():
    _container_deps(go_repository_default_config = "@//:WORKSPACE.bazel")
    _container_repositories()
    _cc_image_repos()
