textures/eerie/floor3_3dark
{
	surfaceparm	metalsteps
}


textures/eerie/xblocks11be
{
	qer_editorimage textures/eerie/blocks11b
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/blocks11b
		rgbGen identity
		blendFunc filter
	}
	{
		map textures/eerie/electricgrade3
		rgbGen wave sin .25 .25 0.25 .25
		tcMod turb .2 .2 .1 1
		tcMod scale .25 .25
		tcMod scroll -.5 -1.2
		blendfunc GL_DST_COLOR GL_ONE
	}
}

textures/eerie/blackness
{
	surfaceparm nolightmap
	surfaceparm noimpact
	{
		map gfx/colors/black
	}
}
textures/eerie/surface6jumppad
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		rgbGen identity
		map textures/eerie/surface6
		blendFunc filter
	}
	{
		map textures/eerie/surface6jumppad_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
//		blendFunc add
//		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/eerie/xgoopjumpypad
{
	q3map_surfacelight 100
	q3map_lightimage textures/eerie/surface6jumppad_blend
	{
		rgbGen identity
		map $lightmap
	}
	{
		rgbGen identity
		map textures/eerie/xgoopq1metal
		blendFunc filter
	}
	{
		clampmap textures/eerie/surface6jumppad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/eerie/xgoopy_pentagram
{
//	qer_editorimage textures/eerie/xgoopy_pentagram
	q3map_surfacelight 250
//	q3map_lightimage textures/eerie/pentagramfloor_red_blend
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xgoopq1metal
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/eerie/pentagramfloor_red_blend
		blendFunc add
//		rgbGen wave sin 0.5 0.5 0.3 .5
		tcMod rotate -60
//		blendFunc add
//		rgbGen wave sin 0.5 0.5 0 .5
//		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1

	}
}

textures/eerie/gkcspine
{
	deformVertexes wave 100 sin 2 3 0 0.4
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/gkcspine
		blendFunc filter
		rgbGen identity
	}
}

textures/eerie/lavahell
{
	qer_editorimage textures/eerie/lavahell
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 500
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms 0.8519142 0.309723 0.0 128 128

	{
		map textures/eerie/lavahell
		tcMod turb .25 0.4 0 0.09
	}
}
textures/eerie/lavahell2
{
	qer_editorimage textures/eerie/lavahell
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 3000
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms 0.8519142 0.309723 0.0 128 128

	{
		map textures/eerie/lavahell
		tcMod turb .25 0.2 1 0.02
		tcMod scroll 0.1 0.1
	}
}
textures/eerie/lavahell_goddamnbright
{
	qer_editorimage textures/eerie/lavahell
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 7000
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms 0.8519142 0.309723 0.0 128 128

	{
		map textures/eerie/lavahell
		tcMod turb .25 0.2 1 0.02
		tcMod scroll 0.1 0.1
	}
}


textures/eerie/uberiron
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/uberiron
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/firewall_light
		blendfunc filter
		tcMod scroll 5 15
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
	}
}

textures/eerie/iron01_e_flicker
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/iron01_e_flicker
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/firewalla
		blendfunc filter
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
		tcMod scroll -15 -5
	}
	{
		map textures/eerie/firewallb
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale 0.1 0.1
		tcMod turb .2 .1 .1 1
		tcMod scroll -10 0
	}
}
textures/eerie/q1metal7_98d_flicker
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/q1metal7_98d
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/eerie/firewalla
		blendfunc filter
		tcMod scroll -15 -5
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
	}
}

textures/eerie/iron01_d_flicker
{
	tesssize 32
	surfaceparm nolightmap
	{
		map textures/eerie/iron01_d_flicker
	}
	{
		map textures/eerie/firewalla
		blendfunc filter
		tcMod scroll 5 15
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
	}
	{
		map textures/eerie/firewallb
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale .1 .1
		tcMod turb .2 .1 .1 1
		tcMod scroll 0 10
	}
}
textures/eerie/iron01_g_flicker
{
	tesssize 32
	surfaceparm nolightmap
	{
		map textures/eerie/iron01_g_flicker
	}
	{
		map textures/eerie/firewalla
		blendfunc filter
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
		tcMod scroll 5 15
	}
	{
		map textures/eerie/firewallb
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale 0.1 0.1
		tcMod turb .2 .1 .1 1
		tcMod scroll 0 10
	}
}


textures/eerie/firewall
{
	surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 6000
	tesssize 64
	{
		map textures/eerie/firewalla
		blendfunc gl_one gl_zero
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
		tcMod scroll 5 15
	}
	{
		map textures/eerie/firewallb
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale .1 .1
		tcMod turb .2 .1 .1 1
		tcMod scroll 0 10
	}
	{
		map textures/eerie/firewall
		blendFunc GL_dst_color gl_one
		tcMod turb .1 .1 .5 .5
		tcMod scroll 10 40
	}
}

