textures/base_floor/concretefloor1
{
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen wave sin .25 0 0 0
  }
  {
    map textures/base_floor/concretefloor1
    blendFunc GL_ZERO GL_SRC_ALPHA
    rgbGen identity
    tcmod scale .1 .1
  }
  {
    map textures/base_floor/concretefloor1
    blendFunc GL_ONE GL_SRC_ALPHA
    rgbGen identity
    tcmod turb .5 1 0 1
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
