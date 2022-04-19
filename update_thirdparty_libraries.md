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
library or library version to upgrade to.


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
    <td><a href="https://opus-codec.org/">opus</a></td>
    <td><code>1.2.1</code></td>
    <td><a href="https://opus-codec.org/">opus</a></td>
    <td><code>1.3.1</code></td>
    <td>Complete</td>
    <td>
        Opus is a open, royalty-free, versatile audio codec. Opus is unmatched for interactive speech and music transmission over the Internet. It is part of the VOIP solution.
    </td>
  </tr>
</tbody>
</table>

### Evaluation
