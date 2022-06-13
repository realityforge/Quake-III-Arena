models/powerups/orb/blue
{
  cull disable
  {
    map models/powerups/orb/blue
    blendFunc add
    rgbGen identity
  }
  {
    map models/powerups/orb/bluefx
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
    tcmod scroll 0 .2
  }
}
