
///////////////////////////////////////////////////////
//Henge No Jutsu..Not Done yet
//////////////////////////



mob/var/tmp/PlayingDead=0

mob/proc/FalseDeath(Uses)
	if(src.knockedout && (Uses<500 || src.NinjutsuKnowledge<1000))
		return //Can't do this! Don't have the req!
	else
		src.PlayingDead = 1
		if(Uses >= 150)
			for(var/mob/XXC in range(10,src))
				if(src.name in XXC.namesknown)
					XXC<<"[src] has been knocked out!"
				else
					XXC<<"[src.Village] Ninja has been knocked out!"
		if(src.knockedout && Uses>=500 && src.NinjutsuKnowledge>=1000)
			src.PlayingDead=2
		while(src.PlayingDead)
			if(src.InGenjutsu=="Blazing Burn")
				if(!prob((src.Focus+Uses)/10))
					src.PlayingDead=0
					return
			if(src.Dead)
				src.PlayingDead=0
				return
			if(src.knockedout)
				if(Uses<500 || src.NinjutsuKnowledge<1000)
					src.PlayingDead=0
				if(Uses>=500 && src.NinjutsuKnowledge>=1000)
					src.PlayingDead=2
			sleep(10)
mob/var/tmp/AuraOn=1
mob/var/tmp/SageModeTime=0
mob/proc/ToggleSageAura()
	if(src.SageMode!="Rikudou")
		src<<"You can't toggle the aura if your Sage Mode isn't active."
		return
	else if(src.AuraOn)
		src.AuraOn=0;src.overlays-='SageModeAura.dmi'
		src<<"You stop showcasing your Sage Chakra."
	else
		src.AuraOn=1;src.overlays+='SageModeAura.dmi'
		src<<"You intensify your Sage Chakra, creating a glowing aura around you."
mob/proc/RikudouSageMode(TimeLimit=15,Length=900)
	if(src.knockedout)
		return
	var/UsedBijuu=0
	src.icon_state="handseal"
	src<<"You begin to concentrate for Sage Mode! Don't move at all!"
	if(TimeLimit>0)
		src<<"You have [TimeLimit] seconds to remain meditating."
	if(src.TailState>0)
		src<<"You begin to quell and control the power of the bijuu within you..."
		src.TailState=0;UsedBijuu=1
	var/A=TimeLimit
	while(A>1)
		src.chakra-=10
		if(src.icon_state!="handseal")
			src<<"You stop concentrating!";A=0;return
		A--
		sleep(11)
	src.icon_state=""
	src.SageMode="Rikudou"
	//if(src.SageMode=="Monkey")
	src.overlays+='SageModeCloak.dmi'
	src.overlays+='SageModeAura.dmi'
	src.AuraOn=1
	src.icon_state="power"
	sleep(4)
	src.icon_state=""
	src<<"You reach your Sage Mode! In this mode your natural abilities are drastically increased."
	src<<"Your body will heal itself, so long as you have chakra reserves remaining and your chakra will refill itself from your reservoir."
	src<<"It'll last for up to [Length/60] minutes! The time goes down the more you require healing from natural energy. The transformation will also end if you run out of chakra reservoir."
	src.SageModeTime=Length
	if(!UsedBijuu)
		src.chakra=src.MaxChakraPool*3
		src<<"You feel your chakra swell up with enormous power."
		src.nin=src.Mnin*2.5
		src.gen=src.Mgen*1.3
		src.tai=src.Mtai*2.5
	else
		src.SageModeTime/=2
		src.ChakraPool+=src.chakra
		src.chakra=src.MaxChakraPool*3
		src<<"You store your stored up bijuu chakra within your personal reservoir and draw on your sage chakra."
		src.nin=src.Mnin*3
		src.gen=src.Mgen*2
		src.tai=src.Mtai*3
	while(src.SageMode=="Rikudou"&&SageModeTime&&src.ChakraPool>0&&!src.knockedout&&!src.Dead)
		if(src.health<src.maxhealth)
			src.health+=65;src.ChakraPool-=90
			src.SageModeTime-=1
		if(src.stamina<src.maxstamina)
			src.stamina+=(src.maxstamina/33);src.ChakraPool-=90
			src.SageModeTime-=1
		if(src.chakra<1000)
			src.chakra+=200;src.ChakraPool-=100
		if(!UsedBijuu)
			sleep(7)
		sleep(4)

	src<<"Your Sage Mode deactivates."
	src.deathcount++
	if(src.stamina>src.maxstamina)
		src.stamina=src.maxstamina
	if(src.chakra>src.Mchakra)
		src.chakra=src.Mchakra
	src.Mchakra-=100   //trollface.jpg
	src.overlays-='SageModeCloak.dmi'
	src.overlays-='SageModeAura.dmi'
	src<<"You feel tired..."
	src.AuraOn=0
	src.nin=src.Mnin
	src.gen=src.Mgen
	src.tai=src.Mtai
	if(src.chakra>src.Mchakra)
		src.chakra=src.Mchakra
	src.SageMode=""


mob/var/tmp/InHenge=0
mob/var/list/Overlays
mob/proc/HengeJutsu()
	if(src.InHenge)
		var/obj/SmokeCloud/S=new()
		S.loc=locate(src.x,src.y,src.z)
		src.overlays=null
		src.icon=src.Oicon
		src.overlays+=src.hair
		src.overlays+=usr.Overlays
		src.firing=0
		src.name=src.savedname
		src.InHenge=0
		if(src.HengeVillage)
			return
	//		src.Village=src.SavedHengeVillage
	//		src.HengeVillage="";src.SavedHengeVillage=""
		return
	if(src.firing|src.Kaiten|src.resting|src.inso)
		return
	else
		var/JutsuCost=50
		if(src.chakra<=JutsuCost)
			src<<"Not enough chakra!";return
		else
			if(src.target)
				var/mob/M=src.target
				if(M.CNNPC||istype(M,/mob/Clones/)||M.Kawarimi||M.invisibility<1)
					src<<"Sorry you can't transform into that!";return
				src.Handseals(5-src.HandsealSpeed)
				if(src.HandsSlipped) return
				src.chakra-=JutsuCost
				var/obj/SmokeCloud/S=new()
				S.loc=locate(src.x,src.y,src.z)
				src.Oicon=src.icon
				src.savedname=src.name
				src.name=M.name
				src.firing = 0
				src.Overlays=src.overlays.Copy()
				src.overlays=null
				src.icon=M.icon
				src.overlays+=M.overlays
				src.InHenge=1
				src.mouse_over_pointer=M.mouse_over_pointer
				return
			else if(src.SavedHengeIcon)
				src.Handseals(35-src.HandsealSpeed)
				if(src.HandsSlipped) return
				src.chakra-=JutsuCost
				var/obj/SmokeCloud/S=new()
				S.loc=locate(src.x,src.y,src.z)
				src.Oicon=src.icon
				src.savedname=src.name
				src.name=src.SavedHengeName
				src.firing = 0
				src.Overlays=src.overlays.Copy()
				src.overlays=null
				src.icon=src.SavedHengeIcon
				if(src.HengeVillage)
					src.Village=src.HengeVillage
				src.icon_state=src.SavedHengeIconState
				src.overlays+=src.SavedHengeOverlays
				src.InHenge=1
			else
				src<<"You need a target!";return
				/*
				Shushagan no Jutsu (Vanishing Facial Copy Technique)
				Name: Shushagan no Jutsu, ?????, literally "Vanishing Facial Copy Technique"
				Type: B-rank, Supplementary, Short range (0-5m)
				Users: Orochimaru
				*/
///////////////////////////////////////////////////////
//Kawarimi No Jutsu//Redone
//////////////////////////
mob/var/tmp/Kawarimi=0
mob/proc/Kawa(Number)
	set background = 1
	if(Number<30||Number==null)
		Number=30
	if(src.firing||usr.Kaiten)
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	src.ChakraDrain(2000)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src<<"You've sucessfully used Kawarimi no Jutsu!"
	src.firing=1
	sleep(1);src.move=1
	src.Kawarimi=1
	spawn(50)
		while(src.Kawarimi)
			if(src.invisibility<=1)
				src.Kawarimi=0
			sleep(50)
	var/mob/Klog/L=new/mob/Klog
	if(Number>300)
		L.Controllable=1
	L.Age=0;L.maxstamina=1;L.Owner=src;L.name=src.name;L.icon=src.icon;L.dir=src.dir;L.overlays=src.overlays;L.loc=locate(src.x,src.y,src.z)
	walk(L,0)
	spawn(Number)
		if(L)
			L.Death(Number)
	if(!src.ButterflyDance)
		for(var/mob/M in range(15,src))
			if(M&&src==M.target)
				if(Number>100&&M.Focus<Number)
					M.target=L
					if(M&&M.client)
						for(var/image/x in M.client.images)
							if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
								del(x)
						var/image/I = image('Icons/target1.dmi',L)
						M<<I
				else
					M.target=null
	src.invisibility=50
	var/image/QQ = image('Icons/target1.dmi',src,"Number2")
	src<<QQ
	if(Number<2000)
		sleep(52)
		if(src.invisibility>1)
			src.invisibility=1
			src.firing=0
		del(QQ)
	else
		src.invisibility=90
		while(src.invisibility>1)
			src.chakra-=10
			sleep(5)
		del(QQ)
	src.firing=0//Added 3/27/2013
