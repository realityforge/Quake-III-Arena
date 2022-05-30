## Materials Uplift

### Motivation

One of the big innovations of this engine compared to other engines at the time was the ability to give the content creators more direct control over texture rendering by externalizing the rendering directives into external "shader files". These controlled how the renderer presented the brushes and meshes.

The shaders could also indicate surface parameters and volume properties that modified game logic when entities were interacting with the brushes and meshes. Further capabilities and directives were added to support tools such as the area awareness compiler used to support bot navigation etc.

The technology was ahead of it's time but is now somewhat outdated. The "shaders" would more properly be termed material definitions in modern engines (and in later id Tech engines they were renamed to reflect this role). The rendering part of the old "shaders" were also designed to support a fixed function OpenGL style pipeline rather than modern hardware or APIs.

### Challenges

### Solution

### Evaluation
