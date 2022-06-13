textures/base_trim/electricwall
{
  q3map_surfacelight 400
  q3map_flare flareshader
  qer_editorimage textures/organics/wire02a_f
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/organics/wire02a_f
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/organics/wire02a_f
    blendFunc add
  }
  {
    map textures/sfx/electric2_blend
    blendFunc add
    rgbGen wave sin .6 1 0 2
    tcmod scroll .53 .43
  }
}
