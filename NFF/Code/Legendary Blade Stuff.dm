obj/Jutsu/Evanesence/
	icon='Icons/Jutsus/EvanesenceTech.dmi'
	EvanesenceBlastParts
		layer = MOB_LAYER+2
		density = 1
		A
			icon_state="YW3,1"
			pixel_x = -32
			pixel_y = 64
		B
			icon_state="YW3,2"
			pixel_y = 64
		C
			icon_state="YW3,3"
			pixel_x = 32
			pixel_y = 64
		F
			icon_state="YW2,1"
			pixel_x = -32
			pixel_y = 32
		G
			icon_state="YW2,2"
			pixel_y = 32
		H
			icon_state="YW2,3"
			pixel_x=32
			pixel_y=32
		D
			icon_state="YW1,1"
			pixel_x=-32
		E
			icon_state="YW1,3"
			pixel_x=32
	EvanesenceBlast
		icon_state="YW1,2"
		layer = MOB_LAYER+2
		density = 1
		JutsuLevel=1
		var/nin=10
		Move()
			//var/prevloc=src.loc
			..()
			//var/mob/O=src.Owner
		New()
			..()
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/A;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/B;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/C;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/D;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/E;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/F;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/G;
			overlays+=/obj/Jutsu/Evanesence/EvanesenceBlastParts/H
			spawn(1)
				var/mob/O=src.Owner
				while(src)
					spawn(8)
						src.SoundEngine('SFX/WindSFX.wav',10)
					sleep(1)
					for(var/mob/M in oview(1,src))
						if(!M.Mogu)
							if(M.sphere)
								viewers()<<sound('SFX/Guard.wav',0);return
							var/damage=rand(M.maxhealth*0.07,M.maxhealth*0.11);damage=round(damage*1.5)
							if(O.Trait=="Old Powerful") damage+=(O.NinSkill*2)
							view(M) << "[M] was hit by a blast of chakra for [damage] damage!!"
							spawn()
								M.Bloody();M.Bloody();M.Bloody();M.Bloody()
							M.DamageProc(damage,"Health",O)
							step(M,src.dir)
						//	if(M.RaiArmor&&M.RaiArmor!=2)
						//		M.overlays-='Icons/Jutsus/RaiArmor.dmi';M.tempmix='Icons/Jutsus/ChakraAura.dmi';M.tempmix+=rgb(224,197,2);var/icon/Q=icon(M.tempmix);M.overlays-=Q;M.RaiArmor=0;M.Touei=0
			spawn(30)
				del(src)
		Del()
			for(var/mob/Q in view(2,src))
				if(Q!=src.Owner);
					Q.HitBack(15,Q.dir)
			..()
mob/proc
	EvanesenceBlastJutsu()
		src.ChakraDrain(15000)
		if(src.HandsSlipped) return
		var/obj/Jutsu/Evanesence/EvanesenceBlast/K=new();
		K.loc=src.loc;
		K.dir=src.dir;
		K.name="[src]";
		K.Owner=src
		K.Move_Delay=0
		walk(K,src.dir,K.Move_Delay)
		if(src.dir==WEST) K.pixel_y=-32
		if(src.dir==EAST) K.pixel_y=-32


mob/var/tmp/UsingKaitoInvisCuts=0
mob/proc/KaitoInvisCuts()
	var/KaitoInvisCutsTimer=0
	if(src.firing||src.knockedout||src.Frozen)
		return
	src.ChakraDrain(15000)
	src<<"Double Click a Location to unleash an invisible torrent of slashes!"
	src.UsingKaitoInvisCuts=1
	while(UsingKaitoInvisCuts==1)
		KaitoInvisCutsTimer++
		if(src.knockedout)
			src<<"You fall unconcious, losing the ability to unleash a torrent."
			src.UsingKaitoInvisCuts=0
		if(KaitoInvisCutsTimer>=15)
			src<<"You waited too long and the invisible torrent vanishes."
			src.UsingKaitoInvisCuts=0
			return
		src.ChakraDrain(10000)
		sleep(10)


mob/proc/KaitoExtend()
	if(src.firing)
		return
	else
		flick("Attack2",src);src<<"You're frozen while this is on. Press Z to end the jutsu early!"
		var/obj/Jutsu/Kaito/A=new();A.Owner=src;A.dir=src.dir;A.head=1;A.loc=src.loc
		walk(A,src.dir);src.icon_state="throw"
		while(src.icon_state=="throw")
			src.Frozen=1;sleep(1)
		src.Frozen=0;src.icon_state="running"
		for(var/obj/Jutsu/Kaito/O in world)
			if(O.Owner==src) del(O)

