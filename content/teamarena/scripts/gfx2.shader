icons/kamikaze
{
	nopicmip
	{
		map icons/kamikaze
		blendFunc blend
	}
}
icons/portal
{
	nopicmip
	{
		map icons/portal
		blendFunc blend
	}
}

//
// persistant powerup icons
//
icons/scout
{
	nopicmip
	{
		map icons/scout
		blendFunc blend
	}
}
icons/guard
{
	nopicmip
	{
		map icons/guard
		blendFunc blend
	}
}
icons/doubler
{
	nopicmip
	{
		map icons/doubler
		blendFunc blend
	}
}
icons/radar
{
	nopicmip
	{
		map icons/radar
		blendFunc blend
	}
}
icons/ammo_regen
{
	nopicmip
	{
		map icons/ammo_regen
		blendFunc blend
	}
}
icons/invulnerability
{
	nopicmip
	{
		map icons/invulnerability
		blendFunc blend
	}
}

icons/iconw_nailgun
{
	nopicmip
	{
		map icons/nailgun128
		blendFunc blend
	}
}

icons/iconw_chaingun
{
	nopicmip
	{
		map icons/chaingun128
		blendFunc blend
	}
}

icons/iconw_proxlauncher
{
	nopicmip
	{
		map icons/proxmine
		blendFunc blend
	}
}


console
{
	nopicmip
	nomipmaps

        {
		map textures/sfx2/screen01
                blendFunc GL_ONE GL_ZERO
                tcMod scroll 7.1  0.2
                tcmod scale .8 1
	}
        {
		map textures/effects2/console01
                blendFunc Add
                tcMod scroll -.01  -.02
                tcmod scale .02 .01
                tcmod rotate 3
	}



}


levelShotDetail

{
	nopicmip
	{
		map textures/sfx2/detail2
        	blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbgen identity
	}
}

nailtrail
{
	sort nearest
	cull none
	{
		clampmap models/weaphits/nailtrail
		blendFunc Add
		rgbGen vertex
                tcMod rotate -30
	}

}
