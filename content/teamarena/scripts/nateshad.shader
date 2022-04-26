textures/natestah/leaf2
{
	surfaceparm alphashadow
	cull disable
	{
		map textures/natestah/leaf2.tga
		rgbGen Vertex 
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
}

textures/natestah/nateswater
{
	qer_editorimage textures/natestah/nateswater.tga
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 64 sin 0.25 0.25 0 0.5 
	qer_trans 0.5
	q3map_globaltexture
	{
		map textures/natestah/nateswater.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.5 0.5
		tcMod scroll 0.025 0.01
	}
		{ 
			map textures/liquids/pool3d_3e.tga
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .025
		}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
}

