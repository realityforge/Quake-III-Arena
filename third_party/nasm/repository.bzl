load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("nasm"):
        return

    _http_archive(
        name = "nasm",
        build_file = "//third_party/nasm:nasm.BUILD.bazel",
        sha256 = "34fd26c70a277a9fdd54cb5ecf389badedaf48047b269d1008fbc819b24e80bc",
        strip_prefix = "nasm-2.14.02",
        urls = ["http://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2"],
    )
