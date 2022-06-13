textures/eerie/xq1metalbig_nojumppad
{
  surfaceparm nodamage
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xq1metalbig_nojumppad
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/xq1metalbig_nojumppad_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
