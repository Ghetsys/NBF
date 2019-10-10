mob/var/tmp
	KusaBy
	Tsutakei=0
	testingVariableKusakin=0
obj/Jutsu/Elemental/Mokuton
	icon='Icons/Jutsus/Mokuton.dmi'
	Element="Mokuton"
	health=500
	RazorLeaf
		icon='Icons/Jutsus/KusakinTechniques.dmi'
		density=1
		layer=MOB_LAYER+1
		Move_Delay=0
		New()
			..()
			spawn(45)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/damage=round(rand(M.maxhealth*0.01,M.maxhealth*0.15));
				if(O.SturdyComposition>=10)
					damage+=rand(10,20)
				if(O.SturdyComposition>=20)
					damage+=rand(30,50)
				M.DamageProc(damage,"Health",O)
				view(M)<<output("[M] Foi machucado pelas Folhas!([damage])","Attack")
				spawn() viewers()<<sound('SFX/Slice.wav',0);M.Bloody()
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/O=A
				if(findtext(O.icon_state,"RazorLeaf",1,0)==1)
					src.loc=O.loc
					return
				else
					del(src)
		RazorLeaf1 icon_state="RazorLeaf1"
		RazorLeaf2 icon_state="RazorLeaf2"
		RazorLeaf3 icon_state="RazorLeaf3"
		RazorLeaf4 icon_state="RazorLeaf4"
	KusakinW2
		icon='Icons/Jutsus/KusakinTechniques.dmi'
		icon_state = "WhipHead"
		density=1
		layer=6
		Move_Delay=0
		New()
			..()
			spawn(50)
			del(src)
		Move()
			var/prevloc=src.loc
			..()
			var/prevdir=src.dir
			var/obj/Jutsu/Elemental/Mokuton/WhipTrail/A=new(prevloc)
			A.icon_state="Whip";A.dir=prevdir;A.Owner=src.Owner
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/CompBonus=((O.SturdyComposition/5)*10)
				var/damage=round((O.nin+O.tai)*rand((140+CompBonus),(155+CompBonus)))
				M.Bloody()
				M.DamageProc(damage/M.Endurance,"Health",O);view(M)<<output("[M] was whipped!([damage/M.Endurance])","Attack")
				if(prob(50)) M.HitBack(1,src.dir)
				spawn() M.Bloody()
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			for(var/obj/Jutsu/Elemental/Mokuton/WhipTrail/A in world)
				if(A.Owner==src.Owner)
					del(A)
			..()
	WhipTrail
		icon='Icons/Jutsus/KusakinTechniques.dmi'
		density=1
	KusaHand
		icon='Icons/Jutsus/KusakinTechniques.dmi'
		density=1
		icon_state = ""
		layer = 5
		var/tmp/CapturePerson
		New()
			..()
			spawn()
				while(src)
					sleep(3)
					if(src.icon_state=="VineGuard")
						for(var/mob/M in src.loc)
							var/mob/O=src.Owner
							if(M==O)
								return
							if(M.sphere|M.intsu|M.ingat|M.Kaiten||M.knockedout)
								del(src)
							if(M.FrozenBind=="Kusa"&&O.Guarding)
								O<<"Você apertar o controle sobre [M]!"
								M<<"O aperto te machuca!";M.DamageProc(O.nin*1.15,"Stamina",O)
							if(M.FrozenBind=="Kusa"&&!O.Guarding)
								O<<"Você perdeu um pouco de defesa, afrouxando as folhas em [M]!"
								M<<"O aperto se solta!"
								M.FrozenBind=""
								src.CapturePerson-=M
								spawn(5+(O.SturdyComposition/2))
									del(src)
							if(M.FrozenBind=="")
								M<<"Você foi paralisado pelas folhas!";M.FrozenBind="Kusa";src.CapturePerson=M
					sleep(5)
			spawn(100)
				del(src)
		Del()
			var/mob/M=src.CapturePerson
			var/mob/O=src.Owner
			if(M)
				M<<"Você saiu!"
				M.FrozenBind=""
				M.Death(O)
			sleep(2)
			..()
	VineForest
		icon='Icons/Jutsus/KusakinTechniques.dmi'
		icon_state = "1"
		health=50
		density=1
		layer = 5
		New()
			..()
			spawn()
				flick("Rise",src)
				sleep(3)
				src.icon_state=pick("1","2","3")
			spawn(600)
				del(src)


	WoodBarrier
		icon_state="cmid"
		density=1
		opacity=1
		layer=MOB_LAYER+1
		New()
			.=..()
			spawn()
				flick("mid",src);sleep(1)
			spawn(500)
				flick("emid",src);del(src)

	JukaiKoutan
		name="WoodlandBranch"
		icon_state="EntangleBottom"
		density = 1
		layer = 6//MOB_LAYER+1
		pixel_step_size=32
		dir=NORTH
		var/BindingMob=0
		New()
			if(prob(50))
				src.icon_state="EntangleBottom2";
				var/obj/Jutsu/Elemental/Mokuton/A=new();
				A.layer=src.layer;
				A.icon=src.icon;
				A.icon_state="EntangleTop2";
				A.pixel_y+=32;
				A.animate_movement=SYNC_STEPS;
				src.overlays+=A
			else
				src.icon_state="EntangleBottom";
				var/obj/Jutsu/Elemental/Mokuton/A=new()
				A.layer=src.layer;
				A.icon=src.icon;
				A.icon_state="EntangleTop";
				A.pixel_y+=32;
				A.animate_movement=SYNC_STEPS;
				src.overlays+=A
				dir=pick(NORTH,SOUTH,EAST,WEST)
			.=..()
			spawn()
			//	while(src)
			//		if(src.BindingMob)
				for(var/mob/M in src.loc)
					if(src.BindingMob==1&&M in OnlinePlayers)
						M.Bloody();M.Bloody()
						view(M)<<output("<font color=brown> Um grande ramo lhe arremessa a outra direção!</font>","Attack")
						M.health-=rand(75,125)
						M.stamina-=rand(200,250)
						M.HitBack(6,src.dir)
					sleep(8)
			//	if(prob(50))
			//		src.icon_state="EntangleBottom2";
			//		var/obj/Jutsu/Elemental/Mokuton/A=new();
			///		A.layer=src.layer;
				//	A.icon=src.icon;
				//	A.icon_state="EntangleTop2";
				//	A.pixel_y+=32;
				//	A.animate_movement=SYNC_STEPS;
				//	src.overlays+=A
			//	else
			//		/src.icon_state="EntangleBottom";
			//		var/obj/Jutsu/Elemental/Mokuton/A=new()
			//		A.layer=src.layer;
			//		A.icon=src.icon;
			//		A.icon_state="EntangleTop";
			//		A.pixel_y+=32;
			//		A.animate_movement=SYNC_STEPS;
			//		src.overlays+=A
				spawn(600)
					del(src)
	JukaiKoutan2
		name="WoodlandWall"
		icon_state="Entangle"
	//	icon_state="EntangleBottom"
		density=1
		opacity=1
		dir
		var/BindingMob=0
		New()
			..()
			spawn(1500)
				del(src)
			dir=pick(NORTH,SOUTH,EAST,WEST)
		//	while(src)
		//		if(src.BindingMob)
		//			for(var/mob/M in src.loc)
		//				if(M in OnlinePlayers&&!M.knockedout)
		//					M<<output("<font color=brown> A large branch hurls you into another direction!","Attack")
		//					M.health-=rand(150,200)
		//					M.stamina-=rand(200,350)
		//					M.HitBack(4,src.dir)
		//		sleep(5)
			spawn(900)
				for(var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan/A in world)
				//	sleep(1)
					if(A.Owner==src.Owner)
						del(A)
				del(src)
	WoodSpikes1
		icon_state="1stay"
		density=1
		layer=MOB_LAYER+1
		New()
			.=..()
			spawn()
				flick("1",src)
				for(var/mob/M in src.loc)
					if(M.Kaiten||M.sphere)
						return
					var/mob/O=src.Owner;
					var/BonusDamage=(O.SturdyComposition*pick(1,2))
					var/damage=rand(30,40); //Was Originally Earthmastery*15
					damage+=BonusDamage
					view(M)<<output("<font color=#BB0000 size=2>[M] Foi hitado pelo Wood Spikes!([damage])</font>","Attack")
					M.DamageProc(damage,"Health",O);
					viewers()<<sound('SFX/Slice.wav',0,0,1)
					spawn()
						M.Bloody();M.Bloody();M.Bloody()
			spawn(40)
				//flick("1del",src)
				del(src)


	WoodSpikes2
		icon_state="3"
		density=1
		layer=MOB_LAYER+1
		New()
			.=..()
			spawn()
				flick("1",src)
				for(var/mob/M in src.loc)
					if(M.Kaiten||M.sphere)
						return
					var/mob/O=src.Owner;var/damage=rand(30,40);////Was Originally Earthmastery*15
					view(M)<<output("<font color=#BB0000 size=2>[M] was hit by the Wood Spikes!([damage])</font>","Attack")
					M.DamageProc(damage,"Health",O);viewers()<<sound('SFX/Slice.wav',0,0,1)
					spawn()
						M.Bloody();M.Bloody();M.Bloody()
			spawn(40)
				//flick("1del",src)
				del(src)

