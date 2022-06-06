
lightningBoltNew
{
	cull none
	{
		map gfx/misc/lightning3new
		blendFunc add
		rgbgen wave sin 1 0.5 0 7.1
		tcmod scale  2 1
		tcMod scroll -5 0
	}
	{
		map gfx/misc/lightning3new
		blendFunc add
		rgbgen wave sin 1 0.8 0 8.1
		tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}


lightningBoltNewNPM
{
	nopicmip
	cull none
	{
		map gfx/misc/lightning3newNPM
		blendFunc add
		rgbgen wave sin 1 0.5 0 7.1
		tcmod scale  2 1
		tcMod scroll -5 0
	}
	{
		map gfx/misc/lightning3newNPM
		blendFunc add
		rgbgen wave sin 1 0.8 0 8.1
		tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}
