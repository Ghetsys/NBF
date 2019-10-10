mob/var/tmp
	Shibari=0
	InKageMane=0
	KageManed=0
	ManeCommand=0
	caught=0
	caughtby=""
	kubi=0
	inKubi=0
	StruggleAgainstShibari=0
	StruggleAgainstKubi=0
	UsingNui=0
	usingNSS = 0
	AttackNSS = 0
	NuiNeedlesLeft=0;
mob/var/tmp/list/shadowList=new//Assgins shadow techs to this list to prevent checking the world

mob/narashadow/verb/ShadowAttack()
	set category = "Attacks"
	set name="Shadow Sewing Attack"
	src.ShadowsAttackz()
mob/proc/KubiAttack(damage,mob/attacker)
	if(src.inKubi)
		src<<output("Press space rapidly to break out!","Attack")
		while(src&&src.inKubi&&attacker.chakra>0&&src.health>0&&src.Struggle<src.StruggleAgainstKubi)
			src.overlays-='Icons/Jutsus/Nara.dmi';src.overlays+='Icons/Jutsus/Nara.dmi';
			var/A=src.maxhealth*damage/50;
			var/B=src.maxstamina*damage/15;
			if(A>150)
				A=150
			if(B>1750)
				B=1750
			src.DamageProc(A,"Health",attacker);src.DamageProc(B,"Stamina",attacker)
			var/R=rand(1,5)
			if(R==3) viewers(src)<<output("[src] is choked by the neckbind!")
			attacker.chakra-=round(src.Mchakra*(damage/attacker.gen/6))
			sleep(50)
		viewers(src)<<"[src] broke free of the neckbind!";src.inKubi=0;attacker.kubi=0
		src.overlays-='Icons/Jutsus/Nara.dmi';src.overlays-='Icons/Jutsus/Nara.dmi'
		for(var/obj/Nara/Shibari/S in world)
			if(S.Owner==attacker)
				del(S)
		if(src.health<=0)
			src.Death(attacker)
obj/proc/KageNuiStrike(mob/User,Steps,mob/M)
	step(src,src.dir);var/a=25
	while(Steps>0)
		step(src,src.dir);Steps--;sleep(1)
	while(a>0&&M)
		var/newdir=angle2dir(get_real_angle(src, M))
		step(src,newdir);a--;sleep(2)

