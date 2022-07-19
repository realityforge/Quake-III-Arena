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

# TODO: Add "-Wunused-parameter"
# TODO: Add "-Wmissing-variable-declarations"
EXTRA_WARNINGS = ["-Wall", "-Wpedantic", "-Werror", "-Wmissing-prototypes"] + select({
    "//build_defs:wasm": [
        # For some reason strict-prototypes warning triggers when running emcc toolchain
        "-Wno-strict-prototypes",
        # The emcc toolchain expects a main but we don't provide one
        "-Wno-emcc",
    ],
    "@platforms//os:macos": [],
})

FULL_WARNINGS = EXTRA_WARNINGS + [
    "-Wextra",
    "-Weverything",
]

PLUGIN_COPTS = EXTRA_WARNINGS + [
    "-fPIC",
    "-fvisibility=hidden",
    "-fno-common",
]

PLUGIN_LINKOPTS = select({
    "//build_defs:wasm": [
        "-shared",
        "-s ALLOW_MEMORY_GROWTH=1",
        "-s DEFAULT_LIBRARY_FUNCS_TO_INCLUDE=[]",
        "-s DISABLE_EXCEPTION_CATCHING=1",
        "-s FILESYSTEM=0",
        "-s EXIT_RUNTIME=0",
        "-s EXPORTED_FUNCTIONS='[\"_dllEntry\", \"_vmMain\"]'",
    ],
    "@platforms//os:macos": [
        "-dynamiclib",
        "-exported_symbols_list $(rootpath //build_defs:exported_symbols.lds)",
    ],
})

BASE_DEFINES = ["USE_VOIP"]

CLIENT_GAME_COPTS = PLUGIN_COPTS
CLIENT_GAME_LINKOPTS = PLUGIN_LINKOPTS

# TODO: Rename CGAME define into CL_GAME or similar?
CLIENT_GAME_DEFINES = ["CGAME", "ENABLE_DDS_TEXTURES"] + BASE_DEFINES

SERVER_GAME_COPTS = PLUGIN_COPTS + EXTRA_WARNINGS
SERVER_GAME_LINKOPTS = PLUGIN_LINKOPTS

# TODO: Rename QAGAME define into SV_GAME or similar?
SERVER_GAME_DEFINES = ["QAGAME"] + BASE_DEFINES

UI_COPTS = PLUGIN_COPTS + EXTRA_WARNINGS
UI_LINKOPTS = PLUGIN_LINKOPTS
UI_DEFINES = ["UI"] + BASE_DEFINES

TEAM_ARENA_DEFINES = ["MISSIONPACK"]

# TODO: Should define Q3_VM but can not do that until we get WASM compilation working and/or we stop linking against c library
QVM_DEFINES = []
#QVM_DEFINES = ["Q3_VM"]

ENGINE_DEFINES = ["Q3_ENGINE"] + BASE_DEFINES

SERVER_ONLY_ENGINE_DEFINES = ["DEDICATED"] + ENGINE_DEFINES

# Visible for binaries and assets that are part of a final distribution
DIST_VISIBILITY = [
    "//game:__pkg__",
    "//game/mac:__pkg__",
]
