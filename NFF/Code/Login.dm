turf/CreationScreen
	layer=1000
	TitleScreen
		density=1
		icon='PNG/screen.dmi'
		icon_state="1"
		Click()
			if(usr.loggedin)
				return
			var/count=0
			for(var/obj/CreationScreen/NewGame/A in usr.client.screen)
				count+=1
			for(var/obj/CreationScreen/LoadGame/B in usr.client.screen)
				count+=1
			for(var/obj/CreationScreen/DelGame/C in usr.client.screen)
				count+=1
			if(count<2)
				usr<<sound('SFX/click1.wav',0)
				usr.client.screen+=new/obj/CreationScreen/NewGame
				usr.client.screen+=new/obj/CreationScreen/LoadGame
				usr.client.screen+=new/obj/CreationScreen/DelGame
	TitleScreen2
		density=1
		icon='PNG/screen.dmi'
		icon_state="2"
		Click()
			if(usr.loggedin)
				return
			var/count=0
			for(var/obj/CreationScreen/NewGame/A in usr.client.screen)
				count+=1
			for(var/obj/CreationScreen/LoadGame/B in usr.client.screen)
				count+=1
			for(var/obj/CreationScreen/DelGame/C in usr.client.screen)
				count+=1
			if(count<2)
				usr<<sound('SFX/click1.wav',0)
				usr.client.screen+=new/obj/CreationScreen/NewGame
				usr.client.screen+=new/obj/CreationScreen/LoadGame
				usr.client.screen+=new/obj/CreationScreen/DelGame
	TitleScreen3
		density=1
		icon='PNG/screen.dmi'
		icon_state="3"
		Click()
//			usr.loc=locate(11,10,20)
//			usr<<sound('SFX/click1.wav',0)
			if(usr.loggedin)
				return
			var/count=0
			for(var/obj/CreationScreen/NewGame/A in usr.client.screen)
				count+=1
			for(var/obj/CreationScreen/LoadGame/B in usr.client.screen)
				count+=1
			for(var/obj/CreationScreen/DelGame/C in usr.client.screen)
				count+=1
			if(count<2)
				usr<<sound('SFX/click1.wav',0)
				usr.client.screen+=new/obj/CreationScreen/NewGame
				usr.client.screen+=new/obj/CreationScreen/LoadGame
				usr.client.screen+=new/obj/CreationScreen/DelGame
	WaitingScreen
		density=1
		icon='PNG/Waiting Screen.png'
		layer=105
obj/CreationScreen/NewGame
	icon='Icons/Hud/New.dmi'
	icon_state="1"
	screen_loc="10,10"
	layer=1001
	New()
		..()
		overlays+=/obj/CreationScreen/NewGame/A
		overlays+=/obj/CreationScreen/NewGame/B
	Click()
		var/firstletter=copytext(usr.ckey, 1, 2)
		if(fexists("Saves/[firstletter]/[usr.ckey].sav"))
			usr<<"You have a character on this server. Delete it if you want to create a new character!";return
		else
			if(usr.client.Creating)
				return 0
			if(usr.loggedin)
				usr<<"The game believes you logged in, by that logic you can't create a new character. If you are logging in, please wait patiently for it is loading. Otherwise, relog and try again <b>without pressing the load button.</b>";return
			usr<<sound('SFX/click1.wav',0)
			usr.loc=locate(1,1,1)
			usr.client.Creating=1
			usr.loc=locate(10,10,1)
			usr<<"Choose your Village. After choosing your Village you will be directed to the Clan screen in which you can go back if you change your mind."
			for(var/obj/CreationScreen/LoadGame/A in usr.client.screen)
				del(A)
			for(var/obj/CreationScreen/DelGame/C in usr.client.screen)
				del(C)
			for(var/obj/CreationScreen/NewGame/B in usr.client.screen)
				del(B)
	A
		layer=1001
		icon_state="2";pixel_x = 32
	B
		layer=1001
		icon_state="3";pixel_x = 64
turf/CreationScreen/Kakashi
	icon='Icons/Hud/hudfade.dmi'
	icon_state="Kakashi1"
turf/CreationScreen/Kakashi2
	icon='Icons/Hud/hudfade.dmi'
	icon_state="Kakashi2"
turf/CreationScreen/Beta
	icon='Icons/Hud/hudfade.dmi'
	icon_state="Beta"
mob/var/tmp/clickedloadyet=0
mob/var/tmp/GetsBenefits=0
var/TextCheck2="thefather"
obj/CreationScreen/LoadGame
	icon='Icons/Hud/Load.dmi'
	icon_state="1"
	screen_loc="13,10"
	layer=1001
	New()
		..()
		overlays+=/obj/CreationScreen/LoadGame/A
		overlays+=/obj/CreationScreen/LoadGame/B
	Click()
		if(usr.loggedin)
			usr<<"Loading..."
			return
		usr<<sound('SFX/click1.wav',0)
		usr.LoadPlayer()
		for(var/obj/CreationScreen/NewGame/A in usr.client.screen)
			del(A)
		for(var/obj/CreationScreen/DelGame/C in usr.client.screen)
			del(C)
		for(var/obj/CreationScreen/LoadGame/B in usr.client.screen)
			del(B)
	A
		layer=1001
		icon_state="2";pixel_x = 32
	B
		layer=1001
		icon_state="3";pixel_x = 64
obj/CreationScreen/DelGame
	icon='Icons/Hud/Del.dmi'
	icon_state="1"
	screen_loc="16,10"
	layer=1001
	New()
		..()
		overlays+=/obj/CreationScreen/DelGame/A
		overlays+=/obj/CreationScreen/DelGame/B
	Click()
		if(usr.loggedin)
			usr<<"The game believes your character is logged in, meaning it is probably loading at the time. Please wait, and if nothing happens relog and try again <b>without pressing the load button.</b>";return
		usr<<sound('SFX/click1.wav',0)
		usr.DeleteChar()
	A
		layer=1001
		icon_state="2";pixel_x = 32
	B
		layer=1001
		icon_state="3";pixel_x = 64
obj/CreationScreen/QuitGame
	icon='Icons/Hud/Quit.dmi'
	icon_state="1"
	screen_loc="11,15"
	layer=1001
	New()
		..()
		overlays+=/obj/CreationScreen/QuitGame/A
		overlays+=/obj/CreationScreen/QuitGame/B
	Click()
		usr<<sound('SFX/click1.wav',0)
		if(usr.loggedin)
			usr<<"The game believes your character is logged in, meaning it is probably loading at the time. Please wait, and if nothing happens relog and try again <b>without pressing the load button.</b>";return
		usr.DeleteChar()
	A
		layer=1001
		icon_state="2";pixel_x = 32
	B
		layer=1001
		icon_state="3";pixel_x = 64


mob/proc
	TakeAwayVillVar()
		src.Village=""
		src.BeginningVillage=""
		src.villageselected=1
turf/LoginScreen/RealStart
	density=1
	layer=999
	Click()
		var/firstletter=copytext(usr.ckey, 1, 2)
		if(fexists("Saves/[firstletter]/[usr.ckey].sav"))
			usr<<"You have a character on this server. Delete it if you want to create a new character!"
			return
		else
			if(usr.client.Creating)
				return 0
			usr.client.Creating=1
			usr.loc=locate(10,10,1)
mob/proc
	BoyOrGirl()
		switch(input(src,"Are you a Male or Female?",text)in list("Male","Female"))
			if("Male")
				src.Gender="Male"
			if("Female")
				src.Gender="Female"
		if(src.Clan=="Hoshigaki"|src.Clan=="Ketsueki")
			src.icon=null
			sleep(1)
			var/Base='Icons/New Base/Base.dmi'
			if(src.Clan=="Hoshigaki")
				Base+=rgb(102,114,142)
			if(src.Clan=="Ketsueki")
				Base+=rgb(156,156,156)
			src.icon=Base
			src.baseselected=1
			if(src.Gender=="Male")
				src.overlays-='Icons/New Base/Clothing/Panties.dmi'
				src.overlays-='Icons/New Base/Clothing/Bra.dmi'
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/FemaleEyes.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
			if(src.Gender=="Female")
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/Clothing/Panties.dmi'
				src.overlays+='Icons/New Base/Clothing/Panties.dmi'
				src.overlays-='Icons/New Base/Clothing/Bra.dmi'
				src.overlays+='Icons/New Base/Clothing/Bra.dmi'
				src.overlays-='Icons/New Base/FemaleEyes.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/FemaleEyes.dmi'
		return
turf/CreationScreen/Village
	icon='Icons/Hud/VillageSymbol.dmi'
	Leaf
		icon_state="Leaf"
		Click()
			usr<<sound('SFX/click1.wav',0)
			if(usr.loggedin)
				usr<<"Weird, pretty confident you have a character already."
				return
			usr<<"The Leaf Village is a famous Village for its will of fire it incoporates\
			 upon its Villagers. The Leaf's fire grows stronger each second, holding some of the most diverse Clans."
			usr.loc=locate(10,32,1)
			usr.TakeAwayVillVar()
			usr.Village="Leaf"
			usr.BeginningVillage="Leaf"
			usr.villageselected=1
	Rain
		icon_state="Rain"
		Click()
			usr<<sound('SFX/click1.wav',0)
			if(usr.loggedin)
				usr<<"Weird, pretty confident you have a character already."
				return
			usr<<"The Rain Village is a village off upon the water that\
			 survived the war, taking in the Mist Village. The Rain Village is known \
			 for its powerful ninja holding Kekkai Genkai and their cold-rain attitudes."
			usr.loc=locate(30,32,1)
			usr.TakeAwayVillVar()
			usr.Village="Rain"
			usr.BeginningVillage="Rain"
			usr.villageselected=1
	Rock
		icon_state="Rock"
		Click()
			usr<<sound('SFX/click1.wav',0)
			if(usr.loggedin)
				usr<<"Weird, pretty confident you have a character already."
				return
			usr<<"The Rock Village is the highest up north village in the game,\
			also being the safest within their great endurance. The ninja there are tough like a rock being very powerful in military and strength.\
			During the war they survived, taking in both Cloud and Sand."
			usr.loc=locate(50,32,1)
			usr.TakeAwayVillVar()
			usr.Village="Rock"
			usr.BeginningVillage="Rock"
			usr.villageselected=1
	Sound
		icon_state="Sound"
		Click()
			usr<<sound('SFX/click1.wav',0)
			if(usr.loggedin)
				usr<<"Weird, pretty confident you have a character already."
				return
			usr<<"The Sound Village is a powerful and tactical village.\
			The ninja of Sound are very intellectual and the master village of Medical Arts. \
			Experimentation always occurs within Sound."
			usr.loc=locate(70,32,1)
			usr.TakeAwayVillVar()
			usr.Village="Sound"
			usr.BeginningVillage="Sound"
			usr.villageselected=1
