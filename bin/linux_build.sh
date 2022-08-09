#!/usr/bin/env bash

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

set -e

export WORKSPACE_BASE=$(pwd)

export IMAGE_PRESENT=$(docker images | grep q3a_build)
if [ "" = "${IMAGE_PRESENT}" ] || [ "${FORCE_BUILD}" == "true" ]; then
    echo "Creating Build Image"
    docker build -t q3a_build:latest ${WORKSPACE_BASE}/bin/docker/linux
    docker rm --force q3a_builder 2>/dev/null >/dev/null
fi

export CONTAINER_PRESENT=$(docker ps -a | grep q3a_builder)
if [ "" = "${CONTAINER_PRESENT}" ]; then
    echo "Creating Build Container"
    docker create --tty \
        --mount type=bind,source="${WORKSPACE_BASE}/",target=/home/q3a_builder/source \
        --mount type=bind,source="${HOME}/.cache/bazel-repo",target=/home/q3a_builder/.cache/bazel-repo \
        --mount type=bind,source="${HOME}/.cache/bazel-linux-disk",target=/home/q3a_builder/.cache/bazel-disk \
        --name q3a_builder \
        q3a_build:latest
fi

export CONTAINER_RUNNING=$(docker ps | grep q3a_builder)
if [ "" = "${CONTAINER_RUNNING}" ]; then
    echo "Starting Build Container"
    docker start q3a_builder
fi

docker exec --interactive --tty q3a_builder ./bazelw $@

docker stop q3a_builder
