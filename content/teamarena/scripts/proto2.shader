textures/proto2/winframe
{

        {
                map models/weapons/nailgun/nailgun_env.png
                //tcMod scale 2 2
                tcGen environment
                rgbGen identity
        }
        {
                map textures/proto2/winframe.png
                blendFunc blend
                rgbGen identity
        }
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/mpintro
{

    qer_editorimage textures/proto2/ed_movie.png
    surfaceparm trans
    surfaceparm nolightmap
    cull disable

        {
		map textures/proto2/shiny_black.png
                tcGen environment
                rgbGen identity
	}

	{
		videoMap mpteam6.roq
		blendFunc add
                rgbGen identity
	}


}
textures/proto2/mpteam1
{

    qer_editorimage textures/proto2/ed_movie.png
    surfaceparm trans
    surfaceparm nolightmap
    cull disable

        {
		map textures/proto2/shiny_black.png
                tcGen environment
                rgbGen identity
	}

	{
		videoMap mpteam1.roq
		blendFunc add
                rgbGen identity
	}


}

textures/proto2/mpteam3_movie
{

    qer_editorimage textures/proto2/ed_movie.png
    surfaceparm trans
    surfaceparm nolightmap
    cull disable

        {
		map textures/proto2/shiny_black.png
                tcGen environment
                rgbGen identity
	}

	{
		videoMap mpteam3.roq
		blendFunc add
                rgbGen identity
	}


}


textures/proto2/mpteam5_mv
{

    qer_editorimage textures/proto2/ed_movie.png
    surfaceparm trans
    surfaceparm nolightmap
    cull disable

        {
		map textures/proto2/shiny_black.png
                tcGen environment
                rgbGen identity
	}

	{
		videoMap mpteam5.roq
		blendFunc add
                rgbGen identity
	}

}

textures/proto2/mpterra2_mv
{

    qer_editorimage textures/proto2/ed_movie.png
    surfaceparm trans
    surfaceparm nolightmap
    cull disable

        {
		map textures/proto2/shiny_black.png
                tcGen environment
                rgbGen identity
	}

	{
		videoMap mpterra2.roq
		blendFunc add
                rgbGen identity
	}

}


textures/proto2/redflag
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/redflag.png
		alphaFunc GE128
	}


}

textures/proto2/blueflag
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/blueflag.png
		alphaFunc GE128
	}


}


textures/proto2/oneflag
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/oneflag.png
		alphaFunc GE128
	}


}

textures/proto2/harvest
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/harvest.png
		alphaFunc GE128
	}


}

textures/proto2/redob
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/redob.png
		alphaFunc GE128
	}


}
textures/proto2/blueob
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/blueob.png
		alphaFunc GE128
	}


}


textures/proto2/urhere
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/urhere.png
		alphaFunc GE128
	}


}


textures/proto2/terramap01
{

    surfaceparm trans
    surfaceparm nolightmap
    nopicmip

	{
		map textures/proto2/terramap01.png
		blendFunc add
                rgbGen wave sin 1 .2 0 .75
	}
        {
		map textures/proto2/terramap02.png
                BlendFunc add
                tcmod scale 1.75 1
		tcmod scroll -3.75 0
                rgbGen wave inversesawtooth 1 .2 0 .75
	}

}

ui/assets/logo01
{

     	nopicmip

	{
		map ui/assets/logo01.png
                BlendFunc add
		rgbGen wave triangle 1 1 0 .25
	}
  	{
		map ui/assets/logo02.png
                BlendFunc add
		tcmod scroll .43 0
                rgbGen wave triangle 1 1 0 .75
	}
        {
		map ui/assets/logo02.png
                BlendFunc add
                tcmod scroll -.51 0
		rgbGen wave triangle 1 1 0 1
	}
        {
		map ui/assets/logo03.png
                BlendFunc add
		tcmod scroll -.3 0
	}
        {
		map ui/assets/logo03.png
                BlendFunc add
		tcmod scroll .25 0
	}

}

textures/proto2/pagans_name
	{

	{
		map textures/proto2/pagans_name.png
		alphaFunc GE128
		rgbgen wave sin .5 0 0 0
		depthwrite

	}
	 {
		map textures/sfx2/jumpadr2.png
		blendfunc gl_one gl_zero
           tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		depthfunc equal

	}

}


