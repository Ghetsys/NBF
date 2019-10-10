//Mitchell Quinn
// Village War System
//First Draft
//5/12/2011

mob/owner/verb/CheckWarList()
	set name="Check People In War"
	var/a
	if(JoinedWarList.len<=0)
		usr<<"There is nobody in the war."
	for(a=1;a<=JoinedWarList.len,a++)
		var/e=JoinedWarList[a]
		usr<<"[e] = [JoinedWarList[e]]"

/*

Things needed

-Village War map
-on the map
- 2 Npcs on each side that allow the person to enter into the village war
-the npcs should set the user to villagewar == 1
- 2 war monuments that can be destroyed with a special bomb detination
- 2 base camps were people can respawn

-villages
- 1 npc in every village that lets them event the village war
-command to run the village war


Things to do
============
I need to add in spawn system to work with village war
[done]write out exactly how village war system will work




How the village war will work
=============================
For now gm will start the war. between 2 different villages
Make it a command



done
Village War start command
==========================
Who will have the command

For now owners / admin
eventually kages

starts the village war when clicked
Checks to see if a villageWarGo >=1 (global variable villageWarOn)
Sets villageWarOn == 1
Automatically Selects the village the person is in as village 1
Sets [village]War == 1(going to need a IF statement for this
Gives a List of the 4 villages to select
checks to make sure that the src.village!= selected village
Sets the other [village]War == 1
Announces that a village war will begin in 5 minutes between the 2 villages
spawn(6000)
sets villageWarGo == 2
creates obelisks
has a check that checks to see if villageWarGo == 3
sleep60000
loop
alerts score
sleep 6000

alerts the village war is now over
alerts village 1 score
alerts village 2 score
adds 1 point to village score for kages
adds 2 point to village jutsu points for winner
adds 1 point to village jutsu points for loser




NPC in village
==================================
Same NPC in every village


Checks to see if >= 2
alerts would you like to enter the war
checks to see if src.villageWar == 1
teleports to war area respawn place for team


NPC Village war Spawn area
==================================
users autospawn in bed who are involved in the village war
switches Are you sure you want to enter into the village war area
+ 1 point to Opposite team
would you like to leave
+ 1 point to opposite team
would you like to buy a bomb for 5000 yen
if user has a bomb then they cant buy another
-5000 yen
+ 1 bomb

Bomb
=================================
description:
Super highly explosive but takes a long time to plant

Obelisk
================================
will be spawned at the beginning of the war 2 on both sides
Deathclock of 60000
proc that allows a user to plant a the bomb
has a delay of 600 while planting
if the user takes a step or gets knocked out then the bomb is planting is disabled
if the bomb succeeds the obelisk health -= 1
if obelisk health == 0 then obelisk deleteds it self
if the obelisk is destoryed
villageWarGo == 3
sends a variable to the winner to end the war




Ok, here is how it basically goes down.

For the beta testing of the village war, owners will have the village war command. The command will start the village war.

The war last for about 1 hour + 10 minutes of preparing time at the beginning

The two ways to win are the destruction of the other villages obelisk, or the most about of points at the end of the war.

Points are gained everytime an enemy ninja enters the village war area the other team gets a point. I made it like this so that
if teams are super uneven, the team with less people starts off with an advantage.

Everytime you die you go to a spawning zone bed where you rest and can buy a bomb.

Winner will get village points which will later be used to get village jutsus +2
the loser also gets a point for participation+1
winner also gets a village score point +1 which has no use planned yet but in the future may be useful.

*/

/*
Village War start command
==========================
Who will have the command

For now owners / admin
eventually kages

starts the village war when clicked
Checks to see if a villageWarGo >=1 (global variable villageWarOn)
Sets villageWarOn == 1
Automatically Selects the village the person is in as village 1
Sets [village]War == 1(going to need a IF statement for this

Gives a List of the 4 villages to select
checks to make sure that the src.village!= selected village
Sets the other [village]War == 1
Announces that a village war will begin in 5 minutes between the 2 villages
spawn(6000)
sets villageWarGo == 2
creates obelisks
has a check that checks to see if villageWarGo == 3
sleep6000
loop
alerts score
sleep 6000

alerts the village war is now over
alerts village 1 score
alerts village 2 score
adds 1 point to village score for kages
adds 2 point to village jutsu points for winner
adds 1 point to village jutsu points for loser
*/

