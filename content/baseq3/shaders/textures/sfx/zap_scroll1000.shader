textures/sfx/zap_scroll1000
{
  q3map_surfacelight 1000
  qer_editorimage textures/sfx/zap_scroll
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/sfx/zap_scroll
    blendFunc add
    rgbGen wave triangle .8 2 0 7
    tcmod scroll 0 1
  }
  {
    map textures/sfx/zap_scroll
    blendFunc add
    rgbGen wave triangle 1 1.4 0 5
    tcmod scale -1 1
    tcmod scroll 0 1
  }
  {
    map textures/sfx/zap_scroll2
    blendFunc add
    rgbGen wave triangle 1 1.4 0 6.3
    tcmod scale -1 1
    tcmod scroll 2 1
  }
  {
    map textures/sfx/zap_scroll2
    blendFunc add
    rgbGen wave triangle 1 1.4 0 7.7
    tcmod scroll -1.3 1
  }
}
