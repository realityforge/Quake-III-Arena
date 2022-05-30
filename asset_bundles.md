## Asset Bundles

### Motivation

Within Q3A, the assets are files that are contained within the `*.pk3` files or on the file system in specific "game" directories. The `*.pk3` files are simply zip files with a different extension.

The layout of assets within the directories and the `*.pk3` files is partially done via convention and sometimes these conventions are enforced by application code. For example, the "shader files" **MUST** be contained within the `scripts/` directory in either the `*.pk3` or in the "game" directory. The "shader files" **MUST** be named with an extension `.shader` If the "shader files" do not follow these conventions then they will not be loaded by the runtime. Sometimes these constraints are enforced in game logic code and sometimes by engine code.

"Pure" servers are those who set the cvar `sv_pure` to `1`. In a pure server, the clients and the server must load assets from `*.pk3` files and the set of `*.pk3` files must "match". The "matching" is done using a content hash and thus if a `*.pk3` is modified on a client (by changing a file within it), then the `*.pk3` will no longer match the server file.

Q3A does not explicitly track dependencies between assets. It is up to the developer to track the relationships between assets and ensure that no unused assets are present and that all required assets are present. This has proved problematic and as a result there are numerous "broken" assets and/or unused assets that are shipped with the game.

Examples of inter-asset dependencies:
* A "shader file" may reference one or more textures.
* A "md3 file" references shaders and/or textures.
* A "skin file" references shaders and/or textures as well as named parts within a "md3 file".
* A "menu file" references shaders and/or textures as well as symbol map shared by client side code.
* A "bsp file" references shaders, textures, models, sounds etc.
* The "game logic" references all of the above assets. Some of these references are dynamic references while some are static.

### Challenges

...

### Solution

...

### Evaluation

...
