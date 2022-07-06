#define BRAINCHECK_NO_BACKTRACE
#include "test_support.inc"

using Catch::Matchers::Equals;

TEST_CASE("braincheck_backtrace_n - DISABLED")
{
    message_init();
    braincheck_backtrace_n(1);
    REQUIRE_THAT(get_message(), Equals(""));
}
