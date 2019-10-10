mob/
	..()
	src.AFKC1()


mob/proc
	Huds()
		src.UpdateLV()
	UpdateLV()
		for(var/obj/Hudz/LvlText/L in src.client.screen)
			del L
		UpdateLvl(4,16,2,8,"L")
		UpdateLvl(5,8,2,6,"[src.SwordLevel]")
mob/proc
	AddHud()
	/*	src.client.screen+=new/obj/HUD/HealthSegment/Part1
		src.client.screen+=new/obj/HUD/HealthSegment/Part2
		src.client.screen+=new/obj/HUD/HealthSegment/Part3
		src.client.screen+=new/obj/HUD/HealthSegment/Part4
		src.client.screen+=new/obj/HUD/HealthSegment/Part5
		src.client.screen+=new/obj/HUD/StaminaSegment/Part1
		src.client.screen+=new/obj/HUD/StaminaSegment/Part2
		src.client.screen+=new/obj/HUD/StaminaSegment/Part3
		src.client.screen+=new/obj/HUD/StaminaSegment/Part4
		src.client.screen+=new/obj/HUD/StaminaSegment/Part5
		//Testing lul
		*/
		src.client.screen+=new/obj/HUD/HealthCircle/Part1
		src.client.screen+=new/obj/HUD/HealthCircle/Part2
		src.client.screen+=new/obj/HUD/HealthCircle/Part3
		src.client.screen+=new/obj/HUD/HealthCircle/Part4
		src.client.screen+=new/obj/HUD/HealthCircle/Part5
		src.client.screen+=new/obj/HUD/HealthCircle/Part6
		src.client.screen+=new/obj/HUD/HealthCircle/Part7
		src.client.screen+=new/obj/HUD/HealthCircle/Part8
		src.client.screen+=new/obj/HUD/StaminaCircle/Part1
		src.client.screen+=new/obj/HUD/StaminaCircle/Part2
		src.client.screen+=new/obj/HUD/StaminaCircle/Part3
		src.client.screen+=new/obj/HUD/StaminaCircle/Part4
		src.client.screen+=new/obj/HUD/StaminaCircle/Part5
		src.client.screen+=new/obj/HUD/StaminaCircle/Part6
		src.client.screen+=new/obj/HUD/StaminaCircle/Part7
		src.client.screen+=new/obj/HUD/StaminaCircle/Part8