//core coding :D

/*
mob/Admin/verb/VillageWarStartMain()
	set name = "Village War Pillar of War"
	set category="Staff"
	if (global.villageWarGo >= 1)
		usr<<"There is already a war in progress! or on cooldown."
		return;
	else
		global.villageWarGo = 1
		global.villageWarTeamOne = usr.Village
		switch(input(usr, "Which village would you like to declare war on?") in list("Leaf","Rain","Rock","Sound","Cancel"))
			if("Leaf")
				global.villageWarTeamTwo = "Leaf"
				if(global.villageWarTeamOne == "Leaf")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rain")
				global.villageWarTeamTwo = "Rain"
				if(global.villageWarTeamOne == "Rain")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rock")
				global.villageWarTeamTwo = "Rock"
				if(global.villageWarTeamOne == "Rock")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Sound")
				global.villageWarTeamTwo = "Sound"
				if(global.villageWarTeamOne == "Sound")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Cancel")
				global.villageWarGo = 0
				usr<<"War cancelled."
				return;
		world << "The war will begin in 5 Minutes, quickly prepare! Talk to the Village War Npc to enter the battlefield spawning area!"
		sleep(3000)
		global.villageWarGo = 2
		world<<"The War is  now Open, You may join the battle!"
		var/counter = 0
		//check to see if the
		while (counter != 3)
			if(global.villageWarGo == 3)
				world<<"The village war between [global.villageWarTeamOne] and [global.villageWarTeamTwo] has ended."
				world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
				world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
				goto Test
			sleep(6000)
			counter++
			world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
			world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
		if(global.villageWarGo == 2)
			world<<"The village war between [global.villageWarTeamOne] and [global.villageWarTeamTwo] has ended."
			world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
			world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
		Test
			if (global.villageWarTeamOneScore > global.villageWarTeamTwoScore)
				world<<"[global.villageWarTeamOne] has won the war!"
				if (global.villageWarTeamOne == "Leaf")
					global.villageJutsuLeaf++
				else if (global.villageWarTeamOne == "Rock")
					global.villageJutsuRock++
				else if (global.villageWarTeamOne == "Rain")
					global.villageJutsuRain++
				else if (global.villageWarTeamOne == "Sound")
					global.villageJutsuSound++
			else if (global.villageWarTeamOneScore < global.villageWarTeamTwoScore)
				world<<"[global.villageWarTeamTwo] has won the war!"
				if (global.villageWarTeamOne == "Leaf")
					global.villageJutsuLeaf++
				else if (global.villageWarTeamOne == "Rock")
					global.villageJutsuRock++
				else if (global.villageWarTeamOne == "Rain")
					global.villageJutsuRain++
				else if (global.villageWarTeamOne == "Sound")
					global.villageJutsuSound++
			else
				world<<"Sometimes there are no winners in war..."
			global.villageWarGo = 0
		global.villageWarGo = 0
		global.villageWarTeamOne = ""
		global.villageWarTeamTwo = ""
		global.villageWarTeamOneScore =  0
		global.villageWarTeamTwoScore = 0
		world<<"The war is over."

*/



