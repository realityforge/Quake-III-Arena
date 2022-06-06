// GFX.SHADER
//
// this file contains shaders that are used by the programmers to
// generate special effects not attached to specific geometry.  This
// also has 2D shaders such as fonts, etc.
//

// the REGION shader is generated by the map editor on temporary
// brushes around a selected area for testing parts of maps
textures/REGION
{
	surfaceparm nolightmap
}

// the background for the netgraph
lagometer
{
	nopicmip
	{
		map gfx/2d/lag
	}
}

// blinked on top of lagometer when connection is interrupted
disconnected
{
	nopicmip
	{
		map gfx/2d/net
	}
}

white
{
	{
		map *white
		blendfunc	blend
		rgbgen vertex
	}
}

console
{
	nopicmip
	nomipmaps

        {
		map gfx/misc/console01
                blendFunc GL_ONE GL_ZERO
                tcMod scroll .02  0
                tcmod scale 2 1
	}
        {
                map gfx/misc/console02
                //map textures/sfx/firegorre3
                blendFunc add
                tcMod turb 0 .1 0 .1
                tcMod scale 2 1
                tcmod scroll 0.2  .1
	}

}

menuback
{
	nopicmip
	nomipmaps
        //{
        //        map textures/sfx/logo512
        //}

        //{
        //        map textures/sfx/specular
         //       //blendfunc add
        //        tcMod turb 0 .8 0 .2
        //        tcmod scroll -.1  -.2
	//}
         {
                map textures/sfx/logo512
                // blendFunc blend
                rgbgen identity
        }
        //{
	//	map textures/sfx/proto_zzzdrk
        //        blendFunc add
        //        tcMod turb 0 .1 0 .9
        //         tcmod scale .2 .2
        //         tcMod scroll .02  0.7
        //         rgbgen identity
	//}

}
menubacknologo
{
	nopicmip
	nomipmaps

        {
               map gfx/colors/black
	       //map textures/sfx/proto_zzzdrk
               // tcMod turb 0 .1 0 .9
               // tcmod scale .2 .2
               // tcMod scroll .02  0.7
	}

}

levelShotDetail
// used to break up the blur on levelshots
{
	nopicmip
	{
		map textures/sfx2/detail2
        blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbgen identity
	}
}

//
// special effects as seen on players
//
powerups/battleSuit
{
	deformVertexes wave 100 sin 1 0 0 0
	{
		map textures/effects/envmapgold2
                //map textures/sfx/specular
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc add
	}
}
powerups/battleWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/envmapgold2
                //map textures/sfx/specular
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc add
	}
}

powerups/invisibility
{
	{
		map textures/effects/invismap
                //map textures/sfx/specular
		blendfunc add
		tcMod turb 0 0.15 0 0.25
		tcGen environment
	}
}
powerups/quad
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/quadmap2
		blendfunc add
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/quadWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/quadmap2
		blendfunc add
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/regen
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/regenmap2
		blendfunc add
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}


//=========================

//
// holdable item icons
//
icons/teleporter
{
	nopicmip
	{
		map icons/teleporter
		blendFunc blend
	}
}
icons/medkit
{
	nopicmip
	{
		map icons/medkit
		blendFunc blend
	}
}

//
// powerup icons
//
icons/envirosuit
{
	nopicmip
	{
		map icons/envirosuit
		blendFunc blend
	}
}
icons/quad
{
	nopicmip
	{
		map icons/quad
		blendFunc blend
	}
}
icons/haste
{
	nopicmip
	{
		map icons/haste
		blendFunc blend
	}
}
icons/invis
{
	nopicmip
	{
		map icons/invis
		blendFunc blend
	}
}
icons/regen
{
	nopicmip
	{
		map icons/regen
		blendFunc blend
	}
}
icons/flight
{
	nopicmip
	{
		map icons/flight
		blendFunc blend
	}
}


// reward medals used in the game floating over client's heads
medal_impressive
{
	nopicmip
	{
		clampmap menu/medals/medal_impressive
		blendFunc blend
	}
}

