#include "test_support.inc"

using Catch::Matchers::ContainsSubstring;
using Catch::Matchers::EndsWith;
using Catch::Matchers::StartsWith;

TEST_CASE("braincheck_perror")
{
    message_init();
    errno = EDOM;
    braincheck_perror("Some maths operation");
    const std::string message = get_message();

    REQUIRE_THAT(message, StartsWith(__FILE__ ":11: "));
    REQUIRE_THAT(message, ContainsSubstring("Some maths operation - "));
    // Unclear if the exact text is consistent across platforms but this is how MacOS emits this message
    REQUIRE_THAT(message, EndsWith("Numerical argument out of domain"));
}
