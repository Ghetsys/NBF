turf
	var/bnorth = 0
	var/bsouth = 0
	var/beast = 0
	var/bwest = 0
	var/gnorth = 0
	var/gsouth = 0
	var/geast = 0
	var/gwest = 0
	Enter(mob/M)//This one means if you try to enter and one of the cases is true
		if(ismob(M))
			if(src.gnorth==1&&M.dir==NORTH||src.gnorth==1&&M.dir==NORTHWEST||src.gnorth==1&&M.dir==NORTHEAST)
				return
			else if(src.gsouth==1&&M.dir==SOUTH||src.gnorth==1&&M.dir==SOUTHWEST||src.gnorth==1&&M.dir==SOUTHEAST)
				return
			else if(src.beast==1&&M.dir==EAST||src.beast==1&&M.dir==NORTHEAST||src.beast==1&&M.dir==SOUTHEAST)
				return
			else if(src.gwest==1&&M.dir==WEST||src.gwest==1&&M.dir==NORTHWEST||src.gwest==1&&M.dir==SOUTHWEST)
				return

			else
				return..()
		else
			return ..()
	Exit(mob/M)//This one means if you try to exit and one of the cases is true
		if(ismob(M))
			if(src.gnorth==1&&M.dir==NORTH||src.gnorth==1&&M.dir==NORTHWEST||src.gnorth==1&&M.dir==NORTHEAST)
				return
			else if(src.gsouth==1&&M.dir==SOUTH||src.gnorth==1&&M.dir==SOUTHWEST||src.gnorth==1&&M.dir==SOUTHEAST)
				return
			else if(src.beast==1&&M.dir==EAST||src.beast==1&&M.dir==NORTHEAST||src.beast==1&&M.dir==SOUTHEAST)
				return
			else if(src.gwest==1&&M.dir==WEST||src.gwest==1&&M.dir==NORTHWEST||src.gwest==1&&M.dir==SOUTHWEST)
				return

			else
				return..()
		else
			return..()
turf/Buildings/
	ByondSymbol
		icon='byondsymbol.dmi'
		layer=MOB_LAYER+10
	ClanSymbol
		icon='ClanSymbol.dmi'
		layer=MOB_LAYER+10
		Leaf
			Aburame icon_state="Aburame"
			Akimichi icon_state="Akimichi"
			Hyuuga icon_state="Hyuuga"
			Inuzuka icon_state="Inuzuka"
		Rock
			Iwazuka icon_state="Iwazuka"
			Sabaku icon_state="Sabaku"
	zLeafPrison
		density=0
		opacity=1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Village=="Leaf"&&!M.Suspended)
					return 1
				else
					M<<"You're locked in this prison! Is there no way out?.."
					return 0
			else
				return 1
	PrisonSoundEnter
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.x==157)
					return 0
			//		M.loc=locate(87,92,35)
				if(M.x==158)
					return 0
			//		M.loc=locate(88,92,35)
				if(M.x==159)
					return 0
			//		M.loc=locate(89,92,35)
				if(M.x==160)
					return 0
			//		M.loc=locate(90,92,35)
	PrisonSoundLeave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.x==87)
					M.loc=locate(157,141,33)
				if(M.x==88)
					M.loc=locate(158,141,33)
				if(M.x==89)
					M.loc=locate(159,141,33)
				if(M.x==90)
					M.loc=locate(160,141,33)
	PrisonEnter
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.x==57)
					return 0
			//		M.loc=locate(166,74,1)
				if(M.x==58)
					return 0
			//		M.loc=locate(167,74,1)
				if(M.x==59)
					return 0
			//		M.loc=locate(168,74,1)
				if(M.x==60)
					return 0
			//		M.loc=locate(169,74,1)
	PrisonLeave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.x==166)
					M.loc=locate(57,10,1)
				if(M.x==167)
					M.loc=locate(58,10,1)
				if(M.x==168)
					M.loc=locate(59,10,1)
				if(M.x==169)
					M.loc=locate(60,10,1)

	zDensity
		density=1
		layer = 500
		Enter(A)
			if(isobj(A))
				return 0
			if(ismob(A))
				var/mob/M = A
				if(M.density==0&&src.density)
					return 1
				else
					return 0
		SoundHospitalExit
			opacity=1
			density=0
			Enter(A)
				if(ismob(A))
					var/mob/M=A
					if(M.dir==SOUTH)
						return 1
					else
						return 1
				else
					return 0
	Opacityenter
		density=0
		opacity=1
		layer = 999

	zAllow
		density=0
		layer = 999
	zAntiNPC
		density=0
		layer=999
		//Enter(A)
		//	if(ismob(A))
		//		var/mob/M=A
		//		if(!M.client&&M.icon=='Wolf.dmi'||M.AOS||M.AWA&&M.target==""||M.AWA&&M.target==null)
		//			return 0
		//		else
turf/Buildings/SoundPrison
	icon='BlackStone.dmi'
	layer=11
	BottomLeft
		icon_state="bottomleft"
	Bottom
		icon_state="bottom"
	BottomRight
		icon_state="bottomright"
	Left
		icon_state="left"
	Mid
		icon_state="mid"
	Mid2
		icon_state="mid2"
	Middle
		icon_state="middle"
	Right
		icon_state="right"
	TopLeft
		icon_state="topleft"
	Top
		icon_state="top"
	TopRight
		icon_state="topright"
area
	Overlay
		icon='BlackStone.dmi'
		icon_state="overlay"
		layer=10
turf/Buildings/Rainwalls
	icon='Rainbuildings.dmi'
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
	Wall6
		icon_state = "rainne"
	Roofs
		layer=6
		roof1
			icon_state = "m"
		roof2
			icon_state = "m2"
		roof3
			icon_state = "rml"
		roof4
			icon_state = "rmr"
		roof5
			icon_state = "t"
		roof6
			icon_state = "b"
		roof7
			icon_state = "rbr"
		roof8
			icon_state = "rtr"
		roof9
			icon_state = "rtl"
		roof10
			icon_state = "rbl"
	Roof2
		layer=MOB_LAYER+3

		Part1
			icon_state="Roof1"
		Part2
			icon_state="Roof2"
		Part3
			icon_state="Roof3"
		Part4
			icon_state="Roof4"
		Part5
			icon_state="Roof5"
		Part6
			icon_state="Roof6"
		Part7
			icon_state="Roof7"
		Part8
			icon_state="Roof8"
		Part9
			icon_state="Roof9"

	window
		icon_state = "w"
	Floor
		icon_state = "F"
	Floor2
		icon_state = "Tiles"
	Floor3
		icon_state = "Tiles2"
	Door
		icon_state = "Door"
	Stairs
		icon_state = "bridgeup"
		density = 0
	LightingRod
		Lrod1
			icon_state = "lrod1"
		Lrod2
			icon_state = "lrod2"
		Lrod3
			icon_state = "lrod3"
		Lrod4
			icon_state = "lrod4"
	Signs
		sign1
			icon_state = "s1"
		sign2
			icon_state = "s2"
		sign3
			icon_state = "s3"
		sign4
			icon_state = "s4"
	InsideBuildings
		Painting1
			icon_state="paint1"
		Painting2
			icon_state="paint2"
		Painting3
			icon_state="paint3"
		Plant
			icon_state="palm"
		Codeofarms
			icon_state="arms"
		FLoor
			icon_state="wood"
	Pipes
		Pipe1
			icon_state = "pipe"
		Pipe2
			icon_state = "pipe2"
		Pipe3
			icon_state = "Cmid"
		Pipe4
			icon_state = "mid"
		Pipe5
			icon_state = "raa"
		Pipe6
			icon_state = "rs"
		Pipe7
			icon_state = "ls"
		Pipe8
			icon_state = "x"
		Pipe9
			icon_state = "sp"
		Pipe10
			icon_state = "esp"
		Pipe11
			icon_state = "bsp"
		Pipe12
			icon_state = "ph"
		Pipe13
			icon_state = "bs"
		Pipe14
			icon_state = "as"
		Pipe15
			icon_state = "hmid"
		Pipe16
			icon_state = "hcmid"
		Pipe17
			icon_state = "c"
		Pipe18
			icon_state = "end"
		Pipe19
			icon_state = "mu"
		Pipe20
			icon_state = "n"
		Pipe21
			icon_state = "bhh"
		Pipe22
			icon_state = "v"
		Pipe23
			icon_state = "g"
	RainSymbol
		rainsign
			icon_state = "1"
			density=1
		rainsign2
			icon_state = "2"
			density=1
	RainStrip
		Girl1
			icon_state="g1"
		Girl2
			icon_state="g2"
		Girl3
			icon_state="g3"
		Girl4
			icon_state="g4"
		Girl5
			icon_state="g5"


turf/Buildings/Infastructure
	icon='Map/Turfs/HakumeiGetsu.dmi'
	layer=5
//	density=1
	Wall1
		icon_state = "wallSW"
	Wall2
		icon_state = "wallS"
	Wall3
		icon_state = "wallSE"
	Wall4
		icon_state = "wallUPW"
	Wall5
		icon_state = "wallUP"
	Wall6
		icon_state = "wallUPE"
	EarthWall
		icon_state="EarthWall"
	TopWalls
	//	density=1
		TopWall1
			icon_state="roof"
		TopWall2
			icon_state="roof2"
		TopWall3
			icon_state="roof3"
		TopWall4
			icon_state="roof4"
		TopWall5
			icon_state="roof5"
		TopWall6
			icon_state="roof6"
		TopWall7
			icon_state="roof7"
		TopWall8
			icon_state="roof8"
		TopWall9
			icon_state="roof9"
		TopWall10
			icon_state="roof10"
		TopWall11
			icon_state="roof11"
		TopWall12
			icon_state="roof12"
		TopWall13
			icon_state="roof13"
turf/Buildings/House2
	icon = 'House 5 base 1.dmi'
	layer=5
	Part1
		icon_state = "1"
		density=1
	Part2
		icon_state = "2"
		density=1
	Part3
		icon_state = "3"
		density=1
	Part4
		icon_state = "4"
		density=1
	Part5
		icon_state = "5"
		density=1
	Part6
		icon_state = "6"
		density=1
	Part7
		icon_state = "7"
		density=1
	Part8
		icon_state = "8"
		density=1
	Part9
		icon_state = "9"
		density=1
	Part10
		icon_state = "10"
		density=1
	Part11
		icon_state = "11"
		density=1
	Part12
		icon_state = "12"
		density=1
