load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("opusfile"):
        return

    _http_archive(
        name = "opusfile",
        build_file = "//third_party/opusfile:opusfile.BUILD.bazel",
        sha256 = "7f44575596b78d7787c1865b9653e2a71546ff1ae77d87c53ab16dcc7af295ba",
        strip_prefix = "opusfile-0.12",
        urls = ["https://downloads.xiph.org/releases/opus/opusfile-0.12.zip"],
    )
