
textures/base_support/x_support4
{
	surfaceparm	metalsteps
	surfaceparm trans
	surfaceparm alphashadow
    surfaceparm nomarks
	cull none
        nopicmip
	{
		map textures/base_support/x_support4.png
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/x_support3.png
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_support/support1shiny
{

        {
                map textures/effects/tinfx.png
                tcGen environment
                rgbGen identity
	}
        {
		map textures/base_support/support1shiny.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		map textures/base_support/support1rust.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.png
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}

        {
		map textures/base_support/support1rust.png
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_support/support2rust
{
	qer_editorimage textures/base_support/support1rust.png
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust.png
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/grate1_3.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}

}


textures/base_support/shinysupport2
{

	{
		map textures/base_wall/chrome_env.png
		rgbgen identity
	}

	{
		map textures/base_support/shinysupport2.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
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
		map textures/base_support/shinysupport1.png
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/x_support.png
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/z_support.png
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/x_support2.png
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/metal14_1.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
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
		map textures/base_support/cable_trans.png
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO


	}
}
