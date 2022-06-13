textures/base_trim/drag_glass1
{
  surfaceparm nolightmap
  surfaceparm trans
  {
    map textures/base_trim/drag_glass1
    blendFunc GL_ONE_MINUS_DST_COLOR GL_ZERO
  }
  {
    map textures/base_trim/drag_glass1
    alphaFunc LT128
    blendFunc GL_DST_COLOR GL_ONE
  }
}
