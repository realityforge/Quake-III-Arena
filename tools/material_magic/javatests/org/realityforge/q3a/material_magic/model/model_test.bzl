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
load("//third_party/junit5:rules.bzl", _junit5_test = "junit5_test")

def model_test(name):
    _junit5_test(
        name = name,
        size = "small",
        srcs = ["%s.java" % name],
        test_package = "org.realityforge.q3a.material_magic.model",
        deps = [
            "//third_party/java:javax_annotation",
            "//tools/material_magic/java/org/realityforge/q3a/material_magic/model",
            "//tools/material_magic/java/org/realityforge/q3a/material_magic/util:MaterialOutput",
        ],
    )