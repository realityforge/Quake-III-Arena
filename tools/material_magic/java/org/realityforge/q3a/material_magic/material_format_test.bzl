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
load("@rules_java//java:defs.bzl", _java_binary = "java_binary", _java_test = "java_test")

def material_format_test(name, materials):
    params = []
    for m in materials:
        params.append("--input-file")
        params.append("$(execpath %s)" % m)

    _java_test(
        name = "%s_material_format_test" % name,
        size = "small",
        runtime_deps = ["//tools/material_magic/java/org/realityforge/q3a/material_magic:Formatter"],
        main_class = "org.realityforge.q3a.material_magic.Formatter",
        use_testrunner = False,
        args = params + ["--check-only"],
        data = materials,
        visibility = ["//visibility:private"],
    )

    _java_binary(
        name = "%s_material_format" % name,
        runtime_deps = ["//tools/material_magic/java/org/realityforge/q3a/material_magic:Formatter"],
        main_class = "org.realityforge.q3a.material_magic.Formatter",
        args = params,
        tags = [
            "local",
            "manual",
            "no-cache",
            "no-remote",
            "no-sandbox",
        ],
        data = materials,
        visibility = ["//visibility:private"],
    )
