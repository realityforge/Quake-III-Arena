textures/base_floor/concfloor_rain

	{

		tessSize 32
		deformVertexes normal 1 15

		{
			map textures/base_floor/concfloor_rain.png
                        rgbGen identity
                }
                {
			map textures/liquids/pj_e3_reflection2b.png
                        //map textures/liquids/pool3d_6_alpha.png
                        Blendfunc add
			tcgen environment
			rgbgen wave sin .3 0 0 0
			tcmod scale 2 2
			tcMod scroll .5 .5
		}
                {
		        map $lightmap
                        blendFunc filter
		        rgbGen identity
	        }


        }



textures/base_floor/techfloor2
{
        cull disable
        surfaceparm alphashadow
        surfaceparm nomarks
        //nomipmaps

        {
	        clampmap textures/base_floor/techfloor2.png
		alphaFunc GE128
                tcmod rotate 70
                tcMod stretch sin .8 0.2 0 .3
	        rgbGen identity
	}
        {
                clampmap textures/base_floor/techfloor2.png
                alphaFunc GE128
                tcmod rotate -50
                tcMod stretch sin .8 0.2 0 .2
                rgbGen identity
	}
        {
	        clampmap textures/base_floor/techfloor2.png
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
		map textures/sfx/proto_zzztpink.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        //clampmap textures/gothic_block/blocks18cgeomtrn2.png
                clampmap textures/base_floor/techfloor2.png
		blendFunc blend
                tcmod rotate 170
                tcMod stretch sin .8 0.2 0 .4
	        rgbGen identity
	}
        {
		map textures/base_floor/techfloor.png
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
		map textures/sfx/proto_zzztblu2.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/metalbridge04dbroke.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/sfx/proto_zzztblu2.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clang_floor_ow3.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/effects/envmapblue.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}

	{
	        map textures/base_floor/floor3_3dark_ow.png
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
		map textures/base_floor/proto_rustygrate2.png
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
                map textures/sfx/hologirl.png
                blendFunc add
                tcmod scale  1.2 .5
                tcmod scroll 3.1 1.1

        }
        {
                map textures/base_floor/cybergrate3.png
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
                map textures/base_floor/cybergrate2.png
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
		map textures/sfx/proto_zzztblu2.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clang_floor_ow.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/sfx/proto_zzztblu2.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clangdark_ow3.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map textures/base_floor/cybergrate.png
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
		map textures/sfx/proto_zzztblu2.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/diamond2c_ow.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/liquids/proto_grueldark2.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
	}

        {
		map textures/effects/tinfx3.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }

        {
		map textures/base_floor/diamond2cspot.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/liquids/protolava2.png
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_floor/clang_floor3blava.png
                blendfunc blend

	}

}
textures/base_floor/pool_side2
{


       	{
		map textures/liquids/pool3d_5e.png
		tcmod scale -.5 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/liquids/pool3d_6e.png
		blendFunc GL_one GL_ONE
		tcmod scale .5 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_floor/pool_side2.png
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
	qer_editorimage textures/base_wall/patch10rusty5.png

       	{
		map textures/liquids/pool3d_5e.png
		tcmod scale -.5 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/liquids/pool3d_6e.png
		blendFunc GL_one GL_ONE
		tcmod scale .5 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_wall/patch10rusty5.png
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
		map textures/liquids/pool3d_5e.png
		tcmod scale -.25 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0

	}

	{
		map textures/liquids/pool3d_6e.png
		blendFunc GL_one GL_ONE
		tcmod scale .25 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_floor/pool_floor2.png
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
	qer_editorimage textures/base_wall/patch10rusty5.png

        	{
		map textures/liquids/pool3d_5e.png
		tcmod scale -.25 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0

	}

	{
		map textures/liquids/pool3d_6e.png
		blendFunc GL_one GL_ONE
		tcmod scale .25 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_wall/patch10rusty5.png
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
		map textures/base_floor/hfloor3.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/effects/tinfx.png
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}

        {
		map textures/base_floor/hfloor3.png
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_floor/clangspot
{
     surfaceparm	metalsteps
     qer_editorimage textures/base_floor/clangdarkspot.png
        //{
	//	map textures/base_floor/clangspot.png
	//	rgbGen identity
	//}

        {
		map textures/liquids/proto_grueldark.png
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03

		tcMod turb 0 0.05 0 .05
                rgbGen identity
	}

        {
		map textures/effects/tinfx3.png
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                rgbGen identity
	}

        {
		map textures/base_floor/clangspot.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/liquids/proto_grueldark.png
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03

		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}

        {
		map textures/effects/tinfx3.png
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}

        {
		map textures/base_floor/clangspot2.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
	//	map textures/base_floor/clangdarkspot.png
	//	rgbGen identity
	//}

        {
		map textures/liquids/proto_grueldark.png
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03

		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}

        {
		map textures/effects/tinfx3.png
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}

        {
		map textures/base_floor/clangdarkspot.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/base_floor/tilefloor5.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_floor/tile5_plain
{
	qer_editorimage textures/base_floor/tilefloor5.png
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/tilefloor5.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_floor/concretefloor1
{

	{
		map textures/base_wall/chrome_env.png
		tcgen environment
		rgbgen wave sin .25 0 0 0
	}


	{
		map textures/base_floor/concretefloor1.png
		blendFunc GL_ZERO GL_SRC_ALPHA
		tcmod scale .1 .1
		rgbgen identity
	}

	{
		map textures/base_floor/concretefloor1.png
		blendFunc GL_ONE GL_SRC_ALPHA
		tcmod turb sin .5 1 0 1
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
	qer_editorimage textures/base_floor/proto_grate5.png
	surfaceparm	metalsteps
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES


	{
		map textures/base_floor/proto_grate5.png
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
	qer_editorimage textures/base_floor/clang_floor.png
	surfaceparm metalsteps
	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_floor/clang_floor.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity

	}

}

textures/base_floor/clang_floorshiny2
{
	qer_editorimage textures/base_floor/clang_floor.png

	{
		map $lightmap
               	tcGen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_floor/clang_floorshiny_alpha2.png
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
	qer_editorimage textures/base_floor/clang_floor.png

	{
		map textures/effects/tinfx3.png
               	tcGen environment
		//tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_floor/clang_floorwet.png
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
	qer_editorimage textures/base_floor/clang_floor.png

	{
		map $lightmap
               	tcGen environment
		tcmod scale .25 .25
	}


	{
		map textures/base_floor/clang_floorshiny_alpha.png
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
	q3map_lightimage textures/base_floor/tilefloor7_owfx.png
	q3map_surfacelight 100

        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_floor/tilefloor7_ow.png
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}
        {
		map textures/base_floor/tilefloor7_owfx.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 2 0 7
	}
        {
		map textures/base_floor/tilefloor7_owfx.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}

}
textures/base_floor/skylight1
{
	q3map_lightimage textures/base_floor/skylight1_lm.png
	q3map_surfacelight 100

        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_floor/skylight1.png
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}
        {
		map textures/base_floor/skylight1_lm.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .2 2 0 7.7
	}
        {
		map textures/base_floor/skylight1_lm.png
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
		map textures/base_floor/skylight_spec.png
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
	qer_editorimage textures/base_floor/diamond2.png
	q3map_globaltexture
	surfaceparm metalsteps
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/base_floor/grunge2.png
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 0.0693 0.0712
        }
	{
		map textures/base_floor/diamond2.png
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
		map textures/base_floor/clangdark.png
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
		map textures/base_floor/clangdark_ow.png
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
		map textures/base_floor/diamond2.png
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
		map textures/base_floor/proto_grate.png
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
		map textures/base_floor/proto_grate2.png
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
		map textures/base_floor/proto_grate3.png
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
		map textures/base_floor/proto_grate4.png
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
		map textures/base_floor/kc_grate4b.png
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
		map textures/base_floor/proto_grate5.png
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
		map textures/base_floor/proto_skullgrate.png
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
		map textures/base_floor/proto_rustygrate.png
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
		map textures/base_floor/rusty_pentagrate.png
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
		map textures/base_floor/rusty_baphograte.png
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
		map textures/base_floor/rusty_baphograte2.png
		blendFunc GL_ONE GL_ONE
		rgbgen wave inversesawtooth 0 1 .2 .5
	}
        {
		map textures/base_floor/rusty_baphograte3.png
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
		map textures/base_floor/pjgrate1.png
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
		map textures/base_floor/pjgrate2.png
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
	q3map_lightimage base_floor/glowfloor2.png


	// GLOWING RED Floor Color on metalfloor_wall_15
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/metalfloor_wall_15.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_floor/glowred1.blend.png
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
		map textures/base_floor/diamond2.png
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_floor/glowred1.blend.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}

textures/base_floor/nomarkstone_1
{
	qer_editorimage textures/base_floor/nomarkstone.png
	q3map_lightimage textures/base_floor/smallstone.png
	q3map_globaltexture
	surfaceparm nomarks
	surfaceparm noimpact

	// A stone that isn't marked by weapons. Used below red fog in pj_dm10
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/smallstone.png
		tcMod scale 2 2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
