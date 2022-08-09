FROM ubuntu:22.04
RUN apt update -y &&  \
    apt upgrade -y &&  \
    # curl is required by bazelisk to download bazel
    # perl provides shasum which is required by bazelisk to verify download
    # build-essential provides a compiler which is required by bazel to perform compile until we add toolchains
    apt-get install -y curl perl build-essential &&  \
    apt-get clean &&  \
    apt-get autoclean &&  \
    rm -rf /var/lib/apt/lists/*
RUN useradd -ms /bin/bash q3a_builder
USER q3a_builder
RUN mkdir /home/q3a_builder/source && \
    mkdir /home/q3a_builder/.cache && \
    mkdir /home/q3a_builder/.cache/bazel-repo && \
    mkdir /home/q3a_builder/.cache/bazel-disk
WORKDIR /home/q3a_builder/source
CMD /bin/bash

# We currently assume a persistent image but we could also use "docker run --rm -it"
# but map volumes for the repository cache and the disk cache and periodically blow it away
# to keep from continuous growth
