textures/base_wall/shinygrate1_4_glow
{
  q3map_surfacelight 100
  q3map_lightsubdivide 32
  q3map_lightimage textures/base_wall/shinygrate1_4_glow_light2
  {
    map textures/sfx/electricslime
    rgbGen wave sin .5 .5 0 1
    tcmod scale .25 .25
    tcmod scroll -10 -1
  }
  {
    map textures/base_wall/shinygrate1_4_glow
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/shinygrate1_4_glow_light2
    blendFunc add
    rgbGen wave triangle .2 .01 0 10
  }
}
