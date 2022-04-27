load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("libspng"):
        return

    _http_archive(
        name = "libspng",
        build_file = "//third_party/libspng:libspng.BUILD.bazel",
        sha256 = "2caa3a0cacabb3d56e0c6552cec60ff13cea1110cd5467d4053957b5b8e14fb1",
        strip_prefix = "libspng-0.7.2",
        urls = ["https://github.com/randy408/libspng/archive/refs/tags/v0.7.2.zip"],
    )
