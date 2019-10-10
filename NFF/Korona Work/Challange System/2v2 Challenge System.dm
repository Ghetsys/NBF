/*This is a 2v2 Challenge, so the idea is that it works the same as the old challenge system.
But it is going to have 3 sets of different maps which are slightly bigger.

*/





var/global/teamChallengeAccepted = 0
var/global/teamChallengeOpenWorld
var/global/teamContestantOne
var/global/teamContestantTwo
var/global/teamContestantThree
var/global/teamContestantFour

mob/var/tmp/teamChallenge
mob/var/teamChallenged
mob/var/teamAcceptingChallenges
mob/var/teamChallengeWins = 0
mob/var/teamChallengeLosses = 0
var/global/teamALife = 0
var/global/teamBLife = 0
var/global/teamCLife = 0
var/global/teamDLife = 0
var/global/TeamArenaChosen=""


//Single Challenge Arena Variable
/*
var/global.challengeDeclined = 0
var/global.challengeAccepted = 0
var/global.challengeOpenWorld = 0
var/global.contestantOne
var/global.contestantTwo
var/global.ArenaChosen=""
mob/var/tmp/challenge
mob/var/tmp/challenged
mob/var/acceptingChallenges
mob/var/challengeWins = 0
mob/var/challengeLosses = 0
mob/var/challengeRating = 0
*/


//Edited for Teams
//Remove the other one from challenge 1v1
mob/GainedAfterLogIn/verb/Team_View_Challenger()
	set category = "Team Challenge"
	if(usr.client.eye!=usr)
		usr.client.eye=usr
		usr.client.perspective = MOB_PERSPECTIVE
		return
	switch(input(usr, "Which fighter to do you wish to watch?") in list ("Combatant One", "Combatant Two", "Combatant Three","Combatant Four", "Cancel"))
		if ("Combatant One")
			usr.client.eye=global.teamContestantOne
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Combatant Two")
			usr.client.eye=global.teamContestantTwo
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Combatant Three")
			usr.client.eye=global.teamContestantThree
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Combatant Four")
			usr.client.eye=global.teamContestantFour
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			return
		if("Cancel")
			return


//Edited for Teams
mob/GainedAfterLogIn/verb/acceptingTeamChallenges()
	set category = "Team Challenge"
	set name = "Toggle Challenges"
	switch(input(usr, "Do you want people to be able to challenge you?") in list("Open Challenges","Close Challenges","Cancel"))
		if("Open Challenges")
			usr.acceptingChallenges = 1
			usr.teamAcceptingChallenges = 1
			usr<<"You are now accepting Team challenges."
			return
		if("Close Challenges")
			usr.acceptingChallenges = 0
			usr.teamAcceptingChallenges = 0
			usr<<"You are now not accepting Team challenges."
			return
		if("Cancel")
			return


mob/var/tmp/partner = ""
mob/var/tmp/partnerFound = 0
//Choose your partner
mob/GainedAfterLogIn/verb/Pick_Your_Partner(mob/M in world)
	set category = "Team Challenge"
	set name = "Pick Your Partner"
	if(!M.client)
		usr << "You cannot choose a NPC!"
		return
	if(M == usr)
		usr<<"You cannot choose yourself."
		return
	else
		switch(input(M,"Do you want to be partners with [usr]") in list("Yes", "No"))
			if("No")
				usr<<"[M] does not want to be partners with you."
				return
			if("Yes")
				if(M.teamAcceptingChallenges == 0)
					usr<<"[M] is currently not accepting challenges"
				else
					world<<"[usr] and [M] are now partners and open to accepting challenges."
					usr.partnerFound = 1
					M.partnerFound = 1
					usr.partner = M
					M.partner = usr

mob/var/tmp/SearchingTeamPartner=0
mob/var/SearchingTeamPartnerActive=0
mob/GainedAfterLogIn/verb/SearchTeamPartner()
	set category = "Team Challenge"
	set name = "Partner Search"
	if(usr.SearchingTeamPartnerActive)
		usr.SearchingTeamPartnerActive=0
		usr<<"You are no longer looking for a Team Partner."
	else
		usr.SearchingTeamPartnerActive=1
		usr<<"You will now see messages by those who are also looking for Team Partners."
