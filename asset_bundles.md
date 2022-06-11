## Asset Bundles

### Motivation

Within Q3A, the assets are files that are contained within the `*.pk3` files or on the file system in specific "game" directories. The `*.pk3` files are simply zip files with a different extension.

The layout of assets within the directories and the `*.pk3` files is primarily done by convention and sometimes these conventions are enforced by code. Sometimes these constraints are enforced in game logic code and sometimes by engine code.

For example, the "shader files" **MUST** be contained within the `scripts/` directory in either the `*.pk3` or in the "game" directory. The "shader files" **MUST** be named with an extension `.shader` If the "shader files" do not follow these conventions then they will not be loaded by the runtime.

"Pure" servers are those who set the cvar `sv_pure` to `1`. In a pure server, the clients and the server must load assets from `*.pk3` files and the set of `*.pk3` files must "match". The "matching" is done using a content hash and thus if a `*.pk3` is modified on a client (by changing a file within it), then the `*.pk3` will no longer match the server file.

Q3A does not explicitly track dependencies between assets. It is up to the developer to track the relationships between assets and ensure that unused assets are omitted and that all required assets are present. This has proved problematic and as a result there are numerous "broken" assets and/or unused assets that are shipped with the game.

Examples of inter-asset dependencies:
* A "shader file" may reference one or more textures.
* A "md3 file" references shaders and/or textures.
* A "skin file" references shaders and/or textures as well as named parts within a "md3 file".
* A "menu file" references shaders and/or textures as well as symbol map shared by client side code.
* A "bsp file" references shaders, textures, models, sounds etc.
* The "game logic" references all of the above assets. Some of these references are dynamic references while some are static.

Q3A has the capability to download `*.pk3` files when the client is connecting to a server and both the client and server are configured to enable downloads. This makes it possible for a server to distribute maps and models incrementally, on-demand. The end-user can also download these assets using independent means and place the `*.pk3` files in the correct game directory.

#### The "Ideal" Asset Bundle

In an ideal system an asset bundle would be able to declare that all asset references are resolvable statically at build time rather than deferring detection of missing references until runtime. This would reduce the amount of QA processes that would need to be dedicated to ensuring that assets are valid.

This is a problem that is present in other component oriented architectures. Such systems have solved this problem using a number of strategies. Strategies that would be effective within the context of a game engine include:

* Each asset bundle consists of an identifier that may incorporate a name and/or a version specifier.
* Each asset bundle declares the set of assets that are "provided" by the asset bundle and are thus available to reference from other asset bundles.
* Each asset bundle declares the set of assets that are "consumed" by the asset bundle and are expected to be provided by other asset bundles.
* Each asset bundle may declare the identifier of another asset bundle that the asset bundle depends upon.

Tooling could then be developed that analyzed each asset and ensured that every asset within the bundle as all references either present in the bundle, declared as "consumed" by the asset bundle. The tooling could also analyze the dependencies between assets so that they can be packaged into asset bundles that group assets in a way that meets the developer requirements. The developer may prioritize small, self-contained asset bundles that are fast to download on demand or may prioritize a large asset bundle that is part of the initial installation with small asset bundles for optional content that may retrieved at a later stage by a small number of users.

Bundles could be signed by the distributing party to make it possible to determine the providence of the asset bundle and to verify it has not been modified by third parties. This would make it possible for clients to trust bundles signed by certain parties and not trust bundles signed by other parties.

#### Asset Identity

In Q3A, assets are identified by their file name. An asset can be "replaced" by creating an asset with the same name that appears later in the load path.

This results in the following constraints:

* It is impossible to know which asset will be loaded when a particular name is requested without reconstructing the virtual file system logic.
* It is impossible to update an asset without updating all references to the asset. Consider the scenario where a map/scene was created using the texture `textures/base/water` and then the texture `textures/base/water` is updated. Should the map use the "new" `textures/base/water` texture or the "old" `textures/base/water` texture? (And what if this texture was used as part of baked in lighting processes?) Stated another way, is the reference to the texture static (and fixed at build time) or dynamic (and resolved at runtime). Depending on the reference and the scenario, static or dynamic references could be the "correct" answer.
* It is impossible to have multiple assets with the same name. So if independent parties use the same names then these assets can not be loaded at the same time.

An alternative solution that is present in systems that need to guarantee integrity of references is to derive the identity of the asset using a content hash. This approach is used in source control systems like Git and "cryptocurrency" platforms. So while the texture `textures/base/water` may be referenced by name during the build process, when it is placed in a bundle the name or identity is `7dc48cd3a038568e100fdad842ee6d40fbee56bc` (the content hash of the file which in this case uses the SHA-256 algorithm) and all references to the file are placed with this identifier.

The bundle may optionally have a manifest file that maps the logical name `textures/base/water` to the hash. (This is a very simplified version of how directories are stored in GIT). The manifest itself would also be another "asset" with its identity specified by a content hash.

The advantage of this approach is that asset references that should be statically resolved at build time can use a content hash while references that are dynamically resolved at run time can use the names in the manifest to retrieve the content hash.

