//
// this file contains shaders attached models
//

//
// holdable powerups
//


models/powerups/holdable/medkit_base
{
	{
		map textures/effects/envmap.png
		tcgen environment
	}

}

models/powerups/holdable/medkit_sphere
{
	{
		map textures/effects/envmapdim.png
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}

}

models/powerups/holdable/medkit_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/medkit_fluid.png
		tcMod scroll 0 2
		blendfunc GL_ONE GL_ONE
	}

}

models/mapobjects/console/under

{
	cull disable
        surfaceparm alphashadow
        //surfaceparm nodraw
        {
		clampmap models/mapobjects/console/under.png
		alphaFunc GE128
                depthWrite
		rgbGen vertex

	}
}
models/mapobjects/console/rotate

{
	cull disable

        {
		clampmap models/mapobjects/console/rotate.png
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
		map models/mapobjects/console/scrolltext.png
		blendFunc add
                tcmod scroll 0 -.3
                //tcMod stretch sin .9 0.1 0 1.1
		rgbGen vertex
	}

        {
		clampmap models/mapobjects/console/centercon.png
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
		map textures/effects/tinfx2c.png
		blendFunc GL_ONE GL_ZERO
                tcGen environment
		rgbGen vertex
	}
        {
		map models/mapobjects/console/console.png
		blendFunc blend
		rgbGen vertex
	}
        {
		map models/mapobjects/console/console2.png
		blendFunc add
		rgbGen vertex
                rgbGen wave sin .5 .5 0 .2
	}
}

models/mapobjects/console/sphere

