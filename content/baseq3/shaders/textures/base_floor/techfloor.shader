textures/base_floor/techfloor
{
  surfaceparm metalsteps
  {
    map textures/sfx/proto_zzztpink
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod turb 0 .5 0 9.6
    tcmod scale 2 2
    tcmod scroll 9 5
  }
  {
    clampmap textures/base_floor/techfloor2
    blendFunc blend
    rgbGen identity
    tcmod rotate 170
    tcmod stretch sin .8 .2 0 .4
  }
  {
    map textures/base_floor/techfloor
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
