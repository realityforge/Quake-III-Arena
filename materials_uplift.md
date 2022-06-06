## Materials Uplift

### Motivation

One of the big innovations of this engine compared to other engines at the time was the ability to give the content creators more direct control over texture rendering by externalizing the rendering directives into external "shader files". These controlled how the renderer presented the brushes and meshes.

The shaders could also indicate surface parameters and volume properties that modified game logic when entities were interacting with the brushes and meshes. Further capabilities and directives were added to support tools such as the area awareness compiler used to support bot navigation etc.

The technology was ahead of it's time but is now somewhat outdated. The "shaders" would more properly be termed material definitions in modern engines (and in later id Tech engines they were renamed to reflect this role). The rendering part of the old "shaders" were also designed to support a fixed function OpenGL style pipeline rather than modern hardware or APIs.

A single shader file could contain multiple different shaders. And a shader with the same name could appear multiple times with the "last" shader definition overriding earlier shader definitions. There existed some ad-hoc organisation and grouping of shaders into shader definition files, but it was not systematic or very easy to replace individual shader definitions. The "Team Arena" game mode chose to duplicate every shader present in the "BaseQ3" game mode rather than attempting to just specify the new shaders as a result of this complexity. (i.e. `textures/common/nolightmap` appears in both game modes). Even within a single game mode, the same shader definition can appear multiple times, and you have to know the order in which files will be included to determine which definition will win. (i.e. `textures/base_floor/concfloor_rain` appears three times in the `BaseQ3` game mode).

The shader definitions include directives that are used at runtime, directives that improve the user interface in the editors, and directives that are used at build time by tools such as the map compiler or the area awareness compiler. The shader definitions should omit the non-runtime directives when consumed by the engine but retain the definitions when using the shaders as part of the build infrastructure. This will reduce the unnecessary processing when loading the shaders.

If or when the renderer is rebuilt, it will be necessary to transform the Q3A shaders into actual shader languages such as GLSL or shader "target" languages such as SPIR-V or WSL. To achieve this an in-depth understanding of the existing shader infrastructure will be necessary. Some "multi-stage" Q3A shaders produce a single pass GL shader while some single stage Q3A shaders may result in substantial infrastructure including geometry shaders. Without having an indepth understanding of the shader definition format, these changes would be difficult.

This change proposes the development of tooling to read, write and transform the shader files. The shader definitions should be optimised for the intended usage with the expectation that a single shader definition may appear in different forms; one for loading into the runtime and one for usage during build and development.

As part of this change, it is expected that the shaders present in the "Team Arena" game will be deduplicated and only the new or varied shaders will be retained.

### Challenges

The shader file format is poorly documented and the only real way to understand the behaviour is to read the source code. The [Q3Radiant Shader Manual](https://icculus.org/gtkradiant/documentation/Q3AShader_Manual/) provides Q3A specific shader documentation, while the [Q3Map2 Shader Manual](http://q3map2.robotrenegade.com/docs/shader_manual/) includes more up-to-date documentation for the file format. However, the Q3Map2 document includes documentation for many directives that are not supported by the original Q3A game or are only supported by q3map2 tool. The Q3Map2 document also focuses on the directives from the perspective of the tooling and less from the perspective of the runtime.

There is also some variance in how the shaders are processed by the tools and the runtime, with some values being accepted by the engine but not the tooling or vice versa. (i.e. the `infoParm_t` reference structure varies between the two code bases and the values for the `cull` directive different between both tools.)

Many of the shaders also have "obvious" syntactical bugs that are accepted by the runtime and/or build tools due to the way they are built. Should the new accept this invalid syntax and try to process them the same way as the engine or build tools (sometimes the strategies between the two loaders differs)? Alternatively should we "correct" the shader to have valid syntax? And if we choose the correction path should we correct it so that it aligns with how the current runtime behaves or to how the original shader author intended? The "safest" seems to correct the input shader definitions to match the current runtime behaviour rather than the authors intended behaviour.

A typical syntactical error that is easy to resolve is the shader directive that manipulates texture coordinates after they have been generated. In the shader definition files present in the full game, there are directives that look like `tcMod scroll 1 1 10 20` but the runtime will does read the two trailing arguments and treats the shader equivalently to `tcMod scroll 1 1`. In this case the directive can simply be corrected.

A shader definition error that is harder to correct is something like `tcmod turb sin .5 1 0 1.5`. The `sin .5 1 0 1.5` is a wave function used in other contexts in the shader definition files which essentially modifies coordinates using the `sin` generator function with the parameters `"base=0.5, amplitude=1 phase=0, frequency=1.5"`. The `tcmod turb` directive does not accept a wave function but does accept parameters `<base> <amplitude> <phase> <freq>`. Should we transform the input into `tcmod turb 0 .5 1 0` (which is how the runtime interprets the existing code) or `tcmod turb .5 1 0 1.5` (which is probably what the author intended)?

Shader definitions also have many unused/invalid directives that are probably from earlier iterations of the shader definition format. i.e. There are `sky` and `cloudparms` directives that are not used by the runtime or tooling and have probably been superseded by the `skyparms` directive. There are directives such as `lightning` and `fogonly` that do not seem to be used but may have (?) been superseded or just never used. There are those such as the `surfaceParm nomipmap` directive where the shader author probably intended `nomipmap` but are effectively no-ops. For each of these scenarios, the philosophy has been to keep the existing runtime behaviour but if a directive is build time only and not used by current tools to omit/comment out/ignore the directive.

To avoid recreating the somewhat arcane rules relating to ordering of shaders it is also desirable to remove duplicates in source data. In some cases there are duplicates that appear within the same file; the shader definition earlier in the file is ignored and is effectively unused. In some cases the shader definition is duplicated in another file and this was because it appeared in a later pk3 release from idSoftware. Most significantly there is duplicates across game modes (i.e. Team Arena duplicates many of the shaders of baseQ3 but does not necessarily use them, and it sometimes overrides shaders with older versions of the shaders already updated in BaseQ3.) A vastly simpler approach is to remove all duplicates.

A simple way to implement this is to ensure that each shader definition occurs in a separate file named based on the shader name. This would allow the relatively trivial removal of all duplicates. To ensure performance at runtime these shaders could be packaged into a single file when distributed as part of the deployment package.

There is also some more technology specific challenges that are associated with this change. It is expected that this change will result in a new library, and it will need relatively extensive testing and validation. It was also decided that this tool would be in a language other than C to force the author to understand the file format and not just copy-paste code from the tools or engine. Both of these requirements will add additional overhead to the development process as it will require learning how to add appropriate test targets in Bazel, integration of a new language into the IDE as well as enabling running of tests and related infrastructure from the IDE.

### Solution

The final solution was developed in the Java language, using the Antlr parser generator. This toolkit was selected as the author was familiar with these tools but was unfamiliar with how to integrate it with Bazel. The solution also opted to use Junit version 5 rather than Junit version 3 or 4 as Junit 5 is not supported in Bazel by default and thus using Junit version 5 forced a deeper understanding of the Bazel test infrastructure.

...

### Evaluation

...
