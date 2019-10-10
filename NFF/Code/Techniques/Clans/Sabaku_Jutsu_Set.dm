mob/var/tmp
	SunaNoTate=0
	SunaMode=0
	sphere=0
	usingS=0
	StruggleOutOfKyuu=35//was 50 going to try 40
	sandeye=0
	NotBlock=0
	SandWaterfallBurial=0

mob/var
	SunaReflexes=0
	AutoSphere=0
	AutoSatetsu=0
//New v4 passive that allows the user to immediately activate their Sand Sphere
//Skillcard by pressing Z and holding X. Z doesn't have to be held to keep it up
//But when X is released, the sphere is taken down. Still keeps true to the cooldown of the skillcard however.

mob/var/tmp/list/F=new
mob/proc/SandAmountPassiveCheck()
	src.MaxSandAmount=((src.SandPackage*25)+100)
	for(var/obj/Clothes/Gourd/O in usr.contents)
		if(O.worn)
			usr.MaxSandAmount+=SandCapacity*80

mob/proc/KyuuCatcher()
	if(src.ImmuneToDeath)
		src.StruggleOutOfKyuu=0
	if(src.FrozenBind=="Sand")
		src<<"Segure espaço rapidamente para se livrar disto!"
		while(src&&src.FrozenBind=="Sand"&&src.Struggle<src.StruggleOutOfKyuu)
			src.FrozenBind="Sand"
			if(src.NotBlock==1)
				src.icon_state=""
				src.Guarding=0
			sleep(5)
	src<<"Você quebrou a paralizia!";src.StruggleOutOfKyuu=0;src.Struggle=0;src.FrozenBind="";src.NotBlock=0
obj/proc/Sousou()
	var/obj/Jutsu/Sand/kyuu/ACDC=src
	var/mob/O=ACDC.Owner;flick("sousou",ACDC);var/damage=rand(O.nin*550,O.nin*600)//(O.nin*1000,O.nin*1500)
	if(O.Bijuu=="Shukaku"&&O.TailState>0) damage*=2
	for(var/mob/M in ACDC.loc)
		if(ACDC.NoBlock)
			M.DamageProc(damage/100,"Health",O)
		else
			M.DamageProc((damage/M.Endurance),"Health",O)
		spawn()
			M.Bloody();M.Bloody();M.Bloody()
	del(ACDC)
mob/Click()
	for(var/mob/Sand/SunaNoTate/B in world)
		if(B.Owner==usr)
			walk_towards(B,src,1)
			//sleep(70)
			//walk(B,0)
//	for(var/mob/M in world)
//		if(M==usr)
//			world<<"Mob/Click Walk_towards activated."
//			world<<"Mob using this is [M]. User is [usr]. The src of the proc is [src]."
//			walk_to(M,src,0,1)
//mob/Click()
//	world<<"Test." < But this works wtf?
//	..()
turf/Click()
	for(var/mob/Sand/SunaNoTate/B in world)
		if(B.Owner==usr)
			walk_to(B,src,,1)
obj/Click()
	for(var/mob/Sand/SunaNoTate/B in world)
		if(B.Owner==usr)
			walk_to(B,src,,1)
