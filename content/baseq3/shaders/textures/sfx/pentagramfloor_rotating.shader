textures/sfx/pentagramfloor_rotating
{
  qer_editorimage textures/sfx/pentagramfloor
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/xhugefloor2
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/pentagramfloor_red
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
    tcmod rotate -60
  }
}
