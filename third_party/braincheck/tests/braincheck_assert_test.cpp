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

#define BRAINCHECK_ASSERTS_NOT_FATAL
#include "test_support.inc"

// Override line and function name to make testing easier
#define __LINE__ 3
#undef BRAINCHECK_FUNCTION_NAME
#define BRAINCHECK_FUNCTION_NAME "myFunction()"

using Catch::Matchers::Equals;

TEST_CASE("braincheck_assert_fail")
{
    message_init();
    braincheck_assert_fail("Some random reason");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: Some random reason\n"));
}

TEST_CASE("braincheck_assert - assertion successful")
{
    message_init();
    braincheck_assert(0 == 0);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert - assertion failed")
{
    message_init();
    braincheck_assert(1 == 0);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: 1 == 0 => false\n"));
}

TEST_CASE("braincheck_assert_eq - assertion successful")
{
    message_init();
    braincheck_assert_eq(1, 1);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_eq - assertion failed")
{
    message_init();
    braincheck_assert_eq(1, 2);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 == v2 (v1 = 1, v2 = 2)\n"));
}

TEST_CASE("braincheck_assert_neq - assertion successful")
{
    message_init();
    braincheck_assert_neq(1, 2);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_neq - assertion failed")
{
    message_init();
    braincheck_assert_neq(1, 1);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 != v2 (v1 = 1, v2 = 1)\n"));
}

TEST_CASE("braincheck_assert_lt - assertion successful")
{
    message_init();
    braincheck_assert_lt(1, 2);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_lt - assertion failed")
{
    message_init();
    braincheck_assert_lt(1, 1);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 < v2 (v1 = 1, v2 = 1)\n"));
}

TEST_CASE("braincheck_assert_lte - assertion successful")
{
    message_init();
    braincheck_assert_lte(1, 2);
    braincheck_assert_lte(1, 1);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_lte - assertion failed")
{
    message_init();
    braincheck_assert_lte(1, 0);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 <= v2 (v1 = 1, v2 = 0)\n"));
}

TEST_CASE("braincheck_assert_gt - assertion successful")
{
    message_init();
    braincheck_assert_gt(2, 1);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_gt - assertion failed")
{
    message_init();
    braincheck_assert_gt(1, 1);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 > v2 (v1 = 1, v2 = 1)\n"));
}

TEST_CASE("braincheck_assert_gte - assertion successful")
{
    message_init();
    braincheck_assert_gte(2, 1);
    braincheck_assert_gte(1, 1);
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_gte - assertion failed")
{
    message_init();
    braincheck_assert_gte(0, 1);
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 >= v2 (v1 = 0, v2 = 1)\n"));
}

TEST_CASE("braincheck_assert_m - assertion successful")
{
    message_init();
    braincheck_assert_m(0 == 0, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_m - assertion failed")
{
    message_init();
    braincheck_assert_m(1 == 0, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: 1 == 0 => false: Some message\n"));
}


TEST_CASE("braincheck_assert_eq_m - assertion successful")
{
    message_init();
    braincheck_assert_eq_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_eq_m - assertion failed")
{
    message_init();
    braincheck_assert_eq_m(1, 2, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 == v2 (v1 = 1, v2 = 2): Some message\n"));
}

TEST_CASE("braincheck_assert_neq_m - assertion successful")
{
    message_init();
    braincheck_assert_neq_m(1, 2, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_neq_m - assertion failed")
{
    message_init();
    braincheck_assert_neq_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 != v2 (v1 = 1, v2 = 1): Some message\n"));
}

TEST_CASE("braincheck_assert_lt_m - assertion successful")
{
    message_init();
    braincheck_assert_lt_m(1, 2, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_lt_m - assertion failed")
{
    message_init();
    braincheck_assert_lt_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 < v2 (v1 = 1, v2 = 1): Some message\n"));
}

TEST_CASE("braincheck_assert_lte_m - assertion successful")
{
    message_init();
    braincheck_assert_lte_m(1, 2, "Some message");
    braincheck_assert_lte_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_lte_m - assertion failed")
{
    message_init();
    braincheck_assert_lte_m(1, 0, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 <= v2 (v1 = 1, v2 = 0): Some message\n"));
}

TEST_CASE("braincheck_assert_gt_m - assertion successful")
{
    message_init();
    braincheck_assert_gt_m(2, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_gt_m - assertion failed")
{
    message_init();
    braincheck_assert_gt_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 > v2 (v1 = 1, v2 = 1): Some message\n"));
}

TEST_CASE("braincheck_assert_gte_m - assertion successful")
{
    message_init();
    braincheck_assert_gte_m(2, 1, "Some message");
    braincheck_assert_gte_m(1, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_assert_gte_m - assertion failed")
{
    message_init();
    braincheck_assert_gte_m(0, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 >= v2 (v1 = 0, v2 = 1): Some message\n"));
}