/*



NPC in village
==================================
Same NPC in every village


Checks to see if >= 2
alerts would you like to enter the war
checks to see if src.villageWar == 1
teleports to war area respawn place for team

*/
var/global/villageWarGo = 0
var/global/villageWarTeamOne = ""
var/global/villageWarTeamTwo = ""
var/global/villageWarTeamOneScore =  0
var/global/villageWarTeamTwoScore = 0
var/global/villageJutsuLeaf
var/global/villageJutsuRain
var/global/villageJutsuRock
var/global/villageJutsuSound
var/list/JoinedWarList=list()
mob/var/tmp/villageWarParticipating = 0
//
mob/villageWarNPC
	villageOne
		name = "Village War Sage"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/PainbodyH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(250,0,140)
				var/Shirt='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/pants.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"So you would like to see what war is really like.. "
			for(var/mob/C in world)
				if(C.client&&C!=usr)
					if(C.client.computer_id==usr.client.computer_id)
						usr<<"I'm afraid you can only have one account logged onto the game if you wish to participate in the war."
						return
			switch(input(usr, "Would you like to see what war is really like?") in list ("I am ready for battle", "I am not ready for this"))
				if ("I am ready for battle")
					if(usr.Age<13)
						usr<<"You're a little young for war..."
						return
					if(usr.client.computer_id in JoinedWarList)
						usr<<"You already joined this war once on another key..."
						return
					if(global.villageWarGo >= 1)
						if((usr.Village == global.villageWarTeamOne) || (usr.Village == global.villageWarTeamTwo)||(usr.Village == "Missing"))
							usr.villageWarParticipating = 1
							if(usr.Village == global.villageWarTeamOne)
								usr.loc = locate(182,116,21)
							else if(usr.Village == global.villageWarTeamTwo)
								usr.loc = locate(67,186,21)
							else if (usr.Village == "Missing")
								var/x = rand(1,2)
								if(x == 1)
									usr.loc=locate(182,116,21)
								else if (x == 2)
									usr.loc = locate(67,186,21)
				//			JoinedWarList.Add(usr.client.computer_id)
							JoinedWarList+=usr.client.computer_id
							usr<<"You arrive in the safe zone of the battlefield."
						else
							usr<<"Your village is at peace."
					else
						usr<<"The world is at peace."
				if(" I am not ready for this")
					usr<<"You will be ready one day."
					return

mob/villageWarNPC1
	WarHospitalOne
		name = "War Area Sage"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/PainbodyH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(250,0,140)
				var/Shirt='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/pants.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			if (global.villageWarGo >=2&&!usr.clicking)
				usr.clicking=1
				switch(input(usr, "Would you like to enter the Battle ?") in list ("Send me into the Battle!", "I need more time to rest.","I want to go home."))
					if("Send me into the Battle!")
				//		if(usr.client.computer_id in JoinedWarList)
				//			world<<"[usr] has been located in list JoinedWarList."
				//		usr<<"[JoinedWarList.len] are currently in the war."
						if(!(usr.client.computer_id in JoinedWarList))
							world<<"[usr] has attempted to join the War after relogging! [usr.client.computer_id]"
							usr.villageWarParticipating = 0
							usr.GotoVillageHospital()
			//			JoinedWarList.Add(usr.client.computer_id) //5/27/2013 not sure if adding this twice is a good thing, this was already here.
						usr.clicking=0
						var/image/I=image('Icons/Hud/hudfade.dmi',"[usr.Village]")
						I.pixel_y=6
						usr.overlays+=I
						var/x = rand(1,3)
						if(usr.Village == global.villageWarTeamOne)
							//global.villageWarTeamTwoScore++
							if(x == 1)
								usr.loc = locate(173,189,21)
							if(x == 2)
								usr.loc = locate(189,184,21)
							if(x == 3)
								usr.loc = locate(176,180,21)
						else if(usr.Village == global.villageWarTeamTwo)
							//global.villageWarTeamOneScore++
							if(x == 1)
								usr.loc = locate(99,134,21)
							if(x == 2)
								usr.loc = locate(83,139,21)
							if(x == 3)
								usr.loc = locate(84,130,21)
						else
							usr<<"Your village is not in the war."
							usr.villageWarParticipating = 0
							usr.GotoVillageHospital()
					if("I need more time to rest.")
						usr<<"Take your time, but time is ticking"
						usr.clicking=0
						return
					if("I want to go home.")
						usr<<"War is not for everyone."
						var/image/I=image('Icons/Hud/hudfade.dmi',"[usr.Village]")
						I.pixel_y=6
						usr.overlays-=I
						usr.villageWarParticipating = 0
						usr.GotoVillageHospital()
						usr.clicking=0
						return
			else if(villageWarGo == 0)
				usr.GotoVillageHospital()
				usr<<"There is no War at the moment."
				usr.villageWarParticipating = 0
			else
				usr<<"Please wait until the 5 minute waiting period is over!"



