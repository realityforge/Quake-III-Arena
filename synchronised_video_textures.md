## Synchronised Video Textures

### Motivation

There does not seem to be any mechanism for shared watching of videos in VR that is easy to use. The problem seems to be related to a number of technical challenges as well as business challenges. The platform already supports video textures using the proprietary `.roq` file format. The platform will soon support [asset bundles](asset_bundles.md) that can be downloaded and cached with expiry on clients. VR integration is planned for the future.

There are a limited number of actions that would be required to support video watching in game.:

* The ability to synchronise video position between players. This would likely involve entity that is synchronised across clients.
* The addition of alternative input video formats. This may be via adopting a library such as `FFmpeg` but it is unclear on the performance impact or license compatibility.
* The addition of entities in game to control the playback coordination between players. i.e. Shoot a button to start a video?
* The ability for a player to upload a video as an asset bundle.

It is unclear on the long term usability of this change, but it would be an interesting technical feat that would garner an immediate use.

### Challenges

The `FFmpeg` library is notoriously difficult to get building within Bazel. It is also a significantly large code size with an unknown impact on code size and general performance. Some hardware has dedicated decoding units that should be used when available.

### Solution

...

### Evaluation

...

#### Future Work

...

### References

* [FFmpeg](https://en.wikipedia.org/wiki/FFmpeg)
