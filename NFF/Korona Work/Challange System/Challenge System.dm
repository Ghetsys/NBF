/*




mob/GainedAfterLogIn/verb/Challenge()
	if(challengeOpenWorld==1)
		src<<"Challenges are currently going on, please wait for the challenge to end";return
	else
		src<<"Challenges are open, please select an opponent"
		world<<"<font size=3>[usr] is about to challenge someone!"
		global.challengeOpenWorld = 1
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client)
				if(T.name!=T.oname)
					if(T.oname==""||T.oname==null)
						T.oname=T.name
						varPeople += T.name
					else
						varPeople += T.oname
				else
					varPeople += T.name

		var/M = input(usr,"Who do you want to Challenge?","Select") in varPeople + list("Cancel")
		if(M == "Cancel")
			challengeOpenWorld = 0
			world<<"<font size=3><The challenge has been cancelled."
			return
		else
			global.contestantOne = usr
			//this is my problem it is reading global contestanttwo as null that is why everything is messingup
			global.contestantTwo = M
			world<<"<font size=3><[global.contestantTwo]"
			world<<"<font size=3><[global.contestantOne] has challenge [global.contestantTwo] to a fight to the death!"
			acceptChallenge()
			selectChallengeArena()
			deathCheck()

proc/deathCheck()
	if(challengeOpenWorld==1)
		if(global.contestantOne:Dead==1)
			challengeOpenWorld=0
			GotoVillageHospital()
			world<<"<font size=3><[global.contestantTwo] has defeated [global.contestantOne]"
		if(global.contestantTwo:Dead==1)
			challengeOpenWorld=0
			GotoVillageHospital()
			world<<"<font size=3><[global.contestantOne] has defeated [global.contestantTwo]"



mob/GainedAfterLogIn/verb/View_Challenger()
	if(usr.client.eye!=usr)
		usr.client.eye=usr
		usr.client.perspective = MOB_PERSPECTIVE
		return
	switch(input(usr, "Which fighter to do you wish to watch?") in list ("Challenger", "Defender", "Cancel"))
		if ("Challenger")
			usr.client.eye=global.contestantOne
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Defender")
			usr.client.eye=global.contestantTwo
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Cancel")
			return



mob/proc/CheckDeath()
	for(var/mob/M in world)
		if(M==global.contestantOne)
			if(M.Dead==1)
				challengeOpenWorld=0
				M.GotoVillageHospital()
				world<<"<font size=3><[global.contestantOne] has defeated [global.contestantTwo]"
			else
				challengeOpenWorld=1
		if(M==global.contestantTwo)
			if(M.Dead==1)
				challengeOpenWorld=0
				M.GotoVillageHospital()
				world<<"<font size=3><[global.contestantTwo] has defeated [global.contestantOne]"
			else
				challengeOpenWorld=1
	..()

//This is the main running of challenge system.
proc/challengeWorld()
	switch(input(global.contestantTwo,"Will you accept this challenge?") in list("Accept", "Decline"))
		if("Decline")
			world<<"<font size=3><[global.contestantTwo] has declined the challenge"
			global.challengeOpenWorld = 0
			return
		if("Accept")
			world<<"<font size=3><[global.contestantTwo] has accepted the challenge"

//this proc teleports the users to the arenas, it will teleport the challenger but never the defender, it is reading global.contestantTwo as null
proc/selectChallengeArena()
	switch(input(global.contestantTwo,"Which arena do you want to put them in?") in list("Desert","Forest","Temple to Argon"))
		if("Forest")
			global.contestantOne:Move(locate(117,102,22))
			global.contestantTwo:Move(locate(128,102,22))
		if("Desert")
			global.contestantOne:loc=locate(153,98,22)
			global.contestantTwo:loc=locate(145,98,22)
		if("Temple to Argon")
			global.contestantOne:loc=locate(175,105,22)
			global.contestantTwo:loc=locate(185,105,22)

proc/acceptChallenge()
	world<<"<font size=3>[global.contestantTwo]"
	switch(alert(global.contestantTwo,"Will you accept this challenge?","Accept","Decline"))
		if("Decline")
			world<<"<font size=3><[global.contestantTwo] has declined the challenge"
			global.challengeOpenWorld = 0
			return
		if("Accept")
			world<<"<font size=3><[global.contestantTwo] has accepted the challenge"


argon to fix the right clicking

Gotcha.. Uh, to get rid of that.. you've gotta make it so the list of mobs
is formed inside the proc
not like
verb/Challenge(mob/M in world)
instead make it verb/Challenge()
var/list/MobsInWorld=list()
for(var/mob/M in world)
Mitchell Quinn says
ah
Argon (Jake) says
if(M.client)



*/

