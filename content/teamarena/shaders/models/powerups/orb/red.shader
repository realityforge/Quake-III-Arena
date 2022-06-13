models/powerups/orb/red
{
  cull disable
  {
    map models/powerups/orb/red
    blendFunc add
    rgbGen identity
  }
  {
    map models/powerups/orb/redfx
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
    tcmod scroll 0 .2
  }
}
