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
#ifndef SERVER_COMMANDS_H
#define SERVER_COMMANDS_H

#define SRVCMD_KILL "kill"
#define SRVCMD_SAY "say"
#define SRVCMD_SAY_TEAM "say_team"
#define SRVCMD_TELL "tell"
#define SRVCMD_GIVE "give"
#define SRVCMD_GOD "god"
#define SRVCMD_NOTARGET "notarget"
#define SRVCMD_NOCLIP "noclip"
#define SRVCMD_TEAM "team"
#define SRVCMD_FOLLOW "follow"
#define SRVCMD_FOLLOWNEXT "follownext"
#define SRVCMD_FOLLOWPREV "followprev"
#define SRVCMD_WHERE "where"
#define SRVCMD_LEVELSHOT "levelshot"
#define SRVCMD_ADDBOT "addbot"
#define SRVCMD_SETVIEWPOS "setviewpos"
#define SRVCMD_CALLVOTE "callvote"
#define SRVCMD_VOTE "vote"
#define SRVCMD_CALLTEAMVOTE "callteamvote"
#define SRVCMD_TEAMVOTE "teamvote"
#define SRVCMD_STATS "stats"
#define SRVCMD_TEAMTASK "teamtask"
#define SRVCMD_LOAD_DEFERRED "loaddeferred"

#ifdef TEAMARENA
#define SRVCMD_VSAY "vsay"
#define SRVCMD_VSAY_TEAM "vsay_team"
#define SRVCMD_VTELL "vtell"
#define SRVCMD_VTAUNT "vtaunt"
#define SRVCMD_VOSAY "vosay"
#define SRVCMD_VOSAY_TEAM "vosay_team"
#define SRVCMD_VOTELL "votell"
#endif

#endif
