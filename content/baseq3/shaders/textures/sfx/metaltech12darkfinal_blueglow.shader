textures/sfx/metaltech12darkfinal_blueglow
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/metaltech01blueglow
  qer_editorimage textures/sfx/metaltech01blueglow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/metaltech12darkfinal
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/metaltech01blueglow
    blendFunc add
    rgbGen wave sin .1 .1 1 .1
  }
}
