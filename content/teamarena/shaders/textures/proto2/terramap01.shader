textures/proto2/terramap01
{
  nopicmip
  surfaceparm nolightmap
  surfaceparm trans
  {
    map textures/proto2/terramap01
    blendFunc add
    rgbGen wave sin 1 .2 0 .75
  }
  {
    map textures/proto2/terramap02
    blendFunc add
    rgbGen wave inversesawtooth 1 .2 0 .75
    tcmod scale 1.75 1
    tcmod scroll -3.75 0
  }
}
