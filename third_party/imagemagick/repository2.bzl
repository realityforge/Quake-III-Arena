load("@rules_imagemagick//:index.bzl", _imagemagick_repository = "imagemagick_repository")

def configure_repository():
    _imagemagick_repository()
