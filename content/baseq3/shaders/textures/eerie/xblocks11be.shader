textures/eerie/xblocks11be
{
  qer_editorimage textures/eerie/blocks11b
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/blocks11b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/electricgrade3
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen wave sin .25 .25 .25 .25
    tcmod turb .2 .2 .1 1
    tcmod scale .25 .25
    tcmod scroll -0.5 -1.2
  }
}
