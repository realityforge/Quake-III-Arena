textures/base_light/s_proto_light
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_light/s_proto_lightmap
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/proto_light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/proto_lightmap
    blendFunc add
    rgbGen wave sin .5 .5 1 .1
  }
  {
    map textures/base_light/proto_light2
    blendFunc add
    rgbGen wave triangle 1 5 1 3
  }
  {
    map textures/base_light/proto_light2
    blendFunc add
    rgbGen wave triangle 1 2 0 7
    tcmod scale -1 -1
  }
}
