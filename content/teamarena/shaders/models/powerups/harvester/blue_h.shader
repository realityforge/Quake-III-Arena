models/powerups/harvester/blue_h
{
  cull disable
  nomipmaps
  {
    map models/powerups/harvester/blue_h
    blendFunc add
    rgbGen identity
    tcmod scroll 3 0
  }
  {
    map models/powerups/harvester/red_hb
    blendFunc add
    rgbGen wave inversesawtooth -0.3 1.3 0 1
    tcmod scroll 6 1
    tcmod scale 2 1
  }
  {
    map models/powerups/harvester/red_hb
    blendFunc add
    rgbGen wave inversesawtooth -0.3 1.3 0 1
    tcmod scroll -4 1
    tcmod scale 2 1
  }
}
