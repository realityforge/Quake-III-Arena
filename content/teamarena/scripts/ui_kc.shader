
cin_logo
{
	nopicmip
	nomipmaps

	{
		map ui/assets/cin_logo.png
		blendfunc blend
	}
}




warning
{
	nopicmip
	nomipmaps

	{
		map ui/assets/warning.png
		blendfunc blend
		tcmod scale 8 8
	}
}


screenwipe
{
	nopicmip
	nomipmaps

	{
		map ui/assets/screen_wipe1.png
		tcmod scroll .1 .1
		blendfunc filter
	}
}





popback
{

	nopicmip
	nomipmaps

        {
		clampmap ui/assets/popback.png
		blendfunc blend
	}
	{
		clampmap ui/assets/popback.png
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
		clampmap textures/sfx/console01.png
		tcMod rotate 20
	}
        {
		clampmap textures/sfx/console02.png
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
		clampmap textures/sfx/console01.png
		blendfunc add
		rgbgen wave sin .15 0 0 0
		tcMod rotate 20
	}
        {
		clampmap textures/sfx/console02.png
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
		map ui/assets/menuback_a.png
	}


	{
		map ui/assets/console02.png
		blendfunc filter
		tcmod rotate -60
	}
}

menuback_b
{

	nopicmip
	nomipmaps
	{
		map ui/assets/menuback_b.png
		blendfunc add
		rgbgen wave sin .75 0 0 0
		tcmod scroll 0 .2
	}
	{
			map textures/effects2/console01.png
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
		clampmap ui/assets/radial.png
		blendfunc add
		tcmod rotate 100
	}
	{
		clampmap ui/assets/radial.png
		blendfunc add
		tcmod rotate -100
	}
}
menuback_e3
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/radial2.png
		blendfunc add
		tcmod rotate 200
		tcmod scale .5 .5
		rgbgen wave sin .5 .5 0 10
	}
	{
		clampmap ui/assets/radial2.png
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
		clampmap ui/assets/radial2.png
		blendfunc add
		tcmod rotate 200
		rgbgen wave sin .5 .5 0 10
	}
	{
		clampmap ui/assets/radial2.png
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
		map ui/assets/menuback_c.png
		blendfunc blend
	}


	{
		clampmap ui/assets/menuback_c_light.png
		blendfunc add
		tcmod rotate -60
	}

}
menuback_d
{
	nopicmip
	nomipmaps
	{
		map ui/assets/teamarena.png
		blendfunc filter
	}
	{
		map ui/assets/teamarena.png
		blendfunc add
		rgbgen wave sin .25 .25 0 5
	}

}
menuback_f
{

	nopicmip
	nomipmaps
	{
		map ui/assets/menuback_f.png
		blendfunc blend
	}

}
menuback_g
{


	nopicmip
	nomipmaps
	{
		map ui/assets/singleplayer1.png
		blendfunc blend
	}


	}




lightningkc
	{
	nopicmip
	nomipmaps
	{
		animMap 10 ui/assets/blu01.png ui/assets/blu02.png ui/assets/blu03.png ui/assets/blu04.png ui/assets/blu05.png ui/assets/blu06.png ui/assets/blu07.png ui/assets/blu08.png
		blendFunc add
		rgbGen wave inverseSawtooth 0 1 0 10
	}
	}

menu2back
{
	nopicmip
	nomipmaps
	{
		map ui/assets/background.png
		rgbgen identity
	}
}

blur
	{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/blur.png
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
		clampmap ui/assets/vs.png
		blendfunc add
		rgbgen wave sin .25 .15 .25 1.5
		tcmod turb 1 .005 0 4.5
	}
	{
		clampmap ui/assets/vs_alt.png
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
		clampmap ui/assets/the_fallen_name.png
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}
	{
		map ui/assets/the_fallen_name_alt.png
		blendfunc add
	}
	}

ui/assets/stroggs_name
	{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/stroggs_name.png
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/stroggs_name_alt.png
		blendfunc add
	}

}


ui/assets/pagans_name
	{

	nopicmip
	nomipmaps
	{
		map ui/assets/pagans_name.png
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/pagans_name_alt.png
		blendfunc add
	}

}

