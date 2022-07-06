#define BRAINCHECK_NO_PERROR
#include "test_support.inc"

using Catch::Matchers::Equals;

TEST_CASE("braincheck_perror - DISABLED")
{
    message_init();
    errno = EDOM;
    braincheck_perror("Some maths operation");
    REQUIRE_THAT(get_message(), Equals(""));
}
