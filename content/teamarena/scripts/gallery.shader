//*******************************************************
//*              QuakeCon2000' gallery sky
//*******************************************************
textures/gallery/gallery_sky
{
	qer_editorimage textures/skies/pjbasesky.tga
	q3map_lightimage textures/skies/topclouds.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_globaltexture
	q3map_lightsubdivide 512 
	q3map_sun	0.266383 0.274632 0.358662 250 90 65
	q3map_surfacelight 100

	skyparms full 128 -
	
	{
		map textures/skies/bluedimclouds.tga
		tcMod scroll 0.015 0.016
		tcMod scale 3 3
		depthWrite
	}
	{
		map textures/skies/topclouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -0.01 -0.012
		tcMod scale 5 5
	}
}