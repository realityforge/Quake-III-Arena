textures/ctf2/redteam02
{
  qer_editorimage textures/ctf2/redteam01
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  {
    map textures/ctf2/redteam01
    depthWrite
    alphaFunc GE128
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
