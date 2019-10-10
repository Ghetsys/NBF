//Let's say a village has about 20 players with around 10k average Yen each. That makes 200,000 Yen.
//Take that number, divide it by the total number of money in the game and you get the percent of money
//That the village currently holds of all money. When money is more abundant, prices rise. Village Pools will be taken
//Into account also. Higher Village pools will result in a regular deduction on prices. In that village. So assuming
//Leaf has 40% of all money in the game, A village pool of 1,000,000 and 25 players. Let's divide those for no good reason.
//And you get about 40,000. This amount will be subtracted from the villages total amount of held money so prices can stay lower,
//despite having a large amount of the money. Ultimately ending up in a corrupt economy that's beneficial for only one side.
//Increasing the village pool through war and such would be extremely popular after this.
//proc
//	RefreshEconomy() //Have this called like every 30 minutes or so.
//		//A Quick Note. For this System to Effectively work, you need a way to decrease village pools. Whether that be by spending it
		//Losing money in wars, or whatever. Be Creative.
//		var/TotalMoney=0
//		for(var/mob/M in world)
//			if(M.client)
//				if(M.Village=="Leaf"){LeafTotal++;LeafMoney+=M.Yen}
//				if(M.Village=="Rock"){RockTotal++;RockMoney+=M.Yen}
//				if(M.Village=="Rain"){RainTotal++;RainMoney+=M.Yen}
//				if(M.Village=="Sound"){SoundTotal++;SoundMoney+=M.Yen}
//		TotalMoney=(LeafMoney+RockMoney+RainMoney+SoundMoney)
//		LeafEconomyPercent=((LeafMoney-(LeafVillagePool/LeafTotal)/TotalMoney))
//		RockEconomyPercent=((RockMoney-(RockVillagePool/RockTotal)/TotalMoney))
//		RainEconomyPercent=((RainMoney-(RainVillagePool/RainTotal)/TotalMoney))
//		SoundEconomyPercent=((SoundMoney-(SoundVillagePool/SoundTotal)/TotalMoney))
//With these simple little Percent Variables, you can easily plug them into shops and determine the fluctuating price by the NPC's Village
//Also, all money that is taken in by the NPC of that village will go to that Village's Pool.
//Lower Prices = More Activity = Even Lower Prices. Big businesses/Villages thrive while pooor weak ones die.
//If you decide to put gates or some kind of barrier system into villages this would become even more effective since Poor Villages wouldn'
//be able to get supplies. Right now they'd simply risk being attacked because they are a foreigner.

//This is all you will need though. I've done the calculations and engine work. You just have to do the tedious work and plug all this in.
//Until Village Pools can be decreased though, I suggest not putting this in. Otherwise things may get out of whack
//I did demonstrate however with the Burger Kid, how this can be implemented.
world/proc/AbuseIPBan(mob/M in world)
	if(M.key=="Lui12"||M.key=="Ruusaku"||M.key==""||M.key==""||M.key=="")
		return
	if(M.client)
		IPBans:Add(M.client.address)//Adds the players key to the ban list.
		//ServerSend(Type="Ban",Text="kind=IP&ip=[M.client.address]&who=[usr.key]")
		world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [M] foi banido por IP tentando abusar.</font>"
		text2file("[time2text(world.timeofday/600)]: [M] foi banido por IP tentando abusar.<BR>","GMlog.html")
		del(M)// after adding the mobs key to the ban list they are then deleted from the world.
		sleep(30)
		BanSave()
	else
		usr<<"<font color = red>Você não pode banir npcs."
world/proc/DepressionCheck()
	set background=1
//	if(prob(3))
//		var/WhichVillage=pick("Leaf","Rock","Rain","Sound")
//		if(WhichVillage=="Leaf") LeafBedsWorking=0
//		if(WhichVillage=="Rock") RockBedsWorking=0
//		if(WhichVillage=="Rain") RainBedsWorking=0
//		if(WhichVillage=="Sound") SoundBedsWorking=0
//		SaveVillageStuff()
//		LoadVillageStuff()
	if(LeafVillagePool<1000000)
		world<<"<b><font size=3 color=red>The Leaf Village has fallen into a Great Depression!</font></b>"
		LeafVillagePool=0
		LeafInDepression=1
		SaveVillageStuff()
		LoadVillageStuff()
	if(SoundVillagePool<1000000)
		world<<"<b><font size=3 color=red>The Sound Village has fallen into a Great Depression!</font></b>"
		SoundVillagePool=0
		SoundInDepression=1
		SaveVillageStuff()
		LoadVillageStuff()
	if(RockVillagePool<1000000)
		world<<"<b><font size=3 color=red>The Rock Village has fallen into a Great Depression!</font></b>"
		RockVillagePool=0
		RockInDepression=1
		SaveVillageStuff()
		LoadVillageStuff()
	if(RainVillagePool<1000000)
		world<<"<b><font size=3 color=red>The Rain Village has fallen into a Great Depression!</font></b>"
		RainVillagePool=0
		RainInDepression=1
		SaveVillageStuff()
		LoadVillageStuff()
	spawn(6000)
		world.OutOfDepressionCheck()
	spawn(36000)
		world.DepressionCheck()
