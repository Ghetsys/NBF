#define DEBUG
mob
	proc
		WORLDREPOP()
			sleep(2000)
			world.Repop()
			..()
var/list/DeadPeople=list()

//mob
//	verb
//		command(C as command_text)
//			set hidden=1
//			set name = "> "
//			usr<<"Your command via mob verb: [C]"

client/control_freak=0
//client
//	command_text=" "
//	New()
//		..()
//		while(1)
//			sleep(1)
//			src<<"[command_text]"
//	Command(C as command_text)
//		if(C==".click")
//			C+="\n"
//			world<<"[src]: [C]"
//		..()

//	verb
//		command(C as command_text)
//			set name = ">"
//			src<<"Your command via client: [C]"





//  Example of usage I found online
//	Command(C as command_text)
//		if(findtext(C,".click ",1,0))
//			world<<"[src]: [C]"
//		if(findtext(C,"\n ",1,0))
//			world<<"[src]: [C]"
//		world << "[src]: [C]"
//		..()
world
	New()
		..()
		spawn()
			BanUpdate()
		LoadVillageStuff()
		LoadSubscriberStuff()
//		world.setWeatherLoop()
//		world.createLightning()
		LoadBooks()
		world.Link()
	//	for(var/area/outside/O in world)	// Look for outside areas
	//		spawn() O.daycycle()			// begin the daycycle
		world.ArenaCheck()
		sleep(18000)
//		world.AutoReboot()
//		world.DepressionCheck()
		world.Repop()
//		spawn()
//			world.AFKCheck()
	//	spawn()
	//		Gauntlet()
world
	mob=/mob/player
	view = "9x9"
	hub="MegaNarutoUzumaki.NarutoCronicasShinobi"
	hub_password="meupau123"
	name = "NCS v1.0"
	status = "<font color=red><b>Ncs v1.0<br>Alpha</br></font></b>"//"<font color=blue><b>NFF Version 3.8.2<br>Status: Beta</br></font></b>"
	visibility=1
	loop_checks=1
	cache_lifespan=0
	map_format = TILED_ICON_MAP

client
	script = "<STYLE>BODY {background: black; font-size: 8px;color: white;}</STYLE>"



mob
	proc
		Set_Screen() // Declare proc; Set_Screen
			winset(src,"default","is-maximized=true")
obj/FadeIn
	icon='PNG/FadeIn.gif'
	layer=1000
	screen_loc="SOUTH,WEST to NORTH,EAST"

var/list/OnlinePlayers = list() //Added 11/16 <3 you Argon

mob/Login()
	//usr.AddHudz()
	//src.HotKeyHUD()
	//src.HotKeyHUD2()
	//if(!(src.key in OwnerGodsDude))
	//	src.verbs-=/mob/Admin/verb/mp3control
//	OutputPlayerInformation(src)
	client.view=9
	src.invisibility=50
	src.keyvar=src.key
	if(src.Bijuu=="9Tail")
		src.JutsuInLearning="KyuubiTail"
	src.loc = locate(10,11,20)
//	src<<sound(pick('loved.mid','miley.mid','Morning.mid','Wind.mid'),0,0,75)//src<<sound(pick('miley.mid','loved.mid','green.mid','earth.mid','cars.mid'))
	if(src.key in MonitorLv1)
		src.MemberRank="Monitor Lv.1"
	if(src.key in DevList)
	//	src.Dev=1
		src.SecondMemberRank="Developer"
	if(src.key in MonitorLv2)
		src.MemberRank="Monitor Lv.2"

	if(src.key in HelperLv1)
		src.MemberRank="Helper Lv.1"
	if(src.key in HelperLv2)
		src.MemberRank="Helper Lv.2"
	if(src.key in HelperLv3)
		src.MemberRank="Helper Lv.3"

	if(src.key in GMProbation)
		src.MemberRank="GM Probation"
	if(src.key in IconArtist)
		src.MemberRank="Icon Artist"
	if(src.key in EnforcerLv1)
		src.MemberRank="Enforcer Lv.1"
	if(src.key in FurMaster)
		src.MemberRank="FurMaster"
	if(src.key in EnforcerLv2)
		src.MemberRank="Enforcer Lv.2"

	if(src.key in ModeratorLv1)
		src.MemberRank="Moderator Lv.1"
	if(src.key in ModeratorLv2)
		src.MemberRank="Moderator Lv.2"

	if(src.key in StaffSergent)
		src.MemberRank="Staff Sergent"
	if(src.key in MasterEnforcer)
		src.MemberRank="Master Enforcer"
	if(src.key in Admin)
		src.MemberRank="Admin"
		if(src.key=="Genatrex")
			src.MemberRank="High Admin"
	if(src.key in OwnerGodsDude)
		src.MemberRank="Owner"
	if(src.key in Dumbass)
		src.MemberRank="owner"
	if(src.key in Liaison)
		src.MemberRank="Liaison"
	src.PowerGive()
	if(src.key in boots)
		src<<"You're currently booted. You'll have to wait before being able to join the game."
		del(src)
	OnlinePlayers+=src
