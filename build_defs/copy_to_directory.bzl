# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@bazel_skylib//lib:paths.bzl", _paths = "paths")

# This file was derived from https://github.com/aspect-build/bazel-lib/blob/c2d4481570f65551532b91e73b780b78ce0c8d4c/lib/copy_to_directory.bzl
# which is under the Apache 2.0 license https://github.com/aspect-build/bazel-lib/blob/c2d4481570f65551532b91e73b780b78ce0c8d4c/LICENSE

# Hints for Bazel spawn strategy
_COPY_EXECUTION_REQUIREMENTS = {
    "local": "1",
    "no-cache": "1",
    # ----------------+-----------------------------------------------------------------------------
    # no-remote       | Prevents the action or test from being executed remotely or cached remotely.
    #                 | This is equivalent to using both `no-remote-cache` and `no-remote-exec`.
    # ----------------+-----------------------------------------------------------------------------
    # no-remote-cache | Results in the action or test never being cached remotely (but it may
    #                 | be cached locally; it may also be executed remotely). Note: for the purposes
    #                 | of this tag, the disk-cache is considered a local cache, whereas the http
    #                 | and gRPC caches are considered remote. If a combined cache is specified
    #                 | (i.e. a cache with local and remote components), it's treated as a remote
    #                 | cache and disabled entirely unless --incompatible_remote_results_ignore_disk
    #                 | is set in which case the local components will be used.
    # ----------------+-----------------------------------------------------------------------------
    # no-remote-exec  | Results in the action or test never being executed remotely (but it may be
    #                 | cached remotely).
    # ----------------+-----------------------------------------------------------------------------
    # no-cache        | Results in the action or test never being cached (remotely or locally)
    # ----------------+-----------------------------------------------------------------------------
    # no-sandbox      | Results in the action or test never being sandboxed; it can still be cached
    #                 | or run remotely - use no-cache or no-remote to prevent either or both of
    #                 | those.
    # ----------------+-----------------------------------------------------------------------------
    # local           | Precludes the action or test from being remotely cached, remotely executed,
    #                 | or run inside the sandbox. For genrules and tests, marking the rule with the
    #                 | local = True attribute has the same effect.
    # ----------------+-----------------------------------------------------------------------------
    # See https://bazel.google.cn/reference/be/common-definitions?hl=en&authuser=0#common-attributes
    #
    # Copying file & directories is entirely IO-bound and there is no point doing this work
    # remotely.
    #
    # Also, remote-execution does not allow source directory inputs, see
    # https://github.com/bazelbuild/bazel/commit/c64421bc35214f0414e4f4226cc953e8c55fa0d2 So we must
    # not attempt to execute remotely in that case.
    #
    # There is also no point pulling the output file or directory from the remote cache since the
    # bytes to copy are already available locally. Conversely, no point in writing to the cache if
    # no one has any reason to check it for this action.
    #
    # Read and writing to disk cache is disabled as well primarily to reduce disk usage on the local
    # machine. A disk cache hit of a directory copy could be slghtly faster than a copy since the
    # disk cache stores the directory artifact as a single entry, but the slight performance bump
    # comes at the cost of heavy disk cache usage, which is an unmanaged directory that grow beyond
    # the bounds of the physical disk.
    # TODO: run benchmarks to measure the impact on copy_directory
    #
    # Sandboxing for this action is wasteful as well since there is a 1:1 mapping of input
    # file/directory to output file/directory and no room for non-hermetic inputs to sneak in to the
    # input.
    "no-remote": "1",
    "no-remote-cache": "1",
    "no-remote-exec": "1",
    "no-sandbox": "1",
}

def _longest_match(subject, tests):
    match = None
    high_score = 0
    for test in tests:
        if subject == test or subject.startswith(test):
            score = len(test)
            if score > high_score:
                match = test
                high_score = score
    return match

# src can be a File
def _copy_paths(ctx, src, input_prefix = None, output_prefix = None):
    if type(src) == "File":
        src_file = src

        src_path = src.path

        output_path = src.short_path

        # Convert output_path to be relative to the containing repository
        if output_path.startswith("../"):
            output_path = "/".join(output_path.split("/")[2:])

        # Remove the package prefix.
        output_path = output_path.removeprefix(src.owner.package + "/")

        # Possible scenarios mapping source file label to target
        #  - Single file label "@q3a_baseq3_pak6//:demos/four.dm_66" => output_path = "demos/four.dm_66"
        #  - Single file label "//content/baseq3:models/weapons2/shotgun/shotgun.png" => output_path = "models/weapons2/shotgun/shotgun.png"

    else:
        fail("Unsupported type passed as src: %s" % type(src))

    if output_prefix != None and input_prefix != None and (input_prefix == output_path or output_path.startswith(input_prefix)):
        output_path = output_prefix + output_path[len(input_prefix):]

    # apply a replacement if one is found
    match = _longest_match(output_path, ctx.attr.replace_prefixes.keys())
    if match:
        output_path = ctx.attr.replace_prefixes[match] + output_path[len(match):]

    if ctx.attr.downcase:
        output_path = output_path.lower()

    return src_path, output_path, src_file

