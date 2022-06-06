//
// this file contains shaders attached models
//

models/mapobjects/console/under

{
	cull disable
        surfaceparm alphashadow
        //surfaceparm nodraw
        {
		clampmap models/mapobjects/console/under
		alphaFunc GE128
                depthWrite
		rgbGen vertex

	}
}
models/mapobjects/console/rotate

{
	cull disable

        {
		clampmap models/mapobjects/console/rotate
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 40
		rgbGen vertex
	}
}

models/mapobjects/console/centercon

{
	cull disable
        {
		map models/mapobjects/console/scrolltext
		blendFunc add
                tcmod scroll 0 -.3
                //tcMod stretch sin .9 0.1 0 1.1
		rgbGen vertex
	}

        {
		clampmap models/mapobjects/console/centercon
		blendFunc add
                tcMod stretch sin .9 0.1 0 .2
                tcmod rotate 40
		rgbGen vertex
	}
}

models/mapobjects/console/console

{
	cull disable

        {
		map textures/effects/tinfx2c
		blendFunc GL_ONE GL_ZERO
                tcGen environment
		rgbGen vertex
	}
        {
		map models/mapobjects/console/console
		blendFunc blend
		rgbGen vertex
	}
        {
		map models/mapobjects/console/console2
		blendFunc add
		rgbGen vertex
                rgbGen wave sin .5 .5 0 .2
	}
}

models/mapobjects/console/sphere

{
	cull disable

        {
		map models/mapobjects/console/spherex2
		blendFunc add
	        tcmod rotate 40
                tcGen environment
                tcmod scroll 5 .4
		rgbGen wave sin .5 .5 0 .2
	}

	 {
		map models/mapobjects/console/spherex
		blendFunc add
	        tcmod rotate 40
                tcGen environment
                tcmod scroll 5 .4
		rgbGen wave sin .5 .5 0 -.2
	}
}

models/mapobjects/console/sphere2

{
	cull disable
        deformVertexes autoSprite

        //{
	//	clampmap models/mapobjects/console/sphere2
	//	alphaFunc GE128
        //        depthWrite
        //        //tcMod stretch sin .9 0.1 0 .5
        //        tcmod rotate 40
	//	rgbGen identity
	//}
        {
		map models/mapobjects/console/sphere3
		blendFunc add
               // depthWrite
		rgbGen wave sin .5 .5 0 .2
	}
        {
		map models/mapobjects/console/sphere4
		blendFunc add
               // depthWrite
		rgbGen wave sin .5 .5 0 -.2
	}
         {
		clampmap models/mapobjects/console/sphere2
		alphaFunc GE128
                //blendfunc blend
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 40
		rgbGen identity
	}
}

models/mapobjects/console/jacobs
{
	cull disable

        {
		map textures/effects/tinfxb
		blendFunc add
                tcGen environment
                rgbGen identity
	}
}

models/mapobjects/console/scrolltext

{
	cull disable

        {
		map models/mapobjects/console/scrolltext
		blendFunc add
                tcmod scroll 0 -.3
                //tcMod stretch sin .9 0.1 0 1.1
		rgbGen vertex
	}
}

