//Bwahahahahhaha

textures/tim/red_flagbase
{
      qer_editorimage textures/tim/flagbase.png

        {
	        map textures/tim/swirl_red.png
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/tim/swirl_red.png
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .7 0.5 0 .1
	        rgbGen identity
	}
        {
		map textures/tim/flagbase.png
                blendFunc blend
		rgbGen identity
	}
       {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/tim/blue_flagbase
{
      qer_editorimage textures/tim/flagbase.png

        {
	        map textures/tim/swirl_blue.png
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/tim/swirl_blue.png
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .7 0.5 0 .1
	        rgbGen identity
	}
        {
		map textures/tim/flagbase.png
                blendFunc blend
		rgbGen identity
	}
       {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/tim/timborder11c
{
	q3map_surfacelight 300
	q3map_lightimage textures/tim/tim11c_pulse1.png
	qer_editorimage textures/base_trim/border11c.png

	{
		map textures/base_trim/border11c.png
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{
		map textures/base_trim/border11c_light.png
		blendfunc gl_one gl_one
		rgbgen wave sin 1 .1 0 5
	}


	{
		map textures/tim/tim11c_pulse1.png
		blendfunc gl_one gl_one
		tcmod scale .035 1
		tcmod scroll -0.65 0


	}


}

textures/tim/rmetaltechgeomtrn
{


        {
		map textures/sfx/fire_ctfred.png
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/tim/rmetaltechgeomtrn.png
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2.png
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/tim/rmetaltechgeomtrn.png
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/tim/redmetalsupport2fline
{
	q3map_surfacelight 100
	q3map_lightimage textures/tim/redmetalsupport2fline_glow.png

	{
		map textures/base_wall/chrome_env.png
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/tim/redmetalsupport2fline.png
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/tim/redmetalsupport2fline_glow.png
		blendFunc add
		rgbGen wave sin .5 .5 0 1
	}


}
textures/tim/symbol_redlt1
{
	q3map_lightimage textures/tim/symbol_redlt1_mask.png
	q3map_surfacelight 100
	light 1

	{
		map $lightmap
		rgbGen identity
	}


	{
		map textures/tim/symbol_redlt1.png
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/tim/symbol_redlt1_mask.png
		blendfunc add
		rgbgen wave sawtooth .2 .05 0 7
	}
}

textures/tim/rconcrete_ow
{

        {
		map textures/tim/proto_zzztred.png
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/tim/rconcrete_ow.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
