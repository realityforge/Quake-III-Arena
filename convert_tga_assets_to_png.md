## Convert TGA Assets to PNG

### Motivation

The original project supported a subset of [Truevision TGA](https://en.wikipedia.org/wiki/Truevision_TGA) as the format for raster-graphics. The supported subset included 1-bit Grey color space images and 24-bit or 32-bit sRGB colorspace images with optional run length encoding. The images were expanded at load time into RGBA ignoring any gamma setting in the file. The TGA format is an old format and not in wide use outside a limited number of industries.

[Portable Network Graphics](https://en.wikipedia.org/wiki/Portable_Network_Graphics) (or PNG) is a raster-graphics file format that supports lossless data compression. PNG was developed as an improved, non-patented replacement for Graphics Interchange Format (GIF) — unofficially, the initials PNG stood for the recursive acronym "PNG's not GIF". PNG is the second most widely used format on the web with only JPG being more widely deployed. PNG has dramatically smaller file sizes than TGA at the expense of slightly higher computation requirements when loading the images.

This change involves converting the files in TGA format to PNG format and adding support to load PNG files to the engine. As PNG files may be downloaded from untrusted sources, it is imperative that the code for loading the file is resilient and secure. The ioquake3 fork has support for loading PNG files but the preference is to adopt a secure, high-performance third party library and support a wide range of PNG features. Once PNG support has been added to the engine, the support for TGA files can be removed.

It should be noted that the screenshot function currently emits screenshots in the TGA format and should be changed to emit screenshots in the PNG format.

### Challenges

The names of the tga files are directly referenced from other assets or game code. The code that needs to be changes includes code in the renderer and the client game modules for `baseq3` and the `missionpack` games. The assets that will need to be updated include the materials definitions (a.k.a. `*.shader` files), the `*.menu` files (in the `missionpack` game) and the `*.skin` files.

The project must ensure that the load times are not significantly more in any of the target platforms. It is expected that for many of the platforms, the decrease in file size will result in an overall reduction in load time even if it increases the load on the CPU as the load bottleneck is more likely to be IO rather than decoding.

### Solution

### Evaluation
