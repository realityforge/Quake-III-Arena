textures/proto2/c_zinc_shiny
{
  qer_editorimage textures/gothic_trim/zinc_shiny
  cull disable
  {
    map textures/effects/tinfx
    tcGen environment
    rgbGen identity
  }
  {
    map textures/gothic_trim/zinc_shiny
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
