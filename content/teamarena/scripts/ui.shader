ps_back2
{
  nopicmip
  nomipmaps
  {
    map ui/assets/ps_back03a.png
    rgbgen identity
  }
}

ps_back1
{
  nopicmip
  nomipmaps
  {
    map ui/assets/ps_back1.png
    rgbgen identity
  }
}

uiBackground
{
  nopicmip
  nomipmaps
  {
    map ui/assets/background2.png
    rgbgen identity
  }
}

uibackground5
{
  nopicmip
  nomipmaps
  {
    map ui/assets/background3.png
    rgbgen identity
  }




}


uiBackgroundMulti
{
  {
    map ui/assets/background.png
    rgbGen identity
  }
  {
    map ui/assets/multi_alpha.png
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
		map textures/base_wall2/icon_stroggs.png
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		rgbGen identity

	}
}



textures/redteam1
{
  qer_editorimage textures/base_wall2/redteam1.png
  {
    map textures/base_wall2/redteam1.png
    rgbgen identity
  }
}

textures/blueteam1
{
  qer_editorimage textures/base_wall2/blueteam1.png
  {
    map textures/base_wall2/blueteam1.png
    rgbgen identity
  }
}



textures/screenswitch
{
  qer_editorimage textures/base_wall2/blankscreen.png
  {
    map textures/base_wall2/blankscreen.png
    rgbgen identity
  }
}

ui/assets/pagans_shader1_2
{
	{
		clampmap ui/assets/pagans.png
		rgbgen identity
		blendfunc add
		//rgbgen wave sin .25 0 0 0
	}
}

menuflare
{
	{
		clampmap ui/assets/menuflare.png
		blendfunc add
		tcmod rotate 30
		rgbgen wave triangle 1 .05 0 .1
	}
}