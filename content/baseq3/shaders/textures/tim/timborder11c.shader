textures/tim/timborder11c
{
  q3map_surfacelight 300
  q3map_lightimage textures/tim/tim11c_pulse1
  qer_editorimage textures/base_trim/border11c
  {
    map textures/base_trim/border11c
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_trim/border11c_light
    blendFunc add
    rgbGen wave sin 1 .1 0 5
  }
  {
    map textures/tim/tim11c_pulse1
    blendFunc add
    tcmod scale .035 1
    tcmod scroll -0.65 0
  }
}
