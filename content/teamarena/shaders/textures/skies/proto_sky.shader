textures/skies/proto_sky
{
  q3map_sun .473 .243 .314 30 35 78
  q3map_surfacelight 30
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/proto_sky
    depthWrite
    tcmod scroll .02 .04
    tcmod scale 3 4
  }
  {
    map textures/skies/proto_sky2
    blendFunc add
    tcmod scroll .005 .005
    tcmod scale 3 3
  }
}
