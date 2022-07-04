#include "test_support.inc"

using Catch::Matchers::ContainsSubstring;
using Catch::Matchers::StartsWith;

extern "C" void func1()
{
    braincheck_backtrace_n(2);
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

TEST_CASE("Backtrace includes file, line and function as well as stack up to n elements")
{
    message_init();
    func4();
    const std::string message = get_message();

#if defined(__clang__) || defined(__GNUC__)
#define EXPECTED_FUNC_NAME "void func1()"
#else
#define EXPECTED_FUNC_NAME "func1"
#endif

    REQUIRE_THAT(message, StartsWith(__FILE__ ":8: " EXPECTED_FUNC_NAME));
#ifdef DEBUG
    REQUIRE_THAT(message, ContainsSubstring("func2"));
    REQUIRE_THAT(message, ContainsSubstring("func3"));
    REQUIRE_THAT(message, !ContainsSubstring("func4"));
#endif
}
