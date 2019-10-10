mob/var/PetHealth=0

obj/Overlays
	layer=50
	OverlayLowerLeft
		pixel_x=-32;pixel_y=-32
	OverlayLeft
		pixel_x=-32
	OverlayUpperLeft
		pixel_x=-32;pixel_y=32
	OverlayLower
		pixel_y=-32
	OverlayUpper
		pixel_y=32
	OverlayUpperRight
		pixel_x=32;pixel_y=32
	OverlayRight
		pixel_x=32
	OverlayLowerRight
		pixel_x=32;pixel_y=-32
	um
		pixel_x=-32;pixel_y=-32
	dois
		pixel_x=0;pixel_y=-32
	tres
		pixel_x=32;pixel_y=-32
	quatro
		pixel_x=-32;pixel_y=0
	cinco
		pixel_x=0;pixel_y=0
	seis
		pixel_x=32;pixel_y=0
	sete
		pixel_x=-32;pixel_y=32
	oito
		pixel_x=0;pixel_y=32
	nove
		pixel_x=32;pixel_y=32

mob/Summons
	Controllable_Summons
//Fairies
		Fairy_Joy
			icon='Icons/NPCs/FairyJoy.dmi'
			layer=MOB_LAYER+1
			density=0
			New()
				..()
				spawn()
					while(src)
						for(var/mob/M in oview(1,src))
							spawn()
								if(!M.knockedout&&M.health<M.maxhealth)
									M.health+=rand(10,15)
						sleep(11)
		Fairy_Ene
			icon='Icons/NPCs/FairyEne.dmi'
			layer=MOB_LAYER+1
			density=0
			New()
				..()
				spawn()
					while(src)
						for(var/mob/M in oview(1,src))
							if(M.chakra<M.Mchakra)
								M.chakra+=rand(20,45)
						sleep(11)
				spawn(200)
					del(src)

		Fairy_Nega
			icon='Icons/NPCs/FairyNega.dmi'
			layer=MOB_LAYER+1
			density=0
			New()
				..()
				spawn()
					while(src)
						for(var/mob/M in oview(1,src))
							if(M.Age>10&&!M.knockedout)
								M.health-=rand(5,10)
								M.chakra-=rand(20,30)
								M.stamina-=rand(15,25)
						sleep(11)
		Fairy_Inf
			icon='Icons/NPCs/FairyInf.dmi'
			layer=MOB_LAYER+1
			density=0
//Slugs
		Katsuya
			icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi'
			density=1
			icon_state="Katsuya 1,0"
			layer=50
			Running=0
			New()
				var/obj/Overlays/OverlayLeft/A=new();A.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';A.icon_state="Katsuya 0,0"
				src.overlays+=A
				var/obj/Overlays/OverlayRight/B=new();B.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';B.icon_state="Katsuya 2,0"
				src.overlays+=B
				var/obj/Overlays/F=new();F.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';F.icon_state="Katsuya 3,0"
				F.pixel_x=64;src.overlays+=F

				var/obj/Overlays/OverlayUpperLeft/C=new();C.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';C.icon_state="Katsuya 0,1"
				src.overlays+=C
				var/obj/Overlays/OverlayUpper/D=new();D.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';D.icon_state="Katsuya 1,1"
				src.overlays+=D
				var/obj/Overlays/OverlayUpperRight/E=new();E.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';E.icon_state="Katsuya 2,1"
				src.overlays+=E
				var/obj/Overlays/G=new();G.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';G.icon_state="Katsuya 3,1"
				G.pixel_x=64;G.pixel_y=32;src.overlays+=G

				var/obj/Overlays/H=new();H.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';H.icon_state="Katsuya 0,2"
				H.pixel_x=-32;H.pixel_y=64;src.overlays+=H
				var/obj/Overlays/I=new();I.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';I.icon_state="Katsuya 1,2"
				I.pixel_y=64;src.overlays+=I
				var/obj/Overlays/J=new();J.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';J.icon_state="Katsuya 2,2"
				J.pixel_x=32;J.pixel_y=64;src.overlays+=J
				var/obj/Overlays/K=new();K.icon='Code/Techniques/Ninjutsu/Summon/Katsuya.dmi';K.icon_state="Katsuya 3,2"
				K.pixel_x=64;K.pixel_y=64;src.overlays+=K
				..()
				spawn()
					while(src)
						src.Running=0
						sleep(11)
