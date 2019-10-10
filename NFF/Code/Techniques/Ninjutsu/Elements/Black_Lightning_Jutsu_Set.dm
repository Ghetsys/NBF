///////////////////////////////////////////////////////
////Black Lightning//Advance form of raiton that is based on pure damage fasted pace high cost raiton with no effects like stuns or skewed.
////////////////////////////
obj/Elemental/Raiton/Blacklightning
	icon = 'BlackRaitonTechniques.dmi'
	icon_state="RaitonTile"//Should be a recolored black nagashi
	layer=MOB_LAYER+1
	density=0
	var/nin=10
	New()
		..()
		spawn(1)
			var/mob/O = src.Owner
			while(src&&src.Owner)
				sleep(1)
				src.SoundEngine('SFX/LightningSFX.wav',10)
				sleep(1)
				spawn(1)
					for(var/obj/Jutsu/Elemental/Doton/ZZ in src.loc)
						if((ZZ.JutsuLevel/2)>=src.JutsuLevel)
							src.Owner=null;src.loc=null
						else
							src.Owner=null;src.loc=null
					for(var/obj/Jutsu/Elemental/Suiton/ZZ in src.loc)
						if(!ZZ.Electrocuted)
							ZZ.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x,src.y,src.z);AA.nin=src.nin/2;AA.Owner=src.Owner//;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner
				for(var/mob/Kibaku/M in src.loc)
					M.Defused=1
				for(var/mob/M in src.loc)
					if(M.Mogu)
						return
					var/damage=round(rand(src.nin/8,src.nin/6))*((O.LightningChakra*0.02)+0.8)
					var/Chakraz=M.ChakraArmor*0.01;view(M)<<output("<font color=yellow size=2>[M] has been shocked!([damage-(Chakraz*damage)])</font>","Attack")
					M.health-=(damage-(Chakraz*damage));M.Death(O)
		spawn(26)
			src.Owner=null;src.loc=null

////////////////////////
//Black Panther Obj
///////////////////
obj/Jutsu/Elemental/Raiton
	BlackPanther
		icon = 'BlackRaitonTechniques.dmi'
		icon_state="Panther"//black raiton wolf
		layer = MOB_LAYER+1
		Move_Delay=0
		pixel_step_size=8
		density=1
		var/nin=0
		New()
			..()
			spawn()
				while(src)
					sleep(1)
					src.SoundEngine('SFX/LightningSFX.wav',10)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Blacklightning/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(50)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				var/LightningChakra=LightningDamage(O)
				var/damage=src.nin;damage=round((damage)*((LightningChakra*0.02)+0.8));var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)
				if(M.Clan=="Hoshigaki")
					damage*=1.25
				view(M)<<output("<font color=yellow size=2>[M] has been shocked by the Panther!([damage])</font>","Attack")
				M.DamageProc(damage,"Health",O)
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
						var/obj/Jutsu/Elemental/Raiton/Blacklightning/AA=new();
						var/obj/Jutsu/Elemental/Raiton/Blacklightning/K=new();
						var/obj/Jutsu/Elemental/Raiton/Blacklightning/B=new();
						var/obj/Jutsu/Elemental/Raiton/Blacklightning/C=new();
						var/obj/Jutsu/Elemental/Raiton/Blacklightning/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);
						K.loc=src.loc;
						B.loc=locate(src.x-1,src.y,src.z);
						C.loc=locate(src.x,src.y+1,src.z);
						D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;
						B.nin=src.nin/2;C.nin=src.nin/2;
						D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner

		Del()
			for(var/turf/T in oview(1,src))
				var/obj/Jutsu/Elemental/Raiton/Blacklightning/AA=new();AA.icon+=rgb(0,0,0);AA.loc=T;AA.Owner=src.Owner;AA.nin=src.nin
			..()
////////////////////////
//Black Laser Obj
///////////////////
	BlackLaser
		icon = 'BlackRaitonTechniques.dmi'
		icon_state="BlackLaser"//recolored chidori spear.
		density = 1
		layer=MOB_LAYER-1
		var/nin=100
		var/Front=0
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Blacklightning/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner
					for(var/mob/M in src.loc)
						var/mob/O=src.Owner;
						var/damage=O.nin*((O.LightningChakra*0.6)+0.8);
						if(damage>150)
							damage=150;
						view(M)<<output("<font color=yellow size=2>[M] has been shocked by Laser!([damage])</font>","Attack")
						M.DamageProc(damage,"Health",O);
			spawn(100)
				del(src)
		Move()
			if(src.Front)
				var/obj/Jutsu/Elemental/Raiton/BlackLaser/L=new();L.Front=0;L.density=0;L.Move_Delay=src..Move_Delay;L.icon_state="BlackLaserTrail"L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;L.JutsuLevel=src.JutsuLevel
			..()

		Bump(A)
			if(ismob(A))
				if(src.Front)
					var/mob/M=A
					var/mob/O=src.Owner
					if(M.Kibaku)
						M.Defused=1
					var/damage=src.nin
					damage=round((damage)*((O.LightningChakra*0.02)+0.8))
					var/Chakraz=M.ChakraArmor*0.01
					damage=damage-(Chakraz*damage)
					if(M.RaiArmor)
						if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
							view(M)<<"[M]'s armor absorbed the shock!";del(src)
						else
							var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
							if((damage-resistance)<0) resistance=(damage-1)
							damage-=resistance
					if(damage>300)
						damage=300
					view(M)<<output("<font color=yellow size=2>[M] has been hit by Laser!([damage])</font>","Attack")
					M.DamageProc(damage,"Health",O)
					step(M,src.dir);
//Jutsu Procs
mob/proc/BlackPantherJutsu()
	src.ChakraDrain(800000)
	src.Handseals(30-src.HandsealSpeed)
	var/obj/Jutsu/Elemental/Raiton/BlackPanther/A=new();A.loc=src.loc;A.Owner=src;A.dir=src.dir;A.nin=src.nin
	walk(A,src.dir)
mob/proc/BlackLaserProc()
	src.ChakraDrain(800000)
	src.Handseals(45-src.HandsealSpeed)
	var/obj/Jutsu/Elemental/Raiton/BlackLaser/A=new();A.Front=1;A.Owner=src;A.nin=src.nin;A.loc=get_step(src.loc,src.dir);A.Move_Delay=-1;
	var/obj/Jutsu/Elemental/Raiton/BlackLaser/B=new();B.Front=1;B.Owner=src;B.nin=src.nin;B.loc=get_step(src.loc,src.dir);B.Move_Delay=-1;
	var/obj/Jutsu/Elemental/Raiton/BlackLaser/C=new();C.Front=1;C.Owner=src;C.nin=src.nin;C.loc=get_step(src.loc,src.dir);C.Move_Delay=-1;
	A.dir=src.dir;A.dir=turn(src.dir,45);step(A,A.dir);
	C.dir=src.dir;C.dir=turn(src.dir,-45);step(C,C.dir);
	A.dir=src.dir;B.dir=src.dir;C.dir=src.dir;
	walk(A,src.dir);walk(B,src.dir);walk(C,src.dir);