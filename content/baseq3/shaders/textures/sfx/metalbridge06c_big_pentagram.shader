textures/sfx/metalbridge06c_big_pentagram
{
  qer_editorimage textures/gothic_floor/metalbridge06c_big_pentagram
  {
    map textures/gothic_floor/metalbridge06c_big_pentagram
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_red_glow
    depthFunc equal
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
