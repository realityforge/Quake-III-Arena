textures/proto2/mpterra2_mv
{
  qer_editorimage textures/proto2/ed_movie
  cull disable
  surfaceparm nolightmap
  surfaceparm trans
  {
    map textures/proto2/shiny_black
    tcGen environment
    rgbGen identity
  }
  {
    videoMap mpterra2.roq
    blendFunc add
    rgbGen identity
  }
}
