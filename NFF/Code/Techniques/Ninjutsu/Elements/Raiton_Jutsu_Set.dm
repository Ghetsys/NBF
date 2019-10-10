proc/Lightning(Loc,Len=14)//Was originally Len=4
	var/list/Bolt=list()
	var/obj/Jutsu/Elemental/Raiton/LightningTop/Top = new(Loc) // It'll create the clouds where u indicate it
	Bolt+=Top // we need to delete the cloud too, so lets get this in for the deletion later on
	var/turf/CurrentLoc=Top.loc // This creates the bolt of lightning
	for(var/Length = 1 to Len) // Makes it go from 1 to Len which is the length of the bolt
		CurrentLoc = get_step(CurrentLoc,SOUTH)
		if(CurrentLoc)
			var/obj/Jutsu/Elemental/Raiton/LightningBolt/NewBolt = new(CurrentLoc)
			Bolt+=NewBolt
		else break
		sleep(1) // Small delay for the bolt to take its time :)
	var/obj/TmpObj = Bolt[Bolt.len] // This is to indicate the last bolt of the chain!
	CurrentLoc=TmpObj.loc
	spawn(2) for(var/obj/CheckObj in Bolt) del(CheckObj) // Then delete the bolts.
mob/var/tmp/
	RaiArmor=0
	TatsumakiOn=0
	InGarou=0
	InJibashi=0
mob
	proc
		ShockTreatmentWearOff(var/Delay=1)
			spawn(Delay)
				if(src.Shocked)
					src.Shocked=0

