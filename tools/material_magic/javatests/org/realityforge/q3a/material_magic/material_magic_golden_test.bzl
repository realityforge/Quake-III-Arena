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
load("@bazel_skylib//rules:diff_test.bzl", "diff_test")

def material_magic_golden_test(name, inputs, outputs):
    actual_inputs = ["scenarios/%s/input/%s" % (name, o) for o in inputs]
    actual_pretty_outputs = ["output/%s/output/pretty/%s" % (name, o) for o in outputs]
    actual_optimized_outputs = ["output/%s/output/optimized/%s" % (name, o) for o in outputs]
    actual_outputs = actual_pretty_outputs + actual_optimized_outputs
    native.genrule(
        name = "%s_pretty_generator" % name,
        srcs = actual_inputs,
        outs = actual_pretty_outputs,
        cmd = "$(execpath //tools/material_magic/java/org/realityforge/q3a/material_magic:Main) --output-file $@ " + " ".join(["--input-file $(execpath %s)" % i for i in actual_inputs]),
        tools = ["//tools/material_magic/java/org/realityforge/q3a/material_magic:Main"],
    )
    native.genrule(
        name = "%s_optimized_generator" % name,
        srcs = actual_inputs,
        outs = actual_optimized_outputs,
        cmd = "$(execpath //tools/material_magic/java/org/realityforge/q3a/material_magic:Main) --optimize --output-file $@ " + " ".join(["--input-file $(execpath %s)" % i for i in actual_inputs]),
        tools = ["//tools/material_magic/java/org/realityforge/q3a/material_magic:Main"],
    )

    native.genrule(
        name = "%s_update_goldens_script" % name,
        outs = ["%s_update_goldens.sh" % name],
        cmd = "\n".join(
            ["cat <<'EOF' >$@", "#!/bin/bash"] +
            ["mkdir -p $${BUILD_WORKSPACE_DIRECTORY}/tools/material_magic/javatests/org/realityforge/q3a/material_magic/scenarios/%s/output" % name] +
            ["cp $(rootpath output/%s/output/pretty/%s) $${BUILD_WORKSPACE_DIRECTORY}/tools/material_magic/javatests/org/realityforge/q3a/material_magic/scenarios/%s/output/pretty/%s" % (name, o, name, o) for o in outputs] +
            ["cp $(rootpath output/%s/output/optimized/%s) $${BUILD_WORKSPACE_DIRECTORY}/tools/material_magic/javatests/org/realityforge/q3a/material_magic/scenarios/%s/output/optimized/%s" % (name, o, name, o) for o in outputs] +
            ["EOF"],
        ),
        executable = True,
        srcs = actual_outputs,
    )

    native.sh_binary(
        name = "%s_update_goldens" % name,
        srcs = ["%s_update_goldens.sh" % name],
        data = actual_outputs,
        tags = ["manual", "local"],
    )

    for o in outputs:
        diff_test(
            name = "%s_pretty_output_%s_test" % (name, o),
            size = "small",
            file1 = "output/%s/output/pretty/%s" % (name, o),
            file2 = "scenarios/%s/output/pretty/%s" % (name, o),
        )
        diff_test(
            name = "%s_optimized_output_%s_test" % (name, o),
            size = "small",
            file1 = "output/%s/output/optimized/%s" % (name, o),
            file2 = "scenarios/%s/output/optimized/%s" % (name, o),
        )
