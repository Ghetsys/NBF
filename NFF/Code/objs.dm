mob/var/tmp/PowerScrollBoost=0
mob/var/tmp/PowerScrollTime=0
mob/var/AgeScrollBoost=0
var/flames = 1000
obj/proc
	Deleteself()
		if(src) {sleep(30);flames++;del(src)}

obj/Dtrail
	icon = 'destruction.dmi'
	icon_state = "trail"
	layer = OBJ_LAYER+1
	New()
		..()
		del(src)
obj/Ctrail
	icon = 'Chidori.dmi'
	icon_state = "trail"
	layer = OBJ_LAYER+1
	New()
		..()
		del(src)
obj/AncientTexts
	UchihaHistory1
		icon='KnightBase.dmi'
		icon_state="stone left"
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Uchiha Clan - Era 1</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<p>
		<b><center><h2>History</h2>
		<br>
		The Uchiha clan blood has been diluted over the centuries since the death of the legendary Uchiha, Sasuke.
		Mutations have occurred over this time and the Sharingan gene has become a dominant trait amongst the clan..
		Some suspect this was a targetted mutation, as the sharingan is much weaker than the sharingan of legends.

		Few purebloods remain. The ones who are pureblooded descended of an evil and unnatural line.
		Their sharingan is strong and unnatural. Beware the 'purebloods'.
		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
	UchihaHistory2
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Diary of A Scientist</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<p>
		<b><center><h2>Journal Entry 1</h2>
		<br>
		My name is Mokai. I am a scientist hired by the Akatsuki Organization..
		Over the course of my life I have preformed many experiments for the Akatsuki
		ranging from the Sieryuu to the Souzousha, but none has disturbed me to my core more
		than examining the leader's bloodline. It is far different from any other Uchiha
		I've seen in my lifetime and his power is unrivaled. I suspect genetic modifcation.
		Possibly a clone of a mythological figure once believed to exist in ancient times named
		Uchiha, Madara.

		Suggesting that a myth is real reduces my credibility as a scientist, but after running through
		all the evidence and every possible explanation, it is the only one that makes sense...
		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
	UchihaHistory3
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Diary of A Scientist</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<p>
		<b><center><h2>Journal Entry 4</h2>
		<br>
		My leader, Argon, has asked me to create a faux sharingan from his DNA. He wants me to
		make it more powerful than naturally occuring sharingans. I have no idea why he would wish for such a thing,
		but nevertheless I shall create it. Any blood that comes from this is not on my hands.
		Let those who read this history know that.
		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
	UchihaHistory4
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Diary of A Scientist</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<p>
		<b><center><h2>Journal Entry 10</h2>
		<br>
		I write this on my death bed... A sieryuu code named "Demon" that I was preforming experiments on
		for Lord Argon, has fatally wounded me and escaped. My medical ninjutsu is not enough to treat my injuries...
		But I cannot die living the life I have lived.. The Curse Eye Project has lead to terrible consequences and the minds of those
		who were implanted with them had their minds torn apart when Argon took control of them... Argon must be stopped,
		and only I know what is capable of doing so.

		There is a blade hidden deep within the confines of his base called the "Blood Blade". I long ago abandoned my sense of skepticism
		when it comes to Argon, and this blade is of mythical origins. Anyone impaled with this blade will have their soul sealed inside of it
		and live in eternal damnation. The blade is hidden beneath his laboratory. Underneath the third tank there is a switch that opens a staircase
		to the chamber below. This object defies science. The one can weild it can kill Argon...
		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
	UchihaHistory4
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Diary of A Scientist</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<p>
		<b><center><h2>Added Journal Entry</h2>
		<br>
		My name is Uchiha, Shisui. I found this journal approximately 2 years after Mokai's death. I was a spy in the Akatsuki for the Sound Organization.
		My partner, Sono Karite, and I found the Blood Blade that Mokai described and we have sealed Argon inside it and then placed a very powerful fuuinjutsu
		on the sword and hid in an undisclosed location deep underground and far away from anywhere his minions might look.

		There is something that troubles me however. I fear that Argon is still very much alive, because as soon as we placed the fuuinjutsu on the sword, the red blade
		of the sword turned pitch black and began to glow with a fiery aura. Nothing else happened and the sword cannot be reached, but I fear there will be a day when
		Argon may return. I leave this warning for future generations. Do not use the sword with the black blade of Amaterasu.
		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
obj/ArgonStatue
	icon = 'Argon.dmi'
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
		<title>Uchiha, Argon</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<center><h2>Raikage<br></h2>
		<p>
		<b><center><h2>Biography</h2>
		<br>
		Argon is the original founder of the Akatsuki. History records suggest there may have been an even older Akatsuki organization in the Rain village,
		but findings have been inconclusive. During his reign of Akatsuki over the course of his unnaturally long lifespan (122 years),
		Argon he cast a shadow of fear across the ninja world. Ninja from every land and village feared his name and power.

		Nearing the end of his life, Argon invaded the Cloud Village and overthrew the government in a single day becoming its new Raikage.
		He organized a village-wide secruity system protecting the all the citizens of Cloud from outside raids.
		He also enforced strict training for his villagers and Lightnings economy, population, and size grew.
		Argon refused to form any alliance or allow any foreign ninja to pass through his village so he constructed a pass in the mountain range that the Cloud Village sat on.
		He has shown the most development of their village than any other Raikage before him, but rules with an iron fist when necessary.

		He is praised for his duties and accomplishments as a kage and as an extremely skilled Uchiha fighter, and one of the few clan members proven to have a pure bloodline.
		Hail Lord Argon. King of the Uchihas and the greatest Raikage.
		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
obj/AIvelStatue
	icon = 'Ivel Shadow.dmi'
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
		<title>Ivel Shadow - Leaf's Angel</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<center><h2>The First Hokage<br></h2>
		<p>
		<br>
		 "Ivel Shadow" was the first Hokage of the New Leaf Village. Records of him are few and his real name is unknown.
		 He was known as the great Hokage of the "New Leaf Village" and he was the most powerful of all the kages during his era.
		 He single handedily prevented the fall of Leaf during its war with the Sound Village.
		 May we continue to honor him here.
 		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")

obj/NarutoStat
	icon = 'Ivel Shadow.dmi'
	Top
		layer = FLY_LAYER+1
		icon_state = "Naruto"
	Bottom
		layer = MOB_LAYER+1
		icon_state = "Naruto2"
		density = 1
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Otokage, Zaku</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<center><h2>The First Otokage<br></h2>
		<p>
		<br>
		 Zaku was the first Leader of The Village Hidden in Sound also know as the Otokage.
		 Zaku who comes from the Kaguya Clan is thought to be the first Kaguya and possibly
		 the founder of the Clan after its initial extinction. Zaku was a strong leader
		 who first made the power of Sound Village known in a war with Leaf Village that was sadly lost because of the equal
		 power of Leaf Village's Hokage.
 		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")

