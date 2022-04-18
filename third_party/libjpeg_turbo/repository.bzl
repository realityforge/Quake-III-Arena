load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("libjpeg_turbo"):
        return

    _http_archive(
        name = "libjpeg_turbo",
        build_file = "//third_party/libjpeg_turbo:libjpeg_turbo.BUILD.bazel",
        sha256 = "d6b7790927d658108dfd3bee2f0c66a2924c51ee7f9dc930f62c452f4a638c52",
        strip_prefix = "libjpeg-turbo-2.1.0",
        urls = ["https://github.com/libjpeg-turbo/libjpeg-turbo/archive/2.1.0.tar.gz"],
    )
