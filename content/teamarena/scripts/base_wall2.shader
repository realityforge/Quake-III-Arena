textures/base_wall2/blue_warning_light
{

     qer_editorimage textures/proto2/bluelight_off

        {
   		 map textures/proto2/bluelight_off
   		 rgbgen identity
        }

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

}



textures/base_wall2/ntrl_techfloor_kc
{
     	surfaceparm	metalsteps
	surfaceparm 	alphashadow
	surfaceparm	nomarks
        qer_editorimage textures/base_wall2/techfloor_kc

        {
		clampmap textures/base_wall2/zzztntrl_kc
               	alphaFunc GE128
		tcmod rotate 360
		rgbgen wave sin .8 .2 0 2
		depthWrite
	}
        {
                clampmap textures/base_wall2/techfloor2_kc
		blendFunc blend
                tcmod rotate 180
		depthFunc equal
                tcMod stretch sin .8 0.1 0 .4
	        rgbGen identity
	}

	{
		map textures/base_wall2/techfloor_kc
                blendFunc blend
		depthFunc equal
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		depthFunc equal
		rgbgen identity
	}
	{
	        map textures/base_wall2/techfloor_kc_shadow
                blendfunc filter
	        rgbGen identity
	}


}
textures/base_wall2/respawn_effect1_ntrl
{
    	cull disable
    	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	qer_editorimage textures/base_wall2/ntrl_1_kc
 	{
		map textures/base_wall2/ntrl_1_kc
                blendFunc add
		tcmod scale 1 -1
		rgbgen wave sin .25 .25 0 .25
                tcmod scroll .5 0
	}
	{
		map textures/base_wall2/ntrl_2_kc
                blendFunc add
		rgbgen wave sin .25 .25 .25 .25
		tcmod scale 1 -1
                tcmod scroll -.5 0
	}


	 {
		map textures/base_wall2/ntrl_3_kc
                blendFunc add
		tcmod scale 1 -1
                rgbGen wave inversesawtooth -.3 1.3 0 .25
	}


}

