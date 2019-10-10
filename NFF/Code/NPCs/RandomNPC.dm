mob/NPC/RandomNPCs/LeafVillagers
	MinaHaruko
		name="Mina Haruko"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='MadaraH.dmi'
				var/Shirt='Shirt.dmi'
				var/Scarf='Scarf.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,180)
				Shirt+=rgb(255,0,128)
				Scarf+=rgb(255,196,136)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='FemaleEyes.dmi'
				src.overlays+='FemaleEyes.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+=Shirt
				src.overlays+=Scarf
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "I love this place, the flowers are just so beautiful!","[src]",,,,0,"400x150",,style)
	HigaruShin
		name="Higaru Shin"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='narutoH.dmi'
				var/Shirt='Shirt.dmi'
				var/Scarf='Scarf.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				Shirt+=rgb(100,0,0)
				Scarf+=rgb(150,150,150)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='MaleEyes.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+=Shirt
				src.overlays+=Scarf
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Shin's Informational")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Oh, this...This must be information on the former Otokage, Dneezy. This was over hundreds of years ago! Thank you I needed this!","[src]",,,,0,"400x150",,style);usr.CurrentMission="Shin's Informational Completo";return
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Shin's Supplies")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Its been a long time since I've played the role *Ninja* but I think I'd like to kick back into gear. Thanks for the equipment!","[src]",,,,0,"400x150",,style);usr.CurrentMission="Shin's Supplies Completo";return

				else
					var/z=rand(1,5)
					if(z==1)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Hoy, I'm one of the villagers here who study on past ninja! Ivel Shadow is a big interest to me, ever since we've started to find information regarding to the Sound Village!","[src]",,,,0,"400x150",,style)
					if(z==2)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Can you believe Ivel Shadow as betrayed by his friend, Haseo?","[src]",,,,0,"400x150",,style)
					if(z==3)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Ivel Shadow may have been one of the greatest Hokage. It's a pity we have no records on him.","[src]",,,,0,"400x150",,style)
					if(z==4)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Do you know this renewed village was started by Ayo? He was also a great Hyuuga! Without him, the new Konoha would not exist.","[src]",,,,0,"400x150",,style)
					if(z==5)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I wish we knew what destroyed the old Leaf...And the other villages, as a matter of fact.","[src]",,,,0,"400x150",,style)
	Ryu
		name="Ryu"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='bandagesL.dmi'
				src.overlays+='bandagesR.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Ryu's Pacote")//if(usr.CurrentMission=="Check On Uchiha Jack")
					usr<<"Obrigado pelo pacote de armas.";usr.CurrentMission="Ryu's Pacote Completo";usr.OnMission=0;return
				if(usr.CurrentMission=="Ryu's Informar")
					usr<<"Obrigado por me dizer essas informações.";usr.CurrentMission="Ryu's Informar Completo";usr.OnMission=0;return
		//			var/style = "<style>BODY {margin:0;font:arial;background:black;\
		//				color:white;}</style>"
		//			sd_Alert(usr, "Wow busy day. So what do you need to tell me?","[src]",,,,0,"400x150",,style);sd_Alert(usr, "...","[src]",,,,0,"400x150",,style);sd_Alert(usr, "I see. Tell them I got the information. I can't believe it.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Ryu's Informational Complete";usr.OnMission=0;return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Pudera eu voltar ao dia em que eu era um Guarda da vila conhecido pela Folha.","[src]",,,,0,"400x150",,style)
	Librarian
		name="Librarian"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='SasukeTS.dmi'
				var/Shirt='Shirt.dmi'
				var/Scarf='Scarf.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(100,100,0)
				Shirt+=rgb(0,0,0)
				Scarf+=rgb(150,150,150)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='MaleEyes.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+=Shirt
				src.overlays+=Scarf
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "This site is under construction, more so to say. This will be the Leaf Village's official library when it is done!","[src]",,,,0,"400x150",,style);return

	AburameJounin1
		name="Aburame, Izo"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='narutoH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				var/Shirt='SasukeShirt.dmi'
				Shirt+=rgb(180,180,180)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.rank=="Student"&&usr.Clan=="Aburame")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Please don't let the clan down. You must head to the academy, it should be the big building on the right. Very understandable, right?","[src]",,,,0,"400x150",,style);return

				if(usr.rank=="Genin"&&usr.Clan=="Aburame")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Be sure to learn your Clan's techniques.","[src]",,,,0,"400x150",,style);return

				else
					if(usr.Village=="Leaf")
						if(usr.GenSkill>25&&usr.rank!="Genin")
							usr<<"I can teach you a special genjutsu that deals with our clans kekkei genkai.."
							usr.LearnJutsu("False Bug Storm",100000,"FalseBugStorm","False Bug Swarm is a genjutsu that makes the target actually believe a swarm of bugs is feasting on his flesh and chakra and actually impedes his own movement.")
						if(usr.rank=="Hokage")
							if(prob(50))
								var/style = "<style>BODY {margin:0;font:arial;background:black;\
									color:white;}</style>"
								sd_Alert(usr, "Hokage-Sama!","[src]",,,,0,"400x150",,style);return
						if(usr.rank!="Student")
							if(prob(50))
								var/style = "<style>BODY {margin:0;font:arial;background:black;\
									color:white;}</style>"
								sd_Alert(usr, "Have you been doing your mission work?","[src]",,,,0,"400x150",,style);return
					else
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I don't really trust outside villages.","[src]",,,,0,"400x150",,style)
	AburameJounin2
		name="Aburame, Rinn"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='MadaraH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				var/Shirt='SasukeShirt.dmi'
				Shirt+=rgb(180,180,180)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Clan=="Aburame")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "It's always useful to carry a lot of bugs. Look out for losing them or running out of a supply of bugs, that can be bad!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Remember, Kikkaichu are useful because they drain chakra. Always remember that when facing an opponent, their chakra is their most important factor.","[src]",,,,0,"400x150",,style)
					return
				else
					if(usr.Village=="Leaf")
						if(usr.rank=="Hokage")
							if(prob(50))
								var/style = "<style>BODY {margin:0;font:arial;background:black;\
									color:white;}</style>"
								sd_Alert(usr, "Hokage-Sama!","[src]",,,,0,"400x150",,style);return

						if(usr.rank!="Student")
							if(prob(50))
								var/style = "<style>BODY {margin:0;font:arial;background:black;\
									color:white;}</style>"
								sd_Alert(usr, "I'm the Aburame that mainly teaches other Aburame ninja.","[src]",,,,0,"400x150",,style);return
					else
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I don't really trust outside villages.","[src]",,,,0,"400x150",,style)
	AkimichiJounin1
		name="Akimichi, Izoh"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='MadaraH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(180,0,0)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				if(usr.Clan=="Akimichi")
					if(usr.rank=="Student")
						sd_Alert(usr, "It's great that you decided to become a ninja, first thing is first though. Go into the academy so you can start your ways!","[src]",,,,0,"400x150",,style);return

					if(usr.rank=="Genin")
						sd_Alert(usr, "As an Akimichi, be sure to learn all your techniques from Akimichi, Chou. Part of being an Akimichi is knowing the techniques, haha!","[src]",,,,0,"400x150",,style);return

					else
						sd_Alert(usr, "As part of being a Chuunin up, we decide to supply you with these three pills.","[src]",,,,0,"400x150",,style)
						var/count=0
						var/count2=0
						var/count3=0
						for(var/obj/AkimichiPills/Green/A in usr.contents)
							count=1
						for(var/obj/AkimichiPills/Yellow/A in usr.contents)
							count2=1
						for(var/obj/AkimichiPills/Red/A in usr.contents)
							count3=1
						if(count==0)
							sd_Alert(usr, "Here's a Green Pill!","[src]",,,,0,"400x150",,style)
							var/obj/AkimichiPills/Green/C=new()
							C.loc=usr
						sleep(3)
						if(count2==0)
							sd_Alert(usr, "Here's a Yellow Pill!","[src]",,,,0,"400x150",,style)
							var/obj/AkimichiPills/Yellow/D=new()
							D.loc=usr
						sleep(3)
						if(count3==0)
							sd_Alert(usr, "Here's a Red Pill!","[src]",,,,0,"400x150",,style)
							var/obj/AkimichiPills/Red/E=new()
							E.loc=usr
						sd_Alert(usr, "Use them wisely, okay?","[src]",,,,0,"400x150",,style)
						return

				else
					if(usr.Village=="Leaf")
						if(usr.rank=="Hokage")
							sd_Alert(usr, "Hokage-Sama!","[src]",,,,0,"400x150",,style);return
						else
							sd_Alert(usr, "Have you been doing your mission work?","[src]",,,,0,"400x150",,style);return
					else
						sd_Alert(usr, "I don't really trust outside villages.","[src]",,,,0,"400x150",,style);return
	AkimichiJounin2
		name="Akimichi, Ito"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='RyuzakiH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(150,0,0)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				sd_Alert(usr, "We're not fat, we're just chubby!","[src]",,,,0,"400x150",,style);return
	AkimichiJounin3
		name="Akimichi, Raija"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='itachiH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(150,0,0)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				var/XYZ=rand(1,3)
				if(XYZ==1)
					sd_Alert(usr, "My last mission was a success! Don't listen to what anyone says though, I did not eat my enemy!","[src]",,,,0,"400x150",,style);return
				if(XYZ==2)
					sd_Alert(usr, "I was hoping I'd be considered the strongest Akimichi, but that could never happen.","[src]",,,,0,"400x150",,style);return
				if(XYZ==3)
					sd_Alert(usr, "Haha, yeah, of course I'm fat. I'm suppose to be fat, remember?","[src]",,,,0,"400x150",,style);return
	NaraJounin1
		name="Nara, Toi"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='shikaH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.rank=="Student"&&usr.Clan=="Nara")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Ah, welcome! You must be the new Nara. Well, head on to the academy. You should begin your teachings if you want to become a Genin! It's to the left of you in that big red building.","[src]",,,,0,"400x150",,style);return
				if(usr.Clan=="Nara")
					var/randz=rand(1,3)
					if(randz==1)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Welcome to the house of Nara. A respectful clan, we are currently trying to increase our area.","[src]",,,,0,"400x150",,style)
					if(randz==2)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "The Hokage being a Nara brought a lot of famous reactions to our clan!","[src]",,,,0,"400x150",,style)
					if(randz==3)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "One of our fellow Nara ninja is always trying to develop new techniques. If only we had a library.","[src]",,,,0,"400x150",,style)
				else
					if(usr.Village=="Leaf")
						if(usr.rank=="Hokage")
							if(prob(50))
								var/style = "<style>BODY {margin:0;font:arial;background:black;\
									color:white;}</style>"
								sd_Alert(usr, "Hokage-Sama!","[src]",,,,0,"400x150",,style);return
						if(usr.rank!="Student")
							if(prob(50))
								var/style = "<style>BODY {margin:0;font:arial;background:black;\
									color:white;}</style>"
								sd_Alert(usr, "Have you been doing your mission work?","[src]",,,,0,"400x150",,style);return
						var/randzz=rand(1,3)
						if(randzz==1)
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "We need more space in this region.","[src]",,,,0,"400x150",,style)
						if(randzz==2)
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "What brings you to our Clan House?","[src]",,,,0,"400x150",,style)
						if(randzz==3)
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Some say the Nara Clan once had an ancient Kekkai Genkai. I highly doubt that though.","[src]",,,,0,"400x150",,style)
					else
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I don't really trust outside villages.","[src]",,,,0,"400x150",,style)

	NaraJounin2
		name="Nara, Chu"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='PainbodyH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "I have a feeling this clan has a hidden Kekkai Genkai! I know it!","[src]",,,,0,"400x150",,style)
	KusakinJounin1
		name="Kusakin, Ho-En"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='PainbodyH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,200,0)
				var/Shirt='cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.rank=="Student"&&usr.Clan=="Kusakin")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Ah welcome! You must be a new Kusakin ninja. Well this is our clan house. We supposedly have a whole section dedicated to us in Leaf, of course residence live here so it's not as tight as the other sections. You might want to head out to the academy down to the west, see if you can get there..","[src]",,,,0,"400x150",,style);return

				if(usr.Village=="Leaf")
					if(usr.rank=="Hokage")
						if(prob(50))
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Hokage-Sama!","[src]",,,,0,"400x150",,style);return
					if(usr.rank!="Student")
						if(prob(50))
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Have you been doing your mission work?","[src]",,,,0,"400x150",,style);return
					var/randzz=rand(1,3)
					if(randzz==1)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "We are named Kusakin after the great Mokuton wielder that moved to Grass. After we took over Grass, we finally decided to settle down into Leaf a couple years later.","[src]",,,,0,"400x150",,style)
					if(randzz==2)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Records have shown that we originated from this Village. Go figure that we just happen to come back to it right?","[src]",,,,0,"400x150",,style)
					if(randzz==3)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "In the past the Kusakin Clan was once known as the Senju Clan. That's right we created this village, originally.","[src]",,,,0,"400x150",,style)
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "I don't really trust outside villages.","[src]",,,,0,"400x150",,style)
	HyuugaJounin1
		name="Hyuuga, Sato"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='PainbodyH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Clan=="Hyuuga")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					if(usr.rank=="Student")
						sd_Alert(usr, "Are you ready to become a ninja? Don't disgrace the Hyuuga clan, head down to the academy to the left of here.","[src]",,,,0,"400x150",,style);return
					if(usr.rank=="Genin")
						sd_Alert(usr, "I hope you understand the Byakugan, it is a very useful tool and very special among the Hyuuga Clan.","[src]",,,,0,"400x150",,style);return
					else
						sd_Alert(usr, "Each stance is special and has its own designation.","[src]",,,,0,"400x150",,style);return

				if(usr.Village=="Leaf")
					if(usr.rank=="Hokage")
						if(prob(50))
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Hokage-Sama!","[src]",,,,0,"400x150",,style);return
					if(usr.rank!="Student")
						if(prob(50))
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Have you been doing your mission work?","[src]",,,,0,"400x150",,style);return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "I don't really trust outside villages.","[src]",,,,0,"400x150",,style)
mob/NPC/RandomNPCs/SoundVillagers
	KumojinNpc
		name="Kumojin, Rotate"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Sound"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='shikaH.dmi';Hair+=rgb(0,0,0)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='Sleeveless Shirt.dmi';src.overlays+='Scarf.dmi'
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "I am the Kumojin assigned to help out new fellow Kumojin.","[src]",,,,0,"400x150",,style)
				if(usr.rank=="Chuunin"&&usr.Village=="Sound"&&usr.Clan=="Kumojin")
					sd_Alert(usr, "Although we are a clan of spiders, we do still sell equipment to our fellow Clansman that only we can use...Because we're spiders? Be sure to update with the Kumojin Equipment Merchant!","[src]",,,,0,"400x150",,style)
				if(usr.rank=="Genin"&&usr.Village=="Sound"&&usr.Clan=="Kumojin")
					sd_Alert(usr, "As a Kumojin ninja it's good you come back to your Clansman house, it's nice to learn techniques from your teacher and you don't know whenever these guys might learn more!","[src]",,,,0,"400x150",,style)
				if(usr.rank=="Student"&&usr.Village=="Sound"&&usr.Clan=="Kumojin")
					sd_Alert(usr, "Shouldn't you be getting to the academy? It's directly south of here.","[src]",,,,0,"400x150",,style)
	KaguyaNPC
		name="Kaguya, Emoto"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Sound"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='PainbodyH.dmi';Hair+=rgb(0,0,0)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='Sleeveless Shirt.dmi'
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "Every ninja has a purpose, and my purpose is to help my fellow students.","[src]",,,,0,"400x150",,style)
				if(usr.rank=="Chuunin"&&usr.Village=="Sound"&&usr.Clan=="Kaguya")
					sd_Alert(usr, "Sawarabi No Mai is a legendary technique, but I'm afraid it takes a lot of requirements for us to possibly teach the ultimate technique.","[src]",,,,0,"400x150",,style)
				if(usr.rank=="Genin"&&usr.Village=="Sound"&&usr.Clan=="Kaguya")
					sd_Alert(usr, "A crucial part of being a Kaguya is learning all the dances. It's a very important part of being a Kaguya ninja accepted into the clan, and learning a set of dances are different for everyone. Be sure to talk with the teachers.","[src]",,,,0,"400x150",,style)
				if(usr.rank=="Student"&&usr.Village=="Sound"&&usr.Clan=="Kaguya")
					sd_Alert(usr, "Shouldn't you be getting to the academy? It's directly south of here.","[src]",,,,0,"400x150",,style)
	KaguyaNPC2
		name="Kaguya, Shinto"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Sound"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='PainbodyH.dmi';Hair+=rgb(0,0,0)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='Sleeveless Shirt.dmi'
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "Personally, I actuallyl like our new Clan house locations this building covers all our needs!.","[src]",,,,0,"400x150",,style)
	Maru
		name="Maru"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Sound"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='MadaraH.dmi'
				Hair+=rgb(0,0,0)
				Base+=rgb(156,156,156)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		DblClick()
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Maru's Package")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Great! I needed this.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Maru's Package Completo";return
				if(usr.CurrentMission=="Maru's Informational")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Wow busy day. So what do you need to tell me?","[src]",,,,0,"400x150",,style);sd_Alert(usr, "...","[src]",,,,0,"400x150",,style);sd_Alert(usr, "I see. Tell them I got the information. I can't believe it.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Maru's Informational Completo";return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "It hasn't been long since the Rice Village joined with Sound a while back.","[src]",,,,0,"400x150",,style)
	Sora
		name="Sora"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Sound"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='KiraH.dmi'
				Hair+=rgb(250,250,250)
				Base+=rgb(156,156,156)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Sora's Informational")
					sd_Alert(usr, "My hair is so pretty...","[src]",,,,0,"400x150",,style);sd_Alert(usr, "...","[src]",,,,0,"400x150",,style);sd_Alert(usr, "...Oh no!!! I think it's going to fall out now!","[src]",,,,0,"400x150",,style);usr.CurrentMission="Sora's Informational Completo";return
				else
					sd_Alert(usr, "Yes I bleach my hair! Do you have a problem with that?","[src]",,,,0,"400x150",,style)
	Rien
		name="Rien"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Sound"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='SpikeyH.dmi'
				Hair+=rgb(0,0,0)
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "At one time, Rain belonged to Sound. It would've been great if we could keep them.","[src]",,,,0,"400x150",,style)
	UchihaSoryuki
		name="Uchiha, Soryuki(NPC)"
		Village="Sound"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi';var/Hair='Icons/New Base/Hair/MadaraH.dmi';var/UchihaShirt='Icons/New Base/Clothing/SasukeShirt.dmi'
				Base+=rgb(235,145,52);Hair+=rgb(200,200,200);UchihaShirt+=rgb(0,0,0)
				src.icon=Base;src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+=UchihaShirt;src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+=Hair;src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				usr.alreadytalkingtohim=1
				sd_Alert(usr, "I am the Uchiha assigned to help out new fellow Uchiha.","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "I suggest you walk around the Clan house to figure where things are. They will surely help you.","[src]",,,,0,"400x150",,style)
				usr.alreadytalkingtohim=0
	UchihaAka
		name="Uchiha, Akaran(NPC)"
		Village="Sound"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi';var/Hair='Icons/New Base/Hair/MadaraH.dmi';var/UchihaShirt='Icons/New Base/Clothing/SasukeShirt.dmi'
				Base+=rgb(235,145,52);Hair+=rgb(235,235,235);UchihaShirt+=rgb(0,0,0)
				src.icon=Base;src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+=UchihaShirt;src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+=Hair;src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				usr.alreadytalkingtohim=1
				var/A=rand(1,5)
				if(A==1)
					sd_Alert(usr, "The Uchiha Clan has a powerful Doujutsu, but I hear there is an even stronger one.","[src]",,,,0,"400x150",,style)
				if(A==2)
					sd_Alert(usr, "The legendary ninja, Uchiha Legend was said to be an Uchiha. He has an island somewhere out there holding his treasures, but none of us could find it.","[src]",,,,0,"400x150",,style)
				if(A==3)
					sd_Alert(usr, "The records of Sound speaks of the village of Storm which was led by both Uchiha Ninja, the legendary Argon and the legendary Dneezy! I don't know what happened to them though, considering the records were destroyed.","[src]",,,,0,"400x150",,style)
				if(A==4)
					sd_Alert(usr, "Oh, hello.","[src]",,,,0,"400x150",,style)
				if(A==5)
					sd_Alert(usr, "We just recently moved to Sound Village under the commands of our leader. It's better if we have some form of power instead of a missing threat. This should unify our ninja.","[src]",,,,0,"400x150",,style)
				usr.alreadytalkingtohim=0
	Uchiha_Haseo
		name="Uchiha, Haseo(NPC)"
		Village="Sound"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi';var/Hair='Icons/New Base/Hair/ExclusiveH.dmi';var/UchihaShirt='Icons/New Base/Clothing/SasukeShirt.dmi'
				Base+=rgb(235,145,52);Hair+=rgb(235,235,235);UchihaShirt+=rgb(0,0,0)
				src.icon=Base;src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+=UchihaShirt;src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+=Hair;src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				usr.alreadytalkingtohim=1
				sd_Alert(usr, "The Sharingan is the pride of the Uchiha Clan.","[src]",,,,0,"400x150",,style)
				var/LearnedSharingan=0
				for(var/obj/SkillCards/Sharingan/A in usr.LearnedJutsus)
					LearnedSharingan=1
				if(LearnedSharingan&&usr.Clan=="Uchiha")
					sd_Alert(usr, "I can tell you have the chakra. You must have Sharingan. Well I can help you out.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Sharingan is a Doujutsu with strong powers. Having it can affect you as a person and completely improve your skills. In order to raise it's mastery you must continuously use it.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Each tomoe in the Sharingan eye determines what stage you're in. There are only 3 stages but they provide great uses. No matter what you'll be able to see chakra and a lot of things others don't, and the Sharingan allows you faster reflexes and even the ability to copy Jutsu.","[src]",,,,0,"400x150",,style)
				if(!LearnedSharingan&&usr.Clan=="Uchiha")
					sd_Alert(usr, "What? You want to learn how to use Sharingan? It's very easy. When in desperate moments your body will activate it, but over the time you naturally activate. You can only force it out through forcing yourself through desperate situations.","[src]",,,,0,"400x150",,style)
				usr.alreadytalkingtohim=0
	Uchiha_Jack
		name="Uchiha, Jack(NPC)"
		Village="Sound"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi';var/Hair='Icons/New Base/Hair/MinatoH.dmi'
				Base+=rgb(235,145,52);Hair+=rgb(0,0,0)
				src.icon=Base;src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/kakashi mask.dmi';src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Official Clothing/cvest.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+=Hair;src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Check On Uchiha Jack")
					usr<<"The Mission Proctor told you to check on me? Don't worry about it, I'm fine..";
					usr.CurrentMission="Check On Uchiha Jack Completo"
					usr.OnMission=0
					return
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				usr.alreadytalkingtohim=1
				if(usr.Clan!="Uchiha")
					sd_Alert(usr, "Every generation supposedly 5 people with intense chakra get the legendary Mangekyo Sharingan...But that's a secret!","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "Your eyes...","[src]",,,,0,"400x150",,style)
				if(usr.rank!="Jounin")
					sd_Alert(usr, "I can't tell you this information yet.","[src]",,,,0,"400x150",,style)
				else
					if(usr.CanGetMangekyo)
						sd_Alert(usr, "Your eyes...They pulsate with...hatred and pain.","[src]",,,,0,"400x150",,style)
					else
						sd_Alert(usr, "Your eyes are rich to the Uchiha blood.","[src]",,,,0,"400x150",,style)
				usr.alreadytalkingtohim=0

mob/NPC/RandomNPCs/RockVillage
	Dato
		name = "Dato"
		Village="Rock"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='InoH.dmi'
				var/Shirt='Shirt.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				Shirt+=rgb(0,0,0)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='MaleEyes.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+=Shirt
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
				src.icon_state="rest"
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))

				if(usr.CurrentMission=="Dato's Package")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Great! I needed this.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Dato's Package Completo";return
				if(usr.CurrentMission=="Dato's Informational")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Wow busy day. So what do you need to tell me?","[src]",,,,0,"400x150",,style);sd_Alert(usr, "...","[src]",,,,0,"400x150",,style);sd_Alert(usr, "I see. Tell them I got the information. I can't believe it.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Dato's Informational Completo";return
				else
					var/randz=rand(1,5)
					if(randz==1)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I am training in hopes to master a new kind of element.","[src]",,,,0,"400x150",,style)
					if(randz==2)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "In the stories, I hear there was a man that could control the Lava Chakra Nature. I just wish I could find the breakthrough!","[src]",,,,0,"400x150",,style)
					if(randz==3)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I know the Fire Shrine is somewhere here in Earth Country. Perhaps that's where my breakthrough is.","[src]",,,,0,"400x150",,style)
					if(randz==4)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I'm always training...","[src]",,,,0,"400x150",,style)
					if(randz==5)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "I need to learn how to use it!","[src]",,,,0,"400x150",,style)
	Rockninja
		name="Sabaku, Herukoo"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Rock"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='RandomKarnHair.dmi'
				Base+=rgb(250,250,250)
				Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='RockJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Clan=="Sabaku")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Hello fellow Sabaku Clan Member. You can head into the Secret training area behind the bookcase against the right wall. Remember stand behind it and move southeast.","[src]",,,,0,"400x150",,style);return
				if(usr.Village=="Rock")
					var/randz=rand(1,3)
					if(randz==1)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Rock Village is full of secrets.. to protect our vast wisdom.","[src]",,,,0,"400x150",,style)
					if(randz==2)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Our master is inside just go in and talk to him but getting there is the first test.","[src]",,,,0,"400x150",,style)
					if(randz==3)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "The Building is just a decoy for our real training center.","[src]",,,,0,"400x150",,style)
				if(usr.Village=="Missing, Rain, Leaf, Sound")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
					sd_Alert(usr, "We dont tell outsiders our secrets.","[src]",,,,0,"400x150",,style)
