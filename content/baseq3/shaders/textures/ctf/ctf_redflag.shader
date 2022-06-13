textures/ctf/ctf_redflag
{
  tesssize 64
  cull disable
  surfaceparm nomarks
  deformVertexes wave 194 sin 0 3 0 .4
  deformVertexes normal .3 .2
  {
    map textures/ctf/ctf_redflag
    rgbGen identity
  }
  {
    map textures/effects/blueflagmap
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale 9 3
    tcmod scroll .1 .7
  }
  {
    map textures/ctf/ctf_redflag
    blendFunc blend
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