ui/assets/intruders_name
	{

	nopicmip
	nomipmaps
	{
		map ui/assets/intruders_name.png
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/intruders_name_alt.png
		blendfunc add
	}

}

ui/assets/crusaders_name
	{

	nopicmip
	nomipmaps
	{
		map ui/assets/crusaders_name.png
		blendfunc add
		rgbgen wave sin .75 .25 0 2
		tcmod turb 1 .005 0 5
	}

	{
		map ui/assets/crusaders_name_alt.png
		blendfunc add
	}

}




uibackground4
{
	nopicmip
	nomipmaps

       		{
			map ui/assets/screen02.png
                	blendFunc GL_ONE GL_ZERO
                	tcMod scroll 7.1  0.2
               		tcmod scale .8 1
			rgbgen wave square .5 .05 0 5
		}
		{
			map ui/assets/background3.png
			blendfunc add
			//tcmod turb 1 .002 0 5
		}

}
uibackground8
{
	nopicmip
	nomipmaps

       		{
			map ui/assets/background8.png
                	blendFunc GL_ONE GL_ZERO
			rgbgen wave sin .5 0 0 0
		}


}



uibackgroundid
{
	nopicmip
	nomipmaps


		{
			map ui/assets/backgroundid.png
		}
		{
			map ui/assets/screen02.png
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

       		{	map ui/assets/red_box.png
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

       		{	map ui/assets/red_box.png
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

       		{	map ui/assets/green_box.png
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

       		{	map ui/assets/green_box.png
                	blendFunc filter

		}
	}

hudalert_blue
{
	nopicmip
	nomipmaps

       		{	map ui/assets/blue_box.png
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
			map textures/sfx2/screen01.png
                	blendFunc add
                	tcMod scroll 7.1  0.2
               	tcmod scale .8 1
			rgbgen wave square .75 .05 0 5
		}
	{
			map textures/effects2/console01.png
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
			map textures/sfx2/screen01.png
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
			animMap 5 ui/assets/pagans.png ui/assets/stroggs.png ui/assets/crusaders.png ui/assets/thefallen.png ui/assets/intruders.png
			blendfunc add
			rgbGen wave inverseSawtooth 0 .25 0 5

	}
	{
			animMap 5 ui/assets/intruders.png ui/assets/pagans.png ui/assets/stroggs.png ui/assets/crusaders.png ui/assets/thefallen.png
			blendfunc add
			rgbGen wave Sawtooth 0 .25 0 5

	}


}


playerheads
{
	nopicmip
	nomipmaps

	{
			animMap 5 ui/assets/head1.png ui/assets/head2.png ui/assets/head3.png ui/assets/head4.png ui/assets/head5.png ui/assets/head6.png ui/assets/head7.png ui/assets/head8.png
			blendfunc add
			rgbGen wave inverseSawtooth 0 .5 0 5

	}
	{
			animMap 5 ui/assets/head2.png ui/assets/head3.png ui/assets/head4.png ui/assets/head5.png ui/assets/head6.png ui/assets/head7.png ui/assets/head8.png ui/assets/head1.png

			blendfunc add
			rgbGen wave Sawtooth 0 .5 0 5

	}


}


ui/assets/pagans_shader1
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/pagans.png
		blendfunc add
		rgbgen wave sin .25 0 0 0
	}
}

ui/assets/mainbanner_shader1
{
	nopicmip
	nomipmaps
	{
		map ui/assets/mainmenubanner.png
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
		map ui/assets/chooseclan.png
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
		map ui/assets/selectplayer.png
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
		map ui/assets/setup.png
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
		map ui/assets/join_server.png
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
		map ui/assets/fight.png
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
		map ui/assets/start_server.png
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
		map ui/assets/controls.png
		blendfunc add
		rgbgen wave sin .15 0 0 0
		tcmod scroll .02 0
	}
}

playertitle
{	nopicmip
	nomipmaps
	{
		clampmap ui/assets/playertitle.png
		blendfunc add
		tcmod stretch sin .9 .001 0 10
		rgbgen wave triangle .5 .05 0 1
	}


}
