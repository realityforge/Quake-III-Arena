textures/base_floor/pjgrate1kc
{
  qer_editorimage textures/base_floor/proto_grate5
  cull disable
  surfaceparm metalsteps
  {
    map textures/base_floor/proto_grate5
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
