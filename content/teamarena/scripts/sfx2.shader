textures/sfx2/senbouncenolit
{
	surfaceparm nodamage
	surfaceparm nomarks
	q3map_lightimage textures/sfx/jumppadsmall
	qer_editorimage textures/sfx/bouncepad01block18b

	{
		map textures/sfx/bouncepad01block18b
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/bouncepad01b_layer1
		blendfunc add
		rgbGen wave sin .5 .5 0 1.5
	}

	{
		clampmap textures/sfx/jumppadsmall
		blendfunc add
		tcMod stretch sin 1.2 .8 0 1.5
		rgbGen wave square .5 .5 .25 1.5
	}
}


textures/sfx2/flame_nolit_noshad
{
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	qer_editorimage textures/sfx/flame1


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
	}

}

textures/sfx2/demonltblacknolight
{
	q3map_lightimage textures/sfx/demonltblackfinal_glow2
	surfaceparm nomarks
	qer_editorimage textures/sfx/demonltblackfinal

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/sfx/demonltblackfinal
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/demonltblackfinal_glow2
		blendfunc add
		rgbgen wave sin .9 .1 0 5
	}

}

textures/sfx2/jumpadx
{


        {
	        map textures/sfx2/jumpadn
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadn2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpadx
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/beam01
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map textures/sfx2/beam01
                tcMod Scroll .1 0
                blendFunc add
        }

}

textures/sfx2/ouchfog
{
        qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 50
	fogparms ( .66 0 0 ) 392



	{
		map textures/sfx2/ouchfog
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/sfx2/ouchfog
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}


textures/sfx2/autorain
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .5
        deformVertexes move 3 1 0  sin 0 5 0 0.2
        deformVertexes move .6 3.3 0  sin 0 5 0 0.4
        deformVertexes autoSprite2
	cull none
        //nopicmip

	{
		map textures/sfx2/autorain
                tcMod Scroll .5 -8
                tcMod turb .1 .25 0 -.1
                blendFunc add
        }
}

textures/sfx2/flameanim_red_lowlite
{

	//	*************************************************
	//	*      	Red Flame 				*
	//	*      	April 24, 2000 Surface Light 1000    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/r_flame3
	q3map_lightimage textures/sfx/r_flame3
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1000
	// surfacelight changed to 1000 on 04/24/00.... PAJ

	{
		animMap 10 textures/sfx/r_flame1 textures/sfx/r_flame2 textures/sfx/r_flame3 textures/sfx/r_flame4 textures/sfx/r_flame5 textures/sfx/r_flame6 textures/sfx/r_flame7 textures/sfx/r_flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/r_flame2 textures/sfx/r_flame3 textures/sfx/r_flame4 textures/sfx/r_flame5 textures/sfx/r_flame6 textures/sfx/r_flame7 textures/sfx/r_flame8 textures/sfx/r_flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/r_flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}
textures/sfx2/flameanim_blue_lowlite
{

	//	*************************************************
	//	*      	Blue Flame 				*
	//	*      	April 24, 2000 Surface Light 1000    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/b_flame7
	q3map_lightimage textures/sfx/b_flame7
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1000
	// texture changed to 1K surface light.... PAJ


	{
		animMap 10 textures/sfx/b_flame1 textures/sfx/b_flame2 textures/sfx/b_flame3 textures/sfx/b_flame4 textures/sfx/b_flame5 textures/sfx/b_flame6 textures/sfx/b_flame7 textures/sfx/b_flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/b_flame2 textures/sfx/b_flame3 textures/sfx/b_flame4 textures/sfx/b_flame5 textures/sfx/b_flame6 textures/sfx/b_flame7 textures/sfx/b_flame8 textures/sfx/b_flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/b_flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx2/menuflare
{
	{
		clampmap textures/sfx2/menuflare
		blendfunc add
		tcmod rotate 30
	}
}

textures/sfx2/pagans
{
	{
		clampmap ui/assets/pagans
		blendfunc add
		rgbgen wave sin .25 0 0 0
	}
}

textures/sfx2/mainbanner
{
	{
		map textures/sfx2/mainbanner
		blendfunc add
		tcmod scroll .02 0
	}
}

textures/sfx2/blue_jumpad05
{
      qer_editorimage textures/sfx2/jumpad05

        {
	        map textures/sfx2/jumpadb
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadb2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad05
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/red_jumpad05
{
      qer_editorimage textures/sfx2/jumpad05

        {
	        map textures/sfx2/jumpadr
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadr2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad05
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx2/screen01
{
    cull disable
    surfaceparm nomarks

	{
		map textures/sfx2/screen01
                tcMod scroll 9 .1
               	rgbGen identity
	}
        {
		map textures/effects2/tinfx_scr
                blendfunc add
                tcGen environment
               	rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}



}
textures/sfx2/red_edge
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap

	{
		map textures/sfx2/red_edge
		blendFunc add
                tcMod scale .2 .2
                tcMod scroll .2 .2
               	rgbGen identity
	}



}
textures/sfx2/blue_edge
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap

	{
		map textures/sfx2/blue_edge
		blendFunc add
                tcMod scale .2 .2
                tcMod scroll .2 .2
              	rgbGen identity
	}



}
textures/sfx2/b_smack01
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/sfx2/b_smack01
		blendFunc add
                tcMod turb 0 .05 .06 .25
		rgbgen wave sin 0 1 0 .19
	}
        {
		map textures/sfx2/b_smack03
		blendFunc add
                tcMod turb 0 .05 .07 .33
		rgbgen wave sin 0 1 0 7
	}
        {
		map textures/sfx2/b_smack02
		blendFunc add
                tcMod turb 0 .07 .05 .4
		rgbgen wave sin 0 1 0 .5
	}



}
textures/sfx2/r_fight01
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/sfx2/r_fight01
		blendFunc add
                tcMod turb 0 .05 .06 .25
		rgbgen wave sin 0 1 0 .19
	}
        {
		map textures/sfx2/r_fight02
		blendFunc add
                tcMod turb 0 .05 .07 .33
		rgbgen wave sin 0 1 0 7
	}
        {
		map textures/sfx2/r_fight03
		blendFunc add
                tcMod turb 0 .07 .05 .4
		rgbgen wave sin 0 1 0 .5
	}



}
textures/sfx2/ven_beam
{
    qer_editorimage textures/sfx2/ven_beam_img
    cull disable
    surfaceparm trans

	{
		map textures/sfx2/ven_beam
		blendFunc add
		rgbGen identity
	}



}

textures/sfx2/kamikaze
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull twosided
        deformVertexes autoSprite

	{
		map textures/sfx2/kamikaze
		blendfunc Add
		rgbGen identity
	}
}