medal_excellent
{
	nopicmip
	{
		clampmap menu/medals/medal_excellent
		blendFunc blend
	}
}

medal_gauntlet
{
	nopicmip
	{
		clampmap menu/medals/medal_gauntlet
		blendFunc blend
	}
}

medal_assist
{
	nopicmip
	{
		clampmap menu/medals/medal_assist
		blendFunc blend
	}
}

medal_defend
{
	nopicmip
	{
		clampmap menu/medals/medal_defend
		blendFunc blend
	}
}

medal_capture
{
	nopicmip
	{
		clampmap menu/medals/medal_capture
		blendFunc blend
	}
}


//
// weapon icons
//
icons/iconw_gauntlet
{
	nopicmip
	{
		map icons/iconw_gauntlet
		blendFunc blend
	}
}
icons/iconw_machinegun
{
	nopicmip
	{
		map icons/iconw_machinegun
		blendFunc blend
	}
}
icons/iconw_rocket
{
	nopicmip
	{
		map icons/iconw_rocket
		blendFunc blend
	}
}

icons/iconw_shotgun
{
	nopicmip
	{
		map icons/iconw_shotgun
		blendFunc blend
		rgbgen identitylighting
	}
}

icons/iconw_grenade
{
	nopicmip
	{
		map icons/iconw_grenade
		blendFunc blend
	}
}

icons/iconw_lightning
{
	nopicmip
	{
		map icons/iconw_lightning
		blendFunc blend
	}
}

icons/iconw_plasma
{
	nopicmip
	{
		map icons/iconw_plasma
		blendFunc blend
	}
}

icons/iconw_railgun
{
	nopicmip
	{
		map icons/iconw_railgun
		blendFunc blend
	}
}

icons/iconw_bfg
{
	nopicmip
	{
		map icons/iconw_bfg
		blendFunc blend
	}
}

icons/iconw_grapple
{
	nopicmip
	{
		map icons/iconw_grapple
		blendFunc blend
	}
}

//
// ammo icons
//
icons/icona_machinegun
{
	nopicmip
	{
		map icons/icona_machinegun
		blendFunc blend
	}
}
icons/icona_rocket
{
	nopicmip
	{
		map icons/icona_rocket
		blendFunc blend
	}
}

icons/icona_shotgun
{
	nopicmip
	{
		map icons/icona_shotgun
		blendFunc blend
		rgbgen identitylighting
	}
}

icons/icona_grenade
{
	nopicmip
	{
		map icons/icona_grenade
		blendFunc blend
	}
}

icons/icona_lightning
{
	nopicmip
	{
		map icons/icona_lightning
		blendFunc blend
	}
}

icons/icona_plasma
{
	nopicmip
	{
		map icons/icona_plasma
		blendFunc blend
	}
}

icons/icona_railgun
{
	nopicmip
	{
		map icons/icona_railgun
		blendFunc blend
	}
}

icons/icona_bfg
{
	nopicmip
	{
		map icons/icona_bfg
		blendFunc blend
	}
}


//
// armor icons
//
icons/iconr_shard
{
	nopicmip
	{
		map icons/iconr_shard
		blendFunc blend
	}
}

icons/iconr_yellow
{
	nopicmip
	{
		map icons/iconr_yellow
		blendFunc blend
	}
}

icons/iconr_red
{
	nopicmip
	{
		map icons/iconr_red
		blendFunc blend
	}
}

//
// health icons
//
icons/iconh_green
{
	nopicmip
	{
		map icons/iconh_green
		blendFunc blend
	}
}

icons/iconh_yellow
{
	nopicmip
	{
		map icons/iconh_yellow
		blendFunc blend
	}
}

icons/iconh_red
{
	nopicmip
	{
		map icons/iconh_red
		blendFunc blend
	}
        //{
	//	clampmap icons/iconh_red2
	//	blendFunc blend
        //        tcMod stretch sin .04 1 0 1
	//}
}

icons/iconh_mega
{
	nopicmip
	{
		map icons/iconh_mega
		blendFunc blend
	}
}