def _copy_to_dir_bash(ctx, copy_paths, dst_dir, allow_symlink):
    cmds = [
        "set -o errexit -o nounset -o pipefail",
        "rm -rf \"%s\"" % dst_dir.path,
        "mkdir -p \"%s\"" % dst_dir.path,
    ]

    inputs = []

    for src_path, dst_path, src_file in copy_paths:
        inputs.append(src_file)

        dst_path_dir = _paths.dirname(dst_path)
        cmds.append("""
if [[ ! -e "{src}" ]]; then echo "file '{src}' does not exist"; exit 1; fi
if [[ -e "{dst}" ]]; then echo "file '{dst}' already exists. Duplicate files present in srcs"; exit 1; fi
""".format(src = src_path, dst = dst_path))
        if allow_symlink == False:
            cmds.append("""
if [[ -f "{src}" ]]; then
    mkdir -p "{dst_dir}"
    cp -f "{src}" "{dst}"
else
    mkdir -p "{dst}"
    cp -fR "{src}"/* "{dst}"
fi
""".format(src = src_path, dst_dir = dst_path_dir, dst = dst_path))
        else:
            cmds.append("""
if [[ -f "{src}" ]]; then
    mkdir -p "{dst_dir}"
    ln -w -s `pwd`/"{src}" `pwd`/"{dst}"
else
    ln -w -s `pwd`/"{src}" `pwd`/"{dst}"
fi
""".format(src = src_path, dst_dir = dst_path_dir, dst = dst_path))

    ctx.actions.run_shell(
        inputs = inputs,
        outputs = [dst_dir],
        command = "\n".join(cmds),
        mnemonic = "CopyToDirectory",
        progress_message = "Copying files to directory",
        use_default_shell_env = True,
        execution_requirements = _COPY_EXECUTION_REQUIREMENTS,
    )

def _copy_to_dir_cmd(ctx, copy_paths, dst_dir):
    # Most Windows binaries built with MSVC use a certain argument quoting
    # scheme. Bazel uses that scheme too to quote arguments. However,
    # cmd.exe uses different semantics, so Bazel's quoting is wrong here.
    # To fix that we write the command to a .bat file so no command line
    # quoting or escaping is required.
    # Based on skylib copy_file:
    # https://github.com/bazelbuild/bazel-skylib/blob/main/rules/private/copy_file_private.bzl#L28.
    bat = ctx.actions.declare_file(ctx.label.name + "-cmd.bat")

    # NB: mkdir will create all subdirectories; it will exit 1
    # print an error to stderr if the directory already exists so
    # we suppress both its stdout & stderr output
    cmds = ["""
@rem Generated by copy_to_directory.bzl, do not edit.
@echo off
mkdir "%s" >NUL 2>NUL
""" % dst_dir.path.replace("/", "\\")]

    inputs = []

    for src_path, dst_path, src_file in copy_paths:
        inputs.append(src_file)

        # copy & xcopy flags are documented at
        # https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/copy
        # https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy
        cmds.append("""
if not exist "{src}" (
    echo file "{src}" does not exist
    exit /b 1
)
if exist "{src}\\*" (
    mkdir "{dst}" >NUL 2>NUL
    robocopy "{src}" "{dst}" /E >NUL
) else (
    mkdir "{dst_dir}" >NUL 2>NUL
    copy /Y "{src}" "{dst}" >NUL
)
""".format(
            src = src_path.replace("/", "\\"),
            dst_dir = _paths.dirname(dst_path).replace("/", "\\"),
            dst = dst_path.replace("/", "\\"),
        ))

    # robocopy return non-zero exit codes on success so we must exit 0 when we are done
    cmds.append("exit 0")

    ctx.actions.write(
        output = bat,
        # Do not use lib/shell.bzl's shell.quote() method, because that uses
        # Bash quoting syntax, which is different from cmd.exe's syntax.
        content = "\n".join(cmds),
        is_executable = True,
    )

    ctx.actions.run(
        inputs = inputs,
        tools = [bat],
        outputs = [dst_dir],
        executable = "cmd.exe",
        arguments = ["/C", bat.path.replace("/", "\\")],
        mnemonic = "CopyToDirectory",
        progress_message = "Copying files to directory",
        use_default_shell_env = True,
    )

