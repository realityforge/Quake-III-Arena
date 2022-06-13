textures/sfx2/nebula
{
  cull disable
  surfaceparm nomarks
  surfaceparm pointlight
  surfaceparm trans
  {
    map textures/sfx2/nebula
    blendFunc add
    rgbGen vertex
    tcmod scroll .008 .012
  }
  {
    map textures/sfx2/nebula
    blendFunc add
    rgbGen vertex
    tcmod scroll -0.01 .012
    tcmod stretch sin .8 .1 0 .01
  }
}