obj/AZaku
	icon = 'Ivel Shadow.dmi'
	Top
		layer = FLY_LAYER+1
		icon_state = "Zaku"
	Bottom
		layer = MOB_LAYER+1
		icon_state = "Zaku2"
		density = 1
		DblClick()
			var/usetext = {"
		<html>
		<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
		<head>
		<BODY>
		<title>Otokage, Zaku</title>
		</head>
		<body bgcolor=#000000 text=#f5f5f5>
		<center><h2>The First Otokage<br></h2>
		<p>
		<br>
		 Zaku was the first Leader of The Village Hidden in Sound also know as the Otokage.
		 Zaku who comes from the Kaguya Clan is thought to be the first Kaguya and possibly
		 the founder of the Clan after its initial extinction. Zaku was a strong leader
		 who first made the power of Sound Village known in a war with Leaf Village that was sadly lost because of the equal
		 power of Leaf Village's Hokage.
 		<p>
		<br>
		</body>
		</html>
		"}
			usr << browse(usetext,"display=1")
obj/AStatues
	icon='Ivel Shadow.dmi'
	layer = FLY_LAYER+1
	Bottom
		icon_state="bottom adapted"
		density=1
	Statues
		Ryuuka
			icon_state="Ryuuka"
			DblClick()
				var/usetext = {"
			<html>
			<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
			<head>
			<BODY>
			<title>Satake, Ryuuka</title>
			</head>
			<body bgcolor=#000000 text=#f5f5f5>
			<center><h2>Otokami<br></h2>
			<p>
			<br>
			 Satake, Ryuuka is legendary among Sound shinobi for his reign as Otokami, which began when Kumojin, Kyrie Eleison's ended.
			 He was able to lead Sound to victory into numerous wars and prove that a man without a clan heritage could be just as powerful.
			 He is both lauded and feared as the master of weapons and tools of all types, particularly shuriken and the Beserker blade,
			 and an expert Sensor shinobi and Earth-technique user.

			 Ryuuka serves as an example to all ninja throughout the world, that great shinobi can rise from humble origins.
			 May we continue to honor him here.
	 		<p>
			<br>
			</body>
			</html>
			"}
				usr << browse(usetext,"display=1")
		Kyou
			icon_state="Kyou"
		Sasuna
			icon_state="Sasuna"
		Icara
			icon_state="Icara"
		Icana
			icon_state="Icana"
		Phoenix
			icon_state="Phoenix"
		Zigo
			icon_state="Zigo"
		Karnetsu
			icon_state="Karnetsu"
			DblClick()
				var/usetext = {"
			<html>
			<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
			<head>
			<BODY>
			<title>Irkashii, Karnetsu</title>
			</head>
			<body bgcolor=#000000 text=#f5f5f5>
			<center><h2>ANBU with no Village<br></h2>
			<p>
			<br>
			 Karnetsu began his career in the village he was born, the Hidden Sound Village. He became an ANBU
			 at age 14, just one year after graduating from the Ninja Academy, and was granted honorary Jounin status
			 without ever passing a Chuunin Exam because of his skill and high mission success rate.

			 For reasons unknown, he abandoned his village leaving 4 Jounin level comrads dead at the village gates.
			 He was later welcomed into the Hidden Rock Village and became the Tsuchikage, Rendan Vash's, right hand man.
			 In Rock he was protected from all of Sound's assassination attempts, but even there, he left the Rock Village
			 only 1 year later and continued to travel the world. For reasons unknown, Rock did not pursue him.

			 He is a true example of the mysterious of the shinobi world, as no one knows his true goals. It is rumored however
			 that Karnetsu was recruited by a secret organization planning to revive the Hidden Mist Village. There is no
			 evidence to support this claim however, because any results of Karnetsu's secret missions were kept extremely
			 well hidden, and it is unknown if he reported to anyone.

			 Karnetsu was extremely adept in the art of kunai in hand to hand combat and a quick killer. His true face is unknown
			 because he's hidden it behind a mask ever since he was a young child, and he gained his signature mask when he
			 joined the elite ranks of Sound's ANBU. The extent of his skills are unknown, but may we look up to him as an
			 example of what all shinobi should strive to be. A Mystery, operating in the shadows.
	 		<p>
			<br>
			</body>
			</html>
			"}
				usr << browse(usetext,"display=1")
		Kyrie
			icon_state="Kyrie"
		Twilight
			icon_state="Twilight"
		Rudolf
			icon_state="Rudolf"

mob/var/tmp/RemoteViewing=0
obj
	hair
		layer = FLOAT_LAYER - 2
obj/AtomTransport
	icon='KnightBase.dmi'
	icon_state="Atomic Transport"
	screen_loc="NORTH,EAST"
	layer=10
	var/clicked=0
	Click()
		if(src.clicked)
			return
		src.clicked=1
		usr<<"Initiating transport. The Nosinasis Memoria console is locking onto your coordinates . . ."
		usr.Stun=99
		sleep(75)
		usr<<"Complete. Atomic transfer begin!"
		sleep(10)
		usr.Stun=0
		var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
		S.loc=locate(130,186,20);S2.loc=usr.loc
		sleep(4)
		usr.loc=locate(130,186,20)
		del(src)
obj/RemoteViewCancel
	icon='KnightBase.dmi'
	icon_state="Atomic Transport"
	screen_loc="NORTH,EAST"
	layer=10
	Click()
		if(usr.RemoteViewing)
			usr.RemoteViewing=0
			usr<<"Terminating remote viewing link..."
		sleep(10)
		del(src)
obj/SparkleEffect
	icon='Warp2.dmi'
	icon_state="sparkle"
	layer=5
	New()
		..()
		spawn(10)
			del(src)
obj
	LabConsole
		icon='Console.dmi'
		layer=3
		density=1
		LeftBottom
			icon_state="left bottom"
		LeftTop
			icon_state="left top"
		RightBottom
			icon_state="right bottom"
		RightTop
			icon_state="right top"
		MiddleBottom1
			icon_state="middle bottom 1"
			density=0
		MiddleBottom2
			icon_state="middle bottom 2"
			density=0
		MiddleBottom3
			icon_state="middle bottom 3"
			density=0
		MiddleTop1
			icon_state="middle top 1"
		MiddleTop2
			icon_state="middle top 2"
		MiddleTop3
			icon_state="middle top 3"
		MiddleSplit
			icon_state="middle split"
		MiddleAccess
			density=0
			var/InUse=0
			var/TurnedOn=0
			var/AnnounceDelay=0
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the console to use it."
					return
				if(src.InUse)
					usr<<"You need to wait to use the machine. Someone else is using it."
					return
				src.InUse=1
				if(!src.TurnedOn)
					view(usr,6)<<"Accessing Nosinasis Memoria Database . . ."
					sleep(20)
					src.TurnedOn=1
					spawn(3000)
						src.TurnedOn=0
						view(6,src)<<"Nosinasis Memoria Database console rebooting . . ."
						src.InUse=0
				usr<<"Please select a command."
				var/Choice=input("Select which of the commands you would like to use.","Console") in list("Locator","Annoucement","Member Summon","Member Transport")
				if(Choice=="Locator")
					view(usr,6)<<"Location Services chosen."
					sleep(10)
					view(usr,6)<<"Accessing global database..."
					sleep(50)
					view(usr,6)<<"Accessed. Do you know which village the person you are looking for is in?"
					switch(input("Yes or No?") in list("Yes","No"))
						if("Yes")
							var/Village=input(usr,"Village?") in list("Leaf","Rain","Rock","Sound","Missing")
							var/list/Ninjas=list()
							for(var/mob/M in world)
								if(M.client&&M.Village==Village)
									Ninjas+=M
							view(usr,6)<<"List of [Village] Village members obtained from the global database."
							var/mob/Select=input(usr,"Please select a target.") in Ninjas
							view(usr,6)<<"[Select] targetted. Establishing chakra link for remote viewing of target . . ."
							sleep(40)
							view(usr,6)<<"Link established. [usr.name], press the X button on the screen to stop the remote viewing."
							view(usr,6)<<"[Select]'s current coordinates are [Select.x], [Select.y], [Select.z]."
							usr.RemoteViewing=1
							usr.client.screen+=new/obj/RemoteViewCancel
							while(usr.RemoteViewing)
								usr.chakra-=rand(50,75)
								usr.client.eye=Select
								usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
								sleep(50)
							usr.client.eye=usr
							usr.client.perspective=MOB_PERSPECTIVE
							view(usr,6)<<"Link terminated."
						if("No")
							view(usr,6)<<"You don't know their village? Well tough shit. Argon got lazy and didn't program me to search by name, so you're S.O.L."
							//var/Name=input(usr,"Type is as much of the name as you know") as text

				if(Choice=="Member Summon")
					view(usr,6)<<"Select the member you wish to summon."
					var/list/Members=list()
					for(var/mob/M in world)
						if(M.client&&M.NosinasisMemoriaMember&&M!=usr&&M.z!=20)
							Members+=M
					if(Members.len>0)
						var/mob/Summon=input(usr,"Which member?") in Members
						var/obj/AtomTransport/A=new()
						Summon.client.screen+=A
						view(6,usr)<<"Attempting to establish link with [Summon] . . ."
						Summon<<"Click the card in the upper right hand corner to accept the summon request from the base. You have 20 seconds."
						sleep(200)
						if(A)
							del(A)
					else
						view(6,usr)<<"No members available for summon. Terminating request."
				if(Choice=="Member Transport")
					if(usr.NosinasisMemoriaMember)
						view(usr,6)<<"Initiating Transport Sequence..."
						alert(usr,"When the person you wish to transport is inside the atom transporter, click OK")
						var/turf/T = locate(130,186,20);var/mob/M
						for(var/mob/Q in T)
							M=Q
							break
						if(M)
							view(usr,6)<<"[M.name] found in the atom transporter. Prepping for atomic transfer . . ."
							for(var/obj/LabStuff/MachineEffect/ME in view(3,M))
								ME.icon_state="glow [ME.number]"
							var/WhereTo=input(usr,"Where do you want to send them to?") in list("Leaf","Rain","Rock","Sound","Tea","Snow","Specific Coordinates")
							for(var/obj/LabStuff/MachineEffect/MEE in view(3,M))
								MEE.icon_state=""
							if(WhereTo=="Leaf")
								var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
								S.loc=locate(58,25,11);S2.loc=M.loc
								sleep(4)
								M.loc=S.loc
							if(WhereTo=="Rain")
								var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
								S.loc=locate(82,44,6);S2.loc=M.loc
								sleep(4)
								M.loc=S.loc
							if(WhereTo=="Rock")
								var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
								S.loc=locate(151,9,14);S2.loc=M.loc
								sleep(4)
								M.loc=S.loc
							if(WhereTo=="Sound")
								var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
								S.loc=locate(63,30,4);S2.loc=M.loc
								sleep(4)
								M.loc=S.loc
							if(WhereTo=="Tea")
								var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
								S.loc=locate(83,36,2);S2.loc=M.loc
								sleep(4)
								M.loc=S.loc
							if(WhereTo=="Snow")
								view(usr,6)<<"Cannot find Snow Village coordinates. Terminating transport sequence."
							if(WhereTo=="Specific Coordinates")
								var/X=input(usr,"X coordinate?") as num
								var/Y=input(usr,"Y coordinate?") as num
								var/Z=input(usr,"Z coordinate?") as num
								var/turf/TT = locate(X,Y,Z)
								var/BadLocation=0
								for(var/atom/A in TT)
									if(A.density)
										BadLocation=1;break
								if(TT.density)
									BadLocation=1
								if(BadLocation)
									var/obj/SparkleEffect/S=new()
									S.loc=M.loc
									sleep(4)
									view(usr,6)<<"ERROR! ABORT!"
									var/a=rand(7,15)
									while(a>0)
										spawn()M.Bloody()
										a--
									M.health=0;M.Death(usr);M.DeathStruggle(usr,1)
								else
									var/obj/SparkleEffect/S=new();var/obj/SparkleEffect/S2=new()
									S.loc=locate(X,Y,Z);S2.loc=M.loc
									sleep(4)
									M.loc=S.loc

						else
							view(usr,6)<<"No biological entities located in the transporter. Cancelling operation . . ."
					else
						usr<<"You do not have permission to use these feature."
						oview(6,usr)<<"Access denied to [usr]."
				src.InUse=0

	LabStuff
		icon='TestTube.dmi'
		layer=6
		density=0
		TankAndComputer
			icon_state="Kanisaki's Tank"
		Tank
			icon_state="Tank"
		TankBottom
			icon_state="Tank Bottom"
			layer=3
		Computer
			layer=2
			icon_state="Computer"
		ComputerScreen
			layer=3
			icon_state="Computer Screen"
		Water
			layer=5
			icon_state="Water"
		Tubes
			layer=4
			icon_state="Tubes"
		TubeSide
			layer=2
			icon_state="tubes"
		MachineEffect
			icon='Machine Effect.dmi'
			layer=6
			var/number="0,0"
			M1
				number="1,1"
			M2
				number="2,1"
			M3
				number="3,1"
			M4
				number="1,2"
			M5
				number="2,2"
			M6
				number="3,2"
			M7
				number="1,3"
			M8
				number="2,3"
			M9
				number="3,3"
		MachineTop
			icon='Machine.dmi'
			icon_state="top"
			layer=7
		MachineBottom
			icon='Machine.dmi'
			icon_state="bottom"
			layer=3
		MachinePipe
			icon='Testing.dmi'
			icon_state="Pipe"
			layer=7

	LabStuff2
		icon='Testing.dmi'
		layer=6
		HouseStuff
			icon='KnightBase.dmi'
			Ornament1
				icon_state="ornament 1"
			Ornament2
				icon_state="ornament 2 left"
			Ornament22
				icon_state="ornament 2 right"
			Ornament3
				icon_state="ornament 3"
			Ornament4
				icon_state="ornament 4"
			Picture1
				icon_state="picture left"
			Picture11
				icon_state="picture right"
			Picture2
				icon_state="picture 2 left"
			Picture22
				icon_state="picture 2 right"
			Picture3
				icon_state="picture 3"
			Picture4
				icon_state="picture 4"
			Picture5
				icon_state="picture 5"
			Table1
				icon_state="table"
			Table2
				icon_state="table 2"
			Table3
				icon_state="table 3"
			Table4
				icon_state="table 4"
			Table5
				icon_state="table 5"
			Table6
				icon_state="table 6"
			Table7
				icon_state="table 7"
			Table8
				icon_state="table 8 left"
			Table88
				icon_state="table 8 right"
			Stove
				icon_state="stove"
			StoneStove1
				icon_state="stone stove left"
			StoneStove2
				icon_state="stone stove right"
			StoneStove3
				icon_state="stone stove left top"
			StoneStove4
				icon_state="stone stove right top"
			Counter1
				icon_state="counter 1 left"
			Counter11
				icon_state="counter 1 right"
			Counter2
				icon_state="counter 2 left"
			Counter22
				icon_state="counter 2 right"
			Counter3
				icon_state="counter 3 left"
			Counter33
				icon_state="counter 3 right"
			Counter4
				icon_state="counter 4 left"
			Counter44
				icon_state="counter 4 right"
			Bookshelf1
				icon_state="bookshelf top"
			Bookshelf2
				icon_state="bookshelf bottom"
			Dresser1
				icon_state="dresser top"
			Dresser2
				icon_state="dresser bottom"
			Chair1
				icon_state="chair south"
				layer=3
			Chair2
				icon_state="chair north"
			Chair3
				icon_state="chair east"
			Chair4
				icon_state="chair west"
			Bed1
				icon_state="bed top"
			Bed2
				icon_state="bed middle"
				layer=3
			Bed3
				icon_state="bed bottom"
			BigBed1
				icon_state="big bed top left"
			BigBed2
				icon_state="big bed top right"
			BigBed3
				icon_state="big bed middle left"
				layer=3
			BigBed4
				icon_state="big bed middle right"
				layer=3
			BigBed5
				icon_state="big bed bottom left"
			BigBed6
				icon_state="big bed bottom right"
			Candle1
				icon_state="candle top"
				layer=5
			Candle2
				icon_state="candle bottom"
				density=1
			Candle3
				icon_state="candles top left"
				layer=7
			Candle4
				icon_state="candles top right"
				layer=7
			Candle5
				icon_state="candles bottom left"
				layer=7
			Candle6
				icon_state="candles bottom right"
				layer=7
			DresserSide1
				icon_state="dresser side 1"
				layer=6
			DresserSide2
				icon_state="dresser side 2"
				layer=5
				density=1
			DresserSide3
				icon_state="dresser side 3"
				layer=5
				density=1
			Shelf
				a
					icon_state="shelf bottom left"
				b
					icon_state="shelf bottom right"
				c
					icon_state="shelf middle left"
				d
					icon_state="shelf middle right"
				e
					icon_state="shelf top left"
				f
					icon_state="shelf top right"
			Table
				a
					icon_state="table bottom left"
				b
					icon_state="table bottom middle"
				c
					icon_state="table bottom right"
				d
					icon_state="table top left"
				e
					icon_state="table top middle"
				f
					icon_state="table top right"
			Plants
				layer=5
				density=0
				OneTop
					icon_state="plant 1 top"
				OneBottom
					icon_state="plant 1 bottom"
					density=1
				TwoTop
					icon_state="plant 2 top"
				TwoBottom
					icon_state="plant 2 bottom"
					density=1
				ThreeTop
					icon_state="plant 3 top"
				ThreeBottom
					icon_state="plant 3 bottom"
					density=1
				FourTop
					icon_state="plant 4 top"
				FourBottom
					icon_state="plant 4 bottom"
					density=1
			Batruzon
				density=0
				layer=3
				pixel_y=8
				B1
					icon_state="batman 1"
				B2
					icon_state="batman 2"
				B3
					icon_state="batman 3"
				B4
					icon_state="batman 4"
				B5
					icon_state="batman 5"
				B6
					icon_state="batman 6"
				B7
					icon_state="batman 7"
				B8
					icon_state="batman 8"

		Wire1
			icon_state="wires1"
		Wire2
			icon_state="wires2"
		Power1
			icon_state="power1"
		Power2
			icon_state="power2"
		Bolts1
			icon_state="bolts1"
		Bolts2
			icon_state="bolts2"
		Bottom1
			icon_state="bottom1"
		Bottom2
			icon_state="bottom2"
		Bottom3
			icon_state="bottom3"
		Top1
			icon_state="top1"
		Top2
			icon_state="top2"
		Top3
			icon_state="top3"
		Fridge1
			icon_state="fridge1"
		Fridge2
			icon_state="fridge2"
		Stove
			icon_state="stove"
		Appliance1
			icon_state="appliance1"
		Appliance2
			icon_state="appliance2"
		Counter1
			icon_state="counter1"
		Counter2
			icon_state="counter2"
		Sink
			icon_state="sink"
		Microwave1
			icon_state="microwave1"
		Microwave2
			icon_state="microwave2"
		LowCounter
			icon_state="low counter"
		Stuff1
			icon_state="1"
		Stuff2
			icon_state="2"
		Stuff3
			icon_state="11"
		Stuff4
			icon_state="12"
		Stuff5
			icon_state="21"
		Stuff6
			icon_state="22"
		Tree1
			icon_state="tree1"
		Tree2
			icon_state="tree2"
		Tree3
			icon_state="tree3"
		Tree4
			icon_state="tree4"
		Tree5
			icon_state="tree5"
		Tree6
			icon_state="tree6"
		railing1
			icon_state="railing1"
		//	opacity=1
		railing2//Chuunin Exam ones GG
			icon_state="railing2"
			opacity=1
			layer=3
		railing3
			icon_state="railing3"
		railing4
			icon_state="railing11"
		railing5
			icon_state="railing22"
			layer=3
		railing6
			icon_state="railing33"
		railing7
			icon_state="railing12"
		railing8
			icon_state="railing32"
		Table
			icon_state="table"
		beaker1
			icon_state="beaker1"
		beaker2
			icon_state="beaker2"
		machine1
			icon_state="machine1"
		machine2
			icon_state="machine2"
		machine3
			icon_state="machine3"
		machine4
			icon_state="machine4"
		machine5
			icon_state="machine5"
		machine6
			icon_state="machine6"
		water1
			icon_state="water1"
		water2
			icon_state="water2"
		water3
			icon_state="water3"
		water4
			icon_state="water4"
		tube1
			icon_state="tube1"
		tube2
			icon_state="tube2"
		tube3
			icon_state="tube3"
		tube4
			icon_state="tube4"
		board1
			icon_state="board1"
		board2
			icon_state="board2"
		rail
			rail1
				icon_state="rail1"
			rail2
				icon_state="rail2"
			rail3
				icon_state="rail3"
			rail4
				icon_state="rail4"
			rail5
				icon_state="rail5"
			rail6
				icon_state="rail6"
			rail7
				icon_state="rail7"
			rail8
				icon_state="rail8"
			rail9
				icon_state="rail9"
			rail10
				icon_state="rail10"
			rail11
				icon_state="rail11"
			rail12
				icon_state="rail12"
			rail13
				icon_state="rail13"
		TreeRoot
			icon='root.dmi'
			layer=4
mob/var/tmp/FailedAttempts=0
obj/Base
	var/number="0,0"
	density=1
	Door0
		icon='Door.dmi'
		icon_state="closed 0,0"
		layer=3
	Door
		icon='Door.dmi'
		icon_state="closed 1,0"
		layer=3
		number="1,0"
		density=1
		var/open=0
		var/sentmessage=0
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.dir==NORTH&&!src.open)
				alert(usr,"Form the string of handseals to open the door.")
				var/list/HandSeals=list("Tiger","Boar","Rat","Horse","Ram","Snake","Monkey","Pig","Dog","Rooster","Dragon","Ox")
				var/HandsealOne=input("Handseal One") in HandSeals
				var/HandsealTwo=input("Handseal Two") in HandSeals
				var/HandsealThree=input("Handseal Three") in HandSeals
				usr.icon_state="handseals"
				sleep(5)
				usr.icon_state="running"
				if(HandsealOne=="Dog"&&HandsealTwo=="Monkey"&&HandsealThree=="Pig")
					view(10,usr)<<"The door opens quickly!"
					for(var/obj/Base/D in view(1,src))
						spawn()
							if(D.icon=='Door.dmi')
								flick("opening [D.number]",D)
								sleep(4)
								D.icon_state="open [D.number]"
								src.open=1
								spawn(50)
									flick("closing [D.number]",D)
									sleep(4)
									src.open=0
									D.icon_state="closed [D.number]"
				else
					usr<<"Nothing happens..."
					usr.FailedAttempts++
					if(usr.FailedAttempts==3)
						usr.FailedAttempts=0
						usr.health=0;usr.Death(usr)
						usr.DeathStruggle(usr,1)
			else if(!src.open)
				usr<<"Face the door to open it."
				return
	Door2
		icon='Door.dmi'
		icon_state="closed 2,0"
		layer=3
		number="2,0"
	Door3
		icon='Door.dmi'
		icon_state="closed 0,1"
		layer=3
		number="0,1"
	Door4
		icon='Door.dmi'
		icon_state="closed 1,1"
		layer=3
		number="1,1"
	Door5
		icon='Door.dmi'
		icon_state="closed 2,1"
		layer=3
		number="2,1"
turf/Base
	Bed2Covers
		icon='KnightBase.dmi'
		icon_state="bed middle covers"
		layer=5
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.dir=SOUTH
				M.Running=0
				M.loc=src
				while(M.loc==src)
					if(M.deathcount>0)
						M.deathcount-=0.1
						if(M.deathcount<0)
							M.deathcount=0
							M<<"You feel well rested."
					if(M.health<M.maxhealth)
						M.health+=rand(2,5)
					if(M.stamina<M.maxstamina)
						M.stamina+=round(M.maxstamina/(pick(80,100)))
					sleep(10)
	BedBigCoversLeft
		icon='KnightBase.dmi'
		icon_state="big bed middle left covers"
		layer=5
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.dir=SOUTH
				M.Running=0
				M.loc=src
				while(M.loc==src)
					if(M.deathcount>0)
						M.deathcount-=0.15
						if(M.deathcount<0)
							M.deathcount=0
							M<<"You feel well rested."
					if(M.health<M.maxhealth)
						M.health+=rand(4,8)
					if(M.stamina<M.maxstamina)
						M.stamina+=round(M.maxstamina/(pick(60,80)))
					sleep(10)
	BedBigCoversRight
		icon='KnightBase.dmi'
		icon_state="big bed middle right covers"
		layer=5
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.dir=SOUTH
				M.Running=0
				M.loc=src
				while(M.loc==src)
					if(M.deathcount>0)
						M.deathcount-=0.15
						if(M.deathcount<0)
							M.deathcount=0
							M<<"You feel well rested."
					if(M.health<M.maxhealth)
						M.health+=rand(4,8)
					if(M.stamina<M.maxstamina)
						M.stamina+=round(M.maxstamina/(pick(60,80)))
					sleep(10)

	Rugs
		icon='KnightBase.dmi'
		Rug1
			BottomLeft
				icon_state="rug 1 bottom left"
			BottomMiddle
				icon_state="rug 1 bottom middle"
			BottomRight
				icon_state="rug 1 bottom right"
			TopLeft
				icon_state="rug 1 top left"
			TopMiddle
				icon_state="rug 1 top middle"
			TopRight
				icon_state="rug 1 top right"
		Rug2
			BottomLeft
				icon_state="rug 2 bottom left"
			BottomMiddle
				icon_state="rug 2 bottom middle"
			BottomRight
				icon_state="rug 2 bottom right"
			TopLeft
				icon_state="rug 2 top left"
			TopMiddle
				icon_state="rug 2 top middle"
			TopRight
				icon_state="rug 2 top right"
		Rug3
			BottomLeft
				icon_state="rug 3 bottom left"
			BottomMiddle
				icon_state="rug 3 bottom middle"
			BottomRight
				icon_state="rug 3 bottom right"
			TopLeft
				icon_state="rug 3 top left"
			TopMiddle
				icon_state="rug 3 top middle"
			TopRight
				icon_state="rug 3 top right"
		Rug4
			BottomLeft
				icon_state="rug 4 bottom left"
			BottomMiddle
				icon_state="rug 4 bottom middle"
			BottomRight
				icon_state="rug 4 bottom right"
			TopLeft
				icon_state="rug 4 top left"
			TopMiddle
				icon_state="rug 4 top middle"
			TopRight
				icon_state="rug 4 top right"
	BaseExit
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M<<"Exiting . . ."
				var/obj/Base/Door/D = locate(/obj/Base/Door) in world
				if(D)
					if(D.open)
						M.loc=locate(175,11,15)
					else
						for(var/obj/Base/DD in view(1,D))
							spawn()
								if(DD.icon=='Door.dmi')
									flick("opening [DD.number]",DD)
									sleep(4)
									DD.icon_state="open [DD.number]"
									D.open=1
									M.loc=locate(175,11,15)
									spawn(50)
										flick("closing [DD.number]",DD)
										sleep(4)
										D.open=0
										DD.icon_state="closed [DD.number]"
				else
					return


mob/var/oname
obj/var/oname=""
obj/var/ammount=0
var/ScrollIsIn="Not Currently Taken"
var/PreviousLocation
mob/var/tmp/HasHiddenScroll=0
obj
	Hidden_Ninja_Scroll
		icon='scrolls.dmi'
		icon_state="Hidden Ninja Scroll"
		density=1
		layer=MOB_LAYER+1
		var
			VillageIn=""
			CanBeTaken=1
		proc
			ScrollWait()
				src.CanBeTaken=0
				sleep(6000)
				src.CanBeTaken=1
				return
obj/BonusScrolls
	icon='scrolls.dmi'
	icon_state="gay scroll"
	Token
		icon='LevelHud.dmi'
		icon_state="Token"
		Click()
			usr<<"This Ninja Token is a compensation reward that can be redeemed for special items or benefits at the proper NPC."
	CoolDown
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				if(usr.JutsuDelay>0)
					usr.JutsuDelay-=rand(15000,60000)
					usr<<"Your Jutsu Learning CoolDown was reduced! You feel energetic!!"
					del(src)
				else
					usr<<"Best to save this scroll for another time.."
					return
	WipeCoolDown

	WipeEXP

	WipeScroll
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				usr<<"We, the Owners of NFF, apologize for the unexpected wipe that hit us. Please, enjoy this scroll."

	EXP
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				if(usr.JutsuInLearning!="")
					usr.JutsuEXPCost+=rand(10000,30000)
					usr<<"Your gained EXP towards learning your jutsu! You're filled with knowledge!!"
					del(src)
				else
					usr<<"Best to save this scroll for another time.."
					return
	Power
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				if(usr.PowerScrollBoost!=0&&usr.PowerScrollTime>0)
					usr<<"You're already using a power scroll!"
					return
				if(usr.PowerScrollBoost<=0&&usr.PowerScrollTime<=0)
					usr.PowerScrollBoost=1
					usr.PowerScrollTime=180
					usr<<"A mystical power begins to flow through your veins..your damage will be increased by 30% for 3 minutes!"
					del(src)
				else
					usr<<"Best to save this scroll for another time.."
					return
	Age
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				if(usr.AgeScrollBoost!=0)
					usr<<"You're already using a Age scroll!"
					return
				if(usr.AgeScrollBoost<=0)
					usr.AgeScrollBoost=1
					usr<<"A mystical power begins to flow through your veins..you will reach your next age a bit more quickly."
					del(src)
				else
					usr<<"Best to save this scroll for another time.."
					return
	DblEXP
		var/time=200
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				DBLexpday=1
				usr<<"You activate your scroll [time] left"
			/*	while(DBLexpday==1)
					time--
					sleep(11)
					//usr<<"[time] left"

					usr<<"Your gained EXP towards learning your jutsu! You're filled with knowledge!!"
					if(time<=0)
						usr<<"DoubleExp Has ended."
						DBLexpday=0
						del(src)*/

	Halloween_Scroll
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				M=usr
				//Idk if you wanted them to have a reward regardless or not.
				//If so, remove this if(prob(50))
				//Insert pictures into the Link list and one is picked at random
				var/Link="http://images2.wikia.nocookie.net/__cb20120930235031/camphalfbloodroleplay/images/9/96/Skilled_photoshop_12.jpg"
				if(prob(90))
					usr << sound('SFX/Scream.Wav')
					usr << browse({"<html><head><style type="text/css">table, td, th{border:1px solid white;border-collapse:collapse;}th{background-color:white;color:black;}</style></head><img src=[Link]></body></html>"},"window=ScaryPic;can_close=0")
					del(src)
					usr.SaveK()
					return
				else
					if(prob(0.1))
						var/Gain=rand(1,2)
						usr<<"WooHoo! You got [Gain] Starting Points!"
						usr.StartingPoints+=Gain
					else if(prob(1))
						var/Gain=rand(3,6)
						usr<<"WooHoo! You got [Gain] Elemental Points!"
						usr.ElementalPoints+=Gain
					else if(usr.JutsuInLearning!="")
						usr.JutsuEXPCost+=rand(10000,40000)
						usr<<"Your gained EXP towards learning your jutsu! You're filled with knowledge!!"
						del(src)
					else if(usr.JutsuDelay>0)
						usr.JutsuDelay-=rand(10000,40000)
						usr<<"Your Jutsu Learning CoolDown was reduced! You feel energetic!!"
						del(src)
					else
						usr<<"Best to save this scroll for another time.."
						return
	Knowledge_Scroll
		var/InUse=0
		Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return
		verb
			Get()
				set src in oview(1)
				usr<<"You picked up the scroll"
				src.Move(usr)
			Use()
				src.Utilize(usr)
		proc
			Utilize(mob/M)
				if(InUse)
					return
				src.InUse=1
				M=usr
				switch(input(usr,"This scroll contains vast amounts of knowledge. What do you want to research?") in list("Taijutsu","Ninjutsu","Genjutsu","Katon","Suiton","Raiton","Doton","Fuuton","Weapons"))
					if("Taijutsu")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.TaijutsuKnowledge++
							sleep(11)
					if("Ninjutsu")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.NinjutsuKnowledge++
							sleep(11)
					if("Genjutsu")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.GenjutsuKnowledge++
							sleep(11)
					if("Katon")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.KatonKnowledge++
							sleep(11)
					if("Suiton")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.SuitonKnowledge++
							sleep(11)
					if("Raiton")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.RaitonKnowledge++
							sleep(11)
					if("Doton")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.DotonKnowledge++
							sleep(11)
					if("Fuuton")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							usr.FuutonKnowledge++
							sleep(11)
					if("Weapons")
						usr<<"You sit down and begin to read the scroll."
						usr.icon_state="rest"
						for(var/i=100, i>0, i--)
							if(prob(33))
								usr.KunaiMastery++
							else if(prob(33))
								usr.ShurikenMastery++
							else if(prob(5))
								if(usr.Kenjutsu<100)
									usr.Kenjutsu++
							else if(prob(5))
								if(usr.Bojutsu<100)
									usr.Bojutsu++
							else
								usr.KunaiMastery++
							sleep(11)
				usr.icon_state=""
				usr<<"You finish reading the scroll, and the sealing jutsu on the scroll activates and seals the scroll permanently."
				del(src)
obj/reflex
	reflexOneQuestScroll
		icon = 'scrolls.dmi'
		icon_state="gay scroll"
		name = "Masaharu Morimoto's Lost Scroll"
		verb
			Get()
				set src in oview(1)
				if (usr.reflexOneQuest != 1)
					usr<<"Why pick up a burning scroll"
					del(src)
					return
				if (usr.reflexOneQuest == 1)
					usr<<"You picked up [src],"
					usr.loc = locate(26,175,2)
					usr<<"Masaharu Morimoto: Oh.. your back.. Wow.. I am suprised. Well, I guess I will show you, Now look closely!"
					usr.reflexNew = 1
					usr.reflexOneQuest = 0
					del(src)
				else
					usr<<"Something doesnt feel right, go to to Morimoto."
		proc
			scrollLife()
				sleep(2500)
				del(src)

obj/reflex
	reflexOneQuestScroll2
		icon = 'scrolls.dmi'
		icon_state="gay scroll"
		name = "Masaharu Morimoto's Lost Scroll"
		verb
			Get()
				set src in oview(1)
				if (usr.reflexOneQuest != 1)
					usr<<"That doesn't look important."
					del(src)
					return
				if (usr.reflexOneQuest == 1 && usr.HasHiddenScroll == 0)
					usr.loc = locate(26,175,2)
					usr<<"Masaharu Morimoto: Well you found the scroll but you didnt have the hidden scrolls, so I will not teach you my secret art."
					usr<<"Masaharu Morimoto: I will return the scroll to the proper place."
					usr<<"Masaharu Morimoto: Next time, have the Hidden Ninja Scroll and I will teach you."
					usr.reflexOneQuest = 0
					del(src)
					return
				if (usr.reflexOneQuest == 1 && usr.HasHiddenScroll == 1)
					usr<<"You picked up the [src],"
					usr<<"A wild whirling feeling encapsels your body as your are body is pulled through to a new dimension."
					usr.loc = locate(18,125,33)
					usr<<"Masaharu Morimoto: A nemisis from the past is trying to steal my master's power!"
					usr<<"Masaharu Morimoto: He is hidden deep within this cave!"
					usr<<"Masaharu Morimoto: Quickly get the scroll from him and escape!"
					var/obj/O = new/mob/NPC/BossReflex
					O.loc = locate(130,15,33)
					del(src)
					return
				else
					usr<<"Something doesnt feel right, perhaps you should go talk to Morimoto or find the Hidden Ninja Scroll First"
					del(src)
					return
		proc
			scrollLife()
				sleep(1000)
				del(src)
				return
obj/reflex
	reflexOneQuestScroll2Number2
		icon = 'scrolls.dmi'
		icon_state="gay scroll"
		name = "Masaharu Morimoto's Lost Scroll"
		verb
			Get()
				set src in oview(1)
				if (usr.reflexOneQuest != 1)
					usr<<"That doesn't look important."
					del(src)
					return
				if (usr.reflexOneQuest == 1 && usr.HasHiddenScroll == 1 && usr.reflexNew == 1)
					usr.loc = locate(26,175,2)
					usr<<"You picked up the [src]."
					usr<<"Masaharu Morimoto: You were able to recover the sroll from the clutches of my Nemesis!"
					usr<<"Masaharu Morimoto: I will not teach you the second level of reflex."
					usr<<"Masaharu Morimoto demonstrates reflex level 2"
					usr<<"However the evil forces still remain.."
					usr.reflexNew = 2
					usr.reflexOneQuest = 0
					del(src)
					return
				else
					usr<<"As you try to grab the scroll it dissolves into aether. Perhaps carrying the hidden ninja scroll will allow you to take it."
					del(src)
					return
		proc
			scrollLife()
				sleep(500)
				del(src)
				return

obj/reflex
	reflexOneQuestScroll3
		icon = 'scrolls.dmi'
		icon_state="gay scroll"
		name = "Masaharu Morimoto Master's Lost Scroll"
		verb
			Get()
				set src in oview(1)
				if (usr.reflexOneQuest != 1)
					usr<<"That doesn't look important."
					del(src)
					return
				if (usr.reflexOneQuest == 1 && usr.HasHiddenScroll == 0)
					usr.loc = locate(26,175,2)
					usr<<"Masaharu Morimoto: Well you found the scroll but you didnt have the hidden scrolls, so I will not teach you my secret art."
					usr<<"Masaharu Morimoto: I will return the scroll to the proper place."
					usr<<"Masaharu Morimoto: Next time have the hidden ninja scroll and I will teach you."
					usr.reflexOneQuest = 0
					del(src)
					return
				if (usr.reflexOneQuest == 1 && usr.HasHiddenScroll == 1 && usr.reflexNew ==2)
					usr<<"You picked up the [src],"
					usr.loc = locate(26,175,2)
					usr<<"Masaharu Morimoto: You have found my master's lost scroll. Accomplished the task I could not complete. You are truely ready to learn the final level of reflex."
					usr<<"Masaharu Morimoto demonstrates the final reflex skill"
					usr<<"You learn reflex level 3."
					usr.reflexNew = 3
					usr.reflexOneQuest = 0
					del(src)
					return
		proc
			scrollLife()
				sleep(300)
				del(src)
				return

obj/reflex
	reflexEnhancer
		icon = 'Icons/Food.dmi'
		icon_state = "6"
		name = "Fragment of Morimoto's Masters Power"
		verb
			Get()
				set src in oview(1)
				if (usr.reflexOneQuest != 1)
					usr<<"That doesnt look important."
					del(src)
					return
				if (usr.reflexOneQuest == 1 && usr.HasHiddenScroll == 1 && usr.reflexNew == 2)
					usr<<"As you grab on the Enhancer, it dissolves into you."
					usr<<"You feel Stronger!"
					usr.reflexQuestThreeCounter++
					del(src)
					return
				else
					usr<<"Something doesnt feel right, perhaps you should go talk to Morimoto, or find the Hidden Ninja Scroll, or perhaps your reflex skills are not high enough."
					del(src)
					return
		proc
			scrollLife()
				sleep(500)
				del(src)
				return





//Object Bump Parent Proc
//All Objects which bump into something will go to this proc first
//so long as they have the ..() in the beginning of their own procs.
obj/Bump(A)
	if(istype(A,/obj/ZeroVoidBarrierPieces/))
		var/obj/O=A
		//world<<"[src] entered into the Zero Void Barrier at. It's direction is [src.dir]."
		var/d=turn(src.dir,180)
		src.dir=d
		//world<<"New direction is [src.dir]"
		walk(src,0)
		src.loc=O
		sleep(5)
		src.loc=O.loc
		//world<<"[src] exited the Zero Void Barrier."
		walk(src,d)
		return
	else
		..()
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

obj/var/VillagePost="None"
obj
	VillageScrollPost
		icon='Post.dmi'
		icon_state="1"
		layer=MOB_LAYER
		density=1
		pixel_y=32
	VillageScrollPostBottom
		icon='Post.dmi'
		icon_state="2"
		density=0
		layer=OBJ_LAYER
obj/torch
	icon = 'Map/Turfs/Landscapes.dmi'
	icon_state = "torch"
	density = 1
	luminosity = 1

turf/Prison
	icon='Prison.dmi'
	density=1
	Walls
		layer=6
		density=0
		BottomLeft
			icon_state="bottom left"
		BottomRight
			icon_state="bottom right"
		BottomMiddle
			icon_state="bottom middle"
		MiddleLeft
			icon_state="middle left"
		MiddleMiddle
			icon_state="middle middle"
		MiddleRight
			icon_state="middle right"
		TopLeft
			icon_state="top left"
		TopRight
			icon_state="top right"
		TopMiddle
			icon_state="top middle"
		Edge1
			icon_state="wall edge 1"
		Edge2
			icon_state="wall edge 2"
		Edge3
			icon_state="wall edge 3"
		Edge4
			icon_state="wall edge 4"
		Corner1
			icon_state="wall corner 1"
		Corner2
			icon_state="wall corner 2"
		Corner3
			icon_state="wall corner 3"
		Corner4
			icon_state="wall corner 4"
		Corner5
			icon_state="wall corner 5"
		Corner6
			icon_state="wall corner 6"
		Corner7
			icon_state="wall corner 7"
		Corner8
			icon_state="wall corner 8"
		Corner9
			icon_state="wall corner 9"
	Floor
		icon_state="floor"
		density=0
	Torch
		icon_state="torch"
		layer=7
	Hay
		icon_state="hay 1"
		density=0
	Hay2
		icon_state="hay 2"
		density=0
	Haystack
		icon_state="haystack"
	Bone1
		icon_state="bones 1"
		density=1
	Bone2
		icon_state="bones 2"
	Skull1
		icon_state="skull 1"
	Skull2
		icon_state="skull 2"
	Skull3
		icon_state="skull 3"
	Skeleton
		icon_state="skeleton"
	Door
		icon='PrisonDoor.dmi'
		layer=6
	Chains
		icon_state="chains 1"
		layer=7
	Chains2
		icon_state="chains 2"
		layer=7
	TorchBottom
		icon_state="torch bottom"
		layer=4
		density=1
	TorchTop
		icon_state="torch unlit"
		layer=6
		density=0
	UchihaHideOutTorch
		icon_state="torch unlit2"
		layer=7
	TorchIgniteTurf
		var/Triggered=0
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.Running=0;M.runningspeed=0
				for(var/turf/Prison/TorchTop/T in range(15,M))
					if(T.x==M.x&&T.icon_state=="torch unlit")
						src.Triggered=1
						T.icon_state="torch lit"
						spawn(6000)
							src.Triggered=0
							T.icon_state="torch unlit"
				return 1

	UchihaTorchIgniteTurf
		var/Triggered=0
		Enter(A)
		//	world<<"Torch has been entered"
			if(ismob(A))
				var/mob/M=A
				for(var/turf/Prison/UchihaHideOutTorch/T in range(2,M))
			//		world<<"You are in range for the torch to light up."
				//	if(T.x==M.x&&T.icon_state=="torchunlit")
					if(T.icon_state=="torch unlit2")
			//			world<<"Torch should light up."
						src.Triggered=1
						T.icon_state="torch"
						spawn(500)
							src.Triggered=0
							T.icon_state="torch unlit2"
				return 1
	Bed
		Enter(A)
			if(ismob(A))
				var/mob/M=A
				M.dir=SOUTH
				M.Running=0
				M.loc=src
				M<<"You lay down on the uncomfortable bed..."
				while(M.loc==src)
					if(M.deathcount>0)
						M.deathcount-=0.10
						if(M.deathcount<0)
							M.deathcount=0
							M<<"You feel rested."
					if(M.health<M.maxhealth)
						M.health+=rand(1,3)
					if(M.stamina<M.maxstamina)
						M.stamina+=round(M.maxstamina/(pick(140,180)))
					sleep(10)
	Pillar
		density=0
		icon='Pillar.dmi'
		icon_state="1"
		layer=6
obj/Prison
	icon='Prison.dmi'
	density=0
	UchihaClanHideOut
		UchihaTablet1Left
			density=1
			icon_state="stone 1"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000> Uchiha Argon continues to steal the Eyes......eyes...</font>"
				sleep(25)
				usr<<"You can't read the rest from this side of the stone tablet"
		UchihaTablet1Right
			density=1
			icon_state="stone 2"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000> that reflect like a mirror...the Sharingan....</font>"
				sleep(25)
				usr<<"<font color=#800000> carriers that have these eyes....leave this place.....before it's too late...</font>"
		UchihaTablet2Left
			density=1
			icon_state="stone 1"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>We as a clan used to believe to be based on hate....and pure evil....</font>"
				sleep(25)
				usr<<"<font color=#800000>We kill each other to obtain power.....</font>"
				sleep(25)
				usr<<"<font color=#800000>This...is what true love is...</font>"
				usr<<"You can't read the rest from this side of the stone tablet"
		UchihaTablet2Right
			density=1
			icon_state="stone 2"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>love....love of friends.....love of family..</font>"
				sleep(25)
				usr<<"<font color=#800000>love....of power....</font>."
				sleep(25)
				usr<<"<font color=#800000>I will continue to show my love....</font>"
				sleep(25)
				usr<<"<font color=#800000>.......one sharingan at a time.....</font>"
		UchihaTablet3Left
			density=1
			icon_state="stone 1"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>After the second massacre of the Uchiha Clan by Uchiha Argon, it appears as though Uchiha, Vangroth has began leading the last remaining members of the Uchiha Clan..</font>"
				sleep(25)
				usr<<"<font color=#800000>Vangroth led them to hide amongst the Village Of Tea where they could hide in peace and become a full fledged clan again...</font>"
				sleep(25)
				usr<<"<font color=#800000>This...is where the eyes lay...</font>"
				usr<<"You can't read the rest from this side of the stone tablet"
		UchihaTablet3Right
			density=1
			icon_state="stone 2"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>Uchiha, Maximo appears to be the Raikage of the Cloud Village...</font>"
				sleep(25)
				usr<<"<font color=#800000>..wanting to make Cloud become the ultimate village and make Uchiha a well known clan..</font>"
				sleep(25)
				usr<<"<font color=#800000>It's foolish though...with the combined powers of Leaf, Sound, and Rain, Cloud and Maximo will surely be burned down to the ground..</font>"
				sleep(25)
				usr<<"<font color=#800000>...or...Maybe Maximo will attempt to find Peace with Kumojin, Kyrie..and maybe Uchiha will soon find an actual village to call home....</font>"
				sleep(25)
				usr<<"<font color=#800000>...only time will tell.....</font>"
		UchihaTablet4Left
			density=1
			icon_state="stone 1"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>The Mangekyou Sharingan....</font>"
				sleep(25)
				usr<<"<font color=#800000>The true Sharingan....it's power is immense and unstoppable...</font>"
				sleep(25)
				usr<<"<font color=#800000>According to what I've seen there are-</font>"
				usr<<"You can't read the rest from this side of the stone tablet"
		UchihaTablet4Right
			density=1
			icon_state="stone 2"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>about 13 different types of Mangekyou Sharingan that exist for the Uchiha so far....</font>"
				sleep(25)
				usr<<"<font color=#800000>..each with their own unique abilities..</font>"
				sleep(25)
				usr<<"<font color=#800000>..It also appears as though only 30 percent of Uchihas are able to awaken their Mangekyou Sharingan..</font>"
			//	usr<<"You can't read the rest from this side of the stone tablet"
		UchihaTablet5Left
			density=1
			icon_state="stone 1"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>As I arrived upon the Sound Village looking for more Eyes I noticed something strange...</font>"
				sleep(25)
				usr<<"<font color=#800000>I came upon an Uchiha who looked as though he was in his adult years, probably around age 20 or 25, I'm not sure...</font>"
				sleep(25)
				usr<<"<font color=#800000>He didn't have his Mangekyou Sharingan, only a mastered tomoe 3 sharingan...never the less I-</font>"
				usr<<"You can't read the rest from this side of the stone tablet"
		UchihaTablet5Right
			density=1
			icon_state="stone 2"
			verb/Command()
				set name = "Command"
				set src in oview(1)
				if(usr.dir!=NORTH)
					usr<<"You need to face the stone to be able to read it..."
					return
				usr<<"<font color=#800000>decided to take his Sharingan..as his eyes were useless since he wasn't capable of unlocking Mangekyou Sharingan..</font>"
				sleep(25)
				usr<<"<font color=#800000>before I was able to take his sharingan, a Mangekyou Sharingan someohow activated....</font>"
				sleep(25)
				usr<<"<font color=#800000>...is it truely possible for someone to unlock Mangekyou Sharingan.....another way than normally intended by a pure blooded Uchiha?</font>"




	Altar
		icon='Altar.dmi'
		pixel_y=16
	Tablet
		icon_state="tablet"
		density=1
	BedTop
		icon_state="bed top"
		pixel_y=12
	BedBottom
		icon_state="bed bottom"
		pixel_y=12