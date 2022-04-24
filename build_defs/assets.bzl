# A Bazel macro that takes a list of TGA files that are named "*.tga" and a string label indicating the package
# in which the files are exported. The macro defines targets to convert each .tga file into a .png file and
# defines a fileset that contains all the converted images.
def convert_tga_to_png(package_label, files, fileset):
    for file in files:
        _file_sans_extension = file.removesuffix(".tga")
        _input_label = "%s:%s" % (package_label, file)
        _output_file = "%s.png" % _file_sans_extension
        native.genrule(
            name = "%s.png_gen" % _file_sans_extension,
            srcs = [_input_label],
            outs = [_output_file],
            # Previously also checked Channels=%[channels] = srgba but some of the assets from wider community do not comply with this
            cmd = """
export INPUT=$(location %s)
export PROPERTIES=`$(location @imagemagick//:magick) identify -format "BitDepth=%%[bit-depth] ColorSpace=%%[colorspace]" $${INPUT}`
export EXPECTED_PROPERTIES="BitDepth=8 ColorSpace=sRGB"
if [ "$${PROPERTIES}" != "$${EXPECTED_PROPERTIES}" ]; then
    echo "File $${INPUT} has properties $${PROPERTIES} and not expected properties $${EXPECTED_PROPERTIES}"
    exit 1
fi
$(location @imagemagick//:magick) convert $${INPUT} $@ && $(location @imagemagick//:magick) compare -metric RMSE $${INPUT} png32:$@ null: 2>/dev/null
""" % (_input_label),
            tools = ["@imagemagick//:magick"],
        )

    native.filegroup(
        name = fileset,
        srcs = ["%s.png" % file.removesuffix(".tga") for file in files],
        visibility = ["//game/baseq3:__pkg__"],
    )