obj/Jutsu/Elemental/Raiton
	icon='Icons/Jutsus/RaitonTechniques.dmi'
	Element="Raiton"
	LightningTop
		layer = MOB_LAYER+100
		icon_state="cloud"
	LightningBolt
		layer = MOB_LAYER+100
		icon_state="lightning_bolt"
	Electrocute
		icon = 'Icons/Jutsus/Electrocute.dmi'
		icon_state=""
		layer=MOB_LAYER+1
		density=0
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(3)
					var/mob/O = src.Owner
		//			spawn(1)
		//				for(var/obj/Jutsu/Elemental/Doton/ZZ in src.loc)
		//					if((ZZ.JutsuLevel/2)>=src.JutsuLevel)
		//						src.Owner=null;src.loc=null
		//					else
		//						src.Owner=null;src.loc=null
		//				for(var/obj/Jutsu/Elemental/Suiton/ZZ in src.loc)
		//					if(!ZZ.Electrocuted)
		//						ZZ.Electrocuted=1
		//						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x,src.y,src.z);AA.nin=src.nin/2;AA.Owner=src.Owner//;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
			//		for(var/mob/Kibaku/M in src.loc)
			//			M.Defused=1
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health",O)
						sleep(1)
					for(var/mob/M in src.loc)
					//	spawn()
						if(M.Mogu)
							return
						if(!M.client)
							return
						var/damage=round(rand(src.nin/8,src.nin/3))*((O.LightningChakra*0.01)+0.8)
				//		var/Chakraz=M.ChakraArmor*0.01
						if(M.InHydro)
							damage *=3
						M.StunAdd(O.Static);
						//M.health-=(damage-(Chakraz*damage));M.Death(O)
						spawn()
							M.DamageProc(damage,"Health",O,"electric shock","yellow")
						if(M.Stun>30)
							M.Stun=30
						if(O.Electromagnetivity>0&&prob(10*O.Electromagnetivity*(M.InHydro?3:1)))
							if(!M.ImmuneToDeath)
								M.Status="Screwed"
								M.StatusEffected=O.Electromagnetivity
						if(O.ShockTreatment>0&&prob(10*O.ShockTreatment*(M.InHydro?3:1))&&M.Shocked!=1)
							M.Shocked=1
							M.ShockTreatmentWearOff(rand(20,50))
			spawn(25)
			//	src.Owner=null;src.loc=null;
				del(src)//just added the del(src)

	Raikyuu
		icon_state = "Raikyuu1"
		density = 1
		layer=MOB_LAYER+1
		var
			nin=10
			ChargedDamage=0
		New()
			..()
			spawn(45)
				del(src)
		//	spawn()
			//	while(src)
			//		sleep(2)
				//	src.SoundEngine('SFX/LightningSFX.wav',10,3)
		Bump(A)
			..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				walk(src,0)
				var/mob/M=A
				var/mob/O=src.Owner
				if(M.Chidorion||M.Raikirion)
					var/ZZ=rand(1,3)
					if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
					if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
					if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
					flick("Attack1",M)
					view(M)<<output("[M] Cancela A tecninca de raiton com Chidori!","Attack")
					M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi';M.Normal()
					src.CreateSmoke("Light");del(src);return
				if(M.Kaiten)
					src.CreateSmoke("Light");del(src);return
				if(M.DotonArmor)
					M.DotonArmor=0
					M.overlays-='Earth Armor.dmi'
				var/LightningChakra=LightningDamage(O)
				var/damage=(O.nin*0.16)+(src.ChargedDamage);damage=damage*((LightningChakra*0.02)+0.8);var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)
				if(damage>250) damage=250
				if(M.InHydro) damage *= 3
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill*3)
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"[M]'s armor absorbed the shock!";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(M.Clan=="Hoshigaki")
					damage*=1.2
				M.DamageProc(damage,"Health",O,"Raikyuu","yellow")
				if(M)
					M.StunAdd(O.Static+round(src.ChargedDamage/20))
					if(M.Stun>30)
						M.Stun=30
					if(O.Electromagnetivity>0&&prob(20*O.Electromagnetivity*(M.InHydro?3:1)))
						if(!M.ImmuneToDeath)
							M.Status="Screwed"
							M.StatusEffected=O.Electromagnetivity
					if(O.ShockTreatment>0&&prob(10*O.ShockTreatment*(M.InHydro?3:1))&&M.Shocked!=1)
						M.Shocked=1
						M.ShockTreatmentWearOff(rand(20,50))
					del(src)
				del(src)
			//	sleep(10)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(ZZ,/obj/Jutsu/Elemental/Fuuton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if(ZAC.JutsuLevel*2>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner

		Del()
			var/mob/O=src.Owner
			for(var/turf/T in oview(1,src))
				var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.nin=O.nin/2;AA.loc=locate(T.x,T.y,T.z);AA.Owner=src.Owner
			if(src.icon_state=="RaikyuuKai")
				for(var/turf/T in getcircle(src,3))
					var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.Owner=O;AA.nin=O.nin;AA.loc=locate(T.x,T.y,T.z);
			..()
	RairyuuTatsumaki
		icon_state = "Tatsumaki"
		density = 1
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					for(var/obj/Jutsu/Kiriame/Z in src.loc)//Simplified for loop as of 11/16/2012
						del(Z)
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health")

						sleep(1)
					for(var/obj/Jutsu/Elemental/P in src.loc)
						if(istype(P,/obj/Jutsu/Elemental/Doton))
							if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(P)
						if(istype(P,/obj/Jutsu/Elemental/Suiton))
							var/obj/Jutsu/Elemental/Suiton/A=P
							if(!A.Electrocuted)
								A.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
				/*	for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						del(src)
					for(var/obj/Jutsu/Elemental/Doton/Z in oview(1,src))
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))
						if(!Z.Electrocuted)
							Z.Electrocuted=1
					*///	var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
		Move()
			..()
			var/prevloc=src.loc
			..()
			var/obj/Jutsu/Elemental/Raiton/TatsumakiTrail/A=new(prevloc);A.Owner=src.Owner;A.nin=src.nin;A.JutsuLevel=src.JutsuLevel
		Bump(A)
			..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					var/ZZ=rand(1,3)
					if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
					if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
					if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
					flick("Attack1",M)
					view(M)<<output("[M] Cancela A tecnica de Raiton com Chidori!","Attack")
					M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi';M.Normal()
					src.CreateSmoke("Light");del(src);return
				if(M.Kaiten)
					src.CreateSmoke("Light");del(src);return
				if(M.DotonArmor)
					M.DotonArmor=0
					M.overlays-='Earth Armor.dmi'
				var/mob/O=src.Owner
				var/damage=round(src.nin*2.9)
				var/LightningChakra=LightningDamage(O)
				damage=round((damage)*((LightningChakra*0.02)+0.8))
				var/Chakraz=M.ChakraArmor*0.01
				damage=damage-(Chakraz*damage)
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"A armadura de [M] Absorveu o Choque !";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill/2)
				if(M.Clan=="Hoshigaki")
					damage*=1.2
				if(O.Electromagnetivity>0&&prob(10*O.Electromagnetivity*(M.InHydro?3:1)))
					if(!M.ImmuneToDeath)
						M.Status="Screwed"
						M.StatusEffected=O.Electromagnetivity
				if(O.ShockTreatment>0&&prob(10*O.ShockTreatment*(M.InHydro?3:1))&&M.Shocked!=1)
					M.Shocked=1
					M.ShockTreatmentWearOff(rand(20,50))
				if(M.InHydro) damage *= 3
				M.DamageProc(damage,"Health",O,"Rairyuu No Tatsumaki","yellow")
				del(src)
				sleep(10)
				if(src)
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(ZZ,/obj/Jutsu/Elemental/Fuuton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if(ZAC.JutsuLevel*2>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner

		Del()
			var/mob/O=src.Owner
			O.TatsumakiOn=0;O.firing=0
			O.client.perspective=MOB_PERSPECTIVE;O.client.eye=O;O.controlled=null
			if(O.Shibari)
				for(var/obj/Nara/Shibari/K in world)
					if(K.Owner==O)
						O.controlled=K
						O.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
						O.client.eye=K
			for(var/obj/SkillCards/Tatsumaki/P in O.LearnedJutsus)
				if(P.TurnedOn)
					P.DelayIt(350,O,"Nin")
			..()
	TatsumakiTrail
		icon_state="Jibashi2"
		var/nin=10
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				while(src)
					sleep(2)
		//			src.SoundEngine('SFX/LightningSFX.wav',5,3)
					spawn(1)
						for(var/obj/Jutsu/Elemental/P in oview(1,src))//Simplified for loop 11/16/12
							if(istype(P,/obj/Jutsu/Elemental/Doton))
								if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
								else del(P)
							if(istype(P,/obj/Jutsu/Elemental/Suiton))
								var/obj/Jutsu/Elemental/Suiton/A=P
								if(!A.Electrocuted)
									A.Electrocuted=1
									var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
					for(var/mob/Kibaku/M in src.loc)
						M.Defused=1
					for(var/mob/M in src.loc)
						if(M!=O)
							if(M.RaiArmor||M.Mogu)
								return
			//				if(M.Mogu)
			//					return
							M.StunAdd(O.Static+pick(1,2))
							M.health-=pick(5,10)*(M.InHydro?3:1)
							if(M.Stun>5+O.Static)
								M.Stun=5+O.Static
					sleep(3)
			spawn(100)
				del(src)
	Jibashi
		icon = 'Icons/Jutsus/Electrocute.dmi'
		icon_state="Jibashi"
		layer=MOB_LAYER+2
		density = 0
		var/nin=10
		Owner
		New()
			..()
			spawn()
				while(src)
					var/mob/O=src.Owner
					for(var/mob/M in view(1,src))
						if(M!=O)
							var/damage=round(src.nin*rand(0.5,0.8))//*(M.InHydro?3:1)
							M.DamageProc(damage,"Health",O,"Jibashi","yellow")
						sleep(1);
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health",O)
						sleep(1)
					for(var/obj/Jutsu/Elemental/Z in oview(1,src))
						if(Z&&Z.Element=="Doton")
							if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(Z)
							sleep(1)
						else if(Z&&Z.Element=="Suiton")
							if(!Z:Electrocuted)
								Z:Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
								sleep(3)
						else if(Z&&Z.Element=="Fuuton")
							if(Z.JutsuLevel*2>=src.JutsuLevel)
								del(src)
							else
								del(Z)
					sleep(11)

			spawn(110)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/JibashiTrail/A=new();A.loc=src.loc;A.Owner=src.Owner;A.nin=src.nin/2
			..()
	JibashiTrail
		icon_state = "Jibashi"
		density = 0
		var/Lead=0
		var/nin=10
		var/Jibasi=0;
		animate_movement=SYNC_STEPS
		layer = FLY_LAYER+1
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				var/LightningChakra=LightningDamage(O)
				while(src)
					sleep(5)
					spawn(1)
						if(locate(/obj/Jutsu/Kiriame in src.loc))
							for(var/obj/Jutsu/Kiriame/P in src.loc)//Simplified for loop as of 11/16/2012
								del(P)
						for(var/obj/Doors/D in oview(1,src))
							D.DamageProc(src.nin/10,"Health",O)
							sleep(1)
						for(var/obj/Jutsu/Elemental/P in src.loc)
							if(istype(P,/obj/Jutsu/Elemental/Doton))
								if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
								else del(P)
							if(istype(P,/obj/Jutsu/Elemental/Suiton))
								var/obj/Jutsu/Elemental/Suiton/A=P
								if(!A.Electrocuted)
									A.Electrocuted=1
									var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
							if(istype(P,/obj/Jutsu/Elemental/Fuuton))
								if((P.JutsuLevel*2)>src.JutsuLevel) del(src)
								else del(P)
						for(var/mob/M in src.loc)
							if(M.Mogu)
								return
							if(M.RaiArmor)
								del(src)
							if(M.Chidorion||M.Raikirion)
								flick("Attack1",M)
								view(M)<<output("<font color=yellow size=2>[M] Cancela a Tecninca de Raiton com Chidori!</font>","Attack")
								M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi'
								src.Normal()
								src.CreateSmoke("Light");del(src);return
							if(M.Kaiten)
								src.CreateSmoke("Light");del(src);return
							if(M!=O)
								var/damage=round((src.nin*0.65)*((LightningChakra*0.02)+0.8)*(M.InHydro?3:1));var/Chakraz=M.ChakraArmor*0.01
								if(damage>150&&O.Trait!="Powerful")
									damage=150
							//	view(M)<<output("<font color=yellow size=2>[M] has been shocked!([damage])</font>","Attack")
						//		if(prob(50)&&!M.knockedout)
						//			M.Stun+=pick(1,3)//*(M.InHydro?3:1)
								if(M.Stun>3)
									M.Stun=1
								if(M.Clan=="Hoshigaki")
									damage*=1.2
								damage=(damage-(Chakraz*damage))
							//	M.DamageProc(damage,"Health",O)
								M.DamageProc(damage,"Health",O,"Jibashi Trail","yellow")
								M.Ghit=1;M.GHitDrain();M.Death(O)

			spawn(120)
				del(src)
	Hinoko
		icon_state = "Lightning Cutter"
		density=1
		var/Hit=0
		Move_Delay=0
		pixel_step_size=16
		var/nin=10
		New()
			..()
			spawn(30)
				del(src)
		Move()
			..()
			var/obj/Jutsu/Elemental/Raiton/Electrocute/A=new();A.loc=src.loc;A.Owner=src.Owner;A.nin=src.nin/2
		Bump(A)
			..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				if(Hit==1)
					return
				Hit=1
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					var/ZZ=rand(1,3)
					if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
					if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
					if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
					flick("Attack1",M)
					view(M)<<output("[M] Cancela a Tecninca de Raiton com Chidori!","Attack")
					M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi'
					src.CreateSmoke("Light");del(src);return
				if(M.Kaiten)
					src.CreateSmoke("Light");del(src);return
				if(M.DotonArmor)
					M.DotonArmor=0
					M.overlays-='Earth Armor.dmi'
				var/damage = round(src.nin*2)
				var/mob/O = src.Owner
				var/LightningChakra=LightningDamage(O)
				damage=round((damage)*((LightningChakra*0.02)+0.8)*(M.InHydro?3:1))
				var/Chakraz=M.ChakraArmor*0.01
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"A armadura de [M] Absorveu o Choque !";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(M.Clan=="Hoshigaki")
					damage*=1.2
				damage=(damage-(Chakraz*damage))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
			//	M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Health",O,"Hinoko","yellow")
				if(O.Electromagnetivity>0&&prob(30*O.Electromagnetivity*(M.InHydro?3:1)))
					if(!M.ImmuneToDeath)
						M.Status="Screwed"
						M.StatusEffected=O.Electromagnetivity
				if(O.ShockTreatment>0&&prob(10*O.ShockTreatment*(M.InHydro?3:1))&&M.Shocked!=1)
					M.Shocked=1
					M.ShockTreatmentWearOff(rand(20,50))
			//	view(M)<<output("<font color=yellow size=2>[M] was hit by Raiton Hinoko!([(damage)])</font>","Attack")

				M.Death(O)
				if(prob(90))
					M.StunAdd(O.Static*2)
				src.loc=M.loc
				Hit=0
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
	Ikazuchi
		icon_state = "ikazuchi"
		density=1
		layer=MOB_LAYER+100
		var/nin=10
		var/Hit=0
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					if(locate(/obj/Jutsu/Kiriame in src.loc))
						for(var/obj/Jutsu/Kiriame/S2 in src.loc)
							del(src)
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health")
						sleep(1)
					for(var/obj/Jutsu/Elemental/P in oview(1,src))
						if(istype(P,/obj/Jutsu/Elemental/Doton))
							if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(P)
						if(istype(P,/obj/Jutsu/Elemental/Suiton))
							var/obj/Jutsu/Elemental/Suiton/A=P
							if(!A.Electrocuted)
								A.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
						if(istype(P,/obj/Jutsu/Elemental/Fuuton))
							if((P.JutsuLevel*2)>src.JutsuLevel) del(src)
							else del(P)
					/*
					for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(1,src))
						if((Z.JutsuLevel*2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Doton/Z in oview(1,src))
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
*/
			spawn(25)
				del(src)
		Bump(A)
		//	..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				if(Hit==1)
					return
				Hit=1
				var/mob/M = A
				if(M.Chidorion||M.Raikirion)
					var/ZZ=rand(1,3)
					if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
					if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
					if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
					flick("Attack1",M)
					view(M)<<output("[M] Cancela a Tecninca de Raiton com Chidori!","Attack")
					M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi'
					M.Normal()
					src.CreateSmoke("Light");del(src);return
				if(M.Kaiten)
					src.CreateSmoke("Light");del(src);return
				if(M.DotonArmor)
					M.DotonArmor=0
					M.overlays-='Earth Armor.dmi'
				var/damage = round(src.nin*2.4)
				var/mob/O = src.Owner
				var/LightningChakra=LightningDamage(O)
				damage=round((damage)*((LightningChakra*0.02)+0.8)*(M.InHydro?3:1))
				var/Chakraz=M.ChakraArmor*0.01
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<" A armadura de [M] Absorveu o Choque!";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(M.Clan=="Hoshigaki")
					damage*=1.2
				damage=(damage-(Chakraz*damage))
				if(O.Trait=="Old Powerful") damage+=(O.NinSkill)
				if(O.Electromagnetivity>0&&prob(20*O.Electromagnetivity*(M.InHydro?3:1)))
					if(!M.ImmuneToDeath)
						M.Status="Screwed"
						M.StatusEffected=O.Electromagnetivity
				if(O.ShockTreatment>0&&prob(10*O.ShockTreatment*(M.InHydro?3:1))&&M.Shocked!=1)
					M.Shocked=1
					M.ShockTreatmentWearOff(rand(20,50))
			//	M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Health",O,"Ikazuchi","yellow")
		//		view(M)<<output("<font color=yellow size=2>[M] was hit by Ikazuchi No Kiba!([(damage)])</font>","Attack")
				M.Death(O)
			//	Hit=0
				if(prob(50))
					M.StunAdd(O.Static)
				del(src)
			//	sleep(10)
			//	if(src)
			//		del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
	Electro
		icon_state = "Jibashi"
		density = 0
		var/Lead=0
		var/nin=10
		var/Jibasi=0;
		animate_movement=SYNC_STEPS
		layer = FLY_LAYER+1
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				var/LightningChakra=LightningDamage(O)
				while(src)
					sleep(5)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					spawn(1)
						if(locate(/obj/Jutsu/Kiriame in src.loc))
						//	for(var/obj/Jutsu/Kiriame/S2 in src.loc))
							del(src)
						for(var/obj/Doors/D in oview(1,src))
							D.DamageProc(src.nin/10,"Health",O)
							sleep(1)
						for(var/obj/Jutsu/Elemental/P in oview(1,src))
							if(istype(P,/obj/Jutsu/Elemental/Doton))
								if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
								else del(P)
							if(istype(P,/obj/Jutsu/Elemental/Suiton))
								var/obj/Jutsu/Elemental/Suiton/A=P
								if(!A.Electrocuted)
									A.Electrocuted=1
									var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
							if(istype(P,/obj/Jutsu/Elemental/Fuuton))
								if((P.JutsuLevel*2)>src.JutsuLevel) del(src)
								else del(P)


						/*
						for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(1,src))
							if((Z.JutsuLevel*2)>src.JutsuLevel) del(src)
							else del(Z)
						for(var/obj/Jutsu/Elemental/Doton/Z in oview(1,src))
							if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(Z)
						for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))
							if(!Z.Electrocuted)
								Z.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
*/


					for(var/mob/Kibaku/M in src.loc)
						M.Defused=1
					for(var/mob/M in src.loc)
						if(M.Mogu)
							return
						if(M.RaiArmor)
							del(src)
						if(M.Chidorion||M.Raikirion)
							var/ZZ=rand(1,3)
							if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
							if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
							if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
							flick("Attack1",M)
							view(M)<<output("[M] Cancela a Tecninca de Raiton com Chidori!","Attack")
							M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi'
							src.Normal()
							src.CreateSmoke("Light");del(src);return
						if(M.Kaiten)
							src.CreateSmoke("Light");del(src);return
						var/damage=round((src.nin*0.7)*((LightningChakra*0.02)+0.8)*(M.InHydro?3:1));var/Chakraz=M.ChakraArmor*0.01
				//		view(M)<<output("<font color=yellow size=2>[M] has been shocked!([damage])</font>","Attack")

				//		M.StunAdd(O.Static*8+1)
				//		if(M.Stun>50)
				//			M.Stun=50
				//		if(M.Clan=="Hoshigaki")
				//			damage*=1.25
						damage=(damage-(Chakraz*damage))
					//	M.DamageProc(damage,"Health",O)
						M.DamageProc(damage,"Health",O,"Jibashi","yellow")
						M.Ghit=1;M.GHitDrain();M.Death(O)
			spawn(100)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/Electro/L=new();L.loc=src.loc;L.dir=src.dir;L.nin=src.nin;L.Owner = src.Owner;L.JutsuLevel=src.JutsuLevel
			..()
	Cloud
		icon_state = "NGianHead"
		density=1
		var/nin=10
		var/Hit=0
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					spawn(1)
						if(locate(/mob/Kibaku in src.loc))
							for(var/mob/Kibaku/KK in src.loc)
								KK.Defused=1
						if(locate(/obj/Jutsu/Kiriame in src.loc))
							for(var/obj/Jutsu/Kiriame/S2 in src.loc)
								del(src)
						for(var/obj/Jutsu/Elemental/P in oview(1,src))
							if(istype(P,/obj/Jutsu/Elemental/Doton))
								if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
								else del(P)
							if(istype(P,/obj/Jutsu/Elemental/Suiton))
								var/obj/Jutsu/Elemental/Suiton/A=P
								if(!A.Electrocuted)
									A.Electrocuted=1
									var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
							if(istype(P,/obj/Jutsu/Elemental/Fuuton))
								if((P.JutsuLevel*2)>src.JutsuLevel) del(src)
								else del(P)


								/*
						for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
							if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(Z)
						for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
							if(!Z.Electrocuted)
								Z.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

								*/
			spawn(55)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/Cloudt/L=new();L.loc=src.loc;L.dir=src.dir;L.nin=src.nin;L.Owner=src.Owner;L.JutsuLevel=src.JutsuLevel
			var/obj/Jutsu/Elemental/Raiton/Electrocute/A=new();A.loc=locate(src.x+1,src.y,src.z);A.nin=src.nin;A.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x-1,src.,src.z);AA.nin=src.nin;AA.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AAA=new();AAA.loc=locate(src.x,src.y+1,src.z);AAA.nin=src.nin;AAA.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AAAA=new();AAAA.loc=locate(src.x,src.y-1,src.z);AAAA.nin=src.nin;AAAA.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AAAAA=new();AAAAA.loc=locate(src.x+1,src.y+1,src.z);AAAAA.nin=src.nin;AAAAA.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AAAAAA=new();AAAAAA.loc=locate(src.x+1,src.y-1,src.z);AAAAAA.nin=src.nin;AAAAAA.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AAAAAAA=new();AAAAAAA.loc=locate(src.x-1,src.y+1,src.z);AAAAAAA.nin=src.nin;AAAAAAA.Owner=src.Owner
			var/obj/Jutsu/Elemental/Raiton/Electrocute/AAAAAAAA=new();AAAAAAAA.loc=locate(src.x-1,src.y-1,src.z);AAAAAAAA.nin=src.nin;AAAAAAAA.Owner=src.Owner

			..()
		Bump(A)
	//		..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(Hit)
					del(src)
				if(M.Chidorion||M.Raikirion)
					var/ZZ=rand(1,3)
					if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
					if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
					if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
					flick("Attack1",M)
					view(M)<<output("[M] Cancela a Tecninca de Raiton com Chidori!","Attack")
					M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi'
					M.Normal()
					src.CreateSmoke("Light");del(src);return
				if(M.Kaiten)
					src.CreateSmoke("Light");del(src);return
				if(M.DotonArmor)
					M.DotonArmor=0
					M.overlays-='Earth Armor.dmi'
				var/damage=round(rand(src.nin*8,src.nin*12))*((O.LightningChakra*0.02)+0.8)*(M.InHydro?3:1)
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<" A armadura de [M] Absorveu o Choque !";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				var/Chakraz=M.ChakraArmor*0.01;view(M)<<output("<font color=yellow size=2>[M] Foi eletrocutado!([damage])</font>","Attack")
				M.StunAdd(O.Static*5)
				if(M.Stun>30)
					M.Stun=30
				if(M.Clan=="Hoshigaki")
					damage*=1.2
				damage=(damage-(Chakraz*damage));M.DamageProc(damage,"Health",O)
				Hit=1
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
		Del()
			for(var/turf/T in oview(3,src))
				var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=T;AA.Owner=src.Owner
				AA.nin=src.nin*3
			for(var/turf/T in oview(2,src))
				var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=T;AA.Owner=src.Owner
				AA.nin=src.nin*2
			for(var/turf/T in oview(1,src))
				var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=T;AA.Owner=src.Owner
				AA.nin=src.nin*1.5
			..()
	Cloudt
		icon_state="NGianTrail"
		density=0
		var/nin=10
		Bump(atom/A)
			..()
			if(ismob(A))
				src.loc=A.loc
			if(isobj(A))
				if(istype(A,/obj/Summons/))
					del(src)
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				var/LightningChakra=LightningDamage(O)
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					spawn(1)
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						del(src)
					for(var/obj/Jutsu/Elemental/Fuuton/Z in src.loc)
						if((Z.JutsuLevel*2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
					for(var/mob/Kibaku/M in src.loc)
						M.Defused=1
					for(var/mob/M in src.loc)
						if(M==O)
							return
						if(M.Mogu)
							return
						if(M.Chidorion||M.Raikirion)
							var/ZZ=rand(1,3)
							if(ZZ==1) view(M)<<sound('SFX/AttackSwish1.wav',0)
							if(ZZ==2) view(M)<<sound('SFX/AttackSwish2.wav',0)
							if(ZZ==3) view(M)<<sound('SFX/AttackSwish3.wav',0)
							flick("Attack1",M)
							view(M)<<output("[M] Cancela a tecninca de Raiton com Chidori!","Attack")
							M.ChidoriD=0;M.Chidorion=0;M.overlays-='Icons/Jutsus/Chidori.dmi'
							M.Normal()
							src.CreateSmoke("Light");del(src);return
						if(M.Kaiten)
							src.CreateSmoke("Light");del(src);return
						if(M.Ghit<=0)
							var/damage=rand(80,100)
							damage=damage/100

							damage=round(src.nin*damage)*((LightningChakra*0.02)+0.8)
							if(M.RaiArmor)
								if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
									view(M)<<"A armadura de [M] Absorveu o Choque!";del(src)
								else
									var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
									if((damage-resistance)<0) resistance=(damage-1)
									damage-=resistance
							if(damage>300)
								damage=300
							var/Chakraz=M.ChakraArmor*0.01
						//	view(M)<<output("<font color=yellow size=2>[M] has been shocked!([damage])</font>","Attack")
							if(M.Clan=="Hoshigaki")
								damage*=1.2
							damage=(damage-(Chakraz*damage)*(M.InHydro?3:1))
						//	M.DamageProc(damage,"Health",O)
							M.DamageProc(damage,"Health",O,"Gian Trail","yellow")
							M.Ghit=10;M.GHitDrain();M.Death(src.Owner)
						M.StunAdd(O.Static)
			spawn(55)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/Cloudt/L=new();L.loc = src.loc;L.dir = src.dir;L.nin=src.nin;L.Owner = src.Owner;L.JutsuLevel=src.JutsuLevel
			..()

	OldGianTrail
		icon_state="GianTrail"
		density=0
		var/nin=100
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health")
						sleep(1)
					for(var/obj/Jutsu/Elemental/P in oview(1,src))
						if(istype(P,/obj/Jutsu/Elemental/Doton))
							if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(P)
						if(istype(P,/obj/Jutsu/Elemental/Suiton))
							var/obj/Jutsu/Elemental/Suiton/A=P
							if(!A.Electrocuted)
								A.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

							/*
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
							*/


					for(var/mob/M in src.loc)
						var/mob/O=src.Owner;
						var/damage=rand(O.nin*0.5,O.nin*0.65)
						if(damage>125)
							damage=125
						damage *= (M.InHydro?3:1)
						if(M.Stun>30)
							M.Stun=30
						view(M)<<output("<font color=yellow size=2>[M] foi atingida por Gian!([damage])</font>","Attack")
						M.DamageProc(damage,"Health",O)
						M.StunAdd(O.Static+pick(1,2))

			spawn(100)
				del(src)
	OldGian
		icon_state = "GianHead"
		density = 0
		layer=MOB_LAYER-1
		var/nin=100
		var/MainHead=0
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					src.SoundEngine('SFX/LightningSFX.wav',10,3)
					for(var/obj/Jutsu/Elemental/P in oview(1,src))
						if(istype(P,/obj/Jutsu/Elemental/Doton))
							if((P.JutsuLevel/2)>src.JutsuLevel) del(src)
							else del(P)
						if(istype(P,/obj/Jutsu/Elemental/Suiton))
							var/obj/Jutsu/Elemental/Suiton/A=P
							if(!A.Electrocuted)
								A.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

					/*
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
							*/


					for(var/mob/M in src.loc)
						var/mob/O=src.Owner;
						var/damage=O.nin*((O.LightningChakra*0.6)+0.8);
						if(damage>350)
							damage=350
						if(M.Stun>30)
							M.Stun=30
						damage *= (M.InHydro?3:1)
					//	view(M)<<output("<font color=yellow size=2>[M] has been hit by Gian!([damage])</font>","Attack")
						M.StunAdd(O.Static+pick(3,6))
						M.DamageProc(damage,"Health",O,"lightning current","yellow")
					//	M.DamageProc(damage,"Health",O);
						sleep(8)
			spawn(100)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/OldGianTrail/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;L.nin=src.nin;L.JutsuLevel=src.JutsuLevel
			if(!src.MainHead)
				L.layer=MOB_LAYER-1
			..()

mob/proc
	RaigekiYoroiz(Uses)
		src.ChakraDrain(5500)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.sphere) return
		if(src.DotonArmor)
			src.Endurance=src.MEndurance
			src.overlays-='Earth Armor.dmi'
			src.DotonArmor=0
		view()<<"[src] envolve uma armadura de Eletricidade em torno de seu corpo!";src.overlays-='Icons/Jutsus/RaiArmor.dmi';src.overlays+='Icons/Jutsus/RaiArmor.dmi';src.RaiArmor=1
		while(src.RaiArmor&&!src.sphere)
			if(src.Clan=="Yotsuki")
				src.chakra-=pick(15,20)
			else
				src.chakra-=40
			if(src.FrozenBind=="Sand")
				for(var/obj/Jutsu/Sand/kyuu/A in src.loc)
					del(A)
				for(var/obj/Jutsu/Elemental/Doton/DorouDomu/A in src.loc)
					del(A)
			sleep(11)
	Raiton_Armor(Uses)
		src.ChakraDrain(5500)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.sphere) return
		if(src.DotonArmor)
			src.Endurance=src.MEndurance
			src.overlays-='Earth Armor.dmi'
			src.DotonArmor=0
		src.overlays-='Icons/Jutsus/RaiArmor2.dmi'
		src.overlays+='RaitonYoroi.dmi';src.overlays+='Icons/Jutsus/RaiArmor2.dmi';src.RaiArmor=2
		view()<<"[src] envolve uma armadura de Eletricidade em torno de seu corpo!";src.Touei=1
		src.tai=src.Mtai*2
		while(src.RaiArmor&&!src.sphere)
			src.chakra-=75
			if(src.FrozenBind=="Sand")
				for(var/obj/Jutsu/Sand/kyuu/A in src.loc)
					del(A)
			sleep(11)
	Touei()
		view()<<"[src]O corpo brilha com uma corrente elétrica!";src.Touei=1
		var/obj/O=new();O.icon='Icons/Jutsus/RaitonTechniques.dmi';O.icon_state="Sparks";src.overlays+=O
		var/Time=round(20+(src.LightningChakra+(src.RaitonKnowledge/20)))
		if(Time>150) Time=150
		if(Time>80&&src.ElementalCapacity>1) Time=80
		spawn(Time)
			src.Touei=0;src.overlays-=O
	FlashFlicker()
		view()<<"[src] vanishes in a flash of light.";src.FlashFlicker=1
		var/Time=round(20+(src.NinjutsuMastery+(src.NinjutsuKnowledge/20)))
		if(Time>150) Time=150
		spawn(Time)
			src.FlashFlicker=0
	Raikyuuz()
		if(src.firing||src.Kaiten||src.FrozenBind=="Shibari")
			return
		else
			src.Handseals(30-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src<<"Você está carregandi i Raikyuu, se você comprou a passive, segure R enquanto estiver usando isso para aumentar o tamanho!";src.icon_state="Power"
			var/obj/Jutsu/Elemental/Raiton/Raikyuu/A=new();A.loc=src.loc;A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.RaitonKnowledge;A.ChargedDamage=15
			if(src.RaikyuuExpert==1||src.RaikyuuExpert==2&&!src.HoldingR)
				A.ChargedDamage=30
				spawn() src.ChakraDrain(5500)
			else if(src.RaikyuuExpert==2&&src.HoldingR||src.RaikyuuExpert>=3&&!src.HoldingR)
				A.ChargedDamage=75;A.icon_state="Raikyuu"
				spawn() src.ChakraDrain(13500)
			else if(src.RaikyuuExpert>=3&&src.HoldingR)
				A.ChargedDamage=150;A.icon_state="RaikyuuKai"
				spawn() src.ChakraDrain(25500)
			spawn(3)
				walk(A,src.dir)
				src.icon_state=""
	Tatsumaki()
		if(src.TatsumakiOn)
			for(var/obj/Jutsu/Elemental/Raiton/RairyuuTatsumaki/K in world)
				if(K.Owner==src)
					del(K)
			for(var/obj/SkillCards/Tatsumaki/P in src.LearnedJutsus)
		//		P.Deactivate()
				P.DelayIt(350,src,"Nin")
			return
		else
			if(src.Clan=="Yotsuki")
				src.ChakraDrain(15000)
			else
				src.ChakraDrain(22000)
			src.Handseals(39-src.HandsealSpeed)
			if(src.HandsSlipped) return
			var/obj/Jutsu/Elemental/Raiton/RairyuuTatsumaki/K=new();
			src.TatsumakiOn=1;
			src.controlled=K;
			src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;
			src.client.eye=K;K.JutsuLevel=src.RaitonKnowledge;K.Owner=src;K.loc=src.loc;K.nin=src.nin
//Old Garou
/*	RairyuuGarou()
		if(src.InGarou)
			return
		else
			if(src.Clan=="Yotsuki")
				src.ChakraDrain(2500)
			else
				src.ChakraDrain(5000)
			src.Handseals(25-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.Frozen=1;src.firing=1
			src<<"You begin to spin!";src.InGarou=1
			src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;sleep(1);src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;sleep(1)
			src.Frozen=0

			src.overlays-='Icons/Jutsus/Garou.dmi';src.overlays+='Icons/Jutsus/Garou.dmi'
			spawn(100)
				src.InGarou=0;src.firing=0;src.overlays-='Icons/Jutsus/Garou.dmi'
			while(src.InGarou)
				for(var/mob/Kibaku/M in oview(1))
					M.Defused=1
				for(var/mob/M in oview(1))
					if(prob(75))
						M.StunAdd(rand(1,10))
						view(M)<<output("<font color=yellow size=2>[M] was stunned by the tornado!</font>","Attack")
				sleep(11)*/
//New Garou
	RairyuuGarou()
		if(src.runningspeed<=10)
			src<<"Você não estava correndo rapido o suficiente para usar isso!"
			return
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(15000)
		else
			src.ChakraDrain(18000)
		src.Handseals(37-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.HandsSlipped) return
		src.firing=1;src.InGarou=1
		src<<"Você se forma em um tornado de raio andando para a frente"
		src.Constant()
		src.overlays-='Icons/Jutsus/Garou.dmi';src.overlays+='Icons/Jutsus/Garou.dmi'
		spawn(40)
			src.InGarou=0;src.firing=0;src.overlays-='Icons/Jutsus/Garou.dmi'
		src.Running=1
		while(src.InGarou)
			src.Running=1
			var/obj/Jutsu/Elemental/Raiton/ChidoriNagashi/A=new();A.nin=10;A.Offensive=1;A.loc=src.loc;A.Owner=src;A.nin=src.nin/10;A.JutsuLevel=src.RaitonKnowledge
			sleep(1)
		src.Normal()

	IkazuchiKiba(Uses)
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(15000)
		else
			src.ChakraDrain(20500)
		src.Handseals(30-src.HandsealSpeed)
		if(src.HandsSlipped) return;
		src.firing=1;src.Frozen=1//;var/X=src.loc;X.y+=4;Lightning(locate(X),4)
		src.firing=0;src.Frozen=0;src.CreateCrator()
		if(src.HoldingR)
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/E=new();E.loc=src.loc;E.nin=src.nin;E.name="[src]";E.Owner=src;E.Move_Delay=0;walk(E,NORTHEAST,0);E.JutsuLevel=src.RaitonKnowledge
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/F=new();F.loc=src.loc;F.nin=src.nin;F.name="[src]";F.Owner=src;F.Move_Delay=0;walk(F,NORTHWEST,0);F.JutsuLevel=src.RaitonKnowledge
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/G=new();G.loc=src.loc;G.nin=src.nin;G.name="[src]";G.Owner=src;G.Move_Delay=0;walk(G,SOUTHEAST,0);G.JutsuLevel=src.RaitonKnowledge
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/H=new();H.loc=src.loc;H.nin=src.nin;H.name="[src]";H.Owner=src;H.Move_Delay=0;walk(H,SOUTHWEST,0);H.JutsuLevel=src.RaitonKnowledge
		else
			src<<"Mantenha pressionada R enquanto estiver usando Ikazuchi para usar o ataque Alternativa!"
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/A=new();A.loc=src.loc;A.nin=src.nin;A.name="[src]";A.Owner=src;A.Move_Delay=0;walk(A,EAST,0);A.JutsuLevel=src.RaitonKnowledge
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/B=new();B.loc=src.loc;B.nin=src.nin;B.name="[src]";B.Owner=src;B.Move_Delay=0;walk(B,WEST,0);B.JutsuLevel=src.RaitonKnowledge
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/C=new();C.loc=src.loc;C.nin=src.nin;C.name="[src]";C.Owner=src;C.Move_Delay=0;walk(C,NORTH,0);C.JutsuLevel=src.RaitonKnowledge
			var/obj/Jutsu/Elemental/Raiton/Ikazuchi/D=new();D.loc=src.loc;D.nin=src.nin;D.name="[src]";D.Owner=src;D.Move_Delay=0;walk(D,SOUTH,0);D.JutsuLevel=src.RaitonKnowledge
	//	if(Uses>1500&&src.RaitonKnowledge>=1500)
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/A=new();A.loc=src.loc;A.nin=src.nin;A.name="[src]";A.Owner=src;A.Move_Delay=0;walk(A,EAST,0);A.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/B=new();B.loc=src.loc;B.nin=src.nin;B.name="[src]";B.Owner=src;B.Move_Delay=0;walk(B,WEST,0);B.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/C=new();C.loc=src.loc;C.nin=src.nin;C.name="[src]";C.Owner=src;C.Move_Delay=0;walk(C,NORTH,0);C.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/D=new();D.loc=src.loc;D.nin=src.nin;D.name="[src]";D.Owner=src;D.Move_Delay=0;walk(D,SOUTH,0);D.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/E=new();E.loc=src.loc;E.nin=src.nin;E.name="[src]";E.Owner=src;E.Move_Delay=0;walk(E,NORTHEAST,0);E.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/F=new();F.loc=src.loc;F.nin=src.nin;F.name="[src]";F.Owner=src;F.Move_Delay=0;walk(F,NORTHWEST,0);F.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/G=new();G.loc=src.loc;G.nin=src.nin;G.name="[src]";G.Owner=src;G.Move_Delay=0;walk(G,SOUTHEAST,0);G.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/H=new();H.loc=src.loc;H.nin=src.nin;H.name="[src]";H.Owner=src;H.Move_Delay=0;walk(H,SOUTHWEST,0);H.JutsuLevel=src.RaitonKnowledge
	//	else
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/I=new();I.loc=src.loc;I.nin=src.nin;I.name="[src]";I.Owner=src;I.Move_Delay=0;walk(I,EAST,0);I.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/J=new();J.loc=src.loc;J.nin=src.nin;J.name="[src]";J.Owner=src;J.Move_Delay=0;walk(J,WEST,0);J.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/K=new();K.loc=src.loc;K.nin=src.nin;K.name="[src]";K.Owner=src;K.Move_Delay=0;walk(K,NORTH,0);K.JutsuLevel=src.RaitonKnowledge
	//		var/obj/Jutsu/Elemental/Raiton/Ikazuchi/L=new();L.loc=src.loc;L.nin=src.nin;L.name="[src]";L.Owner=src;L.Move_Delay=0;walk(L,SOUTH,0);L.JutsuLevel=src.RaitonKnowledge
	Hinoko()
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(7500)
		else
			src.ChakraDrain(10700)
		src.Handseals(33-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/obj/Jutsu/Elemental/Raiton/Hinoko/K=new();K.name="[src]";K.loc=src.loc;K.dir=src.dir;K.Owner=src;walk(K,src.dir);K.JutsuLevel=src.RaitonKnowledge;K.nin=src.nin
//Old Jibashi
/*	Jibashi()
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(10000)
		else
			src.ChakraDrain(25000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.InJibashi=1;src.firing=1
		spawn(100)
			src.InJibashi=0;src.firing=0
		sleep(1);var/a = 3
		while(a>0)
			var/obj/Jutsu/Elemental/Raiton/Electro/K=new();K.loc=src.loc;K.JutsuLevel=src.RaitonKnowledge;K.dir=src.dir
			if(a==2)
				var/d=turn(src.dir,45);K.loc=get_step(K,d)
			if(a==3)
				var/d=turn(src.dir,-45);K.loc=get_step(K,d)
			K.nin=src.nin;K.Lead=1;K.Move_Delay=0.5;K.dir = src.dir;K.name="[src]";K.Owner=usr;a --
		var/s = 10
		while(s>0)
			for(var/obj/Jutsu/Elemental/Raiton/Electro/Q in oview(10,src))
				if(Q.Owner==usr&&Q.Lead)
					step(Q,Q.dir)
			sleep(2)
			s --*/
//New Jibashi
	Jibashi()
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(20000)
		else
			src.ChakraDrain(23500)
		src.Handseals(34-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.InJibashi=1;src.firing=1
		spawn(100)
			src.InJibashi=0;src.firing=0;
		var/obj/Jutsu/Elemental/Raiton/Jibashi/K=new();K.loc=src.loc;K.Owner=src;K.nin=src.nin;K.name="[src]";K.JutsuLevel=src.RaitonKnowledge;
		spawn(110)
			for(var/obj/Jutsu/Elemental/Raiton/Jibashi/G in view(10,src))
				if(G.Owner==src)
					del(G);
	DevineThunderRing(Uses)
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(25000)
		else
			src.ChakraDrain(50000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="handseal"
		var/CurrentLoc = src.loc
		var/radius = 7
		for(var/turf/T in getring(src, radius))
			spawn()
				var/obj/Jutsu/Elemental/Raiton/Electro/K=new();K.loc=T;K.Owner=src;K.nin=src.nin;K.name="[src]";K.JutsuLevel=src.RaitonKnowledge
				while(CurrentLoc==src.loc && src.icon_state=="handseal" && get_dist(K,CurrentLoc) > 3)
					step_to(K,CurrentLoc)	//Rapidly move towards the center
					sleep(5)
				walk(K,get_dir(CurrentLoc,K)) //And sprawl out!
				src.icon_state=""
	Gian()
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(25000)
		else
			src.ChakraDrain(56500)
		src.Handseals(43-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.overlays-='Icons/Jutsus/RaitonTechniques.dmi';src.overlays+='Icons/Jutsus/RaitonTechniques.dmi'
		src.FrozenBind="Jutsu"
		spawn(20)
			src.FrozenBind="";src.overlays-='Icons/Jutsus/RaitonTechniques.dmi'
		var/obj/Jutsu/Elemental/Raiton/Cloud/L=new();L.Owner=src;L.loc=src.loc;L.nin=src.nin;L.dir=src.dir;step(L,L.dir);L.Move_Delay=0;walk(L,src.dir,0);L.JutsuLevel=src.RaitonKnowledge

	OldGian()
		if(src.Clan=="Yotsuki")
			src.ChakraDrain(15000)
		else
			src.ChakraDrain(29000)
		src.Handseals(35-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.FrozenBind="Jutsu"
		spawn(20)
			src.FrozenBind="";
		flick("Attack2",src);
		var/obj/Jutsu/Elemental/Raiton/OldGian/L=new();L.Owner=src;L.loc=get_step(src.loc,src.dir);L.nin=src.nin;L.dir=src.dir;step(L,L.dir);L.Move_Delay=0;walk(L,src.dir,0);L.JutsuLevel=src.RaitonKnowledge



