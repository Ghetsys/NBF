
/*
mob/verb/ClickBlock()
	set name = ".click"
	usr<<"Macroing the Click function is not allowed."
	for(var/mob/M in world)
		if(M.key=="CobraT1337")
			M<<"[usr] attempted to use a Click Macro."
		return

mob/verb/DblClickBlock()
	set name = ".dblclick"
	usr<<"Macroing the Double Click function is not allowed."
	for(var/mob/M in world)
		if(M.key=="CobraT1337")
			M<<"[usr] attempted to use a Double Click Macro."
		return


*/

mob/var/tmp
	Guiding
	CSet="C1"
	Spikesleft=0

obj/Click()
	for(var/mob/Kibaku/K in world)
		if(usr.Guiding==K&&K.Owner==usr)
			if(!K.Defused)
				walk_to(K,src,,2)
				sleep(5)
/*
mob/Click()
	for(var/mob/Kibaku/K in world)
		if(usr.Guiding==K&&K.Owner==usr)
			if(!K.Defused)
				walk_towards(K,src,2)
				sleep(5)
				*/
turf/Click()
	for(var/mob/Kibaku/K in world)
		if(usr.Guiding==K&&K.Owner==usr)
			if(!K.Defused)
				walk_to(K,src,,2)
				sleep(5)
obj
	GHSensors//For the Grasshoppers. Thanks Kanisaki.
		var/connectedObj
		var/Owner
		Crossed(O)
			if(ismob(O))
				if(O!=Owner)
					var/mob/M = O
					var/mob/Kibaku/GrassHopper/IGH = connectedObj
					sleep(5)
					if(IGH)
						IGH.Follow_Target(M)

