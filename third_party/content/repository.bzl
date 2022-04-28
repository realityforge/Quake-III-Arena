"""Bazel repository rules for loading content from original games."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
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

    return struct(sha256 = _sha256, build_content = build_content)

def _local_pak(game, index):
    name = "q3a_%s_pak%d" % (game, index)
    data = _create_repository_data_from_metadata(name)
    _http_repository_from_env(
        name = name,
        base_url_env = "Q3TA_DIR",
        local_path = "%s/pak%s.pk3" % (game, index),
        sha256 = data.sha256,
        build_file_content = data.build_content,
    )

def _local_assets(name, path):
    data = _create_repository_data_from_metadata(name)
    _http_repository_from_env(
        name = name,
        base_url_env = "ASSETS_DIR",
        local_path = path,
        sha256 = data.sha256,
        build_file_content = data.build_content,
    )

def load_repository():
    # Quake 3 Arena
    _local_pak("baseq3", 0)
    _local_pak("baseq3", 2)
    _local_pak("baseq3", 4)
    _local_pak("baseq3", 5)
    _local_pak("baseq3", 6)
    _local_pak("baseq3", 8)

    # Quake 3 Team Arena
    _local_pak("missionpack", 0)
    _local_pak("missionpack", 1)
    _local_pak("missionpack", 3)

    # HQQ (HD 2D Elements) repacked for Q3Quest
    # Sourced from https://www.moddb.com/games/quake-iii-arena/addons/pak9hqq36-q3q
    _local_assets("pak9hqq36", "baseq3/pak9hqq36.pk3")

    # License: id Software and Pi Studios for Quake Arena Arcade on Xbox 360.
    # Luigi Auriemma for QuickBMS and the Quake Arena Arcade script.
    # Sourced from https://www.moddb.com/mods/quake-arena-arcade-assets/downloads/quake-arena-arcade-assets
    _local_assets("a_QuakeArenaArcade_baseq3", "baseq3/a_QuakeArenaArcade.pk3")
    _local_assets("QuakeArenaArcade_baseq3", "baseq3/QuakeArenaArcade.pk3")
    _local_assets("QuakeArenaArcade_teamarena", "missionpack/QuakeArenaArcade.pk3")
