models/players/sarge/cigar
{
  {
    map models/players/sarge/cigar
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map models/players/sarge/cigar_glow
    blendFunc add
    rgbGen wave triangle .5 1 0 .2
  }
}
