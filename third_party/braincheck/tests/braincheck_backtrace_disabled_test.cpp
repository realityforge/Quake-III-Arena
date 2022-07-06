#define BRAINCHECK_NO_BACKTRACE
#include "test_support.inc"

using Catch::Matchers::Equals;

TEST_CASE("braincheck_backtrace - DISABLED")
{
    message_init();
    braincheck_backtrace();
    REQUIRE_THAT(get_message(), Equals(""));
}
