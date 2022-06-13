textures/ctf2/pj_baseboardr
{
  {
    map textures/ctf2/pj_baseboardr
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/ctf2/pj_baseboardr_l
    blendFunc add
    rgbGen wave sin .9 .5 0 .1
  }
}
