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
    void* myValue = NULL;
    braincheck_debug(myValue);
    assert_debug_message("myValue", "0x0");
}

TEST_CASE("braincheck_debug_array(bool[])")
{
    message_init();
    bool values[] = { true, false, true, false, false, true };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[true, false, true]");
}

TEST_CASE("braincheck_debug_array(char[])")
{
    message_init();
    char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[a, b, c]");
}

TEST_CASE("braincheck_debug_array(signed char[])")
{
    message_init();
    signed char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[a, b, c]");
}

TEST_CASE("braincheck_debug_array(unsigned char[])")
{
    message_init();
    unsigned char values[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[a, b, c]");
}

TEST_CASE("braincheck_debug_array(short[])")
{
    message_init();
    short values[] = { 1, -42, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, -42, 73]");
}

TEST_CASE("braincheck_debug_array(unsigned short[])")
{
    message_init();
    unsigned short values[] = { 1, 42, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, 42, 73]");
}

TEST_CASE("braincheck_debug_array(int[])")
{
    message_init();
    int values[] = { 1, -42424242, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, -42424242, 73]");
}

TEST_CASE("braincheck_debug_array(unsigned int[])")
{
    message_init();
    unsigned int values[] = { 1, 42424242, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, 42424242, 73]");
}

TEST_CASE("braincheck_debug_array(long[])")
{
    message_init();
    long values[] = { 1, -4242424242424242424, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, -4242424242424242424, 73]");
}

TEST_CASE("braincheck_debug_array(unsigned long[])")
{
    message_init();
    unsigned long values[] = { 1, 4242424242424242424, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, 4242424242424242424, 73]");
}

TEST_CASE("braincheck_debug_array(long long[])")
{
    message_init();
    long long values[] = { 1, -4242424242424242424, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, -4242424242424242424, 73]");
}

TEST_CASE("braincheck_debug_array(unsigned long long[])")
{
    message_init();
    unsigned long long values[] = { 1, 4242424242424242424, 73, 11, 13, 7 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1, 4242424242424242424, 73]");
}

TEST_CASE("braincheck_debug_array(float[])")
{
    message_init();
    float values[] = { 1.0F, -4.2F, 7.3F, 1.0F, 13.1F, 7.3F };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1.000000, -4.200000, 7.300000]");
}

TEST_CASE("braincheck_debug_array(double[])")
{
    message_init();
    double values[] = { 1.0, -4.2, 7.3, 1.0, 13.1, 7.3 };
    braincheck_debug_array(values, 3);
    assert_debug_message("values", "[1.000000, -4.200000, 7.300000]");
}

static void assert_debug_hexdump_message(const char* expression, const char* value, const unsigned int length)
{
    char num[100] = "";
    snprintf(num, sizeof(num), "%u", length);

    char expected[10000] = " - '";
    strncat(expected, expression, sizeof(expected) - 1);
    strncat(expected, "' (length = ", sizeof(expected) - 1);
    strncat(expected, num, sizeof(expected) - 1);
    strncat(expected, ")\n", sizeof(expected) - 1);
    strncat(expected, value, sizeof(expected) - 1);

    const std::string message = get_message();
    REQUIRE_THAT(message, StartsWith(__FILE__ ":"));
    REQUIRE_THAT(message, EndsWith(expected));
}

TEST_CASE("braincheck_debug_hexdump(bool[])")
{
    message_init();
    bool values[] = {
        true, true, true, false, false, true, true, true,
        true, true, true, true, false, true, true, true,
        true, true, true, true, false, true, true, true
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 01 01 00 00 01 01 01  01 01 01 01 00 01 01 01 '................'\n"
                                 "    00000010: 01 01 01 01 00 01 01 01                          '........'\n",
                                 24);
}

TEST_CASE("braincheck_debug_hexdump(char[])")
{
    message_init();
    char values[] = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 61 62 63 64 65 66 67 68  69 6a 6b 6c 6d 6e 6f 70 'abcdefghijklmnop'\n"
                                 "    00000010: 00 01 02                                         '...'\n",
                                 19);
}

