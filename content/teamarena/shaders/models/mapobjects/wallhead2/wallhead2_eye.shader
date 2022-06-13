models/mapobjects/wallhead2/wallhead2_eye
{
  cull disable
  surfaceparm trans
  deformVertexes autoSprite
  {
    clampmap models/mapobjects/wallhead2/wallhead2_eye
    blendFunc add
    rgbGen wave sin .5 .2 0 0
    tcmod rotate 160
  }
}
