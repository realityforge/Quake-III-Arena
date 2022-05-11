models/mapobjects/xlamp/xlamp_grate
{

     cull disable
     surfaceParm Trans

        {
                map models/mapobjects/xlamp/xlamp_grate
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}

models/mapobjects/xlamp/xlamp
{

     cull disable
     surfaceParm Trans
        {
		map textures/effects2/envmap_sky
		tcGen environment
                rgbGen vertex
	}

        {
                map models/mapobjects/xlamp/xlamp
                blendFunc Blend
                rgbGen vertex
        }
}
models/mapobjects/xlamp/xlamp_red
{
    	deformVertexes autoSprite2
   	surfaceparm	trans
	surfaceparm nomarks
	cull none

        {
                map models/mapobjects/xlamp/xlamp_red
                blendFunc add
                rgbGen identity

        }


}
models/mapobjects/xlamp/xlamp_ntrl
{
    	deformVertexes autoSprite2
   	surfaceparm	trans
	surfaceparm nomarks
	cull none

        {
                map models/mapobjects/xlamp/xlamp_ntrl
                blendFunc add
                rgbGen identity

        }


}
models/mapobjects/xlamp/xlamp_blue
{
    	deformVertexes autoSprite2
   	surfaceparm	trans
	surfaceparm nomarks
	cull none

        {
                map models/mapobjects/xlamp/xlamp_blue
                blendFunc add
                rgbGen identity
        }


}

models/powerups/harvester/blue_h2
{

	{
		map models/powerups/harvester/blue_h2
                tcMod stretch sin .8 0.2 0 .3
                tcmod rotate 30
                rgbGen identity
	}
        {
		map models/powerups/harvester/harvester2
                tcMod stretch sin .8 0.2 0 .2
                tcmod rotate 20
                blendfunc Blend
                rgbGen lightingdiffuse
	}
	{
		map models/powerups/harvester/harvester2
		blendfunc Blend
                rgbGen lightingdiffuse
	}

}
models/powerups/harvester/harvester2
{

	{
		map models/powerups/harvester/red_h2
                tcMod stretch sin .8 0.2 0 .3
                tcmod rotate 30
                rgbGen identity
	}
        {
		map models/powerups/harvester/harvester2
                tcMod stretch sin .8 0.2 0 .2
                tcmod rotate 20
                blendfunc Blend
                rgbGen lightingdiffuse
	}
	{
		map models/powerups/harvester/harvester2
		blendfunc Blend
                rgbGen lightingdiffuse
	}

}

models/powerups/harvester/red_h
{

   cull none
   nomipmaps


	{
		map models/powerups/harvester/red_h
                tcmod scroll 3 0
                blendFunc Add
                rgbGen identity
	}
        {
		map models/powerups/harvester/red_hb
                tcmod scroll 6 1
                tcmod scale 2 1
                blendFunc Add
                rgbGen wave inversesawtooth -.3 1.3 0 1
	}
        {
		map models/powerups/harvester/red_hb
                tcmod scroll -4 1
                tcmod scale 2 1
                blendFunc Add
                rgbGen wave inversesawtooth -.3 1.3 0 1
	}



}


models/powerups/harvester/blue_h
{

   cull none
   nomipmaps


	{
		map models/powerups/harvester/blue_h
                tcmod scroll 3 0
                blendFunc Add
                rgbGen identity
	}
        {
		map models/powerups/harvester/red_hb
                tcmod scroll 6 1
                tcmod scale 2 1
                blendFunc Add
                rgbGen wave inversesawtooth -.3 1.3 0 1
	}
        {
		map models/powerups/harvester/red_hb
                tcmod scroll -4 1
                tcmod scale 2 1
                blendFunc Add
                rgbGen wave inversesawtooth -.3 1.3 0 1
	}



}

models/weaphits/rlboom/rlboom_1
{
	cull disable

	{
		animmap 8 models/weaphits/rlboom/rlboom_1  models/weaphits/rlboom/rlboom_2 models/weaphits/rlboom/rlboom_3 models/weaphits/rlboom/rlboom_4 models/weaphits/rlboom/rlboom_5 models/weaphits/rlboom/rlboom_6 models/weaphits/rlboom/rlboom_7 models/weaphits/rlboom/rlboom_8
                //tcmod rotate 30
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/rlboom/rlboom_2 models/weaphits/rlboom/rlboom_3 models/weaphits/rlboom/rlboom_4 models/weaphits/rlboom/rlboom_5 models/weaphits/rlboom/rlboom_6 models/weaphits/rlboom/rlboom_7 models/weaphits/rlboom/rlboom_8 gfx/colors/black
		//tcmod rotate 30
                rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

models/powerups/shield/juicer
{
 deformVertexes wave 80 sin 0 1 0 .6
	{
		map models/powerups/shield/juicer
                tcmod scale 2 2
                tcmod scroll 0 -.1
		blendfunc GL_one GL_ZERO
                rgbGen lightingdiffuse
	}
        {
		map textures/effects2/tinfx_scr
		tcGen environment
		blendfunc Add
                rgbGen lightingdiffuse
	}
}

models/powerups/regen1
{
 cull disable
	{
		clampmap models/powerups/regen1
                tcmod rotate -420
		blendfunc Add
                rgbGen entity
	}
	{
		clampmap models/powerups/regen2
                tcmod rotate -640
		blendfunc Add
                rgbGen entity
	}
}

models/powerups/pop
{
 cull disable
	{
		map models/powerups/pop
		tcGen environment
		tcMod turb 0 0.1 0 0.1
                tcmod rotate 311
                tcmod scroll 1 1
		blendfunc Add
                rgbGen entity
	}
}

models/powerups/pop2
{
 cull disable
 deformVertexes autosprite
	{
		clampmap models/powerups/pop2
                tcmod rotate 333
		blendfunc Add
                rgbGen entity
	}
	{
		clampmap models/powerups/pop2
                tcmod rotate -433
		blendfunc Add
                rgbGen entity
	}
}


models/mapobjects/misc/bellcone
{
 	cull disable
 	nomipmaps
	{
		clampmap models/mapobjects/misc/bellcone
                tcMod stretch sin .6 0.5 0 .1
                tcmod rotate 730
		blendfunc Add
                rgbGen identity
	}
}
