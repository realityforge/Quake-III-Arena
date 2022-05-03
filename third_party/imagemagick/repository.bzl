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
def _imagemagick_repository_impl(rctx):
    bin_ext = ""
    if rctx.os.name.lower().startswith("windows"):
        bin_ext = ".exe"

    magick = rctx.which("magick" + bin_ext)
    if not magick:
        fail("""
from imagemagick_repository():
    ImageMagick must be installed and 'magick{bin_ext}' available in your PATH.
    Download ImageMagick here: https://imagemagick.org/script/download.php
             """.format(bin_ext = bin_ext))
    rctx.symlink(magick, "_magick" + bin_ext)
    rctx.file(
        "BUILD.bazel",
        content = """
package(default_visibility = ["//visibility:public"])

alias(name = "magick", actual = "_magick{bin_ext}")
                  """.format(bin_ext = bin_ext),
        executable = False,
    )

_imagemagick_repository = repository_rule(
    implementation = _imagemagick_repository_impl,
    attrs = {},
)

def load_repository():
    _imagemagick_repository(name = "imagemagick")
