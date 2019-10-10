//Mitchell Quinn
//10/10/2011
//Hoshigaki Complete



/*
Hoshigaki Variables 1.1
Hoshigaki New Sword 1.2
Hoshigake Jutsus	1.3
Hoshigaki Unleashed Jutsus 1.4
Hoshigaki Create Samehade verb 1.5
Hoshigaki A S D Flick 1.7
//Hoshigaki samehade delay 1.3
//hoshigake New 1.8
Hoshigaki not needed 2.0
//hoshigaki unequip 2.2
*/
mob/proc/samehadeThrowing()
	if("Throw" in src.HoshigakiMoves)  //<-- Much more efficient way of doing it. Use less variables this way
		src<<"Você não está pronto para Jogar a Samehada ainda."
		return
	src.HoshigakiMoves.Add("Throw")
	src<<"Você joga sua Samehada."
	var/obj/Jutsu/samehadeThrow/K=new();
	K.dir=src.dir;
	K.Owner=src;
	K.Move_Delay=0;
	K.loc=src.loc;
	src.icon_state="Attack1";
	walk(K,src.dir);
	src.icon_state=""
	src.stamina -= 250
	src.chakra -= 300
	if(src.samehadeThrowingStrength < 3)
		src.samehadeThrowingStrength += 0.01
	sleep(600)
	src<<"Você agora pode jogar sua samehada outra vez."
	src.HoshigakiMoves.Remove("Throw")
	return
mob/proc/SamehadeShred()
	if("Shred" in src.HoshigakiMoves)
		src<<"You can not shred again yet."
		return
	if(src.samehadeEquipped == 0)
		src<<"Você precisa equipar a samehada. Erro Hoshigaki 1.1"
		return
	//var/L = usr.samehadeStrength
	if(src.samehadeStrength<=3)
		src.samehadeStrength += 0.01
		src.HoshigakiMoves.Add("Shred")
		src.stamina -= 250
	if(src.samehadeStrength >= 3)
		src.HoshigakiMoves.Add("Shred")
		src<<"Você rasgou todos ao seu redor com a sua Samehada."
		src.dir = turn (src.dir, -135)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, -135)
		src.Frozen = 1
		sleep(11)
		usr.Frozen = 0
		sleep(450)
		src.HoshigakiMoves.Remove("Shred")
		src<<"Você pode usar o Samehada Retalhar outra vez."
		return
	else if(src.samehadeStrength >= 2)
		src<<"Você rasgou todos ao seu redor com a sua Samehada."
		src.dir = turn (src.dir, - 90)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, -90)
		src.Frozen = 1
		sleep(11)
		src.Frozen = 0
		sleep(450)
		src.HoshigakiMoves.Remove("Shred")
		src<<"Você pode usar o Samehada Retalhar outra vez."
		return
	else if(src.samehadeStrength >= 1)
		src<<"Você rasgou todos ao seu redor com a sua Samehada."
		src.dir = turn (src.dir, -45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, 45)
		src.shredAttack()
		src.dir = turn (src.dir, -45)
		src.Frozen = 1
		sleep(11)
		src.Frozen = 0
		sleep(450)
		src.HoshigakiMoves.Remove("Shred")
		src<<" pode usar o Samehada Retalhar outra vez."
		return
	else
		src<<"Você rasgou todos ao seu redor com a sua Samehada."
		src.shredAttack()
		src.Frozen = 1
		sleep(11)
		src.Frozen = 0
		sleep(450)
		src.HoshigakiMoves.Remove("Shred")
		src<<" pode usar o Samehada Retalhar outra vez."
		return
mob/proc/SamehadeUnleash()
	if ("Unleash" in src.HoshigakiMoves)
		src<<"Sua Samehada ainda está se recuperando da última Libertação de chakra."
		return
