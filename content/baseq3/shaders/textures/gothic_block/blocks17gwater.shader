textures/gothic_block/blocks17gwater
{
  {
    map textures/gothic_block/blocks17gwater
    depthWrite
    alphaFunc GT0
    blendFunc GL_DST_COLOR GL_ONE
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc GL_DST_COLOR GL_ONE
    tcGen environment
  }
}
