//Need to make the verb to start it
// Need to make the pillars for each side
//Village Capture the Flag 1.1


var/global.villageWarCaptureTheFlag = 0

mob/owner/verb/villageCapturetheFlag()
	set name= "Capture the Flag"
	set category="Testing"//Normally kage
	if (global.villageWarCaptureTheFlag >= 1)
		usr<<"There is already a war in progress, or on cooldown."
		return
	else
		global.villageWarGo = 1
		global.villageWarCaptureTheFlag = 1
		global.villageWarTeamOne = usr.Village
		global.villageWarTeamOneScore =  0
		global.villageWarTeamTwoScore = 0
		switch(input(usr, "Which village would you like to declare war on?") in list("Leaf","Rain","Rock","Sound","Cancel"))
			if("Leaf")
				global.villageWarTeamTwo = "Leaf"
				if(global.villageWarTeamOne == "Leaf")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rain")
				global.villageWarTeamTwo = "Rain"
				if(global.villageWarTeamOne == "Rain")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rock")
				global.villageWarTeamTwo = "Rock"
				if(global.villageWarTeamOne == "Rock")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Sound")
				global.villageWarTeamTwo = "Sound"
				if(global.villageWarTeamOne == "Sound")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					global.villageWarTeamOneScore=0
					global.villageWarTeamTwoScore=0
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Cancel")
				global.villageWarGo = 0
				usr<<"War cancelled."
				return;
		world << "The war will begin in 2 Minutes, quickly prepare! Talk to the Village War Npc to enter the battlefield spawning area!"
		world<< "This is a Capture the Flag War."
		var/mob/K  = new/obj/captureTheFlagScroll
		K.loc = locate(131,165,21)
		sleep(1200)
		global.villageWarGo = 2
		world<<"The War is  now Open, You may join the battle!"
		var/counter = 0
		//check to see if the
		while (counter != 60)
			sleep(300)
			counter++
			//world<<"The village with the Lowest points wins the war."
			world<<"There are [30-(counter/2)] minutes left in the war."
			world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
			world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
			if((villageWarTeamOneScore <= 20) && (villageWarTeamTwoScore <= 20))
				world<<"Called, both villages were unable to get over 20 captures within the time persiod, this one is a tie."
			if(villageWarTeamOneScore <= 20)
				world<<"Called, [global.villageWarTeamOne] has reached 20 captures, winning the war!"
			if(villageWarTeamTwoScore <= 20)
				world<<"Called, [global.villageWarTeamTwo] has reached 20 captures, winning the war!"
		var/WinningVillage
		var/WinningScore
		if (global.villageWarTeamOneScore > global.villageWarTeamTwoScore)
			world<<"<font color=blue size=2>[global.villageWarTeamOne] has won the war!</font>"
			WinningVillage=global.villageWarTeamOne
			WinningScore=global.villageWarTeamOneScore
			//if (global.villageWarTeamOne == "Leaf")
				//global.villageJutsuLeaf++
			//else if (global.villageWarTeamOne == "Rock")
				//global.villageJutsuRock++
			//else if (global.villageWarTeamOne == "Rain")
				//global.villageJutsuRain++
			//else if (global.villageWarTeamOne == "Sound")
				//global.villageJutsuSound++

		else if (global.villageWarTeamOneScore < global.villageWarTeamTwoScore)
			world<<"<font color=blue size=2>[global.villageWarTeamTwo] has won the war!</font>"
			WinningVillage=global.villageWarTeamTwo
			WinningScore=global.villageWarTeamTwoScore
			//if (global.villageWarTeamOne == "Leaf")
				//global.villageJutsuLeaf++
			//else if (global.villageWarTeamOne == "Rock")
				//global.villageJutsuRock++
			//else if (global.villageWarTeamOne == "Rain")
				//global.villageJutsuRain++
			//else if (global.villageWarTeamOne == "Sound")
				//global.villageJutsuSound++
		else
			world<<"<font color=blue size=2>Sometimes there are no winners in war...</font>"
		for(var/mob/M in world)
			if(M.villageWarParticipating&&M.Village==WinningVillage)
				M.VMorale+=WinningScore;M.kills+=(round(WinningScore/2));M.Yen+=(WinningScore*1000)
				M<<"<font color=blue>Congratulations on your victory. You've gained [WinningScore*1000] Ryo, [WinningScore] Village Morale and [round(WinningScore/2)] Class Level!</font>"
				if(WinningScore>=10)
					M<<"<font color=blue>You've gained 1 Elemental Point!</font>";M.ElementalPoints++
			if(M.villageWarParticipating)
				M.villageWarParticipating=0
				var/image/I=image('Icons/Hud/hudfade.dmi',"[M.Village]")
				I.pixel_y=6
				M.overlays-=I;M.overlays-=I
		global.villageWarGo = 0
		global.villageWarTeamOne = ""
		global.villageWarTeamTwo = ""
		global.villageWarTeamOneScore =  0
		global.villageWarTeamTwoScore = 0
		global.villageWarCaptureTheFlag = 0
		world<<"The war is over."
		return




obj
	captureTheFlagScroll
		icon='scrolls.dmi'
		icon_state="Capture the Flag"
		density=1
		layer=MOB_LAYER+1
		var
			VillageIn=""
			CanBeTaken=1
		proc
			ScrollWait()
				src.CanBeTaken=0
				world<<"The Flag will respawn in the center of the map in 30 Seconds."
				sleep(300)
				src.CanBeTaken=1
				src.loc = locate(131,165,21)
				VillageIn=""
				return