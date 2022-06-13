textures/gothic_floor/q1metal7_98blueow
{
  {
    map textures/gothic_floor/q1metal7_98blueow
    rgbGen identity
  }
  {
    map textures/sfx/fire_ctfred
    blendFunc add
    rgbGen identity
    tcmod scroll 0 1
    tcmod turb 0 .25 0 1.6
    tcmod scale 4 4
  }
  {
    map textures/gothic_floor/q1metal7_98blueow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
