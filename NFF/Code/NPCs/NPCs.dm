mob/Banker//the new banker!
	name = "Banker"
	CNNPC = 1
	health = 9999999999999999999999999999999999999999999999
	icon='Map/Turfs/HakumeiGetsu.dmi'
	icon_state="Moon2"
	New()
		.=..()
		spawn()
			src.icon=null
			var/Base='Icons/New Base/Base.dmi'
			var/Hair='Icons/New Base/Hair/narutoH.dmi'
			Base+=rgb(235,145,52)
			Hair+=rgb(50,50,50)
			src.icon=Base
			src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
			src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
			src.overlays-='Icons/New Base/MaleEyes.dmi'
			src.overlays+='Icons/New Base/MaleEyes.dmi'
			src.overlays-='Icons/New Base/Eyes.dmi'
			src.overlays+='Icons/New Base/Eyes.dmi'
			src.overlays-='Icons/New Base/Clothing/kakashi mask.dmi'
			src.overlays+='Icons/New Base/Clothing/kakashi mask.dmi'
			src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
			src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
			src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
			src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
			src.overlays-=Hair
			src.overlays+=Hair
	verb
		Deposit()
			set src in oview(3)
			set category = "Banco"
			var/heh = input(usr,"Você tem [usr.Yen] Dinheiro. Quanto você deseja deposita?","Depositar") as num
			if (heh < 0)
				alert(usr,"Não tente me passar a perna!","Guardador do Banco")
				return()
			if (heh > usr.Yen)
				alert(usr,"Você não tem todo esse dinheiro!", "Depositar")
				return()

			usr << "Você deposita [heh] Dinheiro."
			usr<<sound('SFX/Cash.wav')
			usr.Yen -= heh
			usr.goldinbank += heh
			return()

		Withdraw()
			set src in oview(3)
			set category = "Bank"
			var/heh = input(usr,"Você tem [usr.goldinbank] de dinheiro no banco. Quanto você gostaria de retirar?","Retirar") as num
			if (heh < 0)
				alert(usr,"Você não pode retirar menos de 1 yen!","Guardador do banco")
				return()
			if (heh > usr.goldinbank)
				alert(usr,"Você não tem todo esse dinheiro no banco!", "Guardador do banco")
				return()

			usr << "Você retira [heh] de dinheiro."
			usr.Yen += heh
			usr.goldinbank -= heh
			usr<<sound('SFX/Cash.wav')
			return()

		CheckBalance()
			set src in oview(3)
			set category = "Bank"
			set name = "Ver quantidade"
			usr << "Você tem [usr.goldinbank] de dinheiro no banco."
mob/Vet
	name = "Vet"
	CNNPC = 1
	health = 9999999999999999999999999999999999999999999999
	icon='Map/Turfs/HakumeiGetsu.dmi'
	icon_state="Moon2"
	New()
		.=..()
		spawn()
			src.icon=null
			var/Base='Icons/New Base/Base.dmi'
			Base+=rgb(235,145,52)
			src.icon=Base
			src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
			src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
			src.overlays-='Icons/New Base/MaleEyes.dmi'
			src.overlays+='Icons/New Base/MaleEyes.dmi'
			src.overlays-='Icons/New Base/Eyes.dmi'
			src.overlays+='Icons/New Base/Eyes.dmi'
			src.overlays-='Icons/New Base/Clothing/kakashi mask.dmi'
			src.overlays+='Icons/New Base/Clothing/kakashi mask.dmi'
			src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
			src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
			src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
			src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
	verb
		Heal()
			set src in oview(3)
			set category = "Dog"
			if(usr.Yen <= 200)
				usr<<"Você precisa de 200 de dinheiro para curar seu cão!"
			else
				if(usr.hasdog)
					usr.PetsHealth=usr.PetsMHealth
					usr.PetsStamina=usr.PetsMStamina
					usr.PetsChakra=usr.PetsMChakra
					usr.Yen-=200
					usr<<"Tudo pronto"
					return
				else
					usr<<"Você não tem seu propio cão OU presisa ser pego um."
					return
		DogRanAway()
			set src in oview(3)
			set category = "Dog"
			for(var/mob/pet/P in world)
				if(P.Owner==usr)
					del(P)
			usr.hasdog=0
			usr<<"Vá pegar um novo animal."