//	src.client.sound_system.MusicFade(null,0,10,50)
	..()
mob/var/tmp/GM=0
mob/var/tmp
	controling=0
//////////////////Weather
/////////////////////////////
/*Outside Area Demo
By: Shadowdarke (shadowdarke@hotmail.com)
Sept. 6th, 2001

Outside Area Demo demonstrates how to implement day/night cycles two ways,
with overlays or with the luminosity variable. This demo also shows how to
change a turf from one area to another.

The area overlay day/night cycle is much faster than turf overlay day/night
systems, accomplishing the same effect with a couple lines of code and no
lag producing loops. I've tested it with maps as large as 500x500x5 with no
lag at all from the day/night cycle.
*/
obj/HUD
	FadeIn
		icon='hudfade.dmi'
		icon_state="Fade1"
		layer=FLY_LAYER+1
		screen_loc="1,1 to 19,19"
		New()
			spawn()
				while(src)
					src.icon_state="Fade1"
					sleep(1)
					src.icon_state="Fade2"
					sleep(1)
					src.icon_state="Fade3"
					sleep(1)
					src.icon_state="Fade4"
					sleep(1)
					src.icon_state="Fade5"
					sleep(9)
			spawn(13)
				del(src)
	FadeOut
		icon='hudfade.dmi'
		icon_state="Fade5"
		layer=FLY_LAYER+1
		screen_loc="1,1 to 19,19"
		New()
			spawn()
				while(src)
					src.icon_state="Fade5"
					sleep(1)
					src.icon_state="Fade4"
					sleep(1)
					src.icon_state="Fade3"
					sleep(1)
					src.icon_state="Fade2"
					sleep(1)
					src.icon_state="Fade1"
					sleep(9)
			spawn(13)
				del(src)
	BackgroundWoodPallete
		icon='hudfade.dmi'
		icon_state="Fade5"
		layer=FLY_LAYER+1
		screen_loc="1,1"
		New()
			spawn()
				while(src)
					src.icon_state="Fade5"
					sleep(1)
					src.icon_state="Fade4"
					sleep(1)
					src.icon_state="Fade3"
					sleep(1)
					src.icon_state="Fade2"
					sleep(1)
					src.icon_state="Fade1"
					sleep(9)
			spawn(13)
				del(src)
mob/var/DeathAvoidOffence=0
mob/var/DeathAvoided=0
mob/Logout()
//	if(src.knockedout)
//		world<<"[src] logged out while knocked out.#524"
	if(src in InAssassinEvent)
		world<<"[src] has logged out while they were in the Assassin Event!"
	if(src in Assassin)
		world<<"[src] has logged out while they were in the Assassin Event!"
	OnlinePlayers-=src
	for(var/obj/Jutsu/A in world)
		if(A.Owner==src)
			del(A)
	for(var/obj/Jutsu/Elemental/A in world)
		if(A.Owner==src)
			del(A)
	for(var/obj/Ninjutsu/HealingAura/AB in world)
		if(AB.Owner==src)
			del(AB)
	for(var/obj/Jutsu/KujakuMyohou/A in world)
		if(A.Owner==src)
			del(A)
	for(var/obj/Jutsu/Paper/A in world)
		if(A.Owner==src)
			del(A)
	for(var/obj/Genjutsu/A in world)
		if(A.Owner==src)
			del(A)
	if(src.HasHiddenScroll)
		world<<"<font color=red size=2><b>[src] logged out while holding the Hidden Ninja Scroll, dropping it."
		for(var/obj/Hidden_Ninja_Scroll/H in src.contents)
			H.loc=src.loc
			H.VillageIn=""
	if(global.AutoFreeForAllCount >= 1)
		if(src in AutoFreeForAll)
			AutoFreeForAll.Remove(src)
			world<<"[src] has logged out in the FFA. [src] has been removed from the Tournament."
	if(src in SecondPartDeath)
		SecondPartDeath.Remove(src)
		if(src.knockedout)
			world<<"[src] has logged out while koed during the second part of the Chuunin Exam! [src] Death avoided and has been removed from the Chuunin Exam."
		else
			world<<"[src] has logged out during the second part of the Chuunin Exam!. [src] has been removed from the Chuunin Exam."
	if(src.Focus!=src.OldFocus)
		src.Focus=src.OldFocus
	if(src.InHenge)
		src.overlays=null
		src.icon=src.Oicon
		src.overlays+=src.hair
		src.overlays+=usr.Overlays
		src.firing=0
		src.name=src.savedname
		src.InHenge=0
	if((src.Swift!=src.BaseSwift)&&(src.Kochou))
		if(src.BaseSwift!=0)
			src.Kochou=0
			src.Swift=src.BaseSwift
	if(src&&src.loggedin)