obj/Jutsu/KaitoCuts
	icon='Icons/Jutsus/EvanesenceTech.dmi'
	icon_state="State"
	density=1
	layer=MOB_LAYER+2
	New()
		..()
		spawn()
			while(src)
				sleep(1)
				spawn(1)
					for(var/mob/M in oview(2,src))
						if(istype(M,/mob/Bugs/))
							M.health=0
						M.DamageProc(15,"Health",usr,"invisible slashes","grey")
						spawn()
							M.Bloody()
							M.Bloody()
							viewers()<<sound('SFX/Slice.wav',0)

		spawn(300)
			del(src)
obj/Jutsu/Kaito	//Not seen, other than by user.
	density=1
	var/moved=0;var/head=0
	var/list/IMAGES=list()
//	New()
//		var/mob/O = src.Owner		//Only the owner sees it.
//		var/image/I=image('Icons/Jutsus/Sword.dmi',src,"KaitoTail",dir=src.dir)
//		if(head) I.icon_state="KaitoHead"
//		IMAGES+=I
//		O << I
	Move()
		if(src.moved)
			var/mob/O = src.Owner
			var/obj/Jutsu/Kaito/T = new();T.loc=src.loc;T.dir=src.dir;T.Owner=O
		else
			src.moved=1
		..()
	Bump(atom/A)
		if(istype(A,/mob))
			var/mob/M = A
			var/mob/O = src.Owner
			var/damage=((O.Focus/10)-(M.Buff/30))+rand(15,30)
			if(damage<1) damage=1
			damage=(damage*0.001)
			damage=M.maxhealth*damage
			M.DamageProc(damage,"Health",O)
			spawn() M.Bloody()
			spawn() M.Bloody()
			spawn() M.Bloody()
			spawn() src.SoundEngine('SFX/Slice.wav',100)
			M.StunAdd(20)
			walk(src,0)
			src.loc=M.loc
			spawn(50)
				O.icon_state=""
	Del()
		for(var/image/I in IMAGES)
			del(I)
		..()

obj/Jutsu
	ShibukiExplosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New(src.loc,Power)
			spawn() src.SoundEngine('SFX/Bang.wav',100)
			..()
			overlays+=/obj/Jutsu/Explosion/A;overlays+=/obj/Jutsu/Explosion/B;overlays+=/obj/Jutsu/Explosion/C;overlays+=/obj/Jutsu/Explosion/D
			overlays+=/obj/Jutsu/Explosion/E;overlays+=/obj/Jutsu/Explosion/F;overlays+=/obj/Jutsu/Explosion/G;overlays+=/obj/Jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					spawn() src.CreateSmoke()
					for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
						spawn() W.BurnWire()
				for(var/mob/M in oview(1,src))
					spawn()
						if(M!=src.Owner)
							if(M.SensoryRange>=5&&M.ByakuganMastery>1000&&!M.aflagged&&!M.Frozen&&M.FrozenBind==""&&prob(40))
								step_away(M,src)
							else if(M&&!M.UsingDomu&&!M.Kaiten&&!M.sphere&&!M.SusanooIn)
								var/damage=M.maxstamina*(0.20*(Power/20));var/damage2=M.maxhealth*(0.20*(Power/20)) // was oriinally /40
								if(M.Mogu)
									damage=damage/1.5;damage2=damage2/2
								if(M.PaperStyleDance)
									M.PaperStyleDance=0
							//	view(M)<<output("<font color=red>[M] has been hit by the explosion!</font>","Attack")
								var/Chakraz=M.ChakraArmor*0.01
								if(M)
									spawn()
										M.DamageProc(damage-(Chakraz*damage),"Stamina",src.Owner,"the explosion","yellow")
									spawn()
										M.DamageProc(damage2-(Chakraz*damage),"Health",src.Owner,"the explosion","red")
										M.HitBack(rand(5,8),rand(1,8))
				for(var/obj/O in oview(1,src))
					O.DamageProc(200)
			spawn(5)
				del(src)
	WoodShard
		icon='Icons/Jutsus/Mokuton.dmi'
		icon_state = "WoodShard"
		density=1
		New()
			..()
			spawn(45)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A;
				if(M.Kaiten||M.sphere)
					return
				if(M.Deflection)
					viewers(M)<<sound('SFX/SwordClash.wav',0);
					M.Deflection=0
					if(prob(1))
						M.DeflectionZ+=pick(0.1,0.3);
						if(M.DeflectionZ>5)
							M.DeflectionZ=5
					spawn()
						AttackEfx4(M.x,M.y,M.z,M.dir);
						AttackEfx4(src.x,src.y,src.z,src.dir)
					viewers(src)<<sound('SFX/SwordClash.wav',0);
					src.dir=turn(src.dir,45);
					walk(src,src.dir);
					flick("clang",src);
					sleep(5);
					return
				M.StunAdd(rand(15,25))
				var/obj/Jutsu/ShibukiExplosion/D=new(src.loc,5)
				D.Owner=src.Owner
					/*
				var/damage=rand(M.maxhealth*0.04,M.maxhealth*0.06)
				if(src.icon_state=="Ibara")
					damage+=damage
				M.DamageProc(damage,"Health",O)
				if(src.icon_state=="Ibara")
					view(M)<<output("[M] was hit by Bone Spears!([damage])","Attack")
				else
					view(M)<<output("[M] was hit by Bone Bullets!([damage])","Attack")
				spawn()
					M.SoundEngine('SFX/Slice.wav',10);M.Bloody()
				if(src.icon_state=="Ibara")
					src.loc=M.loc;
					M.StunAdd(10);
					src.layer=MOB_LAYER+1;
					src.icon_state="IbaraInside";
					walk(src,0)
				if(src.icon_state=="IbaraInside")
					sleep(11)
					*/
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

