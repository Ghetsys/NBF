obj
 Boulder
  icon = 'Boulder.dmi'
  layer = MOB_LAYER+1
  a
   icon_state = "1"
   density = 1
  b
   icon_state = "2"
   density = 1
  c
   icon_state = "3"
   density = 1
  d
   icon_state = "4"
   density = 1
  e
   icon_state = "5"
   density = 1
  f
   icon_state = "6"
   density = 1
 BridgeBroken
  icon = 'BridgeBroken.dmi'
  layer = TURF_LAYER
  b
   icon_state = "4"
   density = 1
  c
   icon_state = "5"
   density = 1
  d
   icon_state = "8"
   density = 1
  e
   icon_state = "9"
   density = 1
  f
   icon_state = "10"
  g
   icon_state = "11"
  h
   icon_state = "12"
  i
   icon_state = "13"



turf
	reflexQuestCaveTo
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client && M.reflexOneQuest == 1)
					M.loc = locate(11,40,29)
				else
					usr<<"This cave is dark, its better not to enter.."
			else
				if(isobj(A)) del(A)
turf
	reflexQuestCave
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				usr<<"What happened..."
				M.GotoVillageHospital()
			else
				if(isobj(A)) del(A)
turf
	NMBaseEnter
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.loc=locate(pick(130,131),97,20)
	NMBaseExit
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.loc=locate(175,11,15)
turf
	CompleteTree
		layer=6
		icon='Map/Turfs/CompleteTree2.dmi'
	//	icon='Map/Turfs/NewTree.dmi'
		density=1
	BorderDensity
		density=0
		var/CanEnterFromNorth=1
		var/CanEnterFromSouth=1
		var/CanEnterFromEast=1
		var/CanEnterFromWest=1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(!src.CanEnterFromNorth)
					if(get_dir(src,M)==NORTH||get_dir(src,M)==NORTHEAST||get_dir(src,M)==NORTHWEST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
				if(!src.CanEnterFromEast) // If a mob cannot enter from the East direction of the turf. Meaning the player's direction is most likely west
					if(get_dir(src,M)==EAST||get_dir(src,M)==NORTHEAST||get_dir(src,M)==SOUTHEAST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
				if(!src.CanEnterFromSouth)
					if(get_dir(src,M)==SOUTH||get_dir(src,M)==SOUTHEAST||get_dir(src,M)==SOUTHWEST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
				if(!src.CanEnterFromWest)
					if(get_dir(src,M)==WEST||get_dir(src,M)==NORTHWEST||get_dir(src,M)==SOUTHWEST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
			if(isobj(A))
				var/obj/M = A
				if(!src.CanEnterFromNorth)
					if(get_dir(src,M)==NORTH||get_dir(src,M)==NORTHEAST||get_dir(src,M)==NORTHWEST) //And any side directions
						del(M)
					else
						return 1
				if(!src.CanEnterFromEast) // If a mob cannot enter from the East direction of the turf. Meaning the player's direction is most likely west
					if(get_dir(src,M)==EAST||get_dir(src,M)==NORTHEAST||get_dir(src,M)==SOUTHEAST) //And any side directions
						del(M)
					else
						return 1
				if(!src.CanEnterFromSouth)
					if(get_dir(src,M)==SOUTH||get_dir(src,M)==SOUTHEAST||get_dir(src,M)==SOUTHWEST) //And any side directions
						del(M)
					else
						return 1
				if(!src.CanEnterFromWest)
					if(get_dir(src,M)==WEST||get_dir(src,M)==NORTHWEST||get_dir(src,M)==SOUTHWEST) //And any side directions
						del(M)
					else
						return 1
			..()
		Exit(A)
			if(ismob(A))
				var/mob/M = A
				if(!src.CanEnterFromNorth)
					if(M.dir==NORTH||M.dir==NORTHEAST||M.dir==NORTHWEST) //Don't let them "hop" down.
						return 0
					else
						return 1
				if(!src.CanEnterFromEast)
					if(M.dir==EAST||M.dir==NORTHEAST||M.dir==SOUTHEAST) //Don't let them "hop" down.
						return 0
					else
						return 1
				if(!src.CanEnterFromSouth)
					if(M.dir==SOUTH||M.dir==SOUTHWEST||M.dir==SOUTHEAST) //Don't let them "hop" down.
						return 0
					else
						return 1
				if(!src.CanEnterFromWest)
					if(M.dir==WEST||M.dir==NORTHWEST||M.dir==SOUTHWEST) //Don't let them "hop" down.
						return 0
					else
						return 1
			if(isobj(A))
				var/obj/M = A
				if(!src.CanEnterFromNorth)
					if(get_dir(src,M)==NORTH||get_dir(src,M)==NORTHEAST||get_dir(src,M)==NORTHWEST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
				if(!src.CanEnterFromEast) // If a mob cannot enter from the East direction of the turf. Meaning the player's direction is most likely west
					if(get_dir(src,M)==EAST||get_dir(src,M)==NORTHEAST||get_dir(src,M)==SOUTHEAST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
				if(!src.CanEnterFromSouth)
					if(get_dir(src,M)==SOUTH||get_dir(src,M)==SOUTHEAST||get_dir(src,M)==SOUTHWEST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
				if(!src.CanEnterFromWest)
					if(get_dir(src,M)==WEST||get_dir(src,M)==NORTHWEST||get_dir(src,M)==SOUTHWEST) //And any side directions
						return 0 //Prevent them from entering.
					else
						return 1
			..()
area
	akatsneak
		density = 0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr <<"You enter a dreary cavern...what could lie ahead?"
				usr.loc = locate(50,5,40)
	lighting
		density=0
		icon='Dawn.dmi'
		layer=FLY_LAYER
	shadows
		icon='Map/Turfs/turfs.dmi'
		shadow1
			icon_state="Shadow1"
			layer=FLY_LAYER
		shadow2
			icon_state="Shadow2"
			layer=FLY_LAYER
		shadow3
			icon_state="Shadow3"
			layer=FLY_LAYER
		shadow4
			icon_state="Shadow4"
			layer=FLY_LAYER
		shadow5
			icon_state="Shadow5"
			layer=FLY_LAYER
		shadow6
			icon_state="Shadow6"
			layer=FLY_LAYER
		shadow7
			icon_state="Shadow7"
			layer=FLY_LAYER
		shadow8
			icon_state="Shadow8"
			layer=FLY_LAYER
		shadow9
			icon_state="Shadow9"
			layer=FLY_LAYER
		shadow10
			icon_state="Shadow10"
			layer=FLY_LAYER
		shadow11
			icon_state="Shadow11"
			layer=FLY_LAYER
		shadow12
			icon_state="Shadow12"
			layer=FLY_LAYER
		shadow13
			icon_state="Shadow13"
			layer=FLY_LAYER
		shadow14
			icon_state="Shadow14"
			layer=FLY_LAYER
		shadow15
			icon_state="Shadow15"
			layer=FLY_LAYER
		shadow16
			icon_state="Shadow16"
			layer=FLY_LAYER
		shadow17
			icon_state="Shadow17"
			layer=FLY_LAYER
		shadow18
			icon_state="Shadow18"
			layer=FLY_LAYER
		shadow19
			icon_state="Shadow19"
			layer=FLY_LAYER
		shadow20
			icon_state="Shadow20"
			layer=FLY_LAYER
		shadow21
			icon_state="Shadow21"
			layer=FLY_LAYER
mob/var/tmp/CanRest=1
turf
	lab
		icon='lab.dmi'
		tubebuttom
			icon_state="tubebottom"
			density=1
			layer=2
		tubetop
			icon_state="tubetop"
			density=1
			layer=2
		emptytop
			icon_state="emptytop"
			density=0
			layer=4
			verb
				Rest()
					if(usr.resting)
						usr.resting=0
						usr<<"You stop resting."
						usr.Frozen=0
						sleep(50)
						usr.CanRest=1
						return
					if(!usr.CanRest)
						return
					else
						usr.CanRest=0
					if(usr.GateIn!=""||usr.Pill!="")
						usr<<"You're body is under too much strain to rest right now!";return
					else
						usr.resting=1
						usr<<"You step in and relax."
						usr.Frozen=1
						while(usr.resting)
							if(usr.health<usr.maxhealth)
								usr.health+=(usr.maxhealth/70)
							if(usr.stamina<usr.maxstamina)
								usr.stamina+=(usr.maxstamina/60)
							if(usr.chakra<usr.Mchakra)
								usr.chakra+=(usr.Mchakra/100)
							if(usr.ChakraPool<usr.MaxChakraPool)
								usr.ChakraPool+=(usr.MaxChakraPool/100)
							sleep(11)
						usr<<"You're fully relaxed."
						usr.resting=0
						usr.Frozen=0
						return
		experimentwater
			layer=5
		table
			icon_state="table"
			layer=2
			density=0
		thing1
			icon_state="thing1"
			density=1
		thing2
			icon_state="thing2"
			density=1
		thing3
			icon_state="thing3"
			density=1
		thing4
			icon_state="thing4"
			density=1
		thing5
			icon_state="thing5"
			density=0
			layer=5
		thing6
			icon_state="thing6"
			density=0
			layer=5
turf
	RestArea
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=src
				M<<"You step in and relax. Press and hold Z to train your Ninjutsu Knowledge while resting. Press and hold X to train your Genjutsu Knowledge. It only works if your body is healing."
				M.dir=SOUTH
				while(M.loc==src)
					if(M.health<M.maxhealth)
						M.health+=(M.maxhealth/70)
				//		if(M.icon_state=="handseal"&&prob(5))
				//			M.NinjutsuKnowledge++
					if(M.stamina<M.maxstamina)
						M.stamina+=(M.maxstamina/60)
				//		if(M.Guarding&&prob(5))
				//			M.GenjutsuKnowledge++
					if(M.chakra<M.Mchakra)
						M.chakra+=(M.Mchakra/100)
					if(M.ChakraPool<M.MaxChakraPool)
						M.ChakraPool+=(M.MaxChakraPool/100)
					sleep(11)
				M<<"You're fully relaxed."
turf
	akatbaseenter
		density = 0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr <<"You enter a dreary cavern...what could lie ahead?"
				if(prob(50))
					usr.loc = locate(101,2,22)
				else
					usr.loc = locate(102,2,22)
	akatbaseexit
		density = 0
		Enter(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(43,187,26)
	akatbasenewenter
		density = 0
		var/opened=0
		Enter(A)
			if(!ismob(A)) return 1
			else
				if(usr.XiveresMember||opened)
					usr <<"You enter a dreary cavern...what could lie ahead?"
					opened=1
					spawn(50)
						opened=0
						viewers(6,src)<<"The enterance closes.."
					if(prob(50))
						usr.loc = locate(31,19,32)
					else
						usr.loc = locate(32,19,32)
				else
					return 0
	akatbasenewexit
		density = 0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(96,71,24)
	XiveresCorridorone
		density=0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(173,7,32)
	XiveresCorridorTwo
		density=0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(2,52,32)
	XiveresCorridorThree
		density=0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(76,102,36)
	XiveresCorridorFour
		density=0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(50,14,32)



	MonosiEntrance
		density = 0
		var/opened=0
		Enter(A)
			if(!ismob(A)) return 1
			else
				if(usr.NosinasisMemoriaMember||opened)
					usr <<"You enter a dreary cavern under a sandstorm."
					opened=1
					spawn(50)
						opened=0
						viewers(6,src)<<"The enterance closes.."
					if(prob(50))
						usr.loc = locate(37,82,30)
					else
						usr.loc = locate(36,82,30)
				else
					return 0
	Monosiewexit
		density = 0
		Enter(A)
			if(istype(A,/obj/)) del(A)
			if(!ismob(A)) return
			else
				usr.loc = locate(35,93,27)
	HunterBaseEnter
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(!M.client)
					return 0
				else
					if(usr.HunterNinMember)
						if(usr.Yonkami)
							usr<<"nop"
							return 0
						usr.loc = locate(149,71,30)
					else
						var/Q=input(usr,"What is the password?") as text
						if(Q=="BijuusArePussies")
							if(usr.Yonkami)
								usr<<"nop"
								return 0
							usr.loc = locate(149,71,30)
						else
							usr<<"Wrong."
							return 0
	HunterBaseExit
		Enter(A)
			if(ismob(A))
				usr.loc = locate(112,59,6)
	LelouchHouseEnter
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(!M.client)
					return 0
				else
					var/Q=input(usr,"What is the password?") as text
					if(Q=="xi582134232")
						usr.loc = locate(18,111,21)
					else
						usr<<"Wrong."
						return 0
	LelouchHouseExit
		Enter(A)
			if(ismob(A))
				usr.loc = locate(17,123,11)
obj
	opendoor
		icon='Warp2.dmi'
		density=0
		New()
			..()
			flick("dark",src)
			sleep(9)
			src.icon_state="open"
			sleep(50)
			del(src)
		Del()
			for(var/turf/T in range(0,src))
				if(istype(T,/turf/akatbasenewenter))
					T:opened=0
			flick("dark2",src)
			sleep(9)
			..()
area
	Dawns
		density=0
		layer=FLY_LAYER
		mouse_opacity=0
		Dawn1
			icon='Icons/Hud/Dawn.dmi'
			icon_state="Dawn"
		Dawn2
			icon='Icons/Hud/Dawn2.dmi'
			icon_state="Dawn"
	darkness
		density=0
		layer=FLY_LAYER
		icon='shading.dmi'
		icon_state="strong"
	UchihaHouseDarkness
		density=0
		mouse_opacity=0
		layer=50
		icon='shading.dmi'
		icon_state="weak"
	UchihaHouseHoleDarkness
		density=1
		layer=100
		icon='shading.dmi'
		icon_state="strong"
turf
	UchihaClanBuilding
		icon='UchihaClanHideout2.png'
		layer=MOB_LAYER+10
	Entrance
		icon = 'PrisonDoor.dmi'
		icon_state = "Uchiha"
		layer=75
	UchihaClanHideOut
		Access
			UchihaHideOutEnter
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M<<"<font color=#800000> I grant you sight which seems to reflect but a former tomoe of a mirror. Show me proof of your Clan's Pride...</font>."
						spawn(25)
							if(M.shari)
								M<<"<font color=#800000> I grant you entrance to this ancient place....The Uchiha Hideout...</font>."
								M<<sound('UchihaHideout.wav',1,0,8,90)
								M.loc=locate(98,20,39)
								return
							else
								M<<"<font color=#800000> You are not one of us......Begone!</font>."
								if(M in OnlinePlayers)
									M.DamageProc(5000,"Health")
								return
			UchihaBasementEnter
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(168,6,39)
			UchihaBasementExit
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(128,49,39)
			UchihaRoom1Enter
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(10,88,39)
			UchihaRoom1Exit
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(72,83,39)
			UchihaHallway1Entrance
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(5,62,39)
			UchihaHallway1Exit
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(120,93,39)
			UchihaHideOutSecondFloor1Entrance
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(18,120,39)
			UchihaHideOutSecondFloor1Exit
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(19,65,39)
			UchihaHideOutExit
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M<<sound(null,0,0,8,90)
						M.loc=locate(146,35,16)
			UchihaBasementRoom1Entrance
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(150,172,39)
			UchihaBasementRoom1Exit
				Enter(A)
					if(ismob(A))
						var/mob/M=A
						M.loc=locate(95,4,39)
		UchihaClanHideOutDetails
			Terrain
				Craters
					LargeCrater1
						name="Left Side of Large Crater"
						density=0
						icon='Icons/Crater.dmi'
						icon_state="4"
						layer=TURF_LAYER
					LargeCrater2
						name="Right Side of Large Crater"
						density=0
						icon='Icons/Crater.dmi'
						icon_state="5"
						layer=TURF_LAYER
					LargeCrater3
						name="Top Left Side of Large Crater"
						density=0
						icon='Icons/Crater.dmi'
						icon_state="6"
						layer=TURF_LAYER
					LargeCrater4
						name="Top Right Side of Large Crater"
						density=0
						icon='Icons/Crater.dmi'
						icon_state="7"
						layer=TURF_LAYER
				Mountain4Uchiha
					name="Mountain"
					density=1
					icon='Map/Turfs/turfs.dmi'
					icon_state="mountain4"
					layer=TURF_LAYER
				Mountain100Uchiha
					name="Mountain"
					density=1
					icon='Map/Turfs/turfs.dmi'
					icon_state="mountain11"
					layer=TURF_LAYER
				Mountain44Uchiha
					name="Mountain"
					density=0
					icon='Map/Turfs/turfs.dmi'
					icon_state="mountain44"
					layer=TURF_LAYER

			DamagedUchihaPaintings
				icon = 'new picture.dmi'
				layer=40
				DamagedAmaterasuPainting
					icon_state="pic7"
					density=0
					layer=TURF_LAYER
				DamagedKirinPainting
					icon_state="pic8"
			Lab
				icon='TestTube.dmi'
				layer=6
				WorkingTank
					icon_state="Tank"
					density=1
					layer=TURF_LAYER
				BrokenTank
					icon_state="BrokenTank"
					density=1
					layer=TURF_LAYER
				MachineAndTank
					icon_state="Uchiha Hideout Broken Tank"
					density=1
					layer=TURF_LAYER
				VerticalTubes
					icon_state="Tubes"
					density=0
					layer=TURF_LAYER
				HorizontalTubes
					icon_state="tubes"
					density=0
					layer=TURF_LAYER
			Other
		Stair
			icon = 'Rainbuildings.dmi'
			icon_state = "bridgeup"
			layer=TURF_LAYER
			density = 0
		Floor
			icon = 'Map/Turfs/turfs.dmi'
			icon_state="ston2"
			layer=TURF_LAYER
			density=0
		LargeUchihaSymbol
			icon = 'Map/Turfs/Uchiha Symbol on Floor2.png'
			layer=TURF_LAYER
			density=0
		UchihaSignHideOut1
			icon = 'Scenary.dmi'
			icon_state="Uchihasign5"
			layer=MOB_LAYER+4
		UchihaHideOutBrokenPost
			icon = 'Scenary.dmi'
			icon_state="Uchihasign11"
			layer=TURF_LAYER
		UchihaSignHideOut12
			icon='Scenary.dmi'
			icon_state="Uchihasign52"
			layer=MOB_LAYER+4
		UchihaSignHideout2
			icon = 'Scenary.dmi'
			icon_state="Uchihasign6"
			layer=MOB_LAYER+4
		UchihaSignHideout22
			icon = 'Scenary.dmi'
			icon_state="Uchihasign62"
			layer=MOB_LAYER+4
		UchihaSignHideOut3
			icon = 'Scenary.dmi'
			icon_state="Uchihasign7"
			layer=MOB_LAYER+4
		UchihaSignHideOut4
			icon = 'Scenary.dmi'
			icon_state="Uchihasign8"
			layer=MOB_LAYER+4
		UchihaSignHideOut5
			icon = 'Scenary.dmi'
			icon_state="Uchihasign9"
			layer=MOB_LAYER+4
		UchihaSignHideOut6
			icon = 'Scenary.dmi'
			icon_state="Uchihasign10"
			layer=TURF_LAYER
		UchihaSignHideOut7
			icon = 'Scenary.dmi'
			icon_state="Uchihasign11"
			layer=MOB_LAYER+4
		UchihaSignHideOut8
			icon = 'Scenary.dmi'
			icon_state="Uchihasign12"
			layer=TURF_LAYER
		UchihaSignHideOut9
			icon = 'Scenary.dmi'
			icon_state="Uchihasign13"
			layer=MOB_LAYER+4
		BigShurikenThingUchihaHideout
			icon_state="big shuriken for sell 1"
			density=0
			layer=TURF_LAYER
		UchihaMemorialHideout
			icon='UchihaMemorial2.dmi'//original was UchihaMemorial.dmi
			layer=TURF_LAYER+1
		BackWalls
			icon='Rainbuildings.dmi'
			density=1
			Wall1
				icon_state = "rainsw"
			Wall2
				icon_state = "rains"
			Wall3
				icon_state = "rainse"
			Wall4
				icon_state = "rainnw"
			Wall5
				icon_state = "rainn"
turf
	Bridge
		icon = 'Bridge.dmi'
		layer = OBJ_LAYER
		a
			icon_state = "1,2"
			Entered(mob/M)
				if(ismob(M))
					if(prob(50))
						var/counta=10;var/countb=1;var/list/L = list()
						while(countb<10)
							var/list/S = range(countb)
							for(var/mob/X in L)
								S-=X
							S<<sound('SFX/Step.wav',0,0,0,counta)
							for(var/mob/X in S)
								L+=X
							countb++;counta-=1
			aa
				icon_state="1,2"
			ab
				icon_state="2,2"
			ac
				icon_state="3,2"
		b
			icon_state = "0,0"
		c
			icon_state = "1,0"
			layer=5
		d
			icon_state = "2,0"
			layer=5
		e
			icon_state = "3,0"
			layer=5
		f
			icon_state = "4,0"
		g
			icon_state = "1,1"
		h
			icon_state = "2,1"
		i
			icon_state = "3,1"
		j
			icon_state = "0,3"
		k
			icon_state = "1,3"
		l
			icon_state = "2,3"
		m
			icon_state = "3,3"
		n
			icon_state = "4,3"
		o
			icon_state = "0,4"
			layer=5
		p
			icon_state = "1,4"
		q
			icon_state = "2,4"
		r
			icon_state = "3,4"
		s
			icon_state = "4,4"
			layer=5

	Bridge2
		icon = 'Bridge2.dmi'
		layer = OBJ_LAYER
		a
			icon_state = "1,2"
			Entered(mob/M)
				if(ismob(M))
					if(prob(50))
						var/counta=10;var/countb=1;var/list/L = list()
						while(countb<10)
							var/list/S = range(countb)
							for(var/mob/X in L)
								S-=X
							S<<sound('SFX/Step.wav',0,0,0,counta)
							for(var/mob/X in S)
								L+=X
							countb++;counta-=1
			aa
				icon_state="1,1"
			ab
				icon_state="1,2"
			ac
				icon_state="1,3"
		b
			icon_state = "0,0"
		c
			icon_state = "1,0"
		d
			icon_state = "2,0"
		e
			icon_state = "3,0"
		f
			icon_state = "4,0"
		g
			icon_state = "1,1"
		h
			icon_state = "2,1"
		i
			icon_state = "3,1"
		j
			icon_state = "0,3"
		k
			icon_state = "1,3"
		l
			icon_state = "2,3"
		m
			icon_state = "3,3"
		n
			icon_state = "4,3"
		o
			icon_state = "0,4"
		p
			icon_state = "1,4"
		q
			icon_state = "2,4"
		r
			icon_state = "3,4"
		s
			icon_state = "4,4"
		bottomedge
			icon='Bridge.dmi'
			icon_state = "bottom"

turf
	mist
		icon = 'Icons/Jutsus/mist.dmi'
		layer = 100
	mistless
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "less"
		layer = 100
	mistlesser
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "lesser"
		layer = 100
	mistedge1
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "edge1"
		layer = 100
	mistedge2
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "edge2"
		layer = 100
	mistedge3
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "edge3"
		layer = 100
	mistedge4
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "edge4"
		layer = 100
	mistedge5
		icon = 'Icons/Jutsus/mist.dmi'
		icon_state = "edge5"
		layer = 100
turf
	mist2
		icon = 'Icons/Jutsus/mist.dmi'
		layer = 100
		density = 1
turf
	mist3nolayer
		icon = 'Icons/Jutsus/mist.dmi'
turf
	Blank
		icon = 'Icons/BLANK BLACK.dmi'
		density = 1
		opacity = 1
		luminosity = 1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(src.density)
					if(M.density == 0)
						return 0
					else
						return 0
				else
					return 1
			else if(isobj(A))
				var/obj/O=A
				del(O)

	Black
		icon = 'Icons/BLANK BLACK.dmi'
		density = 0
		opacity = 0


	Gymsymbol
		icon = 'Icons/byondsymbol.dmi'
		density = 1
		Big
			A
				icon_state="0,0"
			B
				icon_state="0,1"
			C
				icon_state="1,0"
			D
				icon_state="1,1"
	muddy
		icon = 'Icons/turf.dmi'
		icon_state = "muddy"
		New()
			if(prob(1))
				src.icon_state="muddy[rand(1,2)]"
	white
		icon = 'Icons/white.dmi'
	waterfall1
		icon = 'Icons/waterfall.dmi'
		icon_state = "1"
		layer = MOB_LAYER+1
		Entered(A)
			if(ismob(A))
				var/mob/M=A
				M.stamina-=rand(40,100)
				sleep(6)
				if(M.health<1)
					M.Death(M)
				if(prob(1))
					var/StamCap=(M.TaiSkill*(M.TaijutsuKnowledge/10))
					if(StamCap<1500) StamCap=1500
				//	if(M.maxstamina<StamCap)
				//		M.maxstamina+=rand(5,15)
				if(prob(45))
					step(M,SOUTH)
				if(prob(100-(M.maxstamina/100)))
					M.StunAdd(5)
				if(!M.knockedout)
					var/Chance=15
					if(MapWeathers["[M.z]"] == "Rain")
						Chance+=2.5
					if(MapWeathers["[M.z]"] == "Heavy Rain")
						Chance+=5
					if(prob(Chance))
						if(M.Focus<500)
							M.Focus+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
					if(M.TypeLearning=="Taijutsu"||M.TypeLearning=="Suiton"||M.TypeLearning=="Genjutsu")
						M.exp+=50
						if(M.Subscriber)
							M.exp+=25
	waterblock1
		icon = 'Icons/waterfall.dmi'
		icon_state = "4"
		layer = MOB_LAYER+1
		density = 0
		var/Locked=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(Locked==1)
					M<<"This Part of the waterfall feels....strange....";return
				else
					usr<<"Your song unlocked a secret entrance to a secret love cave!"
					usr.loc=locate(184,88,20)
					..()

	waterfall2
		icon = 'Icons/waterfall.dmi'
		icon_state = "2"
		density = 0
	waterfall3
		icon = 'Icons/waterfall.dmi'
		icon_state = "3"
		density = 0
		layer = MOB_LAYER+1
	waterfall4
		icon = 'Icons/waterfall.dmi'
		icon_state = "4"
		density = 0
		layer = MOB_LAYER+1
	waterfall5
		icon = 'Icons/waterfall.dmi'
		icon_state = "5"
		density = 0
	waterfall6
		icon = 'Icons/waterfall.dmi'
		icon_state = "6"
		density = 0
area
	Sandstorm
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "Sandstorm"
		layer = FLY_LAYER+3
		luminosity=0
		mouse_opacity = 0
	Rain
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "rain"
		layer = FLY_LAYER+3
		mouse_opacity = 0
	Snow
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "Snowing"
		layer = FLY_LAYER+3
		mouse_opacity = 0
area
	outside	// lay this area on the map anywhere you want it to change from night to day
		layer = 6	// set this layer above everything else so the overlay obscures everything
		var
			lit = 1	// determines if the area is lit or dark.
			obj/weather/Weather	// what type of weather the area is having
			obj/weather/Darkness
			obj/weather/TrueDarkness
		proc
			daycycle()
				lit = 1 - lit	// toggle lit between 1 and 0
				if(lit)
					overlays -= 'black50.dmi'	// remove the 50% dither
					overlays += 'black25.dmi'	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= 'black25.dmi'	// remove the dither
				else
					overlays += 'black25.dmi'	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= 'black25.dmi'	// remove the dither
					overlays += 'black50.dmi'	// add the 50% dither
				spawn(27000) daycycle()	// change the 20 to make longer days and nights
//was spawn(1800)
/*
	If you prefer real darkness (luminosity = 0), replace the daycycle() proc
	with the one below. Using luminosity for outside darkness is better if
	you want to use other light sources like torches.

			daycycle()
				luminosity = 1 - luminosity	// toggle between 1 and 0
				spawn(20) daycycle()	// change the 20 to make longer days and nights
*/

			SetWeather(WeatherType)
				if(Weather)	// see if this area already has a weather effect
					if(istype(Weather,WeatherType)) return	// no need to reset it
					overlays -= Weather	// remove the weather display
					del(Weather)	// destroy the weather object
				if(WeatherType)	// if WeatherType is null, it just removes the old settings
					Weather = new WeatherType()	// make a new obj/weather of the right type
					overlays += Weather	// display it as an overlay for the area



	inside	// a sample area not affected by the daycycle or weather
		luminosity = 1


obj/weather
	layer = 7	// weather appears over the darkness because I think it looks better that way
	Darkness
		icon = 'black25.dmi'
		layer = FLY_LAYER +3
		mouse_opacity = 0
	TrueDarkness
		icon = 'black50.dmi'
		layer = FLY_LAYER+3
		mouse_opacity = 0
	rain
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "rain"
		layer = FLY_LAYER+3
	//	icon = 'rain.dmi'

	snow
		icon = 'snow.dmi'
	snow
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "Snowing"
		layer = FLY_LAYER+3

turf/BigTree
	icon='Map/Turfs/Tree2.dmi'
	layer=6
turf/Landscapes/Mud
	icon = 'Map/Turfs/Mud.dmi'
	mud
		icon_state = "mud"
	mudedge1
		icon_state = "mud edge 3"
	mudedge2
		icon_state = "mud edge 2"
	mudedge3
		icon_state = "mud edge 4"
	mudedge4
		icon_state = "mud edge 1"
	mudedge5
		icon_state = "mud corner 2"
	mudedge6
		icon_state = "mud corner 1"
	mudedge7
		icon_state = "mud corner 4"
	mudedge8
		icon_state = "mud corner 3"
	mudedge9
		icon_state = "mud corner 5"
	mudedge91
		icon_state = "mud corner 6"
	mudedge92
		icon_state = "mud corner 7"
	mudedge93
		icon_state = "mud corner 8"
	mudedge94
		icon_state = "mud edge 5"
	mudedge95
		icon_state = "mud edge 6"
	mudedge96
		icon_state = "mud edge 7"
	mudedge97
		icon_state = "mud edge 8"
turf/Landscapes/Path
	icon = 'Map/Turfs/Landscapes.dmi'
	path
		icon_state="path"
	pathedge1
		icon_state="path edge 1"
	pathedge2
		icon_state="path edge 2"
	pathedge3
		icon_state="path edge 3"
	pathedge4
		icon_state="path edge 4"
	pathcorner1
		icon_state="path corner 1"
	pathcorner2
		icon_state="path corner 2"
	pathcorner3
		icon_state="path corner 3"
	pathcorner4
		icon_state="path corner 4"
turf/Landscapes/Grass
	icon = 'Map/Turfs/Grass.dmi'
	grasslight
		icon_state="light grass1"
		New()
			..()
			src.icon_state="light grass[rand(1,2)]"
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=100;var/countb=1;var/list/L = list()
					while(countb<10)
						sleep(1)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/StepInGrass.wav',0,0,0,35)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=10
	grass
		icon_state = "grass1"
		var
			Season="Spring"
		New()
			..()
			src.icon_state="grass[rand(1,2)]"
			if(prob(5))
				src.icon_state="grass3"
			if(src.Season=="Spring"||src.Season=="Summer")
				if(prob(5))
					src.icon_state="grass[rand(4,7)]"
			if(src.Season=="Fall")
				if(prob(1))
					src.icon_state="grass[rand(4,7)]"
	grassedge1
		icon_state = "grass edge 3"
	grassedge2
		icon_state = "grass edge 2"
	grassedge3
		icon_state = "grass edge 4"
	grassedge4
		icon_state = "grass edge 1"
	grassedge5
		icon_state = "grass corner 2"
	grassedge6
		icon_state = "grass corner 1"
	grassedge7
		icon_state = "grass corner 4"
	grassedge8
		icon_state = "grass corner 3"
	grassedge9
		icon_state = "grass corner 5"
	grassedge91
		icon_state = "grass corner 6"
	grassedge92
		icon_state = "grass corner 7"
	grassedge93
		icon_state = "grass corner 8"
	grassedge94
		icon_state = "grass edge 5"
	grassedge95
		icon_state = "grass edge 6"
	grassedge96
		icon_state = "grass edge 7"
	grassedge97
		icon_state = "grass edge 8"
	grassspot1
		icon_state = "grass spot 1"
	grassspot2
		icon_state = "grass spot 2"
	grassspot3
		icon_state = "grass spot 3"
	grassspot4
		icon_state = "grass spot 4"
	grassspot5
		icon_state = "grass spot 5"
	GrassShading1
		icon_state = "4"
	GrassShading2
		icon_state = "5"
	GrassShading3
		icon_state = "6"
turf/Landscapes/GrassPatches
	icon='Map/Turfs/GrassPatch.dmi'
	Patch1
		icon_state="1"
	Patch2
		icon_state="2"
	Patch3
		icon_state="3"
	Patch4
		icon_state="4"
	Patch5
		icon_state="5"
	Patch6
		icon_state="6"
	Patch7
		icon_state="7"
	Patch8
		icon_state="8"
	Patch9
		icon_state="9"
	Patch10
		icon_state="10"
	Patch11
		icon_state="11"
	Patch12
		icon_state="12"

turf/Landscapes/PonteNova
	icon='Map/Turfs/Grass.dmi'
	Patch1
		icon_state="Ponte1"
	Patch2
		icon_state="Ponte2"
	Patch3
		icon_state="Ponte3"
	Patch4
		icon_state="Ponte4"
	Patch5
		icon_state="Ponte5"
	Patch6
		icon_state="Ponte6"
	Patch7
		icon_state="Ponte7"



turf/Landscapes/Snow
	icon='Map/Turfs/Landscapes.dmi'
	Snow
		icon_state="Snow"
	Snowroof
		icon_state="Snow"
		layer=400
	SnowEdge1
		icon_state="Snow1"
	SnowEdge2
		icon_state="Snow2"
	SnowEdge3
		icon_state="Snow3"
	SnowEdge4
		icon_state="Snow4"
	Snow1
		icon_state="1"
		layer=400
	Snow2
		icon_state="2"
		layer=400
	Snow3
		icon_state="3"
		layer=400
	Snow4
		icon_state="4"
		layer=400
	Snow5
		icon_state="5"
		layer=400
	Snow6
		icon_state="6"
		layer=400
	Snow7
		icon_state="7"
		layer=400
	Snow8
		icon_state="8"
		layer=400
	Snow9
		icon_state="9"
		layer=400
	Snow10
		icon_state="10"
		layer=400
	Snow11
		icon_state="11"
		layer=400
	Snow12
		icon_state="12"
		layer=400


turf/Landscapes/Snow
	Ice
		icon='Icons/Jutsus/HyoutonTechniques.dmi'
		icon_state="SpikeUnderground2"
		density=0
turf/Landscapes/Snow
	Ice2
		icon='Icons/Jutsus/HyoutonTechniques.dmi'
		icon_state="SpikeUnderground3"
		density=0
turf/Landscapes/RockPath
	icon = 'Map/Turfs/Landscapes.dmi'
	path
		icon_state = "p"
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						sleep(1)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	path1
		icon_state = "p1"
	path2
		icon_state = "p2"
	path3
		icon_state = "p3"
	path4
		icon_state = "p4"
turf/Landscapes/Sand
	sand
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "sand"
		Entered(mob/M)
			if(ismob(M))
				if(prob(25))
					for(var/obj/Clothes/Turban/B in M.contents)
						if(B.worn)
							return
					M.thirst+=1
					if(M.thirst>100)
						M.thirst=100
turf/Landscapes/Dirt
	dirtedge1
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 1"
	dirtedge2
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 2"
	dirtedge3
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 3"
	dirtedge4
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 4"
	dirtedge5
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 5"
	dirtedge6
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 6"
	dirtedge7
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 7"
	dirtedge8
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt edge 8"
turf/Landscapes/Flowers
	var/grabbed=0
	verb/Get()
		if(usr.CurrentMission!="Collect Flowers")
			usr<<"You decide not to pick it up as it has no use to you..";return
		if(src.grabbed)
			usr<<"This flower has already been picked up...wait for it to regrow!";
			return
		usr<<"You pick up a flower!"
		usr.NumberOfFlowersCollected++
		if(usr.NumberOfFlowersCollected==usr.NumberOfFlowersNeededToCollect)
			usr.MissionComplete()
		src.grabbed=1
//		src.invisibility=101
		sleep(500)
		src.grabbed=0
//		src.invisibility=0
	Plant1
		icon = 'PNG/Plants.dmi'
		icon_state = "1"
	Plant2
		icon = 'PNG/Plants.dmi'
		icon_state = "2"
	Plant3
		icon = 'PNG/Plants.dmi'
		icon_state = "3"
	Bush
		icon='PNG/Plants.dmi'
		icon_state="Bush"
		layer=MOB_LAYER+1
	Plant4
		icon = 'PNG/Plants.dmi'
		icon_state = "4"
	Plant5
		icon = 'PNG/Plants.dmi'
		icon_state = "5"
turf  // its suppose to be in front o-omeh, this makes it so it only works if they're on it but w.e xD  you sure your not making a mistake O_O we'll see...  compil
	RawrWallOpen
		icon = 'Icons/waller.dmi'
		icon_state = "wallopen"
	RawrWallDoor
		icon = 'Icons/waller.dmi'
		icon_state = "walldoor"
	Grass2
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "grass4"
turf
	floor
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "floor"
		density = 0
	floor2
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "floor2"
		density = 0
	floor3
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "floor3"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						sleep(1)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor4
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "rawr10"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floorw
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "floor5"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor6
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "floor6"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor7
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "rawr2"
		density = 0
	floor8
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "rawr3"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor9
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "rawr11"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor99
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "assas"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor91
		icon = 'turfs.dmi'
		icon_state = "newfloor"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1
	floor92
		icon = 'turfs.dmi'
		icon_state = "newfloor2"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=10;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=1

turf
	beach
		icon = 'Icons/Beach.dmi'
		icon_state = "Beach"
	underwatersand
		icon = 'Icons/Beach.dmi'
		icon_state = "Underwater"
		layer = 1
	beachtransition
		icon = 'Icons/Beach.dmi'
		icon_state = "Transition"
		layer = 1
	dirt
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt"
		density = 0
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=100;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/StepInGrass.wav',0,0,0,45)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=10
	bridgeup
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "bridgeup"
		density = 0
	StoneFloor1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="stone"
	StoneFloor2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="stone1"
	StoneFloor3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="ston2"
	Flora1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="flora1"
	Walla1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="walla1"
	Walla2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="walla2"
	Walla3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="walla3"
		obj
	Trees1
		name="Tree"
		icon='Tree.dmi'
		layer=MOB_LAYER+1
		density=0
		GroundLevel1
			icon_state="tree11"
	Pillara1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="pillara1"
		layer=MOB_LAYER+1
		GroundLevel1
	Pillara2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="pillara2"
	Pillara3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="pillara3"
	Pillala1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="pillala1"
		layer=MOB_LAYER+1
		GroundLevel1
	Pillala2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="pillala2"
	Pillala3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="pillala3"
	Dora1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="dora1"
	Dora2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="dora2"
	Dora3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="dora3"
	Wallaflora1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="wallaflora"
	Wallaflora2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="wallaflora2"
	Wallaflora3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="wallflora3"
	Wari1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="wari"
	Wari2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="wari2"
	Stairi
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="stairi"
	Darki
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="darki"
	Completo
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="completo"
	Compreto
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="compreto"
	Completodarki
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="completodarki"
	Game
		icon = 'Map/Turfs/zascreen.dmi'
		icon_state="udyr"
	StoneFloor4
		icon = 'Map/Turfs/turfs.dmi'
		icon_state="ston3"
	wall
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "wall"
		density = 1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)
	wall2
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "wall"
		density = 1
		opacity=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)
	walln
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "nwall"
		density = 1
		opacity = 1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)
	Cactus
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "cactus"
		density = 1
turf
	water
		icon='Map/Turfs/Landscapes.dmi'
		icon_state="water"
		layer=2
		density=0
		Entered(mob/M)
			if(ismob(M))
				if(!M)
					return
				if(!M.client)
					return
		//		var/counta=30;var/countb=1;var/list/L = list()
		//		while(countb<10)
		//			sleep(1)
		//			var/list/S = range(countb)
		//			for(var/mob/X in L)
		//				S-=X
		//			S<<sound('StepInWater.wav',0,0,0,counta)
		//			for(var/mob/X in S)
		//				L+=X
		//			countb++;counta-=3
				if(M&&M.WaterWalkingMastery!=10)
					var/Z=(rand(10,100))/(M.WaterWalkingMastery+1)
					var/Chance=20
					if(MapWeathers["[M.z]"] == "Rain")
						Chance+=5
					if(MapWeathers["[M.z]"] == "Heavy Rain")
						Chance+=10
					M.chakra-=rand(Z*0.5,Z*1.5)
					if(prob(Chance))
						var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
						src<<I
						spawn(15)
							del(I)
						M.WaterWalkingMastery+=pick(0.01,0.02)
						if(M.WaterWalkingMastery>10)
							M.WaterWalkingMastery=10
				if(M&&M.client&&M.Clan!="Fuuma"&&prob(1)&&M.ChakraC<100)
					M.ChakraC++
					if(M.ChakraC>100)
						M.ChakraC=100
				else if(M.client&&M.Clan=="Fuuma"&&prob(5)&&M.ChakraC<150)
					M.ChakraC++
					if(M.ChakraC>=150)
						M.ChakraC=150
				if(M.client&&M.chakra<=0)
					M<<"<b>You ran out of chakra!"
					M.stamina-=rand(M.stamina,M.stamina/100);return
				return 1
			else return 1
		proc
			FishSend()
				usr<<"Test 2"
			//	usr.Fishing(usr)
		verb
			Fish()
				usr<<"Test 1"
			//	src.FishSend()
			/*
				var/UsingWhichFishingRod=""
				var/UsingFishingRod=0
				var/UsingBeginner=0
				var/BeginnerRodCheck=0
				var/BeginnerRodCheckReadyToGo=0
				var/FishStruggleSuccess=0
				var/FishStruggleFailure=0
				var/FishFightTimer=15
				var/FishStruggle=(50+pick(10,15,20,25))
				set name="Fish"
				set category="Commands"
				if(usr.key=="CobraT1337"||usr.key=="The Jefferson"||usr.key=="JyuonJoon")
					for(var/obj/BeginnerFishingRod/P in usr.contents)
						if(P.Equipped)
							UsingBeginner=1
						if(P.ReeledOut)
							BeginnerRodCheck=1
						if(P.ReeledIn)
							BeginnerRodCheckReadyToGo=1
							P.ReeledIn=0
					if(usr.Fishing)
						if(usr.Fishing&&!usr.FishingRodEquipped)
							usr<<"You remove your hands from the Water and stop trying to catch a fish."
							usr.Fishing=0
							return
						if(usr.Fishing&&UsingFishingRod&&UsingBeginner)
							usr<<"You stop Fishing."
							usr.Fishing=0
				//		if(usr.Fishing&&usr.FishingRodEquipped&&usr.FishingRodType!="")
					else
						if(UsingBeginner)
							if(BeginnerRodCheck)
								usr<<"How can you expect to release your Rod when you left your line all the way out there?";return
							if(BeginnerRodCheckReadyToGo)
								usr<<"You throw your Fishing line out and into the water."
								usr.Fishing=1
								for(var/obj/BeginnerFishingRod/P in usr.contents)
									if(P.Equipped)
										P.ReeledOut=1
								var/WaitingTime=0
								var/FishingLoc=0
								FishingLoc=usr.loc
								if(usr.FishingSkill>=100) WaitingTime=10
								else if(usr.FishingSkill>=75&&usr.FishingSkill<100) WaitingTime=25
								else if(usr.FishingSkill>=50&&usr.FishingSkill<75) WaitingTime=40
								else if(usr.FishingSkill>=40&&usr.FishingSkill<50) WaitingTime=57
								else if(usr.FishingSkill>=30&&usr.FishingSkill<40) WaitingTime=69
								else if(usr.FishingSkill>=25&&usr.FishingSkill<30) WaitingTime=75
								else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=82
								else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=91
								else if(usr.FishingSkill>=10&&usr.FishingSkill<20) WaitingTime=95
								else WaitingTime=100
								usr<<"Don't move while you try and catch a fish. This requires focus."
								while(WaitingTime>0&&FishingLoc==usr.loc)
									if(usr.knockedout)
										usr<<"You fall unconcious and stop searching for a fish.";
										usr.Fishing=0;return
									if(FishingLoc!=usr.loc)
										usr<<"You move and break concentration.";
										usr.Fishing=0;return
									WaitingTime--
									if(prob(10))
										WaitingTime++
									sleep(10)
								if(prob(100-(usr.FishingSkill+10)))
									usr<<"You feel a fish bite your rod but it fights back!"
									sleep(10)
									usr<<"Tap Spacebar to fight the fish and reel him in!"
									while(FishFightTimer>0&&!usr.knockedout&&FishingLoc!=usr.loc)
										sleep(10)
										FishFightTimer--
										if(usr.Struggle>FishStruggle)
											FishStruggleSuccess=1
								if(FishingLoc!=usr.loc)
									usr<<"You move and break concentration.";
									usr.Fishing=0;return
								if(FishFightTimer<15&&FishStruggleSuccess!=1)
									usr<<"The fish got away!"
									if(prob(7))
										for(var/obj/BeginnerFishingRod/P in usr.contents)
											if(P.Equipped)
												P.Equipped=0
												del(P)
										usr<<"The Fish even managed to take your rod with it!"
										return
								usr<<"You caught a fish!"
								if(usr.FishingSkill<10)
									if(prob(7))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a CatFish!"
									usr.contents+=new/obj/Food/CatFish
						if(UsingBeginner==0)
							usr<<"You crouch and place your hands deep into the water, hoping to catch a fish."
							oview()<<"[src] crouches torwards the water and places his hands into it attempting to catch a fish."
							var/WaitingTime=0
							var/FishingLoc=usr.loc
							if(usr.FishingSkill>=100) WaitingTime=10
							else if(usr.FishingSkill>=75&&usr.FishingSkill<100) WaitingTime=25
							else if(usr.FishingSkill>=50&&usr.FishingSkill<75) WaitingTime=40
							else if(usr.FishingSkill>=40&&usr.FishingSkill<50) WaitingTime=57
							else if(usr.FishingSkill>=30&&usr.FishingSkill<40) WaitingTime=69
							else if(usr.FishingSkill>=25&&usr.FishingSkill<30) WaitingTime=75
							else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=82
							else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=91
							else if(usr.FishingSkill>=10&&usr.FishingSkill<20) WaitingTime=95
							else WaitingTime=100
							usr<<"Don't move while you try and catch a fish. This requires focus."
							while(WaitingTime>0&&FishingLoc==usr.loc)
								if(usr.knockedout)
									usr<<"You fall unconcious and stop searching for a fish.";
									usr.Fishing=0;return
								if(FishingLoc!=usr.loc)
									usr<<"You move and break concentration.";
									usr.Fishing=0;return
								WaitingTime--
								if(prob(10))
									WaitingTime++
								sleep(10)
							if(FishingLoc!=usr.loc)
								usr<<"You move and break concentration.";
								usr.Fishing=0;return
							usr<<"You caught a fish!"
							if(usr.FishingSkill<50)
								if(prob(7))
									usr.FishingSkill+=(pick(1,2,3,4)*0.1)
								usr<<"It's a CatFish!"
								usr.contents+=new/obj/Food/CatFish
				else
					usr<<"Sorry. Testers only at this time."
						//	usr.contents += new/obj/BuyableThings/Food/CatFish

*/
turf
	water2
		icon='Map/Turfs/Landscapes.dmi'
		icon_state="water235"
		layer=2
		density=0
		Entered(mob/M)
			if(ismob(M))
				if(!M.client)//Added 6/23/2013
					return
				var/counta=30;var/countb=1;var/list/L = list()
				while(countb<10)
					sleep(1)
					var/list/S = range(countb)
					for(var/mob/X in L)
						S-=X
					S<<sound('SFX/StepInWater.wav',0,0,0,counta)
					for(var/mob/X in S)
						L+=X
					countb++;counta-=3
				if(M.WaterWalkingMastery!=10)
					var/Z=(rand(10,100))/(M.WaterWalkingMastery+1)
					var/Chance=20
					if(MapWeathers["[M.z]"] == "Rain")
						Chance+=5
					if(MapWeathers["[M.z]"] == "Heavy Rain")
						Chance+=10
					M.chakra-=rand(Z*0.5,Z*1.5)
					if(prob(Chance))
						var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
						src.overlays+=I
						spawn(15)
							src.overlays-=I
						M.WaterWalkingMastery+=pick(0.01,0.02)
						if(M.WaterWalkingMastery>10)
							M.WaterWalkingMastery=10
				if(prob(1))
					usr.ChakraC++
					if(usr.ChakraC>100&&usr.Clan!="Fuuma")
						usr.ChakraC=100
					if(usr.ChakraC>=160&&usr.Clan=="Fuuma")
						usr.ChakraC=160
				if(M.chakra<=0)
					M<<"<b>You ran out of chakra!"
					M.stamina-=rand(M.stamina,M.stamina/100);return
				return 1
			else return 1

		verb
			Fish()
				set name="Fish"
				set category="Commands"
			//	src.FishSend()
		//	usr.Fishing()
		//proc
		//	FishSend()
		//		usr.Fishing(usr)
		/*
			Fish()
				var/UsingWhichFishingRod=""
				var/UsingFishingRod=0
				var/UsingBeginner=0
				var/BeginnerRodCheck=0
				var/BeginnerRodCheckReadyToGo=0
				set name="Fish"
				set category="Commands"
				for(var/obj/BeginnerFishingRod/P in usr.contents)
					if(P.Equipped)
						UsingBeginner=1
					if(P.ReeledOut)
						BeginnerRodCheck=1
					if(P.ReeledIn)
						BeginnerRodCheckReadyToGo=1
				if(usr.Fishing)
					if(usr.Fishing&&!usr.FishingRodEquipped)
						usr<<"You remove your hands from the Water and stop trying to catch a fish."
						usr.Fishing=0
						return
					if(usr.Fishing&&UsingFishingRod&&UsingBeginner)
						usr<<"You stop Fishing."
						usr.Fishing=0
			//		if(usr.Fishing&&usr.FishingRodEquipped&&usr.FishingRodType!="")
				else
					if(UsingBeginner)
						if(BeginnerRodCheck)
							usr<<"How can you expect to release your Rod when you left your line all the way out there?";return
						if(BeginnerRodCheckReadyToGo)
							usr<<"You throw your Fishing line out and into the water."
							usr.Fishing=1
							for(var/obj/BeginnerFishingRod/P in usr.contents)
								if(P.Equipped)
									P.ReeledOut=1
							var/WaitingTime=0
							var/RodFishingLoc=usr.loc
							if(usr.FishingSkill>=100) WaitingTime=10
							else if(usr.FishingSkill>=75&&usr.FishingSkill<100) WaitingTime=20
							else if(usr.FishingSkill>=50&&usr.FishingSkill<75) WaitingTime=40
							else if(usr.FishingSkill>=40&&usr.FishingSkill<50) WaitingTime=57
							else if(usr.FishingSkill>=30&&usr.FishingSkill<40) WaitingTime=69
							else if(usr.FishingSkill>=25&&usr.FishingSkill<30) WaitingTime=75
							else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=82
							else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=91
							else if(usr.FishingSkill>=10&&usr.FishingSkill<20) WaitingTime=95
							else WaitingTime=100
							usr<<"Don't move while you try and catch a fish. This requires focus."
							while(WaitingTime>0&&RodFishingLoc==usr.loc)
								WaitingTime--
								if(prob(10))
									WaitingTime++
								sleep(10)
							usr<<"You caught a fish!"
							if(usr.FishingSkill<10)
								if(prob(7))
									usr.FishingSkill+=(pick(1,2,3,4)*0.1)
								usr<<"It's a CatFish!"
								usr.contents+=new/obj/Food/CatFish
					if(UsingBeginner==0)
						usr<<"You crouch and place your hands deep into the water, hoping to catch a fish."
						oview()<<"[src] crouches torwards the water and places his hands into it attempting to catch a fish."
						var/WaitingTime=0
						var/FishingLoc=usr.loc
						if(usr.FishingSkill>=100) WaitingTime=10
						else if(usr.FishingSkill>=75&&usr.FishingSkill<100) WaitingTime=35
						else if(usr.FishingSkill>=50&&usr.FishingSkill<75) WaitingTime=50
						else if(usr.FishingSkill>=40&&usr.FishingSkill<50) WaitingTime=67
						else if(usr.FishingSkill>=30&&usr.FishingSkill<40) WaitingTime=79
						else if(usr.FishingSkill>=25&&usr.FishingSkill<30) WaitingTime=85
						else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=92
						else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=101
						else if(usr.FishingSkill>=10&&usr.FishingSkill<20) WaitingTime=105
						else WaitingTime=100
						usr<<"Don't move while you try and catch a fish. This requires focus."
						while(WaitingTime>0&&FishingLoc==usr.loc)
							WaitingTime--
							if(prob(10))
								WaitingTime++
							sleep(10)
						usr<<"You caught a fish!"
						if(usr.FishingSkill<10)
							if(prob(7))
								usr.FishingSkill+=(pick(1,2,3,4)*0.1)
							usr<<"It's a CatFish!"
							usr.contents+=new/obj/Food/CatFish

					//	usr.contents += new/obj/BuyableThings/Food/CatFish
*/
	watershore
		icon = 'Icons/Beach.dmi'
		icon_state="Shore1"
		layer = 2
		density=0
	watershore2
		icon = 'Icons/Beach.dmi'
		icon_state="Shore2"
		layer = 2
		density=0
	watershore3
		icon = 'Icons/Beach.dmi'
		icon_state="Shore3"
		layer = 2
		density=0
	watershore4
		icon = 'Icons/Beach.dmi'
		icon_state="Shore4"
		layer = 2
		density=0
	watershore5
		icon = 'Icons/Beach.dmi'
		icon_state="Shore5"
		layer = 2
		density=0
	watershore6
		icon = 'Icons/Beach.dmi'
		icon_state="Shore6"
		layer = 2
		density=0
	watershore7
		icon = 'Icons/Beach.dmi'
		icon_state="Shore7"
		layer = 2
		density=0
	watershore8
		icon = 'Icons/Beach.dmi'
		icon_state="Shore8"
		layer = 2
		density=0
turf
	NSand
		icon='Water.dmi'
		icon_state="1"
		layer=2
		density=0
	Nsandshore
		icon='Water.dmi'
		icon_state="6"
		layer = 2
		density=0
	Nsandshore2
		icon='Water.dmi'
		icon_state="7"
		layer = 2
		density=0
	Nsandshore3
		icon='Water.dmi'
		icon_state="8"
		layer = 2
		density=0
	Nsandshore4
		icon='Water.dmi'
		icon_state="9"
		layer = 2
		density=0
	Nsandshore5
		icon='Water.dmi'
		icon_state="4"
		layer = 2
		density=0
	Nsandshore6
		icon='Water.dmi'
		icon_state="3"
		layer = 2
		density=0
	Nsandshore7
		icon='Water.dmi'
		icon_state="2"
		layer = 2
		density=0
	Nsandshore8
		icon='Water.dmi'
		icon_state="5"
		layer = 2
		density=0
	NTile
		icon='Water.dmi'
		icon_state="tile"
		layer = 2
		density=0
	Nbluerwater
		icon='Water.dmi'
		icon_state="bluer water"
		layer = 2
		density=0

turf
	shading
		icon='watershading.dmi'
		density=1
turf
	floor5
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "floor4"
		density = 0
turf
	mountain666
		name="Mountain"
		density=1
		opacity=1
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain666"

turf
	mountain1
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain1"
turf
	mountain2
		name="Mountain"
		density=1
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain2"
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					return
			else
				if(istype(A,/obj/))
					if(istype(A,/obj/Jutsu/Elemental/Doton/BigDoton))
						..()
					else
						del(A)
turf
	mountain3
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain3"
turf
	mountain4
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain4"
turf
	mountain5
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain5"
turf
	mountain6
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain6"
turf
	mountain7
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain7"
turf
	mountain8
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain8"
turf
	mountain9
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain9"
turf
	mountain10
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain10"
turf
	mountain100
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain11"
turf
	mountain44
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain44"

	mountain45
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain45"
	mountain11
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain11"
	mountain88
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain88"
	mountain89
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain89"

turf
	mountain101
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 1"
	mountain102
		name="Mountain"
		density=1
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 2"
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					return
			else
				if(istype(A,/obj/))
					if(istype(A,/obj/Jutsu/Elemental/Doton/BigDoton))
						..()
					else
						del(A)
	mountain103
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 3"
	mountain104
		name="Mountain"
		density=1
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 4"
	mountain105
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 5"
	mountain106
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 6"
	mountain107
		name="Mountain"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 7"
	mountain108
		name="Mountain"
		density=1
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain edge 8"
turf
	stadium0
		icon = 'Icons/stadium.dmi'
		icon_state="0"
		density=1
	stadium1
		icon = 'Icons/stadium.dmi'
		icon_state = "1"
		density = 1
	stadium2
		icon = 'Icons/stadium.dmi'
		icon_state = "2"
		density = 1
	stadium3
		icon = 'Icons/stadium.dmi'
		icon_state = "3"
		density = 1
	stadium4
		icon = 'Icons/stadium.dmi'
		icon_state = "4"
		density = 1
	stadium5
		icon = 'Icons/stadium.dmi'
		icon_state = "5"
		density = 1
	stadium6
		icon = 'Icons/stadium.dmi'
		icon_state = "6"
		density = 1
	stadium7
		icon = 'Icons/stadium.dmi'
		icon_state = "7"
		density = 1
	stadium8
		icon = 'Icons/stadium.dmi'
		icon_state = "8"
		density = 1
	stadium9
		icon = 'Icons/stadium.dmi'
		icon_state = "9"
		density = 1
	stadium10
		icon = 'Icons/stadium.dmi'
		icon_state = "10"
		density = 0
//		Entered(mob/M)
//			if(ismob(M))
//				var/counta=10;var/countb=1;var/list/L = list()
//				while(countb<10)
//					sleep(1)
//					var/list/S = range(countb)
//					for(var/mob/X in L)
//						S-=X
//					S<<sound('SFX/Step.wav',0,0,0,counta)
//					for(var/mob/X in S)
//						L+=X
//					countb++;counta-=1
	leafmansionIN
		density = 1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(18,4,29)
			else
				if(istype(A,/obj/)) del(A)

	leafmansionOUT
		density = 1
		opacity = 1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(146,163,11)
			else
				if(istype(A,/obj/)) del(A)
mob
	see_invisible=1
obj
	roof
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state="wall"
		invisibility = 1
		layer = 10
turf
	Snow1
		icon = 'Icons/Snow.dmi'
		icon_state = "Snow"
		density = 0
turf
	Snow2
		icon = 'Icons/Snow.dmi'
		icon_state = "Snow2"
		density = 0
turf
	wall3
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state="omg"
		density=1

		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)
area
    houseroof
        Entered(mob/M)
            if(ismob(M))
                if(M in oview(0,src))
                    M.see_invisible = 0
                else if(M.bya)
                    M.see_invisible = 0
                else
                    M.see_invisible = 1
        Exited(mob/M)
            if(ismob(M))
                M.see_invisible = 1
turf
	layerwall
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state="wall"
		layer = MOB_LAYER+1
turf
	fwall1
		icon = 'Icons/waller.dmi'
		icon_state="fwall1"
		density=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)



turf
	fwall
		icon = 'Icons/waller.dmi'
		icon_state="fwall"
		density=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)


turf
	fwall2
		icon = 'Icons/waller.dmi'
		icon_state="froof"
		density=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)





turf
	fwall3
		icon = 'Icons/waller.dmi'
		icon_state="froof1"
		density=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)





