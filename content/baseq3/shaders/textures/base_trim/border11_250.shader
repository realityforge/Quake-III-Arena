textures/base_trim/border11_250
{
  q3map_surfacelight 250
  q3map_lightimage textures/base_trim/border11light_glow
  qer_editorimage textures/base_trim/border11light
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/border11light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_trim/border11light_glow
    blendFunc add
    rgbGen wave sin .9 .1 0 10
  }
}
