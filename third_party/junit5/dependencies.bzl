# DO NOT EDIT: File is auto-generated from dependencies.yml by https://github.com/realityforge/bazel-depgen version 0.17

"""
    Macro rules to load dependencies.

    Invoke 'generate_workspace_rules' from a WORKSPACE file.
    Invoke 'generate_targets' from a BUILD.bazel file.
"""
# Dependency Graph Generated from the input data
# +- org.junit.jupiter:junit-jupiter-engine:jar:5.8.2 [compile]
# |  +- org.junit.platform:junit-platform-engine:jar:1.8.2 [compile]
# |  |  +- org.opentest4j:opentest4j:jar:1.2.0 [compile]
# |  |  +- org.junit.platform:junit-platform-commons:jar:1.8.2 [compile]
# |  |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
# |  +- org.junit.jupiter:junit-jupiter-api:jar:5.8.2 [compile]
# |  |  +- org.opentest4j:opentest4j:jar:1.2.0 [compile]
# |  |  +- org.junit.platform:junit-platform-commons:jar:1.8.2 [compile]
# |  |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
# |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
# +- org.junit.platform:junit-platform-console:jar:1.8.2 [compile]
# |  +- org.junit.platform:junit-platform-reporting:jar:1.8.2 [compile]
# |  |  +- org.junit.platform:junit-platform-launcher:jar:1.8.2 [compile]
# |  |  |  +- org.junit.platform:junit-platform-engine:jar:1.8.2 [compile]
# |  |  |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
# |  |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
# |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
# \- org.junit.platform:junit-platform-suite-api:jar:1.8.2 [compile]
#    +- org.junit.platform:junit-platform-commons:jar:1.8.2 [compile]
#    |  \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]
#    \- org.apiguardian:apiguardian-api:jar:1.1.2 [compile]

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_file = "http_file")
load("@rules_java//java:defs.bzl", _java_binary = "java_binary", _java_import = "java_import", _java_test = "java_test")

# SHA256 of the configuration content that generated this file
_CONFIG_SHA256 = "5348511F7AABA10DCAB038277DF140765800B226EC864CFBC4B13E2E7B1515B8"

