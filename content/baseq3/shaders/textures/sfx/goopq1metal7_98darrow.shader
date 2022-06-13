textures/sfx/goopq1metal7_98darrow
{
  q3map_surfacelight 500
  q3map_lightimage textures/sfx/pitted_rust3arrow_blend
  qer_editorimage textures/sfx/goopq1metal7_98darrow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/goopq1metal7_98dlarge
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pitted_rust3arrow_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
    tcmod scroll 0 1
  }
}
