


mob/var/tmp/OpenedInv
mob/GainedAfterLogIn/verb
	InvWindow()
		set hidden=1
		usr.InvWindowz()
mob/proc/InvWindowz()
	if(!client) return

	if(src.OpenedInv)
		src << output(null,"InventoryStuff_out")
		winset(src,"InventoryStuff","is-visible=false")
	else
//		src << output(prompt,"InventoryStuff_out")
		var/countzzz=0
		for(var/obj/A in src.contents)
			if(A.ammount>1)
				countzzz+=A.PlacementWeight*A.ammount
			else
				countzzz+=A.PlacementWeight
		src.ItemWeight=countzzz
		src.UpdateInv()
		winset(src,"InventoryStuff","title=\"[title]\"")
		winset(src,"InventoryStuff","is-visible=true")


mob
	proc
		CheckWeight()
			var/countzzz=0
			for(var/obj/A in src.contents)
				if(A.ammount>1)
					countzzz+=A.PlacementWeight*A.ammount
				else
					countzzz+=A.PlacementWeight
			src.ItemWeight=countzzz

obj
	ReleaseThingy
		icon='cancel.dmi'
		icon_state="Release"
		layer = MOB_LAYER+999
		screen_loc="19,19"
		Click()
			if(usr.Pill!="")
				usr.Pill=""
				usr<<"You stop the effects of the pill."
			if(usr.GateIn!="")
				usr<<"You release the [usr.GateIn] gate!"
				spawn()
					HealGateDelay(usr)
				usr.GateIn=""
				usr.icon=usr.Oicon
				usr.overlays-='Icons/Jutsus/BEyes.dmi'
				usr.tai=usr.Mtai
				usr.pixel_step_size=0
				sleep(1)
			del(src)
	ReleaseThingyAilment
		var/HowLong=50
		screen_loc="18,19"
		layer=MOB_LAYER+999
		Burn
			icon='cancel.dmi'
			icon_state="Burned"
			New()
				..()
				spawn(HowLong)
					del(src)
		Poison
			icon='cancel.dmi'
			icon_state="Poisoned"
			New()
				..()
				spawn(HowLong)
					del(src)
		Stun
			icon='cancel.dmi'
			icon_state="Stunned"
			New()
				..()
				spawn(30)//Giving this one to look like this due to special circumstances
					del(src)
		Bleed
			icon='cancel.dmi'
			icon_state="Bleed"
			New()
				..()
				spawn(HowLong)
					del(src)
proc
	HealGateDelay(mob/M)
		while(M.HealGateTime>0)
			sleep(600)
			M.HealGateTime--
		if(M.HealGateTime<=0)
			M<<"Your body feels better.. You can now utilize the chakra gates again."
			M.HealGateTime=0
		return

mob/var/tmp/SlotYourOn="1"
mob/proc/UpdateQuickSlots()
	for(var/obj/HUD/HotKeys/ABAB in src.client.screen)
		del(ABAB)
	if(src.SlotYourOn=="1")
		var/number=1
		while(number<=10)
			var/Type=text2path("/obj/HUD/HotKeys/Slot[number]")
			if(Type)
				var/A=new Type
				for(var/obj/SkillCards/C in src.LearnedJutsus)
					if(C.Slot==number)
						A:icon=C.icon;A:icon_state=C.icon_state;A:overlays=C.overlays
						var/icon/I=new('Skillcards.dmi',"HotKey[A:Slot]")
						A:overlays+=I
				src.client.screen+=A
			number++

	if(src.SlotYourOn=="2")
		var/number=11
		while(number<=20)
			var/Type=text2path("/obj/HUD/HotKeys/Slot[number]")
			if(Type)
				var/A=new Type
				for(var/obj/SkillCards/C in src.LearnedJutsus)
					if(C.Slot==number)
						A:icon=C.icon;A:icon_state=C.icon_state;A:overlays=C.overlays
						var/icon/I=new('Skillcards.dmi',"HotKey[A:Slot-10]")
						A:overlays+=I
				src.client.screen+=A
			number++

