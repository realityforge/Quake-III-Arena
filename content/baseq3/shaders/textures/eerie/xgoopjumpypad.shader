textures/eerie/xgoopjumpypad
{
  q3map_surfacelight 100
  q3map_lightimage textures/eerie/surface6jumppad_blend
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xgoopq1metal
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/eerie/surface6jumppad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
  }
}
