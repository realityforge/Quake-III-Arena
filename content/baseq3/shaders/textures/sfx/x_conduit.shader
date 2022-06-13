textures/sfx/x_conduit
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/x_conduit
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/x_conduit
    blendFunc filter
    rgbGen identity
  }
  {
    animMap 10 textures/sfx/x_conduit2 textures/sfx/x_conduit3
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 10
  }
  {
    map textures/sfx/x_conduit2
    blendFunc add
    rgbGen wave sin .5 .5 0 7
    tcmod scale -1 1
  }
  {
    map textures/sfx/x_conduit3
    blendFunc add
    rgbGen wave triangle .2 1 0 9
    tcmod scale -1 1
  }
}
