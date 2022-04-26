load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("pngcrush"):
        return

    _http_archive(
        name = "pngcrush",
        build_file = "//third_party/pngcrush:pngcrush.BUILD.bazel",
        sha256 = "3d0fc5ccd1d0ff39e2a6544b36dc5832ac03ab61cfd266e2663988116ab65237",
        strip_prefix = "pcr010813",
        urls = ["https://ixpeering.dl.sourceforge.net/project/pmt/pngcrush/1.8.13/pngcrush-1.8.13.zip"],
    )
