textures/gothic_trim/x_noblight
{
   q3map_lightimage textures/gothic_trim/x_noblightfx
   q3map_surfacelight 100
        {
                map textures/sfx/firegorre2
                tcmod scroll .1 1
                tcmod scale 1 1
	}
        {
		map textures/gothic_trim/x_noblight
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
		map textures/gothic_trim/x_noblightfx
                blendFunc add
		rgbGen wave sin .5 .5 0 .1
	}
}
textures/gothic_trim/zinc_shiny
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/gothic_trim/zinc_shiny
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_trim/chrome_rivet
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/gothic_trim/chrome_rivet
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_trim/km_arena1tower4fx
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/gothic_trim/km_arena1tower4fx
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_trim/km_arena1towerblue
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/gothic_trim/km_arena1towerblue
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
//textures/gothic_trim/metalbase09_b_blocks15
//{
//	{
//		map $lightmap
//		rgbGen identity
//	}
//
//
//       {
//		map textures/gothic_trim/metalbase09_b_blocks15
//                blendFunc GL_dst_color GL_SRC_ALPHA
//		alphagen lightingspecular
//		rgbGen identity
//	}
//
//}
//

textures/gothic_trim/column2c_trans
{
	qer_editorimage textures/gothic_trim/column2c_test
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_trim/column2c_test
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/gothic_trim/metalsupport4b_trans
{
	qer_editorimage textures/gothic_trim/metalsupport4b
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_trim/metalsupport4b
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/gothic_trim/metalsupport4j_trans
{
	qer_editorimage textures/gothic_trim/metalsupport4j
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_trim/metalsupport4j
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/gothic_trim/border6_trans
{
	qer_editorimage textures/gothic_trim/border6
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_trim/border6
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	}
}

textures/gothic_trim/pitted_rust2_trans
{
	qer_editorimage textures/gothic_trim/pitted_rust2
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_trim/pitted_rust2
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}
textures/gothic_trim/pitted_rust3_trans
{
	qer_editorimage textures/gothic_trim/pitted_rust3
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_trim/pitted_rust3
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/gothic_block/killtrim_trans
{
	qer_editorimage textures/gothic_block/killtrim
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_block/killtrim
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}

textures/gothic_trim/baseboard09_p_shiny
{


	{
		map $lightmap
	//	map textures/base_wall/chrome_env
	        rgbGen identity
	//	tcGen environment
	//	tcmod scale .25 .25
	}

	{
		map textures/gothic_trim/baseboard09_p_shiny
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphagen lightingspecular
	//	blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	//{
	//	map $lightmap
	//	blendfunc gl_dst_color gl_zero
	//	rgbGen identity
	//}
}


textures/gothic_trim/km_arena1tower4_shiny
{

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_trim/km_arena1tower4_shiny
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}



textures/gothic_trim/metalsupport4h_shiny
{

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_trim/metalsupport4h_shiny
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/gothic_trim/metalsupport4h_trans
{
	qer_editorimage textures/gothic_trim/metalsupport4h_shiny
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_trim/metalsupport4h_shiny
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/gothic_trim/supportborderside_shiney
{
	qer_editorimage textures/gothic_trim/xsupportborderside_shiney
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_trim/xsupportborderside_shiney
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/gothic_trim/metlsupport4i_shiney
{
	qer_editorimage textures/gothic_trim/xmetalsupport4i_alpha
	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/gothic_trim/xmetalsupport4i_alpha
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}


}

textures/gothic_trim/barbedwire
{
        surfaceparm trans
	cull disable

	// RUSTY Barbed wire
	{
		map textures/gothic_trim/barbedwire
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
textures/gothic_button/timbutton
	{
	q3map_lightimage textures/gothic_button/timbutton2
	q3map_surfacelight 10
	//light 1

		{
			map textures/gothic_button/timbutton
		}


		{
			map $lightmap
			blendfunc gl_dst_color gl_zero
			rgbgen identity
		}

		{
			map textures/gothic_button/timbutton2
			blendfunc add
			rgbgen wave sin .5 .5 0 1
		}

	}



textures/gothic_wall/window_evil6a

{
	q3map_lightimage textures/gothic_wall/window_evil6a_glow
	q3map_surfacelight 50
	//light 1

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil6a
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil6a_glow
		blendfunc add
		rgbGen identity
	}

}

textures/gothic_wall/window_evil7

{
	q3map_lightimage textures/gothic_wall/window_evil7_glow
	q3map_surfacelight 300
	//light 1

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil7
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil7_glow
		blendfunc add
		rgbGen identity
	}

}


textures/gothic_wall/glass_stained1

{

	surfaceparm trans
	qer_editorimage	textures/gothic_wall/glass_stained1




	{
		map textures/gothic_wall/glass_stained1
		blendfunc blend
		rgbGen identity
	}


}

textures/gothic_trim/gothgrate3
{
	surfaceparm	metalsteps
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/gothic_trim/gothgrate3
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
		alphaFunc GT0
		depthWrite
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		depthFunc equal
	}
}

textures/gothic_trim/gothgrate2
{
	surfaceparm	metalsteps
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/gothic_trim/gothgrate2
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
		alphaFunc GT0
		depthWrite
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		depthFunc equal
	}
}
textures/gothic_trim/tongue_bone
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_trim/tongue_bone
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_trim/tongue_bone_blend
		blendFunc add
		rgbGen wave sin 0.5 0.5 0 0.2
//		rgbGen wave sin 0.5 0.5 0 0.2
	}
}

textures/gothic_trim/metalbase09d_iron
{
qer_editorimage	textures/gothic_trim/metalbase09_d

	//	*************************************************
	//	*      	Tim's Border #1

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase09_d
			// Name of border wall
			rgbGen identity
			blendFunc blend
		}

		{
			map $lightmap
			rgbGen identity
			blendfunc GL_DST_COLOR GL_ZERO
		}

	//	END
}

textures/gothic_trim/metalbase09e_iron
{
qer_editorimage	textures/gothic_trim/metalbase09_e

	//	*************************************************
	//	*      	Tim's Borders

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase09_e
			// Name of border wall
			rgbGen identity
			blendFunc blend
		}

		{
			map $lightmap
			rgbGen identity
			blendfunc GL_DST_COLOR GL_ZERO
		}

	//	END
}

