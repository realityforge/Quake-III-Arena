load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("vorbis"):
        return

    _http_archive(
        name = "vorbis",
        build_file = "//third_party/vorbis:vorbis.BUILD.bazel",
        sha256 = "57c8bc92d2741934b8dc939af49c2639edc44b8879cba2ec14ad3189e2814582",
        strip_prefix = "libvorbis-1.3.7",
        urls = ["https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.zip"],
    )
