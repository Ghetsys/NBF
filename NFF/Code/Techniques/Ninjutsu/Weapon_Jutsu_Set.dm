////////////////////////////////////////////////
//Shuriken Shadow Clone
////////////////////////////////////
mob/proc/KageShuriken()
	src.ChakraDrain(47500)
	src.Handseals(35-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/obj/WEAPONS/Shuriken/A in oview(10))
		if(A.Owner==src&&!A.ShadowClone)
			for(var/turf/T in oview(1,A))
				var/obj/WEAPONS/Shuriken/A2=new()
				var/obj/SmokeCloud/A12=new()
				spawn(70)
					del(A2)
				A12.loc=T
				A2.icon='Icons/shuriken.dmi';A2.ChakraEnhance=A.ChakraEnhance;A2.icon_state="throw";A2.ShadowClone=1
				A2.loc=T;A2.Owner=A.Owner;A2.pixel_x=rand(8,16);A2.pixel_y=rand(10,18);A2.Move_Delay=A.Move_Delay;walk(A2,A.dir)

////////////////////////////////////////////////
//Kunai Shadow Clone
////////////////////////////////////
mob/proc/KageKunai()
	src.ChakraDrain(37500)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/obj/WEAPONS/Kunai/A in oview(10))
		if(A.Owner==src&&!A.ShadowClone)
			for(var/turf/T in oview(1,A))
				var/obj/WEAPONS/Kunai/A2=new()
				var/obj/SmokeCloud/A12=new()
				spawn(70)
					del(A2)
				A12.loc=T
				A2.icon='Kunai.dmi';A2.ChakraEnhance=A.ChakraEnhance;A2.icon_state="Throwz";A2.ShadowClone=1
				A2.loc=T;A2.Owner=A.Owner;A2.pixel_x=rand(8,16);A2.pixel_y=rand(10,18);A2.Move_Delay=A.Move_Delay;walk(A2,A.dir)

