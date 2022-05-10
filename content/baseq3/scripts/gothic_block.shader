textures/gothic_block/largerblock3blood
{

        {
		map textures/liquids/proto_grueldark2
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
        }
        {
		map textures/effects/tinfx3
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }

	{
	        map textures/gothic_block/largerblock3blood
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks17bloody
{

        {
		map textures/liquids/proto_grueldark2
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
        }
        {
		map textures/effects/tinfx3
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }

	{
	        map textures/gothic_block/blocks17bloody
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks17g_ow
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}

	{
	        map textures/gothic_block/blocks17g_ow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks18b_ow
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}

	{
	        map textures/gothic_block/blocks18b_ow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_door/skullarch_b
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}

	{
	        map textures/gothic_door/skullarch_b
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks17_ow
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}

	{
	        map textures/gothic_block/blocks17_ow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks15cgeomtrn
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks15cgeomtrn
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/gothic_block/killblockgeomtrn
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/killblockgeomtrn
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/gothic_block/blocks18cgeomtrn2
{
       cull disable
       surfaceparm alphashadow
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
		alphaFunc GE128
                tcmod rotate 40
                tcMod stretch sin .8 0.2 0 .3
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
                alphaFunc GE128
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
		alphaFunc GE128
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}

        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/gothic_block/blocks18cgeomtrn
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks18cgeomtrn
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/blocks18cgeomtrnx
{

        {
		map textures/sfx/fireswirl2blue
                tcMod stretch sin .8 0.3 0 9.7
                tcmod rotate 333
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks18cgeomtrnx
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/demon_block15fx
{

        {
		map textures/sfx/firegorre
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
	        map textures/gothic_block/demon_block15fx
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/blocks15_ow
{

        {
		map textures/liquids/proto_grueldark
                tcmod scroll 0 -.05
                tcmod scale 4 4
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/liquids/proto_grueldark
                tcmod scroll 0.01 -.02
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_block/blocks15_ow
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/xblocks17i_shiney
{
	qer_editorimage textures/gothic_block/xblocks17i_alpha
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_block/xblocks17i_alpha
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

//***************************************************************
//  This texture has a detail layer that is used to apply a
//  grainy overlay to the blocks17 texture
//***************************************************************
textures/gothic_block/blocks17_sandy
{
	qer_editorimage textures/gothic_block/blocks17
	q3map_globaltexture
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/gothic_block/sand2
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 2.90 2.234
	}
	{
		map textures/gothic_block/blocks17
		tcMod scale 0.25 0.25
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/gothic_block/wetwall
{
	// Moist, reflective smear on Blockwall Sore. Yummy Yum.
        {
	        map textures/gothic_block/wetwall
	        rgbGen identity
	}
        {
		map textures/gothic_block/wetwallfx
                tcmod scroll 0 -.1
                tcmod scale 2 .6
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_block/wetwall
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
//***************************************************************
//  This texture has a detail layer that is used to apply a
//  grainy overlay to the blocks15 texture
//***************************************************************
textures/gothic_block/blocks15_sandy
{
	qer_editorimage textures/gothic_block/blocks15
	q3map_globaltexture
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/gothic_block/sand2
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 2.90 2.234
	}
	{
		map textures/gothic_block/blocks15
		tcMod scale 0.25 0.25
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/gothic_block/evil_e3bwindow
{
	qer_editorimage textures/gothic_block/windowevil2c_killblock
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2ckillblockglow
	q3map_surfacelight 200
	// Glowing evil window for e3 demo map
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_killblock
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2ckillblockglow
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_block/evil_e3window
{
	qer_editorimage textures/gothic_block/windowevil2c_block18c
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2cglow
	q3map_surfacelight 1000
	// Glowing evil window for e3 demo map
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_block18c
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2cglow
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_block/evil_e3window_dark
{
	qer_editorimage textures/gothic_block/windowevil2c_block18c
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2cglow
	q3map_surfacelight 100
	// Glowing evil window for temp in tim_dm7
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_block18c
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2cglow
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_block/blocks17gwater

{

	{	map textures/gothic_block/blocks17gwater
		blendfunc GL_dst_color GL_one
		alphafunc GT0
		depthwrite
	}


	{	map $lightmap
		blendfunc gl_dst_color gl_one
		tcgen environment
		depthfunc equal
	}

}


textures/gothic_light/flicker_light15k
{
	qer_editorimage textures/gothic_light/gothic_light3
	q3map_lightimage textures/gothic_light/gothic_light2_blend
	q3map_surfacelight 15000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen wave noise 0.75 0.25 0 10
	}
	{
		map textures/gothic_light/gothic_light3
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend
		blendfunc GL_ONE GL_ONE
		rgbGen wave noise 0.75 0.25 0 10
	}
}
textures/gothic_block/flicker_blocks10
{
	qer_editorimage textures/gothic_block/blocks10
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks10
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen wave noise 0.75 0.25 0 10
	}
}

textures/gothic_block/gkc17d
{
	// spine texture with specular highlights
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/gothic_block/gkc17d
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
textures/gothic_block/blocks11ct
{
	//cull twosided
	surfaceparm trans
	{
		map textures/gothic_block/blocks11c
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}
//textures/gothic_block/blocks11ct
//{
//	*************************************************
//	* JohnC's filter glass
//	*************************************************
//
//	surfaceparm trans
//	surfaceparm nolightmap
//	surfaceparm	lightfilter
//
//	cull twosided
//
//	{
//		map textures/hell/blocks11ct
//		blendFunc GL_DST_COLOR GL_ZERO
//	}
//}

textures/gothic_block/gkcspinemove
{
	qer_editorimage textures/gothic_block/gkc17d
	tessSize 128
//	deformVertexes wave 100 sin 3 2 0 0.3
	deformVertexes bulge 3 10 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/gkc17d
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
textures/gothic_block/electrohell
{
	qer_editorimage textures/gothic_block/gkc14c
	//light 1
	q3map_surfacelight 400

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/gothic_block/gkc14c
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

	{
		map textures/gothic_block/gkc14c
		blendFunc GL_ONE GL_ONE
	}
		{
		map textures/sfx/electro2
		rgbGen wave sin .7 .7 0 2
		tcMod rotate 1
		tcMod turb 0 0.2 0 0.4
		tcMod stretch sin 1 .5 0 .1
		tcMod scroll .2 .2

		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_block/mkc_evil_e3window
{
	qer_editorimage textures/gothic_block/windowevil2c_block18c
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2cglow
	q3map_surfacelight 400
	// Glowing evil window for pj_dm4
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_block18c
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2cglow
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_block/blocks18d_trans
{
	qer_editorimage textures/gothic_block/blocks18d
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_block/blocks18d
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}