textures/gothic_trim/metalbase02b_iron
{
qer_editorimage	textures/gothic_trim/metalbase02_b

	//	*************************************************
	//	*      	Tim's Border #2

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase02_b
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}

textures/gothic_trim/metalbase03c_iron
{
qer_editorimage	textures/gothic_trim/metalbase03_c

	//	*************************************************
	//	*      	Tim's Border #3

		{
			map textures/gothic_wall/iron01_e
			rgbGen identity
			// Name of background wall
		}

		{
			map textures/gothic_trim/metalbase03_c
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}


textures/gothic_trim/metalbase02c_iron
{
qer_editorimage	textures/gothic_trim/metalbase02_c

	//	*************************************************
	//	*      	Tim's Border #5 red

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase02_c
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}

textures/gothic_trim/metalbase03b_iron
{
qer_editorimage	textures/gothic_trim/metalbase03_b

	//	*************************************************
	//	*      	Tim's Border #6 red

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase03_b
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}

textures/gothic_trim/metalbase09b_iron
{
qer_editorimage	textures/gothic_trim/metalbase09_b

	//	*************************************************
	//	*      	Tim's Border #7 red

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase09_b
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}

textures/gothic_trim/metalbase03a_brick
{
qer_editorimage	textures/gothic_trim/metalbase03_a

	//	*************************************************
	//	*      	Tim's Border

		{
			map textures/gothic_wall/streetbricks10
			// Name of background wall
			tcMod scale 2 2
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase03_a
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}

textures/gothic_trim/metalbase03d_iron
{
qer_editorimage	textures/gothic_trim/metalbase03_d

	//	*************************************************
	//	*      	Tim's Border

		{
			map textures/gothic_wall/iron01_e
			// Name of background wall
			//tcMod scale 2 2 //this makes in normal size
			rgbGen identity
		}

		{
			map textures/gothic_trim/metalbase03_d
			// Name of border wall
			blendFunc blend
			rgbGen identity
		}

		{
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}

	//	END
}
