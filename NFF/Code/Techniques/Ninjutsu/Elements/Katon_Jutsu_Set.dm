mob/var/tmp
	InvulnerableToFire=0
	Ghit=0
	doingG=0
	RestrictOwnMovement=0
mob/proc/GHitDrain()
	spawn()
		while(src.Ghit>0) src.Ghit--;sleep(1)
obj/Jutsu/Elemental/Katon/H
	icon='KatonTechniques.dmi'
	icon_state="housenka";
obj/Jutsu/Elemental/Katon/S
	icon='shuriken.dmi'
	icon_state="3 bladed shuriken";
obj/Jutsu/Elemental/Katon/HShuriken
	icon='shuriken.dmi'
	icon_state="3 bladed shuriken";
	density=1
	var/nin=10
	Owner
	New()
		..()
		overlays+=/obj/Jutsu/Elemental/Katon/H;overlays+=/obj/Jutsu/Elemental/Katon/S;
		spawn(40)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			var/mob/O=src.Owner
			var/damage=O.FireChakra*6
			if(M.InHydro)
				damage /= 10
				if(prob(40))
					src.loc=null
					del(src)
					return
			else
				M.StatusEffected=rand(12,15)
				M.Status="Burn"
			//	if(!(locate(/obj/ReleaseThingyAilment/Burn) in M.client.screen))
			//		var/obj/ReleaseThingyAilment/Burn/P=new();
			//		P.HowLong=M.StatusEffected
			//		M.client.screen+=P
			//	if(M.client)
			//		M.client.screen+=new/obj/ReleaseThingyAilment/Burn
		//	M.DamageProc((damage),"Health",O)
		//	view(M)<<output("<font color=red>[M] was hit by HousenkaTsumabeni!([damage])</font>","Attack")
			M.DamageProc(damage,"Health",O,"Shurikens On Fire","red")
			if(M.sphere) return
			if(M.Kaiten)
				if(prob(25))
					src.dir=turn(src.dir,90)
					return
				if(prob(25))
					src.dir=turn(src.dir,-90)
					return
				else
					src.dir=turn(src.dir,180)
					return
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			del(src)
	Del()
		if(src.icon=='BKatonTechniques.dmi') src.nin*=2
		for(var/turf/T in getcircle(src,1))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.loc=T;K.nin=src.nin/2;K.Owner=src.Owner;..()


obj/Jutsu/Elemental/Katon
	icon='Icons/Jutsus/KatonTechniques.dmi'
	Element="Katon"
	proc/RandomFlameProc(Color,PixelY,PixelX,Yvar,Xvar,Dir=SOUTH,Number1=1,Number2=3)
		if(Color=="Orange")
			var/a=rand(Number1,Number2)
			while(a>0)
				var/obj/Jutsu/Elemental/Katon/Fire/F=new()
				F.pixel_y=rand(PixelY,PixelY+Yvar)
				F.pixel_x=rand(PixelX,PixelX+Xvar)
				F.dir=Dir
				src.overlays+=F
				a--
		if(Color=="Blue")
			var/a=rand(Number1,Number2)
			while(a>0)
				var/obj/Jutsu/Elemental/Katon/Fire2/F=new()
				F.pixel_y=rand(PixelY,PixelY+Yvar)
				F.pixel_x=rand(PixelX,PixelX+Xvar)
				F.dir=Dir
				src.overlays+=F
				a--
	Fire2
		icon='Icons/Jutsus/BKatonTechniques.dmi'
	//	layer=MOB_LAYER+3
		layer=TURF_LAYER
		icon_state="Fire"
		New()
			..()
			spawn(20)
				del(src)
	//		for(var/obj/Jutsu/Kiriame/S2 in src.loc)
	//			del(src)
	//		for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
	//			spawn()
	//				sleep(1)
	//				if(W)
	//					W.BurnWire()
	//		for(var/mob/M in oview(1,src))
	//			spawn()
	//				var/mob/O=src.Owner
	//				if(M.Kaiten||M.sphere||M.InHydro||M==0||M.UsingDomu||M.InvulnerableToFire)
	//					return
				//	if(M.InHydro)
				//		return
				//	if(M==O) return
				//	if(M.UsingDomu)
				//		return
				//	if(M.InvulnerableToFire) return
	//				M.DamageProc(rand(35,50),"Stamina",O)
	//				M.DamageProc(rand(35,50),"Health",O)
	Fire
	//	layer=MOB_LAYER+3
		layer=TURF_LAYER
		icon_state="Fire"
		New()
			..()
			spawn(20)
				del(src)
		//	for(var/obj/Jutsu/Kiriame/S2 in src.loc)
		//		del(src)
		//	for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
		//		spawn()
		//			sleep(1)
		//			if(W)
		//				W.BurnWire()
		//	for(var/mob/M in oview(1,src))
		//		spawn()
		//			var/mob/O=src.Owner
		//			if(M.Kaiten||M.sphere||M.InHydro||M==0||M.UsingDomu||M.InvulnerableToFire)
		//				return
		//			if(M.InHydro)
		//				return
				//	if(M==O) return
				//	if(M.UsingDomu)
				//		return
		//			if(M.InvulnerableToFire) return
		//			M.DamageProc(rand(35,50),"Stamina",O)
		//			M.DamageProc(rand(35,50),"Health",O)
	GoukakyuuTail
		icon_state="Tail"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
				del(src)



	Goukakyuu
		icon='Icons/Jutsus/KatonGoukakyuu.dmi'
		icon_state="5"
		layer=MOB_LAYER+3
		JutsuLevel=1
		dir=SOUTH
		var/nin=10
		var/UsingMajestic=0
		var/IsGFMA=0
		var/TestLoc=0
		var/DemonicFlames=0
		var/DemonicVitDamage=150
		var/DemonicStaminaDamage=450
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				if(O&&O.BlueFire)
					src.icon='Icons/Jutsus/BKatonTechniques.dmi';overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/AB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/BB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/CB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/DB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/EB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/FB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/GB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/HB
				else
					overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/A;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/B;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/C;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/D;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/E;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/F;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/G;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/H


				while(src&&src.Owner)
					sleep(1)
					var/FireChakra=FireDamage(O)
					var/DamageRangingField=1
					if(O.Magma)
						DamageRangingField=2
					if(O.key=="Lnxerz")
						DamageRangingField=3


			//		spawn(2)
				//		src.SoundEngine('FireSFX.wav',10)
			//			if(O.key=="CobraT1337"||O.key=="The Jefferson")
			//				src.SoundEngine2('FireSFX.wav',5,40)
			//			else
			//				src.SoundEngine('FireSFX.wav',5,40)
