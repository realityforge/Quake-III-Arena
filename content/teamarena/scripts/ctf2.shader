textures/ctf2/test2_trans_vert
{
	qer_editorimage textures/ctf/test2.png
	surfaceparm nonsolid
	surfaceparm pointlight

  	{
		map textures/ctf/test2.png
		rgbGen vertex
	}
}

textures/ctf2/test2_r_trans_vert
{
	qer_editorimage textures/ctf/test2_r.png
	surfaceparm nonsolid
	surfaceparm pointlight
  	{
		map textures/ctf/test2_r.png
		rgbGen vertex
	}
}

textures/ctf2/redteam02
{
        qer_editorimage textures/ctf2/redteam01.png
	cull none
        surfaceparm alphashadow
        surfaceparm nomarks
	{
		map textures/ctf2/redteam01.png
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
        qer_editorimage textures/ctf2/blueteam01.png
	cull none
        surfaceparm alphashadow
        surfaceparm nomarks
	{
		map textures/ctf2/blueteam01.png
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
		map textures/ctf2/redteam01.png
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
		map textures/ctf2/redteam01.png
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
		map textures/ctf2/blueteam01.png
		blendFunc Add

	}

}


textures/ctf2/xredteam01x
// Non Flashy version
{
	qer_editorimage textures/ctf2/redteam01.png
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/redteam01.png
		blendFunc Add
		rgbgen identity

	}

}


textures/ctf2/xblueteam01
// non flashy version
{
	qer_editorimage textures/ctf2/blueteam01.png
	cull none
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	{
		map textures/ctf2/blueteam01.png
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
		map textures/ctf2/blueteam01.png
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
		map textures/ctf2/red_banner02.png
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
		map textures/ctf2/blue_banner02.png
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
     qer_editorimage textures/proto2/tin_panel.png

        {
		map textures/effects/envmapred.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/tin_panel.png
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
     qer_editorimage textures/proto2/tin_panel.png

        {
		map textures/effects/envmapblue.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/tin_panel.png
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
		map textures/ctf2/blue_banner01.png
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
		map textures/ctf2/b_dummy.png
		blendFunc Add
		rgbGen wave sin 1 .5 0 .5

	}

}
textures/ctf2/blue_techsign01
{
	surfaceparm alphashadow
	cull none

	{
		map textures/ctf2/blue_techsign01.png
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
		map textures/ctf2/b_dummy.png
		blendFunc Add
		rgbGen wave sin 1 .5 0 .5

	}

}

textures/ctf2/pj_baseboardr
{
	//q3map_lightimage textures/ctf2/pj_baseboardr_l.png
	//q3map_surfacelight 300

	{
		map textures/ctf2/pj_baseboardr.png
                rgbGen identity
        }
        {
	        map $lightmap
                blendFunc filter
	        rgbGen identity
	}
        {
		map textures/ctf2/pj_baseboardr_l.png
                blendFunc add
               rgbGen wave sin .9 .5 0 .1
        }

}
textures/ctf2/pj_baseboardb
{
	//q3map_lightimage textures/ctf2/pj_baseboardb_l.png
	//q3map_surfacelight 300

	{
		map textures/ctf2/pj_baseboardb.png
                rgbGen identity
        }
        {
	        map $lightmap
                blendFunc filter
	        rgbGen identity
	}
        {
		map textures/ctf2/pj_baseboardb_l.png
                blendFunc add
                rgbGen wave sin .9 .5 0 .1
        }

}

textures/ctf2/jaildr_bluescroll
{
	qer_editorimage textures/ctf2/jaildr_blue.png
	q3map_lightimage textures/ctf2/jaildr_blue.png
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ctf2/jaildr_blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		tcMod scroll 0 -.25
		rgbGen identity
	}
	{
		map textures/ctf2/jaildr_blue.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		tcMod scroll 0 -.25
		blendfunc GL_ONE GL_ONE
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
		map textures/ctf2/blue_pennant.png
		rgbGen identity
	}

        {
		map textures/ctf2/blue_pennant.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

       // {
        //	map textures/sfx/shadow.png
       //         tcGen environment
       //         //blendFunc GL_ONE GL_ONE
       //         blendFunc GL_DST_COLOR GL_ZERO
      //         rgbGen identity
	//}
}