//		src.Save_Guild()
		//src.SaveK()
		if(src.knockedout)
			world<<"<font size=1><font color =red><B>Info: <font color = white>[src]([src.keyvar]) Logged out while knocked out"
		else
			world<<"<font size=1><font color =red><B>Info: <font color = white>[src]([src.keyvar]) Logged out"
		src.underlays -= 'Kujaku.dmi'
		src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';src.overlays-='Icons/Jutsus/RaitonTechniques.dmi';src.overlays-='Icons/Jutsus/Chidori.dmi';src.overlays-='Icons/Jutsus/Rasengan.dmi'
		src.controlled=null;src.loggedin=0;src.icon=src.Oicon;src.icon_state="";src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
//		if(src.name=="Uchiha, Argon")
//			sleep(300)
//			if(!src.key)
//				del(src)
	sleep(70)
	..()
mob/var/tmp/atom/movable/controlled
mob/Move(l,d)
	if(controlled)
		step(controlled,d)
		if(src.InKageMane)
		//	world<<"Check to Make sure in Kage Mane."
			for(var/obj/Nara/Shibari/K in src.shadowList)//Just take out the For if it gets buggy.
				if(K.Owner==src)
		//			world<<"registered as Owner of Shibari Objs."
					step(K,d)

			..()
	else return ..()


mob/var/tmp/AFKChosenAnswer=""
mob/var/tmp/MarkedAsAFK=0
mob/owner/verb/AFKCheckTest()
	set name="Start a AFK Check"
	set category="Staff"
	world.AFKCheck()
world/proc
	AutoReboot(OwnerAutoOn=0)
		var/AmountVoting=0
		var/AmountYes=0
		var/AmountNo=0
		var/AutoOn=0
		var/calcLag = abs(world.cpu - 100)
		if(OwnerAutoOn)
			AutoOn=1
		if(25>=calcLag||AutoOn)
			for(var/mob/M in OnlinePlayers)
				switch(input(M,"The server is currently at [calcLag] usage. Would you like a Reboot?") in list("Yes","No"))
					if("Yes")
						AmountYes++
						AmountVoting++
					if("No")
						AmountNo++
						AmountVoting++
			spawn(300)
				world<<"Total Voted: [AmountVoting] "
				world<<"Total Voted Yes: [AmountYes]"
				world<<"Total Voted No: [AmountNo]"
				if(AmountYes>(AmountVoting*0.60))
					world << "<font size=4>World Rebooting in 30 seconds.</font>"
					sleep(250)
					world << "Reboot in 5"
					sleep(10)
					world << "4"
					sleep(10)
					world << "3"
					sleep(10)
					world << "2"
					sleep(10)
					world << "1"
					sleep(10)
					world.Reboot()
				else
					world<<"Not enough people wanted a Reboot. Auto Reboot cancelled."
		else
			spawn(24000)
				world.AutoReboot()
	AFKCheck()//Might be able to expand on this later
		set background=1
		var/list/AFKCheck=list()
		var/Answer=""
		var/QuestionChosen=rand(1,7)
		AFKChosenQuestion=QuestionChosen
		if(AFKChosenQuestion==1)
			Answer="Korona"
		if(AFKChosenQuestion==2)
			Answer="Banana"
		if(AFKChosenQuestion==3)
			Answer="12"
		if(AFKChosenQuestion==4)
			Answer="Blue"
		if(AFKChosenQuestion==5)
			Answer="Killer"
		if(AFKChosenQuestion==6)
			Answer="Suiton"
		if(AFKChosenQuestion==7)
			Answer="Genjutsu"
		for(var/mob/M in OnlinePlayers)
			if(M.FirstName!="")
				AFKCheck+=M
		for(var/mob/C in AFKCheck)
			C<<"<font size=3>An AFK Check is being Conducted. Answer the following question using the Say verb in the next 60 seconds to avoid being booted. The answer is Case sensetive. Make sure your answer starts with a capital letter.</font>"
			C.AFKChosenAnswer=""
			if(AFKChosenQuestion==1)
				C<<"<font size=3>Which of the following is not one of the Current Owners? Sasuna, Argon, Korona</font>"
			if(AFKChosenQuestion==2)
				C<<"<font size=3>Which of the following is not a Color? Red, Blue, Orange, Banana</font>"
			if(AFKChosenQuestion==3)
				C<<"<font size=3>What is ((2+2)*3)</font>?"
			if(AFKChosenQuestion==4)
				C<<"<font size=3>What is the color of the Sky?</font>"
			if(AFKChosenQuestion==5)
				C<<"<font size=3>Which of the following is not a Staff Position on NFF? Enforcer, Moderator, Killer</font>"
			if(AFKChosenQuestion==6)
				C<<"<font size=3>What element destroys the element Fire? Put the Chinese name for the element</font>"
			if(AFKChosenQuestion==7)
				C<<"<font size=3>List the other most common form of Jutsu utilized in Battle that Isn't Taijutsu or Ninjutsu. Answer isn't Doujutsu.</font>"
		spawn(600)
			for(var/mob/B in AFKCheck)
				if(B.AFKChosenAnswer!=Answer)
					B<<"You've been marked as AFK"
					B.MarkedAsAFK=1
				//	del(B)
				else
					B<<"You've been marked as not AFK and have passed the AFK Check!"
					AFKCheck-=B
			AFKChosenQuestion=0
	//	spawn(24000)
	//		world.AFKCheck()



	ArenaCheck()
		set background=1//Just added the Currently Challenging //12 24/2012
		if((global.CurrentlyChallenging==0)&&((global.contestantOne!=""&&(global.contestantTwo==null||global.contestantTwo==""))||(global.contestantTwo!=""&&(global.contestantOne==null||global.contestantOne=="")))||(global.challengeOpenWorld==1&&(global.contestantOne==""||global.contestantOne==null)&&(global.contestantTwo==""||global.contestantTwo==null)))
			global.contestantOne = ""
			global.contestantTwo = ""
			global.challengeOpenWorld = 0
			global.challengeAccepted = 0
			global.ArenaChosen=""
			world<<"The Single Person Challenge Arenas have been Auto fixed."
		spawn(3500) world.ArenaCheck()
	Link()
		set background=1
		var/randz=rand(1,7)
		if(randz==1)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
		if(randz==2)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
		if(randz==3)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
		if(randz==4)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
		if(randz==5)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
		if(randz==6)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
		if(randz==7)
			world<<"<font size=2>A staff te deseja um bom dia! :3"
			world<<"<font size=2>"
	//	world<<"<font size=2>http://s8.zetaboards.com/NarutoFinalFight"
		spawn(18000) world.Link()

