models/mapobjects/corpse/torso
{
  deformVertexes wave 100 sin 0 .2 0 .2
  {
    map textures/liquids/proto_grueldark
    blendFunc GL_ONE GL_ZERO
    tcmod scale 4 4
    tcmod scroll 0 -0.09
    tcmod turb 0 .05 0 .05
  }
  {
    map models/mapobjects/corpse/torso
    blendFunc blend
    rgbGen vertex
  }
}
