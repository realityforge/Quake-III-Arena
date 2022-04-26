
textures/gothic_floor2/largerblock3bwet
{       
        {
		map textures/gothic_floor2/largerblock3bwet.tga
                rgbGen identity
	}

        {
		map textures/effects/tinfx2c.tga
                tcgen environment
                tcmod scale 4 4
		blendFunc Add
		rgbGen identity
	}
        {
		map textures/gothic_floor2/largerblock3bwet.tga
                blendFunc Blend
                rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}