/*
					for(var/obj/Q in range(1,src))
						if(istype(Q,/obj/Jutsu/))
							var/obj/Jutsu/B=Q
							if(istype(B,/obj/Jutsu/Kiriame))
								del(B)
							if(istype(B,/obj/Jutsu/Paper))
								del(B)
							if(istype(B,/obj/Jutsu/Elemental/Suiton/))
								if(B.JutsuLevel>(src.JutsuLevel*3))
									BaseChance=2.5
								else if(B.JutsuLevel>(src.JutsuLevel*2))
									BaseChance=4.5
								else if(B.JutsuLevel>src.JutsuLevel)
									BaseChance=5.5
								if(prob(BaseChance))
									del(src)
						else if(istype(Q,/obj/NinjaEquipment/TheWires/))
							var/obj/NinjaEquipment/TheWires/A=Q
							A.BurnWire()
							*/


	//				for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
	//					if(W)
	//						W.BurnWire()
					for(var/obj/Jutsu/P in range(1,src))
						sleep(1)//Might want to delete this sleep right thar
						if(istype(P,/obj/Jutsu/Kiriame))
							del(src)
						if(istype(P,/obj/Jutsu/Paper))
							del(P)
						if(istype(P,/obj/Jutsu/Elemental/Suiton/))
							if(P.JutsuLevel>(src.JutsuLevel*3))
								BaseChance=2.5
							else if(P.JutsuLevel>(src.JutsuLevel*2))
								BaseChance=4.5
							else if(P.JutsuLevel>src.JutsuLevel)
								BaseChance=5.5
							if(prob(BaseChance))
								del(src)



					for(var/mob/M in oview(DamageRangingField,src))
						spawn()
							if(!M)
								continue
							if(M.Kaiten||M.sphere||M.UsingDomu||M.Mogu||M.InvulnerableToFire)
								return
							if(M.DotonArmor)
								if(prob(5)&&!M.knockedout)
									M.DotonArmor=0
									M.overlays-='Earth Armor.dmi'
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							if(M.Ghit<=0)
								var/ChanceOfBurn=(O.Broil*2)/(M.FireImmunity+1)
								var/NinVariable=src.nin
								if(NinVariable<65) NinVariable=65
								var/damage=round(NinVariable*pick(0.95,0.98,1));
								damage=round(damage*(FireChakra*0.028+0.8));
								if(O.key=="Lnxerz")
									damage*=0.80
								var/Chakraz=M.ChakraArmor*0.01
								if(src.icon=='Icons/Jutsus/BKatonTechniques.dmi')
									damage*=1.3
								else if(O.Magma && !M.InHydro)
									damage*=0.85
								damage-=(Chakraz*damage)
								if(M.Clan=="Ketsueki"||M.Clan=="Hoshigaki")
									if(!M.InHydro)
										if(M.Clan=="Ketsueki")
											damage=damage*1.25
											ChanceOfBurn*=1.5
										else if(M.Clan=="Hoshigaki")
											if(prob(ChanceOfBurn)&&!M.knockedout&&!M.ImmuneToDeath)
												M.thirst+=0.15
											if(M.thirst>100)
												M.thirst=100
											if(M.thirst<45)
												damage/=2
						//		if((M.Clan=="Ketsueki" && !M.InHydro)||(M.Clan=="Hoshigaki"&& !M.InHydro))
							//		if(M.Clan=="Ketsueki" && !M.InHydro)
							//			damage=damage*1.25
							//			ChanceOfBurn*=1.5
							//		if(M.Clan=="Hoshigaki" && !M.InHydro)
							//			if(prob(ChanceOfBurn)&&!M.knockedout&&!M.ImmuneToDeath)
							//				M.thirst+=0.15
							//			if(M.thirst>100)
							//				M.thirst=100
							//			if(M.thirst<45)
							//				damage/=2
								else
									if(prob(ChanceOfBurn)&&!M.knockedout && !M.InHydro)
										if(M!=O||M==O&&O.FireImmunity<3)
											M.Status="Burn";M.StatusEffected=O.Broil*2
											if(M.StatusEffected>15)
												M.StatusEffected=15
								//			if(!(locate(/obj/ReleaseThingyAilment/Burn) in M.client.screen))
								//				var/obj/ReleaseThingyAilment/Burn/P=new(M.StatusEffected);
								//				P.HowLong=M.StatusEffected
								//				M.client.screen+=P
											if(M.client)
												M.client.screen+=new/obj/ReleaseThingyAilment/Burn
								if(O==M)
							//		if(src.UsingMajestic)
							//			return
									if(M.key=="Lnxerz")
										return
									var/FireImmune=O.FireImmunity
									if(FireImmune>5)
										FireImmune=5
									damage-=(damage*(FireImmune*0.06))//(FireImmune*0.08)
									if(damage<0)
										damage=5
						//		if(M.Bijuu=="Nibi")
						//			if(M.NibiResistance==1)
						//				damage /=5
						//			if(M.NibiResistance==2)
						//				damage /=7
						//			if(M.NibiResistance==3)
						//				damage /=10
						//			if(M.InHydro)
						//				damage /= 15
								var/waterDeduction=0
								if(MapWeathers["[src.z]"] == "Rain")
									waterDeduction++
								else if(MapWeathers["[src.z]"] == "Heavy Rain")
									waterDeduction+=2
								if(waterDeduction)
									damage *= abs(1 - ((waterDeduction*((6+(2/3))/100))))

				//				if(DemonicFlames)
				//					M.DamageProc(DemonicVitDamage,"Health",O)
				//					M.DamageProc(DemonicStaminaDamage,"Stamina",O)
				//					if(M.Status=="")
				//						M.Status="Burn"
				//						M.StatusEffected=rand(12,15)
				//						if(M.client)
				//							M.client.screen+=new/obj/ReleaseThingyAilment/Burn
				//						return

								spawn()
									M.DamageProc((damage*(3/5)),"Stamina",O,"flames","red","Heat")//Adding Heat should make it buffed beacuse Armor won't block it
								spawn()
									if(M&&!M.BoneMembrane)
										M.DamageProc((damage*(2/5)),"Health",O,"flames","red","Heat")
								if(M)
									if(O.Magma)
										M.Ghit=4//was 3
									else
										M.Ghit=6//was 5
									M.GHitDrain()
			//		sleep(1)
					spawn(1)

						for(var/obj/Jutsu/Elemental/E in oview(DamageRangingField,src))
							sleep(1)//Added 2/18/2013
							if(E&&E.Element=="Mokuton"||E&&E.Element=="Hyouton"||E&&E.Element=="Doton")
								var/damage=round(src.nin*pick(0.9,1));damage=round(damage*(O.FireChakra*0.02+0.8))
								if(E.Element=="Mokuton"||E.Element=="Hyouton")
									damage*=2
								else if(E.Element=="Doton")
									damage/=10
								if(E)
									E.DamageProc((damage),"Stamina",O)
								sleep(1)
							else if(E&&E.Element=="Fuuton")
								O.InvulnerableToFire=1
								spawn(30)
									O.InvulnerableToFire=0
								if(istype(E,/obj/Jutsu/Elemental/Fuuton/Fdaitoppa))
									for(var/turf/TT in getcircle(E,E:Range))
										var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
										AA.loc=TT;AA.nin=src.nin*0.9;AA.Owner=src.Owner
								else if(prob(15))
									for(var/turf/TT in cardinal(src))
										var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
										AA.loc=TT;AA.nin=src.nin*0.9;AA.Owner=src.Owner
								del(E)


					var/Num=8//was 8
					if(O.Magma)
						Num=4//was 5
					sleep(Num)
			spawn(50)
			//	del(src)
		//		src.nin=null
		//		src.Owner=null
		//		src.loc=null
				del(src)
		A
			icon_state="1";pixel_x = -32;pixel_y = 32
		B
			icon_state="2";pixel_y = 32
		C
			icon_state="3";pixel_x = 32;pixel_y = 32
		D
			icon_state="4";pixel_x = -32
		E
			icon_state="6";pixel_x = 32
		F
			icon_state="7";pixel_x = -32;pixel_y = -32
		G
			icon_state="8";pixel_y = -32
		H
			icon_state="9";pixel_x = 32;pixel_y = -32
		AB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="1";pixel_x = -32;pixel_y = 32

		BB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="2";pixel_y = 32
		CB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="3";pixel_x = 32;pixel_y = 32
		DB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="4";pixel_x = -32
		EB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="6";pixel_x = 32
		FB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="7";pixel_x = -32;pixel_y = -32
		GB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="8";pixel_y = -32
		HB
			icon='Icons/Jutsus/BKatonTechniques.dmi';icon_state="9";pixel_x = 32;pixel_y = -32

	SmogTail
		icon_state="Tail"
		layer = MOB_LAYER+1
		New()
			..()
			spawn(34)
				del(src)
	Smog
		icon='Icons/Jutsus/KatonGoukakyuu.dmi'
		icon_state="5"
		layer=MOB_LAYER+2
		JutsuLevel=1
		dir=SOUTH
		var/nin=10
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				var/FireChakra=FireDamage(O)
				while(src&&src.Owner)
					sleep(2)
			///		spawn(8)
			//			src.SoundEngine('FireSFX.wav',5,40)
					var/DamageRangingField=1
					if(O.Magma)
						DamageRangingField=2
					sleep(2)
					var/waterDeduction=0
					for(var/obj/Jutsu/Elemental/Suiton/P in range(1,src))
						if(P.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=0.5
						else if(P.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=1.1
						else if(P.JutsuLevel>src.JutsuLevel)
							BaseChance=1.2
						if(prob(BaseChance))
							del(src)
					//	if(prob(5))
					//		del(src)
						waterDeduction ++
					for(var/mob/M in oview(DamageRangingField,src))
						spawn()
							if(M.Kaiten||M.sphere)
								return
							if(M==O&&M.name=="Boss(NPC)") return
							if(M.UsingDomu)
								return
							if(M.Mogu)
								return
							if(M.InvulnerableToFire) return
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							if(M.Ghit<=0)

								var/ChanceOfBurn=(O.Broil*30)/((M.FireImmunity+1)/2)
								var/damage=round(src.nin*pick(1.2,1.25))
								damage=round((damage/2)*(FireChakra*0.04+0.8));var/Chakraz=M.ChakraArmor*0.01
								if(M.InHydro)
									ChanceOfBurn = 0
									damage /= 15
								if(M.NibiResistance==1)
									damage /=5
								if(M.NibiResistance==2)
									damage /=7
								if(M.NibiResistance==3)
									damage /=10
								if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
								if(M.Clan=="Ketsueki" && !M.InHydro)
									damage=damage*1.25
									ChanceOfBurn*=1.5
								damage-=(Chakraz*damage)
								if(M.Clan=="Hoshigaki")
									if(prob(ChanceOfBurn)&&!M.knockedout&&!M.ImmuneToDeath)
										M.thirst+=0.15
									if(M.thirst>100)
										M.thirst=100
									if(M.thirst<45)
										damage/=2
								else
									if(prob(ChanceOfBurn)&&!M.knockedout)
										if(M!=O||M==O&&O.FireImmunity<3)
											M.Status="Ashed";//M.StatusEffected=O.Broil*2
										//	if(M.StatusEffected>15)
										//		M.StatusEffected=15
								if(O==M)
									var/FireImmune=O.FireImmunity
									if(FireImmune>5)
										FireImmune=5
									damage-=damage*(FireImmune*0.12)
									if(damage<0)
										damage=5
								if(MapWeathers["[src.z]"] == "Rain")
									waterDeduction++
								if(MapWeathers["[src.z]"] == "Heavy Rain")
									waterDeduction+=3
								if(waterDeduction) damage *= abs(1 - ((waterDeduction*((6+(2/3))/100))))
							//	view(M)<<output("<font color=red>[M] has been hit by the flames for [damage] damage!</font>","Attack")
								spawn()
									M.DamageProc((damage*(2/5)),"Stamina",O,"flames","red")
								spawn()
									if(M&&!M.BoneMembrane)
										M.DamageProc((damage*(3/5)),"Health",O,"flames","red")
								if(M)
									if(O.Magma)
										M.Ghit=3
									else
										M.Ghit=5
									M.GHitDrain()
							sleep(2)
					sleep(2)
					spawn(8)
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health",O)
						sleep(1)
					for(var/obj/Jutsu/Elemental/E in oview(DamageRangingField,src))
						var/damage=round(src.nin*pick(0.9,1));damage=round(damage*(O.FireChakra*0.02+0.8))
						if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
						if(E.Element=="Mokuton"||E.Element=="Hyouton")
							damage*=2
						if(E.Element=="Doton")
							damage/=10
						E.DamageProc((damage),"Stamina",O)
						sleep(1)
					sleep(2)
					spawn(8)
					for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(DamageRangingField,src))
						if(Z.Ignitable==1)
							O.InvulnerableToFire=1
							spawn(30)
								O.InvulnerableToFire=0
							if(istype(Z,/obj/Jutsu/Elemental/Fuuton/Fdaitoppa))
								for(var/turf/TT in getcircle(Z,Z:Range))
									var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
									AA.loc=TT;AA.nin=src.nin*0.9;AA.Owner=src.Owner
							else
								for(var/turf/TT in cardinal(src))
									var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
									AA.loc=TT;AA.nin=src.nin*0.9;AA.Owner=src.Owner
							Z.Owner=null;Z.loc=null
							sleep(1)
					sleep(2)
					spawn(8)
					for(var/obj/Jutsu/P in src.loc)
						if(istype(P,/obj/Jutsu/Kiriame))
							src.nin=null;src.Owner=null;src.loc=null
							del(P)
						if(istype(P,/obj/Jutsu/Paper))
							del(P)
				//	for(var/obj/Jutsu/Kiriame/S2 in src.loc)
				//		src.nin=null;src.Owner=null;src.loc=null
				//		sleep(1)
				//	for(var/obj/Jutsu/Paper/A in oview(DamageRangingField,src))
				//		del(A)
					var/Num=8
					if(O.Magma)
						Num=6
					sleep(Num)
			spawn(50)
				src.nin=null
				src.Owner=null
				src.loc=null
	katonG
		icon_state="housenka"
		density=1
		var/nin=10
		New(Pwner)
			..()
			var/mob/O=Pwner
			if(O.BlueFire)
				src.icon='Icons/Jutsus/BKatonTechniques.dmi'
			spawn(40)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.sphere) return
				if(M.Kaiten)
					if(prob(25))
						src.dir=turn(src.dir,90)
						return
					if(prob(25))
						src.dir=turn(src.dir,-90)
						return
					else
						src.dir=turn(src.dir,180)
						return
				var/mob/O=src.Owner
				var/damage=round((O.nin*0.5)+20)
				if(M.NibiResistance==1)
					damage /=5
				if(M.NibiResistance==2)
					damage /=7
				if(M.NibiResistance==3)
					damage /=10
				if(M.InHydro)
					damage /= 15
					if(prob(40))
						src.loc=null
						return
				M.DamageProc((damage*(3/5)),"Stamina",O,"fireball","red")
				if(M&&!M.BoneMembrane)
					M.DamageProc((damage*(2/5)),"Health",O,"fireball","red")
				else if(M)
					M.DamageProc((damage*(1/5)),"Health",O,"fireball","red")
		//		view(M)<<output("<font color=red>[M] has been hit by Housenka for [damage]!</font>","Attack")
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/WEAPONS/Kunai))
					var/obj/WEAPONS/Kunai/D=A
					src.loc=D
				else if(istype(A,/obj/WEAPONS/Shuriken))
					var/obj/WEAPONS/Shuriken/X=A
					src.loc=X
				else if(istype(A,/obj/WEAPONS/Senbon))
					var/obj/WEAPONS/Senbon/Q=A
					src.loc=Q
				else if(istype(A,/obj/Jutsu/Elemental/Katon/Houka))//Just added 6/19 and also added to Houka Object
					var/obj/Jutsu/Elemental/Katon/Houka/B=A
					src.loc=B
				else if(istype(A,/obj/Jutsu/Elemental/Katon/katonG))
					var/obj/Jutsu/Elemental/Katon/O=A
					if(O.Owner==src.Owner)
						return
					else
						del(O);del(src)
				else
					del(src)
		Del()
			if(src.icon=='Icons/Jutsus/BKatonTechniques.dmi') src.nin*=1.5
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.loc=src.loc;K.nin=src.nin/2;K.Owner=src.Owner;..()
	FireSpit
		icon_state="FireSenbon"
		density=1
		Move_Delay=0
		pixel_step_size=16
		var/nin=10
		var/InitialDisplacement="None"
		Move()
			if(src.dir==WEST||src.dir==EAST)
				if(src.InitialDisplacement=="Positive")
					src.pixel_y+=rand(2,4)
					if(src.pixel_y>=16)
						src.pixel_y-=32
						src.loc=get_step(src,NORTH)
					else
						..()
				else if(src.InitialDisplacement=="Negative")
				//	world<<"Previous pixel_y = [src.pixel_y]"
					src.pixel_y-=rand(2,4)
				//	world<<"New pixel_y = [src.pixel_y]"
					if(src.pixel_y<=-16)
						src.pixel_y+=32
				//		world<<"Object should be relocating... Current position is ([src.x],[src.y],[src.z])"
						src.loc=get_step(src,SOUTH)
				//		world<<"Debug: Object's new location is... ([src.x],[src.y],[src.z])"
				//		world<<"Did the y variable change?"
					else
						..()
				else
					..()
			else if(src.dir==NORTH||src.dir==SOUTH)
				if(src.InitialDisplacement=="Positive")
				//	world<<"Previous pixel_x = [src.pixel_x]"
					src.pixel_x+=rand(2,4)
				//	world<<"New pixel_x = [src.pixel_x]"
					if(src.pixel_x>=16)
						src.pixel_x-=32
					//	world<<"Object should be relocating... Current position is ([src.x],[src.y],[src.z])"
						src.loc=get_step(src,EAST)
					//	world<<"Debug: Object's new location is... ([src.x],[src.y],[src.z])"
					//	world<<"Did the x variable change?"
					else
						..()
				else if(src.InitialDisplacement=="Negative")
				//	world<<"Previous pixel_x = [src.pixel_x]"
					src.pixel_x-=rand(2,4)
				//	world<<"New pixel_x = [src.pixel_x]"
					if(src.pixel_x<=-16)
						src.pixel_x+=32
				//		world<<"Object should be relocating... Current position is ([src.x],[src.y],[src.z])"
						src.loc=get_step(src,WEST)
				//		world<<"Debug: Object's new location is... ([src.x],[src.y],[src.z])"
				//		world<<"Did the x variable change?"
					else
						..()
				else
					..()
			else
				..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.Owner
				var/damage=round((O.nin*1.05)+5)
				if(M.InHydro)
					damage /= 15
					if(prob(40))
						src.loc=null
						return
				if(M.NibiResistance==1)
					damage /=5
				if(M.NibiResistance==2)
					damage /=7
				if(M.NibiResistance==3)
					damage /=10
				M.DamageProc((damage),"Health",O,"Dai Endan","red")
			//	view(M)<<output("<font color=red>[M] has been hit by Dai Endan for [damage]!</font>","Attack")
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(isobj(A))
				var/obj/O=A
				if(O.type!=src.type)
					del(src)
				else
					walk(src,0)
					src.loc=O.loc
					walk(src,src.dir)
					return
		Del()
			for(var/turf/T in getcircle(src,1))
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/E=new();E.loc=T;E.nin=src.nin*0.2;E.Owner=src.Owner;E.loc=src.loc
			..()
	FireSpitEXP
		icon_state="FireSenbon"
		density=1
		Move_Delay=0
		pixel_step_size=16
		var/nin=10;
		Bump(A)
			..()
			if(ismob(A))
				var/mob/P=A
				if(!P.knockedout)
					P.health-=rand(50,100)
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(isobj(A))
				var/obj/O=A
				if(O.type!=src.type)
					del(src)
				else
					src.loc=O.loc
					return
		Del()
			var/obj/Jutsu/Elemental/Katon/SmallFireExplosion/A=new();A.nin=src.nin;A.Owner=src.Owner;
			A.Owner=src.Owner
			A.loc=src.loc
			..()

	SmallFireExplosion
		icon='Explosion(1).dmi'
		icon_state="Explode"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		var/nin=10
		New()
			..()
			spawn()
				while(src)
			//		spawn() src.SoundEngine('Bang.wav',5)
					sleep(1)
			//		src.CreateSmoke("Light")
					var/waterDeduction=0
					for(var/obj/Jutsu/Elemental/Suiton/P in range(1,src))
						if((P.JutsuLevel*3)>src.JutsuLevel)
							BaseChance=2.5
						else if((P.JutsuLevel*2)>src.JutsuLevel)
							BaseChance=4.5
						else if(P.JutsuLevel>src.JutsuLevel)
							BaseChance=5.5
						if(prob(BaseChance))
							del(src)
				//		if(prob(25))
					//		del(src)
						waterDeduction ++
					if(MapWeathers["[src.z]"] == "Rain")
						waterDeduction++
					if(MapWeathers["[src.z]"] == "Heavy Rain")
						waterDeduction+=3
					for(var/mob/M in oview(1,src))
						if(!M.UsingDomu&&!M.Kaiten)
							var/mob/O=src.Owner
							var/damage=O.nin*rand(1.5,2)
							if(M.InHydro)
								damage /= 15
							if(M.NibiResistance==1)
								damage /=5
							if(M.NibiResistance==2)
								damage /=7
							if(M.NibiResistance==3)
								damage /=10
							var/Chakraz=M.ChakraArmor*0.01
							damage=damage-(Chakraz*damage)
							if(waterDeduction) damage *= abs(1-waterDeduction*((6+(2/3))/100))

							M.DamageProc(damage/1.5,"Health",O,"Explosion","red")
							M.DamageProc(damage,"Stamina",O,"Explosion","red")
						//	view(M)<<output("<font color=red>[M] has been hit by the explosion!</font>","Attack")
							sleep(5)
			spawn(5)
				del(src)
	KKiritsuhi
		icon_state="FireSenbon"
		density=1
		Move_Delay=0
		pixel_step_size=16
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O = src.Owner
				if(M.Status!="Burn" && !M.InHydro)
					M.Status="Burn"
					M.StatusEffected=(O.Broil*2)+5
					if(M.StatusEffected>20)
						M.StatusEffected=20
				//	if(!(locate(/obj/ReleaseThingyAilment/Burn) in M.client.screen))
				//		var/obj/ReleaseThingyAilment/Burn/P=new();
				//		P.HowLong=M.StatusEffected
				//		M.client.screen+=P
					if(M.client)
						M.client.screen+=new/obj/ReleaseThingyAilment/Burn
			//	M.health-=rand(50,200)
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(isobj(A))
				var/obj/O=A
				if(O.type!=src.type)
					del(src)
				else
					src.loc=O.loc
					return
		Del()
			var/obj/Jutsu/SmallExplosion/E=new()
			E.Owner=src.Owner
			E.loc=src.loc
			..()
	KRyuuka
		icon_state="bam"
		density=1
		layer=OBJ_LAYER+3
		Move_Delay=0
		pixel_step_size=16
		dir
		var/nin=10
		New(Pwner)
			..()
			var/mob/O=Pwner
			if(O.BlueFire) src.icon='Icons/Jutsus/BKatonTechniques.dmi'
			spawn(70) del(src)
		Move()
			var/obj/Jutsu/Elemental/Katon/KRyuukaTrail/L=new();L.icon = src.icon;L.loc = src.loc;L.dir = src.dir;L.Owner = src.Owner
			..()
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.Owner;
				var/damage=round((O.nin*rand(1.3,1.5)));
				if(M.InHydro)
					damage /= 15
					if(prob(40))
						src.loc=null
						return
				if(M.NibiResistance==1)
					damage /=5
				if(M.NibiResistance==2)
					damage /=7
				if(M.NibiResistance==3)
					damage /=10
				M.DamageProc((damage*(1.5/5)),"Stamina",O,"Ryuuka","red")
				if(M&&!M.BoneMembrane)
					M.DamageProc((damage*(3.5/5)),"Health",O,"Ryuuka","red")
			//	view(M)<<output("<font color=red>[A] has been hit by Ryuuka for [damage]!</font>","Attack")
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			if(src.icon=='Icons/Jutsus/BKatonTechniques.dmi') src.nin*=2
			var/mob/O=src.Owner
			for(var/turf/T in getcircle(src,O.DragonsRage))
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
				AA.loc=T;AA.nin=src.nin/2;AA.Owner=src.Owner
			..()
	KRyuukaTrail
		icon_state = "trail"
		layer = OBJ_LAYER+2
		density = 0
		New()
			spawn(70)
				del(src)
		Del()
			src.icon_state="trail die"
			sleep(7)
			..()
	katonEndanTrail
		icon_state = "EndanBody"
		layer=MOB_LAYER+2
		density = 0
		Move_Delay=0
		var
			nin=10;firststep=0
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				while(src)
					sleep(1)
					var/waterDeduction=0
				//	for(var/obj/Jutsu/Elemental/Suiton/Water in range(1,src))
				//		waterDeduction ++
					for(var/obj/Jutsu/Elemental/Z in range(1,src))
						if(istype(Z,/obj/Jutsu/Elemental/Fuuton))
							var/obj/Jutsu/Elemental/Fuuton/ZZ=Z
							if(ZZ.Ignitable==1)
								O.InvulnerableToFire=1
								spawn(30)
									O.InvulnerableToFire=0
								var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
								AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
								AA.nin=src.nin*0.9;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
								AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
								del(ZZ)
					for(var/mob/M in oview(0,src))
						spawn()
							var/damage=src.nin;damage=round(damage*(O.FireChakra*0.02+0.8));var/Chakraz=M.ChakraArmor*0.01
							if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
							if(M.Clan=="Ketsueki" && !M.InHydro)
								damage=damage*1.5
							if(M.Clan=="Hoshigaki" && !M.InHydro)
								M.thirst+=0.15
							if(M.PaperStyleDance && !M.InHydro)
								M.PaperStyleDance=0
							if(M.InHydro)
								damage /= 15
							if(M.NibiResistance==1)
								damage /=5
							if(M.NibiResistance==2)
								damage /=7
							if(M.NibiResistance==3)
								damage /=10
						//	view(M)<<output("<font color=red>[M] has been hit by the flames for [damage-(Chakraz*damage)] damage!</font>","Attack")
							if((M.InHydro && prob(30)) || !M.InHydro)
								M.RestrictOwnMovement=1
								spawn(5)
									ReturnMovement(M)
							if(waterDeduction) damage *= abs(1 - ((waterDeduction*((6+(2/3))/100))))
							spawn()
								M.DamageProc((damage-(Chakraz*damage)),"Stamina",O,"Endan","red")
							spawn()
								if(!M.BoneMembrane&&!M.knockedout)
									spawn()
										M.DamageProc((damage-(Chakraz*damage)/3),"Health",O,"Endan","red")
							step(M,src.dir)
				//	for(var/obj/Jutsu/Elemental/Suiton/Z in range(1,src))
				//		if(Z.JutsuLevel*1.5>src.JutsuLevel)
				//			del(src)
				//		else
				//			del(Z)
			spawn(70) del(src)


		Del()
			for(var/mob/M in src.loc)
				if(M in OnlinePlayers)
					if(M.RestrictOwnMovement)
						ReturnMovement(M)
			..()
	katonEndan
		icon_state = "EndanHead"
		layer=MOB_LAYER+2
		density=1
		Move_Delay=0
		var
			nin=10;firststep=0
		New(Pwner)
			..()
			var/mob/O=Pwner
			if(O.BlueFire) src.icon='Icons/Jutsus/BKatonTechniques.dmi'
			spawn()
				if(src.icon=='Icons/Jutsus/BKatonTechniques.dmi') src.nin*=2
				while(src)
					sleep(1)
			/*		for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(1,src))
						if(Z.Ignitable==1)
							O.InvulnerableToFire=1
							spawn(30)
								O.InvulnerableToFire=0
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin*0.9;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))
						if(Z.JutsuLevel>src.JutsuLevel+500)
							del(src)
						else
			*/		//		del(Z)
			spawn(70) del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner
				if(M.Kaiten) return
				if(M==O&&M.name=="Boss(NPC)") return
				if(M.UsingDomu) return
				if(M.InvulnerableToFire) return
				if(M.Ghit<=0)
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.loc=src.loc;K.nin=src.nin;K.Owner=src.Owner;src.loc=M.loc
					var/damage=round(src.nin*5.5);damage=round(damage*(O.FireChakra*0.02+0.8));var/Chakraz=M.ChakraArmor*0.01
					if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
					if(M.Clan=="Ketsueki" && !M.InHydro)
						damage=damage*1.5
					if(M.Clan=="Hoshigaki" && !M.InHydro)
						M.thirst+=0.15
					if(M.PaperStyleDance && !M.InHydro)
						M.PaperStyleDance=0
					if(M.InHydro)
						damage /= 15
					if(M.NibiResistance==1)
						damage /=5
					if(M.NibiResistance==2)
						damage /=7
					if(M.NibiResistance==3)
						damage /=10
				//	view(M)<<output("<font color=red>[M] has been hit by the flames for [damage-(Chakraz*damage)] damage!</font>","Attack")

					M.DamageProc((damage-(Chakraz*damage)),"Stamina",O,"flames","red")
					if(!M.BoneMembrane&&!M.knockedout)
						M.DamageProc((damage-(Chakraz*damage)/3),"Health",O,"flames","red")
					M.Ghit=5;M.GHitDrain();M.Death(O)

					if(M.InHydro)
						src.loc=null
						return

			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/Jutsu/Elemental/))
				var/obj/Jutsu/Elemental/E=A
				var/mob/O=src.Owner
				var/damage=round(src.nin*pick(0.9,1));damage=round(damage*(O.FireChakra*0.02+0.8))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
				if(E.Element=="Mokuton"||E.Element=="Hyouton")
					damage*=2
				E.DamageProc((damage),"Stamina",O)
				del(src)
			else if(istype(A,/obj/))
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Katon/katonEndanTrail/T=new()
			T.loc = src.loc;T.icon= src.icon;T.dir = src.dir;T.Owner = src.Owner
			if(!src.firststep)
				src.firststep=1
				var/mob/M=src.Owner
				T.loc=get_step(T,M.dir);T.icon_state="EndanTail"
				if(M.dir==SOUTH) T.pixel_y=16
				if(M.dir==NORTH) T.pixel_y=-16;T.layer=MOB_LAYER-1
				if(M.dir==WEST) T.pixel_x=8
				if(M.dir==EAST) T.pixel_x=-8
			if(src.firststep)
				if(prob(40))
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.loc=src.loc;K.nin=src.nin;K.Owner=src.Owner
				..()
	Houka
		icon='Icons/Jutsus/KatonGoukakyuu.dmi'
		icon_state="5"
		layer=MOB_LAYER+2
		dir=NORTH
		density=1
		var/nin=10
		New()
			..()

			var/mob/A=src.Owner
			if(A&&A.BlueFire)
				src.icon='Icons/Jutsus/BKatonTechniques.dmi';overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/AB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/BB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/CB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/DB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/EB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/FB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/GB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/HB
			else
				overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/A;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/B;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/C;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/D;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/E;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/F;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/G;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/H
		//	if(A&&A.ArtificialBijuu=="Nibi")
		//		src.icon+=rgb(102,0,102)
			spawn()
				var/mob/O=src.Owner
				while(src)
					sleep(1)
				//	if(O.icon_state=="Block")
				//		del(src)
				//	world<<"Test"
					var/DamageRangingField=1
					if(O.Magma)
						DamageRangingField=2
					var/waterDeduction=0
					if(MapWeathers["[src.z]"] == "Rain")
						waterDeduction++
					if(MapWeathers["[src.z]"] == "Heavy Rain")
						waterDeduction+=3
					for(var/obj/Jutsu/Elemental/Suiton/P in range(1,src))
						if(P.JutsuLevel>(src.JutsuLevel*3))
							BaseChance=3
						else if(P.JutsuLevel>(src.JutsuLevel*2))
							BaseChance=4.5
						else if(P.JutsuLevel>src.JutsuLevel)
							BaseChance=5.5
						if(prob(BaseChance))
							del(src)
					//	if(prob(15))
					//		del(src)
						waterDeduction ++
					for(var/mob/M in oview(DamageRangingField,src))
						if(M.Kaiten) return
						if(M.Mogu) return
						if(M.InvulnerableToFire) return
						if(M.PaperStyleDance && !M.InHydro)
							M.PaperStyleDance=0
						if(M.Ghit<=0&&M!=O)
							var/damage=round(src.nin*1.5);damage=round(damage*(O.FireChakra*0.02+0.8));var/Chakraz=M.ChakraArmor*0.01
							if(M.Clan=="Ketsueki" && !M.InHydro)
								damage=damage*2.5
							if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
							if(M.InHydro)
								damage /= 15
							if(M.NibiResistance==1)
								damage /=5
							if(M.NibiResistance==2)
								damage /=7
							if(M.NibiResistance==3)
								damage /=10
							if(waterDeduction) damage *= abs(1-waterDeduction*((6+(2/3))/100))
					//		view(M)<<output("<font color=red>[M] has been hit by the flames for [damage-(Chakraz*damage)] damage!</font>","Attack")

							M.DamageProc((damage-(Chakraz*damage)),"Stamina",O,"Houka","red")
							if(!M.BoneMembrane)
								M.DamageProc((damage-(Chakraz*damage)),"Health",O,"Houka","red")
							M.Ghit=5;M.GHitDrain()
						sleep(2)
		//			for(var/obj/NinjaEquipment/TheWires/A in oview(DamageRangingField,src))
		//				sleep(1)
		//				var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=locate(A.x,A.y,A.z);AA.nin=src.nin;AA.Owner=src.Owner;del(A)

					for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(DamageRangingField,src))
						if(Z.Ignitable==1)
							O.InvulnerableToFire=1
							spawn(30)
								O.InvulnerableToFire=0
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
							AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
							AA.nin=src.nin*0.9;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
							AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
							del(Z)
		//			for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
		//				if(W)
		//					W.BurnWire()
				//	for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))//was originally oview(1,src)
				//		if((Z.JutsuLevel*2)>src.JutsuLevel)
				//			del(src)
				//		else
				//			del(Z)
				sleep(4)//was indented should be better now
			spawn(55)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.Owner
				var/damage=round((O.nin)+20)
				if(M.NibiResistance==1)
					damage /=5
				if(M.NibiResistance==2)
					damage /=7
				if(M.NibiResistance==3)
					damage /=10
				if(M.InHydro)
					damage /= 15
					if(prob(40))
						src.loc = null
						return
				M.DamageProc((damage*(2/5)),"Stamina",O,"Houka","red")
				if(M&&!M.BoneMembrane)
					M.DamageProc((damage*(3/5)),"Health",O,"Houka","red")
			//	view(M)<<output("<font color=red>[M] has been hit by Houka for [damage]!</font>","Attack")
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/P = A
				if(istype(P,/obj/WEAPONS/Kunai))
					var/obj/WEAPONS/Kunai/D=P
					src.loc=D
				else if(istype(P,/obj/WEAPONS/Shuriken))
					var/obj/WEAPONS/Shuriken/X=P
					src.loc=X
				else if(istype(P,/obj/WEAPONS/Senbon))
					var/obj/WEAPONS/Senbon/Q=P
					src.loc=Q
				else if(istype(P,/obj/Jutsu/Elemental/Katon/))
					src.loc=P
				else
					del(src)
		Del()
			var/mob/O=src.Owner
			if(O.DragonsRage==0)
				for(var/turf/T in cardinal(src))
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/1.5;AA.Owner=src.Owner
			if(O.DragonsRage==1)
				for(var/turf/T in cardinal(src,2))
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/1.5;AA.Owner=src.Owner

			if(O.DragonsRage>=2)
				if(O.Magma)
					for(var/turf/T in getcircle(src,3))
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/1.5;AA.Owner=src.Owner
				else
					for(var/turf/T in getcircle(src,2))
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/1.5;AA.Owner=src.Owner

			..()
	RaseKa
		icon='Icons/Jutsus/KatonGoukakyuu.dmi'
		icon_state="5"
		layer=MOB_LAYER+2
		dir=NORTH
		density=1
		var/nin=10
		New()
			..()
			var/mob/O=src.Owner
			if(O&&O.BlueFire)
				src.icon='Icons/Jutsus/BKatonTechniques.dmi';overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/AB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/BB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/CB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/DB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/EB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/FB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/GB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/HB
			else
				overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/A;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/B;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/C;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/D;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/E;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/F;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/G;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/H
			spawn()
				spawn() while(src)
					sleep(1)
					spawn(8)
						src.SoundEngine('FireSFX.wav',5,40)
				for(var/obj/Jutsu/Elemental/Katon/A in oview(2))
					spawn(1)
					if(A&&A.JutsuLevel>0)
						spawn(1)
							step_towards(A,src);sleep(1);step_towards(A,src)
				var/DamageRangingField=1
				if(O&&O.Magma)
					DamageRangingField=2
				var/waterDeduction=0
				for(var/obj/Jutsu/Elemental/Suiton/Water in range(1,src))
					if(prob(25))
						del(src)
					waterDeduction ++
				if(MapWeathers["[src.z]"] == "Rain")
					waterDeduction++
				if(MapWeathers["[src.z]"] == "Heavy Rain")
					waterDeduction+=3
				for(var/mob/M in oview(DamageRangingField,src))
					if(M.Kaiten) return
					if(M.Mogu) return
					if(M.InvulnerableToFire) return
					if(M.PaperStyleDance && !M.InHydro)
						M.PaperStyleDance=0
					if(M&&O&&M.Ghit<=0&&M!=O)
						var/damage=round(src.nin*2.2);damage=round(damage*(O.FireChakra*0.02+0.8));var/Chakraz=M.ChakraArmor*0.01
						if(M.Clan=="Ketsueki" && !M.InHydro)
							damage=damage*2
						if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
						if(M.NibiResistance==1)
							damage /=5
						if(M.NibiResistance==2)
							damage /=7
						if(M.NibiResistance==3)
							damage /=10
						if(M.InHydro)
							damage /= 30
						if(waterDeduction) damage *= abs(1-waterDeduction*((6+(2/3))/100))
			//			view(M)<<output("<font color=red>[M] has been hit by the flames for [damage-(Chakraz*damage)] damage!</font>","Attack")

						M.DamageProc((damage-(Chakraz*damage)),"Stamina",O,"flames","red")
						if(!M.BoneMembrane)
							M.DamageProc((damage-(Chakraz*damage)),"Health",O,"flames","red")
						M.Ghit=5;M.GHitDrain()
					sleep(2)
				for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(DamageRangingField,src))
					if(Z.Ignitable==1)
						O.InvulnerableToFire=1
						spawn(30)
							O.InvulnerableToFire=0
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin*0.9;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
						del(Z)
				sleep(8)
			spawn(55)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				M<<"The Fire is emanating too strong of Heat! You're unable to move!"
				M.StunAdd(2)
			//	M.sight |= BLIND
			//	spawn(2)
			//		M.sight &= ~BLIND
			//		del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			//var/mob/O=src.Owner
			for(var/turf/T in oview(1,src))
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin*1.5;AA.Owner=src.Owner
			..()

	Gouenkyuu
		icon='Icons/Jutsus/KatonGoukakyuu.dmi'
		icon_state="5"
		JutsuLevel=1
		layer=MOB_LAYER+2
		dir=NORTH
		density=1
		var/nin=10
		var/Pushes=0
		var/PushCap=15//This is how many times it pushes the person backfore exploding
		New()
			..()
			var/mob/O=src.Owner
			if(O&&O.BlueFire)
				src.icon='Icons/Jutsus/BKatonTechniques.dmi';overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/AB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/BB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/CB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/DB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/EB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/FB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/GB;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/HB
			else
				overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/A;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/B;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/C;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/D;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/E;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/F;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/G;overlays+=/obj/Jutsu/Elemental/Katon/Goukakyuu/H
				spawn()
					while(src)
						sleep(1)
						src.SoundEngine('FireSFX.wav',5,40)
						var/waterDeduction=0
						for(var/obj/Jutsu/Elemental/Suiton/Water in range(1,src))
							waterDeduction ++
						if(MapWeathers["[src.z]"] == "Rain")
							waterDeduction++
						if(MapWeathers["[src.z]"] == "Heavy Rain")
							waterDeduction+=3
						for(var/mob/M in view(2,src))
							spawn()
								if(M!=O&&(M&&O))
									if(M.InHydro)
										O.nin/=2
										if(prob(30))
										//	src.loc=null
											del(src)
									M.Frozen=1
									step(M,src.dir);M.DamageProc(O.nin*0.5,"Health",O);
									Pushes+=1
									sleep(3)
									if(Pushes>=PushCap)
										M.Frozen=0
										del(src)
						if(Pushes>=PushCap)
							del(src)
						var/DamageRangingField=1
						if(O&&O.Magma)
							DamageRangingField=2
						for(var/mob/M in oview(DamageRangingField,src))
							if(M.Kaiten) return
							if(M.Mogu) return
							if(M.InvulnerableToFire) return
							if(M.PaperStyleDance && !M.InHydro)
								M.PaperStyleDance=0
							if(M&&O&&M.Ghit<=0&&M!=O)
								var/damage=round(src.nin*2.3);damage=round(damage*(O.FireChakra*0.02+0.8));var/Chakraz=M.ChakraArmor*0.01
								if(M.Clan=="Ketsueki" && !M.InHydro)
									damage=damage*2
								if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
								if(M.NibiResistance==1)
									damage /=5
								if(M.NibiResistance==2)
									damage /=7
								if(M.NibiResistance==3)
									damage /=10
								if(M.InHydro)
									damage /= 15
								if(waterDeduction) damage *= abs(1-waterDeduction*((6+(2/3))/100))
							//	view(M)<<output("<font color=red>[M] has been hit by the flames for [damage-(Chakraz*damage)] damage!</font>","Attack")

								M.DamageProc((damage-(Chakraz*damage)),"Stamina",O,"flames","red")
								if(!M.BoneMembrane)
									M.DamageProc((damage-(Chakraz*damage)),"Health",O,"flames","red")
								M.Ghit=5;M.GHitDrain()
			//			for(var/obj/NinjaEquipment/TheWires/A in oview(DamageRangingField,src))
			//				sleep(1)
			//				var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=locate(A.x,A.y,A.z);AA.nin=src.nin;AA.Owner=src.Owner;del(A)

						for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(DamageRangingField,src))
							if(Z.Ignitable==1)
								O.InvulnerableToFire=1
								spawn(30)
									O.InvulnerableToFire=0
								var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/B=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/C=new();var/obj/Jutsu/Elemental/Katon/Goukakyuu/D=new()
								AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
								AA.nin=src.nin*0.9;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
								AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
								del(Z)
		//				for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
		//					if(W)
		//						W.BurnWire()
				//		for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))
				//			if((Z.JutsuLevel*2)>src.JutsuLevel)
				//				del(src)
				//			else
				//				del(Z)
						sleep(2)
				spawn(300)
					del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				step(M,src.dir)
				M.Frozen=1
				Pushes+=1
				if(Pushes>=PushCap)
					M.Frozen=0
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/mob/O=src.Owner
			if(O.DragonsRage==0)
				for(var/turf/T in cardinal(src))
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/2;AA.Owner=src.Owner
			if(O.DragonsRage==1)
				for(var/turf/T in cardinal(src,2))
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/2;AA.Owner=src.Owner

			if(O.DragonsRage>=2)
				for(var/turf/T in getcircle(src,3))
					var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=T;AA.nin=src.nin/2;AA.Owner=src.Owner
			..()


	Gouryuuka
		G1
			icon_state="Gouryuuka1"
			density=0
		//	layer=MOB_LAYER+1 //Just changed 6/19/2013
			layer=MOB_LAYER+4

		G2
			icon_state="Gouryuuka2"
			density=0
		//	layer=MOB_LAYER+1
			layer=MOB_LAYER+4

		G3
			icon_state="Gouryuuka3"
			density=1
			layer=MOB_LAYER+4
			var/nin=10
			New()
				..()
				spawn(100)
					del(src)
			Move()
				var/a=rand(3,5)
				while(a>0)
					var/obj/Jutsu/Elemental/Katon/Fire/F=new()
					F.layer=TURF_LAYER
					F.loc=src.loc
					F.icon=src.icon
					F.pixel_x=(src.pixel_x+rand(1,38))
					F.pixel_y=(src.pixel_y+rand(1,38))
					a--

				..()
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.Kaiten||M.sphere)
						del(src)
					var/mob/O=src.Owner
					var/damage=round(rand(src.nin*2.5,src.nin*3))
					if(M.NibiResistance==1)
						damage /=5
					if(M.NibiResistance==2)
						damage /=7
					if(M.NibiResistance==3)
						damage /=10
					if(M.InHydro)
						damage /= 15
						if(prob(40))
							src.loc=null
							return
					if(src.icon=='Icons/Jutsus/BKatonTechniques.dmi') damage*=2
					if(M.PaperStyleDance && !M.InHydro)
						M.PaperStyleDance=0
					M.DamageProc(damage*(2/3),"Stamina",O,"Giant Dragon Head Of Fire","red")
					M.DamageProc(damage*(1/3),"Health",O,"Giant Dragon Head Of Fire","red")
					M.SoundEngine('HitStrong.wav',10)
					if(M.PaperStyleDance && !M.InHydro)
						M.PaperStyleDance=0
					if(M.RaiArmor)
						M.overlays-='Icons/Jutsus/RaiArmor.dmi'
						M.RaiArmor=0
				//	view(M)<<output("<font color=red>[M] was hit by Gouryuuka!([damage])</font>","Attack")
					spawn(1)
						M.dir=src.dir;
						M.HitBack(4,src.dir)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/Jutsu/Elemental/))
					var/obj/Jutsu/Elemental/E=A
					var/mob/O=src.Owner
					var/damage=round(src.nin*pick(0.9,1))
					if(O.ElementalCapacity>1)
						damage=round(src.nin*pick(0.5,0.6))
					if(E.Element=="Mokuton"||E.Element=="Hyouton")
						damage*=2
					E.DamageProc((damage),"Stamina",O)
					del(src)
				else if(istype(A,/obj/))
					del(src)
			Del()
				var/mob/O=src.Owner
				if(O.DragonsRage==1)
					for(var/turf/T in cardinal(src))
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
						AA.loc=T;AA.nin=src.nin/4
						AA.Owner=src.Owner

				if(O.DragonsRage>=2)
					for(var/turf/T in getcircle(src,2))
						var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new()
						AA.loc=T;AA.nin=src.nin/4
						AA.Owner=src.Owner
				..()
		G4
			icon_state="Gouryuuka4"
			density=1
			layer=MOB_LAYER+4
