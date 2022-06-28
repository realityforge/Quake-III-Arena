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
    load("//build_defs:assets_filegroup.bzl", "asset_filegroup")

    asset_filegroup(
        name = "some_assets",
        srcs = [
            "data/of/one/sort/blah.data",
        ]
    )
    ```

    Args:
        name: Name of the fileset
        srcs: Dependencies to define fileset.
        **kwargs: Other common named parameters such as `tags` or `visibility`
    """

    native.filegroup(name = "%s_raw" % name, srcs = srcs)

    _platform_transition_filegroup(
        name = name,
        srcs = ["%s_raw" % name],
        target_platform = "@org_realityforge_q3a//build_defs:platform_none",
        **kwargs
    )
