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
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/base_light/btactmach0_blend
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc add
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
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/base_button/shootme_glow
		rgbGen wave sin 0.5 1.0 0 .3
		blendFunc add
	}
}
