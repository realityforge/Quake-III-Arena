textures/sfx/metalfloor_glass
{
  qer_editorimage textures/sfx/metalfloor_wall_15glass
  qer_trans .4
  cull disable
  surfaceparm trans
  {
    map textures/sfx/metalfloor_wall_15glass
    blendFunc GL_ONE_MINUS_DST_COLOR GL_ZERO
    rgbGen vertex
  }
  {
    map textures/sfx/metalfloor_wall_15glass
    alphaFunc GT0
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen identity
  }
}
