mob/var
	Shibari=0
	caught=0
	kubi=0
	inKubi=0
	StruggleAgainstKubi=0
	UsingNui=0
	usingNSS = 0
	AttackNSS = 0
	ShadowAttackCD=0

mob/narashadow/verb/ShadowAttack()
	set category = "Attacks"
	set name="Shadow Sewing Attack"
	if(src.ShadowAttackCD==1)
		return
	else
		src.ShadowsAttackz()
		spawn(100)
			src.ShadowAttackCD=0
mob/proc/KubiAttack(damage,mob/attacker)
	if(src.inKubi)
		src<<output("Press space rapidly to break out!","Attack")
		while(src&&src.inKubi&&attacker.chakra>0&&src.health>0&&src.Struggle<src.StruggleAgainstKubi)
			src.overlays-='Icons/Jutsus/Nara.dmi';src.overlays+='Icons/Jutsus/Nara.dmi';var/A=src.maxhealth*damage;var/B=src.maxstamina*damage
			if(A>100)
				A=100
			if(B>1000)
				B=1000
			src.DamageProc(A,"Health",attacker);src.DamageProc(B,"Stamina",attacker);var/R=rand(1,5)
			if(R==3) viewers(src)<<output("[src] is choked by the neckbind!")
			attacker.chakra-=round(src.Mchakra*(damage/4));sleep(50)
		viewers(src)<<"[src] broke free of the neckbind!";src.inKubi=0;attacker.kubi=0
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
		src.dir=get_dir(src,M);step(src,src.dir);a--;sleep(2)
obj/Nara
	icon='Icons/Jutsus/Nara.dmi'
	var/Owner
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
			var/mob/O=src.Owner;var/mob/M=A
				if(M.Kaiten||M.sphere||M==O)
					return
				src.loc=M.loc;view(M)<<output("[M] was caught by Kage Shibari!)","Attack");M.FrozenBind="Shibari";M.caughtby="[O]";O.AwardMedal("Shadow'd")
				O.ShTarget+=A//Added
				LOL
					if(M)
						if(!O)
							del(src)
						if(prob(1))
							O.ShadowStrength+=0.1
							if(O.ShadowStrength>10)
								O.ShadowStrength=10
						var/ChakraDrain=(M.tai*(M.Impenetrable+1))-(O.gen*(O.ShadowStrength+1))
						if(ChakraDrain<10)
							ChakraDrain=10
						if(O.chakra<ChakraDrain&&O.Shibari)
							del(src)
						else
							O.chakra-=ChakraDrain;sleep(11);goto LOL
		Move()
			if(A.ShadowMove)
			 return
			if(src.dir==NORTH)
				src.pixel_y=-13;src.pixel_x=0
			if(src.dir==WEST)
				src.pixel_y=0;src.pixel_x=13
			if(src.dir==EAST)
				src.pixel_y=0;src.pixel_x=-13
			if(src.dir==SOUTH)
				src.pixel_y=13;src.pixel_x=0
			src.reach+=1;var/mob/O=src.Owner
			if(prob(1))
				O.ShadowReach+=0.1
				if(O.ShadowReach=>10)
					O.ShadowReach=10
			var/ChakraLoss=(O.Mchakra/((O.ShadowMastery+1)*50));O.chakra-=abs(ChakraLoss);var/LALA=src.shadowreach
			if(src.reach>LALA)
				O<<"Your shadow can't reach any further!";del(src)
				O.ShadowmEnd()

			var/prevloc=src.loc;var/prevdir=src.dir
			..()
			if(src.dir==NORTH)
				src.pixel_y=-13;src.pixel_x=0
			if(src.dir==WEST)
				src.pixel_y=0;src.pixel_x=13
			if(src.dir==EAST)
				src.pixel_y=0;src.pixel_x=-13
			if(src.dir==SOUTH)
				src.pixel_y=13;src.pixel_x=0
			var/obj/Nara/ShibariTrail/A=new(prevloc);A.icon='Icons/Jutsus/Nara.dmi';A.icon_state="trail"
			if(!src.firststep)
				src.firststep=1;A.icon_state="start";var/obj/Nara/ShibariTrail/B=new(prevloc);B.icon='Icons/Jutsus/Nara.dmi';B.icon_state="head";B.dir=src.dir;B.Owner=src.Owner
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
			for(var/mob/M in range(90,src))
				if(M&&M.caughtby=="[O]"&&M!=O)
					M.caughtby=null
					if(M.FrozenBind=="Shibari")
						M.FrozenBind=""
					M.inKubi=0;M<<output("<font color=blue>You have been freed from the Shibari technique!</font>","Attack")
					O.ShadowmEnd()//Added
					M.ShadowmEnd()//Added
			if(O)
				O.Shibari=0;O.firing=0;O.client.perspective=MOB_PERSPECTIVE;O.client.eye=O;O.controlled=null
				O.ShadowmEnd()
			for(var/obj/Nara/ShibariTrail/A in world)
				if(A.Owner==O)
					del(A)
			if(O.kubi)
				for(var/mob/M in world)
					if(M&&M.inKubi)
						M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");O<<output("[M] has been released from the neckbind!","Attack")
						M.ShadowEnd()
				for(var/obj/Nara/Shibari/S in world)
					if(S.Owner==O)
						del(S)
				O.kubi=0
			if(O.UsingNui)
				for(var/obj/Nara/KageNui/A in world)
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
			spawn(150)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				if(M.Kaiten||M.sphere)
					return
				if(src.Owner==M)
					src.loc=M.loc;return
				var/mob/O=src.Owner;var/damage=rand(M.maxhealth*0.02,M.maxhealth*0.05)
				M.DamageProc(damage,"Health",O);src.loc=M.loc;view(M)<<output("[M] was hit by Kage Nui!([damage])","Attack");src.loc=M.loc
				spawn() M.Bloody();M.Bloody();M.Bloody();viewers()<<sound('SFX/Slice.wav',0,0,1)

				spawn(50) del(src)
				if(M) M.Stun+=rand(1,2)
			if(istype(A,/turf/))
				var/turf/T=A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/O=A
				step_away(src,O)
		Move()
			var/mob/O=src.Owner
			..()
			var/prevloc=src.loc
			..()
			if(prob(1))
				O.ShadowStrength+=0.1
				if(O.ShadowStrength>10)
					O.ShadowStrength=10
			var/prevdir=src.dir;var/obj/Nara/Nuitrail/A=new(prevloc)
			if(prevdir==NORTH)
				A.pixel_y-=11
			if(prevdir==SOUTH)
				A.pixel_y+=11
			if(prevdir==EAST)
				A.pixel_x-=11
			if(prevdir==WEST)
				A.pixel_x+=11
			if(prevdir==NORTHEAST)
				A.pixel_y-=11;A.pixel_x-=11
			if(prevdir==NORTHWEST)
				A.pixel_y-=11;A.pixel_x+=11
			if(prevdir==SOUTHEAST)
				A.pixel_y+=11;A.pixel_x-=11
			if(prevdir==SOUTHWEST)
				A.pixel_y+=11;A.pixel_x+=11
			A.dir=prevdir;A.Owner=O
		Del()
			var/mob/O=src.Owner
			for(var/obj/Nara/Nuitrail/A in world)
				if(A.Owner==O)
					del(A)
			..()
