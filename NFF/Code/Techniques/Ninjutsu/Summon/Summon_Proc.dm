mob/var/tmp/ASummon=0
mob/proc/SummoningJutsu(WhatsBeingSummoned,SmokeRange=1,ChakraDrain) //Example M.SummoningJutsu("Fairy Joy",1,500)
	src.chakra-=ChakraDrain
	src.Handseals(40-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="beastman";src.Frozen=1
	var/obj/summoncircle/A=new();A.loc=src.loc
	var/obj/summoneffect/A1=new();A1.loc=locate(A.x+1,A.y,A.z);A1.dir=EAST
	var/obj/summoneffect/A2=new();A2.loc=locate(A.x,A.y+1,A.z);A2.dir=NORTH
	var/obj/summoneffect/A3=new();A3.loc=locate(A.x-1,A.y,A.z);A3.dir=WEST
	var/obj/summoneffect/A4=new();A4.loc=locate(A.x,A.y-4,A.z);A4.dir=SOUTH
	spawn(10)
		src.icon_state="";del(A);del(A1);del(A2);del(A3);del(A4)
		for(var/turf/T in oview(SmokeRange))
			var/obj/SmokeCloud/S=new();S.loc=T
		if(WhatsBeingSummoned=="Fairy Joy")
			var/mob/Summons/Controllable_Summons/Fairy_Joy/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Fairy Ene")
			var/mob/Summons/Controllable_Summons/Fairy_Ene/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Fairy Nega")
			var/mob/Summons/Controllable_Summons/Fairy_Nega/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Fairy Inf")
			var/mob/Summons/Controllable_Summons/Fairy_Inf/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Wolf Darke")
			var/mob/Summons/Controllable_Summons/Darke/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo Comum")
			var/mob/Summons/Controllable_Summons/Sapo/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo do Monte")
			var/mob/Summons/Controllable_Summons/Sapo_do_Monte/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo Medio do Monte")
			var/mob/Summons/Controllable_Summons/Sapo_Medio_do_Monte/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo de Batalha")
			var/mob/Summons/Controllable_Summons/Sapo_de_Batalha/SU=new();SU.Owner=src;SU.loc=src.loc
			if(src.target)
				walk_towards(SU,src.target)
		if(WhatsBeingSummoned=="Wolf Griffin")
			var/mob/Summons/Controllable_Summons/Griffin/SU=new();SU.Owner=src;SU.loc=src.loc
			src<<"Griffin has the special ability of teleporting it's Summoner as long as you hold down Z when you wish to be teleported."
		if(WhatsBeingSummoned=="Wolf Zune")
			var/mob/Summons/Controllable_Summons/Zune/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Wolf Zute")
			var/mob/Summons/Controllable_Summons/Zute/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Wolf Coro")
			var/mob/Summons/Controllable_Summons/Coro/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Slug Katsuya")
			var/mob/Summons/Controllable_Summons/Katsuya/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo Comum")
			var/mob/Summons/Controllable_Summons/Sapo/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo do Monte")
			var/mob/Summons/Controllable_Summons/Sapo_do_Monte/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo Medio do Monte")
			var/mob/Summons/Controllable_Summons/Sapo_Medio_do_Monte/SU=new();SU.Owner=src;SU.loc=src.loc
		if(WhatsBeingSummoned=="Sapo de Batalha")
			var/mob/Summons/Controllable_Summons/Sapo_de_Batalha/SU=new();SU.Owner=src;SU.loc=src.loc
		src.Frozen=0









mob/proc/Unsummon(WhatsBeingUnsummoned)//Recoded for CPU Usage 3/9/13
	set background = 1
	var/WhatItIs=WhatsBeingUnsummoned
//	for(var/mob/M in OnlinePlayers)
//		if(M.key=="CobraT1337")
//			M<<"[src] is calling Unsummon proc."
	if(WhatItIs=="All")
		spawn()
			for(var/mob/Summons/Controllable_Summons/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Fairy Joy")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Fairy_Joy/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Fairy Ene")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Fairy_Ene/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Fairy Nega")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Fairy_Nega/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Fairy Inf")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Fairy_Inf/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Wolf Darke")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Darke/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Wolf Griffin")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Griffin/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Wolf Zune")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Zute/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Wolf Coro")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Coro/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Slug Katsuya")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Katsuya/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Sapo Comum")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Sapo/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Sapo do Monte")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Sapo_do_Monte/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Sapo Medio do Monte")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Sapo_Medio_do_Monte/P in world)
				if(P.Owner==src)
					del(P)
	else if(WhatItIs=="Sapo de Batalha")
		spawn()
			for(var/mob/Summons/Controllable_Summons/Sapo_de_Batalha/P in world)
				if(P.Owner==src)
					del(P)


	/*
	if(WhatsBeingUnsummoned=="All")
		for(var/mob/Summons/Controllable_Summons/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Fairy Joy")
		for(var/mob/Summons/Controllable_Summons/Fairy_Joy/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Fairy Ene")
		for(var/mob/Summons/Controllable_Summons/Fairy_Ene/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Fairy Nega")
		for(var/mob/Summons/Controllable_Summons/Fairy_Nega/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Fairy Inf")
		for(var/mob/Summons/Controllable_Summons/Fairy_Inf/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Wolf Darke")
		for(var/mob/Summons/Controllable_Summons/Darke/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Wolf Griffin")
		for(var/mob/Summons/Controllable_Summons/Griffin/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Wolf Zune")
		for(var/mob/Summons/Controllable_Summons/Zune/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Wolf Zute")
		for(var/mob/Summons/Controllable_Summons/Zute/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Wolf Coro")
		for(var/mob/Summons/Controllable_Summons/Coro/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)
	if(WhatsBeingUnsummoned=="Slug Katsuya")
		for(var/mob/Summons/Controllable_Summons/Katsuya/A in world)
			if(A.Owner==src)
				A.health=0;A.Death(src)

*/

