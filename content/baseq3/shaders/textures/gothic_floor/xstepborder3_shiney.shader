textures/gothic_floor/xstepborder3_shiney
{
  qer_editorimage textures/gothic_floor/xstepborder3_alpha
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/xstepborder3_alpha
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
