textures/sfx2/swirl_r1
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  deformVertexes wave 100 sin 1 2 .1 1
  {
    clampmap textures/sfx2/swirl_r1
    blendFunc add
    tcmod rotate -188
  }
  {
    clampmap textures/sfx2/swirl_r2
    blendFunc add
    tcmod rotate 333
  }
}
