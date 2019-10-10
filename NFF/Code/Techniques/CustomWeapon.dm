mob/Traveling_Sales_Merchant
	icon='Map/Turfs/HakumeiGetsu.dmi'
	icon_state="Moon2"
	name = "Membershop Sales Merchant"
	CNNPC = 1
	health = 9999999999999999999999999999999999999999999999
	verb
		Speak()
			set name = "Speak"
			set src in oview(2)
			set category = "Merchant"
			usr<<"Merchant: Good day to you ninja. You can now import Custom Items you made yourself for only 100000 Yen. Of course, I only give it to people who have a Membership Card!"
			if(usr.GM)
				sleep(1)
				usr<<"Merchant: E-e-xcuse me I'm sorry. I didn't realize you were a GM. You can import custom icons for free. Just show me which file to import."
				switch(input("Do you want me to make something for you?") in list("Yes","No"))
					if("Yes")
						var/icon/eupload
						eupload = input(usr,"Choose Icon to Upload","Icon") as icon
						switch(input("What type of Item is it?","Item Type",text) in list("Overlay","Underlay","None"))
							if("Overlay")
								NAME
								var/name = input("Enter Name:","Name") as text
								var/ammount= input("Amount","Amount") as num
								if(ammount>5)
									usr<<"Thats too many! 5 is the max."
									ammount=5
								if(fexists("uploadedicons/[name].sav"))
									usr << "There is already an Icon uploaded with this name please rename your icon!"
									goto NAME
								var/Q=input(usr,"Is this a special organization-only item?") in list("Yes","No")
								var/Choice
								if(Q=="Yes")
									if(usr.Organization==""||usr.OrganizationID==0)
										usr<<"You don't belong to any sort of guild or organization."
										Choice=0
									else
										Choice=usr.OrganizationID
								else
									Choice=0
								while(ammount>0)
									var/O=new/obj/SpecialItemPrototype
									O:SpecialIcon=eupload
									O:name=name
									O:guildlocked=Choice
									O:CreatorKey=usr.key
									O:Creator=usr.FirstName
									usr.contents+= O
									ammount-=1
									sleep(1)
								var/savefile/F = new("uploadedicons/[name].sav")
								F["icon"]<<eupload

							if("Underlay")
								NAME
								var/name=input("Enter Name:","Name") as text
								var/ammount= input("Amount","Amount") as num
								if(ammount>5)
									usr<<"Thats too many! 5 is the max."
									ammount=5
								if(fexists("uploadedicons/[name].sav"))
									usr << "There is already an Icon uploaded with this name please rename your icon!"
									goto NAME
								var/Q=input(usr,"Is this a special organization-only item?") in list("Yes","No")
								var/Choice=0
								if(Q=="Yes")
									if(usr.Organization==""||usr.OrganizationID==0)
										usr<<"You don't belong to any sort of guild or organization."
									else
										Choice=usr.OrganizationID
								while(ammount>0)
									var/O=new/obj/SpecialUnderPrototype
									O:SpecialIcon=eupload
									O:name=name
									O:guildlocked=Choice
									O:CreatorKey=usr.key
									O:Creator=usr.FirstName
									usr.contents+= O
									ammount-=1
									sleep(1)
								var/savefile/F = new("uploadedicons/[name].sav")
								F["icon"]<<eupload
			else if(usr.client.IsByondMember()||usr.ImportPermission||usr.Subscriber)
				sleep(1)
				usr<<"You flash a membercard."
				switch(input("Oh, so you're a member? Do you want me to make something for you, for only 100,000 Yen?") in list("Yes","No"))
					if("Yes")
						var/icon/eupload
						//var/ename
						if(usr.Yen >= 100000)
							eupload = input(usr,"Choose Icon to Upload","Icon") as icon
							switch(input("What type of Item is it?","Item Type",text) in list("Overlay","Underlay","None"))
								if("Overlay")
									NAME
									var/name = input("Enter Name:","Name") as text
									var/ammount= input("Amount","Amount") as num
									if(ammount>5)
										usr<<"Thats too many! 5 is the max."
										ammount=5
									if(fexists("uploadedicons/[name].sav"))
										usr << "There is already an Icon uploaded with this name please rename your icon!"
										goto NAME
									var/Q=input(usr,"Is this a special organization-only item?") in list("Yes","No")
									var/Choice
									if(Q=="Yes")
										if(usr.Organization==""||usr.OrganizationID==0)
											usr<<"You don't belong to any sort of guild or organization."
											Choice=0
										else
											Choice=usr.OrganizationID
									else
										Choice=0
									while(ammount>0)
										var/obj/O=new/obj/SpecialItemPrototype
										O:SpecialIcon=eupload
										O:name=name
										O:guildlocked=Choice
										O:CreatorKey=usr.key
										O:Creator=usr.FirstName
										usr.contents+= O
										usr.Yen-=100000
										ammount-=1
										sleep(1)
									var/savefile/F = new("uploadedicons/[name].sav")
									F["icon"]<<eupload
								if("Underlay")
									NAME
									var/name=input("Enter Name:","Name") as text
									var/ammount= input("Amount","Amount") as num
									if(ammount>5)
										usr<<"Thats too many! 5 is the max."
										ammount=5
									if(fexists("uploadedicons/[name].sav"))
										usr << "There is already an Icon uploaded with this name please rename your icon!"
										goto NAME
									while(ammount>0)
										var/O=new/obj/SpecialUnderPrototype
										O:SpecialIcon=eupload
										O:name=name
										O:CreatorKey=usr.key
										O:Creator=usr.FirstName
										usr.contents+= O
										usr.Yen-=100000
										ammount-=1
										sleep(1)
									var/savefile/F = new("uploadedicons/[name].sav")
									F["icon"]<<eupload
						else
							usr << "Merchant: My goods are extremely rare and only sold for the top dollar!"
