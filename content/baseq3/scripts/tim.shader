//Bwahahahahhaha

textures/tim/red_flagbase
{
      qer_editorimage textures/tim/flagbase

        {
	        map textures/tim/swirl_red
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/tim/swirl_red
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .7 0.5 0 .1
	        rgbGen identity
	}
        {
		map textures/tim/flagbase
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
      qer_editorimage textures/tim/flagbase

        {
	        map textures/tim/swirl_blue
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .7 0.5 0 .2
	        rgbGen identity
	}
        {
	        map textures/tim/swirl_blue
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .7 0.5 0 .1
	        rgbGen identity
	}
        {
		map textures/tim/flagbase
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
	q3map_lightimage textures/tim/tim11c_pulse1
	qer_editorimage textures/base_trim/border11c

	{
		map textures/base_trim/border11c
		rgbGen identity
	}

	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{
		map textures/base_trim/border11c_light
		blendfunc gl_one gl_one
		rgbgen wave sin 1 .1 0 5
	}


	{
		map textures/tim/tim11c_pulse1
		blendfunc gl_one gl_one
		tcmod scale .035 1
		tcmod scroll -0.65 0


	}


}

textures/tim/rmetaltechgeomtrn
{


        {
		map textures/sfx/fire_ctfred
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/tim/rmetaltechgeomtrn
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/tim/rmetaltechgeomtrn
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
	q3map_lightimage textures/tim/redmetalsupport2fline_glow

	{
		map textures/base_wall/chrome_env
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}

	{
		map textures/tim/redmetalsupport2fline
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/tim/redmetalsupport2fline_glow
		blendFunc add
		rgbGen wave sin .5 .5 0 1
	}


}
textures/tim/symbol_redlt1
{
	q3map_lightimage textures/tim/symbol_redlt1_mask
	q3map_surfacelight 100
	light 1

	{
		map $lightmap
		rgbGen identity
	}


	{
		map textures/tim/symbol_redlt1
		blendfunc filter
		rgbgen identity
	}

	{
		map textures/tim/symbol_redlt1_mask
		blendfunc add
		rgbgen wave sawtooth .2 .05 0 7
	}
}

textures/tim/rconcrete_ow
{

        {
		map textures/tim/proto_zzztred
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/tim/rconcrete_ow
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
