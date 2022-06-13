models/players/pi/pi
{
  {
    map $whiteimage
    rgbGen lightingDiffuse
  }
  {
    map models/players/pi/pi
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
