textures/proto2/marble02rtrim03
{
  {
    map textures/proto2/marble02rtrim03
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/proto2/marble02rtrim03_lt
    blendFunc add
    rgbGen wave sin .9 .5 0 .2
  }
}
