textures/proto2/mpteam3_movie
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
    videoMap mpteam3.roq
    blendFunc add
    rgbGen identity
  }
}
