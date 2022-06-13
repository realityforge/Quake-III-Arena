textures/base_trim/proto_comp
{
  {
    map textures/base_trim/proto_comp2
    rgbGen identity
    tcmod scroll 0 -0.2
  }
  {
    clampmap textures/sfx/console03
    blendFunc add
    rgbGen wave sin .6 0 0 0
    tcmod rotate -33
    tcmod stretch sin .8 0 0 0
  }
  {
    clampmap textures/sfx/console02
    blendFunc add
    rgbGen wave sin .3 0 0 0
    tcmod rotate -333
    tcmod stretch sin .8 0 0 0
  }
  {
    map textures/effects/tinfx2c
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_trim/proto_comp
    blendFunc blend
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
