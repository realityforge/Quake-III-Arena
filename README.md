## New cvars

```
  cl_autoRecordDemo                 - record a new demo on each map change
  cl_aviFrameRate                   - the framerate to use when capturing video
  cl_aviMotionJpeg                  - use the mjpeg codec when capturing video
  cl_consoleKeys                    - space delimited list of key names or
                                      characters that toggle the console
  cl_mouseAccelStyle                - Set to 1 for QuakeLive mouse acceleration
                                      behaviour, 0 for standard q3
  cl_mouseAccelOffset               - Tuning the acceleration curve, see below

  con_autochat                      - Set to 0 to disable sending console input
                                      text as chat when there is not a slash
                                      at the beginning
  con_autoclear                     - Set to 0 to disable clearing console
                                      input text when console is closed

  in_joystickUseAnalog              - Do not translate joystick axis events
                                      to keyboard commands

  j_forward                         - Joystick analogue to m_forward,
                                      for forward movement speed/direction.
  j_side                            - Joystick analogue to m_side,
                                      for side movement speed/direction.
  j_up                              - Joystick up movement speed/direction.
  j_pitch                           - Joystick analogue to m_pitch,
                                      for pitch rotation speed/direction.
  j_yaw                             - Joystick analogue to m_yaw,
                                      for yaw rotation speed/direction.
  j_forward_axis                    - Selects which joystick axis
                                      controls forward/back.
  j_side_axis                       - Selects which joystick axis
                                      controls left/right.
  j_up_axis                         - Selects which joystick axis
                                      controls up/down.
  j_pitch_axis                      - Selects which joystick axis
                                      controls pitch.
  j_yaw_axis                        - Selects which joystick axis
                                      controls yaw.

  s_useOpenAL                       - use the OpenAL sound backend if available
  s_alPrecache                      - cache OpenAL sounds before use
  s_alGain                          - the value of AL_GAIN for each source
  s_alSources                       - the total number of sources (memory) to
                                      allocate
  s_alDopplerFactor                 - the value passed to alDopplerFactor
  s_alDopplerSpeed                  - the value passed to alDopplerVelocity
  s_alMinDistance                   - the value of AL_REFERENCE_DISTANCE for
                                      each source
  s_alMaxDistance                   - the maximum distance before sounds start
                                      to become inaudible.
  s_alRolloff                       - the value of AL_ROLLOFF_FACTOR for each
                                      source
  s_alGraceDistance                 - after having passed MaxDistance, length
                                      until sounds are completely inaudible
  s_alDriver                        - which OpenAL library to use
  s_alDevice                        - which OpenAL device to use
  s_alAvailableDevices              - list of available OpenAL devices
  s_alInputDevice                   - which OpenAL input device to use
  s_alAvailableInputDevices         - list of available OpenAL input devices
  s_sdlBits                         - SDL bit resolution
  s_sdlSpeed                        - SDL sample rate
  s_sdlChannels                     - SDL number of channels
  s_sdlDevSamps                     - SDL DMA buffer size override
  s_sdlMixSamps                     - SDL mix buffer size override
  s_backend                         - read only, indicates the current sound
                                      backend
  s_muteWhenMinimized               - mute sound when minimized
  s_muteWhenUnfocused               - mute sound when window is unfocused
  sv_dlRate                         - bandwidth allotted to PK3 file downloads
                                      via UDP, in kbyte/s

  com_ansiColor                     - enable use of ANSI escape codes in the tty
  com_basegame                      - Use a different base than baseq3. If no
                                      original Quake3 or TeamArena pak files
                                      are found, this will enable running in
                                      standalone mode
  com_homepath                      - Specify name that is to be appended to the
                                      home path
  com_maxfpsUnfocused               - Maximum frames per second when unfocused
  com_maxfpsMinimized               - Maximum frames per second when minimized
  com_busyWait                      - Will use a busy loop to wait for rendering
                                      next frame when set to non-zero value
  com_gamename                      - Gamename sent to master server in
                                      getservers[Ext] query and infoResponse
                                      "gamename" infostring value. Also used
                                      for filtering local network games.
  in_joystickNo                     - select which joystick to use
  in_availableJoysticks             - list of available Joysticks
  in_keyboardDebug                  - print keyboard debug info

  sv_dlURL                          - the base of the HTTP or FTP site that
                                      holds custom pk3 files for your server

  net_ip6                           - IPv6 address to bind to
  net_port6                         - port to bind to using the ipv6 address
  net_enabled                       - enable networking, bitmask. Add up
                                      number for option to enable it:
                                      enable ipv4 networking:    1
                                      enable ipv6 networking:    2
                                      prioritise ipv6 over ipv4: 4
                                      disable multicast support: 8
  net_mcast6addr                    - multicast address to use for scanning for
                                      ipv6 servers on the local network
  net_mcastiface                    - outgoing interface to use for scan

  r_allowResize                     - make window resizable
  r_ext_texture_filter_anisotropic  - anisotropic texture filtering
  r_zProj                           - distance of observer camera to projection
                                      plane in quake3 standard units
  r_greyscale                       - desaturate textures, useful for anaglyph,
                                      supports values in the range of 0 to 1
  r_stereoEnabled                   - enable stereo rendering for techniques
                                      like shutter glasses (untested)
  r_anaglyphMode                    - Enable rendering of anaglyph images
                                      red-cyan glasses:    1
                                      red-blue:            2
                                      red-green:           3
                                      green-magenta:       4
                                      To swap the colors for left and right eye
                                      just add 4 to the value for the wanted
                                      color combination. For red-blue and
                                      red-green you probably want to enable
                                      r_greyscale
  r_stereoSeparation                - Control eye separation. Resulting
                                      separation is r_zProj divided by this
                                      value in quake3 standard units.
                                      See also
                                      http://wiki.ioquake3.org/Stereo_Rendering
                                      for more information
  r_marksOnTriangleMeshes           - Support impact marks on md3 models, MOD
                                      developers should increase the mark
                                      triangle limits in cg_marks.c if they
                                      intend to use this.
  r_noborder                        - Remove window decoration from window
                                      managers, like borders and titlebar.
  r_screenshotJpegQuality           - Controls quality of jpeg screenshots
                                      captured using screenshotJPEG
  r_aviMotionJpegQuality            - Controls quality of video capture when
                                      cl_aviMotionJpeg is enabled
  r_mode -2                         - This new video mode automatically uses the
                                      desktop resolution.
```