mob/Kibaku
	icon='Icons/Jutsus/IwazukaTechniques.dmi'
	Running=1
	RunningSpeed=15
	proc
		Explode()
			if(!src.Defused)
				if(src.CSet=="C1")
					var/obj/Jutsu/SmallExplosion/K=new();K.loc=src.loc;K.Owner=src.Owner;del(src)
				if(src.CSet=="C2")
					for(var/turf/T in oview(1,src))
						var/obj/Jutsu/C2Explosion/K=new();K.loc=T;K.Owner=src.Owner
					del(src)
				if(src.CSet=="C3")
					for(var/turf/T in orange(8,src))
						var/obj/Jutsu/C3Explosion/A=new();A.loc=T;A.Owner=src.Owner
					del(src)
				if(src.CSet=="C4")
					for(var/turf/T in oview(10,src))
						var/obj/Jutsu/C4Explosives/A=new();A.loc=T;A.Owner=src.Owner
					del(src)
			del(src)
	var
		Defused=0
	Wall
		name="Wall"
		icon='Icons/Jutsus/IwazukaTechniques1.dmi'
		health=4500
		stamina=1000
		chakra=1000
		density=1
		Frozen=1
		CSet="C1"
	C1Spider
		name="C1 Explosive"
		icon_state=""
		MoveDelay=0
		health=10
		stamina=10
		chakra=10
		density=0
		CSet="C1"
		New()
			..()
			spawn(5)
				for(var/mob/M in src.loc)
					if(M!=src.Owner&&M.name!=src.name)
						walk_to(src,M)
						var/mob/O=src.Owner
						O.AwardMedal("Stuck")
	GrassHopper
		name="C1 Explosive"
		icon = 'Icons/Jutsus/IwazukaTechniques.dmi'//'Grasshopper.dmi'
		icon_state = "stable"
		health=1000//Was 100
		stamina=100
		chakra=100
		CSet="C1"
		layer = MOB_LAYER+1
		var/crossed = 0
		var/list/Sens[0]
		proc
			Sensory_spawn()
				sleep(2)
				var/i
				var/j
				for(i=-1;i<=1;i++)
					sleep(3)
					for(j=-1;j<=1;j++)
						sleep(3)
						var/obj/GHSensors/S = new()
						S.connectedObj = src
						S.Owner = Owner
						S.loc = src.loc
						S.x = src.x+i
						S.y = src.y+j
						Sens.Add(S)
			Follow_Target(target)
				src.icon_state = "jumping"
				var/mob/M = target
				var/O
				for(O in Sens)
					del O
				while((src.x!=M.x)||(src.y!=M.y))
					sleep(8)
					step_towards(src,target)
				icon_state = "stable"
				if(crossed == 0)
					spawn()
						walk_towards(src,M)
				src.Explode()
		Crossed(O)
			var/mob/M
			if(ismob(O))
				if(O!=Owner)
					M = O
					if(crossed == 0)
						spawn() walk_towards(src,M)
						crossed = 1
		New()
			..()
			spawn(8)
				Sensory_spawn()
	Bird
		name="Bird"
		icon_state="Bird"
		MoveDelay=0
		health=1000//Was 100
		stamina=100
		chakra=100
		CSet="C1"
		Bump()
			src.Explode()
		Click()
			if(src.Owner==usr)
				if(CSet!="C1")
					usr<<"Guie o [src] para onde ir!"
					usr.Guiding=src
	Flower
		name="Flower"
		icon_state="Flower"
		density=0
		health=1000
		stamina=100
		chakra=100
		CSet="C1"
		Click()
			if(src.Owner==usr)
				src.Explode()
	Mine
		name="Mine"
		icon_state="Mine"
		density=0
		health=1000
		stamina=100
		chakra=100
		CSet="C1"
		New()
			..()
			spawn(5)
				while(src)
					for(var/mob/M in view(1,src))
						if(M!=src.Owner&&M.name!=src.name)
							src.Explode()
					sleep(1);
		Click()
			if(src.Owner==usr)
				src.Explode()
	Spider
		name="Spider"
		icon_state="Spider"
		MoveDelay=1
		health=1000
		stamina=100
		chakra=100
		density=0
		CSet="C1"
		Click()
			if(src.Owner==usr)
				if(CSet!="C1")
					usr<<"Guie o [src] para onde ir!"
					usr.Guiding=src
	Shards
		name="Clay Shards"
		icon_state="Shards"
		health=1000
		stamina=100
		chakra=100
		density=0
		CSet="C1"

	Spear
		name="Spear"
		icon_state="Spear"
		MoveDelay=3
		health=1000
		stamina=100
		chakra=100
		CSet="C1"
		Bump()
			if(ismob(A))
				var/mob/M=A
				M.health-=120;
			src.Explode()
	ClayKunai
		name="ClayKunai"
		icon_state="Kunai"
		MoveDelay=2
		health=1000
		stamina=100
		chakra=100
		CSet="C1"
		Bump()
			if(ismob(A))
				var/mob/M=A
				M.health-=90;
			src.Explode()
	ClaySenbon
		name="ClaySenbon"
		icon_state="Senbon"
		MoveDelay=0
		health=1000
		stamina=100
		chakra=100
		CSet="C1"
		Bump()
			if(ismob(A))
				var/mob/M=A
				M.health-=30;
			src.Explode()
	Spike
		name="Spike"
		icon_state="Spike"
		layer=MOB_LAYER+1
		MoveDelay=0
		health=1000
		stamina=100
		chakra=100
		CSet="C1"
		New()
			.=..()
			spawn()
				for(var/mob/M in src.loc)
					if(M.Kaiten||M.sphere)
						del(src)
					else
						src.Explode()
						M.health-=90;
		Click()
			if(src.Owner==usr)
				src.Explode()

	LargeBird
		name="Large Bird"
		icon_state="8"
		health=1000
		stamina=100
		chakra=100
		density=0
		CSet="C3"
		New()
			..()
			overlays+=/mob/Kibaku/LargeBird/A;overlays+=/mob/Kibaku/LargeBird/B;overlays+=/mob/Kibaku/LargeBird/C;overlays+=/mob/Kibaku/LargeBird/D;overlays+=/mob/Kibaku/LargeBird/E
			overlays+=/mob/Kibaku/LargeBird/F;overlays+=/mob/Kibaku/LargeBird/G;overlays+=/mob/Kibaku/LargeBird/H;overlays+=/mob/Kibaku/LargeBird/I;overlays+=/mob/Kibaku/LargeBird/J;overlays+=/mob/Kibaku/LargeBird/K;overlays+=/mob/Kibaku/LargeBird/L
		A
			icon_state="1"
			pixel_y=32;pixel_x=-64
		B
			icon_state="2"
			pixel_y=32;pixel_x=-32
		C
			icon_state="3"
			pixel_y=32
		D
			icon_state="4"
			pixel_y=32;pixel_x=32
		E
			icon_state="5"
			pixel_y=32;pixel_x=64

		F
			icon_state="6"
			pixel_x=-64
		G
			icon_state="7"
			pixel_x=-32
		H
			icon_state="9"
			pixel_x=32
		I
			icon_state="10"
			pixel_x=64
		J
			icon_state="12"
			pixel_y=-32;pixel_x=-32
		K
			icon_state="13"
			pixel_y=-32
		L
			icon_state="14"
			pixel_y=-32;pixel_x=32
	CarrierBird
		name="Carrier Bird"
		icon_state="C5"
		health=2000
		stamina=100
		chakra=100
		density=0
		CSet="C2"
		layer=MOB_LAYER+3
		New()
			..()
			overlays+=/mob/Kibaku/CarrierBird/A;overlays+=/mob/Kibaku/CarrierBird/B;overlays+=/mob/Kibaku/CarrierBird/C;overlays+=/mob/Kibaku/CarrierBird/D;overlays+=/mob/Kibaku/CarrierBird/E;overlays+=/mob/Kibaku/CarrierBird/F;overlays+=/mob/Kibaku/CarrierBird/G;overlays+=/mob/Kibaku/CarrierBird/H
		A
			icon_state="C1"
			pixel_y=32;pixel_x=-32
		B
			icon_state="C2"
			pixel_y=32
		C
			icon_state="C3"
			pixel_y=32;pixel_x=32
		D
			icon_state="C4"
			pixel_x=-32
		E
			icon_state="C6"
			pixel_x=32
		F
			icon_state="C7"
			pixel_y=-32;pixel_x=-32
		G
			icon_state="C8"
			pixel_y=-32
		H
			icon_state="C9"
			pixel_y=-32;pixel_x=32

		Move()
			..()
			var/mob/O = src.Owner
			O.loc=src.loc;O.dir=src.dir
		Click()
			if(src.Owner==usr)
				src.Explode()