////////////////////////////////////////////////
//Kunai Barrage
////////////////////////////////////
mob/proc/WeaponSummoningKunai(Uses)
//	var/Mastery=0
	var/T=0
	var/Check1=0
	var/counter=0
	src.ChakraDrain(35000)
	src.icon_state="handseal"
	src<<"Você começa a concentrar no jutsu de sumonar. Não mova! Isso vai custar alguns segundos."
	while(src.icon_state=="handseal"&&!src.knockedout&&Check1==0)
		T++
		sleep(5)
		if(T>15&&Uses<150)
			Check1=1
		else if(T>15&&Uses<=300)
			Check1=2
		else if(T>15&&Uses>300&&Uses<1000)
			Check1=3
		else if(T>15&&Uses>1000)
			Check1=4
	T=0
	if(Check1==1)
		src<<"Você sumonou uma kunai!"
	//	var/obj/WEAPONS/Kunai/K=new();K.icon_state="Throwz";K.loc=locate(src.x,src.y-1,src.z);K.ammount=2
	//	return
		for(var/obj/WEAPONS/Kunai/O in usr.contents)
			counter+=1
		if(counter<=0)
			var/obj/WEAPONS/Kunai/B = new();B.loc = usr;B.ammount+=1;B.name= "[B.name]"
		else
			for(var/obj/WEAPONS/Kunai/O in usr.contents)
				O.ammount+=1
				O.name= "[O.name]"
		return
	if(Check1==2)
		src<<"Você sumonou 3 kunais!"
		for(var/obj/WEAPONS/Kunai/O in usr.contents)
			counter+=3
		if(counter<=0)
			var/obj/WEAPONS/Kunai/B = new();B.loc = usr;B.ammount+=3;B.name= "[B.name]"
		else
			for(var/obj/WEAPONS/Kunai/O in usr.contents)
				O.ammount+=3
				O.name= "[O.name]"
	//	src<<"You've summoned kunais!"
	//	var/obj/WEAPONS/Kunai/A=new();A.icon_state="Throwz";A.loc=locate(src.x,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/B=new();B.icon_state="Throwz";B.loc=locate(src.x+1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/C=new();C.icon_state="Throwz";C.loc=locate(src.x-1,src.y-1,src.z)
		return
	if(Check1==3)
		src<<"Você sumonou 5 kunais!"
		for(var/obj/WEAPONS/Kunai/O in usr.contents)
			counter+=5
		if(counter<=0)
			var/obj/WEAPONS/Kunai/B = new();B.loc = usr;B.ammount+=5;B.name= "[B.name]"
		else
			for(var/obj/WEAPONS/Kunai/O in usr.contents)
				O.ammount+=5
				O.name= "[O.name]"
	//	var/obj/WEAPONS/Kunai/AA=new();AA.icon_state="Throwz";AA.loc=locate(src.x,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/BB=new();BB.icon_state="Throwz";BB.loc=locate(src.x+1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/CC=new();CC.icon_state="Throwz";CC.loc=locate(src.x-1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/AAA=new();AAA.icon_state="Throwz";AAA.loc=locate(src.x+1,src.y,src.z)
	//	var/obj/WEAPONS/Kunai/BBB=new();BBB.icon_state="Throwz";BBB.loc=locate(src.x-1,src.y-1,src.z)
		return
	if(Check1==4)
		src<<"Você sumonou 10 kunais!"
		for(var/obj/WEAPONS/Kunai/O in usr.contents)
			counter+=10
		if(counter<=0)
			var/obj/WEAPONS/Kunai/B = new();B.loc = usr;B.ammount+=10;B.name= "[B.name]"
		else
			for(var/obj/WEAPONS/Kunai/O in usr.contents)
				O.ammount+=10
				O.name= "[O.name]"
	//	var/obj/WEAPONS/Kunai/AA=new();AA.icon_state="Throwz";AA.loc=locate(src.x,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/BB=new();BB.icon_state="Throwz";BB.loc=locate(src.x+1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/CC=new();CC.icon_state="Throwz";CC.loc=locate(src.x-1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/AAA=new();AAA.icon_state="Throwz";AAA.loc=locate(src.x+1,src.y,src.z)
	//	var/obj/WEAPONS/Kunai/BBB=new();BBB.icon_state="Throwz";BBB.loc=locate(src.x-1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/AABB=new();AABB.icon_state="Throwz";AABB.loc=locate(src.x,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/BBAA=new();BBAA.icon_state="Throwz";BBAA.loc=locate(src.x+1,src.y-1,src.z)
	//	var/obj/WEAPONS/Kunai/CCA=new();CCA.icon_state="Throwz";CCA.loc=locate(src.x-1,src.y-1,src.z)
	///	var/obj/WEAPONS/Kunai/AAAA=new();AAAA.icon_state="Throwz";AAAA.loc=locate(src.x+1,src.y,src.z)
	//	var/obj/WEAPONS/Kunai/BBBD=new();BBBD.icon_state="Throwz";BBBD.loc=locate(src.x-1,src.y-1,src.z)
		return




mob/proc/KunaiBarrageProc(Size,Rounds)
	var/R=Rounds
	src.ChakraDrain(30000*R)
	if(Size>8) Size=8
	if(Rounds>8) Rounds=8
	src.Handseals(1-src.HandsealSpeed)//Move should be instant but calls proc have checks to prevent use in binds and etc.
	if(src.HandsSlipped) return
	src.icon_state="handseal"

	var/rounds=Rounds//Number of rounds fired this number can be changed to smaller if to oped.
	while(rounds>0&&src.icon_state=="handseal") //handseal icon state automatically freezes them because its coded that way
											// and it allows the user to cancel the jutsu prematurely
		for(var/i=0, i<Size*2, i++)
			spawn()
				var/obj/KKunai/K=new();K.loc=src.loc;K.Owner=src;K.dir=src.dir;K.nin=src.nin;K.Move_Delay=0
				K.InitialDisplacement=K.SetInitialDisplacement(-12,12)
				walk(K,src.dir)
		rounds--;
		sleep(2);//delay btw rounds
	src.icon_state=""