var/global.challengeDeclined = 0
var/global.challengeAccepted = 0
var/global.challengeOpenWorld = 0
var/global.contestantOne
var/global.contestantTwo
var/global.contestantThree
var/global.contestantFour
var/global.CurrentlyChallenging=0
var/global.ArenaChosen=""
var/global.ArenaChosenSecond=""
mob/var/tmp/challenge
mob/var/tmp/challenged
mob/var/acceptingChallenges
mob/var/challengeWins = 0
mob/var/challengeLosses = 0
mob/var/challengeRating = 0
//var/contestant



//OK this is working a 100% :D
mob/GainedAfterLogIn/verb/View_Challenger()
	set category = "Challenge"
	if(usr.client.eye!=usr)
		usr.client.eye=usr
		usr.client.perspective = MOB_PERSPECTIVE
		return
//	switch(input(usr, "Which Arena Match would you like to currently watch?") in list ("First Match", "Second Match", "Cancel"))
	//	if("First Match")
	switch(input(usr, "Which fighter to do you wish to watch?") in list ("Challenger", "Defender", "Cancel"))
		if ("Defender")
			usr.client.eye=global.contestantOne
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Challenger")
			usr.client.eye=global.contestantTwo
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Cancel")
			return
	//	if("Second Match")
	//		switch(input(usr, "Which fighter to do you wish to watch?") in list ("Challenger", "Defender", "Cancel"))
	//			if ("Defender")
	//				usr.client.eye=global.contestantThree
	//				usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
	//				return
	//			if("Challenger")
	//				usr.client.eye=global.contestantFour
	//				usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
	//				return
	//			if("Cancel")
	//				return


//To toggle challenges on or off
mob/GainedAfterLogIn/verb/acceptingChallenges()
	set category = "Challenge"
	set name = "Toggle Challenges"
	switch(input(usr, "Do you want people to be able to challenge you?") in list("Open Challenges","Close Challenges","Cancel"))
		if("Open Challenges")
			usr.acceptingChallenges = 1
			usr<<"You are now accepting challenges."
			return
		if("Close Challenges")
			usr.acceptingChallenges = 0
			usr<<"You are now not accepting challenges."
			return
		if("Cancel")
			return





mob/GainedAfterLogIn/verb/RankedChallenge()
	set category = "Challenge"
	set name = "Ranked Challenge"
	if(usr.z==1)
		if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
			usr<<"Not while you're in prison!"
			return
	if(usr.z==35)
		usr<<"Not while you're in prison!"
		return
