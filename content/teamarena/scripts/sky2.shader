textures/skies/xmkc_ctf5sky
//used in xian_mptourney1
{

	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	0.9 0.8 1.0 80 80 60
	q3map_surfacelight 185

	qer_editorimage textures/skies/dimclouds

	skyparms - 512 -
	//cloudparms 512 full
	{
		map textures/skies/nightsky
		tcMod scale 5 8
		tcMod scroll 0.7 0.1
		depthWrite
	}
	{
		map textures/skies/nightsky_nocloud
		blendFunc filter
		tcMod scale 3 5
		tcMod scroll 0.3 0.1
	}
}

textures/skies/xproto_sky
{
	qer_editorimage textures/skies/proto_sky
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_surfacelight 450
	q3map_sun .473 .243 .314 30 35 78

//	cloudparms 512 full

	skyparms - 512 -

	{
		map textures/skies/proto_sky
		tcMod scroll .02 .04
		tcMod scale 3 4
		depthWrite
	}
	{
		map textures/skies/proto_sky2
		blendFunc add
		tcMod scroll 0.005 0.005
                //rgbgen wave triangle 1 2 0 7
		tcMod scale 3 3
	}


}

textures/skies/xproto_sky2
{
	qer_editorimage textures/skies/proto_sky
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
//	q3map_lightsubdivide 256
	q3map_surfacelight 200
	q3map_sun .473 .243 .314 30 35 87

//	cloudparms 512 full

	skyparms - 512 -

	{
		map textures/skies/proto_sky
		tcMod scroll .02 .04
		tcMod scale 3 4
		depthWrite
	}
	{
		map textures/skies/proto_sky2
		blendFunc add
		tcMod scroll 0.005 0.005
                //rgbgen wave triangle 1 2 0 7
		tcMod scale 3 3
	}


}

textures/skies/xproto_sky_tourney2
{
	qer_editorimage textures/skies/proto_sky
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
//	q3map_lightsubdivide 256
	q3map_surfacelight 200
	q3map_sun .5 .5 .5 100 180 83
//	cloudparms 512 full

	skyparms - 512 -

	{
		map textures/skies/proto_sky
		tcMod scroll .02 .04
		tcMod scale 3 4
		depthWrite
	}
	{
		map textures/skies/proto_sky2
		blendFunc add
		tcMod scroll 0.005 0.005
                //rgbgen wave triangle 1 2 0 7
		tcMod scale 3 3
	}


}

textures/skies/tim_tourney1
{
	qer_editorimage textures/skies/stars_red
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	.6 .37 .19 90 315 50

	q3map_surfacelight 80
	skyparms - 512 -

	//cloudparms 512 full
	//lightning

	{
		map textures/skies/killsky_1
		tcMod scroll 0.05 .1
		tcMod scale 2 2
		depthWrite
	}
	{
		map textures/skies/killsky_2
		blendfunc add
		tcMod scroll 0.05 0.06
		tcMod scale 3 2
	}
}
textures/skies/dc_hell
{
	qer_editorimage textures/skies/stars_red
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun 1 .77 .77 80 315 70
	//q3map_sun .5 .37 .19 80 315 70

	//q3map_sun 1 .37 .19 85 30 70
	q3map_surfacelight 60
	skyparms - 384 -

	//cloudparms 512 full
	//lightning

	{
		map textures/skies/killsky_1
		tcMod scroll 0.05 .1
		tcMod scale 2 2
		depthWrite
	}
	{
		map textures/skies/killsky_2
		blendfunc add
		tcMod scroll 0.05 0.06
		tcMod scale 3 2
	}
}

textures/skies/xtoxicsky_newctf1
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	qer_editorimage textures/skies/toxicsky
//	q3map_lightsubdivide 64
	// Was surfacelight 400
	q3map_surfacelight 200
	q3map_sun	1 1 0.5 150	30 85
	skyparms - 512 -

	{
		map textures/skies/inteldimclouds
		tcMod scroll 0.1 0.1
		tcMod scale 3 2
		depthWrite
	}
	{
		map textures/skies/intelredclouds
		blendFunc add
		tcMod scroll 0.05 0.05
		tcMod scale 3 3
	}
}

//*******************************************************
//*              Paul Jaquays' gallery sky
//*******************************************************
textures/skies/gallery_sky
{
	qer_editorimage textures/skies/pjbasesky
	q3map_lightimage textures/skies/topclouds
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_globaltexture
	q3map_lightsubdivide 512
	q3map_sun	0.266383 0.274632 0.358662 250 90 65
	q3map_surfacelight 100

	skyparms full 128 -

	{
		map textures/skies/bluedimclouds
		tcMod scroll 0.015 0.016
		tcMod scale 3 3
		depthWrite
	}
	{
		map textures/skies/topclouds
		blendfunc add
		tcMod scroll -0.01 -0.012
		tcMod scale 5 5
	}
}
textures/skies/tim_tourney2
//used in tim_tourney2

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	.5 .6 .8 100 190 75
	q3map_surfacelight 80

	qer_editorimage textures/skies/toxicbluesky

	skyparms - 512 -
	//cloudparms 512 full
	{
		map textures/skies/bluedimclouds
		tcMod scale 3 2
		tcMod scroll 0.15 0.15
		depthWrite
	}
	{
		map textures/skies/topclouds
		blendFunc add
		tcMod scale 3 3
		tcMod scroll 0.05 0.05
	}
}


textures/skies/tim_mpctf1
//used in mission pack tim_mpctf1

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	.5 .6 .8 100 225 80
	q3map_surfacelight 130

	qer_editorimage textures/skies/toxicbluesky

	skyparms - 512 -
	//cloudparms 512 full
	{
		map textures/skies/bluedimclouds
		tcMod scale 3 2
		tcMod scroll 0.15 0.15
		depthWrite
	}
	{
		map textures/skies/topclouds
		blendFunc add
		tcMod scale 3 3
		tcMod scroll 0.05 0.05
	}
}

