
textures/sfx/blocks17g_jumpad
{
	surfaceparm nodamage
	q3map_surfacelight 400


	{
		map textures/sfx/blocks17g_jumpad
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

textures/sfx/dclogo
{
	qer_editorimage textures/gothic_floor/largerblock3b
	nomipmaps


	{
		map textures/base_floor/clangdark
		rgbGen identity
		tcmod scale 4 4
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}


	{
		clampmap textures/effects/dreamcast-logo2
		blendfunc add
		tcmod rotate -75
		rgbGen wave sin .75 .25 0 .5
	}

	//	END
}


textures/sfx/bullseye
{
        cull disable
        //surfaceparm trans
        surfaceparm nomarks
        surfaceparm nolightmap
        deformVertexes autosprite
        //nomipmaps

        {
		clampmap textures/sfx/bullseye
                tcMod stretch sin .8 0.2 0 .2
                tcmod rotate 200
                blendFunc add
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
	        tcMod stretch sin .8 0.2 0 .3
                tcmod rotate 70
                alphaFunc GE128
                rgbGen identity
	}
        {
	        //clampmap textures/sfx/bullseye
                clampmap textures/gothic_block/blocks18cgeomtrn2
                tcMod stretch sin .8 0.2 0 .2
                tcmod rotate 50
                alphaFunc GE128
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
                tcMod stretch sin .8 0.2 0 .1
                tcmod rotate 30
                alphaFunc GE128
                rgbGen identity
	}

}
textures/sfx/omm
{

        surfaceparm trans
	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

       {
                map textures/sfx/omm
                blendFunc GL_ONE GL_ZERO
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
textures/sfx/dust_puppy2
{

        surfaceparm trans
	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

       {
                map textures/sfx/dust_puppy2
                blendFunc GL_ONE GL_ZERO
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
textures/sfx/spawn_floord2c
{

        {
		map textures/sfx/proto_zzztblu
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
                blendFunc blend
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/sfx/spawn_floord2c
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/sfx/spawn_floord2c_red
{
	qer_editorimage textures/sfx/spawn_floord2c
        {
		map textures/sfx/proto_zzzt
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
                blendFunc blend
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/sfx/spawn_floord2c
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}


textures/sfx/spawn_floor
{

        {
		map textures/sfx/firegorre2
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
                blendFunc blend
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/sfx/spawn_floor
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx/fan3blade
{
      cull disable
      surfaceparm trans

        {
	        clampmap textures/sfx/fan3blade
                alphaFunc GE128
                tcmod rotate 90
	        rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}
textures/sfx/fan3bladeb
{
      cull disable
      surfaceparm trans
      surfaceparm nolightmap
      sort 5
        {
	        clampmap textures/sfx/fan3bladeb
                blendFunc blend
                tcmod rotate 999
	        rgbGen identity
	}

}
textures/sfx/fan3
{
       cull disable
       surfaceparm alphashadow
       sort 6
        {
	        map textures/sfx/fan3
		blendFunc blend
	        rgbGen identity
	}

        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}

textures/sfx/lavabeam
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map textures/sfx/lavabeam
                tcMod Scroll 999 0
                blendFunc add
        }

}
textures/sfx/healthfloor
{

        {
		map textures/sfx/proto_zzztblu2
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
                blendFunc blend
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2
		blendFunc blend
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        clampmap textures/sfx/healthfloor
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/sfx/proto_zzztblu3
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/proto_zzztblu3
		tcGen environment
                tcMod turb 0 0.25 0 0.5
                tcmod scroll 1 1
		blendfunc add
	}
}

textures/sfx/flametest
{
        deformVertexes autoSprite2
        surfaceparm trans
        surfaceparm nomarks
	surfaceparm nolightmap
        q3map_surfacelight 150
        cull none

	{
	        map textures/sfx/flametest
                blendFunc add
                rgbgen identity
	}


}
textures/sfx/bouncepad01_xarch
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bouncepad01_xarch
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


textures/sfx/rain
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
        //nopicmip

	{
		map textures/sfx/rain
                tcMod Scroll .5 -8
                tcMod turb .1 .25 0 -.1
                blendFunc add
        }
        {
		map textures/sfx/rain
                tcMod Scroll .01 -6.3

                blendFunc add
        }


}
textures/sfx/largerblock3b3x128_pentred
{
	qer_editorimage textures/sfx/largerblock3b3x128_pent
	q3map_lightimage textures/gothic_floor/pent_glow
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/largerblock3b3x128_pent
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 0.5
	}
}

textures/sfx/largerblock3b3x128_pent
{
	qer_editorimage textures/sfx/largerblock3b3x128_pent
	q3map_lightimage textures/sfx/pentagramfloor_blue3glowtest
	q3map_surfacelight 100
	surfaceparm nomarks

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/sfx/largerblock3b3x128_pent
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/pentagramfloor_blue3glowtest
		blendfunc add
		rgbgen wave sin .9 .1 0 5
	}

}


textures/sfx/smallerblock3b3dim_pent
{
	qer_editorimage textures/sfx/smallerblock3b3dim_pent
	{
		map textures/sfx/smallerblock3b3dim_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/fishy
{
    tesssize 32
    deformVertexes wave 10 sin 0 3 0 .5
    cull disable
    surfaceparm nolightmap
    surfaceparm nomarks

        {
                clampmap textures/sfx/fishy
                alphaFunc GE128
                tcMod stretch sin .8 0.10 0 .07
		depthWrite

        }


}




textures/sfx/lightmap
{
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm 	nodrop
	surfaceparm	fog
	fogparms ( .7 .1 .1 ) 64



		{
			map $lightmap
			blendFunc GL_dst_color GL_one
			tcmod scale 1 .01
			tcMod scroll 1 -2
		}




}


textures/sfx/hellfog_pj_dm10
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 50
	fogparms ( .5 .12 .1 ) 392



	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

textures/sfx/hellfog_mini_dm10
//**************************************
//New death fog that must be in all maps with death fog
//Change:  EXTREMELY SHALLOW FOG
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	q3map_lightsubdivide 64
	qer_nocarve
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 50
	fogparms ( .5 .12 .1 ) 16



	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}


textures/sfx/metalfloor_wall_14b_glow
{
	qer_editorimage textures/sfx/metalfloor_wall_14b
	q3map_lightimage textures/sfx/metalfloor_wall_14bglow
	q3map_surfacelight 100

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/sfx/metalfloor_wall_14b
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/metalfloor_wall_14bglow
		blendfunc add
		rgbgen wave sin .5 .5 1 0.1
	}

}

textures/sfx/metalfloor_wall_15b_glow
{
	qer_editorimage textures/sfx/metalfloor_wall_15b
	q3map_lightimage textures/sfx/metalfloor_wall_15bglow
	q3map_surfacelight 100



	{
		map $lightmap
		rgbgen identity
	}


	{
		map textures/sfx/metalfloor_wall_15b
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/metalfloor_wall_15bglow
		rgbgen wave sin .1 .05 1 1
		blendfunc add
	}

}


textures/sfx/xblackfog
{
qer_editorimage textures/sfx/blackness
qer_nocarve
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
fogparms ( 0 0 0 ) 128

}


textures/sfx/xfinalfog
{
qer_editorimage textures/sfx/xdensegreyfog
qer_nocarve
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
fogparms ( 0 0 0 ) 500

}

textures/sfx/xfinalfoginvert
{
qer_editorimage textures/sfx/xdensegreyfog
qer_nocarve
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
qer_nocarve
fogparms ( 0 0 0 ) 256

}


textures/sfx/xbluefog
{
	qer_editorimage textures/sfx/xdensegreyfog
	q3map_surfacelight 300
	q3map_lightsubdivide 64
	q3map_lightimage textures/sfx/xbluelightimage

	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	qer_nocarve
	fogparms ( 0.3 0.3 0.9 ) 128

}

textures/sfx/xredfog
{
	qer_editorimage textures/sfx/xdensegreyfog
	q3map_surfacelight 300
	q3map_lightsubdivide 64
	q3map_lightimage textures/sfx/xredlightimage

	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	qer_nocarve
	fogparms ( 0.9 0.3 0.3 ) 128

}

textures/sfx/xbluefogx128
{
	qer_editorimage textures/sfx/xdensegreyfog
	q3map_surfacelight 300
	q3map_lightsubdivide 128

	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	qer_nocarve
	fogparms ( 0.3 0.3 0.9 ) 128

}

textures/sfx/beam
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam
                tcMod Scroll .3 0
                blendFunc add
        }
        // {
	//	map textures/sfx/beam
        //        tcMod Scroll -.3 0
        //        blendFunc add
        // }

}

textures/sfx/beam_dusty2
{
	qer_editorimage textures/sfx/beam
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_1
           //     tcMod Scroll .3 0
                blendFunc add
        }
 //        {
//		map textures/sfx/beamdust
//		tcmod scale 2 2
//		tcMod turb 0 0.015 0.025 0.05
 //               tcMod Scroll -0.15 0
   //             blendFunc add
   //      }
     	//{
	//	map textures/sfx/beam_mask
        //        blendFunc GL_DST_COLOR GL_ONE_MINUS_SRC_COLOR
      //	}
}


textures/sfx/beam_red
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .5
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_red
                tcMod Scroll .3 0
                blendFunc add
        }

}

textures/sfx/beam_blue
	{
        qer_editorimage textures/sfx/beam_blue4
	//q3map_globaltexture
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .6
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_blue4
	//	tcMod scale 0.5 0.5
	//	tcMod turb 0 0.015 0.5 0.07
		tcMod Scroll .3 0
                blendFunc add
        }

}

textures/sfx/beam_waterlight1
	{
        qer_editorimage textures/sfx/beam_waterlight
	q3map_globaltexture
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 50
        //qer_trans .3
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_waterlight
		tcMod scale 0.35 0.35
		tcMod turb 0 0.015 0.5 0.07
		tcMod Scroll .15 0
                blendFunc add
        }
     	{
		map textures/sfx/beam_cyan5
		tcMod scale 0.5 0.5
		tcMod turb 0 0.025 0.5 0.03
		tcMod Scroll .15 .15
                blendFunc add
        }

}
textures/sfx/beam_waterlight1
	{
        qer_editorimage textures/sfx/beam_waterlight
	q3map_globaltexture
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 50
	 //surfaceparm nomipmaps
        qer_trans .3
	cull none
        //nopicmip
	{
		map textures/sfx/beam_waterlight
		tcMod scale 0.35 0.35
		tcMod turb 0 0.015 0.5 0.07
		tcMod Scroll .15 0
                blendFunc GL_add
        }
     	{
		map textures/sfx/beam_cyan5
		tcMod scale 0.5 0.5
		tcMod turb 0 0.025 0.5 0.03
		tcMod Scroll .15 .15
                blendFunc add
        }

}
textures/sfx/beam_waterlight2
	{
        qer_editorimage textures/sfx/beam_waterlight
	q3map_globaltexture
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 50
        qer_trans 0.6
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_waterlight
		//tcMod scale 0.35 0.35
		tcMod turb 0 0.015 0.5 0.07
		tcMod Scroll .15 0
                blendFunc add
        }

}
textures/sfx/beam_dusty
	{
        qer_editorimage textures/sfx/beam_3
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .3
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_3
	//	tcMod scale 0.35 0.35
		tcMod turb 0 0.015 0.5 0.07
		tcMod Scroll .15 0
                blendFunc add
        }
}