turf
	fwall4
		icon = 'Icons/waller.dmi'
		icon_state="froof2"
		density=1
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				if(M.density == 0)
					return 0
				else
					return 0
			else if(isobj(A))
				var/obj/O=A
				del(O)
////////////////////////////////////////////
//Trees
////////////////////////////////////////////
obj
	Trees1
		name="Tree"
		icon='Tree.dmi'
		layer=MOB_LAYER+1
		density=0
		GroundLevel1
			icon_state="tree11"
			layer=MOB_LAYER
			pixel_x=-32

		a
			icon_state="tree7"
			layer=MOB_LAYER+1
			pixel_y=32
			pixel_x=-32
		b
			icon_state="tree8"
			layer=MOB_LAYER+2
			pixel_y=32
		c
			icon_state="tree9"
			layer=MOB_LAYER+2
			pixel_y=32
			pixel_x=32


		d
			icon_state="tree4"
			layer=MOB_LAYER+1
			pixel_y=64
			pixel_x=-32
		e
			icon_state="tree5"
			layer=MOB_LAYER+2
			pixel_y=64
		f
			icon_state="tree6"
			layer=MOB_LAYER+2
			pixel_y=64
			pixel_x=32

		g
			icon_state="tree1"
			layer=MOB_LAYER+1
			pixel_y=96
			pixel_x=-32
		h
			icon_state="tree2"
			layer=MOB_LAYER+2
			pixel_y=96
		i
			icon_state="tree3"
			layer=MOB_LAYER+2
			pixel_y=96
			pixel_x=32
		DEADgrowstump
			density=1
			layer=TURF_LAYER+1
			icon_state="tree10"
			New()
				src.overlays+=/obj/Trees1/GroundLevel1
				if(prob(30))
					src.icon_state="tree13"
					return

				src.overlays+=/obj/Trees1/a
				src.overlays+=/obj/Trees1/b
				src.overlays+=/obj/Trees1/c

				src.overlays+=/obj/Trees1/d
				src.overlays+=/obj/Trees1/e
				src.overlays+=/obj/Trees1/f

				src.overlays+=/obj/Trees1/g
				src.overlays+=/obj/Trees1/h
				src.overlays+=/obj/Trees1/i
