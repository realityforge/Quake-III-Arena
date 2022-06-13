models/flags/flag_red
{
  cull disable
  deformVertexes wave 90 sin 1 5.6 1 .4
  deformVertexes wave 100 sin 1 2 1 .9
  deformVertexes wave 50 sin 1 .5 1 1
  {
    map models/flags/flag_red
    depthWrite
    blendFunc add
    rgbGen lightingDiffuse
  }
}
