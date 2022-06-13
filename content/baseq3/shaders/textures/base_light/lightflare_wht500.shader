textures/base_light/lightflare_wht500
{
  q3map_surfacelight 500
  q3map_lightimage textures/base_light/light1_blend
  qer_editorimage textures/base_light/light_flare
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
  {
    map textures/base_light/light_flare
    blendFunc add
  }
}
