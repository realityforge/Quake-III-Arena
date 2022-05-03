textures/base_object/plasmalogo_1
{
	q3map_lightimage textures/base_object/plasmalogo.png
	//surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/plasmalogo_1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_object/plasmalogo.png
		rgbGen wave triangle 0.5 0.5 0.5 0.15
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_object/quadsign_1
{
	qer_editorimage base_object/quadsign1.png
	q3map_lightimage textures/base_object/quadsign1.blend.png
	//surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/quadsign1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_object/quadsign1.blend.png
		rgbGen wave triangle 0.5 0.5 0.5 0.15
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_object/hastesign_1
{
	qer_editorimage base_object/hastesign1.png
	q3map_lightimage textures/base_object/hastesign1.blend.png
	//surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/hastesign1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_object/hastesign1.blend.png
		rgbGen wave triangle 0.5 0.5 0.5 0.15
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_object/boxQ3_1
{
	// A green box with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_1.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
textures/base_object/boxQ3_2
{
	// A silver box with a specular and a lightglow map on it

	q3map_surfacelight 200
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_2.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
	{
		map textures/base_object/boxQ3_2.blend.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/base_object/boxQ3_3
{
	//	A red box side with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_3.png
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}
textures/base_object/boxq3_4
{
	//	A golden yellow box with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxq3_4.png
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}
