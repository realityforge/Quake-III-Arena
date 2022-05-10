//	*************************************************
//	*
//	*   Vertex Lighting Replacement Shaders
//	*
//	*************************************************

textures/terrain/vxmpterra2

{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight


	{

		map textures/stone/pjrock10b_2
		rgbGen vertex
		tcmod scale 0.125 0.125
	}

}


textures/terrain/vxmpterra1

{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight


	{

		map textures/stone/pjrock12c
		rgbGen vertex
		tcmod scale 0.125 0.125
	}

}


// *********************************************************

//	*************************************************
//	*
//	*   MPTerra2 terrain shaders (PaulJ)
//	*
//	*************************************************


textures/terrain/mpterra2_0

{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight

	{

		map textures/stone/pjrock9b_2
		rgbGen vertex
		tcmod scale 0.125 0.125
	}

	{

                map textures/skies2/clouds
		blendfunc filter
                detail
		tcmod scale 0.01 0.01
                tcMod scroll -0.05 0.05
		tcmod transform 1 0 1 1 1 1

	}


}

textures/terrain/mpterra2_1

{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight

	{

		map textures/stone/pjrock12b_2
		rgbGen vertex
		tcmod scale 0.1 0.1

	}

	{

                map textures/skies2/clouds
		blendfunc filter
		detail
		tcmod scale 0.01 0.01
                tcMod scroll -0.05 0.05
		tcmod transform 1 0 1 1 1 1

	}


}

textures/terrain/mpterra2_2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight

	{

		map textures/stone/pjrock10b_2
		tcmod scale 0.05 0.05
		rgbGen vertex
	}

	{
                map textures/skies2/clouds
		blendfunc filter
		detail
		tcmod scale 0.01 0.01
                tcMod scroll -0.05 0.05
		tcmod transform 1 0 1 1 1 1

	}

}

textures/terrain/mpterra2_0to1

{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight

	{
		map textures/stone/pjrock9b_2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.125 0.125
	}

	{
		map textures/stone/pjrock12b_2
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}

	{
                map textures/skies2/clouds
		blendfunc filter
		detail
		tcmod scale 0.01 0.01
                tcMod scroll -0.05 0.05
		tcmod transform 1 0 1 1 1 1
	}


}

textures/terrain/mpterra2_0to2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock9b_2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.125 0.125
	}
	{
		map textures/stone/pjrock10b_2
		rgbGen vertex
		alphaGen vertex
                tcmod scale 0.05 0.05
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}

	{
                map textures/skies2/clouds
		blendfunc filter
		detail
		tcmod scale 0.01 0.01
                tcMod scroll -0.05 0.05
		tcmod transform 1 0 1 1 1 1

	}


}

textures/terrain/mpterra2_1to2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight

	{
		map textures/stone/pjrock12b_2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}

	{
		map textures/stone/pjrock10b_2
		tcmod scale 0.05 0.05
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}

	{
                map textures/skies2/clouds
		blendfunc filter
		detail
		tcmod scale 0.01 0.01
                tcMod scroll -0.05 0.05
		tcmod transform 1 0 1 1 1 1
	}


}

//////////////////////////////////////////////
//                                          //
//                x_mpterra                 //
//                                          //
//////////////////////////////////////////////

textures/terrain/vxmpterra3

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
	surfaceparm dust
	{
		map textures/proto2/px02
		tcmod scale .1 .1
		rgbGen vertex
	}

}



textures/proto2/xproto_0to1

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
        surfaceparm dust

	{
		map textures/proto2/px01
		tcmod scale .1 .1
		rgbGen vertex

	}

	{
		map textures/proto2/px02
		rgbGen vertex
		alphaGen vertex
		tcmod scale .1 .1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}


}

textures/proto2/xproto_1to2

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
	    surfaceparm dust
	{
		map textures/proto2/px02
		tcmod scale .1 .1
		rgbGen vertex
		alphaGen vertex
	}

	{
		map textures/proto2/px03
		rgbGen vertex
		alphaGen vertex
		tcmod scale .1 .1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}


}

textures/proto2/xproto_0to2

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
	    surfaceparm dust

	{
		map textures/proto2/px01
		tcmod scale .1 .1
		rgbGen vertex
	}
	{
		map textures/proto2/px03
		rgbGen vertex
		alphaGen vertex
		tcmod scale .1 .1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}


}