mob/NPC/RandomNPCs/RainVillage
	Sozai
		name="Sozai"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Rain"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='HinaH.dmi'
				Hair+=rgb(255,15,100)
				Base+=rgb(156,156,156)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.CurrentMission=="Sozai's Package")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Great! I needed this.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Sozai's Package Completo";return
				if(usr.CurrentMission=="Sozai's Informational")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Wow busy day. So what do you need to tell me?","[src]",,,,0,"400x150",,style);sd_Alert(usr, "...","[src]",,,,0,"400x150",,style);sd_Alert(usr, "I see. Tell them I got the information. I can't believe it.","[src]",,,,0,"400x150",,style);usr.CurrentMission="Sozai's Informational Completo";return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "We're a really successful village.","[src]",,,,0,"400x150",,style)
mob/NPC/RandomNPCs/RainVillage
	Bartender
		name="Bartender"
		icon = 'HakumeiGetsu.dmi'
		CNNPC = 1
		health = 999999999999999999999999999999999999999999999999999999999
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "Welcome the Rain Village Strip Club and Bar","[src]",,,,0,"400x150",,style)
		verb
			Buy()
				set src in oview(3)
				set name="Buy"
				set category="NPC"
				//THIS
				//Is where the calculations should be done.
				//Meaning you'll need a standard Base price
				//and possibly a multiplier when you actually get to the items
				//So everything isn't the same price.
				//Hamburger has a 1.0x multipler
				//Cheeseburger has a 1.2x multipler
				//and so on..
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				switch(input(usr,"Need a Drink?","Test") in list("Sake","Cancel"))
					if("Sake")
						var/list/buttons2 = list("Yes","No")
						//var/BasePrice=10 //Define the Item's Base Price
						//var/COST=BasePrice-(BasePrice*RockEconomyPercent)
						//Subtract the amount based on the NPC's village
						//In This case it was easy since Burger Kid is only in Rock.
						//What if We want to do inflation though?
						//Then you'd do this..
						//if(RockEconomyPercent<=0.24)  //if Rock has less than 25% of the market yen..
							//var/COST=BasePrice+(BasePrice*((RockTotal/10)-RockEconomyPercent))

						//The second one is a little more complex. It takes the base price and raises it by
						//The Base Price times the number of Rock Ninja divided by 10. Then subtracting the percent.
						//So Less Villagers = Weaker Economy. You can tweak and play with these formulas all you like.
						//I just wanted to demonstrate how it can be done.

						//It's a simple concept but you may not want to do the calculations under if("Hamburger") otherwise
						//You'll have to repeat the calculations under each if statement.

						//After that's all done though, you'd simply take the neat little COST var and plug it in
						// Right.............................Here.
						//                                    \/   using [COST] wherever "10" is.
						sd_Alert(usr, "Alright, so that'll be 10 Ryo!","Sake", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<10) // HERE!
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=10;var/obj/Food/Hamburger/B=new();B.loc=usr // HERE! ..And that's it.
								usr<<sound('Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return

					if("Sake")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 50 Ryo!","Sake", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<50)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=50;var/obj/Drinks/Sake/B=new();B.loc=usr
								usr<<sound('Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
//////////////////////////////////////////////////////////////////////////////

	FuumaJounin1
		name="Fuuma, Hadouken"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Rain"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='inoH.dmi'
				var/Shirt='cvest.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				Shirt+=rgb(55,41,122)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+='kakashi mask.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				if(usr.Clan=="Fuuma")
					if(usr.rank=="Student")
						sd_Alert(usr, "So you've finally decided to become a ninja? That's good, head on down to the academy! It's not too far, just to the left of us! I know you can make this clan proud!","[src]",,,,0,"400x150",,style)
					else
						sd_Alert(usr, "We do have Chakra Blades as a fully influenced weapon. It's one of the dangers that people respect us as a Clan for!","[src]",,,,0,"400x150",,style)
				else
					sd_Alert(usr, "We're a very respectful clan!","[src]",,,,0,"400x150",,style)
	FuumaJounin2
		name="Fuuma, Tatsumaki"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Rain"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='itachiH.dmi'
				var/Shirt='cvest.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				Shirt+=rgb(55,41,122)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='LeafJounin.dmi'
				src.overlays+='kakashi mask.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				sd_Alert(usr, "The Fuuma Clan is one of the most powerful Clan within Rain Village. I hope you realize that, we're very high respected.","[src]",,,,0,"400x150",,style)
	HoshigakiJounin1
		name="Hoshigaki, Iwa"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi';Base+=rgb(102,114,142)
				var/Hair='itachiH.dmi';Hair+=rgb(100,0,0)
				var/Shirt='cvest.dmi';Shirt+=rgb(55,41,122)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='RainJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				if(usr.Clan=="Hoshigaki")
					if(usr.rank=="Student")
						sd_Alert(usr, "This clan has pride! So I hope you swim to the top, head to the academy, it's North-west from here!","[src]",,,,0,"400x150",,style)
					else
						sd_Alert(usr, "The Samehade is a trusty weapon used only by the Hoshigaki Clan. Use it wisely!","[src]",,,,0,"400x150",,style)
	HoshigakiJounin2
		name="Hoshigaki, Kawa"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi';Base+=rgb(102,114,142)
				var/Hair='SasukeH.dmi';Hair+=rgb(100,0,0)
				var/Shirt='cvest.dmi';Shirt+=rgb(55,41,122)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='RainJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "In the old days, the Hoshigaki Clan were known sort of as pirates. I bet you didn't know that!","[src]",,,,0,"400x150",,style)
	HoshigakiJounin3
		name="Hoshigaki, Ame"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi';Base+=rgb(102,114,142)
				var/Hair='SasukeH.dmi';Hair+=rgb(100,0,0)
				var/Shirt='cvest.dmi';Shirt+=rgb(55,41,122)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='RainJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "We're exceptionally good swimmers, we are.","[src]",,,,0,"400x150",,style)







mob/NPC/RandomNPCs/PassingVillage
	Shitsu
		name="Shitsu"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Passing"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='leeH.dmi'
				Hair+=rgb(25,45,15)
				Base+=rgb(156,156,156)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		DblClick()
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "You know what it's like to be at home, you can never leave it.","[src]",,,,0,"400x150",,style)
///////////////////////////////////////////////////////////////
//LeafMerchant
mob/NPC/RandomNPCs/LeafVillagers
	Merchant1
		name = "Konoha Blade Merchant(NPC)"
		CNNPC = 1
		health = 99999999999999999999999999999999999999999999999999999999999
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='MadaraH.dmi';Hair+=rgb(150,150,150)
				var/Shirt='cvest.dmi';Shirt+=rgb(61,100,60)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='LeafJounin.dmi';src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Village!="Leaf")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Who are you?","[src]",,,,0,"400x150",,style);return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Soon this shop will be popping, but for now we're in developement.","[src]",,,,0,"400x150",,style)
	Merchant2
		name = "Kusakin Equipment Merchant(NPC)"
		CNNPC = 1
		health = 99999999999999999999999999999999999999999999999999999999999
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='MadaraH.dmi';Hair+=rgb(0,150,0)
				var/Shirt='cvest.dmi';Shirt+=rgb(61,100,60)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='LeafJounin.dmi';src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Village!="Leaf")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Who are you?","[src]",,,,0,"400x150",,style);return
				if(usr.Clan!="Kusakin")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "We are a very respectful Clan, I'll tell you that.","[src]",,,,0,"400x150",,style);return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "We're closed today. Sorry.","[src]",,,,0,"400x150",,style)
	Merchant3
		name = "Nara Equipment Merchant(NPC)"
		CNNPC = 1
		health = 99999999999999999999999999999999999999999999999999999999999
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='shikaH.dmi';Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi';Shirt+=rgb(61,100,60)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='LeafJounin.dmi';src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Village!="Leaf")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Who are you?","[src]",,,,0,"400x150",,style);return
				if(usr.Clan!="Nara")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "We as the Nara clan need to keep some of our items a secret, of course?","[src]",,,,0,"400x150",,style);return
				else
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "We're closed today. Sorry.","[src]",,,,0,"400x150",,style)
	Merchant4
		name = "Hyuuga Equipment Merchant(NPC)"
		CNNPC = 1
		health = 99999999999999999999999999999999999999999999999999999999999
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,145,52);src.icon=Base
				var/Hair='PainbodyH.dmi';Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi';Shirt+=rgb(61,100,60)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='LeafJounin.dmi';src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='glasses.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				if(usr.Village!="Leaf")
					sd_Alert(usr, "Who are you?","[src]",,,,0,"400x150",,style);return
				if(usr.Clan!="Hyuuga")
					sd_Alert(usr, "We as the Hyuuga clan need to keep some of our items a secret, of course?","[src]",,,,0,"400x150",,style);return
				else
					var/list/buttons = list("Byakugan Corruption Tag", "Cancel")
					sd_Alert(usr, "So what would you like to buy? We have a small inventory, but it's enough.", "[src]", buttons, pick(buttons),0,0,"250x250")
					if("Byakugan Corruption Tag")
						usr<<sound('click1.wav',0)
						var/list/buttons2 = list("Yes", "No")
						sd_Alert(usr, "That's worth 1000 Yen! The tag disrupts a ninja's Byakugan, in case you need to do that that is. Do you want it?","[src]", buttons2, pick(buttons2),0,0,"250x250")
						if("Yes")
							usr<<sound('click1.wav',0)
							if(usr.Yen<1000)
								usr<<"You don't have enough yen, get out!";return
							else
								usr<<"Ah good! Here you go!"
								usr.Yen-=1000
								var/obj/HTag/A=new();A.loc=usr
						if("No")
							usr<<sound('click2.wav',0);return

					if("Cancel")
						usr<<sound('click2.wav',0);return
