Welcome to one of the numerous Quake III Arena Source code repository forks! This is (probably) not the repository you are looking for! This repository began as a fork of Quake3Arena and exists as a mechanism for self education and having fun. The idea is to evolve the project while keeping some degree of compatibility with the original media as an excuse to develop new skills etc.

In the past the author completed most of a PhD around network infrastructure for games and simulations before switching topics. This project is intended to be a platform to experiment with new ideas that have been bubbling around in his mind since then.

This page exists purely as a mechanism for the author to document plans and track their own progress over time. The Quake III Arena source code can be considered a relatively large, legacy codebase and the author had limited knowledge about the product before commencing work. If there is a useful product that comes out of this work then this set of documents will provide insight in what it takes to pick up and evolve a legacy product.

## Change Log

The major changes of the project are tracked in this table.

<table>
  <thead>
    <tr valign="top">
      <th>Change</th>
      <th>Cost<br>(1-10)</th>
      <th>Benefit<br>(1-10)</th>
      <th>Game Impact<br>(0-10)</th>
      <th>Status</th>
      <th>Started<br>On</th>
      <th>Completed<br>On</th>
    </tr>
  </thead>
  <tbody>
    <tr valign="top">
      <td><a href="update_thirdparty_libraries.html">Update Third Party Libraries</a></td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>80%</td>
      <td>2022-04-18</td>
      <td>&nbsp;</td>
    </tr>
    <tr valign="top">
      <td><a href="automate_source_code_formatting.html">Automate Source Code Formatting</a></td>
      <td>1</td>
      <td>3</td>
      <td>0</td>
      <td>Complete</td>
      <td>2022-04-10</td>
      <td>2022-04-13</td>
    </tr>
    <tr valign="top">
      <td><a href="improve_build_automation.html#phase_1">Improve Build Automation - Phase 1</a></td>
      <td>4</td>
      <td>8</td>
      <td>0</td>
      <td>Complete</td>
      <td>2022-03-01</td>
      <td>2022-05-27</td>
    </tr>
    <tr valign="top">
      <td><a href="convert_tga_assets_to_png.html">Convert TGA Assets to PNG</a></td>
      <td>2</td>
      <td>2</td>
      <td>0</td>
      <td>Complete</td>
      <td>2022-04-24</td>
      <td>2022-05-03</td>
    </tr>
    <tr valign="top">
      <td><a href="modernize_codebase.html">Modernize Codebase</a></td>
      <td>5</td>
      <td>3</td>
      <td>0</td>
      <td>Ongoing</td>
      <td>N/A</td>
      <td>N/A</td>
    </tr>
    <tr valign="top">
      <td><a href="cleanup_opengl_wrapper.html">Cleanup OpenGL Wrapper code</a></td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>Complete</td>
      <td>2022-05-16</td>
      <td>2022-05-19</td>
    </tr>
    <tr valign="top">
      <td><a href="materials_uplift.html">Materials Uplift</a></td>
      <td>3</td>
      <td>2</td>
      <td>0</td>
      <td>Complete</td>
      <td>2022-05-20</td>
      <td>2022-06-14</td>
    </tr>
  </tbody>
</table>

These changes have not been started but are things that the project is considering doing.

<table>
  <thead>
    <tr valign="top">
      <th>Proposed Change</th>
      <th>Status</th>
      <th>Description</th>
      <th>Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr valign="top">
      <td><a href="asset_bundles.html">Asset Bundles</a></td>
      <td>Ideation</td>
      <td>Develop a more robust asset bundle format.</td>
      <td>Depends upon a custom VFS which has not been specified.</td>
    </tr>
    <tr valign="top">
      <td><a href="settings.html">Settings</a></td>
      <td>Ideation</td>
      <td>Rebuild "cvars" as "settings".</td>
      <td>Not yet ready for implementation as it impacts a log of code and should only be attempted once the decision has been made to base development of the initial codebase or the ioq3 fork.</td>
    </tr>
    <tr valign="top">
      <td><a href="wasm.html">Wasm</a></td>
      <td>Prototyping</td>
      <td>Convert VM code to use Wasm instruction architecture and runtime.</td>
      <td>Substantial experimentation required.</td>
    </tr>
    <tr valign="top">
      <td><a href="engine_api.html">Engine Remote API</a></td>
      <td>Ideation</td>
      <td>Expose the engine state for control and observation.</td>
      <td>Experimentation and prototyping required.</td>
    </tr>
  </tbody>
</table>

## References

A set of notes and references that were collected to help work on this project:

* [idTech](idTech/)