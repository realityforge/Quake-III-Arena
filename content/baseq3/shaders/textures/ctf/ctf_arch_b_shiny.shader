textures/ctf/ctf_arch_b_shiny
{
  qer_editorimage textures/ctf/ctf_arch_b
  {
    map textures/ctf/ctf_arch_b
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
    map textures/ctf/ctf_arch_b
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
