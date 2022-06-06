models/weapons2/bfg/bfg
{
	{
		map textures/effects/tinfx2d
		blendFunc GL_ONE GL_ZERO
		tcmod scroll .01 .01
		tcGen environment
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/bfg/bfg
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/bfg/bfg_glow
		blendFunc add
		rgbGen wave sin .5 .3 0 .5
	}
}
models/weapons2/bfg/bfg_k
{
	{
		map models/weapons2/bfg/envmapbfg
		rgbGen identity
		tcMod rotate 30
		tcMod scroll 1 1
		tcGen environment
	}
	{
		map models/weapons2/bfg/bfg_k
		blendfunc blend
		rgbGen lightingDiffuse
	}
}
models/weapons2/lightning/button
{
	{
		map models/weapons2/lightning/button
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 1 .2 0 1
	}
}
