textures/base_light/geolight
{
  q3map_surfacelight 4000
  q3map_lightimage textures/base_light/geolight_glow
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/geolight
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map textures/base_light/geolight_glow
    blendFunc add
    rgbGen wave sin .575 .025 0 10
  }
}
