textures/base_object/plasmalogo_1
{
  q3map_surfacelight 1000
  q3map_lightimage textures/base_object/plasmalogo
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_object/plasmalogo_1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_object/plasmalogo
    blendFunc add
    rgbGen wave triangle .5 .5 .5 .15
  }
}
