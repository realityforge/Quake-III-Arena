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

#define BRAINCHECK_NO_DEBUG
#include "test_support.inc"

using Catch::Matchers::Equals;

#if defined(__clang__) || defined(__GNUC__)
#define UNUSED __attribute__((unused))
#else
#define UNUSED
#endif

TEST_CASE("braincheck_debug - DISABLED")
{
    message_init();
    {
        braincheck_debug(1 == 1 ? true : false);
    }
    {
        UNUSED char ch = 'q';
        braincheck_debug(ch);
    }
    {
        UNUSED signed char ch = 'q';
        braincheck_debug(ch);
    }
    {
        UNUSED unsigned char ch = 'q';
        braincheck_debug(ch);
    }
    {
        UNUSED short myValue = -42;
        braincheck_debug(myValue);
    }
    {
        UNUSED unsigned short myValue = 42;
        braincheck_debug(myValue);
    }
    {
        UNUSED int myValue = -42424242;
        braincheck_debug(myValue);
    }
    {
        UNUSED unsigned int myValue = 42424242;
        braincheck_debug(myValue);
    }
    {
        UNUSED long myValue = -4242424242424242424;
        braincheck_debug(myValue);
    }
    {
        UNUSED unsigned long myValue = 4242424242424242424;
        braincheck_debug(myValue);
    }
    {
        UNUSED long long myValue = -4242424242424242424;
        braincheck_debug(myValue);
    }
    {
        UNUSED unsigned long long myValue = 4242424242424242424;
        braincheck_debug(myValue);
    }
    {
        UNUSED float myValue = -4.2F;
        braincheck_debug(myValue);
    }
    {
        UNUSED double myValue = -4.2;
        braincheck_debug(myValue);
    }
    {
        UNUSED void* myValue = NULL;
        braincheck_debug(myValue);
    }
    REQUIRE_THAT(get_message(), Equals(""));
}

TEST_CASE("braincheck_debug_array - DISABLED")
{
    message_init();
    {
        UNUSED bool values[] = { true, false, true, false, false, true };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED signed char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED unsigned char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED short values[] = { 1, -42, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED unsigned short values[] = { 1, 42, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED int values[] = { 1, -42424242, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED unsigned int values[] = { 1, 42424242, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED long values[] = { 1, -4242424242424242424, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED unsigned long values[] = { 1, 4242424242424242424, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED long long values[] = { 1, -4242424242424242424, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED unsigned long long values[] = { 1, 4242424242424242424, 73, 11, 13, 7 };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED float values[] = { 1.0F, -4.2F, 7.3F, 1.0F, 13.1F, 7.3F };
        braincheck_debug_array(values, 3);
    }
    {
        UNUSED double values[] = { 1.0, -4.2, 7.3, 1.0, 13.1, 7.3 };
        braincheck_debug_array(values, 3);
    }
    REQUIRE_THAT(get_message(), Equals(""));
}

#define COUNTOF(var) (sizeof(var) / (&(var)[1] - &(var)[0]))

TEST_CASE("braincheck_debug_hexdump - DISABLED")
{
    message_init();
    {
        UNUSED bool values[] = { true, true, true, false, false, true, true, true };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED char values[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED signed char values[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED unsigned char values[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED short values[] = { 1, -42, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED unsigned short values[] = { 1, 42, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED int values[] = { 1, -42, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED unsigned int values[] = { 1, 42, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED long values[] = { 1, -4242424242424242424, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED unsigned long values[] = { 1, 4242424242424242424, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED long long values[] = { 1, -4242424242424242424, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED unsigned long long values[] = { 1, 4242424242424242424, 73, 11, 13, 7, 126, 254, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED float values[] = { 1.0F, -4.2F, 7.3F, 1.0F, 13.1F, 7.3F, 0, 1, 2 };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    {
        UNUSED double values[] = { 1.0F, -4.2F };
        braincheck_debug_hexdump(values, COUNTOF(values));
    }
    REQUIRE_THAT(get_message(), Equals(""));
}