turf/Buildings/House1
	layer=5
	Part1
		icon = 'House 5 base 2.dmi'
		icon_state = "1"
		density=1
	Part2
		icon = 'House 5 base 2.dmi'
		icon_state = "2"
		density=1
	Part3
		icon = 'House 5 base 2.dmi'
		icon_state = "3"
		density=1
	Part4
		icon = 'House 5 base 2.dmi'
		icon_state = "4"
		density=1
	Part5
		icon = 'House 5 base 2.dmi'
		icon_state = "5"
		density=1
	Part6
		icon = 'House 5 base 2.dmi'
		icon_state = "6"
		density=1
	Part7
		icon = 'House 5 base 2.dmi'
		icon_state = "7"
		density=1
		layer=MOB_LAYER+2
	Part8
		icon = 'House 5 base 2.dmi'
		icon_state = "8"
		density=1
	Part9
		icon = 'House 5 base 2.dmi'
		icon_state = "9"
		density=1
	Part10
		icon = 'House 5 base 2.dmi'
		icon_state = "10"
		density=1
	Part11
		icon = 'House 5 base 2.dmi'
		icon_state = "11"
		density=1
	Part12
		icon = 'House 5 base 2.dmi'
		icon_state = "12"
		density=1
	Part13
		icon='HouseStuff.dmi'
		icon_state="Left side"
		density=1
	Part14
		icon='HouseStuff.dmi'
		icon_state="Right side"
		density=1
	Part15
		icon='HouseStuff.dmi'
		icon_state="Door opening"
		density=0
	Part16
		icon='HouseStuff.dmi'
		icon_state="Shutters right Bottom"
		density=1
	Part17
		icon='HouseStuff.dmi'
		icon_state="Shutters Right Top"
		density=1
	Part18
		icon='HouseStuff.dmi'
		icon_state="Shutters Left Bottom"
		density=1
	Part19
		icon='HouseStuff.dmi'
		icon_state="Shutters Left Top"
		density=1
	Passage
		icon='House 5 base 2.dmi'
		icon_state="11"
		density=1
		layer=10
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.Village=="Leaf"&&usr.rank!="Genin"&&usr.rank!="Chuunin")
				sleep(20)
				flick("open",src)
				sleep(25)
				src.icon_state="opened"
				src.density=0
				spawn(30)
					flick("close",src)
					src.density=1
					sleep(25)
					src.icon_state="11"
	Passage2
		icon='House 5 base 2.dmi'
		icon_state="11"
		density=1
		layer=10
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.Village=="Sound"&&usr.rank!="Genin"&&usr.rank!="Chuunin")
				sleep(20)
				flick("open",src)
				sleep(25)
				src.icon_state="opened"
				src.density=0
				spawn(30)
					flick("close",src)
					src.density=1
					sleep(25)
					src.icon_state="11"
		Enter(A)
			if(ismob(A))
				if(src.density)
					return 0
				else
					return 1
		Entered(A)
			if(ismob(A))
				var/mob/M=A
				M.loc=locate(pick(158,159),131,33)
	Passage2Return
		density=0
		var/BeingEntered=0
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				var/turf/T=locate(159,118,33)
				if(T)
					if(!BeingEntered)
						BeingEntered=1
						flick("open",T)
						sleep(25)
						M.loc=T
						T.icon_state="opened"
						T.density=0
						spawn(30)
							flick("close",T)
							T.density=1
							sleep(25)
							T.icon_state="11"
							BeingEntered=0
					else
						if(!T.density)
							M.loc=T
				else
					M<<"Failure: Cannot locate entrance"
obj/Doors
	DoorSide
		icon='House 5 base 2.dmi'
		icon_state="DoorSide"
		density=1
		opacity=1
		layer=9
		health=10000
	Door
		icon='House 5 base 2.dmi'
		icon_state="Door"
		density=1
		opacity=1
		layer=9
		health=10000
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.client&&usr.dir==get_dir(usr,src))
				sleep(5)
				flick("DoorOpen",src)
				sleep(7)
				src.icon_state="DoorOpened"
				src.density=0
				src.opacity=0
				spawn(30)
					flick("DoorClose",src)
					src.density=1
					sleep(9)
					src.opacity=1
					src.icon_state="Door"
		Del()
			viewers(src)<<"The door shatters!!"
			..()
	DoorSoundPrison
		icon='House 5 base 2.dmi'
		icon_state="Door"
		density=1
		opacity=1
		layer=9
		health=10000
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.dir==get_dir(usr,src)&&usr.Village=="Sound"&&!usr.Suspended&&usr.rank!="Genin")
				sleep(5)
				flick("DoorOpen",src)
				sleep(7)
				src.icon_state="DoorOpened"
				src.density=0
				src.opacity=0
				spawn(30)
					flick("DoorClose",src)
					src.density=1
					sleep(9)
					src.opacity=1
					src.icon_state="Door"
		Del()
			viewers(src)<<"The door shatters!!"
			..()

	MountainDoor
		icon='Passage.dmi'
		icon_state="Mountain"
		density=1
		opacity=1
		layer=9
		health=100000000000
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.client&&usr.dir==get_dir(usr,src))
				sleep(5)
				flick("MountainOpen",src)
				sleep(7)
				src.icon_state="MountainOpened"
				src.density=0
				src.opacity=0
				spawn(30)
					flick("MountainClose",src)
					src.density=1
					sleep(9)
					src.opacity=1
					src.icon_state="Mountain"
		Del()
			viewers(src)<<"The Mountain Side Crumbles revealing a hidden passage!!"





turf/Buildings/House1/Roof
	layer=MOB_LAYER+2
	NewRoof
		icon = 'House 5 base 2.dmi'
		Part1 icon_state="0,0"
		Part2 icon_state="0,1"
		Part3 icon_state="0,2"
		Part4 icon_state="1,0"
		Part5 icon_state="1,1"
		Part6 icon_state="1,2"
		Part7 icon_state="2,0"
		Part8 icon_state="2,1"
		Part9 icon_state="2,2"
	Part1
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Top Left side"
	Part2
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof middle Left side"
	Part3
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Bottom Left side"
	Part4
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Top right side"
	Part5
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof middle right side"
	Part6
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Bottom right side"
	Part7
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 1"
	Part8
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 4"
	Part11
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 1"
	Part12
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 4"
	Part15
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 1"
		density=1
	Part16
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 2"
		density=1
	Part17
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 3"
		density=1
	Part18
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 4"
		density=1
	Part19
		icon = 'House 5 base 2.dmi'
		icon_state = "Miz1"
		density=1
	Part20
		icon = 'House 5 base 2.dmi'
		icon_state = "Miz2"
		density=1
	Part21
		icon = 'House 5 base 2.dmi'
		icon_state = "Edge1"
		layer=MOB_LAYER+1
	Part22
		icon = 'House 5 base 2.dmi'
		icon_state = "Edge2"
		layer=MOB_LAYER+1
	Part23
		icon = 'House 5 base 2.dmi'
		icon_state = "Edge3"
		layer=MOB_LAYER+1
turf/Buildings/House1/Roof2
	layer=MOB_LAYER+2
	Part1
		icon = 'House5Roof.dmi'
		icon_state = "Roof Top Left side"
	Part2
		icon = 'House5Roof.dmi'
		icon_state = "Roof middle Left side"
	Part3
		icon = 'House5Roof.dmi'
		icon_state = "Roof Bottom Left side"
	Part4
		icon = 'House5Roof.dmi'
		icon_state = "Roof Top right side"
	Part5
		icon = 'House5Roof.dmi'
		icon_state = "Roof middle right side"
	Part6
		icon = 'House5Roof.dmi'
		icon_state = "Roof Bottom right side"
	Part7
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 1"
	Part8
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 4"
	Part11
		icon = 'House5Roof.dmi'
		icon_state = "Top 1"
	Part12
		icon = 'House5Roof.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House5Roof.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House5Roof.dmi'
		icon_state = "Top 4"
	Part15
		icon = 'House5Roof.dmi'
		icon_state = "Middle 1"
		density=1
	Part16
		icon = 'House5Roof.dmi'
		icon_state = "Middle 2"
		density=1
	Part17
		icon = 'House5Roof.dmi'
		icon_state = "Middle 3"
		density=1
	Part18
		icon = 'House5Roof.dmi'
		icon_state = "Middle 4"
		density=1
	Part19
		icon = 'House5Roof.dmi'
		icon_state = "Miz1"
		density=1
	Part20
		icon = 'House5Roof.dmi'
		icon_state = "Miz2"
		density=1
	Part21
		icon = 'House5Roof.dmi'
		icon_state = "Edge1"
		density=1
	Part22
		icon = 'House5Roof.dmi'
		icon_state = "Edge2"
		density=1
turf/Buildings/House1/Roof3
	layer=MOB_LAYER+2
	Part1
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Top Left side"
	Part2
		icon = 'House5Roof2.dmi'
		icon_state = "Roof middle Left side"
	Part3
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Bottom Left side"
	Part4
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Top right side"
	Part5
		icon = 'House5Roof2.dmi'
		icon_state = "Roof middle right side"
	Part6
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Bottom right side"
	Part7
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 1"
	Part8
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 4"
	Part11
		icon = 'House5Roof2.dmi'
		icon_state = "Top 1"
	Part12
		icon = 'House5Roof2.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House5Roof2.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House5Roof2.dmi'
		icon_state = "Top 4"
	Part15
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 1"
		density=1
	Part16
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 2"
		density=1
	Part17
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 3"
		density=1
	Part18
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 4"
		density=1
	Part19
		icon = 'House5Roof2.dmi'
		icon_state = "Miz1"
		density=1
	Part20
		icon = 'House5Roof2.dmi'
		icon_state = "Miz2"
		density=1
	Part21
		icon = 'House5Roof2.dmi'
		icon_state = "Edge1"
		density=1
	Part22
		icon = 'House5Roof2.dmi'
		icon_state = "Edge2"
		density=1
turf/Buildings/House1/Roof4
	layer=MOB_LAYER+2
	icon = 'House5Roof3.dmi'
	Part1
		icon_state = "Roof Top Left side"
	Part2
		icon_state = "Roof middle Left side"
	Part3
		icon_state = "Roof Bottom Left side"
	Part4
		icon_state = "Roof Top right side"
	Part5
		icon_state = "Roof middle right side"
	Part6
		icon_state = "Roof Bottom right side"
	Part7
		icon_state = "Bottom 1"
	Part8
		icon_state = "Bottom 2"
	Part9
		icon_state = "Bottom 3"
	Part10
		icon_state = "Bottom 4"
	Part11
		icon_state = "Top 1"
	Part12
		icon_state = "Top 2"
	Part13
		icon_state = "Top 3"
	Part14
		icon_state = "Top 4"
	Part15
		icon_state = "Middle 1"
		density=1
	Part16
		icon_state = "Middle 2"
		density=1
	Part17
		icon_state = "Middle 3"
		density=1
	Part18
		icon_state = "Middle 4"
		density=1
	Part19
		icon_state = "Miz1"
		density=1
	Part20
		icon_state = "Miz2"
		density=1
	Part21
		icon_state = "Edge1"
		density=1
	Part22
		icon_state = "Edge2"
		density=1
turf/Buildings/Konoha/Fence
	Fence1
		icon='Scenary.dmi'
		icon_state="GateType0"
		layer=MOB_LAYER+1
	Fence2
		icon='Scenary.dmi'
		icon_state="GateType1"
		layer=MOB_LAYER+1
	Fence3
		icon='Scenary.dmi'
		icon_state="GateType2"
		layer=MOB_LAYER+1
	Fence4
		icon='Scenary.dmi'
		icon_state="GateType3"
		layer=MOB_LAYER+1
	Fence5
		icon='Scenary.dmi'
		icon_state="GateType4"
		layer=MOB_LAYER+1
		beast = 1
		beast = 1
	Fence6
		icon='Scenary.dmi'
		icon_state="GateType5"
		layer=MOB_LAYER+1
		gwest = 1
		geast = 1
	Fence7
		icon='Scenary.dmi'
		icon_state="GateType6"
		layer=MOB_LAYER+1
		density=1
	Fence8
		icon='Scenary.dmi'
		icon_state="GateType7"
		layer=MOB_LAYER+1
		density=1
	Fence9
		icon='Scenary.dmi'
		icon_state="GateType8"
		layer=MOB_LAYER+1
	Fence10
		icon='Scenary.dmi'
		icon_state="GateType9"
		layer=MOB_LAYER+1
	Fence11
		icon='Scenary.dmi'
		icon_state="GateType10"
		layer=MOB_LAYER+1
