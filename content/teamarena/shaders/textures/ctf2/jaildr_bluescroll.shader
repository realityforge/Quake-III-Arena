textures/ctf2/jaildr_bluescroll
{
  q3map_surfacelight 1000
  q3map_lightimage textures/ctf2/jaildr_blue
  qer_editorimage textures/ctf2/jaildr_blue
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/ctf2/jaildr_blue
    blendFunc filter
    rgbGen identity
    tcmod scroll 0 -0.25
  }
  {
    map textures/ctf2/jaildr_blue_blend
    blendFunc add
    rgbGen wave sin .5 .5 1 1
    tcmod scroll 0 -0.25
  }
}