obj/Nara/Nuitrail
	icon='Icons/Jutsus/Nara.dmi'
	density=0
	icon_state="nuitrail"
	kageshibari()
		if(src&&usr.Shibari)
			src<<"You retract your shadows."
			for(var/obj/Nara/Shibari/K in world)
				if(K.Owner==src)
					del(K)
			for(var/obj/Nara/KageNui/A in world)
				if(A.Owner==src)
					del(A)
			src.Shibari=0;
		else
			src.Handseals(1-src.HandsealSpeed)
			if(src.HandsSlipped) return
			var/obj/Nara/Shibari/K=new();K.Owner=src;K.loc=src.loc;K.Move_Delay=0;src.Shibari=1;src.controlled=K;src.firing=1;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
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
					del(K)
				sleep(11)
	KageMane()
		if(!src.Shibari)
			src<<"You need to be using Shadow Possession Jutsu!";return
		src<<"You enter Shadow Mimictry Jutsu. Every move you perform your opponent will now do too.";src.firing=0;src.InKageMane=1
		for(var/mob/M in world)
			if(M&&M.caughtby=="[src]"&&M!=src)
				if(M.FrozenBind=="Shibari")
					M.FrozenBind="Mane";M<<"They're binding your movement!"
		for(var/obj/Nara/Shibari/K in world)
			if(K.Owner==usr)
				del(K)
		for(var/obj/Nara/KageNui/A in world)
			if(A.Owner==src)
				del(A)
		while(src.InKageMane)
			src.chakra-=rand(10,20)
			sleep(11)
		for(var/mob/M in world)
			if(M&&M.caughtby=="[src]"&&M!=src)
				M.caughtby=null
				if(M.FrozenBind=="Mane")
					M.FrozenBind=""
	KageKubiShibaru()
		if(src.kubi)
			for(var/mob/M in world)
				if(M&&M.inKubi)
					M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");src<<output("[M] has been released from the neckbind!","Attack")
			for(var/obj/Nara/Shibari/S in world)
				if(S.Owner==usr)
					del(S)
			src.kubi=0;return
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		else
			src.kubi=1
			for(var/mob/M in range(40,usr))
				spawn()
					if(!M.knockedout&&M.FrozenBind=="Shibari"&&M.caughtby=="[src]")
						M.inKubi=1;M.StruggleAgainstKubi=rand(25,50)+rand(src.ShadowStrength*3,src.ShadowStrength*4);M.Struggle=0;M<<output("<font color=blue>You are being choked by [src]'s shadow bind!</font>","Attack");src<<output("[M] has been caught in the neckbind!","Attack");var/D=(src.ShadowStrength+1)*0.01;M.KubiAttack(D,src)
						while(M.inKubi)
							if(prob(1))
								src.ShadowStrength+=0.1
								if(src.ShadowStrength>10)
									src.ShadowStrength=10
							sleep(11)
	KageNuiI()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		else
			src.Frozen=1;var/Shadows=1
			if(src.ShadowMastery>=8)
				Shadows=2
			if(src.ShadowMastery>=12)
				Shadows=3
			if(src.ShadowMastery>=16)
				Shadows=4
			if(src.ShadowMastery>=20)
				Shadows=5
			var/obj/Shib
			for(var/obj/Nara/Shibari/Q in world)
				if(Q.Owner==usr)
					Shib=Q;break
			var/SDir = usr.dir
			while(Shadows>0)
				src.icon_state="handseal";src.Frozen=1;src.UsingNui=1;src.ChakraDrain(45000);var/obj/Nara/KageNui/A=new();A.Owner=src;A.shadowreach=10+src.ShadowReach;A.loc=Shib.loc;A.Move_Delay=0
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
				for(var/obj/Nara/KageNui/A in world)
					if(A.Owner==src)
						del(A)
	KageHara()
		if(src.usingNSS)
			if(!src.Shibari)
				src.firing=0
			src.underlays-='Icons/Jutsus/ShadowS.dmi';src.usingNSS=0;src.AttackNSS=0;src<<"You release your shadow control.";src.icon_state=""
			for(var/obj/narashadow/N in oview(1))
				del(N)
			src.verbs-=new/mob/narashadow/verb/ShadowAttack()
			return
		if(src.firing&&!src.Shibari||src.resting)
			return
		if(!src.usingNSS)
			src.Frozen2=1;src.firing=1;src.icon_state="handseal";src.underlays+='Icons/Jutsus/ShadowS.dmi';src.verbs+=new /mob/narashadow/verb/ShadowAttack;src.usingNSS=1;var/ChakraDrain=rand(5,10)/((src.ShadowMastery+1)*2)
			while(src.usingNSS)
				if(prob(1))
					src.ShadowStrength+=0.1
					if(src.ShadowStrength>10)
						src.ShadowStrength=10
				src.chakra-=ChakraDrain
				if(src.chakra<ChakraDrain)
					src.Frozen2=0;src.firing=0;src.underlays-='Icons/Jutsus/ShadowS.dmi';src.usingNSS=0;src.AttackNSS=0;src.verbs-=new /mob/narashadow/verb/ShadowAttack;return
				else
					sleep(11)
	ShadowsAttackz()
		if(src.AttackNSS==0)
			var/obj/narashadow/North/N=new();var/obj/narashadow/South/S=new();var/obj/narashadow/West/W=new();var/obj/narashadow/East/E=new();var/obj/narashadow/NorthWest/NW=new();var/obj/narashadow/NorthEast/NE=new();var/obj/narashadow/SouthWest/SW=new();var/obj/narashadow/SouthEast/SE=new();N.loc=locate(src.x,src.y+1,src.z);N.dir=NORTH;S.loc=locate(src.x,src.y-1,src.z);S.dir=SOUTH;W.loc=locate(src.x-1,src.y,src.z);W.dir=WEST;E.loc=locate(src.x+1,src.y,src.z);E.dir=EAST;NW.loc=locate(src.x-1,src.y+1,src.z);NW.dir=NORTHWEST;NE.loc=locate(src.x+1,src.y+1,src.z);NE.dir=NORTHEAST;SW.loc=locate(src.x-1,src.y-1,src.z);SW.dir=SOUTHWEST;SE.loc=locate(src.x+1,src.y-1,src.z);SE.dir=SOUTHEAST;N.Owner=src;S.Owner=src;W.Owner=src;E.Owner=src;NE.Owner=src;NW.Owner=src;SE.Owner=src;SW.Owner=src;src.usingS=1;src.chakra-=50;sleep(11);del(N);del(S);del(W);del(E);del(NW);del(SE);del(SW);del(NE);sleep(80);src.usingS=0
		else
			for(var/obj/narashadow/N in oview(3))
				if(N.Owner==src)
					del(N)
			sleep(35)
			src.usingS=0