//
// CTF icons
//
icons/iconf_red
{
	nopicmip
	{
		map icons/iconf_red
		blendFunc blend
	}
}

icons/iconf_blu
{
	nopicmip
	{
		map icons/iconf_blu
		blendFunc blend
	}
}


//===================================================

gfx/2d/menuinfo
{
	nopicmip
	{
		map gfx/2d/menuinfo
	}
}

gfx/2d/menuinfo2
{
	nopicmip
	{
		map gfx/2d/menuinfo2
	}
}

gfx/2d/quit
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/quit
	}
}

gfx/2d/cursor
{
    nopicmip
	nomipmaps
    {
        map gfx/2d/cursor
    }
}

//==========================================================================


sprites/balloon3
{
	{
		map sprites/balloon4
		blendfunc blend
	}
}

// this is an example of a crossfaded animation cycle
textures/animationTest
{
	qer_editorimage	textures/liquids/bloodwater1
	{
		animMap 0.5 textures/liquids/bloodwater1 textures/liquids/pool textures/liquids/slime7
	}
	{
		animMap 0.5 textures/liquids/pool textures/liquids/slime7 textures/liquids/bloodwater1
		blendFunc	blend
		alphaGen	wave sawtooth 0 1 0 0.5
	}
	{
		map $lightmap
		blendFunc filter
	}
}

teleportEffect
{
	cull none
	{
		map gfx/misc/teleportEffect2
                blendFunc add
		rgbGen entity
		tcMod scale 1 4
		tcMod scroll 0 2
	}
}

// markShadow is the very cheap blurry blob underneat the player
markShadow
{
	polygonOffset
	{
		map gfx/damage/shadow
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}

// projectionShadow is used for cheap squashed model shadows
projectionShadow
{
	polygonOffset
	deformVertexes projectionShadow
	{
		map			*white
		blendFunc GL_ONE GL_ZERO
		rgbGen wave square 0 0 0 0				// just solid black
	}
}


// wake is the mark on water surfaces for paddling players
wake
{
	{
		clampmap sprites/splash
		blendFunc add
		rgbGen vertex
                tcmod rotate 250
                tcMod stretch sin .9 0.1 0 0.7
		rgbGen wave sin .7 .3 .25 .5
	}
        {
		clampmap sprites/splash
		blendFunc add
		rgbGen vertex
                tcmod rotate -230
                tcMod stretch sin .9 0.05 0 0.9
		rgbGen wave sin .7 .3 .25 .4
	}
}


// viewBloodBlend gives the blended directional cue when you get hit
viewBloodBlend
{
	sort	nearest
	{
		//map models/weaphits/blood201
                map gfx/damage/blood_screen
		blendFunc blend
		rgbGen identityLighting
		alphaGen vertex
	}
}

waterBubble
{
	sort	underwater
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map sprites/bubble
		blendFunc blend
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3
		blendFunc blend
		rgbGen		vertex
		alphaGen	vertex
	}
}

hasteSmokePuff			// drops behind player's feet when speeded
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3
		blendFunc blend
                //blendfunc add
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuffRagePro
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuffragepro
		blendFunc blend
	}
}

shotgunSmokePuff
{
	cull none
	{
		map gfx/misc/smokepuff2b
		blendFunc blend
		alphaGen entity
		rgbGen entity
	}
}

flareShader
{
	cull none
	{
		map gfx/misc/flare
		blendFunc add
		rgbGen vertex
	}
}
sun
{
	cull none
	{
		map gfx/misc/sun
		blendFunc add
		rgbGen vertex
	}
}
railDisc
{
	sort nearest
	cull none
        deformVertexes wave 100 sin 0 .5 0 2.4
	{
		clampmap gfx/misc/raildisc_mono2
		blendFunc add
		rgbGen vertex
                 tcMod rotate -30
	}
}

railCore
{
	sort nearest
	cull none
	{
		map gfx/misc/railcorethin_mono
		blendFunc add
		rgbGen vertex
		tcMod scroll -1 0
	}
}

