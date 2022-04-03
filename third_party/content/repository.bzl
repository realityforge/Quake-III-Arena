"""Bazel repository rules for loading content from original games."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

_BASE_URL = "file:///Users/peter/Steam/quake3teamarena"

def _local_pak(game, index, sha256 = None):
    name = "q3a_%s_pak%d" % (game, index)
    if native.existing_rule(name):
        return

    _http_archive(
        name = name,
        urls = ["%s/%s/pak%d.pk3" % (_BASE_URL, game, index)],
        type = "zip",
        sha256 = sha256,
        build_file_content = """
filegroup(
    name = "files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"]
)
        """,
    )

def load_pak_repos():
    # Quake 3 Arena
    _local_pak("baseq3", 0, "7ce8b3910620cd50a09e4f1100f426e8c6180f68895d589f80e6bd95af54bcae")
    _local_pak("baseq3", 1, "d4ffd60b4b414c3419499e321b6f5c2e933cf082df85823ad2d6ae2f803e1682")
    _local_pak("baseq3", 2, "ccae938a2f13a03b24902d675181d516a431699701ed88023a307f34b5bcd58c")
    _local_pak("baseq3", 3, "d03c0a0e06b99f9ecca2be7389f57faed406e85f7c09b9c56afdfa53ba25e312")
    _local_pak("baseq3", 4, "af5f6d5c82fe4440ae0bb660f0648d1fa1731a9e8305a9eb652aa243428697f1")
    _local_pak("baseq3", 5, "69f87070ca7719e252a3ba97e6483f6663939c987ede550d1268d4d9a07b45bc")
    _local_pak("baseq3", 6, "bb4f0ae2bf603b050fb665436d3178ce7c1c20360e67bacf7c14d93daff38daf")
    _local_pak("baseq3", 7, "de6283ce23e3486a2622c5dbf73d3721a59f24debd380e90f43a97d952fea283")
    _local_pak("baseq3", 8, "812c9e97f231e89cefede3848c6110b7bd34245093af6f22c2cacde3e6b15663")

    # Quake 3 Team Arena
    _local_pak("missionpack", 0, "fdb5fe4f15f22bd270628d9b3153b733ca4548207722e768051c08c9dbff9135")
    _local_pak("missionpack", 1, "9818e99ba58d91f231a650a3c42559d1c5661cb3c0dfd033ef4225ba8ecdfd60")
    _local_pak("missionpack", 2, "6cc56de0bf7b58e30164ab487c51deb0fa7c62dbd7d0a5421a5d5aa58f31a3f4")
    _local_pak("missionpack", 3, "77c0bcbb61be81a389d8959b76969a801a5e589d97ab8aeb2cb7ced54f187fc7")
