textures/jk_dm1/jkt1_q3abanner
{
  q3map_surfacelight 100
  q3map_lightimage textures/jk_dm1/ss_jkt1_golgothabanner
  qer_editorimage textures/jk_dm1/jkt1_q3abanner
  {
    animMap .4 textures/jk_dm1/jkt1_q3abanner textures/jk_dm1/ss_jkt1_golgothabanner textures/jk_dm1/jkt1_powzerbanner
    rgbGen wave square 0 3 0 .4
  }
  {
    map textures/base_wall/comp3text
    blendFunc add
    rgbGen identity
    tcmod scroll 3 3
  }
  {
    map textures/base_wall/comp3textb
    blendFunc add
    rgbGen identity
    tcmod scroll 3 3
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc add
    tcGen environment
    rgbGen wave sin .25 0 0 0
    tcmod scale .5 .5
  }
}
