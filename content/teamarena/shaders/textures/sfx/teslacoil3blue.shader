textures/sfx/teslacoil3blue
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/tesla1blue
  qer_editorimage textures/sfx/teslacoil
  cull disable
  surfaceparm nolightmap
  {
    map textures/sfx/cabletest2
    blendFunc blend
  }
  {
    map textures/sfx/electricslimeblue
    blendFunc add
    rgbGen wave square .25 .25 0 2.5
  }
  {
    map textures/sfx/tesla1blue
    blendFunc add
    rgbGen wave square 0 1 0 3
    tcmod scroll -2 1
  }
}
