mob/var/tmp/
	Touei=0
	ChargingRaikyuu=0
	Chidorion=0
	Raikirion=0
	ChidoriCharge=0
	ChidoriD=0
	InEisou=0
	FlashFlicker=0
obj/Jutsu/Elemental/Raiton
	ChidoriNagashi
		icon_state = "Nagashi"
		layer = MOB_LAYER+1
		density=0
		JutsuLevel=1
	//	var/JutsuLevel=0
		var/nin=10
		var/Offensive=0
		New()
			..()
			spawn()
				while(src)
					var/mob/O=src.Owner
					sleep(4)
				//	src.SoundEngine('SFX/LightningSFX.wav',3,40)
				//	for(var/obj/Jutsu/Elemental/Doton/E in src.loc)
				//		spawn()
						//	if(E&&E.Element=="Doton")
			//				if(O.RaitonKnowledge>E.JutsuLevel)
				//			if(src&&E&&(src.JutsuLevel>E.JutsuLevel))
				//				del(E)
				//	for(var/mob/Kibaku/M in src.loc)
				//		M.Defused=1
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health",O)
						sleep(1)
					for(var/mob/M in src.loc)
					//	spawn()
						if(M.Mogu)
							if(!src.Offensive)
								return
						if(M!=O)
							if(M.RaiArmor)
								view(M)<<"[M]'s armor absorbed the shock!";del(src)
							if(!src.Offensive)
								step_away(M,O)
								step_away(M,O)
								var/damage=20//Might change the damage
							//	view(M)<<output("<font color=yellow size=2>[M] has been shocked!([damage])</font>","Attack")
							//	M.DamageProc(damage,"Health",O)
								M.DamageProc(damage,"Health",O,"Chidori Nagashi","yellow")
								if(prob(15))//was originally 30
									M.StunAdd(10)
							else
								M.StunAdd(10)
								var/Damage=src.nin/2
								if(Damage>225)
									Damage=225
						//		if(O.Trait=="Old Powerful")
						//			Damage*=1.25
						//		if(M.Clan=="Hoshigaki")
						//			M.thirst+=0.15
							//	view(M)<<output("<font color=yellow size=2>[M] has been shocked!([Damage])</font>","Attack")
							//	M.DamageProc(Damage,"Health",O)
								if(M.client)
									M.DamageProc(Damage,"Health",O,"Chidori Nagashi","yellow")
								if(M.Stun>30)
									M.Stun=30
			spawn(25)
				del(src)
	KirinRaiton
		icon_state = "Nagashi"
		layer = MOB_LAYER+3
		density=0
		JutsuLevel=1
		var/nin=10
		var/Offensive=0
		var/Kirin=0;
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				while(src)
					sleep(3)
					src.SoundEngine('SFX/LightningSFX.wav',10)
					for(var/obj/Jutsu/Elemental/E in src.loc)
						spawn()
							if(E)
								del(E)
					for(var/mob/Kibaku/M in src.loc)
						if(!M.Defused)
							M.Defused=1
					for(var/mob/M in src.loc)
						spawn()
							if(M!=O)
								if(M.RaiArmor)
									view(M)<<"A Armadura de [M] Absorveu o Choque!";del(src)
								M.StunAdd(10)
								var/Damage=src.nin*100
								if(M.Clan=="Hoshigaki")
									M.thirst+=0.15
							//	view(M)<<output("<font color=yellow size=2>[M] has been shocked by Kirin!([Damage])</font>","Attack")
							//	M.DamageProc(Damage,"Health",O)
								M.DamageProc(Damage,"Health",O,"Kirin Blast","yellow")
								if(M.Stun>30)
									M.Stun=30
			spawn(25)
				del(src)
	RaikiriWolf
		icon_state="Wolf"
		layer = MOB_LAYER+1
		Move_Delay=0
		pixel_step_size=8
		density=1
		JutsuLevel=1
		var/nin=0
		var/Hit=0
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					src.SoundEngine('SFX/LightningSFX.wav',5,45)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if(prob(20))
							del(Z)
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health")
						sleep(1)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							if(prob(20))
								Z.Electrocuted=1
								var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(50)
				del(src)
		Bump(A)
	//		..()

			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				if(Hit==1)
					return
				Hit=1
				var/mob/M=A
				var/mob/O=src.Owner
				var/LightningChakra=LightningDamage(O)
				var/damage=src.nin;damage=round((damage)*((LightningChakra*0.06)+0.8));var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"A Armadura de [M] Absorveu o Choque !";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(O.Trait=="Old Powerful")
					damage+=(O.NinSkill*3)
				if(M.Clan=="Hoshigaki")
					damage*=1.2
			//	view(M)<<output("<font color=yellow size=2>[M] has been shocked!([damage])</font>","Attack")
			//	M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Health",O,"Raikiri Wolf","yellow")
				if(prob(50))
					M.StunAdd(20)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
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
			for(var/turf/T in oview(1,src))
				var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=T;AA.Owner=src.Owner;AA.nin=src.nin
			..()
	ChidoriSenbon
		icon_state = "ChidoriSenbon"
		density = 1
		JutsuLevel=1
		layer=MOB_LAYER+1
		var/nin=10
		New()
			src.pixel_x+=rand(8,16)
			src.pixel_y+=rand(8,16)
			..()
			spawn()
				while(src)
					sleep(8)
			//		src.SoundEngine2('SFX/LightningSFX.wav',2,40)
		//			for(var/obj/Jutsu/Elemental/Fuuton/Z in oview(1,src))
		//				del(src)
					for(var/obj/Jutsu/Elemental/Doton/Z in oview(1,src))
						if(prob(20))
							del(Z)
					for(var/obj/Doors/D in oview(1,src))
						D.DamageProc(src.nin/10,"Health")
						sleep(1)
		//			for(var/obj/Jutsu/Elemental/Suiton/Z in oview(1,src))
		//				if(!Z.Electrocuted)
		//					Z.Electrocuted=1
		//					var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(50)
				del(src)
		Bump(A)
			..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				var/damage=src.nin-20//Was - 2
				if(damage<10) damage=10
				if(damage>100) damage=100
				var/LightningChakra=LightningDamage(O)
				damage=round((damage)*((LightningChakra*0.04)+0.8));var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)

				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"A Armadura de [M] Absorveu o Choque!";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(M.Clan=="Hoshigaki")
					damage*=1.2
				M.DamageProc(damage,"Health",O,"Chidori Senbon","yellow")
				spawn() M.Bloody()
				M.SoundEngine('SFX/Slice.wav',10)

				M.StunAdd(round((damage/100)*2))
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin/2)
					del(src)
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
	/*			if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
*/
	EisouTrail
		icon_state="GianTrail"
		density=1
		var/nin=100
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',9,60)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
		//			for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
		//				if(!Z.Electrocuted)
		//					Z.Electrocuted=1
		//					var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(100)
				del(src)
	EisouHead
		icon_state = "GianHead"
		density = 1
		JutsuLevel=1
		layer=MOB_LAYER+1
		var/nin=100
		var/MainHead=0
		proc
			Execute()
				var/mob/O=src.Owner
				O.ChakraDrain(30550)
				src.MainHead=0
				walk(src,0)
				for(var/turf/T in oview(1,src))
					spawn()
						var/obj/Jutsu/Elemental/Raiton/EisouHead/A=new();A.Owner=O;A.JutsuLevel=O.RaitonKnowledge;A.nin=O.ChidoriD/2;A.layer=MOB_LAYER+1
						A.loc=src;step_towards(A,T)
						if(A&&A.dir==SOUTH)
							A.pixel_y= 16
						if(A&&A.dir==NORTH)
							A.pixel_y= -16
						if(A&&A.dir==EAST)
							A.pixel_x= -16
						if(A&&A.dir==WEST)
							A.pixel_x= 16
						if(A&&A.dir==NORTHEAST)
							A.pixel_y= -16;A.pixel_x= -16
						if(A&&A.dir==NORTHWEST)
							A.pixel_y= -16;A.pixel_x= 16
						if(A&&A.dir==SOUTHEAST)
							A.pixel_y = 16;A.pixel_x= -16
						if(A&&A.dir==SOUTHWEST)
							A.pixel_y = 16;A.pixel_x= 16
				for(var/mob/M in src.loc)
					if(!M.Mogu)
						var/damage=500;M.DamageProc(damage,"Health",O)
						view(M)<<output("<font color=yellow size=2>[M] Foi executado!([damage])</font>","Attack")
						spawn() M.Bloody()
						spawn() M.Bloody()
						spawn() M.Bloody()
						spawn() M.Bloody()
						spawn() src.SoundEngine('SFX/Slice.wav',10,35)
						spawn() src.SoundEngine('SFX/Slice.wav',10,35)
						spawn() src.SoundEngine('SFX/Slice.wav',10,35)
					//	if(M.WaterCheck())
					//		view(M)<<output("<font color=yellow size=2>[M] has an electrical surge flow through them!([100])</font>","Attack")
					//		M.StunAdd(15)
					//		M.overlays+='RaitonYoroi.dmi'
					//		spawn(20)
					//			M.HitBack(6,O.dir)
					//			M.overlays-='RaitonYoroi.dmi'
					//			M.DamageProc(100,"Health",O)

		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10,40)
					for(var/obj/Doors/D in src.loc)
						D.DamageProc(src.nin/10,"Health")
						sleep(1)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(100)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/EisouTrail/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;L.JutsuLevel=src.JutsuLevel
			if(!src.MainHead)
				L.layer=MOB_LAYER+1
			..()
		Bump(A)
			..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner

				var/damage=src.nin

				if(damage>300)
					damage=300
				var/LightningChakra=LightningDamage(O)
				damage=round((damage)*((LightningChakra*0.02)+0.8));var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"[M]'s armor absorbed the shock!";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(O.Trait=="Old Powerful")
					damage+=(O.NinSkill*3)
		//		view(M)<<output("<font color=yellow size=2>[M] has been hit by ChidoriSpear!([damage])</font>","Attack")
		//		M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Health",O,"Chidori Spear","yellow")
				spawn() M.Bloody()
				spawn() M.Bloody()
				spawn() M.Bloody()
				spawn() M.Bloody()
				spawn() src.SoundEngine('SFX/Slice.wav',10,35)
				spawn() src.SoundEngine('SFX/Slice.wav',10,35)
				spawn() src.SoundEngine('SFX/Slice.wav',10,35)

				src.loc=M.loc
				walk(src,0)
				var/lastin=3
				while(lastin)
					M.StunAdd(10);lastin--;sleep(11)
				M.Stun=0;del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
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