obj
	Trees2//Original Tree
		name="Tree"
	//	icon='Tree.dmi'
		icon='Map/Turfs/NewTree3.dmi'
		layer=MOB_LAYER+1
		density=0
		Leaf1
			icon_state="leaf1"
			layer=MOB_LAYER+2
			pixel_y=96
			pixel_x=-32
		Leaf2
			icon_state="leaf2"
			layer=MOB_LAYER+2
			pixel_y=96
		Leaf3
			icon_state="leaf3"
			layer=MOB_LAYER+2
			pixel_y=96
			pixel_x=32
		Leaf4
			icon_state="leaf4"
			layer=MOB_LAYER+2
			pixel_y=64
			pixel_x=-32
		Leaf5
			icon_state="leaf5"
			layer=MOB_LAYER+2
			pixel_y=64
		Leaf6
			icon_state="leaf6"
			layer=MOB_LAYER+2
			pixel_y=64
			pixel_x=32

		Leaf7
			icon_state="leaf7"
			layer=MOB_LAYER+2
			pixel_y=32
			pixel_x=-32
		Leaf8
			icon_state="leaf8"
			layer=MOB_LAYER+2
			pixel_y=32
		Leaf9
			icon_state="leaf9"
			layer=MOB_LAYER+2
			pixel_y=32
			pixel_x=32

		LIFEgrowstump
			density=1
			layer=TURF_LAYER+1
			icon_state="tree10"
			var/Season="Spring"
			New()
				var/A
				if(src.Season=="Fall")
					A=rand(1,3)

				src.overlays+=/obj/Trees1/GroundLevel1

				src.overlays+=/obj/Trees1/a
				src.overlays+=/obj/Trees1/b
				src.overlays+=/obj/Trees1/c

				src.overlays+=/obj/Trees1/d
				src.overlays+=/obj/Trees1/e
				src.overlays+=/obj/Trees1/f

				src.overlays+=/obj/Trees1/g
				src.overlays+=/obj/Trees1/h
				src.overlays+=/obj/Trees1/i

				if(src.Season=="Winter")
					return
				var/obj/Trees2/Leaf1/B=new()
				if(A==1)
					B.icon_state="leaf1B"
				if(A==2)
					B.icon_state="leaf1C"
				src.overlays+=B
				var/obj/Trees2/Leaf2/C=new()
				if(A==1)
					C.icon_state="leaf2B"
				if(A==2)
					C.icon_state="leaf2C"
				src.overlays+=C
				var/obj/Trees2/Leaf3/D=new()
				if(A==1)
					D.icon_state="leaf3B"
				if(A==2)
					D.icon_state="leaf3C"
				src.overlays+=D
				var/obj/Trees2/Leaf4/E=new()
				if(A==1)
					E.icon_state="leaf4B"
				if(A==2)
					E.icon_state="leaf4C"
				src.overlays+=E
				var/obj/Trees2/Leaf5/F=new()
				if(A==1)
					F.icon_state="leaf5B"
				if(A==2)
					F.icon_state="leaf5C"
				src.overlays+=F
				var/obj/Trees2/Leaf6/G=new()
				if(A==1)
					G.icon_state="leaf6B"
				if(A==2)
					G.icon_state="leaf6C"
				src.overlays+=G
				var/obj/Trees2/Leaf7/H=new()
				if(A==1)
					H.icon_state="leaf7B"
				if(A==2)
					H.icon_state="leaf7C"
				src.overlays+=H
				var/obj/Trees2/Leaf8/I=new()
				if(A==1)
					I.icon_state="leaf8B"
				if(A==2)
					I.icon_state="leaf8C"
				src.overlays+=I
				var/obj/Trees2/Leaf9/J=new()
				if(A==1)
					J.icon_state="leaf9B"
				if(A==2)
					J.icon_state="leaf9C"
				src.overlays+=J


