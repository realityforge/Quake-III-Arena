// Mar.31.1999
// -----------
// Xian: Note to self, q3map_backsplash 0 0 is used to turn off light backsplash
// ---

//****************************************
//*   Border combining border7 and ceil39
//*   Created 5/1/99 by Paul Jaquays
//****************************************
textures/gothic_light/border7_ceil39b_10k
{
	qer_editorimage textures/gothic_light/border7_ceil39b.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil39b.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil39b.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
//****************************************
//*   Border combining border7 and ceil39
//*   Created 5/5/99 by Paul Jaquays
//****************************************
textures/gothic_light/border7_ceil39_6k
{
	qer_editorimage textures/gothic_light/border7_ceil39.png
	q3map_surfacelight 3700
	light 1
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil39.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border_ceil39.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/border7_ceil22a
{
	qer_editorimage textures/gothic_light/border7_ceil22a.png
	q3map_lightimage textures/gothic_light/border_ceil22a.blend.png
	q3map_surfacelight 200
	//light 1
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil22a.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border_ceil22a.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/border7_ceil30
{
	qer_editorimage textures/gothic_light/border7_ceil30.png
	q3map_lightimage textures/gothic_light/border_ceil30.blend.png
	q3map_surfacelight 200
	//	light 1
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil30.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border_ceil30.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light2_lrg_2k
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light2_lrg_1k
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.png
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light2_lrg_200
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.png
	q3map_surfacelight 200
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light2_lrg_500
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.png
	q3map_surfacelight 500
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/goth_lt2_lrg2k
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_15K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 15000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_20K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/gothic_light3_10K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_6K
{
//	q3map_backsplash 0 0
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 6000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_7K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 7000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_8K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 8000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/gothic_light3_5K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/gothic_light3_4K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light3_3k
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}

}
textures/gothic_light/gothic_light3_2K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 2000
	surfaceparm nomarks
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}

}
textures/gothic_light/gothic_light3_1K
{
	qer_editorimage textures/gothic_light/gothic_light3.png
	q3map_lightimage textures/gothic_light/gothic_light2_blend.png
	q3map_surfacelight 1000
	surfaceparm nomarks
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}

}

textures/gothic_light/gothic_light2_4K
{
	qer_editorimage textures/gothic_light/gothic_light2.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light2_1k
{
	qer_editorimage textures/gothic_light/gothic_light2.png
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light2_2K
{
	qer_editorimage textures/gothic_light/gothic_light2.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.png
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/pentagram_light1_1K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 1000
	//light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}


}

textures/gothic_light/pentagram_light1_2K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}
}

textures/gothic_light/pentagram_light1_3K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}
}

textures/gothic_light/pentagram_light1_4K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}
}

textures/gothic_light/pentagram_light1_5K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 5000
	q3map_flare flareShader
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}


}

textures/gothic_light/pentagram_light1_10K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}


}

textures/gothic_light/pentagram_light1_15K
{
	qer_editorimage textures/gothic_light/pentagram_light1.png
	q3map_surfacelight 15000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


	{
		map textures/gothic_light/pentagram_light1_blend.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}


}


textures/gothic_light/ironcrossltred_2000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_3000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_4000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_5000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrossltred_10000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_20000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrossltred_30000
{
	qer_editorimage textures/gothic_light/ironcrossltred.png
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.png
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/ironcrossltblue_2000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_3000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_4000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_5000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_10000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_20000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_30000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.png
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.png
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.png
		blendfunc GL_ONE GL_ONE
	}
}



textures/gothic_light/crosslt1
{
	light 1
	q3map_surfacelight 3250
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/crosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/crosslt1.blend.png
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/light1_6Kgothicred
{
	qer_editorimage textures/base_light/light1red.png
	q3map_lightimage textures/base_light/light1red.blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	//q3map_surfacelight 4000
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
		rgbGen wave sin 0.25 0.25 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/light1_4Kgothic
{
	qer_editorimage textures/base_light/light1.png
	q3map_lightimage textures/base_light/light1.blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	//q3map_surfacelight 4000
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
		rgbGen wave sin 0.25 0.25 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/light1_6Kgothic
{
	qer_editorimage textures/base_light/light1.png
	q3map_lightimage textures/base_light/light1.blend.png
	q3map_surfacelight 6000
	light 1
	surfaceparm nomarks
	//q3map_surfacelight 4000
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
		rgbGen wave sin 0.25 0.25 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_2500
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 3500
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_1000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_2000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_120000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 120000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_500000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 500000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_3000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_4000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_5000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_10000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_20000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_30000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_40000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.png
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.png
	q3map_surfacelight 40000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_2000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 2000
	//light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/ironcrosslt2_2500
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 2500
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt2_3000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_4000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_5000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt2_10000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt2_20000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_30000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_40000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 40000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/ironcrosslt2_1000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.png
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.png
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.png
		blendfunc GL_ONE GL_ONE
	}
}
