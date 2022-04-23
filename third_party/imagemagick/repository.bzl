load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")

def load_repository():
    if native.existing_rule("rules_imagemagick"):
        return

    _http_archive(
        name = "rules_imagemagick",
        strip_prefix = "rules_imagemagick-35903509e561bde7b9081e5682a732d2f4d91f85",
        urls = ["https://github.com/zaucy/rules_imagemagick/archive/35903509e561bde7b9081e5682a732d2f4d91f85.zip"],
        sha256 = "20ce414b1243c28e388d7f56aaedebb2a0d5cf510fcd91bb5ceae77005b478fa",
    )