//Challange system 1.1
	var/challengePeople = list()
	for(var/mob/T in world)
		if(T.client&&T!=src)
			if(usr.challengeRating-5 <= T.challengeRating)
				challengePeople += T
	var/mob/M = input(usr,"Who would you like to Rank Challenge","Challenge") in challengePeople + list("Cancel")
	if(M == "Cancel")
		return
	if(!M.client)
		usr << "You cannot challenge a NPC!"
		return
	if(M == usr)
		usr<<"You cannot challenge yourself."
		return
	if(global.challengeOpenWorld == 1)
		usr<<"There is already a challenge going on, please wait for it to finish."
		return
	if(M.acceptingChallenges == 0)
		usr<<"They have their challenges turned off."
		return
	else
		global.challengeOpenWorld = 1
		usr.challenged = 0
		usr.challenge = M
		M.challenged = 1
		world << "<b><font size=3 color=green>[M] has been RANKED challenged by [usr]! [M] has 45 seconds to respond!</font></b>"
		sleep(20)
		var/tmp/i
		for(i= 0, i<=9, i++)
			sleep(50)
			if(global.challengeDeclined == 1)
				M.challenged = 0
				usr.challenge = null
				global.contestantOne = ""
				global.contestantTwo = ""
				global.challengeOpenWorld = 0
				global.challengeDeclined = 0
				return
			if(global.challengeAccepted == 1)
				i = 9
		if (global.challengeAccepted == 0)
			world<< "<font size=3 color=green>[M] has not accepted [usr]'s challenge.</font>"
			M.challenged = 0
			usr.challenge = null
			global.contestantOne = ""
			global.contestantTwo = ""
			global.challengeOpenWorld = 0
		else
			while(global.challengeOpenWorld == 1)
				sleep(20)
				if(M.Dead)
					usr<<sound(null,0,0,75,75)
					M<<sound(null,0,0,75,75)
					M<<sound('SFX/Boo.wav',0,0,8,60)
					usr<<sound('SFX/Winner.aif',0,0,8,60)
					world<<"<font size=3 color=green>[usr] has defeated [M]</font>"
					if(usr.challengeRating<=(M.challengeRating-5))
						usr.challengeRating++
					if((M.challengeRating>=usr.challengeRating)&&(M.challengeRating>0))
						M.challengeRating--
					spawn()
						usr.GotoVillageHospital()
					global.challengeAccepted = 0
					if(usr==global.contestantOne||usr==global.contestantTwo)
						global.contestantOne = ""
						global.contestantTwo = ""
					else
						global.contestantThree = ""
						global.contestantFour = ""
					global.challengeOpenWorld=0
					usr.challenge=null
					M.challenged=0
					usr.challengeWins++
					M.challengeLosses++
					/*
					if(usr.FirstArenaWin==0&&usr.challengeWins==0)
						usr<<"Congratulations on your first arena win! You have been given 15 Ninja Cash!"
						usr.FirstArenaWin=1
						usr.NinjaCash+=15
						usr.SaveK()
					if(usr.TwentyFifthArenaWinMark==0&&usr.challengeWins==25)
						usr<<"You're getting better in combat! You have been given 10 Ninja Cash and 5 Elemental Points!"
						usr.TwentyFifthArenaWinMark=1
						usr.NinjaCash+=10
						usr.ElementalPoints+=5
						usr.SaveK()
					if(usr.FiftythArenaWinMark==0&&usr.challengeWins==50)
						usr<<"You're becoming a really strong Fighter! You have been given 75 Ninja Cash, 1 Starter Point, and 5 Elemental Points!"
						usr.FiftythArenaWinMark=1
						usr.NinjaCash+=75
						usr.StartingPoints+=1
						usr.ElementalPoints+=5
						usr.SaveK()
					if(usr.HundrethArenaWinMark==0&&usr.challengeWins==100)
						usr<<"You've become a legend.....You have been given 90 Ninja Cash, 1 Starter Point, and 5 Elemental Points..."
						usr.HundrethArenaWinMark=1
						usr.NinjaCash+=90
						usr.StartingPoints+=1
						usr.ElementalPoints+=5
						usr.SaveK()
					if(usr.TwoHundredFiftythArenaWinMark==0&&usr.challengeWins==250)
						usr<<"You're a God...."
						usr.TwoHundredFiftythArenaWinMark=1
						usr.SaveK()
						*/
					if(usr.CurrentMission=="Represent!")
					//	if(usr.blevel=="D"&&M.blevel=="E") return
					//	if(usr.blevel=="C"||usr.blevel=="B"||usr.blevel=="A"||usr.blevel=="S")
					//		if(M.blevel=="D"||M.blevel=="E") return
						usr.NumberOfNinjaDefeated++
						if(usr.NumberOfNinjaDefeated==usr.NumberOfNinjaNeededToDefeat)
							usr.MissionComplete()
					return
				else if(usr.Dead)
					usr<<sound(null,0,0,75,75)
					M<<sound(null,0,0,75,75)
					usr<<sound('SFX/Boo.wav',0,0,8,60)
					M<<sound('SFX/Winner.aif',0,0,8,60)
					world<<"<font size=3 color=green>[M] has defeated [usr]</font>"
					if(M.challengeRating<=(usr.challengeRating-5))
						M.challengeRating++
					if((usr.challengeRating>=M.challengeRating)&&(usr.challengeRating>0))
						usr.challengeRating--
					spawn()
						M.GotoVillageHospital()
					global.challengeAccepted = 0
					if(M==global.contestantOne||M==global.contestantTwo)
						global.contestantOne = ""
						global.contestantTwo = ""
					else
						global.contestantThree = ""
						global.contestantFour = ""
					global.challengeOpenWorld=0
					usr.challenge=null
					M.challenged=0
					M.challengeWins++
					usr.challengeLosses++
					if(M.CurrentMission=="Represent!")
				//		if(M.blevel=="D"&&usr.blevel=="E") return
				//		if(M.blevel=="C"||M.blevel=="B"||M.blevel=="A"||M.blevel=="S")
				//			if(usr.blevel=="D"||usr.blevel=="E") return
						M.NumberOfNinjaDefeated++
						if(M.NumberOfNinjaDefeated==M.NumberOfNinjaNeededToDefeat)
							M.MissionComplete()
					return