/*Fire Trick:
Fire snapped in location.
*/
mob/proc/Hikibou(Uses)
	src.ChakraDrain(5000)
	src.Handseals(15-src.HandsealSpeed)
	if(src.HandsSlipped||src.Frozen) return
	src.InvulnerableToFire=1;spawn(10) src.InvulnerableToFire=0
	src<<"You heat the air in front of you."
	var/FireLocationX=src.x;var/FireLocationY=src.y;var/FireLocationZ=src.z
	if(src.dir==NORTH) FireLocationX=src.x;FireLocationY=src.y+1
	if(src.dir==EAST) FireLocationX=src.x+1;FireLocationY=src.y
	if(src.dir==WEST) FireLocationX=src.x-1;FireLocationY=src.y
	if(src.dir==SOUTH) FireLocationX=src.x;FireLocationY=src.y-1
	sleep(11)
	var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=locate(FireLocationX,FireLocationY,FireLocationZ);K.nin=src.nin;K.Owner=src;K.icon_state="5";K.JutsuLevel=src.KatonKnowledge/4
	if(Uses>100)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/KK=new();KK.loc=locate(FireLocationX+1,FireLocationY,FireLocationZ);KK.nin=src.nin*0.5;KK.Owner=src;KK.icon_state="5";KK.JutsuLevel=src.KatonKnowledge/4
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/KKK=new();KKK.loc=locate(FireLocationX-1,FireLocationY,FireLocationZ);KKK.nin=src.nin*0.5;KKK.Owner=src;KKK.icon_state="5";KKK.JutsuLevel=src.KatonKnowledge/4
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/KKKK=new();KKKK.loc=locate(FireLocationX,FireLocationY+1,FireLocationZ);KKKK.nin=src.nin*0.5;KKKK.Owner=src;KKKK.icon_state="5";KKKK.JutsuLevel=src.KatonKnowledge/4
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/KKKKK=new();KKKKK.loc=locate(FireLocationX,FireLocationY-1,FireLocationZ);KKKKK.nin=src.nin*0.5;KKKKK.Owner=src;KKKKK.icon_state="5";KKKKK.JutsuLevel=src.KatonKnowledge/4
	if(Uses>500)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=locate(FireLocationX+2,FireLocationY,FireLocationZ);AA.nin=src.nin*0.25;AA.Owner=src;AA.icon_state="5";AA.JutsuLevel=src.KatonKnowledge/4
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/AAA=new();AAA.loc=locate(FireLocationX-2,FireLocationY,FireLocationZ);AAA.nin=src.nin*0.25;AAA.Owner=src;AAA.icon_state="5";AAA.JutsuLevel=src.KatonKnowledge/4
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/AAAA=new();AAAA.loc=locate(FireLocationX,FireLocationY+2,FireLocationZ);AAAA.nin=src.nin*0.25;AAAA.Owner=src;AAAA.icon_state="5";AAAA.JutsuLevel=src.KatonKnowledge/4
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/AAAAA=new();AAAAA.loc=locate(FireLocationX,FireLocationY-2,FireLocationZ);AAAAA.nin=src.nin*0.25;AAAAA.Owner=src;AAAAA.icon_state="5";AAAAA.JutsuLevel=src.KatonKnowledge/4
/*Fireball Jutsu:
A ball of fire shot from the mouth.
*/
mob/proc/GoukakyuuNoJutsu(Uses,DemonicFlames)
	src.ChakraDrain(10000)
	if(src.BlueFire)
		src.ChakraDrain(5000)
	src.Handseals(40-src.HandsealSpeed*10)
	if(src.HandsSlipped) return
	src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays-='Icons/Jutsus/BKatonTechniques.dmi'
	if(src.BlueFire)
		src.overlays+='Icons/Jutsus/BKatonTechniques.dmi'
	else
		src.overlays+='Icons/Jutsus/KatonTechniques.dmi'
	src.Frozen=1;src.doingG=1
	spawn(34)
		src.doingG=0;src.Frozen=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays-='Icons/Jutsus/BKatonTechniques.dmi'
	if(Uses>10000&&src.Charging)
		src.ChakraDrain(275000)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=src.nin*1.2;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=src.nin;K.JutsuLevel=src.KatonKnowledge; if(DemonicFlames) K.DemonicFlames=1
		var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
		if(src.dir==SOUTH)
			Q.pixel_y = 16
		if(src.dir==NORTH)
			Q.pixel_y=-16;Q.layer=MOB_LAYER-1
		if(src.dir==WEST)
			Q.pixel_x=8
		if(src.dir==EAST)
			Q.pixel_x = -8
		Q.loc=src.loc;step(Q,src.dir);Q.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge
		K.loc = get_steps(src,src.dir,9)
		for(var/turf/T in getcircle(K,7))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/KK=new();KK.Move_Delay=0;KK.loc=T;KK.nin=src.nin*1.2;KK.Owner=src;KK.JutsuLevel=src.KatonKnowledge
		for(var/mob/M in getcircle(K,7))
			M.DamageProc(src.nin,"Health",Q)
			view(M)<<output("<font color=red>[M] was hit by goukakyuu!([src.nin])</font>","Attack")
		return
	if(src.Inferno==0||src.Inferno==1&&!src.HoldingR||src.Inferno==2&&!src.HoldingR)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=src.nin*1.2;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=src.nin;K.JutsuLevel=src.KatonKnowledge;if(DemonicFlames) K.DemonicFlames=1
		if(src.UchihaMastery>=100)
			K.nin+=25
		var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
		if(src.dir==SOUTH)
			Q.pixel_y = 16
		if(src.dir==NORTH)
			Q.pixel_y=-16;Q.layer=MOB_LAYER-1
		if(src.dir==WEST)
			Q.pixel_x=8
		if(src.dir==EAST)
			Q.pixel_x = -8
		Q.loc=src.loc;step(Q,src.dir);Q.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge
		K.loc = get_steps(src,src.dir,2)
		return
	if(src.Inferno==1&&src.HoldingR||src.Inferno>=3&&!src.HoldingR)
		src.ChakraDrain(15000)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=src.nin*1.35;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=src.nin*1.2;K.JutsuLevel=src.KatonKnowledge;if(DemonicFlames) K.DemonicFlames=1
		if(src.UchihaMastery>=100)
			K.nin+=25
		var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
		if(src.dir==SOUTH)
			Q.pixel_y = 16
		if(src.dir==NORTH)
			Q.pixel_y=-16;Q.layer=MOB_LAYER-1
		if(src.dir==WEST)
			Q.pixel_x=8
		if(src.dir==EAST)
			Q.pixel_x = -8
		Q.loc=src.loc;step(Q,src.dir);Q.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge
		K.loc = get_steps(src,src.dir,3)
		for(var/turf/T in cardinal(K))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/KK=new();KK.Move_Delay=0;KK.loc=T;KK.nin=src.nin*1.35;KK.Owner=src;KK.JutsuLevel=src.KatonKnowledge;if(DemonicFlames) KK.DemonicFlames=1
			if(src.UchihaMastery>=100)
				KK.nin+=25
		for(var/mob/M in getcircle(K))
			M.DamageProc(src.nin,"Health",Q)
			view(M)<<output("<font color=red>[M] was hit by goukakyuu!([src.nin])</font>","Attack")
		return
	if(src.Inferno==2&&src.HoldingR)
		src.ChakraDrain(20000)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=src.nin*1.35;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=src.nin*1.2;K.JutsuLevel=src.KatonKnowledge;if(DemonicFlames) K.DemonicFlames=1
		if(src.UchihaMastery>=100)
			K.nin+=25
		var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
		if(src.dir==SOUTH)
			Q.pixel_y = 16
		if(src.dir==NORTH)
			Q.pixel_y=-16;Q.layer=MOB_LAYER-1
		if(src.dir==WEST)
			Q.pixel_x=8
		if(src.dir==EAST)
			Q.pixel_x = -8
		Q.loc=src.loc;step(Q,src.dir);Q.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge
		K.loc = get_steps(src,src.dir,3)
		for(var/turf/T in getcircle(K,1))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/KK=new();KK.Move_Delay=0;KK.loc=T;KK.nin=src.nin*1.35;KK.Owner=src;KK.JutsuLevel=src.KatonKnowledge;if(DemonicFlames) KK.DemonicFlames=1
			if(src.UchihaMastery>=100)
				KK.nin+=25
		for(var/mob/M in getcircle(K,1))
			M.DamageProc(src.nin,"Health",Q)
			view(M)<<output("<font color=red>[M] was hit by goukakyuu!([src.nin])</font>","Attack")
		return
	if(src.Inferno>=3&&src.HoldingR)
		src.ChakraDrain(25000)
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=src.nin*1.35;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=src.nin*1.2;K.JutsuLevel=src.KatonKnowledge
		if(src.UchihaMastery>=100)
			K.nin+=25
		var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
		if(src.dir==SOUTH)
			Q.pixel_y = 16
		if(src.dir==NORTH)
			Q.pixel_y=-16;Q.layer=MOB_LAYER-1
		if(src.dir==WEST)
			Q.pixel_x=8
		if(src.dir==EAST)
			Q.pixel_x = -8
		Q.loc=src.loc;step(Q,src.dir);Q.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge
		K.loc = get_steps(src,src.dir,4)
		for(var/turf/T in getcircle(K,2))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/KK=new();KK.Move_Delay=0;KK.loc=T;KK.nin=src.nin*1.35;KK.Owner=src;KK.JutsuLevel=src.KatonKnowledge;if(DemonicFlames) KK.DemonicFlames=1
			if(src.UchihaMastery>=100)
				KK.nin+=25
		for(var/mob/M in getcircle(K,2))
			M.DamageProc(src.nin,"Health",Q)
			view(M)<<output("<font color=red>[M] was hit by goukakyuu!([src.nin])</font>","Attack")
		return
	/*if(src.UchihaMastery==100)
		K.nin=src.nin*1.4;K.JutsuLevel=src.KatonKnowledge*2
		if(src.ElementalCapacity==1&&src.KatonKnowledge>12000)
			K.nin*=2
	var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/T=new();T.Owner=src;T.icon=K.icon
	if(src.dir==SOUTH) T.pixel_y = -16;T.layer=MOB_LAYER+1
	if(src.dir==NORTH) T.pixel_y= 16;T.layer=MOB_LAYER-1
	if(src.dir==WEST) T.pixel_x = -8;T.layer=MOB_LAYER-1
	if(src.dir==EAST) T.pixel_x = 8;T.layer=MOB_LAYER-1
	T.loc=src.loc;T.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge;T.dir=src.dir*/
