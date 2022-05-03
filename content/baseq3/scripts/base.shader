textures/base/q1met_redpad
{
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/q1met_redpad.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base/q1met_redpad.blend.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base/bluegoal
{
	{
		map textures/base/bluegoal.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}
textures/base/redgoal
{
	{
		map textures/base/redgoal.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}


textures/base/comp_panel
{
	surfaceparm trans
	light 1
	q3map_surfacelight 500

	{
		map textures/base/comp_panel.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}

	{
		map textures/base/comp_panel.blend.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base/ceil1_8
{
	light 1
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/ceil1_8.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base/ceil1_3
{
	light 1
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/ceil1_3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base/ceil1_4
{
	light 1
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/ceil1_4.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/base/border11light
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/border11light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base/border11light.blend.png
		rgbGen wave sin 0.5 0.5 0 .2
		blendfunc GL_ONE GL_ONE
	}
}
textures/base/electricwall
{
	light 1
	q3map_surfacelight 400

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.blend.png
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/base/electric.blend.png
		tcMod scroll 1 1 10 20
		rgbGen wave sin 1 2 0 1
		blendfunc GL_ONE GL_ONE
	}
}
