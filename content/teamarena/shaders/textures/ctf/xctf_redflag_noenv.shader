textures/ctf/xctf_redflag_noenv
{
  tesssize 64
  qer_editorimage textures/ctf/ctf_redflag
  cull disable
  surfaceparm nomarks
  deformVertexes wave 194 sin 0 3 0 .4
  deformVertexes normal .3 .2
  {
    map textures/ctf/ctf_redflag
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
  {
    map textures/sfx/shadow
    blendFunc filter
    tcGen environment
    rgbGen identity
  }
}