mob
	var/tmp
		moving=0




proc/Name2Mob(var/mName as text)
	for(var/mob/i in world)
		if("[lowertext(i.name)]" == "[lowertext(mName)]")
			return i
mob
	tailor
		name = "Barbeiro"
		icon = 'Haircuter.dmi'
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		verb
			Talk()
				set src in oview(2)
				set category ="Hair-cut"
				if(usr.Skill_Tree)
					usr<<sound('SFX/click2.wav',0)
					usr.client.perspective=MOB_PERSPECTIVE
					usr.client.eye=usr
					usr.Skill_Tree=0
				switch(input(usr,"Deseja que eu fixe isso que você chama de cabelo?", text) in list ("Yes","No"))
					if("Yes")
						usr<<"Só a sua visão mudou, Agora escolha um tipo de cabelo clicando nele."
						usr<<"Para atualizar a cor, clique sobre os blocos de cor e, em seguida, clique no seu estilo de cabelo desejado para ver uma pré-visualização."
						usr<<sound('SFX/click1.wav',0)
						usr.Skill_Tree=1
						usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
						usr.client.eye=locate(172,29,20)
						var/d1 = locate(164,24,20)
						var/d2 = locate(166,24,20)
						var/d3 = locate(166,22,20)
						var/d4 = locate(164,22,20)
						usr.pic5()//new stuff
						var/icon/P = icon(usr.TIcon)
						usr.TIcon=null//end new stuff
						var/image/A = image(P,d1,"",103,NORTH)
						usr.pic()//new stuff
						var/icon/I = icon(usr.TIcon)
						usr.TIcon=null//end new stuff
						var/image/B = image(I,d2,"",103,SOUTH)
						usr.pic6()
						var/icon/X = icon(usr.TIcon)
						usr.TIcon=null
						var/image/C = image(X,d3,"",103,EAST)
						usr.pic7()
						var/icon/Y = icon(usr.TIcon)
						usr.TIcon=null
						var/image/D = image(Y,d4,"",103,WEST)
					//	var/image/A = image(usr.icon,d1,"",103,NORTH);var/image/B = image(I,d2,"",103,SOUTH);var/image/C = image(usr.icon,d3,"",103,EAST);var/image/D = image(usr.icon,d4,"",103,WEST)

						usr<<A;usr<<B;usr<<C;usr<<D
mob/owner/verb/Take_Out_An_Eye(mob/M in world)
	M.halfb = 1
	M.client.screen += new /obj/black2
	M << "[usr] tira seu olho fora .........HAHA! Você virou um cyclope!!"
	usr << "Você vee [M]'s o olho rolando no chão, teehee!"
mob
	nurse
		icon_state = ""
		density = 1
		CNNPC = 1
		health = 9999999999999999999999
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/InoH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(50,50,50)
				src.icon=Base
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays-='gloves.dmi'
				src.overlays+='gloves.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb
			Talk()
				set src in oview(1)
				if(usr.health>=usr.maxhealth)
					usr << "Enfermeira Joy : Olá, eu sou uma enfermeira qualificada, eu posso te cura se você estiver machucado ou meio stunnado. Só falar comigo então."
					return
				if(usr.CBleeding)
					alert(usr,"Oh meu caro deus, seu peito foi completamente empurrado para dentro! Deixe-me te curar!")
					usr.sight |= BLIND
					usr.CBleeding=0
					sleep(100)
					usr.sight &= ~BLIND
					usr<<"Enfermeira Joy: Aqui vamos nós, tudo melhor. Isso era um machucado sério!"
					return
				if(usr.health<usr.maxhealth)
					usr<<"You seem hurt! Allow me to assist you!!"
					if(usr.Yen>=500)
						usr.health = usr.maxhealth
						usr.chakra = usr.Mchakra
						usr << "Enfermeira Joy : Pronto, você esta melhor agora, agora eu vou pegar isso de você  *pega um saco contendo 500 reais nele* "
						usr.Yen -= 500
					else
						usr << "Enfermeira Joy : VOU TE DEIXAR PERDIDO VAGABUNDO POBRE, EU NÃO IREI TOCAR NA SUA PELE SUJA!"
						return