textures/sfx/beam_water
	{
        qer_editorimage textures/sfx/beam_cyan4
	q3map_surfacelight 20
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .3
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_cyan4
		tcMod turb 0 0.025 0.5 0.03
		tcMod Scroll .15 0
                blendFunc add
        }
     	{
		map textures/sfx/beam_cyan5
		tcMod turb 0 0.025 0.5 0.03
		tcMod Scroll .15 .15
                blendFunc add
        }

}

textures/sfx/beam_water2
	{
        qer_editorimage textures/sfx/beam_cyan5
	q3map_surfacelight 10
	surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        qer_trans .3
	cull none
	 //surfaceparm nomipmaps
        //nopicmip
	{
		map textures/sfx/beam_cyan5
		tcMod turb 0 0.045 0.5 0.03
		tcMod Scroll .15 .015
                blendFunc add
        }
}

textures/sfx/console01
{
        surfaceparm trans
        surfaceparm nomarks
	surfaceparm nolightmap
        qer_trans .5
        q3map_surfacelight 150
        q3map_lightimage textures/sfx/console01
	cull none
        //nopicmip
	{
		clampmap textures/sfx/console01

		tcMod rotate 20
		blendFunc add
	}
        {
		clampmap textures/sfx/console02

		tcMod rotate -200
		blendFunc add
	}

}
textures/sfx/console03
{
        surfaceparm trans
        surfaceparm nomarks
	surfaceparm nolightmap
        q3map_surfacelight 150
        q3map_lightimage textures/sfx/console03
	cull none
        //nopicmip
	{
		clampmap textures/sfx/console01

		tcMod rotate 20
		blendFunc add
	}
        {
		clampmap textures/sfx/console02

		tcMod rotate -400
		blendFunc add
	}
          {
		clampmap textures/sfx/console03

		tcMod rotate 40
		blendFunc add
	}
}
textures/sfx/glass
{
	qer_editorimage textures/base_wall/oldwindow
	surfaceparm	trans
	cull none

	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		blendfunc add
	}

	{
		map textures/base_wall/oldwindow
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
	}
}


