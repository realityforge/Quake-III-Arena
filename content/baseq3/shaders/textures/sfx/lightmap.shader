textures/sfx/lightmap
{
  fogparms ( .7 .1 .1 ) 64
  surfaceparm fog
  surfaceparm nodrop
  surfaceparm nonsolid
  surfaceparm trans
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE
    tcmod scale 1 .01
    tcmod scroll 1 -2
  }
}
