textures/base_light/proto_lightred2
{
  q3map_surfacelight 1000
  q3map_lightimage textures/base_light/proto_lightred
  q3map_flare flareshader
  qer_editorimage textures/base_light/proto_lightred
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/proto_lightred
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/proto_lightred
    blendFunc add
    rgbGen wave square .5 .5 0 1
  }
}
