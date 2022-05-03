textures/liquids2/calm_poollight2nt
	{



		qer_editorimage textures/liquids/pool3d_4b.png
		q3map_globaltexture
		qer_trans .75

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		q3map_surfacelight 50

		cull disable



		{
			map textures/liquids/pool3d_5c2.png
			blendFunc GL_dst_color GL_zero
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}

		{
			map textures/liquids/pool3d_6c2.png
			blendFunc GL_dst_color GL_zero
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{
			map textures/liquids/pool3d_3c2.png
			blendFunc GL_dst_color GL_zero
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}
		{
			map textures/liquids/pool3d_4b2.png
			blendfunc add
			tcmod scale .125 .125
			rgbgen identity
		}


		//	END
	}

textures/liquids2/water_volume

	{
		qer_editorimage textures/liquids/pool3d_3.png
		qer_trans .5
		surfaceparm nodraw
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable

//	END
	}


textures/liquids2/clear_ripple1v

	{
		qer_editorimage textures/liquids/pool3d_3.png
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5


		{
			map textures/liquids/pool3d_5.png
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}

		{
			map textures/liquids/pool3d_6.png
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{
			map textures/liquids/pool3d_3.png
			blendFunc GL_dst_color GL_one
			rgbgen vertex
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}

//	END
	}

textures/liquids2/clear_ripple1_q3dm1v

	{
		qer_editorimage textures/liquids/pool3d_3.png
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5


		{
			map textures/liquids/pool3d_5.png
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}

		{
			map textures/liquids/pool3d_6.png
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{
			map textures/liquids/pool3d_3.png
			blendFunc GL_dst_color GL_one
			rgbgen vertex
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}

//	END
	}
textures/liquids2/clear_calm1v

	{
		qer_editorimage textures/liquids/pool3d_3e.png
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .25 .25 0 .5
		{
			map textures/liquids/pool3d_5e.png
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 .01

		}

		{
			map textures/liquids/pool3d_3e.png
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .025
                        rgbGen vertex
		}





//	END
	}
textures/liquids2/pjslime
	{
	//	*************************************************
	//	* ORIGINAL SLIME Feb 11 1999 		        *
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
        //      *
	//	*************************************************
		//Changed light value to 400 on May 17, 2000
		// Added to g3map_global texture on May 11, 1999
		q3map_lightimage textures/proto2/concrete_blue.png
		q3map_globaltexture
		qer_trans .5

		surfaceparm noimpact
		surfaceparm lava
		surfaceparm trans

		q3map_surfacelight 500
		tessSize 64
		//cull disable
		deformVertexes wave 100 sin 1 2 0 .5


		{
			map $lightmap
			rgbgen identity
		}


		{
			map textures/liquids2/pjslime.png
			blendFunc GL_DST_COLOR GL_SRC_ALPHA
			rgbGen identity
			alphaGen lightingSpecular
			tcMod turb 0 .2 .5 .05
			tcmod scroll .01 .01
		}



		{
			map textures/liquids2/pjslime2.png
			blendfunc add
			rgbgen wave inversesawtooth 0 1 0 4
			tcMod turb 0 .2 .5 .05
			tcmod scroll .01 .01
		}



		// 	END
	}

textures/liquids2/slime3
	{
	//	*************************************************
	//	* ORIGINAL SLIME Feb 11 1999 		        *
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
        //      *
	//	*************************************************
		//Changed light value to 500 on Feb 18, 2000
		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/slime7e.png
		q3map_lightimage textures/liquids/slime7e4.png
		q3map_globaltexture
		qer_trans .5

		surfaceparm noimpact
		surfaceparm lava
		surfaceparm trans

		q3map_surfacelight 500
		tessSize 64
		//cull disable
		deformVertexes wave 100 sin 1 2 0 .5


		{
			map $lightmap
			rgbgen identity
		}


		{
			map textures/liquids/slime7e.png
			blendFunc GL_DST_COLOR GL_SRC_ALPHA
			rgbGen identity
			alphaGen lightingSpecular
			tcMod turb 0 .2 .5 .05
			tcmod scroll .01 .01
		}



		{
			map textures/liquids/slime7e4.png
			blendfunc add
			rgbgen wave inversesawtooth 0 1 0 4
			tcMod turb 0 .2 .5 .05
			tcmod scroll .01 .01
		}



		// 	END
	}

textures/liquids2/xproto_pool3
	{
		///////////////////////////////////////////
		//   Water Fuckage June 18 99 Kenneth	 //
		///////////////////////////////////////////

		qer_editorimage textures/liquids2/proto_pool3.png
		q3map_globaltexture
	    	qer_trans .80
                surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
                q3map_surfacelight 30
		q3map_lightsubdivide 32
		cull disable
                // tesssize 256
	        //deformVertexes wave 100 sin 1 5 .1 .5


		{
			map textures/liquids2/proto_pool3.png
			blendfunc GL_ONE GL_ONE //SRC_COLOR
			tcMod scale 1 1
			tcMod scroll .02 .02

		}
	        {
			map textures/liquids2/proto_poolpass2.png
			blendfunc GL_ONE GL_ONE
			tcMod scale .5 .6
			tcMod scroll .06 .04
		}
	        {
			map textures/liquids2/proto_poolpass.png
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
			tcMod scroll .05 .05
		}
	        {
		        map $lightmap
			rgbgen identity
			blendfunc GL_DST_COLOR GL_ZERO
                }



		//	END
	}
