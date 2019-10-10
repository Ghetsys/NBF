mob/var/tmp/FreezeTime=""




mob/proc
	SetRightHandSpaceTime()
		if(src.WeaponInRightHand!=""&&src.WeaponInRightHand!="Space Time Hand"&&src.WeaponInRightHand!="Space Time Leg"&&src.WeaponInRightHand!="\
		Spider"&&src.WeaponInRightHand!="Flower"&&src.WeaponInRightHand!="Wall"&&src.WeaponInRightHand!="Spear"&&src.WeaponInRightHand!="ClaySenbon")
			src<<"You already have something in your Right hand!";return
		else
			var/A = input("Which Space Time Ninjutsu do you want to place in your Right Hand?") in list("Hands","Legs","Cancel")
			src.SetRightHand=1
			if(A=="Hands")
				src.WeaponInRightHand="Space Time Hand"
				src<<"You have placed Space Time Ninjutsu that affect Hands in your Right Hand."
				src.SetRightHand=0
			if(A=="Legs")
				src.WeaponInRightHand="Space Time Leg"
				src<<"You have placed Space Time Ninjutsu that affect Legs in your Right Hand."
				src.SetRightHand=0
			if(A=="Cancel")
				src.WeaponInRightHand=""
				src.SetRightHand=0
	SetLeftHandSpaceTime()
		if(src.WeaponInLeftHand!=""&&src.WeaponInLeftHand!="Space Time Hand"&&src.WeaponInLeftHand!="Space Time Leg"&&src.WeaponInLeftHand!="\
		Spider"&&src.WeaponInLeftHand!="Flower"&&src.WeaponInLeftHand!="Wall"&&src.WeaponInLeftHand!="Spear"&&src.WeaponInLeftHand!="ClaySenbon")
			src<<"You already have something in your Left hand!";return
		else
			var/A = input("Which Space Time Ninjutsu do you want to place in your Left Hand?") in list("Hands","Legs","Cancel")
			src.SetLeftHand=1
			if(A=="Hands")
				src.WeaponInLeftHand="Space Time Hand"
				src<<"You have placed Space Time Ninjutsu that affect Hands in your Left Hand."
				src.SetLeftHand=0
			if(A=="Legs")
				src.WeaponInLeftHand="Space Time Leg"
				src<<"You have placed Space Time Ninjutsu that affect Legs in your Left Hand."
				src.SetLeftHand=0
			if(A=="Cancel")
				src.WeaponInLeftHand=""
				src.SetLeftHand=0