TEST_CASE("braincheck_debug_hexdump(signed char[])")
{
    message_init();
    signed char values[] = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 61 62 63 64 65 66 67 68  69 6a 6b 6c 6d 6e 6f 70 'abcdefghijklmnop'\n"
                                 "    00000010: 00 01 02                                         '...'\n",
                                 19);
}

TEST_CASE("braincheck_debug_hexdump(unsigned char[])")
{
    message_init();
    unsigned char values[] = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 61 62 63 64 65 66 67 68  69 6a 6b 6c 6d 6e 6f 70 'abcdefghijklmnop'\n"
                                 "    00000010: 00 01 02                                         '...'\n",
                                 19);
}

TEST_CASE("braincheck_debug_hexdump(short[])")
{
    message_init();
    short values[] = {
        1, -42, 73, 11, 13, 7, 126, 254,
        1, -42, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 d6 ff 49 00 0b 00  0d 00 07 00 7e 00 fe 00 '....I.......~...'\n"
                                 "    00000010: 01 00 d6 ff 49 00 0b 00  0d 00 07 00 7e 00 fe 00 '....I.......~...'\n"
                                 "    00000020: 00 00 01 00 02 00                                '......'\n",
                                 38);
}

TEST_CASE("braincheck_debug_hexdump(unsigned short[])")
{
    message_init();
    unsigned short values[] = {
        1, 42, 73, 11, 13, 7, 126, 254,
        1, 42, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 2a 00 49 00 0b 00  0d 00 07 00 7e 00 fe 00 '..*.I.......~...'\n"
                                 "    00000010: 01 00 2a 00 49 00 0b 00  0d 00 07 00 7e 00 fe 00 '..*.I.......~...'\n"
                                 "    00000020: 00 00 01 00 02 00                                '......'\n",
                                 38);
}

TEST_CASE("braincheck_debug_hexdump(int[])")
{
    message_init();
    int values[] = {
        1, -42, 73, 11, 13, 7, 126, 254,
        1, -42, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 00 00 d6 ff ff ff  49 00 00 00 0b 00 00 00 '........I.......'\n"
                                 "    00000010: 0d 00 00 00 07 00 00 00  7e 00 00 00 fe 00 00 00 '........~.......'\n"
                                 "    00000020: 01 00 00 00 d6 ff ff ff  49 00 00 00 0b 00 00 00 '........I.......'\n"
                                 "    00000030: 0d 00 00 00 07 00 00 00  7e 00 00 00 fe 00 00 00 '........~.......'\n"
                                 "    00000040: 00 00 00 00 01 00 00 00  02 00 00 00             '............'\n",
                                 76);
}

TEST_CASE("braincheck_debug_hexdump(unsigned int[])")
{
    message_init();
    unsigned int values[] = {
        1, 42, 73, 11, 13, 7, 126, 254,
        1, 42, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 00 00 2a 00 00 00  49 00 00 00 0b 00 00 00 '....*...I.......'\n"
                                 "    00000010: 0d 00 00 00 07 00 00 00  7e 00 00 00 fe 00 00 00 '........~.......'\n"
                                 "    00000020: 01 00 00 00 2a 00 00 00  49 00 00 00 0b 00 00 00 '....*...I.......'\n"
                                 "    00000030: 0d 00 00 00 07 00 00 00  7e 00 00 00 fe 00 00 00 '........~.......'\n"
                                 "    00000040: 00 00 00 00 01 00 00 00  02 00 00 00             '............'\n",
                                 76);
}

