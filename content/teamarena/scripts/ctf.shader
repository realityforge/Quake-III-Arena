textures/ctf/blue_telep
{
        cull disable
        surfaceparm nomarks
        surfaceparm trans
        sort additive

        {

	        clampmap textures/ctf/blue_telep.png
		blendFunc add
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 327
                rgbGen identity
	}
        {
	        clampmap textures/ctf/blue_telep2.png
		blendFunc add
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .1
                tcmod rotate -211
                rgbGen identity
        }
        {
	        clampmap textures/ctf/telep.png
		alphaFunc GE128
                depthWrite
                tcmod rotate 20
	        rgbGen identity
	}
        {
	        clampmap textures/ctf/telep.png
		alphaFunc GE128
                depthWrite
                tcMod stretch sin .7 0 0 0
                tcmod rotate -20
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}



}
textures/ctf/red_telep
{
        cull disable
        surfaceparm nomarks
        surfaceparm trans

        {

	        clampmap textures/ctf/red_telep.png
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 327
                rgbGen identity
	}
        {
	        clampmap textures/ctf/red_telep2.png
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .1
                tcmod rotate -211
                rgbGen identity
        }
        {
	        clampmap textures/ctf/telep.png
		alphaFunc GE128
                tcmod rotate 20
	        rgbGen identity
	}
        {
	        clampmap textures/ctf/telep.png
		alphaFunc GE128
                tcMod stretch sin .7 0 0 0
                tcmod rotate -20
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}



}

textures/ctf/test2_trans
{
	qer_editorimage textures/ctf/test2.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ctf/test2.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}

textures/ctf/test2_r_trans
{
	qer_editorimage textures/ctf/test2_r.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/ctf/test2_r.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ctf/killblockctf_r
{
   qer_editorimage   textures/gothic_block/blocks15cgeomtrn.png

        {
		map textures/sfx/fire_ctfred.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.png
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.png
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks15cgeomtrn.png
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/ctf/killblockctf_b
{
   qer_editorimage   textures/gothic_block/killblockgeomtrn.png

        {
		map textures/sfx/fire_ctfblue.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.png
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.png
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/killblockgeomtrn.png
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/ctf/ctf_arch_b_shiny
{
     qer_editorimage textures/ctf/ctf_arch_b.png
	   {
		map textures/ctf/ctf_arch_b.png
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
                map textures/sfx/specular.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scale 10 10
                rgbGen identity
	}
        {
		map textures/ctf/ctf_arch_b.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

}

textures/ctf/ctf_arch_r_shiny
{
	qer_editorimage textures/ctf/ctf_arch_r.png
        {
		map textures/ctf/ctf_arch_r.png
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
                map textures/sfx/specular.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scale 10 10
                rgbGen identity
	}
        {
		map textures/ctf/ctf_arch_r.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

}

textures/gothic_door/door02_bred2_shiny
{
qer_editorimage textures/gothic_door/door02_bred2.png
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/gothic_door/door02_bred2.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/gothic_door/door02_eblue2_shiny
{
qer_editorimage textures/gothic_door/door02_eblue2.png

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/gothic_door/door02_eblue2.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}



textures/ctf/red_scary4_d3fin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/red_scary4_d3fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/ctf_tower_bluefin_shiny
{
qer_editorimage textures/ctf/ctf_tower_bluefin.png
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/ctf_tower_bluefin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/ctf_tower_redfin_shiny
{
qer_editorimage textures/ctf/ctf_tower_redfin.png
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/ctf_tower_redfin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/metalbase09_bluekillblock_shiny
{
qer_editorimage textures/ctf/metalbase09_bluekillblock.png
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/metalbase09_bluekillblock.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/red_scary4_cfin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/red_scary4_cfin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/red_scary4_csansfacefin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/red_scary4_csansfacefin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}



textures/ctf/tallblue_2_fin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_2_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_1L_fin_shiny
{
qer_editorimage textures/ctf/tallblue_1L_fin.png
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_1R_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_1R_fin_shiny
{
qer_editorimage textures/ctf/tallblue_1R_fin.png
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_1R_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}



textures/ctf/tallblue_2b_fin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_2b_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_4c_fin_shiny
{
qer_editorimage textures/ctf/tallblue_4c_fin.png

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_4c_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}




textures/ctf/tallblue_4bsmall_fin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_4bsmall_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/tallblue_5esmallb_fin
{

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_5esmallb_fin.png
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/ctf_blueflag
{
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .5 .1
        surfaceparm nomarks
        cull none

        {
		map textures/ctf/ctf_blueflag.png
		rgbGen identity
	}
        {
		map textures/effects/redflagmap.png
                tcGen environment
                tcmod scale 9 3
                tcmod scroll .1 .7

                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map textures/ctf/ctf_blueflag.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
        	map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}
textures/ctf/ctf_redflag
{
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .3 .2
        surfaceparm nomarks
        cull none

        {
		map textures/ctf/ctf_redflag.png
		rgbGen identity
	}
        {
		map textures/effects/blueflagmap.png
                 tcGen environment
                tcmod scale 9 3
                tcmod scroll .1 .7

                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map textures/ctf/ctf_redflag.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {

        	map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}

textures/ctf/xctf_redflag_noenv
{

// Xian Hax0ring. Don't want the envmap to cut down the number of passes.
// Kenneth is my hero.

	qer_editorimage textures/ctf/ctf_redflag.png
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .3 .2
        surfaceparm nomarks
        cull none

        {
		map textures/ctf/ctf_redflag.png
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {

        	map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}

textures/ctf/xctf_blueflag_noenv
{
	qer_editorimage textures/ctf/ctf_blueflag.png
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .5 .1
        surfaceparm nomarks
        cull none

        {
		map textures/ctf/ctf_blueflag.png
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
        	map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}


powerups/redflag
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/redflagmap.png
		blendfunc GL_ONE GL_ONE
		tcGen environment
		tcMod turb 0 0.2 0 1
	}
}

powerups/blueflag
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/blueflagmap.png
		blendfunc GL_ONE GL_ONE
		tcGen environment
		tcMod turb 0 0.2 0 1
	}
}

sprites/friend
{
	nomipmaps
	nopicmip
	{
		map sprites/friend1.png
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

sprites/foe
{
	nomipmaps
	nopicmip
	{
		map sprites/foe2.png
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