/*Gouenkyuu (Great Blaze Ball)
The upgraded version of Great Fireball, this technique can carry enemies away and set them ablaze
*/
mob/proc/GouenkyuuNoJutsu(Uses)
	src.ChakraDrain(20000)
	src.Handseals(35-src.HandsealSpeed*10)
	if(src.HandsSlipped) return
	src.Frozen=1
	src.ChakraDrain(15000)
	src.Frozen=0;
	var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
	if(src.dir==SOUTH)
		Q.pixel_y = 16
	if(src.dir==NORTH)
		Q.pixel_y=-16;Q.layer=MOB_LAYER-1
	if(src.dir==WEST)
		Q.pixel_x=8
	if(src.dir==EAST)
		Q.pixel_x = -8
	var/obj/Jutsu/Elemental/Katon/Gouenkyuu/F=new();F.Owner=src;F.loc=src.loc;F.dir=src.dir;F.nin=src.nin*2;F.Owner=src;walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;sleep(1);
/*	if(src.dir==SOUTH)
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FF1=new();FF1.loc=locate(src.x,src.y+1,src.z);FF1.Owner=src;FF1.dir=src.dir;FF1.nin=src.nin*2;FF1.Owner=src;walk(FF1,FF1.dir);FF1.JutsuLevel=src.KatonKnowledge;sleep(1);
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FFF1=new();FFF1.loc=locate(src.x,src.y-1,src.z);FFF1.Owner=src;FFF1.dir=src.dir;FFF1.nin=src.nin*2;FFF1.Owner=src;walk(FFF1,FFF1.dir);FF1.JutsuLevel=src.KatonKnowledge;sleep(1);
	if(src.dir==NORTH)
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FF2=new();FF2.loc=locate(src.x,src.y+1,src.z);FF2.Owner=src;FF2.dir=src.dir;FF2.nin=src.nin*2;FF2.Owner=src;walk(FF2,FF2.dir);FF2.JutsuLevel=src.KatonKnowledge;sleep(1);
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FFF2=new();FFF2.loc=locate(src.x,src.y-1,src.z);FFF2.Owner=src;FFF2.dir=src.dir;FFF2.nin=src.nin*2;FFF2.Owner=src;walk(FFF2,FFF2.dir);FF2.JutsuLevel=src.KatonKnowledge;sleep(1);
	if(src.dir==WEST)
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FF3=new();FF3.loc=locate(src.x+1,src.y,src.z);FF3.Owner=src;FF3.dir=src.dir;FF3.nin=src.nin*2;FF3.Owner=src;walk(FF3,FF3.dir);FF3.JutsuLevel=src.KatonKnowledge;sleep(1);
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FFF3=new();FFF3.loc=locate(src.x-1,src.y,src.z);FFF3.Owner=src;FFF3.dir=src.dir;FFF3.nin=src.nin*2;FFF3.Owner=src;walk(FFF3,FFF3.dir);FFF3.JutsuLevel=src.KatonKnowledge;sleep(1);
	if(src.dir==EAST)
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FF4=new();FF4.loc=locate(src.x+1,src.y,src.z);FF4.Owner=src;FF4.dir=src.dir;FF4.nin=src.nin*2;FF4.Owner=src;walk(FF4,FF4.dir);FF4.JutsuLevel=src.KatonKnowledge;sleep(1);
		var/obj/Jutsu/Elemental/Katon/Gouenkyuu/FFF4=new();FFF4.loc=locate(src.x-1,src.y,src.z);FFF4.Owner=src;FFF4.dir=src.dir;FFF4.nin=src.nin*2;FFF4.Owner=src;walk(FFF4,FFF4.dir);FFF4.JutsuLevel=src.KatonKnowledge;sleep(1);
*/


