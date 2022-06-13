textures/gothic_block/evil_e3window_dark
{
  q3map_surfacelight 100
  q3map_lightimage textures/gothic_block/evil2cglow
  qer_editorimage textures/gothic_block/windowevil2c_block18c
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/windowevil2c_block18c
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_block/evil2cglow
    blendFunc add
  }
}
