# Base the project on the original idSoftware variant

### Motivation

Initial experimentation with the engine was split between multiple different forks but primarily with ioquake3 and Quake3e. The expectation was that at least one of the forks had sufficient community backing and would provide a good base on which to start learning and experimenting. The hope was that one of the communities would offer a supportive place to ask questions and provide feedback. Ultimately I wanted somewhere where I could contribute back when I had learnt enough to be dangerous.

Early on, it became obvious that the Quake3e fork is primarily focused on maintaining the codebase for an existing player base. The code prioritised performance improvements, code quality improvements, operating improvements and quality if life improvements for the player but allowed no changes to the gameplay. Quake3e was a fork of an earlier version of ioquake3.

The ioquake3 codebase on the other hand had substantially better documentation, a lot of additional features for modders and total game conversion developers (voip integration, a dramatically improved renderer, a better material system etc.). The ioquake3 fork also had some surprising omissions, some features that had been developed as forks of the repository had not been integrated back into the repository (i.e. a vulcan renderer, a direct 3d renderer, better audio etc.) These omissions seemed to be opportunities where I could contribute to the project while also learning for my own benefit.

After spending sometime in the ioquake3 codebase it became obvious that some changes that had been applied to the codebase had introduced bugs. i.e. Changes to the logic in the clientside prediction code without the same changes to the serverside logic and vice versa. In some cases it seems that tools such as clang-tidy had been run over the codebase and automatic fixes were applied without understanding the impacts. A lot of the SDL integration seemed slapdash at best and more a mechanism to experiment with SDL rather than as a way to improve the codebase. In some cases, a feature from SDL was incorporated but was not fully pushed through the codebase. i.e. Sometimes the original Q3A operating system abstractions were used, sometimes SDL was used and sometimes new abstractions were put in place.

The ioquake3 codebase also had another major problem which was that it had no community to speak of and is unlikely to have a revival. The current maintainer has interactions with the community that tends to result in the other party departing the community. So there seems to be little value in the "community" aspect of ioquake3.

As a result, I decided to start with the Quake3 source code as released from idSoftware.

### Challenges

I had intermittently ported back my own changes from the fork of ioq I had been working on to a branch based of the original idSoftware version. This was done partly to hedge against the possibility of basing work on the idSoftware variant but also as a way to improve my understanding of the changes. This would no longer be an optional activity. Any time I wanted to make changes, I would need to port them to the main branch. This doubles (at least) the work required for any change. It is also somewhat risky as the main branch does not have a build system that produces a working executable to test.

The ioq fork already made the codebase (mostly) 64-bit safe which required some delicate changes in the calling convention of the interpreter and the entry points of the plugins. They also changed the size of several types used to represent pointers and likely changed the padding requirements in various structures. This project intends to move towards using wasm as the vm infrastructure which necessitate a rewrite of inter-module interfaces which will naturally make these 64-bit components safe but this has yet to occur. It is unclear whether the best strategy is to do this work in the ioq fork and backport the code to the idSoftware variant or to work towards making the idSoftware variant safe from the start.

The ioq fork for has interesting features that I had no intention of reimplementing in the short term. The intention was always to rewrite the renderer, the network layer, the material system, and the vfs layer. However, there are other features such as voip, curl integration and sound layer that will need to be rewritten if they continue to be desired.

Another big problem was that once this decision was made, it resulted in a stop of other more interesting changes for fear they would require large amounts of rework or busy-work to rebase on the idSoftware variant. Unfortunately these other more interesting changes, are much more motivating to keep working on compared to this change which will result in a slow-down.

### Solution

.

### Evaluation

...