{
	cull disable

        {
		map models/mapobjects/console/spherex2.png
		blendFunc add
	        tcmod rotate 40
                tcGen environment
                tcmod scroll 5 .4
		rgbGen wave sin .5 .5 0 .2
	}

	 {
		map models/mapobjects/console/spherex.png
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
	//	clampmap models/mapobjects/console/sphere2.png
	//	alphaFunc GE128
        //        depthWrite
        //        //tcMod stretch sin .9 0.1 0 .5
        //        tcmod rotate 40
	//	rgbGen identity
	//}
        {
		map models/mapobjects/console/sphere3.png
		blendFunc add
               // depthWrite
		rgbGen wave sin .5 .5 0 .2
	}
        {
		map models/mapobjects/console/sphere4.png
		blendFunc add
               // depthWrite
		rgbGen wave sin .5 .5 0 -.2
	}
         {
		clampmap models/mapobjects/console/sphere2.png
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
		map textures/effects/tinfxb.png
		blendFunc add
                tcGen environment
                rgbGen identity
	}
}

models/mapobjects/console/scrolltext

{
	cull disable

        {
		map models/mapobjects/console/scrolltext.png
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
		clampmap models/players/slash/yurikoskate.png
		blendFunc blend
                //tcMod stretch sin .9 0.1 0 1.1
                tcmod rotate 999
		rgbGen lightingdiffuse
	}
        {
		clampmap models/players/slash/yurikoskate.png
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
                map textures/effects/envmaproc.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/yuriko.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/slash/yuriko_h
{
        {
                map textures/effects/envmaproc.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/yuriko_h.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy
{
        {
                map textures/effects/envmaproc.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/hunter/hunter2.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy_h
{
        {
                map textures/effects/envmaproc.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/hunter/hunter_h.png
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
                map textures/effects/tinfx2.png
                tcGen environment
                rgbGen identity
        }
        {
                map models/mapobjects/standlamp2.png
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
        	map models/players/uriel/zael.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/mapobjects/pipe/pipe02
{

        {
                map textures/effects/tinfx2d.png
                tcGen environment
                rgbGen identity
        }
        {
                map models/mapobjects/pipe/pipe02.png
                blendfunc blend
                rgbGen lightingdiffuse
        }

}
models/players/slash/grrl_h
{

        {
                map textures/effects/tinfx2d.png
                tcGen environment
                rgbGen identity
        }
        {
                map models/players/slash/grrl_h.png
                blendfunc blend
                rgbGen lightingdiffuse
        }

}
models/mapobjects/pipe/pipe02x
{
    q3map_lightimage textures/sfx/electricslime_old.png
    q3map_surfacelight 150
    cull disable
        {
                map textures/effects/tinfx2b.png
                tcGen environment
                tcmod scale 1 2
                blendfunc add
                rgbGen identity
        }
        {
                map textures/sfx/electricslime_old.png
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
                map models/mapobjects/skull/monkeyhead.png
                rgbGen vertex
        }
	{

                map models/mapobjects/skull/monkeyheadb.png
		blendFunc	blend
		alphaGen	wave sin 0 1 1 .1
                rgbGen vertex
	}

}
models/mapobjects/skull/monkeyhead2
{
    cull disable
    surfaceparm  trans
    nomipmaps
        {
                map models/mapobjects/skull/monkeyhead2.png
                blendfunc blend
		depthWrite
		rgbGen vertex
        }
}

models/powerups/armor/shard2
{
        {
                map textures/effects/tinfx2c.png
                tcGen environment
                rgbGen identity
        }
        {
                map models/powerups/armor/shard2.png
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
		map models/mapobjects/jets/jet_1.png
                blendFunc add
                tcmod scale  .5  1
                tcmod scroll 6 0
                rgbGen identity
	}
        {
		map models/mapobjects/jets/jet_2.png
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
		map models/mapobjects/jets/jet_as.png
                blendFunc add
                rgbGen identity
	}
}
models/players/crash/crash_f
{

        {
                map textures/sfx/snow.png
                tcmod scale .5 .5
                tcmod scroll  9 0.3
                rgbGen identity
        }
        {
                map textures/effects/tinfx2b.png
                tcGen environment
                blendFunc add
                rgbGen lightingdiffuse
        }
}
models/players/crash/crash_t
{
        {
                map textures/effects/envmapblue.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/crash/crash_t.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/crash/crash
{
        {
                map textures/effects/envmapblue.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/crash/crash.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/razor/id
{
        {
                map textures/effects/tinfx2d.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/razor/id.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/razor/h_id
{
        {
                map textures/effects/tinfx2d.png
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/razor/h_id.png
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/cross/cross_skull
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/cross/cross_skull.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}


models/mapobjects/cross/cross
{
    q3map_lightimage models/mapobjects/cross/cross_light.png
    q3map_surfacelight 300

        {
                map textures/sfx/firewalla.png
                tcmod scale 4 4
                tcmod scroll 0.1 2
                rgbGen identity
	}
        {
		map models/mapobjects/cross/cross.png
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/baph/baphomet_gold
{

        {
                map textures/sfx/firewalla.png
                tcmod scroll 0.1 1
                rgbGen identity
	}
        {
		map models/mapobjects/baph/baphomet_gold.png
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/baph/baphomet
{

        {
                map textures/sfx/firewalla.png
                tcmod scroll 0.1 1
                rgbGen identity
	}
        {
		map models/mapobjects/baph/baphomet.png
                blendFunc blend
		rgbGen vertex
	}

}
models/mapobjects/banner/q3banner04

{
  cull disable
  nomipmaps

        {
		//map models/mapobjects/banner/q3banner04.png
                map textures/sfx/firegorre2.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale .05 .1
                tcMod turb 0 .25 0 .6
                tcmod scroll .4 .3
	        //rgbGen wave sin .5 .5 0 .1
	}
        {

               map textures/sfx/bolts.png
               tcmod scale .2 .2
               tcmod rotate 999
               tcmod scroll 9 9
               blendfunc add
               rgbGen wave sin .5 .5 0 .2
	}
        {
                map textures/sfx/firegorre2.png
                //map models/mapobjects/banner/q3banner04.png
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
		map models/mapobjects/banner/q3banner02.png
                blendFunc add
                tcmod scale  2  1
                tcmod scroll .33 0
                rgbGen wave sin 1 .1 0 .2
	}
        {
		map models/mapobjects/banner/q3banner02.png
                blendFunc add
                tcmod scale  3  1
                tcmod scroll -.45 0
                rgbGen wave sin .5 .5 0 .2
	}
        {
		map models/mapobjects/banner/q3banner02x.png
                blendFunc add
                tcmod scale  4  1
                tcmod scroll 1 0
               // rgbGen wave sin .5 .5 0 -.2
	}
}
models/mapobjects/horned/horned
{

        {
                map textures/sfx/firewalla.png
                tcmod scroll 0.1 1
	}
        {
		map models/mapobjects/horned/horned.png
                blendFunc blend
		rgbGen vertex
	}

}
models/players/bones/red
{

    cull disable
        {
                map models/players/bones/red.png
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/players/bones/blue
{

    cull disable
        {
                map models/players/bones/blue.png
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/players/bones/xray
{

    cull disable
        {
                map models/players/bones/xray.png
                blendfunc add
                //rgbGen wave sin 1 .8 0 9
        }
        {

                map models/mapobjects/bitch/hologirl2.png
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}


}

models/players/bones/stiff
{

    cull disable
        {
                map models/players/bones/stiff.png
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
                map models/mapobjects/skel/skel.png
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
                map models/mapobjects/skel/xray.png
                blendfunc add
                rgbGen wave sin 1 .8 0 .3
        }
        {

                map models/mapobjects/bitch/hologirl2.png
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}


}
models/mapobjects/spotlamp/spotlamp
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/spotlamp/spotlamp.png
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
		map models/mapobjects/spotlamp/beam.png
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        //{
	//	map models/mapobjects/spotlamp/beam.png
         //       tcMod Scroll -.3 0
         //       blendFunc GL_ONE GL_ONE
        //}

}
models/mapobjects/spotlamp/spotlamp_l

{
      cull disable
      q3map_surfacelight	200

        {
                map models/mapobjects/spotlamp/spotlamp_l.png
		rgbGen identity
        }


}

models/players/grunt/stripe_h
{

       {
	        //map textures/effects/tinfx.png
                map textures/sfx/electricgrade3.png
		//tcmod scale 6 6
                //tcmod rotate 350
                tcmod scroll 0 -.5
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
        }
        {
		map models/players/grunt/stripe_h.png
                blendfunc gl_src_alpha gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}

}
models/mapobjects/timlamp/timlamp
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/timlamp/timlamp.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/wallhead/lion_m
{
        {
		map models/mapobjects/wallhead/lion_m.png
                blendFunc GL_ONE GL_ZERO
		rgbGen vertex
	}
        {
                map textures/sfx/firewalla.png
                blendFunc GL_ONE GL_ONE
                tcmod scroll 0.1 1
                //rgbGen wave triangle .5 1 0 .4
	}
        {
		map models/mapobjects/wallhead/lion_m.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		clampmap models/mapobjects/grenadel/grenadelx.png
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
//                map textures/sfx/specular3b.png
//                tcGen environment
//                tcmod scroll .1 0
//                rgbGen identity
//	}
//        {
//		map models/mapobjects/baph/bapho_lamp.png
//                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
         map models/mapobjects/baph/wrist.png
         blendFunc GL_ONE GL_ONE
         tcmod scale  2 1
         tcmod scroll 3 0
         rgbGen identity
        }
        {
         map models/mapobjects/baph/wrist.png
         blendFunc GL_ONE GL_ONE
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
         clampmap models/mapobjects/baph/bapholamp_fx.png
         blendFunc GL_ONE GL_ONE
         tcmod rotate 333
         tcMod stretch sin .9 0.1 0 7
         rgbGen identity
        }
        {
         clampmap models/mapobjects/baph/bapholamp_fx2.png
         blendFunc GL_ONE GL_ONE
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
        	map models/players/biker/cadaver.png
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
        	map models/players/xaero/xaero.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/xaero/xaero_h
{
        {
		map models/players/xaero/xaero_h.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/firewalla.png
                blendFunc GL_ONE GL_ONE
                tcmod scroll 0.1 1
                //rgbGen wave triangle .5 1 0 .4
	}
        {
		map models/players/xaero/xaero_h.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}

}
models/players/xaero/xaero_q
{

    cull disable

        {
                map models/players/xaero/xaero_q.png
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/xaero/xaero_a
{
        {
		map textures/effects/envmapbfg.png
                tcmod rotate 350
                tcmod scroll 3 1
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
        	map models/players/xaero/xaero_a.png
		blendFunc blend
		rgbGen lightingdiffuse
	}
}
models/players/klesk/klesk_h
{
	{
		map models/players/klesk/klesk_h.png
                blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse

        }

	{
		map models/players/klesk/klesk_g.png
		blendfunc GL_ONE GL_ONE
		rgbGen wave triangle .5 1 0 .5

	}
}
models/players/uriel/uriel_h
{
        {
		map models/players/uriel/uriel_h.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/proto_zzzt.png
                blendFunc GL_ONE GL_ONE
                tcmod scroll -0.2 1
                rgbGen identity
	}
        {
		map models/players/uriel/uriel_h.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
        	map models/players/klesk/flisk.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/klesk/flisk_h
{
        {
		map models/players/klesk/flisk_h.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/bolts.png
                blendFunc GL_ONE GL_ONE
                tcmod scale 2 2
                tcmod scroll 2 2
	}
        {
		map models/players/klesk/flisk_h.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}
models/weaphits/bfg01
{
        deformVertexes autoSprite
	cull none

        {
                clampmap models/weaphits/bfg01.png
                blendFunc GL_ONE GL_ONE
                tcMod rotate 333
                rgbGen identity
        }
        {
                clampmap models/weaphits/bfg01.png
                blendFunc GL_ONE GL_ONE
                tcMod rotate -100
                rgbGen identity
        }

}
models/weaphits/bfg02
{
	cull none
        nomipmaps
        {
                map models/weaphits/bfg03.png
                blendFunc GL_ONE GL_ONE
                tcmod scroll 2 0
                rgbGen identity
        }
        {
                map models/weaphits/bfg02.png
                blendFunc GL_ONE GL_ONE
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
		map models/flags/flagtest.png
		rgbGen identity
        }
        {
		map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}


}
 models/weapons2/grapple/grapple
{
        {
		map models/weapons2/grapple/grapple.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/specular.png
                blendFunc GL_ONE GL_ONE
                tcmod scroll .1 .1
                tcGen environment
                rgbGen lightingDiffuse
	}
        {
		map models/weapons2/grapple/grapple.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}
models/weapons2/grapple/grapple_j
{

    cull disable

        {
                map models/weapons2/grapple/grapple_j.png
                blendFunc GL_ONE GL_ZERO
                tcMod turb 0 .5 0 .7
                tcMod scroll 1 -1
                tcmod scale .5 .5
                rgbGen identity
        }
        {
                map textures/liquids/jello2.png
                blendFunc GL_ONE GL_ONE
                tcmod scale .7 .7
                tcMod turb 0 .4 0 .3
                tcMod scroll .7 -.4
                rgbGen identity
        }
        {
		map textures/effects/tinfx2.png
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen lightingDiffuse
	}

}
models/weapons2/grapple/grapple_h
{

    cull disable

        {
                map models/weapons2/grapple/grapple_h.png
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}

models/players/sarge/krusade
{
        {
                map textures/sfx/firegorre.png
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}
        {
		map models/players/sarge/krusade.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}

models/players/sarge/roderic
{
        {
                map textures/sfx/firegorre.png
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}
        {
		map models/players/sarge/roderic.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}
models/players/sarge/null
{
    {
	map models/players/sarge/null.png
        blendFunc GL_ONE GL_ONE
    }

}
models/players/uriel/null
{
    {
	map models/players/uriel/null.png
        blendFunc GL_ONE GL_ONE
    }

}
models/players/major/daemia
{
        {
                map textures/sfx/electricslime.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale 3 3
                tcMod turb 0 .5 0 .7
                tcMod scroll 1 -1
                rgbGen identity
	}
        {
		map models/players/major/daemia.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}
 models/weapons2/gauntlet/gauntlet2
{
        {
                map textures/sfx/specular.png
                blendFunc GL_ONE GL_ZERO
                tcGen environment
                //rgbGen lightingDiffuse
                rgbGen identity
	}
        {
		map models/weapons2/gauntlet/gauntlet2.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}

///////////////
// begin Podium
//////////////

models/mapobjects/podium/podium
{
        {
		map models/mapobjects/podium/podium.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/specular.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scroll .2 0.01
                rgbGen identity
	}
        {
		map models/mapobjects/podium/podium.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
        {
                map models/mapobjects/podium/podiumglo.png
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin 1 1 0 .2
        }


}
models/mapobjects/podium/podskull
{
        {
		map models/mapobjects/podium/podskull.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/sfx/specular.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scroll .2 0.03
                rgbGen identity
	}
        {
		map models/mapobjects/podium/podskull.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
        {
                map models/mapobjects/podium/podskullfx.png
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin 1 1 0 .2
        }
}
models/mapobjects/podium/podiumfx1
{
      cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1.png
		blendFunc GL_ONE GL_ONE
                tcmod scroll 2 -.3
		rgbGen wave inversesawtooth 0 1 .35 .3
	}
        {
		map models/mapobjects/podium/podiumfx1b.png
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1.7 -.3
               rgbGen wave inversesawtooth 0 1 .35 .3
	}
        {
		map models/mapobjects/podium/podiumfx1b.png
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 .35 .3
	}
}
models/mapobjects/podium/podiumfx2
{
       cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1.png
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .5
                tcmod scroll .8 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	}
        {
		map models/mapobjects/podium/podiumfx1b.png
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .5
                tcmod scroll -1.7 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	}
        {
		map models/mapobjects/podium/podiumfx1b.png
		blendFunc GL_ONE GL_ONE
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
		map models/mapobjects/podium/podiumfx1.png
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .1
                tcmod scroll 1 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	}
        {
		map models/mapobjects/podium/podiumfx1b.png
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .1
                tcmod scroll -1.7 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	}
        {
		map models/mapobjects/podium/podiumfx1b.png
		blendFunc GL_ONE GL_ONE
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
//        	map models/players/ranger/wrack.png
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
        	map models/players/ranger/wrack.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/visor/gorre
{

        {
                map textures/sfx/firegorre.png
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}
        //{
        //        map textures/sfx/firewallb.png
        //        blendFunc GL_ONE GL_ONE
        //        tcmod scale 3 3
        //        tcMod turb 0 .2 0 .1
        //        tcMod scroll 0 3
        //        //tcmod rotate 360
        //        rgbGen identity
        //}
        {
		map models/players/visor/gorre.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
}
models/powerups/armor/newred
{
        {
                map textures/sfx/specular.png
                tcGen environment
                rgbGen identity
	}
        {
		map models/powerups/armor/newred.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}


}

models/powerups/armor/newyellow
{
        {
                map textures/sfx/specular.png
                tcGen environment
                rgbGen identity
	}
        {
		map models/powerups/armor/newyellow.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}


}
models/players/doom/phobos_f
{

         {
		map textures/effects/tinfx.png
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
	}
        {
		map models/players/doom/phobos_f.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
}
models/players/doom/phobos
{
         {
                map models/players/doom/phobos_fx.png
                blendFunc GL_ONE GL_ZERO
                tcmod scale 7 7
                tcMod scroll 5 -5
                tcmod rotate 360
                rgbGen identity
	}
        //{
	//	map textures/effects/tinfx2.png
        //        tcGen environment
        //        blendFunc GL_ONE GL_ONE
        //        rgbGen lightingDiffuse
	//}
        {
		map models/players/doom/phobos.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map models/mapobjects/bat/bat.png
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
                map models/mapobjects/meteor.png
                rgbGen vertex
                tcMod scale 4.90 2.234
	}


}
models/mapobjects/corpse/torso
{
  deformVertexes wave 100 sin 0 .2 0 .2
         {
		map textures/liquids/proto_grueldark.png
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 4 4
                tcMod scroll 0 -.09
                tcMod turb 0 0.05 0 .05
                rgbGen vertex
	}
        //{
	//	map textures/liquids/proto_grueldark.png
        //        //tcGen environment
        //        blendFunc GL_ONE GL_ONE
        //        tcmod scale 2 2
        //        tcMod scroll 0 -.09
       //         tcMod turb 0 0.07 0 .08
       //         //rgbGen identity
	//}
        {
		map models/mapobjects/corpse/torso.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}
models/mapobjects/corpse/chain
{
    cull disable

        {
                map models/mapobjects/corpse/chain.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/spine
{
    cull disable

        {
                map models/mapobjects/corpse/spine.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/intestine
{

    cull disable

        {
                map models/mapobjects/corpse/intestine.png
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
                map models/mapobjects/corpse/intestine2.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/players/lucy/h_angel
{
      cull none

        {
                map models/players/lucy/h_angel.png
                depthWrite
                rgbGen lightingDiffuse

        }
        {

		//map textures/effects/envmapcirc3.png

                map models/mapobjects/bitch/hologirl2.png
                 tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc GL_ONE GL_ONE
		 rgbGen identity
                // rgbGen vertex
                 rgbGen lightingDiffuse
	}

}
models/players/lucy/angel
{
         cull none

        {
                map models/players/lucy/angel.png
                alphaFunc GE128
		depthWrite
		//rgbGen identity
                rgbGen lightingDiffuse

        }
        {

		//map textures/effects/envmapcirc3.png

                map models/mapobjects/bitch/hologirl2.png
                 tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc GL_ONE GL_ONE
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
                map models/mapobjects/lamps/bot_wing2.png
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
                map models/mapobjects/lamps/bot_lamp2b.png
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
                map models/mapobjects/lamps/bot_light.png
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
		map models/mapobjects/lamps/beam.png
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        {
		map models/mapobjects/lamps/beam.png
                tcMod Scroll -.3 0
                blendFunc GL_ONE GL_ONE
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
                clampmap models/mapobjects/lamps/bot_flare.png
                blendFunc GL_ONE GL_ONE
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
                map models/mapobjects/lamps/bot_flare2.png
                blendFunc GL_ONE GL_ONE

        }


}

models/mapobjects/lamps/bot_lamp
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05

        {
                map models/mapobjects/lamps/bot_lamp.png
                rgbGen vertex

        }


}
models/mapobjects/lamps/bot_lamp2
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05

        {
                map models/mapobjects/lamps/bot_lamp2.png
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
                map models/mapobjects/lamps/bot_wing.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratetorch
{
    cull disable

        {
                map models/mapobjects/gratelamp/gratetorch.png
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratetorch2b
{
    cull disable

        {
                map models/mapobjects/gratelamp/gratetorch2b.png
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
		map models/mapobjects/chain/chain3.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map models/mapobjects/chain/chain3.png
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}

models/flags/flagbits
{
               cull none
	      // deformVertexes wave 100 sin 0 5 0 .7
	 {
                map models/flags/flagbits.png
                //blendfunc gl_src_alpha gl_one_minus_src_alpha
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
		map models/flags/r_flag2.png
		 rgbGen identity
	}
        {
		map models/flags/red_fx.png
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7

                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flags/r_flag2.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
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
		map models/flags/b_flag2.png
		 rgbGen identity
	}
        {
		map models/flags/blue_fx.png
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flags/b_flag2.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.png
                tcGen environment
                //blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
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
                map models/flags/flag_red.png
                //blendfunc gl_src_alpha gl_one_minus_src_alpha
                //alphaFunc GE128
                blendFunc GL_ONE GL_ONE
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
                map models/mapobjects/bitch/hologirl.png
                alphaFunc GE128
                depthWrite
                rgbGen lightingdiffuse

        }
        {
                map models/mapobjects/bitch/hologirl2.png
                tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc GL_ONE GL_ONE
		//rgbGen wave sin .5 .5 0 .1
	}


}
models/mapobjects/bitch/bitch02
{
	cull none

	{
		Map models/mapobjects/bitch/bitch02.png
		blendFunc GL_ONE GL_ONE
                tcGen environment
                tcMod scroll 0 0.3
	}



}
models/mapobjects/barrel/barrel2
{

	{
		Map models/mapobjects/barrel/barrel2.png
                rgbgen vertex

	}
        {
		clampmap models/mapobjects/barrel/barrel2fx.png
		blendFunc GL_ONE GL_ONE
               // rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate 403
	}
        {
		clampmap models/mapobjects/barrel/barrel2fx.png
		blendFunc GL_ONE GL_ONE
               // rgbgen wave triangle 1 1 0 8.7
                tcMod rotate -100
	}

}
models/weaphits/electric
{
	cull none

	{
		clampmap models/weaphits/electric.png
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle .8 2 0 9
                tcMod rotate 360
	}
        {
		clampmap models/weaphits/electric.png
		blendFunc GL_ONE GL_ONE
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
		clampmap models/mapobjects/flares/electric.png
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle .8 2 0 9
                tcMod rotate 360
	}
        {
		clampmap models/mapobjects/flares/electric.png
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate -202
	}

}
models/players/anarki/anarki_b

{
         {
		map textures/effects/envmapbfg.png
                tcGen environment
                tcmod rotate 350
                tcmod scroll 3 1
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	}
        {
                map models/players/anarki/anarki_b.png
                blendfunc blend
                rgbGen lightingDiffuse
        }

}
models/players/anarki/anarki_g

{
        {
                map models/players/anarki/anarki_g.png
                //rgbGen vertex
        }
        {

		map models/players/anarki/anarki_g_fx.png
		rgbGen lightingDiffuse
                rgbGen wave triangle 0 1 0 .5
		blendfunc gl_ONE gl_ONE
	}
}

models/mapobjects/wallhead/femhead

{
        deformVertexes wave 100 sin 0 .7 0 .2
        //deformVertexes wave 100 sin 0 1 1 .1
        cull disable

        {
                map models/mapobjects/wallhead/femhead3.png
                rgbGen vertex
        }
	{
	        map models/mapobjects/wallhead/femhead4.png
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen	wave sin 0 1 1 .1
                rgbGen vertex
	}

}
models/mapobjects/wallhead/wallhead_eye

{


        {
              animMap 0.2 models/mapobjects/wallhead/wallhead_eye.png models/mapobjects/wallhead/wallhead_eye2.png
                rgbGen vertex
        }


}
models/mapobjects/wallhead/wallhead

{


        {
             map models/mapobjects/wallhead/wallhead.png
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
//                map models/mapobjects/wallhead/femhead2.png
//                rgbGen vertex
//        }
//        {
//                map models/mapobjects/wallhead/femhead.png
//                Blendfunc GL_ONE GL_ONE
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
//		map models/mapobjects/wallhead/tongue.png
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

models/players/mynx/mynx_shiny
{

        {
                map textures/sfx/specular5.png
                blendFunc GL_ONE GL_ZERO
                tcGen environment
	}
        {
		map models/players/mynx/mynx_shiny.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
        	map models/players/razor/patriot.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

}
models/players/razor/patriot_gogs
{
        {
		map textures/effects/tinfx2d.png
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
		map gfx/2d/bigchars.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}


models/mapobjects/scoreboard/s_score
{
	sort additive
	cull disable
    deformVertexes text1
	{
		map gfx/2d/bigchars.png
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}


models/weapons2/lightning/crackle1
{
	sort additive
	cull disable

	{
		animMap 15 models/weapons2/lightning/crackle1.png models/weapons2/lightning/crackle2.png models/weapons2/lightning/crackle3.png models/weapons2/lightning/crackle4.png models/weapons2/lightning/crackle5.png models/weapons2/lightning/crackle6.png models/weapons2/lightning/crackle7.png models/weapons2/lightning/crackle8.png
		blendFunc GL_ONE GL_ONE
	}

}

models/weapons2/lightning/button
{
        {
		map models/weapons2/lightning/button.png
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 1 1 0 1
	}

}

models/weapons2/lightning/glass
{
        {
		map models/weapons2/lightning/glass.png
	}
	{
		map textures/effects/envmapdim.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
		rgbGen lightingDiffuse
	}
}
models/weapons2/lightning/trail
{
	{
		map models/weapons2/lightning/trail.png
		tcMod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc GL_ONE GL_ONE
	}
        {
		map models/weapons2/lightning/trail.png
		tcMod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/lightning/trail2
{
	{
		map models/weapons2/lightning/trail2.png
		tcMod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc GL_ONE GL_ONE
	}
        {
		map models/weapons2/lightning/trail2.png
		tcMod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/lightning/trail1
{
	sort additive
	cull disable

	{
		animMap 15 models/weapons2/lightning/trail1.png models/weapons2/lightning/trail2.png models/weapons2/lightning/trail3.png models/weapons2/lightning/trail4.png
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}

}

models/weapons2/lightning/ball1
{
	sort additive
	cull disable

	{
		animMap 15 models/weapons2/lightning/ball1.png models/weapons2/lightning/ball2.png
		blendFunc GL_ONE GL_ONE
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
                map models/mapobjects/slamp/slamp3.png
                blendFunc GL_ONE GL_ONE

        }


}
models/mapobjects/slamp/slamp2
{
    cull disable
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap

        {
                map models/mapobjects/slamp/slamp2.png
                blendFunc GL_ONE GL_ONE
        }
        {
		map textures/effects/envmapdimb.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
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
		animMap 15 models/mapobjects/lightning/white/white1.png models/mapobjects/lightning/white/white2.png models/mapobjects/lightning/white/white3.png models/mapobjects/lightning/white/white4.png models/mapobjects/lightning/white/white5.png models/mapobjects/lightning/white/white6.png models/mapobjects/lightning/white/white7.png models/mapobjects/lightning/white/white8.png
		blendFunc GL_ONE GL_ONE
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
		animMap 15 models/mapobjects/lightning/red/red01.png models/mapobjects/lightning/red/red02.png models/mapobjects/lightning/red/red03.png models/mapobjects/lightning/red/red04.png models/mapobjects/lightning/red/red05.png models/mapobjects/lightning/red/red06.png models/mapobjects/lightning/red/red07.png models/mapobjects/lightning/red/red08.png
		blendFunc GL_ONE GL_ONE
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
		animMap 15 models/mapobjects/lightning/yel/yel01.png models/mapobjects/lightning/yel/yel02.png models/mapobjects/lightning/yel/yel03.png models/mapobjects/lightning/yel/yel04.png models/mapobjects/lightning/yel/yel05.png models/mapobjects/lightning/yel/yel06.png models/mapobjects/lightning/yel/yel07.png models/mapobjects/lightning/yel/yel08.png
		blendFunc GL_ONE GL_ONE
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
		animMap 15 models/mapobjects/lightning/blu/blu01.png models/mapobjects/lightning/blu/blu02.png models/mapobjects/lightning/blu/blu03.png models/mapobjects/lightning/blu/blu04.png models/mapobjects/lightning/blu/blu05.png models/mapobjects/lightning/blu/blu06.png models/mapobjects/lightning/blu/blu07.png models/mapobjects/lightning/blu/blu08.png
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}

}

models/mapobjects/pitted_rust_ps
{
     cull disable

        {
                map models/mapobjects/pitted_rust_ps.png
                rgbGen vertex
        }


}

models/mapobjects/signs/bioh
{
     cull disable

        {
                map models/mapobjects/signs/bioh.png
                rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratelamp
{
    cull disable

        {
                map models/mapobjects/gratelamp/gratelamp.png
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
		Map models/mapobjects/gratelamp/gratelamp_flare.png
		blendFunc GL_ONE GL_ONE
	}

}

models/weapons2/grenadel/ring
{

	{
		map models/weapons2/grenadel/ring.png
        }

        {
                map textures/effects/envmapdim.png
		tcGen environment
		blendFunc GL_ONE GL_ONE
                //rgbGen identity
        }
}
models/mapobjects/chain/chain
{
     cull disable
        {
                map models/mapobjects/chain/chain.png
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
                map models/mapobjects/chain/chain2.png
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
                map models/mapobjects/chain/chain2_end.png
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
                map models/mapobjects/tree/branch.png
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
		map models/players/orbb/orbb_tail.png
		blendFunc GL_ONE GL_ONE
                tcmod scroll 0 .5
		rgbGen wave sin .5 .25 0 .5
	}
}
models/players/orbb/orbb_tail_blue
{

	{
		map models/players/orbb/orbb_tail_blue.png
		blendFunc GL_ONE GL_ONE
                tcmod scroll 0 .5
		rgbGen wave sin .5 .25 0 .5
	}
}
models/players/orbb/orbb_light
{
	{
		map models/players/orbb/orbb_light.png
		rgbGen wave sin 1 1 0 1

	}
}
models/players/orbb/orbb_light_blue
{
	{
		map models/players/orbb/orbb_light_blue.png
		rgbGen wave sin 1 1 0 1

	}
}
models/players/orbb/orbb_h2
{
        {
		map models/players/orbb/orbb_h2.png
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	}
        {
                map textures/effects/tinfx.png
                blendFunc GL_ONE GL_ONE
                tcGen environment
                rgbGen lightingDiffuse
	}
        {
		map models/players/orbb/orbb_h2.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}

models/players/orbb/red_h
{

	{
		map models/players/orbb/red_h.png
                rgbGen lightingDiffuse
        }

        {
	        clampmap textures/base_floor/techfloor2.png
		blendfunc blend
                tcmod rotate 90
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen lightingDiffuse
	}

}
models/players/orbb/blue_h
{

	{
		map models/players/orbb/blue_h.png
                rgbGen lightingDiffuse
        }

        {
	        clampmap textures/base_floor/techfloor2.png
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
                map models/mapobjects/teleporter/transparency2.png
                blendfunc GL_ONE GL_ONE
                tcMod scroll .1 .2
        }

}

models/flags/b_flag
{
               cull disable
	       deformVertexes wave 100 sin 0 3 0 .7

        {
               map models/flags/b_flag.png

        }


}

models/flags/r_flag
{
               cull disable
	       deformVertexes wave 100 sin 0 3 0 .7

        {
               map models/flags/r_flag.png

        }


}
models/flags/pole
{

        {
             map models/flags/skull.png
		tcGen environment
		rgbGen lightingDiffuse

        }


}
models/flags/skull
{

        {
             map models/flags/skull.png
		//tcGen environment
		rgbGen lightingDiffuse

        }


}
models/players/hunter/hunter_f
{
     deformVertexes wave 100 sin 0 .3 0 .2
     cull disable
        {
                map models/players/hunter/hunter_f.png
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map models/players/hunter/red_f.png
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map models/players/uriel/uriel_w.png
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map models/players/uriel/red_w.png
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
                map models/players/uriel/blue_w.png
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
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
		clampmap models/mapobjects/bitch/orb.png
		blendFunc GL_ONE GL_ONE
                tcMod rotate 30
	}

}

models/mapobjects/bitch/forearm
{
        {
                map models/mapobjects/bitch/forearm.png
                rgbGen vertex
        }
	{
               map models/mapobjects/bitch/forearm01.png
               blendfunc GL_ONE GL_ONE
               tcMod scroll 2.2 0

        }
        {
               map models/mapobjects/bitch/forearm02.png
               blendfunc GL_ONE GL_ONE
               tcMod scroll -1.1 0

        }
}

models/players/parkr/parkr_head
{
	{
		map textures/effects/envmap2.png
		tcGen environment
	}
}

models/players/parkr/parkr_chest
{
         {
                map models/players/parkr/parkr_chest.png
        }
	{
		AnimMap 4 models/players/parkr/parkr_chest_red.png models/players/parkr/parkr_chest_blu.png
	       blendfunc GL_ONE GL_ONE
	}
}
models/mapobjects/teleporter/energy
{
   cull disable
   surfaceparm trans

       {
               map models/mapobjects/teleporter/energy.png
               blendfunc GL_ONE GL_ONE
               tcMod scroll 2.2 1.3
               rgbGen wave inversesawtooth -.3 1.3 0 1.3

       }
	{
		map models/mapobjects/teleporter/energy2.png
		blendfunc GL_ONE GL_ONE
		tcMod scroll -1 .5
		rgbGen wave inversesawtooth -.2 1.2 0 .5

	}
	{
                map models/mapobjects/teleporter/energy3.png
                blendfunc GL_ONE GL_ONE
                tcMod scroll 3 0
		rgbGen wave triangle 1 1 0 5.3

	}

}

models/mapobjects/teleporter/widget
{
   cull disable

        {
                map models/mapobjects/teleporter/widget.png
                blendfunc GL_ONE GL_ONE

        }
        {
                map models/mapobjects/teleporter/transparency2.png
                blendfunc GL_ONE GL_ONE
                tcMod scroll -.1 -.2
        }

}

models/mapobjects/teleporter/transparency
{
   cull disable

        {
                map models/mapobjects/teleporter/transparency.png
                blendfunc GL_ONE GL_ONE

        }
        {
                map models/mapobjects/teleporter/transparency2.png
                blendfunc GL_ONE GL_ONE
                tcMod scroll .1 .2
        }

}

models/mapobjects/teleporter/teleporter_edge
{


        {
          map models/mapobjects/teleporter/teleporter_edge.png
          rgbGen vertex
        }
        {
                map models/mapobjects/teleporter/teleporter_edge2.png
                blendfunc GL_ONE GL_ONE
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
		map models/mapobjects/jesus/jesuswall.png
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen vertex
		alphaGen lightingSpecular
	}


}


models/mapobjects/hand
{
   deformVertexes wave 100 sin 0 .3 0 .2

        {
                map models/mapobjects/hand.png
                rgbGen vertex
        }


}

models/mapobjects/corpse/corpse
{
   deformVertexes wave 100 sin 0 .2 0 .2

        {
                map models/mapobjects/corpse/corpse.png
                rgbGen exactVertex
        }


}
models/mapobjects/skull/ribcage
{
	sort underwater
        cull disable
        {
                map models/mapobjects/skull/ribcage.png
                // blendfunc gl_src_alpha gl_one_minus_src_alpha
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
//                map models/mapobjects/flag/banner_eg1.png
//                // blendfunc gl_src_alpha gl_one_minus_src_alpha
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
                map models/mapobjects/flag/banner_strgg.png
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
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
                map models/mapobjects/flag/banner02.png

        }


}

models/mapobjects/weeds/weed02
{
	sort underwater
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
        {
                map models/mapobjects/weeds/weed02.png
                blendfunc gl_src_alpha gl_one_minus_src_alpha
        }


}
models/mapobjects/weeds/weed01
{
	sort additive
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
        {
                map models/mapobjects/weeds/weed01.png
                blendfunc gl_src_alpha gl_one_minus_src_alpha
        }


}

models/mapobjects/portal_2/portal_3_edge
{
        {
                map models/mapobjects/portal_2/portal_3_edge.png
                rgbGen vertex
        }

	{
		map models/mapobjects/portal_2/portal_3_edge_glo.png
		blendFunc GL_ONE GL_ONE
		tcMod scroll 9.7 .5
	}

}

models/players/razor/razor_gogs
{
	{
		map models/players/razor/razor_gogs.png
                tcGen environment

	}


	{
		map	models/players/razor/razor_gogs_fx.png
		blendfunc GL_ONE GL_ONE
		tcMod scroll 1.2 9.3

	}
}

models/players/slash/slashskate
{
        //deformVertexes wave 100 sin 0 1 1 5
	sort additive
	cull disable
	{
		clampmap models/players/slash/slashskate.png
		blendFunc GL_ONE GL_ONE
                //tcmod rotate 100
                tcMod stretch sin .9 0.1 0 1.1
                rgbgen identity

	}
}


models/mapobjects/colua0/colua0_lght
{
	surfaceparm	trans
	{
		map textures/effects/tinfx2b.png
		tcGen environment
		blendFunc GL_ONE GL_ONE
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
		Map models/mapobjects/colua0/colua0_flare.png
		blendFunc GL_ONE GL_ONE
	}

}
models/mapobjects/kmlamp_white
{

	surfaceparm	trans
	{
		map textures/effects/tinfxb.png
		tcGen environment
		blendFunc GL_ONE GL_ONE
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
		Map models/mapobjects/lamps/flare03.png
		blendFunc GL_ONE GL_ONE
	}

}

//models/weapons2/chainsaw/f_chainsaw
//{
//	sort nearest
//	cull back
//	{
//		map	models/weapons2/chainsaw/f_chainsaw.png
//		blendfunc GL_ONE GL_ONE_MINUS_SRC_COLOR
//
//	}
//}

models/players/sarge/cigar
{
	{
		map models/players/sarge/cigar.png
                blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse

        }

	{
		map models/players/sarge/cigar.glow.png
		blendfunc GL_ONE GL_ONE
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
//		map models/powerups/ammo/ammo_rail1.png
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail1.glow.png
//		blendfunc GL_ONE GL_ONE
//		rgbGen wave sin 0.75 0.25 0 1
//	}
//}
//models/powerups/ammo/ammo_rail2
//{
//	{
//		map models/powerups/ammo/ammo_rail2.png
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail2.glow.png
//		blendfunc GL_ONE GL_ONE
//	}
//}
models/powerups/ammo/bfgammo
{
   cull none
       {
	        map textures/effects/envmapbfg.png
		 //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
        {
	        map textures/effects/tinfx2.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
                rgbGen identity
       }
       {
	        map models/powerups/ammo/bfgammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/bfgammo1
{
        {
	        map textures/effects/envmapbfg.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/ammo/bfgammo2
{
	{
		map models/powerups/ammo/bfgammo2.png
		rgbGen identity
	}

}
//models/powerups/ammo/bounammo1
//{
//	{
//		map models/powerups/ammo/bounammo1.png
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/bounammo2
//{
//	{
//		map models/powerups/ammo/bounammo2.png
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/bounammo2.glow.png
//		blendfunc GL_ONE GL_ONE
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo1
//{
//	{
//		map models/powerups/ammo/flamammo1.png
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo2
//{
//	{
//		map models/powerups/ammo/flamammo2.png
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/flamammo2.glow.png
//		blendfunc GL_ONE GL_ONE
//	}
//}
models/powerups/ammo/grenammo
{
       {
	        map textures/effects/tinfx2d.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/grenammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/grenammo1
{
	{
	        map textures/effects/envmapgren.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/ammo/grenade
{
        {
                map models/ammo/grenade.png
        }
	{
		AnimMap 7 models/ammo/grenade_r.png models/ammo/grenade_g.png
	       blendfunc GL_ONE GL_ONE
	}
}
models/powerups/ammo/grenammo2
{
	{
		map models/powerups/ammo/grenammo2.png
		rgbGen identity
	}

}
models/powerups/ammo/lighammo
{
       {
	        map textures/effects/envmapligh.png
		 //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/lighammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/lighammo1
{
	{
	        map textures/effects/envmapligh.png
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
		map models/powerups/ammo/lighammo2.png
		rgbGen identity
	}

}
models/powerups/ammo/machammo
{
       {
	        map textures/effects/tinfx2d.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/machammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo1
{
       {
	        map textures/effects/envmapmach.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo2
{
	{
		map models/powerups/ammo/machammo2.png
		rgbGen identity
	}

}
models/powerups/ammo/plasammo1
{
       {
	        map textures/effects/envmapplas.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/plasammo
{
       {
	        map textures/effects/envmapplas.png
                //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/plasammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/plasammo2
{
	{
		map models/powerups/ammo/plasammo2.png
		rgbGen identity
	}

}
models/powerups/ammo/railammo1
{
       {
	        map textures/effects/envmaprail.png
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
	        map textures/effects/envmaprail.png
                //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/railammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/railammo2
{
	{
		map models/powerups/ammo/railammo2.png
		rgbGen identity
	}

}
models/powerups/ammo/rockammo
{
       {
	        map textures/effects/tinfx2d.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/rockammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo1
{
       {
	        map textures/effects/envmaproc.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo2
{
	{
		map models/powerups/ammo/rockammo2.png
		rgbGen identity
	}

}
models/powerups/ammo/shotammo
{
       {
	        map textures/effects/tinfx2c.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/shotammo.png
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo1
{
       {
	        map textures/effects/envmapgold3.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo2
{
	{
		map models/powerups/ammo/shotammo2.png
		rgbGen identity
	}

}

//
// health
//
models/powerups/health/yellow
{

	{
		map textures/effects/envmapyel.png
                tcGen environment
		//blendfunc GL_ONE GL_ONE

	}

}
models/powerups/health/yellow_sphere
{
	{
		map textures/effects/tinfx2b.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/red
{

	{
		map textures/effects/envmapgold.png
                tcGen environment
		blendfunc GL_ONE GL_ZERO

	}
        {
		map textures/sfx/kenelectric.png
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc GL_ONE GL_ONE

	}
}
models/powerups/health/mega2
{

	{
		map textures/effects/envmapblue.png
                tcGen environment
		blendfunc GL_ONE GL_ZERO

	}
        {
		map textures/sfx/kenelectric.png
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc GL_ONE GL_ONE

	}
}
models/powerups/health/mega1
{
	{
		map textures/effects/envmapblue2.png
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/red_sphere
{
	{
		map textures/effects/envmapgold2.png
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/green
{

	{
		map textures/effects/envmaprail.png
		tcGen environment

	}
}
models/powerups/health/green_sphere
{
	{
		map textures/effects/tinfx2b.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/blue
{
	{
		map textures/effects/envmapbfg.png
		tcGen environment

	}
}
models/powerups/health/blue_sphere
{
	{
		map textures/effects/tinfx2b.png
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}


//
// mapobjects
//
models/powerups/armor/energy_red1
{

	{
		map models/powerups/armor/energy_red1.png
                blendFunc GL_ONE GL_ONE
		tcMod scroll 7.4 1.3
	}

}

models/powerups/armor/energy_yel1
{

	{
		map models/powerups/armor/energy_yel3.png
		blendFunc GL_ONE GL_ONE
		tcMod scroll 7.4 1.3
	}

}

models/powerups/armor/energy_grn1
{
   deformVertexes wave 100 sin 2 0 0 0
	{
		map textures/effects/envmaprail.png
		blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod rotate 30
		tcMod scroll 1 1
                rgbGen wave triangle -.3 1.3 0 .3
	}

}

models/mapobjects/lamplight_ys
{
	{
		map models/mapobjects/lamplight_ys.png
		blendfunc GL_ONE GL_ONE

	}
}

models/mapobjects/pj_light
{
     cull none
        {
		map textures/effects/tinfx2.png
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen vertex
	}
	{
		map models/mapobjects/pj_light.png
		blendfunc GL_ONE GL_ONE
		rgbGen vertex
	}

}

models/mapobjects/lamplight_y
{
	q3map_surfacelight 10000
	light 1
        cull disable
	{
                map textures/effects/envmapmach.png
		//map models/mapobjects/lamplight_y.png
		blendfunc GL_ONE GL_ONE
		tcGen environment
                rgbGen identity
	}
}

models/mapobjects/arenalogo
{
	deformVertexes wave 100 sin 0.25 0 0 0
	{
		map textures/effects/quadmap.png
		blendfunc GL_ONE GL_ONE
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
		map	models/weapons2/machinegun/f_machinegun.png
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/railgun/f_railgun2
{
	sort additive
	cull disable
	{
		map	models/weapons2/railgun/f_railgun2.png
		blendfunc GL_ONE GL_ONE
		rgbgen entity
	}
}

models/weapons2/railgun/railgun2
{
	sort additive
	cull disable
	{
		map	models/weapons2/railgun/railgun2.glow.png
		blendfunc GL_ONE GL_ONE
		rgbGen entity	// identity
	}
}

models/weapons2/railgun/railgun3
{
	{
		map	models/weapons2/railgun/railgun3.png
		rgbGen lightingDiffuse
	}

	{
		map	models/weapons2/railgun/railgun3.glow.png
		blendfunc GL_ONE GL_ONE
		rgbGen entity	// identity
	}
}

models/weapons2/railgun/railgun4
{
	{
		map models/weapons2/railgun/railgun4.png
		tcMod scroll 0 1
		rgbGen entity	// identity
	}

}

models/weapons2/shotgun/f_shotgun
{
	sort additive
	cull disable
	{
		map	models/weapons2/shotgun/f_shotgun.png
		blendfunc add
	}
}

models/weapons2/shotgun/shotgun_laser
{

	{
		map	models/weapons2/shotgun/shotgun_laser.png
		blendfunc add
	}
}
models/weapons2/bfg/f_bfg
{
	sort additive
	cull disable
	{
		clampmap models/weapons2/bfg/f_bfg.png
		blendfunc GL_ONE GL_ONE
                tcmod rotate 360
        }
        {
		clampmap models/weapons2/bfg/f_bfg2.png
		blendfunc GL_ONE GL_ONE
                tcmod rotate -129
                //tcMod stretch sin .8 0.10 0 .7
        }

}
models/weapons2/bfg/bfg_e
{
	{
		//map models/weapons2/bfg/bfg_e2.png
                map textures/effects/envmapbfg.png
		blendfunc GL_ONE GL_ZERO
                tcMod turb 0 .5 0 .1
                tcmod scale .4 .4
                tcMod scroll .2 -.2
                rgbGen identity
        }
        {
                //map models/weapons2/bfg/bfg_e2.png
		//map models/players/doom/phobos_fx.png
                map textures/effects/envmapbfg.png
		blendfunc GL_ONE GL_ONE
                tcMod turb 0 .5 0 .1
                tcmod scale .2 .2
                tcMod scroll .3 .6
                rgbGen identity
        }
        {
		map textures/effects/tinfx.png
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen lightingDiffuse
	}
}
 models/weapons2/bfg/bfg
{
        {
                map textures/effects/tinfx2d.png
                blendFunc GL_ONE GL_ZERO
                tcmod scroll .01 .01
                tcGen environment
                rgbGen lightingDiffuse
	}
        {
		map models/weapons2/bfg/bfg.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}
 models/weapons2/bfg/bfg_k
{

        {
                map textures/effects/envmapbfg.png
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 30
                tcmod scroll 1 1
                tcGen environment
                rgbGen identity
	}
        {
		map models/weapons2/bfg/bfg_k.png
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}


}
models/weapons2/grenadel/f_grenadel
{
	sort additive
	cull disable
	{
		map	models/weapons2/grenadel/f_grenadel.png
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/lightning/f_lightning
{
	sort additive
	cull disable
	{
		map models/weapons2/lightning/f_lightning.png
		blendfunc GL_ONE GL_ONE
	}
}
sprites/plasma1
{
	cull disable
	{
		clampmap sprites/plasmaa.png
		blendfunc GL_ONE GL_ONE
                tcMod rotate 931
	}
}
models/ammo/rocket/rockfls1
{
	cull disable
	{
		map models/ammo/rocket/rockfls1.png
		blendfunc GL_ONE GL_ONE
	}
}
models/ammo/rocket/rockfls2
{
	cull disable
	{
		map models/ammo/rocket/rockfls2.png
		blendfunc GL_ONE GL_ONE
	}
}
models/ammo/rocket/rockflar
{
	cull disable
	{
		map models/ammo/rocket/rockflar.png
		blendfunc GL_ONE GL_ONE
	}
}

sprites/plasma2
{
	cull disable
	{
		map sprites/plasma2.png
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/plasma/f_plasma
{
	cull disable
	sort additive
	{
		map models/weapons2/plasma/f_plasma.png
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/flamethrower/f_flamethrower
{
	cull disable
	sort additive
	{
		map models/weapons2/flamethrower/f_flamethrower.png
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/grapple/f_grapple
{
	cull disable
	sort additive
	{
		map models/weapons2/grapple/f_grapple.png
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/rocketl/f_rocketl
{
	cull disable
	sort additive
	{
		map models/weapons2/rocketl/f_rocketl.png
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/gauntlet/gauntlet3
{

	cull disable
	sort additive
	{
              // map models/weapons2/gauntlet/gauntlet3.png
               AnimMap 10 models/weapons2/gauntlet/gauntlet3.png models/weapons2/gauntlet/gauntlet4.png
	       blendfunc GL_ONE GL_ONE
	}
}

// this one can go away eventually
models/weapons2/rocketl/rocketl14
{
	cull disable
	sort additive
	{
		map models/weapons2/rocketl/f_rocketl.png
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons/vulcan/f_vulcan
{
	sort additive
	cull disable
	{
		map	models/weapons/vulcan/f_vulcan.png
		blendfunc GL_ONE GL_ONE
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
        	map models/players/tankjr/tankjr.png
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
//		map models/players/visor/visorhead.png
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
//		map models/players/visor/visortorso2.png
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}

models/players/doom/f_doom
{
	{
		map models/players/doom/f_doom.png
	}
	{

		map models/players/doom/fx_doom.png
		tcGen environment
		rgbGen lightingDiffuse
		blendfunc gl_ONE gl_ONE
	}
}
models/players/doom/doom_f
{
	{
		map models/players/doom/doom_f.png
                rgbGen lightingDiffuse
	}
        {

		map models/players/doom/doom_fx.png
		tcGen environment
		rgbGen lightingDiffuse
		blendfunc gl_ONE gl_ONE
	}

}



//
// weapons
//

models/weapons2/plasma/plasma_glass
{

	{
		map textures/effects/tinfxb.png
		tcGen environment
                tcMod scroll .01 .02
		blendfunc GL_ONE GL_ONE
		rgbGen lightingDiffuse
	}
}
models/weapons2/plasma/plasma_glo
{

	{
		map models/weapons2/plasma/plasma_glo.png
                tcmod rotate 33
                tcMod scroll .7 1
                rgbGen identity
	}
        {
		map textures/effects/tinfxb.png
		tcGen environment
                tcMod scroll .01 .02
		blendfunc GL_ONE GL_ONE
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
		map models/weapons2/lightning/ball.png
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 2 0 7
                tcMod rotate 360
	}
        {
		map models/weapons2/lightning/ball.png
		blendfunc GL_ONE GL_ONE
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
		map models/powerups/instant/scan.png
	}
	{
		map textures/effects/envmapdim.png
		blendfunc GL_ONE GL_ONE
		tcGen environment
	}
}
models/powerups/instant/quad
{
	//{
	//	map gfx/colors/darkblue.png
	//}
	{
		map textures/effects/envmapblue.png
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/enviro
{
	//{
	//	map models/powerups/instant/enviro.png
	//}
	{
		map textures/effects/envmapgold.png
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/flight
{
	{
		map textures/effects/envmappurp.png
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/haste
{
	{
		map textures/effects/envmapyel.png
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/invis
{
	{
		map textures/effects/tinfx2c.png
                //map textures/sfx/specular.png
		blendfunc GL_ONE GL_ONE
		tcGen environment
	}
}
models/powerups/instant/regen
{
	{
		map textures/effects/envmapred.png
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
	}
}



models/powerups/holdable/teleport_base
{
	{
		map textures/effects/envmap.png
		tcgen environment
	}

}

models/powerups/holdable/teleport_sphere
{
	{
		map textures/effects/envmapdim.png
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}

}

models/powerups/holdable/teleport_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/teleport_fluid.png
		tcMod scroll 0 2
		blendfunc GL_ONE GL_ONE
	}

}
