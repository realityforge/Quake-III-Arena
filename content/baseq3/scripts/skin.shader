

textures/skin/teeth
{

	{
		map textures/skin/teeth
                rgbGen identity
        }

        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
		map textures/sfx/specular4
                blendFunc GL_ONE GL_ONE
                tcGen environment
                rgbGen identity
        }
}
textures/skin/chapthroatooz
{

    surfaceparm nonsolid
	{
                map textures/liquids/proto_gruel3
                tcMod scroll 0 .2
                tcMod scale 2 2
                rgbGen vertex
	}
	{
		map textures/skin/chapthroatooz
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/organics/dirt_trans
{
	qer_editorimage textures/organics/dirt
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/organics/dirt
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}


textures/skin/chapthroat2
{
	qer_editorimage textures/skin/chapthroat2
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/skin/chapthroat2
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}


textures/skin/skin6_trans
{
	qer_editorimage textures/skin/skin6
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/skin/skin6
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/skin/skin5_trans
{
	qer_editorimage textures/skin/skin5
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/skin/skin5
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/skin/skin1_trans
{
	qer_editorimage textures/skin/skin1
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/skin/skin1
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/skin/surface8_trans
{
	qer_editorimage textures/skin/surface8
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/skin/surface8
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/skin/tongue_trans
{
	qer_editorimage textures/skin/tongue
	surfaceparm nomarks
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/skin/tongue
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/skin/nibbles
{
	// tessSize 64
	deformVertexes wave 10 sin 4 3 0 0.3
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/skin/nibbles
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
textures/skin/soylent
{
	tessSize 64
	deformVertexes wave 100 sin 4 3 0 0.3
	{
		rgbGen identity
		map $lightmap
	}
        {
		map textures/skin/soylent
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
textures/skin/snake
{
	tessSize 128
	deformVertexes wave 100 sin 0 2 0 .3
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/snake
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/skin/proto_skin2
{
	tessSize 128
	deformVertexes bulge 3 10 1
        deformVertexes normal .1 .1

	{
                map textures/liquids/proto_gruel3
                tcMod turb 0 .2 0 .1
                tcMod scale 2 2
                rgbGen identity
	}
	{
		map textures/skin/proto_skin2
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/skin/proto_skin2b
{
        //tessSize 64
	//deformVertexes wave 100 sin 4 3 0 0.3
	{
                map textures/liquids/proto_gruel3
                tcMod turb 0 .2 0 .1
                tcMod scale 2 2
                rgbGen identity
	}
	{
		map textures/skin/proto_skin2b
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/skin/skin6move
{
	tessSize 128
	deformVertexes wave 100 sin 4 3 0 0.3
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/skin6move
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/skin/proto_skin
{
	tessSize 256
	deformVertexes wave 100 sin 2 2 0 0.3
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/proto_skin
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

}
textures/skin/skin1move
{
	tessSize 128
	deformVertexes wave 100 sin 3 2 0 0.3
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/skin1move
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/skin/skin4_side
{

	surfaceparm nomarks
	tessSize 128
	deformVertexes bulge 3 10 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/skin4_side
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	//	alphaGen lightingSpecular
	}

}

textures/skin/spikemove
{
	tessSize 128
	deformVertexes wave 100 sin 0 .5 0 0.1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/spikemove
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/skin/pjwal2f
{
	tessSize 128
	deformVertexes wave 100 sin 0 2 0 .3
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/skin/pjwal2f
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}