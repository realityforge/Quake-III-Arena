load("//third_party/content:metadata.bzl", _PAK_DATA = "PAK_DATA")

# A Bazel macro that takes a list of TGA files that are named "*.tga" and a string label indicating the package
# in which the files are exported. The macro defines targets to convert each .tga file into a .png file and
# defines a fileset that contains all the converted images.
def convert_tga_to_png(name):
    package_label = "@%s//" % name
    files = _PAK_DATA[name]["tga_files"]
    output_files = []
    for file in files:
        _file_sans_extension = file.removesuffix(".tga").removesuffix(".TGA").lower()
        _input_label = "%s:%s" % (package_label, file)
        _output_file = "%s.png" % _file_sans_extension
        _target_name = "%s.png_gen" % _file_sans_extension
        output_files.append(_target_name)
        native.genrule(
            name = _target_name,
            srcs = [_input_label],
            outs = [_output_file],
            cmd = """
export INPUT=$(location %s)
$(location @imagemagick//:magick) convert -auto-orient "$${INPUT}" "$@" && $(location @pngcrush) -brute -ow -warn "$@" && $(location @imagemagick//:magick) compare -auto-orient -metric RMSE "$${INPUT}" "png32:$@" null: 2>/dev/null
""" % (_input_label),
            tools = ["@imagemagick//:magick", "@pngcrush"],
        )

    native.filegroup(name = "png_files", srcs = output_files, visibility = ["//visibility:public"])
