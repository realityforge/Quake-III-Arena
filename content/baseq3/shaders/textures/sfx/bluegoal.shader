textures/sfx/bluegoal
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/sfx/powerupshit
    blendFunc add
    tcGen environment
    tcmod turb 0 .25 0 .5
  }
}