turf/Buildings/Konoha/Hospital
	icon='TESTtransperent.png'
	layer=MOB_LAYER+1
turf/Batruzon
	icon='BatruzonSymbol.png'
	layer=MOB_LAYER+10

turf/BatruzonSymbol
	density=0
	Enter(A)
		if(ismob(A))
			var/mob/M = A
			if(M.key=="The Jefferson")
				oview(8)<<"The Symbol reacts to Batruzon's presence!"
				sleep(2)
				oview(8)<<"Batruzon quickly dissapears!"
				sleep(10)
				M.loc=locate(63,31,4)
				return
			else
				return
turf/Buildings/Konoha/BigBuilding
	icon='konohahouse.png'
	layer=MOB_LAYER+10
turf/Buildings/Sound/SoundOrganizationHouse
	icon='SOHOUSE.png'
	layer=MOB_LAYER+10
turf/Buildings/Sound/SoundVillageHouse
	icon='SoundBuilding.dmi'
	layer=MOB_LAYER+1
turf/Buildings/Sound/Home
	icon = 'BuildingSoung.dmi'
	icon_state = "1"
	layer=40
turf/Buildings/Sound/Painting3
	icon = 'new picture.dmi'
	icon_state = "pic3"
	layer=40
turf/Buildings/Sound/Painting1
	icon = 'new picture.dmi'
	icon_state = "pic1"
	layer=40
turf/Buildings/Sound/Painting2
	icon = 'new picture.dmi'
	icon_state = "pic2"
	layer=40
turf/Buildings/Sound/Painting4
	icon = 'new picture.dmi'
	icon_state = "pic4"
	layer=40
turf/Buildings/Sound/Painting5
	icon = 'new picture.dmi'
	icon_state = "pic5"
	layer=40
turf/Buildings/Sound/Painting6
	icon = 'new picture.dmi'
	icon_state = "pic6"
	layer=40
turf/Buildings/Sound/Painting7
	icon = 'new picture 2.dmi'
	icon_state = "pic1"
	layer=40
turf/Buildings/Sound/Painting8
	icon = 'new picture 2.dmi'
	icon_state = "pic2"
	layer=40
turf/Buildings/Sound/Painting9
	icon = 'new picture 2.dmi'
	icon_state = "pic3"
	layer=40
turf/Buildings/Sound/Home1
	icon = 'BuildingSoung.dmi'
	icon_state = "old roof"
	layer=40
turf/Buildings/Sound/Home2
	icon = 'BuildingSoung.dmi'
	icon_state = "new"
	layer=40
turf/Buildings/Sound/roof
	icon = 'BuildingSoung.dmi'
	icon_state = "uchiha"
	layer=40
turf/Buildings/Rock
	EarthHospital
		icon='EarthHospital.png'
		layer=MOB_LAYER+1
	RockHouse
		icon='RockHouse.png'
		layer=MOB_LAYER+1
	RockVillageHouses
		icon='RockVillageHouses.png'
		layer=MOB_LAYER+1
	AssassinCreedSymbol
		icon ='Icons/assassin.dmi'
		layer=MOB_LAYER+1

turf/Buildings/Konoha/Memorial
	icon='Memorial.dmi'
	layer=TURF_LAYER+1
turf/Buildings/Gate1
	Part1
		icon='KonohaGate.dmi'
		icon_state="TopPiece"
		layer=MOB_LAYER+1
	Part2
		icon='KonohaGate.dmi'
		icon_state="MidPiece"
		density=1
	Part3
		icon='KonohaGate.dmi'
		icon_state="Edge12"
		density=1
	Part4
		icon='KonohaGate.dmi'
		icon_state="Edge22"
		density=1
	Part5
		icon='KonohaGate.dmi'
		icon_state="MidPiece2"
		layer=MOB_LAYER+1
	Part3
		icon='KonohaGate.dmi'
		icon_state="Edge1"
		density=1
	Part4
		icon='KonohaGate.dmi'
		icon_state="Edge2"
		density=1
turf/Buildings/Gate1/Roof
	layer=MOB_LAYER+3
	Part1
		icon='KonohaGate.dmi'
		icon_state="Roof1"
	Part2
		icon='KonohaGate.dmi'
		icon_state="Roof2"
	Part3
		icon='KonohaGate.dmi'
		icon_state="Roof3"
	Part4
		icon='KonohaGate.dmi'
		icon_state="Roof4"
	Part5
		icon='KonohaGate.dmi'
		icon_state="Roof5"
	Part6
		icon='KonohaGate.dmi'
		icon_state="Roof6"
	Part7
		icon='KonohaGate.dmi'
		icon_state="Roof7"
	Part8
		icon='KonohaGate.dmi'
		icon_state="Roof8"
	Part9
		icon='KonohaGate.dmi'
		icon_state="Roof9"
turf/Buildings/Gate1/Roof2
	layer=MOB_LAYER+3
	icon='SoundGate.dmi'
	Part1
		icon_state="Roof1"
	Part2
		icon_state="Roof2"
	Part3
		icon_state="Roof3"
	Part4
		icon_state="Roof4"
	Part5
		icon_state="Roof5"
	Part6
		icon_state="Roof6"
	Part7
		icon_state="Roof7"
	Part8
		icon_state="Roof8"
	Part9
		icon_state="Roof9"
turf/Buildings/Gate/Gatez
	icon='Gate2.dmi'
	layer=MOB_LAYER+3
	z001
		icon_state="1"
	z002
		icon_state="2"
	z003
		icon_state="3"
	z004
		icon_state="4"
	z005
		icon_state="5"
	z006
		icon_state="6"
	z007
		icon_state="7"
	z008
		icon_state="8"
	z009
		icon_state="9"
	z010
		icon_state="10"
	z011
		icon_state="11"
	z012
		icon_state="12"
	z013
		icon_state="13"
	z014
		icon_state="14"
	z015
		icon_state="15"
	z016
		icon_state="16"
	z017
		icon_state="17"
	z018
		icon_state="18"
	z019
		icon_state="19"
	z020
		icon_state="20"
	z021
		icon_state="21"
	z022
		icon_state="22"
	z023
		icon_state="23"
	z024
		icon_state="24"
	z025
		icon_state="25"
	z026
		icon_state="26"
	z027
		icon_state="27"
	z028
		icon_state="28"
	z029
		icon_state="29"
	z030
		icon_state="30"
	z031
		icon_state="31"
	z032
		icon_state="32"
	z033
		icon_state="33"
	z034
		icon_state="34"
	z035
		icon_state="35"
	z036
		icon_state="36"
	z037
		icon_state="37"
	z038
		icon_state="38"
	z039
		icon_state="39"
	z040
		icon_state="40"
	z041
		icon_state="41"
	z042
		icon_state="42"
	z043
		icon_state="43"
	z044
		icon_state="44"
	z045
		icon_state="45"
	z046
		icon_state="46"
	z047
		icon_state="47"
	z048
		icon_state="48"
	z049
		icon_state="49"
	z050
		icon_state="50"
	z051
		icon_state="51"
	z052
		icon_state="52"
	z053
		icon_state="53"
	z054
		icon_state="54"
	z055
		icon_state="55"
	z056
		icon_state="56"
	z057
		icon_state="57"
	z058
		icon_state="58"
	z059
		icon_state="59"
	z060
		icon_state="60"
	z061
		icon_state="61"
	z062
		icon_state="62"
	z063
		icon_state="63"
	z064
		icon_state="64"
	z065
		icon_state="65"
	z066
		icon_state="66"
	z067
		icon_state="67"
	z068
		icon_state="68"
	z069
		icon_state="69"
	z070
		icon_state="70"
	z071
		icon_state="71"
	z072
		icon_state="72"
	z073
		icon_state="73"
	z074
		icon_state="74"
	z075
		icon_state="75"
	z076
		icon_state="76"
	z077
		icon_state="77"
	z078
		icon_state="78"
	z079
		icon_state="79"
	z080
		icon_state="80"
	z081
		icon_state="81"
	z082
		icon_state="82"
	z083
		icon_state="83"
	z084
		icon_state="84"
	z085
		icon_state="85"
	z086
		icon_state="86"
	z087
		icon_state="87"
	z088
		icon_state="88"
	z089
		icon_state="89"
	z090
		icon_state="90"
	z091
		icon_state="91"
	z092
		icon_state="92"
	z093
		icon_state="93"
	z094
		icon_state="94"
	z095
		icon_state="95"
	z096
		icon_state="96"
	z097
		icon_state="97"
	z098
		icon_state="98"
	z099
		icon_state="99"
	z100
		icon_state="100"
	z101
		icon_state="101"
	z102
		icon_state="102"
	z103
		icon_state="103"
	z104
		icon_state="104"
	z105
		icon_state="105"
	z106
		icon_state="106"
	z107
		icon_state="107"
		layer = 3
	z108
		icon_state="108"
		layer = 3
	z109
		icon_state="109"
		layer = 3
	z110
		icon_state="110"
		layer = 3
	z111
		icon_state="111"
		layer = 3
	z112
		icon_state="112"
		layer = 3
	z113
		icon_state="113"
		layer = 3
	z114
		icon_state="114"
		layer = 3
	z115
		icon_state="115"
	z116
		icon_state="116"
	z117
		icon_state="117"
		layer = 3
	z118
		icon_state="118"
		layer = 3
	z119
		icon_state="119"
	z120
		icon_state="120"
		layer = 3
turf/Buildings/Fence
	Fence1
		icon = 'House 5 base 2.dmi'
		icon_state = "Fence1"
	Fence2
		icon = 'House 5 base 2.dmi'
		icon_state = "Fence2"
		layer=MOB_LAYER+1
turf/Buildings/Signs
	layer=MOB_LAYER+1
	WeaponSigns
		WeaponSign1
			icon='Scenary.dmi'
			icon_state="higher sign1(weapon)"
		WeaponSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(weapon)"
		WeaponSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(weapon)"
		WeaponSign4
			icon='Scenary.dmi'
			icon_state="higher sign 4(weapon)"
		WeaponSign5
			icon='Scenary.dmi'
			icon_state="higher sign 5(weapon)"
		WeaponSign6
			icon='Scenary.dmi'
			icon_state="higher sign 6(weapon)"
		WeaponSign7
			icon='Scenary.dmi'
			icon_state="higher sign 7(weapon)"
	FoodSigns
		FoodSign1
			icon='Scenary.dmi'
			icon_state="higher sign 1(barbaque)"
		FoodSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(barbaque)"
		FoodSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(barbaque)"
	ScrollSigns
		ScrollSign1
			icon='Scenary.dmi'
			icon_state="higher sign 1(scroll)"
		ScrollSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(scroll)"
		ScrollSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(scroll)"
	ItemSigns
		ItemSign1
			icon='Scenary.dmi'
			icon_state="higher sign 1(item)"
		ItemSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(item)"
		ItemSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(item)"