textures/sfx/fan
{
        surfaceparm trans
        surfaceparm nomarks
	cull none
        nopicmip
	{
		clampmap textures/sfx/fan
		tcMod rotate 256
		blendFunc GL_ONE GL_ZERO
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

textures/sfx/fan2
{
        surfaceparm trans
        surfaceparm nomarks
	cull disable
        nopicmip
	{
		clampmap textures/sfx/fan2
		tcMod rotate 256
		//blendFunc GL_ONE GL_ZERO
		//alphaFunc GE128
                blendFunc blend
                alphaFunc GT0
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
textures/sfx/fan_grate
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm	metalsteps
	cull none
        nopicmip
	{
		map textures/sfx/fan_grate
		blendFunc GL_ONE GL_ZERO
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
textures/sfx/fan_grate2
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm	metalsteps
	cull none
        nopicmip
	{
		map textures/sfx/fan_grate2
		blendFunc GL_ONE GL_ZERO
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
textures/sfx/fanfx
// fan shadow
{
	qer_editorimage textures/sfx/fanfx
        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	cull none
        nopicmip

	{
		clampmap textures/sfx/fanfx
		tcMod rotate 256
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
                depthWrite
		//rgbGen identity
	}
}

textures/sfx/metalfloor_wall_5_glow
{
	qer_editorimage textures/sfx/metalfloor_wall_5_glow
	q3map_lightimage textures/sfx/metalfloor_wall_5bglowblu
//	q3map_surfacelight 100
//	q3map_lightsubdivide 32
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/metalfloor_wall_5
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/metalfloor_wall_5_glow
		blendfunc add
		rgbgen wave sin .1 .4 1 0.3
	}

}


textures/sfx/metaltech12darkfinal_blueglow
{
	qer_editorimage textures/sfx/metaltech01blueglow
	q3map_lightimage textures/sfx/metaltech01blueglow
	q3map_surfacelight 100
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_wall/metaltech12darkfinal
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/metaltech01blueglow
		blendfunc add
		rgbgen wave sin .1 .1 1 0.1
	}

}


textures/sfx/zap_scroll1000
{
        q3map_surfacelight	1000
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	qer_editorimage textures/sfx/zap_scroll
	cull none

	{
		map textures/sfx/zap_scroll
		blendFunc add
                rgbgen wave triangle .8 2 0 7
                tcMod scroll 0 1
	}
        {
		map textures/sfx/zap_scroll
		blendFunc add
                rgbgen wave triangle 1 1.4 0 5
                tcMod scale  -1 1
                tcMod scroll 0 1
	}
        {
		map textures/sfx/zap_scroll2
		blendFunc add
                rgbgen wave triangle 1 1.4 0 6.3
                tcMod scale  -1 1
                tcMod scroll 2 1
	}
        {
		map textures/sfx/zap_scroll2
		blendFunc add
                rgbgen wave triangle 1 1.4 0 7.7
                tcMod scroll -1.3 1
	}
}


textures/gothic_block/killblock_i4b
{
        q3map_surfacelight 300
	q3map_lightimage textures/gothic_block/killblock_i4glow
	qer_editorimage textures/gothic_block/killblock_i4


	{
		map textures/gothic_block/killblock_i4
		rgbgen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map  textures/gothic_block/killblock_i4glow
		blendFunc add
                rgbgen wave sin .9 .1 0 .1
	}

}


textures/sfx/donna
{
	deformVertexes autoSprite
        q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map textures/sfx/donna
		blendFunc add
                rgbgen wave triangle 1 2 0 7
	}
{
		Map textures/sfx/donna
		blendFunc add
                rgbgen wave sin 1 2 0 8
	}

}

textures/sfx/xian_dm3padwall
	{
	q3map_surfacelight 100
	q3map_lightimage textures/sfx/xian_dm3padwallglow
	qer_editorimage textures/sfx/xian_dm3padwall

	{
		map textures/sfx/xian_dm3padwall
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}


	{
		map textures/sfx/xian_dm3padwallglow
		blendfunc add
		rgbgen wave sin 0 1 0 .5
		tcmod scale 1 .05
		tcmod scroll 0 1
	}

}

textures/sfx/xian_dm3padwall_light
	{
	q3map_surfacelight 100
	q3map_lightsubdivide 64
	q3map_lightimage textures/sfx/xian_dm3padwallglow
	qer_editorimage textures/sfx/xian_dm3padwall

	{
		map textures/sfx/xian_dm3padwall
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}


	{
		map textures/sfx/xian_dm3padwallglow
		blendfunc add
		rgbgen wave sin 0 1 0 .5
		tcmod scale 1 .05
		tcmod scroll 0 1
	}

}

textures/sfx/xmetalfloor_wall_5b
{
	qer_editorimage textures/sfx/metalfloor_wall_5b

	{
		map textures/sfx/metalfloor_wall_7b
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/metalfloor_wall_5bglowblu
		blendfunc add
		rgbgen wave sin .5 .2 0 .1
	}
}

textures/sfx/border11c
{
	q3map_surfacelight 300
	q3map_lightimage textures/base_trim/border11c_pulse1
	qer_editorimage textures/base_trim/border11c

	{
		map textures/base_trim/border11c
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/base_trim/border11c_light
		blendfunc add
		rgbgen wave sin 1 .1 0 5
	}


	{
		map textures/base_trim/border11c_pulse1b
		blendfunc add
//		tcmod scale .01 1
		tcmod scale .035 1
//		tcmod scroll -0.5 0
		tcmod scroll -0.65 0


	}


}



textures/sfx/zap_scroll
{
        q3map_surfacelight	300
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map textures/sfx/zap_scroll
		blendFunc add
                rgbgen wave triangle .8 2 0 7
                tcMod scroll 0 1
	}
        {
		Map textures/sfx/zap_scroll
		blendFunc add
                rgbgen wave triangle 1 1.4 0 5
                tcMod scale  -1 1
                tcMod scroll 0 1
	}
        {
		Map textures/sfx/zap_scroll2
		blendFunc add
                rgbgen wave triangle 1 1.4 0 6.3
                tcMod scale  -1 1
                tcMod scroll 2 1
	}
        {
		Map textures/sfx/zap_scroll2
		blendFunc add
                rgbgen wave triangle 1 1.4 0 7.7
                tcMod scroll -1.3 1
	}
}
textures/sfx/x_conduit
{
	q3map_lightimage textures/sfx/x_conduit
	surfaceparm nomarks
	q3map_surfacelight 100
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/x_conduit
		blendFunc filter
		rgbGen identity
	}

	{	animMap 10 textures/sfx/x_conduit2 textures/sfx/x_conduit3
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10
	}

	//{
	//	map textures/sfx/x_conduit2
	//	blendfunc add
       //         rgbGen wave sin .5 0.5 0 5
	//}
        {
		map textures/sfx/x_conduit2
		blendfunc add
                 tcmod scale -1 1
                rgbGen wave sin .5 0.5 0 7
	}
        {
		map textures/sfx/x_conduit3
		blendfunc add
                tcmod scale -1 1
                 rgbgen wave triangle .2 1 0 9
	}
        //{
	//	map textures/sfx/x_conduit3
	//	blendfunc add
       //         rgbGen wave sin .5 1 0 3
	//}
}
textures/sfx/swirl_r1
{
        deformVertexes wave 100 sin 1 2 .1 1
        q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none



	{
		clampmap textures/sfx/swirl_r1
		blendFunc add
                tcMod rotate -188
	}
        {
		clampmap textures/sfx/swirl_r2
		blendFunc add
                tcMod rotate 333
	}
       // {
	//	clampmap textures/sfx/swirl_r2
	//	blendFunc add
      //          tcMod rotate 20
	//}

}
textures/sfx/swirl_b1
{
        deformVertexes wave 100 sin 1 2 .1 1
        q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
        surfaceparm nonsolid
	cull none

	{
		clampmap textures/sfx/swirl_b1
		blendFunc add
                tcMod rotate -188
	}
        {
		clampmap textures/sfx/swirl_b2
		blendFunc add
                tcMod rotate 333
	}
        //{
	//	clampmap textures/sfx/swirl_b2
	//	blendFunc add
        //        tcMod rotate 20
	//}

}
textures/sfx/steam_01
{

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull disable

	{
		Map textures/sfx/steam_01
		blendFunc add
                tcMod scale 1 .4
	        tcMod scroll 0 .3
	}
{
                Map textures/sfx/steam_01
		blendFunc add
                tcMod scale -1 .2
	        tcMod scroll 0 .3
	}

}
textures/sfx/zap_ball
{
	deformVertexes autoSprite
        q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/sfx/zap_ball
		blendFunc add
                rgbgen wave triangle 1 2 0 7
                tcMod rotate 103
	}
{
		clampmap textures/sfx/zap_ball2
		blendFunc add
                rgbgen wave sin 1 2 0 8
                tcMod rotate -180
	}

}
textures/sfx/jacobs_x
{
        deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map textures/sfx/jacobs_x
		blendFunc add
                rgbgen wave triangle 1 2 0 7
                //tcMod rotate 103
	}
}
textures/sfx/xlargeblockfloor3_pent
{
	q3map_lightimage textures/sfx/pentagramfloor_blue3glowtest
	q3map_surfacelight 100
	surfaceparm nomarks

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/sfx/xlargeblockfloor3_pent
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/sfx/pentagramfloor_blue3glowtest
		blendfunc add
		rgbgen wave sin .9 .1 0 5
	}

}

textures/sfx/xclang_floor2_bouncy
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/xclang_floor2_bouncy
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

textures/sfx/clangdark_bounce
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/clangdark_bounce
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


textures/sfx/metalbridge06_bounce
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/metalbridge06_bounce
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

