textures/ctf2/tin_blupanel
{
  qer_editorimage textures/proto2/tin_panel
  surfaceparm metalsteps
  {
    map textures/effects/envmapblue
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/tin_panel
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
