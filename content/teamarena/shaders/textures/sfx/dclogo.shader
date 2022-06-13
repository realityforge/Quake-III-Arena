textures/sfx/dclogo
{
  qer_editorimage textures/gothic_floor/largerblock3b
  nomipmaps
  {
    map textures/base_floor/clangdark
    rgbGen identity
    tcmod scale 4 4
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/effects/dreamcast-logo2
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
    tcmod rotate -75
  }
}