textures/sfx/metaltechfloor02final_bounce
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/metaltechfloor02final_bounce
	q3map_surfacelight 400


	{
		map textures/sfx/metaltechfloor02final_bounce
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


textures/sfx/metaltech12final_bounce
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
//	q3map_lightimage textures/sfx/metaltech12final_bounce
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/metaltech12final_bounce
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


textures/sfx/metaltech12darkfinal_bounce
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
//	q3map_lightimage textures/sfx/metaltech12darkfinal_bounce
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/metaltech12darkfinal_bounce
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


textures/sfx/metaltechfloor01final_bounce
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/metaltechfloor01final_bounce
	q3map_surfacelight 400


	{
		map textures/sfx/metaltechfloor01final_bounce
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



textures/sfx/demonltblackfinal
{
	q3map_lightimage textures/sfx/demonltblackfinal_glow2
	q3map_surfacelight 100
	surfaceparm nomarks

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
textures/base_wall/c_met5_2_trans
{
	qer_editorimage textures/base_wall/c_met5_2
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/base_wall/c_met5_2
		rgbGen identity
		blendFunc filter


	}
}



textures/sfx/metalfloor_glass
{
	qer_editorimage textures/sfx/metalfloor_wall_15glass
	qer_trans	0.4
	surfaceparm trans
	cull disable
//	rgbGen vertex
//	surfaceparm nolightmap
	{
		map textures/sfx/metalfloor_wall_15glass
		rgbGen identity
		rgbGen vertex
		blendFunc GL_ONE_MINUS_DST_COLOR GL_ZERO
	}
	{
		map textures/sfx/metalfloor_wall_15glass
		alphaFunc GT0
		rgbGen identity
		blendfunc GL_DST_COLOR GL_ONE
	}
}

textures/sfx/xmetalfloor_wall_14b
{
	qer_editorimage textures/sfx/metalfloor_wall_14b
	q3map_lightimage textures/sfx/metalfloor_wall_14bglow2
	q3map_surfacelight 50
	{
		map textures/sfx/metalfloor_wall_14b
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/metalfloor_wall_14bglow2
		blendfunc add
	}
}

textures/sfx/xmetalfloor_wall_9b
{
	qer_editorimage textures/sfx/metalfloor_wall_9b

	{
		map textures/sfx/metalfloor_wall_9b
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/metalfloor_wall_9bglow
		blendfunc add
	}
}


models/mapobjects/portal_2/portal_3
{
	//	*************************************************
	//	*      	Portal Sides				*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************


	{
		map models/mapobjects/portal_2/portal_3
		rgbGen vertex
	}

	{
		map models/mapobjects/portal_2/portal_3_glo
		blendfunc add
		rgbgen wave inversesawtooth 0 1 .2 .5
	}

}


textures/sfx/portal_sfx_ring
{

	//	*************************************************
	//	*      	Portal Ring				*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

		deformVertexes wave 100 sin 0 2 0 .5
		cull none

	{
		map textures/sfx/portal_sfx_ring_blue1
		blendfunc blend
	}


	{
		map textures/sfx/portal_sfx_ring_electric
		blendfunc add
		rgbgen wave inversesawtooth 0 1 .2 .5
		tcmod scroll 0 .5

	}

	{
		map textures/sfx/portal_sfx1
		blendfunc filter
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx_ring
		blendfunc add
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}





}

textures/sfx/small_smoke1_1
{

	//	*************************************************
	//	*      	Smoke					*
	//	*      	June 18 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none


	{
		animMap 10 textures/sfx/small_smoke1_1 textures/sfx/small_smoke1_2 textures/sfx/small_smoke1_3 textures/sfx/small_smoke1_4 textures/sfx/small_smoke1_5 textures/sfx/small_smoke1_6
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10
	}

	{
		animMap 10 textures/sfx/small_smoke1_2 textures/sfx/small_smoke1_3 textures/sfx/small_smoke1_4 textures/sfx/small_smoke1_5 textures/sfx/small_smoke1_6 textures/sfx/small_smoke1_1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}

}



textures/sfx/xflame2
{

	//	*************************************************
	//	*      	Yellow Flame Surface Light 5500		*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 5500
	qer_editorimage textures/sfx/flame1


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx/xflame2_2250
{
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 2250
	qer_editorimage textures/sfx/flame1


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx/xflame2_1800
{
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1800
	qer_editorimage textures/sfx/flame1


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx/xflame2_nolight
{
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	qer_editorimage textures/sfx/flame1


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}


// Tim's goofy experiment
textures/sfx/grid

{

	surfaceparm trans
	qer_editorimage	textures/sfx/grid




	{
		map textures/sfx/grid
		blendfunc blend
		rgbGen identity
	}

}


textures/sfx/launchpad_diamond
{
	//	*************************************************
	//	*      	Launchpad on Diamond			*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/sfx/launchpad_diamond
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/launchpad_dot
		blendfunc add
		rgbgen wave inversesawtooth 0 1 0 1
	}

	// 	CHANGED BECAUSE OF RAGE PRO PROBLEM
	//	{
	//		map textures/sfx/launchpad_arrow
	//		blendfunc gl_src_alpha gl_one
	//		tcmod scroll 0 2
	//		rgbgen wave square 0 1 0 2
	//		alphagen wave square 0 1 .1 2
	//	}

	// 	TEMPORARY FIX TO GET AROUND ALPHA BLEND IN RAGE PRO
	{
		animmap 4 textures/sfx/launchpad_arrow textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2
		blendfunc add
		tcmod scroll 0 2
	}

}
textures/sfx/launchpad_blocks18d
{
	//	*************************************************
	//	*      	Launchpad on Blocks18d			*
	//	*      	October 09 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/sfx/launchpad_blocks18d
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/launchpad_dot
		blendfunc add
		rgbgen wave inversesawtooth 0 1 0 1
	}

	// 	CHANGED BECAUSE OF RAGE PRO PROBLEM
	//	{
	//		map textures/sfx/launchpad_arrow
	//		blendfunc gl_src_alpha gl_one
	//		tcmod scroll 0 2
	//		rgbgen wave square 0 1 0 2
	//		alphagen wave square 0 1 .1 2
	//	}

	// 	TEMPORARY FIX TO GET AROUND ALPHA BLEND IN RAGE PRO
	{
		animmap 4 textures/sfx/launchpad_arrow textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2
		blendfunc add
		tcmod scroll 0 2
	}

}
textures/sfx/launchpad_blocks17
{
	//	*************************************************
	//	*      	Launchpad on Blocks17			*
	//	*      	November 08 1999			*
	//	*	Please Comment Changes			*
	//	*************************************************

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/sfx/launchpad_blocks17
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/launchpad_dot
		blendfunc add
		rgbgen wave inversesawtooth 0 1 0 1
	}

	// 	CHANGED BECAUSE OF RAGE PRO PROBLEM
	//	{
	//		map textures/sfx/launchpad_arrow
	//		blendfunc gl_src_alpha gl_one
	//		tcmod scroll 0 2
	//		rgbgen wave square 0 1 0 2
	//		alphagen wave square 0 1 .1 2
	//	}

	// 	TEMPORARY FIX TO GET AROUND ALPHA BLEND IN RAGE PRO
	{
		animmap 4 textures/sfx/launchpad_arrow textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2
		blendfunc add
		tcmod scroll 0 2
	}

}
textures/sfx/launchpad_metalbridge04d
{
	//	*************************************************
	//	*      	Launchpad on metalbridge04d	        *
	//	*      	June 15 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/sfx/launchpad_metalbridge04d
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/launchpad_dot
		blendfunc add
		rgbgen wave inversesawtooth 0 1 0 1
	}

	// 	CHANGED BECAUSE OF RAGE PRO PROBLEM
	//	{
	//		map textures/sfx/launchpad_arrow
	//		blendfunc gl_src_alpha gl_one
	//		tcmod scroll 0 2
	//		rgbgen wave square 0 1 0 2
	//		alphagen wave square 0 1 .1 2
	//	}

	// 	TEMPORARY FIX TO GET AROUND ALPHA BLEND IN RAGE PRO
	{
		animmap 4 textures/sfx/launchpad_arrow textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2 textures/sfx/launchpad_arrow2
		blendfunc add
		tcmod scroll 0 2
	}

}

textures/sfx/flame1km
{

	//	*************************************************
	//	*      	Yellow Flame 				*
	//	*      	May 20 1999 Surface Light 4000	*
	//	*	Please Comment Changes			*
	//	*************************************************

	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	q3map_surfacelight 4000


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}
textures/sfx/flame1
{

	//	*************************************************
	//	*      	Yellow Flame 				*
	//	*      	April 30 1999 Surface Light 7500	*
	//	*	Please Comment Changes			*
	//	*************************************************

	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	q3map_surfacelight 7500


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}
textures/sfx/flameanim_dimmer
{

	//	*************************************************
	//	*      	Yellow Flame 				*
	//	*      	May 2, 199 Surface Light 2500    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/flame6
	q3map_lightimage textures/sfx/flame6
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1500
	// light changed to lower value than flame1 .... PAJ
	// added a lightimage function to take color from a frame

	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}
textures/sfx/flameanim_blue
{

	//	*************************************************
	//	*      	Blue Flame 				*
	//	*      	July 20, 1999 Surface Light 1800    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/b_flame7
	q3map_lightimage textures/sfx/b_flame7
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1800
	// texture changed to blue flame.... PAJ
	// 9/01 light dropped from 2500 to 1800 .... PAJ

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

textures/sfx/flameanim_blue_nolight
{

	//	*************************************************
	//	*      	Blue Flame 				*
	//	*      	July 20, 1999 Surface Light 1800    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/b_flame7
	q3map_lightimage textures/sfx/b_flame7
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


textures/sfx/flameanim_blue_pj
{

	//	*************************************************
	//	*      	Blue Flame 				*
	//	*      	July 20, 1999 Surface Light 2500    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/b_flame7
	q3map_lightimage textures/sfx/b_flame7
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 2500
	// texture changed to blue flame.... PAJ


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

textures/sfx/flameanim_blue_nolight
{

	//	*************************************************
	//	*      	Blue Flame 				*
	//	*      	aug 18, 1999 Surface Light 2500    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/b_flame7
	q3map_lightimage textures/sfx/b_flame7
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	//q3map_surfacelight 2500
	// texture changed to blue flame.... PAJ

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

textures/sfx/flameanim_red
{

	//	*************************************************
	//	*      	Red Flame 				*
	//	*      	July 20, 1999 Surface Light  1800    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/r_flame3
	q3map_lightimage textures/sfx/r_flame3
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1800
	// texture changed to red flame.... PAJ
	// 9/01 light dropped from 2500 to 1800

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

textures/sfx/flameanim_red_pj
{

	//	*************************************************
	//	*      	Red Flame 				*
	//	*      	July 20, 1999 Surface Light 2500    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/r_flame3
	q3map_lightimage textures/sfx/r_flame3
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 2500
	// texture changed to red flame.... PAJ

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

textures/sfx/flameanim_red_nolight
{

	//	*************************************************
	//	*      	Red Flame (no light)			*
	//	*      	Sept. 5, 1999 No Surface Light	    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/r_flame3
	q3map_lightimage textures/sfx/r_flame3
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	// texture changed to red flame.... PAJ


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

textures/sfx/flameanim_green_pj
{
	//	*************************************************
	//	*      	Green Flame 				*
	//	*      October 2, 1999 Surface Light 2500    	*
	//	*	Please Comment Changes			*
	//	*************************************************
	qer_editorimage textures/sfx/g_flame6
	q3map_lightimage textures/sfx/g_flame6
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 2500
	// texture changed to green flame.... PAJ
	{
		animMap 10 textures/sfx/g_flame1 textures/sfx/g_flame2 textures/sfx/g_flame3 textures/sfx/g_flame4 textures/sfx/g_flame5 textures/sfx/g_flame6 textures/sfx/g_flame7 textures/sfx/g_flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10
	}
	{
		animMap 10 textures/sfx/g_flame2 textures/sfx/g_flame3 textures/sfx/g_flame4 textures/sfx/g_flame5 textures/sfx/g_flame6 textures/sfx/g_flame7 textures/sfx/g_flame8 textures/sfx/g_flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}
	{
		map textures/sfx/g_flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}
}


textures/sfx/xflame1side
{

	//	*************************************************
	//	*      	Yellow Flame Side			*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

		//q3map_surfacelight 500
		//q3map_lightimage textures/sfx/flame1
		surfaceparm trans
		surfaceparm nomarks
		qer_editorimage textures/sfx/flame1
		surfaceparm nolightmap
		cull none

	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}


textures/sfx/flame1side
{

	//	*************************************************
	//	*      	Yellow Flame Side			*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

		surfaceparm trans
		surfaceparm nomarks
		surfaceparm nonsolid

		surfaceparm nolightmap
		cull none

	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}



textures/sfx/flame2
{

	//	*************************************************
	//	*      	Yellow Flame Surface Light 5500		*
	//	*      	April 30 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

		surfaceparm nomarks
		surfaceparm nolightmap
		cull none
		q3map_surfacelight 5500
		qer_editorimage textures/sfx/flame1

	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}

	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}


textures/sfx/xflame1
{

	//	*************************************************
	//	*      	Yellow Flame Surface Light 7500		*
	//	*      	March 30 1999 				*
	//	*	Please Comment Changes			*
	//	*************************************************

	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 7500
	qer_editorimage textures/sfx/flame1


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}


textures/sfx/xflamebright
{
	deformVertexes autoSprite2
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 3000
	qer_editorimage textures/sfx/flame1
	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10
	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}
	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}
}


textures/sfx/flame1dark
{

	//	*************************************************
	//	*      	Yellow Flame used in q3test1				*
	//	*      	April 30 1999 Surface Light 7500	*
	//	*	Please Comment Changes			*
	//	*************************************************

	qer_editorimage textures/sfx/flame1
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	q3map_surfacelight 2000


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx/flame1_hell
{

	//	*************************************************
	//	*      	Yellow Flame used in q3test1				*
	//	*      	April 30 1999 Surface Light 7500	*
	//	*	Please Comment Changes			*
	//	*************************************************

	qer_editorimage textures/sfx/flame1
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	q3map_surfacelight 600


	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx/pentagramfloor_red3test
{
	{
		map textures/sfx/pentagramfloor_red3test
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red3glowtest
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/goopq1metal7_98dhuge_pent
{
	{
		map textures/sfx/goopq1metal7_98dhuge_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red3_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/metaltechfloor02final_pent
{
	qer_editorimage textures/sfx/metaltechfloor02final_pent
	{
		map textures/sfx/metaltechfloor02final_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/blocks17final_pent
{
	qer_editorimage textures/sfx/blocks17final_pent
	{
		map textures/sfx/blocks17final_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/pentfloor_diamond2c
{
	qer_editorimage textures/sfx/pentfloor_diamond2c
	{
		map textures/sfx/pentfloor_diamond2c
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}


textures/sfx/metalbridge06c_big_pentagram
{
	qer_editorimage textures/gothic_floor/metalbridge06c_big_pentagram
	{
		map textures/gothic_floor/metalbridge06c_big_pentagram
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/largerblock3_pent
{
	qer_editorimage textures/gothic_floor/largerblock3_pent
	{
		map textures/gothic_floor/largerblock3_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}

textures/sfx/largerblock3b3_pent
{
	qer_editorimage textures/sfx/largerblock3b3_pent
	{
		map textures/sfx/largerblock3b3_pent
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/sfx/pentagramfloor_red_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 .5
		depthfunc equal
	}
}


textures/sfx/gothgrate1
{
	surfaceparm	metalsteps
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/sfx/gothgrate1
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		blendFunc filter
		rgbGen identity
		depthFunc equal
	}
}

textures/sfx/blocks18ccomputer_offset
{

	//	*************************************************
	//	*      	Computer 8 on Blocks18c			*
	//	*      	March 18 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************
	// Created Mar.17.1999 (Xian)
	// This texture was originally created on a 512x512 version of blocks18c
	// The computer was placed in the middle and the section at 128,128 - 384,384
	// was used to create this texture


	surfaceparm nodamage
	q3map_lightimage textures/sfx/computer8
	q3map_surfacelight 200


	{
		map textures/sfx/blocks18ccomputer_offset
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/sfx/computer8
		blendfunc add
		rgbGen wave sin .5 .3 0 3
	}

	//	END


}

textures/sfx/computerblocks11b
{

	surfaceparm nodamage
	q3map_surfacelight 200


	{
		map textures/sfx/computerblocks11b
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		animMap 2 textures/sfx/compscreen/letters1 textures/sfx/compscreen/letters2 textures/sfx/compscreen/letters3 textures/sfx/compscreen/letters5  textures/sfx/compscreen/letters4 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters5
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 2
	}

	//{
	//	animMap 9 textures/sfx/compscreen/rotate0002 textures/sfx/compscreen/rotate0003 textures/sfx/compscreen/rotate0004 textures/sfx/compscreen/rotate0005 textures/sfx/compscreen/rotate0006 textures/sfx/compscreen/rotate0007 textures/sfx/compscreen/rotate0008 textures/sfx/compscreen/rotate0001
	//	blendFunc add
	//	rgbGen wave Sawtooth 0 1 0 9
	//}


}


textures/sfx/blocks18ccomputer
{

	//	*************************************************
	//	*      	Computer 8 on Blocks18c			*
	//	*      	March 18 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************


	surfaceparm nodamage
	q3map_surfacelight 200


	{
		map textures/sfx/blocks18ccomputer
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		animMap 2 textures/sfx/compscreen/letters1 textures/sfx/compscreen/letters2 textures/sfx/compscreen/letters3 textures/sfx/compscreen/letters5  textures/sfx/compscreen/letters4 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters5
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 2
	}

	//{
	//	animMap 9 textures/sfx/compscreen/rotate0002 textures/sfx/compscreen/rotate0003 textures/sfx/compscreen/rotate0004 textures/sfx/compscreen/rotate0005 textures/sfx/compscreen/rotate0006 textures/sfx/compscreen/rotate0007 textures/sfx/compscreen/rotate0008 textures/sfx/compscreen/rotate0001
	//	blendFunc add
	//	rgbGen wave Sawtooth 0 1 0 9
	//}


}


textures/sfx/computerblocks15
{

	//	*************************************************
	//	*      	Computer 8 on Blocks15			*
	//	*      	May 11 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************


	surfaceparm nodamage
	q3map_surfacelight 200


	{
		map textures/sfx/computerblocks15
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		animMap 2 textures/sfx/compscreen/letters1 textures/sfx/compscreen/letters2 textures/sfx/compscreen/letters3 textures/sfx/compscreen/letters5  textures/sfx/compscreen/letters4 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters5
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 2
	}

	//{
	//	animMap 9 textures/sfx/compscreen/rotate0002 textures/sfx/compscreen/rotate0003 textures/sfx/compscreen/rotate0004 textures/sfx/compscreen/rotate0005 textures/sfx/compscreen/rotate0006 textures/sfx/compscreen/rotate0007 textures/sfx/compscreen/rotate0008 textures/sfx/compscreen/rotate0001
	//	blendFunc add
	//	rgbGen wave Sawtooth 0 1 0 9
	//}
}


textures/sfx/computer_blocks17
{

	//	*************************************************
	//	*      	Computer on Blocks17			*
	//	*      	May 28 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************


	surfaceparm nodamage
	q3map_surfacelight 200


	{
		map textures/sfx/computer_blocks17
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		animMap 2 textures/sfx/compscreen/letters1 textures/sfx/compscreen/letters2 textures/sfx/compscreen/letters3 textures/sfx/compscreen/letters5  textures/sfx/compscreen/letters4 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters5
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 2
	}

}


textures/sfx/computerpurptileb
{

	//	*************************************************
	//	*      	Computer 8 on computerpurptileb		*
	//	*      	March 18 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	//q3map_surfacelight 2000
	surfaceparm nodamage
	//q3map_lightimage textures/sfx/compscreen/morph0020
	q3map_surfacelight 200


	{
		map textures/sfx/computerpurptileb
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}


	{
		animMap 2 textures/sfx/compscreen/letters1 textures/sfx/compscreen/letters2 textures/sfx/compscreen/letters3 textures/sfx/compscreen/letters5  textures/sfx/compscreen/letters4 textures/sfx/compscreen/letters5 textures/sfx/compscreen/letters5
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 2
	}

	//{
	//	animMap 9 textures/sfx/compscreen/rotate0002 textures/sfx/compscreen/rotate0003 textures/sfx/compscreen/rotate0004 textures/sfx/compscreen/rotate0005 textures/sfx/compscreen/rotate0006 textures/sfx/compscreen/rotate0007 textures/sfx/compscreen/rotate0008 textures/sfx/compscreen/rotate0001
	//	blendFunc add
	//	rgbGen wave Sawtooth 0 1 0 9
	//}


}

textures/sfx/diamond2cjumppad
{
	qer_editorimage textures/sfx/bouncepad01_diamond2cTGA
	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 500


	{
		map textures/sfx/bouncepad01_diamond2cTGA
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
textures/sfx/blocks11bjumppad
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/blocks11bjumppad
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

textures/sfx/bounce_metalbridge04
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bounce_metalbridge04
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

textures/sfx/bounce_largeblock3
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bounce_largeblock3
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

textures/sfx/bounce_largeblock3b
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bounce_largeblock3b
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

textures/sfx/bounce_dirt
{

	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bounce_dirt
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


textures/sfx/bounce_concrete
{

	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bounce_concrete
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



textures/sfx/bouncepad01_metalbridge06b
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bouncepad01_metalbridge06b
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


textures/sfx/bouncepad01bgoopy7_98d
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bouncepad01bgoopy7_98d
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
textures/sfx/bouncepad01b_metalbridge06c
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bouncepad01b_metalbridge06c
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

textures/sfx/bounce_xq1metalbig
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 400


	{
		map textures/sfx/bounce_xq1metalbig
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

textures/sfx/bouncepad01block18b
{

	//	*************************************************
	//	*      	Bounce Pad on Blocks18b			*
	//	*      	March 10 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 2000


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

	//	END
}

textures/sfx/bouncepad01_block17
{

	//	*************************************************
	//	*      	Bounce Pad on Blocks17			*
	//	*      	March 10 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 1000


	{
		map textures/sfx/bouncepad01_block17
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


textures/sfx/bouncepad1q1metal7_99
{

	//	*************************************************
	//	*      	Bounce Pad on q1metal97			*
	//	*      	March 10 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall
	q3map_surfacelight 2000


	{
		map textures/sfx/bouncepad1q1metal7_99
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

textures/sfx/redpadblocks17
{
	qer_editorimage textures/sfx/redpad
	q3map_lightimage textures/sfx/redpad_blend
	q3map_surfacelight 2000
	//q3map_surfacelight 2000
	surfaceparm nodamage
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks17
		rgbGen identity
		blendFunc filter
	}
	{
		clampmap textures/sfx/redpad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 1
		tcMod stretch sin 0.80 0.20 0 1
	}
}

textures/sfx/0
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/0
		blendfunc add
	}
}
textures/sfx/1
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/1
		blendfunc add
	}
}
textures/sfx/2
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/2
		blendfunc add
	}
}
textures/sfx/3
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/3
		blendfunc add
	}
}
textures/sfx/4
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/4
		blendfunc add
	}
}
textures/sfx/5
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/5
		blendfunc add
	}
}
textures/sfx/6
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/6
		blendfunc add
	}
}
textures/sfx/7
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/7
		blendfunc add
	}
}
textures/sfx/8
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/8
		blendfunc add
	}
}
textures/sfx/9
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/9
		blendfunc add
	}
}







textures/sfx/goopq1metal7_98d_pent_256
{
	{
		map textures/gothic_floor/goopq1metal7_98d
	}
	{
		map textures/sfx/pentfloor_256
		blendfunc blend
	}
	//{
	//	map $lightmap
	//	blendfunc filter
//		rgbGen identity
	//}
	//{
	//	map textures/sfx/pentfloor_glow
	//	blendfunc add
	//	rgbGen wave sin .5 .5 0 .5
	//}
}

textures/sfx/pentagramfloor_red
{

	//	*************************************************
	//	*      	PENTAGRAM EFFECT			*
	//	*      	March 1 1999				*
	//	*	Please Comment Changes			*
	//	*************************************************

	polygonOffset

		{
			map textures/sfx/pentagramfloor_red
			alphafunc GT0
			depthWrite
		}

		{
			map $lightmap
			rgbGen identity
			blendfunc filter
			depthfunc equal
		}

		{
			map textures/sfx/pentagramfloor_red_glow
			blendFunc add
			rgbGen wave sin .5 .5 0 .5
//			tcMod rotate 40
			depthfunc equal
		}

	//	END
}

textures/sfx/goopq1metal7_98dnodamage
{
	qer_editorimage textures/gothic_floor/goopq1metal7_98d
	surfaceparm nodamage
}

textures/sfx/gimmickdiamondarrow
{
	qer_editorimage textures/sfx/goopq1metal7_98darrow
	q3map_lightimage textures/sfx/pitted_rust3arrow_blend
	//q3map_surfacelight 2000
	q3map_surfacelight 500
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/diamond2c
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/pitted_rust3arrow_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcmod scroll 0 1
	}
}
textures/sfx/goopq1metal7_98darrow
{
	qer_editorimage textures/sfx/goopq1metal7_98darrow
	q3map_lightimage textures/sfx/pitted_rust3arrow_blend
	q3map_surfacelight 2000
	q3map_surfacelight 500
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/gothic_floor/goopq1metal7_98dlarge
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/pitted_rust3arrow_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcmod scroll 0 1
	}
}

textures/sfx/blocks11b_himom
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		rgbGen identity
		map textures/gothic_block/blocks11b
		blendFunc filter
	}
	{
		map textures/sfx/himom
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
	}
}

textures/sfx/pittedrust3stripes
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_trim/pitted_rust3
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/orangestripes
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
	}
}


