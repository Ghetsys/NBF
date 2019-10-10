var/bubbleNumber = 1
obj/Drown//obj/Drown/UnderWater
	layer = 501
	screen_loc = "1,1 to 19,19"
	UnderWater
		icon = 'Map/Turfs/Drown.dmi'
		icon_state = "Water"
mob/var/tmp
	StruggleAgainstSyrup=0
	ImmuneToSyrup=0
	WaterSharksLeft=0
	WhirlPoolSetUp=0
	WhirlPoolMode=0
mob/proc/SyrupCatcher()
	if(src.FrozenBind=="Syrup")
		src<<"Pressione espaço rapidamente para sair!"
		while(src&&src.FrozenBind=="Syrup"&&src.Struggle<src.StruggleAgainstSyrup)
			src.FrozenBind="Syrup"
			sleep(3)
	src<<"You broke out of the Syrup!";src.StruggleAgainstSyrup=0;src.FrozenBind=""
	src.ImmuneToSyrup=1
	spawn(300)
		src.ImmuneToSyrup=0
	if(!src.knockedout)
		src.Struggle=0
obj/wateredges
	icon = 'Icons/BeachSaved.dmi'
	layer = TURF_LAYER
	density = 0
	New()
		..()
		spawn(600)
			del(src)
	a
		icon_state = "Shore1"
	b
		icon_state = "Shore3"
	c
		icon_state = "Shore4"
	d
		icon_state = "Shore2"
	e
		icon_state = "Shore5"
	f
		icon_state = "Shore6"
	g
		icon_state = "Shore8"
	h
		icon_state = "Shore7"