obj/HUD
	FieldHUD
		layer=MOB_LAYER+50
		icon='Icons/Hud/Backdrop.dmi'
		Stats
			icon_state="Info Card"
			screen_loc="1,16"
			Click()
				usr<<sound('SFX/click1.wav',0)
		Inventory
			icon_state="Inventory"
			screen_loc="1,17"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.InvWindowz()
		Jutsu
			icon_state="Inventory"
			screen_loc="1,18"
			Click()
				usr<<sound('SFX/click1.wav',0)
		Passives
			icon_state="Jutsu"
			screen_loc="1,19"
			Click()
				usr<<sound('SFX/click1.wav',0)
	ExtraHUD
		icon='HUDQuickSlot.dmi'
		layer=MOB_LAYER+50
		Part1
			icon_state="1"
			screen_loc="2,7"
		Part2
			icon_state="2"
			screen_loc="2,6"
		Part3
			icon_state="3"
			screen_loc="1,6"
		Part4
			icon_state="4"
			screen_loc="2,7 to 2,16"
		Part5
			icon_state="5"
			screen_loc="2,17"
		Part6
			icon_state="6"
			screen_loc="2,18"
		Part7
			icon_state="7"
			screen_loc="1,18"
	Palletewood
		icon='PNG/creation screen copy3.png'
		//icon_state=""
		screen_loc = "5,5"
		layer=100
	HotKeys
		var/Skillcard
		var/Slot
		icon='HUDQuickSlot.dmi'
		screen_loc="1,16"
		layer=MOB_LAYER+50
		mouse_drop_zone=1
		MouseDown(location,control,params)
			var/list/list_params = params2list(params)
			if(("shift" in list_params))
				var/obj/SkillCards/A = input("Which Skillcard do you select?") in usr.LearnedJutsus + list("Cancel")
				if(A=="Cancel")
					return
				else
					if(A.Delay)
						usr<<"You can't change the slot while you're on delay.";return
					for(var/obj/SkillCards/C in usr.LearnedJutsus)
						if(C.Slot==src.Slot)
							C.Slot=null
					A.Slot=src.Slot
					usr<<"You set [A] to slot [src.Slot]."
					src.icon=A.icon;src.icon_state=A.icon_state
					if(src.Slot>10)
						var/icon/I=new('Skillcards.dmi',"HotKey[src.Slot-10]")
						src.overlays+=I
					else
						var/icon/I=new('Skillcards.dmi',"HotKey[src.Slot]")
						src.overlays+=I

			else
				if(src.Slot&&src.Slot<10)
					usr.Slot(src.Slot)
				else if(src.Slot)
					usr.Slot(src.Slot-10)
		Slot1
			screen_loc="1,17"
			Slot=1

		Slot2
			screen_loc="1,16"
			Slot=2

		Slot3
			screen_loc="1,15"
			Slot=3

		Slot4
			screen_loc="1,14"
			Slot=4

		Slot5
			screen_loc="1,13"
			Slot=5

		Slot6
			screen_loc="1,12"
			Slot=6

		Slot7
			screen_loc="1,11"
			Slot=7

		Slot8
			screen_loc="1,10"
			Slot=8

		Slot9
			screen_loc="1,9"
			Slot=9

		Slot10
			screen_loc="1,8"
			Slot=10

		Slot11
			screen_loc="1,17"
			Slot=11

		Slot12
			screen_loc="1,16"
			Slot=12

		Slot13
			screen_loc="1,15"
			Slot=13

		Slot14
			screen_loc="1,14"
			Slot=14

		Slot15
			screen_loc="1,13"
			Slot=15

		Slot16
			screen_loc="1,12"
			Slot=16

		Slot17
			screen_loc="1,11"
			Slot=17

		Slot18
			screen_loc="1,10"
			Slot=18

		Slot19
			screen_loc="1,9"
			Slot=19

		Slot20
			screen_loc="1,8"
			Slot=20
	ChakraCircleClassic
		icon='Icons/Hud/HUDChakra.dmi'
		Top1
			icon_state="1"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-3"
		Top2
			icon_state="2"
			layer=MOB_LAYER+50
			screen_loc="WEST+1,NORTH-3"
		Top3
			icon_state="3"
			layer=MOB_LAYER+50
			screen_loc="WEST+2,NORTH-3"
		Top4
			icon_state="4"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-4"
		Top5
			icon_state="5"
			layer=MOB_LAYER+50
			screen_loc="WEST+1,NORTH-4"
		Top6
			icon_state="6"
			layer=MOB_LAYER+50
			screen_loc="WEST+2,NORTH-4"
		Top7
			icon_state="7"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-5"
		Top8
			icon_state="8"
			layer=MOB_LAYER+50
			screen_loc="WEST+1,NORTH-5"
		Top9
			icon_state="9"
			layer=MOB_LAYER+50
			screen_loc="WEST+2,NORTH-5"
	ChakraCircle

	/*
		icon='Icons/Hud/HUDChakra.dmi'
		Top1
			icon_state="1"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH"
		Top2
			icon_state="2"
			layer=MOB_LAYER+50
			screen_loc="WEST+1,NORTH"
		Top3
			icon_state="3"
			layer=MOB_LAYER+50
			screen_loc="WEST+2,NORTH"
		Top4
			icon_state="4"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-1"
		Top5
			icon_state="5"
			layer=MOB_LAYER+50
			screen_loc="WEST+1,NORTH-1"
		Top6
			icon_state="6"
			layer=MOB_LAYER+50
			screen_loc="WEST+2,NORTH-1"
		Top7
			icon_state="7"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-2"
		Top8
			icon_state="8"
			layer=MOB_LAYER+50
			screen_loc="WEST+1,NORTH-2"
		Top9
			icon_state="9"
			layer=MOB_LAYER+50
			screen_loc="WEST+2,NORTH-2"

		*/