/*							return
mob/NPC/TeaVillagers
	ClothingMembers
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		name = "Membershop Sales Merchant"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		verb
			Speak()
				set name = "Speak"
				set src in oview(2)
				set category = "Merchant"
				usr<<"Merchant: Good day to you ninja. I have a wide array of interesting clothing you might like! But I only give it to people with a Membership Card!"
				if(usr.client.IsByondMember())
					sleep(1)
					usr<<"You flash a membercard."
					switch(input("Oh, so you're a member? Do you want to buy something?") in list("Yes","No"))
						if("Yes")
							switch(input("What would you like?") in list("\
							Witch Hat","Top Hat","Vaizard Mask","Full-Vaizard Mask","\
							Timeskip Sasuke Suit","Cancel"))*/
mob/var/KeyVar=""
obj
	SpecialItemPrototype
		icon = 'Special.dmi'
		var
			worn = 0
			SpecialIcon
			keylocked
			guildlocked
			CreatorKey=""
			Creator=""
			HYI=null //Hide Your Identity
			HYK=null
			DoesCropHair=0
			x1=1
			x2=32
			y1=1
			y2=32
		verb
			Wear()
				if(src.icon=='Special.dmi')
					var/tempicon
					var/savefile/F = new("uploadedicons/[src.name].sav")
					F["icon"]>>tempicon
					src.icon=tempicon
				if(!src.guildlocked)
					if(src.worn == 1)
						src.worn = 0
						//usr.weight-=src.weight
						usr << "You remove the [src.name]."
						usr.overlays-=src.icon
						if(src.HYI)
							usr.name=usr.oname
						if(src.HYK)
							usr.KeyVar=""
					else
						src.worn = 1
						//usr.weight+=src.weight
						//src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
						usr.overlays += src.icon
						usr << "You wear the [src.name]."
						if(src.HYI)
							usr.oname=usr.name;usr.name=src.HYI
						if(src.HYK)
							usr.KeyVar=src.HYK
				else
					if(src.guildlocked==usr.OrganizationID)
						var/icon/I=new(usr.hair)
						if(src.DoesCropHair)
							I.Crop(src.x1,src.y1,src.x2,src.y2)
						if(src.worn == 1)
							src.worn = 0
							usr << "You remove the [src.name]."
							usr.overlays-=src.icon
							if(src.HYI)
								usr.name=usr.oname
							if(src.DoesCropHair)
								usr.overlays-=I
								usr.overlays+=usr.hair
						else
							src.worn = 1
							//src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
							usr.overlays += src.icon
							usr << "You wear the [src.name]."
							if(src.HYI)
								usr.oname=usr.name;usr.name=src.HYI
							if(src.DoesCropHair)
								usr.overlays+=I
								usr.overlays-=usr.hair
					else
						usr<<"This is a special Organization-Only item. You're not permitted to wear it."
						del(src)
			Drop()
				 //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
					if(src.keylocked)
						del(src)
			Get()
				 //was inventory
				set src in oview(1)
				Move(usr)
	SpecialUnderPrototype
		icon = 'Special.dmi'

		var
			worn = 0
			SpecialIcon
		verb
			Wear()
				var/tempicon
				var/savefile/F = new("uploadedicons/[src.name].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					src.icon = tempicon
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.underlays-=tempicon
				else
					src.worn = 1
					//usr.weight+=src.weight
					//src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.underlays += tempicon
					usr << "You wear the [src.name]."
			Drop()
				 //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				 //was inventory
				set src in oview(1)
				Move(usr)
	SpecialWeapon
	SpecialItem
	SpecialWeaponProtected
	SpecialItemProtected