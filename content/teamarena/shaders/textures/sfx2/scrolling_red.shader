textures/sfx2/scrolling_red
{
  q3map_surfacelight 1000
  q3map_lightimage textures/base_light/jaildr1_3_blend
  qer_editorimage textures/base_light/jaildr1_3
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/jaildr1_3
    blendFunc filter
    rgbGen identity
    tcmod scroll 0 -0.25
  }
  {
    map textures/base_light/jaildr1_3_blend
    blendFunc add
    rgbGen wave sin .5 .5 1 1
    tcmod scroll 0 -0.25
  }
}
