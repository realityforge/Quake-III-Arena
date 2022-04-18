load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("ogg"):
        return

    _http_archive(
        name = "ogg",
        build_file = "//third_party/ogg:ogg.BUILD.bazel",
        sha256 = "0eb4b4b9420a0f51db142ba3f9c64b333f826532dc0f48c6410ae51f4799b664",
        strip_prefix = "libogg-1.3.5",
        urls = ["https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz"],
    )
