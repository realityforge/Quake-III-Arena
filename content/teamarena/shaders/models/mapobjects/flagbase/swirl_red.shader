models/mapobjects/flagbase/swirl_red
{
  {
    map models/mapobjects/flagbase/swirl_red
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 130
    tcmod stretch sin .8 .2 0 .2
  }
  {
    map models/mapobjects/flagbase/swirl_red
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
