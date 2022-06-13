textures/base_wall2/ntrl_techfloor_kc
{
  qer_editorimage textures/base_wall2/techfloor_kc
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  {
    clampmap textures/base_wall2/zzztntrl_kc
    depthWrite
    alphaFunc GE128
    rgbGen wave sin .8 .2 0 2
    tcmod rotate 360
  }
  {
    clampmap textures/base_wall2/techfloor2_kc
    depthFunc equal
    blendFunc blend
    rgbGen identity
    tcmod rotate 180
    tcmod stretch sin .8 .1 0 .4
  }
  {
    map textures/base_wall2/techfloor_kc
    depthFunc equal
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall2/techfloor_kc_shadow
    blendFunc filter
    rgbGen identity
  }
}