obj/Jutsu/Elemental/Suiton
	icon='Icons/Jutsus/SuitonTechniques.dmi'
	icon_state="water235"
	Element="Suiton"
	var
		Electrocuted=0
	WaterfallOverlay
		icon='Icons/waterfall.dmi'
		icon_state="4"
		layer=MOB_LAYER+2
		dir=NORTH
		var
			prestep=0
			laststep=0
		New()
			..()
			overlays+=/obj/Jutsu/Elemental/Suiton/WaterfallOverlay/A;overlays+=/obj/Jutsu/Elemental/Suiton/WaterfallOverlay/B
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/waterfall.wav',10,60)
			spawn(30)
				del(src)
		A
			icon_state="2";pixel_x = 32
		B
			icon_state="3";pixel_x = -32
	Owater
		icon = 'Icons/BeachSaved.dmi'
		icon_state="water235"
		layer = TURF_LAYER
		density=0
		Element=""
		speeding=0
		New()
			..()
			spawn(2)
				for(var/turf/T in oview(1,src))
					if(!(locate(/obj/Jutsu/Elemental/Suiton/Owater) in T))
						var/L
						if(get_dir(src,T)==NORTH)
							L = "a"
						if(get_dir(src,T)==SOUTH)
							L = "d"
						if(get_dir(src,T)==WEST)
							L = "b"
						if(get_dir(src,T)==EAST)
							L = "c"
						if(get_dir(src,T)==NORTHEAST)
							L = "f"
						if(get_dir(src,T)==SOUTHEAST)
							L = "g"
						if(get_dir(src,T)==NORTHWEST)
							L = "e"
						if(get_dir(src,T)==SOUTHWEST)
							L = "h"
						var/P = text2path("/obj/wateredges/[L]")
						var/obj/wateredges/A = new P
						A.loc = T
			spawn(600)
				del(src)
		MouseEntered()
		//	world<<"Test. [usr]"
			if(usr.Guiding!=null&&usr.Guiding!="")
				for(var/mob/Kibaku/K in world)
					if(usr.Guiding==K)
						walk_towards(K,src)
			if(usr.UsingAmaterasu)
				for(var/obj/Jutsu/Uchiha/AMA/T in world)
					if(T.Owner==usr)
						walk_towards(T,src)
			..()
	//	DblClick()
	//			if(usr.WhirlPoolSetUp)
	//				usr.WhirlPoolSetUp=0
	//				usr<<"Use your mouse to move across the water to place dangerous torrents of water!"
	//				usr.UsingWhirlPoolMode()
	//		..()
	Dwater
		icon = 'Icons/BeachSaved.dmi'
		icon_state="water235"
		layer = TURF_LAYER
		density=0
		Element=""
		speeding=0
		Owner
		var/nin=10
		var/obj/J
		New()
			..()
			spawn(1)
				for(var/turf/T in oview(1,src))
					if(!(locate(/obj/Jutsu/Elemental/Suiton/Owater) in T))
						var/L="a"
						if(get_dir(src,T)==NORTH)
							L = "a"
						if(get_dir(src,T)==SOUTH)
							L = "d"
						if(get_dir(src,T)==WEST)
							L = "b"
						if(get_dir(src,T)==EAST)
							L = "c"
						if(get_dir(src,T)==NORTHEAST)
							L = "f"
						if(get_dir(src,T)==SOUTHEAST)
							L = "g"
						if(get_dir(src,T)==NORTHWEST)
							L = "e"
						if(get_dir(src,T)==SOUTHWEST)
							L = "h"
						var/P = text2path("/obj/wateredges/[L]")
						var/obj/wateredges/A = new P
						A.loc = T
				while(src)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M in OnlinePlayers)
					//	if(M==src.Owner)
					//		return
							var/damage=round((O.nin*1.3)+50);
							if(M.icon_state=="Block")
								damage/=10
							if(M==src.Owner)
								damage/=2
							M.DamageProc(damage,"Stamina",src.Owner)
							sleep(3)
							step_to(M,J)
					sleep(5)
			spawn(300)
				del(src)
	SuitonSuijinheki
		density=1
	//	opacity=1
		layer=MOB_LAYER+1
		New()
			..()
			spawn()
				while(src)
					sleep(10)
					for(var/mob/M in src.loc)
						if(M in OnlinePlayers)
							del(src)
			flick("2rise",src)
			spawn(600)
				del(src)
		Del()
			spawn()
				src.CreateBubbles("Medium")
			..()
		Part1 icon_state="1"
		Part2 icon_state="2"
		Part3 icon_state="3"

	StickySyrup
		icon='Icons/Jutsus/Syrup.dmi'
		icon_state=""
		density=0
		layer=TURF_LAYER
		var/Counted=0
		var/list/Captured=list()
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				while(src)
					for(var/mob/M in src.loc)
						if(M.ImmuneToDeath)
							del(src)
							return
						if(M!=O&&!M.knockedout)
							if(M.Mogu)
								M.StunAdd(10)
								if(M.Stun>10)
									M.Stun=10
								M.DamageProc(50,"Health",O)
							else if(M.FrozenBind!="Syrup"&&!M.ImmuneToSyrup&&!M.InHydro)
								M.Running=0;M.FrozenBind="Syrup";M.StruggleAgainstSyrup=35;M<<"You've been captured by Syrup! Press Space rapidly to struggle out of it!"
								src.Captured.Add(M)
								spawn()
									M.SyrupCatcher()
					sleep(11)
					for(var/mob/MM in src.Captured)
						if(MM.loc!=src.loc)
							src.Captured.Remove(MM)
							MM.FrozenBind=""
					if(!src.Counted)
						var/Count=0
						for(var/mob/M in oview(3,src))
							if(M.FrozenBind=="Syrup")
								Count++
						if(Count>=2)
							O.AwardMedal("Waffles")
						Counted=1
			spawn(300)
				del(src)
		Del()
			for(var/mob/M in src.Captured)
				if(M.FrozenBind=="Syrup")
					M.FrozenBind=""
			..()
	SyrupWave
		icon='Icons/Jutsus/Syrup.dmi'
		icon_state="Wave"
		density=0
		layer=TURF_LAYER
		var/Edge=0
		var/FirstTile=0
		New()
			..()
			spawn(6)
				del(src)
		Del()
			var/obj/Jutsu/Elemental/Suiton/StickySyrup/L=new()
			L.loc=src.loc;L.Owner=src.Owner
			if(src.dir==NORTH) L.icon_state="[src.Edge-6]"
			if(src.dir==SOUTH) L.icon_state="[src.Edge+6]"
			if(src.dir==WEST) L.icon_state="[src.Edge-2]"
			if(src.dir==EAST) L.icon_state="[src.Edge+2]"
			..()
		Move()
			var/obj/Jutsu/Elemental/Suiton/StickySyrup/L=new()
			L.loc=src.loc;L.Owner=src.Owner
			if(src.dir==NORTH)
				if(!src.FirstTile)
					src.FirstTile=1;L.icon_state="[src.Edge]"
				else
					L.icon_state="[src.Edge-3]"
			if(src.dir==SOUTH)
				if(!src.FirstTile)
					src.FirstTile=1;L.icon_state="[src.Edge]"
				else
					L.icon_state="[src.Edge+3]"
			if(src.dir==WEST)
				if(!src.FirstTile)
					src.FirstTile=1;L.icon_state="[src.Edge]"
				else
					L.icon_state="[src.Edge-1]"
			if(src.dir==EAST)
				if(!src.FirstTile)
					src.FirstTile=1;L.icon_state="[src.Edge]"
				else
					L.icon_state="[src.Edge+1]"
			..()
	MizuTeppo
		icon='Icons/Jutsus/Water Gun.dmi'
		icon_state="Projectile"
		density=1
		Move_Delay=0
		pixel_step_size=16
		var/nin=10
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A;var/mob/O=src.Owner;var/damage=O.nin*(95) //was originally 65
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 100
					src.loc = null
					return
				var/WaterChakra=WaterDamage(O)
				damage=round((damage)*((WaterChakra*0.02)+0.9));damage=damage/(M.Endurance)
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*2)
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
			//	M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Health",O,"Water Gun","blue")
			//	view(M)<<output("<font color=blue size=2>[M] has been hit by Water Gun!([damage])</font>","Attack")
				if(M.RaiArmor)
					M.StunAdd(10)
				//	M.DamageProc(500,"Health",O)
					M.DamageProc(500,"Health",O,"Water Gun","blue")
				M.HitBack(3,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Paper/))
					del(A)
				if(istype(A,/obj/Jutsu/Sand/))
					del(A)
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				del(src)
		Del()
			spawn()
				src.CreateBubbles("Light")
			..()
	Bubble
		var/air = 15
		var/mob_entered = 0
		var/bubbleID=0
		icon = 'Icons/Jutsus/Bubble_updated.dmi'
		icon_state="ball"
		var/nin=10
		layer = 5
		var/list/Followers[0]
		var/list/checkingList[0]
		proc
			Air()
				while(src)
					sleep(3)
					var/mob/A=src.Owner
					if(src)
						var/mobcount =0
						for(var/mob/M in Followers)
							if(M!=Owner)
								mobcount++
						air -=mobcount
						if(src&& air<=0)
							for(var/mob/M in Followers)
								var/damage = (100 * ((A.nin/12)/2))
								M.DamageProc(damage,"Stamina",Owner,"lack of oxygen","grey")


			Follow(mob/M)
				while(src)
					var/inbubble = 0
					var/i = 1
					for(i=1;i<=Followers.len;i++)
						if(M==Followers[i])
							inbubble = 1
					if(inbubble ==0)
						return
					else
						M.loc=src.loc
					sleep(1)
			Check_Mob()
				while(src)
					sleep(3)
					var/list/testing[0]
					testing = view(0,src)
					if(ismob(testing[testing.len]))
						var/mob/M =testing[testing.len]
						if((M.x==src.x)||(M.y==src.y)||(M.z==src.z))
							if(M!=Owner&&mob_entered == 0)
								Followers.Add(M)
								spawn() Air()
								spawn() Follow(M)
								mob_entered = 1
								if(M.key)
									sleep(1)
									M.client.Northeast()
									M.client.Northwest()
									M.client.Southeast()
									M.client.Southwest()
									M.client.North()
									M.client.East()
									M.client.West()
									M.client.South()
						if((M.x!=src.x)||(M.y!=src.y)||(M.z!=src.z))
							Followers.Remove(M)



		New()
			sleep(3)
			walk_rand(src,2)
			bubbleID = bubbleNumber
			bubbleNumber++
			src.Check_Mob()
			src.Follow()
			src.Air()
			spawn(250)
				del(src)
			..()
	BubbleBeamTrail
		icon='Icons/Jutsus/Bubble_updated.dmi'
		icon_state = "trail"
		New()
			..()
			spawn(5)
				del(src)
	BubbleBeamBall
		icon='Icons/Jutsus/Bubble_updated.dmi'
		icon_state = "ball"
		density = 1
		layer = MOB_LAYER+1
		var/nin=10
		New()
			..()
			spawn(70)
				del(src)

		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Owner
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new()
				Z.loc=M.loc;Z.JutsuLevel=src.JutsuLevel
				if(M.Kaiten||M.sphere)
					del(src)
					return
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 200
					src.loc = null
					return
				var/damage=src.nin*rand(95,230)
	//			var/mob/O = src.Owner
				damage=round((damage)*((O.WaterChakra*0.1)+0.6))
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				damage/=(M.Endurance/1.5)
				if(O.Trait=="Old Powerful") damage+=(O.GenSkill*8)
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(damage>1500)
					damage=1500
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
			//	M.DamageProc(damage,"Stamina",O)
				M.DamageProc(damage,"Stamina",O,"large bubble","blue")
				M.HitBack(pick(4,6),src.dir)
				if(M.RaiArmor)
					M.StunAdd(10)
					M.DamageProc(500,"Health",O)
			//	view(M)<<output("[M] was hit by Suiton Suikoudan!([damage])", "Attack")
				//	var/damage = 200
			//	M.DamageProc(damage,"Health",O,"bubble","blue")
			//	view(M)<<output("[M] was hit by a bubble.")
				src.icon_state= "popping"
				sleep(1)
		//		del(src)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new();Z.loc=src.loc;Z.JutsuLevel=src.JutsuLevel
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan))
					return
				else
					if(istype(A,/obj/Jutsu/Paper/))
						del(A)
					if(istype(A,/obj/Doors/))
						var/obj/O=A
						O.DamageProc(src.nin)
						del(src)
					if(istype(A,/obj/Jutsu/Sand/))
						del(A)
					del(src)


		Move()

			var/obj/Jutsu/Elemental/Suiton/BubbleBeamTrail/L=new()
			L.icon = src.icon;L.loc = src.loc;L.Owner = src.Owner
			..()

		Del()
			src.icon_state= "popping"
			spawn()
				src.CreateBubbles("Light")
			..()
	Mizurappa
		icon_state = "MizuRappaHead"
		density=1
		layer=MOB_LAYER+1
		var
			nin=10
			prestep=0
			turf/laststep
		New()
			..()
			spawn(50) del(src)
		Move()
			var/turf/old_loc=src.loc
			..()
			var/obj/Jutsu/Elemental/Suiton/MizurappaTrail/L=new();L.loc=old_loc;L.dir=src.dir;L.Owner=src.Owner
			var/obj/Jutsu/Elemental/Suiton/Owater/A=new();A.loc=old_loc;A.JutsuLevel=src.JutsuLevel
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A;var/mob/O=src.Owner;var/damage=O.nin*(390)
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 50
					del(src)
					return
				var/WaterChakra=WaterDamage(O)
				damage=round((damage)*((WaterChakra*0.02)+0.9))
				damage=damage/M.Endurance
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*8)
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
			//	view(M)<<output("<font color=blue size=2>[M] has been hit by the blast of Water!([damage])</font>","Attack")
			//	M.DamageProc(damage,"Stamina",O)
				M.DamageProc(damage,"Stamina",O,"blast of Water","blue")
				if(M.RaiArmor)
					M.StunAdd(10)
				//	M.DamageProc(500,"Health",O)
					M.DamageProc(500,"Health",O,"blast of Water","blue")
				M.HitBack(3,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Paper/))
					del(A)
				if(istype(A,/obj/Jutsu/Sand/))
					del(A)
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				del(src)
		Del()
			for(var/obj/Jutsu/Elemental/Suiton/MizurappaTrail/A in world)
				if(A.Owner==src.Owner)
					del(A)
			spawn()
				src.CreateBubbles("Light")
			..()
	MizurappaTrail
		icon_state = "MizuRappaTrail"
		density=0
		layer=MOB_LAYER+1
		New()
			..()
			spawn(50) del(src)
		Del()
			spawn()
				src.CreateBubbles("Light")
			..()
	Suiryedan
		icon_state = "SuiryuudanHead"
		density = 1
		layer = MOB_LAYER+1
		Move_Delay=0
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn(100)
				del(src)
		Move()
			src.prestep = src.loc
			..()
			var/obj/Jutsu/Elemental/Suiton/SuiryedanTrail/L=new();L.loc = src.prestep;L.dir = src.dir;L.Owner = src.Owner
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new()
				if(M.Kaiten||M.sphere)
					del(src)
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 240
					del(src)
					return
				var/damage=round(src.nin*(390))
				var/mob/O=src.Owner
				var/WaterChakra=WaterDamage(O)
				damage=round((damage)*((WaterChakra*0.1)+0.7));Z.loc=src.loc;Z.JutsuLevel=src.JutsuLevel;damage=damage/(M.Endurance)
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				if(damage>2000)
					damage=2000
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*7)
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
		//		M.DamageProc(damage,"Stamina",O)
				M.DamageProc(damage,"Stamina",O,"Water Dragon","blue")
		//		view(M)<<output("[M] was hit by Suiton Suiryuudan!([damage])", "Attack")

				if(M.RaiArmor)
					M.StunAdd(10)
					M.DamageProc(500,"Health",src)
				for(var/obj/Jutsu/Elemental/Suiton/SuiryedanTrail/S in world)
					if(S.Owner == src.Owner)
						del(S)
				del(src)
			if(istype(A,/obj/Jutsu/Elemental/Suiton/SuiryedanTrail/))
				var/obj/Jutsu/Elemental/Suiton/SuiryedanTrail/B = A
				src.loc=B.loc
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Paper/))
					del(A)
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				if(istype(A,/obj/Jutsu/Sand/))
					del(A)
				del(src)
		Del()
			var/mob/O=src.Owner
			for(var/turf/T in getcircle(src,1))
				var/obj/Jutsu/Elemental/Suiton/Owater/Z = new /obj/Jutsu/Elemental/Suiton/Owater
				Z.loc=T
				Z.Owner=src.Owner;Z.JutsuLevel=src.JutsuLevel
			O.TatsumakiOn=0;O.firing=0
			O.client.perspective=MOB_PERSPECTIVE;O.client.eye=O;O.controlled=null
			for(var/obj/Jutsu/Elemental/Suiton/SuiryedanTrail/A in world)
				if(A.Owner==src.Owner)
					del(A)
			if(O.Shibari)
				for(var/obj/Nara/Shibari/K in world)
					if(K.Owner==O)
						O.controlled=K
						O.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
						O.client.eye=K
			spawn()
				src.CreateBubbles("Light")
			..()
	SuiryedanTrail
		icon_state = "SuiryuudanBody"
		Element="Suiton"
		density=1
		layer = MOB_LAYER+1
		New()
			..()
		//	var/mob/O=src.Owner
			spawn()//Added Recently
				while(src)
					sleep(1)
					var/mob/O=src.Owner
					if(src.WaterCheck1()&&O.Clan=="Shiroi")
				//		world<<"It is on Water. Your clan is Shiroi."
						for(var/turf/T in oview(0,src))//src.loc)//L.dir = src.dir;L.Owner = src.Owner
				//			world<<"Attempting to create Water"
						//	var/obj/Jutsu/Elemental/Hyouton/IField/A=new();A.loc=A.dir=src.dir;A.Owner=src.Owner;
							if((locate(/obj/Jutsu/Elemental/Suiton/Owater) in T))
								if(!(locate(/obj/Jutsu/Elemental/Hyouton/IField) in T))
									var/obj/Jutsu/Elemental/Hyouton/IField/AA=new/obj/Jutsu/Elemental/Hyouton/IField(locate(T.x,T.y,T.z))
									AA.layer=T.layer
									AA.Owner=O
			spawn(100)
				del(src)
		Del()
			spawn()
				src.CreateBubbles("Light")
			..()
	SharkA
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="-1,0";pixel_x = -32
	SharkB
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="1,0";pixel_x = 32
	SharkC
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="-1,-1";pixel_x = -32;pixel_y = -32
	SharkD
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="0,-1";pixel_y = -32
	SharkE
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="1,-1";pixel_x = 32;pixel_y = -32
	SharkF
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="-1,1";pixel_x = -32;pixel_y = 32
	SharkG
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="0,1";pixel_y = 32
	SharkH
		icon='Icons/Jutsus/Suikoudan.dmi';icon_state="1,1";pixel_x = 32;pixel_y = 32
	SuitonSuikoudan
		icon = 'Icons/Jutsus/Suikoudan.dmi'
		icon_state="0,0"
		density = 1
		layer = MOB_LAYER+1
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn()
				overlays+=/obj/Jutsu/Elemental/Suiton/SharkA;overlays+=/obj/Jutsu/Elemental/Suiton/SharkB;overlays+=/obj/Jutsu/Elemental/Suiton/SharkC;overlays+=/obj/Jutsu/Elemental/Suiton/SharkD;overlays+=/obj/Jutsu/Elemental/Suiton/SharkE;overlays+=/obj/Jutsu/Elemental/Suiton/SharkF;overlays+=/obj/Jutsu/Elemental/Suiton/SharkG;overlays+=/obj/Jutsu/Elemental/Suiton/SharkH;
				..()
			spawn(40)
				del(src)
	/*	Move()
			src.prestep = src.loc
			var/InWater=0
			for(var/obj/Jutsu/Elemental/Suiton/Owater/A in oview(1,src))
				InWater=1
			for(var/turf/water/A in oview(3,src))
				InWater=1
			var/mob/O=src.Owner
			var/Probability=100
			if(O.WaterSpawn)
				Probability=10

			if(!InWater)
				if(prob(Probability))
					del(src)
			..()*/
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new()
				Z.loc=M.loc;Z.JutsuLevel=src.JutsuLevel
				if(M.Kaiten||M.sphere)
					del(src)
					return
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 200
					src.loc = null
					return
				var/damage=src.nin*rand(88,215)
				var/mob/O = src.Owner
				damage=round((damage)*((O.WaterChakra*0.1)+0.6))
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				damage/=(M.Endurance/1.5)
				if(O.Trait=="Old Powerful") damage+=(O.GenSkill*8)
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(damage>1500)
					damage=1500
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
			//	M.DamageProc(damage,"Stamina",O)
				M.DamageProc(damage,"Stamina",O,"Water Shark","blue")
				if(M.RaiArmor)
					M.StunAdd(10)
					M.DamageProc(500,"Health",O)
			//	view(M)<<output("[M] was hit by Suiton Suikoudan!([damage])", "Attack")
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new();Z.loc=src.loc;Z.JutsuLevel=src.JutsuLevel
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan))
					return
				else
					if(istype(A,/obj/Jutsu/Paper/))
						del(A)
					if(istype(A,/obj/Doors/))
						var/obj/O=A
						O.DamageProc(src.nin)
						del(src)
					if(istype(A,/obj/Jutsu/Sand/))
						del(A)
					del(src)
		Del()
			spawn()
				src.CreateBubbles("Light")
	//		src.CreateBubbles("Light")
			..()



	SuitonSuikoudanGiant
		icon = 'Icons/Jutsus/Suikoudan.dmi'
		icon_state="0,0"
		density = 1
		layer = MOB_LAYER+1
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn()
				overlays+=/obj/Jutsu/Elemental/Suiton/SharkA;overlays+=/obj/Jutsu/Elemental/Suiton/SharkB;overlays+=/obj/Jutsu/Elemental/Suiton/SharkC;overlays+=/obj/Jutsu/Elemental/Suiton/SharkD;overlays+=/obj/Jutsu/Elemental/Suiton/SharkE;overlays+=/obj/Jutsu/Elemental/Suiton/SharkF;overlays+=/obj/Jutsu/Elemental/Suiton/SharkG;overlays+=/obj/Jutsu/Elemental/Suiton/SharkH;
				..()
			spawn(40)
				del(src)
	/*	Move()
			src.prestep = src.loc
			var/InWater=0
			for(var/obj/Jutsu/Elemental/Suiton/Owater/A in oview(1,src))
				InWater=1
			for(var/turf/water/A in oview(3,src))
				InWater=1
			var/mob/O=src.Owner
			var/Probability=100
			if(O.WaterSpawn)
				Probability=10

			if(!InWater)
				if(prob(Probability))
					del(src)
			..()*/
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new()
				Z.loc=M.loc;Z.JutsuLevel=src.JutsuLevel
				if(M.Kaiten||M.sphere)
					del(src)
					return
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 300
					src.loc = null
					return
				var/damage=src.nin*rand(250)
				var/damage2=src.nin*rand(80,120)
				var/mob/O = src.Owner
				damage=round((damage)*((O.WaterChakra*0.1)+0.6))
				damage=damage/(M.Endurance/1.5)
				//damage2=round((damage)*((O.WaterChakra*0.1)+0.6))
				//var/AddOn=(O.WaterPressure*0.075)*damage
				//damage+=AddOn
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*5)
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(damage>1000)
					damage=1000
				if(damage2>450)
					damage2=450
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
			//	M.DamageProc(damage,"Stamina",O)
				M.DamageProc(damage,"Stamina",O,"impacto do tubarão gigante de água","blue")
			//	M.DamageProc(damage2,"Health",O)
				M.DamageProc(damage2,"Health",O,"mordida do tubarão de água","blue")
				if(M.RaiArmor)
					M.StunAdd(10)
					M.DamageProc(500,"Health",O)
			//	view(M)<<output("[M] was hit by Suiton Suikoudan!([damage])", "Attack")
			//	view(M)<<output("The Shark takes a chunk out of you for [damage2]!", "Attack")
				M.Bloody()
				M.Bloody()
				M.Bloody()
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				var/obj/Jutsu/Elemental/Suiton/Owater/Z=new();Z.loc=src.loc;Z.JutsuLevel=src.JutsuLevel
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Paper/))
					del(A)
				if(istype(A,/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan))
					return
				if(istype(A,/obj/Jutsu/Elemental/Hyouton))
					var/obj/D=A
					D.DamageProc(src.nin)
					del(src)
				else
					if(istype(A,/obj/Doors/))
						var/obj/O=A
						O.DamageProc(src.nin)
						del(src)
					if(istype(A,/obj/Jutsu/Sand/))
						del(A)
					del(src)
		Del()
			spawn()
				src.CreateBubbles("Light")
	//		src.CreateBubbles("Light")
			..()

	Teppoudama
		icon_state = "water bullet"
		density=1
		layer=MOB_LAYER+1
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn(80) del(src)
		Move()
			spawn()
				src.CreateBubbles("Light")
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					M.WaterMass += 500
					src.loc = null
					return
				var/damage=O.nin*rand(155,170)
				var/WaterChakra=WaterDamage(O)
				damage=round((damage)*((WaterChakra*0.2)+0.7))
				damage=damage/(M.Endurance/1.25)
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				if(M.Clan=="Hoshigaki")
					damage*=0.7
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
				M.DamageProc(damage,"Stamina",O,"Teppoudama","blue")
				if(M.RaiArmor)
					M.StunAdd(10);M.DamageProc(500,"Health",O)
				spawn()
					M.HitBack(3,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/Jutsu/Elemental/Hyouton))
				var/obj/B=A
				B.DamageProc(src.nin)
				del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Jutsu/Paper/))
					del(A)
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				if(istype(A,/obj/Jutsu/Sand/))
					del(A)
				del(src)
		Del()
			for(var/turf/T in getcircle(src,1))
				var/obj/Jutsu/Elemental/Suiton/Owater/A=new();A.loc=T;A.JutsuLevel=src.JutsuLevel
			for(var/mob/M in oview(src,2))
				M.DamageProc(src.nin*1.5,"Stamina",src.Owner,"the Water Pressure");M.HitBack(3,get_dir(src,M))
			spawn()
				src.CreateBubbles("Strong")
			..()
	Suigadan
		Element="Suiton"
		icon_state = "Suigadan"
		density = 0
		layer = MOB_LAYER+1
		New()
			..()
			spawn()
				while(src)
					sleep(6)
				//	src.SoundEngine('SFX/WaterSFX.wav',4,45)