obj/narashadow
	icon='Icons/Jutsus/ShadowS.dmi'
	icon_state="attack"
	var
		Owner
	New()
		..()
		spawn()
			for(var/mob/M in src.loc)
				var/mob/O=src.Owner
				if(M==O||M.ingat|M.intank|M.Kaiten|M.sphere)
					return
				var/damage=rand(M.maxhealth*0.04,M.maxhealth*0.07);M.SoundEngine('SFX/Slice.wav',10);M.DamageProc(damage,"Health",O)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
		spawn(30)
			del(src)
	North icon_state="n"
	South icon_state="s"
	West icon_state="w"
	East icon_state="e"
	SouthWest icon_state="sw"
	SouthEast icon_state="se"
	NorthWest icon_state="nw"
	NorthEast icon_state="ne"



				////////////////////////
				//////// Added /////////
				////////////////////////

mob
 var
 	Shadowed
 	ShadowMove
 	list/ShTarget
 verb
 	ShadowMove()
 	 if(!usr.ShadowMove)
 	  usr.ShadowMove=1
 	  O.client.perspective=MOB_PERSPECTIVE
 	  O.client.eye=O
 	  for(var/obj/Nara/Shibari/Si in world)
 	   if(Si.Owner==usr)
 	    del(Si)
 	  for(var/mob/M in usr.ShTar)
 	   M.Shadowed=1
 	 else
 	  usr.ShadowMove=0
 	  var/obj/Nara/Shibari/Shi = new(locate(usr.loc))
 	  Shi.Owner=usr
 	  /*Here you will have to check how the user connects to the 'Shibari' obj
 	  (Shibari specifically, and not Shibaritrail) inthe verb. After, you will have
 	  to make it so that the user connects to this obj, as is done when you first
 	  execute the jutsu, that is, Shadow Possession.*/
 	  M.Shadowed=0
 proc
	ShadowmEnd()
	 if(src.ShadowMove)
	  src.ShadowMove=0
	  src.ShTarget=null
	 if(src.Shadowed)
	  src.Shadowed=0