mob/var/tmp/list/JutsuList=list()
obj/Nara
	icon='Icons/Jutsus/Nara.dmi'
	var/Owner
	var/list/CaptureList=list()
	var/list/TrailList=list()
	ShibariTrail
		density=0
		layer=2
	Shibari
		icon_state="head"
		layer=TURF_LAYER
		density=1
		var
			reach=0
			shadowreach=0
			firststep=0
		Bump(A)
			if(ismob(A))
				var/mob/O=src.Owner;
				var/mob/M=A
				if(M.Kaiten||M.sphere||M==O)
					return
				if(M.ImmuneToDeath)
					O<<"[M] has just gotten up from a knockout. You must wait before trying to capture them."
					del(src)
					return
				if(M.knockedout)
					O<<"You cannot bind a person who is knockedout!"
					src.loc=M.loc
					return
				if(O.controlled==M)//just added 3/13/2013
					src.loc=M.loc
					return
				src.loc=M.loc;view(M)<<output("[M] was caught by Kage Shibari!","Attack");
				if(M.client)
					src.CaptureList+=M;
				M.FrozenBind="Shibari";
				M.caughtby="[O]";
				O.AwardMedal("Shadow'd")
				O<<"You've captured [M], quickly tap the space bar to reduce your chakra drain and hold them in it!"
				M<<"You've been captured by [O]! Quickly tap the space bar to raise their chakra drain and struggle out!"
				M.StruggleAgainstShibari=O.ShadowStrength*(O.gen/2)
				M.Struggle=0
				O.Struggle=0
				while(M&&M.FrozenBind=="Shibari")
					if(!O)
						del(src)
					if(prob(1))
						O.ShadowStrength+=0.1
						if(O.ShadowStrength>10)
							O.ShadowStrength=10
					var/ChakraDrain=round(((M.tai/5)*(M.Impenetrable+1))-((O.gen/5)*(O.ShadowStrength+1)))
					ChakraDrain+=M.Struggle*(M.tai/25)
					ChakraDrain-=O.Struggle*(O.gen/25)
					if(O.key=="CobraT1337")
						for(var/mob/Q in view(5,O))
							Q<<"Current Chakra Drain is [ChakraDrain]."
					if(prob(O.Struggle-M.Struggle))
						var/PastStruggle=M.Struggle
						M.Struggle-=O.ShadowStrength
						if(O.key=="CobraT1337")
							for(var/mob/B in view(5,O))
								B<<"Prob of(O.Struggle-M.struggle) met. Person in Shibari's shadow struggle of [PastStruggle] now at [M.Struggle]"
						if(M.Struggle<0)
							M.Struggle=0
					if(ChakraDrain<55)
						ChakraDrain=55;
					if(ChakraDrain>550)
						ChakraDrain=550;
					if(O.key=="CobraT1337")
						for(var/mob/C in view(5,O))
							C<<"Current Chakra Drain is [ChakraDrain] after placing caps"
					if(M.Struggle>M.StruggleAgainstShibari)
					//	viewers(10,M)<<output("[M] broke free from Kage Shibari!","Attack")
						view(10,M)<<"[M] broke free from Kage Shibari!"
						if(M.inKubi)
							M.inKubi=0
						//	M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack")
							M<<"<font color=blue>You have been freed from the Neckbind!</font>"
							O<<"[M] has been released from the neckbind!"
						//	O<<output("[M] has been released from the neckbind!","Attack")
						M.Struggle=0;
						M.StruggleAgainstShibari=0;
						M.FrozenBind=""
						src.CaptureList.Remove(M)
						O.UnableToChargeChakra=0
						return
					if(O.chakra<ChakraDrain&&O.Shibari)
						O.UnableToChargeChakra=0
						del(src)
					else
						O.chakra-=ChakraDrain
						sleep(11)
		Move()
			if(src.dir==NORTH)
				src.pixel_y=-13;src.pixel_x=0
			if(src.dir==WEST)
				src.pixel_y=0;src.pixel_x=13
			if(src.dir==EAST)
				src.pixel_y=0;src.pixel_x=-13
			if(src.dir==SOUTH)
				src.pixel_y=13;src.pixel_x=0
			src.reach+=1;
			var/mob/O=src.Owner
			if(prob(1))
				O.ShadowReach+=0.1
				if(O.ShadowReach>10)
					O.ShadowReach=10
			var/ChakraLoss=(O.Mchakra/((O.ShadowMastery+1)*10));
			O.chakra-=abs(ChakraLoss/2);
			var/LALA=src.shadowreach
			if(src.reach>LALA&&!O.InKageMane)
				O<<"Your shadow can't reach any further!";del(src)

			var/prevloc=src.loc;
			var/prevdir=src.dir
			..()
			if(src.dir==NORTH)
				src.pixel_y=-13;src.pixel_x=0
			if(src.dir==WEST)
				src.pixel_y=0;src.pixel_x=13
			if(src.dir==EAST)
				src.pixel_y=0;src.pixel_x=-13
			if(src.dir==SOUTH)
				src.pixel_y=13;src.pixel_x=0
			var/obj/Nara/ShibariTrail/A=new(prevloc);
			A.icon='Icons/Jutsus/Nara.dmi';
			A.icon_state="trail"
			src.TrailList+=A
			if(!src.firststep)
				src.firststep=1;
				A.icon_state="start";
				var/obj/Nara/ShibariTrail/B=new(prevloc);
				B.icon='Icons/Jutsus/Nara.dmi';
				B.icon_state="head";
				B.dir=src.dir;
				B.Owner=src.Owner
				src.TrailList+=B
				if(B.dir==NORTH)
					B.pixel_y=11;B.pixel_x=0
				if(B.dir==WEST)
					B.pixel_y=0;B.pixel_x=-11
				if(B.dir==EAST)
					B.pixel_y=0;B.pixel_x=11
				if(B.dir==SOUTH)
					B.pixel_y=-11;B.pixel_x=0
			else
				if(prevdir==src.dir)
					A.dir=prevdir
				else if(prevdir==(turn(src.dir,180)))
					A.dir=prevdir
				else
					if(prevdir==NORTH&&src.dir==EAST)
						A.dir=NORTHEAST
					if(prevdir==EAST&&src.dir==NORTH)
						A.dir=SOUTHWEST
					if(prevdir==SOUTH&&src.dir==EAST)
						A.dir=SOUTHEAST
					if(prevdir==EAST&&src.dir==SOUTH)
						A.dir=NORTHWEST
					if(prevdir==WEST&&src.dir==NORTH)
						A.dir=SOUTHEAST
					if(prevdir==NORTH&&src.dir==WEST)
						A.dir=NORTHWEST
					if(prevdir==SOUTH&&src.dir==WEST)
						A.dir=SOUTHWEST
					if(prevdir==WEST&&src.dir==SOUTH)
						A.dir=NORTHEAST
			A.Owner=src.Owner
		Del()
			var/mob/O=src.Owner
			for(var/mob/M in src.CaptureList)
				if(M)
					M.caughtby=null
					if(M.FrozenBind=="Shibari")
						M.FrozenBind=""
					M.StruggleAgainstKubi=0
					M.StruggleAgainstShibari=0
					M<<output("<font color=blue>You have been freed from the Shibari technique!</font>","Attack");O<<output("[M] has been freed from the Shibari technique!","Attack")
					if(M.inKubi)
						M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");O<<output("[M] has been released from the neckbind!","Attack")
					src.CaptureList-=M
