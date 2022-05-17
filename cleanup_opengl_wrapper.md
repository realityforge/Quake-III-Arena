## Cleanup OpenGL Wrapper code

### Motivation

On most platforms, OpenGL core and extension functions must be loaded at runtime. Different platforms have different mechanisms for loading the OpenGL libraries and loading the functions. This way a single compiled code base could load OpenGL drivers that support different profiles and OpenGL drivers that support different extensions using a unified mechanism.

The original project used a hand-crafted wrapper library and minimal extension loading mechanisms which seems labor-intensive to maintain and evolve. The `ioq3` fork included a more comprehensive wrapper library as it also supported OpenGL 2.x API, and it developed different wrapper library. The `ioq3` required that the developer declare each of the OpenGL functions that are used in the project using a specialized DSL. The `ioq3` fork then used preprocessor tricks to expand the DSL into code to declare the wrapper and to load the function on demand. The `ioq3` approach tends to confuse the IDE of choice (CLion) and thus the IDE fails to provide useful intellisense and code completion when interacting with the functions declared by the macro.

An ideal library would allow compile-time switch to enable pedantic error checking. This would entail invoking `qglGetError()` after every OpenGL API call. This could be compiled out during production builds but dramatically improve the developer experience by early detection of failed OpenGL calls in development builds. The original source code releases contain the `GL_CheckErrors(...)` function to detect errors and this function is called at specific locations to detect errors at a broad level. The `ioq3` fork improves on the situation and adds a macro that makes it easier to perform more checks but still has limited coverage.

A better scenario would involve the library checking error conditions without explict action from the user. This could be enabled during development and faults detected at the source when they occur. The framework could eliminate the code at runtime for optimised builds. The developer would still be expected to perform explicit checks in key locations but could leave the management of low level fault detection to the library.

The other "future" concern is that some platforms will link against the OpenGL driver library as part of the application deployment. These platforms have a single OpenGL implementation. The platform may also support normal dynamic linking against the extension methods. In this scenario the wrapper library should offer a zero cost method of interacting with the platform OpenGL implementation.

### Challenges

The biggest challenge associated with this task is associated with the age of the codebase and the extensions functions or capabilities used by the renderer. The original project used a fixed function pipeline while the `ioq3` fork used a programmable pipeline. Some extensions used by the original codebase or `ioq3` codebase were deprecated and may have been removed from later OpenGL profiles. In the ~22 years since the product was released, the OpenGL drivers and the underlying hardware has changed significantly.

### Solution

Several prototypes and experiments were conducted to explore the best path forward. The experiments included:

#### Prototypes

#### SDL-ize it all

Initially the expectation was that committing wholly to using SDL would simplify the codebase but this approach incurred unnecessary complexity and was abandoned.

##### Use gl3w

Picking an off-the-shelf library such as [gl3w](https://github.com/skaslev/gl3w) was another alternative. The `gl3w` library downloaded, extracted the OpenGL functions from the header files produced by Khronos and generated a library based on the extracted functions. The `gl3w` library was wonderfully simple to use, up to date with core profile and license compatible.

The `gl3w` library build process would need to modified to remove non-hermetic aspect of build process to be compatible with Bazel approach. The `gl3w` library does not have the ability to be a zero cost abstraction on platforms that have a single OpenGL implementation. The `gl3w` library does not have robust mechanisms for exposing error messages when initialisation fails. Nor does `gl3w` support adding pedantic compile time checking as part of the interface. All of these problems could be addressed by changes to the library.

##### Write Custom Library

Khronos specification registries are stored as XML and could be read and processed to output code that is customised for our requirements. The header files produced by Khronos and used as input into the gl3w generatore are actually produced from these source files via the [genheaders.py](https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api/genheaders.py) script. This project could write an alternative script that processed the XML registry and produced a custom wrapper library.

A prototype that began exploring this approach seemed viable but was likely to take longer to implement than had been budgeted for this change. It would have likely produced the best wrapper library but would take development time away from more interesting and more impactful work.

#### Implementation

The final decision was to take the work done by the `gl3w` project and refactor it piece by piece until it fit the projects requirements. In the end there was little left of `gl3w` other than the conceptual design and a few lines for scraping the headers. The code was renamed and extracted into an external repository so that it could be used in future projects.

### Evaluation

The implementation solved the initial problems in such a way that it could be used in future products.