//					sleep(2)
					for(var/mob/M in src.loc)
						if(M.InHydro)
							M.WaterMass += 300
							return
						var/mob/O=src.Owner;
						var/damage=M.maxhealth*0.25
						if(O.Trait=="Old Powerful") damage+=(O.NinSkill*5)
						var/AddOn=(O.WaterPressure*0.150)*damage
						damage+=AddOn
						if(!M.WaterCheck())
							damage*=(0.5+(O.WaterSpawn*0.1))
					//	view(M)<<output("<font color=light blue>[M] has been hit by the Suigadan for [damage] damage!</font>","Attack")
						if(M.PaperStyleDance)
							M.PaperStyleDance=0
					//	M.DamageProc(damage,"Health",O)
						M.DamageProc(damage,"Health",O,"Suigadan","blue")
						spawn()M.Bloody();M.Bloody();M.Bloody();M.Bloody();viewers()<<sound('SFX/Slice.wav',0,0,1)
						M.StunAdd(10)
						if(M.RaiArmor)
							M.StunAdd(10);M.DamageProc(500,"Health",O)
			spawn(5)
				del(src)
	DaiWater
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				var/WaterChakra=WaterDamage(O)
				while(src)
			//		src.SoundEngine('SFX/WaterSFX.wav',5,30)

				//	spawn()
					//	for(var/mob/Sand/Q in src.loc)
					//		del(Q)
					//	for(var/obj/Jutsu/Sand/S in src.loc)
					//		del(S)
					for(var/mob/M in src.loc)
						if(!M.client)
							return
						if(M.UsingDomu||M.Mogu)
							return
						if(M.InHydro)
							M.WaterMass += 200
							src.loc = null
							src.Owner=null
							del(src)
					//		del(src)
							return
						if(M.PaperStyleDance)
							M.PaperStyleDance=0
						var/damage=src.nin;damage=round((damage*(300))*((WaterChakra*0.02)+0.7));damage=damage/M.Endurance
						var/AddOn=(O.WaterPressure*0.150)*damage
						damage+=AddOn
						if(M.Clan=="Hoshigaki")
							damage*=0.7
						M.DamageProc(damage,"Stamina",O,"Daibakufu","#8088FF")
					//	step(M,src.dir)
						if(M.RaiArmor)
							M.StunAdd(10);M.DamageProc(500,"Health",O)
						spawn()
							step(M,src.dir);
				//		step(M,src.dir);
				//		step(M,src.dir)
					sleep(8)
			spawn(100)
				del(src)
		Bump(A)
			..()
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
		AA
			Element="Suiton"
			icon_state = "l2"
			density = 0
			layer = FLY_LAYER+1
			Move()
				src.laststep=src.loc
				..()
				var/obj/Jutsu/Elemental/Suiton/Owater/P=new();P.loc=src.laststep;P.Owner=src.Owner;P.JutsuLevel=src.JutsuLevel;var/obj/Jutsu/Elemental/Suiton/DaiWater/Dai1T/L=new();L.loc = src.laststep;L.dir = src.dir;L.Owner=src.Owner;L.nin=src.nin;L.JutsuLevel=src.JutsuLevel
		Dai1T
			Element="Suiton"
			icon_state = "l1"
			layer = MOB_LAYER+1
			density = 0
			New()
				..()
				spawn(1)
					var/mob/O=src.Owner
					var/WaterChakra=WaterDamage(O)
					while(src)
						sleep(1)
					//	src.SoundEngine('SFX/WaterSFX.wav',10,50)
						sleep(1)
						spawn()
							for(var/mob/Sand/Q in src.loc)
								del(Q)
							for(var/obj/Jutsu/Sand/S in src.loc)
								del(S)
					//		for(var/obj/Jutsu/Paper/P in src.loc)
				//				del(P)
						for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
							var/damage2=src.nin;damage2=round((damage2*(175))*((WaterChakra*0.06)+0.7));damage2=damage2/110
							var/AddOn=(O.WaterPressure*0.150)*damage2
							damage2+=AddOn
							A.DamageProc(damage2)
							del(src)
						for(var/mob/M in src.loc)
							if(M.UsingDomu||M.Mogu)
								return
							if(M.InHydro)
								M.WaterMass += 200
								src.loc = null
								return
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							var/damage=src.nin;damage=round((damage*(175))*((WaterChakra*0.06)+0.7));damage=damage/M.Endurance;view(M)<<output("<font color=light blue>[M] has been hit by the Daibakufu for [damage] damage!</font>","Attack")
							var/AddOn=(O.WaterPressure*0.150)*damage
							damage+=AddOn
							if(M.Clan=="Hoshigaki")
								damage*=0.7
							if(O.Trait=="Old Powerful")
								damage=damage*1.5
							M.DamageProc(damage,"Stamina",O,"Daibakufu","#8088FF")
							if(M.RaiArmor)
								M.StunAdd(10);M.DamageProc(500,"Health",O)
							spawn()
								step(M,src.dir)
							//	step(M,src.dir);step(M,src.dir);step(M,src.dir)
						sleep(8)
				spawn(100)
					del(src)
		BB
			Element="Suiton"
			icon_state = "m2"
			density = 0
			layer = FLY_LAYER+1
			Move()
				src.laststep=src.loc
				..()
				var/obj/Jutsu/Elemental/Suiton/Owater/P=new();P.loc=src.laststep;P.Owner=src.Owner;P.JutsuLevel=src.JutsuLevel;var/obj/Jutsu/Elemental/Suiton/DaiWater/Dai2T/L=new();L.loc = src.laststep;L.dir = src.dir;L.Owner=src.Owner;L.nin=src.nin;L.JutsuLevel=src.JutsuLevel
		Dai2T
			Element="Suiton"
			icon_state = "m1"
			density = 0
			layer = MOB_LAYER+1
			New()
				..()
				spawn(1)
					var/mob/O=src.Owner
					var/WaterChakra=WaterDamage(O)
					while(src)
						sleep(1)
					//	src.SoundEngine('SFX/WaterSFX.wav',1,50)
						sleep(1)
						spawn()
							for(var/mob/Sand/Q in src.loc)
								del(Q)
							for(var/obj/Jutsu/Sand/S in src.loc)
								del(S)
				//			for(var/obj/Jutsu/Paper/P in src.loc)
				//				del(P)
						for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
							var/damage2=src.nin;damage2=round((damage2*(175))*((WaterChakra*0.06)+0.7));damage2=damage2/110
							var/AddOn=(O.WaterPressure*0.150)*damage2
							damage2+=AddOn
							A.DamageProc(damage2)
							del(src)
						for(var/mob/M in src.loc)
							if(M.UsingDomu||M.Mogu)
								return
							if(M.InHydro)
								M.WaterMass += 200
								src.loc = null
								return
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							var/damage=src.nin;damage=round((damage*(175))*((WaterChakra*0.06)+0.7));damage=damage/M.Endurance;view(M)<<output("<font color=#8088FF>[M] has been hit by the Daibakufu for [damage] damage!</font>","Attack")
							var/AddOn=(O.WaterPressure*0.150)*damage
							damage+=AddOn
							if(M.Clan=="Hoshigaki")
								damage*=0.7
							M.DamageProc(damage,"Stamina",O,"Daibakufu","#8088FF")
							if(M.RaiArmor)
								M.StunAdd(10);M.DamageProc(500,"Health",O)
							spawn()
								step(M,src.dir)
						//	step(M,src.dir);step(M,src.dir);step(M,src.dir)
						sleep(8)
				spawn(100)
					del(src)
		CC
			Element="Suiton"
			icon_state = "r2"
			density = 0
			layer = FLY_LAYER+1
			Move()
				src.laststep=src.loc
				..()
				var/obj/Jutsu/Elemental/Suiton/Owater/P=new();P.loc=src.laststep;P.Owner=src.Owner;P.JutsuLevel=src.JutsuLevel;var/obj/Jutsu/Elemental/Suiton/DaiWater/Dai3T/L=new();L.loc = src.laststep;L.dir = src.dir;L.Owner=src.Owner;L.nin=src.nin;L.JutsuLevel=src.JutsuLevel
		Dai3T
			Element="Suiton"
			icon_state = "r1"
			density = 0
			layer = MOB_LAYER+1
			New()
				..()
				spawn(1)
					var/mob/O=src.Owner
					var/WaterChakra=WaterDamage(O)
					while(src)
						sleep(1)
					//	src.SoundEngine('SFX/WaterSFX.wav',10,50)
						sleep(1)
						spawn()
							for(var/mob/Sand/Q in src.loc)
								del(Q)
							for(var/obj/Jutsu/Sand/S in src.loc)
								del(S)
				//			for(var/obj/Jutsu/Paper/P in src.loc)
				//				del(P)
						for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
							var/damage2=src.nin;damage2=round((damage2*(175))*((WaterChakra*0.06)+0.7));damage2=damage2/110
							var/AddOn=(O.WaterPressure*0.150)*damage2
							damage2+=AddOn
							A.DamageProc(damage2)
							del(src)
						for(var/mob/M in src.loc)
							if(M.UsingDomu||M.Mogu)
								return
							if(M.InHydro)
								M.WaterMass += 200
								src.loc = null
								return
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							var/damage=src.nin;damage=round((damage*(175))*((WaterChakra*0.06)+0.7));damage=damage/M.Endurance;view(M)<<output("<font color=light blue>[M] has been hit by the Daibakufu for [damage] damage!</font>","Attack")
							var/AddOn=(O.WaterPressure*0.150)*damage
							damage+=AddOn
							if(M.Clan=="Hoshigaki")
								damage*=0.7
							M.DamageProc(damage,"Stamina",O,"Daibakufu","#8088FF")
							if(M.RaiArmor)
								M.StunAdd(10);M.DamageProc(500,"Health",O)
							spawn()
								step(M,src.dir)
						//	step(M,src.dir);step(M,src.dir);step(M,src.dir)
						sleep(8)
				spawn(100)
					del(src)

		DD
			Element="Suiton"
			icon_state = "m2"
			density = 0
			layer = FLY_LAYER+1
			Move()
				src.laststep=src.loc
				..()
				var/obj/Jutsu/Elemental/Suiton/Owater/P=new();P.loc=src.laststep;P.Owner=src.Owner;P.JutsuLevel=src.JutsuLevel;var/obj/Jutsu/Elemental/Suiton/DaiWater/Dai2T/L=new();L.loc = src.laststep;L.dir = src.dir;L.Owner=src.Owner;L.nin=src.nin;L.JutsuLevel=src.JutsuLevel
		Dai4T
			Element="Suiton"
			icon_state = "m1"
			density = 0
			layer = MOB_LAYER+1
			New()
				..()
				spawn(1)
					var/mob/O=src.Owner
					var/WaterChakra=WaterDamage(O)
					while(src)
						sleep(3)
				//		src.SoundEngine('SFX/WaterSFX.wav',10,50)
					//	sleep(1)
						spawn()
							for(var/mob/Sand/Q in src.loc)
								del(Q)
							for(var/obj/Jutsu/Sand/S in src.loc)
								del(S)
		//					for(var/obj/Jutsu/Paper/P in src.loc)
		//						del(P)
						for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
							var/damage2=src.nin;damage2=round((damage2*(175))*((WaterChakra*0.06)+0.7));damage2=damage2/110
							var/AddOn=(O.WaterPressure*0.150)*damage2
							damage2+=AddOn
							A.DamageProc(damage2)
							del(src)
						for(var/mob/M in src.loc)
							if(M.UsingDomu||M.Mogu)
								return
							if(M.InHydro)
								M.WaterMass += 200
								src.loc = null
								return
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							var/damage=src.nin;damage=round((damage*(175))*((WaterChakra*0.06)+0.7));damage=damage/M.Endurance;view(M)<<output("<font color=#8088FF>[M] has been hit by the Daibakufu for [damage] damage!</font>","Attack")
							var/AddOn=(O.WaterPressure*0.150)*damage
							damage+=AddOn
							if(M.Clan=="Hoshigaki")
								damage*=0.7
							M.DamageProc(damage,"Stamina",O,"Daibakufu","#8088FF")
							if(M.RaiArmor)
								M.StunAdd(10);M.DamageProc(500,"Health",O)
							spawn()
								step(M,src.dir)
							//	step(M,src.dir);step(M,src.dir);step(M,src.dir)
						sleep(8)
				spawn(100)
					del(src)
		EE
			Element="Suiton"
			icon_state = "m2"
			density = 0
			layer = FLY_LAYER+1
			Move()
				src.laststep=src.loc
				..()
				var/obj/Jutsu/Elemental/Suiton/Owater/P=new();P.loc=src.laststep;P.Owner=src.Owner;P.JutsuLevel=src.JutsuLevel;var/obj/Jutsu/Elemental/Suiton/DaiWater/Dai2T/L=new();L.loc = src.laststep;L.dir = src.dir;L.Owner=src.Owner;L.nin=src.nin;L.JutsuLevel=src.JutsuLevel
		Dai5T
			Element="Suiton"
			icon_state = "m1"
			density = 0
			layer = MOB_LAYER+1
			New()
				..()
				spawn(1)
					var/mob/O=src.Owner
					var/WaterChakra=WaterDamage(O)
					while(src)
						sleep(1)
					//	src.SoundEngine('SFX/WaterSFX.wav',10,50)
						sleep(1)
						spawn()
							for(var/mob/Sand/Q in src.loc)
								del(Q)
							for(var/obj/Jutsu/Sand/S in src.loc)
								del(S)
							for(var/obj/Jutsu/Paper/P in src.loc)
								del(P)
						for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
							var/damage2=src.nin;damage2=round((damage2*(175))*((WaterChakra*0.06)+0.7));damage2=damage2/110
							var/AddOn=(O.WaterPressure*0.150)*damage2
							damage2+=AddOn
							A.DamageProc(damage2)
							del(src)
						for(var/mob/M in src.loc)
							if(M.UsingDomu||M.Mogu)
								return
							if(M.InHydro)
								M.WaterMass += 200
								src.loc = null
								return
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							var/damage=src.nin;damage=round((damage*(175))*((WaterChakra*0.06)+0.7));damage=damage/M.Endurance;view(M)<<output("<font color=#8088FF>[M] has been hit by the Daibakufu for [damage] damage!</font>","Attack")
							var/AddOn=(O.WaterPressure*0.150)*damage
							damage+=AddOn
							if(M.Clan=="Hoshigaki")
								damage*=0.6
							M.DamageProc(damage,"Stamina",O,"Daibakufu","#8088FF")
							if(M.RaiArmor)
								M.StunAdd(10);M.DamageProc(500,"Health",O)
							spawn()
								step(M,src.dir)
						//	step(M,src.dir);step(M,src.dir)
						sleep(8)
				spawn(100)
					del(src)
	WaterWave
		icon_state = "SuitonWave"
		density=1
		pixel_step_size = 32
		layer = MOB_LAYER+1
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn(200)
				del(src)
		Move()
			src.laststep=src.loc
			..()
			if(src.loc!=src.laststep)
				var/obj/Jutsu/Elemental/Suiton/Owater/L=new();L.JutsuLevel=src.JutsuLevel
				L.loc = src.laststep
				spawn()
					src.CreateBubbles("Light")
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.Owner
				if(M==O)
					return
				if(istype(M,/mob/Sand/))
					del(M)
					return
				if(M.InHydro)
					if(prob(50))
						M.WaterMass += 500
						src.loc = null
						return
					else
						M.WaterMass += 200
						src.loc = M.loc
						return
				var/WaterChakra=WaterDamage(O)
			//	var/damage=src.nin;damage=round((damage*(1250))*((WaterChakra*0.02)+0.7))//Argon..what the fuck are you doing..
				var/damage=src.nin;damage=round((damage*(890))*((WaterChakra*0.02)+0.7))
				damage=damage/(M.Endurance/2)
				var/AddOn=(O.WaterPressure*0.150)*damage
				damage+=AddOn
				if(damage>4000)
					damage=4000
			//	view(M)<<output("<font color=#8088FF>[M] has been hit by the Baku Suishou for [damage] damage!</font>","Attack")
				if(M.PaperStyleDance)
					M.PaperStyleDance=0
				if(M.Clan=="Hoshigaki")
					damage*=0.7
			//	M.DamageProc(damage,"Stamina",O)
				M.DamageProc(damage,"Stamina",O,"Giant Water Wave","#8088FF")
				if(M.RaiArmor)
					M.StunAdd(10);M.DamageProc(500,"Health",O)
				src.loc=M.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/M = A
				if(istype(M,/obj/Jutsu/Paper/))
					del(M)
				if(istype(A,/obj/Jutsu/Elemental/Suiton/WaterWave))
					if(M:Owner == src.Owner)
						src.loc = M.loc
						return
				if(M.density)
					if(istype(A,/obj/Doors/))
						var/obj/O=A
						O.DamageProc(src.nin)
						del(src)
					if(istype(M,/obj/Jutsu/Sand/))
						del(M)
					del(src)
		Del()
			spawn()
				src.CreateBubbles("Medium")
			..()
