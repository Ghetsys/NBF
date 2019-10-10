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
			var/heh = input(usr,"Voc� tem [usr.Yen] Dinheiro. Quanto voc� deseja deposita?","Depositar") as num
			if (heh < 0)
				alert(usr,"N�o tente me passar a perna!","Guardador do Banco")
				return()
			if (heh > usr.Yen)
				alert(usr,"Voc� n�o tem todo esse dinheiro!", "Depositar")
				return()

			usr << "Voc� deposita [heh] Dinheiro."
			usr<<sound('SFX/Cash.wav')
			usr.Yen -= heh
			usr.goldinbank += heh
			return()

		Withdraw()
			set src in oview(3)
			set category = "Bank"
			var/heh = input(usr,"Voc� tem [usr.goldinbank] de dinheiro no banco. Quanto voc� gostaria de retirar?","Retirar") as num
			if (heh < 0)
				alert(usr,"Voc� n�o pode retirar menos de 1 yen!","Guardador do banco")
				return()
			if (heh > usr.goldinbank)
				alert(usr,"Voc� n�o tem todo esse dinheiro no banco!", "Guardador do banco")
				return()

			usr << "Voc� retira [heh] de dinheiro."
			usr.Yen += heh
			usr.goldinbank -= heh
			usr<<sound('SFX/Cash.wav')
			return()

		CheckBalance()
			set src in oview(3)
			set category = "Bank"
			set name = "Ver quantidade"
			usr << "Voc� tem [usr.goldinbank] de dinheiro no banco."
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
				usr<<"Voc� precisa de 200 de dinheiro para curar seu c�o!"
			else
				if(usr.hasdog)
					usr.PetsHealth=usr.PetsMHealth
					usr.PetsStamina=usr.PetsMStamina
					usr.PetsChakra=usr.PetsMChakra
					usr.Yen-=200
					usr<<"Tudo pronto"
					return
				else
					usr<<"Voc� n�o tem seu propio c�o OU presisa ser pego um."
					return
		DogRanAway()
			set src in oview(3)
			set category = "Dog"
			for(var/mob/pet/P in world)
				if(P.Owner==usr)
					del(P)
			usr.hasdog=0
			usr<<"V� pegar um novo animal."

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
				switch(input(usr,"Deseja que eu fixe isso que voc� chama de cabelo?", text) in list ("Yes","No"))
					if("Yes")
						usr<<"S� a sua vis�o mudou, Agora escolha um tipo de cabelo clicando nele."
						usr<<"Para atualizar a cor, clique sobre os blocos de cor e, em seguida, clique no seu estilo de cabelo desejado para ver uma pr�-visualiza��o."
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
	M << "[usr] tira seu olho fora .........HAHA! Voc� virou um cyclope!!"
	usr << "Voc� vee [M]'s o olho rolando no ch�o, teehee!"
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
					usr << "Enfermeira Joy : Ol�, eu sou uma enfermeira qualificada, eu posso te cura se voc� estiver machucado ou meio stunnado. S� falar comigo ent�o."
					return
				if(usr.CBleeding)
					alert(usr,"Oh meu caro deus, seu peito foi completamente empurrado para dentro! Deixe-me te curar!")
					usr.sight |= BLIND
					usr.CBleeding=0
					sleep(100)
					usr.sight &= ~BLIND
					usr<<"Enfermeira Joy: Aqui vamos n�s, tudo melhor. Isso era um machucado s�rio!"
					return
				if(usr.health<usr.maxhealth)
					usr<<"You seem hurt! Allow me to assist you!!"
					if(usr.Yen>=500)
						usr.health = usr.maxhealth
						usr.chakra = usr.Mchakra
						usr << "Enfermeira Joy : Pronto, voc� esta melhor agora, agora eu vou pegar isso de voc�  *pega um saco contendo 500 reais nele* "
						usr.Yen -= 500
					else
						usr << "Enfermeira Joy : VOU TE DEIXAR PERDIDO VAGABUNDO POBRE, EU N�O IREI TOCAR NA SUA PELE SUJA!"
						return
