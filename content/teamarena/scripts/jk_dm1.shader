textures/jk_dm1/runway_dblue
{
	q3map_lightimage textures/jk_dm1/runway_glow_dblue
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/jk_dm1/runway_glow_dblue
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}

	{
		map textures/jk_dm1/runway_dblue
		blendFunc blend
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/jk_dm1/runwayb_dblue
		blendFunc add
		rgbGen identity
	}


}


textures/jk_dm1/jk_toxicsky_dm1
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

        //q3map_lightsubdivide 512
	q3map_surfacelight 220
	q3map_sun  1 1 0.5 100 90 70

	qer_editorimage textures/jk_dm1/jk_toxicsky_dm1
	skyparms - 512 -
	{
		map textures/jk_dm1/jk_inteldimclouds
		tcMod scroll 0.03 0.03
		tcMod scale 3 2
		depthWrite
	}
	{
		map textures/jk_dm1/jk_intelredclouds
		blendFunc add
		tcMod scroll 0.01 0.01
		tcMod scale 3 3
	}
}


textures/jk_dm1/jk_q3redflag
{
     cull disable
     surfaceparm alphashadow
     surfaceparm trans
     surfaceparm nomarks
     tessSize 64
     deformVertexes wave 30 sin 0 3 0 .2
     deformVertexes wave 100 sin 0 3 0 .7

        {
                map textures/jk_dm1/jk_q3redflag
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

textures/jk_dm1/jk_bouncepad_floor1
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/jk_dm1/jk_jumppadsmall
	q3map_surfacelight 400


	{
		map textures/jk_dm1/jk_bouncepad_floor1
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/jk_dm1/jk_bouncepad_layer1
		blendfunc add
		rgbGen wave sin .5 .5 0 1.5
	}

	{
		clampmap textures/jk_dm1/jk_jumppadsmall
		blendfunc add
		tcMod stretch sin 1.2 .8 0 1.5
		rgbGen wave square .5 .5 .25 1.5
	}

	//	END
}


textures/jk_dm1/jkt1_q3abanner
{
	qer_editorimage textures/jk_dm1/jkt1_q3abanner
        q3map_lightimage textures/jk_dm1/ss_jkt1_golgothabanner
        q3map_surfacelight 100


        {
		animMap 0.40 textures/jk_dm1/jkt1_q3abanner textures/jk_dm1/ss_jkt1_golgothabanner textures/jk_dm1/jkt1_powzerbanner
		//blendFunc add
		rgbGen wave square 0 3 0 .40
	}

	{
		map textures/base_wall/comp3text
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}

	{
		map textures/base_wall/comp3textb
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}


	{
		map $lightmap
	        rgbGen identity
		blendfunc filter
	}

	{
		map $lightmap
		tcgen environment
		tcmod scale .5 .5
	        rgbGen wave sin .25 0 0 0
		blendfunc add
	}
}



textures/jk_dm1/jk_t1fog_test
{

     qer_editorimage textures/jk_dm1/jk_t1fog_test
     surfaceparm     trans
     surfaceparm     nonsolid
     surfaceparm     fog
     surfaceparm     nodrop
     surfaceparm     nolightmap

     fogparms ( .85 .10 .01 ) 980

        {
		map textures/jk_dm1/jkt1_fogcloud3_test
		blendfunc filter
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/jk_dm1/jkt1_fogcloud3_test
		blendfunc filter
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}
