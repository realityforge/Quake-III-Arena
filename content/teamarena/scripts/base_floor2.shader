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