def generate_workspace_rules():
    """
        Repository rules macro to load dependencies.

        Must be run from a WORKSPACE file.
    """

    _http_file(
        name = "org_apiguardian__apiguardian_api__1_1_2",
        downloaded_file_path = "org/apiguardian/apiguardian-api/1.1.2/apiguardian-api-1.1.2.jar",
        sha256 = "b509448ac506d607319f182537f0b35d71007582ec741832a1f111e5b5b70b38",
        urls = ["https://repo.maven.apache.org/maven2/org/apiguardian/apiguardian-api/1.1.2/apiguardian-api-1.1.2.jar"],
    )

    _http_file(
        name = "org_apiguardian__apiguardian_api__1_1_2__sources",
        downloaded_file_path = "org/apiguardian/apiguardian-api/1.1.2/apiguardian-api-1.1.2-sources.jar",
        sha256 = "277a7a4315412817beb6655b324dc7276621e95ebff00b8bf65e17a27b685e2d",
        urls = ["https://repo.maven.apache.org/maven2/org/apiguardian/apiguardian-api/1.1.2/apiguardian-api-1.1.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_jupiter__junit_jupiter_api__5_8_2",
        downloaded_file_path = "org/junit/jupiter/junit-jupiter-api/5.8.2/junit-jupiter-api-5.8.2.jar",
        sha256 = "1808ee87e0f718cd6e25f3b75afc17956ac8a3edc48c7e9bab9f19f9a79e3801",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-api/5.8.2/junit-jupiter-api-5.8.2.jar"],
    )

    _http_file(
        name = "org_junit_jupiter__junit_jupiter_api__5_8_2__sources",
        downloaded_file_path = "org/junit/jupiter/junit-jupiter-api/5.8.2/junit-jupiter-api-5.8.2-sources.jar",
        sha256 = "cb38569ae9005eb54c7cbc181b842e6eb01be57ae0d785f9167d9e019b44a670",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-api/5.8.2/junit-jupiter-api-5.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_jupiter__junit_jupiter_engine__5_8_2",
        downloaded_file_path = "org/junit/jupiter/junit-jupiter-engine/5.8.2/junit-jupiter-engine-5.8.2.jar",
        sha256 = "753b7726cdd158bb34cedb94c161e2291896f47832a1e9eda53d970020a8184e",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.8.2/junit-jupiter-engine-5.8.2.jar"],
    )

    _http_file(
        name = "org_junit_jupiter__junit_jupiter_engine__5_8_2__sources",
        downloaded_file_path = "org/junit/jupiter/junit-jupiter-engine/5.8.2/junit-jupiter-engine-5.8.2-sources.jar",
        sha256 = "9ed4edf417cbc6028c634a0b407061433327c9ef4235fca35b9183da855e2e8f",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.8.2/junit-jupiter-engine-5.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_commons__1_8_2",
        downloaded_file_path = "org/junit/platform/junit-platform-commons/1.8.2/junit-platform-commons-1.8.2.jar",
        sha256 = "d2e015fca7130e79af2f4608dc54415e4b10b592d77333decb4b1a274c185050",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.8.2/junit-platform-commons-1.8.2.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_commons__1_8_2__sources",
        downloaded_file_path = "org/junit/platform/junit-platform-commons/1.8.2/junit-platform-commons-1.8.2-sources.jar",
        sha256 = "7ae3683c452ee4259b2d205d56c7172fd178180b02d20b4430368ef6ee501c3b",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-commons/1.8.2/junit-platform-commons-1.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_console__1_8_2",
        downloaded_file_path = "org/junit/platform/junit-platform-console/1.8.2/junit-platform-console-1.8.2.jar",
        sha256 = "b4bc403e281f911620ef9f2b81ad029d51353bc0d77576281a38d3f5a62aff82",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-console/1.8.2/junit-platform-console-1.8.2.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_console__1_8_2__sources",
        downloaded_file_path = "org/junit/platform/junit-platform-console/1.8.2/junit-platform-console-1.8.2-sources.jar",
        sha256 = "ae8624ed454b1fb26a75a69c72c26a0e8ae4f2a86b39bc6a38fde00ecb256d44",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-console/1.8.2/junit-platform-console-1.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_engine__1_8_2",
        downloaded_file_path = "org/junit/platform/junit-platform-engine/1.8.2/junit-platform-engine-1.8.2.jar",
        sha256 = "0b7d000f8c3e8e5f7d6b819649936e7b9938314e87c8f983805218ea57567e59",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.8.2/junit-platform-engine-1.8.2.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_engine__1_8_2__sources",
        downloaded_file_path = "org/junit/platform/junit-platform-engine/1.8.2/junit-platform-engine-1.8.2-sources.jar",
        sha256 = "4cfda26b1dc0812fcf0a14b0bb5612b7c697e50afd79819d2e07b1faef9c239b",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.8.2/junit-platform-engine-1.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_launcher__1_8_2",
        downloaded_file_path = "org/junit/platform/junit-platform-launcher/1.8.2/junit-platform-launcher-1.8.2.jar",
        sha256 = "822156409fd83e682e4c5199b3460054299b538a058c2c6d0f5c9b6a5bdb7594",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.8.2/junit-platform-launcher-1.8.2.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_launcher__1_8_2__sources",
        downloaded_file_path = "org/junit/platform/junit-platform-launcher/1.8.2/junit-platform-launcher-1.8.2-sources.jar",
        sha256 = "ee8440e84c23e52519b57e77a30627f80d91ac148244162ee2eea1ba809c1bdc",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-launcher/1.8.2/junit-platform-launcher-1.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_reporting__1_8_2",
        downloaded_file_path = "org/junit/platform/junit-platform-reporting/1.8.2/junit-platform-reporting-1.8.2.jar",
        sha256 = "d28048333b378d166f9ad38c2a8e34ac0fa1a29cc016cb279df53c8b54628fc3",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-reporting/1.8.2/junit-platform-reporting-1.8.2.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_reporting__1_8_2__sources",
        downloaded_file_path = "org/junit/platform/junit-platform-reporting/1.8.2/junit-platform-reporting-1.8.2-sources.jar",
        sha256 = "489df906d84675ba6d078e076a5ffd8c8feec62e390539d6d61938de98b269f4",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-reporting/1.8.2/junit-platform-reporting-1.8.2-sources.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_suite_api__1_8_2",
        downloaded_file_path = "org/junit/platform/junit-platform-suite-api/1.8.2/junit-platform-suite-api-1.8.2.jar",
        sha256 = "94ef343b05b875bb2e4ef94a7cc62e610e1b9cd78247e2b2ec43ed618a1ed0a7",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-suite-api/1.8.2/junit-platform-suite-api-1.8.2.jar"],
    )

    _http_file(
        name = "org_junit_platform__junit_platform_suite_api__1_8_2__sources",
        downloaded_file_path = "org/junit/platform/junit-platform-suite-api/1.8.2/junit-platform-suite-api-1.8.2-sources.jar",
        sha256 = "53ce9bde5e3222355fa8deb17cb568629827ccedf57efce07ba1077e79feaaa0",
        urls = ["https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-suite-api/1.8.2/junit-platform-suite-api-1.8.2-sources.jar"],
    )

    _http_file(
        name = "org_opentest4j__opentest4j__1_2_0",
        downloaded_file_path = "org/opentest4j/opentest4j/1.2.0/opentest4j-1.2.0.jar",
        sha256 = "58812de60898d976fb81ef3b62da05c6604c18fd4a249f5044282479fc286af2",
        urls = ["https://repo.maven.apache.org/maven2/org/opentest4j/opentest4j/1.2.0/opentest4j-1.2.0.jar"],
    )

    _http_file(
        name = "org_opentest4j__opentest4j__1_2_0__sources",
        downloaded_file_path = "org/opentest4j/opentest4j/1.2.0/opentest4j-1.2.0-sources.jar",
        sha256 = "b63495ef700fb2af2cdee8dd68659b27822650058234a602f9ed1d14b909a1a8",
        urls = ["https://repo.maven.apache.org/maven2/org/opentest4j/opentest4j/1.2.0/opentest4j-1.2.0-sources.jar"],
    )

    _http_file(
        name = "org_realityforge_bazel_depgen__bazel_depgen__0_17",
        downloaded_file_path = "org/realityforge/bazel/depgen/bazel-depgen/0.17/bazel-depgen-0.17-all.jar",
        sha256 = "3a81f8e62b8a5ac83409608ff9cff4d3274912079d001405a07e50abd0b7881b",
        urls = ["https://repo.maven.apache.org/maven2/org/realityforge/bazel/depgen/bazel-depgen/0.17/bazel-depgen-0.17-all.jar"],
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
        use_testrunner = False,
        args = [
            "--config-file",
            "$(rootpath //third_party/junit5:dependencies.yml)",
            "--verbose",
            "hash",
            "--verify-sha256",
            _CONFIG_SHA256,
        ],
        data = ["//third_party/junit5:dependencies.yml"],
        visibility = ["//visibility:private"],
    )

    _java_binary(
        name = "regenerate_depgen_extension",
        runtime_deps = [":bazel_depgen"],
        main_class = "org.realityforge.bazel.depgen.Main",
        args = [
            "--config-file",
            "$(rootpath //third_party/junit5:dependencies.yml)",
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
        data = ["//third_party/junit5:dependencies.yml"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "apiguardian_api",
        actual = ":org_apiguardian__apiguardian_api__1_1_2",
        visibility = ["//visibility:private"],
    )
    _java_import(
        name = "org_apiguardian__apiguardian_api__1_1_2",
        jars = ["@org_apiguardian__apiguardian_api__1_1_2//file"],
        srcjar = "@org_apiguardian__apiguardian_api__1_1_2__sources//file",
        tags = ["maven_coordinates=org.apiguardian:apiguardian-api:1.1.2"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "junit_jupiter_api",
        actual = ":org_junit_jupiter__junit_jupiter_api__5_8_2",
    )
    _java_import(
        name = "org_junit_jupiter__junit_jupiter_api__5_8_2",
        jars = ["@org_junit_jupiter__junit_jupiter_api__5_8_2//file"],
        srcjar = "@org_junit_jupiter__junit_jupiter_api__5_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.jupiter:junit-jupiter-api:5.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_platform_commons",
            ":opentest4j",
        ],
    )

    native.alias(
        name = "junit_jupiter_engine",
        actual = ":org_junit_jupiter__junit_jupiter_engine__5_8_2",
    )
    _java_import(
        name = "org_junit_jupiter__junit_jupiter_engine__5_8_2",
        jars = ["@org_junit_jupiter__junit_jupiter_engine__5_8_2//file"],
        srcjar = "@org_junit_jupiter__junit_jupiter_engine__5_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.jupiter:junit-jupiter-engine:5.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_jupiter_api",
            ":junit_platform_engine",
        ],
    )

    native.alias(
        name = "junit_platform_commons",
        actual = ":org_junit_platform__junit_platform_commons__1_8_2",
        visibility = ["//visibility:private"],
    )
    _java_import(
        name = "org_junit_platform__junit_platform_commons__1_8_2",
        jars = ["@org_junit_platform__junit_platform_commons__1_8_2//file"],
        srcjar = "@org_junit_platform__junit_platform_commons__1_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.platform:junit-platform-commons:1.8.2"],
        visibility = ["//visibility:private"],
        deps = [":apiguardian_api"],
    )

    native.alias(
        name = "junit_platform_console",
        actual = ":org_junit_platform__junit_platform_console__1_8_2",
    )
    _java_import(
        name = "org_junit_platform__junit_platform_console__1_8_2",
        jars = ["@org_junit_platform__junit_platform_console__1_8_2//file"],
        srcjar = "@org_junit_platform__junit_platform_console__1_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.platform:junit-platform-console:1.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_platform_reporting",
        ],
    )

    native.alias(
        name = "junit_platform_engine",
        actual = ":org_junit_platform__junit_platform_engine__1_8_2",
        visibility = ["//visibility:private"],
    )
    _java_import(
        name = "org_junit_platform__junit_platform_engine__1_8_2",
        jars = ["@org_junit_platform__junit_platform_engine__1_8_2//file"],
        srcjar = "@org_junit_platform__junit_platform_engine__1_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.platform:junit-platform-engine:1.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_platform_commons",
            ":opentest4j",
        ],
    )

    native.alias(
        name = "junit_platform_launcher",
        actual = ":org_junit_platform__junit_platform_launcher__1_8_2",
        visibility = ["//visibility:private"],
    )
    _java_import(
        name = "org_junit_platform__junit_platform_launcher__1_8_2",
        jars = ["@org_junit_platform__junit_platform_launcher__1_8_2//file"],
        srcjar = "@org_junit_platform__junit_platform_launcher__1_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.platform:junit-platform-launcher:1.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_platform_engine",
        ],
    )

    native.alias(
        name = "junit_platform_reporting",
        actual = ":org_junit_platform__junit_platform_reporting__1_8_2",
        visibility = ["//visibility:private"],
    )
    _java_import(
        name = "org_junit_platform__junit_platform_reporting__1_8_2",
        jars = ["@org_junit_platform__junit_platform_reporting__1_8_2//file"],
        srcjar = "@org_junit_platform__junit_platform_reporting__1_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.platform:junit-platform-reporting:1.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_platform_launcher",
        ],
    )

    native.alias(
        name = "junit_platform_suite_api",
        actual = ":org_junit_platform__junit_platform_suite_api__1_8_2",
    )
    _java_import(
        name = "org_junit_platform__junit_platform_suite_api__1_8_2",
        jars = ["@org_junit_platform__junit_platform_suite_api__1_8_2//file"],
        srcjar = "@org_junit_platform__junit_platform_suite_api__1_8_2__sources//file",
        tags = ["maven_coordinates=org.junit.platform:junit-platform-suite-api:1.8.2"],
        visibility = ["//visibility:private"],
        deps = [
            ":apiguardian_api",
            ":junit_platform_commons",
        ],
    )

    native.alias(
        name = "opentest4j",
        actual = ":org_opentest4j__opentest4j__1_2_0",
    )
    _java_import(
        name = "org_opentest4j__opentest4j__1_2_0",
        jars = ["@org_opentest4j__opentest4j__1_2_0//file"],
        srcjar = "@org_opentest4j__opentest4j__1_2_0__sources//file",
        tags = ["maven_coordinates=org.opentest4j:opentest4j:1.2.0"],
        visibility = ["//visibility:private"],
    )

    native.alias(
        name = "bazel_depgen",
        actual = ":org_realityforge_bazel_depgen__bazel_depgen__0_17",
    )
    _java_import(
        name = "org_realityforge_bazel_depgen__bazel_depgen__0_17",
        jars = ["@org_realityforge_bazel_depgen__bazel_depgen__0_17//file"],
        tags = ["maven_coordinates=org.realityforge.bazel.depgen:bazel-depgen:0.17"],
        visibility = ["//visibility:private"],
    )