mob/proc/ShibukiExplode(Power)
	var/HIT=0
	var/list/TS=list()
	TS += get_step(src,src.dir)	//List of all affected turf
	if(src.dir==NORTH)	{TS += locate(src.x-1,src.y+1,src.z);TS += locate(src.x+1,src.y+1,src.z)}
	if(src.dir==SOUTH)	{TS += locate(src.x-1,src.y-1,src.z);TS += locate(src.x+1,src.y-1,src.z)}
	if(src.dir==EAST)	{TS += locate(src.x+1,src.y-1,src.z);TS += locate(src.x+1,src.y+1,src.z)}
	if(src.dir==WEST)	{TS += locate(src.x-1,src.y-1,src.z);TS += locate(src.x-1,src.y+1,src.z)}
	if(src.dir==NORTHEAST)	{TS += locate(src.x+1,src.y,src.z);TS += locate(src.x,src.y+1,src.z)}
	if(src.dir==NORTHWEST)	{TS += locate(src.x-1,src.y,src.z);TS += locate(src.x,src.y+1,src.z)}
	if(src.dir==SOUTHEAST)	{TS += locate(src.x+1,src.y,src.z);TS += locate(src.x,src.y-1,src.z)}
	if(src.dir==SOUTHWEST)	{TS += locate(src.x-1,src.y,src.z);TS += locate(src.x,src.y-1,src.z)}
	if(Power>20) Power=20	//Damage cap
	for(var/turf/T in TS)	//For the turfs affected
		if(locate(/mob) in T)//If you find a mob on that turf
			HIT=1
			var/obj/Jutsu/ShibukiExplosion/E = new(T,Power)	//the New() proc has the args, (src.loc,Power)
			E.Owner=src;src.StaminaDrain(50)	//Every hit takes stamina (May require buffing)

	if(HIT) return 1	//If hit, then the rest of the Attack verb is stopped.
	else return 0		//Otherwise continue to w.e

mob/proc/ShibukiExpDash()
	if(src.firing||src.Frozen)
		return
	src.stamina-=50
	var/turf/NewLoc=get_steps(src,src.dir,10)	//Get the final location
	for(var/turf/T in getline(src,NewLoc))		//The path to take.
		flick("zan",src)
		spawn()
			for(var/turf/M in range(1,T))		//Each step, all around go boom.
				var/HIT=0
				for(var/mob/L in M)
					if(L!=src) HIT=1			//If there's a mob, that's not the owner on that tile, boom
				for(var/obj/Jutsu/ShibukiExplosion/E in M)
					if(E.Owner==src) HIT=0		//If there's already an explosion there, cancle
				if(HIT)
					var/obj/Jutsu/ShibukiExplosion/E = new(M,10)
					E.Owner=src;src.StaminaDrain(100)	//Every hit takes stamina (May require buffing)
		if(!T.density && !src.Guarding)	//Now, if the spot your moving to is none dense
			src.loc=T;src.stamina-=rand(80,150)	//Move to it, and use stamina.
			src.dir=turn(src.dir,-45)		//Spin around.
		else
			return							//Wall? Stop
		sleep(1)							//Don't want him instantly popping up.
	src.loc=NewLoc
mob/var/tmp/BoomStickCD=0
mob/var/tmp/BoomStickDefenceCD=0
mob/var/BoomStickEXP=0
mob/proc/BoomStickExp()//BoomStaff shares same object as Shibuki, who the fuck cares why.jpg
	if(src.firing||src.Frozen||src.knockedout)
		return
	if(src.BoomStickCD)
		src<<"Wait. This is on Cooldown!"
		return
	spawn(30)
		src.BoomStickCD=0