textures/base_wall2/blue_metal
{

	{
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/blue_metal
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}
textures/base_wall2/scuffs1
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap

	{
		map textures/base_wall2/scuffs1
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall2/space_panel
{


	{
		map textures/base_wall2/space_panel
		rgbgen identity
		tcmod scale .5 .5
	}

	{
		map textures/base_wall2/space_panel_alt
		blendFunc filter
		rgbgen wave sin .5 0 0 0
	}


	{
		map textures/base_wall2/lensflare
		blendFunc add
		tcgen environment
	}


	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}




textures/base_wall2/space_concrete
{
	qer_editorimage textures/base_wall2/space_panel_alt

	{
		map textures/base_wall/concrete1
		rgbgen identity
	}

	{
		map textures/base_wall2/space_panel_alt
		blendFunc filter
		tcmod scale .25 .25
	}


	{
		map textures/base_wall2/space_panel_alt2
		blendFunc filter
		tcmod scale .25 .1
	}
	{
		map textures/base_wall2/lensflare
		blendFunc add
		rgbgen wave sin .5 0 0 0
		tcgen environment
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}


textures/base_wall2/jumppad_red_kc
{
     	surfaceparm trans
	surfaceparm nomarks
        {
	        map textures/base_wall2/jumppad_red_kc
                alphafunc GE128
		depthwrite
	        rgbGen identity
	}

        {
	        map textures/sfx2/jumpadr
                blendFunc GL_ONE GL_ZERO
		depthfunc equal
                tcmod rotate 130
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		blendFunc blend
		depthfunc equal
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadr2
		blendfunc Add
		depthfunc equal
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad01
                blendFunc blend
		depthfunc equal
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		depthfunc equal
		rgbGen identity
	}

	{
	        map textures/base_wall2/jumppad_shadow
                blendfunc filter
	        rgbGen identity
	}

}

textures/base_wall2/jumppad_blue_kc
{
     	surfaceparm trans
	surfaceparm nomarks
        {
	        map textures/base_wall2/jumppad_blue_kc
                alphafunc GE128
		depthwrite
	        rgbGen identity
	}

        {
	        map textures/sfx2/jumpadb
                blendFunc GL_ONE GL_ZERO
		depthfunc equal
                tcmod rotate 130
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		blendFunc blend
		depthfunc equal
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadb2
		blendfunc Add
		depthfunc equal
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad01
                blendFunc blend
		depthfunc equal
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		depthfunc equal
		rgbGen identity
	}

	{
	        map textures/base_wall2/jumppad_shadow
                blendfunc filter
	        rgbGen identity
	}

}

textures/base_wall2/jumppad_ntrl_kc
{
	qer_editorimage textures/base_wall2/jumppad_blue_kc
     	surfaceparm trans
	surfaceparm nomarks
        {
	        map textures/base_wall2/jumppad_blue_kc
                alphafunc GE128
		depthwrite
	        rgbGen identity
	}

        {
	        map textures/sfx2/jumpadn
                blendFunc GL_ONE GL_ZERO
		depthfunc equal
                tcmod rotate 130
	        rgbGen identity
	}
        {
	        map textures/sfx2/fan01
		blendFunc blend
		depthfunc equal
                tcmod rotate -311
	        rgbGen identity
	}
        {
		clampmap textures/sfx2/jumpadn2
		blendfunc Add
		depthfunc equal
                tcmod rotate 130
		tcMod stretch sin 1.2 .8 0 1.4
		rgbGen wave square .5 .5 .25 1.4
	}
        {
		map textures/sfx2/jumpad01
                blendFunc blend
		depthfunc equal
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		depthfunc equal
		rgbGen identity
	}

	{
	        map textures/base_wall2/jumppad_shadow
                blendfunc filter
	        rgbGen identity
	}

}


textures/base_wall2/respawn_effect1
{
    	cull disable
    	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	qer_editorimage textures/base_wall2/redjet_1_kc
 	{
		map textures/base_wall2/redjet_1_kc
                blendFunc add
		tcmod scale 1 -1
		rgbgen wave sin .25 .25 0 .25
                tcmod scroll .5 0
	}
	{
		map textures/base_wall2/redjet_2_kc
                blendFunc add
		rgbgen wave sin .25 .25 .25 .25
		tcmod scale 1 -1
                tcmod scroll -.5 0
	}


	 {
		map textures/base_wall2/redjet_3_kc
                blendFunc add
		tcmod scale 1 -1
                rgbGen wave inversesawtooth -.3 1.3 0 .25
	}






}

textures/base_wall2/respawn_effect1_blue
{
    	cull disable
    	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	qer_editorimage textures/base_wall2/bluejet_1_kc
 	{
		map textures/base_wall2/bluejet_1_kc
                blendFunc add
		tcmod scale 1 -1
		rgbgen wave sin .25 .25 0 .25
                tcmod scroll .5 0
	}
	{
		map textures/base_wall2/bluejet_2_kc
                blendFunc add
		rgbgen wave sin .25 .25 .25 .25
		tcmod scale 1 -1
                tcmod scroll -.5 0
	}


	 {
		map textures/base_wall2/bluejet_3_kc
                blendFunc add
		tcmod scale 1 -1
                rgbGen wave inversesawtooth -.3 1.3 0 .25
	}


}


textures/base_wall2/runway_red
{
	q3map_lightimage textures/base_light/runway_red_glow
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/base_wall2/runway_red_glow
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}

	{
		map textures/base_wall2/runway_red
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/base_wall2/runwayb_red
		blendFunc add
		rgbGen identity
	}
}

textures/base_wall2/runway_blue
{
	q3map_lightimage textures/base_light/runway_blue_glow
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/base_wall2/runway_blue_glow
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}

	{
		map textures/base_wall2/runway_blue
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/base_wall2/runwayb_blue
		blendFunc add
		rgbGen identity
	}
}


textures/base_wall2/red_metal
{

	{
		map textures/base_wall/chrome_env2
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/red_metal
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall2/blue_line
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall2/blue_line_glow

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/blue_line
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall2/blue_line_glow
		blendFunc add
	//	rgbGen wave sin .5 .5 0 1
	}


}

textures/base_wall2/red_line
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall2/red_line_glow

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/red_line
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall2/red_line_glow
		blendFunc add
	//	rgbGen wave sin .5 .5 0 1
	}
}


textures/base_wall2/double_line_blue
{

	surfaceparm trans
	//surfaceparm nomipmap
	surfaceparm nolightmap

	{
		map textures/base_wall2/double_line_blue
		blendfunc blend
		rgbGen identity

	}

}

