models/mapobjects/flagbase/swirl_blue
{
  {
    map models/mapobjects/flagbase/swirl_blue
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 130
    tcmod stretch sin .8 .2 0 .2
  }
  {
    map models/mapobjects/flagbase/swirl_blue
    blendFunc add
    rgbGen identity
    tcmod rotate 80
    tcmod stretch sin .8 .2 0 .1
  }
  {
    map models/mapobjects/flagbase/base_r
    blendFunc blend
    rgbGen lightingDiffuse
  }
}
