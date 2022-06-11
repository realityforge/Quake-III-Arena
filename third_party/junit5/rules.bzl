# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
load("@rules_java//java:defs.bzl", _java_test = "java_test")

def junit5_test(name, srcs, test_class, deps = [], runtime_deps = [], **kwargs):
    FILTER_KWARGS = [
        "main_class",
        "use_testrunner",
        "args",
    ]

    for arg in FILTER_KWARGS:
        if arg in kwargs.keys():
            kwargs.pop(arg)

    junit_console_args = ["--disable-ansi-colors", "--disable-banner", "--fail-if-no-tests", "--details=none"]
    if test_class:
        junit_console_args += ["--select-class", test_class]
    else:
        fail("must specify 'test_class'")

    _java_test(
        name = name,
        srcs = srcs,
        use_testrunner = False,
        main_class = "org.junit.platform.console.ConsoleLauncher",
        args = junit_console_args,
        deps = deps + [
            "//third_party/junit5:junit_jupiter_engine",
            "//third_party/junit5:junit_jupiter_api",
            "//third_party/junit5:junit_platform_suite_api",
            "//third_party/junit5:opentest4j",
        ],
        runtime_deps = runtime_deps + ["//third_party/junit5:junit_platform_console"],
        **kwargs
    )
