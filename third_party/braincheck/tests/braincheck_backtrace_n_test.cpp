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
    message[0] = 0;
    func4();
    std::string str = message;

    REQUIRE_THAT(str, StartsWith(__FILE__ ":8: func1"));
#ifdef DEBUG
    REQUIRE_THAT(str, ContainsSubstring("func2"));
    REQUIRE_THAT(str, ContainsSubstring("func3"));
    REQUIRE_THAT(str, !ContainsSubstring("func4"));
#endif
}