/*Gouka Mekkyaku (Great Fire Magestic Annihilation)
A highly dangerous upgrade to Great Blaze Ball, the user expels from the mouth in a
massive wall of intense flames which covers an expansive range, making it extremely difficult to avoid.
*/
mob/proc/GoukaMekkyakuNoJutsu(Uses)
	var/N=src.nin*5
	var/X=src.x
	var/Y=src.y
	var/Z=src.z
	var/G=1
	var/H=0
	var/HC=0
	var/GC=12
	var/NI=src.nin*(0.8)
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
		src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
		src.dir=WEST
//	src.ChakraDrain(10000)
	src.Handseals(55-(src.HandsealSpeed*10))
	if(src.HandsSlipped) return
	src.Frozen=1;
	src.doingG=1
	src.ChakraDrain(50000)
	if(src.BlueFire)
		src.ChakraDrain(10000)
	src.overlays+='Icons/Jutsus/KatonTechniques.dmi'
	if(src.UchihaMastery>=100)
		N*=1.1
	if(src.dir==NORTH)
		while(G<=GC)
			while(H<=HC)
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/A=new();A.loc=locate(X+H,Y+G,Z);A.UsingMajestic=1;A.nin=NI;A.Owner=src;A.JutsuLevel=src.KatonKnowledge;A.dir=src.dir;A.IsGFMA=1;
				H++
			sleep(1)
			if(G>5)
				H=0
				HC+=1
				H=HC*(-1)
			else if(G==5)
				H=-3
				HC=3
			else if(G<3)
				H=0
				H-=G
				HC+=1
			else
				H=-2
				HC=2
			G++
	if(src.dir==SOUTH)
		while(G<=GC)
			while(H<=HC)
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/A=new();A.loc=locate(X-H,Y-G,Z);A.UsingMajestic=1;A.nin=NI;A.Owner=src;A.JutsuLevel=src.KatonKnowledge;A.dir=src.dir;A.IsGFMA=1;
				H++
			sleep(1)
			if(G>5)
				H=0
				HC+=1
				H=HC*(-1)
			else if(G==5)
				H=-3
				HC=3
			else if(G<3)
				H=0
				H-=G
				HC+=1
			else
				H=-2
				HC=2
			G++
	if(src.dir==WEST)
		while(G<=GC)
			while(H<=HC)
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/A=new();A.loc=locate(X-G,Y-H,Z);A.UsingMajestic=1;A.nin=NI;A.Owner=src;A.JutsuLevel=src.KatonKnowledge;A.dir=src.dir;A.IsGFMA=1;
				H++
			sleep(1)
			if(G>5)
				H=0
				HC+=1
				H=HC*(-1)
			else if(G==5)
				H=-3
				HC=3
			else if(G<3)
				H=0
				H-=G
				HC+=1
			else
				H=-2
				HC=2
			G++
	if(src.dir==EAST)
		while(G<=GC)
			while(H<=HC)
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/A=new();A.loc=locate(X+G,Y+H,Z);A.UsingMajestic=1;A.nin=NI;A.Owner=src;A.JutsuLevel=src.KatonKnowledge;A.dir=src.dir;A.IsGFMA=1;
				H++
			sleep(1)
			if(G>5)
				H=0
				HC+=1
				H=HC*(-1)
			else if(G==5)
				H=-3
				HC=3
			else if(G<3)
				H=0
				H-=G
				HC+=1
			else
				H=-2
				HC=2
			G++
	spawn(34)
		src.doingG=0;src.Frozen=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays-='Icons/Jutsus/BKatonTechniques.dmi'

