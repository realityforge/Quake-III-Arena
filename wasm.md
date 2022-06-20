## Replace VMs with WASM modules

### Motivation

Q3A used bytecode VMs to run the client-side ui (i.e. `ui.qvm`), the client-side game (i.e. `cgame.qvm`) and the server-side game (i.e. `game.qvm`) modules. It used a bytecode format derived from internal LVM bitcode format and either interpreted the bitcode or compiled the bitcode to native code and invoked the compiled code. The intent was to combine the best parts of Quake1 (the safety and portability of a bytecode executable) with the speed of Quake2 (natively compiled DLL modules).

While this worked at the time, there existed several problems. The LVM format was not stable or designed to be safe or efficient to interpret. This resulted in a static copy of the LLC toolchain being included as part of the Q3A tools. The initial VM execution code was not 64-bit safe and not particularly efficient. The VM code was difficult to debug and inefficient to build to small changes such that most development was done by compiling as shared libraries rather than VM images.

In a modern environment there are many VM instruction architectures to choose from with different strengths and weaknesses. A quick analysis indicates that WebAssembly (abbreviated Wasm) is the most suitable target for this use case. WebAssembly is a binary instruction format for a stack-based virtual machine designed as a portable compilation target for programming languages.

The benefits of the Wasm instruction format (as extracted from [WebAssembly.org](https://webassembly.org/)):

* **Efficient and fast**: The Wasm stack machine is designed to be encoded in a size and load-time-efficient binary format. WebAssembly aims to execute at native speed by taking advantage of common hardware capabilities available on a wide range of platforms.
* **Safe**: WebAssembly describes a memory-safe, sandboxed execution environment that may even be implemented inside existing JavaScript virtual machines. When embedded in the web, WebAssembly will enforce the same-origin and permissions security policies of the browser.
* **Open and debuggable**:  WebAssembly is designed to be pretty-printed in a textual format for debugging, testing, experimenting, optimizing, learning, teaching, and writing programs by hand. The textual format will be used when viewing the source of Wasm modules on the web.
* **Part of the open web platform**: WebAssembly is designed to maintain the versionless, feature-tested, and backwards-compatible nature of the web. WebAssembly modules will be able to call into and out of the JavaScript context and access browser functionality through the same Web APIs accessible from JavaScript. WebAssembly also supports non-web embeddings.

The primary benefit of Wasm is the extraordinary amount of engineering effort that is going in to making it safe and fast at runtime and friendly for a developer to use. Adopting this in Q3A will improve safety, performance and open up other languages as "modding" possibilities. Wasm modules can be pre-compiled and thus incur no substantial startup or runtime performance. Wasm based VMs could be much smaller than the current VM architecture and existing functionality could be the result of multiple Wasm plugins rather than a few large modules.

### Challenges

Not all platforms will support Wasm modules and the project will need to maintain support for compiling the modules as shared libraries until such support is present. The Android platform is of particular importance as it is the OS used by Quest Headsets.

The Wasm compiler toolchain can be difficult to set up, even when compiling C to a wasm target.

There are several Wasm runtimes that support various capabilities, including some runtimes that support SIMD instructions. The runtime selected will have a substantial impact on the capabilities that are provided to the application and the changes in resource requirements. The selection is likely to be complex and integration similarly so.

The memory layout of structures passed into and out of Wasm modules is stable across platforms but the Q3A memory layout will vary across platforms (or so it is assumed). There may be substantial work required to align the two ways of looking at memory that is shared between the modules.

### Plan

The plan is to tackle this task in separate phases:

#### Phase 1

The first step is to get the `cgame`, `game` and `ui` libraries being compiled as wasm modules. This will involve:

* Defining an emscripten CC toolchain in Bazel.
* Defining one or more macros/rules to compile source to output units and linking them as binaries.
* Defining one or more macros/rules to optimize and post-process the binaries.
* Defining a `vm_library` macro that abstracts `cc_library` and `wasm_library` rules so that the build code can declare a library once but have both a wasm and native library declared.
* Converting the existing builds to use `vm_library`.

#### Phase 2

The next step is to select and integrate a Wasm runtime into the application. This will involve:

* Selecting the runtime.
* Defining the Bazel repository rules to fetch and build the runtime.
* Adding code to embed the runtime into the engine.
* Experiment with dispatching calls into a wasm module and receiving calls from a wasm module.
* Add code to cache the compiled form of the runtime based on a content hash and the system version.

#### Phase 3

Integration of the `ui` vm as a Wasm module. This will involve:

* Ensuring the calling convention and memory layout between the application and the ui module works as expected.
* Potentially involves creating a tool to generate glue code on the wasm side and the engine side to provide an API for interaction between the two systems.

#### Phase 4

Integration of the `game` vm and the `cgame` vm as Wasm modules. This will involve:

* Unknown but it is expected that additional support will be required to ensure the communication protocol between modules operates as desired.

#### Phase 5

Remove the historic `qvm` module interpreter and jit compiler.

### Solution

...

### Evaluation

...
Future work:

* Reduce the size of the VM modules so that there is the possibility of multiple Wasm plugins on the client-side or server-side to provide small target features. i.e. Exposing the engine using a grpc API could be a separate server plugin rather than being bundled into the one single server game module.

### References

* Envoy is a product that uses Wasm modules as plugins and is built with Bazel. It has invested significant time in a [wasm.bzl](https://github.com/envoyproxy/envoy/blob/main/bazel/wasm/wasm.bzl) bazel extension that could be repurposed for use in this project.
* [Wasmer](https://docs.wasmer.io/): An open-source runtime for executing WebAssembly on the Server.
* [emsdk hello-world example](https://github.com/emscripten-core/emsdk/blob/master/bazel/hello-world/BUILD): A simple example of compiling a C file to wasm binary and a platform binary at the same time.
