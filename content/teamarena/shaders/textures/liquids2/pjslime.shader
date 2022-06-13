textures/liquids2/pjslime
{
  q3map_surfacelight 500
  q3map_lightimage textures/proto2/concrete_blue
  q3map_globaltexture
  tesssize 64
  qer_trans .5
  surfaceparm lava
  surfaceparm noimpact
  surfaceparm trans
  deformVertexes wave 100 sin 1 2 0 .5
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/liquids2/pjslime
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
    tcmod turb 0 .2 .5 .05
    tcmod scroll .01 .01
  }
  {
    map textures/liquids2/pjslime2
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 4
    tcmod turb 0 .2 .5 .05
    tcmod scroll .01 .01
  }
}
