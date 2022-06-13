textures/sfx/q1metal7_98dstripe
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/q1metal7_98d
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/orangestripes
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
  }
}
