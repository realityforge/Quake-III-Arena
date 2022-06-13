textures/hell/lavasolid
{
  q3map_surfacelight 450
  q3map_globaltexture
  tesssize 64
  surfaceparm noimpact
  surfaceparm nolightmap
  deformVertexes wave 100 sin 2 2 0 .1
  {
    map textures/hell/lava2d
    tcGen environment
    tcmod turb 0 .25 0 .05
  }
  {
    map textures/hell/lava2d
    blendFunc add
    tcmod turb 0 .25 0 .05
  }
}
