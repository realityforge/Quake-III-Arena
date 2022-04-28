## Convert TGA Assets to PNG

### Motivation

The original project supported a subset of [Truevision TGA](https://en.wikipedia.org/wiki/Truevision_TGA) as the format for raster-graphics. The supported subset included 1-bit Grey color space images and 24-bit or 32-bit sRGB colorspace images with optional run length encoding. The images were expanded at load time into RGBA ignoring any gamma setting in the file. The TGA format is an old format and not in wide use outside a limited number of industries.

[Portable Network Graphics](https://en.wikipedia.org/wiki/Portable_Network_Graphics) (or PNG) is a raster-graphics file format that supports lossless data compression. PNG was developed as an improved, non-patented replacement for Graphics Interchange Format (GIF) — unofficially, the initials PNG stood for the recursive acronym "PNG's not GIF". PNG is the second most widely used format on the web with only JPG being more widely deployed. PNG has dramatically smaller file sizes than TGA at the expense of slightly higher computation requirements when loading the images.

This change involves converting the files in TGA format to PNG format and adding support to load PNG files to the engine. As PNG files may be downloaded from untrusted sources, it is imperative that the code for loading the file is resilient and secure. The ioquake3 fork has builtin support for loading PNG files but the preference is to adopt a secure, high-performance third party library and support a wide range of PNG features. Once PNG support has been added to the engine, the support for TGA files can be removed.

It should be noted that the screenshot function currently emits screenshots in the TGA format and should be changed to emit screenshots in the PNG format.

At this stage it is expected that the load process will continue to convert the pixel data into a 32-bit RGBA format but longer term the renderer could be modified to support other image formats.

### Challenges

The names of the tga files are directly referenced from other assets or game code. These references need to be updated. The code that needs to be changed includes code in the renderer and the client game modules for `baseq3` and the `missionpack` games. The assets that will need to be updated include the material definitions (a.k.a. `*.shader` files), the `*.menu` files (in the `missionpack` game) and the `*.skin` files. There is also material references from within the `*.md3` files but these are not as easy to update without writing a converter for the `.md3` file format. Rather than writing a converter a simpler and easier to implement solution would be to redirect requests for images ending in `*.tga` to an image ending with the extension `.png`.

The project must ensure that the load times are not significantly more in any of the target platforms. It is expected that for many of the platforms, the decrease in file size will result in an overall reduction in load time even if it increases the load on the CPU as the load bottleneck is more likely to be IO rather than decoding.

### Solution

#### Analysis

The first step was to analyze the usage of the TGA format within the game, the missionpack and popular mods. The analysis was done using the identify sub-command of [imagemagick](https://www.imagemagick.org/). The majority of TGA files used a ColorSpace of sRGB with a bit depth per component of 8 and include an alpha component. The analysis determined the following exceptions:

* In `missionpack/pak0.pk3` the `textures/skies2/clouds2.tga`, `textures/skies2/clouds.tga` and `models/flag/pole.tga` files used a ColorSpace of `Gray`
* 8 files in `missionpack/pak0.pk3` and 5 files in `baseq3/pak0.pk3` used a bit depth of 1. These are:
  * In `baseq3/pak0.pk3`:
    * `menu/art/opponents_selected.tga`
    * `models/players/orbb/orbb_light.tga`
    * `textures/common/mirror1.tga`
    * `models/players/uriel/null.tga`
    * `models/players/sarge/null.tga`
  * In `missionpack/pak0.pk3`:
    * `ui/assets/redchip.tga`
    * `ui/assets/red_box.tga`
    * `textures/skies/blacksky.tga`
    * `textures/sfx/launchpad_arrow2.tga`
    * `textures/sfx/compscreen/letters5.tga`
    * `models/players/fritzkrieg/beam.tga`
    * `ui/assets/statusbar/team_leader.tga`
    * `gfx/colors/black.tga`
* Many files within the `missionpack/pak0.pk3` or community addons did not include the alpha component.

#### Engine Enhancement

Several alternatives exist for reading and writing PNG files. The alternatives assessed include:

* [libpng](http://www.libpng.org/): "the free reference library for reading and writing PNGs"
* [libspng](https://libspng.org/): This library has a focus on security, speed and ease of use when compared to libpng.
* [wuffs](https://github.com/google/wuffs): Wrangling Untrusted File Formats Safely.

Wuffs is a memory-safe programming language for wrangling untrusted file formats safely. The standard library includes parsing, decoding and encoding for file formats such as images, audio, video, fonts and compressed archives. It outputs normal c code and is very fast, very small and very safe. It is often a third of the size of equivalent functionality and can be 2-7 times faster. It could potentially be used to replace several parts of the project including the zlib, libjpeg, png, etc. support code. Wuff was not selected as it is a "beta" project that is subject to API changes and lacks adequate documentation. Once Wuffs has been released in non-beta version, this decision should be re-assessed.

Libpng is the broadly used reference library and has a comprehensive reference manual. It also has an extremely complex API and a history of security vulnerabilities. Despite these limitations, the initial implementation used libpng but it was later rejected due to the significant complexity associated with the implementation.

Libspng was selected as it has a simple API, is substantially smaller and faster than libpng and was built with a focus on security. This includes following secure coding standards, having a comprehensive test suite and fuzz testing aand static analysis.

#### Asset Conversion

The actual conversion of assets from TGA to PNG is done as part of the Bazel build process using the [imagemagick](https://www.imagemagick.org/) tool. A macro was created that converts the TGA to a PNG, runs [pngcrush](https://pmt.sourceforge.io/pngcrush/) on the PNG and then verifies that the pixels produced by the TGA and the pngcrush-ed PNG are identical.

Running pngcrush on an image takes a substantial amount of time, so it is imerative that the Bazel rules be developed in such a way that the inputs and outputs are easy to cache and thus there should rarely be a need to re-process and pngcrush the PNGs once the cache is established.

### Evaluation

The conversion of the TGA images to PNG and subsequent pngcrush process reduced the size of the image assets required by the game without impacting image quality or negatively impacting load times. The project repacks the assets for the `baseq3` game and the `missionpack` game. The assets repackaged for the `baseq3` game included the assets from the original `baseq3` game, the `QuakeArenaArcade` mod (which contains the assets from the Xbox Live Arcade port) and the `High Quality Quake` mod. The assets repackaged for the `missionpack` game included the assets from the original `missionpack` game and the `QuakeArenaArcade` mod.

The size of the lossless images in the `baseq3` game changed from 211M to 51M. The PNG assets are approximately 24% of the size of the TGA assets. In the `missionpack` game the PNG images were 38% the size of the TGA assets with the size reduced from 211M to 81M.

The impact on load time was not as easy to determine but the load time seemed to be reduced in the limited number of cases investigated. The hypothesis that this will be true on platforms where I/O devices are slow relative to processors.
