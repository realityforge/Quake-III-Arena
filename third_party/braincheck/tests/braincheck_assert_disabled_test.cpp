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

#define BRAINCHECK_NO_ASSERT
#include "test_support.inc"

using Catch::Matchers::Equals;

TEST_CASE("braincheck_assert")
{
    message_init();
    braincheck_assert_fail("Some random reason");
    braincheck_assert(1 == 0);
    braincheck_assert_eq(1, 2);
    braincheck_assert_neq(1, 1);
    braincheck_assert_lt(1, 1);
    braincheck_assert_lte(1, 0);
    braincheck_assert_gt(1, 1);
    braincheck_assert_gte(0, 1);
    braincheck_assert_m(1 == 0, "Some message");
    braincheck_assert_eq_m(1, 2, "Some message");
    braincheck_assert_neq_m(1, 1, "Some message");
    braincheck_assert_lt_m(1, 1, "Some message");
    braincheck_assert_lte_m(1, 0, "Some message");
    braincheck_assert_gt_m(1, 1, "Some message");
    braincheck_assert_gte_m(0, 1, "Some message");
    braincheck_once_assert(1 == 0);
    braincheck_once_assert_eq(1, 2);
    braincheck_once_assert_neq(1, 1);
    braincheck_once_assert_lt(1, 1);
    braincheck_once_assert_lte(1, 0);
    braincheck_once_assert_gt(1, 1);
    braincheck_once_assert_gte(0, 1);
    braincheck_once_assert_m(1 == 0, "Some message");
    braincheck_once_assert_eq_m(1, 2, "Some message");
    braincheck_once_assert_neq_m(1, 1, "Some message");
    braincheck_once_assert_lt_m(1, 1, "Some message");
    braincheck_once_assert_lte_m(1, 0, "Some message");
    braincheck_once_assert_gt_m(1, 1, "Some message");
    braincheck_once_assert_gte_m(0, 1, "Some message");
    REQUIRE_THAT(get_message(), Equals(""));
}