//	ChakraCircle



		icon='Icons/Hud/HUDChakra2.dmi'
		var/number=0
		layer=60
		Top1
			icon_state="1-0"

			screen_loc="WEST:13,NORTH-5:-7"//"WEST:6,NORTH-2:-6"//was WEST:10
			number=1
		Top2
			icon_state="2-0"

			screen_loc="WEST+1:13,NORTH-5:-7"//"WEST+1:7,NORTH-2:-6"//"WEST+1:10,NORTH-2:-6"
			number=2
		Top3
			icon_state="3-0"

			screen_loc="WEST+2:13,NORTH-5:-7"//"WEST+2:10,NORTH-2:-6"
			number=3
		Top4
			icon_state="4-0"

			screen_loc="WEST:13,NORTH-4:-7"//"WEST:6,NORTH-1:-6"//WEST:10,NORTH-1:-6"
			number=4
		Top5
			icon_state="5-0"

			screen_loc="WEST+1:13,NORTH-4:-7"//"WEST+1:7,NORTH-1:-6"//WEST+1:10,NORTH-1:-6"
			number=5
		Top6
			icon_state="6-0"

			screen_loc="WEST+2:13,NORTH-4:-7"//WEST+2:10,NORTH-1:-6
			number=6
		Top7
			icon_state="7-0"

			screen_loc="WEST:13,NORTH-3:-7"//WEST:10,NORTH:-6"
			number=7
		Top8
			icon_state="8-0"

			screen_loc="WEST+1:13,NORTH-3:-7"//WEST+1:10,NORTH:-6"
			number=8
		Top9
			icon_state="9-0"

			screen_loc="WEST+2:13,NORTH-3:-7"//"WEST+2:10,NORTH:-6"
			number=9




	ChakraRim
		layer=55
		icon='HUDChakraCircle.dmi'
		Part1//Will Represent Chakra Reservoir when it's above 95%
			icon_state="0,0"
			screen_loc="WEST,NORTH-6:10"
		Part2//Will Represent Chakra resrevoir from 80 - 90%
			icon_state="1,0"
			screen_loc="WEST+1,NORTH-6:10"
		Part3
			icon_state="0,1"
			screen_loc="WEST,NORTH-5:10"
		Part4
			icon_state="1,1"
			screen_loc="WEST+1,NORTH-5:10"
		Part5
			icon_state="0,2"
			screen_loc="WEST,NORTH-4:10"
		Part6
			icon_state="1,2"
			screen_loc="WEST+1,NORTH-4:10"
		Part7
			icon_state="0,3"
			screen_loc="WEST,NORTH-3:10"
		Part8
			icon_state="1,3"
			screen_loc="WEST+1,NORTH-3:10"

		Part11
			icon_state="3,0"
			screen_loc="WEST+3,NORTH-6:10"
		Part12
			icon_state="2,0"
			screen_loc="WEST+2,NORTH-6:10"
		Part13
			icon_state="3,1"
			screen_loc="WEST+3,NORTH-5:10"
		Part14
			icon_state="2,1"
			screen_loc="WEST+2,NORTH-4:10"
		Part15
			icon_state="3,2"
			screen_loc="WEST+3,NORTH-4:10"
		Part16
			icon_state="2,2"
			screen_loc="WEST+2,NORTH-3:10"
		Part17
			icon_state="3,3"
			screen_loc="WEST+3,NORTH-3:10"
		Part18
			icon_state="2,3"
			screen_loc="WEST+2,NORTH-3:10"
	HealthSegment
		var
			Num=0
			Width=160
			Rangemax=128
			Rangemin=0
		Part1
			icon='Icons/Hud/HUDHealthBar1.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+3,NORTH-3"
			Rangemax=32
			Rangemin=0
		Part2
			icon='Icons/Hud/HUDHealthBar1.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+4,NORTH-3"
			Rangemax=64
			Rangemin=33
		Part3
			icon='Icons/Hud/HUDHealthBar1.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+5,NORTH-3"
			Rangemax=96
			Rangemin=65
		Part4
			icon='Icons/Hud/HUDHealthBar1.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+6,NORTH-3"
			Rangemax=128
			Rangemin=97
		Part5
			icon='Icons/Hud/HUDHealthBar2.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+7,NORTH-3"
			Rangemax=160
			Rangemin=129
	StaminaSegment
		var
			Num=0
			Width=160
			Rangemax=128
			Rangemin=0
		Part1
			icon='Icons/Hud/HUDHealthBar4.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+3,NORTH-3"
			Rangemax=32
			Rangemin=0
		Part2
			icon='Icons/Hud/HUDHealthBar4.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+4,NORTH-3"
			Rangemax=64
			Rangemin=33
		Part3
			icon='Icons/Hud/HUDHealthBar4.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+5,NORTH-3"
			Rangemax=96
			Rangemin=65
		Part4
			icon='Icons/Hud/HUDHealthBar4.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+6,NORTH-3"
			Rangemax=128
			Rangemin=97
		Part5
			icon='Icons/Hud/HUDHealthBar3.dmi'
			icon_state="32"
			layer=MOB_LAYER+50
			screen_loc="WEST+7,NORTH-3"
			Rangemax=160
			Rangemin=129
	StruggleBar
		var
			Num=0
			Width=64
			Rangemax=64
			Rangemin=0
		Bottom
			icon='Icons/Hud/HUDStruggleBar.dmi'
			icon_state="0"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-20"
			Rangemax=32
			Rangemin=0
		Top
			icon='Icons/Hud/HUDStruggleBar2.dmi'
			icon_state="0"
			layer=MOB_LAYER+50
			screen_loc="WEST,NORTH-19"
			Rangemax=64
			Rangemin=33

	Wound

		var/Num = 0; var/Width = 160; var/Rangemax = 128; var/Rangemin = 0
		icon = 'Icons/Hud/HUDHealthBar1.dmi'

		Part1

			icon = 'Icons/Hud/HUDHealthBar4.dmi'; icon_state = "32"; layer = MOB_LAYER + 50
			screen_loc = "WEST+3,NORTH-3"; Rangemax = 32; Rangemin = 0

		Part2

			icon = 'Icons/Hud/HUDHealthBar4.dmi'; icon_state = "32"; layer = MOB_LAYER + 50
			screen_loc = "WEST+4,NORTH-3"; Rangemax = 64; Rangemin = 33

		Part3

			icon = 'Icons/Hud/HUDHealthBar4.dmi'; icon_state = "32"; layer = MOB_LAYER + 50
			screen_loc = "WEST+5,NORTH-3"; Rangemax = 96; Rangemin = 65

		Part4

			icon = 'Icons/Hud/HUDHealthBar4.dmi'; icon_state = "32"; layer = MOB_LAYER + 50
			screen_loc = "WEST+6,NORTH-3"; Rangemax = 128; Rangemin = 97

		Part5

			icon = 'Icons/Hud/HUDHealthBar3.dmi'; icon_state = "32"; layer = MOB_LAYER + 50
			screen_loc = "WEST+7,NORTH-3"; Rangemax = 160; Rangemin = 129
