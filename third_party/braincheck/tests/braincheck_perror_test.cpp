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
using Catch::Matchers::EndsWith;
using Catch::Matchers::StartsWith;

TEST_CASE("braincheck_perror")
{
    message_init();
    errno = EDOM;
    braincheck_perror("Some maths operation");
    const std::string message = get_message();

    REQUIRE_THAT(message, StartsWith(__FILE__ ":25: "));
    REQUIRE_THAT(message, ContainsSubstring("Some maths operation - "));
    // Unclear if the exact text is consistent across platforms but this is how MacOS emits this message
    REQUIRE_THAT(message, EndsWith("Numerical argument out of domain"));
}
