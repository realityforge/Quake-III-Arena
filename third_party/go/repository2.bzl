load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# Separate repository extension as loads must be at top level but will not resolve until io_bazel_rules_go is defined
def configure_repository():
    go_rules_dependencies()

    go_register_toolchains(version = "1.18")

    gazelle_dependencies()
