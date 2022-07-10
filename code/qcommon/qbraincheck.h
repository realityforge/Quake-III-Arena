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

#ifndef QBRAINCHECK_H
#define QBRAINCHECK_H

#include "qcommon.h"

#define BRAINCHECK_FORMAT_START_LOCATION S_COLOR_CYAN
#define BRAINCHECK_FORMAT_START_FUNCTION S_COLOR_BLUE
#define BRAINCHECK_FORMAT_START_EXPRESSION S_COLOR_GREEN
#define BRAINCHECK_FORMAT_START_VALUE S_COLOR_WHITE
#define BRAINCHECK_FORMAT_START_ASSERT S_COLOR_RED

#define BRAINCHECK_NON_FATAL_ASSERTS
#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wgnu-zero-variadic-macro-arguments"
#define BRAINCHECK_PRINTF(args...) Com_Printf(args)
#include "braincheck.h"

#endif