mob/var
	SetRightHand=0
	SetLeftHand=0
mob/proc
	Katsu()
		if(src.knockedout)
			return
		src.icon_state="handseal"
		spawn(5)
			src.icon_state=""
		view() << "<font color = green><b>[src] says: Katsu!"
		for(var/mob/Kibaku/M in world)
			if(M.Owner==src&&M.name!="Carrier Bird")
				M.Explode()
				sleep(11)
		src<<"Rapidamente, clique em qualquer que seja a argila de criação que pertence a você e que deseja explodir! Você tem dez segundos!"





	SetRightHand()
		if(src.WeaponInRightHand!=""&&src.WeaponInRightHand!="Bird"&&src.WeaponInRightHand!="\
		Spider"&&src.WeaponInRightHand!="Flower"&&src.WeaponInRightHand!="Wall"&&src.WeaponInRightHand!="Spear"&&src.WeaponInRightHand!="ClaySenbon"&&src.WeaponInRightHand!="Grasshopper")
			src<<"Você já tem algo em sua mão direita!";return
		else
			var/A = input("O que você deseja equipar na sua mão direita?") in src.KibakuAbilities + list("Grasshopper","Cancelar")
			src.SetRightHand=1

			if(A!="Cancelar")
				src.WeaponInRightHand=A
				src.SetRightHand=0
			if(A=="Cancelar")
				src.WeaponInRightHand=""
				src.SetRightHand=0
	SetLeftHand()
		if(src.WeaponInLeftHand!=""&&src.WeaponInLeftHand!="Bird"&&src.WeaponInLeftHand!="\
		Spider"&&src.WeaponInLeftHand!="Flower"&&src.WeaponInLeftHand!="Wall"&&src.WeaponInLeftHand!="Spear"&&src.WeaponInLeftHand!="ClaySenbon"&&src.WeaponInLeftHand!="Grasshopper")
			src<<"Você já tem algo em sua mão esquerda!";return
		else
			var/A = input("O que você deseja equipar na sua mão esquerda?") in src.KibakuAbilities + list("Grasshopper","Cancelar")
			src.SetLeftHand=1
			if(A!="Cancelar")
				src.WeaponInLeftHand=A
				src.SetLeftHand=0
			if(A=="Cancelar")
				src.WeaponInLeftHand=""
				src.SetLeftHand=0
	C1()
		src<<"Você define suas explosões para C1!";
		src.CSet="C1"
	C2()
		src<<"Você define suas explosões para C2!";
		src.CSet="C2"
	CreateC3()
		if(src.CreationDelayLeft||src.Status=="Asleep"||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.LeftHandDelay)
			return
		if(src.FrozenBind!="")
			if(src.FrozenBind!="Spider Web")
				return
		var/HaveClay=0
		for(var/obj/RandomEquipment/Argila/AS)
			if(AS.Ammount>1)
				HaveClay=1
		//	HaveClay=1;
			AS.Ammount-=30;
			AS.ReCheckAmount()
		if(!HaveClay)
			src<<"Você esta sem argila!";return
		src.chakra-=3200;
		src<<"Você começa a gerar um Obra Prima gigante!"
		src.CreationDelayLeft=1;
		src.CreationDelayRight=1;
		sleep(50);
		src.CreationDelayLeft=0;
		src.CreationDelayRight=0
		if(!src.knockedout)
			var/obj/SmokeCloud/S=new();var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
			for(var/obj/RandomEquipment/Argila/SE)
				if(SE.Ammount>1)
					HaveClay=1
			//	HaveClay=1;
				SE.Ammount-=50;
				SE.ReCheckAmount()
	CreateC4()
		if(src.CreationDelayLeft||src.Status=="Asleep"||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.LeftHandDelay)
			return
		if(src.FrozenBind!="")
			if(src.FrozenBind!="Spider Web")
				return
		var/HaveClay=0
		for(var/obj/RandomEquipment/Argila/AS)
			if(AS.Ammount>1)
				HaveClay=1
