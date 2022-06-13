textures/sfx/pittedrust3stripes
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_trim/pitted_rust3
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/orangestripes
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
  }
}