obj/Jutsu/Sand
	icon='Icons/Jutsus/Suna.dmi'
	Suna2
		icon = 'Icons/Jutsus/Suna2.dmi'
		icon_state = "straight"
		density = 1
		New()
			..()
			spawn(60)
			while(src)
				sleep(30)
				for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
				for(var/turf/water/A in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
				del(src)
	Spikes
		New()
			..()
			spawn()
				for(var/mob/M in src.loc)
					var/mob/O=src.Owner
					if(M==O||M.ingat|M.intank|M.Kaiten|M.sphere)
						return
					var/damage=rand(M.maxhealth*0.078,M.maxhealth*0.25);if(O.Bijuu=="Shukaku"&&O.TailState>0) damage*=2;M.SoundEngine('SFX/Slice.wav',5);M.DamageProc(damage,"Health",O)
					spawn()
						M.Bloody();M.Bloody();M.Bloody()
			spawn(30)
				del(src)
		North icon_state = "north";density=1
		South icon_state = "south";density=1
		West icon_state = "west";density=1
		East icon_state = "east";density=1
	Sphere
		density=1
		icon_state="SunaSphere"
		layer=MOB_LAYER+1
	SandWhip
		icon_state = "SandWhip"
		density=1
		New()
			..()
			spawn(13)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A;var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/damage=round(rand(M.maxstamina*0.15,M.maxstamina*0.20))
				if(O.Bijuu=="Shukaku"&&O.TailState>0)
					damage*=4
				M.DamageProc(damage,"Stamina",O,"sand","yellow")
				if(prob(O.NinjutsuKnowledge/25)||(O.Bijuu=="Shukaku"&&O.TailState>0)) //Was originally /200
					M.StunAdd(10)
					M.Running=0
			//	view()<<sound('SFX/HitStrong.wav',0,volume=35);view(M) << "[M] was hit by Sand for [damage] damage!!"
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	Sshuriken
		icon_state = "Shuriken"
		density=1
		var/Type=0
		New()
			..()
			spawn(20)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A;var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/damage=round(rand(75,200)) //This is meant to be stamina. Buffed the damage a bit though.
				if(src.icon_state=="Shuriken2")
					damage=round(rand(100,230)) //The reasoning is that these are just sand pellets until mastered where they have a slight edge
																			//Then it has a chance based on nin knowledge to cut the target. Lowered the delay also so its more practical.
				M.DamageProc(damage,"Stamina",O,"Suna Shuriken","yellow")
				if(src.icon_state=="Shuriken2")
					if(prob(O.NinjutsuKnowledge/50))
						spawn()M.Bloody()
						M.DamageProc(rand(75,80),"Health",O)
						view(M)<<sound('SFX/Slice.wav',0,volume=49)
				del(src)

			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	kyuu
		icon_state="KyuuTrail"
		density=1
		var/hit=0
		var/NoBlock=0
		New()
			var/mob/O=src.Owner
			spawn()
		//	var/mob/O=src.Owner
				while(src&&O.icon_state=="handseal")
					sleep(7)
					if(O.icon_state!="handseal")
						del(src)
				//	var/mob/O=src.Owner
					for(var/mob/A in src.loc)
						if(src.NoBlock==1)
							if(A.client&&(A in OnlinePlayers))
								A.icon_state=""
						else
							A.icon_state="Block"
					if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc)//added 11/16/12
						for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
							if(O.Shukaku==1&&O.Bijuu!="Shukaku")
								viewers(src)<<"A areia se desfaz na água";del(src) //people want the Sand to always be absorbed...sooo..GG
							else if(O.Bijuu!="Shukaku"&&O.TailState!=0)
								viewers(src)<<"A areia se desfaz na água.";del(src)
							if(O.Shukaku==0)
								viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						viewers(src)<<"The sand turns to mush.";del(src)
				if(O.icon_state!="handseal")
					del(src)
			spawn(220)
				if(src)
					del(src)
		Bump(A)
			..()
			if(isobj(A))
				var/obj/O=A
				if(O.density)
					src.density=0;sleep(11);src.density=1
				else
					..()
			if(ismob(A))
				var/mob/M=A;var/mob/O=src.Owner
				if(!src.hit)
					src.hit=1
					if(M!=O&&!M.knockedout)
						if(M.icon_state!="Block"&&!M.Guarding)
							src.NoBlock=1
						viewers(10,M) << "[M] Foi capturado pela areia!!";M.FrozenBind="Sand";M.caughtby="[O]";src.layer=MOB_LAYER+1;src.loc=M.loc;src.icon_state="KyuuCapture";walk(M,0);M.StruggleOutOfKyuu=rand(30,40)
						spawn() M.KyuuCatcher()
						spawn(100) del(src)
						for(var/obj/Jutsu/Sand/kyuutrail/L in world)
							if(L != src&&L.Owner==src.Owner)
								del(L)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Move()
			var/obj/Jutsu/Sand/kyuutrail/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;..()
		Del()
			var/mob/O=src.Owner
			for(var/mob/M in world)
				if(M&&M.caughtby=="[O]"&&M!=O)
					M.caughtby=null
					if(M.FrozenBind=="Sand")
						M.FrozenBind=""
			..()
	kyuutrail
		icon_state="KyuuTrail"
		density=1
		New()
			spawn(15)
				if(src)
					del(src)
	SandTurf
		icon_state = "sand"
		density = 0
		layer = MOB_LAYER+3
		var/list/PeopleCaught=list()
		New()
			spawn(220)
				del(src)
			..()
			spawn()
				while(src)
					sleep(5)
					for(var/mob/M in src.loc)
						if(!(M in PeopleCaught))
							if(M in OnlinePlayers)
								PeopleCaught+=M
						var/mob/O=src.Owner
						if(M==O)
							return
						if(!M.knockedout&&M.FrozenBind=="")
							M.StunAdd(15)
						if(prob(25))
							if(M.FrozenBind=="")
								M.FrozenBind="Sand Waterfall"
								spawn(20)
									M.FrozenBind=""
					for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
						var/mob/OO=src.Owner
						if(OO.Shukaku==1&&OO.Bijuu=="")
							viewers(src)<<"A areia se desfaz na água";del(src)
						else if(OO.Bijuu!="Shukaku"&&OO.TailState!=0)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					var/mob/OOO=src.Owner
					if(OOO.Shukaku==0)
						for(var/turf/water/A in src.loc)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						viewers(src)<<"A areia se desfaz na água.";del(src)
		Del()
			for(var/mob/P in PeopleCaught)
				if(P.FrozenBind=="Sand Waterfall")
					P.FrozenBind=""
			..()
	SandField
		icon_state = "sand"
		density = 0
		layer = MOB_LAYER+3
		var/PullingIn=0
		var/Shukaku=0
		New()
			spawn(220)
				del(src)
			..()
			spawn()
				while(src)
					sleep(10)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M==O)
							return
						PullingIn++
						if(PullingIn==1)
					//		walk_towards(M,O)
							step_to(M,O)
							PullingIn=0
						M.Running=0
					for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
						if(O.Shukaku==1&&O.Bijuu=="")
							viewers(src)<<"A areia se desfaz na água.";del(src)
						else if(O.Bijuu!="Shukaku"&&O.TailState!=0)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					if(O.Shukaku==0)
						for(var/turf/water/A in src.loc)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						viewers(src)<<"A areia se desfaz na água.";del(src)
	SandWave
		icon_state="Wave"
		density=0
		pixel_step_size=32
		Move()
			var/mob/O=src.Owner
			var/turf/prevloc=src.loc
			..()
			if(src.loc!=prevloc)
				var/obj/Jutsu/Sand/SandTurf/L=new()
				L.loc=src.loc;L.Owner=src.Owner
				O.JutsuList.Add(L)
	SandArm2
		icon = 'Icons/Jutsus/Suna3.dmi'
		icon_state = ""
		density = 1
		var
			first=0
			hit=0
		New()
			..()
			spawn(70)
				del(src)
		Move()
			var/obj/Jutsu/Sand/SandArmTrail2/L=new();L.loc = src.loc;L.dir = src.dir;L.Owner = src.Owner;..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A;var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/damage=round(rand(O.NinSkill*5,O.NinSkill*7.5));if(O.Bijuu=="Shukaku"&&O.TailState>0) damage*=2.5;M.DamageProc(damage,"Stamina",O);view(M)<<"[M] was hit by the Sand Arm!!";M.HitBack(10,src.dir)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	SandArmTrail2
		icon = 'Icons/Jutsus/Suna3.dmi'
		icon_state = "trail"
		density = 1
		New()
			..()
			spawn(70)
				del(src)
