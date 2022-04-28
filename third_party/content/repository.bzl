"""Bazel repository rules for loading content from original games."""

load(":metadata.bzl", _PAK_DATA = "PAK_DATA")
load("//build_defs:http_repository_from_env.bzl", _http_repository_from_env = "http_repository_from_env")

def _create_repository_data_from_metadata(name):
    data = _PAK_DATA[name]
    build_content = """
load("@org_realityforge_ioq3//third_party/content:metadata.bzl", _PAK_DATA = "PAK_DATA")
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

exports_files(_PAK_DATA["%s"]["tga_files"])
""" % (name, name)

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
