# DO NOT EDIT: File is auto-generated from dependencies.yml by https://github.com/realityforge/bazel-depgen version 0.16

"""
    Macro rules to load dependencies.

    Invoke 'generate_workspace_rules' from a WORKSPACE file.
    Invoke 'generate_targets' from a BUILD.bazel file.
"""
# Dependency Graph Generated from the input data
# +- org.realityforge.javax.annotation:javax.annotation:jar:1.0.1 [compile]
# +- info.picocli:picocli:jar:4.6.3 [compile]
# \- info.picocli:picocli-codegen:jar:4.6.3 [compile]
#    \- info.picocli:picocli:jar:4.6.3 [compile]

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_file = "http_file")
load("@rules_java//java:defs.bzl", _java_binary = "java_binary", _java_import = "java_import", _java_library = "java_library", _java_plugin = "java_plugin", _java_test = "java_test")

# SHA256 of the configuration content that generated this file
_CONFIG_SHA256 = "07D62C14DB8458B82671EFDC382E45DC1BB64E5CBF146F4C23F1D1C57710664B"

def generate_workspace_rules():
    """
        Repository rules macro to load dependencies.

        Must be run from a WORKSPACE file.
    """

    _http_file(
        name = "info_picocli__picocli__4_6_3",
        downloaded_file_path = "info/picocli/picocli/4.6.3/picocli-4.6.3.jar",
        sha256 = "b0a5159e926de8084ff066025142270443533656bc599b8bb31d14d11fd138a4",
        urls = ["https://repo.maven.apache.org/maven2/info/picocli/picocli/4.6.3/picocli-4.6.3.jar"],
    )

    _http_file(
        name = "info_picocli__picocli__4_6_3__sources",
        downloaded_file_path = "info/picocli/picocli/4.6.3/picocli-4.6.3-sources.jar",
        sha256 = "c753c927a3070ee07f39da41165375d9fbc9033a7c072e82b8d74c66f1abe1bf",
        urls = ["https://repo.maven.apache.org/maven2/info/picocli/picocli/4.6.3/picocli-4.6.3-sources.jar"],
    )

    _http_file(
        name = "info_picocli__picocli_codegen__4_6_3",
        downloaded_file_path = "info/picocli/picocli-codegen/4.6.3/picocli-codegen-4.6.3.jar",
        sha256 = "1a73aa038222f13835788ee834547bf33f12a93e480961df2bac68ad48982e38",
        urls = ["https://repo.maven.apache.org/maven2/info/picocli/picocli-codegen/4.6.3/picocli-codegen-4.6.3.jar"],
    )

    _http_file(
        name = "info_picocli__picocli_codegen__4_6_3__sources",
        downloaded_file_path = "info/picocli/picocli-codegen/4.6.3/picocli-codegen-4.6.3-sources.jar",
        sha256 = "8dee0c64f3ebd2895922f300d623c9bf89027143940b3a7cd142379e731e8a49",
        urls = ["https://repo.maven.apache.org/maven2/info/picocli/picocli-codegen/4.6.3/picocli-codegen-4.6.3-sources.jar"],
    )

    _http_file(
        name = "org_realityforge_bazel_depgen__bazel_depgen__0_16",
        downloaded_file_path = "org/realityforge/bazel/depgen/bazel-depgen/0.16/bazel-depgen-0.16-all.jar",
        sha256 = "b844ea1fcd8d65ea308112ba212d6162ed99b1cc53970551c3b7a2a0f3397eac",
        urls = ["https://repo.maven.apache.org/maven2/org/realityforge/bazel/depgen/bazel-depgen/0.16/bazel-depgen-0.16-all.jar"],
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

    _java_test(
        name = "verify_config_sha256",
        size = "small",
        runtime_deps = [":bazel_depgen"],
        main_class = "org.realityforge.bazel.depgen.Main",
        test_class = "org.realityforge.bazel.depgen.Main",
        args = [
            "--config-file",
            "$(rootpath //third_party/java:dependencies.yml)",
            "--verbose",
            "hash",
            "--verify-sha256",
            _CONFIG_SHA256,
        ],
        data = ["//third_party/java:dependencies.yml"],
        visibility = ["//visibility:private"],
    )

    _java_binary(
        name = "regenerate_depgen_extension",
        runtime_deps = [":bazel_depgen"],
        main_class = "org.realityforge.bazel.depgen.Main",
        args = [
            "--config-file",
            "$(rootpath //third_party/java:dependencies.yml)",
            "--verbose",
            "generate",
        ],
        tags = [
            "local",
            "manual",
            "no-cache",
            "no-remote",
            "no-sandbox",
        ],
        data = ["//third_party/java:dependencies.yml"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "picocli",
        actual = ":info_picocli__picocli__4_6_3",
    )
    _java_import(
        name = "info_picocli__picocli__4_6_3",
        jars = ["@info_picocli__picocli__4_6_3//file"],
        srcjar = "@info_picocli__picocli__4_6_3__sources//file",
        tags = ["maven_coordinates=info.picocli:picocli:4.6.3"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "picocli_codegen",
        actual = ":info_picocli__picocli_codegen__4_6_3",
    )
    _java_import(
        name = "info_picocli__picocli_codegen__4_6_3__plugin_library",
        jars = ["@info_picocli__picocli_codegen__4_6_3//file"],
        srcjar = "@info_picocli__picocli_codegen__4_6_3__sources//file",
        tags = ["maven_coordinates=info.picocli:picocli-codegen:4.6.3"],
        visibility = ["//visibility:private"],
        deps = [":picocli"],
    )
    _java_plugin(
        name = "info_picocli__picocli_codegen__4_6_3__picocli_codegen_aot_graalvm_processor_nativeimageconfiggeneratorprocessor__plugin",
        processor_class = "picocli.codegen.aot.graalvm.processor.NativeImageConfigGeneratorProcessor",
        generates_api = True,
        visibility = ["//visibility:private"],
        deps = [":info_picocli__picocli_codegen__4_6_3__plugin_library"],
    )
    _java_library(
        name = "info_picocli__picocli_codegen__4_6_3",
        exported_plugins = ["info_picocli__picocli_codegen__4_6_3__picocli_codegen_aot_graalvm_processor_nativeimageconfiggeneratorprocessor__plugin"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "bazel_depgen",
        actual = ":org_realityforge_bazel_depgen__bazel_depgen__0_16",
    )
    _java_import(
        name = "org_realityforge_bazel_depgen__bazel_depgen__0_16",
        jars = ["@org_realityforge_bazel_depgen__bazel_depgen__0_16//file"],
        tags = ["maven_coordinates=org.realityforge.bazel.depgen:bazel-depgen:0.16"],
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