//Dogs
		Darke
			icon='Icons/NPCs/Wolf.dmi'
			density=1
			Mtai=500
			tai=500
			PetHealth=1000
			Running=1
		Coro
			icon='Icons/NPCs/LargeDog.dmi'
			density=1
			Mtai=2500
			tai=2500
			PetHealth=2500
			Running=0
			New()
				var/obj/Overlays/OverlayLower/A=new();A.icon='Icons/NPCs/LargeDogPart4.dmi'
				src.overlays+=A
				var/obj/Overlays/OverlayLowerLeft/B=new();B.icon='Icons/NPCs/LargeDogPart1.dmi'
				src.overlays+=B
				var/obj/Overlays/OverlayLowerRight/C=new();C.icon='Icons/NPCs/LargeDogPart2.dmi'
				src.overlays+=C
				var/obj/Overlays/OverlayLeft/D=new();D.icon='Icons/NPCs/LargeDogPart3.dmi'
				src.overlays+=D
				var/obj/Overlays/OverlayRight/E=new();E.icon='Icons/NPCs/LargeDogPart5.dmi'
				src.overlays+=E
				var/obj/Overlays/OverlayUpperLeft/F=new();F.icon='Icons/NPCs/LargeDogPart6.dmi'
				src.overlays+=F
				var/obj/Overlays/OverlayUpper/G=new();G.icon='Icons/NPCs/LargeDogPart7.dmi'
				src.overlays+=G
				var/obj/Overlays/OverlayUpperRight/H=new();H.icon='Icons/NPCs/LargeDogPart8.dmi'
				src.overlays+=H
				..()
				spawn()
					while(src)
						src.Running=0
						sleep(11)
		Griffin
			icon='Icons/NPCs/WolfGriffin.dmi'
			density=1
			Mtai=500
			PetHealth=1000
			tai=500
			Running=1
			New()
				..()
				spawn()
					var/mob/O=src.Owner
					while(src)
						if(O.icon_state=="handseal")
							O.loc=src.loc
						sleep(rand(10,100))
		Zune
			icon='Icons/NPCs/Zune.dmi'
			layer=MOB_LAYER+1
			PetHealth=1000
			density=0

			New()
				..()
				spawn()
					var/mob/O=src.Owner
					while(src)
						if(O.icon_state=="handseal")
							for(var/mob/M in oview(1,src))
								for(var/mob/X in range(20,src))
									if(X!=M&&M.z==src.z)
										M<<"<b>I sniff a [X.Village] Scented Ninja at [X.x],[X.y]!"
						sleep(50)
		Zute
			icon='Icons/NPCs/Zute.dmi'
			layer=MOB_LAYER+1
			density=0
			PetHealth=1000
			New()
				..()
				spawn()
					var/mob/O=src.Owner
					while(src)
						if(O.icon_state=="handseal")
							for(var/mob/M in oview(1,src))
								for(var/mob/X in range(20,src))
									if(X!=M&&M.z==src.z)
										M<<"<b>I sniff a [X.Clan] Ninja at [X.x],[X.y]!"
						sleep(50)


//Sapos
		Sapo
			icon='Icons/NPCs/Sapo Inicial.dmi'
			density=1
			Mtai=150
			tai=150
			PetHealth=350
			Running=1
		Sapo_do_Monte
			icon='Icons/NPCs/Sapo Nivel 2.dmi'
			density=1
			Mtai=500
			tai=500
			PetHealth=800
			Running=1
		Sapo_Medio_do_Monte
			icon='Icons/NPCs/Sapo Nivel 3.dmi'
			density=1
			Mtai=1850
			tai=1850
			PetHealth=2500
			Running=1
		Sapo_de_Batalha
			icon='Icons/NPCs/Sapo Largo1.dmi'
			density=1
			Mtai=3200
			tai=3200
			PetHealth=5000
			Running=0
			New()
				var/obj/Overlays/um/A=new();A.icon='Icons/NPCs/Sapo Largo1.dmi'
				src.overlays+=A
				var/obj/Overlays/dois/B=new();B.icon='Icons/NPCs/Sapo Largo2.dmi'
				src.overlays+=B
				var/obj/Overlays/tres/C=new();C.icon='Icons/NPCs/Sapo Largo3.dmi'
				src.overlays+=C
				var/obj/Overlays/quatro/D=new();D.icon='Icons/NPCs/Sapo Largo4.dmi'
				src.overlays+=D
				var/obj/Overlays/cinco/E=new();E.icon='Icons/NPCs/Sapo Largo5.dmi'
				src.overlays+=E
				var/obj/Overlays/seis/F=new();F.icon='Icons/NPCs/Sapo Largo6.dmi'
				src.overlays+=F
				var/obj/Overlays/sete/G=new();G.icon='Icons/NPCs/Sapo Largo7.dmi'
				src.overlays+=G
				var/obj/Overlays/oito/H=new();H.icon='Icons/NPCs/Sapo Largo8.dmi'
				src.overlays+=H
				var/obj/Overlays/nove/I=new();I.icon='Icons/NPCs/Sapo Largo9.dmi'
				src.overlays+=I
				..()
				spawn()
					while(src)
						src.Running=0
						sleep(11)