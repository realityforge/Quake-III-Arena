textures/base_floor/pool_floor3
{
  qer_editorimage textures/base_wall/patch10rusty5
  {
    map textures/liquids/pool3d_5e
    rgbGen wave sin .75 0 0 0
    tcmod scale -0.25 -0.25
    tcmod scroll .025 .025
  }
  {
    map textures/liquids/pool3d_6e
    blendFunc add
    rgbGen wave sin .75 0 0 0
    tcmod scale .25 .25
    tcmod scroll .025 .025
  }
  {
    map textures/base_wall/patch10rusty5
    blendFunc GL_ONE GL_SRC_COLOR
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
