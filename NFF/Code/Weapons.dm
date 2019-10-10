//Since you're doing a custom jutsu system..I thought I might do something that
//I thought of in the shower the other day. A custom weapon system! Its partially based
//off of some things that were supposed to be in the economy system that went totally to
//shit.
/*
obj/WEAPONS
	var
		material  //can be iron, steel, titanium, adamantium (lol) for better durability.
				  //can be silver, gold, platinum for better sale value.
		peircing //determines how sharp the weapon is basically..and if it can peirce through someone
		weight //factors into how far the weapon can be thrown. Heavier weight goes less far, but deals more damage
		size //determines how many can be thrown at once. Will also factor into distances and damage.

		//Following are only for exploding weapons
		flammable // =0 or 1f
		explosionradius //big explosion requires more material to make one of these.
		smokeproduced //enough said..
		poison = "" //custom poisons which can also factor into the puppet system
					//Poisons can attack a variety of different targets..
					//Health, Stamina, Chakra, Chakra Resevoir, Movement, Direction, Chakra Control(fluctuating chakra usage for jutsus)

		//Swords/Tantos/Knives
		size //=1,2,or 3  <-- think you already have something in like this.
		mass //material condensed into the weapon.
		//material also factors into this.

		materialstrength
		materialweight
		materialcondesity

Each shop in a village NEEDS Raw mateial to produce anything. Raw materials can be found via digging.
Aburame Caves? =D  Limited resources in each area. Will be defined via area turfs.

More material added, more it costs to make. Possible trading among villages. - hopefully manual.

Rarer materials found in more remote areas of the map and harder to access parts of the map.
Ie: old sand village.*/


obj/var/PlacementWeight=0
obj/var/health=999999999999
obj/var/Percision=1
turf
	Weapons
		icon = 'Skilltree.dmi'
		Unavailble
			icon_state="Unavailable"
			layer=MOB_LAYER+5
		Background
			icon='PNG/salesmanbackground.PNG'
			//layer=MOB_LAYER+4
