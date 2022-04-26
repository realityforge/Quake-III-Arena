//******************************************
//*    Rock, Sand and vegetation textures  *
//******************************************

textures/outdoors/groundtest_1
{
	qer_editorimage textures/organics/grass3.tga
	tessSize 512
	//cull front
	deformVertexes wave 256 sin 5 10 0 .0000001

	{
		map $lightmap
		rgbGen identity
	}

	//{
	//	map textures/organics/grass3.tga
	//	blendFunc GL_DST_COLOR GL_SRC_COLOR
	//	detail
	//	tcMod scale .25 .21
	//	rgbgen identity

	//}
	{
		map textures/organics/grass3.tga
		blendFunc filter
	//	tcMod scale 4 4	
		rgbgen identity

	}


}