textures/proto2/xflag01
{
	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/xflag01.png
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

textures/proto2/grill03b
{


	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/grill03b.png
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

textures/proto2/screw01
{
     surfaceparm	metalsteps
     surfaceparm	nomarks
     surfaceparm 	alphashadow

        {
		map textures/proto2/screw01.png
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

textures/proto2/vertex_greenstone
{
	qer_editorimage textures/gothic_block/blocks17i.png
 	surfaceparm pointlight

        {
		map textures/gothic_block/blocks17i.png
		rgbGen vertex
	}

}

textures/proto2/vertex_cavestone
{
	qer_editorimage textures/stone/pjrock5.png
	surfaceparm pointlight

    {
		map textures/stone/pjrock5.png
		rgbGen vertex
	}

}
textures/proto2/vertex_cavestone_mru
//The image of Mr. Ugly is copyright 2000 by Kevin Hendryx
//It is used here with his permission (but keep it quiet ... it's a secret)
{
	qer_editorimage textures/stone/pjrock5_mru.png
	surfaceparm pointlight

    {
		map textures/stone/pjrock5_mru.png
		rgbGen vertex
	}

}


textures/proto2/x_smallpipe
{
	deformVertexes autoSprite2
        surfaceparm trans
	surfaceparm alphashadow
	cull none
	{
		map textures/proto2/x_smallpipe.png
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

textures/proto2/marbledoor_blue
{
     surfaceparm	metalsteps

        {
		map textures/effects/tinfx2.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/marbledoor_blue.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/marbledoor_red
{
     surfaceparm	metalsteps

        {
		map textures/effects/tinfx2.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/marbledoor_red.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/proto2/black
{

     qer_editorimage textures/effects2/black.png
     surfaceParm nolightmap

        {
		map textures/effects2/black.png
		rgbGen vertex
	}

}

textures/proto2/vertex_con
{

     qer_editorimage textures/proto2/concrete03c.png
     surfaceparm pointlight

        {
		map textures/proto2/concrete03c.png
		rgbGen vertex
	}

}

textures/proto2/concrete03c_aqua
{
	surfaceparm pointlight

        {
		map textures/proto2/concrete03c_aqua.png
		rgbGen vertex
	}

}

textures/proto2/pulsebeam
{
     surfaceparm	metalsteps


        {
		map textures/proto2/pulsebeam.png
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
        {
		map textures/proto2/pulsebeam2.png
                BlendFunc add
		rgbGen wave inversesawtooth -.3 1.3 0 1
	}
}

textures/proto2/concrete_rednfx
{
     surfaceparm	metalsteps
     qer_editorimage textures/proto2/concrete_red.png

        {
		map textures/proto2/concrete_red.png
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/concrete_bluenfx
{
     surfaceparm	metalsteps
     qer_editorimage textures/proto2/concrete_blue.png

        {
		map textures/proto2/concrete_blue.png
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/cheapfloor
{
        qer_editorimage textures/proto2/marble02b_floor.png

	{
		map textures/effects2/xtourney_fx3.png
                //tcGen environment
                //tcmod scale .5 .5
                tcGen environment
                rgbGen identity

	}
        {
               map textures/proto2/marble02b_floor.png
	       blendFunc blend
               rgbGen identity
        }
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

}

textures/proto2/redlight_on
{
  surfaceparm nolightmap

	{
		map textures/proto2/redlight_on.png
		rgbGen identity
	}


}

textures/proto2/bluelight_on
{
  surfaceparm nolightmap

	{
		map textures/proto2/bluelight_on.png
		rgbGen identity
	}


}

////////////////////////////// Warning lights for mpterra2
textures/proto2/bsredlight_on
//for team sides in mpterra2 (1 of 8)
{
  surfaceparm nolightmap
  qer_editorimage textures/proto2/redlight_on.png

	{
		map textures/proto2/redlight_on.png
		rgbGen identity
	}
}

textures/proto2/bsbluelight_on
//for team sides in mpterra2 (2 of 8)
{
  surfaceparm nolightmap
  qer_editorimage textures/proto2/bluelight_on.png
	{
		map textures/proto2/bluelight_on.png
		rgbGen identity
	}
}

textures/proto2/rsredlight_off
//for team sides in mpterra2 (3 of 8)
{

  qer_editorimage textures/proto2/redlight_off.png

       {
		map textures/proto2/redlight_off.png
		rgbGen identity
	}
}

textures/proto2/rsbluelight_off
//for team sides in mpterra2 (4 of 8)
{
  qer_editorimage textures/proto2/bluelight_off.png

	{
		map textures/proto2/bluelight_off.png
		rgbGen identity
	}
}

textures/proto2/bsredlight_off
//for team sides in mpterra2 (5 of 8)
{

  qer_editorimage textures/proto2/redlight_off.png

       {
		map textures/proto2/redlight_off.png
		rgbGen identity
	}
}

textures/proto2/bsbluelight_off
//for team sides in mpterra2 (6 of 8)
{
  qer_editorimage textures/proto2/bluelight_off.png

	{
		map textures/proto2/bluelight_off.png
		rgbGen identity
	}
}

textures/proto2/rsbluelight_on
//for team sides in mpterra2 (7 of 8)
{
  surfaceparm nolightmap
  qer_editorimage textures/proto2/bluelight_on.png
	{
		map textures/proto2/bluelight_on.png
		rgbGen identity
	}
}

textures/proto2/rsredlight_on
//for team sides in mpterra2 (8 of 8)
{
  surfaceparm nolightmap
  qer_editorimage textures/proto2/redlight_on.png
	{
		map textures/proto2/redlight_on.png
		rgbGen identity
	}
}
/////////////////////////////////


textures/proto2/mirrorfloor
{
        qer_editorimage textures/proto2/marble02b_s.png
	portal
	{
		map textures/common/mirror1.png
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/proto2/marble02b_floor.png
	       blendFunc blend
               rgbGen identity
        }
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

}

textures/proto2/bluetrim01
{


	{
		map textures/effects2/envmap_blu.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale .025 .05
                tcmod Scroll  .005 .04

                rgbGen identity
	}
        {
		map textures/proto2/bluetrim01.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/redtrim01
{
    qer_editorimage  textures/proto2/bluetrim01

	{
		map textures/effects2/envmap_red.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale .025 .05
                tcmod Scroll  .005 .04

                rgbGen identity
	}
        {
		map textures/proto2/bluetrim01.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/torchstone_trans
{
	qer_editorimage textures/proto2/marble02btrim.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/proto2/marble02btrim.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/proto2/torchstone02_trans
{
	qer_editorimage textures/proto2/marbledge01.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/proto2/marbledge01.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}
textures/proto2/torchstone03_trans
{
	qer_editorimage textures/proto2/marble02b.png
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/proto2/marble02b.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}


textures/proto2/shiny_black
{
     surfaceparm	nolightmap

        {
		map textures/proto2/shiny_black.png
                tcGen environment
                rgbGen identity
	}

        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/light_nv
{
     surfaceparm	nolightmap

        {
		map textures/proto2/light_nv.png
		rgbGen identity
	}

        {
		map textures/effects/tinfx2b.png
                tcGen environment
                blendFunc add
                rgbGen identity
	}


}
textures/proto2/marble02btrim03
{

	{
		map textures/proto2/marble02btrim03.png
                rgbGen identity
        }
        {
	        map $lightmap
                blendFunc filter
	        rgbGen identity
	}
        {
		map textures/proto2/marble02btrim03_lt.png
                blendFunc add
                rgbGen wave sin .9 .5 0 .2
        }

}
textures/proto2/marble02rtrim03
{

	{
		map textures/proto2/marble02rtrim03.png
                rgbGen identity
        }
        {
	        map $lightmap
                blendFunc filter
	        rgbGen identity
	}
        {
		map textures/proto2/marble02rtrim03_lt.png
                blendFunc add
                rgbGen wave sin .9 .5 0 .2
        }

}


textures/proto2/red_zot
{
    cull disable
    deformVertexes move 0.2 0 .3  sin 0 5 0 10
    deformVertexes move 0 0.2 0  sin 0 5 0 13
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap

	{
		map textures/proto2/red_zot.png
		blendFunc Add
		rgbGen identity
	}

}

textures/proto2/blue_zot
{
    cull disable
    deformVertexes move 0.2 0 .3  sin 0 5 0 10
    deformVertexes move 0 0.2 0  sin 0 5 0 13
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap

	{
		map textures/proto2/blue_zot.png
		blendFunc Add
		rgbGen identity
	}

}

textures/proto2/red_zot2
{
    cull disable
	qer_lightimage textures/proto2/red_zot2.png
	q3map_surfacelight 120
    deformVertexes move 0.2 0 .3  sin 0 5 0 10
    deformVertexes move 0 0.2 0  sin 0 5 0 13
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap

	{
		map textures/proto2/red_zot2.png
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/blue_zot2
{
	qer_editorimage textures/proto2/blue_zot.png
    cull disable
	qer_lightimage textures/proto2/blue_zot.png
	q3map_surfacelight 120
    deformVertexes move 0.2 0 .3  sin 0 5 0 10
    deformVertexes move 0 0.2 0  sin 0 5 0 13
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap

	{
		map textures/proto2/blue_zot.png
		blendFunc Add
		rgbGen identity
	}


}



textures/proto2/door_right
{
     surfaceparm	metalsteps

        {
		map textures/effects2/envmap_sky.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/door_right.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/reda_dcl
{
     surfaceparm	nomarks
     surfaceparm	trans
     //nomipmaps
     surfaceparm pointlight

        {
		map textures/proto2/reda_dcl.png
                blendFunc add
		rgbGen vertex
	}
}
textures/proto2/bluea_dcl
{
     surfaceparm	nomarks
     surfaceparm	trans
     //nomipmaps
     surfaceparm pointlight

        {
		map textures/proto2/bluea_dcl.png
                blendFunc add
		rgbGen vertex
	}
}

textures/proto2/blueat_dcl
{
     surfaceparm	nomarks
     surfaceparm	trans
     //nomipmaps
     surfaceparm pointlight

        {
		map textures/proto2/blueat_dcl.png
                blendFunc add
		rgbGen vertex
	}
}


textures/proto2/skull_red_dcl
{
	qer_editorimage  textures/proto2/pjdecal_red.png
     surfaceparm	nomarks
     surfaceparm	trans
     nomipmaps
     surfaceparm pointlight

        {
		map textures/proto2/pjdecal_red.png
                blendFunc add
		rgbGen vertex
	}
}

textures/proto2/skull_blue_dcl
{
	qer_editorimage  textures/proto2/pjdecal_blue.png
     surfaceparm	nomarks
     surfaceparm	trans
     nomipmaps
     surfaceparm pointlight

        {
		map textures/proto2/pjdecal_blue.png
                blendFunc add
		rgbGen vertex
	}
}

textures/proto2/concrete_red
{
     surfaceparm	metalsteps

        {
		map textures/effects2/redfx.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/concrete_red.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/concrete_blue
{
     surfaceparm	metalsteps

        {
		map textures/effects2/bluefx.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/concrete_blue.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/teamwerkz_red1
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/teamwerkz_red2.png
		blendFunc add
                tcMod scroll 1 0
		rgbgen wave sin 0 1 0 9
	}
        {
		map textures/proto2/teamwerkz_red1.png
		blendFunc add
                tcMod scroll -.2 0
		rgbgen wave sin 0 1 0 .19
	}



}
textures/proto2/teamwerkz_blue1
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/teamwerkz_blue2.png
		blendFunc add
                tcMod scroll 1 0
		rgbgen wave sin 0 1 0 9
	}
        {
		map textures/proto2/teamwerkz_blue1.png
		blendFunc add
                tcMod scroll -.2 0
		rgbgen wave sin 0 1 0 .19
	}



}
textures/proto2/gothic_light
{


	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/gothic_light.png
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

textures/proto2/gothic_lightfx
{

       	q3map_surfacelight 2000
	surfaceparm alphashadow
        surfaceparm nomarks

	{
		map textures/proto2/gothic_lightfx.png
		blendfunc add
		rgbGen identity

	}
}
textures/proto2/5_dcl
{

       	surfaceparm pointlight
	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/5_dcl.png
		blendFunc add
		depthWrite
		rgbGen vertex

	}

}

textures/proto2/grill02
{


	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/grill02.png
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
textures/proto2/wirepipe
{


	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/wirepipe.png
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
textures/proto2/wheel01
{


	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/wheel01.png
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
textures/proto2/c_zinc_shiny
{
    qer_editorimage textures/gothic_trim/zinc_shiny.png
    cull none
        {
                map textures/effects/tinfx.png
                tcGen environment
                rgbGen identity
	}
        {
		map textures/gothic_trim/zinc_shiny.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/proto2/stadlight01
{


	surfaceparm alphashadow
        surfaceparm nomarks
	cull none

	{
		map textures/proto2/stadlight01.png
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
		map textures/proto2/stadlight01fx.png
		blendfunc add
		rgbGen wave sin .5 .5 0 2

	}
}

textures/proto2/v_support02
{


	surfaceparm alphashadow
	cull none
        nomipmaps
	{
		map textures/proto2/v_support02.png
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
textures/proto2/pipes01
{


	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/pipes01.png
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
textures/proto2/floorvent01
{

       	surfaceparm pointlight
	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/floorvent01.png
		blendFunc blend
		depthWrite
		rgbGen vertex

	}

}
textures/proto2/sign01
{
        {
                map textures/proto2/sign01.png
                BlendFunc Add
                rgbGen identity
        }
}

textures/proto2/supportctfblu
{


	{
		map textures/effects2/envmap_blu.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale .025 .05
                tcmod Scroll  .005 .02

                rgbGen identity
	}
        {
		map textures/proto2/supportctfblu.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/supportctfred
{


	{
		map textures/effects2/envmap_red.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale .025 .05
                tcmod Scroll  .005 .02

                rgbGen identity
	}
        {
		map textures/proto2/supportctfred.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/marbletrim02
{


	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/marbletrim02.png
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

textures/proto2/marbletrim01
{


	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/marbletrim01.png
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
textures/proto2/marble02b_s
{
     surfaceparm	metalsteps

        {
		map textures/effects/tinfx2.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/marble02b_s.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/proto2/ceiling_pipe01
{


	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/ceiling_pipe01.png
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
textures/proto2/duct01
{
     surfaceparm	metalsteps

        {
		map textures/effects/tinfx.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/duct01.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/grate_trim
{
     surfaceparm	metalsteps

        {
		map textures/sfx/specular.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/grate_trim.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/techtrim02
{
     surfaceparm	metalsteps

        {
		map textures/sfx/specular.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/techtrim02.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/steam01
{
    qer_editorimage textures/proto2/steam_01_img.png
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    //surfaceparm alphashadow
    //surfaceparm nolightmap
    surfaceparm pointlight
    deformVertexes wave 50 sin 0 3 0 .3
    deformVertexes move .3 .1 0  sin 0 .5 0 0.2
   //deformVertexes move .6 .3 0  sin 0 .5 0 0.4
	{
		map textures/proto2/steam01.png
                tcmod scroll 0 0.3
		blendFunc blend
		rgbGen vertex
	}



}
textures/proto2/flare2
{
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/flare2.png
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/flare
{
    cull disable
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nolightmap

	{
		clampmap textures/proto2/flare.png
                tcmod rotate 10
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/redflare2
{
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/redflare2.png
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/redflare
{
    cull disable
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nolightmap

	{
		clampmap textures/proto2/redflare.png
                tcmod rotate 10
		blendFunc Add
		rgbGen identity
	}


}

textures/proto2/xredflare2
// No autosprite for xian_team4 fuckage
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap

	{
		map textures/proto2/xredflare2.png
		blendFunc Add
		rgbGen identity
	}
}


textures/proto2/xblueflare2
// No autosprite for xian_team4 fuckage
{
    cull disable
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/blueflare2.png
		blendFunc Add
		rgbGen identity
	}
}


textures/proto2/blueflare2
{
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/blueflare2.png
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/blueflare
{
    cull disable
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nolightmap

	{
		clampmap textures/proto2/blueflare.png
                tcmod rotate 10
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/pipewall01
{


	surfaceparm alphashadow
	cull none

	{
		map textures/proto2/pipewall01.png
		alphaFunc GE128

		rgbGen identity

	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/proto2/barbedwire
{
	surfaceparm pointlight
        surfaceparm trans
	surfaceparm alphashadow
        deformVertexes autoSprite2
	cull twosided
        //nopicmip

	{
		map textures/proto2/barbedwire.png
                blendFunc Blend
		//alphaFunc GE128
		//depthWrite
		rgbGen vertex
	}
	//{
	//	map $lightmap
	//	rgbGen identity
	//	blendFunc GL_DST_COLOR GL_ZERO
	//	depthFunc equal
	//}
}

textures/proto2/rail01

{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        //nopicmip
	{
		map textures/proto2/rail01.png
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
textures/proto2/grill01
{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        //nopicmip
	{
		map textures/proto2/grill01.png
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
textures/proto2/vent01
{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        //nopicmip
	{
		map textures/proto2/vent01.png
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
textures/proto2/girder05
{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        //nopicmip
	{
		map textures/proto2/girder05.png
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
textures/proto2/girder04
{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        //nopicmip
	{
		map textures/proto2/girder04.png
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
textures/proto2/gear02
{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        //nopicmip
	{
		clampmap textures/proto2/gear02.png
		alphaFunc GE128
                tcmod rotate 123
		depthWrite
		rgbGen identity
	}
        {
		clampmap textures/proto2/gear02b.png
		blendFunc add
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/proto2/dirt01
{

        {
		map textures/proto2/dirt01.png
                rgbGen identity
	}
        {
		map textures/proto2/dirt01b.png
                tcmod Scale 1.1  1.2
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/lightbulb
{
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nolightmap
	{
		map textures/proto2/lightbulb.png
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/lightbulb2
{
    cull disable
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nolightmap

	{
		map textures/proto2/lightbulb2.png
		blendFunc Add
		rgbGen identity
	}


}
textures/proto2/tin_panel
{
     surfaceparm	metalsteps

        {
		map textures/effects/tinfx.png
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
textures/proto2/yellow
{
     surfaceparm	metalsteps

        {
		map textures/effects/tinfx.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/proto2/yellow.png
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/proto2/girder03
{

        surfaceparm trans
	surfaceparm alphashadow
	cull none
        nopicmip
	{
		map textures/proto2/girder03.png
		alphaFunc GE128
                //depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/proto2/wire
{
    cull disable
    deformVertexes autoSprite2
        {
		map $lightmap
		rgbGen identity
	}
	{
		map textures/proto2/wire.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/proto2/chain
{
     cull disable
     deformVertexes autoSprite2
     deformVertexes wave 100 sin 0 3 0 .05
     deformVertexes wave 100 sin 0 3 0 .3
        {
		map textures/proto2/chain.png
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

textures/proto2/concrete01wetfloor

	{

		{
			map textures/proto2/ooze.png
                        tcmod scale 2 2
                        tcMod turb 0 .2 0 .1
                        rgbGen identity
                }
                {
			map textures/proto2/concrete01wetfloor.png
                        Blendfunc blend
			rgbGen identity
		}
                {
		        map $lightmap
                        blendFunc filter
		        rgbGen identity
	        }


        }


textures/proto2/concrete01wetfloorkc

	{


                {
		        map $lightmap

	        }

		{
			map textures/proto2/basewall01test.png
			blendFunc GL_DST_COLOR GL_src_color
			rgbGen identity
		}
}


textures/proto2/concrete01wetwall

	{

		{
			map textures/proto2/ooze.png
                        tcmod scale 2 2
                        tcmod scroll 0 -.1
                        rgbGen identity
                }
                {
			map textures/proto2/concrete01wetwall.png
                        Blendfunc blend
			rgbGen identity
		}
                {
		        map $lightmap
                        blendFunc filter
		        rgbGen identity
	        }


        }



textures/proto2/xsandy01
{
	surfaceparm nolightmap
	{
		map textures/proto2/xsandy01.png
		tcmod scale .8 .8
		rgbGen vertex
	}
}

textures/proto2/xrocky01
{
	surfaceparm nolightmap
	{
		map textures/proto2/xrocky01.png
		tcmod scale .8 .8
		rgbGen vertex
	}
}
