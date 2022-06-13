textures/sfx/pentagramfloor_q1metal7_99
{
  qer_editorimage textures/sfx/pentagramfloor
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/q1metalhuge
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/pentagramfloor_red_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
    tcmod rotate -60
  }
}
