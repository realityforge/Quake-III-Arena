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
load("@rules_java//java:repositories.bzl", _rules_java_dependencies = "rules_java_dependencies", _rules_java_toolchains = "rules_java_toolchains")
load(":dependencies.bzl", _generate_workspace_rules = "generate_workspace_rules")

def configure_repository():
    _rules_java_dependencies()
    _rules_java_toolchains()
    _generate_workspace_rules()
