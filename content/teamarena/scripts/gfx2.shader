

console
{
	nopicmip
	nomipmaps

        {
		map textures/sfx2/screen01.png
                blendFunc GL_ONE GL_ZERO
                tcMod scroll 7.1  0.2
                tcmod scale .8 1
	}
        {
		map textures/effects2/console01.png
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
		map textures/sfx2/detail2.png
        	blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbgen identity
	}
}

nailtrail
{
	sort nearest
	cull none
	{
		clampmap models/weaphits/nailtrail.png
		blendFunc Add
		rgbGen vertex
                tcMod rotate -30
	}

}
