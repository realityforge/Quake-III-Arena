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

# NOTE: This Build file was copied from https://github.com/tensorflow/tensorflow/blob/7a99ce11636fb7e0c974d4d9b8b5dbff7f259c87/third_party/common.bzl
#       and is under the Apache 2 license as specified by https://github.com/tensorflow/tensorflow/blob/7a99ce11636fb7e0c974d4d9b8b5dbff7f259c87/LICENSE

# Rule for simple expansion of template files. This performs a simple
# search over the template file for the keys in substitutions,
# and replaces them with the corresponding values.
#
# Typical usage:
#   load("@org_realityforge_ioq3//third_party:common.bzl", "template_rule")
#   expand_template(
#       name = "ExpandMyTemplate",
#       template = "my.template",
#       out = "my.txt",
#       substitutions = {
#         "$VAR1": "foo",
#         "$VAR2": "bar",
#       }
#   )
#
# Args:
#   name: The name of the rule.
#   template: The template file to expand
#   out: The destination of the expanded file
#   substitutions: A dictionary mapping strings to their substitutions
#
# TODO: The next release of Bazel should support this rule directly via load("@bazel_skylib//rules:expand_template.bzl", "expand_template") and this file should be removed
#
def expand_template_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file.template,
        output = ctx.outputs.out,
        substitutions = ctx.attr.substitutions,
    )

expand_template = rule(
    attrs = {
        "template": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "substitutions": attr.string_dict(mandatory = True),
        "out": attr.output(mandatory = True),
    },
    # output_to_genfiles is required for header files.
    output_to_genfiles = True,
    implementation = expand_template_impl,
)
