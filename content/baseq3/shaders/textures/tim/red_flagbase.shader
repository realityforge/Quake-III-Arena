textures/tim/red_flagbase
{
  qer_editorimage textures/tim/flagbase
  {
    map textures/tim/swirl_red
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 130
    tcmod stretch sin .7 .5 0 .2
  }
  {
    map textures/tim/swirl_red
    blendFunc add
    rgbGen identity
    tcmod rotate 80
    tcmod stretch sin .7 .5 0 .1
  }
  {
    map textures/tim/flagbase
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