mob
	proc
		Skills()
			if(!src.client)
				return
			if(src.Clan=="Aburame")
				if(!(locate(/obj/SkillCards/SummonKonchuu) in src.LearnedJutsus))
					src.LearnedJutsus+=new /obj/SkillCards/SummonKonchuu();src.LearnedJutsus+=new /obj/SkillCards/UnsummonKonchuu()
					src.LearnedJutsus+=new /obj/SkillCards/PlaceBug();src.LearnedJutsus+=new /obj/SkillCards/UnPlaceBug()

			if(src.Clan=="Hyuuga")
				if(!(locate(/obj/SkillCards/Byakugan) in src.LearnedJutsus))
					src.LearnedJutsus+=new /obj/SkillCards/Byakugan()

			if(src.Clan=="Kumojin")
				if(!(locate(/obj/SkillCards/Kumoshibari) in src.LearnedJutsus))
					src.LearnedJutsus+=new /obj/SkillCards/Kumoshibari()
				if(!(locate(/obj/SkillCards/SpiderSummon) in src.LearnedJutsus))
					if(src.SpiderMastery>=10)
						src.LearnedJutsus+=new /obj/SkillCards/SpiderSummon()

			if(src.Clan=="Sabaku")
				if(!(locate(/obj/SkillCards/SunaTate) in src.LearnedJutsus))
					src.LearnedJutsus+=new /obj/SkillCards/SunaTate()

			if(src.Clan=="Uchiha")
				if(!(locate(/obj/SkillCards/Mangekyo) in src.LearnedJutsus))
					return //No MS users for now.
				//	if(src.CanGetMangekyo&&src.Age>17)
				//		src.CanGetMangekyo=0
				//	if((src.kills-src.deaths)>=200&&src.UchihaMastery>=100&&src.SharinganMastery>=300&&src.CanGetMangekyo)
				//		src<<"<B><font color = blue>Your eyes pulsate!"
				//		src.LearnedJutsus+=new /obj/SkillCards/Mangekyo()

			if(src.BeginningVillage=="Rain"&&src.Clan=="Basic")
				if(src.Age==13&&src.AgeEXP<50&&!locate(/obj/SkillCards/MajesticEyes) in src.LearnedJutsus)
					if(prob(0.05))
						src.LearnedJutsus+=new /obj/SkillCards/MajesticEyes()
						src.MajesticEyes()
			if(src.AbleToGetConversusin)
				if(src.Age==18)
					if(!(locate(/obj/SkillCards/Conversusin) in src.LearnedJutsus))
						src.LearnedJutsus+=new /obj/SkillCards/Conversusin()
						src<<"<B><font color = yellow>Your eyes pulsate!"