models/players/slash/yurikoskate
{
	cull disable
        deformVertexes autoSprite


        {
		clampmap models/players/slash/yurikoskate
		blendFunc blend
                //tcMod stretch sin .9 0.1 0 1.1
                tcmod rotate 999
		rgbGen lightingdiffuse
	}
        {
		clampmap models/players/slash/yurikoskate
		blendFunc blend
                //tcMod stretch sin .9 0.1 0 -1.1
                tcMod stretch sin .9 0 0 0
                tcmod rotate 20
		rgbGen lightingdiffuse
	}
}
models/players/slash/yuriko
{
        {
                map textures/effects/envmaproc
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/yuriko
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/slash/yuriko_h
{
        {
                map textures/effects/envmaproc
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/yuriko_h
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy
{
        {
                map textures/effects/envmaproc
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/hunter/hunter2
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy_h
{
        {
                map textures/effects/envmaproc
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/hunter/hunter_h
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy_f
{
      surfaceparm	nodraw
}
models/mapobjects/standlamp2
{

        {
                map textures/effects/tinfx2
                tcGen environment
                rgbGen identity
        }
        {
                map models/mapobjects/standlamp2
                blendfunc blend
                rgbGen vertex
        }

}
models/players/uriel/zael
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/uriel/zael
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/mapobjects/pipe/pipe02
{

        {
                map textures/effects/tinfx2d
                tcGen environment
                rgbGen identity
        }
        {
                map models/mapobjects/pipe/pipe02
                blendfunc blend
                rgbGen lightingdiffuse
        }

}
models/players/slash/grrl_h
{

        {
                map textures/effects/tinfx2d
                tcGen environment
                rgbGen identity
        }
        {
                map models/players/slash/grrl_h
                blendfunc blend
                rgbGen lightingdiffuse
        }

}
models/mapobjects/pipe/pipe02x
{
    q3map_lightimage textures/sfx/electricslime_old
    q3map_surfacelight 150
    cull disable
        {
                map textures/effects/tinfx2b
                tcGen environment
                tcmod scale 1 2
                blendfunc add
                rgbGen identity
        }
        {
                map textures/sfx/electricslime_old
                //tcGen environment
                //tcmod scale 2 2
                //tcmod rotate  240
                tcmod scroll 7.2 1
                blendfunc add
                rgbGen identity
        }

}
models/mapobjects/skull/monkeyhead

{
        //deformVertexes wave 100 sin 0 .7 0 .2
        //deformVertexes wave 100 sin 0 .5 1 .1
        cull disable
        nomipmaps

        {
                map models/mapobjects/skull/monkeyhead
                rgbGen vertex
        }
	{
		//animMap 0.5 models/mapobjects/skull/monkeyhead //models/mapobjects/wallhead/femhead2
                map models/mapobjects/skull/monkeyheadb
		blendFunc	blend
		alphaGen	wave sin 0 1 1 .1
                // alphaGen	wave triangle 0 .7 0 .2
                rgbGen vertex
	}

}
models/mapobjects/skull/monkeyhead2
{
    cull disable
    surfaceparm  trans
    nomipmaps
        {
                map models/mapobjects/skull/monkeyhead2
                blendfunc blend
		depthWrite
		rgbGen vertex
        }
}

models/powerups/armor/shard2
{
        {
                map textures/effects/tinfx2c
                tcGen environment
                rgbGen identity
        }
        {
                map models/powerups/armor/shard2
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/jets/jet_1
{
     surfaceparm	trans
     nomipmaps
     cull disable
        {
		map models/mapobjects/jets/jet_1
                blendFunc add
                tcmod scale  .5  1
                tcmod scroll 6 0
                rgbGen identity
	}
        {
		map models/mapobjects/jets/jet_2
                blendFunc add
                tcmod scroll 3 -.5
                rgbGen wave inversesawtooth -.3 1.3 0 .5
	}
}
models/mapobjects/jets/jet_as
{
     deformVertexes autoSprite2
     deformVertexes wave 100 sin 0 1 0 9
     surfaceparm	trans
     nomipmaps
        {
		map models/mapobjects/jets/jet_as
                blendFunc add
                rgbGen identity
	}
}
models/players/crash/crash_f
{

        {
                map textures/sfx/snow
                tcmod scale .5 .5
                tcmod scroll  9 0.3
                rgbGen identity
        }
        {
                map textures/effects/tinfx2b
                tcGen environment
                blendFunc add
                rgbGen lightingdiffuse
        }
}
models/players/crash/crash_t
{
        {
                map textures/effects/envmapblue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/crash/crash_t
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/crash/crash
{
        {
                map textures/effects/envmapblue
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/crash/crash
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/razor/id
{
        {
                map textures/effects/tinfx2d
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/razor/id
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/razor/h_id
{
        {
                map textures/effects/tinfx2d
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/razor/h_id
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/cross/cross_skull
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/cross/cross_skull
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}


models/mapobjects/cross/cross
{
    q3map_lightimage models/mapobjects/cross/cross_light
    q3map_surfacelight 300

        {
                map textures/sfx/firewalla
                tcmod scale 4 4
                tcmod scroll 0.1 2
                rgbGen identity
	}
        {
		map models/mapobjects/cross/cross
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/baph/baphomet_gold
{

        {
                map textures/sfx/firewalla
                tcmod scroll 0.1 1
                rgbGen identity
	}
        {
		map models/mapobjects/baph/baphomet_gold
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/baph/baphomet
{

        {
                map textures/sfx/firewalla
                tcmod scroll 0.1 1
                rgbGen identity
	}
        {
		map models/mapobjects/baph/baphomet
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/banner/q3banner04

{
  cull disable
  nomipmaps

        {
		//map models/mapobjects/banner/q3banner04
                map textures/sfx/firegorre2
                blendFunc GL_ONE GL_ZERO
                tcmod scale .05 .1
                tcMod turb 0 .25 0 .6
                tcmod scroll .4 .3
	        //rgbGen wave sin .5 .5 0 .1
	}
        {

               map textures/sfx/bolts
               tcmod scale .2 .2
               tcmod rotate 999
               tcmod scroll 9 9
               blendfunc add
               rgbGen wave sin .5 .5 0 .2
	}
        {
                map textures/sfx/firegorre2
                //map models/mapobjects/banner/q3banner04
                blendFunc add
                tcGen environment
                tcmod scale 5  5
                tcmod scroll 0.09 0.04
                //rgbGen wave sin .5 .5 0 .1
	}

}

models/mapobjects/banner/q3banner02

{
    cull disable
    nomipmaps
    //deformVertexes wave 70 sin 0 .7 0 .4

        {
		map models/mapobjects/banner/q3banner02
                blendFunc add
                tcmod scale  2  1
                tcmod scroll .33 0
                rgbGen wave sin 1 .1 0 .2
	}
        {
		map models/mapobjects/banner/q3banner02
                blendFunc add
                tcmod scale  3  1
                tcmod scroll -.45 0
                rgbGen wave sin .5 .5 0 .2
	}
        {
		map models/mapobjects/banner/q3banner02x
                blendFunc add
                tcmod scale  4  1
                tcmod scroll 1 0
               // rgbGen wave sin .5 .5 0 -.2
	}
}
models/mapobjects/horned/horned
{

        {
                map textures/sfx/firewalla
                tcmod scroll 0.1 1
	}
        {
		map models/mapobjects/horned/horned
                blendFunc blend
		rgbGen vertex
	}

}
models/players/bones/red
{

    cull disable
        {
                map models/players/bones/red
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/players/bones/blue
{

    cull disable
        {
                map models/players/bones/blue
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/players/bones/xray
{

    cull disable
        {
                map models/players/bones/xray
                blendfunc add
                //rgbGen wave sin 1 .8 0 9
        }
        {

                map models/mapobjects/bitch/hologirl2
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc add
		rgbGen identity
	}


}

models/players/bones/stiff
{

    cull disable
        {
                map models/players/bones/stiff
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/mapobjects/skel/skel
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/skel/skel
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

models/mapobjects/skel/xray
{
    deformVertexes move 0 0 .7  sin 0 5 0 0.2
    cull disable
    q3map_surfacelight 300
        {
                map models/mapobjects/skel/xray
                blendfunc add
                rgbGen wave sin 1 .8 0 .3
        }
        {

                map models/mapobjects/bitch/hologirl2
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc add
		rgbGen identity
	}


}
models/mapobjects/spotlamp/spotlamp
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/spotlamp/spotlamp
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/spotlamp/beam
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map models/mapobjects/spotlamp/beam
                tcMod Scroll .3 0
                blendFunc add
        }
        //{
	//	map models/mapobjects/spotlamp/beam
         //       tcMod Scroll -.3 0
         //       blendFunc add
        //}

}
models/mapobjects/spotlamp/spotlamp_l

{
      cull disable
      q3map_surfacelight	200

        {
                map models/mapobjects/spotlamp/spotlamp_l
		rgbGen identity
        }


}

models/players/grunt/stripe_h
{

       {
	        //map textures/effects/tinfx
                map textures/sfx/electricgrade3
		//tcmod scale 6 6
                //tcmod rotate 350
                tcmod scroll 0 -.5
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
        }
        {
		map models/players/grunt/stripe_h
                blendfunc blend
		rgbGen lightingDiffuse
	}

}
models/mapobjects/timlamp/timlamp
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/timlamp/timlamp
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/wallhead/lion_m
{
        {
		map models/mapobjects/wallhead/lion_m
                blendFunc GL_ONE GL_ZERO
		rgbGen vertex
	}
        {
                map textures/sfx/firewalla
                blendFunc add
                tcmod scroll 0.1 1
                //rgbGen wave triangle .5 1 0 .4
	}
        {
		map models/mapobjects/wallhead/lion_m
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/grenadel/grenadelx
{
        surfaceparm trans
        surfaceparm nomarks
	cull none
        nopicmip
	{
		clampmap models/mapobjects/grenadel/grenadelx
		tcMod rotate 10
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
}
//models/mapobjects/baph/bapho_lamp
//{
//
//        {
//                map textures/sfx/specular3b
//                tcGen environment
//                tcmod scroll .1 0
//                rgbGen identity
//	}
//        {
//		map models/mapobjects/baph/bapho_lamp
//                blendFunc blend
//		rgbGen vertex
//	}
//
//
//}

models/mapobjects/baph/wrist
{
     cull none
     nomipmaps
     surfaceparm	trans

        {
         map models/mapobjects/baph/wrist
         blendFunc add
         tcmod scale  2 1
         tcmod scroll 3 0
         rgbGen identity
        }
        {
         map models/mapobjects/baph/wrist
         blendFunc add
         tcmod scale  1 1
         tcmod scroll -5 0
         rgbGen identity
        }
}

models/mapobjects/baph/bapholamp_fx
{
     deformVertexes autoSprite
     surfaceparm	trans
     cull none
     nomipmaps
        {
         clampmap models/mapobjects/baph/bapholamp_fx
         blendFunc add
         tcmod rotate 333
         tcMod stretch sin .9 0.1 0 7
         rgbGen identity
        }
        {
         clampmap models/mapobjects/baph/bapholamp_fx2
         blendFunc add
         tcmod rotate -301
         tcMod stretch sin 1 .1 0 9
         rgbGen identity
        }

}
models/players/biker/cadaver
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/biker/cadaver
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/xaero/xaero
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/xaero/xaero
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/xaero/xaero_h
{
        {
		map models/players/xaero/xaero_h
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/firewalla
                blendFunc add
                tcmod scroll 0.1 1
                //rgbGen wave triangle .5 1 0 .4
	}
        {
		map models/players/xaero/xaero_h
                blendFunc blend
		rgbGen lightingDiffuse
	}

}
models/players/xaero/xaero_q
{

    cull disable

        {
                map models/players/xaero/xaero_q
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/xaero/xaero_a
{
        {
		map textures/effects/envmapbfg
                tcmod rotate 350
                tcmod scroll 3 1
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
        	map models/players/xaero/xaero_a
		blendFunc blend
		rgbGen lightingdiffuse
	}
}
models/players/klesk/klesk_h
{
	{
		map models/players/klesk/klesk_h
                blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse

        }

	{
		map models/players/klesk/klesk_g
		blendfunc add
		rgbGen wave triangle .5 1 0 .5

	}
}
models/players/uriel/uriel_h
{
        {
		map models/players/uriel/uriel_h
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/proto_zzzt
                blendFunc add
                tcmod scroll -0.2 1
                rgbGen identity
	}
        {
		map models/players/uriel/uriel_h
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
models/players/klesk/flisk
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/klesk/flisk
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/klesk/flisk_h
{
        {
		map models/players/klesk/flisk_h
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/bolts
                blendFunc add
                tcmod scale 2 2
                tcmod scroll 2 2
	}
        {
		map models/players/klesk/flisk_h
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
models/weaphits/bfg01
{
        deformVertexes autoSprite
	cull none

        {
                clampmap models/weaphits/bfg01
                blendFunc add
                tcMod rotate 333
                rgbGen identity
        }
        {
                clampmap models/weaphits/bfg01
                blendFunc add
                tcMod rotate -100
                rgbGen identity
        }

}
models/weaphits/bfg02
{
	cull none
        nomipmaps
        {
                map models/weaphits/bfg03
                blendFunc add
                tcmod scroll 2 0
                rgbGen identity
        }
        {
                map models/weaphits/bfg02
                blendFunc add
                tcmod scroll 3 0
                tcMod turb 0 .25 0 1.6
                rgbGen identity
        }
}

models/flags/flagtest
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .2 .2
        cull none

        {
		map models/flags/flagtest
		rgbGen identity
        }
        {
		map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc filter
                rgbGen identity
	}


}
 models/weapons2/grapple/grapple
{
        {
		map models/weapons2/grapple/grapple
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/specular
                blendFunc add
                tcmod scroll .1 .1
                tcGen environment
                rgbGen lightingDiffuse
	}
        {
		map models/weapons2/grapple/grapple
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
models/weapons2/grapple/grapple_j
{

    cull disable

        {
                map models/weapons2/grapple/grapple_j
                blendFunc GL_ONE GL_ZERO
                tcMod turb 0 .5 0 .7
                tcMod scroll 1 -1
                tcmod scale .5 .5
                rgbGen identity
        }
        {
                map textures/liquids/jello2
                blendFunc add
                tcmod scale .7 .7
                tcMod turb 0 .4 0 .3
                tcMod scroll .7 -.4
                rgbGen identity
        }
        {
		map textures/effects/tinfx2
                tcGen environment
                blendFunc add
                rgbGen lightingDiffuse
	}

}
models/weapons2/grapple/grapple_h
{

    cull disable

        {
                map models/weapons2/grapple/grapple_h
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}

models/players/sarge/krusade
{
        {
                map textures/sfx/firegorre
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}
        {
		map models/players/sarge/krusade
                blendFunc blend
		rgbGen lightingDiffuse
	}


}

models/players/sarge/roderic
{
        {
                map textures/sfx/firegorre
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}
        {
		map models/players/sarge/roderic
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
models/players/sarge/null
{
    {
	map models/players/sarge/null
        blendFunc add
    }

}
models/players/uriel/null
{
    {
	map models/players/uriel/null
        blendFunc add
    }

}
models/players/major/daemia
{
        {
                map textures/sfx/electricslime
                blendFunc GL_ONE GL_ZERO
                tcmod scale 3 3
                tcMod turb 0 .5 0 .7
                tcMod scroll 1 -1
                rgbGen identity
	}
        {
		map models/players/major/daemia
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
 models/weapons2/gauntlet/gauntlet2
{
        {
                map textures/sfx/specular
                blendFunc GL_ONE GL_ZERO
                tcGen environment
                //rgbGen lightingDiffuse
                rgbGen identity
	}
        {
		map models/weapons2/gauntlet/gauntlet2
                blendFunc blend
		rgbGen lightingDiffuse
	}


}

///////////////
// begin Podium
//////////////

models/mapobjects/podium/podium
{
        {
		map models/mapobjects/podium/podium
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/specular
                blendFunc add
                tcGen environment
                tcmod scroll .2 0.01
                rgbGen identity
	}
        {
		map models/mapobjects/podium/podium
                blendFunc blend
		rgbGen lightingDiffuse
	}
        {
                map models/mapobjects/podium/podiumglo
                blendFunc add
                rgbGen wave sin 1 1 0 .2
        }


}
models/mapobjects/podium/podskull
{
        {
		map models/mapobjects/podium/podskull
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/specular
                blendFunc add
                tcGen environment
                tcmod scroll .2 0.03
                rgbGen identity
	}
        {
		map models/mapobjects/podium/podskull
                blendFunc blend
		rgbGen lightingDiffuse
	}
        {
                map models/mapobjects/podium/podskullfx
                blendFunc add
                rgbGen wave sin 1 1 0 .2
        }
}
models/mapobjects/podium/podiumfx1
{
      cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1
		blendFunc add
                tcmod scroll 2 -.3
		rgbGen wave inversesawtooth 0 1 .35 .3
	}
        {
		map models/mapobjects/podium/podiumfx1b
		blendFunc add
                tcmod scroll -1.7 -.3
               rgbGen wave inversesawtooth 0 1 .35 .3
	}
        {
		map models/mapobjects/podium/podiumfx1b
		blendFunc add
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 .35 .3
	}
}
models/mapobjects/podium/podiumfx2
{
       cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1
		blendFunc add
                tcmod scale 1 .5
                tcmod scroll .8 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	}
        {
		map models/mapobjects/podium/podiumfx1b
		blendFunc add
                tcmod scale 1 .5
                tcmod scroll -1.7 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	}
        {
		map models/mapobjects/podium/podiumfx1b
		blendFunc add
                tcmod scale 1 .5
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	}
}
models/mapobjects/podium/podiumfx3
{
       cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1
		blendFunc add
                tcmod scale 1 .1
                tcmod scroll 1 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	}
        {
		map models/mapobjects/podium/podiumfx1b
		blendFunc add
                tcmod scale 1 .1
                tcmod scroll -1.7 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	}
        {
		map models/mapobjects/podium/podiumfx1b
		blendFunc add
                tcmod scale 1 .1
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	}
}

///////////////
// End Podium
//////////////

//models/players/ranger/wrack
//{
//        {
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//        	map models/players/ranger/wrack
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//
//}
models/players/ranger/wrack
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/ranger/wrack
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/visor/gorre
{

        {
                map textures/sfx/firegorre
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}
        //{
        //        map textures/sfx/firewallb
        //        blendFunc add
        //        tcmod scale 3 3
        //        tcMod turb 0 .2 0 .1
        //        tcMod scroll 0 3
        //        //tcmod rotate 360
        //        rgbGen identity
        //}
        {
		map models/players/visor/gorre
                blendFunc blend
		rgbGen lightingDiffuse
	}
}
models/powerups/armor/newred
{
        {
                map textures/sfx/specular
                tcGen environment
                rgbGen identity
	}
        {
		map models/powerups/armor/newred
                blendFunc blend
		rgbGen identity
	}


}

models/powerups/armor/newyellow
{
        {
                map textures/sfx/specular
                tcGen environment
                rgbGen identity
	}
        {
		map models/powerups/armor/newyellow
                blendFunc blend
		rgbGen identity
	}


}
models/players/doom/phobos_f
{

         {
		map textures/effects/tinfx
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
	}
        {
		map models/players/doom/phobos_f
                blendFunc blend
		rgbGen lightingDiffuse
	}
}
models/players/doom/phobos
{
         {
                map models/players/doom/phobos_fx
                blendFunc GL_ONE GL_ZERO
                tcmod scale 7 7
                tcMod scroll 5 -5
                tcmod rotate 360
                rgbGen identity
	}
        //{
	//	map textures/effects/tinfx2
        //        tcGen environment
        //        blendFunc add
        //        rgbGen lightingDiffuse
	//}
        {
		map models/players/doom/phobos
                blendFunc blend
		 rgbGen lightingDiffuse
	}
}
models/mapobjects/bat/bat
{
    deformVertexes wave 10 sin 0 3 0 3
    deformVertexes move 500 0 0   sawtooth 0 5 0 .1
    deformVertexes move 0 0 7  sin 0 5 0 .5
    cull disable

        {
                map models/mapobjects/bat/bat
                alphaFunc GE128
		depthWrite
		rgbGen identity
        }


}
models/mapobjects/meteor
{
         deformVertexes move 0 0 10  sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05


        {
                map models/mapobjects/meteor
                rgbGen vertex
                tcMod scale 4.90 2.234
	}


}
models/mapobjects/corpse/torso
{
  deformVertexes wave 100 sin 0 .2 0 .2
         {
		map textures/liquids/proto_grueldark
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 4 4
                tcMod scroll 0 -.09
                tcMod turb 0 0.05 0 .05
                rgbGen vertex
	}
        //{
	//	map textures/liquids/proto_grueldark
        //        //tcGen environment
        //        blendFunc add
        //        tcmod scale 2 2
        //        tcMod scroll 0 -.09
       //         tcMod turb 0 0.07 0 .08
       //         //rgbGen identity
	//}
        {
		map models/mapobjects/corpse/torso
                blendFunc blend
		rgbGen vertex
	}
}
models/mapobjects/corpse/chain
{
    cull disable

        {
                map models/mapobjects/corpse/chain
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/spine
{
    cull disable

        {
                map models/mapobjects/corpse/spine
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/intestine
{

    cull disable

        {
                map models/mapobjects/corpse/intestine
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/intestine2
{
    cull disable
    deformVertexes wave 100 sin 0 .6 0 .2
    // surfaceparm	trans
        {
                map models/mapobjects/corpse/intestine2
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/players/lucy/h_angel
{
      cull none

        {
                map models/players/lucy/h_angel
                depthWrite
                rgbGen lightingDiffuse

        }
        {

		//map textures/effects/envmapcirc3

                map models/mapobjects/bitch/hologirl2
                 tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc add
		 rgbGen identity
                // rgbGen vertex
                 rgbGen lightingDiffuse
	}

}
models/players/lucy/angel
{
         cull none

        {
                map models/players/lucy/angel
                alphaFunc GE128
		depthWrite
		//rgbGen identity
                rgbGen lightingDiffuse

        }
        {

		//map textures/effects/envmapcirc3

                map models/mapobjects/bitch/hologirl2
                 tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc add
		//rgbGen identity
                //rgbGen vertex
                rgbGen lightingDiffuse
	}

}

models/mapobjects/lamps/bot_wing2
{
    //deformVertexes wave 100   sin 0 .5 0 .5
    //deformVertexes move 0 0 1   triangle 0 20 0 1
    deformVertexes move 0 0 2   sin 0 5 0 0.3
    deformVertexes move .6 .8 0   sin 0 9 0 0.1
     deformVertexes wave 100   sin 0 .5 0 .5
    cull disable

        {
                map models/mapobjects/lamps/bot_wing2
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/lamps/bot_lamp2b
{
     cull disable
     deformVertexes move 0 0 2   sin 0 5 0 0.3
     deformVertexes move .6 .8 0   sin 0 9 0 0.1
        {
                map models/mapobjects/lamps/bot_lamp2b
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/lamps/bot_light
{
      cull disable
      q3map_surfacelight	200
      deformVertexes move 0 0 2   sin 0 5 0 0.3
      deformVertexes move .6 .8 0   sin 0 9 0 0.1
        {
                map models/mapobjects/lamps/bot_light
		rgbGen identity
        }


}

models/mapobjects/lamps/beam
{
        surfaceparm trans
        surfaceparm nomarks
        surfaceparm nonsolid
	surfaceparm nolightmap
        deformVertexes move 0 0 2   sin 0 5 0 0.3
        deformVertexes move .6 .8 0   sin 0 9 0 0.1
	cull none
        //nopicmip
	{
		map models/mapobjects/lamps/beam
                tcMod Scroll .3 0
                blendFunc add
        }
        {
		map models/mapobjects/lamps/beam
                tcMod Scroll -.3 0
                blendFunc add
        }

}

///////////////////////////////////
/// Start of Floating Skull Bot  //
///////////////////////////////////

models/mapobjects/lamps/bot_flare
{
        deformVertexes autoSprite
        deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

        {
                clampmap models/mapobjects/lamps/bot_flare
                blendFunc add
                tcMod rotate 20


        }


}

models/mapobjects/lamps/bot_flare2
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
         deformVertexes wave 100 sin 0 1 0 9
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

        {
                map models/mapobjects/lamps/bot_flare2
                blendFunc add

        }


}

models/mapobjects/lamps/bot_lamp
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05

        {
                map models/mapobjects/lamps/bot_lamp
                rgbGen vertex

        }


}
models/mapobjects/lamps/bot_lamp2
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05

        {
                map models/mapobjects/lamps/bot_lamp2
                rgbGen vertex

        }


}
models/mapobjects/lamps/bot_wing
{
     deformVertexes move 0 0 3   sin 0 5 0 0.1
    deformVertexes move 2 2 0   sin 0 9 0 0.05
     deformVertexes wave 100   sin 0 .5 0 .5
    cull disable

        {
                map models/mapobjects/lamps/bot_wing
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratetorch
{
    cull disable

        {
                map models/mapobjects/gratelamp/gratetorch
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratetorch2b
{
    cull disable

        {
                map models/mapobjects/gratelamp/gratetorch2b
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/chain/chain3
{
        {
		map $whiteimage
		rgbGen identity
	}
	{
		map models/mapobjects/chain/chain3
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map models/mapobjects/chain/chain3
		//blendFunc add
                blendFunc filter
		rgbGen identity
	}


}

models/flags/flagbits
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
models/flags/r_flag2
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		map models/flags/r_flag2
		 rgbGen identity
	}
        {
		map models/flags/red_fx
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7

                blendFunc add
                 rgbGen identity
	}
        {
		map models/flags/r_flag2
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc filter
               rgbGen identity
	}
}
models/flags/b_flag2
{

	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none

        {
		map models/flags/b_flag2
		 rgbGen identity
	}
        {
		map models/flags/blue_fx
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                blendFunc add
                rgbGen identity
	}
        {
		map models/flags/b_flag2
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow
                tcGen environment
                //blendFunc add
                blendFunc filter
                rgbGen identity
	}
}
models/flags/flag_red
{
               cull none
	       deformVertexes wave 90 sin 1 5.6 1 .4
               deformVertexes wave 100 sin 1 2 1 .9
               deformVertexes wave 50 sin 1 .5 1 1
	 {
                map models/flags/flag_red
                //blendfunc blend
                //alphaFunc GE128
                blendFunc add
                rgbGen lightingDiffuse
                depthWrite
        }


}
models/mapobjects/bitch/hologirl
{
        cull none
		//sort additive	// alphaFunc with a later blend pass doesn't
						// make its own sort properly
         deformVertexes move 0 0 .7  sin 0 5 0 0.2


        {
                map models/mapobjects/bitch/hologirl
                alphaFunc GE128
                depthWrite
                rgbGen lightingdiffuse

        }
        {
                map models/mapobjects/bitch/hologirl2
                tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc add
		//rgbGen wave sin .5 .5 0 .1
	}


}
models/mapobjects/bitch/bitch02
{
	cull none

	{
		Map models/mapobjects/bitch/bitch02
		blendFunc add
                tcGen environment
                tcMod scroll 0 0.3
	}



}
models/mapobjects/barrel/barrel2
{

	{
		Map models/mapobjects/barrel/barrel2
                rgbgen vertex

	}
        {
		clampmap models/mapobjects/barrel/barrel2fx
		blendFunc add
               // rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate 403
	}
        {
		clampmap models/mapobjects/barrel/barrel2fx
		blendFunc add
               // rgbgen wave triangle 1 1 0 8.7
                tcMod rotate -100
	}

}
models/weaphits/electric
{
	cull none

	{
		clampmap models/weaphits/electric
		blendFunc add
                rgbgen wave triangle .8 2 0 9
                tcMod rotate 360
	}
        {
		clampmap models/weaphits/electric
		blendFunc add
                rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate -202
	}

}
models/mapobjects/flares/electric
{


	q3map_surfacelight	200

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap models/mapobjects/flares/electric
		blendFunc add
                rgbgen wave triangle .8 2 0 9
                tcMod rotate 360
	}
        {
		clampmap models/mapobjects/flares/electric
		blendFunc add
                rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate -202
	}

}
models/players/anarki/anarki_b

{
         {
		map textures/effects/envmapbfg
                tcGen environment
                tcmod rotate 350
                tcmod scroll 3 1
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
                map models/players/anarki/anarki_b
                blendfunc blend
                rgbGen lightingDiffuse
        }

}
models/players/anarki/anarki_g

{
        {
                map models/players/anarki/anarki_g
                //rgbGen vertex
        }
        {

		map models/players/anarki/anarki_g_fx
		rgbGen lightingDiffuse
                rgbGen wave triangle 0 1 0 .5
		blendfunc add
	}
}

models/mapobjects/wallhead/femhead

{
        deformVertexes wave 100 sin 0 .7 0 .2
        //deformVertexes wave 100 sin 0 1 1 .1
        cull disable

        {
                map models/mapobjects/wallhead/femhead3
                rgbGen vertex
        }
	{
		//animMap 0.5 models/mapobjects/wallhead/femhead4 //models/mapobjects/wallhead/femhead2
	        map models/mapobjects/wallhead/femhead4
		blendFunc	blend
		alphaGen	wave sin 0 1 1 .1
                // alphaGen	wave triangle 0 .7 0 .2
                rgbGen vertex
	}

}
models/mapobjects/wallhead/wallhead_eye

{


        {
              animMap 0.2 models/mapobjects/wallhead/wallhead_eye models/mapobjects/wallhead/wallhead_eye2
                rgbGen vertex
        }


}
models/mapobjects/wallhead/wallhead

{


        {
             map models/mapobjects/wallhead/wallhead
             rgbGen vertex
        }

}
//models/mapobjects/wallhead/femhead
//{
//   deformVertexes wave 100 sin 0 .7 0 .2
//   cull disable
//
//
//        {
//                map models/mapobjects/wallhead/femhead2
//                rgbGen vertex
//        }
//        {
//                map models/mapobjects/wallhead/femhead
//                Blendfunc add
//                rgbGen vertex
//                rgbGen wave triangle 0 1 0 .05
//        }
//
//}

//models/mapobjects/wallhead/tongue
//{
//	{
//		//rgbGen lightingDiffuse
//		map $whiteimage
//                rgbGen vertex
//	}
//	{
//		map models/mapobjects/wallhead/tongue
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

models/players/mynx/mynx_shiny
{

        {
                map textures/sfx/specular5
                blendFunc GL_ONE GL_ZERO
                tcGen environment
	}
        {
		map models/players/mynx/mynx_shiny
                blendFunc blend
		rgbGen lightingDiffuse
	}

}
models/players/razor/patriot
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/razor/patriot
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/razor/patriot_gogs
{
        {
		map textures/effects/tinfx2d
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
	}


}
models/mapobjects/scoreboard/s_name
{
	sort additive
	cull disable
    deformVertexes text0
	{
		map gfx/2d/bigchars
		blendFunc blend
		rgbGen identity
	}
}


models/mapobjects/scoreboard/s_score
{
	sort additive
	cull disable
    deformVertexes text1
	{
		map gfx/2d/bigchars
		blendFunc blend
		rgbGen identity
	}
}


models/weapons2/lightning/crackle1
{
	sort additive
	cull disable

	{
		animMap 15 models/weapons2/lightning/crackle1 models/weapons2/lightning/crackle2 models/weapons2/lightning/crackle3 models/weapons2/lightning/crackle4 models/weapons2/lightning/crackle5 models/weapons2/lightning/crackle6 models/weapons2/lightning/crackle7 models/weapons2/lightning/crackle8
		blendFunc add
	}

}

models/weapons2/lightning/button
{
        {
		map models/weapons2/lightning/button
		blendFunc add
		rgbGen wave sin 1 1 0 1
	}

}

models/weapons2/lightning/glass
{
        {
		map models/weapons2/lightning/glass
	}
	{
		map textures/effects/envmapdim
		tcGen environment
		blendfunc add
		rgbGen lightingDiffuse
	}
}
models/weapons2/lightning/trail
{
	{
		map models/weapons2/lightning/trail
		tcMod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc add
	}
        {
		map models/weapons2/lightning/trail
		tcMod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc add
	}
}
models/weapons2/lightning/trail2
{
	{
		map models/weapons2/lightning/trail2
		tcMod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc add
	}
        {
		map models/weapons2/lightning/trail2
		tcMod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc add
	}
}

models/weapons2/lightning/trail1
{
	sort additive
	cull disable

	{
		animMap 15 models/weapons2/lightning/trail1 models/weapons2/lightning/trail2 models/weapons2/lightning/trail3 models/weapons2/lightning/trail4
		blendFunc add
		rgbGen vertex
	}

}

models/weapons2/lightning/ball1
{
	sort additive
	cull disable

	{
		animMap 15 models/weapons2/lightning/ball1 models/weapons2/lightning/ball2
		blendFunc add
		rgbGen vertex
	}

}

models/mapobjects/slamp/slamp3
{
    deformVertexes autoSprite2
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
   q3map_surfacelight	100

        {
                map models/mapobjects/slamp/slamp3
                blendFunc add

        }


}
models/mapobjects/slamp/slamp2
{
    cull disable
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap

        {
                map models/mapobjects/slamp/slamp2
                blendFunc add
        }
        {
		map textures/effects/envmapdimb
		tcGen environment
		blendfunc add
	        //rgbGen lightingDiffuse
	}


}

models/mapobjects/lightning/white/white1
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		animMap 15 models/mapobjects/lightning/white/white1 models/mapobjects/lightning/white/white2 models/mapobjects/lightning/white/white3 models/mapobjects/lightning/white/white4 models/mapobjects/lightning/white/white5 models/mapobjects/lightning/white/white6 models/mapobjects/lightning/white/white7 models/mapobjects/lightning/white/white8
		blendFunc add
		rgbGen vertex
	}

}

models/mapobjects/lightning/red/red01
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		animMap 15 models/mapobjects/lightning/red/red01 models/mapobjects/lightning/red/red02 models/mapobjects/lightning/red/red03 models/mapobjects/lightning/red/red04 models/mapobjects/lightning/red/red05 models/mapobjects/lightning/red/red06 models/mapobjects/lightning/red/red07 models/mapobjects/lightning/red/red08
		blendFunc add
		rgbGen vertex
	}

}

models/mapobjects/lightning/yel/yel01
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		animMap 15 models/mapobjects/lightning/yel/yel01 models/mapobjects/lightning/yel/yel02 models/mapobjects/lightning/yel/yel03 models/mapobjects/lightning/yel/yel04 models/mapobjects/lightning/yel/yel05 models/mapobjects/lightning/yel/yel06 models/mapobjects/lightning/yel/yel07 models/mapobjects/lightning/yel/yel08
		blendFunc add
		rgbGen vertex
	}

}

models/mapobjects/lightning/blu/blu01
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		animMap 15 models/mapobjects/lightning/blu/blu01 models/mapobjects/lightning/blu/blu02 models/mapobjects/lightning/blu/blu03 models/mapobjects/lightning/blu/blu04 models/mapobjects/lightning/blu/blu05 models/mapobjects/lightning/blu/blu06 models/mapobjects/lightning/blu/blu07 models/mapobjects/lightning/blu/blu08
		blendFunc add
		rgbGen vertex
	}

}

models/mapobjects/pitted_rust_ps
{
     cull disable

        {
                map models/mapobjects/pitted_rust_ps
                rgbGen vertex
        }


}

models/mapobjects/signs/bioh
{
     cull disable

        {
                map models/mapobjects/signs/bioh
                rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratelamp
{
    cull disable

        {
                map models/mapobjects/gratelamp/gratelamp
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratelamp_flare
{
	deformVertexes autoSprite

	q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map models/mapobjects/gratelamp/gratelamp_flare
		blendFunc add
	}

}

models/weapons2/grenadel/ring
{

	{
		map models/weapons2/grenadel/ring
        }

        {
                map textures/effects/envmapdim
		tcGen environment
		blendFunc add
                //rgbGen identity
        }
}
models/mapobjects/chain/chain
{
     cull disable
        {
                map models/mapobjects/chain/chain
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/chain/chain2
{
     cull disable
    deformVertexes autoSprite2
        {
                map models/mapobjects/chain/chain2
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/chain/chain2_end
{
     cull disable
    deformVertexes autoSprite2
        {
                map models/mapobjects/chain/chain2_end
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/tree/branch
{
     cull disable
     deformVertexes wave 100 sin 0 .1 0 .2
      surfaceparm	trans
        {
                map models/mapobjects/tree/branch
                alphaFunc GE128
		depthWrite
		//rgbGen identity
                //rgbGen lightingDiffuse
                rgbGen vertex
        }


}
models/players/orbb/orbb_tail
{

	{
		map models/players/orbb/orbb_tail
		blendFunc add
                tcmod scroll 0 .5
		rgbGen wave sin .5 .25 0 .5
	}
}
models/players/orbb/orbb_tail_blue
{

	{
		map models/players/orbb/orbb_tail_blue
		blendFunc add
                tcmod scroll 0 .5
		rgbGen wave sin .5 .25 0 .5
	}
}
models/players/orbb/orbb_light
{
	{
		map models/players/orbb/orbb_light
		rgbGen wave sin 1 1 0 1

	}
}
models/players/orbb/orbb_light_blue
{
	{
		map models/players/orbb/orbb_light_blue
		rgbGen wave sin 1 1 0 1

	}
}
models/players/orbb/orbb_h2
{
        {
		map models/players/orbb/orbb_h2
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/effects/tinfx
                blendFunc add
                tcGen environment
                rgbGen lightingDiffuse
	}
        {
		map models/players/orbb/orbb_h2
                blendFunc blend
		rgbGen lightingDiffuse
	}


}

models/players/orbb/red_h
{

	{
		map models/players/orbb/red_h
                rgbGen lightingDiffuse
        }

        {
	        clampmap textures/base_floor/techfloor2
		blendfunc blend
                tcmod rotate 90
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen lightingDiffuse
	}

}
models/players/orbb/blue_h
{

	{
		map models/players/orbb/blue_h
                rgbGen lightingDiffuse
        }

        {
	        clampmap textures/base_floor/techfloor2
		blendfunc blend
                tcmod rotate 90
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen lightingDiffuse
	}

}
models/mapobjects/teleporter/transparency2
{
   cull disable

        {
                map models/mapobjects/teleporter/transparency2
                blendfunc add
                tcMod scroll .1 .2
        }

}

models/flags/b_flag
{
               cull disable
	       deformVertexes wave 100 sin 0 3 0 .7

        {
               map models/flags/b_flag

        }


}

models/flags/r_flag
{
               cull disable
	       deformVertexes wave 100 sin 0 3 0 .7

        {
               map models/flags/r_flag

        }


}
models/flags/pole
{

        {
             map models/flags/skull
		tcGen environment
		rgbGen lightingDiffuse

        }


}
models/flags/skull
{

        {
             map models/flags/skull
		//tcGen environment
		rgbGen lightingDiffuse

        }


}
models/players/hunter/hunter_f
{
     deformVertexes wave 100 sin 0 .3 0 .2
     cull disable
        {
                map models/players/hunter/hunter_f
                //blendFunc blend
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/hunter/red_f
{
     deformVertexes wave 100 sin 0 .3 0 .2
     cull disable
        {
                map models/players/hunter/red_f
                //blendFunc blend
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/uriel/uriel_w
{
     deformVertexes wave 100 sin 0 .5 0 .2

        {
                map models/players/uriel/uriel_w
                //blendFunc blend
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/uriel/red_w
{
     deformVertexes wave 100 sin 0 .5 0 .2

        {
                map models/players/uriel/red_w
                //blendFunc blend
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/uriel/blue_w
{
     deformVertexes wave 100 sin 0 .5 0 .2

        {
                map models/players/uriel/blue_w
                //blendFunc blend
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/mapobjects/bitch/orb
{
	deformVertexes autoSprite

	q3map_surfacelight	70

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap models/mapobjects/bitch/orb
		blendFunc add
                tcMod rotate 30
	}

}

models/mapobjects/bitch/forearm
{
        {
                map models/mapobjects/bitch/forearm
                rgbGen vertex
        }
	{
               map models/mapobjects/bitch/forearm01
               blendfunc add
               tcMod scroll 2.2 0

        }
        {
               map models/mapobjects/bitch/forearm02
               blendfunc add
               tcMod scroll -1.1 0

        }
}

models/players/parkr/parkr_head
{
	{
		map textures/effects/envmap2
		tcGen environment
	}
}

models/players/parkr/parkr_chest
{
         {
                map models/players/parkr/parkr_chest
        }
	{
		AnimMap 4 models/players/parkr/parkr_chest_red models/players/parkr/parkr_chest_blu
	       blendfunc add
	}
}
models/mapobjects/teleporter/energy
{
   cull disable
   surfaceparm trans

       {
               map models/mapobjects/teleporter/energy
               blendfunc add
               tcMod scroll 2.2 1.3
               rgbGen wave inversesawtooth -.3 1.3 0 1.3

       }
	{
		map models/mapobjects/teleporter/energy2
		blendfunc add
		tcMod scroll -1 .5
		rgbGen wave inversesawtooth -.2 1.2 0 .5

	}
	{
                map models/mapobjects/teleporter/energy3
                blendfunc add
                tcMod scroll 3 0
		rgbGen wave triangle 1 1 0 5.3

	}

}

models/mapobjects/teleporter/widget
{
   cull disable

        {
                map models/mapobjects/teleporter/widget
                blendfunc add

        }
        {
                map models/mapobjects/teleporter/transparency2
                blendfunc add
                tcMod scroll -.1 -.2
        }

}

models/mapobjects/teleporter/transparency
{
   cull disable

        {
                map models/mapobjects/teleporter/transparency
                blendfunc add

        }
        {
                map models/mapobjects/teleporter/transparency2
                blendfunc add
                tcMod scroll .1 .2
        }

}

models/mapobjects/teleporter/teleporter_edge
{


        {
          map models/mapobjects/teleporter/teleporter_edge
          rgbGen vertex
        }
        {
                map models/mapobjects/teleporter/teleporter_edge2
                blendfunc add
                rgbgen wave inversesawtooth 0 1 .2 1.5
        }

}

models/mapobjects/jesus/jesuswall
{
   deformVertexes wave 100 sin 0 .2 0 .2
   cull none
        {
		map $lightmap
              	//rgbGen identity
	}
	{
		map models/mapobjects/jesus/jesuswall
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen vertex
		alphaGen lightingSpecular
	}


}


models/mapobjects/hand
{
   deformVertexes wave 100 sin 0 .3 0 .2

        {
                map models/mapobjects/hand
                rgbGen vertex
        }


}

models/mapobjects/corpse/corpse
{
   deformVertexes wave 100 sin 0 .2 0 .2

        {
                map models/mapobjects/corpse/corpse
                rgbGen exactVertex
        }


}
models/mapobjects/skull/ribcage
{
	sort underwater
        cull disable
        {
                map models/mapobjects/skull/ribcage
                // blendfunc blend
                alphaFunc GE128
                rgbGen vertex
        }


}

//models/mapobjects/flag/banner_eg1
//{
//               cull disable
//               surfaceparm nolightmap
//	       deformVertexes wave 100 sin 0 8 0 8
//		   sort banner
//        {
//                map models/mapobjects/flag/banner_eg1
//                // blendfunc blend
//                alphaFunc GE128
//                rgbGen vertex
//        }
//
//
//}
models/mapobjects/flag/banner_strgg
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow

	    deformVertexes wave 100 sin 0 3 0 .7
            //deformVertexes normal 0.2 2
		sort banner
        {
                map models/mapobjects/flag/banner_strgg
                 blendfunc blend
                alphaFunc GE128
                rgbGen vertex

        }
}
models/mapobjects/flag/banner02
{
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7

        {
                map models/mapobjects/flag/banner02

        }


}

models/mapobjects/weeds/weed02
{
	sort underwater
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
        {
                map models/mapobjects/weeds/weed02
                blendfunc blend
        }


}
models/mapobjects/weeds/weed01
{
	sort additive
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
        {
                map models/mapobjects/weeds/weed01
                blendfunc blend
        }


}

models/mapobjects/portal_2/portal_3_edge
{
        {
                map models/mapobjects/portal_2/portal_3_edge
                rgbGen vertex
        }

	{
		map models/mapobjects/portal_2/portal_3_edge_glo
		blendFunc add
		tcMod scroll 9.7 .5
	}

}

models/players/razor/razor_gogs
{
	{
		map models/players/razor/razor_gogs
                tcGen environment

	}


	{
		map	models/players/razor/razor_gogs_fx
		blendfunc add
		tcMod scroll 1.2 9.3

	}
}

models/players/slash/slashskate
{
        //deformVertexes wave 100 sin 0 1 1 5
	sort additive
	cull disable
	{
		clampmap models/players/slash/slashskate
		blendFunc add
                //tcmod rotate 100
                tcMod stretch sin .9 0.1 0 1.1
                rgbgen identity

	}
}


models/mapobjects/colua0/colua0_lght
{
	surfaceparm	trans
	{
		map textures/effects/tinfx2b
		tcGen environment
		blendFunc add
	}
}
models/mapobjects/colua0/colua0_flare
{
	deformVertexes autoSprite

	q3map_surfacelight	1000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map models/mapobjects/colua0/colua0_flare
		blendFunc add
	}

}
models/mapobjects/kmlamp_white
{

	surfaceparm	trans
	{
		map textures/effects/tinfxb
		tcGen environment
		blendFunc add
	}
}

models/mapobjects/lamps/flare03
{
	deformVertexes autoSprite

	q3map_surfacelight 200

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		Map models/mapobjects/lamps/flare03
		blendFunc add
	}

}

//models/weapons2/chainsaw/f_chainsaw
//{
//	sort nearest
//	cull back
//	{
//		map	models/weapons2/chainsaw/f_chainsaw
//		blendfunc GL_ONE GL_ONE_MINUS_SRC_COLOR
//
//	}
//}

models/players/sarge/cigar
{
	{
		map models/players/sarge/cigar
                blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse

        }

	{
		map models/players/sarge/cigar_glow
		blendfunc add
		rgbGen wave triangle .5 1 0 .2

	}
}
//
// powerups
//
//
// ammo
//
//models/powerups/ammo/ammo_rail1
//{
//	{
//		map models/powerups/ammo/ammo_rail1
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail1_glow
//		blendfunc add
//		rgbGen wave sin 0.75 0.25 0 1
//	}
//}
//models/powerups/ammo/ammo_rail2
//{
//	{
//		map models/powerups/ammo/ammo_rail2
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail2_glow
//		blendfunc add
//	}
//}
models/powerups/ammo/bfgammo
{
   cull none
       {
	        map textures/effects/envmapbfg
		 //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
        {
	        map textures/effects/tinfx2
		tcGen environment
		blendfunc add
                rgbGen identity
       }
       {
	        map models/powerups/ammo/bfgammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/bfgammo1
{
        {
	        map textures/effects/envmapbfg
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/ammo/bfgammo2
{
	{
		map models/powerups/ammo/bfgammo2
		rgbGen identity
	}

}
//models/powerups/ammo/bounammo1
//{
//	{
//		map models/powerups/ammo/bounammo1
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/bounammo2
//{
//	{
//		map models/powerups/ammo/bounammo2
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/bounammo2_glow
//		blendfunc add
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo1
//{
//	{
//		map models/powerups/ammo/flamammo1
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo2
//{
//	{
//		map models/powerups/ammo/flamammo2
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/flamammo2_glow
//		blendfunc add
//	}
//}
models/powerups/ammo/grenammo
{
       {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/grenammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/grenammo1
{
	{
	        map textures/effects/envmapgren
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/ammo/grenade
{
        {
                map models/ammo/grenade
        }
	{
		AnimMap 7 models/ammo/grenade_r models/ammo/grenade_g
	       blendfunc add
	}
}
models/powerups/ammo/grenammo2
{
	{
		map models/powerups/ammo/grenammo2
		rgbGen identity
	}

}
models/powerups/ammo/lighammo
{
       {
	        map textures/effects/envmapligh
		 //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/lighammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/lighammo1
{
	{
	        map textures/effects/envmapligh
                tcGen environment
		//tcmod scale 2 2
                tcmod rotate 6
                tcmod scroll .09 .09
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/lighammo2
{
	{
		map models/powerups/ammo/lighammo2
		rgbGen identity
	}

}
models/powerups/ammo/machammo
{
       {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/machammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo1
{
       {
	        map textures/effects/envmapmach
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo2
{
	{
		map models/powerups/ammo/machammo2
		rgbGen identity
	}

}
models/powerups/ammo/plasammo1
{
       {
	        map textures/effects/envmapplas
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/plasammo
{
       {
	        map textures/effects/envmapplas
                //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/plasammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/plasammo2
{
	{
		map models/powerups/ammo/plasammo2
		rgbGen identity
	}

}
models/powerups/ammo/railammo1
{
       {
	        map textures/effects/envmaprail
                tcGen environment
		//tcmod scale 4 4
                //tcmod rotate 70
                //tcmod scroll .5 .5
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/railammo
{
       {
	        map textures/effects/envmaprail
                //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/railammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/railammo2
{
	{
		map models/powerups/ammo/railammo2
		rgbGen identity
	}

}
models/powerups/ammo/rockammo
{
       {
	        map textures/effects/tinfx2d
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/rockammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo1
{
       {
	        map textures/effects/envmaproc
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo2
{
	{
		map models/powerups/ammo/rockammo2
		rgbGen identity
	}

}
models/powerups/ammo/shotammo
{
       {
	        map textures/effects/tinfx2c
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/shotammo
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo1
{
       {
	        map textures/effects/envmapgold3
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo2
{
	{
		map models/powerups/ammo/shotammo2
		rgbGen identity
	}

}

//
// health
//
models/powerups/health/yellow
{

	{
		map textures/effects/envmapyel
                tcGen environment
		//blendfunc add

	}

}
models/powerups/health/yellow_sphere
{
	{
		map textures/effects/tinfx2b
		tcGen environment
		blendfunc add
	}
}
models/powerups/health/red
{

	{
		map textures/effects/envmapgold
                tcGen environment
		blendfunc GL_ONE GL_ZERO

	}
        {
		map textures/sfx/kenelectric
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc add

	}
}
models/powerups/health/mega2
{

	{
		map textures/effects/envmapblue
                tcGen environment
		blendfunc GL_ONE GL_ZERO

	}
        {
		map textures/sfx/kenelectric
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc add

	}
}
models/powerups/health/mega1
{
	{
		map textures/effects/envmapblue2
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc add
	}
}
models/powerups/health/red_sphere
{
	{
		map textures/effects/envmapgold2
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc add
	}
}
models/powerups/health/green
{

	{
		map textures/effects/envmaprail
		tcGen environment

	}
}
models/powerups/health/green_sphere
{
	{
		map textures/effects/tinfx2b
		tcGen environment
		blendfunc add
	}
}
models/powerups/health/blue
{
	{
		map textures/effects/envmapbfg
		tcGen environment

	}
}
models/powerups/health/blue_sphere
{
	{
		map textures/effects/tinfx2b
		tcGen environment
		blendfunc add
	}
}


//
// mapobjects
//
models/powerups/armor/energy_red1
{

	{
		map models/powerups/armor/energy_red1
                blendFunc add
		tcMod scroll 7.4 1.3
	}

}

models/powerups/armor/energy_yel1
{

	{
		map models/powerups/armor/energy_yel3
		blendFunc add
		tcMod scroll 7.4 1.3
	}

}

models/powerups/armor/energy_grn1
{
   deformVertexes wave 100 sin 2 0 0 0
	{
		map textures/effects/envmaprail
		blendFunc add
                tcGen environment
                tcmod rotate 30
		tcMod scroll 1 1
                rgbGen wave triangle -.3 1.3 0 .3
	}

}

models/mapobjects/lamplight_ys
{
	{
		map models/mapobjects/lamplight_ys
		blendfunc add

	}
}

models/mapobjects/pj_light
{
     cull none
        {
		map textures/effects/tinfx2
                tcGen environment
                blendFunc add
                rgbGen vertex
	}
	{
		map models/mapobjects/pj_light
		blendfunc add
		rgbGen vertex
	}

}

models/mapobjects/lamplight_y
{
	q3map_surfacelight 10000
	light 1
        cull disable
	{
                map textures/effects/envmapmach
		//map models/mapobjects/lamplight_y
		blendfunc add
		tcGen environment
                rgbGen identity
	}
}

models/mapobjects/arenalogo
{
	deformVertexes wave 100 sin 0.25 0 0 0
	{
		map textures/effects/quadmap
		blendfunc add
		tcGen environment
		tcMod turb 0 1 0 0.2
	}
}


//
// weapons
//
models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		map	models/weapons2/machinegun/f_machinegun
		blendfunc add
	}
}

models/weapons2/railgun/f_railgun2
{
	sort additive
	cull disable
	{
		map	models/weapons2/railgun/f_railgun2
		blendfunc add
		rgbgen entity
	}
}

models/weapons2/railgun/railgun2
{
	sort additive
	cull disable
	{
		map	models/weapons2/railgun/railgun2_glow
		blendfunc add
		rgbGen entity	// identity
	}
}

models/weapons2/railgun/railgun3
{
	{
		map	models/weapons2/railgun/railgun3
		rgbGen lightingDiffuse
	}

	{
		map	models/weapons2/railgun/railgun3_glow
		blendfunc add
		rgbGen entity	// identity
	}
}

models/weapons2/railgun/railgun4
{
	{
		map models/weapons2/railgun/railgun4
		tcMod scroll 0 1
		rgbGen entity	// identity
	}

}

models/weapons2/shotgun/f_shotgun
{
	sort additive
	cull disable
	{
		map	models/weapons2/shotgun/f_shotgun
		blendfunc add
	}
}

models/weapons2/shotgun/shotgun_laser
{

	{
		map	models/weapons2/shotgun/shotgun_laser
		blendfunc add
	}
}
models/weapons2/bfg/f_bfg
{
	sort additive
	cull disable
	{
		clampmap models/weapons2/bfg/f_bfg
		blendfunc add
                tcmod rotate 360
        }
        {
		clampmap models/weapons2/bfg/f_bfg2
		blendfunc add
                tcmod rotate -129
                //tcMod stretch sin .8 0.10 0 .7
        }

}
models/weapons2/bfg/bfg_e
{
	{
		map models/weapons2/bfg/envmapbfg
		rgbGen identity
		tcMod turb 0 0.5 0 0.1
		tcMod scale 0.4 0.4
		tcMod scroll 0.2 -0.2
	}
	{
		map models/weapons2/bfg/envmapbfg
		blendfunc add
		rgbGen identity
		tcMod turb 0 0.5 0 0.1
		tcMod scale 0.2 0.2
		tcMod scroll 0.3 0.6
	}
	{
		map textures/effects/tinfx
		blendfunc add
		rgbGen lightingDiffuse
		tcGen environment
	}
}
 models/weapons2/bfg/bfg
{
        {
                map textures/effects/tinfx2d
                blendFunc GL_ONE GL_ZERO
                tcmod scroll .01 .01
                tcGen environment
                rgbGen lightingDiffuse
	}
        {
		map models/weapons2/bfg/bfg
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
 models/weapons2/bfg/bfg_k
{

        {
                map textures/effects/envmapbfg
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 30
                tcmod scroll 1 1
                tcGen environment
                rgbGen identity
	}
        {
		map models/weapons2/bfg/bfg_k
                blendFunc blend
		rgbGen lightingDiffuse
	}


}
models/weapons2/grenadel/f_grenadel
{
	sort additive
	cull disable
	{
		map	models/weapons2/grenadel/f_grenadel
		blendfunc add
	}
}
models/weapons2/lightning/f_lightning
{
	sort additive
	cull disable
	{
		map models/weapons2/lightning/f_lightning
		blendfunc add
	}
}
sprites/plasma1
{
	cull disable
	{
		clampmap sprites/plasmaa
		blendfunc add
                tcMod rotate 931
	}
}
models/ammo/rocket/rockfls1
{
	cull disable
	{
		map models/ammo/rocket/rockfls1
		blendfunc add
	}
}
models/ammo/rocket/rockfls2
{
	cull disable
	{
		map models/ammo/rocket/rockfls2
		blendfunc add
	}
}
models/ammo/rocket/rockflar
{
	cull disable
	{
		map models/ammo/rocket/rockflar
		blendfunc add
	}
}

sprites/plasma2
{
	cull disable
	{
		map sprites/plasma2
		blendfunc add
	}
}
models/weapons2/plasma/f_plasma
{
	cull disable
	sort additive
	{
		map models/weapons2/plasma/f_plasma
		blendfunc add
	}
}
models/weapons2/flamethrower/f_flamethrower
{
	cull disable
	sort additive
	{
		map models/weapons2/flamethrower/f_flamethrower
		blendfunc add
	}
}
models/weapons2/grapple/f_grapple
{
	cull disable
	sort additive
	{
		map models/weapons2/grapple/f_grapple
		blendfunc add
	}
}
models/weapons2/rocketl/f_rocketl
{
	cull disable
	sort additive
	{
		map models/weapons2/rocketl/f_rocketl
		blendfunc add
	}
}

models/weapons2/gauntlet/gauntlet3
{

	cull disable
	sort additive
	{
              // map models/weapons2/gauntlet/gauntlet3
               AnimMap 10 models/weapons2/gauntlet/gauntlet3 models/weapons2/gauntlet/gauntlet4
	       blendfunc add
	}
}

// this one can go away eventually
models/weapons2/rocketl/rocketl14
{
	cull disable
	sort additive
	{
		map models/weapons2/rocketl/f_rocketl
		blendfunc add
	}
}

models/weapons/vulcan/f_vulcan
{
	sort additive
	cull disable
	{
		map	models/weapons/vulcan/f_vulcan
		blendfunc add
	}
}

//
// players
//
models/players/tankjr/tankjr
{

        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/tankjr/tankjr
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
//models/players/visorhead
//{
//	{
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/players/visor/visorhead
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}
//models/players/visor/visortorso2
//{
//	{
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/players/visor/visortorso2
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}

models/players/doom/f_doom
{
	{
		map models/players/doom/f_doom
	}
	{

		map models/players/doom/fx_doom
		tcGen environment
		rgbGen lightingDiffuse
		blendfunc add
	}
}
models/players/doom/doom_f
{
	{
		map models/players/doom/doom_f
                rgbGen lightingDiffuse
	}
        {

		map models/players/doom/doom_fx
		tcGen environment
		rgbGen lightingDiffuse
		blendfunc add
	}

}



//
// weapons
//

models/weapons2/plasma/plasma_glass
{

	{
		map textures/effects/tinfxb
		tcGen environment
                tcMod scroll .01 .02
		blendfunc add
		rgbGen lightingDiffuse
	}
}
models/weapons2/plasma/plasma_glo
{

	{
		map models/weapons2/plasma/plasma_glo
                tcmod rotate 33
                tcMod scroll .7 1
                rgbGen identity
	}
        {
		map textures/effects/tinfxb
		tcGen environment
                tcMod scroll .01 .02
		blendfunc add
		rgbGen lightingDiffuse
	}
}

////////////////////////////
/// Lightning gun Shader ///
////////////////////////////
models/weapons2/lightning/ball
{
   deformVertexes autoSprite
        {
		map models/weapons2/lightning/ball
		blendfunc add
                rgbgen wave triangle 1 2 0 7
                tcMod rotate 360
	}
        {
		map models/weapons2/lightning/ball
		blendfunc add
                rgbgen wave triangle 1 5 1 3
                tcMod rotate -200
	}

}

//
//
// instant: as seen on the powerups themselves
//

models/powerups/instant/scan
{
	{
		map models/powerups/instant/scan
	}
	{
		map textures/effects/envmapdim
		blendfunc add
		tcGen environment
	}
}
models/powerups/instant/quad
{
	//{
	//	map gfx/colors/darkblue
	//}
	{
		map textures/effects/envmapblue
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/enviro
{
	//{
	//	map models/powerups/instant/enviro
	//}
	{
		map textures/effects/envmapgold
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/flight
{
	{
		map textures/effects/envmappurp
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/haste
{
	{
		map textures/effects/envmapyel
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/invis
{
	{
		map textures/effects/tinfx2c
                //map textures/sfx/specular
		blendfunc add
		tcGen environment
	}
}
models/powerups/instant/regen
{
	{
		map textures/effects/envmapred
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
	}
}

//
// holdable powerups
//

models/powerups/holdable/medkit_base
{
	{
		map textures/effects/envmap
		tcgen environment
	}

}

models/powerups/holdable/medkit_sphere
{
	{
		map textures/effects/envmapdim
		tcgen environment
		blendfunc add
	}

}

models/powerups/holdable/medkit_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/medkit_fluid
		tcMod scroll 0 2
		blendfunc add
	}

}

models/powerups/holdable/teleport_base
{
	{
		map textures/effects/envmap
		tcgen environment
	}

}

models/powerups/holdable/teleport_sphere
{
	{
		map textures/effects/envmapdim
		tcgen environment
		blendfunc add
	}

}

models/powerups/holdable/teleport_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/teleport_fluid
		tcMod scroll 0 2
		blendfunc add
	}

}