/*	if(!usr.LeftHandSheath||!usr.RightHandSheath)
		usr<<"You must unsheath your Samehade to use this."
		return*/
	if (src.samehadeChakara == 0)
		src<<"Primeiro, você deve absorver chakra antes que você possa Liberar o Chakra da samehada."
		sleep(3000)
		src.HoshigakiMoves.Remove("Unleash")
		return
	if (src.samehadeEquipped == 0)
		src<<"Você deve equipar sua Samehada. Erro Hoshigaki 1.0"
		return
	src.HoshigakiMoves.Add("Unleash")
	if (src.samehadeChakara >= 7500)
		src << "O chakra armazenado dentro do seu Samehada surge dentro de você curando suas feridas e restaurar seu chakra."
		src<<"Você está sobrecarregado com chakra e entrar em modo de Libertação!"
		//Health increase
		var/tmp/A = src.samehadeChakara/8
		if(A>=450)
			A=450
		usr.health += A
		if(src.health >= src.maxhealth)
			src.health = src.maxhealth // Check to let the person health go over the maximum health
		src<<"Sua vitalidade é restaurada em [A]!"
		//Stamina Increast
		var/tmp/B = src.samehadeChakara/2
		src.stamina += B
		if( src.stamina >= src.maxstamina)
			src.stamina = src.maxstamina //Check to make sure the person stamina not go over the max
		src<<"Sua energia é restaurada em [B]!"
		//Chakara increase
		var/tmp/C = src.samehadeChakara/2
		src.chakra += C
		if (src.chakra >= src.Mchakra)
			src.chakra = src.Mchakra // check to make sure that the person chakara can not go over max chakara
		src<<"Seu chakra é restaurado em [C]!"
		src.LearnedJutsus+=new/obj/SkillCards/SamehadeMizurappa
		src.LearnedJutsus+=new/obj/SkillCards/SamehadeSuikoudan
		src.LearnedJutsus+=new/obj/SkillCards/SamehadeBakuSuishouha
		src.LearnedJutsus+=new/obj/SkillCards/SamehadeTeppoudama
		//Add in the jutsus
		//login variable to check later
		//var/mob/O = usr.Owner
		if(src.samehadeUnleash >= 1)
			//add in syrup
			src.LearnedJutsus+=new/obj/SkillCards/SamehadeMizuameNabara
		if(src.samehadeUnleash >= 2)
			//add in dragon
			src.LearnedJutsus+=new/obj/SkillCards/SamehadeSuiryuudan
		if(src.samehadeUnleash >= 3)
			//add in water sharks
			src.LearnedJutsus+=new/obj/SkillCards/SamehadeSuigadan
		if(src.samehadeUnleash >= 4)
			//add in water bullet
			src.LearnedJutsus+=new/obj/SkillCards/SamehadeDaibakufu
			//unleash mode last for 90 seconds
		src.UpdateInv()
		sleep(1500)
		for(var/obj/SkillCards/SamehadeTeppoudama/Z in src.LearnedJutsus)
			del(Z)
		for(var/obj/SkillCards/SamehadeMizurappa/Z in src.LearnedJutsus)
			del(Z)
		for(var/obj/SkillCards/SamehadeSuikoudan/Z in src.LearnedJutsus)
			del(Z)
		for(var/obj/SkillCards/SamehadeBakuSuishouha/Z in src.LearnedJutsus)
			del(Z)
		//Take away the jutsus
		if(src.samehadeUnleash >= 1)
			for(var/obj/SkillCards/SamehadeMizuameNabara/Z in src.LearnedJutsus)
				del(Z)
		if(src.samehadeUnleash >= 2)
			for(var/obj/SkillCards/SamehadeSuiryuudan/Z in src.LearnedJutsus)
				del(Z)
		if(src.samehadeUnleash >= 3)
			for(var/obj/SkillCards/SamehadeSuigadan/Z in src.LearnedJutsus)
				del(Z)
		if(src.samehadeUnleash >= 4)
			//remove in water bullet
			for(var/obj/SkillCards/SamehadeDaibakufu/Z in src.LearnedJutsus)
				del(Z)
		src<<"O chakra dentro de sua Samehada está esgotado."
		src<<"Você não está mais no modo Libertação."
		src.samehadeChakara = 0
		src.UpdateInv()
		sleep(3000)
		src.HoshigakiMoves.Remove("Unleash")
		src<<"Você é capaz de usar Samehada Libertação novamente."
		if(src.samehadeUnleash < 4)
			src.samehadeUnleash += 0.1
		return
	else if (src.samehadeChakara < 7500)
		src<<"O chakra armazenado dentro de sua Samehada surge dentro de você cura suas feridas e restaurar o seu chakra."
		//Health increase
		var/tmp/A = src.samehadeChakara/8
		if(A>=450)
			A=450
		src.health += A

		if(src.health >= src.maxhealth)
			src.health = src.maxhealth
		src<<"Sua vitalidade é restaurada em [A]!"
		//Stamina Increast
		var/tmp/B = src.samehadeChakara/2
		if(B>=550)
			A=550
		src.stamina += B
		if( src.stamina >= src.maxstamina)
			src.stamina = src.maxstamina
		src<<"Sua energia é restaurada em [B]!"
		//Chakara increase
		var/tmp/C = src.samehadeChakara/2
		src.chakra += C
		if (src.chakra >= src.Mchakra)
			src.chakra = src.Mchakra
		src<<"Seu chakra é restaurada em [C]!"
		src.samehadeChakara = 0
		sleep(3000)
		src.HoshigakiMoves.Remove("Unleash")
		src<<"Você é capaz de usar Samehada Libertação novamente."
		if(src.samehadeUnleash < 4)
			src.samehadeUnleash += 0.08
		return
	else
		src<<"Verificação de erro Hoshigaki 1.2. Por favor, anote os casos que aconteceram para esta mensagem e por favor informe a algum gm ou administrador do servidor "
		return
