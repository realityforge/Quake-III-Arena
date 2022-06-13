textures/base_wall/protobanner_still
{
  tesssize 64
  qer_editorimage textures/base_wall/protobanner
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/base_wall/protobanner
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
