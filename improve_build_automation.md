## Improve Build Automation

### Motivation

The initial source code release required that the project be built using platform specific IDEs on Windows and Mac and cons on Linux. Most downstream forks have moved to alternative build and automation tools. The most common build solutions include a combination of Makefiles, CMake, IDE project files, .bat scripts and shell scripts.

Some forks perform limited cross compilation or compile the source code for other devices such as iOS, tvOS, Android devices, Quest VR Headsets, browsers etc. As far as this project is aware, there is no project that provides comprehensive support for compiling to alternative architectures, alternative operating systems or alternative platforms.

The other source forks primarily focus on transforming the code into output executables and libraries. No project has a comprehensive toolchain that supports transforming source assets (i.e. `.map` files) into assets ready to be consumed by the engine (i.e. `.bsp` files). The asset transformation pipeline is automated separately if at all. Often the asset creation is performed using labour intensive manual processes.

In a similar vein, there is limited support for automating the release and deployment of services into operation. There are isolated examples that specify docker images, kubernetes clusters, cloud formation templates etc. An ideal solution would automate the entire stack from a single location. The entire stack would include a server browser, a master server, a global statistics server etc.

Automating the build and deployment of the code has substantial advantages as it improves the velocity of feature development. However, it can also expose quality issues, so it usually needs to be paired with a continuous integration, continuous deployment and application monitoring.

As builds get bigger and more complex, it is often desirable to support distribution of builds to a cluster and caching of intermediate results.

### Challenges

The biggest challenge to automating a process is often understanding the process. This change will be extremely large but will provide substantial value over time. The challenge will be breaking down the automation into a series of steps that progress in the correct direction but are individually useful.

The second challenge is that this work is often detail oriented, high risk and is not necessarily interesting when the primary goal of this project is to learn game development.

### Solution

The initial investigation seemed to suggest that different types of automation could occur using different tools. The automation could be completed using domain specific tools such as CMake, Dockerfiles etc. The individual steps could be chained together using shell scripts and pipelines could be orchestrated using third party tools. Experiments started using this approach but the complexity was too high to sustain in a project of this type.

After reviewing the ecosystem it seemed like the only automation system that could potentially fulfill all of our requirements was [Bazel](https://bazel.build/). Bazel is an open-source build and test tool that supports multi-language and multi-platform projects. The key features highlighted on the Bazel home page that sold the project on the move are:

* **Speed up your builds and tests**: Rebuild only what is necessary. Get fast, incremental builds with Bazel's advanced local and distributed caching, optimized dependency analysis, and parallel execution.
* **One tool, multiple languages**: Build and test using Java, C++, Go, Android, iOS and many other languages and platforms. Bazel runs on Windows, macOS, and Linux.
* **Scalable**: Scale your organization, codebase, and Continuous Integration systems. Bazel handles codebases of any size, whether in multiple repositories or a huge monorepo.
* **Extensible to your needs**: Add support for new languages and platforms with Bazel's extension language. Share and re-use language rules written by the growing Bazel community.

For all the benefits that Bazel offers, the most significant negative is an extremely steep initial learning curve. There is limited documentation on how to get started beyond toy examples.

<a name="phase_1" ></a>

#### Phase 1 - Build the code using Bazel

Phase 1 is to build the major components on the local workstation. The qvm code need not be built and instead the game libraries will be "native" libraries.

* The main executable that includes both the client and the server code.
* The dedicated server that includes just the server component.
* The base game libraries (the cgame, game and ui shared libraries)
* The team arena (a.k.a. missionpack) game libraries (the cgame, game and ui shared libraries)

This may require running Bazel on different host systems to build for different targets.

<a name="phase_2" ></a>

#### Phase 2 - Cross compile where cross compile tools are available

Add support for cross compiling where possible. At a minimum it should be possible to compile to both `macos-x86_64` and `macos-arm64` on a host `macos` and probably support the compilation to `linux-x86_64` on a host environment of `macos`.
