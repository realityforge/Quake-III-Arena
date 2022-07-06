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

#define BRAINCHECK_DISABLE
#include "test_support.inc"

using Catch::Matchers::Equals;

#if defined(__clang__) || defined(__GNUC__)
#define UNUSED __attribute__((unused))
#else
#define UNUSED
#endif

TEST_CASE("braincheck_perror - DISABLED")
{
    message_init();
    braincheck_debug(1 == 1 ? true : false);
    UNUSED const short values[] = {1, -42, 73};
    braincheck_debug_array(values, 2);
    braincheck_debug_hexdump(values, COUNTOF(values));
    braincheck_backtrace();
    braincheck_backtrace_n(1);
    errno = EDOM;
    braincheck_perror("Some maths operation");
    REQUIRE_THAT(get_message(), Equals(""));
}
