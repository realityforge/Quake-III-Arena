textures/skies/terrain1
//used terrain ctf map

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	.8 .8 .6 80 190 80
	q3map_surfacelight 65

	qer_editorimage textures/skies/toxicbluesky

	skyparms - 512 -

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

textures/skies/jimsky
//used in tim_dm4
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	1 1 1 300 120 75
	//q3map_surfacelight 80
	q3map_surfacelight 20

	qer_editorimage textures/skies/pjbasesky
	//qer_editorimage textures/skies/toxicsky

	skyparms - 4096 -
	{
		map textures/skies/dimclouds
		tcMod scroll 0.015 0.016
		tcMod scale 3 3
		depthWrite
	}
	{
		map textures/skies/pjbasesky
		blendfunc add
		tcMod scroll -0.01 -0.012
		tcMod scale 5 5
	}
	//{
	//	map textures/skies/inteldimclouds
	//	tcMod scale 3 2
	//	tcMod scroll 0.15 0.15
	//	depthWrite
	//}
	//{
	//	map textures/skies/intelredclouds
	//	blendFunc add
	//	tcMod scale 3 3
	//	tcMod scroll 0.05 0.05
	//}
}

textures/proto2/jimtest_0
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image1
		tcmod scale 1 1
		rgbGen vertex
	}
}

textures/proto2/jimtest_1
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		tcmod scale 1 1
	}
}

textures/proto2/jimtest_2
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image3
		rgbGen vertex
		tcmod scale 1 1
	}
}

textures/proto2/jimtest_3
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image4
		tcmod scale 2 2
		rgbGen vertex
	}
}

textures/proto2/jimtest_0to1
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image1
		tcmod scale 1 1
		rgbGen vertex
		alphaGen vertex
	}
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 1 1
		blendFunc blend
	}
}

textures/proto2/jimtest_0to2
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image1
		tcmod scale 1 1
		rgbGen vertex
		alphaGen vertex
	}
	{
		map textures/proto2/jim/image3
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
		tcmod scale 1 1
	}
}

textures/proto2/jimtest_0to3
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image1
		tcmod scale 1 1
		rgbGen vertex
		alphaGen vertex
	}
	{
		map textures/proto2/jim/image4
		tcmod scale 2 2
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}

textures/proto2/jimtest_1to2
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 1 1
	}
	{
		map textures/proto2/jim/image3
		tcmod scale 1 1
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}

textures/proto2/jimtest_1to3
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 1 1
	}
	{
		map textures/proto2/jim/image4
		tcmod scale 2 2
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}

textures/proto2/jimtest_2to3
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image3
		rgbGen vertex
		alphaGen vertex
		tcmod scale 1 1
	}
	{
		map textures/proto2/jim/image4
		tcmod scale 2 2
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}

















textures/proto2/grassy_0
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		tcmod scale 0.5 0.5
	}
}

textures/proto2/grassy_1
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image3
		rgbGen vertex
		tcmod scale 0.5 0.5
	}
}

textures/proto2/grassy_2
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image4
		tcmod scale 0.5 0.5
		rgbGen vertex
	}
}

textures/proto2/grassy_0to1
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.5 0.5
	}
	{
		map textures/proto2/jim/image3
		tcmod scale 0.5 0.5
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}

textures/proto2/grassy_0to2
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image2
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.5 0.5
	}
	{
		map textures/proto2/jim/image4
		tcmod scale 0.5 0.5
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}

textures/proto2/grassy_1to2
{
	surfaceparm nolightmap
	{
		map textures/proto2/jim/image3
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.5 0.5
	}
	{
		map textures/proto2/jim/image4
		tcmod scale 0.5 0.5
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
	}
}