lightningBolt
{
	cull none
	{
		map gfx/misc/lightning3
		blendFunc add
//                rgbgen wave sin 1 5.1 0 7.1
                rgbgen wave sin 1 0.5 0 7.1
                 tcmod scale  2 1
		tcMod scroll -5 0
	}
    {
		map gfx/misc/lightning3
		blendFunc add
//                rgbgen wave sin 1 8.3 0 8.1
                rgbgen wave sin 1 0.8 0 8.1
                tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}

// shader used on the occasional machinegun bullet tracers
gfx/misc/tracer
{
	cull none
	{
		map	gfx/misc/tracer2
		blendFunc add
	}
}

//
// wall marks
// use blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR so that
// their "contribution" can be damped down in fog volumes
// with distance
bloodMark
{
	nopicmip			// make sure a border remains
	polygonOffset
	{
		clampmap gfx/damage/blood_stain
		blendFunc blend
		rgbGen identityLighting
		alphaGen vertex
	}
}

bloodTrail
{

	nopicmip			// make sure a border remains
	entityMergable		// allow all the sprites to be merged together
	{
		//clampmap gfx/misc/blood
                clampmap gfx/damage/blood_spurt
		blendFunc blend
		rgbGen		vertex
		alphaGen	vertex
	}
}

gfx/damage/bullet_mrk
{
	polygonOffset
	{
		map gfx/damage/bullet_mrk
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/burn_med_mrk
{
	polygonOffset
	{
		map gfx/damage/burn_med_mrk
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/hole_lg_mrk
{
	polygonOffset
	{
		map gfx/damage/hole_lg_mrk
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/plasma_mrk
{
	polygonOffset
	{
		map gfx/damage/plasma_mrk
		blendFunc blend
		rgbGen vertex
		alphaGen vertex
	}
}


//===============================================================

// scoreboard header tabs

scoreboardName
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/name
		blendfunc blend
	}
}

scoreboardScore
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/score
		blendfunc blend
	}
}

scoreboardTime
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/time
		blendfunc blend
	}
}

scoreboardPing
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/ping
		blendfunc blend
	}
}

//===============================================================

gfx/2d/crosshair
{
	nopicmip
	{
		map gfx/2d/crosshair
		blendFunc blend
        rgbGen identity
	}
}

