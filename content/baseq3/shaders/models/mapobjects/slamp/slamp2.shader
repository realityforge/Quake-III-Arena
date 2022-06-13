models/mapobjects/slamp/slamp2
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    map models/mapobjects/slamp/slamp2
    blendFunc add
  }
  {
    map textures/effects/envmapdimb
    blendFunc add
    tcGen environment
  }
}
