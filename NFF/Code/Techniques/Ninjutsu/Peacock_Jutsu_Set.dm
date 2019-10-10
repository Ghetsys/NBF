mob/var/tmp
	KujakuMyouhouon=0
obj/Jutsu/KujakuMyohou
	icon='Icons/Jutsus/Star.dmi'
	Star
		icon_state="Mastered"
		density=1
		New()
			..()
			spawn(10)
				del(src)
		Bump(A)
	//		..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner;var/damage=O.Mchakra*0.40
				if(damage>=1200)
					damage=1200
				spawn()
					view(M)<<sound('SFX/Slice.wav',0);M.Bloody();M.Bloody();M.Bloody()
				src.loc=M.loc
				M.DamageProc(damage,"Health",O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	Feathers
		icon_state="Feather"
		density=1
		New()
			src.pixel_x+=rand(10,14)
			src.pixel_y+=rand(10,14)
			..()
			spawn(5)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				var/mob/O=src.Owner;var/damage=O.Mchakra*0.15
				M.DamageProc(damage,"Health",O);M.HitBack(1,src.dir)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	Bind
		icon_state="Small"
		density=1
		layer=MOB_LAYER+1
		var/StruggleOutOf=70
		New()
			..()
			spawn()
				while(src)
					for(var/mob/M in src.loc)
						var/mob/O=src.Owner
						M.FrozenBind="ChakraBeastBind"
						if(M==O)
							return
						if(M.Stun>20)
							M.Stun=20
						if(M.FrozenBind!="ChakraBeastBind")
							M<<"Press Spacebar to struggle out of The Bind!"
						if(M.Struggle>=StruggleOutOf)
							M<<"You've broken out of the Peacock's Bind!"
							M.FrozenBind=""
							del(src)

						M.health-=10
		//				M.StunAdd(20)
					sleep(5)
			spawn(65)
				del(src)
		Del()
			for(var/mob/P in src.loc)
				P.FrozenBind=""
			..()
	Wall
		icon_state="Block"
		health=1500
		density=1
		opacity=1
		layer=MOB_LAYER+1
		New()
			..()
			spawn(450)
				del(src)

mob/KujakuMyouhou
	icon='Icons/Jutsus/Star.dmi'
	KujakuHead
		icon='Icons/Jutsus/KujakuHead.dmi'
		density=1
		health=10000000000000000000000000000
		layer=MOB_LAYER+999
		Move()
			var/mob/O=src.Owner
			if(O)
				var/ChakraLoss=(O.Mchakra*0.001);O.chakra-=ChakraLoss
			..()
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				var/mob/O = src.Owner
				if(!src.firing)
					var/damage=src.tai
					M.DamageProc(damage,"Stamina",O)
					view(M)<<output("[M] took [damage] damage from the chakra beast!!!","Attack")
					src.loc=M.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					return 0
			if(istype(A,/obj/))
				return 0

mob/proc
	KujakuMyouhou()
		var/startrainingstat=0
		for(var/obj/SkillCards/KujakuMyouhou/A in src.LearnedJutsus)
			startrainingstat=A.Uses
		if(!src.KujakuMyouhouon)
			if(startrainingstat>=100&&startrainingstat<300)
				src.LearnedJutsus+=new/obj/SkillCards/StarShot
			if(startrainingstat>=300&&startrainingstat<750)
				src.LearnedJutsus+=new/obj/SkillCards/StarShot
				src.LearnedJutsus+=new/obj/SkillCards/StarBind
			if(startrainingstat>=750&&startrainingstat<1000)
				src.LearnedJutsus+=new/obj/SkillCards/StarShot
				src.LearnedJutsus+=new/obj/SkillCards/StarBind
				src.LearnedJutsus+=new/obj/SkillCards/StarFeathers
			if(startrainingstat>=1000)
				src.LearnedJutsus+=new/obj/SkillCards/StarShot
				src.LearnedJutsus+=new/obj/SkillCards/StarBind
				src.LearnedJutsus+=new/obj/SkillCards/StarFeathers
				src.LearnedJutsus+=new/obj/SkillCards/KujakuWall
				src.LearnedJutsus+=new/obj/SkillCards/KujakuCapture
			src.UpdateInv()
			src.KujakuMyouhouon=1;
			src.icon_state="handseal"
			view()<<"[src] releases a pink aura from their body!"
			src.underlays += 'Icons/Jutsus/Kujaku.dmi'
			var/mob/KujakuMyouhou/KujakuHead/P=new();
			P.loc=locate(src.x,src.y+1,src.z)
			P.dir=src.dir;
			P.Owner=src
			src.controlled=P
			P.tai=startrainingstat/2
			src.icon_state=""
			if(P.tai>750)
				P.tai=750
			if(startrainingstat<100)
				src<<"You release the first stage of Kujaku Myouhou."
			if(startrainingstat>=100&&startrainingstat<300)
				src<<"You release the second stage of Kujaku Myouhou."
				return
			if(startrainingstat>=300&&startrainingstat<750)
				src<<"You release the third stage of Kujaku Myouhou."
				return
			if(startrainingstat>=750&&startrainingstat<1000)
				src<<"You release the fourth stage of Kujaku Myouhou."
				return
			if(startrainingstat>=1000)
				src<<"You release the final form of Kujaku Myouhou!"
				return
		else
			src.Frozen=0;src.firing=0;src.KujakuMyouhouon=0;src.icon_state=""
			src.controlled = null
			src.client.perspective=MOB_PERSPECTIVE
			src.client.eye = usr
			for(var/mob/KujakuMyouhou/KujakuHead/P in world) if(P.Owner == usr) del(P)
			src<<"You turn off Kujaku Myouhou.";src.underlays -= 'Icons/Jutsus/Kujaku.dmi'
		//	if(locate(/obj/SkillCards/StarShot in usr.LearnedJutsus))
			for(var/obj/SkillCards/StarShot/A in src.LearnedJutsus)
				del(A)
		//	if(locate(/obj/SkillCards/StarBind in usr.LearnedJutsus))
			for(var/obj/SkillCards/StarBind/B in src.LearnedJutsus)
				del(B)
		//	if(locate(/obj/SkillCards/StarFeathers in usr.LearnedJutsus))
			for(var/obj/SkillCards/StarFeathers/C in src.LearnedJutsus)
				del(C)
		//	if(locate(/obj/SkillCards/KujakuWall in usr.LearnedJutsus))
			for(var/obj/SkillCards/KujakuWall/D in src.LearnedJutsus)
				del(D)
			for(var/obj/SkillCards/KujakuCapture/E in src.LearnedJutsus)
				del(E)
			src.UpdateInv()
			return
/*

		if(Uses<100)
			if(!src.KujakuMyouhouon)
				src<<"You need to have Kujaku Myouhou on!";return
*/

mob/proc
	KujakuWall(Uses)
		if(src.firing||src.knockedout)
			return
		var/obj/Jutsu/KujakuMyohou/Wall/A=new();A.loc=locate(src.x+1,src.y,src.z);A.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/AA=new();AA.loc=locate(src.x+1,src.y+1,src.z);AA.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/BB=new();BB.loc=locate(src.x+1,src.y-1,src.z);BB.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/AAA=new();AAA.loc=locate(src.x-1,src.y,src.z);AAA.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/AAAA=new();AAAA.loc=locate(src.x-1,src.y+1,src.z);AAAA.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/AAAAA=new();AAAAA.loc=locate(src.x-1,src.y-1,src.z);AAAAA.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/AAAAAA=new();AAAAAA.loc=locate(src.x,src.y-1,src.z);AAAAAA.Owner=src
		var/obj/Jutsu/KujakuMyohou/Wall/AAAAAAA=new();AAAAAAA.loc=locate(src.x,src.y+1,src.z);AAAAAAA.Owner=src
	Kujaku_Capture(Uses)
		if(src.firing||src.knockedout)
			return
		var/mob/M=src.target
		src.ChakraDrain(20000)
		if(M in oview(9))
			var/obj/Jutsu/KujakuMyohou/Wall/A=new();A.loc=locate(M.x+1,M.y,M.z);A.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/AA=new();AA.loc=locate(M.x+1,M.y+1,M.z);AA.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/BB=new();BB.loc=locate(M.x+1,M.y-1,M.z);BB.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/AAA=new();AAA.loc=locate(M.x-1,M.y,M.z);AAA.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/AAAA=new();AAAA.loc=locate(M.x-1,M.y+1,M.z);AAAA.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/AAAAA=new();AAAAA.loc=locate(M.x-1,M.y-1,M.z);AAAAA.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/AAAAAA=new();AAAAAA.loc=locate(M.x,M.y-1,M.z);AAAAAA.Owner=src
			var/obj/Jutsu/KujakuMyohou/Wall/AAAAAAA=new();AAAAAAA.loc=locate(M.x,M.y+1,M.z);AAAAAAA.Owner=src
	StarShot(Uses)
		if(src.firing||src.knockedout)
			return
		src.chakra-=100
		var/obj/Jutsu/KujakuMyohou/Star/K=new();K.loc=src.loc;K.dir=src.dir;K.Owner=src;K.name="[src]";walk(K,src.dir)
		if(src.target)
			var/mob/M=src.target
			walk_to(K,M)
	StarBind(Uses)
		if(src.firing||src.knockedout)
			return
		src.chakra-=200
		var/obj/Jutsu/KujakuMyohou/Bind/K=new();K.loc=src.loc;K.dir=src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir)
		if(src.target)
			var/mob/M=src.target
			walk_to(K,M)
	StarFeathers(Uses)
		if(src.firing||src.knockedout)
			return
		var/X=Uses
		if(X<10)
			X=10
		if(X>20)
			X=20
		src.chakra-=200
		while(X)
			var/obj/Jutsu/KujakuMyohou/Feathers/F=new();F.loc=src.loc;F.dir=src.dir;F.name="[src]";F.Owner=src;walk(F,src.dir)
			if(X==5||X==10||X==15||X==20) F.dir=turn(F.dir,45);step(F,F.dir);F.dir=src.dir
			if(X==4||X==9||X==14||X==19) F.dir=turn(F.dir,-45);step(F,F.dir);F.dir=src.dir
			if(X==3||X==8||X==13||X==18) F.dir=turn(F.dir,45)
			if(X==2||X==7||X==12||X==17) F.dir = turn(F.dir,-45)
			walk(F,F.dir);X--;sleep(1)