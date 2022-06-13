textures/sfx/portal_sfx_ring
{
  cull disable
  deformVertexes wave 100 sin 0 2 0 .5
  {
    map textures/sfx/portal_sfx_ring_blue1
    blendFunc blend
  }
  {
    map textures/sfx/portal_sfx_ring_electric
    blendFunc add
    rgbGen wave inversesawtooth 0 1 .2 .5
    tcmod scroll 0 .5
  }
  {
    map textures/sfx/portal_sfx1
    blendFunc filter
    tcmod rotate 360
  }
  {
    map textures/sfx/portal_sfx_ring
    blendFunc add
    rgbGen wave inversesawtooth 0 .5 .2 .5
  }
}