mob/MerchantDude
	name = "Bandage Sales person"
	CNNPC = 1
	health = 99999999999999999999999999999999999999999999999999999999999
	icon_state="Moon2"
	New()
		.=..()
		spawn()
			src.icon=null
			var/Base='Icons/New Base/Base.dmi'
			Base+=rgb(235,145,52)
			src.icon=Base
			src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
			src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
			src.overlays-='Icons/New Base/MaleEyes.dmi'
			src.overlays+='Icons/New Base/MaleEyes.dmi'
			src.overlays-='Icons/New Base/Eyes.dmi'
			src.overlays+='Icons/New Base/Eyes.dmi'
			src.overlays-='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
			src.overlays-='Icons/New Base/Clothing/bandagesR.dmi';src.overlays+='Icons/New Base/Clothing/bandagesR.dmi'
			src.overlays-='Icons/New Base/Clothing/bandagesL.dmi';src.overlays+='Icons/New Base/Clothing/bandagesL.dmi'
			src.overlays-='Icons/New Base/Clothing/facewrap.dmi';src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
			src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
			src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
	verb/Buy()
		set category="NPC"
		set src in oview(3)
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
			color:white;} TABLE {background:#CCCCCC} TD {background:#000033}\
			</style>"
		var/list/buttons = list("Yes", "No")
		switch(input(usr,"Hi! I'm the injury salesman, I sell people equipment to help them with their injuries! What would you like?")in list("Face Wrappings","R-Arm Arm Wrappings","L-Arm Arm Wrappings","Nothing"))
			if("Face Wrappings")
				sd_Alert(usr, "<u>Face Wrappings</u></br>Wrappings to place around the face.</br></br>Cost: 200 Yen","Face Wrapping", buttons, \
					pick(buttons),0,0,"400x150",,style)
				if("Yes")
					usr<<sound('SFX/click1.wav',0)
					if(usr.Yen<200)
						sd_Alert(usr, "You don't have enough yen!","Shop",,,,0,"400x150",,style);return
					else
						usr.Yen-=200;var/obj/Clothes/FaceW2/B=new();B.loc=usr
						usr<<sound('SFX/Cash.wav')
				else
					src<<sound('SFX/click2.wav',0);return
			if("R-Arm Arm Wrappings")
				sd_Alert(usr, "<u>Arm Wrappings</u></br>Wrappings to place around the arms.</br></br>Cost: 200 Yen","Arm Wrappings", buttons, \
					pick(buttons),0,0,"400x150",,style)
				if("Yes")
					usr<<sound('SFX/click1.wav',0)
					if(usr.Yen<200)
						sd_Alert(usr, "You don't have enough yen!","Shop",,,,0,"400x150",,style);return
					else
						usr.Yen-=200;var/obj/Clothes/ArmWR/B=new();B.loc=usr
						usr<<sound('SFX/Cash.wav')
			if("L-Arm Arm Wrappings")
				sd_Alert(usr, "<u>Arm Wrappings</u></br>Wrappings to place around the arms.</br></br>Cost: 200 Yen","Arm Wrappings", buttons, \
					pick(buttons),0,0,"400x150",,style)
				if("Yes")
					usr<<sound('SFX/click1.wav',0)
					if(usr.Yen<200)
						sd_Alert(usr, "You don't have enough yen!","Shop",,,,0,"400x150",,style);return
					else
						usr.Yen-=200;var/obj/Clothes/ArmWL/B=new();B.loc=usr;usr<<sound('SFX/Cash.wav')
				if("No")
					return
				else
					src<<sound('SFX/click2.wav',0);return
turf
	Weapons
		icon='Icons/Hud/wskillcards.dmi'
//		layer=MOB_LAYER+5
		expnotes
			icon_state="exptag"
			Click()
				var/give = input(usr,"How many Exploding Tags do you wish to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 Exploding tags at a time"
					return
				if(usr.Yen>=give*100&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen-=give*100
					var/counter=0
					for(var/obj/ExplodingTag/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/ExplodingTag/B = new/obj/ExplodingTag
						B.loc = usr
						B.name= "[B.name] ([give])"
						B.ammount += give
					else
						for(var/obj/ExplodingTag/O in usr.contents)
							O.ammount+=give
							O.name= "[O.name] ([O.ammount])"
				else
					usr<<"Not enough money!"
		kunai
			icon_state="Kunai"
			Click()
				var/give = input(usr,"How many Kunai do you wish to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 Kunai at a time"
					return
				if(usr.Yen >= give*50&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen -= give*50
					var/counter=0
					for(var/obj/WEAPONS/Kunai/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/WEAPONS/Kunai/B = new()
						B.loc = usr
						B.ammount+=give
						B.name= "[B.name] ([B.ammount])"
					else
						for(var/obj/WEAPONS/Kunai/O in usr.contents)
							O.ammount+=give
							O.name= "[O.name] ([O.ammount])"
				else
					usr<<"Not enough money!"
	/*	Markedkunai
			name="Marked Kunai"
			icon_state="Kunai"
			Click()
				var/give = input(usr,"How many Kunai do you wish to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 Kunai at a time"
					return
				if(usr.Yen >= give*50&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen -= give*50
					var/counter=0
f					for(var/obj/WEAPONS/MarkedKunai/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/WEAPONS/MarkedKunai/B = new()
						B.loc = usr
						B.ammount+=give
						B.name= "[B.name] ([B.ammount])"
					else
						for(var/obj/WEAPONS/MarkedKunai/O in usr.contents)
							O.ammount+=give
							O.name= "[O.name] ([O.ammount])"
				else
					usr<<"Not enough money!"*/
		BigKunai
			icon_state="BigKunai"
		shuriken
			icon_state="Shuriken"
			Click()
				var/give = input(usr,"How many Shuriken do you wish to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 Shuriken at a time"
					return
				if(usr.Yen >= give*50&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen -= give*50
					var/counter=0
					for(var/obj/WEAPONS/Shuriken/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/WEAPONS/Shuriken/B = new/obj/WEAPONS/Shuriken
						B.loc = usr
						B.ammount+=give
						B.name= "[B.name] ([B.ammount])"
					else
						for(var/obj/WEAPONS/Shuriken/O in usr.contents)
							O.ammount+=give
							O.name= "[O.name] ([O.ammount])"
				else
					usr<<"Not enough money!"
		eshuriken
			icon_state="8Shuriken"
		WShuriken
			icon_state="WShuriken"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr<<"Unavailable currently."
				var/give = input(usr,"These are 30000 Yen a piece. How many Windmill Shuriken do you wish to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 Shuriken at a time"
					return
				if(usr.Yen >= give*30000&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen -= give*30000
					var/counter=0
					for(var/obj/WEAPONS/WindmillShuriken/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/WEAPONS/WindmillShuriken/B = new/obj/WEAPONS/WindmillShuriken
						B.loc = usr
						B.ammount+=give
						B.name= "[B.name] ([B.ammount])"
					else
						for(var/obj/WEAPONS/WindmillShuriken/O in usr.contents)
							O.ammount+=give
							O.name= "[O.oname] ([O.ammount])"
				else
					usr<<"Not enough money!"
				switch(input(usr,"The Windmill Shuriken costs 30000 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=30000)
							usr<<sound('SFX/Cash.wav')
							usr<<"You buy a Windmill Shuriken!"
							usr.Yen-=30000
							var/obj/WindmillShuriken/B = new()
							B.loc=usr
							usr<<sound('SFX/click1.wav',0)
							return
						else
							usr<<"Not enough money!"
							usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		BigShuriken
			icon_state="BigShuriken"
		Senbon
			icon_state="Senbon"
			Click()
				var/give = input(usr,"How many Senbons do you wish to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 senbon at a time"
					return
				if(usr.Yen >= give*50&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen -= give*50
					var/counter=0
					for(var/obj/WEAPONS/Senbon/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/WEAPONS/Senbon/B = new()
						B.loc = usr
						B.ammount+=give
						B.name= "[B.name] ([B.ammount])"
					else
						for(var/obj/WEAPONS/Senbon/O in usr.contents)
							O.ammount+=give
							O.name= "[O.name] ([O.ammount])"
				else
					usr<<"Not enough money!"
		Katana
			icon_state="Katana"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The katana costs 1500 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=1500)
							usr<<sound('SFX/Cash.wav')
							usr<<"You bought a Katana!"
							usr.Yen-=1500
							var/obj/WEAPONS/Katana/B = new/obj/WEAPONS/Katana
							B.loc=usr
							usr<<sound('SFX/click1.wav',0)
							return
						else
							usr<<"Not enough money!"
							usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Nunchuks
			icon_state="Nunchuks"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Nunchuks costs 1500 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=1500)
							usr<<sound('SFX/Cash.wav')
							usr<<"You bought Nunchuks!"
							usr.Yen-=1500
							var/obj/WEAPONS/Nunchuks/B = new/obj/WEAPONS/Nunchuks
							B.loc=usr
							usr<<sound('SFX/click1.wav',0)
							return
						else
							usr<<"Not enough money!"
							usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		BoStaff
			icon_state="BoStaff"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Bo-Staff costs 1500 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=1500)
							usr<<sound('SFX/Cash.wav')
							usr<<"You bought a Bo-Staff!"
							usr.Yen-=1500
							var/obj/WEAPONS/BoStaff/B=new()
							B.loc=usr
							usr<<sound('SFX/click1.wav',0)
							return
						else
							usr<<"Not enough money!"
							usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Naginata
			icon_state="Naginata"
		KubirikiHouchou
			icon_state="KubirikiHouchou"
		Chigiriki
			icon_state="Chigiriki"
		Kama
			icon_state="Kama"
		KnuckleKnives
			icon_state="KnuckleKnives"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"These Knuckle Knives costs 10000 yen. Do you wish to buy them?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=10000)
							usr<<sound('SFX/Cash.wav')
							usr<<"You buy a Katana!"
							usr.Yen-=10000
							var/obj/WEAPONS/KnuckleKnives/B=new()
							B.loc=usr
							usr<<sound('SFX/click1.wav',0)
							return
						else
							usr<<"Not enough money!"
							usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Makibishi
			icon_state="Makibishi"
			Click()
				usr<<sound('SFX/click1.wav',0)
				var/give = input(usr,"A Makibishi spike costs 10 yen per spike, How many would you like to buy?")as num
				if(give >= 101)
					usr<<"You cannot purchase more than 100 spikes at a time"
					return
				if(usr.Yen >= give*10&&give>0)
					usr<<sound('SFX/Cash.wav')
					usr.Yen -= give*10
					var/counter=0
					for(var/obj/Makibishi/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/Makibishi/B = new/obj/Makibishi
						B.loc = usr
						B.ammount+=give
						B.name= "Makibishi ([B.ammount])"
					else
						for(var/obj/Makibishi/O in usr.contents)
							O.ammount+=give
							O.name= "Makibishi ([O.ammount])"
				else
					usr<<"Not enough money!"
		Wire
			icon_state="Wire"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Wire costs 300 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=300)
							var/give = input(usr,"How many Wires do you wish to buy?")as num
							if(usr.Yen>=give*300&&give>0)
								if(give>50)
									usr<<"You can't have more than 50 wires.";return
								else
									for(var/obj/RandomEquipment/Arame/B in usr.contents)
										if(B.ammount>50)
											usr<<"Wait, it looks like you can't hold anymore Wires! You can only hold 50 at a time.";return
										if(B.ammount+give>49)
											usr<<"Wait, it looks like you can't hold anymore Wires! You can only hold 50 at a time.";return
									usr<<sound('SFX/Cash.wav')
									usr.Yen -= give*100
									var/counter=0
									for(var/obj/RandomEquipment/Arame/B in usr.contents)
										counter+=1
									if(counter<=0)
										var/obj/RandomEquipment/Arame/B=new()
										B.loc=usr
										B.Ammount+=give
										B.ReCheckAmount()
									else
										for(var/obj/RandomEquipment/Arame/O in usr.contents)
											O.Ammount+=give
											O.ReCheckAmount()
							else
								usr<<"Not enough money!"
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Poison
			icon_state="Poison"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Poison costs 500 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=500)
							var/give = input(usr,"How many bottles of Poison do you wish to buy?")as num
							if(usr.Yen>=give*300&&give>0)
								if(give>20)
									usr<<"You can't have more than 20 bottles of Poison.";return
								else
									for(var/obj/RandomEquipment/Poison/B in usr.contents)
										if(B.ammount>20)
											usr<<"Wait, it looks like you can't hold anymore bottles of Poison! You can only hold 20 bottles at a time.";return
										if(B.ammount+give>19)
											usr<<"Wait, it looks like you can't hold anymore bottles of Poison! You can only hold 20 bottles at a time.";return
									usr<<sound('SFX/Cash.wav')
									usr.Yen -= give*500
									var/counter=0
									for(var/obj/RandomEquipment/Poison/B in usr.contents)
										counter+=1
									if(counter<=0)
										var/obj/RandomEquipment/Poison/B=new()
										B.loc=usr
										B.Ammount+=give
										B.ReCheckAmount()
									else
										for(var/obj/RandomEquipment/Poison/O in usr.contents)
											O.Ammount+=give
											O.ReCheckAmount()
							else
								usr<<"Not enough money!"
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Ointment
			icon_state="Ointment"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Ointments costs 25 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=25)
							var/give = input(usr,"How many Ointment do you wish to buy?")as num
							if(usr.Yen>=give*25&&give>0)
								if(give>50)
									usr<<"You can't have more than 50 packs of Ointment.";return
								for(var/obj/NinjaEquipment/Ointment/B in usr.contents)
									if(B.ammount>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
									if(B.ammount+give>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*25
								var/counter=0
								for(var/obj/NinjaEquipment/Ointment/B in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/NinjaEquipment/Ointment/B=new()
									B.loc=usr
									B.ammount+=give
									B.CheckAmount()
								else
									for(var/obj/NinjaEquipment/Ointment/O in usr.contents)
										O.ammount+=give
										O.CheckAmount()
							else
								usr<<"Not enough money!"
					if("No")
						usr<<sound('SFX/click2.wav',0)
		Healthpack
			icon_state="Healthpack"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Healthpack costs 50 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=50)
							var/give = input(usr,"How many Healthpack do you wish to buy?")as num
							if(usr.Yen>=give*50&&give>0)
								if(give>50)
									usr<<"You can't have more than 50 packs of Ointment.";return
								for(var/obj/NinjaEquipment/Healthpack/B in usr.contents)
									if(B.ammount>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
									if(B.ammount+give>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*50
								var/counter=0
								for(var/obj/NinjaEquipment/Healthpack/B in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/NinjaEquipment/Healthpack/B=new()
									B.loc=usr
									B.ammount+=give
									B.CheckAmount()
								else
									for(var/obj/NinjaEquipment/Healthpack/O in usr.contents)
										O.ammount+=give
										O.CheckAmount()
							else
								usr<<"Not enough money!"
					if("No")
						usr<<sound('SFX/click2.wav',0)
		Scroll
			icon_state="Scroll"
		ChakraPaper
			icon_state="ChakraPaper"
			Click()
				usr<<"Disabled"
				return
			/*
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The Chakra Paper costs 250 yen. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=250)
							usr<<sound('SFX/Cash.wav')
							usr<<"You have bought some Chakra Paper!"
							usr.Yen-=250
							var/obj/NinjaEquipment/ChakraPaper/B=new()
							B.loc=usr
							usr<<sound('SFX/click1.wav',0)
							return
						else
							usr<<"Not enough money!"
							usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return*/
		BigSmokeBomb
			icon_state="dsmokebomb"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"These smoke bombs cost 500 Yen each (+ tax). Do you want to buy some?", text) in list ("Yes","No."))
					if("Yes")
						var/give = input(usr,"How many Smoke Bombs do you wish to buy?")as num
						if(give > 5)
							usr<<"You cannot purchase more than 5 Deluxe Smoke Bombs at a time."
							return
						if(usr.Yen>=give*500&&give>0)
							usr<<sound('SFX/Cash.wav')
							usr.Yen -= give*500
							var/counter=0
							for(var/obj/NinjaEquipment/DeluxeSmokeBomb/O in usr.contents)
								counter+=1
							if(counter<=0)
								var/obj/NinjaEquipment/DeluxeSmokeBomb/B = new()
								B.loc = usr
								B.ammount+=give
								B.name= "[B.name] ([B.ammount])"
							else
								for(var/obj/NinjaEquipment/DeluxeSmokeBomb/O in usr.contents)
									O.ammount+=give
									O.name= "[O.name] ([O.ammount])"
									return
						else
							usr<<"Not enough money!"
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SmokeBomb
			icon_state="smokebomb"
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"These smoke bombs cost 100 Yen each (+ tax). Do you want to buy some?", text) in list ("Yes","No."))
					if("Yes")
						var/give = input(usr,"How many Smoke Bombs do you wish to buy?")as num
						if(give > 15)
							usr<<"You cannot purchase more than 15 Smoke Bombs at a time."
							return
						if(usr.Yen>=give*100&&give>0)
							usr<<sound('SFX/Cash.wav')
							usr.Yen -= give*100
							var/counter=0
							for(var/obj/NinjaEquipment/SmokeBomb/O in usr.contents)
								counter+=1
							if(counter<=0)
								var/obj/NinjaEquipment/SmokeBomb/B = new()
								B.loc = usr
								B.ammount+=give
								B.name= "[B.name] ([B.ammount])"
							else
								for(var/obj/NinjaEquipment/SmokeBomb/O in usr.contents)
									O.ammount+=give
									O.name= "[O.name] ([O.ammount])"
									return
						else
							usr<<"Not enough money!"
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		cancel
			icon='cancel.dmi'
			icon_state="10"
			Click()
				usr.client.perspective=MOB_PERSPECTIVE
				usr.client.eye=usr
mob/var/tmp/Equipping=0
obj/WEAPONS
	icon='Icons/Hud/wskillcards.dmi'//used to be just wskillcards.dmi
	var
		Health=0
		WhatDoesItDo="Slash"
		Exploding=0
		HandedWeapon
		Equipped=0
		EquipIconUnderlayRight
		EquipIconOverlayRight
		EquipIconUnderlayLeft
		EquipIconOverlayLeft
		PercentDamage=0
		WeaponDelay=0
		StunChance=0
		CriticalChance=0
		ReflexDecreaser=0
		ChakraDeplters=0
		SizeRating=0
		TileMax=1//Maximum Number of tiles the weapon needs to move across to gain 100% momentum.
		TilesA=0 //Tiles Accumulated. Number of tiles the weapon has moved across.
		ShadowClone=0
	Click()
		if(src.ammount>1)
			usr<<"[src.ammount] [src.oname]s"
		else
			usr<<"A [src.oname]"
	verb
		Get()
			set src in oview(1)
			if(istype(src,/obj/WEAPONS/Kunai))
				if(src.ammount==1)
					usr<<"You picked up a [src]"
				else
					usr<<"You picked up some [src]."
				src.icon_state="Kunai"
				var/counter=0
				for(var/obj/WEAPONS/Kunai/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/WEAPONS/Kunai/O in usr.contents)
						O.ammount+=src.ammount
						O.CheckAmount()
						del(src)
			else if(istype(src,/obj/WEAPONS/Shuriken))
				if(src.ammount==1)
					usr<<"You picked up a [src]"
				else
					usr<<"You picked up some [src]."
				src.icon_state="Shuriken"
				var/counter=0
				for(var/obj/WEAPONS/Shuriken/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/WEAPONS/Shuriken/O in usr.contents)
						O.ammount+=src.ammount
						O.CheckAmount()
						del(src)
			else if(istype(src,/obj/WEAPONS/WindmillShuriken))
				src.icon_state=""

				if(src.ammount==1||src.ammount==0)
					usr<<"You picked up a [src]"
				else
					usr<<"You picked up some [src]."
				var/counter=0
				for(var/obj/WEAPONS/WindmillShuriken/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/WEAPONS/WindmillShuriken/O in usr.contents)
						O.ammount+=src.ammount
						O.CheckAmount()
						del(src)
			//hoshigake New 1.8

			else
				usr<<"You picked up [src]."
				src.loc=usr
		Drop()
			if(usr.Equipping)
				usr<<"You have an equipment pop-up open! You can't drop anything until you equip the weapon to a hand.";return
			if(usr.WeaponInLeftHand==src||usr.WeaponInRightHand==src)
				usr<<"You cannot drop any of these while they are equipped to your hand."
				return
			if(isobj(/obj/WEAPONS/Kunai))
				for(var/obj/WEAPONS/Kunai/O in usr.contents)
					var/drop = input(usr,"How many Kunai do you wish to drop?")as num
					if(drop>src.ammount)
						usr<<"You don't have that many to drop.";return
					if(drop == 0)
						usr<<"You can not do that";return
					if(drop < 0)
						usr<<"You can not do that";return
					if(src.ammount>=drop)
						if(usr.WeaponInRightHand==src)
							usr.WeaponInRightHand=""
						if(usr.WeaponInLeftHand==src)
							usr.WeaponInLeftHand=""
						src.ammount-=drop;var/obj/WEAPONS/Kunai/B=new();B.loc=locate(usr.x,usr.y-1,usr.z);B.ammount=drop;view(usr)<<"[usr] drops [drop] Kunai.";if(src.ammount<=0)
							del(src)
						usr.SaveK()
				return
			if(isobj(/obj/WEAPONS/ChakraKatana))
				usr<<"You decide to abandon your Clan's Blade. It is never seen again."
				del(src)
				usr.SaveK()
				return
			else if(isobj(/obj/WEAPONS/Shuriken))
				for(var/obj/WEAPONS/Shuriken/O in usr.contents)
					var/drop = input(usr,"How many Shuriken do you wish to drop?")as num
					if(drop>src.ammount)
						usr<<"You don't have that many to drop.";return
					if(drop == 0)
						usr<<"You can not do that";return
					if(drop < 0)
						usr<<"You can not do that";return
					if(src.ammount>=drop)
						if(usr.WeaponInRightHand==src)
							usr.WeaponInRightHand=""
						if(usr.WeaponInLeftHand==src)
							usr.WeaponInLeftHand=""
						src.ammount-=drop;var/obj/WEAPONS/Shuriken/B=new();B.loc=locate(usr.x,usr.y-1,usr.z);B.ammount=drop;view(usr)<<"[usr] drops [drop] Shuriken.";if(src.ammount<=0)
							del(src)
						usr.SaveK()
				return
			else if(isobj(/obj/WEAPONS/WindmillShuriken))
				for(var/obj/WEAPONS/WindmillShuriken/O in usr.contents)
					var/drop = input(usr,"How many Windmill Shuriken do you wish to drop?")as num
					if(drop>src.ammount)
						usr<<"You don't have that many to drop.";return
					if(drop == 0)
						usr<<"You can not do that";return
					if(drop < 0)
						usr<<"You can not do that";return
					if(src.ammount>=drop)
						if(usr.WeaponInRightHand==src)
							usr.WeaponInRightHand=""
						if(usr.WeaponInLeftHand==src)
							usr.WeaponInLeftHand=""
						src.ammount-=drop;var/obj/WEAPONS/WindmillShuriken/B=new();B.loc=locate(usr.x,usr.y-1,usr.z);B.ammount=drop;view(usr)<<"[usr] drops [drop] Windmill Shuriken.";if(src.ammount<=0)
							del(src)
						usr.SaveK()
				return
			else
				src.loc=locate(usr.x,usr.y-1,usr.z)
				view(usr)<<"[usr] drops [src]."
				usr.SaveK()

		//hoshigaki unequip 2.2
		Equip()
			var/countzzz=0
			for(var/obj/A in usr.contents)//Just added 12/20/2012
				if(A.ammount>1)
					countzzz+=A.PlacementWeight*A.ammount
				else
					countzzz+=A.PlacementWeight
			usr.ItemWeight=countzzz
			if(usr.AdvancedWielding == 1)
				src.HandedWeapon="One"
			if(usr.samehadeEquipped == 1)
				usr<<"You must first unequip the Samehade."
				return
			if(src.HandedWeapon=="One")
				usr.Equipping=1
				switch(input(usr,"Which hand do you wish to equip/unequip the [src.name] to?", text) in list ("Left","Right"))
					if("Left")
						usr.Equipping=0;usr<<sound('SFX/click1.wav')
						if(usr.WeaponInRightHand&&src!=usr.WeaponInRightHand)
							if(src.oname!="Kunai"&&src.oname!="Shuriken"&&src.oname!="Senbon")
								var/obj/WEAPONS/O=usr.WeaponInRightHand
								if(O.HandedWeapon=="One"&&src.HandedWeapon=="One")
									usr<<"You are unable to wield two seperate one handed weapons at the same time."
									usr<<"You unequip the [O] from your right hand."
									usr.overlays-=O.EquipIconOverlayRight;O.Equipped=0;usr.WeaponInRightHand=""
						if(src.Equipped&&usr.WeaponInLeftHand!=src)
							if(usr.WeaponInRightHand)
								if(src.oname!="Kunai"&&src.oname!="Shuriken"&&src.oname!="Senbon")
									usr<<"You unequip the [src] from your right hand."
									usr.overlays-=src.EquipIconOverlayRight;src.Equipped=0;usr.WeaponInRightHand=""
						if(usr.WeaponInLeftHand!=src&&usr.WeaponInLeftHand!="")
							if(usr.WeaponInLeftHand)
								usr<<"You unequip the [usr.WeaponInLeftHand] from your left hand."
								var/obj/WEAPONS/O=usr.WeaponInLeftHand;usr.overlays-=O.EquipIconOverlayLeft;O.Equipped=0;usr.WeaponInLeftHand=""
								if(O.HandedWeapon=="Two")
									//usr<<"You unequip the [usr.WeaponInRightHand] from your right hand."
									usr.WeaponInRightHand=""
						usr.LeftHandSheath=0;usr.RightHandSheath=0
						if(usr.WeaponInLeftHand==""&&!src.Equipped)
							usr<<"You equip the [src.name] to your left hand!"
							src.Equipped=1;usr.WeaponInLeftHand=src;usr.overlays+=src.EquipIconOverlayLeft;usr.underlays+=src.EquipIconUnderlayLeft
							return
						else if(usr.WeaponInLeftHand=="")
							if(src.oname=="Kunai"||src.oname=="Shuriken"||src.oname=="Senbon")
								usr<<"You equip the [src.name] to your left hand!"
								src.Equipped=1;usr.WeaponInLeftHand=src;usr.overlays+=src.EquipIconOverlayLeft;usr.underlays+=src.EquipIconUnderlayLeft
								return
						if(usr.WeaponInLeftHand==src)
							usr<<"You unequip the [src.name] from your left hand.";usr.WeaponInLeftHand=""
							src.Equipped=0;usr.overlays-=src.EquipIconOverlayLeft;usr.underlays-=src.EquipIconUnderlayLeft
							return
					if("Right")
						usr.Equipping=0;usr<<sound('SFX/click1.wav')
						if(usr.WeaponInLeftHand&&src!=usr.WeaponInLeftHand)
							var/obj/WEAPONS/O=usr.WeaponInLeftHand
							if(O.HandedWeapon=="One"&&src.HandedWeapon=="One")
								if(src.oname!="Kunai"&&src.oname!="Shuriken"&&src.oname!="Senbon")
									usr<<"You are unable to wield two seperate one handed weapons at the same time."
									usr<<"You unequip the [O] from your left hand."
									usr.overlays-=O.EquipIconOverlayLeft;O.Equipped=0;usr.WeaponInLeftHand=""
						if(src.Equipped&&usr.WeaponInRightHand!=src)
							if(usr.WeaponInLeftHand)
								if(src.oname!="Kunai"&&src.oname!="Shuriken"&&src.oname!="Senbon")
									usr<<"You unequip the [usr.WeaponInLeftHand] from your left hand."
									usr.overlays-=src.EquipIconOverlayLeft;src.Equipped=0;usr.WeaponInLeftHand=""
						if(usr.WeaponInRightHand!=src&&usr.WeaponInRightHand!="")
							if(usr.WeaponInRightHand)
								usr<<"You unequip the [usr.WeaponInRightHand] from your right hand."
								var/obj/WEAPONS/O=usr.WeaponInRightHand;usr.overlays-=O.EquipIconOverlayRight;O.Equipped=0;usr.WeaponInRightHand=""
								if(O.HandedWeapon=="Two")
									//usr<<"You unequip the [usr.WeaponInLeftHand] from your left hand."
									usr.WeaponInLeftHand=""
						usr.LeftHandSheath=0;usr.RightHandSheath=0
						if(usr.WeaponInRightHand==""&&!src.Equipped)
							usr<<"You equip the [src.name] to your right hand!"
							src.Equipped=1;usr.WeaponInRightHand=src;usr.overlays+=src.EquipIconOverlayRight;usr.underlays+=src.EquipIconUnderlayRight
							return
						else if(usr.WeaponInRightHand=="")
							if(src.oname=="Kunai"||src.oname=="Shuriken"||src.oname=="Senbon")
								usr<<"You equip the [src.name] to your right hand!"
								src.Equipped=1;usr.WeaponInRightHand=src;usr.overlays+=src.EquipIconOverlayRight;usr.underlays+=src.EquipIconUnderlayRight
								return
						if(usr.WeaponInRightHand==src)
							usr<<"You unequip the [src.name] from your right hand.";usr.WeaponInRightHand=""
							src.Equipped=0;usr.overlays-=src.EquipIconOverlayRight;usr.underlays-=src.EquipIconUnderlayRight
							return
			if(src.HandedWeapon=="Two")
				usr<<sound('SFX/click1.wav')
				if(usr.WeaponInLeftHand!=src&&usr.WeaponInRightHand!=src)
					if(usr.WeaponInLeftHand)
						usr<<"You unequip the [usr.WeaponInLeftHand] from your left hand."
						var/obj/WEAPONS/O=usr.WeaponInLeftHand;usr.overlays-=O.EquipIconOverlayLeft;O.Equipped=0
						usr.WeaponInLeftHand=""
					if(usr.WeaponInRightHand)
						usr<<"You unequip the [usr.WeaponInRightHand] from your right hand."
						var/obj/WEAPONS/O=usr.WeaponInRightHand;usr.overlays-=O.EquipIconOverlayRight;O.Equipped=0
						usr.WeaponInRightHand=""
					usr<<"You equip the [src].";usr.WeaponInRightHand=src;usr.WeaponInLeftHand=src
					usr.overlays-=src.EquipIconOverlayRight;usr.overlays+=src.EquipIconOverlayRight
					usr.LeftHandSheath=0;usr.RightHandSheath=0
				else
					usr<<"You unequip the weapon.";usr.WeaponInLeftHand="";usr.WeaponInRightHand=""
					usr.LeftHandSheath=0;usr.RightHandSheath=0
					usr.overlays-=src.EquipIconOverlayRight
					src.Equipped=0
//Bows Q-Q
	Bow
		name="Bow"
		icon_state="Bow"
		WhatDoesItDo="Throw"
		HandedWeapon="Two"
		Health=100
		PercentDamage=2
		PlacementWeight=50
		WeaponDelay=6
		StunChance=0
		CriticalChance=40
		ReflexDecreaser=0
		SizeRating=2

		EquipIconUnderlayRight='Icons/New Base/Weapons/BowO.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/BowO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/BowO.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/BowO.dmi'

//One-Handed Swords
	MeleeKunai
		name="Melee Kunai"
		icon_state="Kunai"
		HandedWeapon="One"
		Health=100
		PercentDamage=2
		PlacementWeight=3
		WeaponDelay=6
		StunChance=0
		CriticalChance=2
		ReflexDecreaser=0
		SizeRating=1

		EquipIconUnderlayRight='Icons/New Base/Weapons/kunai.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/kunai.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/kunai.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/kunai.dmi'
	Katana
		name="Katana"
		icon_state="Katana"
		HandedWeapon="One"
		Health=100
		PercentDamage=9
		PlacementWeight=20
		WeaponDelay=9
		ReflexDecreaser=10
		SizeRating=2

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	Kodachi
		name="Kodachi"
		icon_state="Kodachi"
		HandedWeapon="One"
		Health=100
		PercentDamage=4
		PlacementWeight=20
		WeaponDelay=7
		StunChance=0
		CriticalChance=25
		ReflexDecreaser=0
		SizeRating=1

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	Tachi
		name="Tachi"
		icon_state="Tachi"
		HandedWeapon="One"
		Health=100
		PercentDamage=5
		PlacementWeight=25
		WeaponDelay=14
		StunChance=20
		CriticalChance=0
		ReflexDecreaser=0
		SizeRating=2

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	Ninjato
		name="Ninjato"
		icon_state="Ninjato"
		HandedWeapon="One"
		Health=100
		PercentDamage=8
		PlacementWeight=40
		WeaponDelay=18
		StunChance=15
		CriticalChance=2
		ReflexDecreaser=33
		SizeRating=2

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	Tanto
		name="Tanto"
		icon_state="Tanto"
		HandedWeapon="One"
		Health=50
		PercentDamage=8
		PlacementWeight=15
		WeaponDelay=6
		StunChance=3
		CriticalChance=10
		SizeRating=1

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	ChakraKatana
		name="Chakra Blade"
		icon_state="ChakraKatana"
		HandedWeapon="One"
		Health=150
		PercentDamage=6
		PlacementWeight=25
		WeaponDelay=12
		SizeRating=2

		ChakraDeplters=1
		EquipIconUnderlayRight='Icons/New Base/Weapons/ChakraKatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/ChakraKatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/ChakraKatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/ChakraKatanaO.dmi'
	KusanagiHana
		name="Kusanagi No Hana"
		icon_state="KusanagiHana"
		HandedWeapon="One"
		Health=200
		PercentDamage=14
		PlacementWeight=20
		WeaponDelay=15
		SizeRating=2

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	Kusanagi
		name="Kusanagi No Tsurugi"
		icon_state="Kusanagi"
		HandedWeapon="One"
		Health=200
		PercentDamage=5
		PlacementWeight=20
		WeaponDelay=6
		SizeRating=2

		EquipIconUnderlayRight='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KatanaO.dmi'
	Tsubaki
		name="Tsubaki"
		icon_state=""
		HandedWeapon="One"
		Health=200
		SizeRating=1
		WeaponDelay=7
//Two-Handed Swords
	Yanagi
		name="Yanagi"
		icon_state=""
		HandedWeapon="Two"
		Health=400
		SizeRating=1
		WeaponDelay=7
	BigKunai
		name="Big Kunai"
		icon_state="BigKunai"
		HandedWeapon="Two"
		PlacementWeight=25
		SizeRating=3
	KubirikiHouchou
		name="Kubiriki Houchou"
		icon_state="KubirikiHouchou"
		HandedWeapon="Two"
		Health=100
		PercentDamage=15
		PlacementWeight=50
		WeaponDelay=33
		CriticalChance=8
		StunChance=20
		ReflexDecreaser=45
		SizeRating=3

		EquipIconUnderlayRight='ZabuzaSwordUnderlay.dmi'
		EquipIconOverlayRight='KubirikiHouchou.dmi'
		EquipIconUnderlayLeft='ZabuzaSwordUnderlay.dmi'
		EquipIconOverlayLeft='KubirikiHouchou.dmi'
	Berserker
		name="Berserker"
		icon_state="Berserker"
		HandedWeapon="Two"
		PercentDamage=10
		PlacementWeight=50
		WeaponDelay=23
		SizeRating=3

		EquipIconUnderlayRight='FinalBersword.dmi'
		EquipIconOverlayRight='FinalBersword.dmi'
		EquipIconUnderlayLeft='FinalBersword.dmi'
		EquipIconOverlayLeft='FinalBersword.dmi'
	Samehade
		name="Samehade"
		icon_state="Samehade"
		HandedWeapon="Two"
		Health=100
		PercentDamage=10
		PlacementWeight=100
		WeaponDelay=15
		SizeRating=3

		EquipIconUnderlayRight='Icons/New Base/Weapons/Samehade2.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/Samehade2.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/Samehade2.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/Samehade2.dmi'




//Legendary Blades
	OriginalKubikiriHoucho
		name="Original Kubikiri Houcho"
		icon_state="KubirikiHouchou"
		HandedWeapon="Two"
		Health=100
		PercentDamage=8
		PlacementWeight=150
		WeaponDelay=30
		CriticalChance=10
		StunChance=5
		ReflexDecreaser=10
		SizeRating=3

		EquipIconUnderlayRight='Icons/New Base/Weapons/KubirikiHouchouOriginal.dmi'//'ZabuzaSwordUnderlay.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KubirikiHouchouOriginal.dmi'//'KubirikiHouchou.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KubirikiHouchouOriginal.dmi'//'ZabuzaSwordUnderlay.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KubirikiHouchouOriginal.dmi'//'KubirikiHouchou.dmi'
	Hiramekarei
		name="Hiramekarei"
		icon_state="Hirameki"
		HandedWeapon="Two"
		Health=100
		PercentDamage=10
		PlacementWeight=175
		WeaponDelay=30
		CriticalChance=10
		StunChance=7
		ReflexDecreaser=40
		SizeRating=3

		EquipIconUnderlayRight='Icons/New Base/Weapons/Hirameki.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/Hirameki.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/Hirameki.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/Hirameki.dmi'

		Equip()
			if(usr.chakra<=3000)
				PercentDamage=5
				WeaponDelay=45
				CriticalChance=5
				usr<<"Your low Chakra weakens the power of this weapon."
			if(usr.chakra>3000&&usr.chakra<6000)
				PercentDamage=10
				WeaponDelay=30
				CriticalChance=10
				usr<<"Your chakra keeps the power of this weapon static."
			if(usr.chakra>=6000&&usr.chakra<8500)
				PercentDamage=12
				WeaponDelay=27
				CriticalChance=12
				usr<<"Your chakra strengthens the power of this weapon."
			if(usr.chakra>8500)
				PercentDamage=15
				WeaponDelay=22
				CriticalChance=15
				usr<<"Your chakra strengthens the power of this weapon to unbelievable levels."
			..()
	NagaBladeSword
		name="Dark Naga"
		icon_state="NagaBladeSword"
		HandedWeapon="Two"
		Health=150
		PercentDamage=25
		PlacementWeight=100
		WeaponDelay=20
		SizeRating=3
		var/OwnerActivated=0

		ChakraDeplters=1
		EquipIconUnderlayRight='NagaBladeSword.dmi'
		EquipIconOverlayRight='NagaBladeSword.dmi'
		EquipIconUnderlayLeft='NagaBladeSword.dmi'
		EquipIconOverlayLeft='NagaBladeSword.dmi'

	OriginalSamehade
		name="Samehada"
		icon_state="Samehade"
		HandedWeapon="Two"
		Health=150
		PercentDamage=15
		PlacementWeight=125
		WeaponDelay=10
		SizeRating=3

		EquipIconUnderlayRight='Icons/New Base/Weapons/SamehadeNew.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/SamehadeNew.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/SamehadeNew.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/SamehadeNew.dmi'

	DarkBlade
		name="Dark Ryuzachi"
		icon_state="ChakraKatana"
		HandedWeapon="Two"
		Health=150
		PercentDamage=10
		PlacementWeight=50
		WeaponDelay=12
		SizeRating=2
		var/OwnerActivated=0

		EquipIconUnderlayRight='Icons/New Base/Weapons/ChakraKatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/ChakraKatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/ChakraKatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/ChakraKatanaO.dmi'
	MammothBlade
		name="MammothBlade"
		icon_state="ChakraKatana"
		HandedWeapon="Two"
		Health=150
		PercentDamage=30
		PlacementWeight=50
		WeaponDelay=30
		SizeRating=3
		var/OwnerActivated=0

		EquipIconUnderlayRight='Hawks Coding/8 Swords/Mammoth Sword Edited.dmi'
		EquipIconOverlayRight='Hawks Coding/8 Swords/Mammoth Sword Edited.dmi'
		EquipIconUnderlayLeft='Hawks Coding/8 Swords/Mammoth Sword Edited.dmi'
		EquipIconOverlayLeft='Hawks Coding/8 Swords/Mammoth Sword Edited.dmi'
	LightBlade
		name="Light Ryuzachi"
		icon_state="ChakraKatana"
		HandedWeapon="Two"
		Health=150
		//PercentDamage=10
		PlacementWeight=50
		//WeaponDelay=12
	//	SizeRating=2
		var/OwnerActivated=0

		EquipIconUnderlayRight='Icons/New Base/Weapons/ChakraKatanaU.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/ChakraKatanaO.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/ChakraKatanaU.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/ChakraKatanaO.dmi'
	Evanesence
		name="Evanescence"
		icon_state="Evanescence"
		HandedWeapon="One"
		Health=150
		PercentDamage=6
		CriticalChance=10
		StunChance=10
		ReflexDecreaser=35
		PlacementWeight=25
		WeaponDelay=8
		SizeRating=2 //Was Originally a tier 2
		var/OwnerActivated=0

		EquipIconUnderlayRight='Icons/New Base/Weapons/YellowLS.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/YellowLS.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/YellowLS.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/YellowLS.dmi'
	RoseBladeSword
		name="Rose Blade"
		icon_state="RoseBladeSword"
		HandedWeapon="One"
		Health=150
		PercentDamage=8
		PlacementWeight=100
		WeaponDelay=12
		SizeRating=2

		EquipIconUnderlayRight='RoseBladeSwordU.dmi'
		EquipIconOverlayRight='RoseBladeSwordO.dmi'
		EquipIconUnderlayLeft='RoseBladeSwordU.dmi'
		EquipIconOverlayLeft='RoseBladeSwordO.dmi'
	InvisibleKaito
		name="Invisible Kaito"
		icon_state="InvisibleKaito"
		HandedWeapon="One"
		Health=150
		PercentDamage=5
		CriticalChance=50
		StunChance=10
		ReflexDecreaser=65
		PlacementWeight=1
		WeaponDelay=1
		SizeRating=1

		EquipIconUnderlayRight=null
		EquipIconOverlayRight=null
		EquipIconUnderlayLeft=null
		EquipIconOverlayLeft=null
	Shibuki
		name="Shibuki"
		icon_state="Samehade"
		HandedWeapon="Two"
		Health=150
		PercentDamage=15
		PlacementWeight=150
		WeaponDelay=20
		SizeRating=3

		EquipIconUnderlayRight='Shibuki.dmi'
		EquipIconOverlayRight='Shibuki.dmi'
		EquipIconUnderlayLeft='Shibuki.dmi'
		EquipIconOverlayLeft='Shibuki.dmi'
//Spears
	Naginata
		name="Naginata"
		icon_state="Naginata"
		HandedWeapon="Two"
		PlacementWeight=35
//Ect
	HanboStaff
		name="Hanbo-Staff"
		icon_state="HanboStaff"
		HandedWeapon="Two"
		PlacementWeight=50
		Health=150
		WeaponDelay=8
		WhatDoesItDo="Staff"
		PercentDamage=200

		EquipIconUnderlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
	BoStaff
		name="Bo-Staff"
		icon_state="BoStaff"
		HandedWeapon="Two"
		PlacementWeight=50
		Health=150
		WeaponDelay=11
		WhatDoesItDo="Staff"
		PercentDamage=200

		EquipIconUnderlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
	FourSidedBoStaff
		name="Four Sided Bo-Staff"
		icon_state="BoStaff"
		HandedWeapon="Two"
		PlacementWeight=75
		Health=150
		WeaponDelay=12
		WhatDoesItDo="Staff"
		PercentDamage=250

		EquipIconUnderlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
	SixSidedBoStaff
		name="Six Sided Bo-Staff"
		icon_state="BoStaff"
		HandedWeapon="Two"
		PlacementWeight=100
		Health=150
		WeaponDelay=14
		WhatDoesItDo="Staff"
		PercentDamage=450

		EquipIconUnderlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
	EightSidedBoStaff
		name="Eight Sided Bo-Staff"
		icon_state="BoStaff"
		HandedWeapon="Two"
		PlacementWeight=100
		Health=150
		WeaponDelay=18
		WhatDoesItDo="Staff"
		PercentDamage=750

		EquipIconUnderlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/BoStaff.dmi'
	SageMonkeyBoStaff
		name="Sage: Monkey Bo-Staff"
		icon_state="BoStaffSage"
		HandedWeapon="Two"
		PlacementWeight=50
		Health=150
		WeaponDelay=10
		WhatDoesItDo="Staff"
		PercentDamage=750

		EquipIconUnderlayRight='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'

	BoomStaff
		name="Boom-Stick"
		icon_state="BoStaffSage"
		HandedWeapon="Two"
		PlacementWeight=75
		Health=150
		WeaponDelay=10
		WhatDoesItDo="Staff"
		PercentDamage=750

		EquipIconUnderlayRight='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
	ApexStaff
		name="Apex Staff"
		icon_state="BoStaffSage"
		HandedWeapon="Two"
		PlacementWeight=50
		Health=150
		WeaponDelay=10
		WhatDoesItDo="Staff"
		PercentDamage=750

		EquipIconUnderlayRight='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
///////////////////
//Claws
	KnuckleKnives
		name="Knuckle Knives"
		icon_state="KnuckleKnives"
		HandedWeapon="Two"
		PlacementWeight=15
		Health=150
		WeaponDelay=10
		WhatDoesItDo="Claws"
		PercentDamage=3

		EquipIconUnderlayRight='Icons/New Base/Weapons/KnuckleKnives.dmi'
		EquipIconOverlayRight='Icons/New Base/Weapons/KnuckleKnives.dmi'
		EquipIconUnderlayLeft='Icons/New Base/Weapons/KnuckleKnives.dmi'
		EquipIconOverlayLeft='Icons/New Base/Weapons/KnuckleKnives.dmi'
///////////////////
//Nunchuks
	Nunchuks
		name="Nunchuks"
		icon_state="Nunchuks"
		HandedWeapon="One"
		PlacementWeight=15
		Health=150
		WeaponDelay=4
		WhatDoesItDo="NunChuk"
		PercentDamage=5

		EquipIconUnderlayRight='NunChuks.dmi'
		EquipIconOverlayRight='NunChuks.dmi'
		EquipIconUnderlayLeft='NunChuks.dmi'
		EquipIconOverlayLeft='NunChuks.dmi'

///////////////////
//Throwable Weapons

	MarkedKunai
		name="Marked Kunai"
		oname="Kunai"
		icon_state="KunaiMark"
		HandedWeapon="One"
		PlacementWeight=3
		WhatDoesItDo="Throw"
		density=1
		TileMax=1//Maximum Number of tiles the weapon needs to move across to gain 100% momentum.
		TilesA=0 //Tiles Accumulated. Number of tiles the weapon has moved across.
		var
			Owner
			ChakraEnhance=0
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"

		New()
			..()
			spawn()
				src.CheckAmount()
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M=A
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM)&&O.KunaiMastery<ArmorAddUpForM*2)
					view(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir)
					M.Deflection=0
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.Deflection)
					if(prob(1))
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					viewers(M)<<sound('SFX/SwordClash.wav',0);M.Deflection=0
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
					viewers(src)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					return
				if(M.Dodging)
					M.Dodge2()
					src.loc=M.loc
					return
				if(M.sphere)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(prob(M.SensoryRange*5))
					src.loc=M.loc;flick("zan",M);M<<"You quickly dodged the [src]!";return
				if(prob(5))
					O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				//var/damage=M.maxhealth*(0.13+(O.WeaponMaster*0.01)) <-- OLDDZ
				var/ThrowingStrengthz=O.ThrowingStrength
				if(ThrowingStrengthz>10)
					ThrowingStrengthz=10+((O.ThrowingStrength-10)/4)
				var/damage=M.maxhealth*(0.01*((src.TilesA+ThrowingStrengthz)+O.WeaponMaster))
				if(prob(O.Percision*3))
					damage=damage*2
				if(src.ChakraEnhance)
					damage=damage*1.5
				M.DamageProc(damage,"Health",O)
				Blood(M.x,M.y,M.z);view(M) << "[M] was hit by [O]'s Marked Kunai for [damage] damage!!";viewers(M)<<sound('SFX/Slice.wav',0)
				M.KageBuyou()
				Effect(src,"Flash","on",9)
				Effect(M,"Flash","on",9)

				src.loc=M.loc
				if(src.Exploding)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
				spawn(1) M.Death(O)
				if(src.ChakraEnhance)
					if(prob(round(O.KunaiMastery)))
						src.loc=M.loc
						return
				del(src)
			if(isobj(A))
				if(istype(A,/obj/NinjaEquipment/TheWires))
					return
				if(istype(A,/obj/Log))
					if(prob(10))
						O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				if(istype(A,/obj/DojoLog))
					if(prob(20))
						O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				var/obj/Q = A
				if(Q.icon=='Icons/New Base/Weapons/kunai.dmi'||Q.icon=='shuriken.dmi')
					if(Q:Owner==src.Owner)
						src.loc=Q.loc;return
					viewers(src)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src);flick("clang",Q)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				else
					icon_state="Kunai"
					walk(src,0)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
		Move()
			if(src.TilesA>0)
				if(src.TilesA<src.TileMax)
					sleep((1/(src.TilesA*2)))
			..()
			if(src.TileMax>src.TilesA)
				TilesA++
		Del()
			var/obj/Weapons/K=new();var/random=rand(1,6);if(random==1)
				K.icon_state = "kunai"
			if(random==2)
				K.icon_state = "kunai2"
			else
				K.icon_state = "kunai3"
			K.loc=src.loc
			..()

	Kunai
		name="Kunai"
		oname="Kunai"
		icon='Icons/New Base/Weapons/Kunai.dmi'
		icon_state="TheWeapon"
		ammount=1
		HandedWeapon="One"
		PlacementWeight=3
		WhatDoesItDo="Throw"
		density=1
		TileMax=3//Maximum Number of tiles the weapon needs to move across to gain 100% momentum.
		TilesA=0 //Tiles Accumulated. Number of tiles the weapon has moved across.
		var
			Owner
			PuppetKunaiDamage=0
			PuppetRapidKunaiDamage=0
			ChakraEnhance=0
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		New()
			..()
			spawn()
		//		if(istype(src.Owner,/mob/Puppet/Talon/))
		//			PuppetKunaiDamage=1
				src.CheckAmount()
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M=A
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM)&&O.KunaiMastery<ArmorAddUpForM*2)
					view(M)<<sound('SFX/KunaiDeflect.wav',0,0,0,40);src.dir=turn(src.dir,45);walk(src,src.dir)
					M.Deflection=0
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.Deflection)
					if(prob(1))
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					view(M)<<sound('SFX/KunaiDeflect.wav',0,0,0,50);M.Deflection=0
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				//	view(M)<<sound('SFX/KunaiDeflect.wav',0,,,50);
					src.dir=turn(src.dir,45);walk(src,src.dir)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					return
				if(M.Dodging)
					M.Dodge2()
					src.loc=M.loc
					return
				if(M.sphere)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(prob(M.SensoryRange*5))
					src.loc=M.loc;flick("zan",M);M<<"You quickly dodged the [src]!";return
				if(prob(5))
					O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				//var/damage=M.maxhealth*(0.13+(O.WeaponMaster*0.01)) <-- OLDDZ
				var/ThrowingStrengthz=O.ThrowingStrength
				if(PuppetKunaiDamage==1)
					ThrowingStrengthz=2
				if(PuppetKunaiDamage==2)
					ThrowingStrengthz=3.5
				if(PuppetKunaiDamage==3)
					ThrowingStrengthz=5
				if(PuppetRapidKunaiDamage==1)
					ThrowingStrengthz=2.5//Just for the lolz 12/2/2012
				if(PuppetRapidKunaiDamage==2)
					ThrowingStrengthz=3
				if(PuppetRapidKunaiDamage==3)
					ThrowingStrengthz=4
				if(ThrowingStrengthz>10)
					ThrowingStrengthz=10+((O.ThrowingStrength-10)/4)
				var/damage=M.maxhealth*(0.01*((src.TilesA+ThrowingStrengthz)+(O.WeaponMaster/2)))
				if(prob(O.Percision*3))
					damage=damage*2
				if(src.ChakraEnhance)
					damage=damage*1.5
				M.DamageProc(damage,"Health",O)
				Blood(M.x,M.y,M.z);view(M) << "[M] was hit by [O]'s Kunai for [damage] damage!!";viewers(M)<<sound('SFX/Slice.wav',0,40)
				src.loc=M.loc
				if(O.PoisonOn)
					M.Poisoned()
					O<<"You managed to hit [M] with your weapon. The poison soothing into their bloodstream.."
					O.PoisonOn=0
				if(src.Exploding)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
				if(prob(2))
					return
				spawn(1) M.Death(O)
				if(src.ChakraEnhance)
					if(prob(round(O.KunaiMastery)))
						if(prob(5))
							return
						src.loc=M.loc
						return
				del(src)
			if(isobj(A))
				if(istype(A,/obj/NinjaEquipment/TheWires))
					return
				if(istype(A,/obj/Jutsu/Elemental/Katon/))//Just added 6/19/2013
					return
				if(istype(A,/obj/Log))
					if(prob(10))
						O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				if(istype(A,/obj/DojoLog))
					if(prob(20))
						O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				var/obj/Q = A
				if(Q.icon=='Icons/New Base/Weapons/kunai.dmi'||Q.icon=='shuriken.dmi')
					if(Q:Owner==src.Owner)
						src.loc=Q.loc;return
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40);
					src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src);flick("clang",Q)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				else
					icon_state="Kunai"
					walk(src,0)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
		Move()
			if(src.TilesA>0)
				if(src.TilesA<src.TileMax)
					sleep((1/(src.TilesA*2)))
			..()
			if(src.TileMax>src.TilesA)
				TilesA++
		Del()
			if(src.ShadowClone)
				var/obj/SmokeCloud/S=new();S.loc = locate(src.x,src.y,src.z)
				..()
		//		return
			else
				var/obj/Weapons/K=new();K.ShadowClone=src.ShadowClone
				var/random2=rand(1,6)
				if(random2==1)
					K.icon_state = "kunai"
				if(random2==2)
					K.icon_state = "kunai2"
				else
					K.icon_state = "kunai3"
				K.loc=src.loc
				..()
			//	return
				//all of the above in the del() was recently added
			var/obj/Weapons/K=new()
			var/mob/O=src.Owner
			if(O&&O.FTG_Mode)
				O.SealPlacedOn+=K
				var/image/I=image('Icons/Jutsus/MinatoAura.dmi',K)
				O<<I
			var/random=rand(1,6)
			if(random==1)
				K.icon_state = "kunai"
			if(random==2)
				K.icon_state = "kunai2"
			else
				K.icon_state = "kunai3"
			K.loc=src.loc
			..()
	Senbon
		name="Senbon"
		oname="Senbon"
		icon_state="Senbon"
		HandedWeapon="One"
		PlacementWeight=1
		WhatDoesItDo="Throw"
		density=1
		pixel_step_size=16
		TileMax=100//Maximum Number of tiles the weapon needs to move across to gain 100% momentum.
		TilesA=0 //Tiles Accumulated. Number of tiles the weapon has moved across.
		var
			Owner
			ChakraEnhance=0
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		New()
			..()
			icon_state=""
			spawn()
				src.CheckAmount()
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/Headband/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUArmor/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUHandGuards/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM))
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40)
					src.dir=turn(src.dir,45);walk(src,src.dir)
					M.Deflection=0
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.Deflection)
					viewers(M)<<sound('SFX/SwordClash.wav',0,volume=40)
					M.Deflection=0
					if(prob(1))
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40);src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					return
				if(M.Dodging)
					M.Dodge2()
					src.loc=M.loc
					return
				if(M.sphere)
					src.loc=M.loc
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(prob(M.SensoryRange*3))
					src.loc=M.loc;M<<"You quickly dodged the [src]!";return
				var/damage=M.maxhealth*(0.01*(src.TilesA+(O.ThrowingStrength/3)+(O.WeaponMaster/2)))
				if(prob(5))
					O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				if(prob(src.Percision*5))
					damage=damage*2
				if(src.ChakraEnhance)
					damage=damage*1.5
				if(O.SenbonAim=="Body")
					if(prob(5*(O.SenbonImpale+1)+(O.SenbonMastery/10)))
						damage=damage*1.2
				if(O.SenbonAim=="Feet")
					if(prob(10*(O.SenbonImpale+1)+(O.SenbonMastery/10)))
						M.Running=0
				if(O.SenbonAim=="Hands")
					if(prob(10*(O.SenbonImpale+1)+(O.SenbonMastery/10)))
						M.Jutsusealed(10)
				if(O.PoisonOn)
					M.Poisoned()
					O<<"You managed to hit [M] with your weapon. The poison soothing into their bloodstream.."
					O.PoisonOn=0
				M.DamageProc(damage,"Health",O)
				view(M) << "[M] was hit by [O]'s Senbon for [damage] damage!!"
				view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40)
				M.Bloody()
				if(src.Exploding)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
				del(src)
			if(isobj(A))
				var/obj/Q = A
				if(istype(Q,/obj/Jutsu/Elemental/Katon/))//Just added 6/19/2013
					return
				if(istype(Q,/obj/WEAPONS/Shuriken/))
					var/obj/WEAPONS/Shuriken/QC = Q
					if(QC.Owner==src.Owner)
						QC.loc=src.loc
						return
				if(Q.icon=='Icons/New Base/Weapons/kunai.dmi'||Q.icon=='Senbon.dmi'&&Q.pixel_x==src.pixel_x&&Q.pixel_y==src.pixel_y)
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40);src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src);flick("clang",Q)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
						del(src)
				else
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
		Move()
			if(src.TilesA>0)
				if(src.TilesA<6)
					sleep((1/(src.TilesA*2)))
			..()
			if(src.TileMax>src.TilesA)
				TilesA++
		Del()
			var/obj/Weapons/K=new();var/random=rand(1,6);if(random==1)
				K.icon_state = "needles"
			else
				K.icon_state = "needles2"
			K.loc=src.loc
			..()
	Shuriken
		name="Shuriken"
		oname="Shuriken"
		icon_state="Shuriken"
		HandedWeapon="One"
		PlacementWeight=2
		WhatDoesItDo="Throw"
		density=1
		TileMax=5//Maximum Number of tiles the weapon needs to move across to gain 100% momentum.
		TilesA=0 //Tiles Accumulated. Number of tiles the weapon has moved across.
		var/KageBunshin=0
		var
			Owner
			ChakraEnhance=0
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		New()
			..()
			icon_state=""
			spawn()
				src.CheckAmount()
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/Headband/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUArmor/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUHandGuards/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM))
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=30);src.dir=turn(src.dir,45);walk(src,src.dir)
					M.Deflection=0
					if(prob(1))
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.Deflection)
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40)
					M.Deflection=0
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40);src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					return
				if(M.Dodging)
					M.Dodge2()
					src.loc=M.loc
					return
				if(M.sphere)
					src.loc=M.loc
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(prob(M.SensoryRange*5))
					src.loc=M.loc;M<<"You quickly dodged the [src]!";return
				var/ThrowingStrengthz=O.ThrowingStrength
				if(ThrowingStrengthz>10)
					ThrowingStrengthz=10+((O.ThrowingStrength-10)/4)
				var/damage=M.maxhealth*(0.01*(src.TilesA+(ThrowingStrengthz/2)+(O.WeaponMaster/2)))
				if(prob(5))
					O.Percision+=0.2;if(O.Percision>10) O.Percision=10
				if(prob(O.Percision*3))
					damage*=2
				if(src.ChakraEnhance)
					damage*=1.5
				M.DamageProc(damage,"Health",O)
				view(M) << "[M] was hit by [O]'s shuriken for [damage] damage!!"
				viewers(M)<<sound('SFX/Slice.wav',0,volume=35)
				Blood(M.x,M.y,M.z)
				M.Death(O)
				if(src.Exploding)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
				if(O.PoisonOn)
					M.Poisoned()
					O<<"You managed to hit [M] with your weapon. The poison soothing into their bloodstream.."
					O.PoisonOn=0
				del(src)
			if(isobj(A))
				var/obj/Q = A
				if(istype(Q,/obj/Jutsu/Elemental/Katon/))//Just added 6/19/2013
					return
				if(istype(Q,/obj/WEAPONS/Shuriken))
					var/obj/WEAPONS/Shuriken/QAC=Q
					if(QAC.Owner==src.Owner)
						src.loc=QAC.loc
						return
				if(Q.icon=='Icons/New Base/Weapons/kunai.dmi')
					view(6)<<sound('SFX/KunaiDeflect.wav',0,volume=40);src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src);flick("clang",Q)
					sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
						del(src)
				else
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
		Move()
			if(src.TilesA>0)
				if(src.TilesA<src.TileMax)
					sleep((1/(src.TilesA*2)))
			..()
			if(src.TileMax>src.TilesA)
				TilesA++
		Del()
			if(src.ShadowClone)
				var/obj/SmokeCloud/S=new();S.loc = locate(src.x,src.y,src.z)
			else
				var/obj/Weapons/K=new();K.ShadowClone=src.ShadowClone
				var/random=rand(1,6)
				if(random==1)
					K.icon_state = "shuriken"
				if(random==2)
					K.icon_state = "shuriken2"
				else
					K.icon_state = "shuriken3"
				K.loc=src.loc
			..()
	WindmillShuriken
		name="Windmill Shuriken"
		oname="Windmill Shuriken"
		icon='windmill.dmi'
		HandedWeapon="One"
		PlacementWeight=45
		WhatDoesItDo="Throw"
		density=1
		ammount=1
		TileMax=5//Maximum Number of tiles the weapon needs to move across to gain 100% momentum.
		TilesA=0 //Tiles Accumulated. Number of tiles the weapon has moved across.
		var
			tmp/Owner
			ChakraEnhance=0
		proc
			CheckAmount()
				src.name= "[oname]"
		proc
			GetStuck()
				var/mob/M=src.Owner
				if(!M.client)
					del(src)
				if(src.icon_state!="Stuck")
					src.Owner=null
					src.icon_state="Stuck"
					walk(src,0)
					spawn(300)
						del(src)
		New()
			..()
			icon_state=""
			spawn()
				src.CheckAmount()
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/Headband/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUArmor/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUHandGuards/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM/5))
					view(M)<<sound('SFX/SwordClash.wav',0,volume=40);src.dir=turn(src.dir,45);walk(src,src.dir);M.Deflection=0;sleep(5)
					return
				if(M.Deflection||M.KagDance=="Karamatsu")
					viewers(M)<<sound('SFX/SwordClash.wav',0,volume=40)
					if(prob(1))
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					if(prob(M.DeflectionZ*2))
						spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
						viewers(src)<<sound('SFX/SwordClash.wav',0,volume=40);src.dir=turn(src.dir,45);walk(src,src.dir)
						flick("clang",src);M.Deflection=0
						sleep(5)
						src.GetStuck()
						return
					else
						ReturnMovement(M)
						spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
						viewers(src)<<sound('SFX/SwordClash.wav',0,volume=40)
						M.HitBack(1,src.dir)
						if(prob(15))
							M.Deflection=0
						return
				if(M.Dodging)
					M.Dodge2()
					src.loc=M.loc
					return
				if(M.sphere)
					src.loc=M.loc
					src.GetStuck()
				if(prob(M.SensoryRange)||M.rank=="ANBU"&&!O.client&&!M.client)
					src.loc=M.loc;M<<"You quickly dodged the [src]!";return
				if(O)
					var/damage=M.maxhealth*(0.1*(src.TilesA+round(O.ThrowingStrength/5)))
					if(prob(5))
						O.Percision+=0.2;if(O.Percision>10) O.Percision=10
					if(prob(O.Percision*3))
						damage*=1.25
					if(src.ChakraEnhance)
						damage=damage*1.25
					if(damage>550)
						damage=550
					M.DamageProc(damage,"Health",O)
					view(M) << "[M] was hit by [O]'s windmill shuriken for [damage] damage!!"
					viewers(M)<<sound('SFX/Slice.wav',0,volume=40)
					Blood(M.x,M.y,M.z)
					M.Death(O)
					src.loc=M.loc
				else
					del(src)
				return
			if(isobj(A))
				var/obj/Q = A
				if(istype(Q,/obj/WEAPONS/))
					viewers(src,6)<<sound('SFX/SwordClash.wav',0,volume=40);Q.dir=turn(Q.dir,45);walk(Q,Q.dir)
					flick("clang",src);flick("clang",Q)
					sleep(5)
					if(!(istype(Q,/obj/WEAPONS/WindmillShuriken)))
						del(Q)
				src.GetStuck()
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.GetStuck()
		Move()
			if(src.TilesA>0)
				if(src.TilesA<src.TileMax)
					sleep((1/(src.TilesA*2)))
			..()
			if(src.TileMax>src.TilesA)
				if(prob(45))
					TilesA++
			if(src.TilesA>=src.TileMax) src.TilesA=src.TileMax


