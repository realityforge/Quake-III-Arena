## Update Third Party Libraries

### Motivation

The product was originally released in 1999 and open sourced in 2005. Since that time, several forks have maintained and
developed the codebase. Third party libraries are used from within the project and many of these third party libraries
are copied into the source tree, patched and periodically updated. However, the work of patching and updating third
party libraries is laborious and rarely as interesting for open source game developers as adding new features.

The most up-to-date fork is (arguably) [ioquake3](https://ioquake3.org/) and many of the third party libraries used by
that fork are out of date and contain known security vulnerabilities. i.e. The `curl` version is `7.54.1` released
on `Jun 14 2017` and has 38 known security problems. (See [Vulnerabilities in curl 7.54.1](https://curl.se/docs/vuln-7.54.1.html)
for further details.) Likewise, the `jpeg` version is `8c` released on `Jan 16 2011` and has several known security
problems.

Several of the third party libraries could no longer be considered "best in class" and either have poor performance or
limited support on modern platforms. Usages of the `jpeg` library should be replaced with the `libjpeg-turbo` library
which is actively developed and maintained and has superior performance due to incorporation of SIMD instructions and
more optimised algorithms.

The integration with libraries is done an an adhoc bases, with some third party libraries having the source code copied
into the project and patched on an adhoc bases. Some third party libraries have had the binaries for the shared library
and/or static library checked into the project for some architectures and some libraries are expected to be installed on
the system ahead of time.

In an ideal world, upgrades of third party libraries with relatively stable APIs is a low-cost event. The libraries
would ideally be compatible with all the platforms that the project targets or intends to target.

### Solution

The first step is to catalog the versions of the libraries used by the project. The next stage is to identify the
library or library version to upgrade to. The final step is to remove the source files or binary artifacts from the project and define an external Bazel repository that is responsible for downloading and compiling the library with appropriate customization for the project.

<table>
<thead>
  <tr valign="top" align="left">
    <th>Current<br>Library</th>
    <th>Current<br>Version</th>
    <th>New<br>Library</th>
    <th>New<br>Version</th>
    <th>Status</th>
    <th>Library Purpose</th>
  </tr>
</thead>
<tbody>
  <tr valign="top">
    <td><a href="https://curl.se/">curl</a></td>
    <td><code>7.54.0</code></td>
    <td><a href="https://curl.se/">curl</a></td>
    <td><code>7.81.0</code></td>
    <td>Complete</td>
    <td>
        A library for transferring data with URLs. It is used to download supporting assets.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://www.ijg.org/files/jpegsr8c.zip">libjpeg</a></td>
    <td><code>8c</code></td>
    <td><a href="https://libjpeg-turbo.org/">libjpeg-turbo</a></td>
    <td><code>2.1.3</code></td>
    <td>Complete</td>
    <td>
        A jpeg image codec. The libjpeg-turbo library is 2-6 times faster when decoding images on platforms where SIMD instructions are available (which is all the current target platforms).
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://xiph.org/ogg/">ogg</a></td>
    <td><code>1.3.3</code></td>
    <td><a href="https://xiph.org/ogg/">ogg</a></td>
    <td><code>1.3.5</code></td>
    <td>Complete</td>
    <td>
        Ogg is a multimedia container format, and the native file and stream format. It encapsulates raw compressed data and allows the interleaving of audio and video data inside a single convenient format. It is part of the VOIP solution.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://openal-soft.org/">openal-soft</a></td>
    <td><code>1.15.1</code></td>
    <td><a href="https://openal-soft.org/">openal-soft</a></td>
    <td><code>1.21.1</code></td>
    <td>Complete</td>
    <td>
        OpenAL is a cross-platform 3D audio API appropriate for use with gaming applications and many other types of audio applications. <a href="https://openal-soft.org/">openal-soft</a> is a software implementation. The current codebase includes the headers from openal but relies on the system to provide the implementation. We can probably continue to do the same but with more modern OpenAL headers.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://opus-codec.org/">opus</a></td>
    <td><code>1.2.1</code></td>
    <td><a href="https://opus-codec.org/">opus</a></td>
    <td><code>1.3.1</code></td>
    <td>Complete</td>
    <td>
        Opus is a open, royalty-free, versatile audio codec. Opus is unmatched for interactive speech and music transmission over the Internet. It is part of the VOIP solution.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://github.com/xiph/opusfile">opusfile</a></td>
    <td><code>0.9</code></td>
    <td><a href="https://github.com/xiph/opusfile">opusfile</a></td>
    <td><code>0.12</code></td>
    <td>Complete</td>
    <td>
        Stand-alone decoder library for .opus streams. It is part of the VOIP solution.
    </td>
  </tr>
  <tr valign="top">
    <td>puff from <a href="https://www.zlib.net/">zlib</a></td>
    <td><code>?</code></td>
    <td>-</td>
    <td>-</td>
    <td>Complete</td>
    <td>
        The puff code was extracted from an (unknown) version of zlib and used as part of the custom png loading code. The third party library `Libspng` has been adopted to load .png assets, the custom png loading code has been removed and thus the puff library has been removed.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://www.libsdl.org/">sdl</a></td>
    <td><code>2.0.0</code> and <code>2.0.16</code></td>
    <td><a href="https://www.libsdl.org/">sdl</a></td>
    <td><code>2.0.20</code></td>
    <td>0%</td>
    <td>
        Simple DirectMedia Layer is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware. It was added after the source was open-sourced and is relatively lightly used. It also is one of the more complex integrations with some platforms historically relying on static libraries, dynamic libraries and headers checked into the project source or provided by the system. The versions of the libraries and headers are not consistent across checked in artifacts. It is unclear what the best strategy is moving forward but improving the mechanisms for managing this library is desirable.
    </td>
  </tr>
  <tr valign="top">
    <td>unzip from <a href="https://www.zlib.net/">zlib</a></td>
    <td><code>?</code></td>
    <td><a href="https://www.zlib.net/">zlib</a></td>
    <td><code>1.2.12</code></td>
    <td>Complete</td>
    <td>
        unzip was extracted and patched from some version of zlib. As the zlib library is included in this project, the build was updated to patch the unzip code from zlib and remove the local unzip.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://xiph.org/vorbis/">vorbis</a></td>
    <td><code>1.3.6</code></td>
    <td><a href="https://xiph.org/vorbis/">vorbis</a></td>
    <td><code>1.3.7</code></td>
    <td>Complete</td>
    <td>
        Ogg Vorbis is a general-purpose compressed audio format for mid to high quality. It is part of the VOIP solution.
    </td>
  </tr>
  <tr valign="top">
    <td><a href="https://www.zlib.net/">zlib</a></td>
    <td><code>1.2.3</code></td>
    <td><a href="https://www.zlib.net/">zlib</a></td>
    <td><code>1.2.12</code></td>
    <td>Complete</td>
    <td>
        zlib is a software library used for data compression. It is used by various modules including curl, png decoding and potentially decoding zip archives used implementing the VFS. In the future it is possible that this will be replaced by <a href="https://github.com/zlib-ng/zlib-ng">zlib-ng</a>.
    </td>
  </tr>
</tbody>
</table>

### Evaluation
