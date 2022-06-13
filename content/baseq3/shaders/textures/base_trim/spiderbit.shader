textures/base_trim/spiderbit
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_trim/spiderbit_fx
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/spiderbit
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_trim/spiderbit_fx
    blendFunc add
    rgbGen wave triangle .1 .5 0 7
  }
}
