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

# NOTE: This file was derived from https://github.com/aspect-build/bazel-lib/blob/910786038c98ad93888e165e89aee6e5ef1365a4/lib/transitions.bzl
#       and is under the Apache 2 license as specified by https://github.com/aspect-build/bazel-lib/blob/910786038c98ad93888e165e89aee6e5ef1365a4/LICENSE

def _transition_platform_impl(_, attr):
    return {"//command_line_option:platforms": []}

# Transition from any input configuration to one that includes the --platforms command-line flag.
_transition_platform = transition(
    implementation = _transition_platform_impl,
    inputs = [],
    outputs = ["//command_line_option:platforms"],
)

def _platform_transition_filegroup_impl(ctx):
    files = []
    for src in ctx.attr.srcs:
        files.append(src[DefaultInfo].files)

    runfiles = ctx.runfiles().merge_all([src[DefaultInfo].default_runfiles for src in ctx.attr.srcs])
    return [DefaultInfo(files = depset(transitive = files), runfiles = runfiles)]

platform_transition_filegroup = rule(
    _platform_transition_filegroup_impl,
    attrs = {
        "srcs": attr.label_list(
            allow_empty = False,
            cfg = _transition_platform,
            doc = "The input to be transitioned to the target platform.",
        ),
        "target_platform": attr.label(
            doc = "The target platform to transition the srcs.",
            mandatory = True,
        ),
        # Required to Opt-in to the transitions feature.
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    doc = "Transitions the srcs to use the provided platform. The filegroup will contain artifacts for the target platform.",
)