mob/GainedAfterLogIn/verb/Challenge()
	set category = "Challenge"
	set name = "Challenge"
	if(usr.z==1)
		if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
			usr<<"Not while you're in prison!"
			return
	if(usr.z==35)
		usr<<"Not while you're in prison!"
		return


//Argon I was trying to clean up, the challenge system some and make it so that when you challenge people.
//It wouldnt give you the list of npcs, i didnt want to spend so much time on it, but give it a look over
//if you got any extra time
//Challange system 1.1
	var/challengePeople = list()
	for(var/mob/T in world)
		if(T.client&&T!=src)
			challengePeople += T
	var/mob/M = input(usr,"Who would you like to challenge","Challenge") in challengePeople + list("Cancel")
	if(M == "Cancel")
		return
	if(!M.client)
		usr << "You cannot challenge a NPC!"
		return
	if(M == usr)
		usr<<"You cannot challenge yourself."
		return
	if(global.challengeOpenWorld == 1)// && global.contestantThree!="" && global.contestantFour!="")
		usr<<"There is already a challenge going on, please wait for it to finish."
		return
	if(M.acceptingChallenges == 0)
		usr<<"They have their challenges turned off."
		return
	else
		//Challenge(usr,M,"Normal") not working atm...
		global.challengeOpenWorld = 1
		usr.challenged = 0
		usr.challenge = M
		M.challenged = 1
		world << "<font size=3 color=green>[M] has been challenged by [usr]! [M] has 45 seconds to respond!</font>"
		sleep(20)
		var/tmp/i
		for(i= 0, i<=9, i++)
			sleep(50)
			if(global.challengeDeclined == 1)
				M.challenged = 0
				usr.challenge = null
				global.contestantOne = ""
				global.contestantTwo = ""
				global.challengeOpenWorld = 0
				global.challengeDeclined = 0
				global.ArenaChosen=""//Safety Reasons
				return
			if(global.challengeAccepted == 1)
				i = 9
		if (global.challengeAccepted == 0)
			world<< "<font size=3 color=green>[M] has not accepted [usr]'s challenge.</font>"
			M.challenged = 0
			usr.challenge = null
			if(global.contestantOne=="")
				global.contestantOne = ""
			if(global.contestantTwo=="")
				global.contestantTwo = ""
			global.challengeOpenWorld = 0
			global.ArenaChosen=""//Safety Reasons
		else
			while(global.challengeOpenWorld == 1)
				sleep(20)
				if(M.Dead)
					world<<"<font size=3 color=green>[usr] has defeated [M]</font>"
					if(usr.challengeRating<=(M.challengeRating-5))
						usr.challengeRating++
					if((M.challengeRating>=usr.challengeRating)&&(M.challengeRating>=0))
						M.challengeRating--
					spawn()
						usr.GotoVillageHospital()
					global.challengeAccepted = 0
					if(usr==global.contestantOne||usr==global.contestantTwo)
						global.contestantOne = ""
						global.contestantTwo = ""
					else
						global.contestantThree = ""
						global.contestantFour = ""
					global.challengeOpenWorld=0
					global.ArenaChosen=""//Safety Reasons
					usr.challenge=null
					M.challenged=0
					usr.challengeWins++
					M.challengeLosses++
					if(usr.CurrentMission=="Represent!")
				//		if(usr.blevel=="D"&&M.blevel=="E") return
				//		if(usr.blevel=="C"||usr.blevel=="B"||usr.blevel=="A"||usr.blevel=="S")
				//			if(M.blevel=="D"||M.blevel=="E") return
						usr.NumberOfNinjaDefeated++
						if(usr.NumberOfNinjaDefeated==usr.NumberOfNinjaNeededToDefeat)
							usr.MissionComplete()
					return
				else if(usr.Dead)
					world<<"<font size=3 color=green>[M] has defeated [usr]</font>"
					if(M.challengeRating<=(usr.challengeRating-5))
						M.challengeRating++
					if((usr.challengeRating>=M.challengeRating)&&(usr.challengeRating>=0))
						usr.challengeRating--
					spawn() M.GotoVillageHospital()
					global.challengeAccepted = 0
					if(usr==global.contestantOne||usr==global.contestantTwo)
						global.contestantOne = ""
						global.contestantTwo = ""
					global.ArenaChosen=""//Safety Reasons
					global.challengeOpenWorld=0
					usr.challenge=null
					M.challenged=0
					M.challengeWins++
					usr.challengeLosses++
					if(M.CurrentMission=="Represent!")
				//		if(M.blevel=="D"&&usr.blevel=="E") return
				//		if(M.blevel=="C"||M.blevel=="B"||M.blevel=="A"||M.blevel=="S")
				//			if(usr.blevel=="D"||usr.blevel=="E") return
						M.NumberOfNinjaDefeated++
						if(M.NumberOfNinjaDefeated==M.NumberOfNinjaNeededToDefeat)
							M.MissionComplete()
					return