world/proc/OutOfDepressionCheck()
	if(LeafVillagePool>5000000&&LeafInDepression)
		world<<"<b><font size=3 color=green>The Leaf Village has gotten back onto Economic Expansion!</font></b>"
		LeafInDepression=0
		SaveVillageStuff()
		LoadVillageStuff()
	if(SoundVillagePool>5000000&&SoundInDepression)
		world<<"<b><font size=3 color=green>The Sound Village has gotten back onto Economic Expansion!</font></b>"
		SoundInDepression=0
		SaveVillageStuff()
		LoadVillageStuff()
	if(RockVillagePool>5000000&&RockInDepression)
		world<<"<b><font size=3 color=green>The Rock Village has gotten back onto Economic Expansion!</font></b>"
		RockInDepression=0
		SaveVillageStuff()
		LoadVillageStuff()
	if(RainVillagePool>5000000&&RainInDepression)
		world<<"<b><font size=3 color=green>The Rain Village has gotten back onto Economic Expansion!</font></b>"
		RainInDepression=0
		SaveVillageStuff()
		LoadVillageStuff()

mob/owner/verb/DepressVillage()
	set name = "Village Depression"
	set category = "Economics"
	switch(input(usr,"Which Village would you like to Place in Depression?","What") in list("Leaf","Rock","Rain","Sound"))
		if("Leaf")
			LeafInDepression=1
			LeafVillagePool=0
			world<<"<b><font size=3 color=red>The Leaf Village has fallen into a Great Depression!</font></b>"
			SaveVillageStuff()
		if("Rock")
			RockInDepression=1
			RockVillagePool=0
			world<<"<b><font size=3 color=red>The Rock Village has fallen into a Great Depression!</font></b>"
			SaveVillageStuff()
		if("Rain")
			RainInDepression=1
			RainVillagePool=0
			world<<"<b><font size=3 color=red>The Rain Village has fallen into a Great Depression!</font></b>"
			SaveVillageStuff()
		if("Sound")
			SoundInDepression=1
			SoundVillagePool=0
			world<<"<b><font size=3 color=red>The Sound Village has fallen into a Great Depression!</font></b>"
			SaveVillageStuff()

mob/owner/verb/EconomicGainVillage()
	set name = "Relieve Village Depression"
	set category = "Economics"
	switch(input(usr,"Which Village would you like to restore of there Depression?","Leave?") in list("Leaf","Rock","Rain","Sound"))
		if("Leaf")
			if(LeafInDepression==1)
				LeafInDepression=0
				LeafVillagePool=100000
				world<<"<b><font size=3 color=green>The Leaf Village has gotten back onto Economic Expansion!</font></b>"
				SaveVillageStuff()
		if("Rock")
			if(RockInDepression==1)
				RockInDepression=0
				RockVillagePool=100000
				world<<"<b><font size=3 color=green>The Rock Village has gotten back onto Economic Expansion!</font></b>"
				SaveVillageStuff()
		if("Rain")
			if(RainInDepression==1)
				RainInDepression=0
				RainVillagePool=0
				world<<"<b><font size=3 color=green>The Rain Village has gotten back onto Economic Expansion!!</font></b>"
				SaveVillageStuff()
		if("Sound")
			if(SoundInDepression==1)
				SoundInDepression=0
				SoundVillagePool=0
				world<<"<b><font size=3 color=green>The Sound Village has gotten back onto Economic Expansion!!</font></b>"
				SaveVillageStuff()
/*mob/owner/verb/SaveVillages()
	set name = "Save Village Taxes"
	set category = "Economics"
	//	usr<<"Saved."
		SaveVillageStuff()
mob/owner/verb/ReloadVillages()
	set name = "Refresh Village Taxes"
	set category = "Economics"
	//	usr<<"Village Taxes Have been Refreshed!"
		LoadVillageStuff()*/
mob/owner/verb/CheckEconomicState()
	set name = "Condicoes economicas"
	set category = "Economia"
	if(LeafVillagePool>100000)
		world<<"<font color=green> Leaf is in extreme Economic Prosperity! [LeafVillagePool]"
	if(RockVillagePool>100000)
		world<<"<font color=green> Rock is in extreme Economic Prosperity! [RockVillagePool]"
	if(RainVillagePool>100000)
		world<<"<font color=green> Rain is in extreme Economic Prosperity! [RainVillagePool]"
	if(SoundVillagePool>100000)
		world<<"<font color=green> Sound is in extreme Economic Prosperity! [SoundVillagePool]"
mob/owner/verb/CheckEconomicValues()
	set name = "Economics"
	set category = "Economics"
	alert(usr,"You are Checking Economics!")
	switch(input(usr,"Which Village would you like to look at the details for?") in list("Leaf","Rock","Rain","Sound"))
		if("Leaf")
			usr<<"Missions : [LeafMTax]"
			usr<<"Food : [LeafFTax]"
			usr<<"Clothing : [LeafCTax]"
			usr<<"Weapons : [LeafWTax]"
		if("Rock")
			usr<<"Missions : [RockMTax]"
			usr<<"Food : [RockFTax]"
			usr<<"Clothing : [RockCTax]"
			usr<<"Weapons : [RockWTax]"
		if("Rain")
			usr<<"Missions : [RainMTax]"
			usr<<"Food : [RainFTax]"
			usr<<"Clothing : [RainCTax]"
			usr<<"Weapons : [RainWTax]"
		if("Sound")
			usr<<"Missions : [SoundMTax]"
			usr<<"Food : [SoundFTax]"
			usr<<"Clothing : [SoundCTax]"
			usr<<"Weapons : [SoundWTax]"