textures/eerie/xq1metalbig_nojumppad
{
	surfaceparm nodamage
	{
		map $lightmap
		rgbGen identity
	}
	{
		rgbGen identity
		map textures/eerie/xq1metalbig_nojumppad
		blendFunc filter
	}
	{
		map textures/eerie/xq1metalbig_nojumppad_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/eerie/metal3_3
{
	surfaceparm metalsteps
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/metal3_3
		rgbGen identity
		blendfunc filter
	}

}

textures/eerie/teslacoil
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/cabletest2
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/electricgrade3

		rgbGen wave sin .25 .25 0.25 .25

		tcMod turb .2 .2 .1 1
		tcMod scale .25 .25
		tcMod scroll -.5 -1.2

		blendfunc add
	}
	{
		map textures/eerie/electricslime
		tcMod turb .2 .2 .1 1
		tcMod scale .25 .25
		tcMod scroll .5 1.5
		blendfunc GL_DST_COLOR GL_ONE

	}
}
textures/eerie/tesla_cable
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/tesla_cable
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/electricslime
		tcMod turb .2 .2 1 .1
		tcMod scroll 0 15
		tcMod scale .1 .1
		blendfunc GL_DST_COLOR GL_ONE

//		map textures/eerie/electricslime
//		tcMod turb 1 1 1 .01
//		tcMod scroll 1 5
//		tcMod scale .5 .5
//		blendfunc add
	}
}
textures/eerie/jesus
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/eerie/jesus
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/jesus_mask3_blend
		blendfunc add
	}
}
textures/eerie/xq1metalbig_jumppad
{
	surfaceparm nodamage
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/q1metal7_98d_256x256
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/eerie/surface6jumppad_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
//		map textures/eerie/jumppad
//		blendFunc add
//		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/eerie/blocks15b_jumppad
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/blocks15b_jumppad
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/jumppad
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/eerie/blocks11b_jumppad
{
	surfaceparm nodamage
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/castle/blocks11b
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/eerie/jumppad
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/eerie/blocks11b_jumppad_smaller
{
	surfaceparm nodamage
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/blocks11b_jumppad_smaller
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/jumppad_smaller
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .2
	}
}


textures/eerie/pentagramfloor
{
//	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/pentagramfloor
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/pentagramfloor_red_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .5
	}
}
textures/eerie/pentagramfloor_rotating
{
	qer_editorimage textures/eerie/pentagramfloor
//	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xhugefloor2
		blendFunc filter
		rgbGen identity
	}
	{
		clampmap textures/eerie/pentagramfloor_red_blend
		blendFunc add
		rgbGen wave sin 0.75 0.25 0 0.5
		tcMod rotate -60
	}
}


textures/eerie/q1metal7_98d_pent_256
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/q1metal7_98d_pent_256
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/pentagramfloor_256x256
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 .5
	}
}


textures/eerie/border11light
{
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/border11light
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/border11light_blend
		blendfunc add
	}
}
textures/eerie/borderlight_500
{
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/border11light
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/border11light_blend
		blendfunc add
	}
}

textures/eerie/redgoal
{
	q3map_surfacelight 200

	{
		map textures/eerie/redgoal
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.05
	}
}
textures/eerie/bluegoal
{
	q3map_surfacelight 200
	{
		map textures/eerie/bluegoal
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.05
	}
}
textures/eerie/powerupshit
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/eerie/powerupshit
		tcGen environment
		blendfunc add
		tcMod turb 0 0.25 0 0.5
	}
}
textures/eerie/xian_rune11
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xian_rune11
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/xian_rune11_blend
		blendfunc add
	}
}

textures/eerie/xian_rune21
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xian_rune21
		//map textures/eerie/xian_rune21_specular
		rgbGen identity
		blendFunc filter
	}
	{
		map textures/eerie/xian_rune21_blend
		blendfunc add
	}
}
textures/eerie/lightcone
{
	{
		map textures/eerie/lightcone
		tcGen environment
		blendfunc add
	}
}

textures/eerie/q1metal7_97b_mirror
{
	surfaceparm nolightmap
	portal
	{
		map textures/eerie/q1metal7_97b_mirror
		blendfunc GL_ONE GL_SRC_ALPHA
		depthWrite
	}
}
textures/eerie/cross_1000
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/cross_1000
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/cross_1000_blend
		blendfunc add
	}
}
textures/eerie/cross_2500
{
	q3map_surfacelight 2500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/cross_2500
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/cross_2500_blend
		blendfunc add
	}
}

textures/eerie/light1
{
	q3map_surfacelight 2000
	q3map_lightimage textures/eerie/light1_blend
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light1
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/light1_blend
		blendfunc add
	}
}

textures/eerie/light1_5000
{
	qer_editorimage textures/eerie/light1
	q3map_lightimage textures/eerie/light1_blend
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light1
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/light1_blend
		blendfunc add
	}
}

textures/eerie/light2
{
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light2
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/light2_blend
		blendfunc add
	}
}

textures/eerie/light3_8
{
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light3_8
		blendFunc filter
		rgbGen identity
	}
	{
		map textures/eerie/light3_8_blend
		blendfunc add
	}
}
textures/eerie/xian_light3_7
{
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xian_light3_7
		rgbGen identity
		blendFunc filter
	}
	{
		map textures/eerie/xian_light3_7_blend
		blendfunc add
	}
}
