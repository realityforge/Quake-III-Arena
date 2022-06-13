textures/liquids/lavacrust
{
  q3map_surfacelight 50
  q3map_lightimage textures/liquids/lava
  q3map_globaltexture
  surfaceparm trans
  {
    map textures/liquids/lava
    rgbGen wave triangle .9 .1 0 1
    tcmod turb 0 .1 0 .02
    tcmod scroll -0.02 -0.02
  }
  {
    map textures/liquids/lavacrust
    blendFunc blend
    rgbGen identity
    tcmod turb 0 .5 0 .005
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
