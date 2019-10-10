obj/Jutsu
	SleeperSmoke
		icon='Icons/Jutsus/NarutoStuff.dmi'
		icon_state="SmokeR"
		layer=MOB_LAYER+1
		New()
			flick("SmokeA",src)
			spawn()
				while(src)
					for(var/mob/M in src.loc)
						M.Status="Asleep";M.icon_state="dead"
						M.StatusEffected=rand(6,12)
					sleep(11)
			spawn(25)
				flick("SmokeD",src)
				del(src)


mob/var/tmp
	Clone=0
	KBunshinOn=0
	CloneSubstituteMode=0

mob/Clones
	Clone=1
	NPC=1
	density=0
	cansave=0
	var
		tmp/altername
		tmp/alterlastname
		tmp/Tackling=0
		tmp/CloneType="Bunshin"
		tmp/SleepingInTheSky=0
		tmp/PoisonClone=0
	Clone
		New()
			..()
			spawn(900)
				del(src)
		Click()
			if(CloneType=="KBunshin"||CloneType=="KKBunshin"||CloneType=="TKageBunshin")
				if(usr.Charging&&src.Owner==usr)
					for(var/mob/M in world)
						if(usr==M.target)
							M.target=null
					var/ax=usr.x;var/ay=usr.y;var/az=usr.z
					var/c=usr.dir
					usr.loc=src.loc;usr.dir=src.dir
					src.loc=locate(ax,ay,az);src.dir=c
					return
				else
					..()
		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == src.Owner||M.name==src.name)
					return
				else
					if(CloneType=="KBunshin"||CloneType=="TKageBunshin"||CloneType=="KKBunshin")
						var/mob/O=src.Owner
						var/mob/MX=M
						if(src.Tackling==1)
							var/Damage=50000/MX.Endurance
							spawn() AttackEfx3(MX.x,MX.y,MX.z,MX.dir)
							MX.DamageProc(Damage,"Stamina",O)
							if(MX.Guarding)
								viewers()<<sound('SFX/Guard.wav',0)
							else
								viewers()<<sound('SFX/HitStrong.wav',0)
							src.Death(src)
						if(src.Tackling==2)
							src.icon=O.icon;src.overlays=O.overlays
							spawn() AttackEfx3(MX.x,MX.y,MX.z,MX.dir)
							if(MX.Guarding)
								viewers()<<sound('SFX/Guard.wav',0)
							else
								viewers()<<sound('SFX/HitStrong.wav',0)
							src.icon_state="power"
							src.loc=M.loc
							while(src)
								for(var/mob/Ms in src.loc)
									if(Ms.KagDance=="Karamatsu"||Ms.RaiArmor)
										src.Death(src)
									Ms.StunAdd(5)
									if(Ms.Stun>5)
										Ms.Stun=5
								sleep(1)
						else
							src.AttackVerb()
		Del()
			var/mob/M=src.Owner
			if(SleepingInTheSky)
				for(var/turf/T in oview(4,src))
					var/obj/Jutsu/SleeperSmoke/A=new();A.Owner=M;A.loc=T
			if(PoisonClone)
				for(var/turf/T in oview(3,src))
					var/obj/Poisonmist/A=new();A.loc=T;A.Poison="LargerVit";A.PoisonLast=100
			if(src.CloneType=="KBunshin")
				if(M.KBunshinOn)
					M.firing=0;M.KBunshinOn=0
					M.client.perspective=MOB_PERSPECTIVE;M.client.eye=M;M.controlled=null
			..()

mob/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	if(istype(src,/mob/Clones/Clone/)&&usr.Charging)
		if(src.Owner==usr)
			for(var/mob/M in world)
				if(usr==M.target)
					M.target=null
			var/ax=usr.x;var/ay=usr.y;var/az=usr.z
			var/c=usr.dir
			usr.loc=src.loc;usr.dir=src.dir
			src.loc=locate(ax,ay,az);src.dir=c
			return
