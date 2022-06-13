textures/sfx2/demonltblacknolight
{
  q3map_lightimage textures/sfx/demonltblackfinal_glow2
  qer_editorimage textures/sfx/demonltblackfinal
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
