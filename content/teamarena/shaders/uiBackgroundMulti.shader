uiBackgroundMulti
{
  {
    map ui/assets/background
    rgbGen identity
  }
  {
    map ui/assets/multi_alpha
    blendFunc GL_ZERO GL_SRC_ALPHA
    rgbGen identity
    tcmod scroll .05 .05
    tcmod scale 1.5 3
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
