#include "test_support.inc"

using Catch::Matchers::ContainsSubstring;
using Catch::Matchers::EndsWith;
using Catch::Matchers::StartsWith;

static void assert_debug_message(const char* expression, const char* value)
{
    char expected[1000] = " - '";
    const std::string message = get_message();

    strncat(expected, expression, sizeof(expected) - 1);
    strncat(expected, "' = ", sizeof(expected) - 1);
    strncat(expected, value, sizeof(expected) - 1);
    strncat(expected, "\n", sizeof(expected) - 1);

    REQUIRE_THAT(message, StartsWith(__FILE__ ":"));
    REQUIRE_THAT(message, EndsWith(expected));
}

TEST_CASE("braincheck_debug(bool)")
{
    message_init();
    braincheck_debug(1 == 1 ? true : false);
    assert_debug_message("1 == 1 ? true : false", "true");
}

TEST_CASE("braincheck_debug(char)")
{
    message_init();
    char ch = 'q';
    braincheck_debug(ch);
    assert_debug_message("ch", "q");
}

TEST_CASE("braincheck_debug(signed char)")
{
    message_init();
    signed char ch = 'q';
    braincheck_debug(ch);
    assert_debug_message("ch", "q");
}

TEST_CASE("braincheck_debug(unsigned char)")
{
    message_init();
    unsigned char ch = 'q';
    braincheck_debug(ch);
    assert_debug_message("ch", "q");
}

TEST_CASE("braincheck_debug(short)")
{
    message_init();
    short myValue = -42;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "-42");
}

TEST_CASE("braincheck_debug(unsigned short)")
{
    message_init();
    unsigned short myValue = 42;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "42");
}

TEST_CASE("braincheck_debug(int)")
{
    message_init();
    int myValue = -42424242;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "-42424242");
}

TEST_CASE("braincheck_debug(unsigned int)")
{
    message_init();
    unsigned int myValue = 42424242;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "42424242");
}

TEST_CASE("braincheck_debug(long)")
{
    message_init();
    long myValue = -4242424242424242424;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "-4242424242424242424");
}

TEST_CASE("braincheck_debug(unsigned long)")
{
    message_init();
    unsigned long myValue = 4242424242424242424;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "4242424242424242424");
}

TEST_CASE("braincheck_debug(long long)")
{
    message_init();
    long long myValue = -4242424242424242424;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "-4242424242424242424");
}

TEST_CASE("braincheck_debug(unsigned long long)")
{
    message_init();
    unsigned long long myValue = 4242424242424242424;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "4242424242424242424");
}

TEST_CASE("braincheck_debug(float)")
{
    message_init();
    float myValue = -4.2F;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "-4.200000");
}

TEST_CASE("braincheck_debug(double)")
{
    message_init();
    double myValue = -4.2;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "-4.200000");
}

TEST_CASE("braincheck_debug(pointer)")
{
    message_init();
    void * myValue = NULL;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "0x0");
}
