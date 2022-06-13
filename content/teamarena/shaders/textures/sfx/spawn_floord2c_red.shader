textures/sfx/spawn_floord2c_red
{
  qer_editorimage textures/sfx/spawn_floord2c
  {
    map textures/sfx/proto_zzzt
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scroll 0 1
    tcmod turb 0 .25 0 5.6
    tcmod scale 2 2
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    blendFunc blend
    rgbGen identity
    tcmod rotate 130
    tcmod stretch sin .8 .2 0 .2
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    blendFunc blend
    rgbGen identity
    tcmod rotate 80
    tcmod stretch sin .8 .2 0 .1
  }
  {
    map textures/sfx/spawn_floord2c
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
