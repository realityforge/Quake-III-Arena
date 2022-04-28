textures/base_light/runway
{
	q3map_lightimage textures/base_light/runway_glow.png
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/base_light/runway_glow.png
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}

	{
		map textures/base_light/runway.png
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/base_light/runwayb.png
		blendFunc add
		rgbGen identity
	}


}
textures/base_light/geolight
{
	q3map_lightimage textures/base_light/geolight_glow.png
	surfaceparm nomarks
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/geolight.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_light/geolight_glow.png
		blendFunc add
		rgbgen wave sin .575 .025 0 10
	}

}



textures/base_light/dm18twr
{
	q3map_lightimage textures/base_light/dm18twr_glow.png
	surfaceparm nomarks
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/dm18twr.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_light/dm18twr_glow.png
		blendFunc add
		rgbgen wave sin .575 .025 0 10
	}

}
textures/base_light/proto_lightgreen
{
	q3map_lightimage textures/base_light/proto_lightgreen.png
	surfaceparm nomarks
	q3map_surfacelight 300
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightgreen.png
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightgreen.png
		blendFunc add
	}

}
textures/base_light/cornerlight
{
	q3map_lightimage textures/base_light/cornerlight.glow.png
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map textures/base_light/cornerlight.png
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_light/cornerlight.glow.png
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}
}


textures/base_light/trianglelight
{
	q3map_lightimage textures/base_light/trianglelight.blend.png
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map textures/base_light/trianglelight.png
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_light/trianglelight.blend.png
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}


}

textures/base_light/proto_bulb
{
    deformVertexes autoSprite2
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

        {
                map textures/base_light/proto_bulb.png
                blendFunc GL_ONE GL_ONE

        }


}
textures/base_light/shi
{
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull disable
	{
		map textures/base_light/shi.png
		blendFunc GL_ONE GL_ONE
                tcmod scale .5 .5
		rgbgen wave triangle 1 5.1 1 3
	}

        {
		map textures/base_light/shi.png
		blendfunc GL_ONE GL_ONE
                tcmod scale .5 .5
                rgbgen wave triangle 1 2 0 7.3
	}
}
textures/base_light/proto_light
{
	q3map_lightimage textures/base_light/proto_lightmap.png
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightmap.png
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {
		map textures/base_light/proto_light2.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {
		map textures/base_light/proto_light2.png
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}
textures/base_light/proto_lightred
{
	q3map_lightimage textures/base_light/proto_lightred.png
	surfaceparm nomarks
	q3map_surfacelight 300
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightred.png
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightred.png
		blendFunc add
	}

}

textures/base_light/proto_lightred2
{
	q3map_lightimage textures/base_light/proto_lightred.png
	qer_editorimage textures/base_light/proto_lightred.png
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightred.png
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightred.png
		blendFunc add
		rgbGen wave square .5 .5 0 1
	}

}

