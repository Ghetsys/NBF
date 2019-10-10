mob/var/tmp
	UsingDaitoppa=0
turf/proc/PushBackOfEpicProportions(Owner,Intensity=2)
	var/mob/O=Owner
	var/RangeOf=10
	if(Intensity==1)
		RangeOf=5
	for(var/mob/M in oview(4,src))
		M.DamageProc(rand(100,200),"Stamina",O)
		M.HitBack(RangeOf,get_dir(src,M))
obj/Jutsu/Elemental/Fuuton
	icon='Icons/Jutsus/FuutonTechniques.dmi'
	Element="Fuuton"
	var/Ignitable=1
	WindTrail
		//icon='lava.dmi'
		icon_state="torrential"
		var/Life=10

		Ignitable=0;
		New()
			..()
			spawn()
				while(src)
					sleep(6)
					for(var/mob/M in src.loc)//oview(0,src))
						if(M.client&&M!=src.Owner&&!M.knockedout)
						//	spawn()
						//		M.DamageProc(rand(30,40),"Stamina",src.Owner)
							M.DamageProc(rand(45,60),"Stamina",src.Owner,"wind trail","grey")
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=8.33
						else if(Z.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=18.33
						else if(Z.JutsuLevel>src.JutsuLevel)
							BaseChance=21.667
						if(prob(BaseChance))
							del(Z)
				//		else
				//			del(src)
			spawn(3)
				spawn(Life)
					del(src)
	FuutonDaitoppaParts
		LevelOne
			icon='Icons/Jutsus/FuutonDaitoppaLevelOne.dmi'
			layer=5
			Part1
				icon_state="0,0"
				pixel_x = -32
				pixel_y = -32
			Part2
				icon_state="1,0"
				pixel_y = -32
			Part3
				icon_state="2,0"
				pixel_x = 32
				pixel_y = -32
			Part4
				icon_state="0,1"
				pixel_x = -32
			Part5
				icon_state="1,1"
			Part6
				icon_state="2,1"
				pixel_x = 32
			Part7
				icon_state="0,2"
				pixel_x = -32
				pixel_y = 32
			Part8
				icon_state="1,2"
				pixel_y = 32
			Part9
				icon_state="2,2"
				pixel_x = 32
				pixel_y = 32
		LevelTwo
			icon='Icons/Jutsus/FuutonDaitoppaLevelTwo.dmi'
			layer=5
			Part1
				icon_state="0,0"
				pixel_x=-64
				pixel_y=-64
			Part2
				icon_state="1,0"
				pixel_x=-32
				pixel_y=-64
			Part3
				icon_state="2,0"
				pixel_y=-64
				pixel_y=-64
			Part4
				icon_state="3,0"
				pixel_x=32
				pixel_y=-64
			Part5
				icon_state="4,0"
				pixel_x=64
				pixel_y=-64

			Part6
				icon_state="0,1"
				pixel_x=-64
				pixel_y=-32
			Part7
				icon_state="1,1"
				pixel_y=-32
				pixel_x=-32
			Part8
				icon_state="2,1"
				pixel_y=-32
			Part9
				icon_state="3,1"
				pixel_y=-32
				pixel_x=32
			Part10
				icon_state="4,1"
				pixel_x=64
				pixel_y=-32

			Part11
				icon_state="0,2"
				pixel_x=-64
			Part12
				icon_state="1,2"
				pixel_x=-32
			Part13
				icon_state="2,2"
			Part14
				icon_state="3,2"
				pixel_x=32
			Part15
				icon_state="4,2"
				pixel_x=64

			Part16
				icon_state="0,3"
				pixel_x=-64
				pixel_y=32
			Part17
				icon_state="1,3"
				pixel_x=-32
				pixel_y=32
			Part18
				icon_state="2,3"
				pixel_y=32
			Part19
				icon_state="3,3"
				pixel_x=32
				pixel_y=32
			Part20
				icon_state="4,3"
				pixel_x=64
				pixel_y=32

			Part21
				icon_state="0,4"
				pixel_x=-64
				pixel_y=64
			Part22
				icon_state="1,4"
				pixel_x=-32
				pixel_y=64
			Part23
				icon_state="2,4"
				pixel_y=64
			Part24
				icon_state="3,4"
				pixel_x=32
				pixel_y=64
			Part25
				icon_state="4,4"
				pixel_x=64
				pixel_y=64
		LevelThree
			icon='Icons/Jutsus/FuutonDaitoppaLevelThree.dmi'
			layer=5
			Part1
				icon_state="0,0"
				pixel_x=-96
				pixel_y=-96
			Part2
				icon_state="1,0"
				pixel_x=-64
				pixel_y=-96
			Part3
				icon_state="2,0"
				pixel_x=-32
				pixel_y=-96
			Part4
				icon_state="3,0"
				pixel_y=-96
			Part5
				icon_state="4,0"
				pixel_x=32
				pixel_y=-96
			Part6
				icon_state="5,0"
				pixel_x=64
				pixel_y=-96
			Part7
				icon_state="6,0"
				pixel_x=96
				pixel_y=-96
		///////////////////////////////////
			Part8
				icon_state="0,1"
				pixel_x=-96
				pixel_y=-64
			Part9
				icon_state="1,1"
				pixel_x=-64
				pixel_y=-64
			Part10
				icon_state="2,1"
				pixel_x=-32
				pixel_y=-64
			Part11
				icon_state="3,1"
				pixel_y=-64
			Part12
				icon_state="4,1"
				pixel_x=32
				pixel_y=-64
			Part13
				icon_state="5,1"
				pixel_x=64
				pixel_y=-64
			Part14
				icon_state="6,1"
				pixel_x=96
				pixel_y=-64
         /////////////////////////////////////
			Part15
				icon_state="0,2"
				pixel_x=-96
				pixel_y=-32
			Part16
				icon_state="1,2"
				pixel_x=-64
				pixel_y=-32
			Part17
				icon_state="2,2"
				pixel_x=-32
				pixel_y=-32
			Part18
				icon_state="3,2"
				pixel_y=-32
			Part19
				icon_state="4,2"
				pixel_x=32
				pixel_y=-32
			Part20
				icon_state="5,2"
				pixel_x=64
				pixel_y=-32
			Part21
				icon_state="6,2"
				pixel_x=96
				pixel_y=-32
	    /////////////////////////////////////
			Part22
				icon_state="0,3"
				pixel_x=-96
			Part23
				icon_state="1,3"
				pixel_x=-64
			Part24
				icon_state="2,3"
				pixel_x=-32
			Part25
				icon_state="3,3"
			Part26
				icon_state="4,3"
				pixel_x=32
			Part27
				icon_state="5,3"
				pixel_x=64
			Part28
				icon_state="6,3"
				pixel_x=96
         /////////////////////////////////////
			Part29
				icon_state="0,4"
				pixel_x=-96
				pixel_y=32
			Part30
				icon_state="1,4"
				pixel_x=-64
				pixel_y=32
			Part31
				icon_state="2,4"
				pixel_x=-32
				pixel_y=32
			Part32
				icon_state="3,4"
				pixel_y=32
			Part33
				icon_state="4,4"
				pixel_x=32
				pixel_y=32
			Part34
				icon_state="5,4"
				pixel_x=64
				pixel_y=32
			Part35
				icon_state="6,4"
				pixel_x=96
				pixel_y=32
         /////////////////////////////////////
			Part36
				icon_state="0,5"
				pixel_x=-96
				pixel_y=64
			Part37
				icon_state="1,5"
				pixel_x=-64
				pixel_y=64
			Part38
				icon_state="2,5"
				pixel_x=-32
				pixel_y=64
			Part39
				icon_state="3,5"
				pixel_y=64
			Part40
				icon_state="4,5"
				pixel_x=32
				pixel_y=64
			Part41
				icon_state="5,5"
				pixel_x=64
				pixel_y=64
			Part42
				icon_state="6,5"
				pixel_x=96
				pixel_y=64
         /////////////////////////////////////
			Part43
				icon_state="0,6"
				pixel_x=-96
				pixel_y=96
			Part44
				icon_state="1,6"
				pixel_x=-64
				pixel_y=96
			Part45
				icon_state="2,6"
				pixel_x=-32
				pixel_y=96
			Part46
				icon_state="3,6"
				pixel_y=96
			Part47
				icon_state="4,6"
				pixel_x=32
				pixel_y=96
			Part48
				icon_state="5,6"
				pixel_x=64
				pixel_y=96
			Part49
				icon_state="6,6"
				pixel_x=96
				pixel_y=96
	KazeDangan
		icon_state = "KazeDangan(Projectile)"
		density=1
		Move_Delay=0
		var/nin=10
		var/PPP=6//var for push back to vacuumcannon and dangan can use the same icon.
		Move()
			var/prevloc=src.loc
			..()
			var/mob/O=src.Owner
			//if(O.Charging&&O.TorrentialWinds>0)
			if(O&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(O.TorrentialWinds*10)
			if(O&&O.Tornado)
				for(var/mob/M in view(1,src))
					if(M!=O&&prob(85))
						spawn()
							step_towards(M,src)
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				while(src)
					spawn(8)
						if(O.key=="CobraT1337")
							src.SoundEngine2('SFX/WindSFX.wav',5)
						else
							src.SoundEngine('SFX/WindSFX.wav',6)
					sleep(1)
					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if(P.JutsuLevel>(src.JutsuLevel*3))
								BaseChance=2.5
							else if(P.JutsuLevel>(src.JutsuLevel*2))
								BaseChance=5.5
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=6.5
							if(prob(BaseChance))
								del(P)
					//		if(P.JutsuLevel*0.5>src.JutsuLevel)
					//			del(src)
					//		else
					//			del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
				//	for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
				//		if(Z.JutsuLevel*0.5>src.JutsuLevel)
				//			del(src)
				//		else
				//			del(Z)
				//	for(var/obj/Jutsu/Explosion/Z in src.loc)
				//		var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
				//		AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
				//		AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
				//		AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
				//		del(src)
				//	for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
				//		var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
				//		AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
				//		AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
				//		AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
				//		del(src)

			spawn(30)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=round(rand(src.nin*240,src.nin*300))
				var/WindChakra=WindDamage(O)
				damage=round(damage*(WindChakra*0.02+0.8));damage=damage/(M.Endurance/2)
				M.DamageProc(damage,"Stamina",O,"Kaze Dangan","grey")
				spawn() M.SoundEngine('SFX/HitStrong.wav',7)
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			//	view(M)<<output("<font color=white>[M] was by Kaze Dangan!([damage])</font>","Attack")
				spawn(1) M.HitBack(6,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
	VaccumCannon
		icon_state = "VacuumSphere"
		density=1
		Move_Delay=0
		var/nin=10
		var/PPP=6//var for push back to vacuumcannon and dangan can use the same icon.
		Move()
			var/prevloc=src.loc
			..()
			var/mob/O=src.Owner
			//if(O.Charging&&O.TorrentialWinds>0)
			if(O&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(O.TorrentialWinds*10)
			if(O&&O.Tornado)
				for(var/mob/M in view(1,src))
					if(M!=O&&prob(85))
						spawn()
							step_towards(M,src)
		New()
			..()
			spawn()
				while(src)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',6)
					sleep(1)
					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if(P.JutsuLevel>(src.JutsuLevel*3))
								BaseChance=2.5
							else if(P.JutsuLevel>(src.JutsuLevel*2))
								BaseChance=5.5
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=6.5
							if(prob(BaseChance))
								del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
					/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
*/
			spawn(30)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=round(rand(src.nin*150,src.nin*190))
				var/WindChakra=WindDamage(O)
				damage=round(damage*(WindChakra*0.02+0.8));damage=damage/(M.Endurance/7.5)
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*2)
				M.DamageProc(damage,"Stamina",O,"Vacuum Cannon","grey")
				spawn() M.SoundEngine('SFX/HitStrong.wav',6)
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			//	view(M)<<output("<font color=white>[M] was by VaccumCannon!([damage])</font>","Attack")
				M.HitBack(8,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
	Reppushou
		icon_state = "Reppushou"
		density=0
		Move_Delay=1
		var/nin=10
		Move()
			var/prevloc=src.loc
			..()
			for(var/obj/Jutsu/Elemental/Doton/D in src.loc)
				if(D.density)
					del(src)
			var/mob/O=src.Owner
			if(O&&O.TorrentialWinds>0&&src.loc!=prevloc)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(O.TorrentialWinds*10)
			if(O&&O.Tornado)
				for(var/mob/M in view(1,src))
					if(M!=O&&prob(85))
						spawn()
							step_towards(M,src)
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				var/WindChakra=WindDamage(O)
				while(src)
					sleep(1)
			//		spawn(8)
			//			if(O.key=="CobraT1337")
			//				src.SoundEngine2('SFX/WindSFX.wav',5)
			//			else
			//				src.SoundEngine('SFX/WindSFX.wav',6)
					sleep(3)
					for(var/mob/M in src.loc)
						if(M.Kaiten||M.sphere||M.Mogu)
							return
						var/damage=round(rand(src.nin*25,src.nin*40))//22 and 35 if I decide to change it back
						damage=round(((damage*1.15)*(WindChakra*0.02+0.8)));
						damage=damage/(M.Endurance/2.5)//Was /2
					//	if(O.Trait=="Old Powerful")
					//		damage+=(O.NinSkill)
						if(damage>150)
							damage=150
						M.DamageProc(damage,"Stamina",O,"Reppushou","grey")
						if(M&&M.RaiArmor)
							M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
					//	view(M)<<output("<font color=white>[M] was by Fuuton Reppushou!([damage])</font>","Attack")
						M.dir=src.dir
						M.HitBack(2,src.dir)
					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if(P.JutsuLevel>(src.JutsuLevel*3))
								BaseChance=5
							else if(P.JutsuLevel>(src.JutsuLevel*2))
								BaseChance=11
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=12
							if(prob(BaseChance))
								del(P)
						//	if(P.JutsuLevel*0.5>src.JutsuLevel)
						//		del(src)
						//	else
						//		del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
			//		for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
			//			if(Z.JutsuLevel*0.5>src.JutsuLevel)
			//				del(src)
			//			else
			//				del(Z)
					for(var/obj/WEAPONS/Z in src.loc)
						sleep(1)
						if(Z.dir==src.dir)
							Z.TilesA+=2;Z.loc=src.loc
							spawn()
								while(src&&Z)
									Z.loc=src.loc;sleep(1)
						else
							if(Z.dir==turn(src.dir,45)||Z.dir==turn(src.dir,-45)||Z.dir==turn(src.dir,90)||Z.dir==turn(src.dir,-90))
								Z.dir=src.dir;Z.loc=src.loc
							else
								del(Z)
			//		for(var/obj/Jutsu/Explosion/Z in src.loc)
			//			var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
			//			AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
			//			AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
			//			AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
			//			del(src)
			//		for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
			//			var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
			//			AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
			//			AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
			//			AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
			//			del(src)
			spawn(30)
				del(src)
	Kakeami
		icon_state = "Kakeami"
		density=1
		Move_Delay=1
		var/nin=10
		Move()
			var/prevloc=src.loc
			..()
			for(var/obj/Jutsu/Elemental/Doton/D in src.loc)
				if(D.density)
					del(src)
			var/mob/O=src.Owner
			//if(O.Charging&&O.TorrentialWinds>0&&src.loc!=prevloc)
			if(O&&O.TorrentialWinds>0&&src.loc!=prevloc)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(O.TorrentialWinds*10)
			if(O&&O.Tornado)
				for(var/mob/M in view(1,src))
					if(M!=O&&prob(55))
						spawn()
							step_towards(M,src)
		New()
			..()
			spawn(1)
		//		var/mob/O=src.Owner
		//		var/WindChakra=WindDamage(O)
				while(src)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',4)
					sleep(4)
					for(var/obj/Jutsu/Elemental/Raiton/Z in view(1,src))//src.loc)
						if(Z.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=40
						else if((Z.JutsuLevel)>(src.JutsuLevel*2))
							BaseChance=62
						else if(Z.JutsuLevel>src.JutsuLevel)
							BaseChance=80
						if(prob(BaseChance))
							del(Z)
				//		if(Z.JutsuLevel*0.2>src.JutsuLevel)
				//			del(src)
				//		else
				//			del(Z)
					for(var/obj/WEAPONS/Z in src.loc)
						if(Z.dir==src.dir)
							Z.TilesA+=2;Z.loc=src.loc
							spawn()
								while(src&&Z)
									Z.loc=src.loc;sleep(1)
						else
							if(Z.dir==turn(src.dir,45)||Z.dir==turn(src.dir,-45)||Z.dir==turn(src.dir,90)||Z.dir==turn(src.dir,-90))
								Z.dir=src.dir;Z.loc=src.loc
							else
								del(Z)
			spawn(15)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=M.maxhealth*0.04
				var/WindChakra=WindDamage(O)
				damage=round((damage*(WindChakra*0.02+1.1))+(src.nin*0.5))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*0.5)
				M.DamageProc(damage,"Health",O,"Fuuton Kakeami","grey")
			//	view(M)<<output("<font color=white>[M] was caught by Fuuton Kakeami!([damage])</font>","Attack")
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
				viewers()<<sound('SFX/HitStrong.wav',0,0,1)
				M.HitBack(1,src.dir)
				M.Stun=10;
				del(src)
			if(istype(A,/obj/))
				var/obj/O=A
				if(src.type==O.type)
					src.loc=O.loc
				else if(istype(A,/obj/Doors/))
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
	VacuumSphere
		icon_state = "VacuumSphere"
		density=1
		Move_Delay=0
		var/nin=10

		New()
			..()
			spawn()
				while(src)
					sleep(1)
				//	spawn(8)
				//		src.SoundEngine('SFX/WindSFX.wav',6)
					for(var/obj/Jutsu/P in oview(1,src))//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if((P.JutsuLevel*3)>(src.JutsuLevel*9))
								BaseChance=2.5
							else if((P.JutsuLevel*2)>(src.JutsuLevel*4))
								BaseChance=5.5
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=6.5
							if(prob(BaseChance))
								del(P)
						//	if(P.JutsuLevel*0.5>src.JutsuLevel)
						//		del(src)
						//	else
						//		del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)


					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
							*/

			spawn(30)
				del(src)
		Bump(A)
	//		..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=M.maxhealth*0.04
				var/WindChakra=WindDamage(O)
				damage=round((damage*(WindChakra*0.02+1.1))+(src.nin*0.5))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*0.5)
				M.DamageProc(damage,"Health",O,"Vacuum Sphere","grey")
			//	view(M)<<output("<font color=white>[M] was hit by Fuuton VacuumSphere!([damage])</font>","Attack")
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
				viewers()<<sound('SFX/HitStrong.wav',0,0,1)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
				M.HitBack(1,src.dir)
				del(src)
			if(istype(A,/obj/))
				var/obj/O=A
				if(src.type==O.type)
					src.loc=O.loc
				else if(istype(A,/obj/Doors/))
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
	VacuumSerialWaves
		icon_state = "MultiVacuumSphere"
		density=1
		Move_Delay=0
		var/nin=10
		Owner
		New()
			..()
			spawn()
				while(src)
					sleep(1)
		//			spawn(8)
		//				src.SoundEngine('SFX/WindSFX.wav',5)


					for(var/obj/Jutsu/P in oview(1,src))//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if((P.JutsuLevel*3)>(src.JutsuLevel*9))
								BaseChance=2.5
							else if((P.JutsuLevel*2)>(src.JutsuLevel*4))
								BaseChance=5.5
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=6.5
							if(prob(BaseChance))
								del(P)
					//		if(P.JutsuLevel*0.5>src.JutsuLevel)
					//			del(src)
					//		else
					//			del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
					/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
							*/

			spawn(30)
				del(src)
		Bump(A)
		//	..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				//Damage done to healh
				var/damage=M.maxhealth*0.03
				var/WindChakra=WindDamage(O)
				damage=round(damage*(WindChakra*0.02+1.1))
				if(O&&O.Trait=="Old Powerful")
					damage+=(O.NinSkill)
				M.DamageProc(damage,"Health",O)

				//Damage done to stamina
				var/damageS=O.NinSkill*450
				damageS=round(damageS*(WindChakra*0.04+1.3))
				damageS/=M.Endurance
				M.DamageProc(damageS,"Stamina",O,"Vacuum Serial Waves","grey")

			//	view(M)<<output("<font color=white>[M] was hit by Fuuton VacuumSerialWaves!([damage]Health-[damage]Stamina)</font>","Attack")
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
				viewers()<<sound('SFX/HitStrong.wav',0,0,1)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
				M.HitBack(5,src.dir)
				del(src)
			if(istype(A,/obj/))
				var/obj/O=A
				if(src.type==O.type)
					src.loc=O.loc
				else if(istype(A,/obj/Doors/))
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
	FuutonRenkuudan
		icon_state="1,2"
		layer=MOB_LAYER+2
		density=1
		var/hit=0
		var/nin=10
		A
			icon_state="3,1"
			pixel_x = -32
			pixel_y = 64
		B
			icon_state="3,2"
			pixel_y = 64
		C
			icon_state="3,3"
			pixel_x = 32
			pixel_y = 64
		F
			icon_state="2,1"
			pixel_x = -32
			pixel_y = 32
		G
			icon_state="2,2"
			pixel_y = 32
		H
			icon_state="2,3"
			pixel_x = 32
			pixel_y = 32
		D
			icon_state="1,1"
			pixel_x = -32
		E
			icon_state="1,3"
			pixel_x = 32
		Move()
			var/prevloc=src.loc
			..()
			var/mob/O=src.Owner
			if(O&&O.Charging&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(O.TorrentialWinds*10)
			if(O&&O.Tornado)
				for(var/mob/M in view(2,src))
					if(M!=O&&prob(85))
						spawn()
							step_towards(M,src)
		New()
			..()
			src.icon+=rgb(0,0,0,200);overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/A;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/B;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/C;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/D;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/E;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/F;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/G;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/H
			spawn()
				while(src)
					sleep(1)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',9)
			spawn(10)
				del(src)
		Del()
			var/turf/X=src.loc
			src.CreateSmoke("Strong")
			X.PushBackOfEpicProportions(src.Owner)
			..()
		Bump(A)
			..()
			if(src.hit)
				return
			src.hit=1
			if(ismob(A))
				var/mob/M=A
				if(M.Kaiten||M.sphere){return}
				var/mob/O=src.Owner
				var/damage=round(rand(src.nin*500,src.nin*600))
				var/WindChakra=WindDamage(O);damage=round(damage*(WindChakra*0.02+1.3))
				damage=damage/(M.Endurance/7.5)
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*5)
				M.DamageProc(damage,"Stamina",O,"Renkuudan","grey")
				M.HitBack(3,src.dir)
				for(var/i=5, i>0, i--)
					spawn()M.SoundEngine('SFX/HitStrong.wav',10)
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			//	view(M)<<output("<font color=white>[M] was hit by Renkuudan!([damage])</font>","Attack")
				for(var/mob/P in oview(2,M))
					if(P!=O)
						spawn()
							P.DamageProc(damage/10,"Stamina",O,"Pressure from the Near Renkuudan","grey")
					//		view(P)<<output("<font color=white>[P] was by Renkuudan!([damage/10])</font>","Attack")
				sleep(1)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin*15)
					del(src)
				else
					del(src)
	FdaitoppaTail
		icon_state="tail"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
				del(src)
	FdaitoppaParts
		layer = MOB_LAYER+2
		dir = NORTH
		A
			icon_state="1"
			pixel_x = -32
			pixel_y = 32
		B
			icon_state="2"
			pixel_y = 32
		C
			icon_state="3"
			pixel_x = 32
			pixel_y = 32
		D
			icon_state="4"
			pixel_x = -32
		E
			icon_state="6"
			pixel_x = 32
		F
			icon_state="7"
			pixel_x = -32
			pixel_y = -32
		G
			icon_state="8"
			pixel_y = -32
		H
			icon_state="9"
			pixel_x = 32
			pixel_y = -32
	Fdaitoppa
		icon=null
		icon_state=""
		layer = MOB_LAYER+2
		dir = NORTH
		var/nin=10
		var/Range=1
		Move()
			var/mob/O=src.Owner
			var/prevloc=src.loc
			..()
		//	for(var/obj/Jutsu/Elemental/Doton/D in view(1,src))
		//		if(D.density)
		//			if(O.Frozen)
		//				O.Frozen=0
		//			del(src)
		//	var/mob/O=src.Owner
			if(O&&O.Charging&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(10*O.TorrentialWinds)
			if(O&&O.Tornado)
				for(var/mob/M in view(2,src))
					if(M!=O&&prob(95))
						spawn()
							step_towards(M,src)
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				var/WindChakra=WindDamage(O)
				while(src)
				//	spawn(8)
				//		if(O.key=="CobraT1337")
				//			src.SoundEngine2('SFX/WindSFX.wav',9)
				//		else
				//			src.SoundEngine('SFX/WindSFX.wav',6)
					sleep(1)
					spawn(1) for(var/mob/M in view(Range,src))
						spawn()
							if(M.Mogu||M.sphere||M.Kaiten)
								continue
							else
								var/damage=round((src.nin*rand(28,36))*((WindChakra*0.02)+1.1));//was +1.3; Raised the Usage of Nin for the damage, making it much more cap based.
								var/Chakraz=M.ChakraArmor*0.01;
								damage=round(damage)*(O.WindChakra*0.075);//*0.1
								damage=damage-(Chakraz*damage);
								damage=damage/((M.Endurance+1)/1.4)
								if(O.Trait=="Old Powerful")
									damage+=(O.NinSkill)
								if(M.RaiArmor&&M.RaiArmor!=2)
									M.overlays-='Icons/Jutsus/RaiArmor.dmi';
									M.tempmix='Icons/Jutsus/ChakraAura.dmi';
									M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
								M.DamageProc(damage,"Stamina",O,"wind","grey")
								if(M)
							//		view(M)<<output("<font color=white>[M] has been shot back by the wind!([damage])","Attack")
									M.HitBack(1,src.dir)
					for(var/obj/T in view(1,src))
						if(istype(T,/obj/WEAPONS/Kunai)||istype(T,/obj/WEAPONS/Shuriken)||istype(T,/obj/Jutsu/Elemental/Doton/Doryuudan5))
							walk(T,0)
							T.dir=src.dir
							walk(T,O.dir)
					for(var/obj/Jutsu/Elemental/Raiton/Z in view(1,src))//src.loc)
						if((Z.JutsuLevel*3)>(src.JutsuLevel*9))
							BaseChance=25
						else if((Z.JutsuLevel*2)>(src.JutsuLevel*4))
							BaseChance=55
						else if(Z.JutsuLevel>src.JutsuLevel)
							BaseChance=80
						if(prob(BaseChance))
							del(Z)
					//	if(Z.JutsuLevel*0.2>src.JutsuLevel)
					//		del(src)
					//	else
					//		del(Z)
			spawn(50)
				del(src)
	GreatSphere
		icon_state="5"
		layer = MOB_LAYER+2
		dir = NORTH
		var/nin=10
		var/Range=1
		density=1
		Move()
			var/prevloc=src.loc
			..()
			for(var/obj/Jutsu/Elemental/Doton/D in view(1,src))
				if(D.density)
					del(src)
			var/mob/O=src.Owner
			if(O&&O.Charging&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(10*O.TorrentialWinds)
		New()
			..()
			overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part1;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part2;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part3;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part4;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part5;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part6
			overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part7;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part8;overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part9
			spawn(1)
			//	var/mob/O=src.Owner
				while(src)
					sleep(1)
				//	spawn(8)
				//		src.SoundEngine('WindSFX.wav',5)

					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if((P.JutsuLevel*3)>(src.JutsuLevel*9))
								BaseChance=25
							else if((P.JutsuLevel*2)>(src.JutsuLevel*4))
								BaseChance=55
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=65
							if(prob(BaseChance))
								del(P)
					//		if(P.JutsuLevel*0.5>src.JutsuLevel)
					//			del(src)
					//		else
					//			del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
							/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/T in view(1,src))
						if(istype(T,/obj/WEAPONS/Kunai)||istype(T,/obj/WEAPONS/Shuriken))
							walk(T,0)
							T.dir=src.dir
							walk(T,O.dir)
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					sleep(1)
					*/
					for(var/mob/Q in view(1,src))
						if(Q!=src.Owner);
					//		Q.HitBack(15,src.dir)
							Q.HitBack(3,src.dir)

			spawn(55)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=M.maxhealth*0.15
				var/WindChakra=WindDamage(O)
				damage+=src.nin
				damage=round(damage*(WindChakra*0.02+1.1))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
				M.DamageProc(damage,"Health",O,"Great Sphere","grey")
			//	view(M)<<output("<font color=white>[M] has been hit by GreatSphere for([damage])!","Attack")
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
				viewers()<<sound('SFX/Slice.wav',0,0,1)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
				M.HitBack(5,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
		Del()
			var/turf/X=src.loc
			X.PushBackOfEpicProportions(src.Owner)
		//	for(var/mob/Q in view(2,src))
		//		if(Q!=src.Owner);
		//			Q.HitBack(15,src.dir)
		//			Q.HitBack(4,src.dir)
			..()
	KazeKiri
		icon_state="JuuhaShou"
		pixel_step_size=16
		density=1
		var/nin=10
		Move()
			var/turf/old_loc=src.loc
			..()
			var/mob/O=src.Owner
			if(O&&O.Charging&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/L=new();L.loc=old_loc;L.dir=src.dir;L.Owner=src.Owner;L.Life=(10*O.TorrentialWinds)
			if(O&&O.Tornado)
				for(var/mob/M in view(1,src))
					if(M!=O&&prob(75))
						spawn()
							step_towards(M,src)
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					spawn(8)
						src.SoundEngine('WindSFX.wav',3)

					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if((P.JutsuLevel*3)>(src.JutsuLevel*9))
								BaseChance=25
							else if((P.JutsuLevel*2)>(src.JutsuLevel*4))
								BaseChance=55
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=65
							if(prob(BaseChance))
								del(P)
			//				if(P.JutsuLevel*0.5>src.JutsuLevel)
			//					del(src)
			//				else
			//					del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
							*/
			spawn(30)
				del(src)

		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				var/damage=O.nin*3
				var/WindChakra=WindDamage(O)
				damage=round(damage*(WindChakra*0.03+1.3))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
				var/cap=400+O.gen*1.5
				if(damage>cap)
					damage=cap;
				M.DamageProc(damage,"Health",O,"Kazekiri","grey")
			//	view(M)<<output("<font color=white>[M] was hit by Fuuton Kazekiri!([damage])</font>","Attack")
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
				viewers()<<sound('SFX/Slice.wav',0,0,1)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
				src.loc=M.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				else
					del(src)
	WindScytheParts
		layer = MOB_LAYER+2
		density = 1
		A
			icon_state="F3,1"
			pixel_x = -32
			pixel_y = 64
		B
			icon_state="F3,2"
			pixel_y = 64
		C
			icon_state="F3,3"
			pixel_x = 32
			pixel_y = 64
		F
			icon_state="F2,1"
			pixel_x = -32
			pixel_y = 32
		G
			icon_state="F2,2"
			pixel_y = 32
		H
			icon_state="F2,3"
			pixel_x=32
			pixel_y=32
		D
			icon_state="F1,1"
			pixel_x=-32
		E
			icon_state="F1,3"
			pixel_x=32
	WindScythe
		icon_state="F1,2"
		Element = "Fuuton"
		layer = MOB_LAYER+2
		density = 1
		JutsuLevel=1
		var/nin=10
		Move()
			var/prevloc=src.loc
			..()
			var/mob/O=src.Owner
			if(O&&O.Charging&&O.TorrentialWinds>0)
				var/obj/Jutsu/Elemental/Fuuton/WindTrail/W=new()
				W.loc=prevloc;W.dir=src.dir;W.Owner=src.Owner;W.Life=(O.TorrentialWinds*10)
			if(O&&O.Tornado)
				for(var/mob/M in view(2,src))
					if(M!=O&&prob(75))
						spawn()
							step_towards(M,src)
		New()
			..()
			overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/A;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/B;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/C;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/D;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/E;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/F;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/G;overlays+=/obj/Jutsu/Elemental/Fuuton/WindScytheParts/H
			spawn(1)
				var/mob/O=src.Owner
				var/WindChakra=WindDamage(O)
				while(src)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',3)
					sleep(1)
					for(var/mob/M in oview(1,src))
						if(!M.Mogu)
							if(M.sphere)
								viewers()<<sound('SFX/Guard.wav',0);return
							var/damage=rand(M.maxhealth*0.03,M.maxhealth*0.05);damage=round(damage*(WindChakra*0.02+0.8))
							if(O.Trait=="Old Powerful") damage+=(O.NinSkill*2)
						//	view(M)<<output("<font color=white>[M] was hit by Fuuton Kaze Gai!([damage])</font>","Attack")
							spawn()
								M.Bloody();M.Bloody();M.Bloody();M.Bloody()
							M.DamageProc(damage,"Health",O,"Wind Scythe","grey")
							if(M.RaiArmor&&M.RaiArmor!=2)
								M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if((P.JutsuLevel*3)>src.JutsuLevel)
								BaseChance=25
							else if((P.JutsuLevel*2)>src.JutsuLevel)
								BaseChance=55
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=65
							if(prob(BaseChance))
								del(P)
				//			if(P.JutsuLevel*0.5>src.JutsuLevel)
				//				del(src)
				//			else
				//				del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)




								/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
						*/
			spawn(30)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M.sphere)
					viewers()<<sound('SFX/Guard.wav',0);return
				var/WindChakra=WindDamage(O)
				var/damage=rand(M.maxhealth*0.03,M.maxhealth*0.05);damage=round(damage*(WindChakra*0.02+0.8))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*2)
			//	view(M) << "[M] was hit by Kaze Gai for [damage] damage!!"
				spawn()
					if(M)
						M.Bloody();M.Bloody();M.Bloody();M.Bloody()
				step(M,src.dir)
				M.DamageProc(damage,"Health",O,"Kaze Gai","grey")
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			if(istype(A,/obj/Doors/))
				var/obj/O=A
				O.DamageProc(src.nin)
				del(src)
	DaiKamaitachi
		icon_state = "Whirlwind"
		density=0
		layer=MOB_LAYER+1
		Move_Delay=0
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',10,40)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M!=src.Owner)
							var/WindChakra=WindDamage(O)
							var/damage=rand(M.maxhealth*0.01,M.maxhealth*0.03);damage=round(damage*(WindChakra*0.04+0.8))
							M.DamageProc(damage*6,"Stamina",O)
							view(M)<<output("<font color=white>[M] has been hit by DaiKamaitachi for([damage*6]) Stamina!","Attack")
							M.DamageProc(damage,"Health",O)
							view(M)<<output("<font color=white>[M] has been hit by DaiKamaitachi for([damage]) health!","Attack")
							M.HitBack(10,get_dir(src,M))
							if(M.RaiArmor&&M.RaiArmor!=2)
								M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
							del(src)
					for(var/obj/T in view(1,src))
						if(istype(T,/obj/WEAPONS/Kunai)||istype(T,/obj/WEAPONS/Shuriken))
							walk(T,0)
							T.dir=src.dir
							walk(T,O.dir)
			spawn(10)
				del(src)
//Air Bender moves
	Gust
		icon_state = "(air)"
		density=0
		layer=MOB_LAYER+1
		Move_Delay=0
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M.Mogu)
							return
						if(M!=O)
							M.HitBack(1,src.dir)
							if(M.RaiArmor&&M.RaiArmor!=2)
								M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			spawn(30)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Fuuton/Gust/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner
			..()
	Whirlwind
		icon_state = "Whirlwind"
		density=0
		layer=MOB_LAYER+1
		Move_Delay=0
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',10,40)
					var/mob/O=src.Owner
					for(var/mob/M in src.loc)
						if(M!=src.Owner)
							M.DamageProc(50,"Stamina",O)
							if(prob(5))
								M.DamageProc(25,"Health",O)
							if(prob(5))
								M.HitBack(10,get_dir(src,M))
							if(M.RaiArmor&&M.RaiArmor!=2)
								M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			spawn(30)
				del(src)
	AirBall
		icon_state = "KazeDangan(Projectile)"
		density=1
		Move_Delay=0
		var/nin=10
		proc
			Explode()
				var/turf/X=src.loc
				spawn() X.PushBackOfEpicProportions(src.Owner,1)
		New()
			..()
			spawn()
				while(src)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',5)
					sleep(1)

					for(var/obj/Jutsu/P in src.loc)//Changed to a much better for loop as of 11/16/12
						if(istype(P,/obj/Jutsu/Elemental/Raiton))
							if(P.JutsuLevel*0.5>src.JutsuLevel)
								del(src)
							else
								del(P)
						if(istype(P,/obj/Jutsu/Explosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
						if(istype(P,/obj/Jutsu/SmallExplosion))
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(src)
					/*
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
					for(var/obj/Jutsu/Explosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/SmallExplosion/Z in src.loc)
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(src)
					for(var/obj/Jutsu/Elemental/Raiton/Z in src.loc)
						if(Z.JutsuLevel*0.5>src.JutsuLevel)
							del(src)
						else
							del(Z)
							*/

			spawn(30)
				del(src)
		Del()
			src.Explode()
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner;var/damage=round(rand(src.nin*85,src.nin*125));damage=round(damage*(O.WindChakra*0.02+0.8));damage=damage/(M.Endurance/3)
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*5)
				M.DamageProc(damage,"Stamina",O)
				spawn() M.SoundEngine('SFX/HitStrong.wav',10,65)
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
				view(M)<<output("<font color=white>[M] was by Kaze Dangan!([damage])</font>","Attack")
				spawn(1) M.HitBack(4,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
//end if airbender moves

mob/proc
	AirDash()
		if(src.Frozen||src.FrozenBind!="")
			return
		src.ChakraDrain(10000)
		src<<"You increase your speed with a dash of swift air."
		src.Running=1
		//src.Move_Delay=0
		step(src,src.dir);sleep(1);step(src,src.dir);sleep(1)
		if(prob(50))
			step(src,src.dir)
	Gust()
		src.ChakraDrain(10000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		flick("Attack1",src);src.Frozen=1;var/obj/Jutsu/Elemental/Fuuton/Gust/A=new();A.loc=src.loc;walk(A,src.dir);A.Owner=src
		spawn(15)
			src.Frozen=0
			for(var/obj/Jutsu/Elemental/Fuuton/Gust/C in world)
				if(C.Owner==src)
					del(C)
	Whirlwind()
		if(src.InGarou||src.FrozenBind)
			return
		else
			src.ChakraDrain(12000)
			src.Handseals(1-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.Frozen=1;src.firing=1
			src<<"You begin to spin!"
			var/XC=8
			while(XC>0)
				src.dir=turn(src.dir,45)
				XC--
				sleep(1)
			src.Frozen=0;src.firing=0
			var/obj/Jutsu/Elemental/Fuuton/Whirlwind/A=new();A.Owner=src;A.loc=src.loc;walk(A,src.dir)

	FuutonSenbonDice(Uses)
		src.ChakraDrain(10000)
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		for(var/obj/WEAPONS/Senbon/A in view(10,src))
			if(A.icon=='Icons/Senbon.dmi'&&A.Owner==src)
				if(Uses>500)
					A.TilesA+=1
					A.TilesA=A.TilesA*4
				if(Uses>100)
					A.TilesA+=1
					A.TilesA=A.TilesA*3
				else
					A.TilesA+=1
					A.TilesA=A.TilesA*2
	WindTrick(Uses)
		src.ChakraDrain(5000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/A=Uses*0.01
		if(A>4) A=4
		if(A<1) A=1
		src.icon_state="Block"
		sleep(3)
		for(var/obj/WEAPONS/Z in oview((5+A)))
			Z.dir=get_dir(src,Z);Z.TilesA+=A
		src.icon_state="Power"
		spawn(3)
			src.icon_state=""
		var/HitBackRange=1
		HitBackRange=round(HitBackRange+Uses/100)
		if(HitBackRange>10)
			HitBackRange=10
		src.SoundEngine('SFX/WindSFX.wav',10,40)
		for(var/mob/M in oview((5+A)))
			spawn()
				var/Mdir=get_dir(M,src)
				if(M.Mogu)
					return
				M<<"You feel a strong wind turrent pushing you!"
				if(Mdir==NORTH)
					M.dir=SOUTH
				if(Mdir==EAST)
					M.dir=WEST
				if(Mdir==WEST)
					M.dir=EAST
				if(Mdir==SOUTH)
					M.dir=NORTH
				if(Mdir==NORTHEAST)
					M.dir=SOUTHWEST
				if(Mdir==SOUTHWEST)
					M.dir=NORTHEAST
				if(Mdir==NORTHWEST)
					M.dir=SOUTHEAST
				if(Mdir==SOUTHEAST)
					M.dir=NORTHWEST
				M.HitBack(HitBackRange,M.dir)
	SpinningWind(Uses)
		var/mob/M=src.target
		src.ChakraDrain(5000)
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/A=round(Uses/100)
		if(A>50) A=50
		if(A<1) A=1
		if(M in oview(A))
			A-=get_dist(src,M)
			if(A<=0)
				A=2
			while(A>0)
				M.dir=turn(M.dir,45)
				A--
				sleep(2)
	FuutonKazeDanganzz()
		src.ChakraDrain(8500)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
	//	if(prob(50))
	//		view()<<"<font size=1><font face=verdana><b><font color=white>[src]<font color=green> Says: Fuuton: Kaze Dangan No Jutsu!"
		flick("Attack1",src);src.Frozen=1
		spawn(2)
			src.Frozen=0;var/obj/Jutsu/Elemental/Fuuton/KazeDangan/K=new();K.name="[src]";K.loc=src.loc;K.nin=src.nin;K.dir=src.dir
			K.Move_Delay=0
			K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
	FuutonReppushou()
		src.ChakraDrain(11500)
		src.Handseals(32-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/Range=2
		if(src.HoldingR)
			Range+=src.ReppushouExpert
			src.ChakraDrain(5500*(src.ReppushouExpert+1))
		if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
		for(var/turf/T in range((Range),src))
			if(src.dir==NORTH||src.dir==SOUTH)
				if(T.y==src.y&&!T.density)
					var/obj/Jutsu/Elemental/Fuuton/Reppushou/K=new();K.name="[src]";K.loc=T;K.nin=src.nin;K.dir=src.dir;K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
					K.Move_Delay=0;//if(src.WindVelocity>=3) K.Move_Delay=0
			if(src.dir==WEST||src.dir==EAST)
				if(T.x==src.x&&!T.density)
					var/obj/Jutsu/Elemental/Fuuton/Reppushou/K=new();K.name="[src]";K.loc=T;K.nin=src.nin;K.dir=src.dir;K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
					K.Move_Delay=0//if(src.WindVelocity>=3) K.Move_Delay=0
	Daitoppa()
		if(src.UsingDaitoppa)
			for(var/obj/Jutsu/Elemental/Fuuton/Fdaitoppa/A in src.JutsuList)
				A.Move_Delay=0;//if(src.WindVelocity>=3) A.Move_Delay=0
				walk(A,src.dir,A.Move_Delay)
			src.Frozen=0;src.UsingDaitoppa=0;src.doingG=0;src.Frozen=0;return
		src.ChakraDrain(6300*(src.DaitoppaExpert+1))
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.doingG=1;src.UsingDaitoppa=1;var/obj/Jutsu/Elemental/Fuuton/Fdaitoppa/K=new();K.icon_state = "5";K.Move_Delay=0;K.loc=src.loc;K.dir=src.dir;K.nin=src.nin;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir)
		src.JutsuList.Add(K)
		src.Frozen=1
		spawn(10)
			if(src.Frozen)
				src.Frozen=0
		if(src.DaitoppaExpert==0||src.DaitoppaExpert==1&&!src.HoldingR)
			K.Range=1
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part1;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part2;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part3;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part4;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part5;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part6
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part7;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part8;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelOne/Part9
		if(src.DaitoppaExpert==1&&src.HoldingR||src.DaitoppaExpert==2&&!src.HoldingR)
			K.Range=2;step(K,K.dir);sleep(1);step(K,K.dir)
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part1;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part2;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part3;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part4;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part5
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part6;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part7;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part8;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part9;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part10
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part11;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part12;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part13;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part14;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part15
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part16;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part17;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part18;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part19;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part20
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part21;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part22;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part23;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part24;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelTwo/Part25
		if(src.DaitoppaExpert==2&&src.HoldingR)
			src.ChakraDrain(5000)
			K.Range=3;step(K,K.dir);sleep(1);step(K,K.dir);sleep(1);step(K,K.dir)
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part1;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part2;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part3;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part4;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part5;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part6;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part7
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part8;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part9;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part10;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part11;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part12;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part13;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part14
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part15;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part16;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part17;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part18;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part19;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part20;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part21
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part22;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part23;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part24;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part25;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part26;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part27;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part28
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part29;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part30;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part31;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part32;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part33;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part34;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part35
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part36;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part37;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part38;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part39;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part40;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part41;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part42
			K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part43;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part44;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part45;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part46;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part47;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part48;K.overlays+=/obj/Jutsu/Elemental/Fuuton/FuutonDaitoppaParts/LevelThree/Part49

		var/obj/Jutsu/Elemental/Fuuton/FdaitoppaTail/T=new()
		if(src.dir==SOUTH) T.pixel_y=16
		if(src.dir==NORTH) T.pixel_y=-16;T.layer=MOB_LAYER-1
		if(src.dir==WEST) T.pixel_x=8;T.layer=MOB_LAYER-1
		if(src.dir==EAST) T.pixel_x=-8;T.layer=MOB_LAYER-1
		T.loc=src.loc;step(T,src.dir);//src.Frozen=1;
		sleep(20);
		src.doingG=0;src.Frozen=0;src.UsingDaitoppa=0
		if(src.Frozen)
			src.Frozen=0
	YaibaSlash(Direction,RangeMin=0.09,RangeMax=0.15,Critical=10)
		for(var/mob/M in get_step(src,Direction))
			if(!M.Mogu&&!M.sphere&&!M.Kaiten&&!M.ingat&&!M.intank)
				src.ChakraDrain(10000)
				src<<"You slash [M] with Kaze No Yaiba!"
				var/damage=round(rand(M.maxhealth*RangeMin,M.maxhealth*RangeMax))
				if(src.Trait=="Old Powerful") damage+=(src.TaiSkill*2)
				if(prob(Critical)&&damage>0)
					damage=damage*2
					src<<"Critical hit!"
				view()<<"[src] hits [M] with Kaze No Yaiba for [damage] damage!"
				M.DamageProc(damage,"Health",src)
				spawn()M.Bloody();spawn()M.Bloody()
				if(M.RaiArmor&&M.RaiArmor!=2)
					M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			else
				src<<"Your attack doesn't affect [M]!";return
	KazeNoYaibaJutsu()
		if(usr.firing||usr.Frozen||usr.FrozenBind!="")
			return
		else
			if(src.target)
				src.dir=get_dir(src,src.target)
			flick("Attack1",src)
			spawn() src.SoundEngine('SFX/WindSFX.wav',10,40)
			sleep(5)
			viewers()<<sound('SFX/AttackSwish1.wav',0)
			if(src.WindSwordMastery==0)
				spawn() src.YaibaSlash(src.dir)
			if(src.WindSwordMastery==1)
				spawn() src.YaibaSlash(turn(src.dir,45))
				spawn(2) src.YaibaSlash(src.dir,0.16,0.25,25)
				spawn(4) src.YaibaSlash(turn(src.dir,-45))
			if(src.WindSwordMastery==2)
				spawn() src.YaibaSlash(turn(src.dir,90))
				spawn(1) src.YaibaSlash(turn(src.dir,45),0.16,0.25,25)
				spawn(2) src.YaibaSlash(src.dir,0.26,0.35,40)
				spawn(3) src.YaibaSlash(turn(src.dir,-45),0.16,0.25,25)
				spawn(4) src.YaibaSlash(turn(src.dir,-90))
	FuutonAirBall()
		src.ChakraDrain(10000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		flick("Attack1",src);src.Frozen=1
		spawn(2)
			src.Frozen=0;var/obj/Jutsu/Elemental/Fuuton/AirBall/K=new();K.name="[src]";K.loc=src.loc;K.nin=src.nin;K.dir=src.dir;K.Move_Delay=1
			if(src.FuutonKnowledge>1000)
				K.Move_Delay=0
			K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
	RenkuudanJutsu()
		src.ChakraDrain(64000)
		src.Handseals(55-src.HandsealSpeed)
		if(src.HandsSlipped) return
	//	if(src.Bijuu==""&&src.Bijuu!="Shukaku")
		//	src.Handseals(60-src.HandsealSpeed)
		//	if(src.HandsSlipped) return
		if(src.Bijuu=="Shukaku"&&src.TailState==0.5)
			var/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/A=new();A.loc=usr.loc;A.dir=usr.dir;A.name="[usr]";A.Owner=usr;walk(A,usr.dir);A.nin=src.nin*4;A.Move_Delay=(0)
			sleep(10)
			var/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/C=new();C.loc=usr.loc;C.dir=usr.dir;C.name="[usr]";C.Owner=usr;walk(C,usr.dir);C.nin=src.nin*4;C.Move_Delay=(0)
		var/obj/Jutsu/Elemental/Fuuton/FuutonRenkuudan/K=new();K.loc=usr.loc;K.dir=usr.dir;K.name="[usr]";K.Owner=usr;walk(K,usr.dir);K.nin=src.nin;
		if(usr.Bijuu=="Shukaku"&&src.TailState==0.5)
			K.nin*=4
		K.Move_Delay=(0);//if(src.WindVelocity>=3) K.Move_Delay=0
	FuutonVacuumCannon()
		src.ChakraDrain(20000)
		src.Handseals(20-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.Frozen=0;var/obj/Jutsu/Elemental/Fuuton/VaccumCannon/K=new();K.name="[src]";K.loc=src.loc;K.nin=src.nin;K.dir=src.dir;
		K.Move_Delay=0//(2/(src.WindVelocity+1));
	//	if(src.WindVelocity>=3)
	//		K.Move_Delay=0
		K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
	FuutonVacuumSphere(Uses)
		src.ChakraDrain(25000)
		src.Handseals(31-src.HandsealSpeed)
		if(src.HandsSlipped) return
		flick("Jutsu",src);src.Frozen=1
		spawn(2)
			src.Frozen=0
			var/X=1
			src.VacuumSphereExpert=2
			if(src.VacuumSphereExpert>=1)
				X+=2
			if(src.VacuumSphereExpert>=2)
				X+=4
			while(X>0)
				var/d
				var/obj/Jutsu/Elemental/Fuuton/VacuumSphere/K=new();K.name="[src]";K.loc=src.loc;K.loc=get_step(K,d);K.nin=src.nin;K.dir=src.dir;K.Owner=src;K.JutsuLevel=src.FuutonKnowledge
				K.Move_Delay=0;//if(src.WindVelocity>=3) K.Move_Delay=0
				if(X==4||X==2)
					d=turn(src.dir,45);step(K,d)
				if(X==3||X==5)
					d=turn(src.dir,-45);step(K,d)
				walk(K,src.dir)
				X--;sleep(1)
	FuutonVacuumGreatSphere()
		src.ChakraDrain(40000)
		src.Handseals(45-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.doingG=1
		src.Frozen=1
		var/obj/Jutsu/Elemental/Fuuton/GreatSphere/K=new()
		K.icon_state = "5"
		K.Move_Delay=0
		K.loc=src.loc
		K.dir=src.dir
		K.nin=src.nin
		K.Owner=src
		K.density=1
		K.Move_Delay=0
//		if(src.WindVelocity>=3)
//			K.Move_Delay=0
		walk(K,src.dir,K.Move_Delay)
		src.JutsuList.Add(K)
		K.Range=3
		src.Frozen=0
		src.doingG=0

	FuutonVacuumWave()
		src.ChakraDrain(25000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/i=3;
		src.Frozen=1;
		while(i>0)
			src.dir=turn(src.dir,45)
			for(var/mob/M in oview(5,src))
				if(M.icon_state=="Block")
					M.HitBack(4,src.dir)
					M<<"You block to reduce the damage."
				else
					var/damage=M.maxhealth*0.02
					var/WindChakra=WindDamage(src)
					damage=round(damage*(WindChakra*0.02+1))
					M.DamageProc(damage,"Health",src);M.HitBack(6,src.dir)//Will cause vit damage and pushes them out of the field.
					sleep(1);												//If there one tile away will do damage twice before pushing them out.
			//Weapons in field will be pushed out of field.
			for(var/obj/T in oview(5,src))
				if(istype(T,/obj/WEAPONS/Kunai)||istype(T,/obj/WEAPONS/Shuriken))
					walk(T,0)
					T.dir=src.dir
					walk(T,src.dir)
			i--;
			sleep(1)
		src.icon_state="";
		src.Frozen=0;
	FuutonVacuumSerialWaves()
		src.ChakraDrain(27600)
		src.Handseals(20-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/S=10;
		while(S>0)
			var/d
			src.Frozen=0;
			var/obj/Jutsu/Elemental/Fuuton/VacuumSerialWaves/K=new();
			K.name="[src]"
			K.loc=src.loc
			K.Owner=src
			K.loc=get_step(K,d)
			K.nin=src.nin
			K.dir=src.dir
			K.Move_Delay=0;//if(src.WindVelocity>=3) K.Move_Delay=0
			if(S==9||S==6||S==3)
				d=turn(src.dir,45);step(K,d)
			if(S==8||S==5||S==2)
				d=turn(src.dir,-45);step(K,d)

			walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
			S--
			if(S<=8)
				sleep(1)

	FuutonKazeKiri()
		src.ChakraDrain(23000)
		src.Handseals(33-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/obj/Jutsu/Elemental/Fuuton/KazeKiri/K=new();K.name="[src]";K.loc=src.loc;K.dir=src.dir;K.Owner=src;K.JutsuLevel=src.FuutonKnowledge;K.nin=src.nin
		K.Move_Delay=0;//if(src.WindVelocity>=3) K.Move_Delay=0
		walk(K,src.dir,K.Move_Delay)
	KazeGai()
		src.ChakraDrain(34000)
		src.Handseals(50-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/obj/Jutsu/Elemental/Fuuton/WindScythe/K=new();K.loc=src.loc;K.JutsuLevel=src.FuutonKnowledge;K.dir=src.dir;K.name="[src]";K.Owner=src
		K.Move_Delay=0;//if(src.WindVelocity>=3) K.Move_Delay=0
		walk(K,src.dir,K.Move_Delay)
		if(src.dir==WEST) K.pixel_y=-32
		if(src.dir==EAST) K.pixel_y=-32
	FuutonDaiKamaitachi()
		src.ChakraDrain(45000)
		src.Handseals(32-src.HandsealSpeed)
		src.Frozen=1;
		if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
		for(var/X=0,X<=2,X++)
			if(src.dir==NORTH||src.dir==SOUTH)
				var/obj/Jutsu/Elemental/Fuuton/DaiKamaitachi/A1=new();A1.Owner=src;A1.loc=locate(src.x+X,src.y,src.z);walk(A1,src.dir)
				var/obj/Jutsu/Elemental/Fuuton/DaiKamaitachi/A2=new();A2.Owner=src;A2.loc=locate(src.x-X,src.y,src.z);walk(A2,src.dir)
				var/obj/Jutsu/Elemental/Fuuton/DaiKamaitachi/C=new();C.Owner=src;C.loc=src.loc;walk(C,src.dir)
			if(src.dir==EAST||src.dir==WEST)
				var/obj/Jutsu/Elemental/Fuuton/DaiKamaitachi/C1=new();C1.Owner=src;C1.loc=locate(src.x,src.y+X,src.z);walk(C1,src.dir)
				var/obj/Jutsu/Elemental/Fuuton/DaiKamaitachi/C2=new();C2.Owner=src;C2.loc=locate(src.x,src.y+X,src.z);walk(C2,src.dir)
				var/obj/Jutsu/Elemental/Fuuton/DaiKamaitachi/B=new();B.Owner=src;B.loc=src.loc;walk(B,src.dir)
		src.Frozen=0
	FuutonKakeami()
		src.ChakraDrain(36000)
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/Range=2
		if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
		for(var/turf/T in range((Range),src))
			if(src.dir==NORTH||src.dir==SOUTH)
				if(T.y==src.y&&!T.density)
					var/obj/Jutsu/Elemental/Fuuton/Kakeami/K=new();K.name="[src]";K.loc=T;K.nin=src.nin;K.dir=src.dir;K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
					K.Move_Delay=0//if(src.WindVelocity>=3) K.Move_Delay=0
			if(src.dir==WEST||src.dir==EAST)
				if(T.x==src.x&&!T.density)
					var/obj/Jutsu/Elemental/Fuuton/Kakeami/K=new();K.name="[src]";K.loc=T;K.nin=src.nin;K.dir=src.dir;K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.FuutonKnowledge
					K.Move_Delay=0//if(src.WindVelocity>=3) K.Move_Delay=0