//Hawk2//
	Blood

		var/Num = 0; var/Width = 160; var/Rangemax = 128; var/Rangemin = 0; layer = MOB_LAYER + 49

		Click()

			usr.SwitchHuds()

		Top1

			icon = 'Icons/Hud/BloodBar/Top.dmi'; icon_state = "32"
			screen_loc = "WEST+1,NORTH"; Rangemax = 96; Rangemin = 65

		Top2

			icon = 'Icons/Hud/BloodBar/Top Left.dmi'; icon_state = "32"
			screen_loc = "WEST,NORTH"; Rangemax = 96; Rangemin = 65

		Top3

			icon = 'Icons/Hud/BloodBar/Top Right.dmi'; icon_state = "32"
			screen_loc = "WEST+2,NORTH"; Rangemax = 96; Rangemin = 65

		Top4

			icon = 'Icons/Hud/BloodBar/Center.dmi'; icon_state = "32"
			screen_loc = "WEST+1,NORTH-1"; Rangemax = 64; Rangemin = 33

		Top5

			icon = 'Icons/Hud/BloodBar/Left Mid.dmi'; icon_state = "32"
			screen_loc = "WEST,NORTH-1"; Rangemax = 64; Rangemin = 33

		Top6

			icon = 'Icons/Hud/BloodBar/Mid Right.dmi'; icon_state = "32"
			screen_loc = "WEST+2,NORTH-1"; Rangemax = 64; Rangemin = 33

		Top7

			icon = 'Icons/Hud/BloodBar/Mid Botton.dmi'; icon_state = "32"
			screen_loc = "WEST+1,NORTH-2"; Rangemax = 32; Rangemin = 0

		Top8

			icon = 'Icons/Hud/BloodBar/Left corner.dmi'; icon_state = "32"
			screen_loc = "WEST,NORTH-2"; Rangemax = 32; Rangemin = 0

		Top9

			icon = 'Icons/Hud/BloodBar/Right corner.dmi'; icon_state = "32"
			screen_loc = "WEST+2,NORTH-2"; Rangemax = 32; Rangemin = 0

	ChakraResevoirCircle
		var
			Num=0
			Width=96
			Rangemax=32
			Rangemin=0

		Click()

			usr.SwitchHuds()

		Top1
			icon='Icons/Hud/HUDResevoirChamber1.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST+1,NORTH-3"
			Rangemax=96
			Rangemin=65
		Top2
			icon='Icons/Hud/HUDResevoirChamber2.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST,NORTH-3"
			Rangemax=96
			Rangemin=65
		Top3
			icon='Icons/Hud/HUDResevoirChamber3.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST+2,NORTH-3"
			Rangemax=96
			Rangemin=65

		Top4
			icon='Icons/Hud/HUDResevoirChamber4.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST+1,NORTH-4"
			Rangemax=64
			Rangemin=33
		Top5
			icon='Icons/Hud/HUDResevoirChamber5.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST,NORTH-4"
			Rangemax=64
			Rangemin=33
		Top6
			icon='Icons/Hud/HUDResevoirChamber6.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST+2,NORTH-4"
			Rangemax=64
			Rangemin=33

		Top7
			icon='Icons/Hud/HUDResevoirChamber7.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST+1,NORTH-5"
			Rangemax=32
			Rangemin=0
		Top8
			icon='Icons/Hud/HUDResevoirChamber8.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST,NORTH-5"
			Rangemax=32
			Rangemin=0
		Top9
			icon='Icons/Hud/HUDResevoirChamber9.dmi'
			icon_state="32"
			layer=MOB_LAYER+49
			screen_loc="WEST+2,NORTH-5"
			Rangemax=32
			Rangemin=0

			/*
	HealthCircle
		layer=80
		icon_state="0"

		var
			Num=0
			Width=110 //Not sure about this but its actually supposed to represent Height. Need to test.
			Rangemax=16
			Rangemin=0
		Part1
			icon='HUDVitality1.dmi'
			icon_state="0"
			screen_loc="WEST,NORTH-3:10"
		Part2
			icon='HUDVitality2.dmi'
			icon_state="7"
			screen_loc="WEST+1,NORTH-3:10"
		Part3
			icon='HUDVitality3.dmi'
			icon_state="16"
			screen_loc="WEST,NORTH-2:10"
		Part4
			icon='HUDVitality4.dmi'
			icon_state="16"
			screen_loc="WEST+1,NORTH-2:10"
		Part5
			icon='HUDVitality5.dmi'
			icon_state="16"
			screen_loc="WEST,NORTH-1:10"
		Part6
			icon='HUDVitality6.dmi'
			icon_state="16"
			screen_loc="WEST+1,NORTH-1:10"
		Part7
			icon='HUDVitality7.dmi'
			icon_state="2"
			screen_loc="WEST,NORTH:10"
		Part8
			icon='HUDVitality8.dmi'
			icon_state="7"
			screen_loc="WEST+1,NORTH:10"

	HealthCircle
		layer=100
		icon_state="0"

		var
			Num=0
		//	Width=110 //Not sure about this but its actually supposed to represent Height. Need to test.
			Width=64
			Rangemax=16
			Rangemin=0
		Part1
			icon='HUDVitality1.dmi'
			icon_state="16"
			screen_loc="WEST,NORTH-3:10"
			Rangemax=16
			Rangemin=0

		Part2
			icon='HUDVitality2.dmi'
	//		icon_state="0"
			screen_loc="WEST+1,NORTH-3:10"
			Rangemax=16
			Rangemin=0
		Part3
			icon='HUDVitality3.dmi'
			screen_loc="WEST,NORTH-2:10"
			Rangemax=32
			Rangemin=17
		Part4
			icon='HUDVitality4.dmi'
			screen_loc="WEST+1,NORTH-2:10"
			Rangemax=32
			Rangemin=17
		Part5
			icon='HUDVitality5.dmi'
			screen_loc="WEST,NORTH-1:10"
			Rangemax=48
			Rangemin=33
		Part6
			icon='HUDVitality6.dmi'
			screen_loc="WEST+1,NORTH-1:10"
			Rangemax=48
			Rangemin=33
		Part7
			icon='HUDVitality7.dmi'
			screen_loc="WEST,NORTH:10"
			Rangemax=64
			Rangemin=49
		Part8
			icon='HUDVitality8.dmi'
			screen_loc="WEST+1,NORTH:10"
			Rangemax=64
			Rangemin=49
			*/
	HealthCircle
		layer=55
		icon_state="0"

		var
			Num=0
			Width=49 //Not sure about this but its actually supposed to represent Height. Need to test.
			Rangemax=16
			Rangemin=0
		Part1
			icon='Icons/Hud/HUDVitality1.dmi'
			icon_state="3"
			screen_loc="WEST,NORTH-6:10"
			Rangemax=7
			Rangemin=0

		Part2
			icon='Icons/Hud/HUDVitality2.dmi'
			icon_state="7"
			screen_loc="WEST+1,NORTH-6:10"
			Rangemax=7
			Rangemin=0
		Part3
			icon='Icons/Hud/HUDVitality3.dmi'
			screen_loc="WEST,NORTH-5:10"
			Rangemax=24
			Rangemin=8
		Part4
			icon='Icons/Hud/HUDVitality4.dmi'
			screen_loc="WEST+1,NORTH-5:10"
			Rangemax=24
			Rangemin=8
		Part5
			icon='Icons/Hud/HUDVitality5.dmi'
			screen_loc="WEST,NORTH-4:10"
			Rangemax=41
			Rangemin=25
		Part6
			icon='Icons/Hud/HUDVitality6.dmi'
			screen_loc="WEST+1,NORTH-4:10"
			Rangemax=41
			Rangemin=25
		Part7
			icon='Icons/Hud/HUDVitality7.dmi'
			screen_loc="WEST,NORTH-3:10"
			Rangemax=49
			Rangemin=42
		Part8
			icon='Icons/Hud/HUDVitality8.dmi'
			screen_loc="WEST+1,NORTH-3:10"
			Rangemax=49
			Rangemin=42
	StaminaCircle
		layer=55
		icon_state="0"

		var
			Num=0
			Width=49 //Not sure about this but its actually supposed to represent Height. Need to test.
			Rangemax=16
			Rangemin=0
		Part1
			icon='Icons/Hud/HUDStamina1.dmi'
			icon_state="3"
			screen_loc="WEST+3,NORTH-6:10"
			Rangemax=7
			Rangemin=0
		Part2
			icon='Icons/Hud/HUDStamina2.dmi'
			icon_state="7"
			screen_loc="WEST+2,NORTH-6:10"
			Rangemax=7
			Rangemin=0
		Part3
			icon='Icons/Hud/HUDStamina3.dmi'
			screen_loc="WEST+3,NORTH-5:10"
			Rangemax=24
			Rangemin=8
		Part4
			icon='Icons/Hud/HUDStamina4.dmi'
			screen_loc="WEST+2,NORTH-5:10"
			Rangemax=24
			Rangemin=8
		Part5
			icon='Icons/Hud/HUDStamina5.dmi'
			screen_loc="WEST+3,NORTH-4:10"
			Rangemax=41
			Rangemin=25
		Part6
			icon='Icons/Hud/HUDStamina6.dmi'
			screen_loc="WEST+2,NORTH-4:10"
			Rangemax=41
			Rangemin=25
		Part7
			icon='Icons/Hud/HUDStamina7.dmi'
			screen_loc="WEST+3,NORTH-3:10"
			Rangemax=49
			Rangemin=42
		Part8
			icon='Icons/Hud/HUDStamina8.dmi'
			screen_loc="WEST+2,NORTH-3:10"
			Rangemax=49
			Rangemin=42
