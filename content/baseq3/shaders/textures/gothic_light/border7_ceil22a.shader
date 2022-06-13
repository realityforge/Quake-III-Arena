textures/gothic_light/border7_ceil22a
{
  q3map_surfacelight 200
  q3map_lightimage textures/gothic_light/border_ceil22a_blend
  qer_editorimage textures/gothic_light/border7_ceil22a
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/border7_ceil22a
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/border_ceil22a_blend
    blendFunc add
  }
}
