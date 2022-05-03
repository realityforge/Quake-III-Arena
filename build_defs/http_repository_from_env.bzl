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

load(
    "@bazel_tools//tools/build_defs/repo:utils.bzl",
    "read_netrc",
    "read_user_netrc",
    "update_attrs",
    "use_netrc",
)

_attrs = {
    "base_url_env": attr.string(mandatory = True),
    "local_path": attr.string(mandatory = True),
    "sha256": attr.string(),
    "build_file_content": attr.string(mandatory = True),
    "netrc": attr.string(doc = "Location of the .netrc file to use for authentication"),
    "auth_patterns": attr.string_dict(doc = "See http_archive repository rule docs for explanation"),
}

def _impl(repository_ctx):
    base_url = repository_ctx.os.environ.get(repository_ctx.attr.base_url_env)
    if None == base_url:
        fail("User MUST define %s environment variable which is the root url with file %s that contains the content of the %s repository. This may be a local url of the form file:///some/path/to/local/dir" % (repository_ctx.attr.base_url_env, repository_ctx.local_path, repository_ctx.name))

    urls = ["%s/%s" % (base_url, repository_ctx.attr.local_path)]

    if repository_ctx.attr.netrc:
        netrc = read_netrc(repository_ctx, repository_ctx.attr.netrc)
    else:
        netrc = read_user_netrc(repository_ctx)
    auth = use_netrc(netrc, urls, repository_ctx.attr.auth_patterns)

    download_info = repository_ctx.download_and_extract(urls, "", repository_ctx.attr.sha256, "zip", "", canonical_id = repository_ctx.name, auth = auth)

    repository_ctx.file("WORKSPACE", "workspace(name = \"{name}\")\n".format(name = repository_ctx.name))
    repository_ctx.file("BUILD.bazel", repository_ctx.attr.build_file_content)

    return update_attrs(repository_ctx.attr, _attrs.keys(), {"sha256": download_info.sha256})

# A simple repository rule that mimics a subset of the http_repository but allows base part of the url
# to be specified via an environment variable. This is required as the content is proprietary and can
# not be published but is likely local or can be sourced from a protected url
http_repository_from_env = repository_rule(implementation = _impl, attrs = _attrs)
