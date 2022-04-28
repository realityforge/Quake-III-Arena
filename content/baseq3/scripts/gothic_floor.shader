
textures/gothic_floor/q1metal7_99spot
{

        {
		map textures/liquids/proto_grueldark2.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
        }
        {
		map textures/effects/tinfx3.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }

	{
	        map textures/gothic_floor/q1metal7_99spot.png
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
	        map textures/gothic_floor/xq1metalbig_ow.png
	        rgbGen identity
	}
        {
		map textures/sfx/specular.png
                //map textures/liquids/proto_gruel3.png
                tcGen environment
                tcmod scale 3 3
                //tcmod rotate 30
                tcMod turb 0 .25 0 .05
                //tcmod scroll .1 .2
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_floor/xq1metalbig_ow.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
	        map textures/gothic_floor/q1metal7_98blueow.png
	        rgbGen identity
	}
        {
		map textures/sfx/fire_ctfred.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_floor/q1metal7_98blueow.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
	        map textures/gothic_floor/q1metal7_97redow.png
	        rgbGen identity
	}
        {
		map textures/sfx/fire_ctfblue.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_floor/q1metal7_97redow.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/liquids/protolava2.png
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/gothic_floor/fireblocks17floor3.png
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
		map textures/sfx/fireswirl2.png
                tcmod rotate 333
                tcMod stretch sin .8 0.2 0 9.7
	        rgbGen identity
	}
        {
	        map textures/gothic_floor/center2trn.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_floor/center2trn.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/sfx/firegorre.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
	        map textures/gothic_floor/largerblock3b_ow.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map textures/sfx/kenelectric.png
                tcmod scale 2 2
                tcMod turb 0 .2 0 .3
                tcmod scroll 3 5
                rgbGen identity
	}
        {
		map textures/gothic_floor/metalbridge06brokeb.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
	qer_editorimage textures/gothic_floor/xstepborder3_alpha.png
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_floor/xstepborder3_alpha.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}


textures/gothic_floor/xlargeblockfloor5_pent
{
	{
		map textures/gothic_floor/xlargeblockfloor5_pent.png
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/sfx/pentfloor_256_glow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/gothic_floor/xlargeblockfloor5_pent_offset
{
	{
		map textures/gothic_floor/xlargeblockfloor5_pent_offset.png
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/sfx/pentfloor_256_glow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/gothic_floor/glowfloor1
{
	q3map_lightimage textures/gothicfloor/glowfloor1.png
	q3map_surfacelight 600

	// GLOWING RED Floor Color on blocks17g floor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks17g.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/glowred2.blend.png
		// rgbGen wave sin 0.5 0.5 0 0.5
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}

textures/gothic_floor/pent_metalbridge02
{
	q3map_lightimage textures/gothic_floor/pent_glow.png
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge02.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 0.5
	}
}
textures/gothic_floor/pent_metalbridge06
{
	q3map_lightimage textures/gothic_floor/pent_glow.png
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge06.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 0.5
	}
}

textures/gothic_floor/pent_metalbridge06b
{
	q3map_lightimage textures/gothic_floor/pent_glow.png
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge06b.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 0.5
	}
}
