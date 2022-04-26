

models/players/heads/flayer/flayer_t_red
{
	//deformVertexes bulge .6 .7 .333
	deformVertexes wave 50 sin 0 .08 0 .5
	deformVertexes wave 50 triangle 0 .1 .5 .0365
        {
                map models/players/heads/flayer/flayer_t_red.tga
                rgbGen lightingdiffuse
        }

}

models/players/heads/flayer/flayereye
{
	deformVertexes autosprite
	nomipmaps
        {
                map models/players/heads/flayer/flayereye.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }

}



models/players/heads/flayer/flayer_t_blue
{

	deformVertexes wave 50 sin 0 .1 0 .5
        {
                map models/players/heads/flayer/flayer_t_blue.tga
                rgbGen lightingdiffuse
        }

}

models/players/heads/flayer/flayereye
{
	deformVertexes autosprite
	nomipmaps
        {
                map models/players/heads/flayer/flayereye.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }

}
