textures/base_wall/atechengine_ax
{
  q3map_surfacelight 300
  q3map_lightimage textures/base_wall/atechengine_ax2
  {
    map textures/sfx/proto_zzztpink
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 60
    tcmod turb 0 .5 0 9.6
    tcmod scale 2 2
    tcmod scroll 9 5
  }
  {
    map textures/base_wall/atechengine_ax
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