//	src.UpdateInv()
mob/proc/CreateSamehadeNew()
	var/CreatingSword=0
	if(CreatingSword== 1)
		src << "Você já está criando uma Samehada."
		return
	CreatingSword=1
	src.Frozen = 1
	src<<"O Chakra dentro do seu corpo começa a girar rapidamente ..."
	src.chakra -= 2000
	sleep(200)
	src<<"A Samehada começa a se formar dentro de você e o chakra dentro de você molda incontrolavelmente!"
	src.stamina -= 200
	src.chakra -= 200
	sleep(200)
	src<<"Seu estômago, e sua garganta começa a queimar!"
	src.stamina -= 2500
	sleep(200)
	src<<"Sua Samehada cai no chão na sua frente."
	CreatingSword=0
	src.Frozen = 0
	var/obj/WEAPONS/SamehadeNew/A=new();A.loc=src
mob/proc/samehadeChakraDrain()
	if ("Drain" in src.HoshigakiMoves)
		src<<"Seu Samehada não está pronto para Roubar Chakra novamente."
		return;
	if (src.samehadeEquipped == 0)
		src<<"Você precisa estar com a Samehada equipada"
		return
	else
		src.HoshigakiMoves.Add("Drain")
		src.stamina -= 100
		for(var/mob/M in get_step(src,src.dir))
			if(M.ImmuneToDeath)
				src<<"Você não pode roubar o chakra de [M]."
				src.HoshigakiMoves.Remove("Drain")
				return
			if (!M.client)
				src<<"Este pode ser apenas usado em jogadores."
				sleep(300)
				src<<"Sua Samehada está pronto para drenar chakra de novamente."
				src.HoshigakiMoves.Remove("Drain")
				return
			if (M.knockedout)
				src<<"Você não pode usar isso em um jogador nocauteado"
				sleep(300)
				src.HoshigakiMoves.Remove("Drain")
				src<<"Sua Samehada está pronto para drenar chakra de novamente."
				return
			if (src.samehadeChakaraDrain <3)
				src.samehadeChakaraDrain += (0.02)
			M<<"Você sente seu Chakra sendo puxado para dentro de [src] Samehada"
			view<<"[src] usou a samehada para roubar o chakra de [M]."
			var/tmp/chakaraDrain = (src.samehadeChakaraDrain * 500)
			if(chakaraDrain>M.chakra)
				src.samehadeChakara += chakaraDrain
				M.chakra = 20
				M.stamina -= 300
				M.health -= 100
				M<<"[src] roubou [chakaraDrain] do seu chakra!"
				src<<"Você roubo [chakaraDrain] de chakra de [M]!"
				M<<"Quase todo o seu chakra é drenado, você se sentir exausto."
				src<<"[M] esta com o chakra está esgotado."
				src.Frozen = 1
				sleep(5)
				src.Frozen = 0
			else
				M.chakra-= chakaraDrain
				src.samehadeChakara += chakaraDrain
				M<<"[src] roubou [chakaraDrain] do seu chakra!"
				src<<"Você roubo [chakaraDrain] de chakra de [M]!"
				src.Frozen = 1
				sleep(5)
				src.Frozen = 0
//	usr<<"Your chakara drain fails to land on its target."
	sleep(300)
	src.HoshigakiMoves.Remove("Drain")
	src<<"Sua Samehada está pronto para drenar chakra novamente."
	return





mob/Hoshigaki/verb/CreateSameHadeNew()
	var/CreatingSword=0
	set category  = "Commands"
	set name = "Create a Samehade"
	if(CreatingSword== 1)
		usr<<"You are already creating a Samehade."
		return
	CreatingSword=1
	usr.Frozen = 1
	src<<"O Chakra dentro do seu corpo começa a girar rapidamente ..."
	src.chakra -= 1500
	sleep(200)
	src<<"A Samehada começa a se formar dentro de você e o chakra dentro de você molda incontrolavelmente!"
	src.stamina -= 200
	src.chakra -= 200
	sleep(200)
	src<<"Seu estômago, e sua garganta começa a queimar!"
	src.stamina -= 2500
	sleep(200)
	src<<"Sua Samehada cai no chão na sua frente."
	CreatingSword=0
	src.Frozen = 0
	var/obj/WEAPONS/SamehadeNew/A=new();A.loc=src





