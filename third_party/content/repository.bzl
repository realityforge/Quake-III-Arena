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

"""Bazel repository rules for loading content from original games."""

load(":metadata.bzl", _PAK_DATA = "PAK_DATA")
load("//build_defs:http_repository_from_env.bzl", _http_repository_from_env = "http_repository_from_env")

def _create_repository_data_from_metadata(name):
    data = _PAK_DATA[name]
    build_content = """
load("@org_realityforge_q3a//third_party/content:metadata.bzl", _PAK_DATA = "PAK_DATA")
"""
    if None != data.get("tga_files"):
        build_content += """
load("@org_realityforge_q3a//build_defs:assets.bzl", _convert_tga_to_png = "convert_tga_to_png")
"""

    if None != data.get("other_files"):
        build_content += """

filegroup(
    name = "files",
    srcs = _PAK_DATA["%s"]["other_files"],
    visibility = ["//visibility:public"],
)
""" % (name)

    if None != data.get("tga_files"):
        build_content += """

filegroup(
    name = "tga_files",
    srcs = _PAK_DATA["%s"]["tga_files"],
    visibility = ["//visibility:public"],
)

_convert_tga_to_png(name = "%s")

exports_files(_PAK_DATA["%s"]["tga_files"])
""" % (name, name, name)

    if None != data.get("shader_files"):
        build_content += """

filegroup(
    name = "shader_files",
    srcs = _PAK_DATA["%s"]["shader_files"],
    visibility = ["//visibility:public"],
)

exports_files(_PAK_DATA["%s"]["shader_files"])
""" % (name, name)

    sha256 = None
    if None != data["info"].get("sha256"):
        sha256 = data["info"]["sha256"]

    base_url_env = data["info"]["base_url_env"]
    local_path = data["info"]["local_path"]

    return struct(sha256 = sha256, build_content = build_content, base_url_env = base_url_env, local_path = local_path)

def load_repository():
    for name in _PAK_DATA.keys():
        data = _create_repository_data_from_metadata(name)
        _http_repository_from_env(
            name = name,
            base_url_env = data.base_url_env,
            local_path = data.local_path,
            sha256 = data.sha256,
            build_file_content = data.build_content,
        )
