textures/eerie/xq1metalbig_jumppad
{
  q3map_surfacelight 250
  surfaceparm nodamage
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/q1metal7_98d_256x256
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/eerie/surface6jumppad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
  }
}
