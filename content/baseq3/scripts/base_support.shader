
textures/base_support/x_support4
{
	surfaceparm	metalsteps
	surfaceparm trans
	surfaceparm alphashadow
    surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_support/x_support4
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}
textures/base_support/x_support3
{
	surfaceparm	metalsteps
	surfaceparm trans
	surfaceparm alphashadow
    surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_support/x_support3
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/base_support/support1shiny
{

        {
                map textures/effects/tinfx
                tcGen environment
                rgbGen identity
	}
        {
		map textures/base_support/support1shiny
                blendFunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_support/support1rust
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx
                tcgen environment
		blendFunc add
		rgbGen identity
	}

        {
		map textures/base_support/support1rust
		//blendFunc add
                blendFunc filter
		rgbGen identity
	}
}

textures/base_support/support2rust
{
	qer_editorimage textures/base_support/support1rust
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust
		blendFunc filter
		rgbGen identity
	}
}

textures/base_support/grate1_3
{

	{
		map $lightmap
		rgbgen identity
	}

	{
		map textures/base_support/grate1_3
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}

}


textures/base_support/shinysupport2
{

	{
		map textures/base_wall/chrome_env
		rgbgen identity
	}

	{
		map textures/base_support/shinysupport2
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbgen identity
	}


}

textures/base_support/shinysupport1
{

	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity
	}


	{
		map textures/base_support/shinysupport1
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc filter
	}


}

textures/base_support/x_support
{
	surfaceparm	metalsteps
	surfaceparm trans
	surfaceparm alphashadow
    surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_support/x_support
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/base_support/z_support
{
	surfaceparm	metalsteps
    surfaceparm trans
	surfaceparm alphashadow
    surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_support/z_support
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}
textures/base_support/x_support2
{
	surfaceparm	metalsteps
    	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm playerclip
   	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_support/x_support2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}
textures/base_support/metal1_5
{
	surfaceparm	metalsteps
}

textures/base_support/pj_metal14_1
//Paul Jaquays uses this on the tops of metal frameworks
{
	surfaceparm	metalsteps

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal14_1
		rgbGen identity
		blendFunc filter
	}
}

textures/base_support/cable_trans
{

	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/base_support/cable_trans
		rgbGen identity
		blendFunc filter


	}
}
