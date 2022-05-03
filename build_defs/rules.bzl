# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PLUGIN_COPTS = [
    "-fPIC",
    "-fvisibility=hidden",
    "-fno-common",
]

PLUGIN_LINKOPTS = select({
    "@platforms//os:macos": [
        "-dynamiclib",
        "-mmacosx-version-min=11.0",
        "-exported_symbols_list $(location //build_defs:exported_symbols.lds)",
    ],
})

CLIENT_GAME_COPTS = PLUGIN_COPTS
CLIENT_GAME_LINKOPTS = PLUGIN_LINKOPTS

# TODO: Rename CGAME define into CL_GAME or similar?
CLIENT_GAME_DEFINES = ["CGAME"]

SERVER_GAME_COPTS = PLUGIN_COPTS
SERVER_GAME_LINKOPTS = PLUGIN_LINKOPTS

# TODO: Rename QAGAME define into SV_GAME or similar?
SERVER_GAME_DEFINES = ["QAGAME"]

UI_COPTS = PLUGIN_COPTS
UI_LINKOPTS = PLUGIN_LINKOPTS
UI_DEFINES = ["UI"]

TEAM_ARENA_DEFINES = ["MISSIONPACK"]

# TODO: Should define Q3_VM but can not do that until we get WASM compilation working and/or we stop linking against c library
QVM_DEFINES = []
#QVM_DEFINES = ["Q3_VM"]

ENGINE_DEFINES = ["Q3_ENGINE"]

SERVER_ONLY_ENGINE_DEFINES = ["DEDICATED"] + ENGINE_DEFINES

# Visible for binaries and assets that are part of a final distribution
DIST_VISIBILITY = [
    "//game:__pkg__",
    "//game/mac:__pkg__",
]
