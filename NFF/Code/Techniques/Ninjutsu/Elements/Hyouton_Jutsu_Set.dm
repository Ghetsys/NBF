mob/var/tmp
	hyoushou=0
	InMirror=0
obj/Jutsu/Elemental/Hyouton
	icon='Icons/Jutsus/HyoutonTechniques.dmi'
	Element="Hyouton"
	var
		IceHealth=100
	IcePrison
		icon_state="SpikeUnderground2"
		density=0
		layer=MOB_LAYER+5
		health=1500
		var/nin=20
		var/IceStruggle=50
		var/PersonCaught
		New()
			..()
			spawn()
				while(src)
					sleep(9)
					for(var/mob/M in src.loc)
						if(M in OnlinePlayers)
							PersonCaught=M
							M.loc=src.loc
							var/mob/O=src.Owner
							var/VitDamage=rand(40,70)//(O.nin*1.2)
							var/StamDamage=(O.nin*2)
							if(M.knockedout)
								M.FrozenBind=""
								del(src)
							if(M.FrozenBind=="")
								M<<"Your body begins to freeze from the Ice! Tap Spacebar to break out!";
								M.FrozenBind="DoBind"
							if(M==O||M.Mogu||M.sphere||M.intsu||M.ingat||M.Kaiten||M.RaiArmor||M.intank)
								return
							if(M.SusanooIn)
								M<<"Your Susanoo causes the Ice to shatter around you!"
								del(src)

							if(M.Struggle>IceStruggle)
								M<<"You've forcefully broken out of the ice!"
								M.FrozenBind=""
								M.Frozen=0
								del(src)
							if(M!=O&&M.Struggle<=IceStruggle&&M.FrozenBind=="DoBind")
								if(!M.knockedout)
									M.DamageProc(VitDamage,"Health",O,"numbness of the ice","#00FFFF")
									M.DamageProc(StamDamage,"Stamina",O,"numbness of the ice","#00FFFF")
					//		spawn()
							//	if(!M.knockedout)
							//		view(M)<<output("<font color=#00FFFF>[M] has been numbed by the ice! ([VitDamage] Vitality - [StamDamage] Stamina</font>","Attack")
			spawn(450)
				var/mob/P = PersonCaught
				if(P.FrozenBind!="")
					P.FrozenBind=""
				del(src)
	IField
		icon_state="SpikeUnderground2"
		density=0
		health=1500
		layer=5
		New()
			..()
			spawn()
				while(src)
					sleep(2)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M!=O)
					//		sleep(4)
							if(M&&prob(12)&&M.Frozen!=1&&M.knockedout!=1&&M.Running&&M.icon_state!="Dead"&&M.runningspeed>0)
							//	M.Status="Asleep"
							//	M.StatusEffected=5
								M.Frozen=1
							//	step(M,M.dir)
								M<<"You slip on the ice!"
								M.icon_state="Dead"
								spawn(20)
									if(M.Frozen)
										M.Frozen=0
										M.icon_state=""
						//			M.icon_state=""
						//			M.Status=""
			spawn(600)
				del(src)
		Del()
			for(var/mob/C in src.loc)
				if(C.icon_state=="Dead")
					C.Frozen=0
					C.icon_state=""
			..()
	Shuriken
		icon_state = "shuriken"
		density = 1
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				if(M==src.Owner)
					src.loc=M.loc
					return
				var/mob/O=src.Owner;var/damage=M.maxhealth*0.05
				if(icon_state=="fuma")
					damage=M.maxhealth*0.11
				if(prob(src.Percision*3))
					damage=damage*2
				view(M)<<sound('SFX/Slice.wav',0)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
			//	view(M)<<"[M] was hit by Snow Shuriken for [damage] damage!!"
				M.DamageProc(damage,"Health",O,"Snow Shuriken","grey")
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(rand(50,150),"Health",src.Owner)
				else
					del(src)
	IceShard
		icon_state = "Shard"
		density=1
		layer=MOB_LAYER+1
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Owner
				if(M.Kaiten||M.sphere)
					return
				if(M==src.Owner)
					src.loc=M.loc
					return
				var/damage=M.maxhealth*0.15
				if(prob(src.Percision*3))
					damage=damage*2
				view(M)<<sound('SFX/Slice.wav',0,35);spawn()M.Bloody()
				M.DamageProc(damage,"Health",O,"Ice Shard","grey");//view(M)<<"[M] was hit by the Ice Shard for [damage] damage!!"
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(rand(150,250),"Health",src.Owner)
				else
					del(src)
	Sensatsu
		icon_state = "needles"
		density=1
		layer=MOB_LAYER+1
		Move_Delay=0
		var/TilesA=0
		var/TilesMax=10
		New()
			..()
			spawn(45)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				if(M.Deflection)
					walk(src,0);src.dir=turn(src.dir,pick(45,-45));walk(src,src.dir);return
				var/mob/O=src.Owner;var/damage=M.maxhealth;var/IceChakra=O.IceChakra*0.01
				damage=((M.maxhealth*(src.TilesA*pick(0.01,0.05)))+(damage*IceChakra));M.StunAdd(3);src.density=0;src.loc=M.loc;walk(src,0)
				if(damage>90)
					damage=90
			//	view(M)<<output("[M] was hit by Sensatsu Suishou!([damage])","Attack")
				M.DamageProc(damage,"Health",O,"Sensatsu Suishou","grey")
			//	M.SoundEngine('SFX/Slice.wav',4)
				spawn() M.Bloody()
				spawn(10) del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			else if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Elemental/Hyouton/DemonMirror/))
					var/obj/Jutsu/Elemental/Hyouton/DemonMirror/O=A
					src.loc=O.loc
				else if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(rand(50,150),"Health",src.Owner)

				else
					del(src)
		Move()
			..()
			if(src.TilesA<src.TilesMax)
				src.TilesA++
	SpikeUnderground
		icon_state="SpikeUnderground"
		layer = TURF_LAYER
		density=0
		health=500
		mouse_opacity = 0
		New()
			..()
			spawn(600)
				del(src)
	ISawarabi
		icon_state="Spike8"
		layer = MOB_LAYER+99999
		density=1
		health=1500
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				for(var/mob/M in src.loc)
					if(M==O)
						return
					var/damage=M.maxhealth*0.15
					damage=round(damage*(usr.IceChakra*0.01+0.8))
					view()<<"[M] has taken [damage] damage from [src]'s Soru Sawarabi!"
					M.SoundEngine('SFX/Slice.wav',3);M.DamageProc(damage,"Health",O)
					spawn()
						M.Bloody();M.Bloody();M.Bloody()
			spawn(600)
				del(src)
	DemonMirror
		icon_state="Mirror"
		density=0
		opacity = 0
		layer=MOB_LAYER+1
		New()
			..()
			spawn()
				src.density=0
				src.opacity=0
				flick("mirrorform",src)
				src.icon_state="Mirror"
				src.density=1
				src.opacity=1



		Click()
			if(usr==src.Owner)
				if(usr.Stun>=1||usr.FrozenBind||usr.Frozen||usr.CastingGenjutsu)
					return
				for(var/mob/M in range(15,usr))
					if(usr==M.target&&!M.shari&&!M.Akametsuki&&!M.bya)
						if(M&&M.client)
							for(var/image/x in M.client.images)
								if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
									del(x)
						M.target=null
				usr.loc=src.loc
				usr.InMirror=1
