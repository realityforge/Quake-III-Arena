textures/sfx/launchpad_diamond
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/launchpad_diamond
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/launchpad_dot
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 1
  }
  {
    animMap 4 textures/sfx/launchpad_arrow textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2
    blendFunc add
    tcmod scroll 0 2
  }
}