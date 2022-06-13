textures/proto2/teamwerkz_red1
{
  cull disable
  surfaceparm nolightmap
  surfaceparm trans
  {
    map textures/proto2/teamwerkz_red2
    blendFunc add
    rgbGen wave sin 0 1 0 9
    tcmod scroll 1 0
  }
  {
    map textures/proto2/teamwerkz_red1
    blendFunc add
    rgbGen wave sin 0 1 0 .19
    tcmod scroll -0.2 0
  }
}
