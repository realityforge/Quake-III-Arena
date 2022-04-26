models/weapons/proxmine/proxmine
{
	cull disable
	{
		map models/weapons/proxmine/proxmine.tga
		rgbGen lightingdiffuse
	}
	{
		map models/weapons/proxmine/proxmineb.tga
		blendFunc add
		rgbGen wave sin .5 .5 0 2
	}
}