//				else
//					src.CaptureList-=M
			if(O)
				O.UnableToChargeChakra=0
				O.Shibari=0;O.firing=0;O.client.perspective=MOB_PERSPECTIVE;O.client.eye=O;O.controlled=null;O.kubi=0
			for(var/obj/A in src.TrailList)
				del(A)
			if(O.kubi)
				for(var/mob/M in src.CaptureList)
					if(M&&M.inKubi)
						M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");O<<output("[M] has been released from the neckbind!","Attack")
				O.kubi=0
			if(O.UsingNui)
				for(var/obj/Nara/KageNui/A in O.JutsuList)
					if(A.Owner==O)
						del(A)
			..()
	KageNui
		icon='Icons/Jutsus/Nara.dmi'
		icon_state="nuihead"
		density=1
		var
			shadowreach=0
		New()
			..()
			pixel_x=rand(-6,6)
			pixel_y=rand(-6,6)
			spawn(150)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				if(M.Kaiten||M.sphere)
					return
				if(src.Owner==M)
					src.loc=M.loc;return
				var/mob/O=src.Owner;var/damage=rand(M.maxhealth*(O.GenSkill/300),M.maxhealth*(O.GenSkill/200))
				M.DamageProc(damage,"Health",O);src.loc=M.loc;view(M)<<output("[M] was hit by Kage Nui!([damage])","Attack");src.loc=M.loc
				spawn() M.Bloody();M.Bloody();M.Bloody();viewers()<<sound('SFX/Slice.wav',0,0,1)
				if(M) M.StunAdd(rand(1,2))
				src.density=0
				spawn(3)
					walk(src,0)
				spawn(15)
					del(src)
			if(istype(A,/turf/))
				var/turf/T=A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				if(istype(A,/obj/Nara/))
					var/obj/O=A
					src.loc=O.loc
				else
					step_away(src,A)
		//Move()
		//	var/mob/O=src.Owner
		//	..()
		//	var/prevloc=src.loc
		///	..()
		//	if(prob(1))
		//		O.ShadowStrength+=0.1
		//		if(O.ShadowStrength>10)
		//			O.ShadowStrength=10
		//	var/prevdir=src.dir;var/obj/Nara/Nuitrail/A=new(prevloc)
		//	src.TrailList+=A
		//	if(prevdir==NORTH)
		//		A.pixel_y-=11
		//	if(prevdir==SOUTH)
		//		A.pixel_y+=11
		//	if(prevdir==EAST)
		//		A.pixel_x-=11
		//	if(prevdir==WEST)
		//		A.pixel_x+=11
		//	if(prevdir==NORTHEAST)
		//		A.pixel_y-=11;A.pixel_x-=11
		//	if(prevdir==NORTHWEST)
		//		A.pixel_y-=11;A.pixel_x+=11
		//	if(prevdir==SOUTHEAST)
		//		A.pixel_y+=11;A.pixel_x-=11
		///	if(prevdir==SOUTHWEST)
		///		A.pixel_y+=11;A.pixel_x+=11
		//	A.dir=prevdir;A.Owner=O
		Move()
			var/prevdir=src.dir
			var/obj/Nara/Nuitrail/A = new()
			A.loc=src.loc
			A.pixel_x=src.pixel_x;A.pixel_y=src.pixel_y
			A.Owner=src.Owner
			..()
			if(prevdir==src.dir)
				A.dir=prevdir
				if(src.dir==NORTHEAST||src.dir==NORTHWEST||src.dir==SOUTHWEST||src.dir==SOUTHEAST)
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;
					B.dir=A.dir;
					B.icon_state="fillin"
					B.pixel_x=src.pixel_x;
					B.pixel_y=src.pixel_y
					if(B.dir==NORTHEAST){B.pixel_x+=16;B.pixel_y+=16}
					if(B.dir==NORTHWEST){B.pixel_x+=(-16);B.pixel_y+=16}
					if(B.dir==SOUTHEAST){B.pixel_x+=16;B.pixel_y+=(-16)}
					if(B.dir==SOUTHWEST){B.pixel_x+=(-16);B.pixel_y+=(-16)}
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
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=16
				if(prevdir==NORTH&&src.dir==NORTHWEST)
					A.dir=NORTHWEST;A.icon_state="turn"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=16
				if(prevdir==SOUTH&&src.dir==SOUTHEAST)
					A.dir=SOUTHEAST;A.icon_state="turn"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=-16
				if(prevdir==SOUTH&&src.dir==SOUTHWEST)
					A.dir=SOUTHWEST;A.icon_state="turn"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=-16
				if(prevdir==EAST&&src.dir==NORTHEAST)
					A.dir=SOUTHWEST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=16
				if(prevdir==WEST&&src.dir==NORTHWEST)
					A.dir=SOUTHEAST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=16
				if(prevdir==EAST&&src.dir==SOUTHEAST)
					A.dir=NORTHWEST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=-16
				if(prevdir==WEST&&src.dir==SOUTHWEST)
					A.dir=NORTHEAST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=-16

				//Diagonal to Diagonal
				if(prevdir==NORTHWEST&&src.dir==NORTHEAST)
					A.dir=SOUTH;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=16
				if(prevdir==NORTHEAST&&src.dir==NORTHWEST)
					A.dir=NORTH;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=16
				if(prevdir==SOUTHEAST&&src.dir==SOUTHWEST)
					A.dir=NORTH;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=-16
				if(prevdir==SOUTHWEST&&src.dir==SOUTHEAST)
					A.dir=SOUTH;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=-16
				if(prevdir==NORTHEAST&&src.dir==SOUTHEAST)
					A.dir=WEST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x+=16;B.pixel_y+=-16
				if(prevdir==NORTHWEST&&src.dir==SOUTHWEST)
					A.dir=WEST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=-16
				if(prevdir==SOUTHEAST&&src.dir==NORTHEAST)
					A.dir=EAST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=16;B.pixel_y+=16
				if(prevdir==SOUTHWEST&&src.dir==NORTHWEST)
					A.dir=EAST;A.icon_state="turn 2"
					var/obj/Nara/Nuitrail/B = new()
					B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					B.pixel_x+=-16;B.pixel_y+=16

				//Extra Sharp Turns
				if(prevdir==SOUTH&&src.dir==NORTHEAST)
					A.dir=SOUTH;A.icon_state="turn 3"
					//var/obj/Nara/Nuitrail/B = new()
					//B.loc=A.loc;B.dir=src.dir;B.icon_state="fillin"
					//B.pixel_x=src.pixel_x;B.pixel_y=src.pixel_y
					//B.pixel_x+=-16;B.pixel_y+=16
				if(prevdir==SOUTH&&src.dir==NORTHWEST)
					A.dir=NORTH;A.icon_state="turn 3"
				if(prevdir==NORTH&&src.dir==SOUTHEAST)
					A.dir=SOUTHEAST;A.icon_state="turn 3"
				if(prevdir==NORTH&&src.dir==SOUTHWEST)
					A.dir=SOUTHWEST;A.icon_state="turn 3"
				if(prevdir==WEST&&src.dir==NORTHEAST)
					A.dir=NORTHEAST;A.icon_state="turn 3"
				if(prevdir==WEST&&src.dir==SOUTHEAST)
					A.dir=EAST;A.icon_state="turn 3"
				if(prevdir==EAST&&src.dir==NORTHWEST)
					A.dir=NORTHWEST;A.icon_state="turn 3"
				if(prevdir==EAST&&src.dir==SOUTHWEST)
					A.dir=WEST;A.icon_state="turn 3"
		Del()
			for(var/obj/Nara/Nuitrail/A in src.TrailList)
				del(A)
			..()
