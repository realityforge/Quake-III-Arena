textures/base/q1met_redpad
{
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/q1met_redpad
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base/q1met_redpad_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base/bluegoal
{
	{
		map textures/base/bluegoal
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.05
	}
}
textures/base/redgoal
{
	{
		map textures/base/redgoal
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.05
	}
}


textures/base/comp_panel
{
	surfaceparm trans
	light 1
	q3map_surfacelight 500

	{
		map textures/base/comp_panel
		blendFunc blend
	}

	{
		map textures/base/comp_panel_blend
		blendFunc add
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
		map textures/base/ceil1_8
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
		map textures/base/ceil1_3
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
		map textures/base/ceil1_4
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
		map textures/base/border11light
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base/border11light_blend
		rgbGen wave sin 0.5 0.5 0 .2
		blendfunc add
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
		map textures/organics/wire02a_f
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f_blend
		blendFunc add
	}
	{
		map textures/base/electric_blend
		tcMod scroll 1 1
		rgbGen wave sin 1 2 0 1
		blendfunc add
	}
}