obj/KKunai
	icon='Kunai.dmi'
	icon_state = "Throwz"
	density=1
	Move_Delay=0
	var/StunChance=0;
	var/nin=10
	var/Owner
	var/InitialDisplacement="None"
	New()
		..()
		spawn(80)
			del(src)
	Move()
		if(src.JutsuSpread(src.InitialDisplacement,4,8))
			..()
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			var/mob/O=src.Owner
			var/damage=(O.KunaiMastery+(rand(10,30)+(src.nin*0.15)))/10 //Was var/damage=(src.nin*0.4)+48
									   //The +48 insures the move does min of 28 damage.
			if(damage>30)//Caps the damage in case they use a nin buff transformation so move doesn't become oped.
				damage=30;
			var/random=(rand(6,8)/10)//Number changed if want to buff or nerf the damage.
									//The random is to give it that feel of not always hitting the same.
			damage*=random;//Damage multi is done this way because rand can only generate integers so random btw .6 and .8 cant be done.
						  //So rand(6,8)/10 is done instead then multiplied to damage.
			if(M.icon_state=="Block"&&prob(8*M.DeflectionZ))//Chance to block the incoming senbon
				view(M)<<output("<font>Você deflete a Senbon!</font>","output")
				M.HitBack(1,src.dir)//Push back even though you blocked its still traveling fast enough
				del(src);
				return;
			if(M.Kaiten)
				view(M)<<output("<font>Você deflete a kunai!</font>","output")
				del(src);
				return;
			if(src.StunChance==1&&prob(30))
				M.Stun=10;
			M.DamageProc(damage,"Health",O)
			view(M)<<output("<font>[M] foi machucado pela kunai por [damage] de dano!</font>","Attack")
			viewers()<<sound('HitStrong.wav',0,0,1)
			M.Bloody();M.Bloody();M.Bloody()
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)




///////////////////////////////////////////////////////
//Hair Needle Senbon
//////////////////////////
mob/proc/KebariSenbon(Uses)
	src.ChakraDrain(25000)
	src.Handseals(1-src.HandsealSpeed)//Move should be instant but calls proc have checks to prevent use in binds and etc.
	if(src.HandsSlipped) return
	src.icon_state="beastman"
	src.firing=1;
	var/rounds=10+(round(Uses/200));//Number of rounds fired this number can be changed to smaller if to oped.
	if(rounds>20)
		rounds=20;
	while(rounds>0&&src.icon_state=="beastman")
		var/s=3
		while(s>0)
			var/obj/KSenbon/K=new();K.loc=src.loc;K.Owner=src;K.dir=src.dir;K.nin=src.nin;K.Move_Delay=0;
			if(s==3&&K)
				K.icon_state = "needles";K.loc=get_step(src,turn(src.dir,45))
			if(s==2&&K)
				K.icon_state = "needles2";K.loc=get_step(src,turn(src.dir,-45))
			walk(K,src.dir);s--;sleep(1)
		rounds--;
		sleep(2);//delay btw rounds //Was originally 3

	src.Frozen=0;src.firing=0;
	src.icon_state="";