//and by extension it might be possible to select who one wants to bind in their shadow  ...but that's another story
client
 North()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=NORTH
   Sh.loc=locate(Sh.y+1,Sh.x,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=NORTH
     M.loc=locate(M.y+1,M.x,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=NORTH
     S.loc=locate(S.y+1,S.x,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=NORTH
     St.loc=locate(St.y+1,St.x,St.z)

 NorthWest()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=NORTHWEST
   Sh.loc=locate(Sh.y+1,Sh.x-1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=NORTHWEST
     M.loc=locate(M.y+1,M.x-1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=NORTHWEST
     S.loc=locate(S.y+1,S.x-1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=NORTHWEST
     St.loc=locate(St.y+1,St.x-1,St.z)
 NorthEast()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=NORTHEAST
   Sh.loc=locate(Sh.y+1,Sh.x+1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=NORTHEAST
     M.loc=locate(M.y+1,M.x+1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=NORTHEAST
     S.loc=locate(S.y+1,S.x+1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=NORTHEAST
     St.loc=locate(St.y+1,St.x+1,St.z)
 South()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=SOUTH
   Sh.loc=locate(Sh.y-1,Sh.x,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=SOUTH
     M.loc=locate(M.y-1,M.x,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=SOUTH
     S.loc=locate(S.y-1,S.x,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=SOUTH
     St.loc=locate(St.y-1,St.x,St.z)
 SouthWest()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=SOUTHWEST
   Sh.loc=locate(Sh.y-1,Sh.x-1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=SOUTHWEST
     M.loc=locate(M.y-1,M.x-1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=SOUTHWEST
     S.loc=locate(S.y-1,S.x-1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=SOUTHWEST
     St.loc=locate(St.y-1,St.x-1,St.z)
 SouthEast()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=SOUTHEAST
   Sh.loc=locate(Sh.y-1,Sh.x+1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=SOUTHEAST
     M.loc=locate(M.y-1,M.x+1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=SOUTHEAST
     S.loc=locate(S.y-1,S.x+1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=SOUTHEAST
     St.loc=locate(St.y-1,St.x+1,St.z)
 West()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=WEST
   Sh.loc=locate(Sh.y,Sh.x-1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=WEST
     M.loc=locate(M.y,M.x-1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=WEST
     S.loc=locate(S.y,S.x-1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=WEST
     St.loc=locate(St.y,St.x-1,St.z)
 East()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=EAST
   Sh.loc=locate(Sh.y,Sh.x+1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=EAST
     M.loc=locate(M.y,M.x+1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=EAST
     S.loc=locate(S.y,S.x+1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=EAST
     St.loc=locate(St.y,St.x+1,St.z)

//Summons
	Summoning_Jutsu_Joy
		name="Summoning(Joy)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Joy")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Joy",1,500)
	Summoning_Jutsu_Ene
		name="Summoning(Ene)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Ene")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Ene",1,500)
	Summoning_Jutsu_Nega
		name="Summoning(Nega)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Nega")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Nega",1,500)
	Summoning_Jutsu_Inf
		name="Summoning(Inf)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Inf")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Inf",1,500)
	Summoning_Jutsu_Darke
		name="Summoning(Darke)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Wolf Darke")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Darke",1,1000)
	Summoning_Jutsu_Griffin
		name="Summoning(Griffin)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Wolf Griffin")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Griffin",1,1000)
	Summoning_Jutsu_Zune
		name="Summoning(Zune)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Wolf Zune")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Zune",1,1000)
	Summoning_Jutsu_Zute
		name="Summoning(Zute)"
		icon_state="Summon"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Wolf Zute")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Zute",1,1000)
	Summoning_Jutsu_Coro
		name="Summoning(Coro)"
		icon_state="Summon"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Wolf Coro")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			src.CoroOn=1
			M.SummoningJutsu("Wolf Coro",3,2000)





	Summoning_Jutsu_Sapo
		name="Kuchiyose no Jutsu(Sapo Comum)"
		icon_state="Summon"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Sapo Comum")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"Você precisa estar em cima de um sangue para invocar!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Sapo Comum",3,1000)


	Summoning_Jutsu_Sapo_do_Monte
		name="Kuchiyose no Jutsu(Sapo do Monte)"
		icon_state="Summon"
		Deactivate(mob/M)
			src.DelayIt(350,M,"Nin")
			M.Unsummon("Sapo do Monte")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"Você precisa estar em cima de um sangue para invocar!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Sapo do Monte",3,2000)

	Summoning_Jutsu_Sapo_Medio
		name="Kuchiyose no Jutsu(Sapo Medio do Monte)"
		icon_state="Summon"
		Deactivate(mob/M)
			src.DelayIt(450,M,"Nin")
			M.Unsummon("Sapo Medio do Monte")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"Você precisa estar em cima de um sangue para invocar!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Sapo Medio do Monte",3,3000)

	Summoning_Jutsu_Sapo_de_Batalha
		name="Kuchiyose no Jutsu(Sapo de Batalha)"
		icon_state="Summon"
		Deactivate(mob/M)
			src.DelayIt(600,M,"Nin")
			M.Unsummon("Sapo de Batalha")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("O Jutsu Falhou.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"Você precisa estar em cima de um sangue para invocar!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Sapo de Batalha",3,4500)
/*

  Lines of interest are: 60,92,93,146,147,150,158,438

mob/var/tmp
	Shibari=0
	InKageMane=0
	caught=0
	caughtby=""
	kubi=0
	inKubi=0
	StruggleAgainstKubi=0
	UsingNui=0
	usingNSS = 0
	AttackNSS = 0
mob/narashadow/verb/ShadowAttack()
	set category = "Attacks"
	set name="Shadow Sewing Attack"
	src.ShadowsAttackz()
mob/proc/KubiAttack(damage,mob/attacker)
	if(src.inKubi)
		src<<output("Press space rapidly to break out!","Attack")
		while(src&&src.inKubi&&attacker.chakra>0&&src.health>0&&src.Struggle<src.StruggleAgainstKubi)
			src.overlays-='Icons/Jutsus/Nara.dmi';src.overlays+='Icons/Jutsus/Nara.dmi';var/A=src.maxhealth*damage;var/B=src.maxstamina*damage
			if(A>100)
				A=100
			if(B>1000)
				B=1000
			src.DamageProc(A,"Health",attacker);src.DamageProc(B,"Stamina",attacker);var/R=rand(1,5)
			if(R==3) viewers(src)<<output("[src] is choked by the neckbind!")
			attacker.chakra-=round(src.Mchakra*(damage/4));sleep(50)
		viewers(src)<<"[src] broke free of the neckbind!";src.inKubi=0;attacker.kubi=0
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
		src.dir=get_dir(src,M);step(src,src.dir);a--;sleep(2)
obj/Nara
	icon='Icons/Jutsus/Nara.dmi'
	var/Owner
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
				var/mob/O=src.Owner;var/mob/M=A
				if(M.Kaiten||M.sphere||M==O)
					return
				src.loc=M.loc;view(M)<<output("[M] was caught by Kage Shibari!)","Attack");M.FrozenBind="Shibari";M.caughtby="[O]";O.AwardMedal("Shadow'd")
				O.ShTarget+=A//Added
				LOL
					if(M)
						if(!O)
							del(src)
						if(prob(1))
							O.ShadowStrength+=0.1
							if(O.ShadowStrength>10)
								O.ShadowStrength=10
						var/ChakraDrain=(M.tai*(M.Impenetrable+1))-(O.gen*(O.ShadowStrength+1))
						if(ChakraDrain<10)
							ChakraDrain=10
						if(O.chakra<ChakraDrain&&O.Shibari)
							del(src)
						else
							O.chakra-=ChakraDrain;sleep(11);goto LOL
		Move()
			if(src.dir==NORTH)
				src.pixel_y=-13;src.pixel_x=0
			if(src.dir==WEST)
				src.pixel_y=0;src.pixel_x=13
			if(src.dir==EAST)
				src.pixel_y=0;src.pixel_x=-13
			if(src.dir==SOUTH)
				src.pixel_y=13;src.pixel_x=0
			src.reach+=1;var/mob/O=src.Owner
			if(prob(1))
				O.ShadowReach+=0.1
			var/ChakraLoss=(O.Mchakra/((O.ShadowMastery+1)*50));O.chakra-=abs(ChakraLoss);var/LALA=src.shadowreach
			if(src.reach>LALA)
				O<<"Your shadow can't reach any further!";del(src)

			var/prevloc=src.loc;var/prevdir=src.dir
			..()
			if(src.dir==NORTH)
				src.pixel_y=-13;src.pixel_x=0
			if(src.dir==WEST)
				src.pixel_y=0;src.pixel_x=13
			if(src.dir==EAST)
				src.pixel_y=0;src.pixel_x=-13
			if(src.dir==SOUTH)
				src.pixel_y=13;src.pixel_x=0
			var/obj/Nara/ShibariTrail/A=new(prevloc);A.icon='Icons/Jutsus/Nara.dmi';A.icon_state="trail"
			if(!src.firststep)
				src.firststep=1;A.icon_state="start";var/obj/Nara/ShibariTrail/B=new(prevloc);B.icon='Icons/Jutsus/Nara.dmi';B.icon_state="head";B.dir=src.dir;B.Owner=src.Owner
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
			for(var/mob/M in range(90,src))
				if(M&&M.caughtby=="[O]"&&M!=O)
					M.caughtby=null
					if(M.FrozenBind=="Shibari")
						M.FrozenBind=""
					M.inKubi=0;M<<output("<font color=blue>You have been freed from the Shibari technique!</font>","Attack")
					O.ShadowmEnd()//Added
					M.ShadowmEnd()//Added
			if(O)
				O.Shibari=0;O.firing=0;O.client.perspective=MOB_PERSPECTIVE;O.client.eye=O;O.controlled=null
			for(var/obj/Nara/ShibariTrail/A in world)
				if(A.Owner==O)
					del(A)
			if(O.kubi)
				for(var/mob/M in world)
					if(M&&M.inKubi)
						M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");O<<output("[M] has been released from the neckbind!","Attack")
				for(var/obj/Nara/Shibari/S in world)
					if(S.Owner==O)
						del(S)
				O.kubi=0
			if(O.UsingNui)
				for(var/obj/Nara/KageNui/A in world)
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
			spawn(150)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				if(M.Kaiten||M.sphere)
					return
				if(src.Owner==M)
					src.loc=M.loc;return
				var/mob/O=src.Owner;var/damage=rand(M.maxhealth*0.02,M.maxhealth*0.05)
				M.DamageProc(damage,"Health",O);src.loc=M.loc;view(M)<<output("[M] was hit by Kage Nui!([damage])","Attack");src.loc=M.loc
				spawn() M.Bloody();M.Bloody();M.Bloody();viewers()<<sound('SFX/Slice.wav',0,0,1)

				spawn(50) del(src)
				if(M) M.Stun+=rand(1,2)
			if(istype(A,/turf/))
				var/turf/T=A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				var/obj/O=A
				step_away(src,O)
		Move()
			var/mob/O=src.Owner
			..()
			var/prevloc=src.loc
			..()
			if(prob(1))
				O.ShadowStrength+=0.1
				if(O.ShadowStrength>10)
					O.ShadowStrength=10
			var/prevdir=src.dir;var/obj/Nara/Nuitrail/A=new(prevloc)
			if(prevdir==NORTH)
				A.pixel_y-=11
			if(prevdir==SOUTH)
				A.pixel_y+=11
			if(prevdir==EAST)
				A.pixel_x-=11
			if(prevdir==WEST)
				A.pixel_x+=11
			if(prevdir==NORTHEAST)
				A.pixel_y-=11;A.pixel_x-=11
			if(prevdir==NORTHWEST)
				A.pixel_y-=11;A.pixel_x+=11
			if(prevdir==SOUTHEAST)
				A.pixel_y+=11;A.pixel_x-=11
			if(prevdir==SOUTHWEST)
				A.pixel_y+=11;A.pixel_x+=11
			A.dir=prevdir;A.Owner=O
		Del()
			var/mob/O=src.Owner
			for(var/obj/Nara/Nuitrail/A in world)
				if(A.Owner==O)
					del(A)
			..()
obj/Nara/Nuitrail
	icon='Icons/Jutsus/Nara.dmi'
	density=0
	icon_state="nuitrail"
mob/proc
	kageshibari()
		if(src&&usr.Shibari)
			src<<"You retract your shadows."
			for(var/obj/Nara/Shibari/K in world)
				if(K.Owner==src)
					del(K)
			for(var/obj/Nara/KageNui/A in world)
				if(A.Owner==src)
					del(A)
			src.Shibari=0;
		else
			src.Handseals(1-src.HandsealSpeed)
			if(src.HandsSlipped) return
			var/obj/Nara/Shibari/K=new();K.Owner=src;K.loc=src.loc;K.Move_Delay=0;src.Shibari=1;src.controlled=K;src.firing=1;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
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
					del(K)
				sleep(11)
	KageMane()
		if(!src.Shibari)
			src<<"You need to be using Shadow Possession Jutsu!";return
		src<<"You enter Shadow Mimictry Jutsu. Every move you perform your opponent will now do too.";src.firing=0;src.InKageMane=1
		for(var/mob/M in world)
			if(M&&M.caughtby=="[src]"&&M!=src)
				if(M.FrozenBind=="Shibari")
					M.FrozenBind="Mane";M<<"They're binding your movement!"
		for(var/obj/Nara/Shibari/K in world)
			if(K.Owner==usr)
				del(K)
		for(var/obj/Nara/KageNui/A in world)
			if(A.Owner==src)
				del(A)
		while(src.InKageMane)
			src.chakra-=rand(10,20)
			sleep(11)
		for(var/mob/M in world)
			if(M&&M.caughtby=="[src]"&&M!=src)
				M.caughtby=null
				if(M.FrozenBind=="Mane")
					M.FrozenBind=""
	KageKubiShibaru()
		if(src.kubi)
			for(var/mob/M in world)
				if(M&&M.inKubi)
					M.inKubi=0;M<<output("<font color=blue>You have been freed from the Neckbind!</font>","Attack");src<<output("[M] has been released from the neckbind!","Attack")
			for(var/obj/Nara/Shibari/S in world)
				if(S.Owner==usr)
					del(S)
			src.kubi=0;return
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		else
			src.kubi=1
			for(var/mob/M in range(40,usr))
				spawn()
					if(!M.knockedout&&M.FrozenBind=="Shibari"&&M.caughtby=="[src]")
						M.inKubi=1;M.StruggleAgainstKubi=rand(25,50)+rand(src.ShadowStrength*3,src.ShadowStrength*4);M.Struggle=0;M<<output("<font color=blue>You are being choked by [src]'s shadow bind!</font>","Attack");src<<output("[M] has been caught in the neckbind!","Attack");var/D=(src.ShadowStrength+1)*0.01;M.KubiAttack(D,src)
						while(M.inKubi)
							if(prob(1))
								src.ShadowStrength+=0.1
								if(src.ShadowStrength>10)
									src.ShadowStrength=10
						sleep(20)
	KageNuiI()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		if(!src.Shibari)
			src<<"You need to be in Kage Shibari to use this!";return
		else
			src.Frozen=1;var/Shadows=1
			if(src.ShadowMastery>=8)
				Shadows=2
			if(src.ShadowMastery>=12)
				Shadows=3
			if(src.ShadowMastery>=16)
				Shadows=4
			if(src.ShadowMastery>=20)
				Shadows=5
			var/obj/Shib
			for(var/obj/Nara/Shibari/Q in world)
				if(Q.Owner==usr)
					Shib=Q;break
			var/SDir = usr.dir
			while(Shadows>0)
				src.icon_state="handseal";src.Frozen=1;src.UsingNui=1;src.ChakraDrain(45000);var/obj/Nara/KageNui/A=new();A.Owner=src;A.shadowreach=10+src.ShadowReach;A.loc=Shib.loc;A.Move_Delay=0
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
				for(var/obj/Nara/KageNui/A in world)
					if(A.Owner==src)
						del(A)
	KageHara()
		if(src.usingNSS)
			if(!src.Shibari)
				src.firing=0
			src.underlays-='Icons/Jutsus/ShadowS.dmi';src.usingNSS=0;src.AttackNSS=0;src<<"You release your shadow control.";src.icon_state=""
			for(var/obj/narashadow/N in oview(1))
				del(N)
			src.verbs-=new/mob/narashadow/verb/ShadowAttack()
			return
		if(src.firing&&!src.Shibari||src.resting)
			return
		if(!src.usingNSS)
			src.Frozen2=1;src.firing=1;src.icon_state="handseal";src.underlays+='Icons/Jutsus/ShadowS.dmi';src.verbs+=new /mob/narashadow/verb/ShadowAttack;src.usingNSS=1;var/ChakraDrain=rand(5,10)/((src.ShadowMastery+1)*2)
			while(src.usingNSS)
				if(prob(1))
					src.ShadowStrength+=0.1
					if(src.ShadowStrength>10)
						src.ShadowStrength=10
				src.chakra-=ChakraDrain
				if(src.chakra<ChakraDrain)
					src.Frozen2=0;src.firing=0;src.underlays-='Icons/Jutsus/ShadowS.dmi';src.usingNSS=0;src.AttackNSS=0;src.verbs-=new /mob/narashadow/verb/ShadowAttack;return
				else
					sleep(11)
	ShadowsAttackz()
		if(src.AttackNSS==0)
			var/obj/narashadow/North/N=new();var/obj/narashadow/South/S=new();var/obj/narashadow/West/W=new();var/obj/narashadow/East/E=new();var/obj/narashadow/NorthWest/NW=new();var/obj/narashadow/NorthEast/NE=new();var/obj/narashadow/SouthWest/SW=new();var/obj/narashadow/SouthEast/SE=new();N.loc=locate(src.x,src.y+1,src.z);N.dir=NORTH;S.loc=locate(src.x,src.y-1,src.z);S.dir=SOUTH;W.loc=locate(src.x-1,src.y,src.z);W.dir=WEST;E.loc=locate(src.x+1,src.y,src.z);E.dir=EAST;NW.loc=locate(src.x-1,src.y+1,src.z);NW.dir=NORTHWEST;NE.loc=locate(src.x+1,src.y+1,src.z);NE.dir=NORTHEAST;SW.loc=locate(src.x-1,src.y-1,src.z);SW.dir=SOUTHWEST;SE.loc=locate(src.x+1,src.y-1,src.z);SE.dir=SOUTHEAST;N.Owner=src;S.Owner=src;W.Owner=src;E.Owner=src;NE.Owner=src;NW.Owner=src;SE.Owner=src;SW.Owner=src;src.usingS=1;src.chakra-=50;sleep(11);del(N);del(S);del(W);del(E);del(NW);del(SE);del(SW);del(NE);sleep(80);src.usingS=0
		else
			for(var/obj/narashadow/N in oview(3))
				if(N.Owner==src)
					del(N)
			sleep(35);src.usingS=0
obj/narashadow
	icon='Icons/Jutsus/ShadowS.dmi'
	icon_state="attack"
	var
		Owner
	New()
		..()
		spawn()
			for(var/mob/M in src.loc)
				var/mob/O=src.Owner
				if(M==O||M.ingat|M.intank|M.Kaiten|M.sphere)
					return
				var/damage=rand(M.maxhealth*0.04,M.maxhealth*0.07);M.SoundEngine('SFX/Slice.wav',10);M.DamageProc(damage,"Health",O)
				spawn()
					M.Bloody();M.Bloody();M.Bloody()
		spawn(30)
			del(src)
	North icon_state="n"
	South icon_state="s"
	West icon_state="w"
	East icon_state="e"
	SouthWest icon_state="sw"
	SouthEast icon_state="se"
	NorthWest icon_state="nw"
	NorthEast icon_state="ne"

mob/var/Shadowed
mob/var/ShadowMove
mob/var/list/ShTarget

mob/verb/ShadowMove()
	if(!usr.ShadowMove)
		usr.ShadowMove=1
		usr.client.perspective=MOB_PERSPECTIVE
		usr.client.eye=usr
		for(var/obj/Nara/Shibari/Si in world)
			if(Si.Owner==usr)
				del(Si)
				for(var/mob/M in usr.ShTarget)
					M.Shadowed=1
			else
				usr.ShadowMove=0
				var/obj/Nara/Shibari/Shi = new(locate(usr.loc))
				Shi.Owner=usr
				for(var/mob/M in usr.ShTarget)
					M.Shadowed=0
 	  /*Here you will have to check how the user connects to the 'Shibari' obj
 	  (Shibari specifically, and not Shibaritrail) inthe verb. After, you will have
 	  to make it so that the user connects to this obj, as is done when you first
 	  execute the jutsu, that is, Shadow Possession.*/


mob/proc/ShadowmEnd()
	if(src.ShadowMove)
		src.ShadowMove=0
		src.ShTarget=null
	if(src.Shadowed)
		src.Shadowed=0

//and by extension it might be possible to select who one wants to bind in their shadow  ...but that's another story
client
	North()
		var/mob/Sh=mob
		if(Sh.ShadowMove)
			Sh.dir=NORTH
			Sh.loc=locate(Sh.y+1,Sh.x,Sh.z)
		for(var/mob/M in view(Sh))
			if(M in Sh.ShTarget)
				M.dir=NORTH
				M.loc=locate(M.y+1,M.x,M.z)
		for(var/obj/Nara/Shibari/S in view(Sh))
			if(S.Owner==Sh)
				S.dir=NORTH
				S.loc=locate(S.y+1,S.x,S.z)
		for(var/obj/Nara/ShibariTrail/St in view(Sh))
			if(St.Owner==Sh)
				St.dir=NORTH
				St.loc=locate(St.y+1,St.x,St.z)

 /*NorthWest()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=NORTHWEST
   Sh.loc=locate(Sh.y+1,Sh.x-1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=NORTHWEST
     M.loc=locate(M.y+1,M.x-1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=NORTHWEST
     S.loc=locate(S.y+1,S.x-1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=NORTHWEST
     St.loc=locate(St.y+1,St.x-1,St.z)
 NorthEast()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=NORTHEAST
   Sh.loc=locate(Sh.y+1,Sh.x+1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=NORTHEAST
     M.loc=locate(M.y+1,M.x+1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=NORTHEAST
     S.loc=locate(S.y+1,S.x+1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=NORTHEAST
     St.loc=locate(St.y+1,St.x+1,St.z)*/
 South()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=SOUTH
   Sh.loc=locate(Sh.y-1,Sh.x,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=SOUTH
     M.loc=locate(M.y-1,M.x,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=SOUTH
     S.loc=locate(S.y-1,S.x,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=SOUTH
     St.loc=locate(St.y-1,St.x,St.z)
/* SouthWest()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=SOUTHWEST
   Sh.loc=locate(Sh.y-1,Sh.x-1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=SOUTHWEST
     M.loc=locate(M.y-1,M.x-1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=SOUTHWEST
     S.loc=locate(S.y-1,S.x-1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=SOUTHWEST
     St.loc=locate(St.y-1,St.x-1,St.z)*/
 West()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=WEST
   Sh.loc=locate(Sh.y,Sh.x-1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=WEST
     M.loc=locate(M.y,M.x-1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=WEST
     S.loc=locate(S.y,S.x-1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=WEST
     St.loc=locate(St.y,St.x-1,St.z)
 East()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=EAST
   Sh.loc=locate(Sh.y,Sh.x+1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=EAST
     M.loc=locate(M.y,M.x+1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=EAST
     S.loc=locate(S.y,S.x+1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=EAST
     St.loc=locate(St.y,St.x+1,St.z)
 /*SouthEast()
  var/mob/Sh=mob
  if(Sh.ShadowMove)
   Sh.dir=SOUTHEAST
   Sh.loc=locate(Sh.y-1,Sh.x+1,Sh.z)
   for(var/mob/M in view(Sh))
    if(M in Sh.ShTarget)
     M.dir=SOUTHEAST
     M.loc=locate(M.y-1,M.x+1,M.z)
   for(var/obj/Nara/Shibari/S in view(Sh))
    if(S.Owner==Sh)
     S.dir=SOUTHEAST
     S.loc=locate(S.y-1,S.x+1,S.z)
   for(var/obj/Nara/ShibariTrail/St in view(Sh))
    if(St.Owner==Sh)
     St.dir=SOUTHEAST
     St.loc=locate(St.y-1,St.x+1,St.z)*/
*/