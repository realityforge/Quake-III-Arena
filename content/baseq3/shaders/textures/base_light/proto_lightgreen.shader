textures/base_light/proto_lightgreen
{
  q3map_surfacelight 300
  q3map_lightimage textures/base_light/proto_lightgreen
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/proto_lightgreen
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/proto_lightgreen
    blendFunc add
  }
}
