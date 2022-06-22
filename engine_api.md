## Engine API

### Motivation

The engine allows limited administration and operational monitoring of a running game by interacting with the server in-game or by using an external rcon session. The game also offers limited mechanisms for a developer to inspect the state of the engine using the same mechanisms. This change proposes the addition of a remote API that can be used to inspect and alter the state of a running game.

This would support the addition of companion applications that could observe and modify the state of a running service. This remote API must be secure, efficient and support easy extension. Security is required as it is inevitable that players will attempt to compromise the service for their own benefit. Efficiency is required as this is a game service and an API that can degrade the experience for players is not acceptable. Easy extension is required as this engine is designed to support experimentation and evolution.

Several remote API technologies were initially assessed with a focus on technologies that are common in web-technology platforms as it is expected that most companion applications would have an aspect that is exposed as a web application. The investigation focused on Json over HTTP or GraphQL style services. This line of investigation was later abandoned as every one of these approaches ha d a significant overhead when interacting with engine. In some cases the overhead was inherent (i.e. encoding, decoding and validating json messages has some overhead) but in some cases the overhead was due to the way most (or all?) frameworks built in this domain operate (i.e. no zero-allocate or low-allocation paths were found for transforming data from within the engine to the bytes sent to the network layer).

Investigating how other high scale, performance sensitive internet architectures operate seemed to indicate that many use some form of binary rpc. In most cases the rpc formats allowed message evolution and efficient transmission and receiving in multiple languages. Google has been using this style of technology for a very long time and has developed `Protobuf` to fill this need. Google also developed `FlatBuffers` which is similar to `Protobuf` but with lower CPU overhead, fewer memory allocations but less efficient serialisation format and was developed by Googles gaming division. `Cap-n Proto` is another take on this architecture that was written by an ex-Google engineer that worked on `Protobuf` that took the strengths of `Protobuf` and `FlatBuffers` and combined them. All of them are essentially a schema-driven serialisation and optional rpc architecture. A reasonable overview of the strengths and weaknesses of each architecture is presented in [this](https://capnproto.org/news/2014-06-17-capnproto-flatbuffers-sbe.html) article, but it was written by the author of the `Cap-n Proto`.

The strengths and weaknesses of each toolkit as relevant to our use case:

#### Protobuf

* Messages are encoded and decoded and thus require more allocations than the other toolkits (which only require the allocation for the initial message and the final representation).
* Supports multiple message versions and can "ignore" old fields.
* Can accept json or binary messages.
* Has a built-in rpc library with massive numbers of supporting tools provided by the community such as [grpcui](https://github.com/fullstorydev/grpcui) (An interactive web UI for gRPC, along the lines of postman), [grpcurl](https://github.com/fullstorydev/grpcurl) (Command-line tool for interacting with gRPC servers like cURL).
* Already built as part of our build infrastructure as it is used by various tools including Bazel.

#### FlatBuffers

* Like Protobuf but substantially lower CPU usage and fewer allocations as message format is efficiently mapped to an in-memory layout.
* Larger message formats that `Protobuf`.
* "Clumsy" to use from within the application and requires much boilerplate.
* Better than the other toolkits when loading large volume of data (i.e. asset loading).

#### Cap’n Proto

* Similar CPU and memory allocation efficiency to `FlatBuffers`.
* The serialised message format is less efficient than other toolkits if unset fields are present in message. Can also tweak message format (i.e. padding) to increase efficiency compared to `FlatBuffers`
* It has a vaster smaller ecosystem outside of C++ and even the C++ ecosystem is smaller than `Protobuf`. The ecosystem is larger than `FlatBuffers`
* Several advanced network features such as `promise pipelining` are available that are not present in other toolkits. See the [rpc](https://capnproto.org/rpc.html) documentation.

### Challenges

...

### Solution

...

### Evaluation

...
