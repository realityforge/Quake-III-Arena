textures/base_support/support1rust
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_support/support1rust
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map textures/base_trim/tinfx
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_support/support1rust
    blendFunc filter
    rgbGen identity
  }
}