## New commands

```
  video [filename]        - start video capture (use with demo command)
  stopvideo               - stop video capture
  stopmusic               - stop background music
  minimize                - Minimize the game and show desktop
  togglemenu              - causes escape key event for opening/closing menu, or
                            going to a previous menu. works in binds, even in UI

  print                   - print out the contents of a cvar
  unset                   - unset a user created cvar

  net_restart             - restart network subsystem to change latched settings
  game_restart <fs_game>  - Switch to another mod

  which <filename/path>   - print out the path on disk to a loaded item

  execq <filename>        - quiet exec command, doesn't print "execing file.cfg"

  kicknum <client number> - kick a client by number, same as clientkick command
  kickall                 - kick all clients, similar to "kick all" (but kicks
                            everyone even if someone is named "all")
  kickbots                - kick all bots, similar to "kick allbots" (but kicks
                            all bots even if someone is named "allbots")

  tell <client num> <msg> - send message to a single client (new to server)

  cvar_modified [filter]  - list modified cvars, can filter results (such as "r*"
                            for renderer cvars) like cvarlist which lists all cvars

  addbot random           - the bot name "random" now selects a random bot
```


# README for Developers

## pk3dir

ioquake3 has a useful new feature for mappers. Paths in a game directory with
the extension ".pk3dir" are treated like pk3 files. This means you can keep
all files specific to your map in one directory tree and easily zip this
folder for distribution.

## Creating standalone games

Have you finished the daunting task of removing all dependencies on the Q3
game data? You probably now want to give your users the opportunity to play
the game without owning a copy of Q3, which consequently means removing cd-key
and authentication server checks. In addition to being a straightforward Q3
client, ioquake3 also purports to be a reliable and stable code base on which
to base your game project.

However, before you start compiling your own version of ioquake3, you have to
ask yourself: Have we changed or will we need to change anything of importance
in the engine?

If your answer to this question is "no", it probably makes no sense to build
your own binaries. Instead, you can just use the pre-built binaries on the
website. Just make sure the game is called with:

    +set com_basegame <yournewbase>

in any links/scripts you install for your users to start the game. The
binary must not detect any original quake3 game pak files.

If you want the engine to use a different directory in your homepath than
e.g. "Quake3" on Windows or ".q3a" on Linux, then set a new name at startup
by adding

    +set com_homepath <homedirname>

to the command line. You can also control which game name to use when talking
to the master server:

    +set com_gamename <gamename>

So clients requesting a server list will only receive servers that have a
matching game name.

Example line:

    +set com_basegame basefoo +set com_homepath .foo
    +set com_gamename foo

If you really changed parts that would make vanilla ioquake3 incompatible with
your mod, we have included another way to conveniently build a stand-alone
binary. Just add `BASE_CFLAGS += -DSTANDALONE` to Makefile.local. Don't forget to edit
the PRODUCT_NAME and subsequent #defines in qcommon/q_shared.h with
information appropriate for your project.
