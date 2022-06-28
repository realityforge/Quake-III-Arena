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

load("//build_defs:transitions.bzl", _platform_transition_filegroup = "platform_transition_filegroup")

def asset_filegroup(name, srcs, **kwargs):
    """Define a filegroup in the "none" platform.
    The "none" platform intended to be used to build assets as it declares no operating system or cpu and thus
    compilation can not be done for that platform.

    Usage:
    ```starlark
    load("@aspect_bazel_lib//lib:write_source_files.bzl", "write_source_files")
    write_source_files(
        name = "write_foobar",
        files = {
            "foobar.json": "//some/generated:file",
        },
    )
    ```
    To update the source file, run:
    ```bash
    bazel run //:write_foobar
    ```
    A test will fail if the source file doesn't exist or if it's out of date with instructions on how to create/update it.
    You can declare a tree of generated source file targets:
    ```starlark
    load("@aspect_bazel_lib//lib:write_source_files.bzl", "write_source_files")
    write_source_files(
        name = "write_all",
        additional_update_targets = [
            # Other write_source_files targets to run when this target is run
            "//a/b/c:write_foo",
            "//a/b:write_bar",
        ]
    )
    ```
    And update them with a single run:
    ```bash
    bazel run //:write_all
    ```
    When a file is out of date, you can leave a suggestion to run a target further up in the tree by specifying `suggested_update_target`. E.g.,
    ```starlark
    write_source_files(
        name = "write_foo",
        files = {
            "foo.json": ":generated-foo",
        },
        suggested_update_target = "//:write_all"
    )
    ```
    A test failure from foo.json being out of date will yield the following message:
    ```
    //a/b:c:foo.json is out of date. To update this and other generated files, run:
        bazel run //:write_all
    To update *only* this file, run:
        bazel run //a/b/c:write_foo
    ```
    If you have many sources that you want to update as a group, we recommend wrapping write_source_files in a macro that defaults `suggested_update_target` to the umbrella update target.
    Args:
        name: Name of the executable target that creates or updates the source file
        files: A dict where the keys are source files or folders to write to and the values are labels pointing to the desired content.
            Sources must be within the same bazel package as the target.
        additional_update_targets: (Optional) List of other write_source_file or other executable updater targets to call in the same run
        suggested_update_target: (Optional) Label of the write_source_file target to suggest running when files are out of date
        diff_test: (Optional) Generate a test target to check that the source file(s) exist and are up to date with the generated files(s).
        **kwargs: Other common named parameters such as `tags` or `visibility`
    """

    native.filegroup(name = "%s_raw" % name, srcs = srcs)

    _platform_transition_filegroup(
        name = name,
        srcs = ["%s_raw" % name],
        target_platform = "//build_defs:platform_none",
        **kwargs
    )
