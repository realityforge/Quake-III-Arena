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

load("//third_party/content:metadata.bzl", _PAK_DATA = "PAK_DATA")

def _convert_tga_to_png_impl(ctx):
    output_file = ctx.actions.declare_file(ctx.attr.out)
    target_file = output_file.path
    command = ";".join([
        '%s convert -auto-orient "%s" "%s"' % (ctx.executable._magick.path, ctx.file.src.path, target_file),
        '%s -brute -ow -warn "%s"' % (ctx.executable._pngcrush.path, target_file),
        '%s compare -auto-orient -metric RMSE "%s" "png32:%s" null: 2>/dev/null' % (ctx.executable._magick.path, ctx.file.src.path, target_file),
    ])

    ctx.actions.run_shell(
        inputs = [ctx.file.src],
        outputs = [output_file],
        tools = [ctx.executable._magick, ctx.executable._pngcrush],
        command = command,
        mnemonic = "CopyToTgaToPng",
        progress_message = "Creating PNG %s from TGA" % ctx.attr.out,
        use_default_shell_env = True,
    )
    return [DefaultInfo(files = depset([output_file]), runfiles = ctx.runfiles([output_file]))]

_convert_tga_to_png = rule(
    attrs = {
        "out": attr.string(mandatory = True),
        "src": attr.label(allow_single_file = True, cfg = "exec"),
        "_magick": attr.label(
            cfg = "exec",
            executable = True,
            allow_single_file = True,
            default = Label("@imagemagick//:magick"),
        ),
        "_pngcrush": attr.label(
            cfg = "exec",
            executable = True,
            allow_single_file = True,
            default = Label("@pngcrush"),
        ),
    },
    implementation = _convert_tga_to_png_impl,
    provides = [DefaultInfo],
)

# A Bazel macro that takes a list of TGA files that are named "*.tga" and a string label indicating the package
# in which the files are exported. The macro defines targets to convert each .tga file into a .png file and
# defines a fileset that contains all the converted images.
def convert_tga_to_png(name):
    output_files = []
    for file in _PAK_DATA[name]["tga_files"]:
        _file_sans_extension = file.removesuffix(".tga").removesuffix(".TGA").lower().replace(".", "_")
        _target_name = "%s.png_gen" % _file_sans_extension
        output_files.append(_target_name)
        _convert_tga_to_png(
            name = _target_name,
            src = "@%s//:%s" % (name, file),
            out = "%s.png" % _file_sans_extension,
        )

    native.filegroup(name = "png_files", srcs = output_files, visibility = ["//visibility:public"])
