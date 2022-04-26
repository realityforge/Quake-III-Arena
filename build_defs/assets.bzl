# A Bazel macro that takes a list of TGA files that are named "*.tga" and a string label indicating the package
# in which the files are exported. The macro defines targets to convert each .tga file into a .png file and
# defines a fileset that contains all the converted images.
def convert_tga_to_png(package_label, files, fileset):
    for file in files:
        _file_sans_extension = file.removesuffix(".tga").removesuffix(".TGA")
        _input_label = "%s:%s" % (package_label, file)
        _output_file = "%s.png" % _file_sans_extension
        native.genrule(
            name = "%s.png_gen" % _file_sans_extension,
            srcs = [_input_label],
            outs = [_output_file],
            cmd = """
export INPUT=$(location %s)
$(location @imagemagick//:magick) convert "$${INPUT}" "$@" && $(location @imagemagick//:magick) compare -metric RMSE "$${INPUT}" "png32:$@" null: 2>/dev/null
""" % (_input_label),
            tools = ["@imagemagick//:magick"],
        )

    native.filegroup(
        name = fileset,
        srcs = ["%s.png" % file.removesuffix(".tga").removesuffix(".TGA") for file in files],
        visibility = ["//game/baseq3:__pkg__", "//game/teamarena:__pkg__"],
    )