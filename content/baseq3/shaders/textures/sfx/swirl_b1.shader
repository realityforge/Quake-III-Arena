textures/sfx/swirl_b1
{
  q3map_surfacelight 300
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  deformVertexes wave 100 sin 1 2 .1 1
  {
    clampmap textures/sfx/swirl_b1
    blendFunc add
    tcmod rotate -188
  }
  {
    clampmap textures/sfx/swirl_b2
    blendFunc add
    tcmod rotate 333
  }
}