obj/WEAPONS/
	SamehadeNew
		name="Samehade"
		icon_state="Samehade"
		HandedWeapon="Two"
		Health=100
		PercentDamage=15
		PlacementWeight=100
		WeaponDelay=30
		SizeRating=3
		EquipIconUnderlayRight='Icons/New Base/Weapons/Samehade2.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/Samehade2.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/Samehade2.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/Samehade2.dmi'


		//proc/Bump(A)  //<-- override the default Bump proc necessary for Throwing it.
		//	if(ismob(A))  //By utilizing the same object over and over, it saves you a lot of CPU and time so the server
							//doesnt have to constantly waste processing power making and deleting objects.
		//		Do stuff

		verb
			/*Pickup_Samehade()
				set name = "Get"
				if (usr.Clan == "Hoshigaki")
					set src in oview(1)
					usr<<"You pick up the [src]"
					for(var/obj/WEAPONS/SamehadeNew/O in usr.contents)
					del(src)
					return
				else
					usr<<"You try to pick up the Samehade, but it rejects you!"
					usr<<"The Samehade shoots spikes into your hands!"
					usr.health -= 500
					return

			Drop_Samehade()
				set name = "Drop "
				if(usr.samehadeEquipped == 1)
					usr<<"You must unequip the weapon before you can drop it."
					return
				else
					usr<<"You drop the Samehade."
					var/obj/WEAPONS/SamehadeNew/B = new/obj/WEAPONS/SamehadeNew
					B.loc=locate(usr.x,usr.y-1,usr.z)
					del(src)
					return*/


			Equip_Samehade()
				set name = "Equipar"
				if(usr.Clan != "Hoshigaki")
					usr<<"Você tenta equipar a Samehada mas ela o rejeitou."
					usr<<"Espinhos nascem em sua bainha."
				//	usr<<"Your vitiality is damaged by 1000!"
				//	usr<<"Your stamina is damaged by 5000!"
					usr.health -= 1000
					usr.stamina -= 5000
					return
				if(usr.samehadeEquipped == 1)
					usr<<"Você Não esta mais equipando a samehada";usr.WeaponInLeftHand="";usr.WeaponInRightHand=""
					usr.LeftHandSheath=0;usr.RightHandSheath=0
					usr.overlays-=src.EquipIconOverlayRight
					src.Equipped=0
					if(usr.samehadeQuest >= 1)
					//	src.verbs-=/mob/Hoshigaki_New/verb/samehadeChakaraDrain
						for(var/obj/SkillCards/samehadeChakraDrain/P in usr.LearnedJutsus)
							del(P)
					if(usr.samehadeQuest >= 2)
					//	src.verbs-=/mob/Hoshigaki_New/verb/samehadeShred
						for(var/obj/SkillCards/samehadeShred/P in usr.LearnedJutsus)
							del(P)
					if(usr.samehadeQuest >= 3)
					//	src.verbs-=/mob/Hoshigaki_New/verb/samehadeThrow
						for(var/obj/SkillCards/samehadeThrow/P in usr.LearnedJutsus)
							del(P)
					if(usr.samehadeQuest >= 4)
					//	src.verbs-=/mob/Hoshigaki_New/verb/samehadeUnleash
						for(var/obj/SkillCards/samehadeUnleash/P in usr.LearnedJutsus)
							del(P)
					usr.samehadeEquipped = 0
					usr.UpdateInv()
					return
				else
					if(usr.WeaponInLeftHand!=src&&usr.WeaponInRightHand!=src)
						if(usr.WeaponInLeftHand)
							usr<<"Você desequipou [usr.WeaponInLeftHand] na sua mão esquerda."
							var/obj/WEAPONS/O=usr.WeaponInLeftHand;usr.overlays-=O.EquipIconOverlayLeft;O.Equipped=0
							usr.WeaponInLeftHand=""
						if(usr.WeaponInRightHand)
							usr<<"Você desequipou [usr.WeaponInRightHand] na sua mão direita."
							var/obj/WEAPONS/O=usr.WeaponInRightHand;usr.overlays-=O.EquipIconOverlayRight;O.Equipped=0
							usr.WeaponInRightHand=""
						usr<<"You equip the [src].";usr.WeaponInRightHand=src;usr.WeaponInLeftHand=src
						usr.overlays-=src.EquipIconOverlayRight;usr.overlays+=src.EquipIconOverlayRight
						usr.LeftHandSheath=0;usr.RightHandSheath=0
						usr.samehadeEquipped = 1 //make this so it shows inside info bar the samehade chakara
						if(usr.samehadeQuest >= 1)
					//		src.verbs+=/mob/Hoshigaki_New/verb/samehadeChakaraDrain
							usr.LearnedJutsus+=new/obj/SkillCards/samehadeChakraDrain
						if(usr.samehadeQuest >= 2)
					//		src.verbs+=/mob/Hoshigaki_New/verb/samehadeShred
							usr.LearnedJutsus+=new/obj/SkillCards/samehadeShred
						if(usr.samehadeQuest >= 3)
					//		src.verbs+=/mob/Hoshigaki_New/verb/samehadeThrow
							usr.LearnedJutsus+=new/obj/SkillCards/samehadeThrow
						if(usr.samehadeQuest >= 4)
					//		src.verbs+=/mob/Hoshigaki_New/verb/samehadeUnleash
							usr.LearnedJutsus+=new/obj/SkillCards/samehadeUnleash
						usr.UpdateInv()
						return

			Examine()
				set name = "Examinar"
				usr<<"As escamas da Samehada parece tremer à espera de sua próxima refeição. "
				return

