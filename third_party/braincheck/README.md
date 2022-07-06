# BrainCheck-C

BrainCheck-C is a library for debugging code and verifying invariants at runtime. In most cases, you will want to optimise these checks out in production builds and the library supports that.

## Bazel Integration

To integrate with the Bazel build tool add the following to your `WORKSPACE.bazel` file:

```python
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_BRAINCHECK_VERSION = ""
_BRAINCHECK_SHA256 = ""

http_archive(
    name = "braincheck",
    sha256 = _BRAINCHECK_SHA256,
    strip_prefix = "braincheck-c-%s" % _BRAINCHECK_VERSION,
    url="https://github.com/realityforge/braincheck-c/archive/refs/tags/v%s.tar.gz" % _BRAINCHECK_VERSION,
)
```

## API Reference

..

## Compile time configuration

The developer MUST define the `BRAINCHECK_PRINTF` such that it takes format string and variable arguments identical to `printf`. This will control where the debug messages are emitted.

i.e.

```c
#define BRAINCHECK_PRINTF(args...) printf(args)
#include "braincheck.h"
```

The user may also define symbols to cause parts of the BrainCheck library to be optimised away at compile time. These symbols MUST be defined prior to including the library.

* Define `BRAINCHECK_DISABLE` to optimise out all macros.
* Define `BRAINCHECK_NO_PERROR` to optimise out the `braincheck_perror()` macro.
* Define `BRAINCHECK_NO_BACKTRACE` to optimise out the `braincheck_backtrace()` and `braincheck_backtrace_n()` macros.
* Define `BRAINCHECK_NO_DEBUG` to optimise out the `braincheck_debug(...)`, `braincheck_debug_array(...)` and `braincheck_debug_hexdump()` macros.

# Contributing

GLA was released as open source so others could benefit from the project. We are thankful for any
contributions from the community. A [Code of Conduct](CODE_OF_CONDUCT.md) has been put in place and
a [Contributing](CONTRIBUTING.md) document is under development.

# License

BrainCheck-C is licensed under [Apache License, Version 2.0](LICENSE).

# Credit

* This toolkit was inspired by [eerimoq/dbg-macro](https://github.com/eerimoq/dbg-macro) which was inspired by the [std::dbg](https://doc.rust-lang.org/std/macro.dbg.html) rust macro and the C++ [sharkdp/dbg-macro](https://github.com/sharkdp/dbg-macro). It also took heavy inspiration from the java based [braincheck](https://github.com/realityforge/braincheck) library.