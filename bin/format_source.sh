#!/bin/bash

#
# A simple shell script to format the entire set of source code using a single command
# This is probably not required when using the pre-commit hook and IDE integration
# but is present in case we ever need to perform large scale source code format changes
# again
#

# shellcheck disable=SC2038
find code/ -name '*.h' -o -name '*.c' | xargs clang-format -i