//Hoshi Cooldown  <--- Forget these
/*mob/var/tmp/hoshicooldown = 0
mob/var/tmp/hoshicooldown2 = 0
mob/var/tmp/hoshicooldown3 = 0
mob/var/tmp/hoshicooldown4 = 0*/

//Use this instead. See Samehade Throw on how to use it.
mob/var/tmp/list/HoshigakiMoves = list()



//Samehade Drain 100% complete
mob/Hoshigaki_New/verb/
	samehadeChakaraDrain()
		set name = "Chakra Drain"
		set category = "Samehade"
/*		if(!usr.LeftHandSheath||!usr.RightHandSheath)
			usr<<"You must unsheath your Samehade to use this."
			return*/
		if ("Drain" in usr.HoshigakiMoves)
			usr<<"Your Samehade is not ready to Drain Chakra again."
			return;
		if (usr.samehadeEquipped == 0)
			usr<<"You must have the Samehade Equipped. Error Hoshigaki 1.0"
			return
		else
			usr.HoshigakiMoves.Add("Drain")
			usr.stamina -= 100
			for(var/mob/M in get_step(usr,usr.dir))
				if(M.ImmuneToDeath)
					usr<<"You try to drains [M]'s chakra but Korona appears and blocks your attack."
					usr<<"Korona: 'Don't be an abusive nub.'"
					usr<<"Korona zap you with lightning for 300 damage."
					usr.stamina-=300
					sleep(300)
					usr.HoshigakiMoves.Remove("Drain")
					return
				if (!M.client)
					usr<<"This attack is for players only."
					sleep(300)
					usr<<"Your Samehade is ready to drain chakra again."
					usr.HoshigakiMoves.Remove("Drain")
					return
				if (M.knockedout)
					usr<<"You can not use this on knocked out person"
					sleep(300)
					usr.HoshigakiMoves.Remove("Drain")
					usr<<"Your Samehade is ready to drain chakra again."
					return
				if (usr.samehadeChakaraDrain <3)
					usr.samehadeChakaraDrain += (0.02)
				M<<"You feel your Chakra being pulled into [usr]'s Samehade"
				view<<"[usr] drains [M]'s chakra."
				var/tmp/chakaraDrain = (usr.samehadeChakaraDrain * 500)
				if(chakaraDrain>M.chakra)
					usr.samehadeChakara += chakaraDrain
					M.chakra = 20
					M.stamina -= 300
					M.health -= 100
					M<<"[usr] has stolen [chakaraDrain] chakra!"
					usr<<"You have stolen [chakaraDrain] chakra from [M]!"
					M<<"Almost all of your chakra is drained, you feel exhausted."
					usr<<"[M]'s chakra is exhausted."
					usr.Frozen = 1
					sleep(5)
					usr.Frozen = 0
				else
					M.chakra-= chakaraDrain
					usr.samehadeChakara += chakaraDrain
					M<<"[usr] has stolen [chakaraDrain] chakra!"
					usr<<"You have stolen [chakaraDrain] chakra from [M]!"
					usr.Frozen = 1
					sleep(5)
					usr.Frozen = 0
	//	usr<<"Your chakara drain fails to land on its target."
		sleep(300)
		usr.HoshigakiMoves.Remove("Drain")
		usr<<"Your Samehade is ready to drain chakra again."
		return

// use this later		spawn() M.Bloody();spawn() M.Bloody()


//Samehade Shred
	samehadeShred()
		set name = "Shred"
		set category = "Samehade"
	/*	if(!usr.LeftHandSheath||!usr.RightHandSheath)
			usr<<"You must unsheath your Samehade to use this."
			return*/
		if ("Shred" in usr.HoshigakiMoves)
			usr<<"You can not shred again yet."
			return
		if(usr.samehadeEquipped == 0)
			usr<<"You must have the Samehade Equipped. Error Hoshigaki 1.1"
			return
		//var/L = usr.samehadeStrength

		if(usr.samehadeStrength<=3)
			usr.samehadeStrength += 0.01
		usr.HoshigakiMoves.Add("Shred")
		usr.stamina -= 250
		if(usr.samehadeStrength >= 3)
			usr<<"You shred all around you with your Samehade."
			usr.dir = turn (usr.dir, -135)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, -135)
			usr.Frozen = 1
			sleep(11)
			usr.Frozen = 0
			sleep(450)
			usr.HoshigakiMoves.Remove("Shred")
			usr<<"You are able to Shred again."
			return
		else if(usr.samehadeStrength >= 2)
			usr<<"You shred the area infront and to the sides of you with your Samehade."
			usr.dir = turn (usr.dir, - 90)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, -90)
			usr.Frozen = 1
			sleep(11)
			usr.Frozen = 0
			sleep(450)
			usr.HoshigakiMoves.Remove("Shred")
			usr<<"You are able to Shred again."
			return
		else if(usr.samehadeStrength >= 1)
			usr<<"You shred the area infront of you with your Samehade."
			usr.dir = turn (usr.dir, -45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, 45)
			usr.shredAttack()
			usr.dir = turn (usr.dir, -45)
			usr.Frozen = 1
			sleep(11)
			usr.Frozen = 0
			sleep(450)
			usr.HoshigakiMoves.Remove("Shred")
			usr<<"You are able to Shred again."
			return
		else
			usr<<"You shred infront of you with your Samehade."
			usr.shredAttack()
			usr.Frozen = 1
			sleep(11)
			usr.Frozen = 0
			sleep(450)
			usr.HoshigakiMoves.Remove("Shred")
			usr<<"You are able to Shred again."
			return