mob/GainedAfterLogIn/verb/SearchTeamPartnerShout()
	set category = "Team Challenge"
	set name = "Partner Searcher"
	if(usr.challenged)
		usr<<"You must already have a partner because you're being challenged..."
		return
	if(usr.teamAcceptingChallenges==0)
		usr<<"Why are you looking for a partner if you're not even accepting challenges..?"
		return
	if(usr.partnerFound)
		usr<<"Why are you looking for a partner when you already have one..?"
		return
	if(usr.SearchingTeamPartner==0)
		for(var/mob/M in world)
			if(M.client&&M.SearchingTeamPartnerActive)
				M<<"[usr] is looking for a partner to Team Challenge With"
	else
		usr<<"You've already looked for a partner recently. Try looking for a partner again later."
	usr.SearchingTeamPartner=1
	spawn(6000)
		if(usr&&usr.SearchingTeamPartner==1)
			usr.SearchingTeamPartner=0


mob/GainedAfterLogIn/verb/teamChallenge(mob/M in world)
	set category = "Team Challenge"
	set name = "Team Challenge"
	if(!M.client)
		usr << "You cannot challenge a NPC!"
		return
	if(M == usr)
		usr<<"You cannot challenge yourself."
		return
	if(global.teamChallengeOpenWorld == 1)
		usr<<"There is already another Team Challenge going on, please wait for it to finish."
		return
	if(M.teamAcceptingChallenges == 0)
		usr<<"They have their challenges turned off."
		return
	if(M.partnerFound == 0||(M.partner==null||M.partner==""))
		usr<<"They do not have a partner."
		M<<"[usr] tried to challenge you to a Team Challenge but you don't have a partner!"
		return
	if(usr.partnerFound == 0||(usr.partner==null||usr.partner==""))
		usr.partnerFound=0
		usr.partner=""
		usr<<"You don't have a partner, so you're not able to Team Challenge someone."
		return
	else
		global.teamChallengeOpenWorld = 1
		var/tmp/mob/A = usr
		var/tmp/mob/B = usr.partner
		var/tmp/mob/C = M
		var/tmp/mob/D = M.partner
		usr.challenged = 0
		usr.challenge = M
		M.challenged = 1
		world << "<font size=3 color=green>[C] and [D] has been Team Challenged by [A] and [B]! [C] has 45 seconds to respond!</font>"
		sleep(450)
		if(global.teamChallengeAccepted == 0)
			world<< "<font size=3 color=green>[C] has not accepted [A] and [B]'s challenge.</font>"
			M.challenged = 0
			usr.challenge = null
			global.teamContestantOne = ""
			global.teamContestantTwo = ""
			global.teamContestantThree = ""
			global.teamContestantFour = ""
			global.teamChallengeOpenWorld = 0
			global.TeamArenaChosen=""
		else
			while(global.teamChallengeOpenWorld == 1)//was while(global.challengeOpenWorld == 1) not sure why LOL
				sleep(30)
				if((teamCLife==1&&teamDLife==1)&&(teamALife==0||teamBLife==0))
					world<<"<font size=3 color=green>[A] and [B] has won the Team Challenge!</font>"
					teamALife=0;teamBLife=0;teamCLife=0;teamDLife=0;global.TeamArenaChosen=""
					if(A&&A==global.teamContestantOne)
						spawn() A.GotoVillageHospital()
						global.teamContestantOne=""
					if(B&&B==global.teamContestantTwo)
						spawn() B.GotoVillageHospital()
						global.teamContestantTwo=""
					global.teamChallengeOpenWorld=0
				if((teamALife==1&&teamBLife==1)&&(teamCLife==0||teamDLife==0))
					world<<"<font size=3 color=green>[C] and [D] has won the Team Challenge!</font>"
					teamALife=0;teamBLife=0;teamCLife=0;teamDLife=0;global.TeamArenaChosen=""
					if(C&&C==global.teamContestantThree)
						spawn() C.GotoVillageHospital()
						global.teamContestantThree=""
					if(D&&D==global.teamContestantTwo)
						spawn() B.GotoVillageHospital()
						global.teamContestantFour=""
					global.teamChallengeOpenWorld=0
				if(C.Dead && C == global.teamContestantThree)
					world<<"<font size=3 color=green>[A] and [B] has defeated [C]</font>"
					global.teamContestantThree = ""
					C.teamChallengeLosses++
					teamCLife=1
				if(D.Dead && D == global.teamContestantFour)
					world<<"<font size=3 color=green>[A] and [B] has defeated [D]</font>"
					global.teamContestantFour = ""
					D.teamChallengeLosses++
					teamDLife = 1
				if(A.Dead && A == global.teamContestantOne)
					world<<"<font size=3 color=green>[C] and [D] has defeated [A]</font>"
					global.teamContestantOne = ""
					A.teamChallengeLosses++
					teamALife = 1
				if(B.Dead && B == global.teamContestantTwo)
					world<<"<font size=3 color=green>[C] and [D] has defeated [B]</font>"
					global.teamContestantTwo = ""
					B.teamChallengeLosses++
					teamBLife = 1

