#include <catch2/catch_test_macros.hpp>
#include <catch2/matchers/catch_matchers_string.hpp>
#include <string>

static char recorded_message[10000] = { 0 };
static size_t recorded_offset = 0;

#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wgnu-zero-variadic-macro-arguments"
#define BRAINCHECK_PRINTF(args...)                                            \
    {                                                                         \
        recorded_offset += snprintf(&recorded_message[recorded_offset], sizeof(recorded_message) - recorded_offset, args); \
    }

#pragma clang diagnostic ignored "-Wc11-extensions"
#include "braincheck.h"

static void message_init()
{
    recorded_message[0] = 0;
    recorded_offset = 0;
}

static const std::string get_message()
{
    return recorded_message;
}