textures/skies/raster_test_sun

// ***  testing sun  ***
// ***  12-19-99     ***

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	1.0 1.0 1.0 70 0 90
	q3map_surfacelight 50

	qer_editorimage textures/skies/dimclouds

	skyparms full 512 -
	{
		map textures/skies/nightsky
		tcMod scale 5 8
		tcMod scroll 0.7 0.1
		depthWrite
	}
	{
		map textures/skies/nightsky_nocloud
		blendFunc filter
		tcMod scale 3 5
		tcMod scroll 0.3 0.1
	}
}

textures/skies/proto_sky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_surfacelight 30
	q3map_sun .473 .243 .314 30 35 78

// 	//cloudparms 512 full

	skyparms - 512 -

	{
		map textures/skies/proto_sky
		tcMod scroll .02 .04
		tcMod scale 3 4
		depthWrite
	}
	{
		map textures/skies/proto_sky2
		blendFunc add
		tcMod scroll 0.005 0.005
                //rgbgen wave triangle 1 2 0 7
		tcMod scale 3 3
	}


}

textures/skies/mkc_ctf1
//used in mkc_ctf

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	0.9 0.8 1.0 90 45 60
	q3map_surfacelight 140

	qer_editorimage textures/skies/toxicbluesky

	skyParms - 512 -
	{
		map textures/skies/bluedimclouds
		tcMod scale 3 2
		tcMod scroll 0.15 0.15
		depthWrite
	}
	{
		map textures/skies/topclouds
		blendFunc add
		tcMod scale 3 3
		tcMod scroll 0.05 0.05
	}
}

textures/skies2/ctf6sky
{
	qer_editorimage textures/skies2/ctf6sky
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_sun	0.266383 0.274632 0.358662 150 60 85
	q3map_surfacelight 100

	skyparms - 512 -

	{
		map textures/skies2/ctf6sky2

                tcMod scale 3 3
		tcMod scroll 0.01 0.01
		depthWrite
	}
	{
		map textures/skies2/ctf6sky

		blendfunc Add
                tcMod scale 1.2 0.9
		tcMod scroll .013 .002

	}
}

textures/skies2/ctf6sky_ter
//sky for mpterra2
{
	qer_editorimage textures/skies2/ctf6skyb
	//qer_lightimage textures/skies2/ctf6sky2b
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 512
	q3map_sun	1 1 1 185 180 85
	q3map_surfacelight 300
	skyparms - 512 -

	{
		map textures/skies2/ctf6sky2b

                tcMod scale 3 3
		tcMod scroll 0.05 0.05
		depthWrite
	}
	{
		map textures/skies2/ctf6skyb

		blendfunc Add
                tcMod scale 1.2 0.9
		tcMod scroll .013 .002

	}
}

textures/skies2/nebulax
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

        skyparms textures/skies2/env/nebulax - -


}

textures/skies2/nebula3
{
        qer_editorimage textures/skies2/nebula3
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/proto_sky
	q3map_sun	.90 .90 .95 80 315 40
	q3map_surfacelight 460

        skyparms textures/skies2/env/nebula3 - -


}

textures/skies2/x_nebula3
{
        qer_editorimage textures/skies2/nebula3
	q3map_lightsubdivide 512
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

      q3map_lightimage textures/skies/proto_sky
	q3map_sun	.90 .90 .95 150 135 50
	q3map_surfacelight 200

        skyparms textures/skies2/env/nebula3 - -
}



textures/skies2/nebula3halflit
{
        qer_editorimage textures/skies2/nebula3
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/proto_sky
	q3map_sun	.90 .90 .95 80 315 40
	q3map_surfacelight 190

        skyparms textures/skies2/env/nebula3 - -


}

textures/skies2/nebula3nolit
{
        qer_editorimage textures/skies2/nebula3
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        skyparms textures/skies2/env/nebula3 - -


}


textures/skies2/nebula2
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars
	q3map_sun	.90 .90 .95 80 315 40
	q3map_surfacelight 60

        skyparms textures/skies2/env/nebula2 - -

}

textures/skies2/nebula
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars
	q3map_sun	.75 .37 .19 90 315 40
	q3map_surfacelight 80

        skyparms textures/skies2/env/nebula - -


}

textures/skies2/hell1
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars
	q3map_sun	1 1 1 55 -58 58
	q3map_surfacelight 400

        skyparms textures/skies2/env/hell1 - -

}

textures/skies2/xhell1_nolight
{
	qer_editorimage textures/skies2/hell1
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars
	q3map_sun	1 1 1 55 -58 58

        skyparms textures/skies2/env/hell1 - -

}


textures/skies2/hell2
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars
	q3map_sun	.75 .37 .19 90 315 40
	q3map_surfacelight 80

        skyparms textures/skies2/env/hell2 - -


}

textures/skies2/hell3
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars
	q3map_sun	.75 .37 .19 90 315 40
	q3map_surfacelight 80

        skyparms textures/skies2/env/hell3 - -


}

textures/skies2/mpterra2
//used terrain ctf map

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	1 1 1 200 180 85
	q3map_surfacelight 90

	qer_editorimage textures/skies/toxicbluesky

	skyparms - 1024 -

	{
		map textures/skies/bluedimclouds
		tcMod scale 3 2
		tcMod scroll 0.0355 0.0355
		depthWrite
	}
	{
		map textures/skies/topclouds
		blendFunc add
		tcMod scale 3 3
		tcMod scroll 0.0125 0.0125
	}
}
