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

#include "test_support.inc"

using Catch::Matchers::ContainsSubstring;
using Catch::Matchers::StartsWith;

extern "C" void func1()
{
    braincheck_backtrace();
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

TEST_CASE("Backtrace includes file, line and function as well as stack")
{
    message_init();
    func4();
    const std::string message = get_message();

#if defined(__clang__) || defined(__GNUC__)
#define EXPECTED_FUNC_NAME "void func1()"
#else
#define EXPECTED_FUNC_NAME "func1"
#endif

    REQUIRE_THAT(message, StartsWith(__FILE__ ":22: " EXPECTED_FUNC_NAME));
#ifdef DEBUG
    REQUIRE_THAT(message, ContainsSubstring("func2"));
    REQUIRE_THAT(message, ContainsSubstring("func3"));
    REQUIRE_THAT(message, ContainsSubstring("func4"));
#endif
}
