textures/base_trim/spiderbite
{
  {
    map textures/sfx/proto_zzztblu2
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod turb 0 .3 0 .2
    tcmod scroll 6 .7
    tcmod scale .4 1
  }
  {
    map textures/base_trim/spiderbite
    blendFunc blend
    rgbGen identity
    tcmod stretch sin .8 .4 0 .2
    tcmod scroll .3 0
  }
  {
    map textures/base_trim/spiderbite
    blendFunc blend
    rgbGen identity
    tcmod stretch sin .8 .2 0 .1
    tcmod scroll -0.5 0
  }
  {
    map textures/base_trim/spiderbite
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
