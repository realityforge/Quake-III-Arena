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

load("@bazel_tools//tools/cpp:cc_configure.bzl", _cc_autoconf_impl = "cc_autoconf_impl")

def _cc_clang_toolchain_impl(ctx):
    # download a version of clang built by the chromium project.
    # see https://chromium.googlesource.com/chromium/src/+/master/docs/clang.md
    #
    # The "latest" version can be scraped from the script
    # https://chromium.googlesource.com/chromium/src/tools/clang/+/master/scripts/update.py
    version = "llvmorg-15-init-1995-g5bec1ea7-2"

    CHECKSUMS = {
        "Linux_x64": None,
        "Mac": "59f5a1c39a24024f4e3c5090d63b6183305c821997cad581364e5ed7d00575ad",
        "Win": None,
    }

    os_name = ctx.os.name.lower()
    platform = None
    if os_name.startswith("mac os"):
        platform = "Mac"
    if os_name.startswith("linux"):
        platform = "Linux_x64"
    if os_name.startswith("windows"):
        platform = "Win"
    if platform == None:
        fail("Unsupported platform")

    sha256 = CHECKSUMS[platform]
    out_folder = "clang_tools"
    ctx.download_and_extract("https://commondatastorage.googleapis.com/chromium-browser-clang/%s/clang-%s.tgz" % (platform, version), output = out_folder, sha256 = sha256)

    _cc_autoconf_impl(ctx, {"gcc": "%s/bin/clang" % out_folder})

cc_clang_toolchain = repository_rule(implementation = _cc_clang_toolchain_impl)
