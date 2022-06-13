textures/animationTest
{
  qer_editorimage textures/liquids/bloodwater1
  {
    animMap .5 textures/liquids/bloodwater1 textures/liquids/pool textures/liquids/slime7
  }
  {
    animMap .5 textures/liquids/pool textures/liquids/slime7 textures/liquids/bloodwater1
    blendFunc blend
    alphaGen wave sawtooth 0 1 0 .5
  }
  {
    map $lightmap
    blendFunc filter
  }
}
