## Improve Build Automation

### Motivation

The initial source code release required that the project be built using platform specific IDEs on Windows and Mac and cons on Linux. Most downstream forks have moved to alternative build and automation tools. The most common build solutions include a combination of Makefiles, CMake, IDE project files, .bat scripts and shell scripts.

Some forks perform limited cross compilation or compile the source code for other devices such as iOS, tvOS, Android devices, Quest VR Headsets, browsers etc. As far as this project is aware, there is no project that provides comprehensive support for compiling to alternative architectures, alternative operating systems or alternative platforms.

The other source forks primarily focus on transforming the code into output executables and libraries. No project has a comprehensive toolchain that supports transforming source assets (i.e. `.map` files) into assets ready to be consumed by the engine (i.e. `.bsp` files). The asset transformation pipeline is automated separately if at all. Often the asset creation is performed using labour intensive manual processes.

In a similar vein, there is limited support for automating the release and deployment of services into operation. There are isolated examples that specify docker images, kubernetes clusters, cloud formation templates etc. An ideal solution would automate the entire stack from a single location. The entire stack would include a server browser, a master server, a global statistics server etc.

Build automation should also integrate with CLion (which is the current IDE of choice) but not require the IDE. Builds should be possible without the presence of an IDE on all targeted platforms.

Automating the build and deployment of the code has substantial advantages as it improves the velocity of feature development. However, it can also expose quality issues, so it usually needs to be paired with a continuous integration, continuous deployment and application monitoring.

As builds get bigger and more complex, it is often desirable to support distribution of builds to a cluster and caching of intermediate results.

### Challenges

The biggest challenge to automating a process is often understanding the process. This change will be extremely large but will provide substantial value over time. The challenge will be breaking down the automation into a series of steps that progress in the correct direction but are individually useful.

The second challenge is that this work is often detail oriented, high risk and is not necessarily interesting when the primary goal of this project is to learn game development.

### Solution

The initial investigation seemed to suggest that different types of automation could occur using different tools. The automation could be completed using domain specific tools such as CMake, Dockerfiles etc. The individual steps could be chained together using shell scripts and pipelines could be orchestrated using third party tools. Experiments started using this approach but the complexity was too high to sustain in a project of this type.