mob/proc/
	shredAttack()
		//usr is usr
		//src is usr
		for(var/mob/M in get_step(src,src.dir))
			M<<"[src] desfiou você em pedaços com sua Samehada!"
			var/damage=(src.samehadeStrength * 70)
			var/damage2=100 + (src.samehadeStrength * 80)
			M.DamageProc(damage,"Health",src)
			M.DamageProc(damage2,"Stamina",src)
			view(M)<<output("[M] Foi Cortado pela samehada tirando [damage] de vitalidade.")
			view(M)<<output("[M] Foi Cortado pela samehada tirando [damage2] de energia.")

/*
> tmp/var V = SamehadeStrength x 60
> tmp/var S = samehadeStrength x 30
> src -= V
> src -= S
		if(!M.Mogu&&!M.sphere&&!M.Kaiten&&!M.ingat&&!M.intank)
			src<<"You Shred everything around you!"
			//	var/damage= usr.samehadeStrength * 60
			//	var/damage2 = usr.samehadeStrength *30
			//	view()<<"[src] shreds [M] with their Samehade for [damage] Vitial damage and [damage2] Stamina Damage!"
			//	M.DamageProc(damage,"Health",src)
			//	M.DamageProc(damage2,"Stamina", src)
			//	spawn()M.Bloody();spawn()M.Bloody()
			//	if(M.RaiArmor)
			//		M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
		else
			src<<"Your attack doesn't affect [M]!";return
*/
/*
mob/proc
	SwiftSlashTechnique(Hand)
		if(src.firing)
			return
		flick("weaponslash",src)
		for(var/mob/M in get_step(1,src.dir))
			if(M.Mogu)
				return
			src.firing=1
			spawn(15) src.firing=0
			if(M.Dodging||M.Guarding)
				M.Dodge();return
			var/obj/WEAPONS/CCA
			var/Damage=1
			if(Hand=="Left")
				CCA=src.WeaponInLeftHand
			if(Hand=="Right")
				CCA=src.WeaponInRightHand
			Damage=25-(CCA.WeaponDelay)
			var/SizeRating=CCA.SizeRating
			if(SizeRating==3)
				src<<"You can't do a rapid strike with a sword like this.";return
			M<<"[src] slashes you swiftly with their sword!"
			spawn()
				M.Bloody()
				M.Bloody()
			Damage=Damage*0.01
			Damage=M.maxhealth*Damage
			M.DamageProc(Damage,"Health",src)
			viewers(10,M)<<sound('SFX/Slice.wav',0)
*/




