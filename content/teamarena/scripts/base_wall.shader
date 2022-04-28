
textures/base_wall/bluemetalsupport2eye
{

        surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/bluemetalsupport2eyel.png
	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2eye.png
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
        {
		map textures/base_wall/bluemetalsupport2eyel.png
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}
}
textures/base_wall/atechengine_ax
{
      q3map_lightimage textures/base_wall/atechengine_ax2.png
      q3map_surfacelight 300
        {
		map textures/sfx/proto_zzztpink.png
                tcmod rotate 60
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_wall/atechengine_ax.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_wall/concrete_ow
{

        {
		map textures/sfx/proto_zzztblu2.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_wall/concrete_ow.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_wall/symbol_bluelt1
{
	q3map_lightimage textures/base_wall/symbol_bluelt1_mask.png
	q3map_surfacelight 100
	light 1

	{
		map $lightmap
		rgbGen identity
	}


	{
		map textures/base_wall/symbol_bluelt1.png
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/base_wall/symbol_bluelt1_mask.png
		blendfunc add
		rgbgen wave sawtooth .2 .05 0 7
	}
}

textures/base_wall/metaltechgeomtrn
{
	qer_editorimage textures/base_wall/metaltechgeomtrn.png

        {
		map textures/sfx/fire_ctfblue.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn.png
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2.png
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/base_wall/metaltechgeomtrn.png
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

// Xian added -- Feb.29.2000
textures/base_wall/metaltechgeomtrn_red
{
	qer_editorimage textures/base_wall/metaltechgeomtrn.png

        {
		map textures/sfx/fire_ctfred.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn.png
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2.png
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/base_wall/metaltechgeomtrn.png
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}


textures/base_wall/green_con04
{
     {
		map textures/sfx/specular.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/green_con04.png
                blendfunc blend
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
	//{
	//	map $lightmap
	//	rgbgen identity
	//}
	//
	//{
	//	map textures/base_wall/green_con04.png
	//	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	//	rgbGen identity
	//	alphaGen lightingSpecular
	//}
}


textures/base_wall/glass_frame
{
     cull none
     surfaceparm alphashadow

        {
		map textures/effects/tinfx2.png
                blendFunc GL_ONE GL_ONE
                tcgen environment
                rgbGen identity
	}
	{
		map textures/base_wall/glass_frame.png
                alphaFunc GE128
                depthWrite
		rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/metalfloor_wall_15ow
{
        {
		map textures/base_wall/metalfloor_wall_15ow.png
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
        }

        {
		map textures/sfx/hologirl.png
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ONE
                rgbGen identity

	}
	{
		map textures/base_wall/metalfloor_wall_15ow.png
                blendfunc blend
		rgbGen identity
	}
        {
		map $lightmap
		blendFunc filter
                //blendfunc dst_color gl_zero
	}

}

textures/base_wall/atech1_alpha
{

        {
		map textures/sfx/hologirl.png
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/atech1_alpha.png
                blendfunc blend
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/concrete4
{

        {
		map textures/liquids/protolava2.png
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/concrete4.png
                blendfunc blend
                rgbGen identity

	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/protobanner_ow
{
     cull disable
     surfaceparm alphashadow
     surfaceparm trans
     surfaceparm nomarks
     deformVertexes wave 100 sin 0 1 0 .1
     deformVertexes wave 100 sin 0 1 0 .2

        {
                map textures/base_wall/protobanner_ow.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}

textures/base_wall/girders1i_yellofin
{
	surfaceparm	metalsteps
    	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm playerclip
   	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_wall/girders1i_yellodark_fin.png
		blendFunc GL_ONE GL_ZERO
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

textures/base_wall/protobanner
{
     cull disable
     surfaceparm alphashadow
     surfaceparm trans
     surfaceparm nomarks
     tessSize 64
     deformVertexes wave 30 sin 0 3 0 .2
     deformVertexes wave 100 sin 0 3 0 .7

        {
                map textures/base_wall/protobanner.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}

textures/base_wall/protobanner_still
{
     qer_editorimage textures/base_wall/protobanner.png
     cull disable
     surfaceparm alphashadow
     surfaceparm trans
     surfaceparm nomarks
     tessSize 64
     //deformVertexes wave 30 sin 0 3 0 .2
     //deformVertexes wave 100 sin 0 3 0 .7

        {
                map textures/base_wall/protobanner.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}

textures/base_wall/medal_impressive
{
	qer_editorimage textures/base_wall/medal_impressive.png
        q3map_surfacelight 100


	{
		animMap .25 textures/base_wall/medal_impressive.png textures/base_wall/medal_gauntlet.png textures/base_wall/medal_excellent.png textures/base_wall/medal_accuracy.png textures/base_wall/medal_victory.png textures/base_wall/medal_frags.png
		rgbGen wave sawtooth 0 1 0 .25

	}

	{
		map textures/base_wall/comp3textd.png
		blendfunc add
		tcmod scroll 5 .25
		rgbGen wave inversesawtooth 0 1 0 .25
	}

	{
		map textures/base_wall/chrome_env.png
		tcgen environment
		tcmod scale .5 .5
		blendfunc add
		rgbgen wave triangle .5 .05 0 10
	}

	{
		map textures/base_wall/comp3frame.png
		blendfunc blend
		rgbgen identity
	}

	{
		map $lightmap
	        rgbGen identity
		blendfunc gl_dst_color gl_zero
	}


}

textures/base_wall/q3tourneyscreen
{
	qer_editorimage textures/base_wall/q3tourney1.png
        q3map_surfacelight 100



	{
		animMap .25 textures/base_wall/q3tourney1.png textures/base_wall/q3tourney2.png textures/base_wall/q3tourney3.png textures/base_wall/q3tourney4.png textures/base_wall/q3tourney5.png
		rgbGen wave sawtooth 0 1 0 .25

	}

	{
		map textures/base_wall/comp3textd.png
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 .25
		tcmod scroll 5 .25
	}

	{
		map textures/base_wall/chrome_env.png
		tcgen environment
		tcmod scale .5 .5
		blendfunc add
		rgbgen wave triangle .5 .05 0 10
	}

	{
		map textures/base_wall/comp3frame.png
		blendfunc blend
		rgbgen identity
	}

	{
		map $lightmap
	        blendfunc gl_dst_color gl_zero
		rgbgen identity
	}

}




textures/base_wall/main_q3abanner
{
	q3map_lightimage textures/base_wall/main_q3abanner.png
        q3map_surfacelight 100


	{
		map textures/base_wall/main_q3abanner.png
	        rgbGen wave square 0 1 0 .5
	}

	{
		map textures/base_wall/comp3text.png
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}

	{
		map textures/base_wall/comp3textb.png
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}


	{
		map $lightmap
	        rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{
		map $lightmap
		tcgen environment
		tcmod scale .5 .5
	        rgbGen wave sin .25 0 0 0
		blendfunc add
	}
}



textures/base_wall/metalfloor_wall_14_specular
{
	qer_editorimage textures/base_wall/metalfloor_wall_14_specular.png
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/metalfloor_wall_14_specular.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}


textures/base_wall/shinygrate1_4_glow
{
	q3map_lightimage textures/base_wall/shinygrate1_4_glow_light2.png
	q3map_surfacelight 100
	q3map_lightsubdivide 32

	{
		map textures/sfx/electricslime.png
		rgbGen wave sin .5 .5 0 1
		tcmod scale .25 .25
		tcMod scroll -10 -1
	}


	{
		map textures/base_wall/shinygrate1_4_glow.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

	{
		map textures/base_wall/shinygrate1_4_glow_light2.png
		blendfunc gl_one gl_one
		rgbGen wave triangle .2 .01 0 10
	}


}

textures/base_wall/bluemetal1b_chrome
{
	qer_editorimage textures/base_wall/bluemetal1b.png

	{
		map textures/base_wall/chrome_env2.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetal1b_shiny.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}



textures/base_wall/bluemetal1c
{


	{
		map textures/base_wall/chrome_env2.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetal1c.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport_shiny
{


	{
		map textures/base_wall/chrome_env2.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport_shiny.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}


textures/base_wall/grill
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/grill.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}
textures/base_wall/grill2
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_wall/grill2.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/effects/tinfx.png
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}

        {
		map textures/base_wall/grill2.png
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2
{


	{
		map textures/base_wall/chrome_env2.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}



textures/base_wall/bluemetalsupport2c_1
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2c_1.png
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}
textures/base_wall/bluemetalsupport2c_1vent
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2c_1vent.png
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2c
{


	{
		map textures/base_wall/chrome_env2.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2c.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2clight
{
	surfaceparm nomarks
	q3map_surfacelight 500



	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2clight.png
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2clight.glow.png
		blendFunc add
		rgbgen wave sawtooth .6 .1 0 4
	}
}

textures/base_wall/bluemetalsupport2f
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2f.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}




textures/base_wall/bluemetalsupport2e
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2e.png
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2e2
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2e2.png
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}
textures/base_wall/bluemetalsupport2fline
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2fline_glow.png

	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2fline.png
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall/bluemetalsupport2fline_glow.png
		blendFunc add
		rgbGen wave sin .5 .5 0 1
	}


}



textures/base_wall/bluemetalsupport2ftv
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2ftv_glow.png

	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2ftv.png
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall/bluemetalsupport2ftv_glow.png
		blendFunc add
		rgbGen wave sawtooth .4 .05 0 10
	}


}


textures/base_wall/bluemetalsupport2d_1
{


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2d_1.png
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_door/shinymetaldoor_outside3a2
{

	{
		map textures/base_wall/chrome_env.png
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside3a2.png
		blendFunc blend
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}

	{
		map textures/base_door/shinymetaldoor_outside3glow.png
		blendFunc add
		rgbGen wave sin .9 .1 0 5
	}

}

textures/base_door/shinymetaldoor_outside3a
{

	{
		map textures/base_wall/chrome_env.png
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside3a.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}


textures/base_door/shinymetaldoor_outside3b
{

	{
		map textures/base_wall/chrome_env.png
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside3b.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}



textures/base_door/shinymetaldoor_outside
{

	{
		map textures/base_wall/chrome_env.png
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign_outside.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}

textures/base_wall/steedmetal2
{

	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/steedmetal2.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


}

textures/base_wall/steed1gf
{
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/steed1gf.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}
textures/base_wall/steed1gd
{
	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/steed1gd.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


}

textures/base_wall/bluemetal1b_shiny
{
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/bluemetal1b_shiny.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/bluemetal2_shiny
{
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/bluemetal2_shiny.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetal2_shiny_trans
{
	qer_editorimage textures/base_wall/bluemetal2_shiny.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/bluemetal2_shiny.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetal2_noisy
{
	qer_editorimage textures/base_wall/bluemetal2_shiny
	surfaceparm metalsteps
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/bluemetal2_shiny.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/train1
{

	{
		map textures/base_wall/chrome_env.png
                tcGen environment
		tcmod scale .25 .1
		rgbGen identity
	}


	{
		map textures/base_wall/train1.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}

textures/base_wall/bloodstain
{
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/bloodstain.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}


textures/base_door/shinymetaldoor
{

	{
		//map $lightmap
		map textures/base_wall/chrome_env.png
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}
textures/base_wall/dooreye
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight.png


	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight.png
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}
textures/base_wall/dooreye2
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight.png


	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight.png
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}


textures/base_wall/dooreye3
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight.png


	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight.png
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}


textures/base_wall/glass01
{
        surfaceparm trans
	cull none
	qer_trans 	0.5

        {
		map textures/effects/tinfx.png
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/patch10_beat4_drip
{
	qer_editorimage textures/base_wall/patch10_beatup4_stain.png

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/waterdrip.png
		blendFunc GL_ONE gl_src_alpha
		tcmod scroll 0 -.001
	}

	{
		map textures/base_wall/patch10_beatup4_stain.png
		blendFunc GL_ONE GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendfunc gl_dst_color gl_zero
	}





}
textures/base_wall/patch10_beatup4_shiny2
{

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch10_beatup4_shiny2.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/patch10shiny
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha.png
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch10_beatup4_alpha.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/patch10shiny_trans
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch10_beatup4_alpha.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/patch11_shiny
{
	qer_editorimage textures/base_wall/patch11_shiny.png
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch11_shiny.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/bluecover
	{

	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_wall/bluecover.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
		//alphaGen lightingSpecular
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbgen identity
	}


}


textures/base_wall/shinybluemetal1b
{


	{
		map textures/base_wall/chrome_env.png
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}

	{
		map textures/base_wall/shinybluemetal1b.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
		//alphaGen lightingSpecular
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbgen identity
	}



}

textures/base_wall/pjrock18
{
	qer_editorimage textures/stone/pjrock18.png
	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/stone/pjrock18.png
		blendFunc GL_ONE GL_SRC_ALPHA
	//	alphaGen lightingSpecular
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}


}

textures/base_wall/shinybluemetal1
{

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/shinybluemetal1.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}


textures/base_wall/shinygrate1_4
{

	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_wall/shinygrate1_4.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}


}


textures/base_wall/chrome_metal
{
	{
		map textures/base_wall/chrome_env.png
		tcGen environment
		tcmod scale .25 .25

	}

	{
		map textures/base_wall/chrome_metal.png
		blendFunc GL_ONE GL_ONE
		detail
        	tcMod scale 0.0693 0.0712
		rgbGen identity
	}


	{
		map $lightmap
                rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO

	}



}

textures/base_wall/blupaintedmetalcomp
{

	{
		map $lightmap
                tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/blupaintedmetalcomp.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/base_wall/blupaintedmetal
{

	{
		map $lightmap
                tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/blupaintedmetal.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}


textures/base_wall/shinymetal2
{

	{
		map $lightmap
                tcGen environment
		tcmod scale .25 .25
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_ONE GL_SRC_COLOR
	}


	{
		map textures/base_wall/shinymetal2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}






}

textures/base_wall/comp3c
{
        {
		map textures/base_wall/comp3env.png
	        rgbGen identity
		tcGen environment
	}

        {
		map $lightmap
                tcGen environment
                blendFunc GL_ONE GL_ONE
	}

	{
		map textures/base_wall/comp3c.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}


textures/base_wall/comp3b
{
	q3map_lightimage textures/base_wall/comp3textb.png
        q3map_surfacelight 1000
        {
		map textures/base_wall/comp3textb.png
	        rgbGen identity
		tcmod scroll 3 3
	}

        {
		map textures/base_wall/comp3env.png
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin .98 .02 0 5
	}

	{
		map $lightmap
                tcGen environment
                blendFunc GL_DST_COLOR GL_ONE
	}


	{
		map textures/base_wall/comp3b.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}

textures/base_wall/comp3b_dark
{
	q3map_lightimage textures/base_wall/comp3textb.png
        q3map_surfacelight 1
        {
		map textures/base_wall/comp3textb.png
	        rgbGen identity
		tcmod scroll 3 3
	}

        {
		map textures/base_wall/comp3env.png
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin .98 .02 0 5
	}

	{
		map $lightmap
                tcGen environment
                blendFunc GL_DST_COLOR GL_ONE
	}


	{
		map textures/base_wall/comp3b.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}


textures/base_wall/comp3
{
	q3map_lightimage textures/base_wall/comp3env.png
        q3map_surfacelight 1000
        {
		map textures/base_wall/comp3text.png
	        rgbGen identity
		tcmod scroll 3 1
	}

        {
		map textures/base_wall/comp3env.png
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin .98 .02 0 5
	}

	{
		map $lightmap
                tcGen environment
                blendFunc GL_DST_COLOR GL_ONE
	}


	{
		map textures/base_wall/comp3.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}


textures/base_wall/basewall01bit
{
	q3map_lightimage textures/base_wall/basewall01bitfx.png
        q3map_surfacelight 300
        {
		map textures/base_wall/basewall01bit.png
	        rgbGen identity
	}

	{
		map textures/base_wall/basewall01bitfx.png
		blendfunc GL_ONE GL_ONE
                tcmod scroll 3.3 1
                rgbGen wave sin .5 0.5 0 5
	}
        {
		map textures/effects/envmap2.png
                tcGen environment
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
               rgbGen identity
	}
	{
		map textures/base_wall/basewall01bit.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}

	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}


}
textures/base_wall/basewall01_ow
{
	q3map_lightimage textures/base_wall/basewall01_owfx.png

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01_ow.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01_owfx.png
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 0 .5
	}

}
textures/base_wall/blumtlspt2b
{

	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/blumtlspt2bglow.png


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/blumtlspt2b.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2bglow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base_wall/bluemetalsupport2b
{

	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2bglow.png


	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2b.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2bglow.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base_wall/kcgrate1
{
	cull disable

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_wall/kcgrate1.png
		tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		// alphaFunc GT0
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


textures/base_wall/future9light
{
	q3map_lightimage textures/base_wall/future9light.color.png
	q3map_surfacelight 400
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/future9light.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_wall/future9light.blend.png
		rgbGen wave sin 0.5 0.1 1 0.5
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_wall/bluemetal1light
{
	//surfaceparm nomarks
	q3map_surfacelight 1000
	q3map_lightimage textures/base_wall/bluemetal1light_bl.png
	light 1
	// blue light in a metal wall
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures//base_wall/bluemetal1light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_wall/bluemetal1light_bl.png
		rgbGen wave sin 0.5 0.1 1 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_wall/green_contrim_noisey
//Paul Jaquays uses this on the tops of metal frameworks
{
	qer_editorimage textures/base_wall/green_contrim.png
	surfaceparm	metalsteps

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/green_contrim.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}