proc
	ReturnMovement(mob/M)
		M.RestrictOwnMovement=1
		spawn(10)
			M.RestrictOwnMovement=0

//Kunai

//Makibishi
obj
	Makibishi
		icon = 'Makibishi.dmi'
		icon_state = "Makibishi"
		PlacementWeight=2
		density=1
		New()
			..()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "Makibishi ([src.ammount])"
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up [src]"
				var/counter = 0
				for(var/obj/Makibishi/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
					src.CheckAmount()
				else
					for(var/obj/Makibishi/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "Makibishi ([O.ammount])"
						del(src)
			Place()
				if(src.ammount<=0)
					del(src)
				else
					var/randdrop=rand(1,5)
					if(randdrop>src.ammount)
						randdrop=src.ammount
					usr<<"You drop [randdrop] Makibishi on the ground."
					while(randdrop>0)
						var/obj/Makibishi/M = new()
						M.loc=usr.loc
						M.icon_state=""
						randdrop--
						src.ammount--
						M.pixel_x=rand(-9,9)
						M.pixel_y=rand(-9,9)
						sleep(1)
					src.CheckAmount()
			Drop()
				if(src.ammount<=0)
					del(src)
				else
					var/drop = input(usr,"How many Makibishi do you wish to drop?")as num
					if(src.ammount<drop)
						usr<<"You don't have that many to drop.";return
					if(drop == 0)
						usr<<"You can not do that";return
					if(drop < 0)
						usr<<"You can not do that";return
					if(src.ammount>=drop)
						src.ammount-=drop
						var/obj/Makibishi/B = new/obj/Makibishi
						B.loc=locate(usr.x,usr.y-1,usr.z)
						B.ammount=drop
						view(usr)<<"[usr] drops [drop] Makibishi spikes."
						src.CheckAmount()

mob/Bump(turf/src)
	if(istype(src,/turf))
		if(usr.BeingHitBack)
			if(src.density)
				var/Damage=rand(25,40)
				Damage=Damage*BeingHitBack
				usr.DamageProc(Damage,"Stamina",usr)
				if(usr.BeingHitBack<4)
					viewers()<<sound('SFX/HitMedium.wav',0)
				if(usr.BeingHitBack>=4)
					usr.CreateSmoke("Light")
					viewers()<<sound('SFX/HitStrong.wav',0)
				usr.BeingHitBack=0
	if(istype(src,/obj/))
		if(usr.BeingHitBack)
			if(src.density)
				var/Damage=rand(25,40)
				Damage=Damage*BeingHitBack
				usr.DamageProc(Damage,"Stamina",usr)
				if(usr.BeingHitBack<4)
					viewers()<<sound('SFX/HitMedium.wav',0)
				if(usr.BeingHitBack>=4)
					usr.CreateSmoke("Light")
					viewers()<<sound('SFX/HitStrong.wav',0)
				usr.BeingHitBack=0

obj
	WindmillShuriken
		name="Windmill Shuriken"
		icon = 'wskillcards.dmi'
		icon_state="WShuriken"
		density=1
		oname="Windmill Shuriken"
		PlacementWeight=25
		var/Owner
		Click()
			if(src.ammount==1)
				usr<<"This is 1 Windmill Shuriken."
			else
				usr<<"There are [src.ammount] Windmill Shuriken here."
		New()
			..()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			Equip()
				var/list/buttons = list("Left","Right")
				sd_Alert(usr, "Which hand do you wish to equip/unequip the Windmill Shuriken to?","Equip", buttons, pick(buttons),0,0,"250x250")
				if("Left")
					if(usr.WeaponInLeftHand=="WShuriken")
						usr<<"You unequip the Windmill Shuriken in your left hand.";usr.WeaponInLeftHand="";return
					if(usr.WeaponInLeftHand!="")
						usr<<"You already have something equipped to your left hand!";return
					else
						usr.WeaponInLeftHand="WShuriken";usr<<"You equip the Windmill Shuriken to your left hand."
				if("Right")
					if(usr.WeaponInRightHand=="WShuriken")
						usr<<"You unequip the Windmill Shuriken in your right hand.";usr.WeaponInRightHand="";return
					if(usr.WeaponInRightHand!="")
						usr<<"You already have something equipped to your right hand!";return
					else
						usr.WeaponInRightHand="WShuriken";usr<<"You equip the Windmill Shuriken to your right hand."

			Drop()
				for(var/obj/WindmillShuriken/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input(usr,"How many Windmill Shuriken do you wish to drop?")as num
						if(src.ammount<drop)
							usr<<"You don't have that many to drop.";return
						if(drop == 0)
							usr<<"You can not do that";return
						if(drop < 0)
							usr<<"You can not do that";return
						if(src.ammount>=drop)
							src.ammount-=drop
							var/obj/WindmillShuriken/B=new()
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Windmill Shuriken."
							if(src.ammount<=0)
								if(usr.WeaponInLeftHand=="WShuriken")
									usr.WeaponInLeftHand=""
								if(usr.WeaponInRightHand=="WShuriken")
									usr.WeaponInRightHand=""
								del(src)
		//	Get()
		//		set src in oview(1)
		//		usr<<"You picked up [src]"
		//		var/counter = 0
		//		for(var/obj/WindmillShuriken/O in usr.contents)
//
		//			counter+=1
		//		if(counter<=0)
		//			Move(usr)
		//		else
		//			for(var/obj/WindmillShuriken/O in usr.contents)
		//				O.ammount+=src.ammount
		//				O.name= "[O.name] ([O.ammount])"
		//				del(src)
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				if(prob(1))
					O.Percision+=pick(0.1,0.3);if(O.Percision>10) O.Percision=10
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/Headband/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUArmor/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUHandGuards/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM))
					view(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir);M.Deflection=0;sleep(5)
//					if(src.Exploding)
//						var/obj/Explosion/K = new /obj/Explosion;K.loc=src.loc
//					del(src)
				if(M.Deflection)
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
					viewers(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,-45);walk(src,src.dir);M.Deflection=0;return
				if(M.sphere)
					src.loc=M.loc;del(src)
				if(prob(M.SensoryRange*5))
					src.loc=M.loc;M<<"You quickly dodged the [src]!";return
				var/damage=M.maxhealth*(0.23+O.WeaponMaster*0.01)
				if(prob(src.Percision*3))
					M.health -= damage*2
					viewers(M) << "[M] was hit by [O]'s Windmill shuriken for [damage] damage!!"
					viewers(M)<<sound('SFX/Slice.wav',0)
					spawn()Blood(M.x,M.y,M.z)
					M.Death(O)
				else
					M.health -= damage
					viewers(M) << "[M] was hit by [O]'s Windmill shuriken for [damage] damage!!"
					viewers(M)<<sound('SFX/Slice.wav',0)
					Blood(M.x,M.y,M.z)
					M.Death(O)
				del(src)
			if(isobj(A))
				var/obj/Q = A
				if(Q.icon=='Icons/New Base/Weapons/kunai.dmi'||Q.icon=='shuriken.dmi')
					view(src)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir)
					flick("clang",src);flick("clang",Q)
					sleep(5)