//Village War Respawn Stuff
mob/proc
	villageWarRespawn()
		var/image/I=image('Icons/Hud/hudfade.dmi',"[usr.Village]")
		I.pixel_y=6
		usr.overlays-=I
		var/randbed=rand(1,12)
		if(src.Village == global.villageWarTeamOne)
			if(randbed==1)
				src.loc=locate(178,114,21)
			if(randbed==2)
				src.loc=locate(181,114,21)
			if(randbed==3)
				src.loc=locate(184,114,21)
			if(randbed==4)
				src.loc=locate(187,114,21)
			if(randbed==5)
				src.loc=locate(178,112,21)
			if(randbed==6)
				src.loc=locate(181,112,21)
			if(randbed==7)
				src.loc=locate(184,112,21)
			if(randbed==8)
				src.loc=locate(187,112,21)
			if(randbed==9)
				src.loc=locate(178,110,21)
			if(randbed==10)
				src.loc=locate(181,110,21)
			if(randbed==11)
				src.loc=locate(184,110,21)
			if(randbed==12)
				src.loc=locate(187,110,21)
			src.resting=1
			src<<"You rest in the bed."
			src.Frozen=1
			while(src.resting)
				if(src.health<src.maxhealth)
					src.health+=(src.maxhealth/50)
				if(src.stamina<src.maxstamina)
					src.stamina+=(src.maxstamina/75)
				if(src.ChakraPool<src.MaxChakraPool)
					src.ChakraPool+=(src.MaxChakraPool/210)
				sleep(1)
		else if (src.Village == global.villageWarTeamTwo)
			if(randbed==1)
				src.loc=locate(63,184,21)
			if(randbed==2)
				src.loc=locate(66,184,21)
			if(randbed==3)
				src.loc=locate(69,184,21)
			if(randbed==4)
				src.loc=locate(71,184,21)
			if(randbed==5)
				src.loc=locate(63,182,21)
			if(randbed==6)
				src.loc=locate(66,182,21)
			if(randbed==7)
				src.loc=locate(69,182,21)
			if(randbed==8)
				src.loc=locate(71,182,21)
			if(randbed==9)
				src.loc=locate(63,180,21)
			if(randbed==10)
				src.loc=locate(66,180,21)
			if(randbed==11)
				src.loc=locate(69,180,21)
			if(randbed==12)
				src.loc=locate(71,180,21)
			src.resting=1
			src<<"You rest in the bed."
			src.Frozen=1
			while(src.resting)
				if(src.health<src.maxhealth)
					src.health+=(src.maxhealth/50)
				if(src.stamina<src.maxstamina)
					src.stamina+=(src.maxstamina/75)
				if(src.ChakraPool<src.MaxChakraPool)
					src.ChakraPool+=(src.MaxChakraPool/210)
				sleep(1)
		else
			src<<"Village War, Error Check 1"
			src.villageWarParticipating = 0
			src.GotoVillageHospital()

//Village War One, Blood Lust
var/global.villageWarBloodLust = 0
var/global.WarDelay=0
mob/owner/verb/TestWar()
	set name="Host a Test War"
	global.villageWarGo = 1
	global.villageWarBloodLust = 1
	global.villageWarTeamOne = usr.Village
	global.villageWarTeamOneScore =  0
	global.villageWarTeamTwoScore = 0
	switch(input(usr, "Which village would you like to declare war on?") in list("Leaf","Rain","Rock","Sound","Cancel"))
		if("Leaf")
			global.villageWarTeamTwo = "Leaf"
			if(global.villageWarTeamOne == "Leaf")
				usr<<"You can not declare war on your own village!"
				global.villageWarGo = 0
				return;
			else
				world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
		if("Rain")
			global.villageWarTeamTwo = "Rain"
			if(global.villageWarTeamOne == "Rain")
				usr<<"You can not declare war on your own village!"
				global.villageWarGo = 0
				return;
			else
				world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
		if("Rock")
			global.villageWarTeamTwo = "Rock"
			if(global.villageWarTeamOne == "Rock")
				usr<<"You can not declare war on your own village!"
				global.villageWarGo = 0
				return;
			else
				world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
		if("Sound")
			global.villageWarTeamTwo = "Sound"
			if(global.villageWarTeamOne == "Sound")
				usr<<"You can not declare war on your own village!"
				global.villageWarGo = 0
				return;
			else
				world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
		if("Cancel")
			global.villageWarGo = 0
			usr<<"War cancelled."
			return;
	world << "The war will begin in 5 Minutes, quickly prepare! Talk to the Village War Npc to enter the battlefield spawning area!"
	Village_War_Go()
