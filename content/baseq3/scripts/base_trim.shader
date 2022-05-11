textures/base_trim/pj_launcher
{
        {
        	 map textures/base_trim/pj_launcher2
        	 tcmod scroll 0 2
                 rgbGen identity
        }
        {
        	 map textures/base_trim/pj_launcher
        	 blendfunc blend
                 rgbGen identity
        }
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/base_trim/pewter_nonsolid
{
	qer_editorimage textures/base_trim/dirty_pewter
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/base_trim/dirty_pewter
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/base_trim/proto_comp
{
        {
        	 map textures/base_trim/proto_comp2
        	 tcmod scroll 0 -.2
        	 rgbGen wave sin .5 .5 0 3
                 rgbGen identity
        }
        {
        	 clampmap textures/sfx/console03
        	 tcmod rotate -33
                 tcMod stretch sin .8 0 0 0
                 blendfunc add
                 rgbGen wave sin .6 0 0 0
        }
        {
        	 clampmap textures/sfx/console02
        	 tcmod rotate -333
                 tcMod stretch sin .8 0 0 0
                 blendfunc add
                 rgbGen wave sin .3 0 0 0
        }
        {
        	 map textures/effects/tinfx2c
        	 tcGen environment
                 blendfunc add
                 rgbGen identity
        }
        {
        	 map textures/base_trim/proto_comp
        	 blendfunc blend
        }
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/base_trim/pewter_shiney
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/base_trim/pewter_shiney
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_trim/panel_glo
{

        {
                map textures/sfx/firegorre2

                tcMod turb 0 .6 0 0.06
                tcmod scale .53 .61
                tcmod scroll 0 4
                blendFunc GL_ONE GL_ZERO
                rgbGen wave sin 1 1 0 .1
	}
        {
		map textures/base_trim/panel_glo
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/spidertrim4
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/base_trim/spidertrim4
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/panel_shiny
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/base_trim/panel_shiny
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/spidertrim3
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/base_trim/spidertrim3
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/wires02
{
    cull disable
    surfaceparm alphashadow
    surfaceparm trans
        {
                map textures/base_trim/wires02
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
textures/base_trim/wires01
{
    cull disable
    surfaceparm alphashadow
    deformVertexes autoSprite2
    surfaceparm trans
        {
                map textures/base_trim/wires01
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
textures/base_trim/wires01_ass
{
    cull disable
    surfaceparm alphashadow
    deformVertexes autoSprite2
        {
                map textures/base_trim/wires01_ass
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
textures/base_trim/spiderbite
{

        {
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .3 0 .2
                tcmod scroll 6 .7
                tcmod scale .4 1
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_trim/spiderbite
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                tcMod stretch sin .8 0.4 0 .2
                tcmod scroll .3 0
	        rgbGen identity
	}
        {
	        map textures/base_trim/spiderbite
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                tcMod stretch sin .8 0.2 0 .1
                tcmod scroll -.5 0
	        rgbGen identity
	}
	{
	        map textures/base_trim/spiderbite
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/dark_tin2
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen vertex
	}
        {
		map textures/base_trim/dark_tin2
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}
textures/base_trim/dark_tin2_trans
{
	qer_editorimage textures/base_trim/dark_tin2
	surfaceparm nonsolid

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen vertex
	}
        {
		map textures/base_trim/dark_tin2
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}

textures/base_trim/skull_monitor
{

        {
                map textures/base_trim/skull_monitor
                tcMod turb 0 .05 0 .2
                rgbGen identity
	}
        {
                 map textures/sfx/text
                 blendFunc GL_ONE GL_ONE
                 tcmod scroll 1 0
                 rgbGen identity
	}
        {
                 map textures/effects/tinfx2
                 blendFunc GL_ONE GL_ONE
                 tcGen environment
                 rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}
textures/base_trim/deeprust_trans
{
	qer_editorimage textures/base_trim/deeprust
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/base_trim/deeprust
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/base_trim/yellow_rustc
{

	{
		map textures/base_wall/chrome_env
		tcgen environment
		tcmod scale .25 .25
		rgbGen identity
	}
	{
		map textures/base_trim/yellow_rustc
		blendFunc gl_one_minus_src_alpha gl_src_alpha
	//	alphagen lightingspecular
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}



}


textures/base_trim/panelbrn010w
{
	q3map_lightimage textures/base_trim/panelbrn010wfx

        {
		map textures/base_trim/panelbrn010w
        }

        {
		map textures/sfx/hologirl2
                tcmod scale .4 .4
                tcmod scroll 6 2
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
		map textures/base_trim/panelbrn010w
                blendfunc blend

	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_trim/pewter_spec
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_trim/pewter_spec
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
textures/base_trim/tin
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_trim/tin
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}

        {
		map textures/base_trim/tin
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/base_trim/dark_tin
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_trim/dark_tin
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}

        {
		map textures/base_trim/dark_tin
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_trim/techborder
{
	q3map_surfacelight 300
        q3map_lightimage textures/base_trim/techborder_fx
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/techborder
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/techborder_fx
                //tcmod scale  .1 1
                tcmod scroll .1 0

		blendfunc GL_ONE GL_ONE
	}
        {
		map textures/base_trim/techborder_fx
                tcmod scale  .1 1
                tcmod scroll .1 0

		blendfunc GL_ONE GL_ONE
	}
}
textures/base_trim/spiderbit
{
	q3map_lightimage textures/base_trim/spiderbit_fx
	q3map_surfacelight 100

        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_trim/spiderbit
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}
        {
		map textures/base_trim/spiderbit_fx
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .1 .5 0 7
	}

}
textures/base_trim/proto_fence
{
	surfaceparm trans
	cull none
        nopicmip

	{
		map textures/base_trim/proto_fence
		tcMod scale 3 3
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
textures/base_trim/border11light
{
	q3map_surfacelight 500
	Q3map_lightimage textures/base_trim/border11light.glow
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border11light
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border11light.glow
		blendfunc GL_ONE GL_ONE
		rgbgen wave sin .9 .1 0 10
	}
}

textures/base_trim/border11_250
{
	qer_editorimage textures/base_trim/border11light
	q3map_surfacelight 250
	q3map_lightimage textures/base_trim/border11light.glow
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border11light
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border11light.glow
		blendfunc GL_ONE GL_ONE
		rgbgen wave sin .9 .1 0 10
	}
}

textures/base_trim/border12b
{
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border12bfx
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_trim/border12b_pj
{
	qer_editorimage textures/base_trim/border12b
	q3map_surfacelight 150
	q3map_lightimage textures/base_trim/border12bfx
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border12bfx
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_trim/xborder12b
{
	qer_editorimage textures/base_trim/border12b
	q3map_surfacelight 100
	q3map_lightimage textures/base_trim/border12bfx
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border12bfx
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_trim/drag_glass1
{
// ************************************************************
// A reddish dragonish glass panel (temp)
// ************************************************************
	surfaceparm trans
	surfaceparm nolightmap
	{
		map textures/base_trim/drag_glass1
		blendFunc GL_ONE_MINUS_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/drag_glass1
		alphaFunc LT128
		blendfunc GL_DST_COLOR GL_ONE
	}
}
textures/base_trim/electricwall
{
	qer_editorimage textures/organics/wire02a_f
	light 1
q3map_surfacelight 400

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/organics/wire02a_f
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/sfx/electric2.blend
		rgbGen wave sin 0.6 1 0 2
	//	tcMod rotate 54
		tcMod scroll 0.53 0.43
		blendfunc GL_ONE GL_ONE
	}
}
//**********************************************************
//*    Electric wires with blue electical pattern dancing  *
//*    upon it giving off blue light			   *
//*    Created: 4/12/98 by Paul Jaquays                    *
//**********************************************************
textures/base_trim/electric_blue
{
	qer_editorimage textures/base_trim/electricwall_blue
	q3map_lightimage textures/sfx/electric2.blend
	q3map_globaltexture
	q3map_surfacelight 200

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/electricwall_blue
		tcMod scale 0.5 0.5
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/electricwall_blue
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/sfx/electric2.blend
		rgbGen wave sin 0.6 1 0 2
		tcMod scale 0.5 0.5
		tcMod rotate 54
		tcMod scroll 0.53 0.43
		blendfunc GL_ONE GL_ONE
	}
}