mob/proc
	SpaceTimeHand()
		if(src.health<=50)
			src<<"You're too low on health to utilize this technique.";return
		var/mob/M=src.target
		if(src.ntarget)
			src<<"You can't look to see if anybody is doing handseals if you don't have them targetted!";return
		flick("Attack1",src)
		for(M in oview(1,src))
			if(M.DoingHandseals)
				M.DoingHandseals=0
				M.HandsSlipped=1;
				spawn(25)
					M.HandsSlipped=0
		src.health-=50
		src<<"You glance and see that [M] was doing handseals! You use the Space Time to stop their handseals!"
		M<<"[src] glances at your hands and an unknown force stops causes your handseals to slip!"
	SpaceTimeLeg()
		flick("Attack1",src)
		if(src.health<=75)
			src<<"You're too low on health to utilize this technique.";return
		var/mob/M=src.target
		if(src.ntarget)
			src<<"You can't modify pressure around a certain person if you don't have anyone targetted!";return
		flick("Attack1",src)
		src.health-=75
		for(M in oview(1,src))
			if(!M.sphere&&!M.Kaiten)
				src.DodgeCalculation(M)
				if(M.Dodging)
					M.Dodge()
				if(M.Sliced||M.LegSliced)
					src<<"He's already been damaged.."
					return
				else
					if(!M.knockedout)
						src<<"You use the Space Time to cause mass amounts of pressure upon [M]'s legs!"
						var/A=rand(30,55)
						M<<"Your legs become onset with an unknown pressure; making running very difficult...."
						M.LegSliced=1;M.Sliced=1
						spawn()M.Bloody()
						while(A>0)
							if(prob(50))
								M.Running=0
							A--
							sleep(11)
						M<<"The unknown pressure alleviates.."
						M.LegSliced=0
						sleep(600)
						M.Sliced=0
	FreezeTimeSelect()
		switch(input(usr,"Which Variation of Space Time Ninjutsu: Freeze would you like to use","Space Time Ninjutsu: Freeze") in list("Target","Screenwide","Mapwide","Cancel"))
			if("Target")
				src.FreezeTime="Target"
			if("Screenwide")
				src.FreezeTime="Screenwide"
			if("Mapwide")
				src.FreezeTime="Mapwide"
			if("Cancel")
				return
	FreezeTime(WhichFreezeTime)
		var/FreezeTimeEffect=WhichFreezeTime
		if(FreezeTimeEffect=="")
			src<<"You need to use Freeze Time Select and select which type of Freeze Space Time you would like to use first!";return
		if(FreezeTimeEffect=="Target")
			var/TimeFrozen=200
			var/mob/A=src.target
			if(src.ntarget)
				src<<"You need a target!";return
			src.Frozen=1
			src.health-=25
			src.stamina-=50
			src.dir=A.dir
			view()<<"[src] faces your direction and the world begins to seem...disoriented...?"
			sleep(15)
			view()<<"[A] is frozen by the space time continuum!"
			A<<"Tap Spacebar to resist the change from Space!"
			A.FrozenBind="SpaceTimeFrozen"
			while((TimeFrozen-A.Struggle)>0)
				A.FrozenBind="SpaceTimeFrozen"
				src.Frozen=1
				TimeFrozen-=5
				sleep(10)
			A<<"The space time continuum goes back to it's normal state and you're able to move again!"
			src<<"You're forced to stop altering the space time continuum!"
			src.Frozen=0
			A.FrozenBind=""
			return
		if(FreezeTimeEffect=="Screenwide")
			var/mob/A
			var/tmp/list/Effected = list()
			var/TimeFrozen=125
			for(var/mob/M in oview(19,src))
				spawn()
					if(M in OnlinePlayers)
						Effected+=M
			view(Effected)<<"[src] places their hands in front of them and the world around them begins to seem...disoriented..?"
			src.Frozen=1
			src.health-=35;src.Bloody();src.Bloody()
			src.stamina-=150
			sleep(15)
			for(var/mob/M in Effected)
				spawn()
					M.FrozenBind="SpaceTimeFrozen"
					A=M
			var/mob/C=A
			view()<<"[C] is frozen by a large unknown force!"
			C<<"Tap Spacebar to resist the change from Space!"
			while((TimeFrozen-C.Struggle)>0)
				C.FrozenBind="SpaceTimeFrozen"
				src.Frozen=1
				TimeFrozen-=5
				sleep(6)
			C<<"The space time continuum goes back to it's normal state and you're able to move again!"
			src<<"You're forced to stop altering the space time continuum!"
			src.Frozen=0
			C.FrozenBind=""
			return



/*
Space-Time Jutsu:
A set of jutsu attached to the left and right hands. The power arises from a set of runes inscribed into the user's palms, reducting a permanent 100 vitality from the user, fifty from either hands. The jutsu themselves drain vitality and stamina, rather than chakra.


Freeze: Hands
- Used on a targeted opponent. If the target is forming handseals, the jutsu would be immediately cancelled. A message similar to '[charactername] glances at your hands. An outside force brings your handseals to a stop.'' would display
. Jutsu drains about 25 vitality.

Freeze: Legs
 - Used on a targeted opponent. Would gradually bring the target to a halt (would bring them from running to walking to eventually standing still). The target would be frozen for two seconds.
 'Your legs become onset with pressure; you come to a halt.' Drains about 35 vitality.

Freeze: Time - Would have three variations; target-centric, screen-wide, and map wide. The limits would vary from 15 to 10 to 5 seconds respectively. Could be struggled out of, to quicken the time frozen. The message 'The flow of time around you ceases.' would display. The jutsu drains a mixture of stamina and vitality, with the amount differing based on the form used. Target-centric would drain 20 vitality and 30 stamina, screen wide would drain 25 vitality and 45 stamina, and map wide would drain 50 vitality and 100 stamina.

Void: Inhale - Forces all mobs within a seven tile radius of the user to be sucked in towards the player.
 This attack costs 30 stamina.

Void: Exhale - Forcefully pushes all mobs within three tiles away. Could potentially cause wall damage.
 This attack costs 15 vitality and 35 stamina.

Void: Devour - The user opens up a single tile void on the tile they're standing on. Once this jutsu is used, the user would be stuck in place, and a steady chakra drain would occur. The void could expan up to a 5x5 square, and would suck in all jutsu and mobs within a three tile raidus. The jutsu would dissappear, while mobs dragged into it would be constantly damaged. The user can also double click jutsu in use to make them dissappear, while this jutsu is active. This attack costs 75 vitality and 125 stamina.

Void: Transport - Used on a targeted player. Would slowly fade the target's screen to black, as if the player were going blind at a rapid rate. Once the screen was completely black, the user and the targeted player would be teleported to a black map, one screen large. On this map, the user of the jutsu would be able to teleport anywhere double-clicked. The stats of the user would be doubled during this time, as well. The players would reside on this map for ten seconds before being transported back to were they were previously. This attack drains a willpower from the user.
*/