/*Ash Pile Burning*/
mob/proc/HaisekishoNoJutsu(Uses)
	src.ChakraDrain(20000)
	src.Handseals(40-(src.HandsealSpeed*10))
	if(src.HandsSlipped) return
	src.Frozen=1;src.doingG=1
	src.ChakraDrain(15000)
	src.overlays+='Icons/Jutsus/KatonTechniques.dmi'
	spawn(34)
		src.doingG=0;src.Frozen=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays-='Icons/Jutsus/BKatonTechniques.dmi'
	var/obj/Jutsu/Elemental/Katon/SmogTail/Q=new();Q.layer=MOB_LAYER+1
	var/obj/Jutsu/Elemental/Katon/Smog/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=src.nin;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=src.nin;K.JutsuLevel=src.KatonKnowledge
	if(src.dir==SOUTH)
		Q.pixel_y = 16
	if(src.dir==NORTH)
		Q.pixel_y=-16;Q.layer=MOB_LAYER-1
	if(src.dir==WEST)
		Q.pixel_x=8
	if(src.dir==EAST)
		Q.pixel_x = -8
	K.loc = get_steps(src,src.dir,4)
	for(var/turf/T in getcircle(K,3))
		var/obj/Jutsu/Elemental/Katon/Smog/KK=new();KK.Move_Delay=0;KK.loc=T;KK.nin=src.nin;KK.Owner=src;KK.JutsuLevel=src.KatonKnowledge
	return;

/*Mythical Phoenix Fire Jutsu:
Shoots multiple balls of fire.
*/
mob/var/tmp
	HousenkaShots=0
