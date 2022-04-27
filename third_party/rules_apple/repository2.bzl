load("@build_bazel_rules_apple//apple:repositories.bzl", _apple_rules_dependencies = "apple_rules_dependencies")

def configure_repository():
    _apple_rules_dependencies()
