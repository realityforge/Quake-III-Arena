textures/base_floor/nomarkstone_1
{
  q3map_lightimage textures/base_floor/smallstone
  q3map_globaltexture
  qer_editorimage textures/base_floor/nomarkstone
  surfaceparm noimpact
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/smallstone
    blendFunc filter
    rgbGen identity
    tcmod scale 2 2
  }
}