//////////////////////////////////////////////////////////
//Explosion Tag
mob/var/tmp/WeaponExploding=0
mob/var/tmp/TagStuck=0
mob/var/tmp/CanSetTag=1
obj
	ExplodingTag
		name = "Exploding Tag"
		icon = 'explodingtag.dmi'//dont have a base icon so cant make weights icon!lol
		PlacementWeight=1
		Click()
			if(src.Owner==usr&&usr.icon_state=="handseal")
				if(src.tagset)
					usr.chakra-=400
					src.Explode()
		var
			tagset
			Owner
		proc
			Explode()
				if(src.tagset)
					src.icon_state="explode"
					sleep(10)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=usr;sleep(5)
					del(src)
		verb
			Look()
				usr<<"This is an Exploding Tag."
			Attach_Tags_To_Weapons()
				set desc = "Place an exploding note on a weapon when you throw it."
				alert(usr,"This lets you toggle attaching exploding notes to your kunai when you throw them.")
				if(usr.WeaponExploding)
					usr.WeaponExploding=0;usr<<"You remove the Exploding tags from your weapons.";return
				else
					usr.WeaponExploding=1;usr<<"You attach the Exploding tags onto your weapons.";return
			Drop()
				for(var/obj/ExplodingTag/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input(usr,"How many Exploding Tags do you wish to drop?")as num
						if(drop>src.ammount)
							usr<<"You don't have that many to drop.";return
						if(drop == 0)
							usr<<"You can not do that";return
						if(drop < 0)
							usr<<"You can not do that";return
						if(src.ammount>=drop)
							src.ammount-=drop
							var/obj/ExplodingTag/B = new/obj/ExplodingTag
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Exploding Tags."
							if(src.ammount<=0)
								del(src)
							B.name= "Exploding Tag ([B.ammount])"
			Get()
				set src in oview(1)
				if(src.tagset)
					usr<<"Its been Set already"
					return
				else
					usr<<"You picked up an [src]"
					var/counter=0
					for(var/obj/ExplodingTag/O in usr.contents)
						counter+=1
					if(counter<=0)
						Move(usr)
					else
						for(var/obj/ExplodingTag/O in usr.contents)
							O.ammount+=src.ammount
							O.name= "Exploding Tag ([O.ammount])"
							del(src)

			SetTag()
				if(!usr.CanSetTag)
					usr<<"Wait the damn delay!";return
				else
					if(usr.firing&&!usr.Mogu)
						usr<<"You can't do this right now"
						return
					if(usr.FrozenBind=="Shibari")
						return
				/*usr.Target()
				if(!usr.ntarget)
					var/mob/M = usr.target
					if(get_dist(usr,M)<=1)
						usr<<output("<font color=red>You place a tag on [M]!</font>","Attack")
						M.TagStuck=1
						if(prob(20+(M.Focus/10)))
							M<<output("<font color=red>You notice a tag has been stuck to your leg! Quick! Press C to take it off!</font>","Attack")
						spawn(20)
							if(M.TagStuck)
								M.StunAdd(5)
								var/obj/Jutsu/Explosion/K = new /obj/Jutsu/Explosion
								K.loc=M.loc;K.Owner=usr
						return*/
					if(!src.tagset)
						if(usr.Clan!="Basic")
							var/X=0
							for(var/obj/ExplodingTag/C in world)
								if(C.Owner==usr)
									X++
							if(X>5)
								usr<<"You've already placed enough tags.";return
						usr.Frozen=1
						spawn(20)
							usr.Frozen=0
						var/obj/ExplodingTag/B=new()
						B.loc=locate(usr.x,usr.y-1,usr.z)
						B.layer=usr.layer
						B.Owner=usr
						B.tagset=1
						B.icon_state="fire"
						usr.CanSetTag=0
						spawn(150)
							usr.CanSetTag=1
						for(var/obj/ExplodingTag/O in usr.contents)
							src.ammount-=1
							if(O.ammount==0)
								del(src)
							O.name= "Exploding Tag ([src.ammount])"


///////////////////////////////////////////////////////////////
obj/NinjaEquipment/ChakraPaper
	icon='wskillcards.dmi'
	icon_state="ChakraPaper"
	ammount=1
	oname="Chakra Paper"
	proc
		CheckAmount()
			src.name= "[oname] ([src.ammount])"
	New()
		..()
		spawn()
			src.CheckAmount()
	verb
		Look()
			var/Desc="This is a Chakra Paper. By placing your chakra into it, you can understand what your element is and begin element training."
			usr<<"[Desc]"
		/*Convert()
			usr<<"You place a little bit of your Chakra into the Chakra Paper. Wait for a litte bit."
			sleep(100)
			if(usr.NinjutsuKnowledge<20)
				usr<<"Nothing happened. (You need more Ninjutsu Knowledge before you can gain an element."
				return
			if(usr.Element=="Fire")
				usr<<"The paper begins to burn."
				sleep(11)
				if(usr.FireE)
					del(src)
				usr<<"You have Fire Chakra Nature!"
				usr.FireE=1
				del(src)
			if(usr.Element=="Water")
				usr<<"The paper becomes wet."
				sleep(11)
				if(usr.WaterE)
					del(src)
				usr<<"You have Water Chakra Nature!"
				usr.WaterE=1
				del(src)
			if(usr.Element=="Wind")
				usr<<"The paper rips in two."
				sleep(11)
				if(usr.WindE)
					del(src)
				usr<<"You have Wind Chakra Nature!"
				usr.WindE=1
				del(src)
			if(usr.Element=="Earth")
				usr<<"The paper fell apart."
				sleep(11)
				if(usr.EarthE)
					del(src)
				usr<<"You have Earth Chakra Nature!"
				usr.EarthE=1
				del(src)
			if(usr.Element=="Lightning")
				usr<<"The paper crumbled up."
				sleep(11)
				if(usr.LightningE)
					del(src)
				usr<<"You have Lightning Chakra Nature!"
				usr.LightningE=1
				del(src)*/
		Get()
			set src in oview(1)
			usr<<"You picked up a [src]"
			src.icon_state=""
			var/counter=0
			for(var/obj/NinjaEquipment/ChakraPaper/O in usr.contents)
				counter+=1
			if(counter<=0)
				Move(usr)
			else
				for(var/obj/NinjaEquipment/ChakraPaper/O in usr.contents)
					O.ammount+=src.ammount
					O.name= "[O.name] ([O.ammount])"
		Drop()
			for(var/obj/NinjaEquipment/ChakraPaper/O in usr.contents)
				if(O.ammount<=0)
					del(src)
				else
					var/drop = input(usr,"How many Chakra Papers do you wish to drop?")as num
					if(src.ammount>drop)
						usr<<"You don't have that many to drop.";return
					if(drop == 0)
						usr<<"You can not do that";return
					if(drop < 0)
						usr<<"You can not do that";return
					if(src.ammount>=drop)
						src.ammount-=drop
						var/obj/NinjaEquipment/ChakraPaper/B=new()
						B.loc=locate(usr.x,usr.y-1,usr.z)
						B.ammount=drop
						view(usr)<<"[usr] drops [drop] the Chakra Paper."
						if(src.ammount<=0)
							del(src)
						B.name= "Chakra Paper ([B.ammount])"
mob/proc
	HealthPack()
		if(src.GateIn=="Life"||src.GateIn=="Wound"||src.GateIn=="Limit")
			src<<"Your body is under intense pressure! You can't apply a healthpack right now!"
			return
		src<<"You open up the Healthpack and begin to use it."
		src.firing=1;src.UsingHealthPack=1
		spawn(50)
			src.firing=0;src.UsingHealthPack=0
		var/CountDown=50
		while(CountDown>0&&src.UsingHealthPack)
			src.health+=(src.maxhealth*0.008);src.stamina+=(src.maxstamina*0.005)
			if(src.health>src.maxhealth) src.health=src.maxhealth
			if(src.stamina>src.maxstamina) src.stamina=src.maxstamina
			CountDown--
			sleep(3)
		if(src.CBleeding)
			src<<"You begin to apply to your wound."
			sleep(100)
			src.CBleeding=0
			src<<"You stop the bleeding!"
obj/NinjaEquipment
	Healthpack
		icon='wskillcards.dmi'
		icon_state="Healthpack"
		ammount=1
		oname="Health Pack"
		PlacementWeight=50
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			UseHealthpack()
				set name="Use Healthpack"
				if(usr.firing||usr.Frozen||usr.FrozenBind!="")
					return
				if(usr.health>usr.maxhealth&&usr.stamina>usr.maxstamina)
					usr<<"You are in top condition. You have no need to use this, don't waste it!";return
				else
					spawn()
						usr.HealthPack()
					for(var/obj/NinjaEquipment/Healthpack/O in usr.contents)
						O.ammount--
						O.name="Health Pack ([O.ammount])"
						if(O.ammount<=0)
							del(O)
			Drop()
				usr<<"You drop the Healthpack(s)!"
				del(src)

	Ointment
		icon='wskillcards.dmi'
		icon_state="Ointment"
		ammount=1
		oname="Ointment"
		PlacementWeight=10
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			UseHealthpack()
				set name="Use Ointment"
				if(usr.ImmuneToDeath||usr.firing||usr.Frozen||usr.FrozenBind!="")
					return
				else
					for(var/obj/NinjaEquipment/Ointment/O in usr.contents)
						O.ammount--
						O.name= "Ointment ([O.ammount])"
						if(O.ammount<=0)
							del(O)
					usr<<"You begin to apply Ointment"
					usr.Frozen=1;usr.firing=1
					sleep(100)
					if(!usr.knockedout)
						usr.health+=250;if(usr.health>=usr.maxhealth) usr.health=usr.maxhealth
					usr.Frozen=0;usr.firing=0
			Drop()
				usr<<"You drop the Ointment(s)!"
				del(src)
	SmokeBomb
		icon='wskillcards.dmi'
		icon_state="smokebomb"
		ammount=1
		oname="SmokeBomb"
		PlacementWeight=15
		var/Delay=0
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			Look()
				usr<<"This is a Smoke Bomb."
			//Attach_Smoke_Bombs_To_Weapons()
			//	set desc = "Place a smoke bomb on a weapon when you throw it."
			//	alert(usr,"This lets you toggle attaching smoke bombs to your weapons when you throw them.")
			//	if(usr.WeaponExploding)
			//		usr.WeaponExploding=0;usr<<"Toggled off";return
			//	else
			//		usr.WeaponExploding=1;usr<<"Toggled on";return
			Drop()
				for(var/obj/NinjaEquipment/SmokeBomb/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input(usr,"How many Smoke Bombs do you wish to drop?")as num
						if(src.ammount>drop)
							usr<<"You don't have that many to drop.";return
						if(drop <= 0)
							usr<<"You can not do that";return
						if(src.ammount>=drop)
							src.ammount-=drop
							usr.SaveK()
							var/obj/NinjaEquipment/SmokeBomb/B = new/obj/NinjaEquipment/SmokeBomb
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Smoke Bomb."
							if(src.ammount<=0)
								del(src)
							B.name= "Smoke Bomb ([B.ammount])"
			Get()
				set src in oview(1)
				usr<<"You picked up an [src]"
				var/counter=0
				for(var/obj/NinjaEquipment/SmokeBomb/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/NinjaEquipment/SmokeBomb/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "Smoke Bomb ([O.ammount])"
						del(src)
			UseBomb()
		//		usr<<"Temporarily Disabled Until a More Efficient Method of Creating Smoke can be found."
		//		return
				if(Delay)
					usr<<"Wait the Delay before using this again.";return
				Delay=1
				spawn(150)
					Delay=0
			//	usr.SmokeBomb("Strong")
				usr.SSmokeBomb()
				for(var/obj/NinjaEquipment/SmokeBomb/O in usr.contents)
					O.ammount--
					O.name= "Smoke Bomb ([O.ammount])"
					if(O.ammount<=0)
						del(O)
	DeluxeSmokeBomb
		icon='wskillcards.dmi'
		icon_state="dsmokebomb"
		ammount=1
		oname="Deluxe Smoke Bomb"
		PlacementWeight=5
		proc
			CheckAmount()
				src.name= "[oname] ([src.ammount])"
		verb
			Look()
				usr<<"This is a Smoke Bomb."
			//Attach_Smoke_Bombs_To_Weapons()
			//	set desc = "Place a smoke bomb on a weapon when you throw it."
			//	alert(usr,"This lets you toggle attaching smoke bombs to your weapons when you throw them.")
			//	if(usr.WeaponExploding)
			//		usr.WeaponExploding=0;usr<<"Toggled off";return
			//	else
			//		usr.WeaponExploding=1;usr<<"Toggled on";return
			Drop()
				for(var/obj/NinjaEquipment/DeluxeSmokeBomb/O in usr.contents)
					if(O.ammount<=0)
						del(src)
					else
						var/drop = input(usr,"How many Deluxe Smoke Bombs do you wish to drop?")as num
						if(src.ammount>drop)
							usr<<"You don't have that many to drop.";return
						if(drop <= 0)
							usr<<"You can not do that";return
						if(src.ammount>=drop)
							src.ammount-=drop
							usr.SaveK()
							var/obj/NinjaEquipment/DeluxeSmokeBomb/B = new/obj/NinjaEquipment/DeluxeSmokeBomb
							B.loc=locate(usr.x,usr.y-1,usr.z)
							B.ammount=drop
							view(usr)<<"[usr] drops [drop] Deluxe Smoke Bomb."
							if(src.ammount<=0)
								del(src)
							B.name= "Deluxe Smoke Bomb ([B.ammount])"
			Get()
				set src in oview(1)
				usr<<"You picked up an [src]"
				var/counter=0
				for(var/obj/NinjaEquipment/DeluxeSmokeBomb/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/NinjaEquipment/DeluxeSmokeBomb/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "Deluxe Smoke Bomb ([O.ammount])"
						del(src)
			UseDeluxeBomb()
				usr.LSmokeBomb()
				for(var/obj/NinjaEquipment/DeluxeSmokeBomb/O in usr.contents)
					O.ammount--
					O.name= "Deluxe Smoke Bomb ([O.ammount])"
					if(O.ammount<=0)
						del(O)
obj/NinjaEquipment/TheWires
	icon='Weapons.dmi'
	icon_state="Wire"
	density=1
	var/Owner
	New()
		..()
		spawn()
			while(src)
				sleep(1)
				for(var/mob/M in src.loc)
					var/mob/O=src.Owner
					if(M==O)
						return
					M.StunAdd(1)
				sleep(11)
		spawn(1800)
			del(src)
	Bump(A)
		if(istype(A,/mob/))
			var/mob/M=A
			var/mob/O=src.Owner
			if(M.FrozenBind==""&&!M.ImmuneToDeath)
				M.FrozenBind="Wire"
				src.loc=M.loc;walk(src,0)
				src.icon_state="WireTied"
				src.layer=MOB_LAYER+1
				src.density=0
				M.caughtby="[O]"
			else
				src.loc=M.loc;del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			var/obj/T = A
			if(T.density)
				del(src)
	Move()
		if(src.icon_state=="Wire")
			var/obj/NinjaEquipment/TheWires/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;L.density=0;L.layer=src.layer
		..()
	Del()
		var/mob/O=src.Owner
		for(var/mob/M in world)
			if(M&&M.caughtby=="[O]"&&M!=O)
				M.caughtby=null
				if(M.FrozenBind=="Wire")
					M.FrozenBind=""
		..()
obj/KiriGate
	icon='Warp2.dmi'
	icon_state="hahaclosed"
	density=1
	var
		tmp/openlocation
		Owner
	New()
		..()
		spawn(1)
			flick("dark",src)
			sleep(9)
			src.icon_state="open"
		spawn(100)
			del(src)

	Del()
		flick("dark2",src)
		sleep(9)
		..()
mob/var/tmp/VineForestCD
mob/Bump(obj/src)
	if(istype(src,/obj))//if it's obj...
		if(istype(src,/obj/Makibishi))
			usr.health-=rand(50,55)
			usr.Running=0
			usr.runningspeed=0
			if(prob(75))
				viewers(usr)<<"[usr] stepped on a Makibishi spike and pierced his foot!"
			del(src)
			return
		if(istype(src,/obj/Jutsu/Elemental/Mokuton/VineForest))
			if(usr.VineForestCD!=1&&usr.health>0&&!usr.knockedout&&!usr.ImmuneToDeath)
				usr.health-=rand(125,150)
				usr.runningspeed=0
				usr.VineForestCD=1
				spawn(20)
					usr.VineForestCD=0
			if(prob(75))
				viewers(usr)<<"[usr] bumped into the vine and was damaged!"
			return
		if(istype(src,/obj/KiriGate))
			var/obj/KiriGate/A=src
			if(usr.loc!=A.loc)
				viewers(usr)<<"<i>[usr] steps inside the blackness..</i>"
				usr.loc=A.loc
				sleep(5)
				usr.loc=A.openlocation

	..()
obj/proc
	BurnWire()
		if(istype(src,/obj/NinjaEquipment/TheWires)==0)
			return
		var/obj/NinjaEquipment/TheWires/ACDC=src
		var/wl=ACDC.loc
		var/n=rand(5,7)
		spawn(2)
			while(n>0)
				n--
				var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();
				AA.loc=wl;
				AA.Owner=ACDC.Owner
			del(ACDC)



mob/proc/Jutsusealed(time)
		src.firing=1;
		sleep(6*time)
		src.firing=0;



obj
	Sensors
		var/connectedObj
		Crossed(O)
			if(ismob(O))
				var/mob/M = O
				var/obj/Proxy_Bomb/Pb = connectedObj
				if((M.chakra>=300)&&(Pb.launching==0))
					M.chakra-=300
					M<<"You feel as though some Chakra has been stolen from you!"
					Pb.objchakra+=300
					Pb.launching=1
					Pb.icon_state = "smoke"
					Pb.layer = MOB_LAYER
					Pb.Kunai_spawn()
obj
	Proxy_Bomb
		var/weight = 40
		var/launching=0
		var/cost = 1000
		var/objchakra = 0
		var/Owner
		var/BeingSet = 0
		var/list/Sens[0]
		icon = 'Icons/New Base/Weapons/Bomb.dmi'
		icon_state = "bomb"
		verb
			Set_Bomb()
				set src in usr.contents
				if(src.BeingSet)
					usr<<"It's already being set!"
					return
				src.Owner = usr
				src.BeingSet=1
				usr<<"You are now placing the Chakra Proximity Bomb! This will take a few moments!"
				usr.FrozenBind="Setting Bomb"
				usr.icon_state = "beastman"
				usr.dir = usr.dir
				sleep(20)
				usr.FrozenBind=""
				usr<<"You have set the Chakra Proximity Bomb! It will activate in 2 seconds!"
				src.loc = usr.loc
				usr.icon_state = ""
				sleep(20)
				Sensory_spawn()
				icon_state = "igniting"
		proc
			Sensory_spawn()
				var/i
				var/j
				for(i=-1;i<=1;i++)
					for(j=-1;j<=1;j++)
						var/obj/Sensors/S = new()
						S.connectedObj = src
						S.loc = src.loc
						S.x = src.x+i
						S.y = src.y+j
						Sens.Add(S)
			Kunai_spawn()
				var/i=1
				while(weight>0)
					sleep(2)
					var/rounds = 6
					while(rounds>0)
						sleep()
						var/obj/WEAPONS/Kunai/K=new()
						K.icon='Icons/New Base/Weapons/kunai.dmi'
						K.icon_state="Throwz"
						K.Owner = src.Owner
						K.loc = src.loc
						if(i>8)
							i=1
						if(i==1)
							K.dir=NORTH
						if(i==2)
							K.dir=NORTHEAST
						if(i==3)
							K.dir=EAST
						if(i==4)
							K.dir=SOUTHEAST
						if(i==5)
							K.dir=SOUTH
						if(i==6)
							K.dir=SOUTHWEST
						if(i==7)
							K.dir=WEST
						if(i ==8)
							K.dir=NORTHWEST
						rounds--
						i++
						walk(K,K.dir)
					weight-=8
				for(var/O in Sens)
					del(O)
				spawn(5) del src
		New()
			..()