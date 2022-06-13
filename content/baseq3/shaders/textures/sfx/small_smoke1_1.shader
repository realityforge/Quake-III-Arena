textures/sfx/small_smoke1_1
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  deformVertexes autoSprite
  {
    animMap 10 textures/sfx/small_smoke1_1 textures/sfx/small_smoke1_2 textures/sfx/small_smoke1_3 textures/sfx/small_smoke1_4 textures/sfx/small_smoke1_5 textures/sfx/small_smoke1_6
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 10
  }
  {
    animMap 10 textures/sfx/small_smoke1_2 textures/sfx/small_smoke1_3 textures/sfx/small_smoke1_4 textures/sfx/small_smoke1_5 textures/sfx/small_smoke1_6 textures/sfx/small_smoke1_1
    blendFunc add
    rgbGen wave sawtooth 0 1 0 10
  }
}
