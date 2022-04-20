load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("libpng"):
        return

    _http_archive(
        name = "libpng",
        build_file = "//third_party/libpng:libpng.BUILD.bazel",
        sha256 = "7f415186d38ca71c23058386d7cf5135c8beda821ee1beecdc2a7a26c0356615",
        strip_prefix = "libpng-1.2.57",
        urls = ["https://github.com/glennrp/libpng/archive/v1.2.57.tar.gz"],
    )
