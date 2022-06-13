textures/proto2/cheapfloor
{
  qer_editorimage textures/proto2/marble02b_floor
  {
    map textures/effects2/xtourney_fx3
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/marble02b_floor
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