gfx/2d/crosshairb
{
	nopicmip
	{
		map gfx/2d/crosshairb
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshairc
{
	nopicmip
	{
		map gfx/2d/crosshairc
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshaird
{
	nopicmip
	{
		map gfx/2d/crosshaird
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshaire
{
	nopicmip
	{
		map gfx/2d/crosshaire
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshairf
{
	nopicmip
	{
		map gfx/2d/crosshairf
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshairg
{
	nopicmip
	{
		map gfx/2d/crosshairg
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshairh
{
	nopicmip
	{
		map gfx/2d/crosshairh
		blendFunc blend
		rgbGen identity
	}
}

gfx/2d/crosshairi
{
	nopicmip
	{
		map gfx/2d/crosshairi
		blendFunc blend
		rgbGen identity
	}

}
gfx/2d/crosshairj
{
	nopicmip
	{
		map gfx/2d/crosshairj
		blendFunc blend
		rgbGen identity
	}
}
gfx/2d/crosshairk
{
	nopicmip
	{
		map gfx/2d/crosshairk
		blendFunc blend
		rgbGen identity
	}
}




gfx/2d/bigchars
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/bigchars
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/select
{
	nopicmip
	{
		map gfx/2d/select
		blendFunc blend
		rgbGen identity
		rgbgen vertex
	}
}


gfx/2d/assault1d
{
	nopicmip
	{
		map gfx/2d/assault1d
		blendFunc blend
	}
}
gfx/2d/armor1h
{
	nopicmip
	{
		map gfx/2d/armor1h
		blendFunc blend
	}
}
gfx/2d/health
{
	nopicmip
	{
		map gfx/2d/health
		blendFunc blend
	}
}
gfx/2d/blank
{
	nopicmip
	{
		map gfx/2d/blank
		blendFunc blend
	}
}
gfx/2d/numbers/zero_32b
{
	nopicmip
	{
		map gfx/2d/numbers/zero_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/one_32b
{
	nopicmip
	{
		map gfx/2d/numbers/one_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/two_32b
{
	nopicmip
	{
		map gfx/2d/numbers/two_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/three_32b
{
	nopicmip
	{
		map gfx/2d/numbers/three_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/four_32b
{
	nopicmip
	{
		map gfx/2d/numbers/four_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/five_32b
{
	nopicmip
	{
		map gfx/2d/numbers/five_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/six_32b
{
	nopicmip
	{
		map gfx/2d/numbers/six_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/seven_32b
{
	nopicmip
	{
		map gfx/2d/numbers/seven_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/eight_32b
{
	nopicmip
	{
		map gfx/2d/numbers/eight_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/nine_32b
{
	nopicmip
	{
		map gfx/2d/numbers/nine_32b
		blendFunc blend
		rgbgen vertex
	}
}
gfx/2d/numbers/minus_32b
{
	nopicmip
	{
		map gfx/2d/numbers/minus_32b
		blendFunc blend
		rgbgen vertex
	}
}


//
// weapon hits
// All of these will be put on entities with a shaderTime offset, so they
// can be expected to start at time 0 for each separate explosion
//
// Many of these are use smoothly morphed animating textures by pairing
// sawtooth and iverse sawtooth rgbGens
plasmaExplosion
{
	cull disable
	{
		clampmap models/weaphits/plasmaboom
		blendfunc add
                tcMod stretch triangle .6 0.1 0 8
                tcmod rotate 999
                rgbGen wave inversesawtooth 0 1 0 1.5
	}
}

railExplosion
{
	cull disable
        {
		animmap 5 models/weaphits/ring02_1  models/weaphits/ring02_2  models/weaphits/ring02_3 models/weaphits/ring02_4 gfx/colors/black
		alphaGen wave inversesawtooth 0 1 0 5
		blendfunc blend
	}
	{
		animmap 5 models/weaphits/ring02_2  models/weaphits/ring02_3 models/weaphits/ring02_4 gfx/colors/black gfx/colors/black
		alphaGen wave sawtooth 0 1 0 5
		blendfunc blend
	}
}

lightningExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/ring02_1  models/weaphits/ring02_3  models/weaphits/ring02_3 gfx/colors/black
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/ring02_2  models/weaphits/ring02_3  gfx/colors/black gfx/colors/black
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bulletExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bullet1  models/weaphits/bullet2  models/weaphits/bullet3 gfx/colors/black
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bullet2  models/weaphits/bullet3  gfx/colors/black gfx/colors/black
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

rocketExplosion
{
	cull disable
	{
		animmap 8 models/weaphits/rlboom/rlboom_1  models/weaphits/rlboom/rlboom_2 models/weaphits/rlboom/rlboom_3 models/weaphits/rlboom/rlboom_4 models/weaphits/rlboom/rlboom_5 models/weaphits/rlboom/rlboom_6 models/weaphits/rlboom/rlboom_7 models/weaphits/rlboom/rlboom_8
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/rlboom/rlboom_2 models/weaphits/rlboom/rlboom_3 models/weaphits/rlboom/rlboom_4 models/weaphits/rlboom/rlboom_5 models/weaphits/rlboom/rlboom_6 models/weaphits/rlboom/rlboom_7 models/weaphits/rlboom/rlboom_8 gfx/colors/black
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

grenadeExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/glboom/glboom_1  models/weaphits/glboom/glboom_2 models/weaphits/glboom/glboom_3
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/glboom/glboom_2  models/weaphits/glboom/glboom_3 gfx/colors/black
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bfgExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bfgboom/bfgboom_1  models/weaphits/bfgboom/bfgboom_2 models/weaphits/bfgboom/bfgboom_3
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bfgboom/bfgboom_2 models/weaphits/bfgboom/bfgboom_3 gfx/colors/black
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		animmap 5 models/weaphits/blood201 models/weaphits/blood202 models/weaphits/blood203 models/weaphits/blood204 models/weaphits/blood205
		blendfunc blend
	}
}