mob/Kage/verb/VillageWarStart2()
	set name= "Declare War"
	set category="Kage"
	if(global.WarDelay)
		usr<<"Another war cannot happen so soon. The world needs time to recooperate.."
		return
	if (global.villageWarGo >= 1)
		usr<<"There is already a war in progress! or on cooldown."
		return
	else
		global.villageWarGo = 1
		global.villageWarBloodLust = 1
		global.villageWarTeamOne = usr.Village
		global.villageWarTeamOneScore =  0
		global.villageWarTeamTwoScore = 0
		switch(input(usr, "Which village would you like to declare war on?") in list("Leaf","Rain","Rock","Sound","Cancel"))
			if("Leaf")
				global.villageWarTeamTwo = "Leaf"
				if(global.villageWarTeamOne == "Leaf")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rain")
				global.villageWarTeamTwo = "Rain"
				if(global.villageWarTeamOne == "Rain")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rock")
				global.villageWarTeamTwo = "Rock"
				if(global.villageWarTeamOne == "Rock")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Sound")
				global.villageWarTeamTwo = "Sound"
				if(global.villageWarTeamOne == "Sound")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Cancel")
				global.villageWarGo = 0
				usr<<"War cancelled."
				return;
		world << "The war will begin in 5 Minutes, quickly prepare! Talk to the Village War Npc to enter the battlefield spawning area!"
		Village_War_Go()
proc
	Village_War_Go()
		sleep(300)
		global.villageWarGo = 2
		world<<"The War is  now Open, You may join the battle!"
		var/counter = 0
		//check to see if the
		while (counter != 30)
			sleep(600)
			counter++
			//world<<"The village with the Lowest points wins the war."
			world<<"There are [30-counter] minutes left in the war."
			world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
			world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
		var/WinningVillage
		var/WinningScore
		if (global.villageWarTeamOneScore > global.villageWarTeamTwoScore)
			world<<"<font color=blue size=2>[global.villageWarTeamOne] has won the war!</font>"
			WinningVillage=global.villageWarTeamOne
			WinningScore=global.villageWarTeamOneScore
			//if (global.villageWarTeamOne == "Leaf")
				//global.villageJutsuLeaf++
			//else if (global.villageWarTeamOne == "Rock")
				//global.villageJutsuRock++
			//else if (global.villageWarTeamOne == "Rain")
				//global.villageJutsuRain++
			//else if (global.villageWarTeamOne == "Sound")
				//global.villageJutsuSound++

		else if (global.villageWarTeamOneScore < global.villageWarTeamTwoScore)
			world<<"<font color=blue size=2>[global.villageWarTeamTwo] has won the war!</font>"
			WinningVillage=global.villageWarTeamTwo
			WinningScore=global.villageWarTeamTwoScore
			//if (global.villageWarTeamOne == "Leaf")
				//global.villageJutsuLeaf++
			//else if (global.villageWarTeamOne == "Rock")
				//global.villageJutsuRock++
			//else if (global.villageWarTeamOne == "Rain")
				//global.villageJutsuRain++
			//else if (global.villageWarTeamOne == "Sound")
				//global.villageJutsuSound++
		else
			world<<"<font color=blue size=2>Sometimes there are no winners in war...</font>"
		for(var/mob/M in world)
			if(M.villageWarParticipating&&M.Village==WinningVillage)
				M.VMorale+=WinningScore;M.kills+=(round(WinningScore/2));M.Yen+=(WinningScore*1000)
				M<<"<font color=blue>Congratulations on your victory. You've gained [WinningScore*1000] Ryo, [WinningScore] Village Morale and [round(WinningScore/2)] Class Level!</font>"
				if(WinningScore>=10)
					M<<"<font color=blue>You've gained 1 Elemental Point!</font>";M.ElementalPoints++
				if(WinningScore>=40)
					M<<"<font color=blue>You've gained 1 Starting Point!</font>";M.StartingPoints++
			if(M.villageWarParticipating)
				M.villageWarParticipating=0
				var/image/I=image('Icons/Hud/hudfade.dmi',"[M.Village]")
				I.pixel_y=6
				M.overlays-=I;M.overlays-=I
		global.villageWarGo = 0
		global.villageWarTeamOne = ""
		global.villageWarTeamTwo = ""
		global.villageWarTeamOneScore =  0
		global.villageWarTeamTwoScore = 0
		global.villageWarBloodLust = 0
		spawn()
			GlobalWarDelay(300000)
		JoinedWarList=null
		world<<"The war is over."

