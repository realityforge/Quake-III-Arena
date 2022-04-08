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
