textures/sfx2/red_launchpad
{
  qer_editorimage textures/sfx2/launchpad03
  {
    map textures/sfx2/tread
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scroll 0 .7
    tcmod scale 1 2
  }
  {
    map textures/sfx2/rlaunch
    blendFunc add
    rgbGen wave square 0 1 0 2
    alphaGen wave square 0 1 .1 2
    tcmod scale 1 .5
    tcmod scroll 0 2
  }
  {
    map textures/sfx2/launchpad03
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
  {
    map textures/sfx2/rlaunch2
    blendFunc add
    rgbGen wave square 0 1 0 1
    alphaGen wave square 0 1 .1 1
  }
}