After reviewing the ecosystem it seemed like the only automation system that could potentially fulfill all of our requirements was [Bazel](https://bazel.build/). Bazel is an open-source build and test tool that supports multi-language and multi-platform projects. Configured correctly, Bazel builds can be done incrementally and in a distributed fashion. The key features highlighted on the Bazel home page that sold the project on the move are:

* **Speed up your builds and tests**: Rebuild only what is necessary. Get fast, incremental builds with Bazel's advanced local and distributed caching, optimized dependency analysis, and parallel execution.
* **One tool, multiple languages**: Build and test using Java, C++, Go, Android, iOS and many other languages and platforms. Bazel runs on Windows, macOS, and Linux.
* **Scalable**: Scale your organization, codebase, and Continuous Integration systems. Bazel handles codebases of any size, whether in multiple repositories or a huge monorepo.
* **Extensible to your needs**: Add support for new languages and platforms with Bazel's extension language. Share and re-use language rules written by the growing Bazel community.

For all the benefits that Bazel offers, the most significant negative is an extremely steep initial learning curve. There is limited documentation on how to get started beyond toy examples. Once understood, Bazel seems to be (relatively) easy to maintain for large projects which is in stark contrast
to other build tools.

<a name="phase_1" ></a>

#### Phase 1 - Build the code using Bazel

Phase 1 is to build the major components on the local workstation. The qvm code need not be built and instead the game libraries will be "native" libraries.

* The main executable that includes both the client and the server code.
* The dedicated server that includes just the server component.
* The base game libraries (the cgame, game and ui shared libraries)
* The team arena (a.k.a. missionpack) game libraries (the cgame, game and ui shared libraries)

This may require running Bazel on different host systems to build for different targets.

### Phase 1 - Evaluation

The initial build conversion to Bazel is taking longer than initially estimated. Rather than starting from the original idSoftware release, the `Makefile` build system in `ioq3` fork was used as a baseline as it is actively maintained and modernized to a degree and thus offered a fairer comparison.

The conversion is producing tangible benefits even at this early stage. Some benefits of the conversion come purely as it has forced an understanding of the build system and a re-assessment of decisions. Others are probably attributable to the change in build system.

As the build conversion change has been co-occurring with other changes, it is difficult isolate where some improvements have come from. i.e. The build speed has improved, even when using the original build system. The speed of the build could have improved due to the elimination of unused code, adjustment of compiler options or improving the structure of the include files.

To quantify the difference in build speed between the two build systems, we measured build time in a few scenarios. The performance test used a warmed up filesystem and performed an optimised build.

The Bazel build involved running `bazel build //code/...` while the original build was executed `make`.

The scenarios under test were:

* **Full Build**: A complete rebuild of the product. Under the make based system this involved running `make distclean` before the test. Under the bazel based build system this involved running `bazel clean` before the test.
* **Noop Build**: After a **Full Build**, the build is run again without making any changes to the source code.
* **Internal Header Change**: After a **Full Build**, the build is run again after making a change to <code>inffast.h</code>. This header is only included by one c file, modifies a single object file and modifies two output executables.
* **Implementation Change**: After a **Full Build**, the build is run again after making a change to <code>tr_image_tga.c</code>. This modifies a single object file and modifies a single output library.
* **Interface Header Change**: After a **Full Build**, the build is run again after making a change to <code>tr_public.h</code>. This header is transitively included in many implementation files, modifies many object files and modifies multiple output executables and libraries.

<table>
<thead>
  <tr>
    <th>Scenario</th>
    <th>Original Build</th>
    <th>Bazel Build</th>
    <th>Improvement</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Full Build</td>
    <td><code>0m51.749s</code></td>
    <td><code>0m9.581s</code></td>
    <td>5.4</td>
  </tr>
  <tr>
    <td>Noop Build</td>
    <td><code>0m0.352s</code></td>
    <td><code>0m0.140s</code></td>
    <td>2.5</td>
  </tr>
  <tr>
    <td>Internal Header Change (<code>inffast.h</code>)</td>
    <td><code>0m0.920s</code></td>
    <td><code>0m0.305s</code></td>
    <td>3.0</td>
  </tr>
  <tr>
    <td>Implementation Change (<code>tr_image_tga.c</code>)</td>
    <td><code>0m0.492s</code></td>
    <td><code>0m0.219s</code></td>
    <td>2.3</td>
  </tr>
 <tr>
    <td>Interface Header Change (<code>tr_public.h</code>)</td>
    <td><code>0m7.797s</code></td>
    <td><code>0m1.603s</code></td>
    <td>4.9</td>
  </tr>
</tbody>
</table>

Bazel builds are faster than the original builds in every scenario. The broader the change, the faster Bazel is. While the `Makefile` build tracks changes on a per-file basis, the unoptimised Bazel build is still substantially faster. This is an encouraging result. As the project evolves and the build automation gets more complex, there is opportunity to return to re-optimise Bazel build actions.

These numbers were generated on a fast computer dedicated to build automation. These numbers would be more impressive on a less powerful developer laptop, if multiple platform builds were added or if the tools that have been removed (i.e. `q3asm`, `q3map`, `q3radiant`, `lcc`, `bspc` etc), were re-added to the builds. It is expected that Bazel would look significantly more impressive as most of that code could have been built in parallel.

One unexpected benefit was the ease of upgrading third party dependencies. There was an existing change plan to [Update Third Party Libraries](update_thirdparty_libraries.md), but it was expected that this task would involve some heavy lifting. However, upgrading these third party libraries became a relatively trivial exercise after moving to Bazel. If the library had a stable API, then the dependency upgrade mostly involved testing the updated library.

<a name="phase_2" ></a>

#### Phase 2 - Cross compile where cross compile tools are available

Add support for cross compiling where possible. At a minimum it should be possible to compile to both `macos-x86_64` and `macos-arm64` on a host `macos` and probably support the compilation to `linux-x86_64` on a host environment of `macos`.

<a name="phase_3" ></a>

#### Phase 3 - Cached, Remote, Distributed Build infrastructure

Add support for performing builds on remote hosts using distributed build cache. It is unclear whether the benefit will outweigh the cost when there is a single developer, performing limited content generation.
