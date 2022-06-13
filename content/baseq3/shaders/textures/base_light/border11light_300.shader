textures/base_light/border11light_300
{
  q3map_surfacelight 235
  q3map_lightimage textures/base_light/border11light_blend
  qer_editorimage textures/base_light/border11light
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/border11light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/border11light_blend
    blendFunc add
  }
}
