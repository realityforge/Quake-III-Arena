textures/base_wall/medal_impressive
{
  q3map_surfacelight 100
  qer_editorimage textures/base_wall/medal_impressive
  {
    animMap .25 textures/base_wall/medal_impressive textures/base_wall/medal_gauntlet textures/base_wall/medal_excellent textures/base_wall/medal_accuracy textures/base_wall/medal_victory textures/base_wall/medal_frags
    rgbGen wave sawtooth 0 1 0 .25
  }
  {
    map textures/base_wall/comp3textd
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 .25
    tcmod scroll 5 .25
  }
  {
    map textures/base_wall/chrome_env
    blendFunc add
    tcGen environment
    rgbGen wave triangle .5 .05 0 10
    tcmod scale .5 .5
  }
  {
    map textures/base_wall/comp3frame
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
