textures/sfx/fanfx
{
  qer_editorimage textures/sfx/fanfx
  cull disable
  nopicmip
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap textures/sfx/fanfx
    depthWrite
    blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
    rgbGen exactVertex
    tcmod rotate 256
  }
}
