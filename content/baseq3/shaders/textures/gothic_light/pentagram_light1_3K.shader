textures/gothic_light/pentagram_light1_3K
{
  q3map_surfacelight 3000
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/pentagram_light1
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/pentagram_light1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/pentagram_light1_blend
    blendFunc add
    rgbGen wave sin .8 .2 0 1
  }
}
