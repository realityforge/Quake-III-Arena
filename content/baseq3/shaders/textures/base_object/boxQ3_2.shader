textures/base_object/boxQ3_2
{
  q3map_surfacelight 200
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_object/boxQ3_2
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map textures/base_object/boxQ3_2_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