mob/proc/GoNext()
	usr.loc=locate(122,10,20)
	usr.BoyOrGirl()
	usr<<output("Please Select A Skin Shade and A Hair Style and Shade. To Update the Hair Color, click on the color blocks then click on your hair of choice.","Attack")
	usr<<"<font color = blue size = 2>These are the sample hairstyles. There are more styles available for a cost at a barber in your village.</font>";return

turf/CreationScreen/Clans
	icon='Icons/Hud/ClanSelect.dmi'
	layer=MOB_LAYER+98
	Select
		icon_state="Select"
		layer=MOB_LAYER+98
		Select1
			icon='Icons/Hud/BaseSelectStuff.dmi'
			icon_state="Select1"
		Select2
			icon='Icons/Hud/BaseSelectStuff.dmi'
			icon_state="Select2"
		Select3
			icon='Icons/Hud/BaseSelectStuff.dmi'
			icon_state="Select3"
		Select4
			icon='Icons/Hud/BaseSelectStuff.dmi'
			icon_state="Select4"
	Next
		icon='Icons/Hud/ClanSymbol.dmi'
		icon_state="Back"
		Click()
			usr.loc=locate(10,10,1)
	Basic
		icon='Icons/Hud/ClanSymbol.dmi'
		icon_state="Basic"
		var/Selected=0
		Click()
			usr<<sound('SFX/click1.wav',0)
			if(usr.loggedin)
				usr<<"Weird, pretty confident you have a character already."
				return
			switch(input(usr,"Choosing Basic Ninja has alot advantages now including increased passive caps and being able to fully customize your character to specialize in any area and excel better than someone of a clan.. Are you sure you wish to choose Basic?", text) in list ("Yes","No"))
				if("Yes")
					usr.Clan="Basic"
					usr.StartingPoints=55
					usr.GoNext()
	Leaf
		Aburame
			icon_state="Aburame"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(10,52,1)
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Aburame")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Aburame"
					usr.GoNext()
		Kurisutaru
			icon_state="Kurisutaru"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(117,30,1)
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Aburame")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Kurisutaru"
					usr.GoNext()
		Akimichi
			icon_state="Akimichi"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(30,52,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Akimichi")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Akimichi"
					usr.GoNext()
		Hyuuga
			icon_state="Hyuuga"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(50,52,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Hyuuga")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Hyuuga"
					usr.GoNext()
		Inuzuka
			icon_state="Inuzuka"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(70,52,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Inuzuka")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Inuzuka"
					usr.GoNext()
		Kusakin
			icon_state="Kusakin"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(90,52,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Kusakin")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Kusakin"
					usr.GoNext()
		Yogan
			icon_state="Yogan"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(136,49,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Yogan")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Yogan"
					usr.GoNext()
		Kurama
			icon_state="Kurama"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		Nara
			icon_state="Nara"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(110,52,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Nara")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Nara"
					usr.GoNext()
		Yamanaka
			icon_state="Yamanaka"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
	Rock
		Iwazuka
			icon_state="Iwazuka"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(10,92,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Iwazuka")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Iwazuka"
					usr.GoNext()
		Jinmetsu
			icon_state="Jinmetsu"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		Kamizuru
			icon_state="Kamizuru"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		Kagami
			icon_state="Kagami"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		Kiro
			icon_state="Kiro"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(30,92,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Kiro")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Kiro"
					usr.GoNext()
		Sabaku
			icon_state="Sabaku"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(50,92,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Sabaku")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Sabaku"
					usr.GoNext()
		Satou
			icon_state="Satou"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(70,92,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Satou")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Satou"
					usr.GoNext()
		Shinto
			icon_state="Shinto"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
	Rain
		Fuuma
			icon_state="Fuuma"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(10,72,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Fuuma")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Fuuma"
					usr.GoNext()
		Haku
			icon_state="Shiroi"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(130,72,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Shiroi")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Shiroi"
					usr.GoNext()
		Hoshigaki
			icon_state="Hoshigaki"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(30,72,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Hoshigaki")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Hoshigaki"
					usr.GoNext()
		Ketsueki
			icon_state="Ketsueki"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(50,72,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Ketsueki")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Ketsueki"
					usr.GoNext()
		Kiri
			icon_state="Kiri"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		Kyomou
			icon_state="Kyomou"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(70,72,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Kyomou")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Kyomou"
					usr.GoNext()
		Luna
			icon_state="Luna"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
	Sound
		Kumojin
			icon_state="Kumojin"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(30,112,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Kumojin")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Kumojin"
					usr.GoNext()
		Kaguya
			icon_state="Kaguya"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(10,112,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Kaguya")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Kaguya"
					usr.GoNext()
		Itohara
			icon_state="Itohara"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		Yotsuki
			icon_state="Yotsuki"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(70,112,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Yotsuki")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Yotsuki"
					usr.GoNext()
		Ningyo
			icon_state="Ningyo"
			Click()
				if(usr.loggedin)
					usr<<"Estranho. Parece que você ja tem um char."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(49,33,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Ningyo")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Ningyo"
					usr.GoNext()
		Uchiha
			icon_state="Uchiha"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(50,112,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Uchiha")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
			Description
				icon='Icons/Hud/ClanDescription.dmi'
			Yes
				icon='Icons/Hud/ClanSymbol.dmi'
				icon_state="Yes"
				Click()
					usr.Clan="Uchiha"
					usr.GoNext()
		Urase
			icon_state="Urase"
//			Click()
			Description
				icon='Icons/Hud/ClanDescription.dmi'
		UchihaBom
			icon_state="Uchiha Branco"
			Click()
				if(usr.loggedin)
					usr<<"Weird, pretty confident you have a character already."
					return
				usr<<sound('SFX/click1.wav',0)
				usr.loc=locate(50,112,1)
				var/count=0
				for(var/mob/M in world)
					if(M.client&&M.Clan=="Uchiha")
						count++
				if(count>30)
					usr<<"There are currently [count] [src.name] on in case you want diversity."
turf/CreationScreen/ResetButton
	icon='Zanpakutou.dmi'
	icon_state="Reset"
	layer=106
	Click()
		usr.ResetStats()
mob/var/tmp/ResetStatsDelay=0
mob/proc/ResetStats()
	if(src.loggedin)
		world<<"<font color=red size=2>[src] ([src.key]) has attempted to abuse and reset their stats by glitching onto the Creation Screen. IP: [src.client.address].  ID: [src.client.computer_id]."
		return
	else if(src.ResetStatsDelay)
		return
	src.ResetStatsDelay=1
	spawn(50)
		src.ResetStatsDelay=0
	src<<"Your stats have been reset, and your starting points have returned to normal."
	src.TaiSkill=0;src.NinSkill=0;src.GenSkill=0
	src.StartingPoints=50
	if(src.Clan=="Basic")
		src.StartingPoints=55
turf/CreationScreen/Stats
	icon='Icons/Hud/JutsuTree.dmi'
	Physique
		icon_state="Physique"
		Click()
			if(usr.clicked||usr.loggedin)
				usr<<"You've already clicked 'Finished'. If you wish to adjust your stats, you'll need to exit out of this window and start over."
				return
			alert(usr,"What is your Physique? This will determine your damaged inflicted by physical attacks, and your overall Physical abilities(such as stamina.): 40 is the maximum you can use on this skill, 5 is the minimum, and you have a total of [usr.StartingPoints] points left.")
			var/Number=input(usr,"You have [usr.StartingPoints] Starting Points, how many points do you wish to put into your Physique?","Physique",5) as num
			if(Number<5)
				alert(usr,"Physique automatically set to 5 points.");Number=5
			if(Number>40)
				alert(usr,"Physique automatically set to 40 points.");Number=40
			if(usr.TaiSkill>Number)
				usr.StartingPoints+=(usr.TaiSkill-Number)
			if(Number>usr.StartingPoints)
				usr.ResetStats()
				alert(usr,"An error occurred. Stats reset.")
				return
			usr.TaiSkill=Number
			/*if(usr.key=="")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(210-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(200-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else if(usr.key=="")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(160-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(150-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else if(usr.key=="")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(90-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(80-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else*/
			if(usr.Clan=="Basic")
				usr.StartingPoints=(55-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else
				usr.StartingPoints=(50-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			usr<<"You have [usr.StartingPoints] remaining."
			..()
	Capacity
		icon_state="Capacity"
		Click()
			if(usr.clicked||usr.loggedin)
				usr<<"You've already clicked 'Finished'. If you wish to adjust your stats, you'll need to exit out of this window and start over."
				return
			alert(usr,"What is your Capacity? Your Capacity is the intensity of your chakra, thus the more of this you have the more damage your initial techniques involving chakra will perform and the maximum chakra you have.: 40 is the maximum you can use on this skill, 5 is the minimum, and you have a total of [usr.StartingPoints] points left.")
			var/Number=input(usr,"You have [usr.StartingPoints] Starting Points, how many points do you wish to put into your Capacity?","Capacity",5) as num
			if(Number<5)
				alert(usr,"Capacity automatically set to 5 points.");Number=5
			if(Number>40)
				alert(usr,"Capacity automatically set to 40 points.");Number=40
			if(usr.NinSkill>Number)
				usr.StartingPoints+=(usr.NinSkill-Number)
			if(Number>usr.StartingPoints)
				usr.ResetStats()
				alert(usr,"An error occurred. Stats reset.")
				return
			usr.NinSkill=Number
			/*if(usr.key=="Bishamon121")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(210-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(200-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else if(usr.key=="Hakudori")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(160-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(150-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else if(usr.key=="Shrouded Light")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(90-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(80-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else */
			if(usr.Clan=="Basic")
				usr.StartingPoints=(55-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else
				usr.StartingPoints=(50-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			usr<<"You have [usr.StartingPoints] remaining."
			..()
	Control
		icon_state="Control"
		Click()
			if(usr.clicked||usr.loggedin)
				usr<<"You've already clicked 'Finished'. If you wish to adjust your stats, you'll need to exit out of this window and start over."
				return
			alert(usr,"What is your Control? This stat is much different from your Chakra Control as it determines your overall ability to control your attacks, both Ninjutsu and Taijutsu. This also determines things involving control over your enemy such as Genjutsu since it involves controlling your opponent's chakra.: 40 is the maximum you can use on this skill, 5 is the minimum, and you have a total of [usr.StartingPoints] points left.")
			var/Number=input(usr,"You have [usr.StartingPoints] Starting Points, how many points do you wish to put into your Control?","Control",5) as num
			if(Number<5)
				alert(usr,"Control automatically set to 5 points.");Number=5
			if(Number>40)
				alert(usr,"Control automatically set to 40 points.");Number=40
			if(usr.GenSkill>Number)
				usr.StartingPoints+=(usr.GenSkill-Number)
			if(Number>usr.StartingPoints)
				usr.ResetStats()
				alert(usr,"An error occurred. Stats reset.")
				return
			usr.GenSkill=Number
			/*if(usr.key=="Bishamon121")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(210-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(200-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else if(usr.key=="Hakudori")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(160-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(150-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else if(usr.key=="Shrouded Light")
				if(usr.Clan=="Basic")
					usr.StartingPoints=(90-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
				else
					usr.StartingPoints=(80-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else */
			if(usr.Clan=="Basic")
				usr.StartingPoints=(55-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			else
				usr.StartingPoints=(50-usr.TaiSkill-usr.NinSkill-usr.GenSkill)
			usr<<"You have [usr.StartingPoints] remaining."
			..()
mob/var/tmp/clicked = 0
mob/var
	NinMutation=0
	TaiMutation=0
	GenMutation=0
mob/var/StartingPoints=50
mob/var/tmp/GoingThroughTutorial=0
turf/Finished
	icon='Icons/Hud/BaseSelectStuff.dmi'
	icon_state="Done"
	density=1
	Click()
		if(usr.clicked||usr.loggedin)
			return
		if(usr.TaiSkill<5||usr.NinSkill<5||usr.GenSkill<5)
			usr<<"One or more of your stats is less than the minimum, please take care of this then try finishing again."
			return
		if(usr.Clan!="Basic")//&&usr.key!="Bishamon121"&&usr.key!="Hakudori"&&usr.key!="Shrouded Light")
			if((usr.TaiSkill+usr.NinSkill+usr.GenSkill+usr.StartingPoints)>50)
				usr<<"Your point totals have gone over 50, so you must reset your stats and try again."
				return
		else//if(usr.key!="Bishamon121"&&usr.key!="Hakudori"&&usr.key!="Shrouded Light")
			if((usr.TaiSkill+usr.NinSkill+usr.GenSkill+usr.StartingPoints)>55)
				usr<<"Your point totals have gone over 55, so you must reset your stats and try again."
				return
		if(usr.choseeyes&&usr.baseselected)
			usr.clicked = 1
			usr.loc=locate(36,10,1)
			var/obj/QQ=new()
			QQ.icon='Zanpakutou.dmi';QQ.icon_state="Loading"
			QQ.loc=usr.loc;QQ.layer=106
			usr.ElementalCapacity=5
			/*Clans Chakra colors*/
			if(usr.Clan=="Kyomou")
				usr.ChakraColorR=180;usr.ChakraColorG=0;usr.ChakraColorB=0
			else if(usr.Clan=="Yotsuki")
				usr.ChakraColorR=255;usr.ChakraColorG=255;usr.ChakraColorB=0
			else
				usr.ChakraColorR=100;usr.ChakraColorG=100;usr.ChakraColorB=255
			usr.ChakraC=rand(50,75)
			if((prob(35)||usr.Clan=="Fuuma"))
				var/choice=rand(1,3)
				if(choice==1)
					usr.TaiSkill+=5;usr.Trait3="Tai Mutation"
				if(choice==2)
					usr.NinSkill+=5;usr.Trait3="Nin Mutation"
				if(choice==3)
					usr.GenSkill+=5;usr.Trait3="Gen Mutation"
			//var/B=rand(1,75)
			//if(B==5)
			//	usr.Trait2="Super Human Regeneration"
			if(usr.Clan=="Uchiha")
				var/Chance=50
				if(prob(Chance))
					usr.CanGetMangekyo=1
					var/ASA=list("kakashi","itachi","madara","sasuke","star","bladed","gridlock","shuriken","shisui")
					var/Mangekyo=pick(ASA);usr.mangekyouC=Mangekyo
			usr.HealthRegen=rand(3,7);usr.StaminaRegen=rand(3,7)
			usr.LearnedJutsus+= new /obj/SkillCards/BunshinJutsu
			usr.LearnedJutsus+= new /obj/SkillCards/Henge
			usr.LearnedJutsus+= new /obj/SkillCards/Kawarimi
			usr.LearnedJutsus+= new /obj/SkillCards/Shushin
			usr.LearnedJutsus+= new /obj/SkillCards/Choke
			if(usr.Clan=="Iwazuka")
				usr.LearnedJutsus+= new /obj/SkillCards/Katsu
				usr.LearnedJutsus+= new /obj/SkillCards/SetLeftHand
				usr.LearnedJutsus+= new /obj/SkillCards/SetRightHand
			if(usr.Clan=="Shiroi")
				usr.WaterE=1;usr.WindE=1;
				//if(!(usr.key in Subscribers))
				usr.ElementalPoints-=10
			if(usr.Clan=="Kusakin")
				usr.WaterE=1;usr.EarthE=1;
				//if(!(usr.key in Subscribers))
				usr.ElementalPoints-=10
			usr.NameChoose()
			usr.OOC=1
			usr.desc=""
		//	usr.Move_Delay=usr.Savedspeed
			usr.OOC = 1
			usr.Frozen = 0
			usr.sight &= ~BLIND
			usr.FrozenBind = ""
			usr.firing = 0
			usr.resting = 0
		//	usr.RuleGuide()
			usr.verbs+=typesof(/mob/GainedAfterLogIn/verb)
			usr.AddHud()
			usr.HungerAd()
			usr.ThirstAd()
			usr.RegenerationProc()
			usr.maxhealth=1500;usr.health=usr.maxhealth
		//	usr.maxstamina=2500+(usr.TaiSkill*35+usr.GenSkill*10)
			usr.maxstamina=2500+(usr.TaiSkill*40+usr.GenSkill*5)
			usr.Mchakra=2500+(usr.NinSkill*60+usr.GenSkill*20)
			usr.stamina=usr.maxstamina
			usr.chakra=usr.Mchakra
//			if(usr.key=="Trest95"||usr.key=="Ishuri")
//				usr.StartingPoints+=25
//			if(usr.key=="TheUndyingOne")
//				usr.maxstamina+=20000
//				usr.Mchakra+=20000
//				usr.DeclineAge=110
//			if(usr.key=="Mirandawashere")
//				usr.GenSkill+=5
//				usr.NinSkill+=5
//				usr.TaiSkill+=5
//				usr.Mchakra+=3000
//				usr.maxstamina+=3000
//				usr.StartingPoints+=15
//				usr.ElementalPoints+=60
//			if(usr.key=="")
//				usr.ElementalPoints+=30
				usr.StartingPoints+=30
			if(usr.Clan=="Aburame")
				if(usr.Mchakra>1500)
					usr.Mchakra-=rand(300,600);usr.chakra=usr.Mchakra
				var/Nanos=20
				if(usr.key in Subscribers)
					Nanos=60
				if(prob(Nanos))
					usr.Canlearnnanobugs=1
			if(usr.Clan=="Akimichi")
				var/Obese=20
				if(usr.key in Subscribers)
					Obese=60
				if(prob(Obese))
					usr.Trait3="Gluttony"
			if(usr.Clan=="Hoshigaki")
				usr.Mchakra+=2500;usr.chakra=usr.Mchakra
			if(usr.Clan=="Satou")
				usr.ChakraArmor+=10
			if(usr.Clan=="Basic")
				switch(usr.SecondName)
					if("Uzumaki")
						usr.Mchakra=rand(6000,8000);usr.chakra=usr.Mchakra
						usr.DeclineAge=rand(100,125)
					if("Hatake")
						usr.Mchakra=rand(2500,3500);usr.chakra=usr.Mchakra
						usr.maxstamina=rand(3000,3500);usr.stamina=usr.maxstamina
						usr.WhiteChakra=1
						usr.StartingPoints+=3
					if("Sarutobi")
						usr.maxstamina+=rand(1000,1600)
						usr.DeclineAge=rand(60,75)//75 80
					if("Haruno")
						usr.GenSkill+=rand(4,5)
						usr.ChakraC=100
					if("Namikaze")
						usr.NinSkill+=rand(4,6)
						usr.Acceleration=rand(3,6)
					if("Momochi")
						usr.TaiSkill+=rand(4,6)
						usr.MEndurance=150
					if("Irkashii")
						usr.maxstamina+=rand(1000,2200)
						usr.RunningSpeed=5
					if("Renden")
						usr.Mchakra+=rand(1100,2000);usr.chakra=usr.Mchakra
						usr.MEndurance=140//Was 200...My God again..
					if("Naga")
						usr.Mchakra=rand(500,1200);usr.chakra=usr.Mchakra
						usr.maxstamina=rand(9000,10000)
					if("Saru")
						usr.maxstamina+=rand(1000,1500);usr.stamina=usr.maxstamina
						usr.MEndurance=125
						usr.StartingPoints+=2
					if("Satake")
						usr.GenSkill+=rand(3,5)
						usr.StartingPoints+=1
					if("Enton")
						usr.NinSkill+=rand(6,8)
					if("Naiobatsu")
						usr.DeclineAge=rand(150,175)
						usr.HealthRegen=rand(20,30)
						usr.maxstamina-=rand(1000,2000)
						if(usr.maxstamina<750)
							usr.maxstamina=750;usr.stamina=750
					if("Bayamo")
						usr.WindChakra=24
					if("Crimson")
						usr.FireChakra=24
					if("Hozuki")
						usr.WaterChakra=22
					if("Bachi")
						usr.EarthChakra=24
					if("Ryouken")
						usr.LightningChakra=24
					if("Shimura")
						usr.GenjutsuSight=10
						usr.ChakraC=100
					if("Shiranui")
						usr.ChakraArmor=5
					if("Namiashi")
						usr.ThrowingStrength=5
					if("Terumi")
						usr.ElementalPoints+=13
						usr.TaiSkill-=rand(2,4)
					if("Kurosuki")
						usr.SpeedDice=5
						usr.GenSkill-=rand(2,3)
			//		if("Battle")
			//			usr.maxstamina+=rand(1000,2000)
			//			usr.GenSkill+=4
			//			usr.TaiSkill+=4
			//			usr.NinSkill+=4
					//if(usr.SecondName=="Ringo")
						//usr.DualWielding=1
					if("Suikazan")
						usr.Mchakra=rand(10000,15000);usr.chakra=usr.Mchakra
						usr.maxhealth=1000
					//if(usr.SecondName=="Morino")
						//
					if("Munashi")
						usr.Kenjutsu=25
						usr.MEndurance=90
					if("Akebino")
						usr.Kenjutsu=30;usr.SpeedDice=2;usr.SlashStrength=3
						usr.MEndurance=80
					if("Matsuro")
						usr.maxhealth=1200
						usr.NinSkill+=rand(2,5)
						usr.GenSkill+=rand(2,5)
						usr.DeclineAge-=50
						usr.Mchakra+=rand(1000,1500);usr.chakra=usr.Mchakra
						usr.maxstamina-=rand(100,900);usr.stamina=usr.maxstamina
						if(usr.maxstamina<750) {usr.maxstamina=750;usr.stamina=usr.maxstamina}
						usr.HealthRegen+=rand(10,20)
					if("Karsumu")
						usr.Mchakra+=10000;usr.chakra=usr.Mchakra
						usr.GenSkill+=rand(10,15)
						usr.DeclineAge=rand(20,25)
						usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon()
					else
						usr<<"As a result of using no special last name or creating a unique one, you have been given an additional 5 Starting Points! Thank you for being original."
						usr.StartingPoints+=5
					if(prob(1))
						usr.AbleToGetConversusin=1
			//Guest Check
			if(findtext(usr.key,"Guest",1,6))
				alert(usr,"You're almost done, but because you are using a BYOND Guest key you will need a Moderator's permission to enter the game. Click OK to send them a request message, or log out and create your own personal key at www.byond.com")
				SeekingApproval.Add(usr.name)
				world<<"<font color=red>Info:</font> [usr]/[usr.key] has been added to the Seeking Approval List. A Moderator or Admin must grant them game access before they can join the game."
				while(usr.name in SeekingApproval)
					sleep(50)
				world<<"<font color=red>Info:</font> [usr] has been granted access."
				usr<<"A moderator has granted you permission to enter. Enjoy the game!"
			//Assigns chakra colors to last names.
			if(usr.SecondName=="Hatake")
				usr.ChakraColorR=255;usr.ChakraColorG=255;usr.ChakraColorB=255
			else if(usr.SecondName=="Saru")
				usr.ChakraColorR=180;usr.ChakraColorG=180;usr.ChakraColorB=210
			else if(usr.SecondName=="Namikaze")
				usr.ChakraColorR=255;usr.ChakraColorG=255;usr.ChakraColorB=0
			else if(usr.SecondName=="Uzumaki")
				usr.ChakraColorR=100;usr.ChakraColorG=100;usr.ChakraColorB=84
			var/obj/Clothes/Shirt/YourNewVillageShirt=new()
			var/obj/Clothes/Pants/YourNewVillagePants=new()
			var/obj/Clothes/Shoes/YourNewVillageShoes=new()
			var/RedAmountForShirt=0
			var/GreenAmountForShirt=0
			var/BlueAmountForShirt=0
			if(usr.Village=="Leaf")
				GreenAmountForShirt=100
				RedAmountForShirt=61
				BlueAmountForShirt=61
			if(usr.Village=="Rain")
				GreenAmountForShirt=41
				RedAmountForShirt=55
				BlueAmountForShirt=122
			if(usr.Village=="Rock")
				GreenAmountForShirt=71
				RedAmountForShirt=101
				BlueAmountForShirt=37


			YourNewVillageShirt.shirtred=RedAmountForShirt
			YourNewVillageShirt.shirtgreen=GreenAmountForShirt
			YourNewVillageShirt.shirtblue=BlueAmountForShirt
			YourNewVillageShirt.loc=usr

			var/RedAmountForPants=0
			var/GreenAmountForPants=0
			var/BlueAmountForPants=0
			if(usr.Village=="Leaf")
				GreenAmountForPants=4
				RedAmountForPants=4
				BlueAmountForPants=85
			if(usr.Village=="Sound")
				GreenAmountForPants=150
				RedAmountForPants=150
				BlueAmountForPants=150
			YourNewVillagePants.shirtred=RedAmountForPants
			YourNewVillagePants.shirtgreen=GreenAmountForPants
			YourNewVillagePants.shirtblue=BlueAmountForPants
			YourNewVillagePants.loc=usr
			YourNewVillageShoes.loc=usr
			if(usr.client)
				if(!usr.Voice)
					if(usr.Gender=="Male")
						var/X=input("Voice Test?","Voice") in list ("Aizen","Hitsugaya","Gin","Ichigo","Naruto","Sasuke","Itachi","Neji","Link")
						usr.Voice=X
					if(usr.Gender=="Female")
						var/X=input("Voice Test?","Voice") in list ("Orihime","Soifon","Rukia")
						usr.Voice=X

		/*		if(usr.Clan=="Aburame")
					usr.loc=locate(130,183,1)
				else if(usr.Clan=="Akimichi")
					usr.loc=locate(104,183,1)
					usr.dir=NORTH
				else if(usr.Clan=="Fuuma")
					usr.loc=locate(137,25,29)
				else if(usr.Clan=="Hoshigaki")
					usr.loc=locate(174,9,29)
				else if(usr.Clan=="Hyuuga")
					usr.loc=locate(151,131,1)
				else if(usr.Clan=="Nara")
					usr.loc=locate(123,159,1)
				else if(usr.Clan=="Kusakin")
					usr.loc=locate(156,150,1)
	//Sound
				else if(usr.Clan=="Uchiha")
					usr.loc=locate(46,51,21)
				else if(usr.Clan=="Kumojin")
					usr.loc=locate(121,38,21)
				else if(usr.Clan=="Kaguya")
					usr.loc=locate(98,43,21)
				else
					if(usr.Village=="Leaf")
						usr.loc=locate(122,130,1)
					if(usr.Village=="Rain")
						usr.loc=locate(88,114,29)
					if(usr.Village=="Sound")
						usr.loc=locate(160,60,21)
					if(usr.Village=="Rock")
						usr.loc=locate(161,35,34)
						*/
				for(var/mob/M in world)
					if(M.Village==usr.Village)
						M<<"<font color = #BB0EDA>Informação da Vila:</font> [usr] has become a Genin of the village!"
				usr.rank ="Genin"
				usr.score=0
				var/obj/Clothes/Headband/BAA=new();BAA.loc=usr
				usr<<"You were given a couple of items to start your Genin career."
				usr.CanNavigate=1
				if(usr.Clan=="Uchiha")
					var/obj/Clothes/Uchiha_Crest/C = new()
					C.loc = usr
					usr.gottenuchihacrest=1
					usr<<"You've been given an Uchiha Crest Symbol to place on your clothing and show your clan pride."
				var/obj/WEAPONS/Kunai/AAA=new();AAA.ammount=10;AAA.loc=usr
				var/obj/WEAPONS/Shuriken/C=new();C.ammount=10;C.loc=usr
				var/obj/Food/Riceball/R=new();R.loc=usr
				var/obj/Food/Orange/O=new();O.loc=usr
				var/obj/Drinks/Water/W=new();W.loc=usr
				var/obj/Scrolls/GenerativeScroll/F=new();F.loc=usr
				usr.GuiaParIniciantes()
				if(usr.Clan=="Aburame")
					usr.loc=locate(130,183,1)
				else if(usr.Clan=="Akimichi")
					usr.loc=locate(104,183,1)
					usr.dir=NORTH
				else if(usr.Clan=="Fuuma")
					usr.loc=locate(82,5,41)
				else if(usr.Clan=="Hoshigaki")
					usr.loc=locate(160,60,21)
				else if(usr.Clan=="Hyuuga")
					usr.loc=locate(151,131,1)
				else if(usr.Clan=="Nara")
					usr.loc=locate(123,159,1)
				else if(usr.Clan=="Kusakin")
					usr.loc=locate(156,150,1)
			//Sound
				else if(usr.Clan=="Uchiha")
					usr.loc=locate(46,51,21)
				else if(usr.Clan=="Kumojin")
					usr.loc=locate(121,38,21)
				else if(usr.Clan=="Kaguya")
					usr.loc=locate(98,43,21)
				else
					if(usr.Village=="Leaf")
						usr.loc=locate(122,130,1)
					if(usr.Village=="Rain")
						usr.loc=locate(88,114,29)
					if(usr.Village=="Sound")
						usr.loc=locate(160,60,21)
					if(usr.Village=="Rock")
					//	usr.loc=locate(161,35,34)
						usr.loc=locate(70,112,34)
				if(usr.key in Subscribers)
					usr.Yen+=150000
					var/obj/BonusScrolls/Knowledge_Scroll/DD=new();DD.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/DF=new();DF.loc=usr
					var/x=0
					while(x<=3)
						var/obj/BonusScrolls/EXP/EEE=new();EEE.loc=usr
						var/obj/BonusScrolls/CoolDown/CC=new();CC.loc=usr
						x++
						sleep(1)
					usr<<"Você tem um bonus de inscrição, verifique o inventario"


				if(usr.GetsBenefits)
			//		var/obj/Drinks/Dew/D=new();D.loc=usr
			//		var/obj/Drinks/Pepsi/P=new();P.loc=usr
			//		var/obj/BonusScrolls/CoolDown/DAA=new();DAA.loc=usr
			//		var/obj/BonusScrolls/CoolDown/DAD=new();DAD.loc=usr
			//		var/obj/BonusScrolls/EXP/KAA=new();KAA.loc=usr
			//		var/obj/BonusScrolls/EXP/KAD=new();KAD.loc=usr
			//		var/obj/BonusScrolls/Knowledge_Scroll/FAA=new();FAA.loc=usr
			//		var/obj/BonusScrolls/Token/TAA=new();TAA.ammount=2;TAA.loc=usr;TAA.name="[TAA.name] x[TAA.ammount]"
					usr.Yen+=25000
					usr<<"You've recieved extra Ryo, 2x Cooldown Scrolls, 2x EXP Scrolls, 1x Knowledge Scroll, and 2x Ninja Tokens for Compensation Redemption at a later time."
				usr.Yen+=5000
				usr.move=0
				if(usr.key=="Loose4")
					var/obj/BonusScrolls/Knowledge_Scroll/FAAB=new();FAAB.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FA=new();FA.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/AA=new();AA.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FF=new();FF.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FAAA=new();FAAA.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FAAC=new();FAAC.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FAAD=new();FAAD.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FADA=new();FADA.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FDAA=new();FDAA.loc=usr
					var/obj/BonusScrolls/Knowledge_Scroll/FAADD=new();FAADD.loc=usr
					var/x=0
					while(x<=10)
						var/obj/BonusScrolls/EXP/EEE=new();EEE.loc=usr
						var/obj/BonusScrolls/CoolDown/CC=new();CC.loc=usr
						x++
						sleep(1)


			var/X=300
			var/Nin=X*(usr.NinSkill*0.01)
			var/Gen=X*(usr.GenSkill*0.01)
			var/Tai=X*(usr.TaiSkill*0.01)
			if(!Nin+Gen+Tai==300)
				X=300-(Nin+Gen+Tai);X=X/3
			usr.Mtai=Tai;usr.tai=Tai
			usr.Mgen=Gen;usr.gen=Gen
			usr.Mnin=Nin;usr.nin=Nin
			usr.pixel_step_size=0
			usr.controlled=null
			usr.cansave=1
	//		usr.Updates()
			usr.loggedin=1
			del(QQ)
			usr.Normal()
			usr.CHECK()
			usr.AutoSave()
		else
			usr<<"You must choose an Eye Color and a base!"
mob/var/tmp
	hairselected=0
	villageselected=0
	baseselected=0
mob/proc
	NameChoose()
		NamingFirstName
		//First Name/Last Name
		var/characterfirstname=input(src,"What is your first name?","Name")
		if(length(characterfirstname)<2)
			alert(src,"Your first name must be longer than 2 letters!")
			goto NamingFirstName
		if(length(characterfirstname)>15)
			alert(src,"Your first name can not be longer than 15 letters!")
			goto NamingFirstName
		src.FirstName=characterfirstname
		NamingLastName
		//Last Name
		if(usr.Clan=="Basic")
			switch(input(src,"Do you have a Last name?",text) in list ("Yes","No"))
				if("Yes")
					var/characterlastname=input(src,"What is your last name?","Name")
					if(length(characterlastname)<2)
						alert(src,"Your last name must be longer than 2 letters!")
						goto NamingLastName
					if(length(characterlastname)>15)
						alert(src,"Your last name can not be longer than 15 letters!")
						goto NamingLastName
					src.SecondName=characterlastname
				if("No")
					src.SecondName=""
		else
			alert(src,"Your last name is automatically your clan name!")
			src.SecondName=src.Clan
		if(src.SecondName!="")
			src.name="[src.SecondName], [src.FirstName]"
		else
			if(prob(0.5))
				src.AbleToGetConversusin=1
			src.name=src.FirstName
		//
		alert(src,"Now choose your OOC Title. This Title is what you will be known to on the OOC. This is changable and what you will be known as on OOC, outside of your own character.")
		var/X=input(src,"What is your OOC Name?","Name")
		if(length(X)>12)
			X="AbuseMore"
		src.HandleName=X


//CustomizeBase
mob/var/tmp/screener=new/list()
mob/proc/Refresh_example()
	set background = 1
//	for(var/mob/C in OwnerGodsDude)
//		if(C.key=="CobraT1337")
//			C<<"[src] is using Refresh Example."
//	spawn()
	for(var/image/o in src.screener)
		del(o)
	src.screener+=image(src.icon,icon_state="",loc=locate(123,10,20),layer=103,dir=src.dir)
	for(var/o in src.overlays)
		usr.screener+=image(o,loc=locate(123,10,20),layer=104,dir=usr.dir)
	for(var/image/p in src.screener)
		usr<<p
turf/Customization
	layer=100
	density=1
	icon='PNG/ST copy.PNG'
turf/Customization2
	layer=100
	density=1
	icon='PNG/Screen1.png'
turf/Customization3
	layer=100
	density=1
	icon='PNG/Screen2.png'
turf/Customization4
	layer=100
	density=1
	icon='PNG/Screen3.png'
turf/Customization5
	layer=100
	density=1
	icon='PNG/Screen4.png'
turf/Customization6
	layer=100
	density=1
	icon='PNG/Kiruzon2.png'
turf/CreationScreen/Skin
	icon='Icons/New Base/Base.dmi'
	SkinShades1A
		New()
			var/R=266;var/G=210;var/B=165
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=266;var/G=210;var/B=165
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades2A
		New()
			var/R=261;var/G=205;var/B=160
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=261;var/G=205;var/B=160
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades3A
		New()
			var/R=256;var/G=200;var/B=155
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=256;var/G=200;var/B=155
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades4A
		New()
			var/R=251;var/G=195;var/B=150
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=251;var/G=195;var/B=150
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades5A
		New()
			var/R=246;var/G=190;var/B=145
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=246;var/G=190;var/B=145
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades6A
		New()
			var/R=241;var/G=185;var/B=140
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=241;var/G=185;var/B=140
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades7A
		New()
			var/R=236;var/G=180;var/B=135
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=236;var/G=180;var/B=135
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades8A
		New()
			var/R=231;var/G=175;var/B=130
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=231;var/G=175;var/B=130
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades9A
		New()
			var/R=226;var/G=170;var/B=125
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=226;var/G=170;var/B=125
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades10A
		New()
			var/R=221;var/G=165;var/B=120
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=221;var/G=165;var/B=120
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
//////////////
	SkinShades1
		New()
			var/R=216;var/G=160;var/B=115
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=216;var/G=160;var/B=115
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades2
		New()
			var/R=211;var/G=155;var/B=110
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=211;var/G=155;var/B=110
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades3
		New()
			var/R=206;var/G=150;var/B=105
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=206;var/G=150;var/B=105
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades4
		New()
			var/R=201;var/G=145;var/B=100
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=201;var/G=145;var/B=100
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades5
		New()
			var/R=196;var/G=140;var/B=95
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=196;var/G=140;var/B=95
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades6
		New()
			var/R=191;var/G=135;var/B=90
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=191;var/G=135;var/B=90
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades7
		New()
			var/R=186;var/G=130;var/B=85
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=186;var/G=130;var/B=85
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades8
		New()
			var/R=181;var/G=125;var/B=80
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=181;var/G=125;var/B=80
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades9
		New()
			var/R=176;var/G=120;var/B=75
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=176;var/G=120;var/B=75
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades10
		New()
			var/R=171;var/G=115;var/B=70
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=171;var/G=115;var/B=70
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
/////
	SkinShades1B
		New()
			var/R=161;var/G=105;var/B=60
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=161;var/G=105;var/B=60
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades2B
		New()
			var/R=156;var/G=100;var/B=55
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=156;var/G=100;var/B=55
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades3B
		New()
			var/R=151;var/G=95;var/B=50
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=151;var/G=95;var/B=50
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades4B
		New()
			var/R=146;var/G=90;var/B=45
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=146;var/G=90;var/B=45
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades5B
		New()
			var/R=141;var/G=85;var/B=40
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=141;var/G=85;var/B=40
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades6B
		New()
			var/R=136;var/G=80;var/B=35
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=136;var/G=80;var/B=35
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades7B
		New()
			var/R=131;var/G=75;var/B=30
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=131;var/G=75;var/B=30
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades8B
		New()
			var/R=126;var/G=70;var/B=25
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=126;var/G=70;var/B=25
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades9B
		New()
			var/R=121;var/G=65;var/B=20
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=121;var/G=65;var/B=20
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades10B
		New()
			var/R=116;var/G=60;var/B=15
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=116;var/G=60;var/B=15
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
/////
	SkinShades1C
		New()
			var/R=111;var/G=55;var/B=10
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=111;var/G=55;var/B=10
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades2C
		New()
			var/R=106;var/G=50;var/B=5
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=106;var/G=50;var/B=5
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades3C
		New()
			var/R=101;var/G=45;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=101;var/G=45;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades4C
		New()
			var/R=96;var/G=40;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=96;var/G=40;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades5C
		New()
			var/R=91;var/G=35;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=91;var/G=35;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades6C
		New()
			var/R=86;var/G=30;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=86;var/G=30;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades7C
		New()
			var/R=81;var/G=25;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=81;var/G=25;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades8C
		New()
			var/R=76;var/G=20;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=76;var/G=20;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades9C
		New()
			var/R=71;var/G=15;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=71;var/G=15;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
	SkinShades10C
		New()
			var/R=66;var/G=10;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=66;var/G=10;var/B=0
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
			usr.Refresh_example()
turf/CreationScreen/Skin2
	icon='Icons/New Base/Base.dmi'
	SkinShades1A
		New()
			var/R=266;var/G=210;var/B=165
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=266;var/G=210;var/B=165
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades2A
		New()
			var/R=261;var/G=205;var/B=160
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=261;var/G=205;var/B=160
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades3A
		New()
			var/R=256;var/G=200;var/B=155
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=256;var/G=200;var/B=155
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades4A
		New()
			var/R=251;var/G=195;var/B=150
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=251;var/G=195;var/B=150
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades5A
		New()
			var/R=246;var/G=190;var/B=145
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=246;var/G=190;var/B=145
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades6A
		New()
			var/R=241;var/G=185;var/B=140
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=241;var/G=185;var/B=140
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades7A
		New()
			var/R=236;var/G=180;var/B=135
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=236;var/G=180;var/B=135
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades8A
		New()
			var/R=231;var/G=175;var/B=130
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=231;var/G=175;var/B=130
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades9A
		New()
			var/R=226;var/G=170;var/B=125
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=226;var/G=170;var/B=125
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades10A
		New()
			var/R=221;var/G=165;var/B=120
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=221;var/G=165;var/B=120
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
//////////////
	SkinShades1
		New()
			var/R=216;var/G=160;var/B=115
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=216;var/G=160;var/B=115
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades2
		New()
			var/R=211;var/G=155;var/B=110
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=211;var/G=155;var/B=110
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades3
		New()
			var/R=206;var/G=150;var/B=105
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=206;var/G=150;var/B=105
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades4
		New()
			var/R=201;var/G=145;var/B=100
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=201;var/G=145;var/B=100
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades5
		New()
			var/R=196;var/G=140;var/B=95
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=196;var/G=140;var/B=95
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades6
		New()
			var/R=191;var/G=135;var/B=90
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=191;var/G=135;var/B=90
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades7
		New()
			var/R=186;var/G=130;var/B=85
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=186;var/G=130;var/B=85
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades8
		New()
			var/R=181;var/G=125;var/B=80
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=181;var/G=125;var/B=80
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades9
		New()
			var/R=176;var/G=120;var/B=75
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=176;var/G=120;var/B=75
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades10
		New()
			var/R=171;var/G=115;var/B=70
			src.icon+=rgb(R,G,B);return
		Click()
			if(usr.Clan=="Yotsuki")
				usr<<sound('SFX/click2.wav',0);usr<<"That goes beyond your Clan's limit of character creations.";return
			var/R=171;var/G=115;var/B=70
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
/////
	SkinShades1B
		New()
			var/R=161;var/G=105;var/B=60
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=161;var/G=105;var/B=60
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades2B
		New()
			var/R=156;var/G=100;var/B=55
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=156;var/G=100;var/B=55
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades3B
		New()
			var/R=151;var/G=95;var/B=50
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=151;var/G=95;var/B=50
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades4B
		New()
			var/R=146;var/G=90;var/B=45
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=146;var/G=90;var/B=45
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades5B
		New()
			var/R=141;var/G=85;var/B=40
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=141;var/G=85;var/B=40
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades6B
		New()
			var/R=136;var/G=80;var/B=35
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=136;var/G=80;var/B=35
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades7B
		New()
			var/R=131;var/G=75;var/B=30
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=131;var/G=75;var/B=30
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades8B
		New()
			var/R=126;var/G=70;var/B=25
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=126;var/G=70;var/B=25
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades9B
		New()
			var/R=121;var/G=65;var/B=20
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=121;var/G=65;var/B=20
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades10B
		New()
			var/R=116;var/G=60;var/B=15
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=116;var/G=60;var/B=15
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
/////
	SkinShades1C
		New()
			var/R=111;var/G=55;var/B=10
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=111;var/G=55;var/B=10
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades2C
		New()
			var/R=106;var/G=50;var/B=5
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=106;var/G=50;var/B=5
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades3C
		New()
			var/R=101;var/G=45;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=101;var/G=45;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades4C
		New()
			var/R=96;var/G=40;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=96;var/G=40;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades5C
		New()
			var/R=91;var/G=35;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=91;var/G=35;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades6C
		New()
			var/R=86;var/G=30;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=86;var/G=30;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades7C
		New()
			var/R=81;var/G=25;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=81;var/G=25;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades8C
		New()
			var/R=76;var/G=20;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=76;var/G=20;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades9C
		New()
			var/R=71;var/G=15;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=71;var/G=15;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
	SkinShades10C
		New()
			var/R=66;var/G=10;var/B=0
			src.icon+=rgb(R,G,B);return
		Click()
			var/R=66;var/G=10;var/B=0
			if(usr.Clan=="Hoshigaki")
				usr.BaseR=102;usr.BaseG=114;usr.BaseB=142;usr.FixMyIcon();return
			if(usr.Clan=="Ketsueki")
				usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon();return
			usr.BaseR=R;usr.BaseG=G;usr.BaseB=B;usr.FixMyIcon()
mob/verb/GoToThingy()
	set name="Fix Me Icon"
	set hidden=1
	client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
	client.eye=locate(9,8,30)
mob/proc/FixMyIcon()
	if(src.Clan=="Hoshigaki")
		src.BaseR=102;src.BaseG=114;src.BaseB=142
	if(src.Clan=="Ketsueki")
		src.BaseR=156;src.BaseG=156;src.BaseB=156
	src.baseselected=1
	src.icon=null;var/Base='Icons/New Base/Base.dmi';usr.overlays=null;usr.underlays=null
	Base+=rgb(src.BaseR,src.BaseG,src.BaseB);src.icon=Base;src.Oicon=src.icon
	if(src.Gender=="Male")
		src.overlays-='Icons/New Base/Clothing/Panties.dmi';src.overlays-='Icons/New Base/Clothing/Bra.dmi'
		src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
		src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays-='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi'
	if(src.Gender=="Female")
		src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/Clothing/Panties.dmi'
		src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays-='Icons/New Base/Clothing/Bra.dmi'
		src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays-='Icons/New Base/FemaleEyes.dmi'
		src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi'
mob/Admin/verb/FixSomeonesIcon(Red as num, Green as num, Blue as num, mob/M in world)
	set category="Staff"
	//if(src.Hoshigaki)
	//	src.BaseR=102;src.BaseG=114;src.BaseB=142  We are above predetermined colors
	//if(src.Ketsueki)
	//	src.BaseR=156;src.BaseG=156;src.BaseB=156
	//src.baseselected=1
	M.BaseR=Red;M.BaseG=Green;M.BaseB=Blue
	M.icon=null;var/Base='Icons/New Base/Base.dmi';M.overlays=null;M.underlays=null
	Base+=rgb(M.BaseR,M.BaseG,M.BaseB);M.icon=Base;M.Oicon=src.icon
	if(M.Gender=="Male")
		M.overlays-='Icons/New Base/Clothing/Panties.dmi';M.overlays-='Icons/New Base/Clothing/Bra.dmi'
		M.overlays-='Icons/New Base/Clothing/Boxers.dmi';M.overlays+='Icons/New Base/Clothing/Boxers.dmi'
		M.overlays-='Icons/New Base/MaleEyes.dmi';M.overlays-='Icons/New Base/FemaleEyes.dmi';M.overlays+='Icons/New Base/MaleEyes.dmi'
	if(M.Gender=="Female")
		M.overlays-='Icons/New Base/Clothing/Boxers.dmi';M.overlays-='Icons/New Base/Clothing/Panties.dmi'
		M.overlays+='Icons/New Base/Clothing/Panties.dmi';M.overlays-='Icons/New Base/Clothing/Bra.dmi'
		M.overlays+='Icons/New Base/Clothing/Bra.dmi';M.overlays-='Icons/New Base/FemaleEyes.dmi'
		M.overlays-='Icons/New Base/MaleEyes.dmi';M.overlays+='Icons/New Base/FemaleEyes.dmi'
obj/CreationScreen
	dirarrows
		icon='Icons/Hud/charcreate.dmi'
		layer = MOB_LAYER+97
		right
			icon_state="right"
			Click()
				usr.dir=EAST
				usr<<sound('SFX/click1.wav',0)
				usr.Refresh_example()
		left
			icon_state="left"
			Click()
				usr.dir=WEST
				usr<<sound('SFX/click1.wav',0)
				usr.Refresh_example()
		up
			icon_state="up"
			Click()
				usr.dir=NORTH
				usr<<sound('SFX/click1.wav',0)
				usr.Refresh_example()
		down
			icon_state="down"
			Click()
				usr.dir=SOUTH
				usr<<sound('SFX/click1.wav',0)
				usr.Refresh_example()
mob/var/tmp/choseeyes=0
mob/var/EyeStyle="Normal"
turf/CreationScreen/eyestyles
	icon='Icons/Hud/EyeSelectStuff.dmi'
	EyeStyles1
		name="Normal Eye"
		icon_state="Normal"
		Click()
			usr.EyeStyle="Normal"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
	EyeStyles2
		name="Squinted Eye"
		icon_state="Squinted"
		Click()
			usr.EyeStyle="Squinted"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
	EyeStyles3
		name="Closed Eye"
		icon_state="Closed"
		Click()
			usr.EyeStyle="Closed"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
	EyeStyles4
		name="Small Eye"
		icon_state="Small"
		Click()
			usr.EyeStyle="Small"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
	EyeStyles5
		name="Slanted Eye"
		icon_state="Slanted"
		Click()
			usr.EyeStyle="Slanted"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
	EyeStyles6
		name="Big Eye"
		icon_state="Big"
		Click()
			usr.EyeStyle="Big"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
mob/proc/ChangeEyeStyle(Style,Red,Green,Blue)
	if(Red==null) Red=0
	if(Green==null) Green=0
	if(Blue==null) Blue=0
	if(Red==200&&Green==0&&Blue==0&&usr.EyeStyle=="Closed")
		Style="Squinted"
		usr.EyeStyle="Squinted"
	if(Red==200&&Green==200&&Blue==200&&usr.EyeStyle=="Closed")
		Style="Squinted"
		usr.EyeStyle="Squinted"
	if(Style=="Normal")
		usr.overlays-=usr.eye;usr.overlays-=usr.eye2
		usr.eye='Icons/New Base/Eyes.dmi'
		if(usr.Gender=="Male")
			usr.eye2='Icons/New Base/MaleEyes.dmi'
		if(usr.Gender=="Female")
			usr.eye2='Icons/New Base/FemaleEyes.dmi'
		usr.eye+=rgb(Red,Green,Blue)
		usr.overlays+=usr.eye;usr.overlays+=usr.eye2
	if(Style=="Squinted")
		src.overlays-='Icons/New Base/MaleEyes.dmi';usr.overlays-=usr.eye;usr.overlays-=usr.eye2
		usr.eye='Icons/New Base/Eyes.dmi'
		if(usr.Gender=="Male")
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb(usr.BaseR,usr.BaseG,usr.BaseB))
			var/icon/I2=icon('Icons/New Base/MaleEyes.dmi')
			I2.Blend(I,ICON_OVERLAY,x=1,y=0)
			usr.eye2=I2
		if(usr.Gender=="Female")
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb(usr.BaseR,usr.BaseG,usr.BaseB))
			var/icon/I2=icon('Icons/New Base/FemaleEyes.dmi')
			I2.Blend(I,ICON_OVERLAY,x=1,y=0)
			usr.eye2=I2
		usr.eye+=rgb(Red,Green,Blue)
		usr.overlays+=usr.eye;usr.overlays+=usr.eye2
	if(Style=="Closed")
		src.overlays-='Icons/New Base/MaleEyes.dmi';usr.overlays-=usr.eye;usr.overlays-=usr.eye2
		usr.eye='Icons/New Base/Eyes.dmi'
		if(usr.Gender=="Male")
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb(0,0,0))
			usr.eye2=I
		if(usr.Gender=="Female")
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb(0,0,0))
			usr.eye2=I
		usr.overlays+=usr.eye2
	if(Style=="Small")
		src.overlays-='Icons/New Base/MaleEyes.dmi';usr.overlays-=usr.eye;usr.overlays-=usr.eye2
		usr.eye='Icons/New Base/Eyes.dmi'
		if(usr.Gender=="Male")
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb((77+usr.BaseR),(77+usr.BaseG),(77+usr.BaseB)))
			var/icon/I2=icon('Icons/New Base/MaleEyes.dmi')
			I2.Blend(I,ICON_OVERLAY,x=1,y=0)
			usr.eye2=I2
		if(usr.Gender=="Female")
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb((77+usr.BaseR),(77+usr.BaseG),(77+usr.BaseB)))
			var/icon/I2=icon('Icons/New Base/FemaleEyes.dmi')
			I2.Blend(I,ICON_OVERLAY,x=1,y=0)
			usr.eye2=I2
		usr.eye+=rgb(Red,Green,Blue)
		usr.overlays+=usr.eye;usr.overlays+=usr.eye2
	if(Style=="Slanted")
		src.overlays-='Icons/New Base/MaleEyes.dmi';usr.overlays-=usr.eye;usr.overlays-=usr.eye2
		usr.eye='Icons/New Base/Eyes.dmi'
		var/icon/I=icon('Icons/New Base/Eyes.dmi')
		I.SwapColor(rgb(0,0,0),rgb((42+usr.BaseR),(42+usr.BaseG),(42+usr.BaseB)))
		I.SwapColor(rgb(77,77,77),rgb((77+usr.BaseR),(77+usr.BaseG),(77+usr.BaseB)))
		var/icon/I2=icon('Icons/New Base/MaleEyes.dmi')
		I2.Blend(I,ICON_OVERLAY,x=1,y=3)
		usr.eye2=I2
		usr.eye+=rgb(Red,Green,Blue)
		usr.overlays+=usr.eye;usr.overlays+=usr.eye2
	if(Style=="Big")
		src.overlays-='Icons/New Base/MaleEyes.dmi';usr.overlays-=usr.eye;usr.overlays-=usr.eye2
		if(usr.Gender=="Male")
			var/icon/E=icon('Icons/New Base/Eyes.dmi')
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb((70),(70),(70)))
			var/icon/I3=icon('Icons/New Base/EyesClosed.dmi')
			I3.SwapColor(rgb(28,28,28),rgb((240),(240),(240)))
			var/icon/I2=icon('Icons/New Base/MaleEyes.dmi')
			I2.Shift(NORTH,1)
			I2.Blend(I,ICON_OVERLAY,x=1,y=3)
			I2.Blend(I3,ICON_OVERLAY,x=1,y=0)
			usr.eye2=I2
			E.SwapColor(rgb(0,0,0),rgb(Red,Green,Blue))
			E.SwapColor(rgb(77,77,77),rgb((77+Red),(77+Green),(77+Blue)))
			E.Shift(NORTH,1)
			usr.eye=E
		if(usr.Gender=="Female")
			var/icon/E=icon('Icons/New Base/Eyes.dmi')
			var/icon/I=icon('Icons/New Base/EyesClosed.dmi')
			I.SwapColor(rgb(28,28,28),rgb((70),(70),(70)))
			var/icon/I3=icon('Icons/New Base/EyesClosed.dmi')
			I3.SwapColor(rgb(28,28,28),rgb((240),(240),(240)))
			var/icon/I2=icon('Icons/New Base/FemaleEyes.dmi')
			I2.Shift(NORTH,1)
			I2.Blend(I,ICON_OVERLAY,x=1,y=3)
			I2.Blend(I3,ICON_OVERLAY,x=1,y=0)
			usr.eye2=I2
			E.SwapColor(rgb(0,0,0),rgb(Red,Green,Blue))
			E.SwapColor(rgb(77,77,77),rgb((77+Red),(77+Green),(77+Blue)))
			E.Shift(NORTH,1)
			usr.eye=E
		usr.overlays+=usr.eye;usr.overlays+=usr.eye2
	usr.Refresh_example()
turf/CreationScreen/Eye
	icon='Icons/Hud/EyeShadesForIntro.dmi'
	EyeShades1
		icon_state="0"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=0;usr.geye=0;usr.beye=0
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2
			usr.Refresh_example()
	EyeShades2
		icon_state="1"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=102;usr.geye=0;usr.beye=0
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
	EyeShades3
		icon_state="2"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=153;usr.geye=0;usr.beye=0
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
	EyeShades4
		icon_state="3"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=150;usr.geye=150;usr.beye=0
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
	EyeShades5
		icon_state="4"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=0;usr.geye=170;usr.beye=0
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
	EyeShades6
		icon_state="5"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=0;usr.geye=0;usr.beye=102
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
	EyeShades7
		icon_state="6"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=0;usr.geye=0;usr.beye=255
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
	EyeShades8
		icon_state="7"
		Click()
			if(usr.eye!="")
				usr.choseeyes=1
			usr.overlays-=usr.eye;usr.overlays-=usr.eye2
			usr.reye=153;usr.geye=0;usr.beye=102
			if(usr.Clan=="Hyuuga")
				usr.reye=235;usr.geye=235;usr.beye=235
			usr.overlays+=usr.eye;usr.overlays+=usr.eye2;usr.choseeyes=1
			usr.Refresh_example()
turf/CreationScreen/hair
	icon='Icons/Hud/HairShadesForIntro.dmi'
	HairColor2
		icon_state="1"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=6
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor3
		icon_state="2"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=12
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor4
		icon_state="3"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=24
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor5
		icon_state="4"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=36
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor6
		icon_state="5"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=42
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor7
		icon_state="6"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=48
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor8
		icon_state="7"
		Click()
			usr.overlays-=usr.hair
			usr.bhair+=54
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor9
		icon_state="8"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=6
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor10
		icon_state="9"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=12
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor11
		icon_state="10"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=24
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor12
		icon_state="11"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=36
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor13
		icon_state="12"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=42
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor14
		icon_state="13"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=48
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor15
		icon_state="14"
		Click()
			usr.overlays-=usr.hair
			usr.ghair+=54
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor16
		icon_state="15"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=6
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor17
		icon_state="16"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=12
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor18
		icon_state="17"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=24
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor19
		icon_state="18"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=36
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor20
		icon_state="19"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=42
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor21
		icon_state="20"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=48
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor22
		icon_state="21"
		Click()
			usr.overlays-=usr.hair
			usr.rhair+=54
			usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor27B
		icon_state="26"
		Click()
			var/hairblue=input(usr,"Set the value of blue in your hair?") as num
			usr.bhair=hairblue
			usr.overlays-=usr.hair;usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor27G
		icon_state="26"
		Click()
			var/hairgreen=input(usr,"Set the value of green in your hair?") as num
			usr.ghair=hairgreen
			usr.overlays-=usr.hair;usr.overlays+=usr.hair
			usr.Refresh_example()
	HairColor27R
		icon_state="26"
		Click()
			var/hairred=input(usr,"Set the value of red in your hair?") as num
			usr.rhair=hairred
			usr.overlays-=usr.hair;usr.overlays+=usr.hair
			usr.Refresh_example()
turf/CreationScreen/BaseStuff
	layer=999
	icon='Icons/Hud/BaseSelectStuff.dmi'
	BaseBase2
		icon_state="2"
	BaseBase
		icon_state="1"
	BaseColor
		icon_state="3"
	BaseColor2
		icon_state="4"

turf/CreationScreen
	layer=999
	density=1
	Box1
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box1"
	Box2
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box2"
	Box3
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box3"
	Box4
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box4"
	Box5
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box5"
	Box6
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box6"
	Box7
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box7"
	Box8
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box8"
	Box9
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box9"
	Box10
		layer=2
		icon='Icons/Hud/BaseSelectStuff.dmi'
		icon_state="box10"


turf/CreationScreen/hair
	layer=999
	icon='Icons/Hud/HairShadesForIntro.dmi'
	HairColor1
		icon_state="0"
	HairColor2
		icon_state="1"
		Click()
			usr.bhair+=6
			if(usr.bhair>215)
				usr.bhair=215
	HairColor3
		icon_state="2"
		Click()
			usr.bhair+=12
			if(usr.bhair>215)
				usr.bhair=215
	HairColor4
		icon_state="3"
		Click()
			usr.bhair+=24
			if(usr.bhair>215)
				usr.bhair=215
	HairColor5
		icon_state="4"
		Click()
			usr.bhair+=36
			if(usr.bhair>215)
				usr.bhair=215
	HairColor6
		icon_state="5"
		Click()
			usr.bhair+=42
			if(usr.bhair>215)
				usr.bhair=215
	HairColor7
		icon_state="6"
		Click()
			usr.bhair+=48
			if(usr.bhair>215)
				usr.bhair=215
	HairColor8
		icon_state="7"
		Click()
			usr.bhair+=54
			if(usr.bhair>215)
				usr.bhair=215
	HairColor9
		icon_state="8"
		Click()
			usr.ghair+=6
			if(usr.ghair>215)
				usr.ghair=215
	HairColor10
		icon_state="9"
		Click()
			usr.ghair+=12
			if(usr.ghair>215)
				usr.ghair=215
	HairColor11
		icon_state="10"
		Click()
			usr.ghair+=24
			if(usr.ghair>215)
				usr.ghair=215
	HairColor12
		icon_state="11"
		Click()
			usr.ghair+=36
			if(usr.ghair>215)
				usr.ghair=215
	HairColor13
		icon_state="12"
		Click()
			usr.ghair+=42
			if(usr.ghair>215)
				usr.ghair=215
	HairColor14
		icon_state="13"
		Click()
			usr.ghair+=48
			if(usr.ghair>215)
				usr.ghair=215
	HairColor15
		icon_state="14"
		Click()
			usr.ghair+=54
			if(usr.ghair>215)
				usr.ghair=215
	HairColor16
		icon_state="15"
		Click()
			usr.rhair+=6
			if(usr.rhair>215)
				usr.rhair=215
	HairColor17
		icon_state="16"
		Click()
			usr.rhair+=12
			if(usr.rhair>215)
				usr.rhair=215
	HairColor18
		icon_state="17"
		Click()
			usr.rhair+=24
			if(usr.rhair>215)
				usr.rhair=215
	HairColor19
		icon_state="18"
		Click()
			usr.rhair+=36
			if(usr.rhair>215)
				usr.rhair=215
	HairColor20
		icon_state="19"
		Click()
			usr.rhair+=42
			if(usr.rhair>215)
				usr.rhair=215
	HairColor21
		icon_state="20"
		Click()
			usr.rhair+=48
			if(usr.rhair>215)
				usr.rhair=215
	HairColor22
		icon_state="21"
		Click()
			usr.rhair+=54
			if(usr.rhair>215)
				usr.rhair=215
	HairColor27B
		icon_state="26"
		Click()
			var/hairblue=input(usr,"Set the value of blue in your hair?") as num
			usr.bhair=hairblue
			if(usr.bhair>215)
				usr.bhair=215
	HairColor27G
		icon_state="26"
		Click()
			var/hairgreen=input(usr,"Set the value of green in your hair?") as num
			usr.ghair=hairgreen
			if(usr.ghair>215)
				usr.ghair=215
	HairColor27R
		icon_state="26"
		Click()
			var/hairred=input(usr,"Set the value of red in your hair?") as num
			usr.rhair=hairred
			if(usr.rhair>215)
				usr.rhair=215
turf/CreationScreen/hairstyles
	layer=999
	icon='Icons/Hud/HairSelectStuff.dmi'
	HairStyles0
		name="Bald Hairstyle"
		icon_state="Bald"
		Click()
			usr.IntroHairStyle(null)
	HairStyles1
		name="Spikey Hairstyle"
		icon_state="Spikey"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/narutoH.dmi')
	HairStyles2
		name="Peacock Hairstyle"
		icon_state="Peacock"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SasukeH.dmi')
	HairStyles3
		name="Bowl-Cut Hairstyle"
		icon_state="Bowl-Cut"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/leeH.dmi')
	HairStyles4
		name="Ponytail-Bangs Hairstyle"
		icon_state="LongPonyTail"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/inoH.dmi')
	HairStyles5
		name="Ponytail-Nice Hairstyle"
		icon_state="PonyTail"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/itachiH.dmi')
	HairStyles6
		name="Short-Messy Hairstyle"
		icon_state="MessyShort"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/MessyH.dmi')
	HairStyles7
		name="Wind Hairstyle"
		icon_state="Wind"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/WindH.dmi')
	HairStyles8
		name="Buz-Cut Hairstyle"
		icon_state="Buz-Cut"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/BuzH.dmi')
	HairStyles9
		name="Carrot Hairstyle"
		icon_state="Carrot"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/shikaH.dmi')
	HairStyles10
		name="Bowl Hairstyle"
		icon_state="Bowl-Bangs"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/HinaH.dmi')
	HairStyles11
		name="Long Spikey Hairstyle"
		icon_state="MessySpikey"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SpikeyH.dmi')
	HairStyles12
		name="Fallout Hairstyle"
		icon_state="FallOut"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/KiraH.dmi')
	HairStyles13
		name="Scarecrow Hairstyle"
		icon_state="Scarecrow"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/KakashiH.dmi')
	HairStyles14
		name="Exclusive Spikey Hairstyle"
		icon_state="ExclusiveSpikey"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/ExclusiveH.dmi')
	HairStyles15
		name="Long Humane Hairstyle"
		icon_state="LongHair"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/PainbodyH.dmi')
	HairStyles16
		name="Dreads"
		icon_state="Threads"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/ThreadsH.dmi')
	HairStyles17
		name="Hawk Hairstyle"
		icon_state="Hawk"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SasukeTS.dmi')
	HairStyles18
		name="Messy Hairstyle"
		icon_state="MessyHair"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/RyuzakiH.dmi')
	HairStyles19
		name="Waterfall Hairstyle"
		icon_state="Water-Ponytail"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/MizukageH.dmi')
	HairStyles20
		name="Long Hair With Bangs"
		icon_state="Banged-LongHair"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/OrochimaruH.dmi')
	HairStyles21
		name="Yannis Hairstyle"
		icon_state="Yannis"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/YannisH.dmi')
	HairStyles22
		name="Emo Hairstyle"
		icon_state="Emo"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/EmoH.dmi')
	HairStyles23
		name="Sleek Hairstyle"
		icon_state="Sleek"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SleekH.dmi')
	HairStyles24
		name="Parted Hairstyle"
		icon_state="Parted"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/PartedH.dmi')
	HairStyles25
		name="Spiked Ponytail Hairstyle"
		icon_state="Spiked-Ponytail"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SpikedPonytailH.dmi')
	HairStyles26
		name="Crazy Ponytail Hairstyle"
		icon_state="CrazyPonytailH"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/JiraiyaH2.dmi')
	HairStyles27
		name="Exclusive Carrot Hairstyle"
		icon_state="ExclusiveCarrotH"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/ShikamaruH.dmi')
	HairStyles28
		name="Scene Hairstyle"
		icon_state="SceneH"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SceneH.dmi')
	HairStyles29
		name="Wavy Hairstyle"
		icon_state="Wavy"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/StarrkH.dmi')
	HairStyles30
		name="Exclusive Crazy Ponytail Hairstyle"
		icon_state="ExclusiveCrazyPonytailH"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/JiraiyaH.dmi')
	HairStyles31
		name="Long Dreads Hairstyle"
		icon_state="Tousen"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/TousenH.dmi')
	HairStyles32
		name="Ponytail Dreads Hairstyle"
		icon_state="Tousen2"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/CaptainTousenH.dmi')
	HairsStyles33
		name="J-Rock Hairstyle"
		icon_state="Jrock"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/JrockH.dmi')
	HairsStyles34
		name="Nature Hairstyle"
		icon_state="Nature"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/SitkaH.dmi')
	HairsStyles35
		name="Short-Messy Hairstyle"
		icon_state="MessyShort"
		Click()
			usr.IntroHairStyle('Icons/New Base/Hair/MessyH.dmi')
	buying_hairstyles
		HairStyles1
			name="Spikey Hairstyle"
			icon_state="Spikey"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/narutoH.dmi',5)
		HairStyles2
			name="Peacock Hairstyle"

			icon_state="Peacock"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SasukeH.dmi',5)
		HairStyles3
			name="Bowl-Cut Hairstyle"

			icon_state="Bowl-Cut"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/leeH.dmi',5)
		HairStyles4
			name="Ponytail-Bangs Hairstyle"

			icon_state="LongPonyTail"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/inoH.dmi',5)
		HairStyles5
			name="Ponytail Hairstyle"

			icon_state="PonyTail"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/itachiH.dmi',5)
		HairStyles6
			name="Long-Messy Hairstyle"

			icon_state="SpikeyLong"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/MadaraH.dmi',75)
		HairStyles7
			name="Wind Hairstyle"

			icon_state="Wind"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/WindH.dmi',5)
		HairStyles8
			name="Buz-Cut Hairstyle"

			icon_state="Buz-Cut"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/BuzH.dmi',5)
		HairStyles9
			name="Carrot Hairstyle"

			icon_state="Carrot"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/shikaH.dmi',5)
		HairStyles10
			name="Bowl Hairstyle"

			icon_state="Bowl-Bangs"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/HinaH.dmi',5)
		HairStyles11
			name="Long Spikey Hairstyle"

			icon_state="MessySpikey"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SpikeyH.dmi',35)
		HairStyles12
			name="Fallout Hairstyle"

			icon_state="FallOut"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/KiraH.dmi',50)
		HairStyles13
			name="Scarecrow Hairstyle"

			icon_state="Scarecrow"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/KakashiH.dmi',75)
		HairStyles14
			name="Exclusive Spikey Hairstyle"

			icon_state="ExclusiveSpikey"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/ExclusiveH.dmi',100)
		HairStyles15
			name="Long Humane Hairstyle"

			icon_state="LongHair"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/PainbodyH.dmi',50)
		HairStyles16
			name="Dreads"

			icon_state="Threads"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/ThreadsH.dmi',15)
		HairStyles17
			name="Hawk Hairstyle"

			icon_state="Hawk"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SasukeTS.dmi',75)
		HairStyles18
			name="Messy Hairstyle"

			icon_state="MessyHair"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/RyuzakiH.dmi',45)
		HairStyles19
			name="Waterfall Hairstyle"

			icon_state="Water-Ponytail"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/MizukageH.dmi',100)
		HairStyles20
			name="Long Hair With Bangs"

			icon_state="Banged-LongHair"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/OrochimaruH.dmi',50)
		HairStyles21
			name="Yannis Hairstyle"

			icon_state="Yannis"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/YannisH.dmi',50)
		HairStyles22
			name="Emo Hairstyle"

			icon_state="Emo"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/EmoH.dmi',50)
		HairStyles23
			name="Sleek Hairstyle"

			icon_state="Sleek"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SleekH.dmi',50)
		HairStyles24
			name="Parted Hairstyle"
			icon_state="Parted"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/PartedH.dmi',50)
		HairStyles25
			name="Spiked Ponytail Hairstyle"
			icon_state="Spiked-Ponytail"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SpikedPonytailH.dmi',50)
		HairStyles26
			name="Crazy Ponytail Hairstyle"
			icon_state="CrazyPonytailH"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/JiraiyaH2.dmi',50)
		HairStyles27
			name="Exclusive Carrot Hairstyle"
			icon_state="ExclusiveCarrotH"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/ShikamaruH.dmi',100)
		HairStyles28
			name="Scene Hairstyle"
			icon_state="SceneH"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SceneH.dmi',50)
		HairStyles29
			name="Wavy Hairstyle"
			icon_state="Wavy"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/StarrkH.dmi',100)
		HairStyles30
			name="Exclusive Crazy Ponytail Hairstyle"
			icon_state="ExclusiveCrazyPonytailH"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/JiraiyaH.dmi',125)
		HairStyles31
			name="Long Dreads Hairstyle"
			icon_state="Tousen"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/TousenH.dmi',100)
		HairStyles32
			name="Ponytail Dreads Hairstyle"
			icon_state="Tousen2"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/CaptainTousenH.dmi',100)
		HairsStyles33
			name="J-Rock Hairstyle"
			icon_state="Jrock"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/JrockH.dmi',75)
		HairsStyles34
			name="Nature Hairstyle"
			icon_state="Nature"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/SitkaH.dmi',50)
		HairsStyles35
			name="Short-Messy Hairstyle"
			icon_state="MessyShort"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/MessyH.dmi',10)
		HairsStyles36
			name="Uniform Spikey Hairstyle"
			icon_state="UniformSpikey"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/MinatoH.dmi',50)
		HairStyles37
			name="Predator Hairstyle"
			icon_state="Predator"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/RandomKarnHair.dmi',100)
		HairStyles38
			name="Pointed Hairstyle"
			icon_state="Pointed"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/AoH.dmi',50)
		HairStyles39
			name="Tomboy Hairstyle"
			icon_state="Tomboy"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/TemariH.dmi',50)
		HairStyles40
			name="Afro Hairstyle"
			icon_state="Afro"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/AfroH.dmi',50)
		HairStyles41
			name="Short Ponytail Hairstyle"
			icon_state="Deidara"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/DeidaraH.dmi',50)
		HairStyles42
			name="Wolverine Hairstyle"
			icon_state="Wolverine"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/WolverineH.dmi',75)
		HairStyles43
			name="Medium Straight Hairstyle"
			icon_state="Kimimaro"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/KimimaroH.dmi',50)
		HairStyles44
			name="Mohawk Hairstyle"
			icon_state="Mohawk"
			Click()
				usr.BuyHairStyle(src.name,'Icons/New Base/Hair/Mohawk.dmi',25)

obj
	BackgroundHaircutter
		icon='PNG/creation screen copy3.png'
		screen_loc="1,1"
mob
	proc
		BuyHairStyle(DAName,HairIcon,Cost)

			var/obj/E = new /obj;var/obj/F = new /obj;var/obj/G = new /obj;var/obj/H = new /obj
			E.layer=105;F.layer=105;G.layer=105;H.layer=105
			E.loc=locate(164,24,20);F.loc=locate(166,24,20);G.loc=locate(166,22,20);H.loc=locate(164,22,20)

			var/Z = HairIcon
			Z +=rgb(src.rhair,src.ghair,src.bhair)
			var/image/A = image(Z,E,"running",104,NORTH);var/image/B = image(Z,F,"running",104,SOUTH);var/image/C = image(Z,G,"running",104,EAST);var/image/D = image(Z,H,"running",104,WEST)
			src<<A;src<<B;src<<C;src<<D
			if(src.Yen<Cost)
				src<<"Sorry You Can't Afford This. This HairStyle Costs [Cost]";del(A);del(B);del(C);del(D);del(E);del(F);del(G);del(H);return
			switch(input(src,"Do you want the [DAName]? It costs [Cost].")in list("No","Buy","Return Me To My Screen"))
				if("Buy")
					src.overlays-=src.hair
					var/hairover=HairIcon
					hairover+=rgb(src.rhair,src.ghair,src.bhair)
					src.hair=hairover
					src.overlays+=src.hair
					src.hairselected=1
					src.Yen-=Cost
					src<<"Thank you! And enjoy your new hair style!"
					src<<sound('SFX/click1.wav',0)
					src<<sound('SFX/Cash.wav')
					src.client.perspective=MOB_PERSPECTIVE
					src.client.eye=src
					src.Skill_Tree=0
					del(A);del(B);del(C);del(D)
				if("No")
					del(A);del(B);del(C);del(D)
					del(E);del(F);del(G);del(H)
					return
				if("Return Me To My Screen")
					src<<sound('SFX/click2.wav',0)
					src.client.perspective=MOB_PERSPECTIVE
					src.client.eye=src
					src.Skill_Tree=0
					del(A);del(B);del(C);del(D)
			del(E);del(F);del(G);del(H)
		IntroHairStyle(HairIcon)
			src.overlays-=src.hair
			var/hairover=HairIcon
			hairover+=rgb(src.rhair,src.ghair,src.bhair)
			src.hair=hairover
			src.overlays+=src.hair
			src.hairselected=1













