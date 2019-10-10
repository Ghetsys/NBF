var/global.AutoFreeForAllReward = 0
var/global.AutoFreeForAllCount = 0
var/list/AutoFreeForAll = list()
var/global.AutoFreeForAllRewardBonus = 0



mob/Staff/verb/StartFFA()
	set name = "Start Free For All"
	set category = "Staff"
	if(global.AutoFreeForAllCount >= 1)
		usr<<"There is already a FFA in progress."
		return
	world<<"<b><font size=2 color=blue>[usr] has started a FFA you are able to join!</font></b>"
	global.AutoFreeForAllCount = 1
	world<<"<b><font size=2 color=blue>Press the Join FFA verb located in the challenge tab to join the FFA!</font></b>"
	sleep(600)
	world<<"<b><font size=2 color=blue>The FFA will start in 2 minutes!</font></b>"
	sleep(600)
	world<<"<b><font size=2 color=blue>The FFA will start in another minute!</font></b>"
	sleep(600)
	world<<"<b><font size=3 color=red>The FFA has started!"
	global.AutoFreeForAllCount = 2
	world<<"<b><font size=2 color=blue>There are [length(AutoFreeForAll)] fighters in the FFA.</font></b>"
	global.AutoFreeForAllRewardBonus = 0
	global.AutoFreeForAllReward = 0
	global.AutoFreeForAllReward = length(AutoFreeForAll) * 7500
	world<<"<b><font size=2 color=green>The reward for this tournament is [global.AutoFreeForAllReward] ryo.</font></b>"
	if(length(AutoFreeForAll) > 10)
		world<<"<b><font size=2 color=red>An additional reward of 150000 Ryo will be awarded for this FFA due to the amount of participants!</font></b>"
		global.AutoFreeForAllRewardBonus = 1

	for(var/mob/A in AutoFreeForAll)
		A.loc = locate(rand(120,135),rand(170,171), 21)
		A.deathcount=0
		A.health=A.maxhealth
		A.chakra=A.Mchakra
		A.stamina=A.maxstamina
		A.ChakraPool=A.MaxChakraPool
		contestants+=A
	return




mob/GainedAfterLogIn/verb/JoinFreeForFall()
	set name = "Join Free For All"
	set category = "Challenge"
	if(global.AutoFreeForAllCount == 1)
		if(usr in AutoFreeForAll)
			usr<<"You have already joined the FFA!"
			return
		else
			world<<"<b><font size=1 color=green>[usr] has joined the FFA!</font></b>"
			AutoFreeForAll.Add(usr)
			return
	else
		usr<<"You can't join a tournament now....."
		return



mob/GainedAfterLogIn/verb/WhoIsInFFA()
	set name = "FFA Contestants"
	set category = "Challenge"
	if(global.AutoFreeForAllCount == 2||global.AutoFreeForAllCount == 1)
		for(var/mob/A in AutoFreeForAll)
			usr<<"[A]"
	else
		usr<<"There is no FFA in current progress."


proc/FFAAutoRun()
	if(length(AutoFreeForAll)==1)
		for(var/mob/A in AutoFreeForAll)
			world<<"[A] has won the FFA."
			A.Yen+=global.AutoFreeForAllReward
			if(global.AutoFreeForAllRewardBonus ==1)
				A.Yen+=150000
				world<<"[A] was given the Bonus 150000 prize!"
			global.AutoFreeForAllCount = 0
			contestants-=A
			AutoFreeForAll.Remove(A)
