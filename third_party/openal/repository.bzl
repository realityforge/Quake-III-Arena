load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("openal"):
        return

    _http_archive(
        name = "openal",
        build_file = "//third_party/openal:openal.BUILD.bazel",
        sha256 = "c8ad767e9a3230df66756a21cc8ebf218a9d47288f2514014832204e666af5d8",
        strip_prefix = "openal-soft-1.21.1",
        urls = ["https://openal-soft.org/openal-releases/openal-soft-1.21.1.tar.bz2"],
    )