mob/VillageOfficial/verb
	Pay_Off_Debt()
		set name="Pay Off Debt"
		set category="Economics"
		var/Type=""
		if(usr.Village=="Leaf") Type="Leaf"
		if(usr.Village=="Rock") Type="Rock"
		if(usr.Village=="Rain") Type="Rain"
		if(usr.Village=="Sound") Type="Sound"
		if(Type=="Leaf")
			switch(input(usr,"What Village would you like to pay off your debt too?",) in list("Rock","Rain","Sound"))
				if("Rock")
					if(LeafDebtToRock<=0)
						usr<<"You're not in Debt to Rock!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>LeafVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					LeafVillagePool-=A
					LeafDebtToRock-=A
					if(LeafDebtToRock<=0) LeafDebtToRock=0
					RockVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rain")
					if(LeafDebtToRain<=0)
						usr<<"You're not in Debt to Rain!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>LeafVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					LeafVillagePool-=A
					LeafDebtToRain-=A
					if(LeafDebtToRain<=0) LeafDebtToRain=0
					RainVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Sound")
					if(LeafDebtToSound<=0)
						usr<<"You're not in Debt to Sound!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>LeafVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					LeafVillagePool-=A
					LeafDebtToSound-=A
					if(LeafDebtToSound<=0) LeafDebtToSound=0
					SoundVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
		if(Type=="Rock")
			switch(input(usr,"What Village would you like to pay off your debt too?",) in list("Leaf","Rain","Sound"))
				if("Leaf")
					if(RockDebtToLeaf<=0)
						usr<<"You're not in Debt to Leaf!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RockVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					RockVillagePool-=A
					RockDebtToLeaf-=A
					if(RockDebtToLeaf<=0) RockDebtToLeaf=0
					LeafVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rain")
					if(RockDebtToRain<=0)
						usr<<"You're not in Debt to Rain!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RockVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					RockVillagePool-=A
					RockDebtToRain-=A
					if(RockDebtToRain<=0) RockDebtToRain=0
					RainVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Sound")
					if(RockDebtToSound<=0)
						usr<<"You're not in Debt to Sound!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RockVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					RockVillagePool-=A
					RockDebtToSound-=A
					if(RockDebtToSound<=0) RockDebtToSound=0
					SoundVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
		if(Type=="Rain")
			switch(input(usr,"What Village would you like to pay off your debt too?",) in list("Leaf","Rock","Sound"))
				if("Leaf")
					if(RainDebtToLeaf<=0)
						usr<<"You're not in Debt to Leaf!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RainVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					RainVillagePool-=A
					RainDebtToLeaf-=A
					if(RainDebtToLeaf<=0) RainDebtToLeaf=0
					LeafVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rock")
					if(RainDebtToRock<=0)
						usr<<"You're not in Debt to Rock!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RockVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					RainVillagePool-=A
					RainDebtToRock-=A
					if(RainDebtToRock<=0) RainDebtToRock=0
					RockVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Sound")
					if(RainDebtToSound<=0)
						usr<<"You're not in Debt to Sound!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RainVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					RainVillagePool-=A
					RainDebtToSound-=A
					if(RainDebtToSound<=0) RainDebtToSound=0
					SoundVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
		if(Type=="Sound")
			switch(input(usr,"What Village would you like to pay off your debt too?",) in list("Leaf","Rock","Rain"))
				if("Leaf")
					if(SoundDebtToLeaf<=0)
						usr<<"You're not in Debt to Leaf!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>SoundVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					SoundVillagePool-=A
					SoundDebtToLeaf-=A
					if(SoundDebtToLeaf<=0) SoundDebtToLeaf=0
					LeafVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rock")
					if(SoundDebtToRock<=0)
						usr<<"You're not in Debt to Rock!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>RockVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					SoundVillagePool-=A
					SoundDebtToRock-=A
					if(SoundDebtToRock<=0) SoundDebtToRock=0
					RockVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rain")
					if(SoundDebtToRain<=0)
						usr<<"You're not in Debt to Rain!";return
					var/A=input("How much do you wish to pay off?",) as num
					if(A>SoundVillagePool)
						usr<<"You don't have that much in the Village Pool!";return
					SoundVillagePool-=A
					SoundDebtToRain-=A
					if(SoundDebtToRain<=0) SoundDebtToRain=0
					RainVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
	Check_Debts()
		set name="Check Owed Debts"
		set category="Economics"
		var/Type=""
		if(usr.Village=="Leaf") Type="Leaf"
		if(usr.Village=="Rock") Type="Rock"
		if(usr.Village=="Rain") Type="Rain"
		if(usr.Village=="Sound") Type="Sound"
		if(Type=="Leaf")
			usr<<"Rock: [LeafDebtToRock]"
			usr<<"Rain: [LeafDebtToRain]"
			usr<<"Sound: [LeafDebtToSound]"
		if(Type=="Rock")
			usr<<"Leaf: [RockDebtToLeaf]"
			usr<<"Rain: [RockDebtToRain]"
			usr<<"Sound: [RockDebtToSound]"
		if(Type=="Sound")
			usr<<"Leaf: [SoundDebtToLeaf]"
			usr<<"Rain: [SoundDebtToRain]"
			usr<<"Rock: [SoundDebtToRock]"
		if(Type=="Rain")
			usr<<"Leaf: [RainDebtToLeaf]"
			usr<<"Rock: [RainDebtToRock]"
			usr<<"Sound: [RainDebtToSound]"
	Loan_Out_VillagePool()
		set name="Loan Village Pool"
		set category="Economics"
		var/Type=""
		var/mob/ReceivingLoan
		var/list/OnlineKages=list("")
		if(usr.Village=="Leaf") Type="Leaf"
		if(usr.Village=="Rock") Type="Rock"
		if(usr.Village=="Rain") Type="Rain"
		if(usr.Village=="Sound") Type="Sound"
		switch(input(usr,"Would you like to loan some of your Village Funds?",) in list("Yes","No"))
			if("Yes")
				for(var/mob/M in world)
					if(M.client&&(M.rank=="Hokage"||M.rank=="Amekoutei"||M.rank=="Otokami"||M.rank=="Tsuchikage"))
						OnlineKages+=M
				if(OnlineKages.len<=1)
					usr<<"There are no other Kages online to loan Village Pool to."
					return
			//	switch(input(usr,"Which person do you want to loan money too?",) in OnlineKages)
				var/A = input("Who do you want to loan Village Funds too?") in OnlineKages + ("I've Changed my Mind.")
				if(A=="I've Changed my mind.")
					usr<<"You decide not to loan Village Funds too anyone."
					return
				if(A!="I've Changed my mind.")
					ReceivingLoan=A
				if(ReceivingLoan!=0)
					var/Amount = input("How much Village Funds do you want to loan to [ReceivingLoan]?",) as num
					if(Amount<=0)
						return
					if(Type=="Leaf")

						if(Amount>LeafVillagePool)
							usr<<"You can't loan more than you have!";return
						LeafVillagePool-=Amount
						if(ReceivingLoan.Village=="Rain")
							RainVillagePool+=Amount
							RainDebtToLeaf+=Amount
						if(ReceivingLoan.Village=="Rock")
							RockVillagePool+=Amount
							RockDebtToLeaf+=Amount
						if(ReceivingLoan.Village=="Sound")
							SoundVillagePool+=Amount
							SoundDebtToLeaf+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] Yen from the Village Pool to the [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] to your Village!"
						SaveVillageStuff()
						LoadVillageStuff()
					if(Type=="Rock")
						if(Amount>RockVillagePool)
							usr<<"You can't loan more than you have!";return
						RockVillagePool-=Amount
						if(ReceivingLoan.Village=="Rain")
							RainVillagePool+=Amount
							RainDebtToRock+=Amount
						if(ReceivingLoan.Village=="Leaf")
							LeafVillagePool+=Amount
							RockDebtToLeaf+=Amount
						if(ReceivingLoan.Village=="Sound")
							SoundVillagePool+=Amount
							SoundDebtToRock+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] Yen from the Village Pool to the [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] to your Village!"
						SaveVillageStuff()
						LoadVillageStuff()
					if(Type=="Sound")
						if(Amount>SoundVillagePool)
							usr<<"You can't loan more than you have!";return
						SoundVillagePool-=Amount
						if(ReceivingLoan.Village=="Rain")
							RainVillagePool+=Amount
							RainDebtToSound+=Amount
						if(ReceivingLoan.Village=="Leaf")
							LeafVillagePool+=Amount
							LeafDebtToSound+=Amount
						if(ReceivingLoan.Village=="Rock")
							RockVillagePool+=Amount
							RockDebtToSound+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] Yen from the Village Pool to the [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] to your Village!"
						SaveVillageStuff()
						LoadVillageStuff()
					if(Type=="Rain")
						if(Amount>RainVillagePool)
							usr<<"You can't loan more than you have!";return
						RainVillagePool-=Amount
						if(ReceivingLoan.Village=="Rock")
							RockVillagePool+=Amount
							RockDebtToRain+=Amount
						if(ReceivingLoan.Village=="Leaf")
							LeafVillagePool+=Amount
							LeafDebtToRain+=Amount
						if(ReceivingLoan.Village=="Sound")
							SoundVillagePool+=Amount
							SoundDebtToRain+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] Yen from the Village Pool to the [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has loaned [Amount] to your Village!"
						SaveVillageStuff()
						LoadVillageStuff()
			if("No")
				return
	Upgrade_Hospital()
		set name="Upgrade Hospital"
		set category="Economics"
		var/Type=""
		var/TotalCost=0
		if(usr.Village=="Leaf") Type="Leaf"
		if(usr.Village=="Sound") Type="Sound"
		if(usr.Village=="Rain") Type="Rain"
		if(usr.Village=="Rock") Type="Rock"
		switch(input(usr,"What do you want to Purchase?",) in list("Medical Ninja","Nevermind"))
/*			if("Beds")
				switch(input(usr,"What type of Beds would you like?",) in list("Twin","Full","Queen","King"))
					if("Twin")
						if(Type=="Leaf")//24 Beds
							TotalCost=100000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedTime=1800
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedTime=1800
							usr<<"The Twin Beds costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Twin Beds for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=100000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedTime=1800
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Twin Beds costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Twin Beds for the Hospital!"
							SoundBedTime=1800
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=100000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedTime=1800
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Twin Beds costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Twin Beds for the Hospital!"
							RainBedTime=1800
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=100000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedTime=1800
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Twin Beds costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Twin Beds for the Hospital!"
							RockBedTime=1800
							SaveVillageStuff()
							LoadVillageStuff()

				 	if("Full")
						if(Type=="Leaf")//24 Beds
							TotalCost=150000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedTime=1200
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedTime=1200
							usr<<"The Full Beds costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Full Beds for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=150000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedTime=1200
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Full Beds costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Full Beds for the Hospital!"
							SoundBedTime=1200
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=150000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedTime=1200
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Full Beds costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Full Beds for the Hospital!"
							RainBedTime=1200
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=150000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedTime=1200
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Full Beds costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Full Beds for the Hospital!"
							RockBedTime=1200
							SaveVillageStuff()
							LoadVillageStuff()

					if("King")
						if(Type=="Leaf")//24 Beds
							TotalCost=175000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedTime=900
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedTime=900
							usr<<"The King Beds costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy King Beds for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=200000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedTime=900
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The King Beds costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy King Beds for the Hospital!"
							SoundBedTime=900
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=200000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedTime=900
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Twin Beds costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy King Beds for the Hospital!"
							RainBedTime=900
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=200000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedTime=900
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The King Beds costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy King Beds for the Hospital!"
							RockBedTime=900
							SaveVillageStuff()
							LoadVillageStuff()
					if("Queen")
						if(Type=="Leaf")//24 Beds
							TotalCost=195000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedTime=600
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedTime=600
							usr<<"The Queen Beds costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Queen Beds for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=225000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedTime=600
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Queen Beds costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Queen Beds for the Hospital!"
							SoundBedTime=600
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=300000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedTime=600
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Queen Beds costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy King Beds for the Hospital!"
							RainBedTime=600
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=225000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedTime=600
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Queen Beds costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Queen Beds for the Hospital!"
							RockBedTime=600
							SaveVillageStuff()
							LoadVillageStuff()*/
			if("Medical  Ninja")
				switch(input(usr,"What type of Medical Ninja would you like to operate on your Villagers while they recover in the Beds?",) in list("Beginner","Moderate","Advanced","Expert"))
					if("Beginner")
						if(Type=="Leaf")//24 Beds
							TotalCost=100000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedRate=1.8
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedRate=1.8
							usr<<"The Beginner Medical Ninja costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Beginner Medical Ninja for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=100000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedRate=1.8
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Beginner Medical ninja costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Beginner Medical Ninja for the Hospital!"
							SoundBedRate=1.8
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=100000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedRate=1.8
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Beginner Medical Ninja costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Beginner Medical Ninja for the Hospital!"
							RainBedRate=1.8
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=100000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedRate=1.8
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Beginner Medical Ninja costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Beginner Medical Ninja for the Hospital!"
							RockBedRate=1.8
							SaveVillageStuff()
							LoadVillageStuff()
					if("Moderate")
						if(Type=="Leaf")//24 Beds
							TotalCost=125000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedRate=1.6
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedRate=1.6
							usr<<"The Moderate Medical Ninja costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Moderate Medical Ninja for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=125000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedRate=1.6
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Moderate Medical ninja costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Moderate Medical Ninja for the Hospital!"
							SoundBedRate=1.6
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=125000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedRate=1.6
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Moderate Medical Ninja costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Moderate Medical Ninja for the Hospital!"
							RainBedRate=1.6
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=125000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedRate=1.6
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Moderate Medical Ninja costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Moderate Medical Ninja for the Hospital!"
							RockBedRate=1.6
							SaveVillageStuff()
							LoadVillageStuff()
					if("Advanced")
						if(Type=="Leaf")//24 Beds
							TotalCost=140000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedRate=1
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedRate=1
							usr<<"The Advanced Medical Ninja costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Advanced Medical Ninja for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=140000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedRate=1
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Advanced Medical ninja costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Advanced Medical Ninja for the Hospital!"
							SoundBedRate=1
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=140000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedRate=1
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Advanced Medical Ninja costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Advanced Medical Ninja for the Hospital!"
							RainBedRate=1
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=140000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedRate=1
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Advanced Medical Ninja costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Advanced Medical Ninja for the Hospital!"
							RockBedRate=1
							SaveVillageStuff()
							LoadVillageStuff()
					if("Expert")
						if(Type=="Leaf")//24 Beds
							TotalCost=175000*24
							if(LeafVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										LeafVillagePool-=TotalCost
										LeafBedRate=0.7
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							LeafVillagePool-=TotalCost
							LeafBedRate=0.7
							usr<<"The Expert Medical Ninja costed [TotalCost] and now there is [LeafVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Expert Medical Ninja for the Hospital!"
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Sound")//18 Beds
							TotalCost=179000*18
							if(SoundVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										SoundVillagePool-=TotalCost
										SoundBedRate=0.7
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							SoundVillagePool-=TotalCost
							usr<<"The Expert Medical ninja costed [TotalCost] and now there is [SoundVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Expert Medical Ninja for the Hospital!"
							SoundBedRate=0.7
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rain")//9 Beds
							TotalCost=250000*9
							if(RainVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RainVillagePool-=TotalCost
										RainBedRate=0.7
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RainVillagePool-=TotalCost
							usr<<"The Expert Medical Ninja costed [TotalCost] and now there is [RainVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Expert Medical Ninja for the Hospital!"
							RainBedRate=0.7
							SaveVillageStuff()
							LoadVillageStuff()
						if(Type=="Rock")//20 Beds
							TotalCost=200000*20
							if(RockVillagePool<TotalCost)
								switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
									if("Yes")
										RockVillagePool-=TotalCost
										RockBedRate=0.7
										SaveVillageStuff()
										LoadVillageStuff()
										return
									if("No")
										return
							RockVillagePool-=TotalCost
							usr<<"The Expert Medical Ninja costed [TotalCost] and now there is [RockVillagePool] remaining for the Village."
							for(var/mob/X in world)
								if(X.Village==usr.Village)
									X << "<font color = #BB0EDA>Village Information:</font> [usr] has used Village Funds to buy Expert Medical Ninja for the Hospital!"
							RockBedRate=0.7
							SaveVillageStuff()
							LoadVillageStuff()


	Restock_Armor()
		set name="Restock Armory"
		set category="Economics"
		var/Type=""
		var/AnbuCount=0
		var/ChuuninCount=0
		var/HunterCount=0
		var/TotalCost=0
		if(src.Village=="Leaf") Type="Leaf"
		if(src.Village=="Sound") Type="Sound"
		if(src.Village=="Rain") Type="Rain"
		if(src.Village=="Rock") Type="Rock"
		if(Type=="Leaf")
			switch(input(src,"Which group do you want to restock Armor?",) in list("Anbu","Chuunin","Nevermind"))
				if("Anbu")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.Anbu)
									AnbuCount++
					if(AnbuCount<=0)
						src<<"There are no Anbu online..Why do you need to restock these?"
						return
					TotalCost=(AnbuCount*500000)
					if(LeafVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					LeafVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.Anbu)
									if(!(locate(/obj/Clothes/ANBUArmor) in M.contents))
										M.contents += new/obj/Clothes/ANBUArmor
										M<<"You have been given another set of Anbu Armor!"
				if("Chuunin")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									ChuuninCount++
					if(ChuuninCount<=0)
						src<<"There are no Chuunin online..Why do you need to restock these?"
						return
					TotalCost=(ChuuninCount*250000)
					if(LeafVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					LeafVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									if(!(locate(/obj/Clothes/Chuunin_Vest) in M.contents))
										M.contents += new/obj/Clothes/Chuunin_Vest
										M<<"You have been given another Chuunin Vest!"
					SaveVillageStuff()
					LoadVillageStuff()
				if("Nevermind")
					return
		if(Type=="Sound")
			switch(input(src,"Which group do you want to restock Armor?",) in list("Anbu","Chuunin","Nevermind"))
				if("Anbu")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.Anbu)
									AnbuCount++
					if(AnbuCount<=0)
						src<<"There are no Anbu online..Why do you need to restock these?"
						return
					TotalCost=(AnbuCount*500000)
					if(SoundVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					SoundVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.Anbu)
									if(!(locate(/obj/Clothes/ANBUArmor) in	M.contents))
										M.contents += new/obj/Clothes/ANBUArmor
										M<<"You have been given another set of Anbu Armor!"
				if("Chuunin")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									ChuuninCount++
					if(ChuuninCount<=0)
						src<<"There are no Chuunin online..Why do you need to restock these?"
						return
					TotalCost=(ChuuninCount*250000)
					if(SoundVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					SoundVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									if(!(locate(/obj/Clothes/Chuunin_Vest) in M.contents))
										M.contents += new/obj/Clothes/Chuunin_Vest
										M<<"You have been given another Chuunin Vest!"
					SaveVillageStuff()
					LoadVillageStuff()
				if("Nevermind")
					return
		if(Type=="Rock")
			switch(input(src,"Which group do you want to restock Armor?",) in list("Anbu","Chuunin","Nevermind"))
				if("Anbu")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.Anbu)
									AnbuCount++
					if(AnbuCount<=0)
						src<<"There are no Anbu online..Why do you need to restock these?"
						return
					TotalCost=(AnbuCount*500000)
					if(RockVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					RockVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.Anbu)
									if(!(locate(/obj/Clothes/ANBUArmor) in M.contents))
										M.contents += new/obj/Clothes/ANBUArmor
										M<<"You have been given another set of Anbu Armor!"
				if("Chuunin")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									ChuuninCount++
					if(ChuuninCount<=0)
						src<<"There are no Chuunin online..Why do you need to restock these?"
						return
					TotalCost=(ChuuninCount*250000)
					if(RockVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					RockVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									if(!(locate(/obj/Clothes/Chuunin_Vest) in M.contents))
										M.contents += new/obj/Clothes/Chuunin_Vest
										M<<"You have been given another Chuunin Vest!"
					SaveVillageStuff()
					LoadVillageStuff()
				if("Nevermind")
					return
		if(Type=="Rain")
			switch(input(src,"Which group do you want to restock Armor?",) in list("Hunter-Nin","Chuunin","Nevermind"))
				if("Anbu")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.HunterNinMember)
									HunterCount++
					if(AnbuCount<=0)
						src<<"There are no Anbu online..Why do you need to restock these?"
						return
					TotalCost=(HunterCount*500000)
					if(RainVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					RainVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.HunterNinMember)
									if(!(locate(/obj/Clothes/HunterNinClothing) in M.contents))
										M.contents += new/obj/Clothes/HunterNinClothing
										M<<"You have been given another set of Anbu Armor!"
				if("Chuunin")
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									ChuuninCount++
					if(ChuuninCount<=0)
						src<<"There are no Chuunin online..Why do you need to restock these?"
						return
					TotalCost=(ChuuninCount*250000)
					if(RainVillagePool<TotalCost)
						switch(input(src,"Are you sure you'd like to do this? It will put the village into depression!",) in list("Yes","No"))
							if("Yes")
								src<<"LOL"
								SaveVillageStuff()
							if("No")
								return
					RainVillagePool-=TotalCost
					for(var/mob/M in world)
						if(M.client)
							if(M.Village==src.Village)
								if(M.rank=="Chuunin")
									if(!(locate(/obj/Clothes/Chuunin_Vest) in M.contents))
										M.contents += new/obj/Clothes/Chuunin_Vest
										M<<"You have been given another Chuunin Vest!"
					SaveVillageStuff()
					LoadVillageStuff()
				if("Nevermind")
					return
	Check_Economy()
		set name="Check Economic Distribution"
		set category="Economics"
		if(src.Village=="Leaf")
			src<<"Current Money: [LeafVillagePool]"
			src<<"Bills per Week: [LeafPayment]"
			src<<"Mission Tax: [LeafMTax]"
			src<<"Clothing Tax: [LeafCTax]"
			src<<"Weapons Tax: [LeafWTax]"
			src<<"Food Tax: [LeafFTax]"
		if(src.Village=="Rain")
			src<<"Current Money: [RainVillagePool]"
			src<<"Bills per Week: [RainPayment]"
			src<<"Mission Tax: [RainMTax]"
			src<<"Clothing Tax: [RainCTax]"
			src<<"Weapons Tax: [RainWTax]"
			src<<"Food Tax: [RainFTax]"
		if(src.Village=="Rock")
			src<<"Current Money: [RockVillagePool]"
			src<<"Bills per Week: [RockPayment]"
			src<<"Mission Tax: [RockMTax]"
			src<<"Clothing Tax: [RockCTax]"
			src<<"Weapons Tax: [RockWTax]"
			src<<"Food Tax: [RockFTax]"
		if(src.Village=="Sound")
			src<<"Current Money: [SoundVillagePool]"
			src<<"Bills per Week: [SoundPayment]"
			src<<"Mission Tax: [SoundMTax]"
			src<<"Clothing Tax: [SoundCTax]"
			src<<"Weapons Tax: [SoundWTax]"
			src<<"Food Tax: [SoundFTax]"
	CheckEconomicState()
		set name = "Economical Condition"
		set category = "Economics"
		if(usr.Village=="Leaf")
			if(LeafVillagePool>=100000000)
				usr<<"<font color=green> Leaf is in extreme Economic Prosperity! [LeafVillagePool]"
			if(LeafVillagePool<20000000)
				usr<<"<font color=red> Leaf is experiencing a dying economy.... [LeafVillagePool]"
		if(usr.Village=="Rock")
			if(RockVillagePool>=100000000)
				usr<<"font color=green> Rock is in extreme Economic Prosperity! [RockVillagePool]"
			if(RockVillagePool<20000000)
				usr<<"<font color=red> Rock is experiencing a dying economy.... [RockVillagePool]"
		if(usr.Village=="Rain")
			if(RainVillagePool>=100000000)
				usr<<"<font color=green> Rain is in extreme Economic Prosperity! [RainVillagePool]"
			if(RainVillagePool<20000000)
				usr<<"<font color=red> Rain is experiencing a dying economy.... [RainVillagePool]"
		if(usr.Village=="Sound")
			if(SoundVillagePool>100000000)
				usr<<"<font color=green> Sound is in extreme Economic Prosperity! [SoundVillagePool]"
			if(SoundVillagePool<20000000)
				usr<<"<font color=red> Sound is experiencing a dying economy.... [SoundVillagePool]"
	RiskyInflation()
		set name = "Lower Inflation - Risky"
		set category = "Economics"
		usr<<"Not Completed."
	EconomicHelpers()
		set name = "Most Involved People"
		set category = "Economics"
		usr<<"<font color=blue>Most Involved [usr.Village] Village Members -"
		for(var/mob/M in world)
			if(M.Village == usr.Village&&M.client)
				if(M.VMorale>300)
					usr<<"<font color=red>Best Participant: [M.FirstName] - [M.VMorale]"
				else if(M.VMorale<300&&M.VMorale>=200)
					usr<<"<font color=blue>Good Participant: [M.FirstName] - [M.VMorale]"
				else if(M.VMorale>=200&&M.VMorale<25)
					usr<<"<font color=white>Needs to Help: [M.FirstName] - [M.VMorale]"
				else
					usr<<"<font color=green>New to the Village: [M.FirstName] - [M.VMorale]"
	MissionSweep()
		set name = "Mission Depletion"
		set category ="Economics"
		if(usr.Village=="Leaf")
			if(LeafVillagePool<1000000)
				switch(input(usr,"The Economy is Undergoing a close recession. Would you like to make Missions voluntary (All the Money goes to the Village Pool)?","Leave?") in list("Yes","No"))
					if("Yes")
						LeafVillageMissionFree=1
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income on hold! All missions will now only deliver income to the Village Pool rather than payment!"
								SaveVillageStuff()
								LoadVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."
		if(usr.Village=="Rock")
			if(RockVillagePool<1000000)
				switch(input(usr,"The Economy is Undergoing a close recession. Would you like to make Missions voluntary (All the Money goes to the Village Pool)?","Leave?") in list("Yes","No"))
					if("Yes")
						RockVillageMissionFree=1
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income on hold! All missions will now only deliver income to the Village Pool rather than payment!"
								SaveVillageStuff()
								LoadVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."
		if(usr.Village=="Sound")
			if(SoundVillagePool<1000000)
				switch(input(usr,"The Economy is Undergoing a close recession. Would you like to make Missions voluntary (All the Money goes to the Village Pool)?","Leave?") in list("Yes","No"))
					if("Yes")
						SoundVillageMissionFree=1
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income on hold! All missions will now only deliver income to the Village Pool rather than payment!"
								SaveVillageStuff()
								LoadVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."
		if(usr.Village=="Rain")
			if(RainVillagePool<1000000)
				switch(input(usr,"The Economy is Undergoing a close recession. Would you like to make Missions voluntary (All the Money goes to the Village Pool)?","Leave?") in list("Yes","No"))
					if("Yes")
						RainVillageMissionFree=1
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income on hold! All missions will now only deliver income to the Village Pool rather than payment!"
								SaveVillageStuff()
								LoadVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."


	MissionRestore()
		set name = "Mission Productivity"
		set category ="Economics"
		if(usr.Village=="Leaf")
			if(LeafVillageMissionFree==1)
				switch(input(usr,"Would you like people to receive payment from Missions again?") in list("Yes","No"))
					if("Yes")
						LeafVillageMissionFree=0
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income back on! All missions pay again!";SaveVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."
		if(usr.Village=="Sound")
			if(SoundVillageMissionFree==1)
				switch(input(usr,"Would you like people to receive payment from Missions again?") in list("Yes","No"))
					if("Yes")
						SoundVillageMissionFree=0
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income back on! All missions pay again!";SaveVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."
		if(usr.Village=="Rock")
			if(RockVillageMissionFree==1)
				switch(input(usr,"Would you like people to receive payment from Missions again?") in list("Yes","No"))
					if("Yes")
						RockVillageMissionFree=0
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income back on! All missions pay again!";SaveVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."
		if(usr.Village=="Rain")
			if(RainVillageMissionFree==1)
				switch(input(usr,"Would you like people to receive payment from Missions again?") in list("Yes","No"))
					if("Yes")
						RainVillageMissionFree=0
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Village Information:</font> [usr] has put the Mission Income back on! All missions pay again!";SaveVillageStuff()
					if("No")
						usr<<"Sometimes it's needed though..."




/*

Gekido says
Basically, if you have a variable somewhere like
var/list/HiredNinja = list()
and have it so when kages create an NPC, it adds to this list, AND calls the save function, like
proc/SaveHiredNinja()
    var/savefile/F = new("World Save Files/HiredNinja.sav")
    F["Ninja"] << HiredNinja
It'll save all the ninja in the world, who were hired..



Gekido says
Then, have it when the world starts up, it calls a load proc,
proc/LoadHiredNinja()
    var/savefile/F = new("World Save Files/HiredNinja.sav")
    F["Ninja"] >> HiredNinja
and then have the world call the save proc every 60 seconds..

And have it so that when a NPC dies, they're removed from the HiredNinja list, ( HiredNinja -= src)

Gekido says
This'll make it so they stay in the world even after reboots and such...
A rich village for example, could create, say, 100 NPCs... by the main gate...
should also have a few options for Kages to create NPCs
Genin, Chuunin, Special Jounin, Jounin, would all cost different
Then there'd be options like, Stationary, where they just stand around, like the NPCs by the scroll or gates of Sound, and attack only when you have the scroll and someone enters,
Or maybe they go on patrol?
Or maybe they attack any and all ninja not from your village?


*/
