textures/base_trim/electric_blue
{
  q3map_surfacelight 200
  q3map_lightimage textures/sfx/electric2_blend
  q3map_globaltexture
  qer_editorimage textures/base_trim/electricwall_blue
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/electricwall_blue
    blendFunc filter
    rgbGen identity
    tcmod scale .5 .5
  }
  {
    map textures/base_trim/electricwall_blue
    blendFunc add
  }
  {
    map textures/sfx/electric2_blend
    blendFunc add
    rgbGen wave sin .6 1 0 2
    tcmod scale .5 .5
    tcmod rotate 54
    tcmod scroll .53 .43
  }
}
