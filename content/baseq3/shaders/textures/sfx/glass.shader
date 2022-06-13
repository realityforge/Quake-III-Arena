textures/sfx/glass
{
  qer_editorimage textures/base_wall/oldwindow
  cull disable
  surfaceparm trans
  {
    map $lightmap
    blendFunc add
    tcGen environment
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/oldwindow
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
  }
}