obj/Jutsu/
	samehadeThrow
		icon='Icons/Jutsus/SamehadeThrow.dmi'
		icon_state = "samehadeThrow"
		density = 1
		layer = MOB_LAYER+1
		New()
			..()
			spawn(50)
			del(src)
		Bump(A)
			..()
			if(ismob(A))

				walk(src,0)
				var/mob/M = A
				if(M.Kaiten)
					M<<"O chakra para a rotação foi drenado?"
					M.Kaiten=0
					return
				if(M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=(O.samehadeThrowingStrength * 100)
				var/damage2=100 + (O.samehadeThrowingStrength * 100)
				M.DamageProc(damage,"Health",O)
				M.DamageProc(damage2,"Stamina",O)
				view(M)<<output("[M] Foi acertado pela samehada tirando [damage] de vitalidade.")
				view(M)<<output("[M] Foi acertado pela samehada tirando [damage2] de energia.")
				M.icon_state="rasenganhit";
				step_rand(M);sleep(1);
				step(M,M.dir);
				M.icon_state=""
				del(src)
			if(istype(A,/turf/))
				var/turf/T=A
				if(T.density)
					src.CreateSmoke("Medium")
					del(src)
			else if(istype(A,/obj/))
				del(src)


//Samehade Throw
mob/Hoshigaki_New/verb/
	samehadeThrow()
		set name = "Samehade Throw"
		set category = "Samehade"
		if ("Throw" in usr.HoshigakiMoves)  //<-- Much more efficient way of doing it. Use less variables this way
			usr<<"You are not ready to use Samehade Throw yet."
			return
/*		if(!usr.LeftHandSheath||!usr.RightHandSheath)
			usr<<"You must unsheath your Samehade to use this."
			return
		if (usr.samehadeEquipped == 0)*/
			usr<<"You must have the Samehade Equipped. Error Hoshigaki 1.0"
			return
		usr.HoshigakiMoves.Add("Throw")
		usr<<"You throw your Samehade."
		var/obj/Jutsu/samehadeThrow/K=new();
		K.dir=usr.dir;
		K.Owner=usr;
		K.Move_Delay=0;
		K.loc=usr.loc;
		usr.icon_state="Attack1";
		walk(K,usr.dir);
		usr.icon_state=""
		usr.stamina -= 250
		usr.chakra -= 300
		if(usr.samehadeThrowingStrength < 3)
			usr.samehadeThrowingStrength += 0.01
		sleep(600)
		usr<<"You are ready to throw your Samehade again."
		usr.HoshigakiMoves.Remove("Throw")
		return

		/*

		var/obj/Jutsu/Elemental/Doton/BigDoton/K=new();
		K.name="[src]";
		K.dir=src.dir;
		//K.Owner=src;
		K.Move_Delay=0.5;
		K.JutsuLevel=src.DotonKnowledge

		K.health=src.DotonKnowledge*2;
		K.loc=src.loc;
		sleep(2);
		src.icon_state="Attack1";
		K.tai=src.tai;
		K.tai+=Multiplier

				*/
		//spawns samehade throw in the direction that the user is facing.
		//Argon's reccomendation. Add in a new type of object and have it thrown.
		//Automatically have the samehade unequipped but double check to make sure it
		//is equipped in the first place otherwise don't bother going any further.

		//Afterwards, just move the location of the object Samehade frmo the user's contents list
		//to the space he is standing on and call a walk function. Then after it hits something
		//It will call a bump proc you need to code in, in the object above.
		//You shouldn't need to code in a "get" verb ass Samehade already has that because its parent type object
		//has a "get" verb. obj/WEAPONS. Same for drop.

		//What you might want to code is "Samehade Return"
		//If the Samehade's owner calls this after Samehade has been thrown, it will use walk_to and fly to his hand
		//When the Bump procedure is called again as the samehade bumps into its user, to a variable check for something like
		//if(src.ReturningToOwner&&src.Owner==M) or something to that effect, halt the walking via walk(src,0)
		//Then move the Samehade to the user's location. src.Move(M)  <--- which places it in the user's contents

		//Then if you wish you could automatically equip the Samehade by recalling the code block for equip
		//Or more easily call Equip (which I would move to the WEAPONS/Equip() verb (as the parent verb)).
		//As if it were a proc, and it should automatically do it for the user, assuming the Samehade was unequipped
		//When it was thrown or dropped.

		//This all sounds alot more complicated than it actually is.
//		var/tmp/A = 300/usr.samehadeThrowingStrength //<--- Unneeded? That could be bad if they get it really high. There would be no delay eventually.
		//Put the object type here then call walk()
		//var/obj/WEAPONS/SamehadeNew/S = locate(/obj/WEAPONS/SamehadeNew) in usr.contents
//		S.loc=usr.loc;S.icon_state="Samehade Throw";walk(S,usr.dir)  //<--- Change that icon state obviously..
	//	spawn(450)





//Samehade Unleash
mob/Hoshigaki_New/verb/
	samehadeUnleash()
		set name = "Samehade Unleash"
		set category = "Samehade"
		if ("Unleash" in usr.HoshigakiMoves)
			usr<<"Your samehade is still recovering from the last unleash."
			return
/*		if(!usr.LeftHandSheath||!usr.RightHandSheath)
			usr<<"You must unsheath your Samehade to use this."
			return*/
		if (usr.samehadeChakara == 0)
			usr<<"You must first absorb chakara before you can unleash it."
			sleep(3000)
			usr.HoshigakiMoves.Remove("Unleash")
			return
		if (usr.samehadeEquipped == 0)
			usr<<"You must have the Samehade Equipped. Error Hoshigaki 1.0"
			return
		usr.HoshigakiMoves.Add("Unleash")
		if (usr.samehadeChakara >= 7500)
			usr<<"The chakara stored within your Samehade surges inside of you healing your wounds and restoring your chakara."
			usr<<"You are overwhelmed with chakara and enter into unleash mode!"
			//Health increase
			var/tmp/A = usr.samehadeChakara/8
			usr.health += A
			if(usr.health >= usr.maxhealth)
				usr.health = usr.maxhealth // Check to let the person health go over the maximum health
			usr<<"Your Vitiality is restored by [A]!"
			//Stamina Increast
			var/tmp/B = usr.samehadeChakara/2
			usr.stamina += B
			if( usr.stamina >= usr.maxstamina)
				usr.stamina = usr.maxstamina //Check to make sure the person stamina not go over the max
			usr<<"Your Stamina is restored by [B]!"
			//Chakara increase
			var/tmp/C = usr.samehadeChakara/2
			usr.chakra += C
			if (usr.chakra >= usr.Mchakra)
				usr.chakra = usr.Mchakra // check to make sure that the person chakara can not go over max chakara
			usr<<"Your Chakra is restored by [C]!"
			usr.LearnedJutsus+=new/obj/SkillCards/SamehadeMizurappa
			usr.LearnedJutsus+=new/obj/SkillCards/SamehadeSuikoudan
			usr.LearnedJutsus+=new/obj/SkillCards/SamehadeBakuSuishouha
			usr.LearnedJutsus+=new/obj/SkillCards/SamehadeTeppoudama

			//Add in the jutsus
			//login variable to check later
			//var/mob/O = usr.Owner
			if(usr.samehadeUnleash >= 1)
				//add in syrup
				usr.LearnedJutsus+=new/obj/SkillCards/SamehadeMizuameNabara

			if(usr.samehadeUnleash >= 2)
				//add in dragon
				usr.LearnedJutsus+=new/obj/SkillCards/SamehadeSuiryuudan

			if(usr.samehadeUnleash >= 3)
				//add in water sharks
				usr.LearnedJutsus+=new/obj/SkillCards/SamehadeSuigadan

			if(usr.samehadeUnleash >= 4)
				//add in water bullet
				usr.LearnedJutsus+=new/obj/SkillCards/SamehadeDaibakufu

			usr.UpdateInv()
			//unleash mode last for 90 seconds
			sleep(1200)
			for(var/obj/SkillCards/SamehadeTeppoudama/Z in usr.LearnedJutsus)
				del(Z)
			for(var/obj/SkillCards/SamehadeMizurappa/Z in usr.LearnedJutsus)
				del(Z)
			for(var/obj/SkillCards/SamehadeSuikoudan/Z in usr.LearnedJutsus)
				del(Z)
			for(var/obj/SkillCards/SamehadeBakuSuishouha/Z in usr.LearnedJutsus)
				del(Z)
			//Take away the jutsus
			if(usr.samehadeUnleash >= 1)
				for(var/obj/SkillCards/SamehadeMizuameNabara/Z in usr.LearnedJutsus)
					del(Z)
			if(usr.samehadeUnleash >= 2)
				for(var/obj/SkillCards/SamehadeSuiryuudan/Z in usr.LearnedJutsus)
					del(Z)

			if(usr.samehadeUnleash >= 3)
				for(var/obj/SkillCards/SamehadeSuigadan/Z in usr.LearnedJutsus)
					del(Z)

			if(usr.samehadeUnleash >= 4)
				//remove in water bullet
				for(var/obj/SkillCards/SamehadeDaibakufu/Z in usr.LearnedJutsus)
					del(Z)
			usr.UpdateInv()
			usr<<"The chakara within your Samehade is exhausted."
			usr<<"You are not longer in Unleash Mode."
			usr.samehadeChakara = 0
			sleep(3000)
			usr.HoshigakiMoves.Remove("Unleash")
			usr<<"You are able to use Samehade Unleash again."
			if(usr.samehadeUnleash < 4)
				usr.samehadeUnleash += 0.1
			return
		else if (usr.samehadeChakara < 7500)
			usr<<"The chakara stored within your Samehade surges inside of you healing your wounds and restoring your chakara."
			//Health increase
			var/tmp/A = usr.samehadeChakara/8
			usr.health += A
			if(usr.health >= usr.maxhealth)
				usr.health = usr.maxhealth
			usr<<"Your Vitiality is restored by [A]!"
			//Stamina Increast
			var/tmp/B = usr.samehadeChakara/2
			usr.stamina += B
			if( usr.stamina >= usr.maxstamina)
				usr.stamina = usr.maxstamina
			usr<<"Your Stamina is restored by [B]!"
			//Chakara increase
			var/tmp/C = usr.samehadeChakara/2
			usr.chakra += C
			if (usr.chakra >= usr.Mchakra)
				usr.chakra = usr.Mchakra
			usr<<"Your Chakra is restored by [C]!"
			usr.samehadeChakara = 0
			sleep(3000)
			usr.HoshigakiMoves.Remove("Unleash")
			usr<<"You are able to use Samehade Unleash again."
			if(usr.samehadeUnleash < 4)
				usr.samehadeUnleash += 0.08
			return

		else
			usr<<"Hoshigaki error check 1.2. Please write down the instances that took place for this message and please report to Korona"
			return

////////////////////////////////////////////////////////////////////////////////////////////////////