/*
		src.client.screen+=new/obj/HUD/HealthCircle/Part1
		src.client.screen+=new/obj/HUD/HealthCircle/Part2
		src.client.screen+=new/obj/HUD/HealthCircle/Part3
		src.client.screen+=new/obj/HUD/HealthCircle/Part4
		src.client.screen+=new/obj/HUD/HealthCircle/Part5
		src.client.screen+=new/obj/HUD/HealthCircle/Part6
		src.client.screen+=new/obj/HUD/HealthCircle/Part7
		src.client.screen+=new/obj/HUD/HealthCircle/Part8
*/
		src.client.screen+=new/obj/HUD/ChakraRim/Part1
		src.client.screen+=new/obj/HUD/ChakraRim/Part2
		src.client.screen+=new/obj/HUD/ChakraRim/Part3
	//	src.client.screen+=new/obj/HUD/ChakraRim/Part4
		src.client.screen+=new/obj/HUD/ChakraRim/Part5
		src.client.screen+=new/obj/HUD/ChakraRim/Part6
		src.client.screen+=new/obj/HUD/ChakraRim/Part7
		src.client.screen+=new/obj/HUD/ChakraRim/Part8

		src.client.screen+=new/obj/HUD/ChakraRim/Part11
		src.client.screen+=new/obj/HUD/ChakraRim/Part12
		src.client.screen+=new/obj/HUD/ChakraRim/Part13
	//	src.client.screen+=new/obj/HUD/ChakraRim/Part14
		src.client.screen+=new/obj/HUD/ChakraRim/Part15
		src.client.screen+=new/obj/HUD/ChakraRim/Part16
		src.client.screen+=new/obj/HUD/ChakraRim/Part17
		src.client.screen+=new/obj/HUD/ChakraRim/Part18

	//	src.client.screen.Add(new/obj/HUD/Wound/Part1, new/obj/HUD/Wound/Part2, new/obj/HUD/Wound/Part3, new/obj/HUD/Wound/Part4, new/obj/HUD/Wound/Part5)
	//	src.client.screen+=new/obj/HUD/Palletewood

	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top1
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top2
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top3
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top4
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top5
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top6
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top7
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top8
	//	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top9


		src.client.screen+=new/obj/HUD/ChakraCircle/Top1
		src.client.screen+=new/obj/HUD/ChakraCircle/Top2
		src.client.screen+=new/obj/HUD/ChakraCircle/Top3
		src.client.screen+=new/obj/HUD/ChakraCircle/Top4
		src.client.screen+=new/obj/HUD/ChakraCircle/Top5
		src.client.screen+=new/obj/HUD/ChakraCircle/Top6
		src.client.screen+=new/obj/HUD/ChakraCircle/Top7
		src.client.screen+=new/obj/HUD/ChakraCircle/Top8
		src.client.screen+=new/obj/HUD/ChakraCircle/Top9
		src.client.screen+=new/obj/HUD/StruggleBar/Bottom
		src.client.screen+=new/obj/HUD/StruggleBar/Top
		//src.client.screen+=new/obj/HUD/HotKeys

		//Appearances HUD
		src.client.screen+=new/obj/HUD/ExtraHUD/Part1
		src.client.screen+=new/obj/HUD/ExtraHUD/Part2
		src.client.screen+=new/obj/HUD/ExtraHUD/Part3
		src.client.screen+=new/obj/HUD/ExtraHUD/Part4
		src.client.screen+=new/obj/HUD/ExtraHUD/Part5
		src.client.screen+=new/obj/HUD/ExtraHUD/Part6
		src.client.screen+=new/obj/HUD/ExtraHUD/Part7
		//src.client.screen+=new/obj/Hudz/LvlText
		if(src.NosinasisMemoriaMember)
			src.client.screen+=new/obj/Hudz/LvlText
		//HotSlots. Much more efficient.
		src.UpdateQuickSlots()

		//Appearances HUD

		//Options
	//	src.client.screen+=new/obj/HUD/Adjustments/Options
mob/proc

	UpdateLvl(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/word)
		var/firstpos=0
		while(src)
			firstpos+=1
			var/letter=copytext(word,firstpos,firstpos+1)
			if(letter==" ")
				hudxpix+=8
				continue
			if(word!="L")
				if(src.SwordLevel>=20)
					if(firstpos!=1)
						hudxpix+=5
			if(letter=="")
				return
			src.client.screen+=new/obj/Hudz/LvlText(hudx,hudxpix,hudy,hudypix,letter)
			hudxpix+=8
			if(hudxpix>=24)
				hudxpix=(32-hudxpix)*-1
				hudx+=1

obj/Hudz
	LvlText
		icon='LevelHud.dmi'
		name="Level"
		New(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/IS)
			src.layer+=2
			src.icon_state=IS
			src.screen_loc = "[hudx]:[hudxpix],[hudy]:[hudypix]"
mob/var
	afkx=0
	afky=0
	afkz=0
	aflagged=0
///sword level///
	SwordLevel=1
mob
	proc
		AFKC1()
			set background=1
			while(src)
				if(src.loggedin)
					src.afkx=src.x
					src.afky=src.y
					src.afkz=src.z
					sleep(6000)
					if(src.x==src.afkx&&src.y==src.afky&&src.afkz==src.z&&!src.aflagged)//&&src.alreadytalkingtohim)
						src.aflagged=1
						src.afkx=null
						src.afky=null
						src.afkz=null
						src<<output("You were flagged AFK. You should be in constant moving so you don't have to be flagged.","Attack")
					else
						..()
				else ..()
				break
			sleep(600)
			src.AFKC1()
//	Move()
//		..()
//		if(src.aflagged)
//			src<<output("You are no longer flagged.","Attack")
//			src.aflagged=0