obj/Jutsu/Sant
	icon='Icons/Jutsus/Satetsu.dmi'
	Satetsu
		icon = 'Icons/Jutsus/Satetsu.dmi'
		icon_state = "straight"
		density = 1
		New()
			..()
			spawn(60)
			while(src)
				sleep(30)
				for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
				for(var/turf/water/A in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
				del(src)
	Spikes
		New()
			..()
			spawn()
				for(var/mob/M in src.loc)
					var/mob/O=src.Owner
					if(M==O||M.ingat|M.intank|M.Kaiten|M.sphere)
						return
					var/damage=rand(M.maxhealth*0.078,M.maxhealth*0.25);if(O.Bijuu=="Shukaku"&&O.TailState>0) damage*=2;M.SoundEngine('SFX/Slice.wav',5);M.DamageProc(damage,"Health",O)
					spawn()
						M.Bloody();M.Bloody();M.Bloody()
			spawn(30)
				del(src)
		North icon_state = "north";density=1
		South icon_state = "south";density=1
		West icon_state = "west";density=1
		East icon_state = "east";density=1
	SatetsuSphere
		density=1
		icon_state="SunaSphere"
		layer=MOB_LAYER+1
	SandWhip
		icon_state = "SandWhip"
		density=1
		New()
			..()
			spawn(13)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A;var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/damage=round(rand(M.maxstamina*0.15,M.maxstamina*0.20))
				if(O.Bijuu=="Shukaku"&&O.TailState>0)
					damage*=4
				M.DamageProc(damage,"Stamina",O,"sand","yellow")
				if(prob(O.NinjutsuKnowledge/25)||(O.Bijuu=="Shukaku"&&O.TailState>0)) //Was originally /200
					M.StunAdd(10)
					M.Running=0
			//	view()<<sound('SFX/HitStrong.wav',0,volume=35);view(M) << "[M] was hit by Sand for [damage] damage!!"
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	Satetsushuriken
		icon_state = "Shuriken"
		density=1
		var/Type=0
		New()
			..()
			spawn(20)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A;var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					return
				var/damage=round(rand(75,200)) //This is meant to be stamina. Buffed the damage a bit though.
				if(src.icon_state=="Shuriken2")
					damage=round(rand(100,230)) //The reasoning is that these are just sand pellets until mastered where they have a slight edge
																			//Then it has a chance based on nin knowledge to cut the target. Lowered the delay also so its more practical.
				M.DamageProc(damage,"Vitality",O,"Suna Shuriken","yellow")
				if(src.icon_state=="Shuriken2")
					if(prob(O.NinjutsuKnowledge/50))
						spawn()M.Bloody()
						M.DamageProc(rand(75,80),"Health",O)
						view(M)<<sound('SFX/Slice.wav',0,volume=49)
				del(src)

			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	satetsukyuu
		icon_state="KyuuTrail"
		density=1
		var/hit=0
		var/NoBlock=0
		New()
			var/mob/O=src.Owner
			spawn()
		//	var/mob/O=src.Owner
				while(src&&O.icon_state=="handseal")
					sleep(7)
					if(O.icon_state!="handseal")
						del(src)
				//	var/mob/O=src.Owner
					for(var/mob/A in src.loc)
						if(src.NoBlock==1)
							if(A.client&&(A in OnlinePlayers))
								A.icon_state=""
						else
							A.icon_state="Block"
					if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc)//added 11/16/12
						for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
							if(O.Shukaku==1&&O.Bijuu!="Shukaku")
								viewers(src)<<"A areia se desfaz na água";del(src) //people want the Sand to always be absorbed...sooo..GG
							else if(O.Bijuu!="Shukaku"&&O.TailState!=0)
								viewers(src)<<"A areia se desfaz na água.";del(src)
							if(O.Shukaku==0)
								viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						viewers(src)<<"The sand turns to mush.";del(src)
				if(O.icon_state!="handseal")
					del(src)
			spawn(220)
				if(src)
					del(src)
		Bump(A)
			..()
			if(isobj(A))
				var/obj/O=A
				if(O.density)
					src.density=0;sleep(11);src.density=1
				else
					..()
			if(ismob(A))
				var/mob/M=A;var/mob/O=src.Owner
				if(!src.hit)
					src.hit=1
					if(M!=O&&!M.knockedout)
						if(M.icon_state!="Block"&&!M.Guarding)
							src.NoBlock=1
						viewers(10,M) << "[M] Foi capturado pela areia!!";M.FrozenBind="Sand";M.caughtby="[O]";src.layer=MOB_LAYER+1;src.loc=M.loc;src.icon_state="KyuuCapture";walk(M,0);M.StruggleOutOfKyuu=rand(30,40)
						spawn() M.KyuuCatcher()
						spawn(100) del(src)
						for(var/obj/Jutsu/Sant/satetsukyuutrail/L in world)
							if(L != src&&L.Owner==src.Owner)
								del(L)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Move()
			var/obj/Jutsu/Sant/satetsukyuutrail/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;..()
		Del()
			var/mob/O=src.Owner
			for(var/mob/M in world)
				if(M&&M.caughtby=="[O]"&&M!=O)
					M.caughtby=null
					if(M.FrozenBind=="Sand")
						M.FrozenBind=""
			..()
	satetsukyuutrail
		icon_state="KyuuTrail"
		density=1
		New()
			spawn(15)
				if(src)
					del(src)
	SatetsuTurf
		icon_state = "sand"
		density = 0
		layer = MOB_LAYER+3
		var/list/PeopleCaught=list()
		New()
			spawn(220)
				del(src)
			..()
			spawn()
				while(src)
					sleep(5)
					for(var/mob/M in src.loc)
						if(!(M in PeopleCaught))
							if(M in OnlinePlayers)
								PeopleCaught+=M
						var/mob/O=src.Owner
						if(M==O)
							return
						if(!M.knockedout&&M.FrozenBind=="")
							M.StunAdd(15)
						if(prob(25))
							if(M.FrozenBind=="")
								M.FrozenBind="Sand Waterfall"
								spawn(20)
									M.FrozenBind=""
					for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
						var/mob/OO=src.Owner
						if(OO.Shukaku==1&&OO.Bijuu=="")
							viewers(src)<<"A areia se desfaz na água";del(src)
						else if(OO.Bijuu!="Shukaku"&&OO.TailState!=0)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					var/mob/OOO=src.Owner
					if(OOO.Shukaku==0)
						for(var/turf/water/A in src.loc)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						viewers(src)<<"A areia se desfaz na água.";del(src)
		Del()
			for(var/mob/P in PeopleCaught)
				if(P.FrozenBind=="Sand Waterfall")
					P.FrozenBind=""
			..()
	SatetsuField
		icon_state = "sand"
		density = 0
		layer = MOB_LAYER+3
		var/PullingIn=0
		var/Shukaku=0
		New()
			spawn(220)
				del(src)
			..()
			spawn()
				while(src)
					sleep(10)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M==O)
							return
						PullingIn++
						if(PullingIn==1)
					//		walk_towards(M,O)
							step_to(M,O)
							PullingIn=0
						M.Running=0
					for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
						if(O.Shukaku==1&&O.Bijuu=="")
							viewers(src)<<"A areia se desfaz na água.";del(src)
						else if(O.Bijuu!="Shukaku"&&O.TailState!=0)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					if(O.Shukaku==0)
						for(var/turf/water/A in src.loc)
							viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						viewers(src)<<"A areia se desfaz na água.";del(src)
	SatetsuWave
		icon_state="Wave"
		density=0
		pixel_step_size=32
		Move()
			var/mob/O=src.Owner
			var/turf/prevloc=src.loc
			..()
			if(src.loc!=prevloc)
				var/obj/Jutsu/Sant/SatetsuTurf/L=new()
				L.loc=src.loc;L.Owner=src.Owner
				O.JutsuList.Add(L)
