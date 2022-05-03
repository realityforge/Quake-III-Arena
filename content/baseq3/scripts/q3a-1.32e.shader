models/weapons2/bfg/bfg
{
	{
		map textures/effects/tinfx2d.png
		blendFunc GL_ONE GL_ZERO
		tcmod scroll .01 .01
		tcGen environment
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/bfg/bfg.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/bfg/bfg_glow.png
		blendFunc add
		rgbGen wave sin .5 .3 0 .5
	}
}
models/weapons2/bfg/bfg_e
{
	{
		map models/weapons2/bfg/envmapbfg.png
		rgbGen identity
		tcMod turb 0 0.5 0 0.1
		tcMod scale 0.4 0.4
		tcMod scroll 0.2 -0.2
	}
	{
		map models/weapons2/bfg/envmapbfg.png
		blendfunc add
		rgbGen identity
		tcMod turb 0 0.5 0 0.1
		tcMod scale 0.2 0.2
		tcMod scroll 0.3 0.6
	}
	{
		map textures/effects/tinfx.png
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment
	}
}
models/weapons2/bfg/bfg_k
{
	{
		map models/weapons2/bfg/envmapbfg.png
		rgbGen identity
		tcMod rotate 30
		tcMod scroll 1 1
		tcGen environment
	}
	{
		map models/weapons2/bfg/bfg_k.png
		blendfunc blend
		rgbGen lightingDiffuse
	}
}
models/weapons2/lightning/button
{
	{
		map models/weapons2/lightning/button.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 1 .2 0 1
	}
}
models/weapons2/lightning/lightningarc
{
	deformVertexes wave 10 sin .5 .5 0 .6
	deformVertexes move 0 0 -1 sin 1 0 0 0
	{
		map models/weapons2/lightning/lightningarc.png
		blendfunc add
		rgbGen wave sin 3.5 5 0.22 .8
		tcMod scroll 4 .8
	}
	{
		map models/weapons2/lightning/lightningspark.png
		blendfunc add
		rgbGen wave sin 3.5 5 0.22 .8
		tcMod scroll 0 .8
	}
}