textures/base_floor/pool_side2
{
  {
    map textures/liquids/pool3d_5e
    rgbGen wave sin .75 0 0 0
    tcmod scale -0.5 -0.25
    tcmod scroll .025 .025
  }
  {
    map textures/liquids/pool3d_6e
    blendFunc add
    rgbGen wave sin .75 0 0 0
    tcmod scale .5 .25
    tcmod scroll .025 .025
  }
  {
    map textures/base_floor/pool_side2
    blendFunc GL_ONE GL_SRC_COLOR
    rgbGen identity
    tcmod scale .5 .5
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
