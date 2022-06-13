models/weapons2/lightning/lightningarc
{
  deformVertexes wave 10 sin .5 .5 0 .6
  deformVertexes move 0 0 -1 sin 1 0 0 0
  {
    map models/weapons2/lightning/lightningarc
    blendFunc add
    rgbGen wave sin 3.5 5 .22 .8
    tcmod scroll 4 .8
  }
  {
    map models/weapons2/lightning/lightningspark
    blendFunc add
    rgbGen wave sin 3.5 5 .22 .8
    tcmod scroll 0 .8
  }
}