obj/KSenbon
	icon='Weapons.dmi'
	icon_state = "needles"
	density=1
	Move_Delay=0
	var/StunChance=0;
	var/nin=10
	var/Owner
	New()
		..()
		spawn(30)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			var/mob/O=src.Owner
			var/damage=O.SenbonMastery+(rand(10,30)+(src.nin*0.15))//If the user goes pure cap the move will do 100damage.
									   //The +28 insures the move does min of 28 damage.
			if(damage>120)//Caps the damage in case they use a nin buff transformation so move doesn't become oped.
				damage=120;
			var/random=(rand(6,8)/10)//Number changed if want to buff or nerf the damage.
									//The random is to give it that feel of not always hitting the same.
			damage*=random;//Damage multi is done this way because rand can only generate integers so random btw .6 and .8 cant be done.
						  //So rand(6,8)/10 is done instead then multiplied to damage.
			if(M.icon_state=="Block"&&prob(5*M.DeflectionZ))//Chance to block the incoming senbon
				view(M)<<output("<font>Você deflete a senbon!</font>","output")
				M.HitBack(1,src.dir)//Push back even though you blocked its still traveling fast enough
				del(src);
				return;
			if(M.Kaiten)
				view(M)<<output("<font>Você deflete a senbon!</font>","output")
				del(src);
				return;
			if(src.StunChance==1&&prob(30))
				M.Stun=10;
			M.DamageProc(damage,"Health",O)
			view(M)<<output("<font>[M] was by KebariSenbon for ([damage]) damage!</font>","Attack")
			viewers()<<sound('HitStrong.wav',0,0,1)
			M.Bloody();M.Bloody();M.Bloody()
			M.HitBack(1,src.dir)//Push back effect because there being smacked with senbon.
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
///////////////////////////////////////////////////////////////
/////Expanding Shuriken
//Throws a shuriken then by clicking X it deletes and shots in other directions.
//This can be done up to twice.
/////////////////////////////////////
mob/proc/ExpandingShurikenProj()
	src.ChakraDrain(30000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/ExpandShuriken/S=new();
	S.loc=get_step(src,src.dir);
	S.Owner=src;
	S.dir=src.dir;
	S.Move_Delay=0;
	walk(S,S.dir);

obj/ExpandShuriken
	icon = 'shuriken.dmi'
	icon_state = "throw"
	density = 1
	var/nin=45
	var/TimesShot=0;
	var/Owner
	proc
		ShootDirection()
			if(TimesShot<1)//This allows the already shot to be shot again for cool effcts. //Set higher for cool effects
				var/mob/O=src.Owner
				O.ChakraDrain(30000)
				walk(src,0)
				src.TimesShot++;
				var/obj/ExpandShuriken/A=new();A.Owner=O;A.loc=src.loc;A.dir=NORTH;A.TimesShot=src.TimesShot;walk(A,A.dir);
				var/obj/ExpandShuriken/B=new();B.Owner=O;B.loc=src.loc;B.dir=SOUTH;B.TimesShot=src.TimesShot;walk(B,B.dir);
				var/obj/ExpandShuriken/C=new();C.Owner=O;C.loc=src.loc;C.dir=WEST;C.TimesShot=src.TimesShot;walk(C,C.dir);
				var/obj/ExpandShuriken/D=new();D.Owner=O;D.loc=src.loc;D.dir=EAST;D.TimesShot=src.TimesShot;walk(D,D.dir);
				var/obj/ExpandShuriken/E=new();E.Owner=O;E.loc=src.loc;E.dir=NORTHWEST;E.TimesShot=src.TimesShot;walk(E,E.dir);
				var/obj/ExpandShuriken/F=new();F.Owner=O;F.loc=src.loc;F.dir=NORTHEAST;F.TimesShot=src.TimesShot;walk(F,F.dir);
				var/obj/ExpandShuriken/G=new();G.Owner=O;G.loc=src.loc;G.dir=SOUTHWEST;G.TimesShot=src.TimesShot;walk(G,G.dir);
				var/obj/ExpandShuriken/H=new();H.Owner=O;H.loc=src.loc;H.dir=SOUTHEAST;H.TimesShot=src.TimesShot;walk(H,H.dir);
				del(src);
	New()
		..()
		spawn(100)
			del(src)
	Bump(A)
		..()
		if(ismob(A))
			var/mob/M=A
			var/mob/O=src.Owner
			var/damage=rand(50,75)
			view(M) << "[M] was hit by [O]'s shuriken for [damage] damage!!"
			M.DamageProc(damage,"Health",O)
			spawn() M.Bloody()
			spawn() M.Bloody()
			walk(src,0)
			del(src)
		if(istype(A,/obj/))
			if(istype(A,/obj/ExpandShuriken/))
				var/obj/S=A;
				S.dir=turn(S.dir,180);
				src.dir=turn(src.dir,180);
			del(src);




mob/var/tmp/WindMillCount=3;

obj/WindmillC
	icon='windmill.dmi'
	density=1
	var/MoveCount=0;
	var/Owner=""
	New()
		..()
		spawn()
			while(src)
				if(src.MoveCount>9)
					del(src);
				sleep(10);
		spawn(600)//So just incase the user bugs, after a minute it will delete
			del(src)
	Move()
		..()
		src.MoveCount++;
	Bump(A)
		..()
		if(ismob(A))
			var/mob/M = A
			if(M.Kaiten||M.sphere)
				return
		//	M.DamageProc(150,"Health",O)
			M.health-=150
			M.Bloody();M.Bloody();M.Bloody()
			del(src)
		if(istype(A,/obj/))
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
	Del()
		var/mob/O=src.Owner
		if(O.WindMillCount>0)
			O.NewWindMill()
	//	...();
		..()


mob/var/tmp/UsingControllingWindmill=0;
mob/proc/NewWindMill()
	src.WindMillCount--;
	src.ChakraDrain(15000);
	var/obj/WindmillC/C=new();C.loc=src.loc;C.Owner=src

mob/proc/ControllingWindmill(Uses)
	src.ChakraDrain(3000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src<<"Você começa a criar um moinho de vento que você pode mover com o mouse!"
	src.icon_state="handseal"
	src.UsingControllingWindmill=1;
	src.WindMillCount=1
	if(Uses>150)
		WindMillCount=2;
	if(Uses>550)
		WindMillCount=3
	var/obj/WindmillC/C=new();C.loc=src.loc;C.Owner=src