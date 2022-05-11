
textures/base_wall/bluemetalsupport2eye
{

        surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/bluemetalsupport2eyel
	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2eye
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
        {
		map textures/base_wall/bluemetalsupport2eyel
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}
}
textures/base_wall/atechengine_ax
{
      q3map_lightimage textures/base_wall/atechengine_ax2
      q3map_surfacelight 300
        {
		map textures/sfx/proto_zzztpink
                tcmod rotate 60
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_wall/atechengine_ax
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
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_wall/concrete_ow
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
	q3map_lightimage textures/base_wall/symbol_bluelt1_mask
	q3map_surfacelight 100
	light 1

	{
		map $lightmap
		rgbGen identity
	}


	{
		map textures/base_wall/symbol_bluelt1
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/base_wall/symbol_bluelt1_mask
		blendfunc add
		rgbgen wave sawtooth .2 .05 0 7
	}
}

textures/base_wall/metaltechgeomtrn
{
	qer_editorimage textures/base_wall/metaltechgeomtrn

        {
		map textures/sfx/fire_ctfblue
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/base_wall/metaltechgeomtrn
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
	qer_editorimage textures/base_wall/metaltechgeomtrn

        {
		map textures/sfx/fire_ctfred
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/base_wall/metaltechgeomtrn
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
		map textures/sfx/specular
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/green_con04
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
	//	map textures/base_wall/green_con04
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
		map textures/effects/tinfx2
                blendFunc GL_ONE GL_ONE
                tcgen environment
                rgbGen identity
	}
	{
		map textures/base_wall/glass_frame
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
		map textures/base_wall/metalfloor_wall_15ow
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
        }

        {
		map textures/sfx/hologirl
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ONE
                rgbGen identity

	}
	{
		map textures/base_wall/metalfloor_wall_15ow
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
		map textures/sfx/hologirl
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/atech1_alpha
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
		map textures/liquids/protolava2
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/concrete4
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
                map textures/base_wall/protobanner_ow
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
		map textures/base_wall/girders1i_yellodark_fin
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
                map textures/base_wall/protobanner
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
     qer_editorimage textures/base_wall/protobanner
     cull disable
     surfaceparm alphashadow
     surfaceparm trans
     surfaceparm nomarks
     tessSize 64
     //deformVertexes wave 30 sin 0 3 0 .2
     //deformVertexes wave 100 sin 0 3 0 .7

        {
                map textures/base_wall/protobanner
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
	qer_editorimage textures/base_wall/medal_impressive
        q3map_surfacelight 100


	{
		animMap .25 textures/base_wall/medal_impressive textures/base_wall/medal_gauntlet textures/base_wall/medal_excellent textures/base_wall/medal_accuracy textures/base_wall/medal_victory textures/base_wall/medal_frags
		rgbGen wave sawtooth 0 1 0 .25

	}

	{
		map textures/base_wall/comp3textd
		blendfunc add
		tcmod scroll 5 .25
		rgbGen wave inversesawtooth 0 1 0 .25
	}

	{
		map textures/base_wall/chrome_env
		tcgen environment
		tcmod scale .5 .5
		blendfunc add
		rgbgen wave triangle .5 .05 0 10
	}

	{
		map textures/base_wall/comp3frame
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
	qer_editorimage textures/base_wall/q3tourney1
        q3map_surfacelight 100



	{
		animMap .25 textures/base_wall/q3tourney1 textures/base_wall/q3tourney2 textures/base_wall/q3tourney3 textures/base_wall/q3tourney4 textures/base_wall/q3tourney5
		rgbGen wave sawtooth 0 1 0 .25

	}

	{
		map textures/base_wall/comp3textd
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 .25
		tcmod scroll 5 .25
	}

	{
		map textures/base_wall/chrome_env
		tcgen environment
		tcmod scale .5 .5
		blendfunc add
		rgbgen wave triangle .5 .05 0 10
	}

	{
		map textures/base_wall/comp3frame
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
	q3map_lightimage textures/base_wall/main_q3abanner
        q3map_surfacelight 100


	{
		map textures/base_wall/main_q3abanner
	        rgbGen wave square 0 1 0 .5
	}

	{
		map textures/base_wall/comp3text
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}

	{
		map textures/base_wall/comp3textb
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
	qer_editorimage textures/base_wall/metalfloor_wall_14_specular
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/metalfloor_wall_14_specular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}


textures/base_wall/shinygrate1_4_glow
{
	q3map_lightimage textures/base_wall/shinygrate1_4_glow_light2
	q3map_surfacelight 100
	q3map_lightsubdivide 32

	{
		map textures/sfx/electricslime
		rgbGen wave sin .5 .5 0 1
		tcmod scale .25 .25
		tcMod scroll -10 -1
	}


	{
		map textures/base_wall/shinygrate1_4_glow
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

	{
		map textures/base_wall/shinygrate1_4_glow_light2
		blendfunc gl_one gl_one
		rgbGen wave triangle .2 .01 0 10
	}


}

textures/base_wall/bluemetal1b_chrome
{
	qer_editorimage textures/base_wall/bluemetal1b

	{
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetal1b_shiny
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
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetal1c
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
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport_shiny
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/grill
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
		map textures/base_wall/grill2
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/effects/tinfx
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}

        {
		map textures/base_wall/grill2
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2
{


	{
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2c_1
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2c_1vent
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
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2c
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2clight
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2clight.glow
		blendFunc add
		rgbgen wave sawtooth .6 .1 0 4
	}
}

textures/base_wall/bluemetalsupport2f
{


	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2f
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2e
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2e2
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
	q3map_lightimage textures/base_wall/bluemetalsupport2fline_glow

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2fline
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall/bluemetalsupport2fline_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 1
	}


}



textures/base_wall/bluemetalsupport2ftv
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2ftv_glow

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2ftv
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall/bluemetalsupport2ftv_glow
		blendFunc add
		rgbGen wave sawtooth .4 .05 0 10
	}


}


textures/base_wall/bluemetalsupport2d_1
{


	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2d_1
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
		map textures/base_wall/chrome_env
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside3a2
		blendFunc blend
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}

	{
		map textures/base_door/shinymetaldoor_outside3glow
		blendFunc add
		rgbGen wave sin .9 .1 0 5
	}

}

textures/base_door/shinymetaldoor_outside3a
{

	{
		map textures/base_wall/chrome_env
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside3a
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
		map textures/base_wall/chrome_env
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside3b
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
		map textures/base_wall/chrome_env
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor_outside
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign_outside
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
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/steedmetal2
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
		map textures/base_wall/steed1gf
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}
textures/base_wall/steed1gd
{
	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/steed1gd
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
		map textures/base_wall/bluemetal1b_shiny
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
		map textures/base_wall/bluemetal2_shiny
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/bluemetal2_shiny_trans
{
	qer_editorimage textures/base_wall/bluemetal2_shiny
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/bluemetal2_shiny
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
		map textures/base_wall/bluemetal2_shiny
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_wall/train1
{

	{
		map textures/base_wall/chrome_env
                tcGen environment
		tcmod scale .25 .1
		rgbGen identity
	}


	{
		map textures/base_wall/train1
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
		map textures/base_wall/bloodstain
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}


textures/base_door/shinymetaldoor
{

	{
		//map $lightmap
		map textures/base_wall/chrome_env
                tcGen environment
		tcmod scale .25 .25
		rgbGen identity
	}


	{
		map textures/base_door/shinymetaldoor
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign
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
	q3map_lightimage textures/base_wall/dooreyelight


	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}
textures/base_wall/dooreye2
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight


	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}


textures/base_wall/dooreye3
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight


	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye3
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight
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
		map textures/effects/tinfx
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
	qer_editorimage textures/base_wall/patch10_beatup4_stain

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/waterdrip
		blendFunc GL_ONE gl_src_alpha
		tcmod scroll 0 -.001
	}

	{
		map textures/base_wall/patch10_beatup4_stain
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
		map textures/base_wall/patch10_beatup4_shiny2
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/patch10shiny
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch10_beatup4_alpha
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/patch10shiny_trans
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch10_beatup4_alpha
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/base_wall/patch11_shiny
{
	qer_editorimage textures/base_wall/patch11_shiny
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/patch11_shiny
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
		map textures/base_wall/bluecover
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
		map textures/base_wall/chrome_env
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}

	{
		map textures/base_wall/shinybluemetal1b
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
	qer_editorimage textures/stone/pjrock18
	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/stone/pjrock18
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
		map textures/base_wall/shinybluemetal1
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
		map textures/base_wall/shinygrate1_4
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
		map textures/base_wall/chrome_env
		tcGen environment
		tcmod scale .25 .25

	}

	{
		map textures/base_wall/chrome_metal
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
		map textures/base_wall/blupaintedmetalcomp
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
		map textures/base_wall/blupaintedmetal
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
		map textures/base_wall/shinymetal2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}






}

textures/base_wall/comp3c
{
        {
		map textures/base_wall/comp3env
	        rgbGen identity
		tcGen environment
	}

        {
		map $lightmap
                tcGen environment
                blendFunc GL_ONE GL_ONE
	}

	{
		map textures/base_wall/comp3c
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
	q3map_lightimage textures/base_wall/comp3textb
        q3map_surfacelight 1000
        {
		map textures/base_wall/comp3textb
	        rgbGen identity
		tcmod scroll 3 3
	}

        {
		map textures/base_wall/comp3env
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
		map textures/base_wall/comp3b
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
	q3map_lightimage textures/base_wall/comp3textb
        q3map_surfacelight 1
        {
		map textures/base_wall/comp3textb
	        rgbGen identity
		tcmod scroll 3 3
	}

        {
		map textures/base_wall/comp3env
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
		map textures/base_wall/comp3b
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
	q3map_lightimage textures/base_wall/comp3env
        q3map_surfacelight 1000
        {
		map textures/base_wall/comp3text
	        rgbGen identity
		tcmod scroll 3 1
	}

        {
		map textures/base_wall/comp3env
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
		map textures/base_wall/comp3
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
	q3map_lightimage textures/base_wall/basewall01bitfx
        q3map_surfacelight 300
        {
		map textures/base_wall/basewall01bit
	        rgbGen identity
	}

	{
		map textures/base_wall/basewall01bitfx
		blendfunc GL_ONE GL_ONE
                tcmod scroll 3.3 1
                rgbGen wave sin .5 0.5 0 5
	}
        {
		map textures/effects/envmap2
                tcGen environment
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
               rgbGen identity
	}
	{
		map textures/base_wall/basewall01bit
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
	q3map_lightimage textures/base_wall/basewall01_owfx

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01_ow
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01_owfx
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 0 .5
	}

}
textures/base_wall/blumtlspt2b
{

	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/blumtlspt2bglow


	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/blumtlspt2b
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2bglow
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base_wall/bluemetalsupport2b
{

	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2bglow


	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall/bluemetalsupport2b
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2bglow
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base_wall/kcgrate1
{
	cull disable

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_wall/kcgrate1
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
	q3map_lightimage textures/base_wall/future9light.color
	q3map_surfacelight 400
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/future9light
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_wall/future9light.blend
		rgbGen wave sin 0.5 0.1 1 0.5
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_wall/bluemetal1light
{
	//surfaceparm nomarks
	q3map_surfacelight 1000
	q3map_lightimage textures/base_wall/bluemetal1light_bl
	light 1
	// blue light in a metal wall
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures//base_wall/bluemetal1light
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_wall/bluemetal1light_bl
		rgbGen wave sin 0.5 0.1 1 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_wall/green_contrim_noisey
//Paul Jaquays uses this on the tops of metal frameworks
{
	qer_editorimage textures/base_wall/green_contrim
	surfaceparm	metalsteps

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/green_contrim
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}