mob/proc/
	UnderWater()
		if(src.layer==MOB_LAYER)
			src.SavedLayer=src.layer
			src.layer=TURF_LAYER-1
			if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc)
				src<<"You sink underneath the water!"
				src.FrozenBind="UnderWater"
				if(!(locate(/obj/Drown/UnderWater) in src.client.screen))
					src.client.screen+=new/obj/Drown/UnderWater
				src.UnderWater="Light"
			else
				src<<"Você se sente como se uma força desconhecida chamada de água nas proximidades"
				return
		else
			src<<"Você não pode usar isso porque você não está em uma camada normal!";
			return
mob/proc/
	Resurface()
		if(src.UnderWater!="")
			if(!(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc))
				src<<"Você precisa estar debaixo d'água para voltar para cima!"
				return
		if(src.layer!=MOB_LAYER)
			src.layer=src.SavedLayer
			src.SavedLayer=src.layer
			if(src.UnderWater!="")
				if(src.UnderWater=="Light")
					if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc)
						for(var/obj/Drown/UnderWater/H in src.client.screen)
							del(H)
						if(src.FrozenBind=="UnderWater")
							src.FrozenBind=""
						src.UnderWater=""
						src<<"Você ressurgiu da água!"
		else
			src<<"Você está na camada normal, o que você precisa usar isso? ";
			return
