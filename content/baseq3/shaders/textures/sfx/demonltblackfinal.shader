textures/sfx/demonltblackfinal
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/demonltblackfinal_glow2
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/demonltblackfinal
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/demonltblackfinal_glow2
    blendFunc add
    rgbGen wave sin .9 .1 0 5
  }
}