textures/sfx/q1metal7_98dstripe
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/q1metal7_98d
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/orangestripes
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
	}
}

textures/sfx/goopq1metal7_98dstripe
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/goopq1metal7_98d
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/orangestripes
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
	}
}


textures/sfx/pentagramfloor_rotating
{
	qer_editorimage textures/sfx/pentagramfloor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/xhugefloor2
		blendFunc filter
		rgbGen identity
	}
	{
//		map textures/sfx/pentagramfloor_red_blend
		clampmap textures/sfx/pentagramfloor_red
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcMod rotate -60
	}
}

textures/sfx/pentagramfloor_rotating2
{
	qer_editorimage textures/sfx/pentagramfloor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/q1metalhuge
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/pentagramfloor_red_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcMod rotate -60
	}
}

textures/sfx/pentagramfloor_q1metal7_99
{
	qer_editorimage textures/sfx/pentagramfloor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/q1metalhuge
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/pentagramfloor_red_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcMod rotate -60
	}
}

textures/sfx/pentagramfloor
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/xhugefloor2
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/pentagramfloor_red_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcMod rotate -60
	}
}

textures/sfx/q1met_redpad
{
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/q1met_redpad
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/q1met_redpad_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/sfx/redgoal
{
	surfaceparm nolightmap
	//surfaceparm nonsolid
	surfaceparm trans
	cull twosided
	{
		map textures/sfx/redgoal
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.5
	}
}


textures/sfx/bluegoal
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull twosided
	{
		map textures/sfx/powerupshit
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.5
	}
}

