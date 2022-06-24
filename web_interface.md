## Add an external Web Presence to expose game information

### Motivation

In an ideal world there would be one or more companion websites that expose information about the game and the players in the game. Some services that should be available:

* Player authentication services. Verify the players have an authenticated identity. The service may also verify that the player has an "acceptable" name etc.
* Master server that tracks servers, and players end exposes a list of active games including the player count, game mode etc. The server and player have to be "authed" but maybe the server just creates a key publishes public key to the master server.
* Add a lvlworld equivalent where users can upload maps for review etc. The site could provide reviews of maps as well as statistics on the number of plays etc.
* Expose the set of maps being played and or models chosen etc. It would be good to provide see which maps are being
* Expose a log of activity on a server.
* Track player and game statistics over time. These statistics can be useful for players, potential players or the developers and may be marked as private or public by the player themselves. See they hyperdash player statistics for the type of statistics that may be exposed. i.e. Accuracy with weapons, game modes played, win rates, k/d, time on objectives, MMR etc.
* Expose mechanisms for setting up competitions and social organisations such as clans, leagues and teams. This would make it possible for various clans/teams to take ownership of tags and "name" tattoos of various kinds. It would also offer simple mechanisms to set up competitions. A player can not wear a clan post-name tag unless they are part of that clan. A player can not wear a team tag unless they are part of that team. A simple model may be
    * Clan contain Players
    * League contains Seasons, Teams play in Seasons, Teams contain Players

Some of this information can be stored and access from a traditional database, while other data (in particular statistics and logs) may need a more fit-for-purpose data store.

There is also some significant value for exposing a "Companion" website for a server or server cluster. This would provide administrative services for the server. i.e. Seeing the current users, global chat, map rotations, authentication requirements, banning users etc.

The companion app could also provide developer services such as exposing internal state of the server and other developer specific tools. Forcing reload of content, adding paths to VFS etc.

An advantage of developing this would be exposure to web development within the Bazel build infrastructure, including usage of J2CL. It would also enable the experimentation with modern lightweight service backends such as [Micronaut](https://micronaut.io/) or [Quarkus](https://quarkus.io/).

### Challenges

...

### Solution

...

### Evaluation

...

### References

* [Build Micronaut Applications with Bazel](https://mytechden.com/build-micronaut-applications-with-bazel)
* [Bazel Micronaut Example](https://sumglobal.com/2020/03/10/bazel-and-micronaut/)
* [Bazel Micronaut Example (Source Code)](https://github.com/SUMGlobal/bazel-micronaut-example)
* [quake3-vsp-stats](https://hub.docker.com/r/evilru/quake3-vsp-stats) for inspiration on statistics collection.
* [dpmaster-2.2.zip](http://icculus.org/twilight/darkplaces/files/dpmaster-2.2.zip) is the master server implementation used by ioq and other q3a clones.
