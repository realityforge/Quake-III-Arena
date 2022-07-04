#include <catch2/catch_test_macros.hpp>
#include <catch2/matchers/catch_matchers_string.hpp>

static char message[10000] = { 0 };
static size_t offset = 0;

#include <string>

#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wgnu-zero-variadic-macro-arguments"
#define BRAINCHECK_PRINTF(args...)                                            \
    {                                                                         \
        offset += snprintf(&message[offset], sizeof(message) - offset, args); \
    }

#include "braincheck.h"

using Catch::Matchers::ContainsSubstring;
using Catch::Matchers::StartsWith;

extern "C" void func1()
{
    braincheck_backtrace();
}

extern "C" void func2()
{
    func1();
}

extern "C" void func3()
{
    func2();
}

extern "C" void func4()
{
    func3();
}

TEST_CASE("Backtrace includes file, line and function as well as stack")
{
    message[0] = 0;
    func4();
    std::string str = message;

    REQUIRE_THAT(str, StartsWith(__FILE__ ":23: func1"));
#ifdef DEBUG
    REQUIRE_THAT(str, ContainsSubstring("func2"));
    REQUIRE_THAT(str, ContainsSubstring("func3"));
    REQUIRE_THAT(str, ContainsSubstring("func4"));
#endif
}
