models/brandon/braneye
{
  {
    map $whiteimage
    rgbGen lightingDiffuse
  }
  {
    map models/players/light/brandon/braneye
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map models/players/light/brandon/braneye_glow
    blendFunc add
  }
}
