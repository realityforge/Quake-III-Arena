## Settings

### Motivation

Settings in id Tech are typically stored as a key-value pair in a `cvar` or `"Console Variable"`. The key is typically defined by a specific subsystem in the application but may also be user defined. The value may be set at application startup, in code or by the user and may persist over application sessions. The cvars may control behaviour of the application or may be data published by the application and effectively read-only. Some are considered "cheats" or developer-only features while some are designed to support player preferences.

CVars are central to the application but have evolved over time and do not have a comprehensive test suite. CVars within the VMs (i.e. the client game, the client ui and the server game) must have a different design pattern given that the representations are in separate memory spaces.

The goal of this change is to create a ground-up rewrite of cvars, adding tests and incorporating features from the original Q3A release, the ioq3 fork, other Q3A forks and subsequent id Tech releases. The rewrite is intended to initiate the process of learning to write tests for C code as well as provide a solid base for incorporating into other projects.

The features that the new settings system must support:

#### Developer-Only

Some settings are used by developers to give the player special capabilities or items which are useful during play testing but are considered cheating when playing against other players or even single player. In the original q3a release they are flagged as `CVAR_CHEAT` and may only be changed by the user when using `devmap` command to start a level rather than `map`.

The idea that certain settings can only be modified when the player is in developer mode should be carried over to the new system.

#### Cheats

Some settings may be available to users to give the player special capabilities or advance the player to later levels. These are not available when playing multiplayer but may be used in single player. Usage in single player is still considered "cheating" but some players may consider usage acceptable. In the original Q3A source code this was conflated with developer-only features and modelled flagged as `CVAR_CHEAT` whereas the new code is expected to tease aparat these two use cases.

#### Application defined or user defined

Some settings are defined by the application or one of the subsystems within the application while some settings are defined by the user. The user settings were used to provide state during user "scripting" scenarios which may not be a feature that will be retained. If user scripting is to be supported, there must be a mechanism for distinguishing between user defined settings and system defined settings.

#### Setting schemas and allowed values

Settings should provide a schema for allowed values. The schema may identify types using rules such as; "an integer between 1 and 4", "a decimal above 0.5", "one of 'a', 'b' or 'c'" etc. There may also be a "dynamic" component for type checking that is performed at runtime where the user specifies a function to verify the value. A typical scenario where this may be used is that the "user_model" setting should indicate a valid model name. If a value does not match the schema then the library can either call a developer-supplied function to "correct" the setting.

The developer-supplied function is useful in several settings; including when the meaning or schema of the setting has changed. So an application update could lead to changes in settings.

The new codebase should also support locking particular setting "namespaces" to particular subsystems. So settings that start with `"r_"` could be restricted to the renderer subsystem. If backward compatibility is not required, then `"renderer."` prefix could be used for renderer settings to improve clarity.

The schema should also indicate the display string used when presenting the setting to the user, the type of UI control that should be used when allowing the user to edit the setting, the help message presented to the user to describe the use of the variable.

The schema may also define the default value if not otherwise specified.

#### Value Auto-completion

There are scenarios where a user may wish to autocomplete the name of a setting but this is typically handled by the console directly as it can list settings with a particular prefix. However, there are other scenarios where a user may want to autocomplete setting values.

#### Write-protection

Some settings can be set on the command line at application startup but not later. Some settings are set by the application and may never be changed. Some are set by the application and can be changed by the application when the application changes state (i.e. `s_muted` is set by the application to indicate when sound is muted, `mapname` is set to the name of the current level). Some settings may be set by the user but only if `"cheats"` mode is enabled or `"developer"` mode is enabled. These scenarios all used to indicate different scenarios under which writes are protected or allowed.

#### Persistence

Settings may be persisted between application sessions or across different sessions of the owning "subsystem". The location in which the settings are persisted may also vary by setting. i.e. One setting may be stored with the "player" configuration file while another setting may be stored in a per-game location.

#### Latched Values

Settings can sometimes be "latched" which means that users can modify the value of the setting but the effect of the latched value will not be applied until a later transition point. i.e. The renderer may only re-read the settings the next time the renderer is initialized. So the user may be able to update `r_drawX` several times, but it is not until the next time that the renderer restarts (or the level changes) that the settings are applied.

In this scenario the user may be able to see that the setting has been changed and not applied. This may be implemented by having two separate setting entity for latched variables and during the transition action the values are copied from one setting entity to the latched setting. (In this scenario we would also need to make it possible to hide the "duplicate" setting).

#### *INFO Settings

Some settings that are defined by a client are replicated to the server (a.k.a. `CVAR_USERINFO`), some settings that are defined by the server are replicated to all clients (a.k.a. `CVAR_SYSTEMINFO`) and some settings that are defined by the server are returned to server browsers (a.k.a. `CVAR_SERVERINFO`).

#### Separate runtime state and metadata

The `cvar_s` struct is populated with data that is accessed and potentially modified with high frequency. Some other state such as autocomplete functions, help descriptions, display strings etc. is accessed infrequently (if at all) during a play session. This should be separated into two separate arrays of structures, one containing runtime data and one containing supporting metadata. Static data that is infrequently accessed (i.e. display strings, help strings, ui controls etc.) coul dbe moved into a completely different array to avoid cache pollution in typical usage patterns.,

#### Define Settings using an external DSL

In Q3A, the cvars tend to be defined in multiple places, using multiple strategies. The engine typically has a single file that declares the `cvar_t*` which may or may not be `static` scoped and if not `static` scoped then will also have one (or more headers) that declare the `extern cvar_t*`. Then the module that initializes the cvar is will have a line that allocates and assigns the cvar resource. If the cvar is accessed from a VM (i.e. cgame, game or ui VMs) then there will be a separate code within those vms to retrieve the cvar and potentially define the cvar. This results in a **lot** of boilerplate code.

A vastly better approach would be to define the setting using an external DSL. Tooling could then process the definition and generate the required boilerplate. Each "subsystem" should define the set of settings that are used by the subsystem.

The artifacts that are generated from the DSL may include:
* A `.c` implementation file that initializes the settings.
* A separate `.h` interface file for each "public" setting that declares the handle for cvar as well as inlinable functions to access the value in a type safe way.
* A `.h` interface file that includes all the `.h` interface files for public settings.
* A `.h` interface file for inclusion in VMs that mirrors the functionality of the engine header.

### Challenges

...

### Solution

...

### Evaluation

...

### References

* Q3A [cvar.c](https://github.com/id-Software/Quake-III-Arena/blob/master/code/qcommon/cvar.c): Original CVar code from Q3A.
* Doom 3 [CVarSystem.h](https://github.com/id-Software/DOOM-3-BFG/blob/master/neo/framework/CVarSystem.h): Cvar code from next id Tech engine.
* Quake2Game [cvardefs.h](https://github.com/Slartibarty/Quake2Game/blob/master/common/cvardefs.h): Rewritten Q2 cvar code with some additional capabilities. In particular the idea of `STATIC` cvars are an interesting feature as is the way of defining cvar change callbacks.
* QFusion [q_cvar.h](https://github.com/Qfusion/qfusion/blob/master/source/gameshared/q_cvar.h): Another rewrite of cvars that also includes the concept of different latches and differentiates between `NOSET` and `READONLY` cvars as well as between `DEVELOPER` and `CHEAT` cvars.
