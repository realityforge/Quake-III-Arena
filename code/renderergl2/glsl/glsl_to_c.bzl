def glsl_to_c(name):
    native.genrule(
        name = name + "_generator",
        srcs = [name + ".glsl"],
        outs = [name + ".c"],
        cmd = "$(location //code/tools:stringify) $< $@",
        tools = ["//code/tools:stringify"],
    )

    native.cc_library(
        name = name,
        srcs = [
            ":" + name + "_generator",
        ],
    )