//	world<<"Boom Stick Explosion called!"
	src.stamina-=25
	src.chakra-=100
	src.BoomStickCD=1
	if(prob(25))
		src.BoomStickEXP++
	var/turf/NewLoc=get_steps(src,src.dir,1)	//Get the final location
//	for(var/turf/P in oview(1,NewLoc))
	var/obj/Jutsu/ShibukiExplosion/E = new(NewLoc,20)
	E.Owner=src
	E.loc=NewLoc
	var/d=turn(usr.dir,90);
	var/obj/Jutsu/ShibukiExplosion/J = new((get_step(E,d)),15)
	J.Owner=src
	J.loc=get_step(E,d)
	var/p=turn(usr.dir,-90)
	var/obj/Jutsu/ShibukiExplosion/F = new((get_step(E,p)),15)
	F.Owner=src
	F.loc=get_step(E,p)
	if(src.BoomStickEXP>50)
		var/obj/Jutsu/ShibukiExplosion/X = new((get_step(F,WEST)),15)
		X.Owner=src

	/*
	for(var/turf/T in getline(src,NewLoc))		//The path to take.
		flick("zan",src)
		spawn()
			for(var/turf/M in range(1,T))		//Each step, all around go boom.
				var/HIT=0
				for(var/mob/L in M)
					if(L!=src) HIT=1			//If there's a mob, that's not the owner on that tile, boom
				for(var/obj/Jutsu/ShibukiExplosion/E in M)
					if(E.Owner==src) HIT=0		//If there's already an explosion there, cancle
				if(HIT)
					var/obj/Jutsu/ShibukiExplosion/E = new(M,10)
					E.Owner=src;src.StaminaDrain(100)	//Every hit takes stamina (May require buffing)
		if(!T.density && !src.Guarding)	//Now, if the spot your moving to is none dense
			src.loc=T;src.stamina-=rand(80,150)	//Move to it, and use stamina.
			src.dir=turn(src.dir,-45)		//Spin around.
		else
			return							//Wall? Stop
		sleep(1)							//Don't want him instantly popping up.
	src.loc=NewLoc
	*/

mob/proc/BoomStickDefence()
	if(src.firing||src.Frozen||src.knockedout)
		return
	if(src.BoomStickDefenceCD)
		src<<"Wait. This is on Cooldown!"
		return
	src.stamina-=50
	src.chakra-=rand(50,100)
	src.BoomStickDefenceCD=1
	spawn(100)
		src.BoomStickDefenceCD=0
	src.icon_state="Power"
	spawn(10)
		src.icon_state=""
	var/obj/Jutsu/WoodShard/A=new();
	A.loc=src.loc;
	A.Move_Delay=0;
	A.name="[src]";
	A.Owner=src;
	walk(A,NORTH);
//	A.icon_state="Ibara";
	var/obj/Jutsu/WoodShard/B=new();
	B.loc=src.loc;
	B.Move_Delay=0;
	B.name="[src]";
	B.Owner=src;
	walk(B,SOUTH);
//	B.icon_state="Ibara"
	var/obj/Jutsu/WoodShard/C=new();
	C.loc=src.loc;
	C.Move_Delay=0;
	C.name="[src]";
	C.Owner=src;walk(C,WEST);
//	C.icon_state="Ibara";
	var/obj/Jutsu/WoodShard/D=new();
	D.loc=src.loc;
	D.Move_Delay=0;
	D.name="[src]";
	D.Owner=src;
	walk(D,EAST);
//	D.icon_state="Ibara"
	var/obj/Jutsu/WoodShard/E=new();
	E.loc=src.loc;
	E.Move_Delay=0;
	E.name="[src]";
	E.Owner=src;
	walk(E,NORTHWEST);
//	E.icon_state="Ibara";
	var/obj/Jutsu/WoodShard/F=new();
	F.loc=src.loc;
	F.Move_Delay=0;
	F.name="[src]";
	F.Owner=src;
	walk(F,SOUTHEAST);
//	F.icon_state="Ibara"
	var/obj/Jutsu/WoodShard/G=new();
	G.loc=src.loc;
	G.Move_Delay=0;
	G.name="[src]";
	G.Owner=src;
	walk(G,SOUTHWEST);
//	G.icon_state="Ibara";
	var/obj/Jutsu/WoodShard/K=new();
	K.loc=src.loc;
	K.Move_Delay=0;
	K.name="[src]";
	K.Owner=src;
	walk(K,NORTHEAST);
//	K.icon_state="Ibara"

