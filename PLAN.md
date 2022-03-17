# Quake3Arena Plan

This repository began as a fork of Quake3Arena and exists as a mechanism for self education and having fun.
The idea is to evolve the project while keeping some degree of compatibility with the original media as an
excuse to learn new techniques etc.

The tasks that are the current focus and in probable order of attack:

* [Bazel Build](#Bazel Build): Move to using Bazel as the build tool.
* [CI Build](#CI Build):  Ensure that changes are tested across 
* [Automate Source Code Formatting](#Automate Source Code Formatting): Formatting source code is boring. Remove the humans!
* Modernize the C code.
* Remove warnings highlighted by CLion. CLion
* Remove "dead" code. There is a lot of code that is either duplicated or unused. 
* Fix bugs. There is a lot of code that has obvious bugs. Fix some of those as encountered.

## Future Tasks

These tasks are intended to be undertaken in the future but have not been prioritized or thought about in great depth.

* Add cross compiling support so can build images for other platforms where viable.
* Generate base docker images from packages. The base docker images will have basic configuration configurable as environment variables but will include no media by default. They may take inspiration from [ioquake3-server-docker](https://github.com/MarioVilas/ioquake3-server-docker) and [gamesvr-ioquake3](https://github.com/LacledesLAN/gamesvr-ioquake3).
* Add semi-automated performance profiling by being able to process demos and record the statistics.
* Translate PAK files into a more modern format with explicit dependencies.
* Change the maps and other media to use content based addressing when cross-referencing between maps, shaders, materials etc.
* The above two tasks probably require a completely rewritten filesystem layer.
* Port to Android.
* Use a WASM runtime to run cl_game and game rather than QVM. Switch to using any "standard" compiler that emits wasm as the compiler for this game logic. Ideally the WASM runtime will support SIMD. The Q3A engine should support the easy addition of new methods to interface.
* Add Quest support.
* Add bHaptics support.
* Switch renderer to nvrhi1 and/or WebGPU.
* Change the start place for VR to be a location with a 3D menu that can be interacted with rather than a 2D menu projected onto a barrel.
* Add mechanism for downloading Quake3Arena and Quake3TeamArena content from Steam? User supplies username and password. We save the username, generate a user secret as an "encrypted version" of a username+password hash using a public key and download the content immediately. If we ever need to download again, we will need to re-enter password.
* Re-add code equivalent to CD Key checking. i.e. Allow at most a single player online that is attached to a particular Steam account. Use the above described "user secret". The master server has access to private key to decode the secret and will ensure that the username matches and that there is a single user with that username present.
* Import or write own master server service. It probably should support the ability for games to register current matches plus players in the service. Maybe implemented as start of a K8 cluster. Note the one that ioq3 uses is available at [dpmaster-2.2.zip](http://icculus.org/twilight/darkplaces/files/dpmaster-2.2.zip)
* Add global rankings and statistics service. This would be part of the same cluster as the auth and master server list.
* Add mechanism for running game either as DEMO or with bots fighting bots. The supply cvar names and acceptable values for the cvars and run the game with different combinations of cvars as part of a test battery. 

## Task Descriptions

Below is a slightly longer form description of the tasks.

### Bazel Build

Bazel is an open-source build and test tool that scalably supports multi-language and multi-platform projects.
Configured correctly, the builds can be done incrementally and in a distributed fashion. The tool has a steep
learning curve but once understood, it seems to be easy to maintain large projects (which is in stark contrast
to other build tools).  

### CI Build

The project should initially test that the builds pass across a range of platforms. These platforms probably include  `macos_x86_64`, `macos_arm64`, `win32`, `win64`, `linux_x86_64`, `android`, `quest`. The most likely mechanism for running these build tests will be GitHub actions.

The build will also expand over time to check code formatting, perform static analysis of the code etc. 

In the more distant future, it is expected the performance profiling (i.e. demo run stats on various platforms) will
also be incorporated into the build so that obvious regressions can be identified.

### Automate Source Code Formatting

Formatting source code is boring and leads to pointless debates. A quotation from `Rust Style Guide`:

> Formatting code is a mostly mechanical task which takes both time and mental effort. By using an automatic formatting tool, a programmer is relieved of this task and can concentrate on more important things. Furthermore, by sticking to an established style guide (such as this one), programmers don't need to formulate ad hoc style rules, nor do they need to debate with other programmers what style rules should be used, saving time, communication overhead, and mental energy.

So I should pick a particular code formatter (ClangFormat? or Astyle?), pick a style that somewhat closely matches the current Q3A style and format the entire codebase. Zapwhite can also be incorporated for all the other files. Some scripts should also be developed so that when comparing against other Q3A forks I can fetch the other fork into a local branch, apply the source code formatter and merge the result into to a local branch representing the remote fork. This would make comparing diffs and investigating changes between successive fetches doable. 