mob/proc/KatonHousenkaNoJutsu(Uses)
	src.ChakraDrain(10500)
	if(src.BlueFire)
		src.ChakraDrain(12000)
	src.Handseals(30-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/i=1;var/DamageNumber=src.nin
	if(src.HousenkaExpert==1){i=2;DamageNumber*=1.1}
	if(src.HousenkaExpert==2){i=3;DamageNumber*=1.25}
	usr.HousenkaShots=i
	usr<<"Press Z to shoot your fireballs. You have 10 seconds, and [src.HousenkaShots] shots."
	spawn(100)
		if(usr.HousenkaShots>0)
			usr<<"You ran out of time and lost your built up chakra for your fireball shots."
			usr.HousenkaShots=0
mob/proc/HousenkaShoot()
	if(src.HousenkaShots>0)
		src.HousenkaShots--
		var/i=3;var/DamageNumber=src.nin
		if(src.HousenkaExpert==1){DamageNumber*=1.1}
		if(src.HousenkaExpert==2){DamageNumber*=1.25}
		while(i>0)
			var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=DamageNumber
			if(i==3&&F)
				F.loc=get_step(src,turn(src.dir,45))
			if(i==2&&F)
				F.loc=get_step(src,turn(src.dir,-45))
			walk(F,src.dir);F.JutsuLevel=src.KatonKnowledge;i--;sleep(1)
		sleep(6)
	else
		return
/*Phoenix Sage Flower Nail Crimson*/
mob/proc/KatonHousenkaTsumabeniNoJutsu(Uses)
	src.ChakraDrain(8000)
	src.Handseals(20-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/i=4;
	while(i>0)
		var/obj/Jutsu/Elemental/Katon/HShuriken/S=new();S.dir=src.dir;S.nin=src.nin;S.loc=src.loc;S.Owner=src;
		S.Move_Delay=0.5;
		if(i==3&&S)
			S.loc=get_step(src,turn(src.dir,45))
		if(i==2&&S)
			S.loc=get_step(src,turn(src.dir,-45))
		walk(S,src.dir,S.Move_Delay);
		if(i==2)
			sleep(3);
		i--;

//Exploding Fire Spit
/*Katon Endan (Flame Bullet)*/
mob/proc/FireSpit()
	src.ChakraDrain(8000)
	src.Handseals(29-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Elemental/Katon/FireSpitEXP/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin
	walk(F,F.dir)
	F.JutsuLevel=src.KatonKnowledge

/*Katon Dai Endan (Big Flame Bullet)*/
mob/proc/FireSpitBarrage()
	src.ChakraDrain(14000)
	if(src.BlueFire)
		src.ChakraDrain(5000)
	src.Handseals(31-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/random=rand(5,9)
	while(random>0)
		spawn()
			var/obj/Jutsu/Elemental/Katon/FireSpit/F=new(Pwner=src);F.loc=src.loc;F.nin=src.nin;F.Owner=src;F.dir=src.dir
			F.pixel_x=rand(-12,12);F.pixel_y=rand(-12,12)
			//src<<"[F] started with pixel_x = [F.pixel_x] and pixel_y = [F.pixel_y]."
			if(F.dir==WEST||F.dir==EAST)
				if(F.pixel_y>4){F.InitialDisplacement="Positive"}
				else if(F.pixel_y<-4){F.InitialDisplacement="Negative"}
			if(F.dir==NORTH||F.dir==SOUTH)
				if(F.pixel_x>4){F.InitialDisplacement="Positive"}
				else if(F.pixel_x<-4){F.InitialDisplacement="Negative"}
			//src<<"Initial Displacement = [F.InitialDisplacement]"
			walk(F,F.dir)
			F.JutsuLevel=src.KatonKnowledge
		random--
		sleep(1)

/*Kiritsuhi
Flame Ember
A technique in which the user spits a ball of pure fire chakra at the target which will cause severe burns.*/
mob/proc/Kiritsuhi()
	src.ChakraDrain(15000)
	src.Handseals(31-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Elemental/Katon/KKiritsuhi/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir
	walk(F,F.dir)
	F.JutsuLevel=src.KatonKnowledge

/*Dragon Fire Jutsu:
Shoots a beam of fire concentrated with power.
*/
mob/proc/KatonRyuuka()
	src.ChakraDrain(30000)
	src.Handseals(38-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.doingG=1;src.Frozen=1;src.firing=1;spawn(30)
		src.firing=0;src.doingG=0;src.Frozen=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi'
	var/obj/Jutsu/Elemental/Katon/KRyuuka/K=new(Pwner=src);K.loc = src.loc;K.JutsuLevel=src.KatonKnowledge;K.nin=src.nin*3;K.Move_Delay=0;K.dir = src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir,0,0)

/*Ryuusenka (Dragon War)
A revolutionary technique invented by a puppeteer, which creates a
massive amount of flames certain to inflict serious burns.
*/
mob/proc/KatonRyuusenka()
	src.ChakraDrain(30000)
	src.Handseals(40-src.HandsealSpeed)
	var/i=5;
	if(src.HandsSlipped) return
	src.doingG=1;src.Frozen=1;src.firing=1;spawn(30)
		src.firing=0;src.doingG=0;src.Frozen=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi'
	while(i>0)
		var/obj/Jutsu/Elemental/Katon/KRyuuka/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin*2.5;F.Owner=src
		if(i==5) F.dir=turn(F.dir,45);step(F,F.dir);F.dir=src.dir
		if(i==4) F.dir=turn(F.dir,-45);step(F,F.dir);F.dir=src.dir
		if(i==3) F.dir=turn(F.dir,45)
		if(i==2) F.dir=turn(F.dir,-45)
		walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;i--;sleep(1)

mob/proc/FireChakraEnhance()
	if(src.FireWeaponEnhance==0)
		src.FireWeaponEnhance=1
	else if(src.FireWeaponEnhance==1)
		src.FireWeaponEnhance=0
	while(src.FireWeaponEnhance==1)
		src.chakra-=4
		sleep(3)
/*Fire Dragon Jutsu:
Shoots a beam of fire.
*/
mob/proc/KKE()
	src.ChakraDrain(30000)
	src.Handseals(50-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
		src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
		src.dir=WEST
//	if(prob(50))
//		viewers(src)<<"<font size=1><font face=verdana><b><font color=white>[src]<font color=green> Says: <FONT COLOR=#8b0000>K</FONT><FONT COLOR=#980000>a</FONT><FONT COLOR=#a50000>t</FONT><FONT COLOR=#b20000>o</FONT><FONT COLOR=#bf0000>n</FONT><FONT COLOR=#cc0000>:</FONT><FONT COLOR=#d90000> </FONT><FONT COLOR=#e60000>K</FONT><FONT COLOR=#f30000>a</FONT><FONT COLOR=#ff0000>r</FONT><FONT COLOR=#fc0206>y</FONT><FONT COLOR=#f9040c>u</FONT><FONT COLOR=#f50612>u</FONT><FONT COLOR=#f20818> </FONT><FONT COLOR=#ee0b1f>E</FONT><FONT COLOR=#ea0d25>n</FONT><FONT COLOR=#e70f2b>d</FONT><FONT COLOR=#e31131>a</FONT><FONT COLOR=#e01337>n</FONT><FONT COLOR=#dc143c>!</FONT>"
	var/obj/Jutsu/Elemental/Katon/katonEndan/J=new(Pwner=src);var/obj/Jutsu/Elemental/Katon/katonEndan/K=new(Pwner=src);var/obj/Jutsu/Elemental/Katon/katonEndan/L=new(Pwner=src)
	src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays+='Icons/Jutsus/KatonTechniques.dmi'
	src.doingG=1;
	src.Frozen=1;
	src.firing=1;
	src.InvulnerableToFire=1
	spawn(70)
		src.InvulnerableToFire=0;
		src.firing=0;
		src.overlays-='Icons/Jutsus/KatonTechniques.dmi';
		src.doingG=0;
		src.Frozen=0
	K.loc=src.loc;K.nin=src.nin;K.Owner=src;J.nin=src.nin;J.Owner=src;L.nin=src.nin;L.Owner=src
	step(K,src.dir);sleep(1);step(K,src.dir)
	step(L,src.dir);sleep(1);step(L,src.dir)
	step(J,src.dir);sleep(1);step(J,src.dir)
	K.icon_state="EndanHead"
	var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/T=new()
	if(usr.dir==SOUTH)
		T.pixel_y = 16
		J.loc=locate(src.x+1, src.y, src.z)
		L.loc=locate(src.x-1, src.y, src.z)
	if(usr.dir==NORTH)
		T.pixel_y = -16
		T.layer = MOB_LAYER-1
		J.loc=locate(src.x+1, src.y, src.z)
		L.loc=locate(src.x-1, src.y, src.z)
	if(usr.dir==WEST)
		T.pixel_x = 8
		J.loc=locate(src.x, usr.y+1, usr.z)
		L.loc=locate(src.x, usr.y-1, usr.z)
	if(usr.dir==EAST)
		T.pixel_x = -8
		J.loc=locate(src.x, usr.y+1, usr.z)
		L.loc=locate(src.x, usr.y-1, usr.z)
	T.loc=usr.loc
	step(T,usr.dir);walk(K,src.dir);walk(J,src.dir);walk(L,src.dir)
//	if(src.doingG)
//		src.doingG=0
//		src.Frozen=0
//		src.firing=0
//		src.InvulnerableToFire=0

/*MassiveLavaOverFlowJutsu
Massive wave of fire.
*/
mob/proc/MassiveLavaOverFlowingJutsu(Uses)
	src.ChakraDrain(100000)
	src.Handseals(40-src.HandsealSpeed)
	var/Ni=src.nin*3
	if(src.HandsSlipped) return
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
		src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
		src.dir=WEST
	var/obj/Jutsu/Elemental/Katon/katonEndan/K=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/J=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/L=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/M=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/N=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/O=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/P=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/Q=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/R=new(Pwner=src)
	src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays+='Icons/Jutsus/KatonTechniques.dmi'
	src.doingG=1;src.Frozen=1;src.firing=1;src.InvulnerableToFire=1
	spawn(70)
		src.InvulnerableToFire=0;src.firing=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.doingG=0;src.Frozen=0
	K.loc=src.loc;K.nin=Ni;K.Owner=src;J.nin=Ni;J.Owner=src;L.nin=Ni;L.Owner=src
	M.nin=Ni;M.Owner=src;N.nin=Ni;N.Owner=src;O.nin=Ni;O.Owner=src
	P.nin=Ni;P.Owner=src;Q.nin=Ni;Q.Owner=src;R.nin=Ni;R.Owner=src
	step(K,src.dir);sleep(1);step(K,src.dir)
	step(L,src.dir);sleep(1);step(L,src.dir)
	step(J,src.dir);sleep(1);step(J,src.dir)
	step(M,src.dir);sleep(1);step(M,src.dir)
	step(N,src.dir);sleep(1);step(N,src.dir)
	step(O,src.dir);sleep(1);step(O,src.dir)
	step(P,src.dir);sleep(1);step(P,src.dir)
	step(Q,src.dir);sleep(1);step(Q,src.dir)
	step(R,src.dir);sleep(1);step(R,src.dir)
	K.icon_state="EndanHead"
	var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/T=new()
	if(usr.dir==SOUTH)
		T.pixel_y = 16
		J.loc=locate(src.x+1, src.y, src.z)
		L.loc=locate(src.x-1, src.y, src.z)
		M.loc=locate(src.x+2, src.y, src.z)
		N.loc=locate(src.x-2, src.y, src.z)
		O.loc=locate(src.x+3, src.y, src.z)
		P.loc=locate(src.x-3, src.y, src.z)
		Q.loc=locate(src.x+4, src.y, src.z)
		R.loc=locate(src.x-4, src.y, src.z)
	if(usr.dir==NORTH)
		T.pixel_y = -16
		T.layer = MOB_LAYER-1
		J.loc=locate(src.x+1, src.y, src.z)
		L.loc=locate(src.x-1, src.y, src.z)
		M.loc=locate(src.x+2, src.y, src.z)
		N.loc=locate(src.x-2, src.y, src.z)
		O.loc=locate(src.x+3, src.y, src.z)
		P.loc=locate(src.x-3, src.y, src.z)
		Q.loc=locate(src.x+4, src.y, src.z)
		R.loc=locate(src.x-4, src.y, src.z)
	if(usr.dir==WEST)
		T.pixel_x = 8
		J.loc=locate(src.x, usr.y+1, usr.z)
		L.loc=locate(src.x, usr.y-1, usr.z)
		M.loc=locate(src.x, usr.y+2, usr.z)
		N.loc=locate(src.x, usr.y-2, usr.z)
		O.loc=locate(src.x, usr.y+3, usr.z)
		P.loc=locate(src.x, usr.y-3, usr.z)
		Q.loc=locate(src.x, usr.y+4, usr.z)
		R.loc=locate(src.x, usr.y-4, usr.z)
	if(usr.dir==EAST)
		T.pixel_x = -8
		J.loc=locate(src.x, usr.y+1, usr.z)
		L.loc=locate(src.x, usr.y-1, usr.z)
		M.loc=locate(src.x, usr.y+2, usr.z)
		N.loc=locate(src.x, usr.y-2, usr.z)
		O.loc=locate(src.x, usr.y+3, usr.z)
		P.loc=locate(src.x, usr.y-3, usr.z)
		Q.loc=locate(src.x, usr.y+4, usr.z)
		R.loc=locate(src.x, usr.y-4, usr.z)
	T.loc=usr.loc
	step(T,usr.dir);walk(K,src.dir);walk(J,src.dir);walk(L,src.dir)
	walk(M,src.dir);walk(N,src.dir);walk(O,src.dir)
	walk(P,src.dir);walk(Q,src.dir);walk(R,src.dir)
mob/proc/ArtificialMassiveLavaOverFlowingJutsu(Uses)
	src.ChakraDrain(100000)
	src.Handseals(40-src.HandsealSpeed)
	var/Ni=src.nin*3
	if(src.HandsSlipped) return
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST)
		src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST)
		src.dir=WEST
	var/obj/Jutsu/Elemental/Katon/katonEndan/K=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/J=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/L=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/M=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/N=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/O=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/P=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/Q=new(Pwner=src)
	var/obj/Jutsu/Elemental/Katon/katonEndan/R=new(Pwner=src)
	src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.overlays+='Icons/Jutsus/KatonTechniques.dmi'
	src.doingG=1;src.Frozen=1;src.firing=1;src.InvulnerableToFire=1
	spawn(70)
		src.InvulnerableToFire=0;src.firing=0;src.overlays-='Icons/Jutsus/KatonTechniques.dmi';src.doingG=0;src.Frozen=0
	K.loc=src.loc;K.nin=Ni;K.Owner=src;J.nin=Ni;J.Owner=src;L.nin=Ni;L.Owner=src
	M.nin=Ni;M.Owner=src;N.nin=Ni;N.Owner=src;O.nin=Ni;O.Owner=src
	P.nin=Ni;P.Owner=src;Q.nin=Ni;Q.Owner=src;R.nin=Ni;R.Owner=src
	step(K,src.dir);sleep(1);step(K,src.dir)
	step(L,src.dir);sleep(1);step(L,src.dir)
	step(J,src.dir);sleep(1);step(J,src.dir)
	step(M,src.dir);sleep(1);step(M,src.dir)
	step(N,src.dir);sleep(1);step(N,src.dir)
	step(O,src.dir);sleep(1);step(O,src.dir)
	step(P,src.dir);sleep(1);step(P,src.dir)
	step(Q,src.dir);sleep(1);step(Q,src.dir)
	step(R,src.dir);sleep(1);step(R,src.dir)
	K.icon_state="EndanHead"
	var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/T=new()
	if(usr.dir==SOUTH)
		T.pixel_y = 16
		J.loc=locate(src.x+1, src.y, src.z)
		L.loc=locate(src.x-1, src.y, src.z)
		M.loc=locate(src.x+2, src.y, src.z)
		N.loc=locate(src.x-2, src.y, src.z)
		O.loc=locate(src.x+3, src.y, src.z)
		P.loc=locate(src.x-3, src.y, src.z)
		Q.loc=locate(src.x+4, src.y, src.z)
		R.loc=locate(src.x-4, src.y, src.z)
	if(usr.dir==NORTH)
		T.pixel_y = -16
		T.layer = MOB_LAYER-1
		J.loc=locate(src.x+1, src.y, src.z)
		L.loc=locate(src.x-1, src.y, src.z)
		M.loc=locate(src.x+2, src.y, src.z)
		N.loc=locate(src.x-2, src.y, src.z)
		O.loc=locate(src.x+3, src.y, src.z)
		P.loc=locate(src.x-3, src.y, src.z)
		Q.loc=locate(src.x+4, src.y, src.z)
		R.loc=locate(src.x-4, src.y, src.z)
	if(usr.dir==WEST)
		T.pixel_x = 8
		J.loc=locate(src.x, usr.y+1, usr.z)
		L.loc=locate(src.x, usr.y-1, usr.z)
		M.loc=locate(src.x, usr.y+2, usr.z)
		N.loc=locate(src.x, usr.y-2, usr.z)
		O.loc=locate(src.x, usr.y+3, usr.z)
		P.loc=locate(src.x, usr.y-3, usr.z)
		Q.loc=locate(src.x, usr.y+4, usr.z)
		R.loc=locate(src.x, usr.y-4, usr.z)
	if(usr.dir==EAST)
		T.pixel_x = -8
		J.loc=locate(src.x, usr.y+1, usr.z)
		L.loc=locate(src.x, usr.y-1, usr.z)
		M.loc=locate(src.x, usr.y+2, usr.z)
		N.loc=locate(src.x, usr.y-2, usr.z)
		O.loc=locate(src.x, usr.y+3, usr.z)
		P.loc=locate(src.x, usr.y-3, usr.z)
		Q.loc=locate(src.x, usr.y+4, usr.z)
		R.loc=locate(src.x, usr.y-4, usr.z)
	T.loc=usr.loc
	step(T,usr.dir);walk(K,src.dir);walk(J,src.dir);walk(L,src.dir)
	walk(M,src.dir);walk(N,src.dir);walk(O,src.dir)
	walk(P,src.dir);walk(Q,src.dir);walk(R,src.dir)
/*Rase Ka (Spinning Fire)
A jutsu which launches a small fireball at the enemy, which when it explodes, makes a ring of fire around them.
*/
mob/proc/KatonRaseKa(Uses)
	src.ChakraDrain(10000)
	src.Handseals(35-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Elemental/Katon/RaseKa/F=new();F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin;F.Owner=src;walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;sleep(1);

/*Fire Rocket Jutsu:
Larger Mythical Phoenix Fire variant.
*/

mob/proc/KatonHouka(Uses)

	src.ChakraDrain(25000)
	src.Handseals(35-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(Uses>1000)
		var/obj/Jutsu/Elemental/Katon/Houka/A=new();A.loc=src.loc;A.Owner=src;A.dir=src.dir;A.nin=src.nin*1.25;A.Owner=src;walk(A,A.dir);A.JutsuLevel=src.KatonKnowledge;sleep(5);src.icon_state=""
//	src.icon_state="handseal";
	var/obj/Jutsu/Elemental/Katon/Houka/F=new();F.Owner=src;F.loc=src.loc;F.dir=src.dir;F.nin=src.nin*1.25;F.Owner=src;walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;sleep(1);src.icon_state=""


/*Multi-Fire Rocket Jutsu:
Multiple fire balls.
*/
mob/proc/ChouHouka(Uses)
	src.ChakraDrain(35000)
	src.Handseals(53-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal";spawn(1)
		src.icon_state=""
	if(src.DragonTamer>1)
		Uses*=1.5
	if(src.DragonTamer>2)
		Uses*=2
	var/i=round((1+Uses)/25)
	if(i<2) i=2
	if(i>5) i=5
	while(i>0)
		var/obj/Jutsu/Elemental/Katon/Houka/F=new();F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin*0.90//src.nin*2 LOL
		if(i==5) F.dir=turn(F.dir,45);step(F,F.dir);F.dir=src.dir
		if(i==4) F.dir=turn(F.dir,-45);step(F,F.dir);F.dir=src.dir
		if(i==3) F.dir=turn(F.dir,45)
		if(i==2) F.dir = turn(F.dir,-45)
		walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;i--;
		if(prob(35))
			sleep(1)
	//	sleep(1)

/*Grand Dragon Fire:
Sasuke's signature move.
*/
mob/proc/Gouryuuka(Uses)
	src.ChakraDrain(40000)
	src.Handseals(55-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	spawn(6)
		src.icon_state=""
//	var/A=src.DragonTamer
//	if(A<1) A=1
//	if(A>4) A=4
	var/Check=Uses
//	var/Amount=(Check/300)+1
//	if(src.DragonTamer>1)
//		Uses*=1.5
//	if(src.DragonTamer>2)
//		Uses*=2
	var/Amount=round(Check/300)+1
	if(Amount<1)
		Amount=1
	else if(Amount>4)
		Amount=4
	while(Amount>0)
	//	src<<"While Loop Called: [A]."
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G3/G=new();
		G.Owner=src;
	//	G.nin=src.nin*10
		G.nin=src.nin*((((src.DragonTamer*(5/3))+6))+1)
		if(src.BlueFire)
			G.icon='Icons/Jutsus/BKatonTechniques.dmi'
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G1/G1=new();G1.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G2/G2=new();G2.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G4/G4=new();G4.icon=G.icon
		if(src.dir==SOUTH)
			G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		if(src.dir==NORTH)
			G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		if(src.dir==EAST||src.dir==NORTHEAST||src.dir==SOUTHEAST)
			G.pixel_x=-16;G.pixel_y=-16;G4.pixel_x=32
			//G1.pixel_x=-16
			G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		if(src.dir==WEST||src.dir==NORTHWEST||src.dir==SOUTHWEST)
			G.pixel_x=-16;G.pixel_y=-16;G4.pixel_x=32
			//G1.pixel_x=-16
			G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
		if(Amount==4||Amount==1) G.loc=usr.loc
		else if(Amount==3) G.loc=get_step(src,turn(src.dir,45))
		else if(Amount==2) G.loc=get_step(src,turn(src.dir,-45))
		G.dir=usr.dir;
		G.Move_Delay=(3-src.DragonTamer)
		if(G.Move_Delay<=0)
			G.Move_Delay=0
		walk(G,G.dir);
		Amount--;
		sleep(2)

mob/owner/verb/FireBarrageRapeJutsu()
	src.Handseals(50-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(src.target)
		src.dir=get_dir(src,src.target)
	//Wave 1
	for(var/i=5, i>0, i--)
		var/obj/Jutsu/Elemental/Katon/FireSpitEXP/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin
		walk(F,F.dir)
		sleep(rand(0,1))
	for(var/j=10, j>0, j--)
		var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin
		if(j==5&&F||j==9&&F)
			F.dir=turn(F.dir,45);step(F,F.dir)
			if(F)
				F.dir=src.dir
		if(j==4&&F||j==8&&F)
			F.dir=turn(F.dir,-45);step(F,F.dir)
			if(F)
				F.dir=src.dir
		if(j==3&&F||j==7&&F)
			F.dir=turn(F.dir,45)
		if(j==2&&F||j==6&&F)
			F.dir = turn(F.dir,-45)
		walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;j--;sleep(2)
	//Wave 2
	for(var/k=3, k>0, k--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
	//Wave 3
	for(var/k=3, k>0, k--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/Houka/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
	//Wave 4
	var/A=4
	while(A>0)
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G3/G=new();G.Owner=src;G.nin=src.nin*10
		if(src.BlueFire)
			G.icon='Icons/Jutsus/BKatonTechniques.dmi'
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G1/G1=new();G1.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G2/G2=new();G2.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G4/G4=new();G4.icon=G.icon
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
		if(A==4||A==1) G.loc=usr.loc
		else if(A==3) G.loc=get_step(src,turn(src.dir,45))
		else if(A==2) G.loc=get_step(src,turn(src.dir,-45))
		G.dir=usr.dir;walk(G,G.dir);A--;sleep(1)
	//Wave 5
	var/B=4
	while(B>0)
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G3/G=new();G.Owner=src;G.nin=src.nin*10
		if(src.BlueFire)
			G.icon='Icons/Jutsus/BKatonTechniques.dmi'
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G1/G1=new();G1.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G2/G2=new();G2.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G4/G4=new();G4.icon=G.icon
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
		G.loc=usr.loc
		if(src.target)
			walk_to(G,src.target)
		else
			walk(G,src.dir)
		B--;sleep(4)
	for(var/h=3, h>0, h--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
	for(var/t=3, t>0, t--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/KRyuuka/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)

//^ and V are basically the same thing
mob/proc/NibiFlameUnstoppableBlast()
	src.Handseals(60-src.HandsealSpeed)
	src.ChakraDrain(100000)
	if(src.HandsSlipped) return
	if(src.target)
		src.dir=get_dir(src,src.target)
	//Wave 1
	for(var/i=5, i>0, i--)
		var/obj/Jutsu/Elemental/Katon/FireSpitEXP/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin
		walk(F,F.dir)
		sleep(rand(0,1))
	for(var/j=10, j>0, j--)
		var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin
		if(j==5&&F||j==9&&F)
			F.dir=turn(F.dir,45);step(F,F.dir)
			if(F)
				F.dir=src.dir
		if(j==4&&F||j==8&&F)
			F.dir=turn(F.dir,-45);step(F,F.dir)
			if(F)
				F.dir=src.dir
		if(j==3&&F||j==7&&F)
			F.dir=turn(F.dir,45)
		if(j==2&&F||j==6&&F)
			F.dir = turn(F.dir,-45)
		walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;j--;sleep(2)
	//Wave 2
	for(var/k=3, k>0, k--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
	//Wave 3
	for(var/k=3, k>0, k--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/Houka/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
	//Wave 4
	var/A=4
	while(A>0)
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G3/G=new();G.Owner=src;G.nin=src.nin*10
		if(src.BlueFire)
			G.icon='Icons/Jutsus/BKatonTechniques.dmi'
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G1/G1=new();G1.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G2/G2=new();G2.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G4/G4=new();G4.icon=G.icon
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
		if(A==4||A==1) G.loc=usr.loc
		else if(A==3) G.loc=get_step(src,turn(src.dir,45))
		else if(A==2) G.loc=get_step(src,turn(src.dir,-45))
		G.dir=usr.dir;walk(G,G.dir);A--;sleep(1)
	//Wave 5
	var/B=4
	while(B>0)
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G3/G=new();G.Owner=src;G.nin=src.nin*10
		if(src.BlueFire)
			G.icon='Icons/Jutsus/BKatonTechniques.dmi'
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G1/G1=new();G1.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G2/G2=new();G2.icon=G.icon
		var/obj/Jutsu/Elemental/Katon/Gouryuuka/G4/G4=new();G4.icon=G.icon
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
		G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
		G.loc=usr.loc
		if(src.target)
			walk_to(G,src.target)
		else
			walk(G,src.dir)
		B--;sleep(4)
	for(var/h=3, h>0, h--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/katonG/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
	for(var/t=3, t>0, t--)
		for(var/turf/T in oview(1,src))
			spawn()
				var/obj/Jutsu/Elemental/Katon/KRyuuka/F=new(Pwner=src);F.loc=T;F.Owner=src;F.dir=src.dir;F.nin=src.nin
				F.dir=get_dir(src,F);walk(F,F.dir)
		sleep(5)
obj/Jutsu/Elemental/Katon/PainHead
	icon='Icons/Jutsus/KatonTechniques.dmi'
	icon_state = "FireSenbon"
	density=1
	Move_Delay=0
	var/nin=10
	New()
		..()
		spawn(30)
			del(src)
	Bump(A)
		if(ismob(A))
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
	Del()
		//var/mob/O=src.Owner
		for(var/turf/G in oview(10,src))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=G;AA.nin=src.nin*2;AA.Owner=src.Owner
		..()
mob/proc/PainMechining(Uses)
	src.ChakraDrain(25000)
	src.Handseals(100-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Elemental/Katon/PainHead/A=new();A.loc=src.loc;A.Owner=src;A.dir=src.dir;A.nin=src.nin*2;A.Owner=src;walk(A,A.dir);A.JutsuLevel=src.KatonKnowledge;;src.icon_state=""
