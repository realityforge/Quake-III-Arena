textures/proto2/shiny_black
{
  surfaceparm nolightmap
  {
    map textures/proto2/shiny_black
    tcGen environment
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
