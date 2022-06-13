textures/sfx/portal_sfx
{
  portal
  surfaceparm nolightmap
  deformVertexes wave 100 sin 0 2 0 .5
  {
    map textures/sfx/portal_sfx3
    depthWrite
    blendFunc blend
  }
  {
    map textures/sfx/portal_sfx1
    blendFunc filter
    tcmod rotate 360
  }
  {
    map textures/sfx/portal_sfx
    blendFunc add
    rgbGen wave inversesawtooth 0 .5 .2 .5
  }
  {
    map textures/sfx/portalfog
    blendFunc blend
    rgbGen identityLighting
    alphaGen portal 256
    tcmod turb 0 .5 0 1
    tcmod rotate .1
    tcmod scroll .01 .03
  }
}