//////Hawk remember this////////
mob/proc/SwitchHuds()



mob
	proc/UpdateChakraReservoir2()
		set background = 1
		// Compares the percentage of the
		if(!src.client)
			return
//Chakra THIS IS CHAKRA )))))) I need this to update ;o
		for(var/obj/HUD/ChakraRim/A in src.client.screen)
			/*var/Percentage=round((src.chakra/src.Mchakra)*100,5)
			if(Percentage<0)
				Percentage=0
			if(Percentage>100)
				Percentage=100
			A.icon_state="[A.number]-[Percentage]"*/

			if(src.ChakraPool>=src.MaxChakraPool)
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="0,0"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="1,0"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			//	if(istype(A,/obj/HUD/ChakraRim/Part4))
			//		A.icon_state="1,1"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part6))
					A.icon_state="1,2"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part11))
					A.icon_state="3,0"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="2,0"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,1"
			//	if(istype(A,/obj/HUD/ChakraRim/Part14))
			//		A.icon_state="2,1"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part16))
					A.icon_state="2,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
			else if(src.ChakraPool>=src.MaxChakraPool*0.87&&src.ChakraPool<=src.MaxChakraPool*0.95)
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="1,0"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="2,0"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,1"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.83&&src.ChakraPool<=src.MaxChakraPool*0.87)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="1,1"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="2,0"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,1"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.76&&src.ChakraPool<src.MaxChakraPool*0.83)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="2,0"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,1"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.71&&src.ChakraPool<src.MaxChakraPool*0.76)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="2,1"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,1"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.66&&src.ChakraPool<src.MaxChakraPool*0.71)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,1"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.62&&src.ChakraPool<src.MaxChakraPool*0.66)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="3,5"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.56&&src.ChakraPool<src.MaxChakraPool*0.62)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,2"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.52&&src.ChakraPool<src.MaxChakraPool*0.56)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="3,6"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.50&&src.ChakraPool<src.MaxChakraPool*0.52)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="3,3"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.45&&src.ChakraPool<src.MaxChakraPool*0.50)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,3"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.41&&src.ChakraPool<src.MaxChakraPool*0.45)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="2,4"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.36&&src.ChakraPool<src.MaxChakraPool*0.41)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,3"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.31&&src.ChakraPool<src.MaxChakraPool*0.36)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="1,8"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.21&&src.ChakraPool<src.MaxChakraPool*0.31)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="0,3"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.16&&src.ChakraPool<src.MaxChakraPool*0.21)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="0,2"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.08&&src.ChakraPool<src.MaxChakraPool*0.16)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="0,1"
			else if(src.ChakraPool>=src.MaxChakraPool*0.04&&src.ChakraPool<src.MaxChakraPool*0.08)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="5,6"
			else if(src.ChakraPool>=src.MaxChakraPool*0.01&&src.ChakraPool<src.MaxChakraPool*0.04)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="5,7"
			else if(src.ChakraPool<src.MaxChakraPool*0.015)//They Start going in the order by the icon here!
				if(istype(A,/obj/HUD/ChakraRim/Part1))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part2))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part12))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part13))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part15))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part17))//Needes to represent 50-52% chakra res remaining!
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part18))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part8))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part7))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part5))
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part3))
					A.icon_state="Blank"

					/*
						//Don't know if I need the rest
				if(istype(A,/obj/HUD/ChakraRim/Part16))
				//	A.icon_state="2,2"
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part4))
			//		A.icon_state="1,1"
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part6))
				//	A.icon_state="1,2"
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part11))
				//	A.icon_state="3,0"
					A.icon_state="Blank"
				if(istype(A,/obj/HUD/ChakraRim/Part14))
				//	A.icon_state="2,1"
					A.icon_state="Blank"

					*/

				/*
				if(istype(A,/obj/HUD/ChakraCircle/Top1/))
					A.icon_state="glow1"
				if(istype(A,/obj/HUD/ChakraCircle/Top2/))
					A.icon_state="glow2"
				if(istype(A,/obj/HUD/ChakraCircle/Top3/))
					A.icon_state="glow3"
				if(istype(A,/obj/HUD/ChakraCircle/Top4/))
					A.icon_state="glow4"
				if(istype(A,/obj/HUD/ChakraCircle/Top5/))
					A.icon_state="glow5"
				if(istype(A,/obj/HUD/ChakraCircle/Top6/))
					A.icon_state="glow6"
				if(istype(A,/obj/HUD/ChakraCircle/Top7/))
					A.icon_state="glow7"
				if(istype(A,/obj/HUD/ChakraCircle/Top8/))
					A.icon_state="glow8"
				if(istype(A,/obj/HUD/ChakraCircle/Top9/))
					A.icon_state="glow9"
			if(src.chakra>src.Mchakra*0.75&&src.chakra<=src.Mchakra*0.95)
				if(istype(A,/obj/HUD/ChakraCircle/Top1/))
					sleep(2);flick("glow1",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top2/))
					sleep(2);flick("glow2",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top3/))
					sleep(2);flick("glow3",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top4/))
					sleep(2);flick("glow4",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top5/))
					sleep(2);flick("glow5",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top6/))
					sleep(2);flick("glow6",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top7/))
					sleep(2);flick("glow7",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top8/))
					sleep(2);flick("glow8",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top9/))
					sleep(2);flick("glow9",A)
			if(src.chakra>src.Mchakra*0.25&&src.chakra<=src.Mchakra*0.75)
				if(istype(A,/obj/HUD/ChakraCircle/Top1/))
					A.icon_state="1"
				if(istype(A,/obj/HUD/ChakraCircle/Top2/))
					A.icon_state="2"
				if(istype(A,/obj/HUD/ChakraCircle/Top3/))
					A.icon_state="3"
				if(istype(A,/obj/HUD/ChakraCircle/Top4/))
					A.icon_state="4"
				if(istype(A,/obj/HUD/ChakraCircle/Top5/))
					A.icon_state="5"
				if(istype(A,/obj/HUD/ChakraCircle/Top6/))
					A.icon_state="6"
				if(istype(A,/obj/HUD/ChakraCircle/Top7/))
					A.icon_state="7"
				if(istype(A,/obj/HUD/ChakraCircle/Top8/))
					A.icon_state="8"
				if(istype(A,/obj/HUD/ChakraCircle/Top9/))
					A.icon_state="9"
			if(src.chakra<=src.Mchakra*0.25&&src.chakra>0)
				if(istype(A,/obj/HUD/ChakraCircle/Top1/))
					flick("flick1",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top2/))
					flick("flick2",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top3/))
					flick("flick3",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top4/))
					flick("flick4",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top5/))
					flick("flick5",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top6/))
					flick("flick6",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top7/))
					flick("flick7",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top8/))
					flick("flick8",A)
				if(istype(A,/obj/HUD/ChakraCircle/Top9/))
					flick("flick9",A)
			if(src.chakra<=0)
				if(istype(A,/obj/HUD/ChakraCircle/Top1/))
					A.icon_state="dead1"
				if(istype(A,/obj/HUD/ChakraCircle/Top2/))
					A.icon_state="dead2"
				if(istype(A,/obj/HUD/ChakraCircle/Top3/))
					A.icon_state="dead3"
				if(istype(A,/obj/HUD/ChakraCircle/Top4/))
					A.icon_state="dead4"
				if(istype(A,/obj/HUD/ChakraCircle/Top5/))
					A.icon_state="dead5"
				if(istype(A,/obj/HUD/ChakraCircle/Top6/))
					A.icon_state="dead6"
				if(istype(A,/obj/HUD/ChakraCircle/Top7/))
					A.icon_state="dead7"
				if(istype(A,/obj/HUD/ChakraCircle/Top8/))
					A.icon_state="dead8"
				if(istype(A,/obj/HUD/ChakraCircle/Top9/))
					A.icon_state="dead9"
					*/
		spawn(1)
			src.UpdateInv()

