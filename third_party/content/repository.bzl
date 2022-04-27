"""Bazel repository rules for loading content from original games."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

_BASE_URL = "file:///Users/peter/Steam/quake3teamarena"
_LOCAL_ASSETS_BASE_URL = "file:///Users/peter/Code/GameDev/Assets"

def _local_pak(game, index, sha256 = None):
    name = "q3a_%s_pak%d" % (game, index)
    if native.existing_rule(name):
        return

    _http_archive(
        name = name,
        urls = ["%s/%s/pak%d.pk3" % (_BASE_URL, game, index)],
        type = "zip",
        sha256 = sha256,
        build_file = "//third_party/content:%s.BUILD.bazel" % (name),
    )

def _local_assets(name, path, sha256 = None):
    if native.existing_rule(name):
        return

    _http_archive(
        name = name,
        urls = ["%s/%s" % (_LOCAL_ASSETS_BASE_URL, path)],
        type = "zip",
        sha256 = sha256,
        build_file = "//third_party/content:%s.BUILD.bazel" % (name),
    )

def load_pak_repositories():
    # Quake 3 Arena
    _local_pak("baseq3", 0, "7ce8b3910620cd50a09e4f1100f426e8c6180f68895d589f80e6bd95af54bcae")
    _local_pak("baseq3", 2, "ccae938a2f13a03b24902d675181d516a431699701ed88023a307f34b5bcd58c")
    _local_pak("baseq3", 4, "af5f6d5c82fe4440ae0bb660f0648d1fa1731a9e8305a9eb652aa243428697f1")
    _local_pak("baseq3", 5, "69f87070ca7719e252a3ba97e6483f6663939c987ede550d1268d4d9a07b45bc")
    _local_pak("baseq3", 6, "bb4f0ae2bf603b050fb665436d3178ce7c1c20360e67bacf7c14d93daff38daf")
    _local_pak("baseq3", 8, "812c9e97f231e89cefede3848c6110b7bd34245093af6f22c2cacde3e6b15663")

    # Quake 3 Team Arena
    _local_pak("missionpack", 0, "fdb5fe4f15f22bd270628d9b3153b733ca4548207722e768051c08c9dbff9135")
    _local_pak("missionpack", 1, "9818e99ba58d91f231a650a3c42559d1c5661cb3c0dfd033ef4225ba8ecdfd60")

    # HQQ (HD 2D Elements) repacked for Q3Quest
    # Sourced from https://www.moddb.com/games/quake-iii-arena/addons/pak9hqq36-q3q
    _local_assets("pak9hqq36", "baseq3/pak9hqq36.pk3", "05ebdf270a7baf1b68dc5c4bb17557b1d8b0a6825b8d9570b341500e0324843e")

    # License: id Software and Pi Studios for Quake Arena Arcade on Xbox 360.
    # Luigi Auriemma for QuickBMS and the Quake Arena Arcade script.
    # Sourced from https://www.moddb.com/mods/quake-arena-arcade-assets/downloads/quake-arena-arcade-assets
    _local_assets("QuakeArenaArcade_baseq3", "baseq3/QuakeArenaArcade.pk3", "0b34447617641c915dcc28ae2fab30d86df41f297e6b30f7ce678f942cf76a45")
    _local_assets("QuakeArenaArcade_teamarena", "missionpack/QuakeArenaArcade.pk3", "4ac1e97e9e989709a101dfe19035ed3af535feedb3acd7477f2b078a9af5fe9a")