obj
	Trees3
		name="Tree"
		icon='Map/Turfs/NewTree4.dmi'
		layer=MOB_LAYER+1
		density=0
		Leaf1
			icon_state="leaf1"
			layer=MOB_LAYER+2
			pixel_y=96
			pixel_x=-32
		Leaf2
			icon_state="leaf2"
			layer=MOB_LAYER+2
			pixel_y=96
		Leaf3
			icon_state="leaf3"
			layer=MOB_LAYER+2
			pixel_y=96
			pixel_x=32
		Leaf4
			icon_state="leaf4"
			layer=MOB_LAYER+2
			pixel_y=64
			pixel_x=-32
		Leaf5
			icon_state="leaf5"
			layer=MOB_LAYER+2
			pixel_y=64
		Leaf6
			icon_state="leaf6"
			layer=MOB_LAYER+2
			pixel_y=64
			pixel_x=32

		Leaf7
			icon_state="leaf7"
			layer=MOB_LAYER+2
			pixel_y=32
			pixel_x=-32
		Leaf8
			icon_state="leaf8"
			layer=MOB_LAYER+2
			pixel_y=32
		Leaf9
			icon_state="leaf9"
			layer=MOB_LAYER+2
			pixel_y=32
			pixel_x=32

		LIFEgrowstump
			density=1
			layer=TURF_LAYER+1
			icon_state="tree10"
			var/Season="Spring"
			New()
				var/A
				if(src.Season=="Fall")
					A=rand(1,3)

				src.overlays+=/obj/Trees1/GroundLevel1

				src.overlays+=/obj/Trees1/a
				src.overlays+=/obj/Trees1/b
				src.overlays+=/obj/Trees1/c

				src.overlays+=/obj/Trees1/d
				src.overlays+=/obj/Trees1/e
				src.overlays+=/obj/Trees1/f

				src.overlays+=/obj/Trees1/g
				src.overlays+=/obj/Trees1/h
				src.overlays+=/obj/Trees1/i

				if(src.Season=="Winter")
					return
				var/obj/Trees3/Leaf1/B=new()
				if(A==1)
					B.icon_state="leaf1B"
				if(A==2)
					B.icon_state="leaf1C"
				src.overlays+=B
				var/obj/Trees3/Leaf2/C=new()
				if(A==1)
					C.icon_state="leaf2B"
				if(A==2)
					C.icon_state="leaf2C"
				src.overlays+=C
				var/obj/Trees3/Leaf3/D=new()
				if(A==1)
					D.icon_state="leaf3B"
				if(A==2)
					D.icon_state="leaf3C"
				src.overlays+=D
				var/obj/Trees3/Leaf4/E=new()
				if(A==1)
					E.icon_state="leaf4B"
				if(A==2)
					E.icon_state="leaf4C"
				src.overlays+=E
				var/obj/Trees3/Leaf5/F=new()
				if(A==1)
					F.icon_state="leaf5B"
				if(A==2)
					F.icon_state="leaf5C"
				src.overlays+=F
				var/obj/Trees3/Leaf6/G=new()
				if(A==1)
					G.icon_state="leaf6B"
				if(A==2)
					G.icon_state="leaf6C"
				src.overlays+=G
				var/obj/Trees3/Leaf7/H=new()
				if(A==1)
					H.icon_state="leaf7B"
				if(A==2)
					H.icon_state="leaf7C"
				src.overlays+=H
				var/obj/Trees3/Leaf8/I=new()
				if(A==1)
					I.icon_state="leaf8B"
				if(A==2)
					I.icon_state="leaf8C"
				src.overlays+=I
				var/obj/Trees3/Leaf9/J=new()
				if(A==1)
					J.icon_state="leaf9B"
				if(A==2)
					J.icon_state="leaf9C"
				src.overlays+=J