textures/sfx2/doubler
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull twosided
        deformVertexes autoSprite

	{
		map textures/sfx2/doubler
		blendfunc Add
		rgbGen identity
	}
}

textures/sfx2/guard
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull twosided
        deformVertexes autoSprite

	{
		map textures/sfx2/guard
		blendfunc Add
		rgbGen identity
	}
}
textures/sfx2/scout
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull twosided
        deformVertexes autoSprite

	{
		map textures/sfx2/scout
		blendfunc Add
		rgbGen identity
	}
}
textures/sfx2/padwall_red
	{

	q3map_lightimage textures/sfx2/dm3padwallglow_red
	qer_editorimage textures/sfx2/dm3padwall_red

	{
		map textures/sfx2/dm3padwall_red
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}


	{
		map textures/sfx2/dm3padwallglow_red
		blendfunc add
		rgbgen wave sin 0 1 0 .5
		tcmod scale 1 .05
		tcmod scroll 0 1
	}

}

textures/sfx2/padwall_red_light
	{

	q3map_lightimage textures/sfx2/dm3padwallglow_red
	qer_editorimage textures/sfx2/dm3padwall_red
	q3map_surfacelight 100
	q3map_lightsubdivide 64
	{
		map textures/sfx2/dm3padwall_red
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}


	{
		map textures/sfx2/dm3padwallglow_red
		blendfunc add
		rgbgen wave sin 0 1 0 .5
		tcmod scale 1 .05
		tcmod scroll 0 1
	}

}



textures/sfx2/padwall_ntl
	{

	q3map_lightimage textures/sfx2/dm3padwallglow_ntl
	qer_editorimage textures/sfx2/dm3padwall_red

	{
		map textures/sfx2/dm3padwall_red
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}


	{
		map textures/sfx2/dm3padwallglow_ntl
		blendfunc add
		rgbgen wave sin 0 1 0 .5
		tcmod scale 1 .05
		tcmod scroll 0 1
	}

}