The [Merkle tree](https://en.wikipedia.org/wiki/Merkle_tree) is a tree structure where internal nodes are just a list of child nodes and all nodes are identified by a content hash. A map/scene asset could be represented as a merkle tree. When a new version of the map asset is created then it would be possible for both versions to be present on the client and all the unchanged data would be shared between the versions (as the content has would be identical) and it would be possible for the client to play both versions of the map. (This is a common request in some gaming communities. In the HyperDash community, it is not un-common to hear a request to bring back an older version of a map. This may be for nostalgia reasons or because users want to compare and contrast the "new" and "old" version of a map.)

#### Asset Variants

It is common for a single asset to have multiple variants depending on the host platform and/or user configuration. Potential variants of an asset may be:

* High-definition versus normal textures.
* S3TC/ETC/ASTC/PVRTC/Basis compressed textures versus uncompressed textures.
* High detail versus low detail models.
* High bitrate versus low bitrate sounds.
* Language files (French versus Italian versus Japanese translations)

An asset bundle should be able to declare which variants are available for a particular asset. i.e. There should be an explicit indication that the `textures/base/water` texture has the variants `textures/base/water.png` (base image data), `textures/base/water.tga` (raw uncompressed image data), `textures/base/water.ktx` (ASTC compressed image data in .ktx container) etc.

#### Fast Build Pipeline

The building of the asset bundle should be **fast** and optional. Content developers should be able to make changes fast, in a directory, without having to package assets into a bundle. When a bundle is required then the build process should be fast and incremental. (This capability may be provided by Bazel). Bundle signing should be optional for local development. The build system should be responsible for generating the manifest, as well as the consumes and provides directives with minimal input from the content creator.

#### Asset and Bundle Meta Data

The asset bundle can potentially be augmented with metadata about both the assets and the bundle itself. Some metadata could be required by the runtime while other metadata may be optional and/or only used by content creators. The metadata data (or extended attributes) would be stored separate from the asset itself and maybe in a separate manifest file.

The asset-specific metadata that is likely required at runtime:
* content hash (i.e. `7dc48cd3a038568e100fdad842ee6d40fbee56bc`)
* content type (i.e. `image/jpg`, `image/png`, `image/ktx2`, `sound/x-wav`, `model/bsp31`, `shader` etc.)
* name if the asset is "published". (i.e. `maps/dm01.bsp`)
* asset metrics (poly count / render cost). This is useful so that the user or application can choose to have "low quality" versus "high quality" assets based on their hardware capabilities.

The asset-specific metadata that may be required on download:
* signature and signer to verify providence of asset or asset bundle.
* It may be that an asset bundle has multiple signatures and one may be from the original assemblers while others indicate the registry that distributed the bundle. (Potentially clients could restrict asset bundles to those loaded from particular locations)

The asset-specific metadata that is likely required by creators:
* license (i.e. `CC` versus `Properietry`). License metadata can be on both the individual asset and the asset bundle and may impact capabilities like the ability to download the asset from a server.
* build-time directives (i.e. "shader" files include a lot of information that is only relevant when creating new content or loading into editors)
* the raw "un-compiled asset". Most file formats are derived from another format and then are exported. In some cases this format may be useful to distribute to support creators.
* A link to the registry that distributes the asset bundle. It may also indicate a mechanism by which a server can determine whether a user has a license for a particular bundle.
* A link to a website (potentially restricted to the registry) that describes or reviews the asset. This could be a developer owned variant of lvlworld.

If the "non-runtime" specific asset data ever grows "too" large then it could be split into a separate asset bundle that depends on the runtime bundle.

### Challenges

...
* Probably requires a rebuild and/or rethinking of the VFS layer. Possibly the VFS mounts bundles as paths ala `/bundles/cbfb2dae51f384fc4dffe1965966fa562f9a51b0/...` and assets under the content hash ala `/assets/7dc48cd3a038568e100fdad842ee6d40fbee56bc` and then uses the equivalent of symlinks into `/maps/foo.bsp` for "published" resources. Then at least the rest of the game logic would not need to change, just the filesystem layer would need to detect references that use hash format and load assets from appropriate location. Consider adopting an existing filesystem layer or writing our own that takes inspiration from [physfs](https://icculus.org/physfs/) and the existing VFS layer.
* Requires a substantial rethinking about how assets are processed for packaging into the engine.
...

### Solution

...

The design of the solution will likely evolve over time, but it is expected that the design will fit the following parameters:

* Assets identified by a content hash.
* Assets can have references to other assets determined statically at build time or dynamically at runtime.
* An asset bundle includes a manifest that maps logical names to content hash.
* Asset variants explicitly identified, potentially in the manifest.
* An asset bundle is identified by a content hash.
* An asset bundle can declare a static dependency on another asset bundle by content hash.
* An asset bundle must declare which assets it "publishes" so that other asset bundles can reference these assets. The "publish" directive must include the supported variants, the logical name and the type of the asset.
* An asset bundle must declare which assets it "consumes" or can dynamically reference. The engine is responsible for ensuring the references are resolvable at runtime. These references use the name label.
* An asset bundle may declare that it dynamically consumes assets using a name pattern.
* Static inter-asset references MUST be statically resolvable within the bundle, or its static dependencies.
* The asset bundle MUST NOT declare that it "consumes" an asset reference if the referenced asset is present in the asset bundle or the reference is a static reference.
* An asset bundle should be signed by the distributor to ensure providence of the artifact has been maintained, and it has not been modified by third parties.

...

### Evaluation

...

### References

* [GitBOM: Enabling Universal Artifact Traceability In Software Supply Chains](https://gitbom.dev/resources/whitepaper/): This article describes an architecture that is largely consistent with the proposed solution. It proposes representing build artifact dependency graphs using a merkle tree with a flat-file storage format and the generation of such graphs at build time. This would enable the creation of verifiable and complete artifact dependency graphs with the goal of tracing artifacts to support vulnerability databases and similar tooling.