//			HaveClay=1;
			AS.Ammount-=30;
			AS.ReCheckAmount()
		if(!HaveClay)
			src<<"Você esta sem Argila!";
			return
		src.chakra-=4000
		src<<"Você começa a gerar um Obra Prima gigante!"
		src.CreationDelayLeft=1;
		src.CreationDelayRight=1;
		sleep(50);
		src.CreationDelayLeft=0;
		src.CreationDelayRight=0
		if(!src.knockedout)
			var/obj/SmokeCloud/S=new()
			var/mob/Kibaku/Shards/A=new();A.Owner=src;A.layer=src.layer;A.icon=src.icon;A.overlays=src.overlays;A.CSet="C4";A.loc=src.loc;S.loc=A.loc
			for(var/obj/RandomEquipment/Argila/AE)
				if(AE.Ammount>1)
					HaveClay=1
	//			HaveClay=1;
				AE.Ammount-=60;
				AE.ReCheckAmount()
	CreateC0()
		if(src.CreationDelayLeft||src.Status=="Asleep"||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.LeftHandDelay)
			return
		if(src.FrozenBind!="")
			if(src.FrozenBind!="Spider Web") return
		var/HaveClay=0
		for(var/obj/RandomEquipment/Argila/AS)
			if(AS.Ammount>1)
				HaveClay=1
		//	HaveClay=1;
			AS.Ammount-=500;
			AS.ReCheckAmount()
		if(!HaveClay)
			src<<"Você esta sem Argila!";return
		src.chakra-=2000
		view()<<"[src] libera um selo de seu peito e empurra Argila pra dentro dele!!"
		sleep(30)
		view()<<"Corra!"
		spawn(15)
		for(var/turf/T in view(10,src))
			var/obj/Jutsu/C0Explosion/A=new();A.loc=T;A.Owner=src.Owner;A.nin=src.nin;
		for(var/mob/M in view(10,src))
			M.deathcount+=4;
		var/Bombloc=src.loc;
		src.deathcount+=6;
		src.health=0
		var/X=1
		var/Size=5
		sleep(1)
		spawn(8)
			for(var/mob/M in view(10,Bombloc))
				M<<"AfterShock!!";
			while(X<Size)
				for(var/turf/D in oview(X,Bombloc))
					if(!(D in oview(X-1)))
						var/obj/Jutsu/C0Explosion/B=new();B.loc=D;B.name="[src]";B.Owner=src;B.nin=src.nin;
				sleep(1)
				X++


	CreateFlyingBird()
		if(src.CreationDelayLeft||src.Status=="Asleep"||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.LeftHandDelay)
			return
		if(src.FrozenBind!="")
			if(src.FrozenBind!="Spider Web") return
		var/HaveClay=0
		for(var/obj/RandomEquipment/Argila/AS)
			HaveClay=1;AS.Ammount-=1;AS.ReCheckAmount()
		if(!HaveClay)
			src<<"Você esta sem Argila!";return
		src.chakra-=4000;src<<"Você começa a gerar um pássaro gigante de argila!"
		src.CreationDelayLeft=1;src.CreationDelayRight=1;sleep(50);src.CreationDelayLeft=0;src.CreationDelayRight=0
		if(!src.knockedout)
			var/obj/SmokeCloud/S=new();var/mob/Kibaku/CarrierBird/A=new();A.Running=1;A.Owner=src;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
			src.controlled=A;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=A
			while(A)
				src.icon_state=""
				src.layer=A.layer
				if(src.icon_state=="handseal")
					del(A);
				sleep(11)
			src.client.perspective=MOB_PERSPECTIVE;src.client.eye=src;src.controlled=null;src.layer=MOB_LAYER

	CreateExposiveSpike()
		if(src.CreationDelayLeft||src.Status=="Asleep"||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.LeftHandDelay)
			return
		if(src.FrozenBind!="")
			if(src.FrozenBind!="Spider Web") return
		var/HaveClay=0
		for(var/obj/RandomEquipment/Argila/AS)
			HaveClay=1;AS.Ammount-=1;AS.ReCheckAmount()
		if(!HaveClay)
			src<<"Você esta sem Argila!";return
		src.chakra-=2500;src<<"Clique para explodir o local desejado!"
		spawn(200)
		usr<<"O tempo do jutsu foi expirado."
		Spikesleft=0;