textures/sfx/xdensegreyfog
{
// Don't mess with this entry please.
// I use this for my dense low-lying fog
// -Xian
qer_editorimage textures/sfx/xdensegreyfog
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
qer_nocarve
fogparms ( 0.7 0.7 0.7 ) 1700
}

textures/sfx/xlightgreyfog
{
qer_editorimage textures/sfx/xdensegreyfog
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
qer_nocarve
fogparms ( 0.7 0.7 0.7 ) 1400

}

textures/sfx/xfinalfog
{
qer_editorimage textures/sfx/xdensegreyfog
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
qer_nocarve
fogparms ( 0.7 0.7 0.7 ) 3000

}


textures/sfx/xfiretest1
{
	qer_editorimage textures/sfx/firetestb
	//surfaceparm trans
	surfaceparm noimpact
	//surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 1000
	tesssize 64


	{
	map textures/sfx/firetestb
	blendfunc gl_one gl_zero
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/sfx/firetest
	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}

	{
	map textures/sfx/firetest2
	blendFunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}
}
textures/sfx/xfiretest2
{
	qer_editorimage textures/sfx/firetestb
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 1000
	tesssize 64
	{
	map textures/sfx/firetest2
	blendfunc gl_one gl_zero
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/sfx/firetest

	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}

	{

	map textures/sfx/firetestb
	blendFunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}
}

