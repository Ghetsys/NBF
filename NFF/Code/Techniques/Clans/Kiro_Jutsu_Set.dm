mob/var/tmp
	ShurikenMode=0
	VoidStarMode=0
obj/Click()
	for(var/obj/Jutsu/Kiro/ChakraShuriken/A in view(10,usr))
		if(A.Controllable&&A.Owner==usr)
			walk_to(A,src)
			usr.chakra-=10
turf/Click()
	for(var/obj/Jutsu/Kiro/ChakraShuriken/A in view(10,usr))
		if(A.Controllable&&A.Owner==usr)
			walk_to(A,src)
			usr.chakra-=10
mob/Click()
	for(var/obj/Jutsu/Kiro/ChakraShuriken/A in view(10,usr))
		if(A.Controllable&&A.Owner==usr)
			walk_towards(A,src)
			usr.chakra-=10
obj/Jutsu/Kiro
	icon='Icons/Jutsus/KiroTechniques.dmi'
	ChakraShuriken
		icon_state="Shuriken"
		density=1
		Move_Delay=0
		New()
			..()
			spawn()
				while(src)
					sleep(11)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						del(src)
			spawn(30)
				del(src)
		var
			Controllable=0
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M.Kaiten)
					return
				var/damage=M.maxhealth*pick(0.25,0.3)
				M.DamageProc(damage,"Health",O)
				spawn()
					M.Bloody();M.Bloody()
					viewers()<<sound('SFX/Slice.wav',0,0,1)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

	ChakraShurikenSpam
		icon_state="Shuriken"
		density=1
		layer=MOB_LAYER+1
		Move_Delay=0
		var/Controllable=0
		New()
			..()
			spawn(35)
				del(src)

		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M.Kaiten)
					return
				var/damage=(M.maxhealth*rand(0.02,0.04))
				M.DamageProc(damage,"Health",O)
				spawn(5)
					M.Bloody()
					M.Bloody()
					viewers()<<sound('SFX/Slice.wav',0,0,1)
		//		del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
		//	if(istype(A,/obj/))
		//		del(src)

	ShurikenStar
		icon = 'Icons/Jutsus/KiroTechniques.dmi'
		icon_state = "ShurikenStar2"
		density=1
		Move_Delay=0
		var
			Shot=0
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					if(src.Shot)
						spawn(30)
							del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						del(src)
					for(var/mob/M in oview(1,src))
						var/mob/O=src.Owner
						if(M!=O)
							M.DamageProc(95,"Health",O);viewers()<<sound('SFX/Slice.wav',0);M.Bloody()
					sleep(4)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	VoidedStar
		icon='Icons/Jutsus/KiroTechniques.dmi'
		icon_state = "ShurikenStar2"
		density=1
	//	var/Owner
		New()
			..()
			spawn()
				var/distance=0
				distance=2
				while(src)
					sleep(7)
					spawn(1)
						for(var/obj/Jutsu/Elemental/Raiton/A in oview(2))
							del(A)
						for(var/obj/Jutsu/A in oview(2))
							spawn(1)
							if(A&&A.JutsuLevel>0)
								spawn(1)
									step_towards(A,src);
									sleep(3);
									step_towards(A,src)
						for(var/obj/WEAPONS/A in oview(2))
							spawn(1)
							if(A)
								spawn(1)
									step_towards(A,src);sleep(3);step_towards(A,src)
					for(var/mob/M in view(distance,src))
						spawn(1)
							if(M!=src.Owner&&!M.ImmuneToDeath)
								step_towards(M,src)
					for(var/mob/M in view(1,src))
						if(istype(M,/mob/Bugs/)) M.health=0
						M.DamageProc(43,"Health",usr)
						spawn()M.Bloody();viewers()<<sound('SFX/Slice.wav',0)
			spawn(300)
				del(src)

	ShurikenStarShield
		icon_state="Shuriken"
		density=1
		layer=MOB_LAYER+9
		Move_Delay=0
		New()
			..()
			spawn()
				while(src)
					sleep(4)
			 //		O.icon_state="handseal"
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						del(src)
					for(var/mob/M in view(1,src))
						if(M!=src.Owner)
							M<<"Você está sendo cortado pelas Shurikens!"
							M.DamageProc(4,"Health",src.Owner);viewers()<<sound('SFX/Slice.wav',0);M.Bloody()

			spawn(50)
				del(src)