mob/GainedAfterLogIn/verb/teamAccept()
	set category = "Team Challenge"
	set name = "Team Challenge Accept"
	if(!usr.challenged)
		usr<<"You were not challenged."
		return
	for(var/mob/M in world)
		if(M.challenge==usr)
			var/tmp/mob/C = usr
			var/tmp/mob/D = usr.partner
			var/tmp/mob/A = M
			var/tmp/mob/B = M.partner
			world << "<font size=3 color=green>[C] and [D] has accepted [A] and [B]'s challenge!</font>"
			//restores A
			A.deathcount=0
			A.health=A.maxhealth
			A.chakra=A.Mchakra;A.ChakraPool=A.MaxChakraPool
			A.stamina=A.maxstamina
			//restors B
			B.deathcount=0
			B.health=B.maxhealth
			B.chakra=B.Mchakra;B.ChakraPool=B.MaxChakraPool
			B.stamina=B.maxstamina
			//restores C
			C.deathcount=0
			C.health=C.maxhealth
			C.chakra=C.Mchakra;C.ChakraPool=C.MaxChakraPool
			C.stamina=C.maxstamina
			//restores D
			D.deathcount=0
			D.health=D.maxhealth
			D.chakra=D.Mchakra;D.ChakraPool=D.MaxChakraPool
			D.stamina=D.maxstamina
			global.teamContestantOne = A
			global.teamContestantTwo = B
			global.teamContestantThree = C
			global.teamContestantFour = D
			global.teamChallengeAccepted = 1
			ChooseTeamArena
			switch(input(usr,"Which arena do you want to put them in?") in list("Desert","Forest","Temple to Argon"))
				if("Forest")
					if(global.ArenaChosen!="Forest")
						A.loc = locate(118,116,22)
						B.loc = locate(120,116,22)
						C.loc = locate(127,116,22)
						D.loc = locate(129,116,22)
						global.TeamArenaChosen="Forest"
					else
						usr<<"Single Challenge Contestants are using this arena. Choose another one."
						goto ChooseTeamArena
				if("Desert")
					if(global.ArenaChosen!="Desert")
						A.loc = locate(149,112,22)
						B.loc = locate(149,114,22)
						C.loc = locate(157,112,22)
						D.loc = locate(157,114,22)
						global.TeamArenaChosen="Desert"
					else
						usr<<"Single Challenge Contestants are using this arena. Choose another one."
						goto ChooseTeamArena
				if("Temple to Argon")
					if(global.ArenaChosen!="Temple to Argon")
						A.loc = locate(177,120,22)
						B.loc = locate(177,122,22)
						C.loc = locate(184,120,22)
						D.loc = locate(184,122,22)
						global.TeamArenaChosen="Temple to Argon"
					else
						usr<<"Single Challenge Contestants are using this arena. Choose another one."
						goto ChooseTeamArena