proc
	GlobalWarDelay(Number)
		global.WarDelay=1
		spawn(Number)
			if(global.WarDelay==1)
				global.WarDelay=0
				world<<"<font color=blue size=2>The delay on village wars has expired.</font>"
//Village War Pillars of War
var/global.villageWarPillar = 0
mob/Admin/verb
	War_Delay_Set()
		if(global.WarDelay)
			usr<<"Village wars are already on delay."
		var/Number=input(usr,"How many hours do you want to delay the Village War system for?","Timer",1) as num
		Number*=36000
		GlobalWarDelay(Number)
mob/Admin/verb
	War_Delay_Remove()
		if(global.WarDelay==1)
			global.WarDelay=0
			world<<"<font color=blue size=2>The delay on village wars has expired.</font>"
mob/Admin/verb/VillageWarStart1()
	set name = "Village War Pillar of War"
	set category="Staff"
	if (global.villageWarGo >= 1)
		usr<<"There is already a war in progress! or on cooldown."
		return;
	else
		global.villageWarGo = 1
		global.villageWarPillar = 1
		global.villageWarTeamOne = usr.Village
		switch(input(usr, "Which village would you like to declare war on?") in list("Leaf","Rain","Rock","Sound","Cancel"))
			if("Leaf")
				global.villageWarTeamTwo = "Leaf"
				if(global.villageWarTeamOne == "Leaf")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rain")
				global.villageWarTeamTwo = "Rain"
				if(global.villageWarTeamOne == "Rain")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Rock")
				global.villageWarTeamTwo = "Rock"
				if(global.villageWarTeamOne == "Rock")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Sound")
				global.villageWarTeamTwo = "Sound"
				if(global.villageWarTeamOne == "Sound")
					usr<<"You can not declare war on your own village!"
					global.villageWarGo = 0
					return;
				else
					world<< "<font size=3>[global.villageWarTeamOne] has declared war on [global.villageWarTeamTwo]"
			if("Cancel")
				global.villageWarGo = 0
				usr<<"War cancelled."
				return;
		world << "The war will begin in 5 Minutes, quickly prepare! Talk to the Village War Npc to enter the battlefield spawning area!"
		sleep(3000)
		global.villageWarGo = 2
		world<<"The War is  now Open, You may join the battle!"
		var/counter = 0
		//check to see if the
		while (counter != 3)
			if(global.villageWarGo == 3)
				world<<"The village war between [global.villageWarTeamOne] and [global.villageWarTeamTwo] has ended."
				world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
				world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
				goto Test
			sleep(6000)
			counter++
			world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
			world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
		if(global.villageWarGo == 2)
			world<<"The village war between [global.villageWarTeamOne] and [global.villageWarTeamTwo] has ended."
			world<<"[global.villageWarTeamOne] has [villageWarTeamOneScore] points"
			world<<"[global.villageWarTeamTwo] has [villageWarTeamTwoScore] points"
		Test
			if (global.villageWarTeamOneScore > global.villageWarTeamTwoScore)
				world<<"[global.villageWarTeamOne] has won the war!"
				if (global.villageWarTeamOne == "Leaf")
					global.villageJutsuLeaf++
				else if (global.villageWarTeamOne == "Rock")
					global.villageJutsuRock++
				else if (global.villageWarTeamOne == "Rain")
					global.villageJutsuRain++
				else if (global.villageWarTeamOne == "Sound")
					global.villageJutsuSound++
			else if (global.villageWarTeamOneScore < global.villageWarTeamTwoScore)
				world<<"[global.villageWarTeamTwo] has won the war!"
				if (global.villageWarTeamOne == "Leaf")
					global.villageJutsuLeaf++
				else if (global.villageWarTeamOne == "Rock")
					global.villageJutsuRock++
				else if (global.villageWarTeamOne == "Rain")
					global.villageJutsuRain++
				else if (global.villageWarTeamOne == "Sound")
					global.villageJutsuSound++
			else
				world<<"Sometimes there are no winners in war..."
			global.villageWarGo = 0
		global.villageWarGo = 0
		global.villageWarTeamOne = ""
		global.villageWarTeamTwo = ""
		global.villageWarTeamOneScore =  0
		global.villageWarTeamTwoScore = 0
		global.villageWarPillar = 0
		world<<"The war is over."





