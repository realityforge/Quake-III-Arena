load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("libpng"):
        return

    # libpng is no longer used in the main application but continues to be used in pngcrush
    _http_archive(
        name = "libpng",
        build_file = "//third_party/libpng:libpng.BUILD.bazel",
        sha256 = "3d22d46c566b1761a0e15ea397589b3a5f36ac09b7c785382e6470156c04247f",
        strip_prefix = "libpng-1.6.35",
        urls = ["https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35.zip"],
    )
