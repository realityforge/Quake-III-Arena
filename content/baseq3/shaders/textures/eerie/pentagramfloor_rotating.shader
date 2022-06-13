textures/eerie/pentagramfloor_rotating
{
  qer_editorimage textures/eerie/pentagramfloor
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xhugefloor2
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/eerie/pentagramfloor_red_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
    tcmod rotate -60
  }
}
