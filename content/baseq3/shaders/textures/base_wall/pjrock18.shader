textures/base_wall/pjrock18
{
  qer_editorimage textures/stone/pjrock18
  {
    map $lightmap
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/stone/pjrock18
    blendFunc GL_ONE GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