mob/proc
	SnowShuriken(Uses)
		src.ChakraDrain(10000)
		usr.Handseals(1-usr.HandsealSpeed)
		if(usr.HandsSlipped) return
		if(Uses>=200)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/J=new();J.icon_state="fuma";var/d=turn(usr.dir,90);J.loc=get_step(usr,d);J.name="[usr]";J.dir=usr.dir;J.Owner=usr;walk(J,usr.dir)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/K=new();K.icon_state="fuma";K.loc=usr.loc;K.dir = usr.dir;K.name="[usr]";K.Owner=usr;walk(K,usr.dir)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/L=new();L.icon_state="fuma";var/dr=turn(usr.dir,-90);L.loc=get_step(usr,dr);L.dir = usr.dir;L.name="[usr]";L.Owner=usr;walk(L,usr.dir)
		else if(Uses>=100&&Uses<200)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/J=new();J.name="[usr]";J.dir=usr.dir;J.loc=usr.loc;J.Owner=usr;walk(J,usr.dir)
		else if(Uses>=50&&Uses<100)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/J=new();var/d=turn(usr.dir,90);J.loc=get_step(usr,d);J.name="[usr]";J.dir=usr.dir;J.Owner=usr;walk(J,usr.dir)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/K=new();K.loc=usr.loc;K.dir = usr.dir;K.name="[usr]";K.Owner=usr;walk(K,usr.dir)
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/L=new();var/dr=turn(usr.dir,-90);L.loc=get_step(usr,dr);L.dir = usr.dir;L.name="[usr]";L.Owner=usr;walk(L,usr.dir)
		else
			var/obj/Jutsu/Elemental/Hyouton/Shuriken/J=new();J.name="[usr]";J.dir=usr.dir;J.loc=locate(usr.x,usr.y,usr.z);J.Owner=usr;walk(J,usr.dir)
	IceShard(Uses)
		src.ChakraDrain(12000)
		src.Handseals(10-usr.HandsealSpeed)
		if(usr.HandsSlipped) return
		if(src.WaterSpawn||src.WaterCheck())
			var/obj/Jutsu/Elemental/Hyouton/IceShard/A=new();A.loc=src.loc;A.Owner=src;A.dir=NORTH;walk(A,A.dir)
			var/obj/Jutsu/Elemental/Hyouton/IceShard/B=new();B.loc=src.loc;B.Owner=src;B.dir=SOUTH;walk(B,B.dir)
			var/obj/Jutsu/Elemental/Hyouton/IceShard/C=new();C.loc=src.loc;C.Owner=src;C.dir=EAST;walk(C,C.dir)
			var/obj/Jutsu/Elemental/Hyouton/IceShard/D=new();D.loc=src.loc;D.Owner=src;D.dir=WEST;walk(D,D.dir)
			if(Uses>100)
				var/obj/Jutsu/Elemental/Hyouton/IceShard/AA=new();AA.loc=src.loc;AA.Owner=src;AA.dir=NORTHEAST;walk(AA,AA.dir)
				var/obj/Jutsu/Elemental/Hyouton/IceShard/BB=new();BB.loc=src.loc;BB.Owner=src;BB.dir=SOUTHEAST;walk(BB,BB.dir)
				var/obj/Jutsu/Elemental/Hyouton/IceShard/CC=new();C.loc=src.loc;CC.Owner=src;CC.dir=SOUTHWEST;walk(CC,CC.dir)
				var/obj/Jutsu/Elemental/Hyouton/IceShard/DD=new();DD.loc=src.loc;DD.Owner=src;DD.dir=NORTHWEST;walk(DD,DD.dir)
		else
			src<<"You need a water source!";return
	SensatsuSuishou()
		usr.Target()
		if(usr.ntarget)
			usr<<"You need a Target!"
			return
		else
			var/mob/M=src.target
			src.ChakraDrain(6000)
			usr.Handseals(10-usr.HandsealSpeed)
			if(usr.HandsSlipped) return
			if(src.hyoushou)
				src.ChakraDrain(10000)
				for(var/obj/Jutsu/Elemental/Hyouton/DemonMirror/A in oview(25,src))
					if(A.Owner==src)
						var/obj/Jutsu/Elemental/Hyouton/Sensatsu/S1=new()

						S1.loc=A.loc
						S1.Owner=src;
						S1.density=0//just added 3/12/2013
						spawn(7)
							if(S1)
								S1.density=1

						var/D=get_dir(S1,M);

						walk(S1,D)// This was to prevent being homing
						walk(S1,D)
						walk(S1,D)
						walk(S1,D)
						walk(S1,D)
			else
				if(src.ChakraC>10)
					var/direction=M.dir
					var/loops=8
					while(loops>0)
						sleep(2)
						loops--
						var/turf/A=get_steps(M,direction,round(src.ChakraC/10))
						var/turf/Location
						direction=turn(direction,45)
						for(var/turf/water/T in getline(M,A))
							Location=T
						for(var/turf/water2/T in getline(M,A))
							Location=T
						for(var/obj/Jutsu/Elemental/Suiton/Owater/O in getlineatoms(M,A))
							if(O.icon_state=="water2")
								Location=O.loc
						var/obj/Jutsu/Elemental/Hyouton/Sensatsu/S1=new();S1.loc=Location;var/D=get_dir(S1,M);S1.Owner=usr;
						walk(S1,D)

				else
					if(src.WaterSpawn||src.WaterCheck())
					//	if(prob(50))
					//		view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#c0c0c0>S</FONT><FONT COLOR=#c4c8c8>e</FONT><FONT COLOR=#c8d0d0>n</FONT><FONT COLOR=#ccd8d8>s</FONT><FONT COLOR=#d1e0e0>a</FONT><FONT COLOR=#d5e8e8>t</FONT><FONT COLOR=#d9f0f0>s</FONT><FONT COLOR=#ddf8f8>u</FONT><FONT COLOR=#e0ffff> </FONT><FONT COLOR=#dbfbfd>S</FONT><FONT COLOR=#d4f6fa>u</FONT><FONT COLOR=#cef1f6>i</FONT><FONT COLOR=#c7ecf3>s</FONT><FONT COLOR=#c1e7f0>h</FONT><FONT COLOR=#bae2ed>o</FONT><FONT COLOR=#b4dde9>u</FONT><FONT COLOR=#add8e6>!</FONT>"
						var/obj/Jutsu/Elemental/Hyouton/Sensatsu/S1=new();S1.loc=usr.loc;var/D=get_dir(S1,M);S1.Owner=usr;walk_towards(S1,D);sleep(4)
						var/obj/Jutsu/Elemental/Hyouton/Sensatsu/S2=new();S2.loc=usr.loc;D=get_dir(S2,M);S2.Owner=usr;walk_towards(S2,D);sleep(4)
						var/obj/Jutsu/Elemental/Hyouton/Sensatsu/S3=new();S3.loc=usr.loc;D=get_dir(S3,M);S3.Owner=usr;walk_towards(S3,D);sleep(4)
						var/obj/Jutsu/Elemental/Hyouton/Sensatsu/S4=new();S4.loc=usr.loc;D=get_dir(S4,M);S4.Owner=usr;walk_towards(S4,D);sleep(4)

					else
						usr<<"You need water!";return
	ISawarabi(Uses)
		if(src.firing||src.knockedout)
			return
		else
			src.ChakraDrain(25000)
			var/B=Uses*0.1
			if(B<5)
				B=5
			if(B>10&&!src.Charging)
				B=10
			if(src.WaterSpawn||src.WaterCheck())
				var/HowFarItGoes=1
				if(Uses>200)
					HowFarItGoes=2

				for(var/turf/T in oview(HowFarItGoes,src))
					var/obj/Jutsu/Elemental/Hyouton/SpikeUnderground/AB=new/obj/Jutsu/Elemental/Hyouton/SpikeUnderground(locate(T.x,T.y,T.z))
					spawn(15)
						var/obj/Jutsu/Elemental/Hyouton/ISawarabi/A=new/obj/Jutsu/Elemental/Hyouton/ISawarabi(locate(AB.x,AB.y,AB.z))
						A.Owner=src;flick("rise",A);A.icon_state="Spike8"
				sleep(1)
				var/num=1
				StartSpikes
				sleep(1)
				for(var/atom/T in oview(B,src))
					if(!(ismob(T)))
						if(istype(T,/turf/water)||istype(T,/turf/water2)||istype(T,/obj/Jutsu/Elemental/Suiton/Owater))
							if(prob(40))
								var/obj/Jutsu/Elemental/Hyouton/SpikeUnderground/AB=new/obj/Jutsu/Elemental/Hyouton/SpikeUnderground(locate(T.x,T.y,T.z))
								AB.layer=T.layer
								spawn(15)
									var/obj/Jutsu/Elemental/Hyouton/ISawarabi/A=new/obj/Jutsu/Elemental/Hyouton/ISawarabi(locate(AB.x,AB.y,AB.z))
									var/Z=rand(1,7)
									A.Owner=src;flick("rise[Z]",A);
									if(Z==1||Z==2||Z==3)
										A.icon_state="spike[Z]"
									else
										A.icon_state="Spike[Z]";
									A.density=rand(0,1)
				num++
				if(num<7)
					goto StartSpikes
			else
				usr<<"You need a water source!"
	IceField(Uses)
		if(usr.firing||usr.knockedout)
			return
		else
			src.ChakraDrain(20000)
			var/Mastery=0
			Mastery=((Uses/150)+1)
			var/B=0
			B=round(Mastery)
			if(B>=10)
				B=10
			src.icon_state="beastman"
			oview(B)<<"It starts to get very cold...."
			sleep(15)
			for(var/turf/T in view(B,src))
				if((locate(/obj/Jutsu/Elemental/Suiton/Owater) in T))
					var/obj/Jutsu/Elemental/Hyouton/IField/AA=new/obj/Jutsu/Elemental/Hyouton/IField(locate(T.x,T.y,T.z))
					AA.layer=T.layer
					AA.Owner=src
			src.icon_state=""
	MakyouHyoushou()
		src.Handseals(5-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/X=8
		if(src.IceRush>75)
			if(prob(25))
				X=8
			else
				X=7
		if(src.IceRush>99)
			if(src.Charging)
				X=8
			else
				X=7
		if(src.IceRush>99&&src.SuitonKnowledge>650&&src.FuutonKnowledge>650)
			if(src.Charging)
				X=9
			else
				X=6
		src.icon_state="handseal"
		spawn(8)
			src.icon_state=""
		var/obj/Center=new /obj/
		Center.loc=src.loc;Center.density=0
		for(var/turf/T in oview(X,src))
			if(!(T in oview(X-1)))
				var/obj/Jutsu/Elemental/Hyouton/DemonMirror/A=new();A.health=4000+(src.IceRush*10)+(src.SuitonKnowledge+src.FuutonKnowledge);A.loc=locate(T.x,T.y,T.z);A.Owner=src;A.underlays+=src.hair;A.underlays+=src.overlays;A.underlays+=src.icon
				src.JutsuList+=A
		src.hyoushou=1;
		src.UnableToChargeChakra=1
		while(src.hyoushou&&!src.knockedout&&distance(src,Center)<20)
			var/ChakraLoss=(3000**(((distance(src,Center))/7)))
			if(ChakraLoss>5000) ChakraLoss=5000
			if(src.chakra>=0)
				src.ChakraDrain(ChakraLoss)
			else
				for(var/obj/Jutsu/Elemental/Hyouton/DemonMirror/S in src.JutsuList)
					del(S)
				src.hyoushou=0;src.UnableToChargeChakra=0
			sleep(11)
		src.hyoushou=0;src.UnableToChargeChakra=0
		for(var/obj/Jutsu/Elemental/Hyouton/DemonMirror/O in src.JutsuList)
			del(O)
	IcePrison()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		src.Handseals(42-src.HandsealSpeed)
		src.ChakraDrain(25000)
		if(get_dist(src,M)>6)
			src<<"They're too far away!";return
		if(src.WaterSpawn||src.WaterCheck())
			if(M in oview(6))
				src.Handseals(35-src.HandsealSpeed)
				if(src.HandsSlipped) return
				var/obj/Jutsu/Elemental/Hyouton/IcePrison/A=new();A.loc = locate(M.x,M.y,M.z);A.Owner=src;A.health=1000;A.JutsuLevel=1
				src<<"The Water forms into a cold ice around [M]!"
		else
			src<<"You need to be on water to utilize this Technique!";return