textures/sfx2/nebula
{
    cull disable
    surfaceparm trans
    surfaceparm pointlight
    surfaceparm nomarks
    //deformVertexes wave 50 sin 0 3 0 .3
    //deformVertexes move .3 .1 0  sin 0 .5 0 0.2
   //deformVertexes move .6 .3 0  sin 0 .5 0 0.4
	{
		map textures/sfx2/nebula

                tcmod scroll .008 .012
		blendFunc add
		rgbGen vertex
	}
        {
		map textures/sfx2/nebula

                tcmod scroll -.01 .012
                tcMod stretch sin .8 0.10 0 .01
		blendFunc add
		rgbGen vertex
	}




}
textures/sfx2/ntrl_launchpad
{
      qer_editorimage textures/sfx2/launchpad03

        {
	        map textures/sfx2/tread
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 .7
                tcmod scale  1 2
	        rgbGen identity
	}
        {
	        map textures/sfx2/nlaunch
                blendFunc Add
                tcmod scale  1 .5
                tcmod scroll 0 2
	        rgbgen wave square 0 1 0 2
                alphagen wave square 0 1 .1 2
	}

        {
		map textures/sfx2/launchpad03
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
	        map textures/sfx2/nlaunch2
                blendFunc Add
	        rgbgen wave square 0 1 0 1
                alphagen wave square 0 1 .1 1

	}

}
textures/sfx2/blue_launchpad
{
      qer_editorimage textures/sfx2/launchpad03

        {
	        map textures/sfx2/tread
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 .7
                tcmod scale  1 2
	        rgbGen identity
	}
        {
	        map textures/sfx2/blaunch
                blendFunc Add
                tcmod scale  1 .5
                tcmod scroll 0 2
	        rgbgen wave square 0 1 0 2
                alphagen wave square 0 1 .1 2
	}

        {
		map textures/sfx2/launchpad03
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
	        map textures/sfx2/blaunch2
                blendFunc Add
	        rgbgen wave square 0 1 0 1
                alphagen wave square 0 1 .1 1

	}

}
textures/sfx2/red_launchpad
{
      qer_editorimage textures/sfx2/launchpad03

        {
	        map textures/sfx2/tread
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 .7
                tcmod scale  1 2
	        rgbGen identity
	}
        {
	        map textures/sfx2/rlaunch
                blendFunc Add
                tcmod scale  1 .5
                tcmod scroll 0 2
	        rgbgen wave square 0 1 0 2
                alphagen wave square 0 1 .1 2
	}

        {
		map textures/sfx2/launchpad03
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
	        map textures/sfx2/rlaunch2
                blendFunc Add
	        rgbgen wave square 0 1 0 1
                alphagen wave square 0 1 .1 1

	}

}


