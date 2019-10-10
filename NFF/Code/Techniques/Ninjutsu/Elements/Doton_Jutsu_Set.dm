mob/var/tmp
	UsingDomu=0
	Mogu=0
	EarthBindedBy=""
	UsingDomuCrush=0
	UsingKouka=0;
	DotonCrushTarget
	KoukaTarget
	MakeCrato=0
mob/var/tmp/list/SekkanList=new
mob/var/tmp/Kengan=0;
mob/proc/DoryuudanEffect()
	src.overlays-='Icons/Jutsus/DoryuuStand.dmi';src.overlays+='Icons/Jutsus/DoryuuStand.dmi'
	src.StunAdd(rand(4,5));spawn()src.Bloody() //Was Originally 3,9
	spawn(30)
		src.overlays-='Icons/Jutsus/DoryuuStand.dmi'
obj/Jutsu/Elemental/Doton
	icon = 'Icons/Jutsus/DotonTechniques.dmi'
	Element="Doton"
	health=100
	var/CreatesSmoke=1
	/*Del()
		if(src.CreatesSmoke)
			src.CreateSmoke("Light")
		..()*/
	DotonWall
		icon_state="Wall"
		density=1
		opacity=1
		JutsuLevel=1
		New()
			..()
			spawn()
				flick("Rise",src)
				while(src)
					sleep(4)
					for(var/obj/Jutsu/Elemental/Suiton/A in range(1,src))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=10
						else if(A.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=22
						else if(A.JutsuLevel>src.JutsuLevel)
							BaseChance=26
						if(prob(BaseChance))
							del(A)
					//	del(A)
			spawn(400)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)
	doryuuheki
		icon_state="bottom"
		layer = TURF_LAYER+1
		density = 1
	//	opacity = 1
		JutsuLevel=1
		New()
			spawn()
				while(src)
					sleep(11)
					for(var/obj/Jutsu/Elemental/Suiton/A in oview(1,src))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=25
						else if(A.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=55
						else if(A.JutsuLevel>src.JutsuLevel)
							BaseChance=65
						if(prob(BaseChance))
							del(A)
					//	del(A)
			spawn(400) del(src)
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)
	Crator
		icon='Crater.dmi'
		layer = TURF_LAYER+1
		density=0
		New()
			spawn()
				while(src)
					sleep(2)
					for(var/mob/M in view(1,src))
						M.Stun+=3;
						del(src)
						view(M)<<output("<font size=2>Você caiu em uma cratera!.</font>","Attack")
						src.CreateCrator()
	doryuuhekiT
		icon_state = "top"
		Element="Doton"
		layer = TURF_LAYER+1
		JutsuLevel=1
		density = 0
		opacity = 1
		New()
			spawn(400) del(src)
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)
	DoryuuTaiga
		icon_state="Front"
		density=0
		CreatesSmoke=0
		JutsuLevel=1
		layer=MOB_LAYER+2//Was 2
		var/tmp/list/TrailList=list()
		New()
			..()
			spawn()
				while(src)
					sleep(5)
					for(var/obj/Jutsu/Elemental/Suiton/A in oview(1))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=8.33
						else if(A.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=18.33
						else if(A.JutsuLevel>src.JutsuLevel)
							BaseChance=21.667
						if(prob(BaseChance))
							del(A)
				//		del(A)
	//				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
	//					del(src)
			spawn(50)
				del(src)
		Move()
			var/turf/prevloc=src.loc
			..()
			var/obj/Jutsu/Elemental/Doton/DoryuuTaigaTrail/A=new()
			A.Owner=src.Owner;A.loc=prevloc;A.dir=src.dir
			src.TrailList.Add(A)
			if(src.icon_state=="FrontSide1")
				A.icon_state="Side1"
			if(src.icon_state=="FrontSide2")
				A.icon_state="Side2"
		Del()
			for(var/obj/O in src.TrailList)
//				sleep(1)
				del(O)
		//	flick("fade",src)
			//sleep for fade icon state
			..()
	DoryuuTaigaTrail
		icon_state="Middle"
		density=0
		layer=2
		CreatesSmoke=0
		JutsuLevel=1
		New()
			..()
			spawn()
				while(src)
					sleep(4)
					var/mob/O=src.Owner
			//		for(var/obj/Jutsu/Kiriame/S2 in src.loc)
			//			del(src)
					for(var/mob/M in src.loc)
						if(M!=O)
							if(M.Mogu && !M.InHydro)
								M.health-=rand(50,100)
								return
							if((M.InHydro && prob(30)) || !M.InHydro)
								M.HitBack(2,src.dir)
			spawn(100)
				del(src)
		Del()
			flick("fade",src)
			//sleep for fade icon state
			..()
	KakouSekkan
		icon_state="sekkan"
		layer=MOB_LAYER+1
		density=1
		Owner
		JutsuLevel=1
		New()
			..()
			spawn()
				while(src)
					sleep(45)
					for(var/obj/Jutsu/Elemental/Suiton/A in oview(1))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=25
						else if(A.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=55
						else if(A.JutsuLevel>src.JutsuLevel)
							BaseChance=65
						if(prob(BaseChance))
							del(A)
					//	del(A)
		Del()
			for(var/mob/M in src.loc)
				M.sight &= ~BLIND
			..()

	DorouDomu
		density=1
		layer=MOB_LAYER+1
		New()
			spawn()
				while(src)
					sleep(45)
					for(var/obj/Jutsu/Elemental/Suiton/A in oview(1))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=25
						else if(A.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=55
						else if(A.JutsuLevel>src.JutsuLevel)
							BaseChance=65
						if(prob(BaseChance))
							del(A)
				//		if(prob(10))
				//			del(A)
		Del()
			src.CreateSmoke("Medium")
			for(var/mob/M in src.loc)
				M.sight &= ~BLIND
			..()
		A
			icon_state="1"
		B
			icon_state="2"
		C
			icon_state="3"
		D
			icon_state="4"
		E
			icon_state="5"
		F
			icon_state="6"
		G
			icon_state="7"
		H
			icon_state="8"
		I
			icon_state="9"
	DotonDD
		icon_state = "rock"
		density=1
		layer=MOB_LAYER+1
		var/tai=10
		New()
			..()
			spawn(400)
			del(src)
		Bump(A)
			..()
			if(ismob(A))
				walk(src,0)
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)
				if(M.Kaiten||M.sphere)
					return
				if(M.RaiArmor)
					del(src)
				if(M.InHydro)
					if(prob(50))
						src.loc = M.loc
						return
					else
						src.tai/=1000
				var/mob/O = src.Owner
				var/damage=round((src.tai*600))
				var/EarthChakra=EarthDamage(O)
				damage=round(damage*(EarthChakra*0.02+0.8))
				damage=damage/(M.Endurance/2)
				if(O.BoulderExpert)
					damage*=1.5
				if(O.Trait=="Old Powerful")
					var/D=(O.TaiSkill/10)
					if(D<1.1) D=1.1
					damage=damage*D
				if(damage>=5000)
					damage=5000
				M.DamageProc(damage,"Stamina",O,"Doton Doryo Dango","#BB0000")
			//	view(M)<<output("<font color=#BB0000 size=2>[M] was hit by Doton Doryo Dango!([damage])</font>","Attack")
				M.icon_state="rasenganhit";step_rand(M);sleep(1);step(M,M.dir);M.icon_state=""
				del(src)
			if(istype(A,/turf/))
				var/turf/T=A
				if(T.density)
					src.CreateSmoke("Medium")
					del(src)
			if(istype(A,/obj/Doors/))
				var/obj/Doors/Z=A
				Z.DamageProc((src.tai*550)/10,"Health")
				sleep(1)
			if(istype(A,/obj/Jutsu/Elemental/))
				var/obj/Jutsu/Elemental/Z=A
				var/mob/O = src.Owner
				if(istype(Z,/obj/Jutsu/Elemental/Hyouton))
					var/damage2=round(O.tai*pick(0.9,1));damage2=round(damage2*(O.EarthChakra*0.02+0.8));damage2/=2.5
					Z.DamageProc((damage2),"Stamina",O)
					sleep(1)
				var/damage=round(O.tai*pick(0.9,1));damage=round(damage*(O.EarthChakra*0.02+0.8))
				if(O.Trait=="Old Powerful") damage+=(O.TaiSkill)
				if(Z.Element=="Hyouton"||Z.Element=="Suiton")
					damage*=2
				Z.DamageProc((damage),"Stamina",O)
				if(istype(Z,/obj/Jutsu/Elemental/Suiton/))
					del(Z)
				del(src)
			else if(istype(A,/obj/))
				del(src)
	BigDoton
		icon_state = "5C"
		density = 1
		layer=MOB_LAYER+1
		var/ChuuninBoulder=0
		var/tai=10
		var/hit=0
		proc/BumpInto(mob/M)
			if(!src.hit)
				if(src.ChuuninBoulder==1)
					if(M.TakingPartInChuunins==1)
						src.hit=1
						if(!M.Guarding)
							if(M.BoulderStrike==0)
								M.Guarding=0;
								M.icon_state="dead"


								M.HitBack(6,src.dir)
								M<<"O pedregulho o acerta devolta!"
						//		M.Quake_Effect_Self(M,4,1)
						//		M.FadeScreen()
								M.BoulderStrike++

								del(src)
								return
							else if(M.BoulderStrike==1)
								M.Guarding=0;
								M.icon_state="dead"

								M<<"O pedregulho causou um golpe impactante em seu corpo, Você nao vai ser capaz de aguentar muito mais desses..."
								M.HitBack(9,src.dir)
						//		M.Quake_Effect_Self(M,6,3)
							//	M.FadeScreen()
								M.BoulderStrike++
								del(src)
								return
							else if(M.BoulderStrike==2)
								M.Guarding=0;
								M.icon_state="dead"
								M<<"O pedregulho arremessa seu corpo no chão e você luta para se levantar..Seu corpo está fraco ao ponto de defender não ajudar mais!"
								M.HitBack(13,src.dir)


						//		M.Quake_Effect_Self(M,10,4)
							//	M.FadeScreen()
								M.BoulderStrike++
								del(src)
								return
							else if(M.BoulderStrike>=3)
								M.FadeScreenSlow()
							//	spawn()
							//		M.GotoVillageHospital()
								M<<"O ultimo impacto do pedregulho foi tão forte que você mal aguenta se defender e cai inconsciente..."
								spawn()
									M.GotoVillageHospital()
								M.TakingPartInChuunins=0
								M.BoulderStrike=0
								world<<"[M] foi jogado para fora do penhasco tentando alcançar a floresta da morte.."
								del(src)
								return
						else
							if(M.BoulderStrike>=3)
								M.FadeScreenSlow()
							//	spawn()
							//		M.GotoVillageHospital()
								M<<"O ultimo impacto do pedregulho foi tao forte que você mal aguenta se defender e cai inconsciente..."
								spawn()
									M.GotoVillageHospital()
								M.TakingPartInChuunins=0
								M.BoulderStrike=0
								world<<"[M] Foi jogado do penhasco tentando alcançar a floresta da morte.."
								del(src)
								return
							else
								M.Guarding=0
							//	M.Quake_Effect_Self(M,4,4)
								M.HitBack(8,src.dir)
								del(src)
								return





					else
						M<<"Nop.";
						world<<"Teste,não esbarrar no chunnin."
						M.GotoVillageHospital()
						return
			//	else
				//	M<<"The Boulder hits you."
				//	del(src)
				//	return
				src.hit=1
			//	world<<"Target hit."
			//	walk(src,0)
			//	world<<"Now no longer walking."
				if(M.Kaiten||M.sphere)
					return
				if(M.RaiArmor)
					del(src)
				if(M.InHydro)
					if(prob(50))
						src.loc = M.loc
						return
					else
						src.tai/=1000
				var/mob/O = src.Owner
				var/damage=(src.tai*850)
				var/EarthChakra=EarthDamage(O)
				damage=round(damage*(EarthChakra*0.02+0.8))
				damage=damage/(M.Endurance/2);damage*=1.75
				if(damage>=5000)
					damage=5000
				if(O.Trait=="Old Powerful")
					var/D=(O.TaiSkill/10)
					if(D<1.1) D=1.1
					damage=damage*D
				M.DamageProc(damage,"Stamina",O,"Large boulder","#BB0000")
			//	view(M)<<output("<font color=#BB0000 size=2>[M] was hit the large boulder!([damage])</font>","Attack")
				M.icon_state="rasenganhit"
				step_rand(M);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);M.icon_state=""
				del(src)
		New()
			..()
			overlays+=/obj/Jutsu/Elemental/Doton/BigDoton/A;overlays+=/obj/Jutsu/Elemental/Doton/BigDoton/B;overlays+=/obj/Jutsu/Elemental/Doton/BigDoton/C;overlays+=/obj/Jutsu/Elemental/Doton/BigDoton/D;overlays+=/obj/Jutsu/Elemental/Doton/BigDoton/E
			if(src.ChuuninBoulder==0)
				spawn(400)
					del(src)
			else
				spawn(600)
					del(src)
		Move()
			..()
			for(var/mob/M in oview(1,src))
				if(src.dir==SOUTH)
					if(M.y==(src.y-1))
						if(M.x==(src.x-1)||M.x==src.x||M.x==(src.x+1))
							src.BumpInto(M)
				if(src.dir==NORTH)
					if(M.y==(src.y+1))
						if(M.x==(src.x-1)||M.x==src.x||M.x==(src.x+1))
							src.BumpInto(M)
				if(src.dir==EAST)
					if(M.x==(src.x+1))
						if(M.y==(src.y+1)||M.y==src.y)
							src.BumpInto(M)
				if(src.dir==WEST)
					if(M.x==(src.x-1))
						if(M.y==(src.y+1)||M.y==src.y)
							src.BumpInto(M)
		Bump(A)
			..()
			if(ismob(A))
				src.BumpInto(A)
			else if(istype(A,/turf/))
				var/turf/T=A
				if(T.density)
					if(istype(A,/turf/mountain102))

						return
					if(istype(T,/turf/mountain102))

						return
					if(istype(A,/turf/LandscapeStuff/lava))

						return
					if(istype(T,/turf/LandscapeStuff/lava))


						return
					if(istype(T,/turf/mountain2))

						return
					if(istype(A,/turf/mountain2))

						return
					if(istype(A,/turf/mountain4))

						return
					if(istype(T,/turf/mountain4))

						return
					if(istype(A,/turf/mountain6))

						return
					src.CreateSmoke("Medium")
					del(src)
			else if(istype(A,/obj/Jutsu/Elemental/))
				if(src.ChuuninBoulder==1)
					src.loc=A
					return
				var/obj/Jutsu/Elemental/Z=A
				var/mob/O = src.Owner
				var/damage=round(O.tai*pick(2,3))
				var/EarthChakra=EarthDamage(O)
				damage=round(damage*(EarthChakra*0.02+0.8))
				if(O.Trait=="Old Powerful") damage+=(O.TaiSkill)
				if(Z.Element=="Hyouton"||Z.Element=="Suiton")
					damage*=2
				Z.DamageProc((damage),"Stamina",O)
				if(istype(Z,/obj/Jutsu/Elemental/Suiton/))
					del(Z)
				del(src)
			else if(istype(A,/obj/))
				del(src)
		A
			icon_state="1C"
			pixel_x = -32
			pixel_y = 32
		B
			icon_state="2C"
			pixel_y = 32
		C
			icon_state="3C"
			pixel_x = 32
			pixel_y = 32
		D
			icon_state="4C"
			pixel_x = -32
		E
			icon_state="6C"
			pixel_x = 32
	doseikiryuu
		icon = 'DotonTechniques.dmi'
		icon_state="EarthDragonCenter"
		layer = MOB_LAYER+1
		density = 1
		Move_Delay=1
		var/Moves
		var/nin
		New()
			..()
			spawn()
				var/obj/A=new();A.icon=src.icon;A.icon_state="EarthDragonFront";A.dir=src.dir;
				var/obj/B=new();B.icon=src.icon;B.icon_state="EarthDragonEast";B.dir=src.dir;
				var/obj/C=new();C.icon=src.icon;C.icon_state="EarthDragonWest";C.dir=src.dir;
				if(src.dir==SOUTH)
					A.pixel_y-=32;
					B.pixel_x+=32;
					C.pixel_x-=32;
				if(src.dir==NORTH)
					A.pixel_y+=32;
					B.pixel_x-=32;
					C.pixel_x+=32;
				if(src.dir==EAST)
					A.pixel_x+=32;
					B.pixel_y+=32;
					C.pixel_y-=32;
				if(src.dir==WEST)
					A.pixel_x-=32;
					B.pixel_y-=32;
					C.pixel_y+=32;
				src.overlays+=A;src.overlays+=B;src.overlays+=C
				var/obj/A2=new();A2.icon=src.icon;A2.icon_state="DragonTrailMain";A2.dir=src.dir
				var/obj/B2=new();B2.icon=src.icon;B2.icon_state="DragonTrailFront";B2.dir=src.dir
				if(src.dir==NORTH)
					B2.pixel_y-=32;
					A2.pixel_y-=64;
				if(src.dir==SOUTH)
					B2.pixel_y+=32;
					A2.pixel_y+=64;
				if(src.dir==EAST)
					B2.pixel_x-=32;
					A2.pixel_x-=64;
				if(src.dir==WEST)
					B2.pixel_x+=32;
					A2.pixel_x+=64;
				src.overlays+=A2;src.overlays+=B2;
				var/obj/A3=new();A3.icon=src.icon;A3.icon_state="DragonTail";A3.dir=src.dir
				if(src.dir==NORTH)
					A3.pixel_y-=96;
				if(src.dir==SOUTH)
					A3.pixel_y+=96;
				if(src.dir==EAST)
					A3.pixel_x-=96;
				if(src.dir==WEST)
					A3.pixel_x+=96;
				src.overlays+=A3;
				var/mob/O=src.Owner
				while(src)
					for(var/mob/M in get_step(src,src.dir))
						if(M.Kaiten||M.sphere||M.RaiArmor) goto Nodamage
						if(M.InHydro)
							src.loc = M.loc
							M.chakra -= 500
							goto Nodamage
						var/damage=round(rand(src.nin*200,src.nin*225))
						damage/=M.Endurance
						damage+=rand(90,130)
						if(damage<50) damage=50;
						if(damage>500) damage=500;
						M.DamageProc(damage,"Stamina",O)
						view(M)<<output("<font color=red>[M] foi acertado pelo doseikiryuu!([damage])</font>","Attack")
						M.SoundEngine('HitStrong.wav',10)
						spawn(1) M.dir=src.dir;M.HitBack(4,src.dir)
						Nodamage
						sleep(1)
					sleep(1);
			spawn(60)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)
	doryuudan
		icon_state="Dragon1"
		layer = MOB_LAYER+1
		density = 1
		New()
			..()
			spawn()
				var/obj/A=new();A.icon=src.icon;A.icon_state="Dragon2";A.pixel_x+=32;A.dir=src.dir
				var/obj/B=new();B.icon=src.icon;B.icon_state="Dragon3";B.pixel_y+=32;B.dir=src.dir
				var/obj/C=new();C.icon=src.icon;C.icon_state="Dragon4";C.pixel_x+=32;C.pixel_y+=32;C.dir=src.dir
				src.overlays+=A;src.overlays+=B;src.overlays+=C
			spawn(40)
				del(src)

	doryuudanB
		icon_state = "Dragon1"
		layer = MOB_LAYER+1
		density = 0
		New()
			..()
			spawn(40) del(src)
	Doryuudan5
		icon_state = "missle"
		density = 1
		CreatesSmoke=0
		var
			nin
			OnFire=0
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					for(var/obj/Jutsu/Elemental/Katon/Z in src.loc)
						if(src.icon_state=="missle2")
							src.icon_state="firemissle2"
						else
							src.icon_state="firemissle"
						src.OnFire=1
			spawn(50)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.intank)
					M<<"Os espinhos saltaram fora de seu pedregulho!"
					del(src)
				if(M.Kaiten||M.sphere)
					del(src)
				if(M.InHydro)
					src.loc=M.loc
					M.chakra -=rand(50,75)
					return
				if(src.OnFire)
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.loc=M.loc;K.nin=src.nin/1.5;K.Owner=src.Owner
				if(!src.OnFire)
					if(M.RaiArmor)
						del(src)
				var/damage = round(M.maxhealth*0.14);var/mob/O=src.Owner //Was *.35//was .30
				var/EarthChakra=EarthDamage(O)
				damage=round(damage*((EarthChakra*0.02)+(src.nin*0.01)))
				if(src.icon_state=="missle2"||src.icon_state=="firemissle2")
					damage=round(M.maxhealth*0.17)
					damage=round(damage*((EarthChakra*0.02)+(src.nin*0.01)))
				if(O.client&&O.Trait=="Old Powerful") damage+=(O.NinSkill*7)
				if(damage>=400)
					damage=400
				M.DamageProc(damage,"Health",O,"spikes","#BB0000")
				if(prob(O.EarthChakra))
					M.DoryuudanEffect()
			//	view(M)<<output("<font color=#BB0000 size=2>[M] was hit by the spikes!([damage])</font>","Attack")
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/Doors/))
				var/obj/Doors/Z=A
				Z.DamageProc(src.nin/10,"Health")
			if(istype(A,/obj/Jutsu/Elemental/Doton/doryuudan))
				var/obj/O=A;src.loc=O
			else if(istype(A,/obj/Jutsu/Elemental/Doton/Doryuudan5))
				return
			else if(istype(A,/obj/Jutsu/Elemental))
				var/obj/Jutsu/Elemental/Z=A
				var/mob/O = src.Owner
				var/damage=round(src.nin);damage=round(damage*(O.EarthChakra*0.02+0.8))
				if(O.Trait=="Old Powerful") damage+=(O.TaiSkill)
				if(Z.Element=="Hyouton"||Z.Element=="Suiton")
					damage*=2
				Z.DamageProc((damage),"Stamina",O)
				if(istype(Z,/obj/Jutsu/Elemental/Suiton/))
					if(prob(30))
						del(Z)
				del(src)
			else if(istype(A,/obj/))
				del(src)
	EarthB
		icon_state=""
		layer=MOB_LAYER+99999999
		density=1
		var/StruggleOutBind=50
		New()
			..()
			spawn()
				flick("bind",src)
				while(src)
					sleep(6)
					if(src.icon_state=="DoBind")
						for(var/mob/M in src.loc)
							var/mob/O=src.Owner
							if(M==O||M.Mogu)
								return
							if(M.ImmuneToDeath)
								del(src)
							if(M.SusanooIn)
								M<<"Seu Susano fez com que a prisão de pedra quebrasse em torno de você."
								del(src)
							if(M.sphere|M.intsu|M.ingat|M.Kaiten|M.RaiArmor|M.knockedout|M.intank)
								del(src)
							if(M.FrozenBind=="")
								M<<"Você foi preso pela prisão de pedra! Aperte a barra de espaço rapidamente para sair para fora!";M.FrozenBind="DoBind";M.EarthBindedBy="[O]"
							if(M.InHydro)
								M<< "Você escapou da prisão de pedra!"
								M.FrozenBind="";M.EarthBindedBy=""
								return
							sleep(11)
							M.loc=src.loc
							if(M.Struggle>src.StruggleOutBind)
								M<<"Você escapou com sucesso da prisão de pedra!"
								M.FrozenBind=""
								M.EarthBindedBy=""
								del(src)
					sleep(11)
			spawn(300)
				del(src)
		Del()
			for(var/mob/M in world)
				var/mob/O=src.Owner
				if(M.EarthBindedBy=="[O]")
					M<<"You've been freed!";M.FrozenBind="";M.EarthBindedBy=""
			sleep(2)
			..()
	Yomicenter
		icon_state = "Yomi"
		density=0
		CreatesSmoke=0
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					for(var/mob/M in src.loc)
						var/mob/O=src.Owner
						if(M==O)
							return
						if(!M.RaiArmor)
							if(M.name!="Crows"&&M.icon!='Crows.dmi'&&M.client||M.name!="Crows"&&M.icon!='Crows2.dmi'&&M.client)
								var/damage=rand(src.nin*0.05,src.nin*0.2)
								if(O.Trait=="Old Powerful") damage+=O.NinSkill
								M.DamageProc(damage,"Health",O,"Yomi","brown")
								if(M.Mogu)
									M.DamageProc(damage,"Health",O,"Yomi","brown")
								M.DamageProc(damage,"Stamina",O,"Yomi","brown")
								if(prob(50))
									if(M.runningspeed>5)
										M.runningspeed-=rand(1,2)
									M<<"You got a little stuck."
								if(M.Mogu)
									M.StunAdd(2)
								M.Running=0
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health")
						sleep(1)
					for(var/obj/Jutsu/Elemental/Suiton/A in range(1,src))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=25
						else if((A.JutsuLevel)>(src.JutsuLevel*2))
							BaseChance=55
						else if((A.JutsuLevel>src.JutsuLevel))
							BaseChance=65
						if(prob(BaseChance))
							del(A)
					//	del(A)
					sleep(11)
			spawn(600)
				del(src)
		Del()
			flick("YomiDelete",src)
			for(var/mob/M in src.loc)
				M.Stun=0
			sleep(8)
			..()
	EarthSpike
		icon_state="Spike"
		density=1
		layer=MOB_LAYER+1
		CreatesSmoke=0
		New()
			.=..()
			spawn()
				flick("EarthSpike Rising",src)
				var/mob/O=src.Owner;
				for(var/obj/Doors/D in oview(1,src))
					D.DamageProc(20,"Health",O)
					sleep(1)
				for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
					var/damage2=round(O.nin*pick(0.9,1));damage2=round(damage2*(O.EarthChakra*0.02+0.8));damage2/=2.5
					A.DamageProc((damage2),"Stamina",O)
				//	world<<"Ice mirrors remaining health is [A.health]."
					sleep(1)
				for(var/mob/M in src.loc)
					if(M.Kaiten||M.sphere||M.InHydro)
						return
					var/damage=pick(M.maxhealth*0.05,M.maxhealth*0.06,M.maxhealth*0.07) //Was originally just 0.05
					damage+=(O.nin*0.9); //Was originally just 0.5
					damage=round(damage)
					if(damage>300) //Was originally capped at 150
						damage=300;
					M.DamageProc(damage,"Health",O,"Earth Spike","#BB0000");
					viewers()<<sound('SFX/Slice.wav',0,0,1)
			//		view(M)<<output("<font color=#BB0000 size=2>[M] was hit by the earth spike!([damage])</font>","Attack")
			//		spawn()
			//			M.Bloody();sleep(1);M.Bloody()
			spawn(40)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)
	RisingPillars
		icon_state="Spike"
		density=1
		layer=MOB_LAYER+1
		var/nin=10
		CreatesSmoke=0
		New()
			.=..()
			spawn()
				var/mob/O=src.Owner
				flick("EarthSpike Rising",src)

				for(var/obj/Jutsu/Elemental/Hyouton/A in oview(1,src))
					var/damage3=round(120*((O.EarthChakra*0.02)+(src.nin*0.1)));damage3=round(120*((O.EarthChakra*0.02)+(src.nin*0.1)));damage3/=2.5
					A.DamageProc((damage3),"Stamina",O)
					sleep(1)
				for(var/mob/M in src.loc)
					if(M.Kaiten||M.sphere||M.InHydro)
						return
				//	var/mob/O=src.Owner
					var/EarthChakra=EarthDamage(O)
					var/damage=round(140*((EarthChakra*0.02)+(src.nin*0.1)));
					if(damage>3600)
						damage=3600
					var/Hdamage=damage*0.25
					var/Sdamage=damage*0.75
			//		view(M)<<output("<font color=#BB0000 size=2>[M] was hit the earth pillar!([Hdamage] Vitality - [Sdamage] Stamina)</font>","Attack")
					M.DamageProc(Hdamage,"Health",O,"Earth Pillar","#BB0000");
					M.DamageProc(Sdamage,"Stamina",O,"Earth Pillar","#BB0000");
					viewers()<<sound('SFX/Slice.wav',0,0,1);
				//	spawn()
				//		M.Bloody();sleep(1);M.Bloody();sleep(1);M.Bloody()
			spawn(40)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					del(src)

	Arijigoku
		icon_state="Yomi"
		var/list/CaptureList=list()
		var/StruggleOutofMud=50
		var/TimeUp=100
		density=0
		New()
			..()
			spawn()
				while(src)
					TimeUp-=0.5
					sleep(2)
					for(var/mob/M in (src.loc))
						var/mob/O=src.Owner
						if(M==O)
							return
						if(!M.RaiArmor)
							if(M.name!="Crows"&&M.icon!='Crows.dmi'&&M.client||M.name!="Crows"&&M.icon!='Crows2.dmi'&&M.client)
								if(!M.knockedout&&!M.ImmuneToDeath&&M.FrozenBind=="")
									M.FrozenBind="Arijigoku"
									M.Frozen=1;
									M<<"Você se sente sendo puchado para dentro! Aperte rapidamente a barra de espaço para escapar!"
									M.Struggle=0
									src.CaptureList.Add(M)
								if(M in src.CaptureList)
									if(TimeUp<=0)
										M.health-=10000;//Huge ass vit damn to insure it kos.
													//Doesnt use the damage proc to prevet massive wp damage.
										M<<"Você falhou em escapar e foi enterrado em baixo do chao."
										src.CaptureList.Remove(M)
										M.Frozen=0;
										src.CaptureList=null;
										if(M.FrozenBind=="Arijigoku")
											M.FrozenBind=""
										del(src)
									if(M.Struggle>(src.StruggleOutofMud))
										src.CaptureList.Remove(M)
										M.Frozen=0;
										if(M.FrozenBind=="Arijigoku")
											M.FrozenBind=""
										M<<"You escape the whirlpool!"
										step(2,src.dir)
					for(var/obj/Jutsu/Elemental/Suiton/A in range(1,src))
						if(A.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=25
						else if(A.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=55
						else if(A.JutsuLevel>src.JutsuLevel)
							BaseChance=65
						if(prob(BaseChance))
							del(A)
				//		if(prob(20))
					//		del(A)
					sleep(11)
	Mud
		icon='Icons/Jutsus/Mud.dmi'
		icon_state="5"
		layer=TURF_LAYER
		JutsuLevel=1
		CreatesSmoke=0
		var/nin=10
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				var/damage
				if(O)
					damage=rand(O.nin*0.31,O.nin*0.38)
				while(src)
					//sleep(2)
				//	for(var/obj/Doors/D in oview(1,src))
				//		D.DamageProc(src.nin/10,"Health",O)
				//		sleep(2)
					for(var/mob/M in src.loc)
						if(M in OnlinePlayers)
							if(!M.RaiArmor&&!M.InGarou&&!M.knockedout)
								if(M!=O)
									M.DamageProc(damage,"Health",O,"Yomi","brown")
									if(M.Mogu)
										M.DamageProc(damage,"Health",O,"Yomi","brown")
										M.Stun+=2
									M.DamageProc(damage,"Stamina",O,"Yomi","brown")
									if(prob(15)&&!M.ImmuneToDeath)
										M.StunAdd(10)
										M<<"Você ficou um pouco preso."
									if(prob(40))
										M.Running=0
								else
									if(O.DotonKnowledge>750)
										O.DamageProc(damage/2,"Health",O,"Yomi","brown")
									else if(O.DotonKnowledge>1000)
										O.DamageProc(damage/3,"Health",O,"Yomi","brown")
									else
										O.DamageProc(damage,"Health",O,"Yomi","brown")
					sleep(7)
			//		spawn(12)
					if(locate(/obj/Jutsu/Elemental/Doton/Mud) in src.loc)
						for(var/obj/Jutsu/Elemental/Doton/Mud/P in src.loc)
							if(P!=src)
								del(P)
					if(locate(/obj/Jutsu/Elemental/Suiton) in range(1,src))
						for(var/obj/Jutsu/Elemental/Suiton/A in range(1,src))
							if(A.JutsuLevel>(src.JutsuLevel*3))
								BaseChance=25
							else if(A.JutsuLevel>(src.JutsuLevel*2))
								BaseChance=55
							else if(A.JutsuLevel>src.JutsuLevel)
								BaseChance=65
							if(prob(BaseChance))
								del(A)
		//				if(prob(70))
		//					del(A)
			//		sleep(1)
			//			for(var/obj/Jutsu/Kiriame/S2 in src.loc)
			//				if(prob(50))
			//					del(src)
				//		sleep(10)
			spawn(400)
				del(src)
		Del()
			flick("[src.icon_state]Delete",src)
			sleep(4)
			..()
	MudWave
		icon='Icons/Jutsus/Mud.dmi'
		icon_state="Wave"
		density=0
		layer=TURF_LAYER
		CreatesSmoke=0
		var/Edge=0
		var/FirstTile=0
		var/TilesAccumulated=0
		var/TimeAlive=12
		New()
			..()
			spawn()
				while(TimeAlive>0)
					TimeAlive--
					sleep(1)
				del(src)
		Del()
			var/obj/Jutsu/Elemental/Doton/Mud/L=new()
			L.loc=src.loc;L.Owner=src.Owner
			if(src.dir==NORTH) L.icon_state="[src.Edge-6]"
			if(src.dir==SOUTH) L.icon_state="[src.Edge+6]"
			if(src.dir==WEST) L.icon_state="[src.Edge-2]"
			if(src.dir==EAST) L.icon_state="[src.Edge+2]"
			..()
		Move()
			TilesAccumulated++
			if(TilesAccumulated==5)
				var/obj/Jutsu/Elemental/Doton/MudWave/M=new()
				if(src.dir==NORTH)
					if(src.Edge==7||src.Edge==9)
						M.TimeAlive=src.TimeAlive+1;M.loc=src.loc;M.Edge=src.Edge;src.Edge=8
						if(M.Edge==7) M.x-=1
						if(M.Edge==9) M.x+=1
				if(src.dir==SOUTH)
					if(src.Edge==3||src.Edge==1)
						M.TimeAlive=src.TimeAlive+1;M.loc=src.loc;M.Edge=src.Edge;src.Edge=2
						if(M.Edge==1) M.x-=1
						if(M.Edge==3) M.x+=1
				if(src.dir==WEST)
					if(src.Edge==3||src.Edge==9)
						M.TimeAlive=src.TimeAlive+1;M.loc=src.loc;M.Edge=src.Edge;src.Edge=6
						if(M.Edge==9) M.y-=1
						if(M.Edge==3) M.y+=1
				if(src.dir==EAST)
					if(src.Edge==7||src.Edge==1)
						M.TimeAlive=src.TimeAlive+1;M.loc=src.loc;M.Edge=src.Edge;src.Edge=4
						if(M.Edge==7) M.y-=1
						if(M.Edge==1) M.y+=1
				walk(M,src.dir)
			var/obj/Jutsu/Elemental/Doton/Mud/L=new()
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
mob/proc
	Moguragakureno()
		if(src.firing|src.caught||src.Stun||src.Shibari)
			return
		if(src.Frozen||src.FrozenBind)
			return
		else
			src.StaminaDrain(30)
			src.ChakraDrain(1000)
			var/DomuIsHere=0
			for(var/obj/Jutsu/Elemental/Doton/DorouDomu/A in src.loc)
				DomuIsHere=1
			if(DomuIsHere)
				src.&= ~BLIND
			src.Frozen=1
			src.firing=1
			src.dir=NORTH
			sleep(1)
			src.dir=EAST
			sleep(1)
			src.dir=SOUTH;sleep(1);src.dir=WEST;
			sleep(1)
			src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;sleep(1);src.CreateCrator();src.SavedLayer=src.layer;src.layer=TURF_LAYER-1;src.density=0;src.Mogu=1;src<<"Double click an area to pop back up there. You can place objects such as tags or bombs underneath and they will be hidden."
			for(var/mob/M in world)
				if(M.target==src)
					M.target=null
			while(src.Mogu)
				for(var/turf/water/T in view(0,src))
					src.DamageProc(100,"Health",src)
				for(var/turf/water2/T in view(0,src))
					src.DamageProc(100,"Health",src)
				if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in src.loc)
					src.DamageProc(100,"Health",src)
				if(src.knockedout)
					src.density=1;src.layer=src.SavedLayer;src.Frozen=0;src.firing=0;src.CreateCrator();src.Mogu=0;return
				if(src.resting)
					src.density=1;src.layer=src.SavedLayer;src.Frozen=0;src.firing=0;src.CreateCrator();src.resting=0;src.Mogu=0;return
				src.chakra-=rand(30,50)
				src.stamina-=rand(30,50)
				sleep(11)
	DotonDorukiGaeshi(Uses)
		if(src.firing||src.Kaiten)
			return
		if(src.inso)
			return
		else
			if(Uses>650&&src.HoldingR)
				src.ChakraDrain(25000)
				src.StaminaDrain(225)
				src<<"You slam the ground!";flick("crashingleg",src)
				for(var/turf/T in range(3,src))
					if(src.dir==NORTH||src.dir==SOUTH)
						if(T.y==src.y)
							var/obj/Jutsu/Elemental/Doton/DotonWall/D=new();D.Owner=src;D.loc=get_step(T,src.dir);D.JutsuLevel=src.DotonKnowledge;flick("rise",D)
							D.health=src.DotonKnowledge
					if(src.dir==WEST||src.dir==EAST)
						if(T.x==src.x)
							var/obj/Jutsu/Elemental/Doton/DotonWall/D=new();D.Owner=src;D.loc=get_step(T,src.dir);D.JutsuLevel=src.DotonKnowledge;flick("rise",D)
							D.health=src.DotonKnowledge
			else
		//	if(Uses<=650)
				src.ChakraDrain(6500)
				src.StaminaDrain(50);src<<"Você bate no chao!";flick("beastman",src)
				if(src.SoftEarth>0&&src.MudCheck())
					var/number=5
					while(number>0)
						var/obj/Jutsu/Elemental/Doton/DotonWall/D=new()
						D.Owner=src;D.loc=get_step(src,src.dir)
						if(number==4)
							var/d=turn(src.dir,45);D.loc=get_step(src,d)
						if(number==3)
							var/d=turn(src.dir,-45);D.loc=get_step(src,d)
						if(number==2)
							var/d=turn(src.dir,90);D.loc=get_step(src,d)
						if(number==1)
							var/d=turn(src.dir,-90);D.loc=get_step(src,d)
						D.JutsuLevel=src.DotonKnowledge
						D.health=src.DotonKnowledge
						number--

				else
					var/obj/Jutsu/Elemental/Doton/DotonWall/D=new();D.Owner=src;D.loc=get_step(src,src.dir);D.JutsuLevel=src.DotonKnowledge;flick("rise",D)
					D.health=src.DotonKnowledge


	Doton_Spear()
		var/PreviousWeaponInHand=""
		src.ChakraDrain(20000)
		if(src.sphere||src.Kaiten||src.firing)
			return
		PreviousWeaponInHand=src.WeaponInLeftHand
		src.overlays+='Earth Spear.dmi'
		src.DotonSpear=1
		src.WeaponInLeftHand="DotonSpear"
		view()<<"[src] manipula seu chakra de Doton e forma uma lança em torno de seu braço!"
		var/Time=75
		while(src.DotonSpear&&Time>0)
			src.DotonSpear=1
			src.WeaponInLeftHand="DotonSpear"
		//	src.ChakraDrain(5000)
			sleep(11)
			if(src.chakra<=0)
				src.chakra=0;
				src.overlays-='Earth Spear.dmi'
				src.DotonSpear=0;
				src.WeaponInLeftHand=PreviousWeaponInHand
				src<<"Sua falta de chakra faz com que seu braço volte ao normal.";return
			if(src.knockedout)
				src<<"Como você caiu inconsciente seu braço voltou ao normal."
				src.overlays-='Earth Spear.dmi'
				src.DotonSpear=0
				src.WeaponInLeftHand=PreviousWeaponInHand
				return
			Time--
		src<<"Seu braço volta ao normal.";src.DotonSpear=0;
		src.WeaponInLeftHand=PreviousWeaponInHand
		src.overlays-='Earth Spear.dmi'
		src.overlays-='Earth Spear.dmi'
		return
	DotonKengan()
		src.ChakraDrain(18000)
		if(src.sphere||src.Kaiten||src.firing)
			return
		src.Kengan=1
		view()<<"[src] Manipulou seu Chakra Doton e envolveu seu punho com pedra!"
		var/Time=60
		while(src.Kengan&&Time>0)
			sleep(10)
			src.RightHandSheath=0;src.LeftHandSheath=0
			if(src.chakra<=0)
				src.chakra=0;src.Kengan=0;
				src<<"Sua falta de chakra fez seu punho voltar ao normal.";return
			if(src.knockedout)
				src<<"Como você ficou inconsciente seu punho voltou ao normal.";src.Kengan=0;return
			Time--
		src.Kengan=0
		src<<"Suas mãos voltaram ao normal.";return
	//		src.ChakraDrain(2000)
	//		sleep(11)
	//		src.RightHandSheath=0
	//		src.LeftHandSheath=0
	//		if(src.chakra<=0)
	//			src.chakra=0;
	//			Kengan=0;
	Doton_Armor()
		var/X=0
		src.ChakraDrain(28500)
		if(src.sphere||src.Kaiten||src.firing||src.knockedout||src.chakra<=0)
			return
		if(src.RaiArmor&&src.RaiArmor!=2)
			src.overlays-='Icons/Jutsus/RaiArmor.dmi';src.tempmix='Icons/Jutsus/ChakraAura.dmi';src.tempmix+=rgb(224,197,2);var/icon/Q=icon(src.tempmix);src.overlays-=Q;src.RaiArmor=0;src.Touei=0
		src.overlays+='Earth Armor.dmi'
		src.DotonArmor=1
		view()<<"[src] Manipulou seu Chakra Doton e formou uma armadura de pedra ao redor do corpo."
		src.Endurance+=100
		while(src.DotonArmor&&X<100)
			src.ChakraDrain(10000)
			if(src.chakra<=0)
				src.DotonArmor=0
				src.overlays-='Earth Armor.dmi'
				X=99
			sleep(13)
			if(src.knockedout)
				src.DotonArmor=0
				src.overlays-='Earth Armor.dmi'
				X=100
			X++
		src.overlays-='Earth Armor.dmi'
		src.DotonArmor=0
		src.Endurance=src.MEndurance
		src.overlays-='Earth Armor.dmi'
		src<<"Sua armadura de pedra começou a desmoronar!"

	Kouka()
		var/X=0
		src.ChakraDrain(35000)
		if(src.sphere||src.Kaiten||src.firing||src.knockedout)
			return
		if(src.RaiArmor&&src.RaiArmor!=2)
			src.overlays-='Icons/Jutsus/RaiArmor.dmi';src.tempmix='Icons/Jutsus/ChakraAura.dmi';src.tempmix+=rgb(224,197,2);var/icon/Q=icon(src.tempmix);src.overlays-=Q;src.RaiArmor=0;src.Touei=0
	//	src.icon='Earth Armor.dmi'
		src.overlays+='Earth Armor.dmi'
		src.DotonArmor=2
		view()<<"[src] Manipulou seu Chakra Doton e formou uma armadura de pedra ao redor de seu corpo."
		src.Endurance+=300
		while(src.DotonArmor&&X<100)
			src.ChakraDrain(12000)
			sleep(15)
			if(src.knockedout)
				src.DotonArmor=0
				src.overlays-='Earth Armor.dmi'
				X=100
			X+=2
		src.DotonArmor=0
		src.Endurance=src.MEndurance
		src.overlays-='Earth Armor.dmi'
		src<<"Sua armadura de pedra começa a desmoronar!"

	DotonDoryoDangoz(Uses)
		if(src.buyou||src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!=""|src.doingG||src.Frozen)
			return
		else
			var/Multiplier=1
			if(src.MudCheck())
				Multiplier+=(src.tai*(src.SoftEarth*0.05))
			if(src.BoulderMaster)
				src.StaminaDrain(250);src.icon_state="beastman";src.Frozen=1;sleep(2);src<<"[src] pulls a boulder from the ground!";src.icon_state="Power"
				var/obj/Jutsu/Elemental/Doton/BigDoton/K=new();K.name="[src]";K.dir=src.dir;K.Owner=src;K.Move_Delay=0.5;K.JutsuLevel=src.DotonKnowledge
				K.health=src.DotonKnowledge*2;K.loc=src.loc;sleep(2);src.icon_state="Attack1";K.tai=src.tai;K.tai+=Multiplier
				spawn(3)
					walk(K,src.dir);src.icon_state=""
				src.Frozen=0
			else if(src.BoulderExpert)
				src.ChakraDrain(5000)
				src.StaminaDrain(125);src.icon_state="beastman";src.Frozen=1;sleep(1);src<<"[src] pulls a boulder from the ground!"
				var/obj/Jutsu/Elemental/Doton/DotonDD/K=new();K.dir=src.dir;K.Owner=src;K.Move_Delay=0;K.JutsuLevel=src.DotonKnowledge/2
				K.health=src.DotonKnowledge;K.loc=src.loc;sleep(1);src.icon_state="Attack1";K.tai=src.tai;K.tai+=Multiplier
				spawn(2)
					walk(K,src.dir);src.icon_state=""
				src.Frozen=0
			else
				src.ChakraDrain(5000)
				src.StaminaDrain(75);src.icon_state="beastman";src.Frozen=1;sleep(2);src<<"[src] pulls a boulder from the ground!";src.icon_state="Power"
				var/obj/Jutsu/Elemental/Doton/DotonDD/K=new();K.dir=src.dir;K.Owner=src;K.Move_Delay=1;K.JutsuLevel=src.DotonKnowledge/2
				K.health=src.DotonKnowledge;K.loc=src.loc;sleep(2);src.icon_state="Attack1";K.tai=src.tai;K.tai+=Multiplier
				spawn(3)
					walk(K,src.dir);src.icon_state=""
				src.Frozen=0
	DotonWall()
		src.ChakraDrain(20000)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/amount = 0
		var/SafeToUse=0
		var/Location=get_steps(src,NORTH,6)
		for(var/turf/LA in getline(src,Location))
			if(istype(LA,/turf/Buildings/zDensity))
				src<<"Esse jutsu nao é seguro para usar nesse lugar!"
				return
			else if(istype(LA,/turf/Blank))
				src<<"Esse jutsu nao é seguro para usar nesse lugar!"
				return
			else if(istype(LA,/turf/Buildings/House1/Passage))
				src<<"Esse jutsu nao é seguro para usar nesse lugar!"
				return
			else
				SafeToUse=1
		if(!SafeToUse)
			return
		if(src.SoftEarth>0&&src.MudCheck())
			for(var/turf/T in oview(6,src))
				if(T.y>=src.y)
					if(amount<=7 && T.y>=round(src.y+6)||amount>=7 && T.y==src.y)
						var/obj/Jutsu/Elemental/Doton/A=new/obj/Jutsu/Elemental/Doton/doryuuhekiT(locate(T.x,T.y,T.z));A.JutsuLevel=src.DotonKnowledge
						A.health=src.DotonKnowledge;A.Owner=src;A.dir = SOUTH;amount++
						if(amount==6) src.loc=locate(T.x,T.y,T.z)
					else
						var/obj/Jutsu/Elemental/Doton/doryuuheki/A=new/obj/Jutsu/Elemental/Doton/doryuuheki(locate(T.x,T.y,T.z));A.JutsuLevel=0
						A.health=src.DotonKnowledge;A.Owner=src;A.dir = SOUTH
		else if(src.EarthChakra>=20)
			for(var/turf/T in oview(5,src))
				if(T.y>=src.y)
					if(amount<=6 && T.y>=round(src.y+5)||amount>=6 && T.y==src.y)
						var/obj/Jutsu/Elemental/Doton/A=new/obj/Jutsu/Elemental/Doton/doryuuhekiT(locate(T.x,T.y,T.z));A.JutsuLevel=src.DotonKnowledge
						A.health=src.DotonKnowledge;A.Owner=src;A.dir = SOUTH;amount++
						if(amount==5&&src.z!=1) src.loc=locate(T.x,T.y,T.z)
					else
						var/obj/Jutsu/Elemental/Doton/doryuuheki/A=new/obj/Jutsu/Elemental/Doton/doryuuheki(locate(T.x,T.y,T.z));A.JutsuLevel=0
						A.health=src.DotonKnowledge;A.Owner=src;A.dir = SOUTH
		else
			for(var/turf/T in oview(4,src))
				if(T.y>=src.y)
					if(amount<=5 && T.y>=round(src.y+4)||amount>=5 && T.y==src.y)
						var/obj/Jutsu/Elemental/Doton/A=new/obj/Jutsu/Elemental/Doton/doryuuhekiT(locate(T.x,T.y,T.z));A.JutsuLevel=src.DotonKnowledge
						A.health=src.DotonKnowledge;A.Owner=src;A.dir = SOUTH;amount++
						if(amount==5&&src.z!=1) src.loc=locate(T.x,T.y,T.z)
					else
						var/obj/Jutsu/Elemental/Doton/doryuuheki/A=new/obj/Jutsu/Elemental/Doton/doryuuheki(locate(T.x,T.y,T.z));A.JutsuLevel=0
						A.health=src.DotonKnowledge;A.Owner=src;A.dir = SOUTH
	MoveStopper()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		src.ChakraDrain(30000)
		if(M in oview(6))
			src.Handseals(35-src.HandsealSpeed)
			if(src.HandsSlipped) return
			if(M.intank)
				src<<"[M] Está se movendo muito rapido! Não há como você pega-lo!"
				M<<"[src] Tentou por pedras ao redor de você para parar seus movimentos mais sua forma de pedregulho parou isso!";return
	//		if(prob(70))
	//			M.Running=0;
			if(src.Focus>M.Focus*1.2&&prob(60))
				M.Running=0
			else
				if(prob(40))
					M.Running=0
			var/turf/T = get_step(M,M.dir);var/turf/T2 = get_step(M,turn(M.dir,45));var/turf/T3 = get_step(M,turn(M.dir,-45))
			var/turf/T4 = get_step(M,turn(M.dir,90));var/turf/T5 = get_step(M,turn(M.dir,-90))
			for(var/N=5, N>0, N--)
				var/obj/Jutsu/Elemental/Doton/DotonWall/A=new();A.Owner=src;A.health=src.DotonKnowledge;A.JutsuLevel=1;A.health=src.DotonKnowledge/10
				if(N==1){A.loc = T}
				if(N==2){A.loc = T2}
				if(N==3){A.loc = T3}
				if(N==4){A.loc = T4}
				if(N==5){A.loc = T5}
	DoryuuTaiga()
		set background=1
		return
		src.ChakraDrain(15000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/number=round(src.DotonKnowledge/750) //Was Originally 1000, let's try a little lower
		if(number>3) number=3
		src.icon_state="handseal"
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
			src.dir=WEST
		if(src.dir==SOUTHEAST||src.dir==NORTHEAST)
			src.dir=EAST
		if(number>=1)
			var/T1=get_steps(src,turn(src.dir,90),number)
			var/T2=get_steps(src,turn(src.dir,-90),number)
			for(var/turf/T in getline(T1,T2))
				var/obj/Jutsu/Elemental/Doton/DoryuuTaiga/A=new()
				A.loc=T;
				A.dir=src.dir;
				A.Owner=src;
				A.JutsuLevel=1
				A.Move_Delay=0;
				A.icon_state="Front" //Move Delay was originally 1
				walk(A,src.dir)

			var/obj/Jutsu/Elemental/Doton/DoryuuTaiga/B=new()
			var/obj/Jutsu/Elemental/Doton/DoryuuTaiga/C=new()

			B.loc=get_step(T1,turn(src.dir,90));C.loc=get_step(T2,turn(src.dir,-90))
			B.dir=src.dir;B.Owner=src;B.JutsuLevel=1;C.dir=src.dir;C.Owner=src;C.JutsuLevel=1

			B.Move_Delay=0;C.Move_Delay=0;B.animate_movement=3;C.animate_movement=3
			B.icon_state="FrontSide1";C.icon_state="FrontSide2"
			walk(B,src.dir);walk(C,src.dir)

			spawn(50)
				src.icon_state=""
				del(A)
		else
			var/obj/Jutsu/Elemental/Doton/DoryuuTaiga/A=new()
			var/obj/Jutsu/Elemental/Doton/DoryuuTaiga/B=new()
			var/obj/Jutsu/Elemental/Doton/DoryuuTaiga/C=new()

			A.loc=src.loc;B.loc=get_step(src,turn(src.dir,90));C.loc=get_step(src,turn(src.dir,-90))
			A.dir=src.dir;A.Owner=src;A.JutsuLevel=1;B.dir=src.dir;B.Owner=src;B.JutsuLevel=1;C.dir=src.dir;C.Owner=src;C.JutsuLevel=1

			A.Move_Delay=0;B.Move_Delay=0;C.Move_Delay=0;B.animate_movement=3;C.animate_movement=3
			A.icon_state="Front";B.icon_state="FrontSide1";C.icon_state="FrontSide2"
			src.icon_state="handseal"
			walk(A,src.dir);walk(B,src.dir);walk(C,src.dir)
			spawn(50)
		//		src.icon_state==""
				del(A)

	DotonDoryuudanTechnique()
		src.ChakraDrain(37500)
		src.Handseals(42-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/Multiplier=1
		if(src.MudCheck())
			Multiplier+=src.SoftEarth*0.08
		if(src.DoryuudanMaster>3)
			src.ElementalPoints+=(src.DoryuudanMaster-3)
			src.DoryuudanMaster=3
			src<<"Você foi reenbolsado de seus pontos elementais por causa de uma nova mudança que impede mais de  3 pontos serem colocados na passive de Doryuudan Master."
		src.icon_state="handseal";src.Frozen=1
		spawn(15)
			src.Frozen=0
			if(src.icon_state=="handseal")
				src.icon_state=""
		var/b=rand(2,4)+(src.DoryuudanMaster*2)
		var/obj/Jutsu/Elemental/Doton/doryuudan/A=new();A.loc=get_step(src,src.dir);A.dir=src.dir
		while(b>0)
			var/obj/Jutsu/Elemental/Doton/Doryuudan5/D=new()
			D.name="[src]";D.loc=src.loc
			if(b==5||b==2)
				step(D,turn(src.dir,45))
			if(b==6||b==3)
				step(D,turn(src.dir,-45))
			D.icon_state="missle2";D.pixel_x=rand(-10,10);D.pixel_y=rand(-10,10)
			D.nin=src.nin*(pick(0.5,0.6,0.65));D.nin*=Multiplier;D.dir=A.dir;D.Move_Delay=0;A.Owner=src;D.Owner=src;walk(D,A.dir);A.JutsuLevel=src.DotonKnowledge;D.JutsuLevel=src.DotonKnowledge
			sleep(pick(0,1))
			b--
		src.icon_state=""
	DotonDorouDomu()
		if(src.UsingDomu)
			for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in view(1,src))
				if(Objects.Owner==src)
					del(Objects)
			src<<"Você para de usar DorouDomu e solta a pedra."
			src.UsingDomu=0
			return
		src.ChakraDrain(15000)
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(!src.UsingDomu)
			src.UsingDomu=1
			var/obj/Jutsu/Elemental/Doton/DorouDomu/A/A=new()
			A.Owner=src;A.loc=locate(src.x-1,src.y+1,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/B/B=new()
			B.Owner=src;B.loc=locate(src.x,src.y+1,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/C/C=new()
			C.Owner=src;C.loc=locate(src.x+1,src.y+1,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/D/D=new()
			D.Owner=src;D.loc=locate(src.x-1,src.y,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/E/E=new()
			E.Owner=src;E.loc=locate(src.x,src.y,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/F/F=new()
			F.Owner=src;F.loc=locate(src.x+1,src.y,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/G/G=new()
			G.Owner=src;G.loc=locate(src.x-1,src.y-1,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/H/H=new()
			H.Owner=src;H.loc=locate(src.x,src.y-1,src.z)
			var/obj/Jutsu/Elemental/Doton/DorouDomu/I/I=new()
			I.Owner=src;I.loc=locate(src.x+1,src.y-1,src.z)
			while(src.UsingDomu)
				src.icon_state="handseal"
				src.chakra-=50
				sleep(11)
				if(prob(2))
					src<<"O chakra vaza de sua mao enquanto você segura a pedra.."
				if(usr.chakra<1)
					for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in view(1,src))
						if(Objects.Owner==src)
							del(Objects)
					src<<"Você para de usar DorouDomu e solta a pedra.";src.icon_state=""
					src.UsingDomu=0
					return
	TsuchiWana()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		src.ChakraDrain(20000)
		if(M in oview(6))
			src.Handseals(35-src.HandsealSpeed)
			if(src.HandsSlipped) return
			var/obj/Jutsu/Elemental/Doton/EarthB/A=new();A.loc = locate(M.x,M.y,M.z);A.Owner=src;A.health=500;A.JutsuLevel=1
			src<<"The rocks form around [M]!";src.icon_state="bind";sleep(5);A.icon_state = "DoBind"
			sleep(310);M.FrozenBind="";M.EarthBindedBy=""
	DotonCrush()
		if(src.UsingDomuCrush)
			if(src.DotonCrushTarget!=null)
				var/mob/P=src.DotonCrushTarget;P.sight &= ~BLIND
				for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in range(1,P))
					if(Objects.Owner==src)
						del(Objects)
			else
				for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in range(10,src))
					if(Objects.Owner==src)
						del(Objects)
			src<<"Você para de usar Iwakazushi e solta a pedra.";src.UsingDomuCrush=0;src.DotonCrushTarget=null;return
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		if(M.Mogu)
			src<<"[M] está abaixo do chao entao esse jutsu nao faz efeito.";return
		if(M.FrozenBind=="DoBind")
			src<<"[M] já esta preso pelas suas pedras.";return
		src.ChakraDrain(20000);src.Handseals(45-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(!src.UsingDomuCrush)
			src.DotonCrushNumber=0
			src<<"Aperte X para esmagar o alvo ou aperte Z para solta-lo. Quanto mais tempo você prende-lo na prisão,maior será o dano do esmagamento.";var/a=M.loc;sleep(35-src.EarthChakra)
			if(M.loc==a)
				src.DotonCrushTarget=M;M.target=null;var/obj/Jutsu/Elemental/Doton/DorouDomu/A/A=new();A.Owner=src;A.loc=locate(M.x-1,M.y+1,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/B/B=new();B.Owner=src;B.loc=locate(M.x,M.y+1,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/C/C=new();C.Owner=src;C.loc=locate(M.x+1,M.y+1,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/D/D=new()
				D.Owner=src;D.loc=locate(M.x-1,M.y,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/E/E=new();E.Owner=src;E.loc=locate(M.x,M.y,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/F/F=new();F.Owner=src;F.loc=locate(M.x+1,M.y,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/G/G=new();G.Owner=src;G.loc=locate(M.x-1,M.y-1,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/H/H=new();H.Owner=src;H.loc=locate(M.x,M.y-1,M.z);var/obj/Jutsu/Elemental/Doton/DorouDomu/I/I=new()
				I.Owner=src;I.loc=locate(M.x+1,M.y-1,M.z);M.sight |= BLIND
				src.UsingDomuCrush=1
				while(src.UsingDomuCrush)
					src.icon_state="handseal";src.chakra-=300;src.DotonCrushNumber+=300;sleep(11)
					if(prob(2))
						src<<"O chakra vaza de sua mão conforme você segura a pedra.."
					if(usr.chakra<1)
						M.sight &= ~BLIND
						for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in view(1,M))
							if(Objects.Owner==src)
								del(Objects)
						src<<"Você para de usar Iwakazushi e solta a pedra.";src.icon_state="";src.UsingDomuCrush=0;src.DotonCrushTarget=null;return
			else
				src<<"[M] está se movendo muito rapido para prende-lo na terra..";src.DotonCrushTarget=null;src.UsingDomuCrush=0;return
	DotonKakouSekkan()
		if(src.firing||src.Kaiten)
			return
		if(src.UsingKouka)
			if(src.KoukaTarget!=null)
				var/mob/P=src.KoukaTarget;P.sight &= ~BLIND
				P.FrozenBind=""
				for(var/obj/Jutsu/Elemental/Doton/KakouSekkan/Objects in range(1,P))
					if(Objects.Owner==src)
						del(Objects)
			else
				for(var/obj/Jutsu/Elemental/Doton/KakouSekkan/Objects in range(10,src))
					if(Objects.Owner==src)
						del(Objects)
			src<<"Você libera o alvo do seu jutsu.";src.UsingKouka=0;src.KoukaTarget=null;return
		else
			src.ChakraDrain(30000)
			src.Target()
			SekkanList=new();
			var/mob/M=src.target
			var/Hitloc=M.loc
			sleep(2)
			src.Handseals(50-src.HandsealSpeed)
			if(src.HandsSlipped) return
			if(Hitloc!=M.loc) return
			var/obj/Jutsu/Elemental/Doton/KakouSekkan/A=new();A.Owner=src;A.loc=M.loc;SekkanList.Add(A);
			M.sight |= BLIND
			M.FrozenBind="Stone Bind"
			src.KoukaTarget=M
			var/SekkanStruggle=50;
			M<<"Você foi selado com uma pedra! Aperte rapidamente a barra de espaço para se soltar!"
			while(M.FrozenBind=="Stone Bind"&&!M.knockedout&&(M.Struggle<SekkanStruggle))
				M.stamina-=10
				M.health-=2
				sleep(1)
				M.Frozen=1;
				M.firing=1;
			M.sight &= ~BLIND
			M.FrozenBind="";M.Frozen=0;M.firing=0;
			src.KoukaTarget=null;
			for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in SekkanList)
				if(Objects.Owner==src)
					del(Objects)
	DotonYomuNuma(Uses)
		var/HelpfulUse=0
	//	HelpfulUse=round(Uses/200)
	//	if(HelpfulUse>2)
	//		HelpfulUse=2
//		if(MapWeathers["[src.z]"] == "Rain")
//			HelpfulUse++
//		if(MapWeathers["[src.z]"] == "Heavy Rain")
//			HelpfulUse+=2
		src.ChakraDrain(57000)
		src.Handseals(56-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="handseal"
		src<<"Pressione e solte Z para cancelar o jutsu antes."
		//for(var/turf/T in oview(1))
		//	var/obj/Jutsu/Elemental/Doton/Mud/A=new()
		//	A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.DotonKnowledge/5;A.loc=T

		var/Turf=src.loc
		var/AZ=round(3+(src.CalloftheSwamp*1.5))//(4+(src.CalloftheSwamp*3))
		var/Z=1
		while(Z<AZ&&src.icon_state=="handseal")
			for(var/obj/Jutsu/Elemental/Doton/Mud/M in view(AZ,src)) //Was Oview
				M.icon_state="5"
			for(var/turf/T in view(Z+HelpfulUse,src)) //Was Oview
				if(!(T in view(Z-1)))//+HelpfulUse-1))) //Was Oview
					var/obj/Jutsu/Elemental/Doton/Mud/A=new();A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.DotonKnowledge/5;A.loc=T
					FindDirectionalIconState(A,Turf,Z)//+HelpfulUse)



		/*while(Z<AZ&&src.icon_state=="handseal")
			for(var/obj/Jutsu/Elemental/Doton/Mud/M in view(AZ,src)) //Was Oview
				M.icon_state="5"
			for(var/turf/T in view(Z+HelpfulUse,src)) //Was Oview
				if(!(T in view(Z+HelpfulUse-1))) //Was Oview
					var/obj/Jutsu/Elemental/Doton/Mud/A=new();A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.DotonKnowledge/3;A.loc=T
					FindDirectionalIconState(A,Turf,Z)
*/
			Z++
			sleep(3)
		if(Z>=AZ)
			src.icon_state=""

	SwampBrambles()
		src.ChakraDrain(17000)
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="handseal";src.Frozen=1
		spawn(8)
			src.icon_state="";src.Frozen=0
		var/Time=8
		var/obj/Jutsu/Elemental/Doton/MudWave/A=new();A.TimeAlive=Time;A.Owner=src
		var/obj/Jutsu/Elemental/Doton/MudWave/B=new();B.TimeAlive=Time;B.Owner=src
		var/obj/Jutsu/Elemental/Doton/MudWave/C=new();C.TimeAlive=Time;C.Owner=src
		var/obj/Jutsu/Elemental/Doton/MudWave/D=new();D.TimeAlive=Time;D.Owner=src
		var/obj/Jutsu/Elemental/Doton/MudWave/E=new();E.TimeAlive=Time;E.Owner=src
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
mob/proc/CratorSpawn()
		src.ChakraDrain(5000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		usr<<"Clique para fazer uma cratera no lugar!"
		MakeCrato=1
		spawn(200)
		usr<<"O tempo para o jutsu expirou."
		MakeCrato=0;

mob/proc/MakeCrator(atom/Target)
		src.icon_state="handseal"
		src.Frozen=1;src.firing=1;spawn(5)
		src.Frozen=0;src.firing=0;src.icon_state=""
		var/obj/Jutsu/Elemental/Doton/Crator/A=new();A.loc=Target.loc;A.name="[src]";A.Owner=src;

mob/proc
	RisingEarthSpikes()
		src.ChakraDrain(25000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
			src.dir=EAST
		if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
			src.dir=WEST
		src.icon_state="beastman";src.Frozen=1;src.firing=1
		spawn(9)
			src.icon_state="";src.Frozen=0;
			src.firing=0
		var/a=10
		var/prevloc=get_step(src,src.dir)
		while(a>0)
			var/b=rand(2,3)
			while(b>0)
				var/obj/Jutsu/Elemental/Doton/EarthSpike/O=new();
				O.Owner=src
				O.dir=src.dir;
				O.layer=5;
				O.loc=prevloc;var/c=round(32/b)
				if(src.dir==WEST||src.dir==EAST)
					O.pixel_x=c
					if(src.dir==WEST)
						O.pixel_x=(c*-1)+8
					var/d=((11-a)*(6-b))+(10-(2*a));O.pixel_y=rand(-1*d,d);b--
				else if(src.dir==NORTH||src.dir==SOUTH)
					O.pixel_y=c
					if(src.dir==SOUTH)
						O.pixel_y=(c*-1)+6
					var/d=((11-a)*(6-b))+(10-(2*a));O.pixel_x=rand(-1*d,d);b--
				if(prob(20))//was prob(30))
					sleep(2)
			prevloc=get_step(prevloc,src.dir);a--

mob/proc/RisingEarthPillars()
	if(src.firing||src.Kaiten)
		return
	else
		src.ChakraDrain(75000)
		src.Handseals(50-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.Frozen=1
		src.icon_state="handseal"
		var/X=1
		while(X<5&&src.icon_state=="handseal")
			for(var/turf/D in oview(X,src))
				if(!(D in oview(X-1)))
					var/obj/Jutsu/Elemental/Doton/RisingPillars/B=new();B.loc=D;B.name="[src]";B.Owner=src;B.nin=src.nin
			sleep(2+(X*2))
			X++
		src.Frozen=0;
		src.icon_state=""

mob/proc/DotonDoseikiryuu()
	src.ChakraDrain(50000)
	src.Handseals(34-src.HandsealSpeed)//Moves slow so it can be instant
	if(src.HandsSlipped) return
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
		src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
		src.dir=WEST
	var/obj/Jutsu/Elemental/Doton/doseikiryuu/D=new();D.loc=src.loc;D.dir=src.dir;D.nin=src.nin;D.Owner=src;
	walk(D,D.dir);

mob/proc/DotonArijigoku()
	if(src.firing||src.Kaiten||src.knockedout)
		return
	if(src.ntarget)
		return
	src.ChakraDrain(50000)
	if(src.ntarget)
		return
	var/mob/M = src.target
//	src.Frozen=0;
	src.icon_state="beastman";
	src.FrozenBind="Using Arijigoku"
//	src.Frozen=1
//	src.firing=1
	var/Hitloc=M.loc
	sleep(10)
	var/MudStruggle=100;
	var/Time=300
	//var/SomeoneTraped=0;
	if(Hitloc!=M.loc)
	//	src.Frozen=0;src.firing=0
		src.FrozenBind=""
		return
	var/obj/Jutsu/Elemental/Doton/Mud/AA=new();AA.loc=Hitloc;AA.Owner=src;
	M<<"Você está sendo puchado para o pântano! Aperte a barra de espaço para escapar!"
//	src.firing=1;
	src.FrozenBind="Using Arijigoku"
	M.FrozenBind="In Arijigoku"
//	M.Frozen=1;
//	M.firing=1
	src.icon_state="handseal"
	while(src.icon_state=="handseal"&&M.Struggle<MudStruggle)
		if(Time<=0)
			M.health-=2000
			M<<"Você foi enterrado na lama!"
		src.chakra-=9
		sleep(6)
		if(src.chakra<=0)
			src.chakra=0;
			src.icon_state=""
		Time-=5
	src.FrozenBind="";M.FrozenBind=""
//	src.firing=0;
//	src.Frozen=0
//	M.Frozen=0;
	del(AA)

mob/var/tmp/DotonCrushNumber=0


obj/Jutsu/Elemental/Doton/ColumnSpikes
	icon='Icons/Jutsus/DotonTechniques.dmi'
	icon_state="Bottom"
	density=1
	New()
		var/obj/Jutsu/Elemental/Doton/ColumnSpikesTop/T=new
		src.overlays += T

obj/Jutsu/Elemental/Doton/ColumnSpikesTop
		icon_state="Top"
		pixel_y = 32
		//Lol, i see why it was causing prob
mob/proc/ColumnSpikes()
	if(src.HandsSlipped) return
	src.ChakraDrain(15000)
	if(src.ntarget)
		src<<"Você precisa de um alvo para usar esse jutsu."
		return
	var/mob/M = src.target
	src.Frozen=0
	src.icon_state="beastman";
	src.Frozen=1;
	src.firing=1
	var/Hitloc=M.loc
	M<<"Você sente tudo ao seu redor ser reformado."
	spawn(12)
		if(M.loc != Hitloc)
			usr<<"Ele era muito rapido para capturar!"
			M.Frozen=0;src.Frozen=0;src.firing=0;src.icon_state=""
			return
		var/obj/Jutsu/Elemental/Doton/ColumnSpikes/A = new
		var/obj/Jutsu/Elemental/Doton/ColumnSpikes/B = new
		var/obj/Jutsu/Elemental/Doton/ColumnSpikes/C = new
		var/obj/Jutsu/Elemental/Doton/ColumnSpikes/D = new

		A.loc=locate(M.x,M.y+1,M.z);A.dir=SOUTH
		B.loc=locate(M.x,M.y-1,M.z);B.dir=NORTH
		C.loc=locate(M.x+1,M.y,M.z);C.dir=WEST
		D.loc=locate(M.x-1,M.y,M.z);D.dir=EAST
		M.FrozenBind = "ColumnSpikes"
		var/time=10
		src.Frozen=0;src.firing=0
		src.icon_state="handseal"
		src <<"Press Z to Release!"
		while(src.icon_state=="handseal")
			src.chakra-=rand(5,10)
			M.DamageProc(src.NinSkill*(pick(1,1.2)),"Health",src)//not sure if this'll work, but brb...
			M.Bloody()
			sleep(2)
			M.Bloody()
			sleep(2)
			M.Bloody()
			sleep(2)
			M.Bloody()
			time--
			sleep(5)
			if(time<=0) src.icon_state=""
		M.FrozenBind=""
		del(A);del(B);del(C);del(D);del(D)
mob/proc
	MudCheck()
		for(var/turf/muddy/A in view(0,src))
			return 1
		if(locate(/obj/Jutsu/Elemental/Doton/Yomicenter) in src.loc)
			return 1
		if(locate(/obj/Jutsu/Elemental/Doton/DoryuuTaigaTrail) in src.loc)
			return 1
		return 0










mob
	proc
		RockFlurry(Uses)
			src.StaminaDrain(500)
			src.Handseals(1-src.HandsealSpeed)//Move should be instant but calls proc have checks to prevent use in binds and etc.
			if(src.HandsSlipped) return//stande
			var/numberRock

			numberRock = round(((src.tai/20)+0.5))
			if(numberRock>6)
				numberRock = 6
			src.FrozenBind="Rock Flurry" //================================ STUN======================
			var/list/Destinations[0]
			var/i
			var/j
			var/repeat
			for(repeat = 1;repeat<=3;repeat++)
				src.icon_state = "beastman"
				var/obj/S = new()
				S.icon = 'Dust.dmi'
				S.icon_state = "Dust2"
				S.layer = MOB_LAYER+1
				S.x = src.x
				S.y = src.y
				S.z = src.z
				spawn(4) del S
				sleep(2)

				for(i=-numberRock;i<=numberRock;i++)
					for(j=-numberRock;j<=numberRock;j++)
						if(i!=0||j!=0)
							if(prob(src.tai*100/150))
								var/obj/Jutsu/Elemental/Doton/RockF/RF = new()
								RF.loc = src.loc
								RF.x = src.x+i
								RF.y = src.y+j
								RF.dir = NORTH
								RF.Owner = src
								RF.bumpDamage = rand(((src.tai/150*1300)-200),((src.tai/150*1500)+200))
								if(RF.bumpDamage<0)
									RF.bumpDamage = rand(30,50)
								RF.srcStrength = tai
								var/InList=100
								while(InList==100)
									sleep(2)
									var/DestX = rand(-10,10)
									var/DestY = rand(-10,10)
									var/checkdest = "[DestX],[DestY]"
									if(Destinations.len == 0)
										Destinations.Add(checkdest)
									else
										var/checkList
										for(checkList = 1;checkList<=Destinations.len;checkList++)
											if(checkdest == Destinations[checkList])
												InList = 1
												checkList = Destinations.len
										if(InList == 1)
											InList = 100
										else
											InList = 0
											Destinations.Add(checkdest)
											RF.rockDestinationX =DestX+src.x
											RF.rockDestinationY =DestY+src.y
				src.icon_state = "running"

				sleep(2)
			src.FrozenBind="" //=======================UNSTUN ============================


obj/RockFShadow
	icon = 'RockF.dmi'
	icon_state = "shadowsUP"
	New()
		..()
		spawn(200) del src
obj/Jutsu/Elemental/Doton
	RockF
		icon='RockF.dmi'
		icon_state="Rock"
		var/rockDestinationX
		var/rockDestinationY
		var/maxYlimit =0
		var/reach = 0
		var/bumpDamage
		var/srcStrength

		proc
			goingUP()
				var/obj/RockFShadow/S = new()
				S.loc = src.loc
				if((src.y>0)&&(src.x>0)&&(rockDestinationY<=world.maxy)&&(rockDestinationX<=world.maxx)&&(rockDestinationY>0)&&(rockDestinationX>0))
					S.x = src.x
					S.y = src.y
					S.z = src.z
				else
					del S
					del src
				var/i
				for(i=0;i<=5;i++)
					sleep(1)
					if((src.y+1 >= world.maxy)&&(i<=5))
						src.y =world.maxy
						maxYlimit =1
					if(maxYlimit!=1)
						step(src,dir)
				icon_state = "dissapear"
				S.x = rockDestinationX
				S.y = rockDestinationY
				if(srcStrength<45)
					sleep(30)
				else if((srcStrength>45)&&(srcStrength<90))
					sleep(40)
				else
					sleep(50)

				src.x = rockDestinationX
				if(rockDestinationY+8 <=world.maxy)
					src.y = rockDestinationY+8
				else
					src.y = world.maxy
				S.icon_state = "shadowsDOWN"
				icon_state = "Rock"
				if(srcStrength>=90)
					icon_state = "FRock"
				step_towards(src,S)
				if(src.y-1==S.y)
					density=1

				while(reach==0)
					sleep(1)
					step_towards(src,S)
					if(src.y-1==S.y)
						density=1
					if(src.y==S.y)
						icon_state = "Rock"
						flick('Dust.dmi',S)
						spawn(100) del S
						reach = 1
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Owner
				var/damage = bumpDamage
				var/BonusDamage = 0
				BonusDamage=(O.DotonKnowledge/5)
				if(BonusDamage>=500)
					BonusDamage=500
				if(M.key&&M)
					M.DamageProc(damage+BonusDamage,"Stamina",O,"boulder","brown")
					if(srcStrength>=90)
						M.DamageProc(rand(100,200)+(BonusDamage/3),"Health",O,"boulder","brown")

			//	if(M)
			//		view(M)<<output("<font>[M] was by the boulder for ([damage]) damage!</font>","Attack")
				del src
			else
				del src


		New()
			..()
			spawn() src.goingUP()
			spawn(200) del src