//Kikkaichu
	if(usr.Clan=="Aburame")
		for(var/mob/Bugs/Kekkai/K in usr.BugsInWorld)
			if(K.Frozen)
				K.Frozen = 0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
		for(var/mob/Bugs/SpecialSwarm/S in usr.BugsInWorld)
			if(S.Controllable)
				walk_towards(S,src)
	if(usr.ShurikenMode)
		for(var/obj/WEAPONS/Shuriken/A in view(10,usr))
			if(A.icon_state=="throw")
				walk_towards(A,src)
				usr.chakra-=8

	if(usr.Clan=="Inuzuka")
		for(var/mob/pet/P in world)
			if(P.Owner == usr&&P.Frozen == 0&&P.FrozenBind=="")
				if(prob(5))
					usr.Training+=0.1;if(usr.Training>50) usr.Training=50
				if(prob(2))
					usr.SpeedTraining+=0.1;if(usr.SpeedTraining>5) usr.SpeedTraining=5
				walk_towards(P,src,1)
			else
				..()

	if(usr.Clan=="Kumojin")
		for(var/mob/NPC/KumojinSpider/AK in world)
			if(AK.Owner==usr)
				if(AK.Frozen||AK.knockedout)
					return
				else
					walk_towards(AK,src)
	for(var/mob/Clones/Clone/K in world)
		if(K.Owner==usr&&!K.Tackling&&K.CloneType!="KBunshin")
			if(K.Frozen)
				K.Frozen=0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
	for(var/mob/Summons/Controllable_Summons/K in world)
		if(K.Owner==usr)
			if(K.Frozen)
				K.Frozen=0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
	..()
	for(var/mob/Puppet/Talon/K in world)
		if(K.Owner==usr)
			if(K.Frozen)
				K.Frozen=0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
	for(var/mob/Puppet/Hawk/K in world)
		if(K.Owner==usr&K.Stun<=0&&K.ControlType=="Mouse")//just added the K.stun part ;o
			if(K.Frozen)
				K.Frozen=0
				walk_towards(K,src,,1)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
