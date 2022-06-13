textures/sfx/donna
{
  q3map_surfacelight 300
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
  {
    map textures/sfx/donna
    blendFunc add
    rgbGen wave triangle 1 2 0 7
  }
  {
    map textures/sfx/donna
    blendFunc add
    rgbGen wave sin 1 2 0 8
  }
}