textures/proto2/xproto_0

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
	surfaceparm dust


	{
		map textures/proto2/px01
		tcmod scale .1 .1
		rgbGen vertex
	}



}

textures/proto2/xproto_1

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
	surfaceparm dust
	{
		map textures/proto2/px02
		tcmod scale .1 .1
		rgbGen vertex
	}



}

textures/proto2/xproto_2

{
	surfaceparm nolightmap
	//q3map_novertexshadows
	//q3map_forcesunlight
    	surfaceparm dust
	{
		map textures/proto2/px03
		tcmod scale .1 .1
		rgbGen vertex
	}

}



//	*************************************************
//	*
//	*   MPTerra1 terrain shaders (Tim)
//	*
//	*************************************************

textures/terrain/mpterra1_0
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock9c
		rgbGen vertex
		tcmod scale 0.125 0.125
	}
	{
                map textures/skies2/clouds2
		blendfunc filter
		tcmod scale 0.01 0.01
                 tcMod scroll -0.1 0.1

	}

}

textures/terrain/mpterra1_1
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock12c
		//tcmod transform 1 0 1 1 1 1
		rgbGen vertex
		tcmod scale 0.125 0.125
	}
	{
                map textures/skies2/clouds2
		blendfunc filter
		tcmod scale 0.01 0.01
                tcMod scroll -0.1 0.1

	}

}

textures/terrain/mpterra1_2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock10c
		tcmod scale 0.05 0.05
		rgbGen vertex
	}
	{
                map textures/skies2/clouds2
		blendfunc filter
		tcmod scale 0.01 0.01
                tcMod scroll -0.1 0.1

	}

}

textures/terrain/mpterra1_0to1
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock9c
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.125 0.125
	}
	{
		map textures/stone/pjrock12c
		tcmod scale 0.125 0.125
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
                map textures/skies2/clouds2
		blendfunc filter
		tcmod scale 0.01 0.01
                tcMod scroll -0.1 0.1

	}

}

textures/terrain/mpterra1_0to2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock9c
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.125 0.125
	}
	{
		map textures/stone/pjrock10c
		//tcmod transform 1 0 1 1 1 1
		tcmod scale 0.05 0.05
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
                map textures/skies2/clouds2
		blendfunc filter
		tcmod scale 0.01 0.01
                tcMod scroll -0.1 0.1

	}

}

textures/terrain/mpterra1_1to2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/stone/pjrock12c
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.125 0.125
	}
	{
		map textures/stone/pjrock10c
		//tcmod transform 1 0 1 1 1 1
		tcmod scale 0.05 0.05
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
                map textures/skies2/clouds2
		blendfunc filter
		tcmod scale 0.01 0.01
                tcMod scroll -0.1 0.1

	}
}






// *********************************************************
// MP Terra 3 Textures (Xian)
// *********************************************************

textures/proto2/x_sandy01
{
	qer_editorimage textures/proto2/xsandy01
	surfaceparm nolightmap
	{
		map textures/proto2/xsandy01
		tcmod scale .8 .8
		rgbGen vertex
	}
}

textures/proto2/x_rocky01
{
	qer_editorimage textures/proto2/xrocky01
	surfaceparm nolightmap
	{
		map textures/proto2/xrocky01
		tcmod scale .8 .8
		rgbGen vertex
	}
}


textures/proto2/tproto_0to1
{
	surfaceparm nolightmap
	{
		map textures/proto2/xsandy01
		tcmod scale .3 .3
		rgbGen vertex
//		rgbGen identity
		alphaGen vertex
//		alphaGen identity
	}
	{
		map textures/proto2/xrocky01
		rgbGen vertex
//		rgbGen identity
		alphaGen vertex
//		alphaGen identity
		tcmod scale .1 .1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}

//        {
//		map $lightmap
//              blendFunc filter
//		rgbGen identity
//	}

}


textures/proto2/tproto_0
{
	surfaceparm nolightmap
	{
		map textures/proto2/xsandy01
		tcmod scale .2 .2
		rgbGen vertex
//		rgbGen identity
	}

//        {
//		map $lightmap
//                blendFunc filter
//		rgbGen identity
//	}


}

textures/proto2/tproto_1
{
	surfaceparm nolightmap
	{
		map textures/proto2/xrocky01
		tcmod scale .1 .1
		rgbGen vertex
//		rgbGen identity
	}

//        {
//		map $lightmap
//                blendFunc filter
//		rgbGen identity
//	}


}
