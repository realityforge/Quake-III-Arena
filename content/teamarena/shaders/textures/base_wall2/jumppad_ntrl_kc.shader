textures/base_wall2/jumppad_ntrl_kc
{
  qer_editorimage textures/base_wall2/jumppad_blue_kc
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/base_wall2/jumppad_blue_kc
    depthWrite
    alphaFunc GE128
    rgbGen identity
  }
  {
    map textures/sfx2/jumpadn
    depthFunc equal
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 130
  }
  {
    map textures/sfx2/fan01
    depthFunc equal
    blendFunc blend
    rgbGen identity
    tcmod rotate -311
  }
  {
    clampmap textures/sfx2/jumpadn2
    depthFunc equal
    blendFunc add
    rgbGen wave square .5 .5 .25 1.4
    tcmod rotate 130
    tcmod stretch sin 1.2 .8 0 1.4
  }
  {
    map textures/sfx2/jumpad01
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
    map textures/base_wall2/jumppad_shadow
    blendFunc filter
    rgbGen identity
  }
}