mob/proc/Kawa2(Number)
	set background = 1
	if(Number<30||Number==null)
		Number=30
	if(src.firing||usr.Kaiten)
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	/*if(!locate(/obj/ExplodingTag in usr.contents))
		for(var/obj/ExplodingTag/O in usr.contents)
			O.ammount-=1*/
	src.ChakraDrain(2000)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src<<"You've sucessfully used Kawarimi no Jutsu!"
	src.Kawarimi=1
	spawn(50)
		while(src.Kawarimi)
			if(src.invisibility<=1)
				src.Kawarimi=0
			sleep(50)
	var/mob/Klog2/L=new/mob/Klog2
	if(Number>300)
		L.Controllable=1
	if(!src.ButterflyDance)
		for(var/mob/M in range(15,src))
			if(M&&src==M.target)
				if(Number>100&&M.Focus<Number)
					M.target=L
					for(var/image/x in M.client.images)
						if(M&&x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
							del(x)
					var/image/I = image('Icons/target1.dmi',L)
					M<<I
				else
					M.target=null
	src.firing=1
	sleep(1);src.move=1
	L.Age=0;L.maxstamina=1;L.Owner=src;L.name=src.name;L.icon=src.icon;L.dir=src.dir;L.overlays=src.overlays;L.loc=locate(src.x,src.y,src.z)
	walk(L,0)
	spawn(52)
		if(L)
			L.Death(src,Number)
	src.invisibility=50;sleep(52);src.invisibility=1;src.firing=0;src.firing=0
	/*else
		src<<"You don't have any exploding tags. You can't use this jutsu.";return*/
mob/Klog
	name = "Log"
	icon = 'Icons/Jutsus/NarutoStuff.dmi'
	icon_state= "Log"
	health=10
	var/Controllable=0
	Death(mob/M,TBD)
		spawn(1)
			if(TBD==null) TBD=1000
			sleep(TBD/10)
			src.overlays=null;src.icon="NarutoStuff.dmi";src.icon_state="Log";var/obj/SmokeCloud/S = new /obj/SmokeCloud;S.loc=locate(src.x,src.y,src.z)
			sleep(15)
			del(src)
		..()
mob/Klog2
	name = "Log"
	icon = 'Icons/Jutsus/NarutoStuff.dmi'
	icon_state= "Exploding Log"
	health=10
	var/Controllable=0
	Death(mob/M)
		spawn(1)
			src.overlays=null;src.icon="NarutoStuff.dmi";src.icon_state="Exploding Log";var/obj/SmokeCloud/S = new /obj/SmokeCloud;S.loc=locate(src.x,src.y,src.z)
			sleep(5)
			var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=src.Owner;del(src)
		..()
///////////////////////////////////////////////////////
//Kirigakure No Jutsu..Redone
//////////////////////////
mob/var/tmp/KirigakureOn=0
obj/Jutsu/kriga
	icon = 'Icons/Jutsus/mist.dmi'//dont have a base icon so cant make weights icon!lol
	icon_state="less"
	layer=999999999999
	luminosity=0
	mouse_opacity = 0
	opacity = 1
//	New()
//		..()
//		spawn(2400)
//			del(src)
mob/proc/Kirigakure()
	if(src.firing) // If the mob's firing var is one...
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	src.ChakraDrain(25000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.KirigakureOn=1
	for(var/turf/T in view(20))//was Originally 30
		spawn(rand(1,15))
			var/obj/Jutsu/kriga/S=new()
			S.Owner=src;S.loc=T
	view()<<"[src] creates a shroud of mist!"
	while(src.KirigakureOn)
		src.ChakraDrain(6000)
		if(src.chakra<src.Mchakra*0.35)
			src<<"You release the mist."
			for(var/obj/Jutsu/kriga/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
						S2.loc = null
						del(S2)
			src.KirigakureOn=0
		sleep(25)

mob/proc/SilentKilling()
	src.StaminaDrain(250)
	var/X=rand(1,100)
	var/damage=100
	for(var/mob/M in get_step(src,src.dir))
		if(M.dir==src.dir)
			if((X>90&&(src.Focus>M.Focus*1.2)||src.key=="XXSharingan123XX"||(src.BloodLust&&prob(50))))
				M.CBleeding=1;
				M<< "[src.name] hit a vital spot and you begin to bleed furiously!"
				damage=1500
				M.deathcount+=3.5
				src.StaminaDrain(250)
			if(X>85)
				damage=1000;
				M.deathcount+=1;
			else if(X>40)
				damage=rand(200,400)
				M.deathcount+=0.35
			else if(X<=80&&X>=20)
				damage=550
				if(prob(40))
					M.deathcount+=0.5
			else if(X<20&&(src.Focus<M.Focus&&prob(30)))
				src<< "You missed the target."
				M<< "You manage to dodge [src.name] assassination atempt."
			flick("weaponslash",src)
			M.Bloody()
			M.Bloody()
			M.DamageProc(damage,"Health",src)
			src<< "You chop [M.name] for [damage] Vitality."
	   	 //	M<<"[src.name] chops at a vital spot for [damage] Vitality"
		else
			src<< "You missed."

///////////////////////////////////////////////////////
//Kiriame No Jutsu..Redone
//////////////////////////
mob/var/tmp/KiriameOn=0
mob/var/tmp/RavelOn=0
mob/var/tmp/PoisonRainOn=0
obj/Jutsu/PoisoningRain
	icon = 'Map/Turfs/Landscapes.dmi'
	icon_state = "poison"
	layer = FLY_LAYER+3
	mouse_opacity=0
	New()
		..()
		spawn()
			while(src)
				for(var/mob/M in src)
					sleep(2)
					if(M==src.Owner)
						break
					if(M.client&&!M.knockedout)
						M.health-=rand(25,50)
						M.stamina-=rand(50,100)
		spawn(600)
			del(src)
obj/Jutsu/Ravel
	icon = 'Map/Turfs/Landscapes.dmi'
	icon_state = "rain"
	layer = FLY_LAYER+3
	mouse_opacity = 0
mob/proc/PoisoningRain()
	if(src.firing) // If the mob's firing var is one...
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	src.ChakraDrain(15000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/turf/T in oview(5,src))
		var/obj/Jutsu/PoisoningRain/S=new();S.Owner=src;S.loc=T
	view()<<"[src] creates a poisoning rain!"
	src<<"Maintain the handsign to keep the Rain pouring!"
	src.PoisonRainOn=1
	src.icon_state="handseal"
	while(src.PoisonRainOn&&src.icon_state=="handseal")
		src.ChakraDrain(8000)
		if(src.chakra<src.Mchakra*0.01)
			src<<"You release the Rain."
			for(var/obj/Jutsu/PoisoningRain/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
			//			S2.loc = null //Just to make it easy on the the viewer.. also mist doesn't just poof..
						del(S2)//Added the Del(S2) on 1/31/2013
		if(src.knockedout)
			src<<"You're unable to hold up the rain while unconcious....";
			src.PoisonRainOn=0
			for(var/obj/Jutsu/PoisoningRain/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
			//			S2.loc = null
						del(S2)//Added the Del(S2) on 1/31/2013
			src.PoisonRainOn=0
		sleep(11)
	spawn(100)
		for(var/obj/Jutsu/PoisoningRain/S3 in world)
			if(S3.Owner==src)
				spawn(rand(1,50))
		//			S3.loc = null //Just to make it easy on the the viewer.. also mist doesn't just poof..
					del(S3)//Added the Del(S3) on 1/31/2013
mob/proc/RavelingRain()
	if(src.firing) // If the mob's firing var is one...
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	src.ChakraDrain(10000)
	src.Handseals(35-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/turf/T in oview(round(src.ChakraC/3)))
		var/obj/Jutsu/Ravel/S=new();
		S.Owner=src;
		S.loc=T
	oview()<<"[src] creates a light rain!"
	src<<"Every 10 seconds this rain will alert you to any Ninja that have been drenched by the rain!"
	src.RavelOn=1
	var/list/Found=list()
	var/Time=0
	while(src.RavelOn)
		if(Time%10==0)
			var/i
			src<<"These people have been drenched by your rain."
			for(i=1,i<=Found.len,i++)
				var/p=Found[i]
				src<<"[p]"
		for(var/obj/Jutsu/Ravel/S in oview(round(src.ChakraC/3)))
			if(S.Owner!=src)
				break
			for(var/mob/M in Found)
				if(!(locate(M in S)))
					Found-=M
			for(var/mob/M in S)
				if(M.client)
					if(!(locate(M in Found)))
						Found+=M
		src.ChakraDrain(10000)
		if(src.chakra<src.Mchakra*0.01)
			src<<"You release the Rain."
			for(var/obj/Jutsu/Ravel/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
			//			S2.loc = null //Just to make it easy on the the viewer.. also mist doesn't just poof..
						del(S2)//Added the Del(S2) on 1/31/2013
		if(src.knockedout)
			src<<"You're unable to hold up the rain while unconcious....";
			src.RavelOn=0
			for(var/obj/Jutsu/Ravel/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
			//			S2.loc = null
						del(S2)//Added the Del(S2) on 1/31/2013
			src.RavelOn=0
		sleep(11)
obj/Jutsu/Kiriame
	icon = 'Map/Turfs/Landscapes.dmi'
	icon_state = "rain"
	layer = FLY_LAYER+3
	mouse_opacity = 0
mob/proc/Kiriame()
	if(src.firing) // If the mob's firing var is one...
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return

	src.ChakraDrain(7000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/turf/T in oview(round(src.ChakraC/5)))
		var/obj/Jutsu/Kiriame/S=new();S.Owner=src;S.loc=T
	view()<<"[src] creates a draining rain!"
	src.KiriameOn=1
	while(src.KiriameOn)
		src.ChakraDrain(8000)
		if(src.chakra<src.Mchakra*0.01)
			src<<"You release the Rain."
			for(var/obj/Jutsu/Kiriame/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
			//			S2.loc = null //Just to make it easy on the the viewer.. also mist doesn't just poof..
						del(S2)//Added the Del(S2) on 1/31/2013
		if(src.knockedout)
			src<<"You're unable to hold up the rain while unconcious....";
			src.KiriameOn=0
			for(var/obj/Jutsu/Kiriame/S2 in world)
				if(S2.Owner==src)
					spawn(rand(1,50))
			//			S2.loc = null
						del(S2)//Added the Del(S2) on 1/31/2013
			src.KiriameOn=0
		sleep(11)
///////////////////////////////////////////////////////
//Zankuuha
//////////////////////////
obj/Jutsu/Zankuuha
	icon='Icons/Jutsus/NarutoStuff.dmi'
	icon_state="Zankuuha"
	density=1
	New()
		..()
		spawn(45)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M.Kaiten||M.sphere)
				return
			var/damage=1000
			M.stamina-=damage/M.Endurance
			step(M,src.dir);sleep(1);step(M,src.dir);M.Death(src.Owner)
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			del(src)
mob/var/tmp/ZankuuhaOn=0
///////////////////////////////////////////////////////////////////////////////////////////////
//C Rank Ninjutsu
/////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////
//Shushin No Jutsu..Redone
//////////////////////////
mob/var/tmp/useshushin=0
mob/var/tmp/shunshin=0
mob/proc/ShushinnoJutsu(Uses)
	if(src.hyoushou||src.caught||src.knockedout||src.Stun>=1||src.Frozen||src.Status=="Asleep"||src.FrozenBind!=""||src.Kumosenkyuu||src.Shibari||src.CastingGenjutsu||src.client.eye!=src)
		return
	if(src.shunshin||!src.cantele||src.useshushin)
		src<<"You need to wait!";return
	else
		if(src.Trait3!="Unyielding")
			src.ChakraDrain(50)
		src.shunshin=1
		;src<<"Double click the area you wish to move quickly to!"
		sleep(11)
		return
///////////////////////////////////////////////////////
//Sanzengarasu no Jutsu - Scattering One Thousand Crows Technique..Redone
//////////////////////////
mob/var/tmp/usemurderofcrows=0
mob/proc/MurderofCrows()
	src.Handseals(10-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.usemurderofcrows=1
	var/AmountOfCrows=rand(8,11)
	while(AmountOfCrows)
		var/obj/SmokeCloud/S=new()
		S.loc=src.loc
		var/mob/Jutsu/MurderCrows/A=new()
		A.dir=EAST;A.Owner=src;A.loc=src.loc
		var/mob/Jutsu/MurderCrows/B=new()
		B.dir=WEST;B.Owner=src;B.loc=src.loc
		var/mob/Jutsu/MurderCrows/C=new()
		C.dir=SOUTH;C.Owner=src;C.loc=src.loc
		var/mob/Jutsu/MurderCrows/D=new()
		D.dir=NORTH;D.Owner=src;D.loc=src.loc
		var/mob/Jutsu/MurderCrows/E=new()
		E.dir=NORTHEAST;E.Owner=src;E.loc=src.loc
		var/mob/Jutsu/MurderCrows/F=new()
		F.dir=NORTHWEST;F.Owner=src;F.loc=src.loc
		var/mob/Jutsu/MurderCrows/G=new()
		G.dir=SOUTHWEST;G.Owner=src;G.loc=src.loc
		var/mob/Jutsu/MurderCrows/H=new()
		H.dir=SOUTHEAST;H.Owner=src;H.loc=src.loc
		walk(A,A.dir)
		spawn(3)
			walk(A,0)
		walk(B,B.dir)
		spawn(3)
			walk(B,0)
		walk(C,C.dir)
		spawn(3)
			walk(C,0)
		walk(D,D.dir)
		spawn(3)
			walk(D,0)
		walk(E,E.dir)
		spawn(3)
			walk(E,0)
		walk(F,F.dir)
		spawn(3)
			walk(F,0)
		walk(G,G.dir)
		spawn(3)
			walk(G,0)
		walk(H,H.dir)
		spawn(3)
			walk(H,0)
		AmountOfCrows--
		sleep(5)
	src<<"You summon a murder of crows!"
	while(src.usemurderofcrows)
		src.ChakraDrain(2000)
		sleep(25)
mob/Jutsu/MurderCrows
	name="Crows"
	icon='Icons/Jutsus/Crows.dmi'
	icon_state=""
	density=0
	layer=10
	Running=1
	New()
		..()
		src.icon=pick('Icons/Jutsus/Crows.dmi','Icons/Jutsus/Crows2.dmi')
		spawn(5)
			var/mob/O=src.Owner
			while(src)
				for(var/mob/M in src.loc)
					if(M!=O)
						sleep(3)
						if(M&&M.client)
							if(!M.knockedout&&M.FrozenBind=="")
								M.DamageProc(8,"Health",O)
								if(prob(30))
									M.Bloody()
								view(5,M)<<output("<font>[M] was pecked by a Crow!</font>","Attack")
							if(M.target==src&&src.ButterflyDance)
								sleep(1)
							else
								M.DeleteTarget()
							sleep(3)
				step_to(src,O)
				if(prob(20)) step_rand(src)
				sleep(rand(1,30))
	Move()
		if(prob(15))
			return 0
		..()
///////////////////////////////////////////////////////////////////////////////////////////////
//B Rank Ninjutsu..Redone
/////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////
//Haruno No Jutsu
//////////////////////////
mob/var/tmp/HarunoBy=""
mob/var/tmp/HarunoDelay=0
obj/Jutsu/leaftrap/Lhand
	icon = 'Icons/Jutsus/NinjutsuTechniques.dmi'
	icon_state = ""
	layer = MOB_LAYER+99999999
	var/tmp/CapturePerson
	New()
		..()
		spawn()
			while(src)
				sleep(11)
				if(src.icon_state=="fist")
					for(var/mob/M in src.loc)
						var/mob/O=src.Owner
						if(M.ImmuneToDeath)
							M.FrozenBind=""
							del(src)
							return
						if(M==O)
							return
						if(M.sphere|M.intsu|M.ingat|M.Kaiten)
							del(src)
						if(M.FrozenBind=="")
							M<<"You've been binded by the Leaf Bind!";M.FrozenBind="Haruno";src.CapturePerson=M
						if(M.FrozenBind=="Haruno"&&O.Guarding)
							M<<"The grip tightens on you!"
							M.DamageProc(O.nin/10,"Stamina",O)
						sleep(11)
				sleep(11)
			spawn(120)
			del(src)
	Del()
		var/mob/M=src.CapturePerson
		var/mob/O=src.Owner
		if(M)
			M<<"You've been freed!";M.FrozenBind="";M.Death(O)
		sleep(5)
		..()

mob/proc/LeafBind()
	src.Target()
	if(src.ntarget)
		return
	var/mob/M=src.target
	if(src.firing) // If the mob's firing var is one...
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	if(M in oview(6))
		src.ChakraDrain(10000)
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/obj/Jutsu/leaftrap/Lhand/A=new();A.loc = locate(M.x,M.y,M.z);A.Owner=src
		src<<"You prepare the leaves around [M]!"
		flick("bind",A);sleep(15);A.icon_state = "fist"
///////////////////////////////////////////////////////////////////////////////////////////////
//A Rank Ninjutsu
/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//Fuuma Teleportation
//////////////////////////
mob/proc/FuumaTeleport()
	src.Handseals(15-src.HandsealSpeed)
	if(src.FrozenBind!=""|src.Frozen|src.Stun>0)
		src<<"You can not use it right now!";return
	else if(src.chakra<4000)
		src<<"You don't possess the necessary amount of chakra to preform a reverse summoning on yourself.."
		return
	else
		src.chakra-=4000
		src.icon_state="rest";src<<"You begin to concentrate. Stay within meditation for 30 seconds."
		sleep(300)
		if(src.icon_state=="rest")
			var/obj/SmokeCloud/S=new();var/obj/SmokeCloud/A=new()
			S.loc=locate(src.x,src.y,src.z);sleep(1)
			src.loc=locate(115,130,6);A.loc=locate(src.x,src.y,src.z)
			src.icon_state="";src<<"Jutsu completed!";return
		else
			src<<"The jutsu has failed."
mob/proc/SatakeTeleport()
	src.Handseals(15-src.HandsealSpeed)
	if(src.FrozenBind!=""|src.Frozen|src.Stun>0)
		src<<"You can not use it right now!";return
	else if(src.chakra<4000)
		src<<"You don't possess the necessary amount of chakra to preform a reverse summoning on yourself.."
		return
	else
		src.chakra-=4000
		src.icon_state="rest";src<<"You begin to concentrate. Stay within meditation for 30 seconds."
		sleep(300)
		if(src.icon_state=="rest")
			var/obj/SmokeCloud/S=new();var/obj/SmokeCloud/A=new()
			S.loc=locate(src.x,src.y,src.z);sleep(1)
			src.loc=locate(184,86,4);A.loc=locate(src.x,src.y,src.z)
			src.icon_state="";src<<"Jutsu completed!";return
		else
			src<<"The jutsu has failed."
mob/proc/UzumakiTeleport()
	src.Handseals(15-src.HandsealSpeed)
	if(src.FrozenBind!=""|src.Frozen|src.Stun>0)
		src<<"You can not use it right now!";return
	else if(src.chakra<4000)
		src<<"You don't possess the necessary amount of chakra to preform a reverse summoning on yourself.."
		return
	else
		src.chakra-=4000
		src.icon_state="rest";src<<"You begin to concentrate. Stay within meditation for 30 seconds."
		sleep(300)
		if(src.icon_state=="rest")
			var/obj/SmokeCloud/S=new();var/obj/SmokeCloud/A=new()
			S.loc=locate(src.x,src.y,src.z);sleep(1)
			src.loc=locate(178,75,11);A.loc=locate(src.x,src.y,src.z)
			src.icon_state="";src<<"Jutsu completed!";return
		else
			src<<"The jutsu has failed."
mob/proc/RendenTeleport()
	src.Handseals(15-src.HandsealSpeed)
	if(src.FrozenBind!=""|src.Frozen|src.Stun>0)
		src<<"You can not use it right now!";return
	else if(src.chakra<4000)
		src<<"You don't possess the necessary amount of chakra to preform a reverse summoning on yourself.."
		return
	else
		src.chakra-=4000
		src.icon_state="rest";src<<"You begin to concentrate. Stay within meditation for 30 seconds."
		sleep(300)
		if(src.icon_state=="rest")
			var/obj/SmokeCloud/S=new();var/obj/SmokeCloud/A=new()
			S.loc=locate(src.x,src.y,src.z);sleep(1)
			src.loc=locate(104,88,14);A.loc=locate(src.x,src.y,src.z)
			src.icon_state="";src<<"Jutsu completed!";return
		else
			src<<"The jutsu has failed."
mob/proc/CrimsonTeleport()
	src.Handseals(45-src.HandsealSpeed)
	if(src.FrozenBind!=""||src.Frozen||src.Stun>0)
		src<<"You can not use it right now!";return
	else if(src.chakra<4000)
		src<<"You don't possess the necessary amount of chakra to preform a reverse summoning on yourself.."
		return
	else
		src.chakra-=4000
		src.icon_state="rest";src<<"You begin to concentrate. Stay within meditation for 30 seconds. Anyone within 1 tile of you with be teleported with you."
		sleep(300)
		if(src.icon_state=="rest")
			for(var/mob/M in view(1,src))
				var/obj/SmokeCloud/S=new()
				S.loc=locate(M.x,M.y,M.z);sleep(2)
				var/obj/SmokeCloud/A=new()
				M.loc=locate(150,154,39);A.loc=locate(M.x,M.y,M.z)
			src.icon_state="";src<<"Jutsu completed!";return
		else
			src<<"The jutsu has failed."
///////////////////////////////////////////////////////
//Meisai Gakure no Jutsu
//////////////////////////
mob/var/tmp/inMei=0
mob/proc/MieMie()
	if(src.ingat|src.intank|src.firing|src.Kaiten|src.sphere|src.inso)
		return
	else
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
//		if(prob(50))
//			view()<<"<font color=silver><b><font face=verdana>[usr]: <FONT SIZE=+1><FONT COLOR=#1e90ff>Mei</FONT><FONT COLOR=#4586f4>sag</FONT><FONT COLOR=#6d7be7>aku</FONT><FONT COLOR=#9370db>re </FONT><FONT COLOR=#9255c8>No </FONT><FONT COLOR=#9039b4>Jut</FONT><FONT COLOR=#8d1c9f>su</FONT><FONT COLOR=#8b008b>!</FONT></FONT>!!"
		src.Oicon=src.icon
		src.Overlays=src.overlays.Copy()
		src.icon=src.pic2()
		src.overlays=list()
		var/BlendBy = 225 - round(min(src.NinjutsuKnowledge/4,175))
		src.icon-=rgb(0,0,0,BlendBy)//Transperancy depends on NinKnow. Cap at 200.
		src.inMei=1
		while(src.inMei)
			src.chakra-=50
			if(src.chakra<0||src.knockedout)
				src.inMei=0
			sleep(50)
		src.icon=src.Oicon
		src.overlays+=src.hair
		src.overlays+=usr.Overlays
		//src.firing=0
atom//Like the pic() proc, but instead, it returns the icon as an output, rather than setting a variable to the mob
    proc/pic2()
        var/icon/i = icon(src.icon)
        for(var/o in src.overlays)
            i.Blend(icon(o:icon),ICON_OVERLAY)
        for(var/o in src.underlays)
            i.Blend(icon(o:icon),ICON_UNDERLAY)
        return i
///////////////////////////////////////////////////////
//Body Switch
//////////////////////////////
mob/proc/PersonSwap()
	if(src.firing|src.Kaiten|src.resting|src.inso)
		return
	else
		if(src.target)
			var/mob/M=src.target
			if(!M.client)
				return
			src.ChakraDrain(2000)
			src.Handseals(5-src.HandsealSpeed)
			if(src.HandsSlipped) return
			if(src.Frozen||src.FrozenBind||src.Stun)
				src<<"You try to move in for a Body Swap but you're frozen!";return
			if(M.Frozen||M.FrozenBind!=""||M.resting)
				src<<"[M] is frozen right now and unable to switch places with you.";return
			if(M.Focus>src.Focus||M.target==src)
				src<<"They focus on you trying to switch with them and quickly stop it from happening!"
				M<<"You focus on [src] trying to swap places with you and you quickly stop it frop happening!"
				return
			if(src.Focus>=M.Focus)
				var/turf/AX=M.loc
				var/turf/X=src.loc
				for(var/turf/LA in getline(usr,AX))
					if(istype(LA,/turf/Buildings/zDensity))
						return
					else
						src.loc=AX
						M.loc=X
		else
			src<<"You need a target!";return
///////////////////////////////////////////////////////
//Ninpou: Ikusenhari No Hageshii tosshin
//////////////////////////
mob/proc/Ikusenhariz()
	if(src.firing|src.Kaiten|src.sphere)
		return
	else
		src.ChakraDrain(20000)
		var/Number=0;var/Number2=1;var/Number3=src.SenbonMastery/10
		//Number is Number of Senbon, Number2 is range.
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		for(var/obj/WEAPONS/Senbon/S in src.contents)
			Number=S.ammount
		if(Number<4)
			src<<"You need at least 4 senbon to preform this jutsu.";return
		if(Number>25)
			Number=25
		if(sqrt(Number)>1)
			Number2=round(sqrt(Number))
		if(Number3>10)
			Number3=10
//		if(prob(50))
//			view()<<"<font color=silver><b><font face=verdana>[src]: <FONT SIZE=+1><FONT COLOR=#1e90ff>Ikusenhari No Hageshii Tosshin</FONT>!!"
		src<<"You throw [Number] senbon into the sky..";oview(Number2,src)<<"[src] throws [Number] senbon into the sky.."
		for(var/obj/WEAPONS/Senbon/O in src.contents)
			O.ammount-=Number
			if(O.ammount<=0)
				if(src.WeaponInLeftHand==O)
					src.WeaponInLeftHand=""
				if(src.WeaponInRightHand==O)
					src.WeaponInRightHand=""
				del(O)
			else
				O.name="Senbon ([O.ammount])"
		for(var/turf/T in oview(Number2,src))
			var/obj/Jutsu/FallenNeedles/K = new()
			K.loc=T;K.dir=SOUTH;K.Percision=src.Percision;K.Move_Delay=1;K.number=Number3
			K.Owner=src

obj/Jutsu/FallenNeedles
	name = "Senbon"
	icon='Senbon Umbrella.dmi'
	icon_state="needle"
	density=1
	var/number=1
	New()
		..()
		spawn()
			while(src)
				view(src)<<sound('Throw.wav',0);for(var/mob/M in src.loc)
					if(M.sphere)
						return
					if(M.Ghit<=0)
						var/mob/O = src.Owner;var/damage=M.maxhealth*0.02;if(prob(src.Percision*3))
							damage=damage*2
							M.DamageProc(damage,"Health",O)
						else
							M.DamageProc(damage,"Health",O)
						view(M) << "[M] was hit by [O]'s Senbon for [damage] damage!!";viewers()<<sound('SFX/Slice.wav',0)
						M.DamageProc(damage,"Health",O)
						M.Bloody()
						M.StunAdd(1)
						spawn()
							M.Ghit=5;M.GHitDrain();M.Death(src.Owner)
				sleep(1)
		spawn(3)
			while(number>0)
				var/obj/Weapons/K = new /obj/Weapons
				var/random=rand(1,2)
				if(random==1)
					K.icon_state = "fallenneedle";K.pixel_x=rand(-4,36);K.pixel_y=rand(-4,36)
				else if(random==2)
					K.icon_state = "fallenneedle2"
				K.loc=src.loc
				sleep(1)
				number--
			del(src)


///////////////////////////////////////////////////////
//BodyShedding
//////////////////////////
mob/proc/BodySheddingProc()
	if(!src.knockedout)//Move is meant to be used to auto get up as an advance sub.
		return;
	if(src.ChakraPool<5000)//Prevents abuse to use to constantly get up when they have no chakra.
		return;
	//Creates a dead mob as the skin.
	var/mob/P = new /mob/player
	P.health=5000;P.icon=src.icon;P.overlays=src.overlays;P.name="[src]";P.Village=src.Village;
	P.icon_state="dead";P.loc=src.loc;P.knockedout=1;P.Dead=1;P.FrozenBind="Dead"
	spawn()
		P.DeleSelf(300)
	//orange(12,src)<<"<font size = 2>[src] is dead!</font>"//Death message to trick them.
	//Generic auto get up stuff
	src.sight&=~(SEE_SELF|BLIND)
	src.Struggle=0
	src.icon_state=""
	src.Frozen=0
	src.firing=0
	src.knockedout=0
	src.Endurance=src.MEndurance
	src.Frozen=0
	src.icon_state=""
	src.Guarding=0
	src.gencounter=0
	src.StruggleAgainstDeath=0;
	//Completly heals the user.
	src.health=src.maxhealth
	src.stamina=src.maxstamina
	//The move is a heavy chakra cost move used as a last resort.
	src.chakra=(src.Mchakra/3)
	src.ChakraPool-=12000;
	if(src.ChakraPool<0)
		src.ChakraPool=0
	src.calories-=1000
	if(src.calories<0)
		src.calories=0;
	src.ChakraPool/=2
	if(src.deathcount>1)
		src.deathcount-=2;//slightly willpower recovery shouldnt be a problem with the high tool cost.
	src.ImmuneToDeath=1//just paided almost all chakra not want them getting koed instantly
	src.invisibility=50//Its a kawa so invisible
	src.firing=1//don't abuse invisiblity
	src.Running=1;
	spawn(20)
		src.ImmuneToDeath=0
		src.invisibility=1
		src.firing=0
	return
///////////////////////////////////////////////////////////////////////////////////////////////
//S Rank Ninjutsu
/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//ZankuuSpiralingSphere
///////////////////////////
mob/var/tmp/ZankuuSphere=0
mob/proc/ZankuuSpiralingSphere()
	if(src.ZankuuSphere!=0)
		return
	src<<"You charge a sphere within your hand!"
	src.ChakraDrain(125000)
	src.ZankuuSphere=rand(15,40)
	src<<"Hurry and use it before the air waves evaporate!"
	spawn(150)
		if(src.ZankuuSphere>0)
			src.ZankuuSphere=0;src<<"The air waves dispersed!"
mob/proc/ZankuuSoundDrill()
	//var/Struck=0
	if(src.firing||src.knockedout||src.Frozen)
		return
	src.ChakraDrain(70000)
	flick("Attack1",src)
	view()<<"[src] uses the device on their arms to amplify nearby sound waves!"
	for(var/mob/M in oview(1,src))
		if(M in OnlinePlayers)
			if(!M.knockedout&&!M.Frozen&&M.Status!="SoundWavesAltered")
				M.Status="SoundWavesAltered"
				M<<"You begin to lose your balance and feel nauseous..."
				Quake_Effect(M,25,2)
				M.Running=0
				M.screwed=1
				M.StatusEffected=20
				spawn(100)
					M.client.dir=NORTH
					M.screwed=0


/////////////////////Custom Jutsu
mob/var/tmp/SageMode=""
mob/proc/SageMode(TimeLimit,Length,WhichAnimal)
	if(src.knockedout)
		return
	src.icon_state="rest"
	src<<"Você se concentra na energia natural!"
	if(TimeLimit>0)
		src<<"You have [TimeLimit] seconds to remain meditating."
	var/A=TimeLimit
	while(A>1)
		src.chakra-=10
		if(src.icon_state!="rest")
			src<<"Você para de reunir energia natural!";A=0;src.Frozen=0;src.firing=0;return
		if(src.icon_state=="rest")
			src.Frozen=1;src.firing=1
		A--
		sleep(11)
	src.icon_state=""
	src.Frozen=0
	src.firing=0
	src<<"You reach your Sage Mode!"
	src.SageMode=WhichAnimal
	if(src.SageMode=="Monkey")
		src.LearnedJutsus+= new/obj/SkillCards/SpirallingSpheres
		src.icon='Icons/New Base/SageMonkey.dmi'
		src.overlays+='Icons/New Base/SageMonkeyTail.dmi'
	if(src.SageMode=="Toad")
		src.LearnedJutsus+= new/obj/SkillCards/SpirallingSpheres
		src.icon='Icons/New Base/SageMonkey.dmi'
		src.overlays+='Icons/New Base/SageMonkeyTail.dmi'
	if(src.SageMode=="Lion")
		src.overlays-=src.hair
		src.icon='Icons/New Base/SageLion.dmi'
		var/hairover='Icons/New Base/Hair/JiraiyaH.dmi'
		hairover+=rgb(120,10,10)
		src.overlays+=hairover
	if(src.SageMode=="Slug")
		src.chakra+=rand(2500,4500)
		if(src.chakra>src.Mchakra*1.5)
			src.chakra=src.Mchakra*1.5
		src.icon='Icons/New Base/SageSlug.dmi'
	if(src.SageMode=="Senju")
		src.overlays+='Icons/New Base/Sage Mokuton.dmi'
		src.chakra+=rand(2500,4500)
		if(src.chakra>src.Mchakra*2)
			src.chakra=src.Mchakra*2
	//	//Need icons amggggggggggg
	src.icon_state="power"
	sleep(11)
	src.icon_state=""
	src<<"It'll last for [Length] seconds!"
	var/SageModeTime=Length
	if(src.SageMode!="Slug")
		src.chakra=src.MaxChakraPool
	if(src.SageMode=="Lion")
		src.chakra=src.MaxChakraPool*3
	if(src.SageMode=="Senju")
		src.chakra=src.MaxChakraPool*2
	while(SageModeTime&&src.SageMode!="")
		if(src.SageMode=="Monkey")
			src.nin=src.Mnin*2.1
			src.gen=src.Mgen*1.5
			src.tai=src.Mtai*1.2
		if(src.SageMode=="Toad")
			src.nin=src.Mnin*1.7
			src.gen=src.Mgen*1.7
			src.tai=src.Mtai*1.7
		if(src.SageMode=="Lion")
			src.nin=src.Mnin*2
			src.gen=src.Mgen*2
			src.tai=src.Mtai*1.08
			src.FireChakra=30;src.EarthChakra=30
			src.Endurance=200
		if(src.SageMode=="Senju")
			src.nin=src.Mnin*2.5
			src.gen=src.Mgen*1.2
			src.tai=src.Mtai*1.2
			src.EarthChakra=30
			src.WaterChakra=30
		if(src.SageMode=="Slug")
			src.gen=src.Mgen*2
			src.nin=src.Mnin*1.5
			src.tai=src.Mtai*1.2
		SageModeTime--
		sleep(10)
	src<<"Your Sage Mode deactivates."
	src.deathcount++
	src.stamina=src.stamina*0.25
	src<<"You feel exhausted..."
	src.overlays-='Icons/New Base/SageMonkey.dmi'
	src.overlays-='Icons/New Base/SageMonkeyTail.dmi'
	src.overlays+='Icons/New Base/Sage Mokuton.dmi'
	var/icon/X='Icons/New Base/Base.dmi'
	X+=rgb(usr.BaseR,usr.BaseG,usr.BaseB)
	src.icon=null
	src.icon=X
	var/hairover='Icons/New Base/Hair/JiraiyaH.dmi'
	hairover+=rgb(120,10,10)
	src.overlays-=hairover
	src.overlays+=src.hair
	src.nin=src.Mnin
	src.gen=src.Mgen
	src.tai=src.Mtai
	if(src.chakra>src.Mchakra)
		src.chakra=src.Mchakra
//	src.Swift=6
//	src.SpeedDice=6
	src.SageMode=""
//////////////////////////////////////
mob/var/Rage=0
mob/proc/Bijuu(TimeLimit,Length,WhichAnimal)

	if(src.knockedout)
		return
	src.icon_state="rest"
	src<<"You begin to concentrate for the chakra flow! Don't move at all!"
	src.overlays+='Icons/Jutsus/Skillcards2.dmi'
	spawn(30)
		src.overlays-='Icons/Jutsus/Skillcards2.dmi'
	if(TimeLimit>0)
		src<<"You have [TimeLimit] seconds to remain meditating."
	var/A=TimeLimit
	while(A>1)
		src.Rage++
		src.chakra-=10
		if(src.icon_state!="rest")
			src<<"You stop concentrating!";A=0;src.Frozen=0;src.firing=0;return
		if(src.icon_state=="rest")
			src.Frozen=1;src.firing=1
		A--
		sleep(11)
	src.icon_state=""
	src.Frozen=0
	src.firing=0
	src<<"You reach your the chakra flow!"
	src.Bijuu=WhichAnimal
	if(src.Bijuu=="KyuubiTail")
		src.icon='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'

	src.icon_state="power"
	sleep(11)
	src.icon_state=""
	src<<"It'll last for [Length] seconds!"
	usr.icon_state="beastman"
	var/BijuuTime=Length
	src.chakra=src.MaxChakraPool
	if(src.Bijuu=="KyuubiTail"&&src.Rage>=150)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src.icon='Icons/Jutsus/Bijuu/kyuubi2.dmi'
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	while(BijuuTime)
		if(src.Bijuu=="KyuubiTail")
			src.nin=src.Mnin*2
			src.gen=src.Mgen*2
			src.tai=src.Mtai*2
		//	src.Swift=7
		//	src.SpeedDice=7
		if(src.Bijuu=="KyuubiTail"&&src.Rage>=5)
			src.nin=src.Mnin*2.5
			src.gen=src.Mgen*2.5
			src.tai=src.Mtai*2.5
		BijuuTime--
		Rage++
		sleep(11)

	if(src.Bijuu!="")
		src<<"You disactivate the chakra flow."
		src.deathcount++
		src.stamina=0
		src<<"You feel exhausted..."
		if(src.Bijuu=="KyuubiTail")
			src.overlays-='Icons/Jutsus/Bijuu/Kyuubi1.dmi'
			src.overlays-='Icons/Jutsus/Bijuu/Kyuubi1.dmi'
			var/icon/X='Icons/New Base/Base.dmi'
			X+=rgb(usr.BaseR,usr.BaseG,usr.BaseB)
			src.icon=null
			src.icon=X

		if(src.chakra>src.Mchakra)
			src.chakra=src.Mchakra
	//	src.Swift=6
	//	src.SpeedDice=6
		src.Bijuu=""
//////////////////////////////////////
////////////Body Flame////////////////
mob/var/tmp/BodyFlameX=0
mob/var/tmp/BodyFlameY=0
mob/var/tmp/BodyFlameZ=0
mob/proc/BodyFlameJutsu()
	if(src.BodyFlameX==0)
		if(src.deathcount>2)
			src<<"Your body is to weak to set this up!"
			return
		if((src.Village == global.villageWarTeamOne) || (src.Village == global.villageWarTeamTwo))
			return
		if(global.contestantOne==src||global.contestantTwo==src)
			src<<"Not while you're in the Arena!"
			return
		src<<"You begin to place your current location as a Marker for your Body Flame Technique. Stand still."
		src.FrozenBind="Setting Body Flame Jutsu"
		spawn(200)
			if(!src.knockedout)
				src.FrozenBind="";src<<"Your Current Location has been set as the Marker for your Body Flame Technique! Press this Skillcard once again to teleport to this location when desired."
				src.BodyFlameX=src.x
				src.BodyFlameY=src.y
				src.BodyFlameZ=src.z
				return
	else
		if((src.Village == global.villageWarTeamOne) || (src.Village == global.villageWarTeamTwo))
			return
		if(src.deathcount>2)
			src<<"Your body is to weak to activate this successfully!"
			return
		if(global.contestantOne==src||global.contestantTwo==src)
			src<<"Not while you're in the Arena!"
			return
		var/TimerToTeleport=55
		var/AwaitingTeleport=0
		src.Handseals(60-src.HandsealSpeed)
		src.ChakraDrain(60000)
		view()<<"[src]'s body begins to slowly radiate heat..."
		AwaitingTeleport=1
		while(AwaitingTeleport==1&&TimerToTeleport>0)
			src.FrozenBind="Teleporting with Body Flame Jutsu"
			if(src.knockedout)
				src.FrozenBind=""
				src.BodyFlameX=0
				src.BodyFlameY=0
				src.BodyFlameZ=0
				view()<<"[src]'s body loses the flames..."
				src<<"The Jutsu was cancelled and your marker for this jutsu was lost!"
				return
			TimerToTeleport--
			sleep(3)
		src.overlays+='BodyFlame.dmi'
		view()<<"[src] is completly gone as the Fire has consumed them...."
		spawn(35)
			src.overlays-='BodyFlame.dmi'
			src.loc=locate(src.BodyFlameX,src.BodyFlameY,src.BodyFlameZ)
			src<<"You arrive back at your marker!"
		src.FrozenBind=""
		//src.overlays-=
//////////////////////////////////////
////////////CursedSeal////////////////
mob/var/CursedSealPool=0 //Now acts as CS Mastery
mob/var/tmp/CursedSealActivated=0
mob/var/tmp/CursedSealActivatedS=0
mob/var/OldFocus=0
mob/var/list/CSLays
mob/var/CursedSealType="Heaven"
mob/proc/CursedSealActivation()
	if(src.CursedSealActivated)
		src.CursedSealActivated=0
		src.CursedSealActivatedS=0
		src<<"You deactivate the Cursed Seal!"
		src.icon=usr.Oicon
		src.nin=src.Mnin
	//	if(!src.knockedout&&(src.CursedSealPool<30000&&prob(50)))
	//		src.deathcount++
		src.tai=src.Mtai
		src.gen=src.Mgen
		src.Endurance=src.MEndurance
		src.Focus=src.OldFocus
		src.RunningSpeed=5
	else
		src.OldFocus=src.Focus
		src<<"You activate the Cursed Seal!"
		if(src.CursedSealPool<30000)
			src.deathcount++
		else
			src.deathcount+=0.5
		if(src.StruggleAgainstDeath>0&&src.knockedout)
			src.Struggle=src.StruggleAgainstDeath+1
		if(src.CursedSealPool>50000)
			src<<"The seal begins to bind to your soul!"
			src<<"You activate the second stage of the Cursed Seal!"
			src.CursedSealActivatedS=1
			src.icon=usr.Oicon;usr.Oicon=src.icon;//Resest the icon then saves the orginal so it doesn't save the cs icon as original
			var/icon/B='Icons/New Base/Base.dmi'
			B+=rgb(156,156,156)
			var/icon/CSS='CurseSeal2.dmi'//Icon for cs2 goes here
			CSS+=rgb(102,0,153)
			src.CSLays=src.overlays.Copy()
			src.overlays=src.overlays.Remove(src.overlays)
			src.icon=B
			src.overlays+=CSS
			src.overlays+=src.CSLays
			while(CursedSealActivatedS)
				if(src.ChakraPool<0) src.ChakraPool=0;src.CursedSealActivatedS=0;//Ends when chakrapool is gone.
				if(src.health<100) src.health=100;//Prevents them from dying till CS2 ends.
				var/C=src.ChakraPool;src.ChakraPool-=(C*0.05);src.chakra+=(C*0.1);//Drains chakra pool and adds it to chakra at a 1:2 ratio.
				if(src.health<=500) src.health+=5;src.chakra-=5;//Recovers health from chakra if health is low.
				src.nin+=2;//Slower rate but doesn't cap off.
				src.tai+=4;if(src.tai>200) src.tai=200;//Caps increase.
				src.gen+=4;if(src.gen>200) src.gen=200;//Caps increase.
				src.Endurance=250//Sets to a high endurance aswell as makes it so you can't block.
				sleep(10)
		//	src.CursedSealActivatedS=0
		//	src.CursedSealActivated=0
		//	src<<"You deactivate the Cursed Seal!"
		//	src.icon=usr.Oicon
		//	if(prob(5)) src.DeclineAge--;//Chance to lower death age since it is a curse.
			if(prob(5)) src.MEndurance-=10;//Change to lower MEndurance
			if(prob(5)) src.Mchakra-=(src.Mchakra*0.1);//Chance to lose 10% of your max chakra
			src.deathcount+=10;//So it kills you when it ends.
			src.nin=src.Mnin
			src.tai=src.Mtai
			src.gen=src.Mgen
			src.Endurance=src.MEndurance
			src.RunningSpeed=5
			/*Spot for giving C2 skillcard to be added later*/
		src.Oicon=src.icon
		var/icon/CS='Icons/Jutsus/Bijuu/CurseMarkStage1.dmi'
		src.CSLays=src.overlays.Copy()
		src.overlays=src.overlays.Remove(src.overlays)
		src.overlays+=CS
		src.overlays+=src.CSLays
		src.CursedSealActivated=1
		if(src.CursedSealType=="Hell")
			src.gen*=2;src.nin*=2;src.tai*=2
			src.chakra+=(src.Mchakra*0.5);src.stamina+=(src.maxstamina*0.5)
			src.RunningSpeed=11;src.Endurance+=200

		if(src.CursedSealType=="Heaven")//Ninjutsu type CS
			src.gen=src.Mgen*2;src.nin=src.Mnin*1.5
			src.chakra+=(src.Mchakra*0.75)

		if(src.CursedSealType=="Earth")//Taijutsu type CS
			src.gen=src.Mgen*2;src.tai=src.Mtai*1.4
			src.stamina+=(src.maxstamina*0.5)

		if(src.CursedSealType=="Fire")//Accuracy type CS
			src.OldFocus=src.Focus;src.Focus*=1.5
			src.chakra+=src.Mchakra*0.25

		if(src.CursedSealType=="Water")//Genjutsu type CS
			src.gen=Mgen*3
			src.chakra+=src.Mchakra*0.25

		if(src.CursedSealType=="Thunder")//Endurance type CS
			src.Endurance+=350
			src.stamina+=src.maxstamina*0.25

		if(src.CursedSealType=="Air")//Speed type CS
			src.RunningSpeed=11
			src.stamina+=src.maxstamina*0.25
		var/obj/I=new()
		I.icon='Icons/Jutsus/Bijuu/CurseSeal1.dmi'
		I.icon_state="[src.CursedSealType]"
		I.pixel_y=32
		src.overlays+=I
		spawn(20)
			src.overlays-=I;del(I)
		while(src.CursedSealActivated)
			if(src.CursedSealType=="Air")
				src.runningspeed=15
			src.health-=(max((rand(15,30)-src.CursedSealPool),2))
			if(prob(1.5)&&src.CursedSealPool<30000)
				src.deathcount++
				src.CursedSealPool++
			else if(prob(0.5)&&src.CursedSealPool>50000)
				src.deathcount+=0.5
				src.CursedSealPool++


			sleep(15)
		src.overlays-=CS
//////////////////////////////////////
///Zigo's Custom/////////////////////
obj/Jutsu/Elemental/Acid
	Element="Santon"
obj/Jutsu/Elemental/Acid/MeltingAcid
	icon='Icons/Jutsus/Acid(1).dmi'
	icon_state=""
	density=0
	layer=TURF_LAYER
	var/nin=0
	New()
		..()
		spawn()
			while(src)
				for(var/mob/M in src.loc)
					var/mob/O=src.Owner
					if(M==O)
						return
					M.DamageProc(rand(150,250),"Health",O)
					M.Running=0
				sleep(11)
		spawn(300)
			del(src)
obj/Jutsu/Elemental/Acid/MeltingAcidWave
	icon='Icons/Jutsus/Acid(1).dmi'
	icon_state="Wave"
	density=0
	layer=TURF_LAYER
	var/nin=10
	var/Edge=0
	var/FirstTile=0
	New()
		..()
		spawn(10)
			del(src)
	Del()
		var/obj/Jutsu/Elemental/Acid/MeltingAcid/L=new()
		L.loc=src.loc;L.Owner=src.Owner
		if(src.dir==NORTH) L.icon_state="[src.Edge-6]"
		if(src.dir==SOUTH) L.icon_state="[src.Edge+6]"
		if(src.dir==WEST) L.icon_state="[src.Edge-2]"
		if(src.dir==EAST) L.icon_state="[src.Edge+2]"
		..()
	Move()
		var/obj/Jutsu/Elemental/Acid/MeltingAcid/L=new()
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
mob/proc/AcidWave()
	var/ChakraLoss=100
	src.chakra-=ChakraLoss
	src.Handseals(15-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="Jutsu";src.Frozen=1;src.firing=1
	spawn(20)
		src.Frozen=0;src.firing=0;src.icon_state=""
	var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/A=new();A.Owner=src;A.nin=src.nin;A.JutsuLevel=1
	var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/B=new();B.Owner=src;B.nin=src.nin;B.JutsuLevel=1
	var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/C=new();C.Owner=src;C.nin=src.nin;C.JutsuLevel=1
	var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/D=new();D.Owner=src;D.nin=src.nin;D.JutsuLevel=1
	var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/E=new();E.Owner=src;E.nin=src.nin;E.JutsuLevel=1
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
///////////////////////////////////////////////////////
////RasenganBarrage
////////////////////
obj/Jutsu/ResenganIcon
	icon='Rasengan2.dmi'//icon='Rasengan.dmi'
	icon_state="";
mob/npcs/RBunshin
	icon='Base.dmi'
	icon_state="Running"
	density=1
	var/Move_Delay=1
	health = 1
	stamina=0
	New()
		..()
		spawn(6000)
			src.Die()
	proc/Die()
		flick("smoke2",src)
		del(src)
	Bump(mob/M)
		if(istype(M,/mob/)) // If they run into the player
			if(M == src.Owner||M.name==src.name)
				return
			else
				var/mob/P = M
				if(P.Kaiten)
					del(src)
				if(P.sphere)
					view() << "<i><font size = 2>[src] has pierced through [M]'s defence!</font></i>"
					P.firing=0;P.sphere=0;P.usingS=0
				var/Damage=src.nin*rand(9,14);
				if(Damage>1200)
					Damage=1200
				P.dir=src.dir
				flick("Attack2",src)
				flick("rasenganhit",P)
				view() << "<i><font size = 2>[src] hit [P] with their Rasengan for [Damage] damage!</font></i>"
				P.DamageProc(Damage,"Stamina",src.Owner);src.Die()
				P.HitBack(rand(10,20),src.dir)
mob/var/tmp/UsingRasenganBarrage=0
mob/var/tmp/list/RasenganMobs=list()
mob/proc/RasenganBarrageProc()
//	src.ChakraDrain(10000)
	src.ChakraDrain(50000)
	src.Handseals(50-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	src.UsingRasenganBarrage=1
	for(var/turf/T in oview(1))
		spawn()
			var/obj/SmokeCloud/S=new();S.loc=T
			var/mob/K=new /mob/npcs/RBunshin;K.loc=T
			K.Owner=src;K.ChakraC=src.ChakraC;K.Owner=src;K.Endurance=10;K.health=1;K.stamina=0
			K.icon=src.icon;K.overlays+=src.overlays;K.overlays+=/obj/Jutsu/ResenganIcon;K.name="[src.name]"
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen;K.Clone=1;K.Running=1;K.MoveDelay=0;K.icon_state="running"
			if(src.target)
				walk(src,get_dir(K,src.target))
			else
				walk(src,src.dir)
			src.RasenganMobs+=K
	while(src.icon_state=="handseal")
		sleep(11)
	for(var/mob/npcs/RBunshin/R in src.RasenganMobs)
		R.Die()

//////////////////////////////////////
///Dracule's Custom (Takashi)

//TBA

//////////////////////////////////////
///Bone's Custom (Kilik)

//TBA
/////////////////////////////////////////////
///Custom Jutsu - Kinjutsu
//////////////////////////////////
mob/var/tmp/UsingZeroVoid=0
mob/proc/ZeroVoidBarrier()
	if(src.UsingZeroVoid)
		src.UsingZeroVoid=0;src.FrozenBind=""
		for(var/obj/ZeroVoidBarrierPieces/Z in orange(src,3))
			if(Z.Owner==src) del(Z)
		return
	var/obj/ZeroVoidBarrierPieces/Part1/A=new()
	var/obj/ZeroVoidBarrierPieces/Part2/B=new()
	var/obj/ZeroVoidBarrierPieces/Part3/C=new()
	//src.JutsuObjs.Add(A);src.JutsuObjs.Add(B);src.JutsuObjs.Add(C)
	B.loc=get_step(src,src.dir);var/d=src.dir
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST){src.dir=WEST}
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST){src.dir=EAST}
	if(src.dir==EAST||src.dir==WEST)
		A.icon=turn(A.icon,90);B.icon=turn(B.icon,90);C.icon=turn(C.icon,90)
	if(src.dir==SOUTH||src.dir==WEST)
		A.loc=get_step(B,turn(d,-90));C.loc=get_step(B,turn(d,90))
	else if(src.dir==NORTH||src.dir==EAST)
		A.loc=get_step(B,turn(d,90));C.loc=get_step(B,turn(d,-90))
	A.Owner=src;B.Owner=src;C.Owner=src
	src.FrozenBind="Jutsu"
	src.UsingZeroVoid=1
	while(src.UsingZeroVoid)
		src.chakra-=round(src.Mchakra*0.02)
		src.health-=round(src.maxhealth*0.05)
		sleep(11)
obj/ZeroVoidBarrierPieces
	name="Zero Void Barrier"
	icon='Icons/Jutsus/Kinjutsu.dmi'
	layer=MOB_LAYER+10
	density=0
	var
		Owner
	New()
		..()
		flick("open [src.icon_state]",src)
	Cross(atom/A)
		if(isobj(A))
			var/obj/O = A
			//world<<"[O] entered into the Zero Void Barrier at. It's direction is [O.dir]."
			var/d=turn(O.dir,180);O.dir=d
			//world<<"New direction is [O.dir]"
			walk(O,0);O.loc=src
			sleep(5)
			O.loc=src.loc
			//world<<"[O] exited the Zero Void Barrier."
			walk(O,d)
		if(ismob(A))
			return 0
	Part1
		icon_state="0,0"
	Part2
		icon_state="1,0"
	Part3
		icon_state="2,0"

mob/var/tmp/ChakraEnhance=0
mob/var/tmp/GuideWeapons=0
mob/proc/ChakraEnhance()
	if(src.ChakraEnhance)
		src.ChakraEnhance=0
		src.CE=0
		src<<"You stop enhancing your weapons with Chakra.";return
	src<<"All weapons you use now will be 'enhanced' with your chakra. Even close ranged weapons!"
	src.ChakraEnhance=1
	src.CE=1
mob/proc/WeaponReverse()
	src.ChakraDrain(5000)
	src.Handseals(10-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/obj/WEAPONS/Kunai/A in view(10,src))
		if(A.ChakraEnhance&&A.Owner==src)
			walk(A,0)
			A.dir=turn(A.dir,180)
			walk(A,A.dir,0)
	for(var/obj/WEAPONS/Shuriken/A in view(10,src))
		if(A.ChakraEnhance&&A.Owner==src)
			walk(A,0)
			A.dir=turn(A.dir,180)
			walk(A,A.dir,0)
	for(var/obj/WEAPONS/Senbon/A in view(10,src))
		if(A.ChakraEnhance&&A.Owner==src)
			walk(A,0)
			A.dir=turn(A.dir,180)
			walk(A,A.dir,0)
	for(var/obj/WEAPONS/WindmillShuriken/A in view(10,src))
		if(A.ChakraEnhance&&A.Owner==src)
			walk(A,0)
			A.dir=turn(A.dir,180)
			walk(A,A.dir,0)

mob/proc/GuidingWeapon()
	src.ChakraDrain(10000)
	src.Handseals(10-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(!src.ChakraEnhance)
		src<<"You need to enhance your weapons with your chakra to use this jutsu.";return
	src.GuideWeapons=1
	src<<"All your chakra enhanced weapons for the next 10 seconds will be able to be guided. Click on a tile to send them hurling in that direction. Clicking with the Middle Button on your mouse allows you to stop the movement of all your weapons mid air."
	spawn(100)
		src.GuideWeapons=0
	/*if(src.target)
		var/mob/M = src.target
		for(var/obj/WEAPONS/Kunai/A in view(10,src))
			if(A.ChakraEnhance&&A.Owner==src)
				walk_towards(A,M)
		for(var/obj/WEAPONS/Shuriken/A in view(10,src))
			if(A.ChakraEnhance&&A.Owner==src)
				walk_towards(A,M)
		for(var/obj/WEAPONS/Senbon/A in view(10,src))
			if(A.ChakraEnhance&&A.Owner==src)
				walk_towards(A,M)
		for(var/obj/WEAPONS/WindmillShuriken/A in view(10,src))
			if(A.ChakraEnhance&&A.Owner==src)
				walk_towards(A,M)
	else*/


atom
	Click(object,location,control)
		..()
		if(usr.GuideWeapons)
			for(var/obj/WEAPONS/W in view(10,src))
				walk_towards(W,location,0)

atom
	Click(object,location,control,middle)
		..()
		if(usr.GuideWeapons)
			for(var/obj/WEAPONS/W in view(10,src))
				walk_towards(W,0)

obj/WarpEffect
	icon='MinatoWarp.dmi'
	icon_state="1"
	New()
		..()
		spawn(10)
			del(src)

obj/WarpEffect2 //Used for short distance warps so it doesn't get too obnoxious visually.
	icon='MinatoWarp.dmi'
	icon_state="2"
	New()
		..()
		spawn(10)
			src.loc=null

////////////
//Minato

mob/var/tmp/list/SealPlacedOn=list()
mob/var/tmp/FTG_Mode=0
mob/var/tmp/PlacingMarker=0
mob/proc
	Flying_Thunder_God_Mode()
		if(src.FTG_Mode)
			src.FTG_Mode=0
			var/list/Techniques=list("FlyingThunderGod1","FlyingThunderGod2","MarkerPlace","MarkerPlaceQuick")
			while(Techniques.len>0)
				var/Choice=pick(Techniques)
				Techniques.Remove(Choice)
				var/Path=text2path("/obj/SkillCards/[Choice]")
				var/obj/SkillCards/S = locate(Path) in src.LearnedJutsus
				if(!S)
					continue
				else
					S.NonKeepable=1
					src.LearnedJutsus-=S
			src<<"You release your Flying Thunder God mode.."
		else
			src<<"Your muscles tense..."
			sleep(30)
			src<<"Your reflexes heighten."
			sleep(20)
			src<<"<font color=#d0bd1a><b>You enter the Flying Thunder God mode!</b></font>"

			src.FTG_Mode=1
			src.LearnedJutsus+=new /obj/SkillCards/FlyingThunderGod1
			src.LearnedJutsus+=new /obj/SkillCards/FlyingThunderGod2
			src.LearnedJutsus+=new /obj/SkillCards/MarkerPlace
			src.LearnedJutsus+=new /obj/SkillCards/MarkerPlaceQuick
			while(src.FTG_Mode)
				src.Running=1
				src.runningspeed=15
				src.chakra-=rand(15,25)
				sleep(20)

	Flying_Thunder_God_1() //Brings up the list of marker you've placed on turfs, objs (automatic on kunais when FTG mode is on, and mobs) and warps you to your selected one.

		src.Handseals(1)
		src.ChakraDrain(30000)
		if(src.villageWarParticipating)
			src<<"Trying to cheat. Pathetic."
			world<<"[src] attempted to use Flying Thunder God while in Village war!"
			return
		var/list/Seals=list()
		for(var/A in src.SealPlacedOn)
			Seals+=A
		var/Location=input(src,"Where do you want to warp to?") in Seals + list("Leaf","Rock","Rain","Sound","Snow","Tea","Cancel")
		if(Location=="Cancel")
			return
		WarpEfx(usr.x,usr.y,usr.z)
		flick("zan",src)
		if(src.knockedout)
			return
		switch(Location)
			if("Leaf")
				src.loc = locate(58,25,11)
			if("Rock")
				src.loc = locate(151,9,14)
			if("Rain")
				src.loc = locate(82,44,6)
			if("Sound")
				src.loc = locate(63,30,4)
			if("Snow")
			//	src.loc = locate(M.x,M.y+1,M.z)
			if("Tea")
				src.loc = locate(83,36,2)
			else
				if(istext(Location))
					var/turf/T=locate(Location)
					src.loc=T
				else
					var/atom/M=Location
					if(isturf(M.loc))
						src.loc = locate(M.x,M.y+1,M.z)
					else if(ismob(M.loc))
						var/mob/L=M.loc
						src.loc = locate(L.x,L.y+1,L.z)

	Flying_Thunder_God_2() //Teleports to the nearest marker then erases it from the list automatically to prevent getting stuck on one marker.

		src.Handseals(1)
		src.ChakraDrain(7500)
		Redo
		if(src.SealPlacedOn.len>0)
			var/atom/Warp
			for(var/atom/A in oview(30,src))
				if(A in src.SealPlacedOn)
					Warp=A;src.SealPlacedOn-=A
					for(var/image/I in src.client.images)
						if(I.loc==A)
							del(I)
					break
			WarpEfx2(usr.x,usr.y,usr.z)
			flick("zan",src)
			if(src.knockedout)
				return
			if(isturf(Warp.loc))
				src.loc = locate(Warp.x,Warp.y+1,Warp.z)
			else
				goto Redo
		else
			src<<"You have no marker seals placed!"
		//WarpEfx2(usr.x,usr.y,usr.z)

	Flying_Thunder_God_3()
		//Space Time Jutsu

	Place_Marker()
		if(src.PlacingMarker)
			src.PlacingMarker=0
			src<<"You release the chakra from your hand."
		else
			src.PlacingMarker=1
			src.chakra-=350
			src<<"You concentrate your chakra in your palm for placing markers."

	Place_Marker_Quick()
		var/mob/M
		for(var/mob/Q in get_step(src,src.dir))
			M=Q
			break
		if(M)
			src<<"You quickly place a marker seal on [M]!"
			M<<"[src] taps you?"
			var/image/I=image('Icons/Jutsus/MinatoAura.dmi',M)
			src.SealPlacedOn+=M
			spawn(600)
				if(M in src.SealPlacedOn)
					src.SealPlacedOn-=M
					src<<"The marker on [M] wears off..."
					del(I)
			src<<I
			return
		else
			var/turf/T = get_step(src,src.dir)
			if(T)
				src<<"You tap the [T], placing a marking seal on it!"
				src.SealPlacedOn+=T
				var/image/I=image('Icons/Jutsus/MinatoAura.dmi',T)
				src<<I
				return





//Void Dragon
mob/var/tmp/KiriOpen=0
mob/proc/OpenVoid()
	if(src.KiriOpen) return
	var/turf/Location
	switch(input("Which village would you wish to teleport to?") in list("Leaf","Rain","Rock","Sound","Tea","Nevermind"))
		if("Nevermind")
			return
		if("Leaf")
			Location = locate(58,25,11)
		if("Rain")
			Location = locate(82,44,6)
		if("Rock")
			Location = locate(151,9,14)
		if("Sound")
			Location = locate(63,30,4)
		if("Tea")
			Location = locate(83,36,2)
	src<<"You make a swift slash, a portal opening leading to the designated location!"
	flick("weaponslash",src)
	var/obj/KiriGate/K=new();K.loc=locate(usr.x,usr.y+1,usr.z)
	var/obj/KiriGate/K2=new();K2.loc=Location
	spawn(100) src.KiriOpen=0
	K.openlocation=K2.loc;K2.openlocation=K.loc
	K.Owner=src;K2.Owner=src
	src.KiriOpen=1
mob/proc/OpenVoid2()
	if(src.KiriOpen) return
	var/turf/Locate
	if(!src.HoldingR)
		usr.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		if(M.dir==NORTH) Locate=locate(M.x,M.y-1,M.z)
		if(M.dir==SOUTH) Locate=locate(M.x,M.y+1,M.z)
		if(M.dir==WEST||M.dir==NORTHWEST||M.dir==SOUTHWEST) Locate=locate(M.x+1,M.y,M.z)
		if(M.dir==EAST||M.dir==NORTHEAST||M.dir==SOUTHEAST) Locate=locate(M.x-1,M.y,M.z)
	else
		var/ToX = min(max((input("What X coord do you want to go to?","___,___,__",src.x) as num),1),world.maxx)
		var/ToY = min(max((input("What Y coord do you want to go to?","[ToX],___,__",src.y) as num),1),world.maxy)
		var/ToZ = min(max((input("What Z coord do you want to go to?","[ToX],[ToY],__",src.z) as num),1),world.maxz)
		Locate = locate(ToX,ToY,ToZ)
	src<<"You make a swift slash, a portal opening behind your target and you!"
	flick("weaponslash",src)
	var/obj/KiriGate/K=new();K.loc=get_step(src,src.dir)
	var/obj/KiriGate/K2=new();K2.loc=Locate
	spawn(100) src.KiriOpen=0
	K.openlocation=K2.loc;K2.openlocation=K.loc
	K.Owner=src;K2.Owner=src
	src.KiriOpen=1
mob/proc/OpenVoid3()
	if(src.KiriOpen) return
	var/list/people[]
	for(var/mob/P in world)
		if(P.client)
			var/X
			if(P.SecondName!="") X="[P.SecondName], [P.FirstName]"
			if(P.SecondName=="") X="[P.FirstName]"
			people += X
			people[X]=P
	var/Choice = input("Who do you want to teleport to?") in people +"Cancel"
	if(Choice == "Cancel")
		return
	var/mob/M=people[Choice]
	src<<"You make a swift slash, a portal opening behind your target and you!"
	flick("weaponslash",src)
	var/obj/KiriGate/K=new();K.loc=get_step(src,src.dir)
	var/obj/KiriGate/K2=new()
	if(M.dir==NORTH) K2.loc=locate(M.x,M.y-1,M.z)
	if(M.dir==SOUTH) K2.loc=locate(M.x,M.y+1,M.z)
	if(M.dir==WEST||M.dir==NORTHWEST||M.dir==SOUTHWEST) K2.loc=locate(M.x+1,M.y,M.z)
	if(M.dir==EAST||M.dir==NORTHEAST||M.dir==SOUTHEAST) K2.loc=locate(M.x-1,M.y,M.z)
	spawn(100) src.KiriOpen=0
	K.openlocation=K2.loc;K2.openlocation=K.loc
	K.Owner=src;K2.Owner=src
	src.KiriOpen=1



mob/var/tmp/InXeidus=0
mob/proc/XeidusCreation()
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Deviant/Xeidus/K=new();K.name="[src]";
	src.InXeidus=1
	src.AbleToLavaSummon=1
	K.Owner=src;
	for(var/mob/M in oview(10,src))
		if(M in OnlinePlayers)
			Quake_Effect(M,10)
//	view(10)<<"<font color=#660198> <font size = 2>The Force of the ground shakes as a God appears...</font>"
	world<<"<font color=#660198> <font size = 4> The Force of the the entire earth shakes as Xeidus appears before you...</font>"
//	spawn()
//		for(var/obj/Jutsu/J in oview(6,src))
//			spawn()
//				walk(J,get_dir(src,J))
//				sleep(40)
//				walk(J,0)
	for(var/mob/M in oview(6,src))
		spawn()
			M.Strafe()
			M.HitBack(10,get_dir(src,M))
			M.Normal()
	src.nin*=1.5
	src.tai*=1.5
	src.gen*=1.5
	K.loc=src.loc
	walk_towards(K,src)
	while(src.InXeidus)
		src.AbleToLavaSummon=1
		src.chakra-=2;src.stamina-=2;
		src.Running=0
		if(prob(10))
			src.Bloody();src.health-=5;
		sleep(15)
	src.AbleToLavaSummon=0

obj
	Jutsu
		Deviant
			Xeidus
				icon='Icons/Deviant.dmi'
				icon_state="2,2"
				density=1
				layer=MOB_LAYER+1

				Bump(A)
					if(ismob(A))
						var/mob/M = A
						if(src.Owner==M)
							src.loc=M.loc
				New()

					spawn()
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part1;
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part2
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part3
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part4
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part5
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part6
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part7
						src.overlays+=/obj/Jutsu/Deviant/Xeidus/Part8
						while(src)
							for(var/obj/Jutsu/A in oview(1,src))
								if(A.Owner!=src.Owner)
									del(A)
							for(var/obj/Jutsu/A in src.loc)
								if(A.Owner!=src.Owner)
									del(A)
							for(var/mob/M in oview(1,src))
								if(M in OnlinePlayers&&M!=src.Owner&&!M.knockedout)
									Quake_Effect(M,5)
									M.health-=rand(80,140)
									M<<"You feel your life source being drained...get away from it!"
									M.deathcount-=0.07
							sleep(11)
				Part1
					icon_state="1,3"
					pixel_x=-32
					pixel_y=32
				Part2
					icon_state="2,3"
					pixel_y=32
				Part3
					icon_state="3,3"
					pixel_x=32
					pixel_y=32
				Part4
					icon_state="1,2"
					pixel_x=-32
				Part5
					icon_state="3,2"
					pixel_x=32
				Part6
					icon_state="1,1"
					pixel_x=-32
					pixel_y=-32
				Part7
					icon_state="2,1"
					pixel_y=-32
				Part8
					icon_state="3,1"
					pixel_x=32
					pixel_y=-32











// 1 800 938
mob/var/tmp/FoxTimeChamber=0

mob
	proc
		FoxTimeChamber()
			src.Handseals(45-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.ChakraDrain(25000)
			src<<"Your body begins to teleport away to an unknown location...."
			spawn(150)
				if(src.knockedout)
					return
				else
					src.FoxTimeChamber=1
					src.loc=locate(184,88,20)
					src<<"You arrive at a place where time doesn't follow it's normal flow..."
					src<<"Hey Fox. It's me Sasuna, give me a tip on how you want me to make it look as I know I can make it much better and I have already mapped this before."