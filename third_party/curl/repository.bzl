load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("curl"):
        return

    _http_archive(
        name = "curl",
        build_file = "//third_party/curl:curl.BUILD.bazel",
        sha256 = "ac8e1087711084548d788ef18b9b732c8de887457b81f616fc681d1044b32f98",
        strip_prefix = "curl-7.81.0",
        urls = ["https://curl.haxx.se/download/curl-7.81.0.tar.gz"],
    )
