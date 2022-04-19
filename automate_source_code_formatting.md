## Automate Source Code Formatting

### Motivation

Formatting source code in a consistent fashion helps readability. Most code is read many more times than it is changed. Thus formatting source code in a consistent fashion is a good investment. The existing code base already contains several formatting conventions in different modules that is likely due to the modules being developed by different developers at different times.

Manually formatting source code is labour intensive. It can also lead to pointless conflict when the preferences of different developers do not align and/or when the source code conventions are open to interpretation. Automation done right can eliminate most of these issues.

A quotation from the [`Rust Style Guide`](https://github.com/rust-dev-tools/fmt-rfcs/blob/master/guide/guide.md) summarises the motivation for automating source code formatting more eloquently than above:

> Formatting code is a mostly mechanical task which takes both time and mental effort. By using an automatic formatting tool, a programmer is relieved of this task and can concentrate on more important things. Furthermore, by sticking to an established style guide (such as this one), programmers don't need to formulate ad hoc style rules, nor do they need to debate with other programmers what style rules should be used, saving time, communication overhead, and mental energy.

### Challenges

The source code for Q3A has been forked many times. Several of these forks are of interest to this project. Each fork has modified the source code using their own source code conventions. It is useful to compare code across forks as it gives insight into what has changed in a particular fork and facilitates importing features and bugs fixes from the wider ecosystem.

If the diffs produced by comparing code across forks includes formatting and stylistic changes then the diffs will be of limited value as the actual changes will be hidden among the formatting changes. An ideal solution will enable the production of diffs that ignore style changes.

The ideal solution will also limit the number of times that a user has to manually run the source code formatter. This is best achieved by integrating into the IDE (which is CLion in this case) and the normal development process.

### Solution

Several source code formatters were assessed but the final two contenders were [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html) and [Artistic Style or "Astyle"](http://astyle.sourceforge.net/). The `ClangFormat` tool was selected as it has better integration with the CLion IDE and seem to have broader community support.

The tool is simple to setup and install and most development platforms have it integrated into the package manager. Under OSX, at the time of writing, the following command will install version `14` of `ClangFormat`. (Similar one liners exist for other platforms)

> $ brew install clang-format

The solution consisted of the following actions:

#### Select a code style

`ClangFormat` has several pre-configured styles. The choice between them is primarily driven by developer preference or existing code layout. I did not have a strong preference for a particular set of conventions so a relatively arbitrary decision was made to base the projects code style on the `WebKit` style.

The setting `SortIncludes: Never` was added to the base style as sorting the includes would result in compilation errors as many of the Q3A header files do not include their dependencies. The `AlignAfterOpenBracket: Align` setting was also added as the lone accommodation to personal preference.

When the `ClangFormat` version 15 is more widely available the setting `InsertBraces: true` should be added to ensure braces are present for all blocks. While this is another personal preference, it is felt that the resultant code-churn is worth the increase in clarity.

#### CLion integration

[CLion](https://www.jetbrains.com/clion/) is the IDE of choice for this project and provides great support for `ClangFormat`. The IDE makes it possible to replace the native code formatter with `ClangFormat` as described in this [article](https://www.jetbrains.com/help/clion/clangformat-as-alternative-formatter.html).

A minor inconvenience is that CLion uses `ClangFormat` version 13 configuration when performing source code formatting while the CLI tool uses version 14. However, a re-format of the entire codebase from within CLion produces no differences from a re-format of the entire codebase from the command line so this is considered a non-issue. It is expected that CLion will upgrade the `ClangFormat` version in time and this issue will resolve itself.

#### pre-commit hook

Sometimes a developer edits a file outside of the IDE. To ensure that these edits remain consistent with the desired code style, the project has specified a `pre-commit` hook. The `pre-commit` hook runs when a developer attempts to commit changes to the local repository. The hook will detect any files that have been added to the commit and format the files using `ClangFormat`. As long as the developer installs the `pre-commit` hook into the correct location, the hook will help ensure that the formatting is kept consistent.

#### GitHub action to check code style

If a developer forgets to install the `pre-commit` hook or manipulates the staging area during the commit process, then formatting issues can slip though. The project introduces a GitHub action that runs when a change is pushed and verifies that the source is consistent with the code style.

The action uses code from a third party and has several issues. The action downloads a large docker image and is thus extremely slow. The docker image only has `ClangFormat` version 13 available. Neither of these issues will cause problems in the short term so we are ignoring for now. It is expected that in the long term as the build moves entirely to Bazel that the format checking will be done by Bazel and this issue will resolve itself.

#### Cross-fork code comparisons

The cross-fork code analysis challenges took a little longer to resolve. After further analysis it was determined that there was only a small number of "upstream" repositories that we currently care about when performing code comparisons. These are the original [iD Software](https://github.com/id-Software/Quake-III-Arena) repository, the [ioq3](https://github.com/ioquake/ioq3.git) repository, the [ioq3quest](https://github.com/DrBeef/ioq3quest.git) repository, the [Quake3e](https://github.com/ec-/Quake3e.git) repository and the [vkQuake3](https://github.com/suijingfeng/vkQuake3.git) repository.

The solution was to add git remotes for each "upstream" repository and a local branch named `upstream/[UpstreamName]` with a copy of the primary branch in the upstream. A new branch was created from the `upstream/[UpstreamName]` branch named `upstream/[UpstreamName]_formatted` and then the files in this branch are formatted with the current style. To compare two files across forks you can compare the file with the equivalent file in the `upstream/[UpstreamName]_formatted` branch.

i.e. The following command compares the `code/ui/ui_atoms.c` file between the current branch and the equivalent file in the `ioq3` fork.

> $ git diff HEAD:code/ui/ui_atoms.c upstream/ioq3_formatted:code/ui/ui_atoms.c

As these separate branches can be tricky to setup initially or update when the upstream changes, scripts have been added to the `bin/` directory to automate the setup.

### Evaluation

The change worked out surprisingly well and it is a joy to never have to expend any mental effort aligning code during development.