mob/NPC/RandomNPCs/SnowVillage
	Zenzo
		name="Zenzo"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Snow"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='SpikedPonytailH.dmi'
				Hair+=rgb(250,250,250)
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "Woah.... Sorry its not you its just we havent had very few visitors since our village was first buried deep underground over a hundred years ago. It happened soon after the Great Storm Wars. ","[src]",,,,0,"400x150",,style)
	Jibucho
		name="Jibucho"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Snow"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='MadaraH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(150,0,0)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='RainJounin.dmi'
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			if(src in get_step(usr,usr.dir))
				sd_Alert(usr, "We rely on fish from the froozen lake that flow down the waterfall for food. Without it we would have never lasted this long down here.","[src]",,,,0,"400x150",,style);return
	Snowninja
		name="Shiroi, Carol"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Snow"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='RandomKarnHair.dmi'
				Base+=rgb(250,250,250)
				Hair+=rgb(0,0,0)
				var/Shirt='cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Boxers.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='pants.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='RainJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.rank=="Student"&&usr.Clan=="Shiroi")
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Well would you look at that you are apart of the Shiroi Clan. You know the clan was first created here over three hundred years ago. Im sure when our master returns he can teach you some new stuff...well I guess some old stuff","[src]",,,,0,"400x150",,style);return
				if(usr.Clan=="Shiroi")
					var/randz=rand(1,3)
					if(randz==1)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Well would you look at that you are apart of the Shiroi Clan. You know the clan was first created here over three hundred years ago. Im sure when our master returns he can teach you some new stuff...well I guess some old stuff","[src]",,,,0,"400x150",,style)
					if(randz==2)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Our master has been in the ice caves for some time. I hope he gets back soon.","[src]",,,,0,"400x150",,style)
					if(randz==3)
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Sorry for the way our Clan House looks we havent had any outsider supplies in over 100 years.","[src]",,,,0,"400x150",,style)
				else
					if(src in get_step(usr,usr.dir))
						if(prob(50))
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Welcome to Snow and The Shiroi Clan House we havent had many vistors in the past 100 years","[src]",,,,0,"400x150",,style);return
						var/randzz=rand(1,3)
						if(randzz==1)
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "","[src]",,,,0,"400x150",,style)
						if(randzz==2)
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "What brings you to our Clan House?","[src]",,,,0,"400x150",,style)
						if(randzz==3)
							var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							sd_Alert(usr, "Snow use to be a power village with Naraku as our leader but he and the leader of Rain Doug the Great found some kind of secret power and had to bury it and the village deep under the world.","[src]",,,,0,"400x150",,style)
					else
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Our Master will be back soon. I hope.","[src]",,,,0,"400x150",,style)
	Snowninja2
		name = "Old Man"
		CNNPC = 1
		health = 99999999999999999999999999999999999999999999999999999999999
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null;var/Base='Base.dmi';Base+=rgb(235,235,235);src.icon=Base
				var/Shirt='cvest.dmi';Shirt+=rgb(61,100,60)
				src.overlays+='Boxers.dmi';src.overlays+='MaleEyes.dmi';src.overlays+='Eyes.dmi'
				src.overlays+='RainJounin.dmi';src.overlays+=Shirt
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				if(usr.Clan=="Shiroi")
					usr<<"Wow. We don't see Shiroi's around here much anymore! All of them Migrated to the Rain Village, it's safer there..."
					sleep(10)
					switch(input(usr,"I can teach you a technique on behalf of your efforts to reach me here, for those who wish to use ice for more destructive purposes... It's an Icy Murder...", "Ice Prison") in list ("Yes","No"))
						if("Yes")
							if(!(locate(/obj/SkillCards/IceField) in usr.LearnedJutsus))
								usr<<"You need to learn Ice Creation before you're able to Learn this jutsu!";return
							usr.LearnJutsu("Hyouton: Ice Prison",25000,"IcePrison","Ice Prison is a Jutsu not known by many Shirois due to the remaining Shiroi in the Snow Village keeping it secret. You'll have to figure out what it does on your own...","Ninjutsu")
						if("No")
							usr<<"Suit yourself.";return
				if(prob(50))
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "They call me the Historian of Snow because im our oldest villager. Im Almost 114 years old","[src]",,,,0,"400x150",,style);return
				var/randzz=rand(1,3)
				if(randzz==1)
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "I knew our leader Naraku and his friend Doug who was Rains leader. They were both very powerful Sabaku Ninja.","[src]",,,,0,"400x150",,style)
				if(randzz==2)
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, " Its rumored Naraku buried our village deep underground to rid the world of some evil power created by Organization X. Yeah but that may just be a rumor. ","[src]",,,,0,"400x150",,style)
				if(randzz==3)
					var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "The village has been severly low on supplies ever since the cave collapsed but now that its open again I hope things get better.","[src]",,,,0,"400x150",,style)
	Harashi
		name="Harashi"
		icon='HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Snow"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Base.dmi'
				var/Hair='MessyH.dmi'
				Hair+=rgb(0,0,0)
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Shirt.dmi'
				src.overlays-='pants.dmi'
				src.overlays+='pants.dmi'
				src.overlays-='Cloths.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, " There are still links to the Sabaku and Shiroi Clans here in Snow. I hope the clans didnt die out in the rest of the world.","[src]",,,,0,"400x150",,style)
	//Ken Dashhow, Justin Justice, Kimkokokakchu,
