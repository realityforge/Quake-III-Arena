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

UI_COPTS = PLUGIN_COPTS
UI_LINKOPTS = PLUGIN_LINKOPTS
