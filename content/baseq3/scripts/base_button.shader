textures/base_light/btactmach0
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/btactmach0
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/btactmach0.blend
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_button/shootme2
{
	qer_editorimage textures/base_button/shootme1
	q3map_lightimage textures/base_button/shootme_glow
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal3_3
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_button/shootme_glow
		rgbGen wave sin 0.5 1.0 0 .3
		blendFunc GL_ONE GL_ONE
	}
}
