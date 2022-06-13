textures/sfx/xgoopjumpypad
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/surface6jumppad_blend
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/xgoopq1metal
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/surface6jumppad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
    tcmod stretch sin .8 .2 0 1
  }
}