mob/GainedAfterLogIn/verb/Accept()
	set category = "Challenge"
	set name = "Challenge Accept"
	if(!usr.challenged)
		usr<<"You were not challenged."
		return
	if(usr.z==1)
		if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
			usr<<"Not while you're in prison!"
			return
	if(usr.z==35)
		usr<<"Not while you're in prison!"
		return
	for(var/mob/M in world)
	//	if(usr.client.computer_id==M.client.computer_id)
	//		world<< "<font size=3 color=red>[usr] tried challenging one of their alts!</font>"
	//		del(usr)
	//		del(M)
	//		return
		if(M.challenge==usr)
			var/WhichSong=pick(1,2,3)
			world << "<font size=3 color=green>[usr] has accepted [M]'s challenge!</font>"
			//restores user
			global.CurrentlyChallenging=0
			if(WhichSong==1)
				usr<<sound('RaisingFightingSpirit.mid',0,0,75,75)
				M<<sound('RaisingFightingSpirit.mid',0,0,75,75)
			else if(WhichSong==2)
				usr<<sound('StrongAndStrike.mid',0,0,75,75)
				M<<sound('StrongAndStrike.mid',0,0,75,75)
			else
				usr<<sound('FightingOfSpirit.mid',0,0,75,75)
				M<<sound('FightingOfSpirit.mid',0,0,75,75)
			usr.deathcount=0
			usr.resting=0
			M.resting=0
			usr.health=usr.maxhealth
			usr.chakra=usr.Mchakra
			usr.stamina=usr.maxstamina
			usr.ChakraPool=usr.MaxChakraPool
			//restores M
			M.deathcount=0
			M.health=M.maxhealth
			M.chakra=M.Mchakra
			M.stamina=M.maxstamina
			M.ChakraPool=M.MaxChakraPool
			if(global.contestantOne==""&&global.contestantTwo=="")
				global.contestantTwo = M
				global.contestantOne = usr
			else
				global.contestantFour = M
				global.contestantThree = usr
			global.challengeAccepted = 1
			RepeatArenaChoice
			switch(input(usr,"Which arena do you want to fight in?") in list("Desert","Forest","Mountain Side","Island","City","Temple to Argon","Bridge"))
				if("Forest")
					if(global.TeamArenaChosen!="Forest"&&global.ArenaChosenSecond!="Forest")
						M.loc = locate(121,106,22);M.dir=NORTH
						usr.loc = locate(121,125,22);usr.dir=SOUTH
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="Forest"
						else
							global.ArenaChosenSecond="Forest"
					else
						if(global.TeamArenaChosen=="Forest")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="Forest")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."
						goto RepeatArenaChoice
				if("Desert")
					if(global.TeamArenaChosen!="Desert"&&global.ArenaChosenSecond!="Desert")
						M.loc = locate(149,112,22)
						usr.loc = locate(157,112,22)
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="Desert"
						else
							global.ArenaChosenSecond="Desert"
					else
						if(global.TeamArenaChosen=="Desert")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="Desert")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."
						goto RepeatArenaChoice
				if("Temple to Argon")
					if(global.TeamArenaChosen!="Temple to Argon"&&global.ArenaChosenSecond!="Temple to Argon")
						M.loc = locate(177,120,22)
						usr.loc = locate(184,120,22)
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="Temple to Argon"
						else
							global.ArenaChosenSecond="Temple to Argon"
					else
						if(global.TeamArenaChosen=="Temple to Argon")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="Temple to Argon")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."
						goto RepeatArenaChoice
				if("Mountain Side")
					if(global.TeamArenaChosen!="Mountain Side"&&global.ArenaChosenSecond!="Mountain Side")
						M.loc=locate(101,42,30)
						usr.loc=locate(72,61,30)
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="Mountain Side"
						else
							global.ArenaChosenSecond="Mountain Side"
					else
						if(global.TeamArenaChosen=="Mountain Side")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="Mountain Side")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."

						goto RepeatArenaChoice
				if("Island")
					if(global.TeamArenaChosen!="Island"&&global.ArenaChosenSecond!="Island")
						M.loc=locate(149,55,33)
						usr.loc=locate(174,55,33)
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="Island"
						else
							global.ArenaChosenSecond="Island"
					else
						if(global.TeamArenaChosen=="Island")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="Island")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."
						goto RepeatArenaChoice
				if("City")
					if(global.TeamArenaChosen!="City"&&global.ArenaChosenSecond!="City")
						M.loc=locate(113,92,33);M.dir=NORTH
						usr.loc=locate(113,123,33);usr.dir=SOUTH
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="City"
						else
							global.ArenaChosenSecond="City"
					else
						if(global.TeamArenaChosen=="City")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="City")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."
						goto RepeatArenaChoice
				if("Bridge")
					if(global.TeamArenaChosen!="Bridge"&&global.ArenaChosenSecond!="Bridge")
						M.loc=locate(77,103,41);M.dir=NORTH
						usr.loc=locate(108,103,41);usr.dir=SOUTH
						if(global.contestantOne==usr||global.contestantTwo==usr)
							global.ArenaChosen="Bridge"
						else
							global.ArenaChosenSecond="Bridge"
					else
						if(global.TeamArenaChosen=="Bridge")
							usr<<"Team Challenge Contestants are using this arena. Pick another one."
						else if(global.ArenaChosenSecond=="Bridge")
							usr<<"The other two combatants in the arena are using this arena. Pick another one."
						goto RepeatArenaChoice

			/*	if("Sand Village")
					M.loc = locate(44,55,27);M.dir=EAST
					usr.loc=locate(147,55,27);usr.dir=WEST
				if("Black and White")
					M.loc=locate(81,93,22);// Black
					usr.loc=locate(95,93,22);//White
					var/obj/Clothes/KoronaShadowBlack/A=new();A.loc=M
					var/obj/Clothes/KoronaShadowWhite/B=new();B.loc=usr
					*/

