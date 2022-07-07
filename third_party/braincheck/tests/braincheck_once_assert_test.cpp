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

static void do_once_assert_success()
{
    braincheck_once_assert(0 == 0);
}

TEST_CASE("braincheck_once_assert - assertion successful")
{
    message_init();
    do_once_assert_success();
    do_once_assert_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_fail()
{
    braincheck_once_assert(1 == 0);
}

TEST_CASE("braincheck_once_assert - assertion failed")
{
    message_init();
    do_once_assert_fail();
    do_once_assert_fail();
    do_once_assert_fail();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: 1 == 0 => false\n"));
}

static void do_once_assert_eq_success()
{
    braincheck_once_assert_eq(1, 1);
}

TEST_CASE("braincheck_once_assert_eq - assertion successful")
{
    message_init();
    do_once_assert_eq_success();
    do_once_assert_eq_success();
    do_once_assert_eq_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_eq_failure()
{
    braincheck_once_assert_eq(1, 2);
}

TEST_CASE("braincheck_once_assert_eq - assertion failed")
{
    message_init();
    do_once_assert_eq_failure();
    do_once_assert_eq_failure();
    do_once_assert_eq_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 == v2 (v1 = 1, v2 = 2)\n"));
}

static void do_once_assert_neq_success()
{
    braincheck_once_assert_neq(1, 2);
}

TEST_CASE("braincheck_once_assert_neq - assertion successful")
{
    message_init();
    do_once_assert_neq_success();
    do_once_assert_neq_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_neq_failure()
{
    braincheck_once_assert_neq(1, 1);
}

TEST_CASE("braincheck_once_assert_neq - assertion failed")
{
    message_init();
    do_once_assert_neq_failure();
    do_once_assert_neq_failure();
    do_once_assert_neq_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 != v2 (v1 = 1, v2 = 1)\n"));
}

static void do_once_assert_lt_success()
{
    braincheck_once_assert_lt(1, 2);
}

TEST_CASE("braincheck_once_assert_lt - assertion successful")
{
    message_init();
    do_once_assert_lt_success();
    do_once_assert_lt_success();
    do_once_assert_lt_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_lt_failure()
{
    braincheck_once_assert_lt(1, 1);
}

TEST_CASE("braincheck_once_assert_lt - assertion failed")
{
    message_init();
    do_once_assert_lt_failure();
    do_once_assert_lt_failure();
    do_once_assert_lt_failure();
    do_once_assert_lt_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 < v2 (v1 = 1, v2 = 1)\n"));
}

static void do_once_assert_lte_success()
{
    braincheck_once_assert_lte(1, 2);
}

TEST_CASE("braincheck_once_assert_lte - assertion successful")
{
    message_init();
    do_once_assert_lte_success();
    do_once_assert_lte_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_lte_failure()
{
    braincheck_once_assert_lte(1, 0);
}

TEST_CASE("braincheck_once_assert_lte - assertion failed")
{
    message_init();
    do_once_assert_lte_failure();
    do_once_assert_lte_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 <= v2 (v1 = 1, v2 = 0)\n"));
}

static void do_once_assert_gt_success()
{
    braincheck_once_assert_gt(2, 1);
}

TEST_CASE("braincheck_once_assert_gt - assertion successful")
{
    message_init();
    do_once_assert_gt_success();
    do_once_assert_gt_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_gt_failure()
{
    braincheck_once_assert_gt(1, 1);
}

TEST_CASE("braincheck_once_assert_gt - assertion failed")
{
    message_init();
    do_once_assert_gt_failure();
    do_once_assert_gt_failure();
    do_once_assert_gt_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 > v2 (v1 = 1, v2 = 1)\n"));
}

static void do_once_assert_gte_success()
{
    braincheck_once_assert_gte(2, 1);
}

TEST_CASE("braincheck_once_assert_gte - assertion successful")
{
    message_init();
    do_once_assert_gte_success();
    do_once_assert_gte_success();
    do_once_assert_gte_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_gte_failure()
{
    braincheck_once_assert_gte(0, 1);
}

TEST_CASE("braincheck_once_assert_gte - assertion failed")
{
    message_init();
    do_once_assert_gte_failure();
    do_once_assert_gte_failure();
    do_once_assert_gte_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 >= v2 (v1 = 0, v2 = 1)\n"));
}

static void do_once_assert_m_success()
{
    braincheck_once_assert_m(0 == 0, "Some message");
}

TEST_CASE("braincheck_once_assert_m - assertion successful")
{
    message_init();
    do_once_assert_m_success();
    do_once_assert_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_m_failure()
{
    braincheck_once_assert_m(1 == 0, "Some message");
}

TEST_CASE("braincheck_once_assert_m - assertion failed")
{
    message_init();
    do_once_assert_m_failure();
    do_once_assert_m_failure();
    do_once_assert_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: 1 == 0 => false: Some message\n"));
}

static void do_once_assert_eq_m_success()
{
    braincheck_once_assert_eq_m(1, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_eq_m - assertion successful")
{
    message_init();
    do_once_assert_eq_m_success();
    do_once_assert_eq_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_eq_m_failure()
{
    braincheck_once_assert_eq_m(1, 2, "Some message");
}

TEST_CASE("braincheck_once_assert_eq_m - assertion failed")
{
    message_init();
    do_once_assert_eq_m_failure();
    do_once_assert_eq_m_failure();
    do_once_assert_eq_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 == v2 (v1 = 1, v2 = 2): Some message\n"));
}

static void do_once_assert_neq_m_success()
{
    braincheck_once_assert_neq_m(1, 2, "Some message");
}

TEST_CASE("braincheck_once_assert_neq_m - assertion successful")
{
    message_init();
    do_once_assert_neq_m_success();
    do_once_assert_neq_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_neq_m_failure()
{
    braincheck_once_assert_neq_m(1, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_neq_m - assertion failed")
{
    message_init();
    do_once_assert_neq_m_failure();
    do_once_assert_neq_m_failure();
    do_once_assert_neq_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 != v2 (v1 = 1, v2 = 1): Some message\n"));
}

static void do_once_assert_lt_m_success()
{
    braincheck_once_assert_lt_m(1, 2, "Some message");
}

TEST_CASE("braincheck_once_assert_lt_m - assertion successful")
{
    message_init();
    do_once_assert_lt_m_success();
    do_once_assert_lt_m_success();
    do_once_assert_lt_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_lt_m_failure()
{
    braincheck_once_assert_lt_m(1, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_lt_m - assertion failed")
{
    message_init();
    do_once_assert_lt_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 < v2 (v1 = 1, v2 = 1): Some message\n"));
}

static void do_once_assert_lte_m_success()
{
    braincheck_once_assert_lte_m(1, 2, "Some message");
}

TEST_CASE("braincheck_once_assert_lte_m - assertion successful")
{
    message_init();
    do_once_assert_lte_m_success();
    do_once_assert_lte_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_lte_m_failure()
{
    braincheck_once_assert_lte_m(1, 0, "Some message");
}

TEST_CASE("braincheck_once_assert_lte_m - assertion failed")
{
    message_init();
    do_once_assert_lte_m_failure();
    do_once_assert_lte_m_failure();
    do_once_assert_lte_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 <= v2 (v1 = 1, v2 = 0): Some message\n"));
}

static void do_once_assert_gt_m_success()
{
    braincheck_once_assert_gt_m(2, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_gt_m - assertion successful")
{
    message_init();
    do_once_assert_gt_m_success();
    do_once_assert_gt_m_success();
    do_once_assert_gt_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_gt_m_failure()
{
    braincheck_once_assert_gt_m(1, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_gt_m - assertion failed")
{
    message_init();
    do_once_assert_gt_m_failure();
    do_once_assert_gt_m_failure();
    do_once_assert_gt_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 > v2 (v1 = 1, v2 = 1): Some message\n"));
}

static void do_once_assert_gte_m_success()
{
    braincheck_once_assert_gte_m(2, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_gte_m - assertion successful")
{
    message_init();
    do_once_assert_gte_m_success();
    do_once_assert_gte_m_success();
    do_once_assert_gte_m_success();
    REQUIRE_THAT(get_message(), Equals(""));
}

static void do_once_assert_gte_m_failure()
{
    braincheck_once_assert_gte_m(0, 1, "Some message");
}

TEST_CASE("braincheck_once_assert_gte_m - assertion failed")
{
    message_init();
    do_once_assert_gte_m_failure();
    do_once_assert_gte_m_failure();
    do_once_assert_gte_m_failure();
    REQUIRE_THAT(get_message(), Equals(__FILE__ ":3: myFunction(): Failed assertion: v1 >= v2 (v1 = 0, v2 = 1): Some message\n"));
}