textures/sfx/blackness
{
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	{
		map textures/sfx/blackness
	}
}

textures/sfx/surface6jumppad
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_stone/surface6
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/surface6jumppad_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
//		blendFunc add
//		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}

textures/sfx/powerupshit
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/sfx/powerupshit
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.5
	}
}


textures/sfx/redstripe
{
	surfaceparm nolightmap
	{
		map textures/sfx/redstripe
		blendFunc GL_ONE GL_ZERO
		rgbGen wave sin 0.75 0.25 0 .7
	}
}
textures/sfx/yellowstripe
{
	surfaceparm nolightmap
	{
		map textures/sfx/yellowstripe
		blendFunc GL_ONE GL_ZERO
		rgbGen wave sin 0.75 0.25 0 .7
	}
}

textures/sfx/bluestripe
{
	surfaceparm nolightmap
	{
		map textures/sfx/bluestripe
		blendFunc GL_ONE GL_ZERO
		rgbGen wave sin 0.75 0.25 0 .7

	}
}

textures/sfx/xgoopjumpypad
{
	q3map_surfacelight 100
	q3map_lightimage textures/sfx/surface6jumppad_blend
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/xgoopq1metal
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/surface6jumppad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
		tcMod stretch sin 0.80 0.20 0 1
	}
}

textures/sfx/xgoopy_pentagram
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/xgoopq1metal
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/pentagramfloor_red_blend
		blendFunc add
		tcMod rotate -60
	}
}
textures/sfx/firetestnolight
{
	surfaceparm noimpact
	surfaceparm nolightmap
	tesssize 64


	{
	map textures/sfx/firetestb
	blendfunc GL_ONE GL_ZERO
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/sfx/firetest
	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}

	{
	map textures/sfx/firetest2
	blendFunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}

//	END
}
textures/sfx/firetest2
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 1000
	tesssize 64


	{
	map textures/sfx/firetestb
	blendfunc GL_ONE GL_ZERO
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/sfx/firetest
	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}

	{
	map textures/sfx/firetest2
	blendFunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}

//	END
}

textures/sfx/firewall
{

	//	*************************************************
	//	*      	Solid Fire Wall				*
	//	*      	Feb					*
	//	*	Please Comment Changes			*
	//	*************************************************

	surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 6000
	tesssize 64
	{
	map textures/sfx/firetestb
	blendfunc GL_ONE GL_ZERO
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/sfx/firetest
	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}

	{
	map textures/sfx/firetest2
	blendFunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}
}

textures/sfx/xq1metalbig_jumppad
{
	surfaceparm nodamage
//	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/q1metal7_98d_256x256
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/surface6jumppad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
		tcMod stretch sin 0.80 0.20 0 1
	}
}

textures/sfx/blocks11b_jumppad
{
	surfaceparm nodamage
//	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks11b
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/jumppad
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
		tcMod stretch sin 0.80 0.20 0 1
	}
}

textures/sfx/teslacoil
{
	cull none
	q3map_lightimage textures/sfx/tesla1
	q3map_surfacelight 100

	{
		map $lightmap
		tcgen environment
		blendfunc filter
	}

	{
		map textures/sfx/tesla1
		blendfunc add
		rgbgen wave sawtooth 0 1 0 5
		tcmod scale 1 .5
		tcmod turb 0 .1 0 1
		tcMod scroll -1 -1
	}



	{
		map textures/sfx/electricslime
		blendfunc add
		rgbgen wave sin 0 .5 0 1
		tcmod scale .5 .5
		tcmod turb 0 .1 0 1
		tcmod rotate 180
		tcmod scroll -1 -1
	}

	{
		map textures/sfx/cabletest2
		blendfunc blend
	}


}

textures/sfx/teslacoil2
{
	qer_editorimage textures/sfx/tesla1
	cull none
	deformVertexes wave 100 triangle 0 5 1 1


	{
		map textures/sfx/lightningcoil
		blendfunc add
		rgbGen wave sin .5 0 0 0
		tcMod scroll 5 5

	}

}

textures/sfx/teslacoil3
{
	cull none
	q3map_lightimage textures/sfx/tesla1b
	q3map_surfacelight 100
	qer_editorimage textures/sfx/teslacoil
	surfaceparm nolightmap



	{
		map textures/sfx/cabletest2
		blendfunc blend
	}


	{
		map textures/sfx/electricslime2
		blendfunc add
		rgbGen wave square .25 .25 0 2.5
		tcmod scale 1 1
		tcMod scroll 1 1
	}



	{
		map textures/sfx/tesla1b
		blendfunc add
		rgbgen wave square 0 1 0 3
		tcmod scale 1 1
		tcMod scroll -2 1
	}

}

