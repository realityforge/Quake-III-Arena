textures/eerie/light1_5000
{
  q3map_surfacelight 5000
  q3map_lightimage textures/eerie/light1_blend
  q3map_flare flareshader
  qer_editorimage textures/eerie/light1
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/light1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/light1_blend
    blendFunc add
  }
}
