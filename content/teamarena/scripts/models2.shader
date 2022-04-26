models/mapobjects/terrastone/magicstone01
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .4
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2.tga
		 rgbGen vertex
	}
        
}
models/mapobjects/terrastone/magicstone02
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .3
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2.tga
		 rgbGen vertex
	}
        
}
models/mapobjects/terrastone/magicstone03
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .2
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2.tga
		 rgbGen vertex
	}
        
}
models/mapobjects/terrastone/magicstone04
{
	deformVertexes move 0 0 1.5  sin 0 5 0 .25
	//cull none
        //nopicmip
	{
		map textures/stone/pjrock9b_2.tga
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
		clampmap models/mapobjects/tree2/branch2.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        
	}
}

models/mapobjects/weeds2/weeds2
{
     
     cull disable
     surfaceParm Trans

        {
                map models/mapobjects/weeds2/weeds2.tga
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}

models/players/heads/james/james_e_red
{

        {
                map models/players/james/red2.tga
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/heads/james/james_e_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/james/james_e_blu
{

        {
                map models/players/james/blue2.tga
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/heads/james/james_e_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/janet/janet_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/janet/janet_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/james/james_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/james/james_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/janet/janet_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/janet/janet_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/heads/james/james_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/heads/james/james_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/powerups/ob2_1
{
        {
	        map models/powerups/overload_map.tga
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen identity
        }
}

models/powerups/ob2_2
{
        {
	        map models/powerups/overload_mapbw.tga
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen entity
        }
}

models/powerups/ob2_3
{
        {
		map models/powerups/overload_lights.tga
		tcmod scroll 1 1
	        rgbGen entity
        }
}

models/powerups/ob2_4
{
 cull disable
	{
		map models/powerups/pop_bw.tga
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
	        map models/powerups/shield_map.tga
		tcGen environment
		rgbGen identity
        }
}

models/powerups/shield_3
{
        {
	        map models/powerups/shield_map.tga
		tcGen environment
		blendfunc add
                rgbGen identity
        }
}

models/powerups/shield_2
{
   	
        {
	        map models/powerups/shield_fx.tga
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}

models/powerups/porter1
{
        {
	        map models/powerups/porter_map.tga
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen identity
        }
}

models/powerups/porter2
{
   	
        {
	        map models/powerups/porter_fx.tga
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}

models/mapobjects/statues/flagbits_stat
{
               cull none
	      
	 {
                map models/mapobjects/statues/flagbits_stat.tga
                alphaFunc GE128
                rgbGen lightingDiffuse
                depthWrite
        }

}

models/powerups/shield/shield
{
 cull disable
	{
		map models/powerups/shield/shield.tga
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
		map models/powerups/shield/shield2.tga
                tcmod rotate 313
		blendfunc Add
	}
        {
		map models/powerups/shield/shield2.tga
                tcmod rotate -483
		blendfunc Add
	}
}


models/players/heads/callisto/callisto
{
        
        {
		AnimMap 5 models/players/heads/callisto/callisto.tga models/players/heads/callisto/callisto.tga models/players/heads/callisto/callisto.tga models/players/heads/callisto/callisto.tga models/players/heads/callisto/callisto.tga models/players/heads/callisto/callisto2.tga models/players/heads/callisto/callisto.tga models/players/heads/callisto/callisto2.tga
		rgbGen lightingdiffuse
	}
        
        
}

models/players/heads/ursula/ursula_e
{       	
        surfaceparm trans
	{
		map models/players/heads/ursula/ursula_e.tga
		blendFunc Add
		rgbgen wave triangle 0.2 0.5 0 0.2
       	}

}


models/players/heads/gaunt/gaunt_e
{       	
        surfaceparm trans
	{
		map models/players/heads/gaunt/gaunt_e.tga
		blendFunc Add
		rgbgen wave triangle 0.2 0.5 0 0.2
       	}

}
models/powerups/ob2_target
{
	cull none
             
        {
		map models/powerups/ob2_target.tga
		//rgbGen identity
		rgbGen entity		
	}
                
}

models/powerups/ob2_energy
{
	cull none
             
        {
		map models/powerups/ob2_energy.tga
		//rgbGen identity
		rgbGen entity
		blendfunc add
	}
                
}

models/powerups/ob2_energy2
{
	cull none    
        
	{
		map models/powerups/ob2_energy2.tga
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
		AnimMap 15 models/powerups/ob2_lightn1.tga models/powerups/ob2_lightn2.tga models/powerups/ob2_lightn3.tga models/powerups/ob2_lightn4.tga models/powerups/ob2_lightn5.tga models/powerups/ob2_lightn6.tga models/powerups/ob2_lightn7.tga models/powerups/ob2_lightn8.tga  
		rgbGen identity
		blendfunc add
	}
        
        
}

models/powerups/ob2_lightning2
{
      
	deformVertexes wave 30 sin 0 3 0 .1
        cull none
        
        {
		AnimMap 15 models/powerups/ob2_lightn3.tga models/powerups/ob2_lightn1.tga models/powerups/ob2_lightn4.tga models/powerups/ob2_lightn2.tga models/powerups/ob2_lightn6.tga models/powerups/ob2_lightn5.tga models/powerups/ob2_lightn8.tga models/powerups/ob2_lightn7.tga  
		rgbGen identity
		blendfunc add
	}
        
        
}

models/powerups/ob2_lightning3
{
      
	deformVertexes wave 100 sin 4 3 0 0.3
        cull none
        
        {
		AnimMap 15 models/powerups/ob2_lightn4.tga models/powerups/ob2_lightn6.tga models/powerups/ob2_lightn1.tga models/powerups/ob2_lightn3.tga models/powerups/ob2_lightn8.tga models/powerups/ob2_lightn4.tga models/powerups/ob2_lightn5.tga models/powerups/ob2_lightn3.tga  
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
	        clampmap models/weaphits/kamiwave01.tga 
		blendFunc Add
                tcmod rotate 20
		rgbGen entity
	}
	{
	        clampmap models/weaphits/kamiwave01.tga 
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
	        map models/weaphits/kamiwave02.tga 
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
	        map models/powerups/kamitrail.tga 
		blendFunc Add
		rgbGen identity
	}
}
models/weaphits/proxminet
{
        cull disable  
        {
                map models/weaphits/proxmine.tga
                rgbGen lightingdiffuse
        }
        {
                map models/weaphits/proxminebt.tga
                blendFunc add
                rgbGen wave sin .5 .5 0 2
        }

}

models/weaphits/proxmine2t
{
        cull disable  
        nomipmaps
        {
                clampmap models/weaphits/proxmine2t.tga
                blendFunc add
                tcmod rotate 200
                tcMod stretch sin .6 0.2 0 .11
                rgbGen identity
        }
        {
                clampmap models/weaphits/proxmine2t.tga
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
	        map textures/effects/tinfx2d.tga
                tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbgen identity
       }
       {
                map models/weaphits/kamik02r.tga
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
	        map textures/effects/tinfx2d.tga
                tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbgen identity
       }
       {
                map models/weaphits/kamik02b.tga
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
                map models/players/heads/gammy/gammy_blu.tga
                rgbGen lightingdiffuse
        }
}
models/players/heads/gammy/gammy_red
{
     deformVertexes wave 100 sin 0 .08 0 .23

        {
                map models/players/heads/gammy/gammy_blu.tga
                rgbGen lightingdiffuse
        }
}
models/players/heads/gammy/gammy2
{
     deformVertexes wave 100 sin 0 .08 0 .23
     cull disable

        {
                map models/players/heads/gammy/gammy2.tga
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
                map models/players/heads/gammy/gammy3.tga
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}


models/players/heads/morgan/morgan_blu
{
     

        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/morgan/morgan_blu.tga
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}
models/players/heads/morgan/morgan_red
{
     

        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/morgan/morgan_red.tga
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}

models/players/heads/megan/megan1_blu
{
     

        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/megan/megan1_blu.tga
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}
models/players/heads/megan/megan1_red
{
     


        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/megan/megan1_red.tga
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}


models/players/heads/megan/megan3
{
     
     //cull disable

       // {
       //         map models/players/heads/megan/megan3.tga
       //         blendFunc Add
       //         rgbGen lightingdiffuse
       // }
        {
                map textures/effects/tinfx2c.tga
                blendFunc Add
                tcGen environment
                rgbGen lightingdiffuse
        }

}
models/players/heads/megan/megan2
{
     

        {
                map textures/effects/tinfx2c.tga
                tcGen environment
                rgbGen lightingdiffuse
        }

        {
                map models/players/heads/megan/megan2.tga
                blendfunc Blend
                rgbGen lightingdiffuse
        }

}

models/powerups/teleporter/tele_enter
{
     
     cull disable

        {
                clampmap models/powerups/teleporter/tele_enter.tga
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}
models/powerups/teleporter/tele_enter2
{
     
     cull disable

        {
                clampmap models/powerups/teleporter/tele_enter2.tga
                blendfunc Add
                tcmod rotate 120
                rgbGen lightingdiffuse
        }
}
models/powerups/teleporter/tele_exit2
{
     
     cull disable

        {
                clampmap models/powerups/teleporter/tele_exit2.tga
                blendfunc Add
                tcmod rotate 120
                rgbGen lightingdiffuse
        }
}
models/powerups/teleporter/tele_exit
{
     
     cull disable

        {
                clampmap models/powerups/teleporter/tele_exit.tga
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}



models/players/heads/neptune/neptune2
{
     
     //cull disable

        {
                map models/players/heads/neptune/neptune2.tga
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
                map models/mapobjects/techlamp/techlamp02trn.tga
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
                map models/mapobjects/techlamp/techlamp02lt.tga
                BlendFunc Add
                rgbGen wave sin 0 1 0 .5
        }
}
models/mapobjects/techlamp/techlamp_rail
{
     
     cull disable
     surfaceparm alphashadow

        {
                map models/mapobjects/techlamp/techlamp_rail.tga
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
                map models/mapobjects/techlamp/techlamp_rail2.tga
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
                map models/mapobjects/techlamp/techlamp_rail2b.tga
                alphaFunc GE128
		depthWrite
                rgbGen vertex
        }
}

models/mapobjects/techlamp/techlamp_pole
{
 deformVertexes normal .1 .03
        {
                map models/mapobjects/techlamp/techlamp_pole2.tga
                tcmod Scale 1 2
                tcGen environment
                tcmod scroll 0 .3
                rgbGen identity
                
        }
        {
                map models/mapobjects/techlamp/techlamp_pole.tga
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
                map models/mapobjects/slamp/slamp3x.tga
                blendFunc GL_ONE GL_ONE
                
        }


}

models/flags/pole
{
	  
        {
             map textures/effects/tinfx.tga
		tcGen environment
		rgbGen lightingDiffuse	
                
        }


}

models/flag/flagbits2
{
               cull none
	{
                map models/mapobjects/statues/flagbits_stat.tga
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
                map models/flags/flagbits.tga
                //blendfunc gl_src_alpha gl_one_minus_src_alpha
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
		map models/flag2/w_flag2.tga
		 rgbGen identity
	}
        {
		map models/flag2/neutral_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                
                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flag2/w_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
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
		map models/flag2/r_flag2.tga
		 rgbGen identity
	}
        {
		map models/flag2/red_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                
                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flag2/r_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
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
		map models/flag2/b_flag2.tga
		 rgbGen identity
	}
        {
		map models/flag2/blue_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flag2/b_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
}
models/powerups/kamikazi1
{
        {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		rgbGen identity
        }
}

models/powerups/kamikazi2
{
        {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc add
                rgbGen identity
        }
}

models/powerups/kamikazi_f
{
   	
        {
	        map models/powerups/kamikazi_f.tga
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}

models/players/xscout/scout2x
{
    cull disable
        {
	        map models/players/xscout/scout2.tga
		blendfunc Add
                tcmod Scroll 1.3 0
                rgbGen identity
        }
}

models/powerups/ammo1
{
        {
	        map textures/effects/envmapmach.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}

models/powerups/ammo2
{
    cull disable
        {
	        map models/powerups/ammo2.tga
		blendfunc Add
                tcmod Scroll 1.3 0
                rgbGen identity
        }
}


models/powerups/scout1
{
        {
	        map textures/effects/envmapgreen.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}

models/powerups/scout2
{
    cull disable
        {
	        map models/powerups/scout2.tga
		blendfunc Add
                tcmod Scroll .9 0
                rgbGen identity
        }
}

models/powerups/guard1
{
        {
	        map textures/effects/envmapblue.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/guard2
{
    cull disable
        {
	        map models/powerups/guard2.tga
		blendfunc Add
                tcmod Scroll .9 0
                rgbGen identity
        }
}
models/powerups/doubler1
{
        {
	        map textures/effects/envmaproc.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/doubler2
{
    cull disable
        {
	        map models/powerups/doubler2.tga
		blendfunc Add
                tcmod Scroll .9 0
                rgbGen identity
        }
}
models/mapobjects/spawn/spawn3
{
     
     cull disable

        {
                clampmap models/mapobjects/spawn/spawn3_b.tga
                tcmod rotate 222
                rgbGen identity
        }
        {
                clampmap models/mapobjects/spawn/spawn3.tga
                blendfunc Blend
                rgbGen vertex
        }
}
models/mapobjects/spawn/spawn3_r
{
     
     cull disable

        {
                clampmap models/mapobjects/spawn/spawn3_r.tga
                tcmod rotate 222
                rgbGen identity
        }
        {
                clampmap models/mapobjects/spawn/spawn3.tga
                blendfunc Blend
                rgbGen vertex
        }
}

models/powerups/obelisk/ob_trns
{
     
     cull disable

        {
                map models/powerups/obelisk/ob_trns.tga
                alphaFunc GE128
		depthWrite
                rgbGen lightingdiffuse
        }
}

models/powerups/obelisk/ob_sft
{
        {
	        map models/powerups/obelisk/ob_sft2.tga
		tcmod scroll 0 .05
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
        }

        {
                map models/powerups/obelisk/ob_sft.tga
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
                clampmap models/powerups/obelisk/ob_twirl.tga
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
                clampmap models/powerups/obelisk/ob_twirl2.tga
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
                map models/powerups/obelisk/ob_flare.tga
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
                map models/powerups/obelisk/ob_flare2.tga
                Blendfunc Add
                rgbGen identity
        }
       
}
models/powerups/obelisk/ob_cyl
{
     cull disable

        {
                map models/powerups/obelisk/ob_cyl.tga
                Blendfunc Add
                tcmod scroll .2 0
                rgbGen identity
        }
       
        {
                map models/powerups/obelisk/ob_cyl.tga
                Blendfunc Add
                tcmod scroll -.33 0
                rgbGen identity
        }
}

models/powerups/orb/red
{
     cull disable

        {
                map models/powerups/orb/red.tga
                Blendfunc Add
                rgbGen identity
        }
        {
                map models/powerups/orb/redfx.tga
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
                map models/powerups/orb/blue.tga
                Blendfunc Add
                rgbGen identity
        }
        {
                map models/powerups/orb/bluefx.tga
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
	        map models/weaphits/kamik01.tga
                tcGen environment
                blendfunc GL_ONE GL_ZERO
		//blendfunc   	blend
                //alphaGen	wave inversesawtooth 1 1 0 1
                rgbGen identity
       }
       {
                map models/weaphits/kamik02.tga
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate 66
                tcmod Scroll 1.3 .8
                
                rgbGen identity
        }
       {
                map models/weaphits/kamik02.tga
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
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/proxammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/proxammo2
{
       {
	        map models/powerups/ammo/proxammo2.tga
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
}

models/powerups/ammo/chaingammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/chaingammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/chaingammo2
{
       {
	        map models/powerups/ammo/chaingammo2.tga
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
}

models/powerups/ammo/nailgammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/nailgammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/nailgammo2
{
       {
	        map models/powerups/ammo/nailgammo2.tga
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
}

models/weapons/proxmine/f_proxmine
{
        cull disable  
        {
                map models/weapons/proxmine/f_proxmine.tga
                blendFunc add
                rgbGen identity
        }


}

models/weapons/proxmine/proxmine2
{
        cull disable  
        {
                map models/weapons/proxmine/proxmine2.tga
                rgbGen lightingdiffuse
        }
        {
                map models/weapons/proxmine/proxmine2b.tga
                blendFunc add
                rgbGen wave sin .5 .5 0 2
        }

}

models/weapons/proxmine/proxmine1
{
        cull disable  
        {
                map models/weapons/proxmine/proxmine1b.tga
                tcmod scroll 0 2
                rgbGen lightingdiffuse
        }
        {
                map models/weapons/proxmine/proxmine1.tga
                blendFunc Blend
                rgbGen lightingdiffuse
        }

}
models/weaphits/kam01
{
        cull disable  
        {
                map models/weaphits/kam01.tga
                blendFunc add
                tcmod Scroll 1.4 0
                rgbGen identity
        }
        {
                map models/weaphits/kam02.tga
                blendFunc add
                tcmod Scroll -1.9 0
                rgbGen identity
        }

}
models/weaphits/kam02
{
        cull disable  
        {
                map models/weaphits/kam01.tga
                blendFunc add
                tcmod Scroll -2 0
                rgbGen identity
        }
        {
                map models/weaphits/kam02.tga
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
                clampmap models/weaphits/kam03.tga
                blendFunc add
                tcmod rotate 133
                rgbGen identity
        }
        {
                clampmap models/weaphits/kam03b.tga
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
                clampmap models/weaphits/kam04.tga
                blendFunc add
                tcmod rotate 999
                rgbGen identity
        }


}
models/weaphits/proxmine
{
        cull disable  
        {
                map models/weaphits/proxmine.tga
                rgbGen lightingdiffuse
        }
        {
                map models/weaphits/proxmineb.tga
                blendFunc add
                rgbGen wave sin .5 .5 0 2
        }

}

models/weaphits/proxmine2
{
        cull disable  
        nomipmaps
        {
                clampmap models/weaphits/proxmine2.tga
                blendFunc add
                tcmod rotate 200
                tcMod stretch sin .6 0.2 0 .11
                rgbGen identity
        }
        {
                clampmap models/weaphits/proxmine2.tga
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
                map models/weapons/nailgun/nail.tga
                alphaFunc GE128
		depthWrite
                rgbGen identity
        }
}

models/weapons/nailgun/nail2
{
     cull disable

        {
                map models/weapons/nailgun/nail2.tga
                alphaFunc GE128
		depthWrite
                rgbGen identity
        }
}

models/weapons/nailgun/f_nailgun
{
     cull disable

        {
                map models/weapons/nailgun/f_nailgun.tga
                Blendfunc Add
                rgbGen identity
        }
}

models/weapons/nailgun/nailgun
{
     //deformVertexes normal .2 .1
     cull disable

        {
                map models/weapons/nailgun/nailgun_env.tga
                //tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/weapons/nailgun/nailgun.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/fritzkrieg/fritz_fx
{
     
     cull disable

        {
                map models/players/fritzkrieg/fritz_fx2.tga
                //tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/fritzkrieg/fritz_fx.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/fritzkrieg/fritz_c
{
	
	cull none
        //nopicmip
	{
		map models/players/fritzkrieg/fritz_c.tga
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
                map models/players/fritzkrieg/beam.tga
                Blendfunc Add
                rgbGen identity
        }
}
models/players/fritzkrieg/beam2
{
     deformVertexes autoSprite
     cull disable

        {
                map models/players/fritzkrieg/beam2.tga
                Blendfunc Add
                rgbGen identity
        }
}
models/players/heads/khan/khan_f
{
	
	cull twosided
        //nopicmip
	{
		map models/players/heads/khan/khan_f.tga
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
		map models/players/pi/piston.tga
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
		map models/players/pi/pi_t.tga
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
		map models/players/pi/ntrl_t.tga
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
		map models/players/pi/pi_t2.tga
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
	//	map models/players/pi/hair.tga
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
        	map models/players/pi/pi.tga
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
                map models/players/pi/beam.tga
                Blendfunc Add
                rgbGen identity
        }
}
models/players/pi/beam2
{
     deformVertexes autoSprite
     cull disable

        {
                map models/players/pi/beam2.tga
                Blendfunc Add
                rgbGen identity
        }
}
models/players/pi/endcap
{
	cull none
	{
		clampmap models/players/pi/endcap.tga
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
		clampmap models/players/pi/redendcap.tga
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
		clampmap models/players/pi/bluendcap.tga
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
		clampmap models/players/pi/gear01.tga
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
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/thefallen/thefallen_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/thefallen/thefallen_blu
{
    
     //cull disable
        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/thefallen/thefallen_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}



models/players/janet/intruders/intruders_red
{
     
     //cull disable
        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/intruders/intruders_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/intruders/intruders_blu
{
     
     //cull disable
        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/intruders/intruders_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}


models/players/janet/stroggs/stroggs_red
{
     
     //cull disable
        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/stroggs/stroggs_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/stroggs/stroggs_blu
{
     
     //cull disable
        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/stroggs/stroggs_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/crusaders/crusaders_red
{
     
    // cull disable
        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/crusaders/crusaders_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/janet/crusaders/crusaders_blu
{
     
     //cull disable
        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/crusaders/crusaders_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_h_blu
{
     

        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_h_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_blu
{
     
     //cull disable
        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_h_red
{
     

        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_h_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

models/players/janet/pagans/pagans_red
{
     
     //cull disable
        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/janet/pagans/pagans_red.tga
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
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/intruders/intruders_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/thefallen/thefallen_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/thefallen/thefallen_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/intruders/intruders_h_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_h_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/intruders/intruders_h_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/intruders/intruders_h_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/crusaders/crusaders_h_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_h_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/crusaders/crusaders_h_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_h_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/thefallen/thefallen_h_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_h_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
} 
models/players/james/thefallen/thefallen_h_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/thefallen/thefallen_h_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/crusaders/crusaders_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}                  
models/players/james/crusaders/crusaders_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/crusaders/crusaders_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
                   
models/players/james/stroggs/stroggs_h_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_h_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/stroggs/stroggs_h_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_h_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/stroggs/stroggs_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/stroggs/stroggs_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/stroggs/stroggs_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_h_blu
{
     

        {
                map models/players/james/blue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_h_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_h_red
{
     

        {
                map models/players/james/red.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_h_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_e_blu
{

        {
                map models/players/james/blue2.tga
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/james/pagans/pagans_e_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_e_red
{

        {
                map models/players/james/red2.tga
                tcmod scale   1 .3
                tcMod scroll  0.1 2
                rgbGen identity
        }
        {
                map models/players/james/pagans/pagans_e_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_blu
{
     
     //cull disable

        {
                map models/players/james/blue.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_blu.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/james/pagans/pagans_red
{
     
     //cull disable

        {
                map models/players/james/red.tga
                tcMod scale 2 2
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/james/pagans/pagans_red.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/gratelamp/lightbulb
{
    surfaceparm	trans

	{
		map models/mapobjects/gratelamp/lightbulb.tga
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
                map models/mapobjects/gratelamp/gratelight.tga
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
		Map models/mapobjects/gratelamp/gratelight_flare.tga
		blendFunc Add
                rgbGen wave sin .5 .2 0 0
	}	
	
}
models/mapobjects/wallhead2/demonhead1
{      
        {
                map textures/sfx/firegorre.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0.1 1
                rgbGen identity
	}  
        {
		map models/mapobjects/wallhead2/demonhead1.tga
                blendFunc blend
		rgbGen vertex
	}
       
}
models/mapobjects/wallhead2/wallhead2_1
{      
        {
                map textures/sfx/firegorre.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0.1 1
                rgbGen vertex
	}  
        {
		map models/mapobjects/wallhead2/wallhead2_1.tga
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
		clampmap models/mapobjects/wallhead2/wallhead2_eye.tga
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
		map models/mapobjects/wallhead2/wallhead2_h1.tga
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
		map models/mapobjects/wallhead2/wallhead2_h2.tga
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
		map models/mapobjects/wallhead2/wallhead2_h3.tga
		alphaFunc GE128
                depthWrite
		rgbGen vertex
                
	}
}
models/mapobjects/horned/horned_blu
{      

        {
                map textures/sfx2/blufirewall.tga
                tcmod scroll 0.1 1
	}  
        {
		map models/mapobjects/horned/horned_blu.tga
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
		map models/flags/n_flag2.tga
		 rgbGen identity
	}
        {
		map models/flags/neutral_fx.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flags/n_flag2.tga
                blendFunc blend
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
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
        	map models/players/meep/meep.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
models/players/meep/meep_h
{
        cull disable  
        {
                map models/players/meep/meep_h.tga
                rgbGen lightingdiffuse
        }
        {
                map models/players/meep/meep_h2.tga
                blendFunc add
                rgbGen wave sin .5 .5 0 .5
        }

}
models/players/meep/meep_f
{
        cull disable  
        {
                map models/players/meep/meep_f.tga
                rgbGen lightingdiffuse
        }

}
models/players/meep/meep_g
{
        cull disable  
        {
                map models/players/meep/meep_g.tga
                blendFunc Add
                tcGen environment
                rgbGen lightingdiffuse
        }

}

models/players/meep/meep_w

{
	cull disable
        {
		map models/players/meep/meep_w.tga
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
		map models/mapobjects/flagbase/beam_blue.tga
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
		map models/mapobjects/flagbase/beam_ntrl.tga
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
		map models/mapobjects/flagbase/beam_red.tga
                blendFunc add
                tcmod scroll -.5 0
                rgbGen wave sin .5 .5 0.5 0.09
	}
}
models/mapobjects/flagbase/swirl_ntrl
{
        {
	        map models/mapobjects/flagbase/swirl_ntrl.tga
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map models/mapobjects/flagbase/swirl_ntrl.tga
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map models/mapobjects/flagbase/base_r.tga
		blendFunc blend
	        rgbGen lightingdiffuse
	}

}
models/mapobjects/flagbase/swirl_red
{
        {
	        map models/mapobjects/flagbase/swirl_red.tga
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map models/mapobjects/flagbase/swirl_red.tga
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map models/mapobjects/flagbase/base_r.tga
		blendFunc blend
	        rgbGen lightingdiffuse
	}

}
models/mapobjects/flagbase/swirl_blue
{
        {
	        map models/mapobjects/flagbase/swirl_blue.tga
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 130
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map models/mapobjects/flagbase/swirl_blue.tga
		blendFunc Add
                tcmod rotate 80
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map models/mapobjects/flagbase/base_r.tga
		blendFunc blend
	        rgbGen lightingdiffuse
	}

}
models/mapobjects/flagbase/env_red
{
       {
	        map models/mapobjects/flagbase/env_red.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/mapobjects/flagbase/base_e.tga
		blendfunc blend
                rgbGen lightingdiffuse
       }
}
models/mapobjects/flagbase/env_ntrl
{
       {
	        map models/mapobjects/flagbase/env_ntrl.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/mapobjects/flagbase/base_e.tga
		blendfunc blend
                rgbGen lightingdiffuse
       }
}
models/mapobjects/flagbase/env_blue
{
       {
	        map models/mapobjects/flagbase/env_blue.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/mapobjects/flagbase/base_e.tga
		blendfunc blend
                rgbGen lightingdiffuse
       }
}