def _copy_to_directory_impl(ctx):
    if not ctx.attr.srcs and not ctx.attr.prefix_mapped_srcs and not ctx.attr.asset_srcs:
        fail("srcs, asset_srcs and prefix_mapped_srcs must not be empty in copy_to_directory %s" % ctx.label)

    output = ctx.actions.declare_directory(ctx.attr.name)

    # Gather a list of src_path, dst_path pairs
    copy_paths = []
    for target, prefix_map in ctx.attr.prefix_mapped_srcs.items():
        parts = prefix_map.split(":")
        if 2 != len(parts):
            fail("prefix_map %s for label %s is malformed" % (prefix_map, target))
        files = target[DefaultInfo].files.to_list()
        for src_file in files:
            src_path, output_path, src_file = _copy_paths(ctx, src_file, parts[0], parts[1])
            if None != src_path:
                dst_path = _paths.normalize("/".join([output.path, output_path]))
                copy_paths.append((src_path, dst_path, src_file))

    for src_file in ctx.files.asset_srcs:
        src_path, output_path, src_file = _copy_paths(ctx, src_file)
        if None != src_path:
            dst_path = _paths.normalize("/".join([output.path, output_path]))
            copy_paths.append((src_path, dst_path, src_file))

    for src_file in ctx.files.srcs:
        src_path, output_path, src_file = _copy_paths(ctx, src_file)
        if None != src_path:
            dst_path = _paths.normalize("/".join([output.path, output_path]))
            copy_paths.append((src_path, dst_path, src_file))

    if ctx.attr.is_windows:
        _copy_to_dir_cmd(ctx, copy_paths, output)
    else:
        _copy_to_dir_bash(ctx, copy_paths, output, ctx.attr.allow_symlink)
    return [
        DefaultInfo(files = depset([output]), runfiles = ctx.runfiles([output])),
    ]

_copy_to_directory = rule(
    attrs = {
        "allow_symlink": attr.bool(default = False),
        "asset_srcs": attr.label_list(allow_files = True, cfg = "exec"),
        "downcase": attr.bool(default = False),
        "is_windows": attr.bool(mandatory = True),
        "prefix_mapped_srcs": attr.label_keyed_string_dict(allow_files = True),
        "replace_prefixes": attr.string_dict(default = {}),
        "srcs": attr.label_list(allow_files = True),
    },
    implementation = _copy_to_directory_impl,
    provides = [DefaultInfo],
)

def copy_to_directory(name, srcs = [], asset_srcs = [], prefix_mapped_srcs = {}, replace_prefixes = {}, downcase = False, allow_symlink = False, **kwargs):
    """Copies files and directories to an output directory.

    Files and directories can be arranged as needed in the output directory using
    the `replace_prefixes` attribute.
    Args:
        name: A unique name for this target.
        srcs: Files to copy into the output directory.
        asset_srcs: Files to copy into the output directory. The Files are assumed to be platform independent
            and thus built in the "exec" configuration.
        prefix_mapped_srcs: Map of File labels to prefix replacement rules. The prefix replacement rules
            contain "src_prefix:target_prefix". If an input file or directory starts with the src_prefix
            then the output file has the src_prefix replaced by the target_prefix. Forward slashes (`/`)
            should be used as path separators This rule is applied before the replace_prefixes rule is applied.
        replace_prefixes: Map of paths prefixes to replace in the output directory path when copying files.
            If the output directory path for a file or directory starts with or is equal to
            a key in the dict then the matching portion of the output directory path is
            replaced with the dict value for that key.
            Forward slashes (`/`) should be used as path separators. The final path segment
            of the key can be a partial match in the corresponding segment of the output
            directory path.
            If there are multiple keys that match, the longest match wins.
        downcase: True to convert the filename to lowercase when copying from source to destination location.
            Defaults to False.
        allow_symlink: A boolean. Whether to allow symlinking instead of copying.
            When False, the output is always a hard copy. When True, the output
            *can* be a symlink, but there is no guarantee that a symlink is
            created (i.e., at the time of writing, we don't create symlinks on
            Windows). Set this to True if you need fast copying and your tools can
            handle symlinks (which most UNIX tools can).
        **kwargs: Other common named parameters such as `tags` or `visibility`
    """

    _is_windows = select({
        "@bazel_tools//src/conditions:host_windows": True,
        "//conditions:default": False,
    })

    _copy_to_directory(
        name = name,
        srcs = srcs,
        asset_srcs = asset_srcs,
        prefix_mapped_srcs = prefix_mapped_srcs,
        replace_prefixes = replace_prefixes,
        downcase = downcase,
        allow_symlink = allow_symlink,
        is_windows = _is_windows,
        **kwargs
    )
