models/mapobjects/terrastone/magicstone01
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .4
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2
		 rgbGen vertex
	}

}
models/mapobjects/terrastone/magicstone02
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .3
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2
		 rgbGen vertex
	}

}
models/mapobjects/terrastone/magicstone03
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .2
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2
		 rgbGen vertex
	}

}
models/mapobjects/terrastone/magicstone04
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .25
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2
		 rgbGen vertex
	}

}

models/mapobjects/tree2/branch2
{

        surfaceparm nolightmap
        surfaceparm trans
        surfaceparm nomarks
	cull none
        sort 10

        //nopicmip

	{
		clampmap models/mapobjects/tree2/branch2
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR

	}
}

models/mapobjects/weeds2/weeds2
{

     cull disable
     surfaceparm Trans

        {
                map models/mapobjects/weeds2/weeds2
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}

models/players/heads/james/james_e_red
{

        {
                map models/players/james/red2
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/heads/james/james_e_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/james/james_e_blu
{

        {
                map models/players/james/blue2
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/heads/james/james_e_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/janet/janet_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/janet/janet_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/james/james_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/james/james_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/janet/janet_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/janet/janet_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/james/james_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/james/james_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/powerups/ob2_1
{
        {
	        map models/powerups/overload_map
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen identity
        }
}

models/powerups/ob2_2
{
        {
	        map models/powerups/overload_mapbw
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen entity
        }
}

models/powerups/ob2_3
{
        {
		map models/powerups/overload_lights
		tcmod scroll 1 1
	        rgbGen entity
        }
}

models/powerups/ob2_4
{
 cull disable
	{
		map models/powerups/pop_bw
		tcMod turb 0 0.1 0 0.1
                tcmod rotate 311
                tcmod scroll 1 1
		blendfunc Add
                rgbGen entity
	}
}


models/powerups/shield_1
{
        {
	        map models/powerups/shield_map
		tcGen environment
		rgbGen identity
        }
}

models/powerups/shield_3
{
        {
	        map models/powerups/shield_map
		tcGen environment
		blendfunc add
                rgbGen identity
        }
}

models/powerups/shield_2
{

        {
	        map models/powerups/shield_fx
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}

models/powerups/porter1
{
        {
	        map models/powerups/porter_map
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen identity
        }
}

models/powerups/porter2
{

        {
	        map models/powerups/porter_fx
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}

models/mapobjects/statues/flagbits_stat
{
               cull none

	 {
                map models/mapobjects/statues/flagbits_stat
                alphaFunc GE128
                rgbGen lightingDiffuse
                depthWrite
        }

}

models/powerups/shield/shield
{
 cull disable
	{
		map models/powerups/shield/shield
		tcGen environment
                tcmod scale .5 .5
		tcMod turb 0 0.3 0 0.3
                tcmod rotate 333
                tcmod scroll 1 1
		blendfunc Add
	}
}

models/powerups/shield/shield2
{
 cull disable
	{
		map models/powerups/shield/shield2
                tcmod rotate 313
		blendfunc Add
	}
        {
		map models/powerups/shield/shield2
                tcmod rotate -483
		blendfunc Add
	}
}


models/players/heads/callisto/callisto
{

        {
		AnimMap 5 models/players/heads/callisto/callisto models/players/heads/callisto/callisto models/players/heads/callisto/callisto models/players/heads/callisto/callisto models/players/heads/callisto/callisto models/players/heads/callisto/callisto2 models/players/heads/callisto/callisto models/players/heads/callisto/callisto2
		rgbGen lightingdiffuse
	}


}

models/players/heads/ursula/ursula_e
{
        surfaceparm trans
	{
		map models/players/heads/ursula/ursula_e
		blendFunc Add
		rgbgen wave triangle 0.2 0.5 0 0.2
       	}

}


models/players/heads/gaunt/gaunt_e
{
        surfaceparm trans
	{
		map models/players/heads/gaunt/gaunt_e
		blendFunc Add
		rgbgen wave triangle 0.2 0.5 0 0.2
       	}

}
models/powerups/ob2_target
{
	cull none

        {
		map models/powerups/ob2_target
		//rgbGen identity
		rgbGen entity
	}

}

models/powerups/ob2_energy
{
	cull none

        {
		map models/powerups/ob2_energy
		//rgbGen identity
		rgbGen entity
		blendfunc add
	}

}

models/powerups/ob2_energy2
{
	cull none

	{
		map models/powerups/ob2_energy2
		//rgbGen identity
		rgbGen entity

	}

}

models/powerups/ob2_lightning1
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		AnimMap 15 models/powerups/ob2_lightn1 models/powerups/ob2_lightn2 models/powerups/ob2_lightn3 models/powerups/ob2_lightn4 models/powerups/ob2_lightn5 models/powerups/ob2_lightn6 models/powerups/ob2_lightn7 models/powerups/ob2_lightn8
		rgbGen identity
		blendfunc add
	}


}

models/powerups/ob2_lightning2
{

	deformVertexes wave 30 sin 0 3 0 .1
        cull none

        {
		AnimMap 15 models/powerups/ob2_lightn3 models/powerups/ob2_lightn1 models/powerups/ob2_lightn4 models/powerups/ob2_lightn2 models/powerups/ob2_lightn6 models/powerups/ob2_lightn5 models/powerups/ob2_lightn8 models/powerups/ob2_lightn7
		rgbGen identity
		blendfunc add
	}


}

models/powerups/ob2_lightning3
{

	deformVertexes wave 100 sin 4 3 0 0.3
        cull none

        {
		AnimMap 15 models/powerups/ob2_lightn4 models/powerups/ob2_lightn6 models/powerups/ob2_lightn1 models/powerups/ob2_lightn3 models/powerups/ob2_lightn8 models/powerups/ob2_lightn4 models/powerups/ob2_lightn5 models/powerups/ob2_lightn3
		rgbGen identity
		blendfunc add
	}


}

models/weaphits/kamiwave01
{

        surfaceparm trans
	cull disable
        nomipmaps
	{
	        clampmap models/weaphits/kamiwave01
		blendFunc Add
                tcmod rotate 20
		rgbGen entity
	}
	{
	        clampmap models/weaphits/kamiwave01
		blendFunc Add
  		tcmod rotate -20
		rgbGen entity
	}
}
models/weaphits/kamiwave02
{

        surfaceparm trans
	cull disable
	{
	        map models/weaphits/kamiwave02
		blendFunc Add
                tcmod scroll 1 0
		rgbGen entity
	}
}


models/powerups/kamitrail
{

        surfaceparm trans
	cull disable
        nomipmaps
	{
	        map models/powerups/kamitrail
		blendFunc Add
		rgbGen identity
	}
}
models/weaphits/proxminet
{
        cull disable
        {
                map models/weaphits/proxmine
                rgbGen lightingdiffuse
        }
        {
                map models/weaphits/proxminebt
                blendFunc add
                rgbGen wave sin .5 .5 0 2
        }

}

models/weaphits/proxmine2t
{
        cull disable
        nomipmaps
        {
                clampmap models/weaphits/proxmine2t
                blendFunc add
                tcmod rotate 200
                tcMod stretch sin .6 0.2 0 .11
                rgbGen identity
        }
        {
                clampmap models/weaphits/proxmine2t
                blendFunc add
                tcmod rotate -200
                tcMod stretch sin .6 0.2 0 .2
                rgbGen identity
        }

}
models/weaphits/kamikred
{
  cull disable
       {
	        map textures/effects/tinfx2d
                tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbgen identity
       }
       {
                map models/weaphits/kamik02r
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate 166
                tcmod Scroll 1.3 .8

                rgbGen identity
       }

}
models/weaphits/kamikblu
{
  cull disable
       {
	        map textures/effects/tinfx2d
                tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbgen identity
       }
       {
                map models/weaphits/kamik02b
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate 166
                tcmod Scroll 1.3 .8

                rgbGen identity
        }
}


models/players/heads/gammy/gammy_blu
{
     deformVertexes wave 100 sin 0 .08 0 .23

        {
                map models/players/heads/gammy/gammy_blu
                rgbGen lightingdiffuse
        }
}
models/players/heads/gammy/gammy_red
{
     deformVertexes wave 100 sin 0 .08 0 .23

        {
                map models/players/heads/gammy/gammy_blu
                rgbGen lightingdiffuse
        }
}
models/players/heads/gammy/gammy2
{
     deformVertexes wave 100 sin 0 .08 0 .23
     cull disable

        {
                map models/players/heads/gammy/gammy2
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}
models/players/heads/gammy/gammy3
{
     deformVertexes wave 100 sin 0 .08 0 .23
     cull disable

        {
                map models/players/heads/gammy/gammy3
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}


models/players/heads/morgan/morgan_blu
{


        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/morgan/morgan_blu
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}
models/players/heads/morgan/morgan_red
{


        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/morgan/morgan_red
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}

models/players/heads/megan/megan1_blu
{


        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/megan/megan1_blu
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}
models/players/heads/megan/megan1_red
{



        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/megan/megan1_red
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}


models/players/heads/megan/megan3
{

     //cull disable

       // {
       //         map models/players/heads/megan/megan3
       //         blendFunc Add
       //         rgbGen lightingdiffuse
       // }
        {
                map textures/effects/tinfx2c
                blendFunc Add
                tcGen environment
                rgbGen lightingdiffuse
        }

}
models/players/heads/megan/megan2
{


        {
                map textures/effects/tinfx2c
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/megan/megan2
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}

models/powerups/teleporter/tele_enter
{

     cull disable

        {
                clampmap models/powerups/teleporter/tele_enter
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}
models/powerups/teleporter/tele_enter2
{

     cull disable

        {
                clampmap models/powerups/teleporter/tele_enter2
                blendfunc Add
                tcmod rotate 120
                rgbGen lightingdiffuse
        }
}
models/powerups/teleporter/tele_exit2
{

     cull disable

        {
                clampmap models/powerups/teleporter/tele_exit2
                blendfunc Add
                tcmod rotate 120
                rgbGen lightingdiffuse
        }
}
models/powerups/teleporter/tele_exit
{

     cull disable

        {
                clampmap models/powerups/teleporter/tele_exit
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}



models/players/heads/neptune/neptune2
{

     //cull disable

        {
                map models/players/heads/neptune/neptune2
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}

models/mapobjects/techlamp/techlamp02trn
{

     cull disable
     surfaceparm alphashadow

        {
                map models/mapobjects/techlamp/techlamp02trn
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}
models/mapobjects/techlamp/techlamp02lt
{

     cull disable
     surfaceparm alphashadow

        {
                map models/mapobjects/techlamp/techlamp02lt
                BlendFunc Add
                rgbGen wave sin 0 1 0 .5
        }
}
models/mapobjects/techlamp/techlamp_rail
{

     cull disable
     surfaceparm alphashadow

        {
                map models/mapobjects/techlamp/techlamp_rail
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}
models/mapobjects/techlamp/techlamp_rail2
{
     deformVertexes move 0 0 2  sin 0 4 0 0.33
     surfaceparm alphashadow
     cull disable

        {
                map models/mapobjects/techlamp/techlamp_rail2
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}
models/mapobjects/techlamp/techlamp_rail2b
{
     deformVertexes move 0 0 2  sin 0 4 0.5 0.33
     surfaceparm alphashadow
     cull disable

        {
                map models/mapobjects/techlamp/techlamp_rail2b
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}

models/mapobjects/techlamp/techlamp_pole
{
 deformVertexes normal .1 .03
        {
                map models/mapobjects/techlamp/techlamp_pole2
                tcmod Scale 1 2
                tcGen environment
                tcmod scroll 0 .3
                rgbGen identity

        }
        {
                map models/mapobjects/techlamp/techlamp_pole
                blendFunc blend
                rgbGen Vertex

        }


}

models/mapobjects/slamp/slamp3x
{
    deformVertexes autoSprite2
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
   //q3map_surfacelight	100

        {
                map models/mapobjects/slamp/slamp3x
                blendFunc GL_ONE GL_ONE

        }


}

models/flags/pole
{

        {
             map textures/effects/tinfx
		tcGen environment
		rgbGen lightingDiffuse

        }


}

models/flag/flagbits2
{
               cull none
	{
                map models/mapobjects/statues/flagbits_stat
                alphaFunc GE128
                rgbGen lightingDiffuse
                depthWrite
        }

}

models/flag/flagbits
{
               cull none
	      // deformVertexes wave 100 sin 0 5 0 .7
	 {
                map models/flags/flagbits
                //blendfunc blend
                alphaFunc GE128
                rgbGen lightingDiffuse
                depthWrite
        }


}
models/flag2/w_flag2
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		map models/flag2/w_flag2
		 rgbGen identity
	}
        {
		map models/flag2/neutral_fx
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7

                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flag2/w_flag2
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}
models/flag2/r_flag2
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		map models/flag2/r_flag2
		 rgbGen identity
	}
        {
		map models/flag2/red_fx
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7

                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flag2/r_flag2
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}
models/flag2/b_flag2
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		map models/flag2/b_flag2
		 rgbGen identity
	}
        {
		map models/flag2/blue_fx
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flag2/b_flag2
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
}
models/powerups/kamikazi1
{
        {
	        map textures/effects/tinfx2d
		tcGen environment
		rgbGen identity
        }
}

models/powerups/kamikazi2
{
        {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc add
                rgbGen identity
        }
}

models/powerups/kamikazi_f
{

        {
	        map models/powerups/kamikazi_f
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}

models/players/xscout/scout2x
{
    cull disable
        {
	        map models/players/xscout/scout2
		blendfunc Add
                tcmod Scroll 1.3 0
                rgbGen identity
        }
}

models/powerups/ammo1
{
        {
	        map textures/effects/envmapmach
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}

models/powerups/ammo2
{
    cull disable
        {
	        map models/powerups/ammo2
		blendfunc Add
                tcmod Scroll 1.3 0
                rgbGen identity
        }
}


models/powerups/scout1
{
        {
	        map textures/effects/envmapgreen
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}

models/powerups/scout2
{
    cull disable
        {
	        map models/powerups/scout2
		blendfunc Add
                tcmod Scroll .9 0
                rgbGen identity
        }
}

models/powerups/guard1
{
        {
	        map textures/effects/envmapblue
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/guard2
{
    cull disable
        {
	        map models/powerups/guard2
		blendfunc Add
                tcmod Scroll .9 0
                rgbGen identity
        }
}
models/powerups/doubler1
{
        {
	        map textures/effects/envmaproc
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/doubler2
{
    cull disable
        {
	        map models/powerups/doubler2
		blendfunc Add
                tcmod Scroll .9 0
                rgbGen identity
        }
}
models/mapobjects/spawn/spawn3
{

     cull disable

        {
                clampmap models/mapobjects/spawn/spawn3_b
                tcmod rotate 222
                rgbGen identity
        }
        {
                clampmap models/mapobjects/spawn/spawn3
                blendfunc Blend
                rgbGen vertex
        }
}
models/mapobjects/spawn/spawn3_r
{

     cull disable

        {
                clampmap models/mapobjects/spawn/spawn3_r
                tcmod rotate 222
                rgbGen identity
        }
        {
                clampmap models/mapobjects/spawn/spawn3
                blendfunc Blend
                rgbGen vertex
        }
}

models/powerups/obelisk/ob_trns
{

     cull disable

        {
                map models/powerups/obelisk/ob_trns
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}

models/powerups/obelisk/ob_sft
{
        {
	        map models/powerups/obelisk/ob_sft2
		tcmod scroll 0 .05
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
        }

        {
                map models/powerups/obelisk/ob_sft
                blendfunc blend
                rgbGen lightingdiffuse
        }

}

models/powerups/obelisk/ob_twirl
{
     cull disable
     nomipmaps
     deformVertexes move 0 0 2  sin 0 5 0 0.33
        {
                clampmap models/powerups/obelisk/ob_twirl
                tcmod rotate 103
                Blendfunc Add
                rgbGen identity
        }

}
models/powerups/obelisk/ob_twirl2
{
     cull disable
     nomipmaps
     deformVertexes move 0 0 3  sin 0 5 0 0.2
        {
                clampmap models/powerups/obelisk/ob_twirl2
                tcmod rotate -73
                Blendfunc Add
                rgbGen identity
        }

}
models/powerups/obelisk/ob_flare
{
     cull disable
     nomipmaps
      deformVertexes autoSprite2
        {
                map models/powerups/obelisk/ob_flare
                Blendfunc Add
                rgbGen identity
        }

}

models/powerups/obelisk/ob_flare2
{
     cull disable
     nomipmaps
      deformVertexes autoSprite
        {
                map models/powerups/obelisk/ob_flare2
                Blendfunc Add
                rgbGen identity
        }

}
models/powerups/obelisk/ob_cyl
{
     cull disable

        {
                map models/powerups/obelisk/ob_cyl
                Blendfunc Add
                tcmod scroll .2 0
                rgbGen identity
        }

        {
                map models/powerups/obelisk/ob_cyl
                Blendfunc Add
                tcmod scroll -.33 0
                rgbGen identity
        }
}

models/powerups/orb/red
{
     cull disable

        {
                map models/powerups/orb/red
                Blendfunc Add
                rgbGen identity
        }
        {
                map models/powerups/orb/redfx
                //tcGen environment
                tcmod scroll 0 0.2
                Blendfunc Add
                rgbGen wave sin .5 .5 0 .5
        }
}
models/powerups/orb/blue
{
     cull disable

        {
                map models/powerups/orb/blue
                Blendfunc Add
                rgbGen identity
        }
        {
                map models/powerups/orb/bluefx
                //tcGen environment
                tcmod scroll 0 0.2
                Blendfunc Add
                rgbGen wave sin .5 .5 0 .5
        }
}

models/weaphits/kamik01
{
  cull disable
       {
	        map models/weaphits/kamik01
                tcGen environment
                blendfunc GL_ONE GL_ZERO
		//blendfunc   	blend
                //alphaGen	wave inversesawtooth 1 1 0 1
                rgbGen identity
       }
       {
                map models/weaphits/kamik02
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate 66
                tcmod Scroll 1.3 .8

                rgbGen identity
        }
       {
                map models/weaphits/kamik02
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate -116
                tcmod Scroll -1 .3

                rgbGen identity
        }
}
models/powerups/ammo/proxammo
{
       {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/proxammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/proxammo2
{
       {
	        map models/powerups/ammo/proxammo2
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
}

models/powerups/ammo/chaingammo
{
       {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/chaingammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/chaingammo2
{
       {
	        map models/powerups/ammo/chaingammo2
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
}

models/powerups/ammo/nailgammo
{
       {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/nailgammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/nailgammo2
{
       {
	        map models/powerups/ammo/nailgammo2
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
}

models/weapons/proxmine/f_proxmine
{
        cull disable
        {
                map models/weapons/proxmine/f_proxmine
                blendFunc add
                rgbGen identity
        }


}

models/weapons/proxmine/proxmine2
{
        cull disable
        {
                map models/weapons/proxmine/proxmine2
                rgbGen lightingdiffuse
        }
        {
                map models/weapons/proxmine/proxmine2b
                blendFunc add
                rgbGen wave sin .5 .5 0 2
        }

}

models/weapons/proxmine/proxmine1
{
        cull disable
        {
                map models/weapons/proxmine/proxmine1b
                tcmod scroll 0 2
                rgbGen lightingdiffuse
        }
        {
                map models/weapons/proxmine/proxmine1
                blendFunc Blend
                rgbGen lightingdiffuse
        }

}
models/weaphits/kam01
{
        cull disable
        {
                map models/weaphits/kam01
                blendFunc add
                tcmod Scroll 1.4 0
                rgbGen identity
        }
        {
                map models/weaphits/kam02
                blendFunc add
                tcmod Scroll -1.9 0
                rgbGen identity
        }

}
models/weaphits/kam02
{
        cull disable
        {
                map models/weaphits/kam01
                blendFunc add
                tcmod Scroll -2 0
                rgbGen identity
        }
        {
                map models/weaphits/kam02
                blendFunc add
                tcmod Scroll 1 0
                rgbGen identity
        }

}
models/weaphits/kam03
{
        cull disable
        deformVertexes autoSprite
        {
                clampmap models/weaphits/kam03
                blendFunc add
                tcmod rotate 133
                rgbGen identity
        }
        {
                clampmap models/weaphits/kam03b
                blendFunc add
                tcmod rotate -113
                rgbGen identity
        }

}
models/weaphits/kam04
{
        cull disable
        deformVertexes autoSprite
        {
                clampmap models/weaphits/kam04
                blendFunc add
                tcmod rotate 999
                rgbGen identity
        }


}
models/weaphits/proxmine
{
        cull disable
        {
                map models/weaphits/proxmine
                rgbGen lightingdiffuse
        }
        {
                map models/weaphits/proxmineb
                blendFunc add
                rgbGen wave sin .5 .5 0 2
        }

}

models/weaphits/proxmine2
{
        cull disable
        nomipmaps
        {
                clampmap models/weaphits/proxmine2
                blendFunc add
                tcmod rotate 200
                tcMod stretch sin .6 0.2 0 .11
                rgbGen identity
        }
        {
                clampmap models/weaphits/proxmine2
                blendFunc add
                tcmod rotate -200
                tcMod stretch sin .6 0.2 0 .2
                rgbGen identity
        }

}

models/weapons/nailgun/nail
{

     cull disable

        {
                map models/weapons/nailgun/nail
                alphaFunc GE128
		depthWrite
                rgbGen identity
        }
}

models/weapons/nailgun/nail2
{
     cull disable

        {
                map models/weapons/nailgun/nail2
                alphaFunc GE128
		depthWrite
                rgbGen identity
        }
}

models/weapons/nailgun/f_nailgun
{
     cull disable

        {
                map models/weapons/nailgun/f_nailgun
                Blendfunc Add
                rgbGen identity
        }
}

models/weapons/nailgun/nailgun
{
     //deformVertexes normal .2 .1
     cull disable

        {
                map models/weapons/nailgun/nailgun_env
                //tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/weapons/nailgun/nailgun
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/fritzkrieg/fritz_fx
{

     cull disable

        {
                map models/players/fritzkrieg/fritz_fx2
                //tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/fritzkrieg/fritz_fx
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/fritzkrieg/fritz_c
{

	cull none
        //nopicmip
	{
		map models/players/fritzkrieg/fritz_c
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/fritzkrieg/beam
{
     deformVertexes autoSprite2
     cull disable

        {
                map models/players/fritzkrieg/beam
                Blendfunc Add
                rgbGen identity
        }
}
models/players/fritzkrieg/beam2
{
     deformVertexes autoSprite
     cull disable

        {
                map models/players/fritzkrieg/beam2
                Blendfunc Add
                rgbGen identity
        }
}
models/players/heads/khan/khan_f
{

	cull twosided
        //nopicmip
	{
		map models/players/heads/khan/khan_f
		blendFunc Blend
		//depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/piston
{
	deformVertexes move 0 0 .07  sin 0 5 0 2
	cull none
        //nopicmip
	{
		map models/players/pi/piston
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/pi_t
{

	cull none
        //nopicmip
	{
		map models/players/pi/pi_t
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/ntrl_t
{

	cull none
        //nopicmip
	{
		map models/players/pi/ntrl_t
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/pi_t2
{

	cull none
        //nopicmip
	{
		map models/players/pi/pi_t2
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/hair
{

	surfaceparm	nodraw
        //nopicmip
	//{
	//	map models/players/pi/hair
	//	blendFunc Blend
		//depthWrite
	//	rgbGen lightingdiffuse
	//}

}
models/players/pi/null
{

	surfaceparm	nodraw

}

models/players/pi/pi
{
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/pi/pi
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

models/players/pi/beam
{
     deformVertexes autoSprite2
     cull disable

        {
                map models/players/pi/beam
                Blendfunc Add
                rgbGen identity
        }
}
models/players/pi/beam2
{
     deformVertexes autoSprite
     cull disable

        {
                map models/players/pi/beam2
                Blendfunc Add
                rgbGen identity
        }
}
models/players/pi/endcap
{
	cull none
	{
		clampmap models/players/pi/endcap
		alphaFunc GE128
                tcmod rotate 12
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/redendcap
{
	cull none
	{
		clampmap models/players/pi/redendcap
		alphaFunc GE128
                tcmod rotate 12
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/bluendcap
{
	cull none
	{
		clampmap models/players/pi/bluendcap
		alphaFunc GE128
                tcmod rotate 12
		depthWrite
		rgbGen lightingdiffuse
	}

}
models/players/pi/gear01
{
	cull none
        //nopicmip
	{
		clampmap models/players/pi/gear01
		alphaFunc GE128
                tcmod rotate -102
		depthWrite
		rgbGen lightingdiffuse
	}

}
////////////////////////////////
// FEMALE TEAM MODEL SHADERS  //
////////////////////////////////


models/players/janet/thefallen/thefallen_red
{

    \\ cull disable
        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/thefallen/thefallen_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/thefallen/thefallen_blu
{

     //cull disable
        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/thefallen/thefallen_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}



models/players/janet/intruders/intruders_red
{

     //cull disable
        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/intruders/intruders_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/intruders/intruders_blu
{

     //cull disable
        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/intruders/intruders_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}


models/players/janet/stroggs/stroggs_red
{

     //cull disable
        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/stroggs/stroggs_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/stroggs/stroggs_blu
{

     //cull disable
        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/stroggs/stroggs_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/crusaders/crusaders_red
{

    // cull disable
        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/crusaders/crusaders_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/crusaders/crusaders_blu
{

     //cull disable
        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/crusaders/crusaders_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_h_blu
{


        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_h_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_blu
{

     //cull disable
        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_h_red
{


        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_h_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_red
{

     //cull disable
        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
////////////////////////////////
//  MALE TEAM MODEL SHADERS   //
////////////////////////////////
models/players/james/intruders/intruders_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/intruders/intruders_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/thefallen/thefallen_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/thefallen/thefallen_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/intruders/intruders_h_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_h_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/intruders/intruders_h_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_h_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/crusaders/crusaders_h_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_h_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/crusaders/crusaders_h_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_h_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/thefallen/thefallen_h_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_h_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/thefallen/thefallen_h_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_h_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/crusaders/crusaders_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/crusaders/crusaders_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/james/stroggs/stroggs_h_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_h_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/stroggs/stroggs_h_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_h_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/stroggs/stroggs_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/stroggs/stroggs_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_h_blu
{


        {
                map models/players/james/blue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_h_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_h_red
{


        {
                map models/players/james/red
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_h_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_e_blu
{

        {
                map models/players/james/blue2
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/james/pagans/pagans_e_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_e_red
{

        {
                map models/players/james/red2
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/james/pagans/pagans_e_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_blu
{

     //cull disable

        {
                map models/players/james/blue
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_blu
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_red
{

     //cull disable

        {
                map models/players/james/red
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_red
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/gratelamp/lightbulb
{
    surfaceparm	trans

	{
		map models/mapobjects/gratelamp/lightbulb
		tcGen environment
                blendFunc Add
                rgbGen identity
	}

}
models/mapobjects/gratelamp/gratelight
{
    cull disable
    surfaceparm	trans
    nopicmip

        {
                map models/mapobjects/gratelamp/gratelight
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratelight_flare
{
	deformVertexes autoSprite
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map models/mapobjects/gratelamp/gratelight_flare
		blendFunc Add
                rgbGen wave sin .5 .2 0 0
	}

}
models/mapobjects/wallhead2/demonhead1
{
        {
                map textures/sfx/firegorre
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0.1 1
                rgbGen identity
	}
        {
		map models/mapobjects/wallhead2/demonhead1
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/wallhead2/wallhead2_1
{
        {
                map textures/sfx/firegorre
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0.1 1
                rgbGen vertex
	}
        {
		map models/mapobjects/wallhead2/wallhead2_1
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/wallhead2/wallhead2_eye

{
	cull disable
        surfaceparm trans
        deformVertexes autoSprite
        {
		clampmap models/mapobjects/wallhead2/wallhead2_eye
		blendFunc add
                tcmod rotate 160
		//rgbGen wave sin .5 .5 0 .01
                rgbGen wave sin .5 .2 0 0


	}

}
models/mapobjects/wallhead2/wallhead2_h1

{
	cull disable
        surfaceparm trans
        {
		map models/mapobjects/wallhead2/wallhead2_h1
		alphaFunc GE128
                depthWrite
		rgbGen vertex

	}
}
models/mapobjects/wallhead2/wallhead2_h2

{
	cull disable
        surfaceparm alphashadow
        {
		map models/mapobjects/wallhead2/wallhead2_h2
		alphaFunc GE128
                depthWrite
		rgbGen vertex

	}
}
models/mapobjects/wallhead2/wallhead2_h3

{
	cull disable
        surfaceparm alphashadow
        {
		map models/mapobjects/wallhead2/wallhead2_h3
		alphaFunc GE128
                depthWrite
		rgbGen vertex

	}
}
models/mapobjects/horned/horned_blu
{

        {
                map textures/sfx2/blufirewall
                tcmod scroll 0.1 1
	}
        {
		map models/mapobjects/horned/horned_blu
                blendFunc blend
		rgbGen vertex
	}

}
models/flags/n_flag2
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		map models/flags/n_flag2
		 rgbGen identity
	}
        {
		map models/flags/neutral_fx
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flags/n_flag2
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow
                tcGen environment
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
}
models/players/meep/meep
{
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/meep/meep
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
models/players/meep/meep_h
{
        cull disable
        {
                map models/players/meep/meep_h
                rgbGen lightingdiffuse
        }
        {
                map models/players/meep/meep_h2
                blendFunc add
                rgbGen wave sin .5 .5 0 .5
        }

}
models/players/meep/meep_f
{
        cull disable
        {
                map models/players/meep/meep_f
                rgbGen lightingdiffuse
        }

}
models/players/meep/meep_g
{
        cull disable
        {
                map models/players/meep/meep_g
                blendFunc Add
                tcGen environment
                rgbGen lightingdiffuse
        }

}

models/players/meep/meep_w

{
	cull disable
        {
		map models/players/meep/meep_w
		alphaFunc GE128
                depthWrite
		rgbGen lightingdiffuse

	}
}

models/mapobjects/flagbase/base_s

{
	surfaceparm	nodraw
}

models/mapobjects/flagbase/beam_blue
{
     surfaceparm	trans
     nomipmaps
     cull disable
        {
		map models/mapobjects/flagbase/beam_blue
                blendFunc add
                tcmod scroll -.5 0
                rgbGen wave sin .5 .5 0.5 0.09
	}
}
models/mapobjects/flagbase/beam_ntrl
{
     surfaceparm	trans
     nomipmaps
     cull disable
        {
		map models/mapobjects/flagbase/beam_ntrl
                blendFunc add
                tcmod scroll -.5 0
                rgbGen wave sin .5 .5 0.5 0.09
	}
}
models/mapobjects/flagbase/beam_red
{
     surfaceparm	trans
     nomipmaps
     cull disable
        {
		map models/mapobjects/flagbase/beam_red
                blendFunc add
                tcmod scroll -.5 0
                rgbGen wave sin .5 .5 0.5 0.09
	}
}
models/mapobjects/flagbase/swirl_ntrl
{
        {
	        map models/mapobjects/flagbase/swirl_ntrl
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map models/mapobjects/flagbase/swirl_ntrl
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map models/mapobjects/flagbase/base_r
		blendFunc blend
	        rgbGen lightingdiffuse
	}

}
models/mapobjects/flagbase/swirl_red
{
        {
	        map models/mapobjects/flagbase/swirl_red
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map models/mapobjects/flagbase/swirl_red
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map models/mapobjects/flagbase/base_r
		blendFunc blend
	        rgbGen lightingdiffuse
	}

}
models/mapobjects/flagbase/swirl_blue
{
        {
	        map models/mapobjects/flagbase/swirl_blue
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map models/mapobjects/flagbase/swirl_blue
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map models/mapobjects/flagbase/base_r
		blendFunc blend
	        rgbGen lightingdiffuse
	}

}
models/mapobjects/flagbase/env_red
{
       {
	        map models/mapobjects/flagbase/env_red
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/mapobjects/flagbase/base_e
		blendfunc blend
                rgbGen lightingdiffuse
       }
}
models/mapobjects/flagbase/env_ntrl
{
       {
	        map models/mapobjects/flagbase/env_ntrl
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/mapobjects/flagbase/base_e
		blendfunc blend
                rgbGen lightingdiffuse
       }
}
models/mapobjects/flagbase/env_blue
{
       {
	        map models/mapobjects/flagbase/env_blue
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/mapobjects/flagbase/base_e
		blendfunc blend
                rgbGen lightingdiffuse
       }
}