mob/proc/
	UnderWaterPull()
		var/mob/M = src.target
		var/mob/P = M
		src.ChakraDrain(30000)
		src.Handseals(47-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(M.WaterCheck())
		//	sleep(1)
			M.UnderWater()
		//	var/obj/Jutsu/Elemental/Suiton/Suigadan/A=new();A.loc=M.loc;A.Owner=src;A.JutsuLevel=src.SuitonKnowledge
		else
			src<<"[M]precisa de estar na água!"
			return
		var/Time=50
		src.icon_state="handseal"
		view()<<"[src] forms a handseal, as [M] mergulhou em linha reta para baixo na água!"
		while(src.icon_state=="handseal"&&Time>0)
		//	src.icon_state="Handseal"
			if(src.knockedout)
				Time=0
			src.Frozen=1
			src.FrozenBind="HoldWater"
			Time--
			sleep(5)
		src.icon_state=""
		src<<"Você libera o Jutsu. permitindo [P] para ressurgir!"
		src.FrozenBind=""
		src.Frozen=0
		P.Resurface()
mob/proc
	CreateWater()
		var/BonusWater=0
		if(src.SuitonKnowledge>500)
			BonusWater=1
		if(src.SuitonKnowledge>1000)
			BonusWater=2
		if(src.SuitonKnowledge>1500)
			BonusWater=3
		src.ChakraDrain(25000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="Jutsu";src.overlays-='Icons/water.dmi';src.overlays+='Icons/water.dmi';src.Frozen=1;src.firing=1
		spawn(20)
			src.Frozen=0;src.firing=0;src.overlays-='Icons/water.dmi'
		for(var/turf/T in oview(4+BonusWater,src))
			var/obj/Jutsu/Elemental/Suiton/Owater/L=new();L.Owner=src;L.JutsuLevel=src.SuitonKnowledge
			L.loc=T
	MizurappaNoJutsu()
		src.ChakraDrain(7000)
		src.Handseals(15-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="jutsu";src.Frozen=1;src.firing=1
		spawn(5)
			src.icon_state="";src.Frozen=0;src.firing=0
		var/obj/Jutsu/Elemental/Suiton/Mizurappa/K=new()
		if(src.dir==EAST)
			K.pixel_x=16
		if(src.dir==WEST)
			K.pixel_x=-16
		K.loc=src.loc;K.nin=src.nin*1.2;K.dir=src.dir;K.name="[src]";K.Move_Delay=(2-(src.WaterChakra/10));K.Owner=src;K.JutsuLevel=src.SuitonKnowledge;walk(K,src.dir)
	Suijinheki(Uses)
		src.ChakraDrain(10000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.WaterSpawn||src.WaterCheck())
			sleep(1)
			src.icon_state="handseal"
			src.Stun=999;src.firing=1;spawn(5)
				src.Stun=0;src.firing=0;src.icon_state=""
			spawn()
				src.CreateBubbles("Strong")
			var/obj/Jutsu/Elemental/Suiton/Owater/L=new();L.JutsuLevel=src.SuitonKnowledge
			L.loc=src.loc
			var/obj/Jutsu/Elemental/Suiton/SuitonSuijinheki/Part1/A=new();A.Owner=src;A.JutsuLevel=src.SuitonKnowledge;A.dir=src.dir
			var/obj/Jutsu/Elemental/Suiton/SuitonSuijinheki/Part2/B=new();B.Owner=src;B.JutsuLevel=src.SuitonKnowledge;B.dir=src.dir
			var/obj/Jutsu/Elemental/Suiton/SuitonSuijinheki/Part3/C=new();C.Owner=src;C.JutsuLevel=src.SuitonKnowledge;C.dir=src.dir
			var/obj/Jutsu/Elemental/Suiton/SuitonSuijinheki/Part2/D=new();D.Owner=src;D.JutsuLevel=src.SuitonKnowledge;D.dir=src.dir
			var/obj/Jutsu/Elemental/Suiton/SuitonSuijinheki/Part2/E=new();E.Owner=src;E.JutsuLevel=src.SuitonKnowledge;E.dir=src.dir
			if(src.dir==SOUTH)
				A.loc=locate(src.x-2,src.y-1,src.z)
				D.loc=locate(src.x-1,src.y-1,src.z)
				B.loc=locate(src.x,src.y-1,src.z)
				E.loc=locate(src.x+1,src.y-1,src.z)
				C.loc=locate(src.x+2,src.y-1,src.z)
			//	A.loc=locate(src.x-1,src.y-1,src.z)
			//	B.loc=locate(src.x,src.y-1,src.z)
			//	C.loc=locate(src.x+1,src.y-1,src.z)
			if(src.dir==NORTH)
				A.loc=locate(src.x-2,src.y+1,src.z)
				D.loc=locate(src.x-1,src.y+1,src.z)
				B.loc=locate(src.x,src.y+1,src.z)
				E.loc=locate(src.x+1,src.y+1,src.z)
				C.loc=locate(src.x+2,src.y+1,src.z)
		//		A.loc=locate(src.x-1,src.y+1,usr.z)
		//		B.Owner=src;B.loc = locate(src.x,src.y+1,src.z)
		//		C.loc=locate(src.x+1,src.y+1,src.z)
			if(src.dir==EAST)
				A.loc=locate(src.x+1,src.y+2,src.z)
				D.loc=locate(src.x+1,src.y+1,src.z)
				B.loc=locate(src.x+1,src.y,src.z)
				E.loc=locate(src.x+1,src.y-1,src.z)
				C.loc=locate(src.x+1,src.y-2,src.z)
			//	A.loc=locate(src.x+1,src.y+1,src.z)
			//	B.Owner=src;B.loc=locate(src.x+1,src.y,src.z)
			//	C.loc=locate(src.x+1,src.y-1,src.z)
			if(src.dir==WEST)
				A.loc=locate(src.x-1,src.y+2,src.z)
				D.loc=locate(src.x-1,src.y+1,src.z)
				B.loc=locate(src.x-1,src.y,src.z)
				E.loc=locate(src.x+1,src.y-1,src.z)
				C.loc=locate(src.x+2,src.y-2,src.z)
			//	A.loc=locate(src.x-1,src.y+1,src.z)
			//	B.loc=locate(src.x-1,src.y,src.z)
			//	C.loc=locate(src.x-1,src.y-1,src.z)
			var/obj/Jutsu/Elemental/Suiton/Owater/LL=new();LL.JutsuLevel=src.SuitonKnowledge;LL.loc=A.loc
			var/obj/Jutsu/Elemental/Suiton/Owater/LLL=new();LLL.JutsuLevel=src.SuitonKnowledge;LLL.loc=B.loc
			var/obj/Jutsu/Elemental/Suiton/Owater/LLLL=new();LLLL.JutsuLevel=src.SuitonKnowledge;LLLL.loc=C.loc
			var/obj/Jutsu/Elemental/Suiton/Owater/LLLLL=new();LLLLL.JutsuLevel=src.SuitonKnowledge;LL.loc=D.loc
			var/obj/Jutsu/Elemental/Suiton/Owater/LLLLLL=new();LLLLLL.JutsuLevel=src.SuitonKnowledge;LLLLLL.loc=E.loc
			flick("Rise1",A)
			flick("Rise2",B)
			flick("Rise2",D)
			flick("Rise2",E)
			flick("Rise3",C)
		else
			src<<"You need a water source!"
	Syrup_Capture()
		src.ChakraDrain(17000)
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="Jutsu";src.Frozen=1;src.firing=1
		spawn(20)
			src.Frozen=0;src.firing=0;src.icon_state=""
		var/obj/Jutsu/Elemental/Suiton/SyrupWave/A=new();A.Owner=src;A.JutsuLevel=src.SuitonKnowledge
		var/obj/Jutsu/Elemental/Suiton/SyrupWave/B=new();B.Owner=src;B.JutsuLevel=src.SuitonKnowledge
		var/obj/Jutsu/Elemental/Suiton/SyrupWave/C=new();C.Owner=src;C.JutsuLevel=src.SuitonKnowledge
		var/obj/Jutsu/Elemental/Suiton/SyrupWave/D=new();D.Owner=src;D.JutsuLevel=src.SuitonKnowledge
		var/obj/Jutsu/Elemental/Suiton/SyrupWave/E=new();E.Owner=src;E.JutsuLevel=src.SuitonKnowledge
		if(src.dir==NORTH)
			A.loc=locate(src.x,src.y+1,src.z);A.dir=NORTH;A.Edge=8
			B.loc=locate(src.x-1,src.y+1,src.z);B.dir=NORTH;B.Edge=8
			C.loc=locate(src.x+1,src.y+1,src.z);C.dir=NORTH;C.Edge=8
			D.loc=locate(src.x-2,src.y+1,src.z);D.dir=NORTH;D.Edge=7
			E.loc=locate(src.x+2,src.y+1,src.z);E.dir=NORTH;E.Edge=9
		if(src.dir==SOUTH)
			A.loc=locate(src.x,src.y-1,src.z);A.dir=SOUTH;A.Edge=2
			B.loc=locate(src.x-1,src.y-1,src.z);B.dir=SOUTH;B.Edge=2
			C.loc=locate(src.x+1,src.y-1,src.z);C.dir=SOUTH;C.Edge=2
			D.loc=locate(src.x-2,src.y-1,src.z);D.dir=SOUTH;D.Edge=1
			E.loc=locate(src.x+2,src.y-1,src.z);E.dir=SOUTH;E.Edge=3
		if(src.dir==WEST)
			A.loc=locate(src.x-1,src.y,src.z);A.dir=WEST;A.Edge=6
			B.loc=locate(src.x-1,src.y-2,src.z);B.dir=WEST;B.Edge=9
			C.loc=locate(src.x-1,src.y-1,src.z);C.dir=WEST;C.Edge=6
			D.loc=locate(src.x-1,src.y+1,src.z);D.dir=WEST;D.Edge=6
			E.loc=locate(src.x-1,src.y+2,src.z);E.dir=WEST;E.Edge=3
		if(src.dir==EAST)
			A.loc=locate(src.x+1,src.y,src.z);A.dir=EAST;A.Edge=4
			B.loc=locate(src.x+1,src.y-2,src.z);B.dir=EAST;B.Edge=7
			C.loc=locate(src.x+1,src.y-1,src.z);C.dir=EAST;C.Edge=4
			D.loc=locate(src.x+1,src.y+1,src.z);D.dir=EAST;D.Edge=4
			E.loc=locate(src.x+1,src.y+2,src.z);E.dir=EAST;E.Edge=1
		walk(A,A.dir);walk(B,B.dir);walk(C,C.dir);walk(D,D.dir);walk(E,E.dir)
	SuiryuudanZ()
		var/Multiplier=1
		if(src.WaterCheck())
			sleep(1)
			src.ChakraDrain(15000)
			src.Handseals(50-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.icon_state="handseal"
			spawn(1)
				src.icon_state=""
			var/obj/Jutsu/Elemental/Suiton/Suiryedan/K=new();
			K.loc=src.loc;
			K.nin=src.nin*1.1;
			K.Owner=src;
			K.JutsuLevel=src.SuitonKnowledge;
			K.name="[src]";
			K.Move_Delay=1
			if(src.WaterDragonMaster>=1&&src.WaterCheck()!=2&&src.WaterCheck()!=0)
				K.Move_Delay=0
			if(src.SuitonKnowledge>5000)
				K.Move_Delay=0
			if(src.WaterDragonMaster>=2)
				K.nin*=1.25
			src.controlled=K;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
			var/mob/M=src.target
			while(M&&K&&src.WaterCheck())
				step_towards(K,M)
				sleep(rand(K.Move_Delay,K.Move_Delay+1))
		else if(src.WaterSpawn)
			Multiplier=0.5+(src.WaterSpawn*0.1)
			sleep(1)
			src.ChakraDrain(23000)
			src.Handseals(55-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.icon_state="handseal"
			spawn(1)
				src.icon_state=""
			var/obj/Jutsu/Elemental/Suiton/Suiryedan/K=new();K.loc=src.loc;K.nin=src.nin*Multiplier;K.Owner=src;K.JutsuLevel=src.SuitonKnowledge;K.name="[src]";K.Move_Delay=1
			if(src.WaterDragonMaster>=1)
				K.nin*=1.25
			if(src.WaterDragonMaster>=2)
				K.Move_Delay=0.5
			src.controlled=K;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
		else
			usr<<"Você precisa estar na água!";return
	SuikoudanZ(Uses)
		src.ChakraDrain(27500)
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		usr.WaterSharksLeft=1+src.WaterSharksExpert
		usr<<"Você tem [src.WaterSharksLeft] usos da água Tubarão Jutsu. Clique em um alvo para enviá-los a atacar!"
		spawn(200)
			if(usr.WaterSharksLeft>0)
				usr<<"Você ficou sem tempo para terminar de usar a água Tubarão Jutsu.";usr.WaterSharksLeft=0

	//Daikoudan (Great Shark Bullet)
	Daikoudan(Uses)
		src.ChakraDrain(18000)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.WaterSpawn||src.WaterCheck())
			var/obj/Jutsu/Elemental/Suiton/SuitonSuikoudanGiant/A=new();A.loc=src.loc;A.nin=src.nin*2.5;A.name="[src]";A.Owner=src;A.Move_Delay=0;A.JutsuLevel=src.SuitonKnowledge*2;A.dir=src.dir;
			walk(A,A.dir)
		else
			src<<"Você precisa de uma fonte de água!"
	//Senjikizame (One Thousand Feeding Sharks)
	Senjikizame(Uses)
		src.ChakraDrain(32000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
			src.dir=EAST
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
			src.dir=WEST
		if(!src.WaterCheck())
			src<<"Você precisa de uma fonte de água!"
		var/SS=9
		if(src.icon_state=="handseal"&&Uses>300)
			while(SS>=0&&src.icon_state=="handseal")
				var/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan/K=new();
				K.name="[src]";
				K.loc=src.loc;
				K.nin=src.nin;
				K.Owner=src;
				K.JutsuLevel=src.SuitonKnowledge*2
				K.Move_Delay=0;
				K.dir=turn(src.dir,45*SS)
				walk(K,K.dir);
				SS--;
				sleep(10)
		else
			var/XX=2
			while(XX>0)
				for(var/turf/T in range(2,src))
					if(src.dir==NORTH||src.dir==SOUTH)
						if(T.y==src.y&&!T.density)
							var/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan/K=new();
							K.name="[src]"
							K.loc=T
							K.pixel_x=rand(-12,12)
							K.pixel_y=rand(-8,8)
							K.nin=src.nin
							K.dir=src.dir
							K.Owner=src
							K.JutsuLevel=src.SuitonKnowledge*2
							K.Move_Delay=0
							walk(K,src.dir)
					if(src.dir==WEST||src.dir==EAST)
						if(T.x==src.x&&!T.density)
							var/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan/K=new();
							K.name="[src]"
							K.loc=T
							K.pixel_x=rand(-8,8)
							K.pixel_y=rand(-12,12)
							K.nin=src.nin
							K.dir=src.dir
							K.Owner=src;
							K.JutsuLevel=src.SuitonKnowledge*2
							K.Move_Delay=0
							walk(K,src.dir)
				XX--;
				sleep(1)
	//	sleep(1);
	SuikoudanUse(atom/Target)
		if(src.WaterCheck())
			src.icon_state="handseal"
			src.Frozen=1;src.firing=1;spawn(5)
				src.Frozen=0;src.firing=0;src.icon_state=""
			var/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan/K=new();K.loc=src.loc;K.nin=src.nin;K.JutsuLevel=src.SuitonKnowledge*2;K.name="[src]";K.Owner=src;K.Move_Delay=0;walk_towards(K,Target)

		else if(src.WaterSpawn)
			var/Multiplier=0.5+(src.WaterSpawn*0.1)
			if(Multiplier>0.7)
				Multiplier=0.7
			sleep(1)
			src.icon_state="handseal"
			src.Frozen=1;src.firing=1;spawn(5)
				src.Frozen=0;src.firing=0;src.icon_state=""
			var/obj/Jutsu/Elemental/Suiton/SuitonSuikoudan/K=new();K.loc=src.loc;K.nin=src.nin*Multiplier;K.JutsuLevel=src.SuitonKnowledge*2;K.name="[src]";K.Owner=src;K.Move_Delay=1;walk_towards(K,Target)
		else
			usr<<"Você precisa estar na água!";return
	Suigadan()
		var/mob/M = src.target
		src.ChakraDrain(15000)
		src.Handseals(45-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(M.WaterCheck())
		//	sleep(1)
			var/obj/Jutsu/Elemental/Suiton/Suigadan/A=new();A.loc=M.loc;A.Owner=src;A.JutsuLevel=src.SuitonKnowledge
		else
			src<<"[M] precisa de estar na água!"
	DaibakufuZ()
		src.ChakraDrain(30000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.WaterCheck())
			sleep(1)
			src.icon_state="handseal";
			src.Stun=999;
			src.firing=1
			spawn(21-src.WaterChakra)
				src.Stun=0;
				src.firing=0;
				src.icon_state=""
			var/obj/Jutsu/Elemental/Suiton/WaterfallOverlay/AX=new();AX.loc=src.loc;sleep(30-src.WaterChakra);
			spawn()
				src.CreateBubbles("Strong");
			del(AX)
			var/obj/Jutsu/Elemental/Suiton/DaiWater/AA/A=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/BB/B=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/CC/C=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/DD/D=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/EE/E=new()
			if(src.dir==SOUTH)
				A.Owner=src;A.loc=locate(src.x-1,src.y-1,src.z);A.nin=src.nin*1.3;A.dir=src.dir;A.Move_Delay=0.5;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc=locate(src.x,src.y-1,src.z);B.nin=src.nin;B.dir=src.dir;B.Move_Delay=1.2;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x+1,src.y-1,src.z);C.nin=src.nin;C.dir=src.dir;C.Move_Delay=1.2;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x-2,src.y-1,src.z);D.nin=src.nin;D.dir=src.dir;D.Move_Delay=1.2;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x+2,src.y-1,src.z);E.nin=src.nin;E.dir=src.dir;E.Move_Delay=1.2;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge
			if(src.dir==NORTH)
				A.Owner=src;A.loc=locate(src.x-1,src.y+1,usr.z);A.nin=src.nin*1.3;A.dir=src.dir;A.Move_Delay=0.5;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc = locate(src.x,src.y+1,src.z);B.nin=src.nin;B.dir=src.dir;B.Move_Delay=1.2;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x+1,src.y+1,src.z);C.nin=src.nin;C.dir=src.dir;C.Move_Delay=1.2;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x-2,src.y+1,src.z);D.nin=src.nin;D.dir=src.dir;D.Move_Delay=1.2;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x+2,src.y+1,src.z);E.nin=src.nin;E.dir=src.dir;E.Move_Delay=1.2;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge
			if(src.dir==EAST)
				A.Owner=src;A.loc=locate(src.x+1,src.y+1,src.z);A.nin=src.nin*1.3;A.dir=src.dir;A.Move_Delay=0.5;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc=locate(src.x+1,src.y,src.z);B.nin=src.nin;B.dir=src.dir;B.Move_Delay=1.2;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x+1,src.y-1,src.z);C.nin=src.nin;C.dir=src.dir;C.Move_Delay=1.2;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x+1,src.y+2,src.z);D.nin=src.nin;D.dir=src.dir;D.Move_Delay=1.2;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x+1,src.y-2,src.z);E.nin=src.nin;E.dir=src.dir;E.Move_Delay=1.2;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge
			if(src.dir==WEST)
				A.Owner=src;A.loc=locate(src.x-1,src.y+1,src.z);A.nin=src.nin*1.3;A.dir=src.dir;A.Move_Delay=0.5;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc=locate(src.x-1,src.y,src.z);B.nin=src.nin;B.dir=src.dir;B.Move_Delay=1.2;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x-1,src.y-1,src.z);C.nin=src.nin;C.dir=src.dir;C.Move_Delay=1.2;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x-1,src.y+2,src.z);D.nin=src.nin;D.dir=src.dir;D.Move_Delay=1.2;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x-1,src.y-2,src.z);E.nin=src.nin;E.dir=src.dir;E.Move_Delay=1.2;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge

		else if(src.WaterSpawn)
			var/Multiplier=0.5+(src.WaterSpawn*0.1)
			sleep(1)
			src.icon_state="handseal";src.Stun=999;src.firing=1
			spawn(25-src.WaterChakra)
				src.Stun=0;
				src.firing=0;
				src.icon_state=""
			var/obj/Jutsu/Elemental/Suiton/WaterfallOverlay/AX=new();AX.loc=src.loc;sleep(30-src.WaterChakra);
			spawn()
				src.CreateBubbles("Strong");
			del(AX)
			var/obj/Jutsu/Elemental/Suiton/DaiWater/AA/A=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/BB/B=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/DD/D=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/CC/C=new();var/obj/Jutsu/Elemental/Suiton/DaiWater/EE/E=new()
			if(src.dir==SOUTH)
				A.Owner=src;A.loc=locate(src.x-1,src.y-1,src.z);A.nin=src.nin*Multiplier;A.dir=src.dir;A.Move_Delay=0.8;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc=locate(src.x,src.y-1,src.z);B.nin=src.nin*Multiplier;B.dir=src.dir;B.Move_Delay=0.8;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x+1,src.y-1,src.z);C.nin=src.nin*Multiplier;C.dir=src.dir;C.Move_Delay=0.8;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x-2,src.y-1,src.z);D.nin=src.nin*Multiplier;D.dir=src.dir;D.Move_Delay=0.8;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x+2,src.y-1,src.z);E.nin=src.nin*Multiplier;E.dir=src.dir;E.Move_Delay=0.8;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge
			if(src.dir==NORTH)
				A.Owner=src;A.loc=locate(src.x-1,src.y+1,usr.z);A.nin=src.nin*Multiplier;A.dir=src.dir;A.Move_Delay=0.8;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc = locate(src.x,src.y+1,src.z);B.nin=src.nin*Multiplier;B.dir=src.dir;B.Move_Delay=0.8;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x+1,src.y+1,src.z);C.nin=src.nin*Multiplier;C.dir=src.dir;C.Move_Delay=0.8;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x-2,src.y+1,src.z);D.nin=src.nin*Multiplier;D.dir=src.dir;D.Move_Delay=0.8;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x+2,src.y+1,src.z);E.nin=src.nin*Multiplier;E.dir=src.dir;E.Move_Delay=0.8;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge
			if(src.dir==EAST)
				A.Owner=src;A.loc=locate(src.x+1,src.y+1,src.z);A.nin=src.nin*Multiplier;A.dir=src.dir;A.Move_Delay=0.8;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc=locate(src.x+1,src.y,src.z);B.nin=src.nin*Multiplier;B.dir=src.dir;B.Move_Delay=0.8;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x+1,src.y-1,src.z);C.nin=src.nin*Multiplier;C.dir=src.dir;C.Move_Delay=0.8;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x+1,src.y+2,src.z);D.nin=src.nin*Multiplier;D.dir=src.dir;D.Move_Delay=0.8;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x+1,src.y-2,src.z);E.nin=src.nin*Multiplier;E.dir=src.dir;E.Move_Delay=0.8;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge
			if(src.dir==WEST)
				A.Owner=src;A.loc=locate(src.x-1,src.y+1,src.z);A.nin=src.nin*Multiplier;A.dir=src.dir;A.Move_Delay=0.8;walk(A,src.dir);A.JutsuLevel=src.SuitonKnowledge;B.Owner=src;B.loc=locate(src.x-1,src.y,src.z);B.nin=src.nin*Multiplier;B.dir=src.dir;B.Move_Delay=0.8;walk(B,src.dir);B.JutsuLevel=src.SuitonKnowledge;C.Owner=src;C.loc=locate(src.x-1,src.y-1,src.z);C.nin=src.nin*Multiplier;C.dir=src.dir;C.Move_Delay=0.8;walk(C,src.dir);C.JutsuLevel=src.SuitonKnowledge;D.Owner=src;D.loc=locate(src.x-1,src.y+2,src.z);D.nin=src.nin*Multiplier;D.dir=src.dir;D.Move_Delay=0.8;walk(D,src.dir);D.JutsuLevel=src.SuitonKnowledge;E.Owner=src;E.loc=locate(src.x-1,src.y-2,src.z);E.nin=src.nin*Multiplier;E.dir=src.dir;E.Move_Delay=0.8;walk(E,src.dir);E.JutsuLevel=src.SuitonKnowledge

		else
			src<<"Você precisa de uma fonte de água!"
	BakuSuishouha(Uses)
		src.ChakraDrain(50000)
		src.Handseals(60-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.WaterCheck())
			src.icon_state="Jutsu";src.overlays-='water.dmi';src.overlays+='water.dmi';src.Frozen=1;src.firing=1
			spawn(20)
				src.Frozen=0;src.firing=0;src.overlays-='water.dmi'
			var/Distance=3
			Distance+=src.BakuExpert
			if(Distance>6)
				Distance=6
		//	if(src.key=="CobraT1337")
		//		Distance=20
			for(var/turf/T in range(Distance,src))
				if(src.dir==NORTH||src.dir==SOUTH)
					if(T.y==src.y)
						var/obj/Jutsu/Elemental/Suiton/WaterWave/A=new();A.name="[src]";A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.SuitonKnowledge;A.loc=T;A.dir=src.dir;walk(A,src.dir)
				if(src.dir==WEST||src.dir==EAST)
					if(T.x==src.x)
						var/obj/Jutsu/Elemental/Suiton/WaterWave/A=new();A.name="[src]";A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.SuitonKnowledge;A.loc=T;A.dir=src.dir;walk(A,src.dir)

		else if(src.WaterSpawn)
			var/Multiplier=0.5+(src.WaterSpawn*0.1)
			src.icon_state="Jutsu";src.overlays-='water.dmi';src.overlays+='water.dmi';	src.Frozen=1;src.firing=1
			spawn(20)
				src.Frozen=0;src.firing=0;src.overlays-='water.dmi'
			var/Distance=3
			if(Uses>550)
				Distance=4
			if(Uses>1100)
				Distance=5
		//	if(src.key=="CobraT1337")
		//		Distance=20
			for(var/turf/T in range(Distance,src))
				if(src.dir==NORTH||src.dir==SOUTH)
					if(T.y==src.y)
						var/obj/Jutsu/Elemental/Suiton/WaterWave/A=new();A.name="[src]";A.Owner=src;A.nin=src.nin*Multiplier;A.JutsuLevel=src.SuitonKnowledge;A.loc=T;A.dir=src.dir;walk(A,src.dir)
				if(src.dir==WEST||src.dir==EAST)
					if(T.x==src.x)
						var/obj/Jutsu/Elemental/Suiton/WaterWave/A=new();A.name="[src]";A.Owner=src;A.nin=src.nin*Multiplier;A.JutsuLevel=src.SuitonKnowledge;A.loc=T;A.dir=src.dir;walk(A,src.dir)

		else
			src<<"Você precisa de uma fonte de água!"
	Teppoudama()
		src.ChakraDrain(25000)
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.WaterSpawn||src.WaterCheck())
			src.icon_state="jutsu";src.Frozen=1;src.firing=1
			spawn(5)
				src.icon_state="";src.Frozen=0;src.firing=0
			var/obj/Jutsu/Elemental/Suiton/Teppoudama/K=new()
			if(src.dir==EAST)
				K.pixel_x=16
			if(src.dir==WEST)
				K.pixel_x=-16
			K.loc=src.loc
			K.nin=src.nin
			K.dir=src.dir
			K.name="[src]"
			K.Owner=src
			walk(K,src.dir)
		else
			src<<"Você precisa de uma fonte de água!"
	//Houmatsu Rappa (Water Bubble Wave)
	//HoumatsuRappa()

	//Mizu Teppou (Water Gun)
	MizuTeppou()
		src.ChakraDrain(20000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/obj/Jutsu/Elemental/Suiton/MizuTeppo/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin
		walk(F,F.dir)
		F.JutsuLevel=src.SuitonKnowledge

	//Daibakuryuu (Great Waterfall Flow)
	Daibakuryuu(Uses)
		var/Size=4+(Uses/200)
		var/G=1
		if(Size>=7)
			Size=7
		src.ChakraDrain(45000)
		src.Handseals(50-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="handseal"
		if(src.WaterSpawn||src.WaterCheck())
			var/obj/Jutsu/Elemental/Suiton/Dwater/A=new();A.nin=src.nin*1.7;A.loc = src.loc;A.dir = src.dir;A.Owner = src
			while(G<Size&&src.icon_state=="handseal")
				for(var/turf/D in oview(G,src))
					spawn()
						if(!(D in oview(G-1)))
							var/obj/Jutsu/Elemental/Suiton/Dwater/B=new();B.nin=src.nin/2;B.loc=D;B.Owner = src;B.J=A
				sleep(3)
				G++
		else
			src<<"Você precisa de uma fonte de água!"
		src.icon_state=""

mob/proc/MizuBunshin()
	src.ChakraDrain(30000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if((src.WaterSpawn||src.WaterCheck())==0)
		src<<"Você precisa de uma fonte de água!"
		return
	var/count=0
	for(var/obj/A in oview(2,src))
		if(A.icon=='Icons/BeachSaved.dmi')
			if(prob(25)&&count<50)
				var/mob/Clones/Clone/K=new();K.CloneType="TKageBunshin"
				count++
				K.loc=A.loc;K.Owner=src;K.tai=src.Mtai;K.Endurance=100;K.health=src.health/10;src.chakra-=src.chakra/10
				for(var/V in src.vars)
					var/list/BAD = list("locs","cansave","GateIn","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath","Owner")
					if(!BAD.Find(V))
						K.vars[V] = usr.vars[V]
				if(K)
					K.health=1;K.stamina=0;K.icon=src.icon;K.overlays+=src.overlays;K.name="[src.name]";K.Clone=1;K.Running=1
			del(A)
obj/Jutsu/Elemental/Suiton/Suirou
	icon='Icons/Jutsus/SuitonTechniques.dmi'
	icon_state="Suirou"
	layer=5
	var/mob/Binding
	New()
		..()
		spawn()
			var/mob/O=src.Owner
			var/mob/M=src.Binding
			while(src)
				if(O.icon_state!="handseal")
					M.FrozenBind=""
					O.firing=0;O.Frozen=0
					del(src)
				sleep(3)
		spawn(300)
			del(src)
	Del()
		var/mob/M=src.Owner
		M.icon_state=""
		..()
mob/proc
	WaterPrison()
		var/mob/M = src.target
		if(src.firing)
			return
		if(!M)
			for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
				S.DelayIt(25,usr,"Element")
			src << "You need a target";goto CoolDown
		for(var/obj/Jutsu/Elemental/Suiton/Suirou/P in world)
			if(P.Owner==src)
				del(P)
		src.ChakraDrain(30000)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) goto CoolDown
		if(!src.WaterCheck())
			src <<"You're not on water!"
			goto CoolDown
		var/check=0
		for(var/mob/F in range(1))
			if(F==M&&F.ImmuneToDeath)
				check=2
			else if(F==M)
				check=1
		if(check==2)
			for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
				S.DelayIt(300,usr,"Element")
			src << "They just got up!"
			goto CoolDown
		if(check==0)
			for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
				S.DelayIt(25,usr,"Element")
			src << "They are too far away."
			goto CoolDown
		if(M.FrozenBind!="")
			for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
				S.DelayIt(25,usr,"Element")
			src<<"They're already in a bind!"
			goto CoolDown
		if(M.knockedout||M.Dead)
			for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
				S.DelayIt(25,usr,"Element")
			src<<"They're Knocked Out!"
			goto CoolDown
		if(!M.WaterCheck())
			for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
				S.DelayIt(25,usr,"Element")
			src <<"They're not on water!"
		src.dir = get_dir(src,M)
		var/obj/Jutsu/Elemental/Suiton/Suirou/P = new();
		P.Owner=src;
		P.loc=M.loc;
		P.Binding=M
		M.FrozenBind="Suirou"
		src.FrozenBind="Suirou"
		src.icon_state="handseal"
		M.Frozen=1
		src.Frozen=1
		M << output("<b><font color=blue>Você foi pego em [usr]'s Water Prison Jutsu!</font></b>","Attack")
		M << "Quick, tap space to Struggle!"
		var/Damage=src.nin*1.5
		M.Struggle=0
		while(src.icon_state=="handseal")
			if(M.InHydro)
				M<<"Você absorve a água que [src] formas ao seu redor!"
				usr<<"!?The water prison is absorbed into [M]!?"
				if(M.health<M.maxhealth)
					M.WaterMass += 50
					if(M.health>M.maxhealth) M.health=M.maxhealth
					src.icon_state=""
					goto EndJutsu
			var/damage=(Damage+rand(-10,20))
			src.Frozen=1
			src.firing=1
			M.Frozen=1
			M.firing=1
			src.ChakraDrain(1000)
			src.ChakraDrain(550*(M.Struggle/3))
			M.DamageProc(damage/2,"Health",src)
			M.DamageProc(damage,"Stamina",src)
			if(M.knockedout||M.Dead||src.chakra<=0)
				src.icon_state=""
				M.FrozenBind=""
				src.FrozenBind=""
				src.Frozen=0
				M.Frozen=0
				src.firing=0
				M.firing=0
			sleep(15)
		EndJutsu
		src.Frozen=0
		src.firing=0
		M.FrozenBind=""
		M.Frozen=0
		M.firing=0
		for(var/obj/Jutsu/Elemental/Suiton/Suirou/Objects in world)
			if(Objects.Owner==src)
				del(Objects)
				del(P)
		CoolDown
		for(var/obj/SkillCards/WaterPrison/S in usr.LearnedJutsus)
			S.DelayIt(500,usr,"Element")
		src.icon_state=""
		M.FrozenBind=""
		src.FrozenBind=""
		src.Frozen=0
		M.Frozen=0
		src.firing=0
		M.firing=0

	HydroForm()
		if(src.InHydro)
			src.InHydro=0
			src << "Seu corpo solidifica!"
		else
			src.InHydro = 1
			src << "Você usa o seu chakra para quebrar o seu corpo em uma substância líquida, tornando-se água!"
			while(src.InHydro)
				src.ChakraDrain(1000)
				if(prob(10))
					var/WaterBoost = WaterCheck()
					if(WaterBoost) src.health += 20/WaterBoost
				if(src.WaterMass >= 100 && (src.health < src.maxhealth || src.stamina < src.maxstamina) && src.Guarding)
					if(prob(60) && src.stamina < src.maxstamina)
						src.stamina += 100
					else
						if(src.health<src.maxhealth)
							src.health += 50

					src.ChakraDrain(5000)
					WaterMass -= 100
					if(WaterMass < 0) WaterMass = 0
				if(src.WaterMass)
					src.ChakraDrain(10*src.WaterMass)
				if(src.chakra<=0 || src.Dead || src.knockedout)
					src.InHydro = 0
				sleep(10)
			var/Radius = round(src.WaterMass/100)
			if(Radius > 5) Radius = 5
			for(var/turf/T in getcircle(src,Radius))
				var/obj/Jutsu/Elemental/Suiton/Owater/Z = new /obj/Jutsu/Elemental/Suiton/Owater
				Z.loc=T
				Z.Owner=src.Owner;//Z.JutsuLevel=src.JutsuLevel
			src.WaterMass = 0
			for(var/obj/SkillCards/HydroForm/S in src.LearnedJutsus)
				S.DelayIt(630,usr,"Element")
mob/var/tmp
	InHydro=0
	WaterMass=0
mob/proc/BubbleCreation()
	src.ChakraDrain(30000)//Average amount of charka drain
	src.Handseals(1-src.HandsealSpeed)//Move should be instant but calls proc have checks to prevent use in binds and etc.
	if(src.HandsSlipped) return//standerd
	src.icon_state="Power"//bends them over
	src.firing=1;//freezes the user
//	var/rounds=10;//Number of rounds fired this number can be changed to smaller if to oped.
	var/obj/Jutsu/Elemental/Suiton/Bubble/K=new();K.loc=src.loc;K.Owner=src;K.dir=src.dir;K.Move_Delay=0;K.nin=src.nin
	flick("creating",K)
	src.firing=0
//	world<<"<FONT color= blue> [src] creates a giant bubble!"
mob/proc/BubbleBeamJutsu()
	src.ChakraDrain(25000)
	src.Handseals(40-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Elemental/Suiton/BubbleBeamBall/A= new()
	var/obj/Jutsu/Elemental/Suiton/BubbleBeamBall/B= new()
	var/obj/Jutsu/Elemental/Suiton/BubbleBeamBall/C= new()
	var/obj/Jutsu/Elemental/Suiton/BubbleBeamBall/D= new()
	var/obj/Jutsu/Elemental/Suiton/BubbleBeamBall/E= new()
	if(usr.dir == NORTH)
		A.loc=locate(src.x, src.y+2, src.z)
		B.loc=locate(src.x+1, src.y+1, src.z)
		C.loc=locate(src.x-1, src.y+1, src.z)
		D.loc=locate(src.x+2, src.y, src.z)
		E.loc=locate(src.x-2, src.y, src.z)
	if(usr.dir == SOUTH)
		A.loc=locate(src.x, src.y-2, src.z)
		B.loc=locate(src.x+1, src.y-1, src.z)
		C.loc=locate(src.x-1, src.y-1, src.z)
		D.loc=locate(src.x+2, src.y, src.z)
		E.loc=locate(src.x-2, src.y, src.z)
	if(usr.dir == EAST)
		A.loc=locate(src.x+2, src.y, src.z)
		B.loc=locate(src.x+1, src.y-1, src.z)
		C.loc=locate(src.x+1, src.y+1, src.z)
		D.loc=locate(src.x, src.y+2, src.z)
		E.loc=locate(src.x, src.y-2, src.z)
	if(usr.dir == WEST)
		A.loc=locate(src.x-2, src.y, src.z)
		B.loc=locate(src.x-1, src.y+1, src.z)
		C.loc=locate(src.x-1, src.y-1, src.z)
		D.loc=locate(src.x, src.y-2, src.z)
		E.loc=locate(src.x, src.y+2, src.z)
	if(usr.dir == NORTHWEST)
		return
	if(usr.dir == NORTHEAST)
		return
	if(usr.dir == SOUTHWEST)
		return
	if(usr.dir == SOUTHEAST)
		return
	A.Move_Delay = 1.5
	A.dir = src.dir
	A.nin = src.nin
	A.Owner = src
	walk(A,src.dir,0)
	walk(B,src.dir,0)
	B.Move_Delay = 1.5
	B.dir = src.dir
	B.nin = src.nin
	B.Owner = src
	walk(C,src.dir,0)
	C.Move_Delay = 1.5
	C.dir = src.dir
	C.Owner = src
	C.nin = src.nin
	walk(D,src.dir,0)
	D.Move_Delay = 1.5
	D.dir = src.dir
	D.nin = src.nin
	D.Owner = src
	walk(E,src.dir,0)
	E.Move_Delay = 1.5
	E.dir = src.dir
	E.Owner = src
	E.nin = src.nin
	walk(E,src.dir,0)
mob/proc/UsingWhirlPoolMode()
	var/TimeInWhirlPool=25
	world<<"UsingWhirlPoolMode Proc called for [src]."
	src.WhirlPoolMode=1
	while(src.WhirlPoolMode&&TimeInWhirlPool>0)
		src.ChakraDrain(5000)
		if(src.knockedout)
			src.WhirlPoolMode=0
			src.WhirlPoolSetUp=0
			return
		if(src.chakra<=0)
			src.WhirlPoolMode=0
			src.WhirlPoolSetUp=0
			return
		TimeInWhirlPool--;
		sleep(10)
mob/proc/WhirlPoolControlling()
	if(src.WhirlPoolMode)
		src.WhirlPoolMode=0
		src.WhirlPoolSetUp=0
		src<<"Você param de liberar torrentes de água."
		return
	if(src.WhirlPoolSetUp)
		src<<"Você para de se preparando para o lançamento Torrent."
		src.WhirlPoolSetUp=0
		return
	else
		src.ChakraDrain(25000)
		src<<"Clique duas vezes em qualquer jogador fez a água que você criou para criar um redemoinho lá!"//and move your mouse along it to make dangerous torrents!"
		var/TimeToUse=5
		src.WhirlPoolSetUp=1
		src.WhirlPoolMode=1
		while(TimeToUse>0)
			TimeToUse--
			if(src.knockedout)
				src.WhirlPoolSetUp=0
				src.WhirlPoolMode=0
				TimeToUse=0
			sleep(10)
		return
mob/proc
	WaterCheck()
		var/turf/W = src.loc	//Makes the turf you're standing on a variable, to more easilly check everything. Easier on the code.
		if(istype(W,/turf/water)||istype(W,/turf/water2))//natural water
			return 1
		for(var/obj/Jutsu/Elemental/Suiton/Owater/O in W)//Player made water
			return 2
		return 0
obj/proc
	WaterCheck1()
		var/turf/W = src.loc	//Makes the turf you're standing on a variable, to more easilly check everything. Easier on the code.
		if(istype(W,/turf/water)||istype(W,/turf/water2))
			return 1
		for(var/obj/Jutsu/Elemental/Suiton/Owater/O in W)
			return 2
		return 0
//		for(var/turf/water/A in view(0,src))	<--- Old, used For proc too often, which ate up CPU
//			return 1
//		for(var/turf/water2/A in view(0,src))
//			return 1
//		if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc)
//			return 1
//		return 0