TEST_CASE("braincheck_debug_hexdump(long[])")
{
    message_init();
    long values[] = {
        1, -4242424242424242424, 73, 11, 13, 7, 126, 254,
        1, -4242424242424242424, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 00 00 00 00 00 00  08 1f cc fb a0 e1 1f c5 '................'\n"
                                 "    00000010: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000020: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000030: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000040: 01 00 00 00 00 00 00 00  08 1f cc fb a0 e1 1f c5 '................'\n"
                                 "    00000050: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000060: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000070: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000080: 00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00 '................'\n"
                                 "    00000090: 02 00 00 00 00 00 00 00                          '........'\n",
                                 152);
}

TEST_CASE("braincheck_debug_hexdump(unsigned long[])")
{
    message_init();
    unsigned long values[] = {
        1, 4242424242424242424, 73, 11, 13, 7, 126, 254,
        1, 4242424242424242424, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 00 00 00 00 00 00  f8 e0 33 04 5f 1e e0 3a '..........3._..:'\n"
                                 "    00000010: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000020: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000030: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000040: 01 00 00 00 00 00 00 00  f8 e0 33 04 5f 1e e0 3a '..........3._..:'\n"
                                 "    00000050: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000060: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000070: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000080: 00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00 '................'\n"
                                 "    00000090: 02 00 00 00 00 00 00 00                          '........'\n",
                                 152);
}

TEST_CASE("braincheck_debug_hexdump(long long[])")
{
    long long values[] = {
        1, -4242424242424242424, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 00 00 00 00 00 00  08 1f cc fb a0 e1 1f c5 '................'\n"
                                 "    00000010: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000020: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000030: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000040: 00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00 '................'\n"
                                 "    00000050: 02 00 00 00 00 00 00 00                          '........'\n",
                                 88);
}

TEST_CASE("braincheck_debug_hexdump(unsigned long long[])")
{
    unsigned long long values[] = {
        1, 4242424242424242424, 73, 11, 13, 7, 126, 254,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 01 00 00 00 00 00 00 00  f8 e0 33 04 5f 1e e0 3a '..........3._..:'\n"
                                 "    00000010: 49 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00 'I...............'\n"
                                 "    00000020: 0d 00 00 00 00 00 00 00  07 00 00 00 00 00 00 00 '................'\n"
                                 "    00000030: 7e 00 00 00 00 00 00 00  fe 00 00 00 00 00 00 00 '~...............'\n"
                                 "    00000040: 00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00 '................'\n"
                                 "    00000050: 02 00 00 00 00 00 00 00                          '........'\n",
                                 88);
}

TEST_CASE("braincheck_debug_hexdump(float[])")
{
    message_init();
    float values[] = {
        1.0F, -4.2F, 7.3F, 1.0F, 13.1F, 7.3F,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 00 00 80 3f 66 66 86 c0  9a 99 e9 40 00 00 80 3f '...?ff.....@...?'\n"
                                 "    00000010: 9a 99 51 41 9a 99 e9 40  00 00 00 00 00 00 80 3f '..QA...@.......?'\n"
                                 "    00000020: 00 00 00 40                                      '...@'\n",
                                 36);
}

TEST_CASE("braincheck_debug_hexdump(double[])")
{
    message_init();
    double values[] = {
        1.0F, -4.2F, 7.3F, 1.0F, 13.1F, 7.3F,
        0, 1, 2
    };
    braincheck_debug_hexdump(values, COUNTOF(values));
    assert_debug_hexdump_message("values",
                                 ""
                                 "    00000000: 00 00 00 00 00 00 f0 3f  00 00 00 c0 cc cc 10 c0 '.......?........'\n"
                                 "    00000010: 00 00 00 40 33 33 1d 40  00 00 00 00 00 00 f0 3f '...@33.@.......?'\n"
                                 "    00000020: 00 00 00 40 33 33 2a 40  00 00 00 40 33 33 1d 40 '...@33*@...@33.@'\n"
                                 "    00000030: 00 00 00 00 00 00 00 00  00 00 00 00 00 00 f0 3f '...............?'\n"
                                 "    00000040: 00 00 00 00 00 00 00 40                          '.......@'\n",
                                 72);
}
