textures/proto2/pulsebeam
{
  surfaceparm metalsteps
  {
    map textures/proto2/pulsebeam
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/proto2/pulsebeam2
    blendFunc add
    rgbGen wave inversesawtooth -0.3 1.3 0 1
  }
}