mob
	proc/UpdateHealth2()
		set background = 1
	//	 Compares the percentage of the
		if(!src.client||!src in OnlinePlayers)
			return
		for(var/obj/HUD/HealthCircle/O in src.client.screen)
			O.Num = round((src.health/src.maxhealth)*O.Width) //each objects, then sets icon
			if(O.Num >= O.Rangemax)       //   state accordingly
		//		world<<"[O] Num variable was [O.Num], which is greater than their Rangemax, which is [O.Rangemax]. Setting Icon state to [O.Rangemax-O.Rangemin]"
				O.icon_state="[O.Rangemax-O.Rangemin]"
			//	if(istype(O,/obj/HUD/HealthCircle/Part8))
			//		O.icon_state="7"
			if(O.Num <= O.Rangemin)
		//		world<<"[O] Num variable was [O.Num], which is less than their Rangemin variable, which is, [O.Rangemin]. Setting Icon state to 0."
				O.icon_state="0"
			if(O.Num < O.Rangemax && O.Num > O.Rangemin)
				var/newnum = O.Num - O.Rangemin
		//		world<<"Icon Change for [O] called. Icon State will be [newnum]"
				O.icon_state = "[newnum]"
mob
	proc/UpdateStamina2()
		set background = 1
	//	 Compares the percentage of the
		if(!src.client||!src in OnlinePlayers)
			return
		for(var/obj/HUD/StaminaCircle/O in src.client.screen)
			O.Num = round((src.stamina/src.maxstamina)*O.Width) //each objects, then sets icon
			if(O.Num >= O.Rangemax)       //   state accordingly
			//	world<<"[O] Num variable was [O.Num], which is greater than their Rangemax, which is [O.Rangemax]. Setting Icon state to [O.Rangemax-O.Rangemin]"
				O.icon_state="[O.Rangemax-O.Rangemin]"
			//	if(istype(O,/obj/HUD/HealthCircle/Part8))
			//		O.icon_state="7"
			if(O.Num <= O.Rangemin)
			//	world<<"[O] Num variable was [O.Num], which is less than their Rangemin variable, which is, [O.Rangemin]. Setting Icon state to 0."
				O.icon_state="0"
			if(O.Num < O.Rangemax && O.Num > O.Rangemin)
				var/newnum = O.Num - O.Rangemin
			//	world<<"Icon Change for [O] called. Icon State will be [newnum]"
				O.icon_state = "[newnum]"
mob
	proc/UpdateHealth()
		set background = 1
		// Compares the percentage of the
		if(!src.client)
			return
		for(var/obj/HUD/HealthSegment/O in src.client.screen)
			O.Num = round((src.health/src.maxhealth)*O.Width)// each objects, then sets icon
			if(O.Num >= O.Rangemax)                // state accordingly
				O.icon_state = "32"
			if(O.Num <= O.Rangemin)
				O.icon_state = "0"
			if(O.Num < O.Rangemax && O.Num > O.Rangemin)
				var/newnum = O.Num - O.Rangemin
				O.icon_state = "[newnum]"


mob
	proc/UpdateStamina()
		set background = 1
		// Compares the percentage of the
		if(!src.client)
			return
		for(var/obj/HUD/StaminaSegment/O in src.client.screen)
			O.Num = round((src.stamina/src.maxstamina)*O.Width)// each objects, then sets icon
			if(O.Num >= O.Rangemax)                // state accordingly
				O.icon_state = "32"
			if(O.Num <= O.Rangemin)
				O.icon_state = "0"
			if(O.Num < O.Rangemax && O.Num > O.Rangemin)
				var/newnum = O.Num - O.Rangemin
				O.icon_state = "[newnum]"

mob/proc/UpdateBlood()

	set background = 1

	if(!src.client)
		return

	for(var/obj/HUD/Blood/o in client.screen)
		o.Num = round((blood * 0.01) * o.Width)

		if(o.Num >= o.Rangemax)
			o.icon_state = "32"

		if(o.Num <= o.Rangemin)
			o.icon_state = "0"

		if(o.Num < o.Rangemax && o.Num > o.Rangemin)
			var/n = o.Num - o.Rangemin
			o.icon_state = "[n]"



