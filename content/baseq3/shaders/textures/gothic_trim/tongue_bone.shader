textures/gothic_trim/tongue_bone
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_trim/tongue_bone
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_trim/tongue_bone_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
