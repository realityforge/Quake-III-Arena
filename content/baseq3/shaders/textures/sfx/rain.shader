textures/sfx/rain
{
  qer_trans .5
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  deformVertexes move 3 1 0 sin 0 5 0 .2
  deformVertexes move .6 3.3 0 sin 0 5 0 .4
  deformVertexes wave 30 sin 0 10 0 .2
  {
    map textures/sfx/rain
    blendFunc add
    tcmod scroll .5 -8
    tcmod turb .1 .25 0 -0.1
  }
  {
    map textures/sfx/rain
    blendFunc add
    tcmod scroll .01 -6.3
  }
}