mob/GainedAfterLogIn/verb/Decline()
	set category = "Challenge"
	set name = "Challenge Decline"
	for(var/mob/M in world)
		if(M.challenge == usr)
			world << "<font size=3 color=green>[usr] has <font color=red size=3>declined</font><font size=3 color=green> [M]'s challenge!"
			usr.challenged = 0
			global.CurrentlyChallenging=0
			M.challenge = 0
			global.challengeDeclined = 1
			return

proc/Challenge(mob/Challenger,mob/Challenged,Type)
	if(Type=="Normal")
		global.challengeOpenWorld = 1
		Challenger.challenged = 0
		Challenger.challenge = Challenged
		Challenged.challenged = 1
		global.CurrentlyChallenging=1
		world << "<font size=3 color=green>[Challenged] has been challenged by [Challenger]! [Challenged] has 45 seconds to respond!</font>"
		sleep(20)
		var/tmp/i
		for(i= 0, i<=9, i++)
			sleep(50)
			if(global.challengeDeclined == 1)
				Challenged.challenged = 0
				Challenger.challenge = null
				global.contestantOne = ""
				global.contestantTwo = ""
				global.challengeOpenWorld = 0
				global.challengeDeclined = 0
				return
			if(global.challengeAccepted == 1)
				i = 9
		if(global.challengeAccepted == 0)
			world<< "<font size=3 color=green>[Challenged] has not accepted [Challenger]'s challenge.</font>"
			global.CurrentlyChallenging=0
			Challenged.challenged = 0
			Challenger.challenge = null
			global.contestantOne = ""
			global.contestantTwo = ""
			global.challengeOpenWorld = 0
		else
			while(global.challengeOpenWorld == 1)
				sleep(20)
				if(!Challenged||!Challenger)
					world<<"<font size=3 color=green>One of the contestants has logged out!</font>"
					global.challengeAccepted = 0
					global.CurrentlyChallenging=0
					global.contestantOne = ""
					global.contestantTwo = ""
					global.challengeOpenWorld=0
					if(Challenged)
						world<<"<font size=3 color=green>[Challenged] remains logged in!</font>"
						Challenged.challenged=0
						spawn() Challenged.GotoVillageHospital()
					if(Challenger)
						world<<"<font size=3 color=green>[Challenger] remains logged in!</font>"
						Challenger.challenge=null
						spawn() Challenger.GotoVillageHospital()
				if(Challenged.Dead)
					world<<"<font size=3 color=green>[Challenger] has defeated [Challenged]</font>"
					if(Challenger.challengeRating<=(Challenged.challengeRating-5))
						Challenger.challengeRating++
					if((Challenged.challengeRating>=Challenger.challengeRating)&&(Challenged.challengeRating>=0))
						Challenged.challengeRating--
					spawn() Challenger.GotoVillageHospital()
					global.CurrentlyChallenging=0
					global.challengeAccepted = 0
					global.contestantOne = ""
					global.contestantTwo = ""
					global.challengeOpenWorld=0
					Challenger.challenge=null
					Challenged.challenged=0
					Challenger.challengeWins++
					Challenged.challengeLosses++
					if(Challenger.CurrentMission=="Represent!")
				//		if(Challenger.blevel=="D"&&Challenged.blevel=="E") return
				//		if(Challenger.blevel=="C"||Challenger.blevel=="B"||Challenger.blevel=="A"||Challenger.blevel=="S")
				//			if(Challenged.blevel=="D"||Challenged.blevel=="E") return
						Challenger.NumberOfNinjaDefeated++
						if(Challenger.NumberOfNinjaDefeated==Challenger.NumberOfNinjaNeededToDefeat)
							Challenger.MissionComplete()
					return
				else if(Challenger.Dead)
					world<<"<font size=3 color=green>[Challenged] has defeated [Challenger]</font>"
					if(Challenged.challengeRating<=(Challenger.challengeRating-5))
						Challenged.challengeRating++
					if((Challenger.challengeRating>=Challenged.challengeRating)&&(Challenger.challengeRating>=0))
						Challenger.challengeRating--
					spawn() Challenged.GotoVillageHospital()
					global.CurrentlyChallenging=0
					global.challengeAccepted = 0
					global.contestantOne = ""
					global.contestantTwo = ""
					global.challengeOpenWorld=0
					Challenger.challenge=null
					Challenged.challenged=0
					Challenged.challengeWins++
					Challenger.challengeLosses++
					if(Challenged.CurrentMission=="Represent!")
				//		if(Challenged.blevel=="D"&&Challenger.blevel=="E") return
				//		if(Challenged.blevel=="C"||Challenged.blevel=="B"||Challenged.blevel=="A"||Challenged.blevel=="S")
				//			if(Challenger.blevel=="D"||Challenger.blevel=="E") return
						Challenged.NumberOfNinjaDefeated++
						if(Challenged.NumberOfNinjaDefeated==Challenged.NumberOfNinjaNeededToDefeat)
							Challenged.MissionComplete()
					return
	if(Type=="Ranked")
		global.challengeOpenWorld = 1
		Challenger.challenged = 0
		Challenger.challenge = Challenged
		Challenged.challenged = 1
		world << "<b><font size=3 color=green>[Challenged] has been RANKED challenged by [Challenger]! [Challenged] has 45 seconds to respond!</font></b>"
		sleep(20)
		var/tmp/i
		for(i= 0, i<=9, i++)
			sleep(50)
			if(global.challengeDeclined == 1)
				Challenged.challenged = 0
				Challenger.challenge = null
				global.contestantOne = ""
				global.contestantTwo = ""
				global.challengeOpenWorld = 0
				global.challengeDeclined = 0
				return
			if(global.challengeAccepted == 1)
				i = 9
		if (global.challengeAccepted == 0)
			world<< "<font size=3 color=green>[Challenged] has not accepted [Challenger]'s challenge.</font>"
			Challenged.challenged = 0
			Challenger.challenge = null
			global.contestantOne = ""
			global.contestantTwo = ""
			global.challengeOpenWorld = 0
		else
			while(global.challengeOpenWorld == 1)
				sleep(20)
				if(!Challenged||!Challenger)
					world<<"<font size=3 color=green>One of the contestants has logged out!</font>"
					global.challengeAccepted = 0
					global.contestantOne = ""
					global.contestantTwo = ""
					global.challengeOpenWorld=0
					if(Challenged)
						world<<"<font size=3 color=green>[Challenged] remains logged in!</font>"
						Challenged.challenged=0
						spawn() Challenged.GotoVillageHospital()
					if(Challenger)
						world<<"<font size=3 color=green>[Challenger] remains logged in!</font>"
						Challenger.challenge=null
						spawn() Challenger.GotoVillageHospital()
				if(Challenged.Dead)
					world<<"<font size=3 color=green>[Challenger] has defeated [Challenged]</font>"
					if(Challenger.challengeRating<=(Challenged.challengeRating-5))
						Challenger.challengeRating++
					if((Challenged.challengeRating>=Challenger.challengeRating)&&(Challenged.challengeRating>0))
						Challenged.challengeRating--
					spawn() Challenger.GotoVillageHospital()
					global.challengeAccepted = 0
					global.contestantOne = ""
					global.contestantTwo = ""
					global.challengeOpenWorld=0
					Challenger.challenge=null
					Challenged.challenged=0
					Challenger.challengeWins++
					Challenged.challengeLosses++
					if(Challenger.CurrentMission=="Represent!")
				//		if(Challenger.blevel=="D"&&Challenged.blevel=="E") return
				//		if(Challenger.blevel=="C"||Challenger.blevel=="B"||Challenger.blevel=="A"||Challenger.blevel=="S")
				//			if(Challenged.blevel=="D"||Challenged.blevel=="E") return
						Challenger.NumberOfNinjaDefeated++
						if(Challenger.NumberOfNinjaDefeated==Challenger.NumberOfNinjaNeededToDefeat)
							Challenger.MissionComplete()
					return
				else if(Challenger.Dead)
					world<<"<font size=3 color=green>[Challenged] has defeated [Challenger]</font>"
					if(Challenged.challengeRating<=(Challenger.challengeRating-5))
						Challenged.challengeRating++
					if((Challenger.challengeRating>=Challenged.challengeRating)&&(Challenger.challengeRating>0))
						Challenger.challengeRating--
					spawn() Challenged.GotoVillageHospital()
					global.challengeAccepted = 0
					global.contestantOne = ""
					global.contestantTwo = ""
					global.challengeOpenWorld=0
					Challenger.challenge=null
					Challenged.challenged=0
					Challenged.challengeWins++
					Challenger.challengeLosses++
					if(Challenged.CurrentMission=="Represent!")
			//			if(Challenged.blevel=="D"&&Challenger.blevel=="E") return
			//			if(Challenged.blevel=="C"||Challenged.blevel=="B"||Challenged.blevel=="A"||Challenged.blevel=="S")
			//				if(Challenger.blevel=="D"||Challenger.blevel=="E") return
						Challenged.NumberOfNinjaDefeated++
						if(Challenged.NumberOfNinjaDefeated==Challenged.NumberOfNinjaNeededToDefeat)
							Challenged.MissionComplete()
					return