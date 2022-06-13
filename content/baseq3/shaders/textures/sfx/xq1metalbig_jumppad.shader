textures/sfx/xq1metalbig_jumppad
{
  surfaceparm nodamage
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/q1metal7_98d_256x256
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/surface6jumppad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
    tcmod stretch sin .8 .2 0 1
  }
}