mob
	proc/UpdateChakraResevoir()
		set background = 1
		// Compares the percentage of the
		if(!src.client||!src in OnlinePlayers)
			return
		for(var/obj/HUD/ChakraResevoirCircle/O in src.client.screen)
			O.Num = round((src.ChakraPool/src.MaxChakraPool)*O.Width)// each objects, then sets icon
			if(O.Num >= O.Rangemax)                // state accordingly
				O.icon_state = "32"
			if(O.Num <= O.Rangemin)
				O.icon_state = "0"
			if(O.Num < O.Rangemax && O.Num > O.Rangemin)
				var/newnum = O.Num - O.Rangemin
				O.icon_state = "[newnum]"

mob
	proc/UpdateStruggle()
		set background = 1
		// Compares the percentage of the
		if(!src.client)
			return
		for(var/obj/HUD/StruggleBar/O in src.client.screen)
			if(src.StruggleAgainstDeath>0)
				O.Num = round((src.Struggle/src.StruggleAgainstDeath)*O.Width)// each objects, then sets icon
				if(O.Num >= O.Rangemax)                // state accordingly
					O.icon_state = "32"
				if(O.Num <= O.Rangemin)
					O.icon_state = "0"
				if(O.Num < O.Rangemax && O.Num > O.Rangemin)
					var/newnum = O.Num - O.Rangemin
					O.icon_state = "[newnum]"
			else
				O.icon_state="0"
mob
	proc/UpdateChakra()
		set background = 1
		// Compares the percentage of the
		if(!src.client)
			return
//Chakra THIS IS CHAKRA )))))) I need this to update ;o
		if(src.TypeOfHud=="Swirl")
			for(var/obj/HUD/ChakraCircle/A in src.client.screen)
				/*var/Percentage=round((src.chakra/src.Mchakra)*100,5)
				if(Percentage<0)
					Percentage=0
				if(Percentage>100)
					Percentage=100
				A.icon_state="[A.number]-[Percentage]"*/

				if(src.chakra>src.Mchakra*0.95)
					if(istype(A,/obj/HUD/ChakraCircle/Top1/))
						A.icon_state="glow1"
					if(istype(A,/obj/HUD/ChakraCircle/Top2/))
						A.icon_state="glow2"
					if(istype(A,/obj/HUD/ChakraCircle/Top3/))
						A.icon_state="glow3"
					if(istype(A,/obj/HUD/ChakraCircle/Top4/))
						A.icon_state="glow4"
					if(istype(A,/obj/HUD/ChakraCircle/Top5/))
						A.icon_state="glow5"
					if(istype(A,/obj/HUD/ChakraCircle/Top6/))
						A.icon_state="glow6"
					if(istype(A,/obj/HUD/ChakraCircle/Top7/))
						A.icon_state="glow7"
					if(istype(A,/obj/HUD/ChakraCircle/Top8/))
						A.icon_state="glow8"
					if(istype(A,/obj/HUD/ChakraCircle/Top9/))
						A.icon_state="glow9"
				if(src.chakra>src.Mchakra*0.75&&src.chakra<=src.Mchakra*0.95)
					if(istype(A,/obj/HUD/ChakraCircle/Top1/))
						sleep(2);flick("glow1",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top2/))
						sleep(2);flick("glow2",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top3/))
						sleep(2);flick("glow3",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top4/))
						sleep(2);flick("glow4",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top5/))
						sleep(2);flick("glow5",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top6/))
						sleep(2);flick("glow6",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top7/))
						sleep(2);flick("glow7",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top8/))
						sleep(2);flick("glow8",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top9/))
						sleep(2);flick("glow9",A)
				if(src.chakra>src.Mchakra*0.25&&src.chakra<=src.Mchakra*0.75)
					if(istype(A,/obj/HUD/ChakraCircle/Top1/))
						A.icon_state="1"
					if(istype(A,/obj/HUD/ChakraCircle/Top2/))
						A.icon_state="2"
					if(istype(A,/obj/HUD/ChakraCircle/Top3/))
						A.icon_state="3"
					if(istype(A,/obj/HUD/ChakraCircle/Top4/))
						A.icon_state="4"
					if(istype(A,/obj/HUD/ChakraCircle/Top5/))
						A.icon_state="5"
					if(istype(A,/obj/HUD/ChakraCircle/Top6/))
						A.icon_state="6"
					if(istype(A,/obj/HUD/ChakraCircle/Top7/))
						A.icon_state="7"
					if(istype(A,/obj/HUD/ChakraCircle/Top8/))
						A.icon_state="8"
					if(istype(A,/obj/HUD/ChakraCircle/Top9/))
						A.icon_state="9"
				if(src.chakra<=src.Mchakra*0.25&&src.chakra>0)
					if(istype(A,/obj/HUD/ChakraCircle/Top1/))
						flick("flick1",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top2/))
						flick("flick2",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top3/))
						flick("flick3",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top4/))
						flick("flick4",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top5/))
						flick("flick5",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top6/))
						flick("flick6",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top7/))
						flick("flick7",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top8/))
						flick("flick8",A)
					if(istype(A,/obj/HUD/ChakraCircle/Top9/))
						flick("flick9",A)
				if(src.chakra<=0)
					if(istype(A,/obj/HUD/ChakraCircle/Top1/))
						A.icon_state="dead1"
					if(istype(A,/obj/HUD/ChakraCircle/Top2/))
						A.icon_state="dead2"
					if(istype(A,/obj/HUD/ChakraCircle/Top3/))
						A.icon_state="dead3"
					if(istype(A,/obj/HUD/ChakraCircle/Top4/))
						A.icon_state="dead4"
					if(istype(A,/obj/HUD/ChakraCircle/Top5/))
						A.icon_state="dead5"
					if(istype(A,/obj/HUD/ChakraCircle/Top6/))
						A.icon_state="dead6"
					if(istype(A,/obj/HUD/ChakraCircle/Top7/))
						A.icon_state="dead7"
					if(istype(A,/obj/HUD/ChakraCircle/Top8/))
						A.icon_state="dead8"
					if(istype(A,/obj/HUD/ChakraCircle/Top9/))
						A.icon_state="dead9"
		if(src.TypeOfHud=="Classic")
			for(var/obj/HUD/ChakraCircleClassic/A in src.client.screen)
				if(src.chakra>src.Mchakra*0.95)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top1/))
						A.icon_state="glow1"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top2/))
						A.icon_state="glow2"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top3/))
						A.icon_state="glow3"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top4/))
						A.icon_state="glow4"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top5/))
						A.icon_state="glow5"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top6/))
						A.icon_state="glow6"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top7/))
						A.icon_state="glow7"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top8/))
						A.icon_state="glow8"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top9/))
						A.icon_state="glow9"
				if(src.chakra>src.Mchakra*0.75&&src.chakra<=src.Mchakra*0.95)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top1/))
						sleep(2);flick("glow1",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top2/))
						sleep(2);flick("glow2",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top3/))
						sleep(2);flick("glow3",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top4/))
						sleep(2);flick("glow4",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top5/))
						sleep(2);flick("glow5",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top6/))
						sleep(2);flick("glow6",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top7/))
						sleep(2);flick("glow7",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top8/))
						sleep(2);flick("glow8",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top9/))
						sleep(2);flick("glow9",A)
				if(src.chakra>src.Mchakra*0.25&&src.chakra<=src.Mchakra*0.75)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top1/))
						A.icon_state="1"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top2/))
						A.icon_state="2"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top3/))
						A.icon_state="3"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top4/))
						A.icon_state="4"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top5/))
						A.icon_state="5"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top6/))
						A.icon_state="6"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top7/))
						A.icon_state="7"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top8/))
						A.icon_state="8"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top9/))
						A.icon_state="9"
				if(src.chakra<=src.Mchakra*0.25&&src.chakra>0)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top1/))
						flick("flick1",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top2/))
						flick("flick2",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top3/))
						flick("flick3",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top4/))
						flick("flick4",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top5/))
						flick("flick5",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top6/))
						flick("flick6",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top7/))
						flick("flick7",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top8/))
						flick("flick8",A)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top9/))
						flick("flick9",A)
				if(src.chakra<=0)
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top1/))
						A.icon_state="dead1"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top2/))
						A.icon_state="dead2"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top3/))
						A.icon_state="dead3"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top4/))
						A.icon_state="dead4"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top5/))
						A.icon_state="dead5"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top6/))
						A.icon_state="dead6"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top7/))
						A.icon_state="dead7"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top8/))
						A.icon_state="dead8"
					if(istype(A,/obj/HUD/ChakraCircleClassic/Top9/))
						A.icon_state="dead9"
		spawn(1)
			src.UpdateInv()