textures/base_light/proto_light_2k
{
	qer_editorimage textures/base_light/proto_light.png
	q3map_lightimage textures/base_light/proto_lightmap.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightmap.png
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {
		map textures/base_light/proto_light2.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {
		map textures/base_light/proto_light2.png
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}


textures/base_light/s_proto_light
{
	q3map_lightimage textures/base_light/s_proto_lightmap.png
	surfaceparm nomarks
	q3map_surfacelight 100
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightmap.png
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {
		map textures/base_light/proto_light2.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {
		map textures/base_light/proto_light2.png
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}
textures/base_light/scrolllight
{
	q3map_lightimage textures/sfx/scrolllight2.png
	q3map_surfacelight 100

        {
		map $lightmap
		rgbGen identity
	}
        {
		Map textures/base_light/scrolllight.png
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}
        {
		Map textures/base_light/scrolllight2.png
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1 0
	}
        {
      	        Map textures/base_light/scrolllight2.png
      	        blendFunc GL_ONE GL_ONE
                tcmod scroll -2 0
        }


}
textures/base_light/lightflare_wht500
{
	qer_editorimage textures/base_light/light_flare.png
	q3map_lightimage textures/base_light/light1.blend.png
	deformVertexes autoSprite
	q3map_surfacelight	500
	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map textures/base_light/light_flare.png
		blendFunc GL_ONE GL_ONE
	}

}
textures/base_light/lightflare_500
{
	qer_editorimage textures/base_light/light_flare.png
	deformVertexes autoSprite
	q3map_surfacelight	500
	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map textures/base_light/light_flare.png
		blendFunc GL_ONE GL_ONE
	}

}
textures/base_light/border7_ceil50
{
	qer_editorimage textures/base_light/border7_ceil50.png
	q3map_surfacelight 100
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border7_ceil50.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border7_ceil50glow.png
		blendfunc GL_ONE GL_ONE
	}
}



textures/base_light/ceil1_38_10k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_20k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 20000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_30k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 30000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_40k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 40000
	light 1
	// Square dirty white light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_50k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 50000
	light 1
	// Square dirty white light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_38_70k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 70000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_90k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 90000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/light1dark
{
	qer_editorimage textures/base_light/light1.png
	q3map_lightimage textures/base_light/light1.blend.png
	surfaceparm nomarks
	q3map_surfacelight 6000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light1red_2000
{
	qer_editorimage textures/base_light/light1red.png
	q3map_lightimage textures/base_light/light1red.blend.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1red.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1red_5000
{
	qer_editorimage textures/base_light/light1red.png
	q3map_lightimage textures/base_light/light1red.blend.png
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1red.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_5000
{
	qer_editorimage textures/base_light/light1blue.png
	q3map_lightimage textures/base_light/light1blue.blend.png
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light1blue_2000
{
	qer_editorimage textures/base_light/light1blue.png
	q3map_lightimage textures/base_light/light1blue.blend.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light2blue_2500
{
	qer_editorimage textures/base_light/light1blue.png
	q3map_lightimage textures/base_light/light1blue1.blend.png
	surfaceparm nomarks
	q3map_surfacelight 2500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1blue1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light1blue_800
{
	qer_editorimage textures/base_light/light1blue.png
	q3map_lightimage textures/base_light/light1blue.blend.png
	surfaceparm nomarks
	q3map_surfacelight 800
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_1500
{
	qer_editorimage textures/base_light/light1blue.png
	q3map_lightimage textures/base_light/light1blue.blend.png
	surfaceparm nomarks
	q3map_surfacelight 1500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_5000
{
	qer_editorimage textures/base_light/light1.png
	q3map_lightimage textures/base_light/light1.blend.png
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_3000
{
	qer_editorimage textures/base_light/light1.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.png
		//rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_1500
{
	qer_editorimage textures/base_light/light1.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.png
		//rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt2_8000
{
	qer_editorimage textures/base_light/light2.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 8000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt2_4000
{
	qer_editorimage textures/base_light/light2.png
	//light 1
	surfaceparm nomarks
	q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt2_2000
{
	qer_editorimage textures/base_light/light2.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.png
		rgbGen wave sin 0.6 0.1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light3b_2500
{
	qer_editorimage textures/base_light/light3b.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light3b.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light3b.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light4_2500
{
	qer_editorimage textures/base_light/light4.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light4.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light4.blend.png
		rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light5_3000
{
	qer_editorimage textures/base_light/light5.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 3000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.blend.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_5k
{
	qer_editorimage textures/base_light/light5.png
	//light 1
	surfaceparm nomarks
	surfaceparm nolightmap
	q3map_backsplash 0 0
	q3map_surfacelight 5000
	{
		map textures/base_light/light5.png
		rgbGen identity
	}
//	{
//		map textures/base_light/light5.blend.png
//		blendFunc GL_ONE GL_ONE
//	}
}

textures/base_light/light5_10k
{
	qer_editorimage textures/base_light/light5.png
	q3map_lightimage textures/base_light/xlight5.blend.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 10000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.blend.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_15k
{
	qer_editorimage textures/base_light/light5.png
	q3map_lightimage textures/base_light/light5.blend.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 15000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light5.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_20k
{
	qer_editorimage textures/base_light/light5.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 20000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light5.blend.png
		blendFunc GL_ONE GL_ONE
	}
}


textures/base_light/lt6_2500
{
	qer_editorimage textures/base_light/light6.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light6.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light6.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light6_2500
{
	qer_editorimage textures/base_light/light6.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light6.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light6.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt6_2p5k
{
	qer_editorimage textures/base_light/light6.png
	light 1
	surfaceparm nomarks
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light6.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light6.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/patch10_pj_lite
{
	q3map_surfacelight 2500
	surfaceparm nomarks
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/patch10_pj_lite2
{
	q3map_surfacelight 2000
	surfaceparm nomarks
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.blend.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/patch10_pj_lite2_1000
{
	qer_editorimage textures/base_light/patch10_pj_lite2.png
	q3map_surfacelight 1000
	surfaceparm nomarks
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.blend.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/steedmetallight
{
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/steedmetallight.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/steedmetallight.blend.png
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/border11light
{
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border11light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border11light.blend.png
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/border11light_300
{
	qer_editorimage textures/base_light/border11light.png
	q3map_lightimage textures/base_light/border11light.blend.png

	q3map_surfacelight 235
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border11light.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border11light.blend.png
		blendFunc GL_ONE GL_ONE
	}
}


textures/base_light/sm_light1red
{
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1red.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1red.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/sm_light1blue
{
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1blue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1blue.blend.png
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/wstlt1_5
{
	q3map_surfacelight 2000
	surfaceparm nomarks
	light 1

	// older wall lamp
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/pj_wstlt1_3k
{
	qer_editorimage textures/base_light/wstlt1_5.png
	q3map_lightimage textures/base_light/wstlt1_5.blend.png
	q3map_surfacelight 3000
	surfaceparm nomarks
	light 1

	// older wall lamp
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/baslt3_1_2K
{
	qer_editorimage textures/base_light/baslt3_1.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	//light 1

	// Fluorescent light from Q2
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt3_1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt3_1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/baslt4_1_2k
{
	qer_editorimage textures/base_light/baslt4_1.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	//light 1

	// New Fluorescent light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/baslt4_1_4k
{
	qer_editorimage textures/base_light/baslt4_1.png
	surfaceparm nomarks
	q3map_surfacelight 4000
	//light 1

	// New Fluorescent light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_37
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Modified light blue ceil light from Q2
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_37.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_37.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_2
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_22a
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	//	A red-orange ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_22a_trans
{
	qer_editorimage textures/base_light/ceil1_22a.png
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 10000
	light 1
	//	A red-orange ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_22a_8k
{
	surfaceparm nomarks
	qer_editorimage textures/base_light/ceil1_22a
	q3map_surfacelight 8000
	light 1
	//	A red-orange ceiling light (wattage 8k)
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_4
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	//	A yellow ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_4.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_4.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_3
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	//	A red ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_3.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_35
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square green light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_35.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_35.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_30
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square rich blue light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_30_trans
{
	qer_editorimage textures/base_light/ceil1_30.png
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 10000
	light 1
	// Square rich blue light non-solid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/ceil1_30_8k
{
	surfaceparm nomarks
	qer_editorimage textures/base_light/ceil1_30
	q3map_surfacelight 8000
	light 1
	// Square rich blue light (8k light wattage
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_31
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square magenta light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_31.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_31.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_32
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square violet light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_32.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_32.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_33
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square golden yellow light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_33.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_33.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_34
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_5k
{
	qer_editorimage textures/base_light/ceil1_34.png
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_10k
{
	qer_editorimage textures/base_light/ceil1_34.png
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_2k
{
	qer_editorimage textures/base_light/ceil1_34.png
	q3map_lightimage textures/base_light/ceil1_34.blend.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_1k
{
	qer_editorimage textures/base_light/ceil1_34.png
	q3map_lightimage textures/base_light/ceil1_34.blend.png
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/ceil_white5k
{
	qer_editorimage textures/base_light/ceil1_38.png
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_38
{
	surfaceparm nomarks
	q3map_surfacelight 2500
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/pjceil1_39_1K
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_39
{
	surfaceparm nomarks
	q3map_surfacelight 7500
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/pjceil1_39_1p5k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 1500
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/xceil1_39_2k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_5k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_10k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_15k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 15000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_20k
{
//	q3map_backsplash 0 0
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 20000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_30k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 30000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_50k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 50000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_70k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 70000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_90k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 90000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_110k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 110000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_500k
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 500000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}



textures/base_light/xceil1_39_1
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 20000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_a
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 30000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/xceil1_39_b
{
	qer_editorimage textures/base_light/ceil1_39.png
	surfaceparm nomarks
	q3map_surfacelight 40000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/jaildr01_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr01_3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr01_3.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr02_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr02_3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr02_3.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr03_1
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_1.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr03_2
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_2.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_light/jaildr1_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr2_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr2_3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr2_3.blend.png
//		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/wsupprt1_12
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	//light1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/wsupprt1_12h
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	//light1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12h.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12h.blend.png
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_26
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light1
}
textures/base_light/ceil1_28
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light1
}
textures/base_light/ceil1_6
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light1
}
textures/base_light/tlight05
{
	surfaceparm nomarks
	q3map_surfacelight 5000
	light1
}

textures/base_light/invisi_light1
{
	qer_editorimage base_light/ceil1_30.png
	qer_trans 50
	//surfaceparm nodraw
	surfaceparm nomarks
	q3map_surfacelight 50000
	light 1
	// Square blue light

}
