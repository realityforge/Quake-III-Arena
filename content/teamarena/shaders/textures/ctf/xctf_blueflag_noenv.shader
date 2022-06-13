textures/ctf/xctf_blueflag_noenv
{
  tesssize 64
  qer_editorimage textures/ctf/ctf_blueflag
  cull disable
  surfaceparm nomarks
  deformVertexes wave 194 sin 0 3 0 .4
  deformVertexes normal .5 .1
  {
    map textures/ctf/ctf_blueflag
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