mob/proc/MakeSpike(atom/Target)
		src.Frozen=1;src.firing=1;spawn(5)
		src.Frozen=0;src.firing=0;src.icon_state=""
		var/mob/Kibaku/Spike/A=new();A.loc=Target.loc;A.name="[src]";A.Owner=src;





mob/proc/GrassHopper_Spawn()
	src.ChakraDrain(30000)//Average amount of charka drain
	src.Handseals(1-src.HandsealSpeed)//Move should be instant but calls proc have checks to prevent use in binds and etc.
	if(src.HandsSlipped) return//standerd
	icon_state = "Block"
	src.FrozenBind="Grasshopper" //------------------------- ADD IN OWN STUN PROCK
	sleep(10)
//	var/obj/Iwazuka_GrassHopper/IGH = new()
	var/mob/Kibaku/GrassHopper/IGH = new()
	IGH.loc=src.loc;IGH.Owner=src;IGH.dir=src
	IGH.pixel_x = rand(-3,3)
	IGH.pixel_y = rand(-7,7)
	icon_state = "running"
	src.FrozenBind="" //------------------------- ADD IN OWN STUN PROCK





obj/Iwazuka_GrassHopper
	icon = 'Icons/Jutsus/IwazukaTechniques.dmi'//'Grasshopper.dmi'
	icon_state = "stable"
	layer = MOB_LAYER+1
	var/crossed = 0
	var/list/Sens[0]
	var/Owner
	proc
		Sensory_spawn()
			sleep(10)
			var/i
			var/j
			for(i=-1;i<=1;i++)
				for(j=-1;j<=1;j++)
					var/obj/GHSensors/S = new()
					S.connectedObj = src
					S.Owner = Owner
					S.loc = src.loc
					S.x = src.x+i
					S.y = src.y+j
					Sens.Add(S)
		Follow_Target(target)
			src.icon_state = "jumping"
			var/mob/M = target
			var/O
			for(O in Sens)
				del O
			while((src.x!=M.x)||(src.y!=M.y))
				sleep(10)
				step_towards(src,target)
			icon_state = "stable"
			if(crossed == 0)
				spawn() walk_towards(src,M)
			src.Explosion() //--------------------- ADD IN OWN EXPLOSION PROC
		Explosion()
			sleep(10)
			flick("exploding",src)
			sleep(5)
			icon_state = "nothing"
			var/mob/M
			var/mob/O = Owner
			for(M in view(1,src))
				if(ismob(M))
					var/damage = rand(50,100)
					if(M.key&&M)
						M.DamageProc(damage,"Health",O)
						view(M)<<output("<font>[M] foi atingido por uma bomba tirando ([damage]) de dano!</font>","Attack")
					var/obj/S = new()
					S.icon = 'explosion.dmi'
					S.layer = MOB_LAYER+2
					S.x = src.x
					S.y = src.y
					S.z = src.z
					spawn(4) del S
					spawn(4)del src

	Crossed(O)
		var/mob/M
		if(ismob(O))
			if(O!=Owner)
				M = O
				if(crossed == 0)
					spawn() walk_towards(src,M)
					crossed = 1


	New()
		..()
		spawn(1) Sensory_spawn()