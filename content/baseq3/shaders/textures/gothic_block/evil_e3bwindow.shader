textures/gothic_block/evil_e3bwindow
{
  q3map_surfacelight 200
  q3map_lightimage textures/gothic_block/evil2ckillblockglow
  qer_editorimage textures/gothic_block/windowevil2c_killblock
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/windowevil2c_killblock
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_block/evil2ckillblockglow
    blendFunc add
  }
}