mob/Sand
	icon='Icons/Jutsus/Suna.dmi'
	SunaNoTate
		name="Areia"
		icon_state="Sand1"
		var/StunChance=0
		health=500
		density=1
		MoveDelay=4
		layer=MOB_LAYER+1
		New()
			..()
			spawn()
			while(src)
				var/mob/O=src.Owner;sleep(11);src.Running=0
				if(src.Stun>0)
					if(prob(90))
						src.Stun--
				if(src.loc==O.loc)
					src.icon_state="Tate"
					src.dir=O.dir
				else
					src.icon_state="Sand1"
				if(O.Shukaku==0)
					for(var/obj/Jutsu/Elemental/Suiton/Owater/A in src.loc)
						if(src.icon_state!="Tate"&&O.Bijuu=="")
							viewers(src)<<"A areia se desfaz na água.";del(src)
					for(var/turf/water/A in src.loc)
						if(src.icon_state!="Tate"&&O.Bijuu=="")
							viewers(src)<<"A areia se desfaz na água.";del(src)
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
			spawn(1000)
				viewers(src)<<"A areia cai em pó.";del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M==O)
					src.loc=O.loc;return
				var/DamagePlus=rand(O.SandMastery*rand(1.1,1.5));var/damage=((src.nin+DamagePlus)/(M.Endurance/10))
				if(!src.firing)
					if(M.Kaiten)
						viewers(src)<<"A areia cai em pó.";del(src)
					spawn()AttackEfx(M.x,M.y,M.z);view(M)<<output("[M] was hit by the sand!([damage])","Attack")
					if(O.Bijuu=="Shukaku"&&O.TailState>0) damage*=3
					M.DamageProc(damage,"Stamina",O);viewers()<<sound('SFX/HitMedium.wav',0);src.firing=1
					if(StunChance==1)
						if(!M.knockedout)
							M.Stun+=pick(5,6)
					spawn(25)
						src.firing=0
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					return 0
			if(istype(A,/obj/))
				return 0
	Suna
		name="Areia"
		icon = 'Icons/Jutsus/Suna2.dmi'
		icon_state="head"
		health=10000000000000000000000000000
		density=1
		MoveDelay=1
		Running=1
		New()
			..()
			spawn()
			while(src)
				sleep(11)
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					viewers(src)<<"A areia se desfaz na água.";del(src)
			spawn(70)
				if(src.icon_state!="head")
					del(src)
		Del()
			flick("die",src)
			sleep(6)
			..()
		Move(Loc,Dir)
			var/prevdir=src.dir
			if(Dir!=prevdir&&Dir!=turn(prevdir,45)&&Dir!=turn(prevdir,-45)&&Dir!=turn(prevdir,90)&&Dir!=turn(prevdir,-90))
				return 0
			var/obj/Jutsu/Sand/Suna2/A = new()
			var/mob/O=src.Owner;var/ChakraLoss=(O.Mchakra*0.001);O.chakra-=ChakraLoss
			if(src.icon=='Icons/Jutsus/Suna3.dmi')
				A.icon='Icons/Jutsus/Suna3.dmi'
			A.loc=src.loc;A.dir=src.dir;A.Owner=src.Owner
			..()
			if(prevdir==src.dir)
				A.dir=prevdir
				if(src.dir==NORTHEAST||src.dir==NORTHWEST||src.dir==SOUTHWEST||src.dir==SOUTHEAST)
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=A.dir;B.icon_state="fillin"
					if(B.dir==NORTHEAST){B.pixel_x=16;B.pixel_y=16}
					if(B.dir==NORTHWEST){B.pixel_x=-16;B.pixel_y=16}
					if(B.dir==SOUTHEAST){B.pixel_x=16;B.pixel_y=-16}
					if(B.dir==SOUTHWEST){B.pixel_x=-16;B.pixel_y=-16}
			else if(prevdir==(turn(src.dir,180)))
				A.dir=prevdir
			else
				//Cardinal to Cardinal
				if(prevdir==NORTH&&src.dir==EAST)
					A.dir=EAST;A.icon_state="turn"
				if(prevdir==EAST&&src.dir==NORTH)
					A.dir=NORTH;A.icon_state="turn"
				if(prevdir==SOUTH&&src.dir==EAST)
					A.dir=SOUTH;A.icon_state="turn"
				if(prevdir==EAST&&src.dir==SOUTH)
					A.dir=WEST;A.icon_state="turn"
				if(prevdir==WEST&&src.dir==NORTH)
					A.dir=SOUTH;A.icon_state="turn"
				if(prevdir==NORTH&&src.dir==WEST)
					A.dir=WEST;A.icon_state="turn"
				if(prevdir==SOUTH&&src.dir==WEST)
					A.dir=NORTH;A.icon_state="turn"
				if(prevdir==WEST&&src.dir==SOUTH)
					A.dir=EAST;A.icon_state="turn"



				//Diagonal to Cardinal
				if(prevdir==NORTHEAST&&src.dir==NORTH)
					A.dir=SOUTHWEST;A.icon_state="turn"
				if(prevdir==NORTHWEST&&src.dir==NORTH)
					A.dir=SOUTHEAST;A.icon_state="turn"
				if(prevdir==SOUTHEAST&&src.dir==SOUTH)
					A.dir=NORTHWEST;A.icon_state="turn"
				if(prevdir==SOUTHWEST&&src.dir==SOUTH)
					A.dir=NORTHEAST;A.icon_state="turn"
				if(prevdir==NORTHEAST&&src.dir==EAST)
					A.dir=NORTHEAST;A.icon_state="turn 2"
				if(prevdir==NORTHWEST&&src.dir==WEST)
					A.dir=NORTHWEST;A.icon_state="turn 2"
				if(prevdir==SOUTHEAST&&src.dir==EAST)
					A.dir=SOUTHEAST;A.icon_state="turn 2"
				if(prevdir==SOUTHWEST&&src.dir==WEST)
					A.dir=SOUTHWEST;A.icon_state="turn 2"



				//Cardinal to Diagonal
				if(prevdir==NORTH&&src.dir==NORTHEAST)
					A.dir=NORTHEAST;A.icon_state="turn"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=16
				if(prevdir==NORTH&&src.dir==NORTHWEST)
					A.dir=NORTHWEST;A.icon_state="turn"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=16
				if(prevdir==SOUTH&&src.dir==SOUTHEAST)
					A.dir=SOUTHEAST;A.icon_state="turn"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=-16
				if(prevdir==SOUTH&&src.dir==SOUTHWEST)
					A.dir=SOUTHWEST;A.icon_state="turn"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=-16
				if(prevdir==EAST&&src.dir==NORTHEAST)
					A.dir=SOUTHWEST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=16
				if(prevdir==WEST&&src.dir==NORTHWEST)
					A.dir=SOUTHEAST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=16
				if(prevdir==EAST&&src.dir==SOUTHEAST)
					A.dir=NORTHWEST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=-16
				if(prevdir==WEST&&src.dir==SOUTHWEST)
					A.dir=NORTHEAST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=-16



				//Diagonal to Diagonal
				if(prevdir==NORTHWEST&&src.dir==NORTHEAST)
					A.dir=SOUTH;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=16
				if(prevdir==NORTHEAST&&src.dir==NORTHWEST)
					A.dir=NORTH;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=16
				if(prevdir==SOUTHEAST&&src.dir==SOUTHWEST)
					A.dir=NORTH;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=-16
				if(prevdir==SOUTHWEST&&src.dir==SOUTHEAST)
					A.dir=SOUTH;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=-16
				if(prevdir==NORTHEAST&&src.dir==SOUTHEAST)
					A.dir=WEST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=-16
				if(prevdir==NORTHWEST&&src.dir==SOUTHWEST)
					A.dir=WEST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=-16
				if(prevdir==SOUTHEAST&&src.dir==NORTHEAST)
					A.dir=EAST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=16;B.pixel_y=16
				if(prevdir==SOUTHWEST&&src.dir==NORTHWEST)
					A.dir=EAST;A.icon_state="turn 2"
					var/obj/Jutsu/Sand/Suna2/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=-16;B.pixel_y=16
		Bump(A)
			if(ismob(A))
				var/mob/M=A;var/mob/O=src.Owner;var/DamagePlus=rand(O.SandMastery*rand(1.5,2))
				if(src.icon=='Icons/Jutsus/Suna3.dmi')
					DamagePlus=rand(O.SandMastery*rand(2,3))
				var/damage=(((src.nin*rand(75,125))/M.Endurance)+DamagePlus)+rand(100,200)
				if(O.Bijuu=="Shukaku"&&O.TailState>0) damage*=3
				if(!src.firing)
					spawn()AttackEfx(M.x,M.y,M.z);M.DamageProc(damage,"Stamina",O);viewers()<<sound('SFX/HitMedium.wav',0);view(M)<<output("[M] was hit by the sand!([damage])","Attack");src.firing=1
					spawn(10)
						src.firing=0
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					return 0
			if(istype(A,/obj/Jutsu/Sand/Suna2/))
				var/obj/Jutsu/Sand/Suna2/B = A
				src.loc=B.loc
			if(istype(A,/obj/))
				return 0
