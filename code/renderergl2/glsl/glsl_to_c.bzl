def glsl_to_c(name):
    native.genrule(
        name = name + "_generator",
        srcs = [name + ".glsl"],
        outs = [name + ".c"],
        cmd = "$(location :stringify) $< $@",
        tools = [":stringify"],
    )

    native.cc_library(
        name = name,
        srcs = [
            ":" + name + "_generator",
        ],
    )
