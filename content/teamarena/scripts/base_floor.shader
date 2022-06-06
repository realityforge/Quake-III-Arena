textures/base_floor/techfloor2
{
        cull disable
        surfaceparm alphashadow
        surfaceparm nomarks
        //nomipmaps

        {
	        clampmap textures/base_floor/techfloor2
		alphaFunc GE128
                tcmod rotate 70
                tcMod stretch sin .8 0.2 0 .3
	        rgbGen identity
	}
        {
                clampmap textures/base_floor/techfloor2
                alphaFunc GE128
                tcmod rotate -50
                tcMod stretch sin .8 0.2 0 .2
                rgbGen identity
	}
        {
	        clampmap textures/base_floor/techfloor2
		alphaFunc GE128
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}
textures/base_floor/techfloor
{
     surfaceparm	metalsteps

        {
		map textures/sfx/proto_zzztpink
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        //clampmap textures/gothic_block/blocks18cgeomtrn2
                clampmap textures/base_floor/techfloor2
		blendFunc blend
                tcmod rotate 170
                tcMod stretch sin .8 0.2 0 .4
	        rgbGen identity
	}
        {
		map textures/base_floor/techfloor
                blendFunc blend
		rgbGen identity
	}

        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
                depthFunc equal
       }
}
textures/base_floor/metalbridge04dbroke
{
     surfaceparm	metalsteps

        {
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/metalbridge04dbroke
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_floor/clang_floor_ow3
{
     surfaceparm	metalsteps

        {
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clang_floor_ow3
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/floor3_3dark_ow
{

        {
		map textures/effects/envmapblue
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}

	{
	        map textures/base_floor/floor3_3dark_ow
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/base_floor/proto_rustygrate2
{
	surfaceparm	metalsteps
        surfaceparm trans
	surfaceparm alphashadow
	cull none
        nopicmip
	// A RUSTY GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_rustygrate2
		// tcMod scale 2 2
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
textures/base_floor/cybergrate3
{
    cull disable
    surfaceparm alphashadow
    surfaceparm	metalsteps
    surfaceparm nomarks
        {
                map textures/sfx/hologirl
                blendFunc add
                tcmod scale  1.2 .5
                tcmod scroll 3.1 1.1

        }
        {
                map textures/base_floor/cybergrate3
                alphaFunc GE128
		depthWrite
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_floor/cybergrate2
{
    cull disable
    surfaceparm alphashadow
    surfaceparm	metalsteps
    surfaceparm nomarks
        {
                map textures/base_floor/cybergrate2
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
textures/base_floor/clang_floor_ow
{
     surfaceparm	metalsteps

        {
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clang_floor_ow
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_floor/clangdark_ow3
{
     surfaceparm	metalsteps

        {
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clangdark_ow3
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/cybergrate
{
    cull disable
    surfaceparm alphashadow
    surfaceparm	metalsteps
    surfaceparm nomarks
        {
                map textures/base_floor/cybergrate
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
textures/base_floor/diamond2c_ow
{
     surfaceparm	metalsteps

        {
		map textures/sfx/proto_zzztblu2
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/diamond2c_ow
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/diamond2cspot
{
     surfaceparm	metalsteps

        {
		map textures/liquids/proto_grueldark2
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
	}

        {
		map textures/effects/tinfx3
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }

        {
		map textures/base_floor/diamond2cspot
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/clang_floor3blava
{
	surfaceparm nolightmap
        {
		map textures/liquids/protolava2
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_floor/clang_floor3blava
                blendfunc blend

	}

}
textures/base_floor/pool_side2
{


       	{
		map textures/liquids/pool3d_5e
		tcmod scale -.5 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/liquids/pool3d_6e
		blendFunc GL_one GL_ONE
		tcmod scale .5 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_floor/pool_side2
		blendFunc GL_one GL_src_color
		tcmod scale .5 .5
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}


}
textures/base_floor/pool_side3
{
	qer_editorimage textures/base_wall/patch10rusty5

       	{
		map textures/liquids/pool3d_5e
		tcmod scale -.5 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/liquids/pool3d_6e
		blendFunc GL_one GL_ONE
		tcmod scale .5 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_wall/patch10rusty5
		blendFunc GL_one GL_src_color
		tcmod scale .5 .5
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}


}
textures/base_floor/pool_floor2
{


        	{
		map textures/liquids/pool3d_5e
		tcmod scale -.25 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0

	}

	{
		map textures/liquids/pool3d_6e
		blendFunc GL_one GL_ONE
		tcmod scale .25 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_floor/pool_floor2
		blendFunc GL_one GL_src_color
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}


}
textures/base_floor/pool_floor3
{
	qer_editorimage textures/base_wall/patch10rusty5

        	{
		map textures/liquids/pool3d_5e
		tcmod scale -.25 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0

	}

	{
		map textures/liquids/pool3d_6e
		blendFunc GL_one GL_ONE
		tcmod scale .25 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_wall/patch10rusty5
		blendFunc GL_one GL_src_color
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}


}


textures/base_floor/hfloor3
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/hfloor3
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
		map textures/base_floor/hfloor3
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_floor/clangspot
{
     surfaceparm	metalsteps
     qer_editorimage textures/base_floor/clangdarkspot
        //{
	//	map textures/base_floor/clangspot
	//	rgbGen identity
	//}

        {
		map textures/liquids/proto_grueldark
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03

		tcMod turb 0 0.05 0 .05
                rgbGen identity
	}

        {
		map textures/effects/tinfx3
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                rgbGen identity
	}

        {
		map textures/base_floor/clangspot
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/clangspot2
{
     surfaceparm	metalsteps

        {
		map textures/liquids/proto_grueldark
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03

		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}

        {
		map textures/effects/tinfx3
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}

        {
		map textures/base_floor/clangspot2
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/clangdarkspot
{
     surfaceparm	metalsteps
        //{
	//	map textures/base_floor/clangdarkspot
	//	rgbGen identity
	//}

        {
		map textures/liquids/proto_grueldark
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03

		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}

        {
		map textures/effects/tinfx3
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}

        {
		map textures/base_floor/clangdarkspot
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/tilefloor5
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/tilefloor5
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_floor/tile5_plain
{
	qer_editorimage textures/base_floor/tilefloor5
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/tilefloor5
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_floor/concretefloor1
{

	{
		map textures/base_wall/chrome_env
		tcgen environment
		rgbgen wave sin .25 0 0 0
	}


	{
		map textures/base_floor/concretefloor1
		blendFunc GL_ZERO GL_SRC_ALPHA
		tcmod scale .1 .1
		rgbgen identity
	}

	{
		map textures/base_floor/concretefloor1
		blendFunc GL_ONE GL_SRC_ALPHA
		tcmod turb .5 1 0 1
		rgbgen identity
	}


	{
		map $lightmap
        	blendfunc gl_dst_color gl_zero
		rgbgen identity
	}




}

textures/base_floor/pjgrate1kc
{
	qer_editorimage textures/base_floor/proto_grate5
	surfaceparm	metalsteps
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES


	{
		map textures/base_floor/proto_grate5
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

textures/base_floor/clangfloor_noisy
{
	qer_editorimage textures/base_floor/clang_floor
	surfaceparm metalsteps
	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_floor/clang_floor
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity

	}

}

textures/base_floor/clang_floorshiny2
{
	qer_editorimage textures/base_floor/clang_floor

	{
		map $lightmap
               	tcGen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_floor/clang_floorshiny_alpha2
		blendFunc GL_ONE GL_SRC_ALPHA
		alphagen wave triangle .98 .02 0 10
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}
textures/base_floor/clang_floorwet
{
	qer_editorimage textures/base_floor/clang_floor

	{
		map textures/effects/tinfx3
               	tcGen environment
		//tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_floor/clang_floorwet
		blendFunc GL_ONE GL_SRC_ALPHA
		//alphagen wave triangle .98 .02 0 10
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}


textures/base_floor/clang_floorshiny
{
	qer_editorimage textures/base_floor/clang_floor

	{
		map $lightmap
               	tcGen environment
		tcmod scale .25 .25
	}


	{
		map textures/base_floor/clang_floorshiny_alpha
		blendFunc GL_ONE GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}


textures/base_floor/tilefloor7_ow
{
	q3map_lightimage textures/base_floor/tilefloor7_owfx
	q3map_surfacelight 100

        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_floor/tilefloor7_ow
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}
        {
		map textures/base_floor/tilefloor7_owfx
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 2 0 7
	}
        {
		map textures/base_floor/tilefloor7_owfx
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}

}
textures/base_floor/skylight1
{
	q3map_lightimage textures/base_floor/skylight1_lm
	q3map_surfacelight 100

        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_floor/skylight1
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}
        {
		map textures/base_floor/skylight1_lm
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .2 2 0 7.7
	}
        {
		map textures/base_floor/skylight1_lm
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .2 5 1 5.1
	}

}
/////////////////////////////
//     Shiny Skylight      //
/////////////////////////////

textures/base_floor/skylight_spec
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/skylight_spec
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
//
//***************************************************************
//  This texture has a detail layer that is used to apply a
//  smeary, dirty overlay to the diamond metal floor texture
//***************************************************************
textures/base_floor/diamond_dirty
{
	qer_editorimage textures/base_floor/diamond2
	q3map_globaltexture
	surfaceparm metalsteps
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/base_floor/grunge2
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 0.0693 0.0712
        }
	{
		map textures/base_floor/diamond2
		tcMod scale 0.5 0.5
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

}
textures/base_floor/clangdark
{
	surfaceparm	metalsteps

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/clangdark
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_floor/clangdark_ow
{
	surfaceparm	metalsteps

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/clangdark_ow
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_floor/diamond_noisy
{
	surfaceparm	metalsteps

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/diamond2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/base_floor/proto_grate
{
	surfaceparm	metalsteps
        surfaceparm trans
	cull none
        nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate
		//tcMod scale 2 2
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
textures/base_floor/proto_grate2
{
	surfaceparm	metalsteps
        surfaceparm trans
	cull none
        nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate2
		//tcMod scale 2 2
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
textures/base_floor/proto_grate3
{
	surfaceparm	metalsteps
        surfaceparm trans
	cull none
        nopicmip
	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate3
		//tcMod scale 2 2
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
textures/base_floor/proto_grate4
{
	surfaceparm	metalsteps
        surfaceparm trans
	surfaceparm nonsolid  //Tim's fuckage
	cull none
        nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate4
		//tcMod scale 2 2
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

textures/base_floor/kc_grate4b
{
	surfaceparm	metalsteps
	surfaceparm alphashadow
        surfaceparm trans
	surfaceparm nonsolid
	cull none
       // nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/kc_grate4b
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


textures/base_floor/proto_grate5
{
	surfaceparm	metalsteps
        surfaceparm trans
	cull none
        nopicmip
	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate5
		//tcMod scale 2 2
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
textures/base_floor/proto_skullgrate
{
	surfaceparm	metalsteps
        surfaceparm trans
	cull none
        nopicmip
	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_skullgrate
		//tcMod scale 2 2
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
textures/base_floor/proto_rustygrate
{
	surfaceparm	metalsteps
    surfaceparm trans
	surfaceparm alphashadow
	cull none
        nopicmip
	// A RUSTY GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_rustygrate
		// tcMod scale 2 2
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
textures/base_floor/rusty_pentagrate
{
	surfaceparm	metalsteps
    surfaceparm trans
    surfaceparm alphashadow

	cull none
    nopicmip
	// A RUSTY and Eeevil grate THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/rusty_pentagrate
		// tcMod scale 2 2
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
textures/base_floor/rusty_baphograte
{
	surfaceparm	metalsteps
        surfaceparm trans
	cull none
        nopicmip
	// A RUSTY and Eeevil grate THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/rusty_baphograte
		// tcMod scale 2 2
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
        {
		map textures/base_floor/rusty_baphograte2
		blendFunc GL_ONE GL_ONE
		rgbgen wave inversesawtooth 0 1 .2 .5
	}
        {
		map textures/base_floor/rusty_baphograte3
		blendFunc GL_ONE GL_ONE
		rgbgen wave inversesawtooth 0 1 .4 .5
	}

}
textures/base_floor/pjgrate1
{
	surfaceparm	metalsteps
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/pjgrate1
		tcMod scale 2 2
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
textures/base_floor/pjgrate2
{
	surfaceparm	metalsteps
	cull none

	// A RUSTED GRATE THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/pjgrate2
		tcMod scale 2.0 2.0
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}
textures/base_floor/glowfloor2
{
	q3map_surfacelight 800
	q3map_lightimage base_floor/glowfloor2


	// GLOWING RED Floor Color on metalfloor_wall_15
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/metalfloor_wall_15
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_floor/glowred1_blend
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}
textures/base_floor/glowfloor3
{
	q3map_surfacelight 500

	// GLOWING RED Floor Color on Diamond2 floor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/diamond2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_floor/glowred1_blend
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}

textures/base_floor/nomarkstone_1
{
	qer_editorimage textures/base_floor/nomarkstone
	q3map_lightimage textures/base_floor/smallstone
	q3map_globaltexture
	surfaceparm nomarks
	surfaceparm noimpact

	// A stone that isn't marked by weapons. Used below red fog in pj_dm10
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/smallstone
		tcMod scale 2 2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
