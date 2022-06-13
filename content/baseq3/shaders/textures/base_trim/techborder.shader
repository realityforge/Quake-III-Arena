textures/base_trim/techborder
{
  q3map_surfacelight 300
  q3map_lightimage textures/base_trim/techborder_fx
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/techborder
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_trim/techborder_fx
    blendFunc add
    tcmod scroll .1 0
  }
  {
    map textures/base_trim/techborder_fx
    blendFunc add
    tcmod scale .1 1
    tcmod scroll .1 0
  }
}
