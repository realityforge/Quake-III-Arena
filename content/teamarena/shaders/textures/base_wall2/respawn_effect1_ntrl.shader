textures/base_wall2/respawn_effect1_ntrl
{
  qer_editorimage textures/base_wall2/ntrl_1_kc
  cull disable
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/base_wall2/ntrl_1_kc
    blendFunc add
    rgbGen wave sin .25 .25 0 .25
    tcmod scale 1 -1
    tcmod scroll .5 0
  }
  {
    map textures/base_wall2/ntrl_2_kc
    blendFunc add
    rgbGen wave sin .25 .25 .25 .25
    tcmod scale 1 -1
    tcmod scroll -0.5 0
  }
  {
    map textures/base_wall2/ntrl_3_kc
    blendFunc add
    rgbGen wave inversesawtooth -0.3 1.3 0 .25
    tcmod scale 1 -1
  }
}
