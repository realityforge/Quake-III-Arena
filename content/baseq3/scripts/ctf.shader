textures/ctf/blue_telep
{
        cull disable
        surfaceparm nomarks
        surfaceparm trans
        sort additive

        {

	        clampmap textures/ctf/blue_telep
		blendFunc add
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 327
                rgbGen identity
	}
        {
	        clampmap textures/ctf/blue_telep2
		blendFunc add
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .1
                tcmod rotate -211
                rgbGen identity
        }
        {
	        clampmap textures/ctf/telep
		alphaFunc GE128
                depthWrite
                tcmod rotate 20
	        rgbGen identity
	}
        {
	        clampmap textures/ctf/telep
		alphaFunc GE128
                depthWrite
                tcMod stretch sin .7 0 0 0
                tcmod rotate -20
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}



}
textures/ctf/red_telep
{
        cull disable
        surfaceparm nomarks
        surfaceparm trans

        {

	        clampmap textures/ctf/red_telep
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 327
                rgbGen identity
	}
        {
	        clampmap textures/ctf/red_telep2
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .1
                tcmod rotate -211
                rgbGen identity
        }
        {
	        clampmap textures/ctf/telep
		alphaFunc GE128
                tcmod rotate 20
	        rgbGen identity
	}
        {
	        clampmap textures/ctf/telep
		alphaFunc GE128
                tcMod stretch sin .7 0 0 0
                tcmod rotate -20
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}



}

textures/ctf/test2_trans
{
	qer_editorimage textures/ctf/test2
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ctf/test2
		rgbGen identity
		blendFunc filter
	}

}

textures/ctf/test2_r_trans
{
	qer_editorimage textures/ctf/test2_r
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/ctf/test2_r
		rgbGen identity
		blendFunc filter
	}
}

textures/ctf/killblockctf_r
{
   qer_editorimage   textures/gothic_block/blocks15cgeomtrn

        {
		map textures/sfx/fire_ctfred
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		//blendFunc blend
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
textures/ctf/killblockctf_b
{
   qer_editorimage   textures/gothic_block/killblockgeomtrn

        {
		map textures/sfx/fire_ctfblue
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2
		//blendFunc blend
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
textures/ctf/ctf_arch_b_shiny
{
     qer_editorimage textures/ctf/ctf_arch_b
	   {
		map textures/ctf/ctf_arch_b
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
                map textures/sfx/specular
                blendFunc add
                tcGen environment
                tcmod scale 10 10
                rgbGen identity
	}
        {
		map textures/ctf/ctf_arch_b
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

}

textures/ctf/ctf_arch_r_shiny
{
	qer_editorimage textures/ctf/ctf_arch_r
        {
		map textures/ctf/ctf_arch_r
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
                map textures/sfx/specular
                blendFunc add
                tcGen environment
                tcmod scale 10 10
                rgbGen identity
	}
        {
		map textures/ctf/ctf_arch_r
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

}

textures/gothic_door/door02_bred2_shiny
{
qer_editorimage textures/gothic_door/door02_bred2
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/gothic_door/door02_bred2
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/gothic_door/door02_eblue2_shiny
{
qer_editorimage textures/gothic_door/door02_eblue2

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/gothic_door/door02_eblue2
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
		map textures/ctf/red_scary4_d3fin
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/ctf_tower_bluefin_shiny
{
qer_editorimage textures/ctf/ctf_tower_bluefin
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/ctf_tower_bluefin
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/ctf_tower_redfin_shiny
{
qer_editorimage textures/ctf/ctf_tower_redfin
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/ctf_tower_redfin
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/metalbase09_bluekillblock_shiny
{
qer_editorimage textures/ctf/metalbase09_bluekillblock
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/metalbase09_bluekillblock
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
		map textures/ctf/red_scary4_cfin
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
		map textures/ctf/red_scary4_csansfacefin
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
		map textures/ctf/tallblue_2_fin
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_1L_fin_shiny
{
qer_editorimage textures/ctf/tallblue_1L_fin
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_1R_fin
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_1R_fin_shiny
{
qer_editorimage textures/ctf/tallblue_1R_fin
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_1R_fin
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
		map textures/ctf/tallblue_2b_fin
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_4c_fin_shiny
{
qer_editorimage textures/ctf/tallblue_4c_fin

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_4c_fin
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
		map textures/ctf/tallblue_4bsmall_fin
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
		map textures/ctf/tallblue_5esmallb_fin
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
		map textures/ctf/ctf_blueflag
		rgbGen identity
	}
        {
		map textures/effects/redflagmap
                tcGen environment
                tcmod scale 9 3
                tcmod scroll .1 .7

                blendFunc add
                rgbGen identity
	}
        {
		map textures/ctf/ctf_blueflag
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
        	map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc filter
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
		map textures/ctf/ctf_redflag
		rgbGen identity
	}
        {
		map textures/effects/blueflagmap
                 tcGen environment
                tcmod scale 9 3
                tcmod scroll .1 .7

                blendFunc add
                rgbGen identity
	}
        {
		map textures/ctf/ctf_redflag
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {

        	map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc filter
               rgbGen identity
	}
}
powerups/redflag
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/redflagmap
		blendfunc add
		tcGen environment
		tcMod turb 0 0.2 0 1
	}
}

powerups/blueflag
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/blueflagmap
		blendfunc add
		tcGen environment
		tcMod turb 0 0.2 0 1
	}
}

sprites/friend
{
	nomipmaps
	nopicmip
	{
		map sprites/friend1
		blendfunc blend
	}
}

sprites/foe
{
	nomipmaps
	nopicmip
	{
		map sprites/foe2
		blendfunc blend
	}
}