textures/base_wall2/double_line_red
{

	surfaceparm trans
	//surfaceparm nomipmap
	surfaceparm nolightmap

	{
		map textures/base_wall2/double_line_red
		blendfunc blend
		rgbGen identity

	}

}

textures/base_wall2/techfloor_kc_blue
{
     	surfaceparm	metalsteps
	surfaceparm 	alphashadow
	surfaceparm	nomarks

        {
		clampmap textures/base_wall2/zzztblue_kc
               	alphaFunc GE128
		tcmod rotate 360
		rgbgen wave sin .8 .2 0 2
		depthWrite
	}
        {
                clampmap textures/base_wall2/techfloor2_kc
		blendFunc blend
                tcmod rotate 180
		depthFunc equal
                tcMod stretch sin .8 0.1 0 .4
	        rgbGen identity
	}

	{
		map textures/base_wall2/techfloor_kc
                blendFunc blend
		depthFunc equal
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		depthFunc equal
		rgbgen identity
	}
	{
	        map textures/base_wall2/techfloor_kc_shadow
                blendfunc filter
	        rgbGen identity
	}


}


textures/base_wall2/techfloor_kc
{
     	surfaceparm	metalsteps
	surfaceparm 	alphashadow
	surfaceparm	nomarks

        {
		clampmap textures/base_wall2/zzztred_kc
               	alphaFunc GE128
		tcmod rotate 360
		rgbgen wave sin .8 .2 0 2
		depthWrite
	}
        {
                clampmap textures/base_wall2/techfloor2_kc
		blendFunc blend
                tcmod rotate 180
		depthFunc equal
                tcMod stretch sin .8 0.1 0 .4
	        rgbGen identity
	}

	{
		map textures/base_wall2/techfloor_kc
                blendFunc blend
		depthFunc equal
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		depthFunc equal
		rgbgen identity
	}
	{
	        map textures/base_wall2/techfloor_kc_shadow
                blendfunc filter
	        rgbGen identity
	}


}

textures/base_wall2/floorvent01_kc
{

	//surfaceparm nomipmap
	surfaceparm alphashadow


	{
		map textures/base_wall2/floorvent01_kc
		blendfunc blend
		rgbGen identity

	}

}

textures/base_wall2/icon_pagans
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/icon_pagans
		blendfunc blend
		rgbGen identity

	}


}
textures/base_wall2/redrust
{

	surfaceparm trans
	surfaceparm nolightmap


	{
		map textures/base_wall2/redrust
		blendfunc blend
		rgbGen identity

	}


}

textures/base_wall2/blue_arrow_small
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/blue_arrow_small
		blendfunc blend
		rgbGen identity

	}


}
textures/base_wall2/red_arrow_small
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/red_arrow_small
		blendfunc blend
		rgbGen identity

	}


}



textures/base_wall2/yellow_arrow
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/yellow_arrow
		blendfunc blend
		rgbGen identity

	}


}


textures/base_wall2/yellow_circle
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/yellow_circle
		blendfunc blend
		rgbGen identity

	}


}

textures/base_wall2/red_circle
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/red_circle
		blendfunc blend
		rgbGen identity

	}


}

textures/base_wall2/blue_circle
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/blue_circle
		blendfunc blend
		rgbGen identity

	}


}


textures/base_wall2/name_vortex
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap

	{
		map textures/base_wall2/name_vortex
		blendfunc blend
		rgbGen identity
	}

}


textures/base_wall2/bluearrows
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/bluearrows
		blendfunc add
		rgbGen identity

	}


}

textures/base_wall2/redarrows
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/redarrows
		blendfunc add
		rgbGen identity

	}


}

textures/base_wall2/cautionstripe
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/cautionstripe
		blendfunc blend
		rgbGen identity

	}


}



textures/base_wall2/blue_red_stripe
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall2/blue_red_stripe

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/blue_red_stripe
		blendFunc filter
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall2/blue_red_stripe
		blendFunc add
		rgbGen wave sin .25 .25 0 1
	}


}

textures/base_wall2/red_solid
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall2/red_solid

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/red_solid
		blendFunc filter
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall2/red_solid
		blendFunc add
		rgbGen wave sin .25 .25 0 1
	}


}

textures/base_wall2/blue_solid
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall2/blue_solid

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/base_wall2/blue_solid
		blendFunc filter
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall2/blue_solid
		blendFunc add
		rgbGen wave sin .25 .25 0 1
	}


}