mob/proc
	kamisoriha()
		src.ChakraDrain(10000)
		src.Handseals(5-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/obj/Jutsu/Elemental/Mokuton/RazorLeaf/RazorLeaf1/A=new();A.Owner=src;A.dir=src.dir;A.loc=src.loc;walk(A,A.dir)
		sleep(1);var/obj/Jutsu/Elemental/Mokuton/RazorLeaf/RazorLeaf2/B=new();B.Owner=src;B.dir=src.dir;B.loc=src.loc
		spawn(3)
			if(B)
				B.dir=turn(B.dir,-45);walk(B,B.dir)
		sleep(1);var/obj/Jutsu/Elemental/Mokuton/RazorLeaf/RazorLeaf3/C=new();C.Owner=src;C.dir=src.dir;C.loc=src.loc
		spawn(3)
			if(C)
				C.dir=turn(C.dir,-45);walk(C,C.dir)
		sleep(1);var/obj/Jutsu/Elemental/Mokuton/RazorLeaf/RazorLeaf4/D=new();D.Owner=src;D.dir=src.dir;D.loc=src.loc;walk(D,D.dir)
	Tsutakei()
		if(src.Tsutakei)
			src.Tsutakei=0;src<<"Você finaliza a tecninca.";return
		src.ChakraDrain(5000);
		src.Handseals(25-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.Tsutakei=1;
		src<<"Você lentamente manobrar chicotes em sua mão feitas de videiras."
		while(src.Tsutakei)
			sleep(11);
			var/Chakraz=5;
			src.chakra-=Chakraz;
			if(src.chakra<Chakraz)
				src.Tsutakei=0
	KusaBushi()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target;
		src.ChakraDrain(25000);
		src.Handseals(25-usr.HandsealSpeed)
		if(src.HandsSlipped) return
		src<<"As videiras começam a ir ao redor [M]! Segure X para dar dano [M] Enquanto ele estiver capturado!";
		var/obj/Jutsu/Elemental/Mokuton/KusaHand/A=new();
		A.icon_state="VineStarting";
		A.loc=M.loc;
		A.Owner=src;
		sleep(2);
		A.icon_state="VineGuard"
	Kusahayashi()
		src.ChakraDrain(35000);src.Handseals(50-src.HandsealSpeed)
		if(src.HandsSlipped) return
		for(var/turf/T in oview(min(round(src.NinjutsuMastery+1),10),src))
			if(!T.density&&prob(50))
				var/obj/Jutsu/Elemental/Mokuton/VineForest/A=new();A.Owner=src;A.JutsuLevel=1;A.loc=T
	VineField()
		if(src.firing||src.Kaiten)
			return
		else
			src.ChakraDrain(10000)
			src.Handseals(1)
			src<<"Você senta e faz um escudo de folhas."
			src.firing=1;
			var/X=src.x
			var/Y=src.y
			var/Z=src.z
			var/Mastered=100//src.GrassMastery
			if(src.dir==NORTH)
				if(Mastered>99)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A11=new();A11.loc=locate(X,Y+1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A111=new();A111.loc=locate(X+1,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X-1,Y+2,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A22=new();A22.loc=locate(X,Y+2,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A222=new();A222.loc=locate(X+1,Y+2,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X-1,Y+3,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A33=new();A33.loc=locate(X,Y+3,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A333=new();A333.loc=locate(X+1,Y+3,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X-1,Y+4,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A44=new();A44.loc=locate(X,Y+4,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A444=new();A444.loc=locate(X+1,Y+4,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X-1,Y+5,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A55=new();A55.loc=locate(X,Y+5,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A555=new();A555.loc=locate(X+1,Y+5,Z);
				else
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X,Y+2,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X,Y+3,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X,Y+4,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X,Y+5,Z);

			if(src.dir==SOUTH)
				if(Mastered>99)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X-1,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A11=new();A11.loc=locate(X,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A111=new();A111.loc=locate(X+1,Y-1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X-1,Y-2,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A22=new();A22.loc=locate(X,Y-2,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A222=new();A222.loc=locate(X+1,Y-2,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X-1,Y-3,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A33=new();A33.loc=locate(X,Y-3,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A333=new();A333.loc=locate(X+1,Y-3,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X-1,Y-4,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A44=new();A44.loc=locate(X,Y-4,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A444=new();A444.loc=locate(X+1,Y-4,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X-1,Y-5,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A55=new();A55.loc=locate(X,Y-5,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A555=new();A555.loc=locate(X+1,Y-5,Z);
				else
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X,Y-1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X,Y-2,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X,Y-3,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X,Y-4,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X,Y-5,Z);
			if(src.dir==EAST)
				if(Mastered>99)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X+1,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A11=new();A11.loc=locate(X+1,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A111=new();A111.loc=locate(X+1,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X+2,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A222=new();A222.loc=locate(X+2,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A22=new();A22.loc=locate(X+2,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X+3,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A33=new();A33.loc=locate(X+3,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A333=new();A333.loc=locate(X+3,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A45=new();A45.loc=locate(X+4,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A455=new();A455.loc=locate(X+4,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4555=new();A4555.loc=locate(X+4,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X+5,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A55=new();A55.loc=locate(X+5,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A555=new();A555.loc=locate(X+5,Y+1,Z);
				else
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X+1,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X+2,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X+3,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X+4,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X+5,Y,Z);
			if(src.dir==WEST)
				if(Mastered>99)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X-1,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A11=new();A11.loc=locate(X-1,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A111=new();A111.loc=locate(X-1,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X-2,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A22=new();A22.loc=locate(X-2,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A222=new();A222.loc=locate(X-2,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X-3,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A33=new();A33.loc=locate(X-3,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A333=new();A333.loc=locate(X-3,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X-4,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A44=new();A44.loc=locate(X-4,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A444=new();A444.loc=locate(X-4,Y+1,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X-5,Y-1,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A55=new();A55.loc=locate(X-5,Y,Z);
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A555=new();A555.loc=locate(X-5,Y+1,Z);
				else
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A1=new();A1.loc=locate(X-1,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A2=new();A2.loc=locate(X-2,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A3=new();A3.loc=locate(X-3,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A4=new();A4.loc=locate(X-4,Y,Z);
					sleep(2)
					var/obj/Jutsu/Elemental/Mokuton/VineForest/A5=new();A5.loc=locate(X-5,Y,Z);
		src.firing=0;
	MokuShouheki()
		src.ChakraDrain(10000)
		var/number=5
		while(number>0)
			var/BonusHealth=(src.SturdyComposition*15)
			var/obj/Jutsu/Elemental/Mokuton/WoodBarrier/D=new()
			D.health=(((src.SuitonKnowledge+src.DotonKnowledge)*3)+BonusHealth)
		//	D.Owner=usr
			D.Owner=src;
			D.loc=get_step(src,src.dir)
			if(number==4)
				var/d=turn(src.dir,45);D.loc=get_step(src,d)
			if(number==3)
				var/d=turn(src.dir,-45);D.loc=get_step(src,d)
			if(number==2)
				var/d=turn(src.dir,90);D.loc=get_step(src,d)
			if(number==1)
				var/d=turn(src.dir,-90);D.loc=get_step(src,d)
	//		D.JutsuLevel=src.DotonKnowledge
	//		D.health=src.DotonKnowledge
			number--
		sleep(1)
		spawn(5) src.icon_state=""
	//	var/obj/Jutsu/Elemental/Mokuton/WoodBarrier/A=new/obj/Jutsu/Elemental/Mokuton/WoodBarrier(usr.loc)
	//	A.health=(src.SuitonKnowledge+src.DotonKnowledge)*3;A.Owner=usr
	//	sleep(1)
	//	step(A,src.dir)
	//	spawn(5) src.icon_state=""
	WoodSpikes()
		src.ChakraDrain(25000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="beastman";src.Frozen=1;src.firing=1
		spawn(9)
			src.icon_state="";src.Frozen=0;src.firing=0
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
			src.dir=WEST
		if(src.dir==SOUTHEAST||src.dir==NORTHEAST)
			src.dir=EAST
		var/a=10
		var/prevloc=get_step(src,src.dir)
		while(a>0)
			var/b=rand(3,5)
			while(b>0)
				var/obj/Jutsu/Elemental/Mokuton/WoodSpikes1/O=new /obj/Jutsu/Elemental/Mokuton/WoodSpikes1/;var/obj/Jutsu/Elemental/Mokuton/WoodSpikes2/O2=new /obj/Jutsu/Elemental/Mokuton/WoodSpikes1/
				O.Owner=src;O2.Owner=src
				O.dir=src.dir;O2.dir=src.dir
				O.layer=5;O2.layer=5;O2.icon_state="3";O.loc=prevloc;O2.loc=prevloc;var/c=round(32/b)
				if(src.dir==WEST||src.dir==EAST)
					O.pixel_x=c
					if(src.dir==WEST)
						O.pixel_x=(c*-1)+8
					O2.pixel_x=O.pixel_x;var/d=((11-a)*(6-b))+(10-(2*a));O.pixel_y=rand(-1*d,d);O2.pixel_y=O.pixel_y;b--
				else if(src.dir==NORTH||src.dir==SOUTH)
					O.pixel_y=c
					if(src.dir==SOUTH)
						O.pixel_y=(c*-1)+6
					O2.pixel_y=O.pixel_y;var/d=((11-a)*(6-b))+(10-(2*a));O.pixel_x=rand(-1*d,d);O2.pixel_x=O.pixel_x;b--
					//sleep(0.001)
			prevloc=get_step(prevloc,src.dir);a--
	JukaiKoutan(Uses)
		src.ChakraDrain(30000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/X=10
		if(Uses>100)
			X=12
		if(Uses>500)
			X=15
		var/BonusHealth=(src.SturdyComposition*20+1)
		for(var/turf/T in oview(X,src))
			if(!(T in oview(7)))
				var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan2/A=new/obj/Jutsu/Elemental/Mokuton/JukaiKoutan2(locate(T.x,T.y,T.z))
				A.health=(((src.SuitonKnowledge+src.DotonKnowledge)*2)+BonusHealth);A.Owner=src
			else
				if(prob(20))
					var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan2/A=new/obj/Jutsu/Elemental/Mokuton/JukaiKoutan(locate(T.x,T.y,T.z))
					A.health=(((src.SuitonKnowledge+src.DotonKnowledge)*3)+BonusHealth);A.Owner=src
