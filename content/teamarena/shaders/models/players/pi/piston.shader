models/players/pi/piston
{
  cull disable
  deformVertexes move 0 0 .07 sin 0 5 0 2
  {
    map models/players/pi/piston
    depthWrite
    alphaFunc GE128
    rgbGen lightingDiffuse
  }
}
