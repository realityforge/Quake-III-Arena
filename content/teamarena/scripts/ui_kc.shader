
cin_logo
{
	nopicmip
	nomipmaps

	{
		map ui/assets/cin_logo
		blendfunc blend
	}
}




warning
{
	nopicmip
	nomipmaps

	{
		map ui/assets/warning
		blendfunc blend
		tcmod scale 8 8
	}
}


screenwipe
{
	nopicmip
	nomipmaps

	{
		map ui/assets/screen_wipe1
		tcmod scroll .1 .1
		blendfunc filter
	}
}





popback
{

	nopicmip
	nomipmaps

        {
		clampmap ui/assets/popback
		blendfunc blend
	}
	{
		clampmap ui/assets/popback
		tcmod rotate 10
		rgbgen wave sin .5 0 0 0
		blendfunc add
	}

}
centerconsole
{

	nopicmip
	nomipmaps

        {
		clampmap textures/sfx/console01
		tcMod rotate 20
	}
        {
		clampmap textures/sfx/console02
		rgbgen wave sin .5 0 0 0
		tcMod rotate -60
		blendFunc filter
	}
}
centerconsole2
{

	nopicmip
	nomipmaps

        {
		clampmap textures/sfx/console01
		blendfunc add
		rgbgen wave sin .15 0 0 0
		tcMod rotate 20
	}
        {
		clampmap textures/sfx/console02
		rgbgen wave sin .5 0 0 0
		tcMod rotate -60
		blendFunc add
	}
}

menuback_a
{
	nopicmip
	nomipmaps

	{
		map ui/assets/menuback_a
	}


	{
		map ui/assets/console02
		blendfunc filter
		tcmod rotate -60
	}
}

menuback_b
{

	nopicmip
	nomipmaps
	{
		map ui/assets/menuback_b
		blendfunc add
		rgbgen wave sin .75 0 0 0
		tcmod scroll 0 .2
	}
	{
			map textures/effects2/console01
                	blendFunc Add
                	tcMod scroll -.01  -.02
                	tcmod scale .02 .01
                	tcmod rotate 3
	}

}


menuback_e
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/radial
		blendfunc add
		tcmod rotate 100
	}
	{
		clampmap ui/assets/radial
		blendfunc add
		tcmod rotate -100
	}
}
menuback_e3
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/radial2
		blendfunc add
		tcmod rotate 200
		tcmod scale .5 .5
		rgbgen wave sin .5 .5 0 10
	}
	{
		clampmap ui/assets/radial2
		blendfunc add
		tcmod rotate -200
		tcmod scale .5 .5
		rgbgen wave sin .5 .5 0 10
	}

}
menuback_e4
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/radial2
		blendfunc add
		tcmod rotate 200
		rgbgen wave sin .5 .5 0 10
	}
	{
		clampmap ui/assets/radial2
		blendfunc add
		tcmod rotate -200
		rgbgen wave sin .5 .5 0 10
	}

}




menuback_c
{
	nopicmip
	nomipmaps
	{
		map ui/assets/menuback_c
		blendfunc blend
	}


	{
		clampmap ui/assets/menuback_c_light
		blendfunc add
		tcmod rotate -60
	}

}
menuback_d
{
	nopicmip
	nomipmaps
	{
		map ui/assets/teamarena
		blendfunc filter
	}
	{
		map ui/assets/teamarena
		blendfunc add
		rgbgen wave sin .25 .25 0 5
	}

}
menuback_f
{

	nopicmip
	nomipmaps
	{
		map ui/assets/menuback_f
		blendfunc blend
	}

}
menuback_g
{


	nopicmip
	nomipmaps
	{
		map ui/assets/singleplayer1
		blendfunc blend
	}


	}




lightningkc
	{
	nopicmip
	nomipmaps
	{
		animMap 10 ui/assets/blu01 ui/assets/blu02 ui/assets/blu03 ui/assets/blu04 ui/assets/blu05 ui/assets/blu06 ui/assets/blu07 ui/assets/blu08
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10
	}
	}

menu2back
{
	nopicmip
	nomipmaps
	{
		map ui/assets/background
		rgbgen identity
	}
}

blur
	{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/blur
		blendfunc add
		rgbgen wave sin .8 .02 0 1
		tcmod stretch sin .9 .05 0 1
		tcmod turb 1 .005 0 5
	}
	}


vs
	{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/vs
		blendfunc add
		rgbgen wave sin .25 .15 .25 1.5
		tcmod turb 1 .005 0 4.5
	}
	{
		clampmap ui/assets/vs_alt
		rgbgen wave square .75 .15 0 1
		tcmod turb 1 .005 .5 4.5
		blendfunc add
	}
	}



ui/assets/the_fallen_name
	{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/the_fallen_name
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}
	{
		map ui/assets/the_fallen_name_alt
		blendfunc add
	}
	}

ui/assets/stroggs_name
	{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/stroggs_name
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/stroggs_name_alt
		blendfunc add
	}

}


ui/assets/pagans_name
	{

	nopicmip
	nomipmaps
	{
		map ui/assets/pagans_name
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/pagans_name_alt
		blendfunc add
	}

}

ui/assets/intruders_name
	{

	nopicmip
	nomipmaps
	{
		map ui/assets/intruders_name
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/intruders_name_alt
		blendfunc add
	}

}

ui/assets/crusaders_name
	{

	nopicmip
	nomipmaps
	{
		map ui/assets/crusaders_name
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/crusaders_name_alt
		blendfunc add
	}

}




