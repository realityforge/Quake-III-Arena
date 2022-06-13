textures/ctf2/pj_baseboardb
{
  {
    map textures/ctf2/pj_baseboardb
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/ctf2/pj_baseboardb_l
    blendFunc add
    rgbGen wave sin .9 .5 0 .1
  }
}