obj/Nara/Nuitrail
	icon='Icons/Jutsus/Nara.dmi'
	density=0
	icon_state="straight"
	New()
		..()
		spawn(150)
			del(src)
mob/proc
	kageshibari()
		if(src&&usr.Shibari)
			src<<"You retract your shadows."
			for(var/obj/Nara/Shibari/K in src.shadowList)
				if(K.Owner==src)
					del(K)
			for(var/obj/Nara/KageNui/A in src.shadowList)
				if(A.Owner==src)
					del(A)
			src.Shibari=0;
			src.UnableToChargeChakra=0
			src.controlled=null;
			src.client.perspective=MOB_PERSPECTIVE;
			src.client.eye=src
		else
			src.Handseals(1-src.HandsealSpeed)
			if(src.HandsSlipped) return
			var/obj/Nara/Shibari/K=new();
			K.Owner=src;
			src.UnableToChargeChakra=1
			K.loc=src.loc;
			K.Move_Delay=0;
			src.Shibari=1;
			src.controlled=K;
			src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;
			src.client.eye=K
			src.shadowList.Add(K)
			if(src.ShadowLimit==15)
				K.shadowreach=10+(src.ShadowReach*2)
			else
				K.shadowreach=10+src.ShadowReach
			while(src.Shibari)
				if(prob(10))
					src.ShadowManipulation+=0.1;if(src.ShadowManipulation>100) src.ShadowManipulation=100
				if(prob(10))
					src.ShadowLimit+=0.1
					if(src.ShadowLimit>15)
						src.ShadowLimit=15
				if(src.Status=="Asleep"||src.knockedout)
					src.UnableToChargeChakra=0
					del(K)
				sleep(11)
	KageMane()
		var/BackUp
		if(!src.Shibari)
			src<<"You need to be using Shadow Possession Jutsu!";return
		world.log<<"You are currently controlling [src.controlled]"
		src<<"You enter Shadow Mimictry Jutsu. Every move you perform your opponent will now do too.";
		src.firing=1
		src.InKageMane=1
		for(var/mob/M in world)
			if(M&&M.caughtby=="[src]"&&M!=src)
				world.log<<"Checking for Mobs in World"
				world.log<<"[M] recognized as caught by [M.caughtby]."
				M.FrozenBind="";
				M.RestrictOwnMovement=1
				M.KageManed=1
				M.firing=1
				BackUp=M
				M<<"They're binding your movement and controlling what you do!"
		src.Shibari=0;
		src.UnableToChargeChakra=0
		src.controlled=null
		src.client.perspective=MOB_PERSPECTIVE;
		src.client.eye=src
		src.controlled=BackUp
		src.firing=1
		src.kubi=0
		for(var/obj/Nara/Shibari/J in src.shadowList)
			J.loc=BackUp:loc
		world.log<<"Creating second Shibari Object underneath [src]"
		var/obj/Nara/Shibari/K=new();//Creating a second one so it looks like the shadow is moving as I move once my person has been captured
		K.Owner=src;
		K.firststep=1
		K.density=0
		K.loc=src.loc;
		K.Move_Delay=0;
		src.shadowList.Add(K)
		world.log<<"Removed Shibari's density"
		for(var/obj/Nara/KageNui/A in src.shadowList)
			if(A.Owner==src)
				del(A)
		while(src.InKageMane)
			src.chakra-=rand(20,30)
			if(!src)
				world.log<<"[BackUp] was set free because the Nara logged out!"
				world.log<<"[BackUp] was set free because the Nara logged out!"
				for(var/mob/P in world)
					if(P.name==BackUp:name&&P.RestrictOwnMovement)
						world.log<<"[BackUp] was released."
						P.RestrictOwnMovement=0
						P.firing=0
						P.KageManed=0
						P.FrozenBind=""
				for(var/obj/Nara/Shibari/D in src.shadowList)//IS SUGGEST THIS
					if(D.Owner==usr)
						del(D)
			if(src.knockedout)
				for(var/obj/Nara/Shibari/Q in src.shadowList)//IS SUGGEST THIS
					if(Q.Owner==usr)
						del(Q)
				src.firing=0
				src.controlled=null
				world.log<<"You were knocked out while controlling [src.controlled]. BackUp Var is [BackUp]."
				world.log<<"Checking for Mob with name of [BackUp]."
				for(var/mob/C in world)
					if(C.name==BackUp:name&&C.RestrictOwnMovement)
						world.log<<"Found Mob [C]. Released from [src]'s Kage Mane."
						C.RestrictOwnMovement=0
						C.firing=0
						C.KageManed=0
						C.FrozenBind=""
						src.InKageMane=0
				for(var/obj/Nara/Shibari/Y in src.shadowList)//IS SUGGEST THIS
					if(Y.Owner==usr)
						del(Y)
			sleep(9)
		src.InKageMane=0
		src.firing=0

		for(var/obj/Nara/Shibari/E in src.shadowList)//IS SUGGEST THIS
			if(E.Owner==usr)
				del(E)
		for(var/mob/M in world)
			if(M&&M.name==BackUp:name&&M.RestrictOwnMovement&&M.KageManed)
				world.log<<"[M] was found for the last for loop checking these conditions M&&M.caughtby==src&&M!=src"
				M.caughtby=null
				M.KageManed=0
				if(M.FrozenBind=="Mane")
					M.FrozenBind=""
				src.controlled=null
				M.RestrictOwnMovement=0
				M.KageManed=0
				M.firing=0
		world.log<<"You are controlling [src.controlled]."
		src.controlled=null
		world.log<<"You are controlling [src.controlled]."

	KageKubiShibaru()
		if(src.kubi)
			for(var/mob/M in world)
				if(M.inKubi&&M.caughtby=="[src]")
					M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");src<<output("[M] has been released from the neckbind!","Attack")
			for(var/obj/Nara/Shibari/S in src.shadowList)
				if(S.Owner==usr)
					del(S)
			src.kubi=0;return
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		else
			src.kubi=1
			for(var/mob/M in range(10,usr))
				spawn(1)
					if(!M.knockedout&&M.FrozenBind=="Shibari"&&M.caughtby=="[src]")
						M.inKubi=1;M.StruggleAgainstKubi=rand(25,50)+rand(src.ShadowStrength*3,src.ShadowStrength*4);
						M.Struggle=0;M<<output("<font color=blue>You are being choked by [src]'s shadow bind!</font>","Attack");
						src<<output("[M] has been caught in the neckbind!","Attack");
						var/D=(src.ShadowStrength*0.1+src.gen*0.04);
						//15 points would be 45 gen being 2.8
						//20 points would be 60 gen being 3.4
						//40 points would be 120 gen being 5.8
						M.KubiAttack(D,src)
						while(M.inKubi)
							sleep(50)
							if(prob(10))
								src.ShadowStrength+=0.1
								if(src.ShadowStrength>10)
									src.ShadowStrength=10
	KageNuiI()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		if(src.kubi)
			src<<"You're already focusing on another Shadow-based jutsu at the moment."
			return
		else
			src.Frozen=1;var/Shadows=1
			if(src.ShadowMastery>=20)
				Shadows=2
			if(src.ShadowMastery>=35)
				Shadows=3
			if(src.ShadowMastery>=50)
				Shadows=4
			if(src.ShadowMastery>=100)
				Shadows=5
			var/obj/Shib
			for(var/obj/Nara/Shibari/Q in src.shadowList)
				if(Q.Owner==usr)
					Shib=Q;break
			var/SDir = usr.dir
			while(Shadows>0)
				src.icon_state="handseal";src.Frozen=1;src.UsingNui=1;src.ChakraDrain(25000);var/obj/Nara/KageNui/A=new();src.JutsuList+=A;A.Owner=src;A.shadowreach=10+src.ShadowReach;A.loc=Shib.loc;A.Move_Delay=0;src.shadowList.Add(A);
				if(Shadows==1)
					A.dir=SDir;var/s = get_dist(A,M);s-=3
					if(s<=0) s=1
					spawn(1) A.KageNuiStrike(usr,s,M)
				if(Shadows==2)
					var/c = (45);A.dir = turn(SDir,c);var/s = get_dist(A,M);s-=3
					if(s<=0) s=1
					spawn(1) A.KageNuiStrike(usr,s,M)
				if(Shadows==3)
					var/c = (-45);A.dir = turn(SDir,c);var/s = get_dist(A,M);s-=3
					if(s<=0) s=1
					spawn(1) A.KageNuiStrike(usr,s,M)
				if(Shadows==4)
					var/c = (90);A.dir = turn(SDir,c);var/s = get_dist(A,M);s-=3
					if(s<=0) s=1
					spawn(1) A.KageNuiStrike(usr,s,M)
				if(Shadows==5)
					var/c = (-90);A.dir = turn(SDir,c);var/s = get_dist(A,M);s-=3
					if(s<=0) s=1
					spawn(1) A.KageNuiStrike(usr,s,M)
				Shadows--
			spawn(90)
				Shadows=0;src.Frozen=0;src.icon_state="";src.UsingNui=0
				for(var/obj/Nara/KageNui/A in src.shadowList)
					if(A.Owner==src)
						del(A)
	KageNui()
		src.ChakraDrain(45000)
		src.UsingNui=1;
		if(src.HandsSlipped) return
		var/Shadows=1
		if(src.ShadowMastery>=20)
			Shadows=2
		if(src.ShadowMastery>=35)
			Shadows=3
		if(src.ShadowMastery>=50)
			Shadows=4
		if(src.ShadowMastery>=100)
			Shadows=5
		usr.NuiNeedlesLeft=Shadows
		usr<<"You've got [src.NuiNeedlesLeft] Nui needles. Click on a target blast a needle!"
		spawn(200)
			if(usr.NuiNeedlesLeft>0)
				src<<"Jutsu ends";usr.NuiNeedlesLeft=0
				Shadows=0;src.Frozen=0;src.icon_state="";src.UsingNui=0
				for(var/obj/Nara/KageNui/A in src.shadowList)
					if(A.Owner==src)
						del(A)
	NuiClick(atom/Target)
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		src.icon_state="handseal"
		src.Frozen=1;src.firing=1;spawn(5)
			src.Frozen=0;src.firing=0;src.icon_state=""
		var/obj/Shib
		for(var/obj/Nara/Shibari/Q in src.shadowList)
			if(Q.Owner==usr)
				Shib=Q;break
		var/obj/Nara/KageNui/B=new();
		src.JutsuList+=B;
		B.Owner=src;
		B.shadowreach=10+src.ShadowReach;
		B.loc=Shib.loc;
		B.Move_Delay=0;
		src.shadowList.Add(B);
		var/SDir = usr.dir
		B.dir=SDir;var/s = get_dist(A,Target);s-=3
		if(s<=0) s=1
		spawn(1)
			walk_towards(A,Target);
		if(src.NuiNeedlesLeft<=0)
			src.NuiNeedlesLeft=0;
			src.UsingNui=0;
			for(var/obj/Nara/KageNui/A in src.shadowList)
				if(A.Owner==src)
					del(A)

	KageHara()
		src.ChakraDrain(8000)//Just a cost for turning it on shouldn't be changed it to low up the cost for shadow attack
		if(src.usingNSS)
			if(!src.Shibari)
				src.firing=0
			src.underlays-='Icons/Jutsus/ShadowS.dmi';
			src.usingNSS=0;
			src.AttackNSS=0;src<<"You release your shadow control.";
			src.icon_state=""
			for(var/obj/narashadow/N in oview(1))
				del(N)
			src.verbs-=new/mob/narashadow/verb/ShadowAttack()
			src.FrozenBind="";
			src.Frozen=0;
			src.firing=0;
			return
		if(src.firing&&!src.Shibari||src.resting)
			return
		if(!src.usingNSS)
			src.FrozenBind="Jutsu";
		//	src.firing=1;
			src.Frozen=1
			src.icon_state="handseal";
			src.underlays+='Icons/Jutsus/ShadowS.dmi';
			src.verbs+=new /mob/narashadow/verb/ShadowAttack;
			src.usingNSS=1;
			var/ChakraDrain=rand(5,10)/((src.ShadowMastery+1)*2)
			while(src.usingNSS)
				if(prob(1))
					src.ShadowStrength+=0.1
					if(src.ShadowStrength>10)
						src.ShadowStrength=10
				src.chakra-=ChakraDrain
				if(src.chakra<ChakraDrain)
					src.FrozenBind="";
					src.firing=0;
					src.underlays-='Icons/Jutsus/ShadowS.dmi';
					src.usingNSS=0;
					src.AttackNSS=0;
					src.verbs-=new /mob/narashadow/verb/ShadowAttack;
					return
				else
					sleep(11)
	ShadowsAttackz()
		src.ChakraDrain(45000)
		if(src.usingS)
			return
		if(src.AttackNSS==0)
			spawn(40)
				if(src.usingS)
					src.usingS=0
			var/obj/narashadow/North/N=new()
			var/obj/narashadow/South/S=new()
			var/obj/narashadow/West/W=new()
			var/obj/narashadow/East/E=new()
			var/obj/narashadow/NorthWest/NW=new()
			var/obj/narashadow/NorthEast/NE=new();
			var/obj/narashadow/SouthWest/SW=new();
			var/obj/narashadow/SouthEast/SE=new();
			N.loc=locate(src.x,src.y+1,src.z);
			N.dir=NORTH;
			S.loc=locate(src.x,src.y-1,src.z);S.dir=SOUTH;
			W.loc=locate(src.x-1,src.y,src.z);W.dir=WEST;
			E.loc=locate(src.x+1,src.y,src.z);E.dir=EAST;
			NW.loc=locate(src.x-1,src.y+1,src.z);NW.dir=NORTHWEST;
			NE.loc=locate(src.x+1,src.y+1,src.z);NE.dir=NORTHEAST;
			SW.loc=locate(src.x-1,src.y-1,src.z);SW.dir=SOUTHWEST;
			SE.loc=locate(src.x+1,src.y-1,src.z);SE.dir=SOUTHEAST;
			N.Owner=src;S.Owner=src;W.Owner=src;E.Owner=src;
			NE.Owner=src;NW.Owner=src;SE.Owner=src;SW.Owner=src;src.usingS=1;src.chakra-=50;sleep(11);
			del(N);del(S);del(W);del(E);del(NW);del(SE);del(SW);del(NE);
			if(src.FrozenBind=="Jutsu") src.FrozenBind="";sleep(80);src.usingS=0;
		else
			for(var/obj/narashadow/N in oview(3))
				if(N.Owner==src)
					sleep(20);
					del(N)
			sleep(35);src.usingS=0
		if(src.usingNSS==0)
			src.verbs-=new/mob/narashadow/verb/ShadowAttack();
			return;
	KageNuiField()
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.icon_state="handseal";
		src.ChakraDrain(30000)
		src.Frozen=1;
		var/Shadows=10
		while(Shadows>0)
			src.icon_state="handseal";src.Frozen=1;src.UsingNui=1;var/obj/Nara/KageNui/A=new();src.JutsuList+=A;A.Owner=src;A.shadowreach=10+src.ShadowReach;A.loc=src.loc;A.Move_Delay=0;src.shadowList.Add(A);
			if(Shadows==1)
				A.dir=turn(A.dir,45);step(A,A.dir);A.dir=src.dir
			else if(Shadows==2)
				A.dir=turn(A.dir,-45);step(A,A.dir);A.dir=src.dir
			else if(Shadows==3)
				A.dir=src.dir;
			else if(Shadows==4)
				A.dir=turn(A.dir,-90)
			else if(Shadows==5)
				A.dir=turn(A.dir,90)
			else if(Shadows==6)
				A.dir=turn(A.dir,-135)
			else if(Shadows==7)
				A.dir=turn(A.dir,135)
			else if(Shadows==8)
				A.dir=turn(A.dir,180)
			else
				A.dir=src.dir;
			walk(A,A.dir);
			Shadows--
			sleep(1)
		Shadows=0;src.Frozen=0;src.icon_state="";src.UsingNui=0
		spawn(90)
			for(var/obj/Nara/KageNui/A in src.shadowList)
				if(A.Owner==src)
					del(A)
	ForrbiddenShadowArtMassiveNuiOnslaught()
		if(src.ntarget)
			return
		src.Target()
		var/mob/M=src.target
		if(src.Shibari)
			src<<"You can't be in Kage Shibari to use this!";return
		else
			src.Frozen=1;
			var/Shadows=10
			var/SDir = usr.dir
			while(Shadows>0)
				var/i=5;//for the while loops;The while loop does is make the needles shot far out then swarm to the target
				//this gives the target time to run aswell as make it so the needles don't all fall together on one tile.
				src.icon_state="handseal";src.Frozen=1;src.UsingNui=1;
				src.ChakraDrain(8000);//Drain is this low since its called 10 times for total of 80k
				var/obj/Nara/KageNui/A=new();
				src.JutsuList+=A;A.Owner=src;A.shadowreach=10+src.ShadowReach;A.loc=src.loc;A.Move_Delay=0;src.shadowList.Add(A);
				if(Shadows==1 || Shadows==4)
					A.dir=SDir;
					while(i>0)
						step(A,A.dir);sleep(2);
				if(Shadows==2 || Shadows==7)
					A.dir=turn(SDir,45)
					while(i>0)
						step(A,A.dir);sleep(2);
				if(Shadows==3 || Shadows==8)
					A.dir=turn(SDir,-45)
					while(i>0)
						step(A,A.dir);sleep(2);
				if(Shadows==5 || Shadows==9)
					A.dir=turn(SDir,90)
					while(i>0)
						step(A,A.dir);sleep(2);
				if(Shadows==6 || Shadows==10)
					A.dir=turn(SDir,-90)
					while(i>0)
						step(A,A.dir);sleep(2);
				var/s = get_dist(A,M);s-=3
				if(s<=0) s=1
				spawn(1) A.KageNuiStrike(usr,s,M)
				Shadows--
				sleep(2)
			spawn(200)
				Shadows=0;src.Frozen=0;src.icon_state="";src.UsingNui=0
				for(var/obj/Nara/KageNui/A in src.shadowList)
					if(A.Owner==src)
						del(A)
obj/narashadow
	icon='Icons/Jutsus/ShadowS.dmi'
	icon_state="attack"
	var
		Owner
	New()
		..()
		spawn()
			while(src)
				for(var/mob/M in oview(1,src))
					var/mob/O=src.Owner
					if(M==O||M.ingat|M.intank|M.Kaiten|M.sphere)
						return
					var/damage=rand(M.maxhealth*0.07,M.maxhealth*0.10);M.SoundEngine('SFX/Slice.wav',10);M.DamageProc(damage,"Health",O)
					spawn()
						M.Bloody();M.Bloody();M.Bloody()
				sleep(10)
		spawn(30)
			del(src)
	North icon_state="attack"
	South icon_state="attack"
	West icon_state="attack"
	East icon_state="attack"
	SouthWest icon_state="attack"
	SouthEast icon_state="attack"
	NorthWest icon_state="attack"
	NorthEast icon_state="attack"