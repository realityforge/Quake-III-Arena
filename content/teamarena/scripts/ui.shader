ps_back2
{
  nopicmip
  nomipmaps
  {
    map ui/assets/ps_back03a
    rgbgen identity
  }
}

ps_back1
{
  nopicmip
  nomipmaps
  {
    map ui/assets/ps_back1
    rgbgen identity
  }
}

uiBackground
{
  nopicmip
  nomipmaps
  {
    map ui/assets/background2
    rgbgen identity
  }
}

uibackground5
{
  nopicmip
  nomipmaps
  {
    map ui/assets/background3
    rgbgen identity
  }




}


uiBackgroundMulti
{
  {
    map ui/assets/background
    rgbGen identity
  }
  {
    map ui/assets/multi_alpha
    blendfunc gl_zero gl_src_alpha
    rgbGen identity
    tcMod scroll 0.05 0.05
    tcMod scale 1.5 3
  }
  {
    map $lightmap
    rgbGen identity
    blendfunc filter
  }
}


textures/base_wall2/icon_stroggs
{

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap


	{
		map textures/base_wall2/icon_stroggs
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		rgbGen identity

	}
}



textures/redteam1
{
  qer_editorimage textures/base_wall2/redteam1
  {
    map textures/base_wall2/redteam1
    rgbgen identity
  }
}

textures/blueteam1
{
  qer_editorimage textures/base_wall2/blueteam1
  {
    map textures/base_wall2/blueteam1
    rgbgen identity
  }
}



textures/screenswitch
{
  qer_editorimage textures/base_wall2/blankscreen
  {
    map textures/base_wall2/blankscreen
    rgbgen identity
  }
}

ui/assets/pagans_shader1_2
{
	{
		clampmap ui/assets/pagans
		rgbgen identity
		blendfunc add
		//rgbgen wave sin .25 0 0 0
	}
}

menuflare
{
	{
		clampmap ui/assets/menuflare
		blendfunc add
		tcmod rotate 30
		rgbgen wave triangle 1 .05 0 .1
	}
}