mob/proc
	ShurikenSoujuu()
		if(src.ShurikenMode)
			src.ShurikenMode=0;src<<"Você libera as Shurikens."
			for(var/obj/A in view(20,src))
				if(A.icon=='Icons/shuriken.dmi'&&A.icon_state=="throw")
					walk(A,A.dir)
					return
		else
			src<<"Você entra no modo de controle de Shuriken. Todos os Shurikens jogadas pode ser controlada através de um clique!";src.ShurikenMode=1
			while(src.ShurikenMode)
				src.chakra-=4
				sleep(30)
	VoidStar()
		if(src.knockedout||src.Frozen||src.firing)
			return
		if(src.VoidStarMode==1)
			src<<"Você desativar rapidamente manipulação de seu chakra."
			src.VoidStarMode=0
		src.ChakraDrain(15000)
		src.icon_state="handseal"
		view()<<"[src] começa a forçar o seu chakra em um estado manipulador intenso!"
		sleep(15)
		while(src.icon_state=="handseal")
			sleep(11)
			src.ChakraDrain(25000)
			src.VoidStarMode=1
			if(src.knockedout||src.icon_state!="handseal"||src.chakra<=0)
				src.VoidStarMode=0
				src<<"Você é forçado a parar o rápido manipulação de seu chakra.";return
	ChakraShuriken()
		if(src.knockedout)
			return
		src.ChakraDrain(6500);
		src.see_invisible=99;
		src.ChakraSight(1)
		src<<"Por um pouco de tempo, você pode ver o chakra!"
		spawn(100)
			src.see_invisible=1
			src.ChakraSight(0)
		var/obj/Jutsu/Kiro/ChakraShuriken/J=new();J.loc=src.loc;J.Owner=src;J.dir=src.dir;walk(J,J.dir)
	RasenHoshi()
		if(src.knockedout)
			return
		src.ChakraDrain(7000);
		src.see_invisible=99;
		src.ChakraSight(1)
		src<<"Por um pouco de tempo, você pode ver o chakra!"
		spawn(100)
			src.see_invisible=1
			src.ChakraSight(0)
		var/obj/Jutsu/Kiro/ShurikenStar/A=new();src.JutsuList+=A;src.icon_state="handseal";src.Frozen=1;A.loc=src.loc;A.dir=src.dir;step(A,A.dir);A.Owner=src;src<<"You generate a fast blade of chakra in front of you capable of blocking techniques and slashing enemies! (Press and Release Z to turn it off)"
	RasenHoshiProjectile()
		if(src.knockedout)
			return
		src.ChakraDrain(5500);
		src.see_invisible=99;
		src.ChakraSight(1)
		src<<"Por um pouco de tempo, você pode ver o chakra!"
		spawn(100)
			src.see_invisible=1
			src.ChakraSight(0)
		for(var/obj/Jutsu/Kiro/ShurikenStar/A in src.JutsuList)
			src.Frozen=0;src.icon_state="";walk(A,A.dir);A.Shot=1
	ChakraShurikenShield()
		if(src.knockedout)
			return
		else
			src.Handseals(40-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src<<output("Você se enconbre em numa torrente de Shurikens!","Attack")
		//	if(prob(75))
		//		view() << "<font color=silver><b><font face=verdana>[src] says: Shield of Shuriken Jutsu!"
			src.ChakraDrain(15000)
			for(var/turf/T in oview(3))
				var/obj/Jutsu/Kiro/ShurikenStarShield/J=new();J.loc=T;J.Owner=src//src.JutsuList+=J;J.dir=src.dir//J.dir=src.dir;walk(J,J.dir)
	ShurikenSmithyJutsu()
		if(src.knockedout||src.firing)
			return
		src.ChakraDrain(5500);
		src.see_invisible=99;
		src.ChakraSight(1)
		src<<"Por um pouco de tempo, você pode ver o chakra!"
		spawn(100)
			src.ChakraSight(0)
			src.see_invisible=1
		src.icon_state="handseal";
		src<<"Você gera uma torrente de Chakra Shurikens e constantemente expulsá de seu corpo!"
		while(src.icon_state=="handseal")
			src.see_invisible=99;
			var/obj/Jutsu/Kiro/ChakraShurikenSpam/J=new();
			src.JutsuList+=J;
			J.loc=src.loc;
			J.Owner=src;
			J.dir=pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST);
			walk(J,J.dir);
			J.Controllable=1;
			src.chakra-=10;
			sleep(1)
		src.see_invisible=1