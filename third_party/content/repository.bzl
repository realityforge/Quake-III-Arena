"""Bazel repository rules for loading content from original games."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@org_realityforge_ioq3//third_party/content:metadata.bzl", _PAK_DATA = "PAK_DATA")

_BASE_URL = "file:///Users/peter/Steam/quake3teamarena"
_LOCAL_ASSETS_BASE_URL = "file:///Users/peter/Code/GameDev/Assets"

def _pak(name, url):
    if native.existing_rule(name):
        return

    build_content = """
load("@org_realityforge_ioq3//third_party/content:metadata.bzl", _PAK_DATA = "PAK_DATA")
"""

    if None != _PAK_DATA[name].get("other_files"):
        build_content += """

filegroup(
    name = "files",
    srcs = _PAK_DATA["%s"]["other_files"],
    visibility = ["//visibility:public"],
)
""" % (name)

    if None != _PAK_DATA[name].get("tga_files"):
        build_content += """

exports_files(_PAK_DATA["%s"]["tga_files"])
""" % (name, name)

    if None != _PAK_DATA[name].get("shader_files"):
        build_content += """

filegroup(
    name = "shader_files",
    srcs = _PAK_DATA["%s"]["shader_files"],
    visibility = ["//visibility:public"],
)

exports_files(_PAK_DATA["%s"]["shader_files"])
""" % (name, name)

    _sha256 = None
    if None != _PAK_DATA[name].get("info") and None != _PAK_DATA[name]["info"].get("sha256"):
        _sha256 = _PAK_DATA[name]["info"]["sha256"]

    _http_archive(name = name, urls = [url], type = "zip", sha256 = _sha256, build_file_content = build_content)

def _local_pak(game, index):
    _pak("q3a_%s_pak%d" % (game, index), "%s/%s/pak%d.pk3" % (_BASE_URL, game, index))

def _local_assets(name, path):
    _pak(name, "%s/%s" % (_LOCAL_ASSETS_BASE_URL, path))

def load_pak_repositories():
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
