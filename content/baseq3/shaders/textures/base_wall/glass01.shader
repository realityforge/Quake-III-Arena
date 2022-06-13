textures/base_wall/glass01
{
  qer_trans .5
  cull disable
  surfaceparm trans
  {
    map textures/effects/tinfx
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