turf/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	if(usr.shunshin&&usr.Trait=="Speedy"&&!usr.CastingGenjutsu&&!usr.LegSliced&&!usr.Guarding)
		if(!src.density&&usr.cantele&&usr.FrozenBind==""&&!usr.Frozen&&usr.Stun<1)
		//	if(!usr.Running)
		//		usr<<"You aren't able to use Body Flicker Jutsu because you aren't running."
		//		return
			if(src.z!=usr.z)
				return
			if(usr.Clan=="Sabaku")
				usr.overlays-='Sshushin.dmi';usr.overlays+='Sshushin.dmi'
				spawn(6) usr.overlays-='Sshushin.dmi'
			else if(usr.UchihaMastery<100)
				usr.overlays -= 'Icons/Jutsus/Shushin.dmi';usr.overlays+='Icons/Jutsus/Shushin.dmi'
				spawn(6) usr.overlays-='Icons/Jutsus/Shushin.dmi'
			else
				usr.chakra-=usr.Mchakra*0.01/(usr.BodyFlickerMaster+1)

			var/turf/T = src
			var/TilesTraveled=0
			for(var/turf/LA in getline(usr,T))
				if(!usr.Running)
					if(usr.BodyFlickerDistance<=1)//&&TilesTraveled>=usr.BodyFlickerDistance+1)
						if(TilesTraveled>=4)
							break
					if(usr.BodyFlickerDistance>=2&&usr.BodyFlickerDistance<3)
						if(TilesTraveled>=5)
							break
					if(usr.BodyFlickerDistance>=3)
						if(TilesTraveled>=usr.BodyFlickerDistance+1)
							break
		//		if(!usr.Running&&TilesTraveled>=usr.BodyFlickerDistance+1)
		//			break
				if(TilesTraveled>=usr.BodyFlickerDistance+6)
					break
				if(istype(LA,/turf/Buildings/zDensity))
					return
				else
					usr.loc=LA
					TilesTraveled++
				sleep(0)
			if(usr.SelfHeal)
				usr.SelfHeal=0
			if(usr.Trait3!="Unyielding")
				usr.chakra-=usr.Mchakra*0.02/(usr.BodyFlickerMaster+1)
			if(usr.UchihaMastery<100)
				usr.shunshin=0
			else if(usr.chakra<usr.Mchakra*0.5||usr.stamina<usr.maxstamina*0.33)
				usr<<output("Você nao tem a força necessaria para continuar seu uso rapido de Shunshin.","Attack")
				usr.shunshin=0
	else if(usr.BodyFlickerFlight==1&&!usr.SoundSpinningKick&&!usr.LegSliced&&!usr.Guarding&&usr.FrozenBind==""&&!usr.Frozen&&usr.Stun<1&&!usr.resting&&!usr.caught&&usr.Status!="Asleep")
		var/mob/USER
		if(usr.controlled)
			USER=usr.controlled
		else
			USER=usr
		var/turf/T = src
		var/TilesTraveled=0
		USER.chakra-=usr.Mchakra*0.007
		if(!usr.Running)
			usr<<"Você nao é capaz de usar Shunpo porque você nao está correndo."
			return
		if(usr.z!=src.z)
			usr<<"Eu te disse multiplas vezes para nao fazer isso...e você continua tentando.."
			usr.health-=1500
			usr.deathcount+=10
			return
		for(var/turf/LA in getline(USER,T))
			if(TilesTraveled>=10)
				break
			if(istype(LA,/turf/Buildings/zDensity))
				return
			else if(istype(LA,/turf/Blank))
				return
			else if(istype(LA,/turf/Buildings/House1/Passage))
				return
			else
				USER.loc=LA
				TilesTraveled++
			usr.overlays -= 'Icons/Jutsus/Shushin.dmi';usr.overlays+='Icons/Jutsus/Shushin.dmi'
			spawn(6) usr.overlays-='Icons/Jutsus/Shushin.dmi'
	//		var/obj/Jutsu/Elemental/Raiton/R=new()
	//		R.icon_state="Flight";R.loc=src;R.layer=6
	//		spawn(5)
	//			del(R)
			flick("zan",usr)
			usr.loc=src
	if(usr.FTG_Mode)
		if(!src.density&&usr.cantele&&usr.FrozenBind==""&&!usr.Frozen&&usr.Stun<1)
			if(!usr.Running)
				usr<<"Você nao é capaz de usar a técnica do Deus do Trovão voador porque você nao esta correndo."
				return
			WarpEfx2(usr.x,usr.y,usr.z)
			spawn(1)
				flick("zan",usr)
				usr.loc=src
			usr.chakra-=rand(125,145)


	for(var/mob/Clones/Clone/K in world)
		if(usr&&K.Owner==usr&&!K.Tackling&&K.CloneType!="KBunshin")
			if(usr&&K.Frozen&&usr.client)
				K.Frozen=0
				walk_to(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_to(K,src)
	for(var/mob/Summons/Controllable_Summons/K in world)
		if(K.Owner==usr)
			if(K.Frozen)
				K.Frozen=0
				walk_towards(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
	if(usr.Clan=="Aburame")
		for(var/mob/Bugs/Kekkai/K in usr.BugsInWorld)
			if(K.Frozen)
				K.Frozen = 0
				walk_to(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
		for(var/mob/Bugs/SpecialSwarm/S in usr.BugsInWorld)
			if(S.Controllable)
				walk_to(S,src)
	if(usr.ShurikenMode)
		for(var/obj/WEAPONS/Shuriken/A in view(10,usr))
			if(A.icon_state=="throw")
				walk_to(A,src)
				usr.chakra-=8
	if(usr.Clan=="Inuzuka")
		for(var/mob/pet/P in world)
			if(P.Owner == usr&&P.Frozen == 0&&P.FrozenBind=="")
				if(prob(2))
					usr.Training+=0.1;if(usr.Training>50) usr.Training=50
				if(prob(2))
					usr.SpeedTraining+=0.1;if(usr.SpeedTraining>5) usr.SpeedTraining=5
				walk_to(P,src,1,1)
			else
				..()
	if(usr.Clan=="Kumojin")
		for(var/mob/NPC/KumojinSpider/AK in world)
			if(AK.Owner==usr)
				if(AK.Frozen||AK.knockedout)
					return
				else
					walk_to(AK,src)
	..()
obj/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	for(var/mob/Clones/Clone/K in world)
		if(K&&K.Owner==usr&&usr&&!K.Tackling&&K.CloneType!="KBunshin")
			if(K.Frozen)
				K.Frozen=0
				walk_to(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_to(K,src)
	if(usr&&usr.ShurikenMode)
		for(var/obj/WEAPONS/Shuriken/A in view(10,usr))
			if(A.icon_state=="throw")
				walk_to(A,src)
				usr.chakra-=8
	if(usr&&usr.Clan=="Aburame")
		for(var/mob/Bugs/Kekkai/K in usr.BugsInWorld)
			if(K.Frozen)
				K.Frozen = 0
				walk_to(K,src)
				K.moving=1
				sleep(5)
				K.Frozen=1
				K.moving =0
			else
				walk_towards(K,src)
		for(var/mob/Bugs/SpecialSwarm/S in usr.BugsInWorld)
			if(S.Controllable)
				walk_to(S,src)
	if(usr&&usr.Clan=="Inuzuka")
		for(var/mob/pet/P in world)
			if(P.Owner == usr&&P.Frozen == 0&&P.FrozenBind=="")
				if(prob(2))
					usr.Training+=0.1;if(usr.Training>50) usr.Training=50
				if(prob(1))
					usr.SpeedTraining+=0.1;if(usr.SpeedTraining>5) usr.SpeedTraining=5
				walk_to(P,src,1,1)
			else
				..()
	if(usr&&usr.Clan=="Kumojin")
		for(var/mob/NPC/KumojinSpider/AK in world)
			if(AK.Owner==usr)
				if(AK.Frozen||AK.knockedout)
					return
				else
					walk_to(AK,src)
	else
		..()
	..()


/*Clone Jutsu:
Creates a clone of the user. Not a real clone.
*/
mob/proc/BunshinTechniques(Number)
	set background = 1
	src.ChakraDrain(9000)
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/mob/Clones/Clone/A=new();
	var/obj/SmokeCloud/S=new()
	A.RunningSpeed=src.RunningSpeed;
	A.Acceleration=src.Acceleration;
	A.Running=1
	for(var/mob/M in range(10,src))
//		sleep(1)
		spawn()
			if(src==M.target&&M.client)
				if(Number>1000&&M.Focus<250)
					M.DeleteTarget()
					M.target=A;var/image/I = image('Icons/target1.dmi',A);
					M<<I
				else
					if(M.Indigo&&M.IndigoBlock)
						return
					if(M.Focus>400&&prob(50))
						M.DeleteTarget()
				//	else
				//		M.DeleteTarget()
//	if(A)//Lag fix 6/23/2013
	A.name="[src]";A.Owner=src;A.health=1
	A.icon=src.icon;A.overlays+=src.overlays
	A.RunningSpeed=src.RunningSpeed;A.Acceleration=src.Acceleration
	A.loc=locate(src.x+1,src.y,src.z);
	S.loc=locate(A.x,A.y,A.z)
	var/mob/Clones/Clone/Q=A
//	spawn(600)
	spawn(150)
		del(Q)

/*Clone Trick Jutsu:
Creates a clone of the user that dashes forward. Not a real clone.
*/
mob/proc/BunshinSubsitutionTechniques(Number)
	set background = 1
	src.ChakraDrain(2000)
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/mob/Clones/Clone/A=new();var/obj/SmokeCloud/S=new()
	A.RunningSpeed=src.RunningSpeed;A.Acceleration=src.Acceleration;A.Running=1
	for(var/mob/M in range(12,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=A
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',A);M<<I
			else
				M.target=null

	A.name="[src]";A.Owner=src;A.health=1
	A.icon=src.icon;A.overlays+=src.overlays
	A.RunningSpeed=src.RunningSpeed;A.Acceleration=src.Acceleration
	A.loc=locate(src.x+1,src.y,src.z);S.loc=locate(A.x,A.y,A.z)
	walk(A,src.dir)
	var/mob/Clones/Clone/X=A
	spawn(25)
		del(X)

/*Shadow Clone Jutsu:
Creates a clone of the user that is controllable.
*/
mob/proc/KageBunshin(Number)
	set background = 1
	var/ChakraLoss=src.chakra*0.5;src.chakra-=ChakraLoss
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/mob/Clones/Clone/K=new();
	var/obj/SmokeCloud/S=new()
	for(var/mob/M in range(15,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
			else
				M.target=null
	K.loc=locate(src.x,src.y,src.z);S.loc=locate(src.x,src.y,src.z)
	src.controlled=K;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
	if(K)
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
			if(!BAD.Find(V))
				K.vars[V] = src.vars[V]
		K.RunningSpeed=5;K.Running=1;K.density=1
		K.icon=src.icon;K.overlays+=src.overlays
		K.name="[src.name]";K.Owner=src
		K.tai=K.tai/2;K.nin=K.nin/2;K.gen=K.gen/2
		if(Number>100)
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
		K.Running=1;K.RunningSpeed=5;src.KBunshinOn=1
		K.icon_state="running";K.CloneType="KBunshin";K.Clone=1;K.cansave=0

mob/proc/KageBunshinSubstitution(Location,mob/ReferenceMob)
	set background = 1
	var/ChakraLoss=src.chakra*0.5;src.chakra-=ChakraLoss
	src.Handseals(1)
	if(src.HandsSlipped) return
	if(!Location) return
	if(!ReferenceMob)
		ReferenceMob=src
	var/mob/Clones/Clone/K=new()
	for(var/mob/M in range(15,src))
		if(src==M.target)
			if(M.Focus<src.Focus)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
			else
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				M.target=null
	K.loc=Location
	src.controlled=K;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
	if(K)
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
			if(!BAD.Find(V))
				K.vars[V] = src.vars[V]
		K.RunningSpeed=5;K.Running=1;K.density=1
		K.icon=ReferenceMob.icon;K.overlays+=ReferenceMob.overlays
		K.name="[ReferenceMob.name]";K.Owner=src
		K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
		K.Running=1;K.RunningSpeed=5;src.KBunshinOn=1
		K.icon_state="running";K.CloneType="KBunshin";K.Clone=1;K.cansave=0
/*Multi-Shadow Clone Jutsu:
Creates multiple clones of the user.
*/
mob/proc/Multi_Shadow_Clone(Number)
	set background = 1
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/Control=round((src.ChakraC)*0.1)
	for(var/mob/M in range(15,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=null
				for(var/image/x in M.client.images)
					sleep(1)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
			else
				M.target=null
	if(Control<1)
		Control=rand(1,2)
	if(Control>5)
		Control=rand(4,5)
	src<<"Aperte Z para cancelar antes!"
	src.icon_state="handseal"
	var/CurrentControl=1
	while(Control>0&&src.icon_state=="handseal")
		sleep(1)
		if(src.chakra<=500)
			Control=0
			CurrentControl=0
			return
		var/list/BAD = list("locs","KagDance","cansave","icon_state","RasenganD","ChidoriD","Rasenganon","Chidorion","WeaponInRightHand","WeaponInLeftHand","LeftHandSheath","RightHandSheath","GateIn","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath","Owner","CopyMode","ChargedChakraForPunch")
		if(CurrentControl==1)
			for(var/turf/T in oview(1))
				if(prob(50)&&src.chakra>500)
					var/mob/Clones/Clone/K=new();K.loc=T;K.Owner=src;K.CloneType="TKageBunshin"
					var/obj/SmokeCloud/S=new();S.loc=T
					sleep(1)
					src.chakra-=rand(200,300)
					for(var/V in src.vars)
						if(!BAD.Find(V))
							K.vars[V] = src.vars[V]
					if(K)
						K.MoveDelay=1;K.health=1;K.stamina=0;K.icon=src.icon;K.overlays+=src.overlays
						K.name="[src.name]";K.tai=K.tai/70;K.nin=K.nin/70;K.gen=K.gen/70
						K.Clone=1;K.Running=1;K.CloneType="TKageBunshin"
						K.icon_state="running"
						//if(K.KagDance=="Tessenka") K.KagDance="";K.Clone=1;K.cansave=0
		else
			for(var/turf/T in oview(CurrentControl))
				if(!(T in oview(CurrentControl--)))
					if(prob(50)&&src.chakra>500)
						var/mob/Clones/Clone/K=new();K.loc=T;K.Owner=src;K.CloneType="TKageBunshin"
						var/obj/SmokeCloud/S=new();S.loc=T
						sleep(1)
						src.chakra-=rand(200,300)
						for(var/V in src.vars)
							if(!BAD.Find(V))
								K.vars[V] = src.vars[V]
						if(K)
							K.MoveDelay=1;K.health=1;K.stamina=0;K.icon=src.icon;K.overlays+=src.overlays
							K.name="[src.name]";K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
							K.Clone=1;K.Running=1;K.CloneType="TKageBunshin";
							K.icon_state="running"
							//if(K.KagDance=="Tessenka") K.KagDance="";K.Clone=1;K.cansave=0
		if(CurrentControl>=Control)
			CurrentControl=0;Control=0
		CurrentControl+=1;Control-=1
		sleep(1)

/*Shadow Clone Tackle Jutsu:
Causes all clones to tackle any target.
*/
mob/var/list/TackleList
mob/proc/ShadowCloneTackle()
	var/mob/M=src.target
	if(!src.knockedout)
		return
	TackleList=list();//resets list to avoid null spots.
	for(var/mob/Clones/Clone/A in oview(10))
		if(A.Owner==src&&A.CloneType=="TKageBunshin")
			A.Tackling=1;
			walk_towards(A,M)
			TackleList.Add(A);//adds the bunshin to a list
	sleep(80)//Delay
	for(var/mob/Clones/Clone/A in TackleList)//checks the list which is a list of ones that moved.
		if(A.Owner==src&&A.CloneType=="TKageBunshin")
			A.Tackling=0;
			walk(A,0)//stops them
			TackleList.Remove(A)//removes them from the list

/*Windmill Clone Attack Jutsu:
Causes all clones to tackle any target.
*/
mob/proc/WindmillCloneAttack(Number)
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/mob/Clones/Clone/K=new();var/obj/SmokeCloud/S=new()
	for(var/mob/M in range(15,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
			else
				M.target=null

	K.loc=locate(src.x,src.y,src.z);S.loc=locate(src.x,src.y,src.z)
	if(K)
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","icon","overlays","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
			if(!BAD.Find(V))
				K.vars[V] = src.vars[V]
		K.RunningSpeed=5;K.Running=1;K.Acceleration=10
		K.name="[src.name]";K.Owner=src
		K.tai=K.tai/2;K.nin=K.nin/2;K.gen=K.gen/2
		if(Number>100)
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
		src.KBunshinOn=1
		K.icon_state="running";K.CloneType="KBunshin"
		K.icon='Icons/windmill.dmi';K.layer=MOB_LAYER-1;K.Clone=1
	walk(K,src.dir)
	spawn(35)
		K.Death(K)

/*Shadow Punch Jutsu:
Sends a Shadow Clone directly forward for an attack. Unlike the other Shadow Clones, it holds all values.
*/
mob/proc/Shadow_Clone_Punch(Number)
	var/ChakraLoss=src.chakra*0.5;src.chakra-=ChakraLoss
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/mob/Clones/Clone/K=new();var/obj/SmokeCloud/S=new()
	for(var/mob/M in range(15,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
			else
				M.target=null
	K.loc=locate(src.x,src.y,src.z);S.loc=locate(src.x,src.y,src.z)
	if(K)
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
			if(!BAD.Find(V))
				K.vars[V] = src.vars[V]
		K.RunningSpeed=15;K.Running=1
		K.icon=src.icon;K.overlays+=src.overlays
		K.name="[src.name]";K.Owner=src
		K.tai=K.tai/2;K.nin=K.nin/2;K.gen=K.gen/2
		if(Number>100)
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
		K.Running=1;K.RunningSpeed=15;src.KBunshinOn=1
		K.icon_state="running";K.CloneType="TBunshin"
		walk(K,src.dir)
	spawn(50)
		del(K)

/*Exploding Clone Jutsu:
Causes all clones to explode.
*/
mob/proc/Shadow_Clone_Explosion()
	src.ChakraDrain(10000)
	src.Handseals(10)
	if(src.HandsSlipped) return
	spawn()
		for(var/mob/Clones/Clone/B in world)
			if(B.Owner==src&&B.CloneType!="Bunshin")//12/20/12
				var/obj/Jutsu/Explosion/K=new();K.loc=B.loc;K.Owner=src
				del(B)


//SleepingInTheSky
mob/proc/SleepingInTheSky(Number)
	var/ChakraLoss=src.chakra*0.5;src.chakra-=ChakraLoss
	src.Handseals(1)
	if(src.HandsSlipped) return
	var/mob/Clones/Clone/K=new();var/obj/SmokeCloud/S=new()
	for(var/mob/M in range(15,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
			else
				M.target=null
	K.loc=locate(src.x,src.y,src.z);S.loc=locate(src.x,src.y,src.z)
	if(K)
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
			if(!BAD.Find(V))
				K.vars[V] = src.vars[V]
		K.RunningSpeed=15;K.Running=1;K.density=1
		K.icon=src.icon;K.overlays+=src.overlays
		K.name="[src.name]";K.Owner=src
		K.tai=K.tai/2;K.nin=K.nin/2;K.gen=K.gen/2
		if(Number>100)
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
		K.Running=1;K.RunningSpeed=15
		K.icon_state="running";K.CloneType="KBunshin";K.Clone=1;K.CloneType="TBunshin";K.SleepingInTheSky=1


