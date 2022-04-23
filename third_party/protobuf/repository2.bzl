load("@com_google_protobuf//:protobuf_deps.bzl", _protobuf_deps = "protobuf_deps")

def configure_repository():
    _protobuf_deps()