mob/proc/UpdateChakra2()
	set background = 1
	if(!src.client)
		return
	var/num=0
	for(var/obj/HUD/ChakraCircle/A in src.client.screen)
		/*var/Percentage=round((src.chakra/src.Mchakra)*100,5)
		if(Percentage<0)
			Percentage=0
		if(Percentage>100)
			Percentage=100
		A.icon_state="[A.number]-[Percentage]"*/
		if(src.chakra>=src.Mchakra)
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-100"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-100"
		else if(src.chakra>src.Mchakra*0.95&&src.chakra<src.Mchakra)
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-95"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-95"
		else if(src.chakra>src.Mchakra*0.90&&src.chakra<=src.Mchakra*0.95)
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-90"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-90"
		else if(src.chakra>src.Mchakra*0.85&&src.chakra<=src.Mchakra*0.90)
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-85"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-85"
		else if(src.chakra>src.Mchakra*0.80&&src.chakra<=src.Mchakra*0.85)
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-80"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-80"
		else if(src.chakra>src.Mchakra*0.75&&src.chakra<=src.Mchakra*0.80)
			num=75
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.70&&src.chakra<=src.Mchakra*0.75)
			num=70
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.65&&src.chakra<=src.Mchakra*0.70)
			num=65
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.60&&src.chakra<=src.Mchakra*0.65)
			num=60
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.55&&src.chakra<=src.Mchakra*0.60)
			num=55
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.50&&src.chakra<=src.Mchakra*0.55)
			num=50
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.45&&src.chakra<=src.Mchakra*0.50)
			num=45
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.40&&src.chakra<=src.Mchakra*0.45)
			num=40
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.35&&src.chakra<=src.Mchakra*0.40)
			num=35
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.30&&src.chakra<=src.Mchakra*0.35)
			num=30
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.25&&src.chakra<=src.Mchakra*0.30)
			num=25
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.20&&src.chakra<=src.Mchakra*0.25)
			num=20
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.15&&src.chakra<=src.Mchakra*0.2)
			num=15
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.10&&src.chakra<=src.Mchakra*0.15)
			num=10
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra>src.Mchakra*0.05&&src.chakra<=src.Mchakra*0.1)
			num=5
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
		else if(src.chakra<=0)//>src.Mchakra*0.05&&src.chakra<=src.Mchakra*0.1)
			num=0
			if(istype(A,/obj/HUD/ChakraCircle/Top1/))
		//		A.icon_state="glow1"
				A.icon_state="1-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top2/))
			//	A.icon_state="glow2"
				A.icon_state="2-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top3/))
			//	A.icon_state="glow3"
				A.icon_state="3-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top4/))
			//	A.icon_state="glow4"
				A.icon_state="4-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top5/))
			//	A.icon_state="glow5"
				A.icon_state="5-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top6/))
		//		A.icon_state="glow6"
				A.icon_state="6-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top7/))
			//	A.icon_state="glow7"
				A.icon_state="7-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top8/))
			//	A.icon_state="glow8"
				A.icon_state="8-[num]"
			if(istype(A,/obj/HUD/ChakraCircle/Top9/))
			//	A.icon_state="glow9"
				A.icon_state="9-[num]"
//	spawn(8)
//		src.UpdateInv()

mob/proc/UpdateInv()
	set background = 1
	if(!src.client)
		return
	var/I = 0
	for(var/obj/O in src.contents)//Loop through all the items in the players contents
		winset(src, "InventoryStuff.inventory", "current-cell=1,[++I]")	//Add multiple cells horizontally for each obj
		src << output(O, "InventoryStuff.inventory")//Send the obj's in src.contents to the Grid
	winset(src,"InventoryStuff.inventory", "cells=[I]")
	if(!src.controlled)
		var/X=0
		for(var/obj/SkillCards/O in src.LearnedJutsus)//Loop through all the items in the players contents
			winset(src, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
			src << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
		winset(src,"Jutsu.Jutsus", "cells=[X]")

mob/proc/UpdateCards()
	set background = 1
	if(!src.client)
		return
	if(!src.controlled)
		var/X=0
		for(var/obj/SkillCards/O in src.LearnedJutsus)//Loop through all the items in the players contents
			winset(src, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
			src << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
		winset(src,"Jutsu.Jutsus", "cells=[X]")