mob/var/tmp/list/SandMonsters=list()
// Can possibly allow in future for multiple Suna Tates out at once, making Sabakus far more versatile.
//Also allows us to not have to loop through the whole world to find the object, saving lots of CPU usage
mob/proc
	SandCheck(Amount)
		var/turf/W = src.loc
		for(var/obj/Jutsu/Sand/SandTurf/T in W)
			return 1
		for(var/obj/Jutsu/Sand/SandField/F in W)
			return 1
		if(src.SandAmount>Amount)
			SandAmount-=Amount;
			return 1
	//	viewers(src)<<"Theres not enough sand to use this jutsu."
		return 0
	SantCheck(Amount)
		var/turf/W = src.loc
		for(var/obj/Jutsu/Sant/SatetsuTurf/T in W)
			return 1
		for(var/obj/Jutsu/Sant/SatetsuField/F in W)
			return 1
		if(src.SandAmount>Amount)
			SandAmount-=Amount;
			return 1
	//	viewers(src)<<"Theres not enough sand to use this jutsu."
		return 0

	Sandeye()
		if(!src.sandeye)
			src.Handseals(1-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.overlays-='Icons/Jutsus/Sand eye.dmi';src.overlays+='Icons/Jutsus/Sand eye.dmi';src.sandeye=1
			while(src.sandeye)
				src.ChakraDrain(100);sleep(11)
		else
			src.sandeye=0;src<<"Você para de usar o olho de Areia";src.overlays-='Icons/Jutsus/Sand eye.dmi'
	SunaNoTate()
		usr=src
		src.ChakraDrain(1000)
		if(src.SunaNoTate)
			src.SunaNoTate=0
			for(var/mob/Sand/SunaNoTate/B in src.SandMonsters)
				del(B)
			return
		else
			src.SunaNoTate=1
			var/mob/Sand/SunaNoTate/A=new();A.loc=src.loc;A.nin=src.nin;A.Owner=src;A.MoveDelay=5
			A.MoveDelay-=round(src.SandMastery/20)
			src.SandMonsters.Add(A)
			while(A)
				if(prob(1))
					src.SandMastery+=pick(0.01,0.1);if(src.SandMastery>100) src.SandMastery=100
				var/ChakraLoss=60-(src.SandMastery/3);src.ChakraDrain(ChakraLoss*1.3)
				sleep(11)
			src.SunaNoTate=0
	SunaBunshin()
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/GoodToGo=0
		for(var/mob/Sand/SunaNoTate/A in world)
			if(A.Owner==src)
				GoodToGo=1
		if(GoodToGo)
			for(var/mob/Sand/SunaNoTate/A in src.SandMonsters)
				A.icon='Icons/New Base/Base.dmi';A.overlays+=src.overlays;A.icon+=rgb(165,140,115)
				A.tai=src.tai*4;A.nin=src.nin*4;A.gen=src.gen*2;A.health=300000;A.StunChance=1
				src.ChakraDrain(1500)
		else
			src<<"Suna Tate deve estar fora!";return
	SunaShuriken(Uses)
		if(usr.Stun>=1|usr.DoingHandseals|src.Kaiten|usr.resting|usr.meditating|usr.sphere|usr.ingat|usr.firing)
			return
		else
			src.ChakraDrain(3000)
			src<<"Manter a tecla Z presionada fará a Shuriken de areia ser disparado a partir do seu monstro de areia em vez de você."
			if(Uses>=500)
				var/obj/Jutsu/Sand/Sshuriken/K=new();K.icon_state="Shuriken2";K.name="[src]";K.dir=src.dir;K.Owner=src;sleep(1)
				var/obj/Jutsu/Sand/Sshuriken/G=new();G.icon_state="Shuriken2";G.name="[src]";G.dir=src.dir;G.Owner=src;sleep(1)
				var/obj/Jutsu/Sand/Sshuriken/B=new();B.icon_state="Shuriken2";B.name="[src]";B.dir=src.dir;B.Owner=src
				if(src.Charging&&src.SandMonsters.len>0)
					src.ChakraDrain(3000)
					for(var/mob/Sand/SunaNoTate/A in src.SandMonsters)
						G.loc=A.loc;K.loc=A.loc;B.loc=A.loc;walk(K,A.dir);walk(G,A.dir);walk(B,A.dir)
				else
					G.loc=src.loc;K.loc=src.loc;B.loc=src.loc;walk(K,src.dir);walk(G,src.dir);walk(B,src.dir)
			else
				var/obj/Jutsu/Sand/Sshuriken/K=new();K.name="[src]";K.dir=src.dir;K.Owner=src
				var/obj/Jutsu/Sand/Sshuriken/G=new();G.name="[src]";G.dir=src.dir;G.Owner=src
				var/obj/Jutsu/Sand/Sshuriken/B=new();B.name="[src]";B.dir=src.dir;B.Owner=src
				G.loc=src.loc;K.loc=get_step(src,turn(src.dir,90));B.loc=get_step(src,turn(src.dir,-90));walk(K,src.dir);walk(G,src.dir);walk(B,src.dir)
	SatetsuShuriken(Uses)
		if(usr.Stun>=1|usr.DoingHandseals|src.Kaiten|usr.resting|usr.meditating|usr.sphere|usr.ingat|usr.firing)
			return
		else
			src.ChakraDrain(3000)
			src<<"Você atira uma shuriken."
			if(Uses>=500)
				var/obj/Jutsu/Sant/Satetsushuriken/K=new();K.icon_state="Shuriken2";K.name="[src]";K.dir=src.dir;K.Owner=src;sleep(1)
				var/obj/Jutsu/Sant/Satetsushuriken/G=new();G.icon_state="Shuriken2";G.name="[src]";G.dir=src.dir;G.Owner=src;sleep(1)
				var/obj/Jutsu/Sant/Satetsushuriken/B=new();B.icon_state="Shuriken2";B.name="[src]";B.dir=src.dir;B.Owner=src
				if(src.Charging&&src.SandMonsters.len>0)
					src.ChakraDrain(3000)
					for(var/mob/Sand/SunaNoTate/A in src.SandMonsters)
						G.loc=A.loc;K.loc=A.loc;B.loc=A.loc;walk(K,A.dir);walk(G,A.dir);walk(B,A.dir)
				else
					G.loc=src.loc;K.loc=src.loc;B.loc=src.loc;walk(K,src.dir);walk(G,src.dir);walk(B,src.dir)
			else
				var/obj/Jutsu/Sant/Satetsushuriken/K=new();K.name="[src]";K.dir=src.dir;K.Owner=src
				var/obj/Jutsu/Sant/Satetsushuriken/G=new();G.name="[src]";G.dir=src.dir;G.Owner=src
				var/obj/Jutsu/Sant/Satetsushuriken/B=new();B.name="[src]";B.dir=src.dir;B.Owner=src
				G.loc=src.loc;K.loc=get_step(src,turn(src.dir,90));B.loc=get_step(src,turn(src.dir,-90));walk(K,src.dir);walk(G,src.dir);walk(B,src.dir)
	SunaWhip()
		if(usr.Stun>=1|usr.DoingHandseals|src.Kaiten|usr.resting|usr.meditating|usr.sphere|usr.ingat|usr.firing)
			return
		else
			src.ChakraDrain(15000)
			var/obj/Jutsu/Sand/SandWhip/K=new();K.name="[src]";K.dir=src.dir;K.Owner=src;sleep(1)
			K.loc=src.loc;walk(K,src.dir)
	Sunasoujuu()
		if(!src.SunaMode)
			var/turf/T = get_step(src,src.dir)
			var/mob/Sand/Suna/P=new();P.icon='Icons/Jutsus/Suna2.dmi';P.loc=T;P.Owner=src;src.controlled=P;P.dir=src.dir;P.nin=src.nin;src.SunaMode=1
			//if(src.Shukaku) P.icon='Icons/Jutsus/Suna3.dmi'
	SandSphere(Uses)
		if(Uses>=2500)
			src.AutoSphere=1
		if(src.firing|src.resting)
			return
//		src.SandCheck(30)
		if(!src.sphere)
			src.FrozenBind="Jutsu";src.firing=0
			var/obj/Jutsu/Sand/Sphere/A=new();A.loc=src.loc;flick("SunaSphere2",A);A.Owner=src;src.sphere=1
			while(src.sphere)
				for(var/obj/Jutsu/Elemental/Suiton/Owater/AXAX in src.loc)
					if(src.Bijuu!="Shukaku")
						viewers(src)<<"A areia torna-se pesado devido à água, tendo um pedágio em seu chakra."
						src.ChakraDrain(150)
				for(var/obj/Jutsu/Kiriame/S2 in oview(1))
					viewers(src)<<"A areia se desfaz na água."
					src.FrozenBind="";src.firing=0;src.sphere=0
					for(var/obj/Jutsu/Sand/Sphere/ZzZ in world)
						if(ZzZ.Owner== src)
							del(ZzZ)
				for(var/turf/water/AXAX in oview(1))
					if(src.Bijuu!="Shukaku")
						viewers(src)<<"A areia torna-se pesado devido à água, tendo um pedágio em seu chakra."
						src.chakra-=rand(15,40)
				var/ChakraDrain=5;src.chakra-=ChakraDrain
				if(src.chakra<ChakraDrain)
					src.FrozenBind="";src.firing=0;src.sphere=0
					for(var/obj/Jutsu/Sand/Sphere/ZzZ in world)
						if(ZzZ.Owner== src)
							del(ZzZ)
					src.usingS=0;return
				else
					sleep(4)
	SatetsuSphere(Uses)
		if(Uses>=2500)
			src.AutoSatetsu=1
		if(src.firing|src.resting)
			return
//		src.SandCheck(30)
		if(!src.sphere)
			src.FrozenBind="Jutsu";src.firing=0
			var/obj/Jutsu/Sant/SatetsuSphere/A=new();A.loc=src.loc;flick("SunaSphere",A);A.Owner=src;src.sphere=1
			while(src.sphere)
				for(var/obj/Jutsu/Elemental/Suiton/Owater/AXAX in src.loc)
					if(src.Bijuu!="Shukaku")
						viewers(src)<<"A areia torna-se pesado devido à água, tendo um pedágio em seu chakra."
						src.ChakraDrain(150)
				for(var/obj/Jutsu/Kiriame/S2 in oview(1))
					viewers(src)<<"A areia se desfaz na água."
					src.FrozenBind="";src.firing=0;src.sphere=0
					for(var/obj/Jutsu/Sant/SatetsuSphere/ZzZ in world)
						if(ZzZ.Owner== src)
							del(ZzZ)
				for(var/turf/water/AXAX in oview(1))
					if(src.Bijuu!="Shukaku")
						viewers(src)<<"A areia torna-se pesado devido à água, tendo um pedágio em seu chakra."
						src.chakra-=rand(15,40)
				var/ChakraDrain=5;src.chakra-=ChakraDrain
				if(src.chakra<ChakraDrain)
					src.FrozenBind="";src.firing=0;src.sphere=0
					for(var/obj/Jutsu/Sant/SatetsuSphere/ZzZ in world)
						if(ZzZ.Owner== src)
							del(ZzZ)
					src.usingS=0;return
				else
					sleep(4)
	SandAttack()
		set background = 1
		if(src.usingS==0)
			src.ChakraDrain(350)
			src.usingS=1
			var/obj/Jutsu/Sand/Spikes/North/N=new();N.Owner=src;N.loc=locate(src.x,src.y+1,src.z);var/obj/Jutsu/Sand/Spikes/South/S=new();S.Owner=src;S.loc=locate(src.x,src.y-1,src.z)
			var/obj/Jutsu/Sand/Spikes/West/W=new();W.Owner=src;W.loc=locate(src.x-1,src.y,src.z);var/obj/Jutsu/Sand/Spikes/East/E=new();E.Owner=src;E.loc=locate(src.x+1,src.y,src.z)
		else
			spawn()
				for(var/obj/Jutsu/Sand/Spikes/N in world)
					if(N.Owner==src)
						del(N)
			sleep(11);src.usingS=0
	SatetsuAttack()
		set background = 1
		if(src.usingS==0)
			src.ChakraDrain(350)
			src.usingS=1
			var/obj/Jutsu/Sant/Spikes/North/N=new();N.Owner=src;N.loc=locate(src.x,src.y+1,src.z);var/obj/Jutsu/Sant/Spikes/South/S=new();S.Owner=src;S.loc=locate(src.x,src.y-1,src.z)
			var/obj/Jutsu/Sant/Spikes/West/W=new();W.Owner=src;W.loc=locate(src.x-1,src.y,src.z);var/obj/Jutsu/Sant/Spikes/East/E=new();E.Owner=src;E.loc=locate(src.x+1,src.y,src.z)
		else
			spawn()
				for(var/obj/Jutsu/Sand/Spikes/N in world)
					if(N.Owner==src)
						del(N)
			sleep(11);src.usingS=0
	SabakuKyuu()
		var/mob/M=src.target
		src<<"Manter a tecla Z precionada fará com que o seu monstro de areia use o kyuu em vez de você."
		if(src.firing||src.FrozenBind=="Shibari")
			return
		if(src.target!=null)
			if(M.FrozenBind=="Sand")
				src<<"Ja foi pego!";return
		src.ChakraDrain(19500);src.icon_state="handseal";var/obj/Jutsu/Sand/kyuu/K=new()
		if(src.Charging)
			for(var/mob/Sand/SunaNoTate/A in src.SandMonsters)
				K.loc=A.loc;walk_towards(K,M,2);K.Owner=usr
		else
			K.loc=src.loc;walk_towards(K,M,2);K.Owner=usr
//		spawn(100)
//			if(src.Frozen==1)
//				src.Frozen=0
	SatetsuKyuu()
		var/mob/M=src.target
		src<<"Manter a tecla Z precionada fará com que o seu monstro de areia use o kyuu em vez de você."
		if(src.firing||src.FrozenBind=="Shibari")
			return
		if(src.target!=null)
			if(M.FrozenBind=="Sand")
				src<<"Ja foi pego!";return
		src.ChakraDrain(19500);src.icon_state="handseal";var/obj/Jutsu/Sant/satetsukyuu/K=new()
		if(src.Charging)
			for(var/mob/Sand/SunaNoTate/A in src.SandMonsters)
				K.loc=A.loc;walk_towards(K,M,2);K.Owner=usr
		else
			K.loc=src.loc;walk_towards(K,M,2);K.Owner=usr
	SabakuSousou()
		if(src.FrozenBind=="Shibari")
			return
		src.ChakraDrain(35500);src.icon_state=""
		for(var/obj/Jutsu/Sand/kyuu/L in world)
			if(L.Owner==src)
				L.Sousou()
	SatetsuSousou()
		if(src.FrozenBind=="Shibari")
			return
		src.ChakraDrain(35500);src.icon_state=""
		for(var/obj/Jutsu/Sant/satetsukyuu/L in world)
			if(L.Owner==src)
				L.Sousou()
	SandArm()
		if(src.firing||src.Kaiten == 1)
			return
		else
			src.ChakraDrain(16500)
			spawn(70)
				src.firing=0;src.Frozen=0
			flick("Attack1",src);var/obj/Jutsu/Sand/SandArm2/K=new();K.loc=get_step(src,src.dir);K.Move_Delay=1;K.dir=src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir)
	Bakuryu_Ryusa(Uses)
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/Distance=2
		if(Uses>100) Distance++
		if(Uses>250) Distance++
		if(Uses>550) Distance+=2
		var/GG=20*Distance
		SandCheck(GG)
		src.ChakraDrain(33000);sleep(1);src.icon_state="handseal"
		for(var/turf/T in range(Distance,src))
			if(src.dir==NORTH||src.dir==SOUTH)
				if(T.y==src.y)
					var/obj/Jutsu/Sand/SandWave/A=new();A.name="[src]";A.Owner=src;A.JutsuLevel=1;A.loc=T;A.dir=src.dir;walk(A,src.dir)
					src.JutsuList.Add(A)
			if(src.dir==WEST||src.dir==EAST)
				if(T.x==src.x)
					var/obj/Jutsu/Sand/SandWave/A=new();A.name="[src]";A.Owner=src;A.JutsuLevel=1;A.loc=T;A.dir=src.dir;walk(A,src.dir)
					src.JutsuList.Add(A)
		src.firing=1
		spawn(20)
			src.icon_state=""
			src.firing=0
		spawn(250)
			for(var/obj/Jutsu/Sand/SandWave/S2 in src.JutsuList)
				del(S2)

	Sabaku_Taisou()
		if(src.firing||src.knockedout)
			return
		src.ChakraDrain(250)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		sleep(2);src.icon_state=""
		for(var/obj/Jutsu/Sand/SandTurf/S in src.JutsuList)
			spawn()
				for(var/mob/M in S.loc)
					spawn()
						if(M.ImmuneToDeath)
							del(src)
						if(M!=src)
							var/damage=rand(src.nin*1500,src.nin*2500);damage=damage/(M.Endurance/5);M.DamageProc(damage,"Health",src)
							M.Bloody();M.Bloody();M.Bloody();M.Bloody()
							if(M.FrozenBind=="Sand Waterfall")
								M.FrozenBind=""
			S.icon_state="shock"
			spawn(9)
				if(S)
					S.icon_state="sand"
		sleep(50)
		src.firing=0
		for(var/obj/Jutsu/Sand/SandTurf/S in src.JutsuList)
			del(S)
	Satetsu_Taisou()
		if(src.firing||src.knockedout)
			return
		src.ChakraDrain(250)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		sleep(2);src.icon_state=""
		for(var/obj/Jutsu/Sant/SatetsuTurf/S in src.JutsuList)
			spawn()
				for(var/mob/M in S.loc)
					spawn()
						if(M.ImmuneToDeath)
							del(src)
						if(M!=src)
							var/damage=rand(src.nin*1500,src.nin*2500);damage=damage/(M.Endurance/5);M.DamageProc(damage,"Health",src)
							M.Bloody();M.Bloody();M.Bloody();M.Bloody()
							if(M.FrozenBind=="Sand Waterfall")
								M.FrozenBind=""
			S.icon_state="shock"
			spawn(9)
				if(S)
					S.icon_state="sand"
		sleep(50)
		src.firing=0
		for(var/obj/Jutsu/Sant/SatetsuTurf/S in src.JutsuList)
			del(S)
	Sabaku_SandField()
		src.F=new;
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.ChakraDrain(10000);
		sleep(1);
		src.icon_state="handseal"
		var/X=0
		var/obj/Jutsu/Sand/SandField/C=new();
		C.Owner=src;
		C.loc=src.loc;
		C.layer = MOB_LAYER-1;
		src.F.Add(C);
		C.Shukaku=src.Shukaku;
		while(X<8&&src.icon_state=="handseal")
			for(var/turf/D in oview(X,src))
				if(!(D in oview(X-1)))
					var/obj/Jutsu/Sand/SandField/B=new();B.Owner=src;B.loc=D;B.Shukaku=src.Shukaku;
					src.F.Add(B)
			X++
			sleep(6)
		if(src.icon_state=="handseal")
			src.icon_state="running"
	Sabaku_SandFieldBurial()
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.ChakraDrain(50000);sleep(1);src.icon_state="handseal"
		src.firing=1;
		for(var/obj/Jutsu/Sand/SandField/B in src.F)
			spawn()
				for(var/mob/M in B.loc)
					var/Distance=get_dist(usr,M)
					spawn()
						if(M!=src)
							var/damage=rand((src.nin*1500/Distance),(src.nin*3000/Distance));damage=damage/M.Endurance;M.DamageProc(damage,"Health",src) //Was Originally var/damage=rand(src.nin*1500,src.nin*2500)
							M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();
			B.icon_state="shock"
			spawn(9)
				if(B)
					B.icon_state="sand"
		sleep(50)
		src.firing=0
		var/T=0;
		for(var/obj/Jutsu/Sand/SandField/C in src.F)
			del(C)
			T++;
			if(T>=5)
				T=0;
				sleep(2)
		spawn()
			src.F=new
		src.firing=0;
	Satetsu_SandField()
		src.F=new;
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.ChakraDrain(10000);
		sleep(1);
		src.icon_state="handseal"
		var/X=0
		var/obj/Jutsu/Sant/SatetsuField/C=new();
		C.Owner=src;
		C.loc=src.loc;
		C.layer = MOB_LAYER-1;
		src.F.Add(C);
		C.Shukaku=src.Shukaku;
		while(X<8&&src.icon_state=="handseal")
			for(var/turf/D in oview(X,src))
				if(!(D in oview(X-1)))
					var/obj/Jutsu/Sant/SatetsuField/B=new();B.Owner=src;B.loc=D;B.Shukaku=src.Shukaku;
					src.F.Add(B)
			X++
			sleep(6)
		if(src.icon_state=="handseal")
			src.icon_state="running"
	Satetsu_SandFieldBurial()
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.ChakraDrain(50000);sleep(1);src.icon_state="handseal"
		src.firing=1;
		for(var/obj/Jutsu/Sant/SatetsuField/B in src.F)
			spawn()
				for(var/mob/M in B.loc)
					var/Distance=get_dist(usr,M)
					spawn()
						if(M!=src)
							var/damage=rand((src.nin*1500/Distance),(src.nin*3000/Distance));damage=damage/M.Endurance;M.DamageProc(damage,"Health",src) //Was Originally var/damage=rand(src.nin*1500,src.nin*2500)
							M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();
			B.icon_state="shock"
			spawn(9)
				if(B)
					B.icon_state="sand"
		sleep(50)
		src.firing=0
		var/T=0;
		for(var/obj/Jutsu/Sant/SatetsuField/C in src.F)
			del(C)
			T++;
			if(T>=5)
				T=0;
				sleep(2)
		spawn()
			src.F=new
		src.firing=0;
	Erosion()
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.ChakraDrain(10000);sleep(1);src.icon_state="beastman"
		src.Frozen=1;
		src.firing=1;
		src.SandAmountPassiveCheck()
		for(var/obj/Jutsu/Elemental/Doton/B in view(10,src))
			if(B.Owner==src)
				spawn()
					var/obj/Jutsu/Sand/SandTurf/S;S.Owner=src;S.loc=B.loc
					del(B)
					src.SandAmount+=10
					if(src.SandAmount>src.MaxSandAmount)
						src.SandAmount=src.MaxSandAmount
		src.icon_state=""
		src.Frozen=0;
		src.firing=0;
