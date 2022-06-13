textures/base/electricwall
{
  q3map_surfacelight 400
  q3map_flare flareshader
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
    map textures/organics/wire02a_f_blend
    blendFunc add
  }
  {
    map textures/base/electric_blend
    blendFunc add
    rgbGen wave sin 1 2 0 1
  }
}
