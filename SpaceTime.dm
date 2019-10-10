mob/var/tmp/FreezeTime=""




mob/proc
	SetRightHandSpaceTime()
		if(src.WeaponInRightHand!=""&&src.WeaponInRightHand!="Mao de Espaço-Tempo"&&src.WeaponInRightHand!="Perna de Espaço-Tempo"&&src.WeaponInRightHand!="\
		Aranha"&&src.WeaponInRightHand!="Flor"&&src.WeaponInRightHand!="Parede"&&src.WeaponInRightHand!="Lança"&&src.WeaponInRightHand!="Senbon de Argila")
			src<<"Voce ja tem algo em sua mao direita!";return
		else
			var/A = input("Que tipo de Ninjutsu de Espaço-Tempo voce gostaria de por em sua mao direita?") in list("Maos","Pernas","Cancelar")
			src.SetRightHand=1
			if(A=="Maos")
				src.WeaponInRightHand="Space Time Hand"
				src<<"Voce colocou o Ninjutsu Espaço-Temporal que afeta as maos em sua Mao Direita."
				src.SetRightHand=0
			if(A=="Pernas")
				src.WeaponInRightHand="Space Time Leg"
				src<<"Voce colocou o Ninjutsu Espaço-Temporal que afeta as pernas em sua Mao Direita."
				src.SetRightHand=0
			if(A=="Cancelar")
				src.WeaponInRightHand=""
				src.SetRightHand=0
	SetLeftHandSpaceTime()
		if(src.WeaponInLeftHand!=""&&src.WeaponInLeftHand!="Mao Espaço-Temporal"&&src.WeaponInLeftHand!="Perna Espaço-Temporal"&&src.WeaponInLeftHand!="\
		Aranha"&&src.WeaponInLeftHand!="Flor"&&src.WeaponInLeftHand!="Parede"&&src.WeaponInLeftHand!="Lança"&&src.WeaponInLeftHand!="Senbon de Argila")
			src<<"Voce já tem algo em sua mao esquerda!";return
		else
			var/A = input("Que tipo de Ninjutsu Espaço-Temporal voce gostaria de por em sua mao esquerda?") in list("Maos","Pernas","Cancelar")
			src.SetLeftHand=1
			if(A=="Hands")
				src.WeaponInLeftHand="Mao Espaço-Temporal"
				src<<"Voce colocou o Ninjutsu Espaço-Temporal que afeta as maos em sua mao esquerda."
				src.SetLeftHand=0
			if(A=="Legs")
				src.WeaponInLeftHand="Perna Espaço-Temporal"
				src<<"Voce colocou o Ninjutsu Espaço-Temporal que afeta as pernas em sua mao esquerda."
				src.SetLeftHand=0
			if(A=="Cancel")
				src.WeaponInLeftHand=""
				src.SetLeftHand=0

mob/proc
	SpaceTimeHand()
		if(src.health<=50)
			src<<"Sua vitalidade está muito baixa para usar esta tecnica.";return
		var/mob/M=src.target
		if(src.ntarget)
			src<<"Voce nao pode ver se alguem está fazendo selos de mao se ele nao é seu alvo!";return
		flick("Attack1",src)
		for(M in oview(1,src))
			if(M.DoingHandseals)
				M.DoingHandseals=0
				M.HandsSlipped=1;
				spawn(25)
					M.HandsSlipped=0
		src.health-=50
		src<<"Voce olha e ve que [M] estava fazendo selos de mao! Voce usa o Espaço-Tempo para impedir os selos de mao!"
		M<<"[src] olha para suas maos e uma força desconhecida para seus selos de mao!"
	SpaceTimeLeg()
		flick("Attack1",src)
		if(src.health<=75)
			src<<"Sua vitalidade está muito baixa para usar esta tecnica.";return
		var/mob/M=src.target
		if(src.ntarget)
			src<<"Voce nao pode modificar a pressao ao redor da pessoa se ela nao é seu alvo!";return
		flick("Attack1",src)
		src.health-=75
		for(M in oview(1,src))
			if(!M.sphere&&!M.Kaiten)
				src.DodgeCalculation(M)
				if(M.Dodging)
					M.Dodge()
				if(M.Sliced||M.LegSliced)
					src<<"Ele ja está levando dano.."
					return
				else
					if(!M.knockedout)
						src<<"Voce usa o Espaço-Tempo para causar uma pressao massiva nas pernas de[M]!"
						var/A=rand(30,55)
						M<<"Suas pernas começam a sentir uma estranha pressao; lhe dando dificuldades em correr...."
						M.LegSliced=1;M.Sliced=1
						spawn()M.Bloody()
						while(A>0)
							if(prob(50))
								M.Running=0
							A--
							sleep(11)
						M<<"A pressao desconhecida alivia.."
						M.LegSliced=0
						sleep(600)
						M.Sliced=0
	FreezeTimeSelect()
		switch(input(usr,"Que variaçao do Ninjutsu de Espaço-Tempo: Congelar, voce gostaria de usar?","Ninjutsu Espaço-Temporal: Congelar") in list("Mirar","Tela Grande","Mapa Grande","Cancelar"))
			if("Mirar")
				src.FreezeTime="Mirar"
			if("Tela Grande")
				src.FreezeTime="Tela Grande"
			if("Mapa Grande")
				src.FreezeTime="Mapa Grande"
			if("Cancelar")
				return
	FreezeTime(WhichFreezeTime)
		var/FreezeTimeEffect=WhichFreezeTime
		if(FreezeTimeEffect=="")
			src<<"You need to use Freeze Time Select and select which type of Freeze Space Time you would like to use first!";return
		if(FreezeTimeEffect=="Mirar")
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