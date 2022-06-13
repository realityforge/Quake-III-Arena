textures/liquids/proto_spec
{
  cull disable
  {
    map $lightmap
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/liquids/proto_spec
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
    tcmod scroll .01 .02
  }
  {
    map textures/liquids/proto_gruel2
    blendFunc add
    tcmod scale .2 .2
    tcmod scroll .01 .02
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
