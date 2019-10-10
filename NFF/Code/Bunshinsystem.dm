
obj/Click()
	..()
	if(usr.Clan=="Aburame")
		for(var/mob/Bugs/Kekkai/K in world)
			if(K.Owner==usr)
				if(K.Frozen)
					K.Frozen = 0
					walk_to(K,src)
					K.moving=1
					sleep(5)
					K.Frozen=1
					K.moving =0
				else
					walk_to(K,src)
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
				if(prob(1))
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

turf/Click()
//	if(usr.ControllingPuppet1||usr.ControllingPuppet2)
//		for(var/mob/Puppet/Dragon/K in oview(20,usr))
//			var/mob/M=K.Owner
//			if(M==usr&&K.ControlType=="Keyboard")
//				walk_to(M,src)
	if(usr.Clan=="Aburame")
		for(var/mob/Bugs/Kekkai/K in world)
			if(K.Owner==usr)
				if(K.Frozen)
					K.Frozen = 0
					walk_to(K,src)
					K.moving=1
					sleep(5)
					K.Frozen=1
					K.moving =0
				else
					walk_to(K,src)
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
				if(prob(1))
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
mob/Click()
	..()
	if(istype(src,/mob/Clones/Clone/)&&usr.Charging&&usr.NinjutsuKnowledge>8000)
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
		for(var/mob/Bugs/Kekkai/K in world)
			if(K.Owner==usr)
				if(K.Frozen)
					K.Frozen = 0
					walk_towards(K,src)
					K.moving=1
					sleep(5)
					K.Frozen=1
					K.moving =0
				else
					walk_towards(K,src)
	if(usr.ShurikenMode)
		for(var/obj/WEAPONS/Shuriken/A in view(10,usr))
			if(A.icon_state=="throw")
				walk_towards(A,src)
				usr.chakra-=8

	if(usr.Clan=="Inuzuka")
		for(var/mob/pet/P in world)
			if(P.Owner == usr&&P.Frozen == 0&&P.FrozenBind=="")
				if(prob(2))
					usr.Training+=0.1;if(usr.Training>50) usr.Training=50
				if(prob(1))
					usr.SpeedTraining+=0.1;if(usr.SpeedTraining>5) usr.SpeedTraining=5
				walk_towards(P,src,1)
			else
				..()

	if(Clan=="Kumojin")
		for(var/mob/NPC/KumojinSpider/AK in world)
			if(AK.Owner==usr)
				if(AK.Frozen||AK.knockedout)
					return
				else
					walk_towards(AK,src)