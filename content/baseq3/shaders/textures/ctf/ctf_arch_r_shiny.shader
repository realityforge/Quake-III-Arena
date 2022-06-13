textures/ctf/ctf_arch_r_shiny
{
  qer_editorimage textures/ctf/ctf_arch_r
  {
    map textures/ctf/ctf_arch_r
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
  }
  {
    map textures/sfx/specular
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale 10 10
  }
  {
    map textures/ctf/ctf_arch_r
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
