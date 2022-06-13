textures/sfx/computerpurptileb
{
  q3map_surfacelight 200
  surfaceparm nodamage
  {
    map textures/sfx/computerpurptileb
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    animMap 2 textures/sfx/compscreen/letters1 textures/sfx/compscreen/letters2 textures/sfx/compscreen/letters3 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters4 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters5
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 2
  }
}