textures/sfx/teslacoil3blue
{
	cull none
	q3map_lightimage textures/sfx/tesla1blue
	q3map_surfacelight 100
	qer_editorimage textures/sfx/teslacoil
	surfaceparm nolightmap



	{
		map textures/sfx/cabletest2
		blendfunc blend
	}


	{
		map textures/sfx/electricslimeblue
		blendfunc add
		rgbGen wave square .25 .25 0 2.5
		tcmod scale 1 1
		tcMod scroll 1 1
	}



	{
		map textures/sfx/tesla1blue
		blendfunc add
		rgbgen wave square 0 1 0 3
		tcmod scale 1 1
		tcMod scroll -2 1
	}

}



textures/sfx/teslacoiltrans
{
	qer_editorimage textures/sfx/tesla1
	surfaceparm trans
	surfaceparm nonsolid
	cull none
	deformVertexes wave 100 triangle 0 5 1 1


	{
		map textures/sfx/lightningcoil
		blendfunc add
		rgbGen wave sin .5 0 0 0
		tcMod scroll 5 5

	}

}


textures/sfx/pentagramfloor
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/pentagramfloor
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/pentagramfloor_red_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .5
	}
}

textures/sfx/spawnpad
{
// Jan.29.1999 -- Xian commented out q3map_surfacelight 3500
//	q3map_surfacelight 3500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks17
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/spawnpad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/sfx/q1metal7_98d_pent_256
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/q1metal7_98d_pent_256
		rgbGen identity
		blendFunc filter
	}
	{
		map textures/sfx/pentagramfloor_256x256
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .5
	}
}


//Tim's fog for map tim_dm1
textures/sfx/fog_timdm1
{
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap
//fogparms ( .615 .309 0 ) 1800
fogparms ( .615 .309 0 ) 616
}

//Tim's fog for map tim_dm8
textures/sfx/fog_timdm8
{
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .211 .231 .094 ) 250
}

//Tim's fog for map tim_dm2
textures/sfx/fog_timdm2
{
qer_editorimage textures/sfx/fog_grey
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .615 .309 0 ) 356
}

//Tim's fog for map tim_ctf1
textures/sfx/fog_timctf1
{
qer_editorimage textures/sfx/fog_grey
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .729 .729 .780 ) 464

}

//Tim's fog for map mptim_ctf1
textures/sfx/fog_mptimctf1
{

surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .729 .729 .780 ) 300

}

textures/sfx/xfog_1024
{
qer_editorimage textures/sfx/fog_grey
qer_nocarve
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .729 .729 .780 ) 4000

}


//Paul's fog for map pj_dm4
textures/sfx/fog_pjdm1
{
qer_editorimage textures/sfx/fog_grey
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .733 .737 .620 ) 300

}

//Proto_hellfog
textures/sfx/proto_hellfog
{
qer_editorimage textures/sfx/proto_hellfog
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .275 .012 0 ) 500
}


//Tim's fog for q3test1
textures/sfx/fog_intel
{
qer_editorimage textures/sfx/fog_timdm1
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .75 .38 0 ) 800
}

//Paul's gray fog for q3dm10
textures/sfx/fog_q3dm10
{
qer_editorimage textures/sfx/fog_timdm1
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( 0.75 0.38 0 ) 128
}



textures/sfx/diamondredpad
{
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/diamond2c
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/sfx/redpad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 1
		tcMod stretch sin 0.80 0.20 0 1
	}
}

textures/sfx/hellfog_tim_dm14
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 50
	fogparms ( .55 .11 .1 ) 128

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}


}

textures/sfx/kc_hellfog_1k
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 300
	q3map_lightsubdivide 32
	fogparms ( .5 .12 .1 ) 225



	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}



textures/sfx/hellfog_1k
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 200
	fogparms ( .5 .12 .1 ) 300



	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
	}
}





textures/sfx/hellfog
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 100
	fogparms ( .55 .11 .1 ) 300


	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

textures/sfx/constfog
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	surfaceparm nodrop
	q3map_surfacelight 100
	fogparms ( .8 .8 .8 ) 100
}


textures/sfx/testconstantfog
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	surfaceparm nodrop
	q3map_surfacelight 100
	fogparms ( 0 1 0 ) 300
}

textures/sfx/q3tourney3fog
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 100
	fogparms ( .55 .11 .1 ) 384




	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

textures/sfx/q3dm14fog
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 100
	fogparms ( .55 .11 .1 ) 256




	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}


textures/sfx/q3dm9fog
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 100
	fogparms ( .55 .11 .1 ) 256




	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}


textures/sfx/hellfogdense
//**************************************
//New death fog that must be in all maps with death fog
//**************************************
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 100
	fogparms ( .55 .11 .1 ) 128




	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

//textures/sfx/pj_dm9_fog2
//  created 6_23_99
//{
//	qer_editorimage textures/sfx/hellfog
//	surfaceparm	trans
//	surfaceparm	nonsolid
//	surfaceparm	fog
//	surfaceparm	nolightmap
//	surfaceparm nodrop
//	q3map_surfacelight 60
//	fogparms ( .5 .5 .5 ) 32
//}
textures/sfx/pj_a1_fog1
//  created 7_06_99
{
	qer_editorimage textures/sfx/fog_pjteam1
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	surfaceparm nodrop
	q3map_surfacelight 30
	fogparms ( .5 .5 .5 ) 512
}
textures/sfx/pitted_rust3arrowbase
{
	qer_editorimage textures/sfx/pitted_rust3arrow
	q3map_lightimage textures/sfx/pitted_rust3arrow_blend
	q3map_surfacelight 2000
//	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/sfx/pitted_rust3arrow
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/pitted_rust3arrow_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/sfx/pitted_rust3arrowblocks
{
	qer_editorimage textures/sfx/pitted_rust3arrow
	q3map_lightimage textures/sfx/pitted_rust3arrow_blend
	q3map_surfacelight 2000
//	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks17
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/sfx/pitted_rust3arrow_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 1
	}
}
textures/sfx/q1teleporter
{
	qer_editorimage textures/sfx/q1teleporter
	q3map_surfacelight 500
	//light 1
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1

	{
		map textures/sfx/q1teleporter
		tcMod turb 0 .3 0 .2
	}

}

//fog for map mkc_dm4
textures/sfx/fog_mkcdm4
{
qer_editorimage textures/sfx/fog_grey

surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( .5 0 0 ) 96
}

textures/sfx/mkc_bigflame
{

		surfaceparm trans
		surfaceparm nomarks
		surfaceparm nonsolid
		qer_editorimage textures/sfx/flame1
		q3map_surfacelight 500
		surfaceparm nolightmap
		cull none

	{
		animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
		blendFunc add
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/sfx/flameball
		blendFunc add
		rgbGen wave sin .6 .2 0 .6
	}

}

textures/sfx/mkc_fog_tdm3
{
	qer_editorimage textures/sfx/hellfog
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	fogparms ( 0.3 0.2 0.2 ) 320


	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}

textures/sfx/mkc_fog_ctfred
{
	qer_editorimage textures/sfx/fog_timdm1
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	fogparms ( 0.3 0.2 0.2 ) 320

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}

textures/sfx/mkc_fog_ctfblue
{
	qer_editorimage textures/sfx/fog_timdm1
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_surfacelight 12
	q3map_globaltexture
	fogparms ( 0.2 0.2 0.25 ) 320

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}

textures/sfx/mkc_fog_ctfblue2
{
	qer_editorimage textures/sfx/fog_timdm1
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	fogparms ( 0.1 0.1 0.3 ) 320

	q3map_surfacelight 40

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}


textures/sfx/bugmirror
{
	qer_editorimage textures/sfx/mirrorkc
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
	{
		map textures/sfx/mirrorkc
		blendFunc add
		depthfunc equal
	}
}


textures/sfx/pureblack
{
	qer_editorimage textures/skies/blacksky
	surfaceparm noimpact
	surfaceparm nolightmap
	{
		map textures/skies/blacksky
	}
}


textures/stone/pjrock1_trans
{
	qer_editorimage textures/stone/pjrock1
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/stone/pjrock1
		rgbGen identity
		blendFunc filter


	}
}

textures/stone/pjrock7_trans
{
	qer_editorimage textures/stone/pjrock7
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/stone/pjrock7
		rgbGen identity
		blendFunc filter


	}
}
