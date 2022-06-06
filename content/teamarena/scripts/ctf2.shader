
textures/ctf/xctf_redflag_noenv
{

// Xian Hax0ring. Don't want the envmap to cut down the number of passes.
// Kenneth is my hero.

	qer_editorimage textures/ctf/ctf_redflag
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
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {

        	map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}

textures/ctf/xctf_blueflag_noenv
{
	qer_editorimage textures/ctf/ctf_blueflag
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
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
        	map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}

textures/ctf2/test2_trans_vert
{
	qer_editorimage textures/ctf/test2
	surfaceparm nonsolid
	surfaceparm pointlight

  	{
		map textures/ctf/test2
		rgbGen vertex
	}
}

textures/ctf2/test2_r_trans_vert
{
	qer_editorimage textures/ctf/test2_r
	surfaceparm nonsolid
	surfaceparm pointlight
  	{
		map textures/ctf/test2_r
		rgbGen vertex
	}
}

textures/ctf2/redteam02
{
        qer_editorimage textures/ctf2/redteam01
	cull none
        surfaceparm alphashadow
        surfaceparm nomarks
	{
		map textures/ctf2/redteam01
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}
textures/ctf2/blueteam02
{
        qer_editorimage textures/ctf2/blueteam01
	cull none
        surfaceparm alphashadow
        surfaceparm nomarks
	{
		map textures/ctf2/blueteam01
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}
textures/ctf2/redteam01
{
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/redteam01
		blendFunc Add
		//rgbgen wave triangle 0.2 0.5 0 0.2
                rgbGen wave sin 1 .5 0 .2

	}

}
textures/ctf2/redteamscore
{
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/redteam01
		blendFunc Add

	}

}

textures/ctf2/blueteamscore
{
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/blueteam01
		blendFunc Add

	}

}


textures/ctf2/xredteam01x
// Non Flashy version
{
	qer_editorimage textures/ctf2/redteam01
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/redteam01
		blendFunc Add
		rgbgen identity

	}

}


textures/ctf2/xblueteam01
// non flashy version
{
	qer_editorimage textures/ctf2/blueteam01
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/blueteam01
		blendFunc Add
		rgbgen identity
	}

}


textures/ctf2/blueteam01
{
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/blueteam01
		blendFunc Add
		//rgbgen wave triangle 0.2 0.5 0 0.2
                rgbGen wave sin 1 .8 0 .2

	}

}


textures/ctf2/red_banner02
{
	surfaceparm alphashadow
	cull none

	{
		map textures/ctf2/red_banner02
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}

	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}

textures/ctf2/blue_banner02
{
	surfaceparm alphashadow
	cull none

	{
		map textures/ctf2/blue_banner02
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}

	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}
textures/ctf2/tin_redpanel
{
     surfaceparm	metalsteps
     qer_editorimage textures/proto2/tin_panel

        {
		map textures/effects/envmapred
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/tin_panel
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/ctf2/tin_blupanel
{
     surfaceparm	metalsteps
     qer_editorimage textures/proto2/tin_panel

        {
		map textures/effects/envmapblue
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/tin_panel
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/ctf2/blue_banner01
{
	surfaceparm alphashadow
	cull none

	{
		map textures/ctf2/blue_banner01
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}

	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

        {
		map textures/ctf2/b_dummy
		blendFunc Add
		rgbGen wave sin 1 .5 0 .5

	}

}
textures/ctf2/blue_techsign01
{
	surfaceparm alphashadow
	cull none

	{
		map textures/ctf2/blue_techsign01
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}

	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

        {
		map textures/ctf2/b_dummy
		blendFunc Add
		rgbGen wave sin 1 .5 0 .5

	}

}

textures/ctf2/pj_baseboardr
{
	//q3map_lightimage textures/ctf2/pj_baseboardr_l
	//q3map_surfacelight 300

	{
		map textures/ctf2/pj_baseboardr
                rgbGen identity
        }
        {
	        map $lightmap
                blendFunc filter
	        rgbGen identity
	}
        {
		map textures/ctf2/pj_baseboardr_l
                blendFunc add
               rgbGen wave sin .9 .5 0 .1
        }

}
textures/ctf2/pj_baseboardb
{
	//q3map_lightimage textures/ctf2/pj_baseboardb_l
	//q3map_surfacelight 300

	{
		map textures/ctf2/pj_baseboardb
                rgbGen identity
        }
        {
	        map $lightmap
                blendFunc filter
	        rgbGen identity
	}
        {
		map textures/ctf2/pj_baseboardb_l
                blendFunc add
                rgbGen wave sin .9 .5 0 .1
        }

}

textures/ctf2/jaildr_bluescroll
{
	qer_editorimage textures/ctf2/jaildr_blue
	q3map_lightimage textures/ctf2/jaildr_blue
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ctf2/jaildr_blue
		blendFunc GL_DST_COLOR GL_ZERO
		tcMod scroll 0 -.25
		rgbGen identity
	}
	{
		map textures/ctf2/jaildr_blue_blend
		rgbGen wave sin 0.5 0.5 1 1
		tcMod scroll 0 -.25
		blendfunc add
	}
}

textures/ctf2/blue_pennant
{
	DeformVertexes autosprite2
        tessSize 64
        deformVertexes wave 128 sin 0 5 0 .2
        deformVertexes normal .5 .2
        surfaceparm nomarks
	surfaceparm nolightmap
        //cull none

        {
		map textures/ctf2/blue_pennant
		rgbGen identity
	}

        {
		map textures/ctf2/blue_pennant
                blendFunc blend
		rgbGen identity
	}

       // {
        //	map textures/sfx/shadow
       //         tcGen environment
       //         //blendFunc add
       //         blendFunc GL_DST_COLOR GL_ZERO
      //         rgbGen identity
	//}
}