turf/Buildings/Scenary
	Bench1
		icon = 'Scenary.dmi'
		icon_state="bench3"
		density=0
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
							usr.health+=(usr.maxhealth/80)/2
						if(usr.stamina<usr.maxstamina)
							usr.stamina+=(usr.maxstamina/70)/2
				//		if(usr.chakra<usr.Mchakra)
				//			usr.chakra+=(usr.Mchakra/100)
						if(usr.ChakraPool<usr.MaxChakraPool)
							usr.ChakraPool+=(usr.MaxChakraPool/100)/2
						sleep(11)
					usr<<"You're fully relaxed."
					usr.resting=0
					usr.Frozen=0
					return
	Bench2
		icon = 'Scenary.dmi'
		icon_state="bench4"
		density=0
		verb
			Rest()
				if(!usr||!usr.client)
					return
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
							usr.health+=(usr.maxhealth/80)/2
						if(usr.stamina<usr.maxstamina)
							usr.stamina+=(usr.maxstamina/70)/2
					//	if(usr.chakra<usr.Mchakra)
					//		usr.chakra+=(usr.Mchakra/100)
						if(usr.ChakraPool<usr.MaxChakraPool)
							usr.ChakraPool+=(usr.MaxChakraPool/100)/2
						sleep(11)
					usr<<"You're fully relaxed."
					usr.resting=0
					usr.Frozen=0
					return
	Lamp
		icon = 'Scenary.dmi'
		icon_state="lamp"
		density=1
	Lamp2
		icon = 'Scenary.dmi'
		icon_state="lamp4"
		density=1
	LampSky
		icon='Scenary.dmi'
		icon_state="lamp2"
		layer=MOB_LAYER+1
	UchihaSign
		icon = 'Scenary.dmi'
		icon_state="Uchihasign1"
		layer=MOB_LAYER+4
	UchihaSign2
		icon = 'Scenary.dmi'
		icon_state="Uchihasign2"
		layer=MOB_LAYER+4
	UchihaSign3
		icon = 'Scenary.dmi'
		icon_state="Uchihasign3"
		layer=MOB_LAYER+4
	UchihaSign4
		icon = 'Scenary.dmi'
		icon_state="Uchihasign4"
		layer=MOB_LAYER+4
	UchihaSign5
		icon = 'Scenary.dmi'
		icon_state="Uchihasign5"
		layer=MOB_LAYER+4
	UchihaSign6
		icon = 'Scenary.dmi'
		icon_state="Uchihasign6"
		layer=MOB_LAYER+4
	ChuuninRailing
		icon = 'Scenary.dmi'
		density=1
		layer=MOB_LAYER+1
		opacity=1
		Railing1
			icon_state="1"
		Railing2
			icon_state="2"
		Railing3
			icon_state="3"
		Railing7
			icon_state="7"
		Railing10
			icon_state="10"
	Railings
		icon = 'Scenary.dmi'
		density=1
		layer=MOB_LAYER+1
		Railing1
			icon_state="1"
	//		opacity=1
		Railing2
			icon_state="2"
		//	opacity=1
		Railing3
			icon_state="3"
		Railing4
			icon_state="4"
		Railing5
			icon_state="5"
		Railing6
			icon_state="6"
		Railing7
			icon_state="7"
		Railing8
			icon_state="8"
		Railing9
			icon_state="9"
		Railing10
			icon_state="10"
		//	opacity=1
		Railing11
			icon_state="11"
		//	opacity=1.
		Railing12
			icon_state="12"
		//	opacity=1
		Railing13
			icon_state="13"
		//	opacity=1

	Statue
		Hunterstatue
			icon = 'Doug.dmi'
			Top
				layer = MOB_LAYER+1
				icon_state = "HunterStatue"
				density = 1

		Doug
			icon = 'Doug.dmi'
			Top
				layer = MOB_LAYER+1
				icon_state = "top"
			Bottom
				layer = MOB_LAYER+1
				icon_state = "bottom"
				density = 1
				DblClick()
					var/usetext = {"
				<html>
				<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
				<head>
				<BODY>
				<title>Doug</title>
				</head>
				<body bgcolor=#000000 text=#f5f5f5>
				<center><h2>Amekage<br></h2>
				<p>
				<b><center><h2>Biography</h2>
				<br>
				Doug the Great was the once great Amekage of the former Rain Village. Without his superior strength and cunning wit, Rain would've surely fallen before it was given to the new leader of Rain.
				It is unknown where Doug went, but many of the villages hope for his return. When Doug returned, he became a worthy power to the Rain Village as the new Rain formed.

				<p>
				<br>
				</body>
				</html>
				"}
					usr << browse(usetext)
		Phoenix
			icon = 'Phoenix.dmi'
			Top
				layer = FLY_LAYER+1
				icon_state = "top"
			Bottom
				layer = MOB_LAYER+1
				icon_state = "bottom"
				density = 1
				DblClick()
					var/usetext = {"
				<html>
				<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
				<head>
				<BODY>
				<title>Ketsueki, Phoenix</title>
				</head>
				<body bgcolor=#000000 text=#f5f5f5>
				<center><h2>Amekoutei<br></h2>
				<p>
				<b><center><h2>Biography</h2>
				<br>
				Phoenix of the Ketsueki Clan was the first known Amekoutei of the Hidden Rain Village that led his village through the war and saved it in its time of need. Phoenix was also the one who single-handedly brought the Ketsueki Clan, along with Kinomi, into Rain Village and destroyed racism towards that clan.
				He led the Rain Village into victory, becoming their "Ever Eternal Leader."

				<p>
				<br>
				</body>
				</html>
				"}
					usr << browse(usetext)
	Symbols
		summoneffect1
			icon='summoningeffect.dmi'
			dir=NORTH
			density=0
		summoneffect2
			icon='summoningeffect.dmi'
			dir=EAST
			density=0
		summoneffect3
			icon='summoningeffect.dmi'
			dir=SOUTH
			density=0
		summoneffect4
			icon='summoningeffect.dmi'
			dir=WEST
			density=0
		summoncircle
			icon='summoncircle.dmi'
			icon_state=""
			layer=TURF_LAYER+1
			density=0
	layer=TURF_LAYER+1
turf/Buildings/CityTiles
	Tiles1
		icon='Map/Turfs/Landscapes.dmi'
		icon_state="Tiles"
		layer=1
	//	Entered(mob/M)
	//		if(ismob(M))
	//			if(prob(50))
			//		var/counta=10;var/countb=1;var/list/L = list()
			//		while(countb<10)
			//			var/list/S = range(countb)
			//			for(var/mob/X in L)
			//				S-=X
			//			S<<sound('SFX/Step.wav',0,0,0,counta)
			//			for(var/mob/X in S)
			//				L+=X
			//			countb++;counta-=10
	Tiles2
		icon='Map/Turfs/Landscapes.dmi'
		icon_state="Tiles2"
		layer=1
	//	Entered(mob/M)
	//		if(ismob(M))
	//			if(prob(50))
			//		var/counta=10;var/countb=1;var/list/L = list()
			//		while(countb<10)
			//			var/list/S = range(countb)
			//			for(var/mob/X in L)
			//				S-=X
			//			S<<sound('SFX/Step.wav',0,0,0,counta)
			//			for(var/mob/X in S)
			//				L+=X
			//			countb++;counta-=10
turf/Buildings/Furnature
	icon = 'Housestuffz.dmi'
	Throne
		icon_state = "throne"
		density=0
	Bed
		House1
			name="Bed"
			icon_state="1"
			layer=3
			density=0
			Enter(A)
				if(ismob(A))
					var/mob/M=A
					if(usr.GateIn!=""||usr.Pill!="")
						usr<<"You're body is under too much strain to rest right now!"
						return 0
					if(!M.client)
						return
					if(M.Clone)
						M.Death(M)
						del(M)
					M.dir=SOUTH
					usr<<"You lay down and relax."
				//	usr.FrozenBind="Resting"
				//	spawn(40)
				//		usr.FrozenBind=""
					M.Running=0
					M.loc=src
					spawn(40)
						while(usr.client&&M.loc==src)
						//	usr.resting=1
							if(((src.z==12)||(src.z==29&&src.x>52&&src.x<77)))
								//if(LeafBedsWorking==1)

								if(usr.health<usr.maxhealth)
									usr.health+=(usr.maxhealth/45)//LeafBedRate
								if(usr.stamina<usr.maxstamina)
									usr.stamina+=(usr.maxstamina/90)//LeafBedRate
								if(usr.ChakraPool<usr.MaxChakraPool)
									usr.ChakraPool+=(usr.MaxChakraPool/210)//LeafBedRate

								//else
								//	usr<<"This bed is too worn out. It needs to be repaired..."
							else if(src.z==29&&src.y<=66&&src.y>=73)

								if(usr.health<usr.maxhealth)
									usr.health+=(usr.maxhealth/45)//RainBedRate
								if(usr.stamina<usr.maxstamina)
									usr.stamina+=(usr.maxstamina/90)//RainBedRate
								if(usr.ChakraPool<usr.MaxChakraPool)
									usr.ChakraPool+=(usr.MaxChakraPool/210)//RainBedRate


							else if(src.z==29&&src.x>=90&&src.x<=107)

								if(usr.health<usr.maxhealth)
									usr.health+=(usr.maxhealth/45)//RockBedRate
								if(usr.stamina<usr.maxstamina)
									usr.stamina+=(usr.maxstamina/90)//RockBedRate
								if(usr.ChakraPool<usr.MaxChakraPool)
									usr.ChakraPool+=(usr.MaxChakraPool/210)//RockBedRate

							else if(src.z==21&&src.x>=99&&src.x<=108)

								if(usr.health<usr.maxhealth)
									usr.health+=(usr.maxhealth/45)//SoundBedRate
								if(usr.stamina<usr.maxstamina)
									usr.stamina+=(usr.maxstamina/90)//SoundBedRate
								if(usr.ChakraPool<usr.MaxChakraPool)
									usr.ChakraPool+=(usr.MaxChakraPool/210)//SoundBedRate


							else
								if(usr.health<usr.maxhealth)
									usr.health+=(usr.maxhealth/45)
								if(usr.stamina<usr.maxstamina)
									usr.stamina+=(usr.maxstamina/90)
								if(usr.ChakraPool<usr.MaxChakraPool)
									usr.ChakraPool+=(usr.MaxChakraPool/210)

							sleep(15)
				//	usr.resting=0

			BedCovers
				name="Bed Covers"
				icon_state="1Cover"
				layer=MOB_LAYER+1
				density=0
	Chairs
		House14
			icon_state = "14"
		House15
			icon_state = "15"
		House16
			icon_state = "16"
		House17
			icon_state = "17"
			layer=MOB_LAYER+1
		House18
			icon_state = "18"
		verb/Rest()
			if(usr.Mogu)
				return
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
				usr<<"You sit and relax."
				usr.Frozen=1
				while(usr.resting)
					if(usr.health<usr.maxhealth)
						usr.health+=(usr.maxhealth/100)
					if(usr.stamina<usr.maxstamina)
						usr.stamina+=(usr.maxstamina/65)
					if(usr.ChakraPool<usr.MaxChakraPool)
						usr.ChakraPool+=(usr.MaxChakraPool/170)
					if(usr.blood<101&&prob(10))
						usr.blood++
					sleep(11)
				usr<<"You're fully relaxed."
				usr.resting=0
				usr.Frozen=0
				return

	BookCase
		Bookcase1
			icon_state="BookCase1"
		Bookcase2
			icon_state="BookCase2"
			layer=MOB_LAYER+1
		Bookcase3
			icon_state="BookCase3"
			layer=MOB_LAYER+1
		Bookcase4
			icon_state="BookCase4"
		Bookcase5
			icon_state="BookCase5"
			layer=MOB_LAYER+1
		Bookcase6
			icon_state="BookCase6"
			layer=MOB_LAYER+1
		Books1
			icon_state="book1"
			layer=MOB_LAYER+1
		Books4
			icon_state="book4"
			layer=MOB_LAYER+1
		Books2
			icon_state="book2"
			layer=MOB_LAYER+1
		Books3
			icon_state="book3"
			layer=MOB_LAYER+1
	Appliances
		Oven
			icon_state = "Oven"
			density = 1
	House2
		icon_state = "2"
		density = 1
	House7
		icon_state = "7"
		density = 1
	Shelf1
		icon_state="30"
		density = 1
	Shelf2
		icon_state="31"
		density = 1
	Shelf3
		icon_state="32"
	Shelf4
		icon_state="33"
	Shelf5
		layer=MOB_LAYER+1
		icon_state="34"
	Shelf6
		layer=MOB_LAYER+1
		icon_state="35"
	Shelf7
		layer=MOB_LAYER+1
		icon_state="36"
	Shelf8
		icon_state="37"
		density = 1
	Chart1
		icon_state="chart1"
		icon='Chart.dmi'
		density = 1
	Chart1
		icon_state="chart2"
		icon='Chart.dmi'
		density = 1
turf/Buildings/ShopStuff
	icon = 'Scenary.dmi'
	ScrollsObj
		icon_state="scrolls"
		density=1
	TunicObj
		icon_state="Tunic"
		density=1
	Jar
		icon_state="jar"
		density=1
	ShurikenThing
		icon_state="Shuriken for sell"
		density=1
	KunaiThing
		icon_state="kunai for sell"
		density=1
	BigShurikenThing
		icon_state="big shuriken for sell 1"
		density=1
	BigShurikenThing2
		icon_state="big shuriken for sell 2"
		density=1
	SwordShelf1
		icon_state="swordshelf1"
		density=1
	SwordShelf2
		icon_state="swordshelf2"
		density=1
	SwordShelf3
		icon_state="swordshelf3"
		layer=MOB_LAYER+1
	SwordShelf4
		icon_state="swordshelf4"
		layer=MOB_LAYER+1
	ArrowRacks1
		icon_state="arrow racks 1"
		density=1
	ArrowRacks2
		icon_state="arrow racks 2"
turf/Buildings/Teleporters
	ToLeafHospital
		density=1
	//	M<<"Sorry, there are no established visiting hours at this time."
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(64,173,29)
			else if(isobj(A))
				return
			else
				..()
	OutOfLeafHospital
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(43,89,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(43,89,11)
	ToCastle1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(70,96,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(70,96,34)
			else
				..()
	ToCastle2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(128,96,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(128,96,34)
	FromCastle1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(71,189,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(71,189,14)
			else
				..()
	FromCastle2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(87,189,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(87,189,14)
	TerraIntoCave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(pick(54,55),67,34)

	TerraOutCave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(pick(29,30,31),164,19)



turf/SoundPortals/S1
	To5v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(5,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(5,93,21)
			else
				..()
	Out100v150
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(100,150,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(100,150,4)
			else

				..()
turf/SoundPortals/S2
	To14v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(14,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(14,93,21)
			else
				..()
	Out105v151
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(105,151,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(105,151,4)
			else

				..()
turf/SoundPortals/S3
	To23v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(23,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(23,93,21)
			else
				..()
	Out110v150
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(110,150,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(110,150,4)
			else

				..()
turf/SoundPortals/S4
	To32v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(32,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(32,93,21)
			else
				..()
	Out119v151
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(119,151,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(119,151,4)
			else

				..()
turf/SoundPortals/S5
	To41v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(41,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(41,93,21)
			else
				..()
	Out129v150
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(129,150,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(129,150,4)
			else

				..()
turf/SoundPortals/S6
	To59v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(59,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(59,93,21)
			else
				..()
	Out161v152
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(161,152,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(161,152,4)
			else

				..()
turf/SoundPortals/S7
	To69v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(69,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(69,93,21)
			else
				..()
	Out148v136
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(148,136,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(148,136,4)
			else

				..()
turf/SoundPortals/S8
	To79v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(79,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(79,93,21)
			else
				..()
	Out133v137
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(133,137,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(133,137,4)
			else

				..()
turf/SoundPortals/S9
	To89v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(89,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(89,93,21)
			else
				..()
	Out108v138
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(108,138,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(108,138,4)
			else

				..()
turf/SoundPortals/S10
	To99v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(99,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(99,93,21)
			else
				..()
	Out103v139
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(103,139,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(103,139,4)
			else

				..()
turf/SoundPortals/S11
	To50v93
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(50,93,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(50,93,21)
			else
				..()
	Out153v152
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(153,152,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(153,152,4)
			else

				..()
turf/SoundPortals/SKageHouse
	To168v20
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(168,20,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(168,20,21)
			else
				..()
	Out128v102
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(128,102,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(128,102,4)
			else

				..()
turf/SoundPortals/SUchihaHouse
	To46v45
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(46,45,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(46,45,21)
			else
				..()
	Out56v96
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(56,96,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(56,96,4)
			else

				..()
turf/SoundPortals/B1
	To107v3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(107,3,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(107,3,21)
			else
				..()
	Out51v76
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(51,76,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(51,76,4)
			else

				..()
turf/SoundPortals/B2
	To120v36
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(120,36,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(120,36,21)
			else
				..()
	Out79v100
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(79,100,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(79,100,4)
			else

				..()
turf/SoundPortals/B3
	To98v41
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(98,41,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(98,41,21)
			else
				..()
	Out114v75
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(114,75,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(114,75,4)
			else

				..()
turf/SoundPortals/B4
	To100v16
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(100,16,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(100,16,21)
			else
				..()
	Out138v75
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(138,75,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(138,75,4)
			else

				..()
turf/SoundPortals/B5
	To81v3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(81,3,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(81,3,21)
			else
				..()
	Out82v87
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(82,87,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(82,87,4)
			else

				..()
turf/SoundPortals/B6
	To110v67
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(110,67,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(110,67,21)
			else
				..()
	Out161v72
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(161,72,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(161,72,4)
			else

				..()
turf/SoundPortals/B7
	To112v82
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(122,82,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(122,82,21)
			else
				..()
	Out75v76
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(75,76,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(75,76,4)
			else

				..()
turf/SoundPortals/U1
	To68v71
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(68,71,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(68,71,21)
			else
				..()
	Out93v150
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(93,150,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(93,150,4)
			else

				..()
turf/SoundPortals/U2
	To98v67
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(98,67,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(98,67,21)
			else
				..()
	Out94v138
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(94,138,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(94,138,4)
			else

				..()
turf/SoundPortals/U3
	To98v41
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(89,112,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(89,112,21)
			else
				..()
	Out122v139
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(122,139,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(122,139,4)
			else

				..()
turf/SoundPortals/U4
	To102v112
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(102,112,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(102,112,21)
			else
				..()
	Out140v138
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(140,138,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(140,138,4)
			else

				..()
turf/SoundPortals/U5
	To6v77
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(6,77,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(6,77,21)
			else
				..()
	Out107v135
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(107,135,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(107,135,4)
			else

				..()
turf/SoundPortals/C1
	To57v14
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(57,14,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(57,14,33)
			else
				..()
	Out72v155
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(72,155,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(72,155,4)
			else

				..()
turf/SoundPortals/C2
	To4v31
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(4,131,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(4,131,21)
			else
				..()
	Out30v109
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(30,109,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(30,109,4)
			else

				..()
turf/SoundPortals/C3
	To28v139
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(28,129,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(28,129,21)
			else
				..()
	Out47v117
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(47,117,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(47,117,4)
			else

				..()
turf/SoundPortals/C4
	To6v190
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.dir=SOUTH
				M.loc=locate(6,190,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(6,190,21)
			else
				..()
	Out35v145
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.dir=SOUTH
				M.loc=locate(35,145,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(35,145,4)
			else

				..()
turf/SoundPortals/C6
	To67v138
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(67,138,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(67,138,33)
			else
				..()
	Out
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(48,137,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(48,137,4)
			else

				..()
turf/SoundPortals/C7
	To84v185
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(84,185,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(84,185,33)
			else
				..()
	Out66v145
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(66,145,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(66,145,4)
			else

				..()
turf/SoundPortals/C8
	To51v118
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(51,118,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(51,118,21)
			else
				..()
	Out96v37
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(96,37,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(96,37,4)
			else

				..()
turf/SoundPortals/C9
	To74v168
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(74,168,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(74,168,21)
			else
				..()
	Out156v116
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(156,116,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(156,116,4)
			else

				..()
turf/SoundPortals/C10
	To42v182
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(41,183,21)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(41,183,21)
			else
				..()
	Out75v111
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(75,111,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(75,111,4)
			else

				..()
turf/SoundPortals/SO
	To159v94
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(159,94,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(159,94,33)
			else
				..()
	Out118v26
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(18,126,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(18,126,33)
			else

				..()
turf/RainPortals/strip
	Tostrip
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(154,87,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(154,87,29)
			else
				..()
	Outstrip
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(49,86,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(49,86,6)
			else

				..()
turf/RainPortals/ranb
	ToRandB
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(128,181,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(128,181,29)
			else
				..()
	OutRandB
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(48,77,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(48,77,6)
			else

				..()
turf/RainPortals/randb1
	Tob1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(149,133,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(149,133,29)
			else
				..()
	Outb1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(61,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(61,102,6)
			else

				..()
turf/RainPortals/randb2
	Tob2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(165,37,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(165,37,29)
			else
				..()
	Outb2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(55,86,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(55,86,6)
			else

				..()
turf/RainPortals/randb3
	Tob3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(171,69,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(171,69,29)
			else
				..()
	Outb3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(55,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(55,102,6)
			else

				..()
turf/RainPortals/randb4
	Tob4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(164,54,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(164,54,29)
			else
				..()
	Outb4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(49,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(49,102,6)
			else

				..()
turf/RainPortals/randb5
	Tob5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(91,41,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(91,41,29)
			else
				..()
	Outb5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(78,90,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(78,90,6)
			else

				..()
turf/RainPortals/randb6
	Tob6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(173,164,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(173,164,29)
			else
				..()
	Outb6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(74,91,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(74,91,6)
			else

				..()
turf/RainPortals/randb7
	Tob7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(176,54,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(176,54,29)
			else
				..()
	Outb7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(70,91,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(70,91,6)
			else

				..()
turf/RainPortals/randb8
	Tob8
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(117,69,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(117,69,29)
			else
				..()
	Outb8
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(61,86,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(61,86,6)
			else

				..()
turf/RainPortals/randb9
	Tob9
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(180,69,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(180,69,29)
			else
				..()
	Outb9
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(56,77,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(56,77,6)
			else

				..()
turf/RainPortals/randb10
	Tob10
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(128,69,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(128,69,29)
			else
				..()
	Outb10
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(52,77,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(52,77,6)
			else

				..()
turf/RainPortals/randr1
	Tor1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(139,181,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(139,181,29)
			else
				..()
	Outr1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(87,91,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(87,91,6)
			else

				..()
turf/RainPortals/randr2
	Tor2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(139,39,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(139,39,29)
			else
				..()
	Outr2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(94,91,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(94,91,6)
			else

				..()
turf/RainPortals/randr3
	Tor3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(161,106,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(161,106,29)
			else
				..()
	Outr3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(103,81,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(103,81,6)
			else

				..()
turf/RainPortals/randr4
	Tor4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(179,36,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(179,36,29)
			else
				..()
	Outr4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(109,77,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(109,77,6)
			else

				..()
turf/RainPortals/randr5
	Tor5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(134,10,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(134,10,29)
			else
				..()
	Outr5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(117,77,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(117,77,6)
			else

				..()
turf/RainPortals/randr6
	Tor6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(160,180,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(160,180,29)
			else
				..()
	Outr6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(101,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(101,102,6)
			else

				..()
turf/RainPortals/randr7
	Tor7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(121,36,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(121,36,29)
			else
				..()
	Outr7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(106,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(106,102,6)
			else

				..()
turf/RainPortals/randr8
	Tor8
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(151,71,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(151,71,29)
			else
				..()
	Outr8
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(110,104,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(110,104,6)
			else

				..()
turf/RainPortals/randr9
	Tor9
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(128,54,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(128,54,29)
			else
				..()
	Outr9
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(115,103,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(115,103,6)
			else

				..()
turf/RainPortals/randr10
	Tor10
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(149,107,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(149,107,29)
			else
				..()
	Outr10
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(90,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(90,102,6)
			else

				..()
turf/RainPortals/randl1
	Tol1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(185,133,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(185,133,29)
			else
				..()
	Outl1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(49,153,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(49,153,6)
			else

				..()
turf/RainPortals/randl2
	Tol2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(159,14,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(159,14,29)
			else
				..()
	Outl2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(55,153,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(55,153,6)
			else
turf/RainPortals/randl3
	Tol3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(188,69,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(188,69,29)
			else
				..()
	Outl3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(62,153,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(62,153,6)
			else

				..()
turf/RainPortals/randl4
	Tol4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(140,54,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(140,54,29)
			else
				..()
	Outl4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(67,153,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(67,153,6)
			else

				..()
turf/RainPortals/randl5
	Tol5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(105,25,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(105,25,29)
			else
				..()
	Outl5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(74,153,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(74,153,6)
			else

				..()
turf/RainPortals/randl6
	Tol6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(160,164,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(160,164,29)
			else
				..()
	Outl6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(80,153,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(80,153,6)
			else

				..()
turf/RainPortals/randl7
	Tol7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(174,106,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(174,106,29)
			else
				..()
	Outl7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(107,154,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(107,154,6)
			else

				..()
turf/RainPortals/randm1
	Tom1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(149,133,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(149,133,29)
			else
				..()
	Outm1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(61,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(61,102,6)
			else

				..()
turf/RainPortals/randm4
	Tom1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(188,4,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(188,4,29)
			else
				..()
	Outm4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(73,118,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(73,118,6)
			else

				..()
turf/RainPortals/randm1
	Tom1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(185,106,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(185,106,29)
			else
				..()
	Outm1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(95,118,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(95,118,6)
			else

				..()
turf/RainPortals/randm2
	Tom2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(152,54,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(152,54,29)
			else
				..()
	Outm2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(88,118,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(88,118,6)
			else

				..()
turf/RainPortals/randm3
	Tom3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(106,41,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(106,41,29)
			else
				..()
	Outm3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(82,118,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(82,118,6)
			else

				..()
turf/RainPortals/randm5
	Tom5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(115,54,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(115,54,29)
			else
				..()
	Outm5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(67,129,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(67,129,6)
			else

				..()
turf/RainPortals/randm6
	Tom6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(152,37,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(152,37,29)
			else
				..()
	Outm6
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(73,129,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(73,129,6)
			else

				..()
turf/RainPortals/randm7
	Tom7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(161,133,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(161,133,29)
			else
				..()
	Outm7
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(79,129,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(79,129,6)
			else

				..()
turf/RainPortals/randm8
	Tom8
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(173,133,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(173,133,29)
			else
				..()
	Outm8
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(88,129,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(88,129,6)
			else

				..()
turf/RainPortals/randm9
	Tom9
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(139,165,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(139,165,29)
			else
				..()
	Outm9
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(69,141,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(69,141,6)
			else

				..()
turf/RainPortals/randm10
	Tom10
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(182,22,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(182,22,29)
			else
				..()
	Outm10
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(75,141,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(75,141,6)
			else

				..()
turf/RainPortals/randm11
	Tom11
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(186,180,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(186,180,29)
			else
				..()
	Outm11
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(82,141,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(82,141,6)
			else

				..()
turf/RainPortals/Church
	Tomch
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(177,83,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(177,83,29)
			else
				..()
	Outmch
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(52,137,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(52,137,6)
			else

				..()
turf/RainPortals/rkage
	Tokage
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(107,87,29)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(107,87,29)
			else
				..()
	Outkage
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(93,145,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(93,145,6)
			else

				..()
turf/RainPortals/rHosp
	Tohosp
		density=1
	//	M<<"Sorry, there are no established visiting hours at this time."
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(97,54,29)
			else if(isobj(A))
				return
			else
				..()
	Outhosp
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(76,102,6)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(76,102,6)
			else

				..()

turf/ShopPortals/Bankerbuilding
	ToBankerBuilding
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(39,124,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(39,124,11)
			else
				..()
	OutBankBuilding
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(113,5,30)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(113,5,30)
			else

				..()
turf/ShopPortals/Weapons
	ToWeaponshop
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(47,126,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(47,126,11)
			else
				..()
	OutWeaponshop
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(113,16,30)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(113,16,30)
			else

				..()
turf/ShopPortals/HyuugaHouse
	ToHyuugahouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(129,101,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(129,101,11)
			else
				..()
	OutHyuugahouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(167,124,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(164,124,1)
			else

				..()
turf/ShopPortals/Narahouse
	Tonarahouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(130,151,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(130,151,11)
			else
				..()
	OutNaraHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(124,154,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(124,154,1)
			else

				..()
turf/ShopPortals/Barber
	ToBarber
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(91,98,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(91,98,11)
			else
				..()
	OutBarber
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(62,184,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(162,184,1)
			else

				..()
turf/ShopPortals/RandomBuilding
	ToRandomBuilding
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(82,98,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(82,98,11)
			else
				..()
	OutRandomBuilding
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(99,148,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(99,148,1)
			else

				..()
turf/ShopPortals/Dojo
	ToDojo
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(39,39,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(39,39,11)
			else
				..()
	Outdojo
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(130,126,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(130,126,1)
			else

				..()
turf/Dojos/LeafDojo
	ToLeafDojo
		density=0
		Enter(A)
			if(ismob(A))
		//		var/mob/M = A
				return
		/*		var/BreakingIn=0
				var/BreakingInTimer=0
				var/mob/M = A
				var/Location=0
				var/AlertVillage=0
				var/Invader=""
			//	if((M.TaijutsuKnowledge+M.GenjutsuKnowledge+M.NinjutsuKnowledge<1600||M.rank=="Hokage"||M.key=="CobraT1337")&&(M.rank=="Genin"||M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Hokage")&&M.Village=="Leaf")
				if(((M.rank=="Genin"&&M.Village=="Leaf")||M.rank=="Hokage"||M.key=="CobraT1337")||LeafOnlyGeninDojo==0)
					if(LeafOnlyGeninDojo==0)
						M<<"You're able to enter because the Hokage has allowed it!"
					M.InDojo=1
					M.loc=locate(135,11,35)
				else if((M.rank=="S.Jounin"||M.rank=="Jounin"||M.rank=="Sage"||M.Village=="Missing")&&M.Village!="Leaf")
					M<<"You attempt to break down the large protective door for the Leaf Dojo!"
					BreakingIn=1
					Location=M.loc
					while(BreakingIn==1&&!M.knockedout&&(Location==M.loc))
						flick("Attack2",src)
						BreakingInTimer++
						sleep(10)
						if(Location!=M.loc)
							M<<"You moved and thus stopped trying to break down the Door!"
							BreakingInTimer=0
							AlertVillage=0
						//	BreakingIn=0
							Location=0
							return
						if(BreakingInTimer>=30)
							M<<"You've sucessfully broken into the Leaf Dojo!"
							Invader=M
							M.loc=locate(135,11,35)
							BreakingInTimer=0
							AlertVillage=1
							BreakingIn=0
							Location=0
						if(M.knockedout)
							M<<"You have failed to break into the Leaf Dojo!"
							Location=0
							BreakingInTimer=0
							BreakingIn=0
						//	return
				if(AlertVillage)
					for(var/mob/C in world)
						if(C.Village=="Leaf"&&C&&C.client)
							C << "<font color = #BB0EDA>Village Information:</font> [Invader] has infiltrated the Dojo!"
							Invader=""
							return
				else
					M<<"You're too experienced to need to come here..."
			else if(isobj(A))
				var/obj/B=A
				del(B)
		//		var/obj/B=A
		//
	//			B.loc=locate(39,39,11)
			else

				..()
				*/
	OutLeafDojo
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				switch(input(M,"Are you sure you would like to leave the Dojo? NOTE: If you leave you can never return to this Dojo, this is the only safe zone, and people can kill you at any time outside!", "Leave the Safe Zone?") in list ("Yes","No"))
					if("Yes")
						M<<"You leave the Dojo.... Your life as a Ninja begins..."
						if(M.Clan=="Aburame")
							M.loc=locate(130,183,1)
						else if(M.Clan=="Akimichi")
							M.loc=locate(104,183,1)
							M.dir=NORTH
						else if(M.Clan=="Fuuma")
							M.loc=locate(137,25,29)
						else if(M.Clan=="Hoshigaki")
							M.loc=locate(174,9,29)
						else if(M.Clan=="Hyuuga")
							M.loc=locate(151,131,1)
						else if(M.Clan=="Nara")
							M.loc=locate(123,159,1)
						else if(M.Clan=="Kusakin")
							M.loc=locate(156,150,1)
						else if(M.Clan=="Uchiha")
							M.loc=locate(46,51,21)
						else if(M.Clan=="Kumojin")
							M.loc=locate(121,38,21)
						else if(M.Clan=="Kaguya")
							M.loc=locate(98,43,21)
						else
							if(M.Village=="Leaf")
								M.loc=locate(122,130,1)
							if(M.Village=="Rain")
								M.loc=locate(88,114,29)
							if(M.Village=="Sound")
								M.loc=locate(160,60,21)
							if(M.Village=="Rock")
								M.loc=locate(161,35,34)
					else
						return
			else
				..()

turf/ShopPortals/ScrollBuilding
	ToScrollSeller1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(55,123,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(55,123,11)
			else
				..()
	OutScrollseller1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(144,38,30)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(144,38,30)
			else

				..()

	ToScrollSeller2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(79,123,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(79,123,11)
			else
				..()
	OutScrollseller2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(149,53,30)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(149,53,30)
			else

				..()
	ToScrollSeller3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(94,131,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(94,131,11)
			else
				..()
	OutScrollseller3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(161,47,30)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(161,47,30)
			else

				..()
turf/ShopPortals/KageHouse
	ToKagehouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(67,142,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(68,142,11)
			else
				..()
	Outkagehouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(156,145,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(156,145,1)
			else

				..()




turf/ShopPortals/ClansNovosKonoha
	ToKiroHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(5,2,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(5,2,41)
			else
				..()
	OutKiroHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(164,81,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(164,81,11)
			else

				..()



	ToIwazukaHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(32,11,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(32,11,41)
			else
				..()
	OutIwazukaHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(20,31,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(20,31,11)
			else

				..()

	ToSabakuHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(49,12,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(32,2,41)
			else
				..()
	OutSabakuHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(64,95,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(64,95,11)
			else

				..()


turf/ShopPortals/ClansNovosSom
	ToKetsuekiHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(66,23,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(5,2,41)
			else
				..()
	OutKetsuekiHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(162,148,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(162,148,4)
			else

				..()


	ToFummaHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(82,23,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(82,23,41)
			else
				..()
	OutFummaHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(122,128,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(122,128,4)
			else

				..()



	ToShiroiHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(96,23,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(96,23,41)
			else
				..()
	OutShiroiHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(68,130,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(68,130,4)
			else

				..()

	ToKyomouHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(110,23,41)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(110,23,41)
			else
				..()
	OutKyomouHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(46,55,4)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(46,55,4)
			else

				..()





turf/ShopPortals/Aburamehouse
	ToKagehouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(20,150,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(20,150,11)
			else
				..()
	OutAburamehouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(129,178,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(129,178,1)
			else

				..()
turf/ShopPortals/Akimichihouse
	ToAkimichiHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(131,130,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(131,130,11)
			else
				..()
	OutAkimichiHouse
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(110,177,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(110,177,1)
			else

				..()
turf/ShopPortals/RandomHouse1
	ToRandomhouse1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(17,44,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(17,44,11)
			else
				..()
	OutRandomHouse1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(61,173,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(61,173,1)
			else

				..()
turf/ShopPortals/RandomHouse2
	ToKagehouse2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(70,50,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(70,50,11)
			else
				..()
	OutRandomHouse2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(73,176,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(73,176,1)
			else

				..()

turf/ShopPortals/RandomHouse3
	ToRandomhouse3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(65,62,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(65,62,11)
			else
				..()
	OutRandomHouse3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(87,166,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(87,166,1)
			else

				..()
turf/ShopPortals/RandomHouse4
	ToRandomHouse4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(66,71,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(66,71,11)
			else
				..()
	OutRandomHouse4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(86,176,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(86,176,1)
			else

				..()
turf/ShopPortals/Tailor
	ToCLothingSales
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(32,122,11)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(32,122,11)
			else
				..()
	OutClothingSales
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(128,59,30)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(128,59,30)
			else

				..()
turf/LandscapeStuff
	lava
		icon = 'lava.dmi'
		//density=1
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.Bijuu=="Yonbi")
					return ..()
				M.deathcount+=rand(1,2)
				M.DamageProc(800,"Health",M);M.DamageProc(800,"Health",M)
				if(prob(10))
					M.DamageProc(800,"Health",M)
				return
			else
				if(istype(A,/obj/))
					if(istype(A,/obj/Jutsu/Elemental/Doton/BigDoton))
						..()
					else
						del(A)
			..()
	fakelava
		var/NoBolero=1
		icon = 'lava.dmi'
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(NoBolero==1)
					M.deathcount+=rand(1,2)
					M.DamageProc(800,"Health",M);M.DamageProc(800,"Health",M)
					if(prob(10))
						M.DamageProc(800,"Health",M)
					return
				else
					return ..()
			..()

	lavawaterfall
		icon = 'lava.dmi'
		icon_state="Waterfall"
		layer = MOB_LAYER+1
		density=0

area
	LavaSound
		Entered(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					src<<sound('LavaFlow.wav',1,0,8,100)
		Exited(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					src<<sound(1,0,8)
	WaterFallSound
		Entered(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					M<<sound('Waterfall2.wav',1,0,8,80)
		Exited(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					M<<sound(1,0,0,8)
	WaterFallLightSound
		Entered(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					M<<sound('waterfall.wav',1,0,8,65)
		Exited(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					M<<sound(1,0,0,8)
	NearBeach
		Entered(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					M<<sound('Beach.wav',1,0,8,65)
		Exited(A)
			if(ismob(A))
				var/mob/M=A
				if(M.client)
					M<<sound(1,0,0,8)

	//	Exit(A)
	//		if(ismob(A))
	//			var/mob/M=A
	//			if(M.client)
	//				M<<sound(null,0,0,8)
	//		..()



obj/HUD
	Fade
		layer=9001
		icon='Fade.dmi'
		screen_loc="SOUTHWEST to NORTHEAST"//extends from the very bottom left corner of your screen, to the top right

mob/proc/UnFadeScreen()
	if(client)
		for(var/obj/HUD/Fade/f in src.client.screen)
			client.screen-=f
	.=..()

mob/proc/FadeScreenSlow()
	var/obj/HUD/Fade/f = new //creates HUD
	if(client)
		client.screen+=f
		f.icon_state="out"
		sleep(20)
		flick("in",f)
		spawn(11)
			f.icon_state=""
			sleep(2)
			client.screen-=f
	.=..()
mob/proc/FadeScreen()
	var/obj/HUD/Fade/f = new //creates HUD
	if(client)
		client.screen+=f
		f.icon_state="out fast"
		sleep(7)
		flick("in fast",f)
		spawn(6)
			f.icon_state=""
			sleep(2)
			client.screen-=f
	.=..()
////////////////////////////////////////////////////////////////////////////////////////////////////
turf/Teleporters
	Enter(A)
		if(ismob(A))
			var/mob/M=A
			M.FadeScreen()
		..()
	SoundVillage
		EnterOtokamiHouse20
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(20,71,29)
				else
					if(isobj(A)) del(A)
		EnterOtokamiHouse21
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(21,71,29)
				else
					if(isobj(A)) del(A)

		ExitOtokamiHouse099
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(99,22,5)
				else
					if(isobj(A)) del(A)
		ExitOtokamiHouse100
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(100,22,5)
				else
					if(isobj(A)) del(A)


		EnterOtokamiUpstairs050
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(50,68,29)
				else
					if(isobj(A)) del(A)
		EnterOtokamiUpstairs051
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(51,68,29)
				else
					if(isobj(A)) del(A)
		ExitOtokamiUpstairs027
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(27,95,29)
				else
					if(isobj(A)) del(A)
		ExitOtokamiUpstairs028
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(28,95,29)
				else
					if(isobj(A)) del(A)
	TeaVillage
		BankEnter
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(84,2,29)
				else
					if(isobj(A)) del(A)
		BankExit
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(145,55,2)
				else
					if(isobj(A)) del(A)
		BarberEnter
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(72,2,29)
				else
					if(isobj(A)) del(A)
		BarberExit
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(151,48,2)
				else
					if(isobj(A)) del(A)
		GekkoScrollsmanEnter
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(102,2,29)
				else
					if(isobj(A)) del(A)
		GekkoScrollsmanExit
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(142,48,2)
				else
					if(isobj(A)) del(A)
		NoBeardEnter
			density=0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(66,14,29)
				else
					if(isobj(A)) del(A)

	RockVillage
		EnterRockHospital98
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(98,156,29)
				else
					if(isobj(A)) del(A)
		EnterRockHospital99
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(99,156,29)
				else
					if(isobj(A)) del(A)
		ExitRockHospital64
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(90,35,14)
				else
					if(isobj(A)) del(A)
		ExitRockHospital65
			density = 0
			Enter(A)
				if(ismob(A))
					var/mob/M = A
					M.loc=locate(91,35,14)
				else
					if(isobj(A)) del(A)
	ToRockPlace
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(104,72,1)
					M<<"You enter a dark, misty place!"
			else
				if(isobj(A)) del(A)
	ToRockPlaceOut
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(17,192,14)
			else
				if(isobj(A)) del(A)
	ToMistHangOut
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(180,1,30)
			else
				if(isobj(A)) del(A)
	ToMistHangOutOut
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc=locate(153,185,16)
			else
				if(isobj(A)) del(A)
//Map2
	Map2
		ToMap02_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,2)
				else
					if(isobj(A)) del(A)
		ToMap02_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,2)
				else
					if(isobj(A)) del(A)
		ToMap02_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,2)
				else
					if(isobj(A)) del(A)
		ToMap02_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,2)
				else
					if(isobj(A)) del(A)
//Map3
	Map3
		ToMap03_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,3)
				else
					if(isobj(A)) del(A)
		ToMap03_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,3)
				else
					if(isobj(A)) del(A)
		ToMap03_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,3)
				else
					if(isobj(A)) del(A)
		ToMap03_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,3)
				else
					if(isobj(A)) del(A)
//Map4
	Map4
		ToMap04_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,4)
				else
					if(isobj(A)) del(A)
		ToMap04_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,4)
				else
					if(isobj(A)) del(A)
		ToMap04_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,4)
				else
					if(isobj(A)) del(A)
		ToMap04_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,4)
				else
					if(isobj(A)) del(A)
//Map5
	Map5
		ToMap05_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,5)
				else
					if(isobj(A)) del(A)
		ToMap05_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,5)
				else
					if(isobj(A)) del(A)
		ToMap05_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,5)
				else
					if(isobj(A)) del(A)
		ToMap05_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,5)
				else
					if(isobj(A)) del(A)

//Map6
	Map6
		ToMap06_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,6)
				else
					if(isobj(A)) del(A)
		ToMap06_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,6)
				else
					if(isobj(A)) del(A)
		ToMap06_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,6)
				else
					if(isobj(A)) del(A)
		ToMap06_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,6)
				else
					if(isobj(A)) del(A)
//Sand Village Map27
	Map27
		ToMap27_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M=A
					if(M.client)
						M.loc=locate(M.x,192,27)
				else
					if(isobj(A)) del(A)
//Map7
	Map7
		ToMap07_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,7)
				else
					if(isobj(A)) del(A)
		ToMap07_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,7)
				else
					if(isobj(A)) del(A)
		ToMap07_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,7)
				else
					if(isobj(A)) del(A)
		ToMap07_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,7)
				else
					if(isobj(A)) del(A)

//Map8
	Map8
		ToMap08_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,8)
				else
					if(isobj(A)) del(A)
		ToMap08_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,8)
				else
					if(isobj(A)) del(A)
		ToMap08_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,8)
				else
					if(isobj(A)) del(A)
		ToMap08_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,8)
				else
					if(isobj(A)) del(A)
//Map9
	Map9
		ToMap09_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,9)
				else
					if(isobj(A)) del(A)
		ToMap09_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,9)
				else
					if(isobj(A)) del(A)
		ToMap09_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,9)
				else
					if(isobj(A)) del(A)
		ToMap09_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,9)
				else
					if(isobj(A)) del(A)
//Map10
	Map10
		ToMap10_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,10)
				else
					if(isobj(A)) del(A)
		ToMap10_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,10)
				else
					if(isobj(A)) del(A)
		ToMap10_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,10)
				else
					if(isobj(A)) del(A)
		ToMap10_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,10)
				else
					if(isobj(A)) del(A)

//Map11
	Map11
		ToMap11_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,11)
				else
					if(isobj(A)) del(A)
		ToMap11_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,11)
				else
					if(isobj(A)) del(A)
		ToMap11_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,11)
				else
					if(isobj(A)) del(A)
		ToMap11_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,11)
				else
					if(isobj(A)) del(A)
//Map12
	Map12
		ToMap12_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,12)
				else
					if(isobj(A)) del(A)
		ToMap12_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,12)
				else
					if(isobj(A)) del(A)
		ToMap12_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,12)
				else
					if(isobj(A)) del(A)
		ToMap12_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,12)
				else
					if(isobj(A)) del(A)
//Map13
	Map13
		ToMap13_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,13)
				else
					if(isobj(A)) del(A)
		ToMap13_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,13)
				else
					if(isobj(A)) del(A)
		ToMap13_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,13)
				else
					if(isobj(A)) del(A)
		ToMap13_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,13)
				else
					if(isobj(A)) del(A)
//Map14
	Map14
		ToMap14_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,14)
				else
					if(isobj(A)) del(A)
		ToMap14_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,14)
				else
					if(isobj(A)) del(A)
		ToMap14_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,14)
				else
					if(isobj(A)) del(A)
		ToMap14_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,14)
				else
					if(isobj(A)) del(A)

//Map15
	Map15
		ToMap15_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,15)
				else
					if(isobj(A)) del(A)
		ToMap15_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,15)
				else
					if(isobj(A)) del(A)
		ToMap15_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,15)
				else
					if(isobj(A)) del(A)
		ToMap15_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,15)
				else
					if(isobj(A)) del(A)
//Map7
	Map16
		ToMap16_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,16)
				else
					if(isobj(A)) del(A)
		ToMap16_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,16)
				else
					if(isobj(A)) del(A)
		ToMap16_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,16)
				else
					if(isobj(A)) del(A)
		ToMap16_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,16)
				else
					if(isobj(A)) del(A)

//Map8
	Map17
		ToMap17_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,17)
				else
					if(isobj(A)) del(A)
		ToMap17_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,17)
				else
					if(isobj(A)) del(A)
		ToMap17_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,17)
				else
					if(isobj(A)) del(A)
		ToMap17_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,17)
				else
					if(isobj(A)) del(A)
//Map18
	Map18
		ToMap18_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,18)
				else
					if(isobj(A)) del(A)
		ToMap18_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,18)
				else
					if(isobj(A)) del(A)
		ToMap18_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,18)
				else
					if(isobj(A)) del(A)
		ToMap18_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,18)
				else
					if(isobj(A)) del(A)
//Map18
	Map19
		ToMap19_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,19)
				else
					if(isobj(A)) del(A)
		ToMap19_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,19)
				else
					if(isobj(A)) del(A)
		ToMap19_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,19)
				else
					if(isobj(A)) del(A)
		ToMap19_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,19)
				else
					if(isobj(A)) del(A)
//Map23
	Map23
		ToMap23_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,23)
				else
					if(isobj(A)) del(A)
		ToMap23_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,23)
				else
					if(isobj(A)) del(A)
		ToMap23_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,23)
				else
					if(isobj(A)) del(A)
		ToMap23_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,23)
				else
					if(isobj(A)) del(A)
//Map24
	Map24
		ToMap24_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,24)
				else
					if(isobj(A)) del(A)
		ToMap24_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,24)
				else
					if(isobj(A)) del(A)
		ToMap24_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,24)
				else
					if(isobj(A)) del(A)
		ToMap24_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,24)
				else
					if(isobj(A)) del(A)
//Map25
	Map25
		ToMap25_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,25)
				else
					if(isobj(A)) del(A)
		ToMap25_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,25)
				else
					if(isobj(A)) del(A)
		ToMap25_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,25)
				else
					if(isobj(A)) del(A)
		ToMap25_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,25)
				else
					if(isobj(A)) del(A)

//Map26
	Map26
		ToMap26_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,26)
				else
					if(isobj(A)) del(A)
		ToMap26_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,26)
				else
					if(isobj(A)) del(A)
		ToMap26_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,26)
				else
					if(isobj(A)) del(A)
		ToMap26_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,26)
				else
					if(isobj(A)) del(A)

//Map27
	Map27
		ToMap27_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,27)
				else
					if(isobj(A)) del(A)
		ToMap27_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,27)
				else
					if(isobj(A)) del(A)
		ToMap27_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,27)
				else
					if(isobj(A)) del(A)
		ToMap27_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,27)
				else
					if(isobj(A)) del(A)
//Map28
	Map28
		ToMap28_South
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,1,28)
				else
					if(isobj(A)) del(A)
		ToMap28_North
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(M.x,192,28)
				else
					if(isobj(A)) del(A)
		ToMap28_East
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(192,M.y,28)
				else
					if(isobj(A)) del(A)
		ToMap28_West
			density = 0
			Enter(A)
				..();if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = locate(1,M.y,28)
				else
					if(isobj(A)) del(A)
//////////
//Dungeons
	TOSHISUIDUNGEON
		density = 0
		Enter(A)
			..();if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(5,192,21)
			else
				if(isobj(A)) del(A)
	TOOUTSHISUIDUNGEON
		density = 0
		Enter(A)
			..();if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(78,98,9)
			else
				if(isobj(A)) del(A)
	TOORGXDUNGEON
		density = 0
		Enter(A)
			..();if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(50,87,22)
			else
				if(isobj(A)) del(A)
	TOOUTORGXDUNGEON
		density = 0
		Enter(A)
			..();if(ismob(A))
				var/mob/M = A
				if(M.client)
					M.loc = locate(179,10,7)
			else
				if(isobj(A)) del(A)
//////////////////////////////////////////////////////////////////////
//Christmas Time
turf/ChristmasTime
	Tree
		icon='Map/ChristmasTree.png'
		layer=MOB_LAYER+1
	ChristmasDecoration
		icon='ChristmasLights.dmi'
		Lights
			icon_state="Lights"
			layer=MOB_LAYER+1
turf/SnowPortals/house1
	outhouse1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(103,183,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(103,183,22)
			else
				..()
	inHouse1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(179,185,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(179,185,22)
			else

				..()
turf/SnowPortals/house2
	outhouse2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(108,172,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(108,172,22)
			else
				..()
	inHouse2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(187,185,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(187,185,22)
			else

				..()
turf/SnowPortals/house3
	outhouse3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(101,168,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(101,168,22)
			else
				..()
	inHouse3
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(182,160,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(182,160,22)
			else

				..()
turf/SnowPortals/house4
	outhouse4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(148,163,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(148,163,22)
			else
				..()
	inHouse4
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(189,160,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(189,160,22)
			else

				..()
turf/SnowPortals/house5
	outhouse5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(159,163,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(159,163,22)
			else
				..()
	inHouse5
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(173,155,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(173,155,22)
			else

				..()
turf/SnowPortals/building1
	outbuilding1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(144,154,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(144,154,22)
			else
				..()
	inbuilding1
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(182,141,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(182,141,22)
			else

				..()
turf/SnowPortals/building2
	outbuilding2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(110,154,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(110,154,22)
			else
				..()
	inbuilding2
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(179,168,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(179,168,22)
			else

				..()
turf/SnowPortals/cave
	outcave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(24,188,5)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(24,188,5)
			else
				..()
	incave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(39,105,22)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(39,105,22)
			else

				..()
turf/HydroCave/Hydrocave
	Hydroincave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(166,96,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(166,96,14)
			else

				..()
	Hydrooutcave
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(91,91,3)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(91,91,3)
			else
				..()

turf/Teleporters
	NinjaCashStore/ToMap
		density = 0
		Enter(A)
			if(ismob(A))
				return
	//			var/mob/M = A
	//			M.loc=locate(175,11,15)
			else if(isobj(A))
				return
	//			var/obj/B=A
	//			B.loc=locate(175,11,15)
			else

				..()

	NinjaCashStore/ToMap2
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(176,11,15)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(176,11,15)
			else

				..()

	NinjaCashStore/ToStore
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(150,10,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(150,10,33)
			else

				..()

	NinjaCashStore/ToStore1
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(151,10,33)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(151,10,33)
			else

				..()



turf/Teleporter/NewRockVillage2

	ScrollCaveEnterx90x7714
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(74, 153,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(74, 153,34)
			else

				..()

	ScrollCaveExitx74x153x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(90,77,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(90,77,14)
			else

				..()

	ScrollCaveEnterx145x153x14
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(93,181,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(93,181,34)
			else

				..()

	ScrollCaveExitx93x181x
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(145,153,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(145,153,14)
			else

				..()

	AnbuCaveEnterx61x36x35
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(12,33,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(12,33,35)
			else

				..()

	AnbuCaveExitx12x33x35
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(61,36,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(61,36,35)
			else

				..()

	AnbuCaveExitx50x178x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(73,72,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(73,72,35)
			else

				..()

	AnbuCaveEnterx73x72x35
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(usr.Village=="Rock"&&usr.rank!="Genin")
					M.loc=locate(50,178,34)
				else
					usr<<"A barrier pushes you away."
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(50,178,34)
			else

				..()

	CaveEnterx138x134x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(59,178,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(59,178,34)
			else

				..()

	CaveExitx59x178x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(149,142,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(149,142,34)
			else

				..()

	CaveOtherx188x147x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(48,63,12)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(48,63,12)
			else

				..()

	IwaHouseEnterx51x46x14
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(13,102,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(13,102,34)
			else

				..()
	IwaHouseExitx13x102x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(51,46,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(51,46,14)
			else

				..()

	SwordHouseEnterx174x100x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(99,59,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(99,59,34)
			else

				..()

	SwordHouseExitx99x59x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(174,100,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(174,100,34)
			else

				..()

	CafeEnterx182x105x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(123,148,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(123,148,34)
			else

				..()

	CafeExitx123x148x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(182,105,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(182,105,34)
			else

				..()
	ScrollSellerEnterx43x63x12
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(60,105,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(60,105,34)
			else

				..()
	ScrollSellerExitx60x105x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(43,106,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(43,103,14)
			else

				..()
	EquipHouseEnterx28x104x14
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(75,82,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(75,82,34)
			else

				..()
	EquipHouseExitx75x82x34
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(28,104,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(28,104,14)
			else

				..()



turf/Teleporters/NewRockVillage

	AnbuBaseEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(26,116,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(26,116,34)
			else

				..()

	AnbuBaseExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(44,88,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(44,88,34)
			else

				..()


	ClothingSalesPersonEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(13,74,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(13,74,34)
			else

				..()
	IwaEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(13,102,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(13,102,34)
			else

				..()

	EquipStoreEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(74,82,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(74,82,34)
			else

				..()

	ScrollBuildingEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(60,105,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(60,105,34)
			else

				..()

	CafeEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(123,148,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(123,148,34)
			else

				..()

	NinjaSwordEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(99,159,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(99,159,34)
			else

				..()

	Building1Exit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(174,100,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(174,100,34)
			else

				..()

	Building2Exit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(182,105,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(182,105,34)
			else

				..()

	CastleEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(97,100,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(97,100,34)
			else

				..()

	Cave1Anbu
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(50,178,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(50,178,34)
			else

				..()

	Cave2Anbu
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(159,178,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(159,178,34)
			else

				..()

	ScrollCave
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(74,154,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(74,154,34)
			else

				..()


	ScrollCavetoCave
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(93,181,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(93,181,34)
			else

				..()

	SabakuHouseEnter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(152,35,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(152,35,34)
			else

				..()

	Cave1Enter
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(148,142,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(148,142,34)
			else

				..()

	Cave1EntertoCave
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(188,148,34)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(188,148,34)
			else

				..()

	Cave2ToGoOfInsideCave
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(73,72,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(73,72,35)
			else

				..()

	Cave2InsideOfCave
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(61,36,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(61,36,35)
			else

				..()

	Cave2LastCoor
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(12,34,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(12,34,35)
			else

				..()

	EnterenceToKageHouse
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(26,73,35)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(26,73,35)
			else
				..()

	SabakuExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(175,73,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(175,73,14)
			else
				..()

	NewHospitalCoorExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(90,35,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(90,35,14)
			else
				..()

	CastleExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(79,175,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(79,175,14)
			else
				..()

	fourthCoorForScroll
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(145,153,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(145,153,14)
			else

				..()

	KageHouseExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(68,114,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(68,114,14)
			else

				..()

	ClothingSellerExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(62,36,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(62,36,14)
			else

				..()

	Building3
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(51,46,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(51,46,14)
			else

				..()

	Building4
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(43,106,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(43,106,14)
			else

				..()

	Building5
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(28,104,14)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(28,104,14)
			else

				..()

	Cave1LeafExit
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(48,63,12)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(48,63,12)
			else

				..()
turf/Buildings/RasxChi
	icon='RasxChi.dmi'