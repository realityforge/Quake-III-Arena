## Modernize Codebase

### Motivation

The initial code base was developed ~24 years ago, by a studio in a time crunch. The product includes code that was extracted from previous generation games and modified in a somewhat adhoc manner. Even though the codebase is considered one of the better examples of engineering at the time, there is significant room for improving the code quality. Modern tooling has substantially more support for source code improvements.

 The IDE of choice for the project includes "Code Inspections" that highlight problematic code of various kinds and suggest autofixes where possible. The IDE also highlights spelling errors and common grammatical errors in text and comments. The IDE can also identify "dead" code that is not referenced by any other part of the project. The IDE can also highlight portability concerns such as "Narrowing conversion from 'unsigned long' to signed type 'int' is implementation defined".

The compilers and support infrastructure (i.e. `clang-tidy`) have similar infrastructure and can generate warnings as part of the build process. Addressing the warnings can lead to a codebase that is easier to understand, more portable and potentially easier to maintain and evolve. Some warnings can be suppressed in the code but this should be a deliberate action by the developer after assessing the impact of the code that generated the warning. The goal would be to increase the warnings checked by first specifying `-Wall` and then `-Wpednatic` and then `-Wextra` and finally `-Weverything`. Eliminating the warnings does not necessarily improve the code quality, but it does help highlight where problematic constructs could exist.

### Challenges

Changing working code introduces risk and can introduce bugs. It is also difficult to assess the positive impact of "clean code" can have and "dirty code" does not necessarily mean bad or buggy code. Cleaning code often requires a detail oriented, highly focused period to complete. As a result of these factors, it can be difficult to budget time that could be spent focusing on more interesting, greater impact changes. The question, does [high quality software is worth the cost](https://martinfowler.com/articles/is-quality-worth-cost.html) seems to be answered yes: clean code allows us to ship faster. The developer, time, opportunity cost etc. is harder to assess.

### Solution

Rather than treating "Modernize codebase" as a discrete change or a project that can be completed, the decision was made to treat it as a process. As changes are made to different subsystems, some additional effort will be made to clean up the code around the change. As effort is expended attempting to understand a subsystem, small changes can be made to simplify and modernize the structure culminating in more changes as the subsystem is understood to a greater degree.

Most engineers have heard of this strategy. It is called the boy-scout rule: "Always leave the code better than you found it." In other words, engineers should continuously clean up small pieces of tech debt, so they never have to undertake a giant refactoring project when they're too close to technical bankruptcy.

While there "boy-scout rule" sounds good in theory, it often fails in practice. The motivation to ship faster often leads to shortcuts or "dirty code" which results in more code debt and a slower delivery time for the next feature which leads to even more motivation to take shortcuts (which leads to more dirty code and a further decrease in velocity etc.) This is not expected to be the scenario in this project as there is unlikely to be hard a time pressure to deliver given it is a learning project.

### Evaluation

Time will tell whether this change has a positive impact. However, it should be noted that at least 3 bugs were detected so far after the IDE highlighted variables that were only written to and never read. (Unfortunately all three bugs had already been detected and fixed in the ioq3 fork of the codebase but the fact that the same bugs were detected as part of a code-cleaning exercise should demonstrate that there is value in the code cleaning exercise.)

Removal of large amounts of unused code or commented out code has made exploring the project easier.
