/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#define BRAINCHECK_ANSI_FORMAT

#include "test_support.inc"

// Override line and function name to make testing easier
#define __LINE__ 3
#undef BRAINCHECK_FUNCTION_NAME
#define BRAINCHECK_FUNCTION_NAME "myFunction()"

#define EXPECTED_PREFIX "\u001B[0m\u001B[02m" __FILE__ ":3:\u001B[0m \u001B[0m\u001B[34mmyFunction():\u001B[0m"

using Catch::Matchers::ContainsSubstring;
using Catch::Matchers::EndsWith;
using Catch::Matchers::Equals;
using Catch::Matchers::StartsWith;

TEST_CASE("braincheck_debug - ansi")
{
    message_init();
    braincheck_debug(1 == 1 ? true : false);
    const std::string message = get_message();
    REQUIRE_THAT(message, Equals(EXPECTED_PREFIX " \u001B[36m\u001B[1m1 == 1 ? true : false\u001B[0m = \u001B[39m\u001B[1mtrue\u001B[0m\n"));
}

TEST_CASE("braincheck_debug_array - ansi")
{
    message_init();
    char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
    braincheck_debug_array(values, 3);
    const std::string message = get_message();
    REQUIRE_THAT(message, Equals(EXPECTED_PREFIX " \u001B[36m\u001B[1mvalues\u001B[0m = \u001B[39m\u001B[1m[a, b, c]\u001B[0m\n"));
}

TEST_CASE("braincheck_debug_hexdump - ansi")
{
    message_init();
    long values[] = {
        1, -4242424242424242424, 73, 11, 13, 7, 126, 254,
        1, -4242424242424242424, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    const std::string message = get_message();
    REQUIRE_THAT(message, Equals(EXPECTED_PREFIX " \u001B[36m\u001B[1mvalues\u001B[0m (length = 152)\n"
                                 "\u001B[39m\u001B[1m"
                                 "    00000000: 01 00 00 00 00 00 00 00  08 1f cc fb a0 e1 1f c5 '................'\n"
                                 "    00000010: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000020: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000030: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000040: 01 00 00 00 00 00 00 00  08 1f cc fb a0 e1 1f c5 '................'\n"
                                 "    00000050: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000060: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000070: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000080: 00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00 '................'\n"
                                 "    00000090: 02 00 00 00 00 00 00 00                          '........'\n"
                                 "\u001B[0m"));
}

TEST_CASE("braincheck_perror - ansi")
{
    message_init();
    errno = EDOM;
    braincheck_perror("Some maths operation");
    const std::string message = get_message();

    REQUIRE_THAT(message, Equals(EXPECTED_PREFIX " \u001B[36m\u001B[1mSome maths operation\u001B[0m: \u001B[39m\u001B[1mNumerical argument out of domain\u001B[0m\n"));
}

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

TEST_CASE("braincheck_backtrace_n() - ansi")
{
    message_init();
    func4();
    const std::string message = get_message();

    REQUIRE_THAT(message, StartsWith("\u001B[0m\u001B[02m" __FILE__ ":"));
    REQUIRE_THAT(message, ContainsSubstring(":\u001B[0m \u001B[0m\u001B[34m"));

#ifdef DEBUG
    REQUIRE_THAT(message, ContainsSubstring("\u001B[39m\u001B[1m"));
    REQUIRE_THAT(message, ContainsSubstring("func2"));
    REQUIRE_THAT(message, ContainsSubstring("func3"));
    REQUIRE_THAT(message, !ContainsSubstring("func4"));
    REQUIRE_THAT(message, EndsWith("\n\u001B[0m"));
#endif
}

TEST_CASE("braincheck_assert_fail - ansi")
{
    message_init();
    braincheck_assert_fail("Some random reason");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: Some random reason\u001B[0m\n"));
}

TEST_CASE("braincheck_assert - ansi")
{
    message_init();
    braincheck_assert(1 == 0);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: 1 == 0 => false\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_eq - ansi")
{
    message_init();
    braincheck_assert_eq(1, 2);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 == v2 (v1 = 1, v2 = 2)\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_neq - ansi")
{
    message_init();
    braincheck_assert_neq(1, 1);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 != v2 (v1 = 1, v2 = 1)\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_lt - ansi")
{
    message_init();
    braincheck_assert_lt(1, 1);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 < v2 (v1 = 1, v2 = 1)\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_lte - ansi")
{
    message_init();
    braincheck_assert_lte(1, 0);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 <= v2 (v1 = 1, v2 = 0)\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_gt - ansi")
{
    message_init();
    braincheck_assert_gt(1, 1);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 > v2 (v1 = 1, v2 = 1)\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_gte - ansi")
{
    message_init();
    braincheck_assert_gte(0, 1);
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 >= v2 (v1 = 0, v2 = 1)\u001B[0m\n"));
}

TEST_CASE("braincheck_assert_m - ansi")
{
    message_init();
    braincheck_assert_m(1 == 0, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: 1 == 0 => false\u001B[0m: Some message\n"));
}

TEST_CASE("braincheck_assert_eq_m - ansi")
{
    message_init();
    braincheck_assert_eq_m(1, 2, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 == v2 (v1 = 1, v2 = 2)\u001B[0m: Some message\n"));
}

TEST_CASE("braincheck_assert_neq_m - ansi")
{
    message_init();
    braincheck_assert_neq_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 != v2 (v1 = 1, v2 = 1)\u001B[0m: Some message\n"));
}

TEST_CASE("braincheck_assert_lt_m - ansi")
{
    message_init();
    braincheck_assert_lt_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 < v2 (v1 = 1, v2 = 1)\u001B[0m: Some message\n"));
}

TEST_CASE("braincheck_assert_lte_m - ansi")
{
    message_init();
    braincheck_assert_lte_m(1, 0, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 <= v2 (v1 = 1, v2 = 0)\u001B[0m: Some message\n"));
}

TEST_CASE("braincheck_assert_gt_m - ansi")
{
    message_init();
    braincheck_assert_gt_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 > v2 (v1 = 1, v2 = 1)\u001B[0m: Some message\n"));
}

TEST_CASE("braincheck_assert_gte_m - ansi")
{
    message_init();
    braincheck_assert_gte_m(0, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(EXPECTED_PREFIX " \u001B[31m\u001B[1mFailed assertion: v1 >= v2 (v1 = 0, v2 = 1)\u001B[0m: Some message\n"));
}
