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

# Workspace named so that BUILD.bazel files in other workspaces can reference this
# namespace with a fixed name.
workspace(name = "org_realityforge_q3a")

load("//third_party/buildifier:repository.bzl", _load_buildifier_repository = "load_repository")
load("//third_party/content:repository.bzl", _load_content_repository = "load_repository")
load("//third_party/curl:repository.bzl", _load_curl_repository = "load_repository")
load("//third_party/go:repository.bzl", _load_go_repository = "load_repository")
load("//third_party/imagemagick:repository.bzl", _load_imagemagick_repository = "load_repository")
load("//third_party/libjpeg_turbo:repository.bzl", _load_libjpeg_turbo_repository = "load_repository")
load("//third_party/libpng:repository.bzl", _load_libpng_repository = "load_repository")
load("//third_party/libspng:repository.bzl", _load_libspng_repository = "load_repository")
load("//third_party/nasm:repository.bzl", _load_nasm_repository = "load_repository")
load("//third_party/ogg:repository.bzl", _load_ogg_repository = "load_repository")
load("//third_party/openal:repository.bzl", _load_openal_repository = "load_repository")
load("//third_party/opus:repository.bzl", _load_opus_repository = "load_repository")
load("//third_party/opusfile:repository.bzl", _load_opusfile_repository = "load_repository")
load("//third_party/pngcrush:repository.bzl", _load_pngcrush_repository = "load_repository")
load("//third_party/protobuf:repository.bzl", _load_protobuf_repository = "load_repository")
load("//third_party/rules_apple:repository.bzl", _load_rules_apple_repository = "load_repository")
load("//third_party/vorbis:repository.bzl", _load_vorbis_repository = "load_repository")
load("//third_party/zlib:repository.bzl", _load_zlib_repository = "load_repository")

_load_buildifier_repository()

_load_content_repository()

_load_curl_repository()

_load_go_repository()

_load_imagemagick_repository()

_load_libjpeg_turbo_repository()

_load_libpng_repository()

_load_libspng_repository()

_load_nasm_repository()

_load_ogg_repository()

_load_openal_repository()

_load_opus_repository()

_load_opusfile_repository()

_load_pngcrush_repository()

_load_protobuf_repository()

_load_rules_apple_repository()

_load_vorbis_repository()

_load_zlib_repository()

load("//third_party/go:repository2.bzl", _configure_go_repository = "configure_repository")
load("//third_party/protobuf:repository2.bzl", _configure_protobuf_repository = "configure_repository")
load("//third_party/rules_apple:repository2.bzl", _configure_rules_apple_repository = "configure_repository")

_configure_go_repository()

_configure_protobuf_repository()

_configure_rules_apple_repository()
