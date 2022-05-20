# DO NOT EDIT: File is auto-generated from dependencies.yml by https://github.com/realityforge/bazel-depgen version 0.14

"""
    Macro rules to load dependencies.

    Invoke 'generate_workspace_rules' from a WORKSPACE file.
    Invoke 'generate_targets' from a BUILD.bazel file.
"""
# Dependency Graph Generated from the input data
# \- org.realityforge.javax.annotation:javax.annotation:jar:1.0.1 [compile]

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_file = "http_file")
load("@rules_java//java:defs.bzl", _java_import = "java_import")

# SHA256 of the configuration content that generated this file
_CONFIG_SHA256 = "1EDEC884951EBCF3A4229A589A00DE3FC4B62A8BB2B9CE96894FEAE7C91E8915"

def generate_workspace_rules():
    """
        Repository rules macro to load dependencies.

        Must be run from a WORKSPACE file.
    """

    _http_file(
        name = "org_realityforge_bazel_depgen__bazel_depgen__0_14",
        downloaded_file_path = "org/realityforge/bazel/depgen/bazel-depgen/0.14/bazel-depgen-0.14-all.jar",
        sha256 = "8ec3ee929af3bc2a95bec3cde8c10bcdb5bb7eaee07b404727024a78f0dada9b",
        urls = ["https://repo.maven.apache.org/maven2/org/realityforge/bazel/depgen/bazel-depgen/0.14/bazel-depgen-0.14-all.jar"],
    )

    _http_file(
        name = "org_realityforge_javax_annotation__javax_annotation__1_0_1",
        downloaded_file_path = "org/realityforge/javax/annotation/javax.annotation/1.0.1/javax.annotation-1.0.1.jar",
        sha256 = "6adb7bcd07bdfc2e28d815dc7e0ce594181fe8a5a74d336cbf7cd7cfb283bb8d",
        urls = ["https://repo.maven.apache.org/maven2/org/realityforge/javax/annotation/javax.annotation/1.0.1/javax.annotation-1.0.1.jar"],
    )

    _http_file(
        name = "org_realityforge_javax_annotation__javax_annotation__1_0_1__sources",
        downloaded_file_path = "org/realityforge/javax/annotation/javax.annotation/1.0.1/javax.annotation-1.0.1-sources.jar",
        sha256 = "049e2910100b7d27af24a821883f5ce94006955c7b08b9fb60cf57b67cd06061",
        urls = ["https://repo.maven.apache.org/maven2/org/realityforge/javax/annotation/javax.annotation/1.0.1/javax.annotation-1.0.1-sources.jar"],
    )

def generate_targets():
    """
        Macro to define targets for dependencies.
    """

    native.sh_test(
        name = "verify_config_sha256",
        size = "small",
        args = [
            "$(JAVA)",
            "-jar",
            "$(location :bazel_depgen)",
            "--config-file",
            "$(location //third_party/java:dependencies.yml)",
            "--verbose",
            "hash",
            "--verify-sha256",
            _CONFIG_SHA256,
        ],
        srcs = [":verify_config_sha256.sh"],
        data = [
            ":bazel_depgen",
            "//third_party/java:dependencies.yml",
            "@bazel_tools//tools/jdk:current_java_runtime",
        ],
        toolchains = ["@bazel_tools//tools/jdk:current_java_runtime"],
        visibility = ["//visibility:private"],
    )

    native.genrule(
        name = "verify_config_sha256_script",
        toolchains = ["@bazel_tools//tools/jdk:current_java_runtime"],
        outs = ["verify_config_sha256.sh"],
        cmd = "echo 'java_exe=\"$$1\" && shift && \"$$(rlocation \"$${java_exe#external/}\")\" \"$$@\"' > \"$@\"",
        visibility = ["//visibility:private"],
        testonly = True,
    )

    native.genrule(
        name = "regenerate_depgen_extension_script",
        srcs = [
            ":bazel_depgen",
            "//third_party/java:dependencies.yml",
            "@bazel_tools//tools/jdk:current_java_runtime",
        ],
        toolchains = ["@bazel_tools//tools/jdk:current_java_runtime"],
        outs = ["regenerate_depgen_extension_script.sh"],
        cmd = "echo \"$(JAVA) -jar $(location :bazel_depgen) --directory \\$$BUILD_WORKSPACE_DIRECTORY --config-file $(location //third_party/java:dependencies.yml) \\$$@ generate \" > \"$@\"",
        visibility = ["//visibility:private"],
    )

    native.sh_binary(
        name = "regenerate_depgen_extension",
        srcs = ["regenerate_depgen_extension_script"],
        tags = [
            "local",
            "manual",
            "no-cache",
            "no-remote",
            "no-sandbox",
        ],
        data = [
            ":bazel_depgen",
            "//third_party/java:dependencies.yml",
            "@bazel_tools//tools/jdk:current_java_runtime",
        ],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "bazel_depgen",
        actual = ":org_realityforge_bazel_depgen__bazel_depgen__0_14",
    )
    _java_import(
        name = "org_realityforge_bazel_depgen__bazel_depgen__0_14",
        jars = ["@org_realityforge_bazel_depgen__bazel_depgen__0_14//file"],
        tags = ["maven_coordinates=org.realityforge.bazel.depgen:bazel-depgen:0.14"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "javax_annotation",
        actual = ":org_realityforge_javax_annotation__javax_annotation__1_0_1",
    )
    _java_import(
        name = "org_realityforge_javax_annotation__javax_annotation__1_0_1",
        jars = ["@org_realityforge_javax_annotation__javax_annotation__1_0_1//file"],
        srcjar = "@org_realityforge_javax_annotation__javax_annotation__1_0_1__sources//file",
        tags = ["maven_coordinates=org.realityforge.javax.annotation:javax.annotation:1.0.1"],
        visibility = ["//visibility:private"],
    )
