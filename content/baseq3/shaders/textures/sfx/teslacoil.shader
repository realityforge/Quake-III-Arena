textures/sfx/teslacoil
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/tesla1
  cull disable
  {
    map $lightmap
    blendFunc filter
    tcGen environment
  }
  {
    map textures/sfx/tesla1
    blendFunc add
    rgbGen wave sawtooth 0 1 0 5
    tcmod scale 1 .5
    tcmod turb 0 .1 0 1
    tcmod scroll -1 -1
  }
  {
    map textures/sfx/electricslime
    blendFunc add
    rgbGen wave sin 0 .5 0 1
    tcmod scale .5 .5
    tcmod turb 0 .1 0 1
    tcmod rotate 180
    tcmod scroll -1 -1
  }
  {
    map textures/sfx/cabletest2
    blendFunc blend
  }
}
