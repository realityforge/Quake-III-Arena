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

### Solution

### Evaluation