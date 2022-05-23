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

# A Bazel macro that takes a list of TGA files that are named "*.tga" and a string label indicating the package
# in which the files are exported. The macro defines targets to convert each .tga file into a .png file and
# defines a fileset that contains all the converted images.
def convert_tga_to_png(name):
    package_label = "@%s//" % name
    files = _PAK_DATA[name]["tga_files"]
    output_files = []
    for file in files:
        _file_sans_extension = file.removesuffix(".tga").removesuffix(".TGA").lower()
        _input_label = "%s:%s" % (package_label, file)
        _output_file = "%s.png" % _file_sans_extension
        _target_name = "%s.png_gen" % _file_sans_extension
        output_files.append(_target_name)
        native.genrule(
            name = _target_name,
            srcs = [_input_label],
            outs = [_output_file],
            cmd = """
set -euo pipefail
export INPUT=$(execpath %s)
$(execpath @imagemagick//:magick) convert -auto-orient "$${INPUT}" "$@"
$(execpath @pngcrush) -brute -ow -warn "$@"
$(execpath @imagemagick//:magick) compare -auto-orient -metric RMSE "$${INPUT}" "png32:$@" null: 2>/dev/null
""" % (_input_label),
            tools = ["@imagemagick//:magick", "@pngcrush"],
        )

    native.filegroup(name = "png_files", srcs = output_files, visibility = ["//visibility:public"])