mob/proc
	Chidoriz(Type)
		if(src.Raikirion)
			src<<"Você já está usando o Raikiri!";return
		if(src.Chidorion)
			src<<"Você já está usando o Chidori!";return
		if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing)
			return
		else
			src.Handseals(35-src.HandsealSpeed)
			if(src.HandsSlipped) return
			if(Type==0)
				src<<"Hold down Z to charge your Chidori!"
			else
				src<<"Hold down Z to charge your Raikiri!"
			src.ChidoriCharge=1
			if(Type==0)
				src.Chidorion=1
			else
				src.Raikirion=1
			var/A='Icons/Jutsus/Chidori.dmi';src.overlays-=A;src.overlays+=A
			while(src.Chidorion||src.Raikirion)
				if(src.Chidorion)
					src.SoundEngine('SFX/LightningSFX.wav',5,35)
				if(src.Raikirion)
					src.SoundEngine('SFX/LightningSFX.wav',10,47)
				if(!src.ChidoriCharge)
					src.ChidoriD-=10
					for(var/obj/Jutsu/Kiriame/S2 in src.loc)
						src.ChidoriD=0
					if(src.ChidoriD<=0)
						src.overlays-='Icons/Jutsus/Chidori.dmi'
						if(Type==1)
							src<<"Your Raikiri ran out of energy!"
						else
							src<<"Your Chidori ran out of energy!"
						src.Chidorion=0;src.Raikirion=0
						src.Normal()
				sleep(5)
	ChidoriNagashi()
	//	var/Check=0
		if(src.knockedout||src.Frozen||src.FrozenBind!=""||src.Stun>0)
			return
		for(var/obj/SkillCards/Chidori/A in src.LearnedJutsus)
			if(A.Delay)
				src.ChakraDrain(6500)
		src.ChakraDrain(15000);src.icon_state="Power";src.Stun=999;src.firing=1
		spawn(30)
			src.icon_state="";src.Stun=0;src.firing=0
		sleep(5)
		if(src.Guarding&&src.dir!=NORTHEAST&&src.dir!=SOUTHEAST&&src.dir!=SOUTHWEST&&src.dir!=NORTHWEST)
			src.icon_state="beastman";var/Number=round(src.NagashiExpert*5)
			if(Number>11) Number=11
			if(Number<=0) Number=3
			for(var/turf/T in getcircle(src,Number))
				var/N;var/M
				if(src.dir==EAST||src.dir==WEST)
					N=locate(src.x,src.y-(Number+1),src.z)
					M=locate(src.x,src.y+(Number+1),src.z)
					if(src.dir==EAST&&T.x>=src.x&&!(T in getcircle(N,Number))&&!(T in getcircle(M,Number)))
						var/obj/Jutsu/Elemental/Raiton/ChidoriNagashi/A=new();A.nin=10;A.Offensive=1;A.loc=T;A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.RaitonKnowledge
					if(src.dir==WEST&&T.x<=src.x&&!(T in getcircle(N,Number))&&!(T in getcircle(M,Number)))
						var/obj/Jutsu/Elemental/Raiton/ChidoriNagashi/A=new();A.Offensive=1;A.loc=T;A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.RaitonKnowledge
				else if(src.dir==NORTH||src.dir==SOUTH)
					N=locate(src.x-(Number+1),src.y,src.z)
					M=locate(src.x+(Number+1),src.y,src.z)
					if(src.dir==NORTH&&T.y>=src.y&&!(T in getcircle(N,Number))&&!(T in getcircle(M,Number)))
						var/obj/Jutsu/Elemental/Raiton/ChidoriNagashi/A=new();A.Offensive=1;A.loc=T;A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.RaitonKnowledge
					if(src.dir==SOUTH&&T.y<=src.y&&!(T in getcircle(N,Number))&&!(T in getcircle(M,Number)))
						var/obj/Jutsu/Elemental/Raiton/ChidoriNagashi/A=new();A.Offensive=1;A.loc=T;A.Owner=src;A.nin=src.nin;A.JutsuLevel=src.RaitonKnowledge
		else
			var/Number=src.NagashiExpert+1;var/Number2=1
			if(Number>3) Number=3;Number2+=(src.NagashiExpert-Number)
			src.ChakraDrain(5550*Number)
			for(var/turf/T in oview(Number+1,src))
				var/obj/Jutsu/Elemental/Raiton/ChidoriNagashi/A=new();A.loc=T;A.Owner=src;A.JutsuLevel=src.RaitonKnowledge;A.nin*=Number2
	ChidoriSenbon()
		var/Check=0
		if(src.firing)
			return
		else
			src.ChakraDrain(22000)
			src.Handseals(1)
			if(src.HandsSlipped) return
			for(var/obj/SkillCards/Chidori/A in src.LearnedJutsus)
				if(A.Delay)
					Check=1
			if(Check==1)
				src.ChakraDrain(8000)
			src.overlays+='Icons/Jutsus/Chidori.dmi'
			spawn(3)
				src.overlays-='Icons/Jutsus/Chidori.dmi'
			flick("Attack2",src);var/I=(src.ChidoriSenbonExpert*2)+rand(1,2)
			if(I>6)
				I=6
				if(src.ChidoriSenbonExpert>4) // One Time Fix for Overcapping
					src.ElementalPoints+=(src.ChidoriSenbonExpert-4);src.ChidoriSenbonExpert=4
			while(I>0)
				var/obj/Jutsu/Elemental/Raiton/ChidoriSenbon/A=new();A.loc=src.loc;A.Owner=src;A.JutsuLevel=src.RaitonKnowledge;A.nin=src.nin
				if(I==4||I==2&&(!src.HoldingR))
					var/d=turn(src.dir,90);step(A,d)
				if(I==3||I==5&&(!src.HoldingR))
					var/d=turn(src.dir,-90);step(A,d)
				walk(A,src.dir);I--;sleep(1)
	ChidoriEisou()
		var/Check=0
		if(src.firing)
			return
		else
			for(var/obj/SkillCards/Chidori/A in src.LearnedJutsus)
				if(A.Delay)
					Check=1
			if(Check==1)
				src.ChakraDrain(8000)
			src.ChakraDrain(24000);
			src.Handseals(30-src.HandsealSpeed)
			if(src.HandsSlipped) return
			flick("Attack2",src);src<<"Você ficará congelado enquanto estiver nisso. Pressione Z para finalizar o jutsu antes. Aperte X para fazer uma execução com o jutsu!"
			var/obj/Jutsu/Elemental/Raiton/EisouHead/A=new();A.Owner=src;A.dir=src.dir;A.JutsuLevel=src.RaitonKnowledge;A.nin=src.nin*1.5;A.MainHead=1
			if(src.dir==NORTH) A.loc=locate(src.x,src.y+1,src.z)
			if(src.dir==SOUTH) A.loc=locate(src.x,src.y-1,src.z)
			if(src.dir==EAST) A.loc=locate(src.x+1,src.y,src.z)
			if(src.dir==WEST) A.loc=locate(src.x-1,src.y,src.z)
			if(src.dir==NORTHEAST) A.loc=locate(src.x+1,src.y+1,src.z)
			if(src.dir==NORTHWEST) A.loc=locate(src.x-1,src.y+1,src.z)
			if(src.dir==SOUTHEAST) A.loc=locate(src.x+1,src.y-1,src.z)
			if(src.dir==SOUTHWEST) A.loc=locate(src.x-1,src.y-1,src.z)
			walk(A,src.dir);src.InEisou=1
			while(A)
				src.Frozen=1;src.icon_state="throw";sleep(1)
			src.Frozen=0;src.icon_state="running";src.InEisou=0;src.overlays-='Icons/Jutsus/Chidori.dmi'
	RaikiriWolf()
		src.ChakraDrain(31750)
		src.Handseals(43-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.overlays-='Icons/Jutsus/Chidori.dmi';flick("Attack2",src)
		var/obj/Jutsu/Elemental/Raiton/RaikiriWolf/A=new();A.loc=src.loc;A.Owner=src;A.dir=src.dir;A.nin=src.nin*1.3
		if(src.target)
			var/mob/M=src.target;var/turf/T=M.loc;walk_towards(A,T)
		else
			walk(A,src.dir)
mob/var/tmp/UsingKirin=0;
//Fake kirin when you click to make raiton appear.
mob/proc/KirinWeakProc()
	var/GettingReadyKirin=0
	var/ChargingForKirin=0
	var/KirinCheck=0
	src.ChakraDrain(20000)
	src.Handseals(45-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.overlays-='Icons/Jutsus/Chidori.dmi'
	view()<<"[src] Levanta a mão para o céu"
	GettingReadyKirin=1
	while(GettingReadyKirin==1)
		sleep(5)
		src.Frozen=1
		src.icon_state="throw"
		ChargingForKirin++
		if(src.knockedout)
			GettingReadyKirin=0
			src.Frozen=0
			return
		if(ChargingForKirin>10)
			KirinCheck=1
			GettingReadyKirin=0
			src.Frozen=0
	if(KirinCheck==1)
		src.ChakraDrain(200000)
		src.overlays+='Icons/Jutsus/Chidori.dmi';
		src<<"Clique em algum lugar para explodir uma bola de Choque na área.";
		view()<<"<font size=1><font face=verdana><b><font color=#EBEB00>[src]<font color=white> Says: Esse é o Kirin!</font>"
		src.UsingKirin=1;
mob/proc/KirinStrongProc()
	src.ChakraDrain(40000)
	src.Handseals(45-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.overlays-='Icons/Jutsus/Chidori.dmi';
	view()<<"<font size=1><font face=verdana><b><font color=red>[src]<font color=white> Says: Esse é o Kirin!"
	/*Spot for legit kirin*/