
textures/gothic_floor/q1metal7_99spot
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
                blendFunc add
                tcGen environment
        }

	{
	        map textures/gothic_floor/q1metal7_99spot
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/gothic_floor/xq1metalbig_ow
{
        {
	        map textures/gothic_floor/xq1metalbig_ow
	        rgbGen identity
	}
        {
		map textures/sfx/specular
                //map textures/liquids/proto_gruel3
                tcGen environment
                tcmod scale 3 3
                //tcmod rotate 30
                tcMod turb 0 .25 0 .05
                //tcmod scroll .1 .2
                blendFunc add
                rgbGen identity
	}
	{
	        map textures/gothic_floor/xq1metalbig_ow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/q1metal7_98blueow
{
        {
	        map textures/gothic_floor/q1metal7_98blueow
	        rgbGen identity
	}
        {
		map textures/sfx/fire_ctfred
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc add
                rgbGen identity
	}
	{
	        map textures/gothic_floor/q1metal7_98blueow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/q1metal7_97redow
{
        {
	        map textures/gothic_floor/q1metal7_97redow
	        rgbGen identity
	}
        {
		map textures/sfx/fire_ctfblue
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc add
                rgbGen identity
	}
	{
	        map textures/gothic_floor/q1metal7_97redow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/fireblocks17floor3
{
//	surfaceparm nolightmap
        {
		map textures/liquids/protolava2
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/gothic_floor/fireblocks17floor3
                blendfunc blend
	}
	{
		map $lightmap
		blendfunc filter
	}
}

textures/gothic_floor/center2trn
{

        {
		map textures/sfx/fireswirl2
                tcmod rotate 333
                tcMod stretch sin .8 0.2 0 9.7
	        rgbGen identity
	}
        {
	        map textures/gothic_floor/center2trn
		blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_floor/center2trn
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/largerblock3b_ow
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
	        map textures/gothic_floor/largerblock3b_ow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/metalbridge06brokeb
{
        {
                map textures/sfx/kenelectric
                tcmod scale 2 2
                tcMod turb 0 .2 0 .3
                tcmod scroll 3 5
                rgbGen identity
	}
        {
		map textures/gothic_floor/metalbridge06brokeb
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}


}

textures/gothic_floor/xstepborder3_shiney
{
	qer_editorimage textures/gothic_floor/xstepborder3_alpha
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_floor/xstepborder3_alpha
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}


textures/gothic_floor/xlargeblockfloor5_pent
{
	{
		map textures/gothic_floor/xlargeblockfloor5_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/sfx/pentfloor_256_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/gothic_floor/xlargeblockfloor5_pent_offset
{
	{
		map textures/gothic_floor/xlargeblockfloor5_pent_offset
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/sfx/pentfloor_256_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/gothic_floor/glowfloor1
{
	q3map_lightimage textures/gothicfloor/glowfloor1
	q3map_surfacelight 600

	// GLOWING RED Floor Color on blocks17g floor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks17g
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/glowred2_blend
		// rgbGen wave sin 0.5 0.5 0 0.5
		blendFunc add
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}

textures/gothic_floor/pent_metalbridge02
{
	q3map_lightimage textures/gothic_floor/pent_glow
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge02
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 0.5
	}
}
textures/gothic_floor/pent_metalbridge06
{
	q3map_lightimage textures/gothic_floor/pent_glow
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge06
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 0.5
	}
}

textures/gothic_floor/pent_metalbridge06b
{
	q3map_lightimage textures/gothic_floor/pent_glow
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge06b
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 0.5
	}
}