textures/sfx2/tread2
{

        {
	        map textures/sfx2/tread2
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx2/ntrl_jumpad
{
      qer_editorimage textures/sfx2/jumpad02

        {
	        map textures/sfx2/jumpadn
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadn2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad02
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx2/blue_jumpad
{
      qer_editorimage textures/sfx2/jumpad02

        {
	        map textures/sfx2/jumpadb
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadb2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad02
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/red_jumpad
{
      qer_editorimage textures/sfx2/jumpad02

        {
	        map textures/sfx2/jumpadr
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadr2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad02
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx2/ntrl_jumpad2
{
      qer_editorimage textures/sfx2/jumpad01

        {
	        map textures/sfx2/jumpadn
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadn2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad01
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx2/blue_jumpad2
{
      qer_editorimage textures/sfx2/jumpad01

        {
	        map textures/sfx2/jumpadb
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadb2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad01
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/red_jumpad2
{
      qer_editorimage textures/sfx2/jumpad01

        {
	        map textures/sfx2/jumpadr
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadr2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad01
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

/////
textures/sfx2/ntrl_jumpad3
{
      qer_editorimage textures/sfx2/jumpad03

        {
	        map textures/sfx2/jumpadn
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadn2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad03
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx2/blue_jumpad3
{
      qer_editorimage textures/sfx2/jumpad03

        {
	        map textures/sfx2/jumpadb
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadb2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad03
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/red_jumpad3
{
      qer_editorimage textures/sfx2/jumpad03

        {
	        map textures/sfx2/jumpadr
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadr2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad03
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/blue_jumpad6
{
      qer_editorimage textures/sfx2/jumpad_tile01
	//q3mapsurfacelight 500
	//qer_lightimage textures/sfx2/jumpadb2

        {
	        map textures/sfx2/jumpadb
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadb2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad_tile01
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/red_jumpad6

{
      qer_editorimage textures/sfx2/jumpad_tile01
        //q3mapsurfacelight 500
//qer_lightimage textures/sfx2/jumpadr2
        {
	        map textures/sfx2/jumpadr
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                //tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		  blendFunc blend
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadr2
		blendfunc Add
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad_tile01
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx2/redgoal2
{
	surfaceparm nolightmap
	//surfaceparm nonsolid
	surfaceparm trans
	cull twosided
	{
		map textures/sfx2/redgoal2
		tcGen environment
                tcmod scale 2 2
		blendfunc add
		tcMod turb 0 0.25 0 0.5
	}
}


textures/sfx2/bluegoal2
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull twosided
	{
		map textures/sfx2/bluegoal2
		tcGen environment
                tcmod scale 2 2
		blendfunc add
		tcMod turb 0 0.25 0 0.5
	}
}
textures/sfx2/swirl_b1
{
        deformVertexes wave 100 sin 1 2 .1 1
        //q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
        surfaceparm nonsolid
	cull none

	{
		clampmap textures/sfx2/swirl_b1
		blendFunc add
                tcMod rotate -188
	}
        {
		clampmap textures/sfx2/swirl_b2
		blendFunc add
                tcMod rotate 333
	}

}
textures/sfx2/swirl_r1
{
        deformVertexes wave 100 sin 1 2 .1 1
        //q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
        surfaceparm nonsolid
	cull none

	{
		clampmap textures/sfx2/swirl_r1
		blendFunc add
                tcMod rotate -188
	}
        {
		clampmap textures/sfx2/swirl_r2
		blendFunc add
                tcMod rotate 333
	}

}
textures/sfx2/jumportal01
{


	surfaceparm trans
	cull none

	{
		map textures/sfx2/jumportal01
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}
textures/sfx2/jumportal02
{


	surfaceparm trans
	cull none

	{
		map textures/sfx2/jumportal02
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}
textures/sfx2/scrolling_red
{
	qer_editorimage textures/base_light/jaildr1_3
	surfaceparm nomarks
	q3map_lightimage textures/base_light/jaildr1_3_blend
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3
		blendFunc filter
		tcMod scroll 0 -.25
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3_blend
		rgbGen wave sin 0.5 0.5 1 1
		tcMod scroll 0 -.25
		blendfunc add
	}
}
textures/sfx2/dist_fog

{
	qer_editorimage textures/sfx2/dist_fog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	surfaceparm nodrop
	//q3map_surfacelight 30
	fogparms ( .05 .04 .03 ) 512
}

textures/sfx2/b_flame1
{
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
        {
		animMap 10 textures/sfx/b_flame1 textures/sfx/b_flame2 textures/sfx/b_flame3 textures/sfx/b_flame4 textures/sfx/b_flame5 textures/sfx/b_flame6 textures/sfx/b_flame7 textures/sfx/b_flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/b_flame2 textures/sfx/b_flame3 textures/sfx/b_flame4 textures/sfx/b_flame5 textures/sfx/b_flame6 textures/sfx/b_flame7 textures/sfx/b_flame8 textures/sfx/b_flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/b_flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}
textures/sfx2/drizzle
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .5
        deformVertexes move 3 1 0  sin 0 5 0 0.2
        deformVertexes move .6 3.3 0  sin 0 5 0 0.4
        deformVertexes wave 30 sin 0 10 0 .2
	cull none
	{
		map textures/sfx2/drizzle
                tcMod Scroll .5 -8
                //tcMod turb .1 .25 0 -.1
                blendFunc add
        }
        {
		map textures/sfx2/drizzle
                tcMod Scroll .01 -6.3
                blendFunc add
        }


}

//***********************************************************
//****                                                   ****
//****   Created 1/19/00 for use in Assassin's Roost     ****
//****   Document any changes made to this shader        ****
//****                                                   ****
//***********************************************************

textures/sfx2/jumppad_q1metal7_97
//Red side bounce pad
{
	qer_editorimage textures/sfx2/bouncepad_q1metal7_97
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 1000


	{
		map textures/sfx2/bouncepad_q1metal7_97
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/bouncepad01b_layer1
		blendfunc add
		rgbGen wave sin .5 .5 0 1.5
	}

	{
		clampmap textures/sfx/jumppadsmall
		blendfunc add
		tcMod stretch sin 1.2 .8 0 1.5
		rgbGen wave square .5 .5 .25 1.5
	}

	//	END
}

//***********************************************************
//****                                                   ****
//****   Created 1/19/00 for use in Assassin's Roost     ****
//****   Document any changes made to this shader        ****
//****                                                   ****
//***********************************************************

textures/sfx2/jumppad_q1metal7_98
//Blue side bounce pad
{
	qer_editorimage textures/sfx2/bouncepad_q1metal7_98
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 1000

	{
		map textures/sfx2/bouncepad_q1metal7_98
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/bouncepad01b_layer1
		blendfunc add
		rgbGen wave sin .5 .5 0 1.5
	}

	{
		clampmap textures/sfx/jumppadsmall
		blendfunc add
		tcMod stretch sin 1.2 .8 0 1.5
		rgbGen wave square .5 .5 .25 1.5
	}

	//	END
}
