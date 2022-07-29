## Use SDL as the OS abstraction layer

### Motivation

The original codebase had a custom operating system abstraction while the ioquake3 fork used SDL. The SDL version used by ioquake3 was several versions out of date and used different versions based on how it was built in a reasonably uncontrolled manner. (See the [Update Third Party Libraries](update_thirdparty_libraries.md) change description for further details.) The SDL usage in ioquake3 seemed rushed and often did not seem complete. The incompleteness was most obvious off the non-happy path. Sometimes the system did not make check or respond to failures.

The decision had already been made to [base](rebase.md) future work off the original idSoftware source code rather than the ioquake3 fork. Going this path meant we had to decided to keep the original abstractions and modernize them or move to [SDL](https://www.libsdl.org/) or some other toolkit such as [GLFW](https://www.glfw.org/).

The initial desire was to avoid SDL as the poor integration in ioquake3 left a bad taste in my mouth. However, modernising the existing abstractions and adding new support for new input devices and operating systems is not part of the desired learning goals that this project was created to support. After experimenting with [GLFW](https://www.glfw.org/) and several other similar abstractions, it was discovered that many of them have limited support outside the major desktop platforms while SDL supports Android and iOS which are two platforms that the project wants to support in the future.

Ultimately the decision is to reimplement SDL.

### Challenges

The only challenge is avoiding a direct re-implementation of the SDL layer that already exists in the ioquake fork. Such an approach would likely result in the same set of weaknesses being present in the new implementation. The only way to achieve this goal is to avoid looking at the ioquake3 implementation until the reimplementation has occurred so that accidental copying of bad habits does not occur.

The integration should also be hidden behind a simple API layer to avoid undesired coupling.

### Solution

...

### Evaluation

...

#### Future Work

In the future, it is expected that other platforms such as iOS, Android, Windows and Linux will be adopted. It is also expected that additional controllers will be supported such as Gamepad.

### References

* [GLFW](https://www.glfw.org/): GLFW is an Open Source, multi-platform library for OpenGL, OpenGL ES and Vulkan development on the desktop. It provides a simple API for creating windows, contexts and surfaces, receiving input and events.
* [SDL](https://www.libsdl.org/): Simple DirectMedia Layer (SDL) is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware via OpenGL and Direct3D.
