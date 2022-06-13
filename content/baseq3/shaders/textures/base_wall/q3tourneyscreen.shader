textures/base_wall/q3tourneyscreen
{
  q3map_surfacelight 100
  qer_editorimage textures/base_wall/q3tourney1
  {
    animMap .25 textures/base_wall/q3tourney1 textures/base_wall/q3tourney2 textures/base_wall/q3tourney3 textures/base_wall/q3tourney4 textures/base_wall/q3tourney5
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
