#include <catch2/catch_test_macros.hpp>
#include <catch2/matchers/catch_matchers_string.hpp>
#include <string>

static char message[10000] = { 0 };
static size_t offset = 0;

#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wgnu-zero-variadic-macro-arguments"
#define BRAINCHECK_PRINTF(args...)                                            \
    {                                                                         \
        offset += snprintf(&message[offset], sizeof(message) - offset, args); \
    }

#include "braincheck.h"