uibackground4
{
	nopicmip
	nomipmaps

       		{
			map ui/assets/screen02
                	blendFunc GL_ONE GL_ZERO
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave square .5 .05 0 5
		}
		{
			map ui/assets/background3
			blendfunc add
			//tcmod turb 1 .002 0 5
		}

}
uibackground8
{
	nopicmip
	nomipmaps

       		{
			map ui/assets/background8
                	blendFunc GL_ONE GL_ZERO
			rgbgen wave sin .5 0 0 0
		}


}



uibackgroundid
{
	nopicmip
	nomipmaps


		{
			map ui/assets/backgroundid
		}
		{
			map ui/assets/screen02
                	blendFunc add
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave square .25 .05 0 5
		}

		}

hudalert
{
	nopicmip
	nomipmaps

       		{	map ui/assets/red_box
                	blendFunc GL_ONE GL_ZERO
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave sin .25 .25 0 1
		}
	}

hudalert_red
{
	nopicmip
	nomipmaps

       		{	map ui/assets/red_box
                	blendFunc GL_ONE GL_ZERO
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave sin .25 .25 0 1
		}
	}
hudalert_good
{
	nopicmip
	nomipmaps

       		{	map ui/assets/green_box
                	blendFunc GL_ONE GL_ZERO
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave sin .25 .25 0 1
		}
	}

cinematicscreen
{
	nopicmip
	nomipmaps

       		{	map ui/assets/green_box
                	blendFunc filter

		}
	}

hudalert_blue
{
	nopicmip
	nomipmaps

       		{	map ui/assets/blue_box
                	blendFunc GL_ONE GL_ZERO
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave sin .25 .25 0 1
		}
	}

menuscreen
{
	nopicmip
	nomipmaps

       	{
			map textures/sfx2/screen01
                	blendFunc add
                	tcMod scroll 7.1  0.2
               	tcmod scale .8 1
			rgbgen wave square .75 .05 0 5
		}
	{
			map textures/effects2/console01
                	blendFunc Add
                	tcMod scroll -.01  -.02
                	tcmod scale .02 .01
                	tcmod rotate 3
	}

}

menuscreen2
{
	nopicmip
	nomipmaps

       	{
			map textures/sfx2/screen01
                	blendFunc add
                	tcMod scroll 7  0.2
               	tcmod scale .4 .5
			rgbgen wave square .75 .05 0 5
		}


}

clanlogo
{
	nopicmip
	nomipmaps

	{
			animMap 5 ui/assets/pagans ui/assets/stroggs ui/assets/crusaders ui/assets/thefallen ui/assets/intruders
			blendfunc add
			rgbGen wave inverseSawtooth 0 .25 0 5

	}
	{
			animMap 5 ui/assets/intruders ui/assets/pagans ui/assets/stroggs ui/assets/crusaders ui/assets/thefallen
			blendfunc add
			rgbGen wave Sawtooth 0 .25 0 5

	}


}


playerheads
{
	nopicmip
	nomipmaps

	{
			animMap 5 ui/assets/head1 ui/assets/head2 ui/assets/head3 ui/assets/head4 ui/assets/head5 ui/assets/head6 ui/assets/head7 ui/assets/head8
			blendfunc add
			rgbGen wave inverseSawtooth 0 .5 0 5

	}
	{
			animMap 5 ui/assets/head2 ui/assets/head3 ui/assets/head4 ui/assets/head5 ui/assets/head6 ui/assets/head7 ui/assets/head8 ui/assets/head1

			blendfunc add
			rgbGen wave Sawtooth 0 .5 0 5

	}


}


ui/assets/pagans_shader1
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/pagans
		blendfunc add
		rgbgen wave sin .25 0 0 0
	}
}

ui/assets/mainbanner_shader1
{
	nopicmip
	nomipmaps
	{
		map ui/assets/mainmenubanner
		blendfunc add
		rgbgen wave sin .05 0 0 0
		tcmod scroll .02 0
	}
}


ui/assets/clan_shader1
{
	nopicmip
	nomipmaps
	{
		map ui/assets/chooseclan
		blendfunc add
		rgbgen wave sin .05 0 0 0
		tcmod scroll .02 0
	}
}

ui/assets/player_shader1
{
	nopicmip
	nomipmaps
	{
		map ui/assets/selectplayer
		blendfunc add
		rgbgen wave sin .05 0 0 0
		tcmod scroll .04 0
	}
}

setup
{
	nopicmip
	nomipmaps
	{
		map ui/assets/setup
		blendfunc add
		rgbgen wave sin .05 0 0 0
		tcmod scroll .04 0
	}
}


join_server
{
	nopicmip
	nomipmaps
	{
		map ui/assets/join_server
		blendfunc add
		rgbgen wave sin .05 0 0 0
		tcmod scroll .04 0
	}
}

fight
{
	nopicmip
	nomipmaps
	{
		map ui/assets/fight
		blendfunc add
		rgbgen wave sin .05 0 0 0
		tcmod scroll .04 0
	}
}



start_server
{
	nopicmip
	nomipmaps
{
		map ui/assets/start_server
		blendfunc add
		rgbgen wave sin .15 0 0 0
		tcmod scroll .04 0
	}
}


ui/assets/controls_shader1
{
	nopicmip
	nomipmaps
	{
		map ui/assets/controls
		blendfunc add
		rgbgen wave sin .15 0 0 0
		tcmod scroll .02 0
	}
}

playertitle
{	nopicmip
	nomipmaps
	{
		clampmap ui/assets/playertitle
		blendfunc add
		tcmod stretch sin .9 .001 0 10
		rgbgen wave triangle .5 .05 0 1
	}


}
