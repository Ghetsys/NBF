mob/var
	tmp/drunk=0
	tmp/Suiken=0
	tmp/EffectsofDrinking=0
	tmp/PillDelay=0
//Ect
//LeafVillage
mob/NPC/RandomNPCs/
	icon='Map/Turfs/HakumeiGetsu.dmi'
	icon_state="NPC"
	SnackMachine
		name="Vending Machine"
		icon='Icons/SnackMachine.dmi'
		health=9999999999999999999999999999999999999999999999
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/list/buttons = list("Potato Chips","BBQ Potato Chips","Healthy Chips","Sour-Cream And Onion Chips","Pepsi","Cancel")
				var/A = sd_Alert(usr, "What do you wish to purchase?","[src]", buttons, pick(buttons),0,0,"600x200",,,,4,2)
				if(A=="Potato Chips")
					if(usr.Yen<5)
						usr<<"You don't have enough money!";return
					else
						usr.Yen-=5;var/obj/Food/Chips/B=new();B.loc=usr
						usr<<sound('SFX/Cash.wav');usr<<"You bought Potato Chips!"
				else if(A=="BBQ Potato Chips")
					if(usr.Yen<15)
						usr<<"You don't have enough money!";return
					else
						usr.Yen-=515;var/obj/Food/BBQChips/B=new();B.loc=usr
						usr<<sound('SFX/Cash.wav');usr<<"You bought BBQ Potato Chips!"
				else if(A=="Healthy Chips")
					if(usr.Yen<10)
						usr<<"You don't have enough money!";return
					else
						usr.Yen-=10;var/obj/Food/HChips/B=new();B.loc=usr
						usr<<sound('SFX/Cash.wav');usr<<"You bought Healthy Chips!"
				else if(A=="Sour-Cream And Onion Chips")
					if(usr.Yen<10)
						usr<<"You don't have enough money!";return
					else
						usr.Yen-=10;var/obj/Food/SCOChips/B=new();B.loc=usr
						usr<<sound('SFX/Cash.wav');usr<<"You bought Sour-Cream and Onion Potato Chips!"
				else if(A=="Pepsi")
					if(usr.Yen<10)
						usr<<"You don't have enough money!";return
					else
						usr.Yen-=10;var/obj/Drinks/Pepsi/AA=new();AA.loc=usr
						usr<<sound('SFX/Cash.wav');usr<<"You bought some Pepsi!"
				else
					return
			usr.CheckWeight()
mob/NPC/RandomNPCs/LeafVillagers
	IchirakuRamen
		name="Ichiraku, Sennin"
		icon = 'Icons/Chef.dmi'
		CNNPC = 1
		health = 999999999999999999999999999999999999999999999999999999999
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
		//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
		//			color:white;}</style>"
				sd_Alert(usr, "My family runs this business, each generation being given the secret to making the Ichiraku ramen! Haha!","[src]")//,,,,0,"400x150",,style)

		verb
			Buy()
				set src in oview(3)
				set name="Buy"
				set category="NPC"
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				switch(input(usr,"What would you like to buy?","Test") in list("Pork-Fried Ramen","Special Pork-Fried Ramen","Quick Ramen","Filling Ramen","Sake","Cancel"))
					if("Pork-Fried Ramen")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 10 Ryo!","Ramen", buttons2, \
							pick(buttons2),0,0,"400x150",,style)
						if("Yes")
							if(usr.Yen<10)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=10;var/obj/Food/PRamen/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return

					if("Special Pork-Fried Ramen")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 25 Ryo!","Ramen", buttons2, \
							pick(buttons2),0,0,"400x150",,style)
						if("Yes")
							if(usr.Yen<25)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=25;var/obj/Food/SRamen/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return

					if("Quick Ramen")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 15 Ryo!","Ramen", buttons2, \
							pick(buttons2),0,0,"400x150",,style)
						if("Yes")
							if(usr.Yen<15)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=15;var/obj/Food/QRamen/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return

					if("Filling Ramen")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 45 Ryo!","Ramen", buttons2, \
							pick(buttons2),0,0,"400x150",,style)
						if("Yes")
							if(usr.Yen<45)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=45;var/obj/Food/FRamen/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return

					if("Sake")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 50 Ryo!","Sake", buttons2, \
							pick(buttons2),0,0,"400x150",,style)
						if("Yes")
							if(usr.Yen<50)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=50;var/obj/Drinks/Sake/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
				usr.CheckWeight()

mob/NPC/RandomNPCs/RockVillage
	GoodBurger
		name="Good Burger Kid"
		icon = 'Icons/Chef.dmi'
		CNNPC = 1
		health = 999999999999999999999999999999999999999999999999999999999
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
		//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
		//			color:white;}</style>"
				sd_Alert(usr, "Welcome to Good Burger, home of the Good Burger, can I take your order? CRAP! I messed up!","[src]")//,,,,0,"400x150",,style)
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
				switch(input(usr,"What would you like to buy?","Test") in list("Hamburger","Cheese Burger","Turkey Burger","Chicken Burger","Cheese Turkey Burger","Cheese Chicken Burger","Sake","Cancel"))
					if("Hamburger")
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
						sd_Alert(usr, "Alright, so that'll be 10 Ryo!","Hamburger", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<10) // HERE!
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=10;var/obj/Food/Hamburger/B=new();B.loc=usr // HERE! ..And that's it.
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
					if("Cheese Burger")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 15 Ryo!","Hamburger", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<15)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=15;var/obj/Food/CHamburger/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
					if("Turkey Burger")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 15 Ryo!","Hamburger", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<10)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=10;var/obj/Food/Tburger/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
					if("Chicken Burger")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 15 Ryo!","Hamburger", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<10)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=10;var/obj/Food/Cburger/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
					if("Cheese Turkey Burger")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 15 Ryo!","Hamburger", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<15)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=15;var/obj/Food/CTburger/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
					if("Cheese Chicken Burger")
						var/list/buttons2 = list("Yes","No")
						sd_Alert(usr, "Alright, so that'll be 15 Ryo!","Hamburger", buttons2, \
							pick(buttons2),0,0,"600x200",,style)
						if("Yes")
							if(usr.Yen<15)
								sd_Alert(usr, "You're broke eh? Get some money! I can't give you it for free! Jeez!","[src]",,,,0,"400x150",,style);return
							else
								usr.Yen-=15;var/obj/Food/CCburger/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
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
								usr<<sound('SFX/Cash.wav')
								sd_Alert(usr,"Here you go! Enjoy! Haha!","[src]",,,,0,"400x150",,style);return
				usr.CheckWeight()
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////

//Ramen
obj/Food
	icon = 'Icons/Food.dmi'
	var
		HowMuchHungerCured=0
		HowMuchCaloriesGiven=0
		FoodTimeInSeconds=0
		Diseased=0
		Sickness=0
	verb
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up [src]"
		Eat()
			if(usr.knockedout||usr.Frozen)
				return
			if(usr.FrozenBind!="")
				usr<<"Not now."
				return
			if(global.contestantOne==usr||global.contestantTwo==usr||usr in contestants)
				usr<<"You can't eat while you're set as a contestant."
				return
			if(src.name=="Potato Chips"||src.name=="BBQ-Flavored Chips")
				usr<<"You open up a bag of [src] and begin to eat."
				oview(10,usr)<<"[usr] begins eating the [src]."
			else if(src.name=="Soldier Pill")
				usr<<"You pop a [src] into your mouth."
			else if(src.name=="Blood Pill")
				usr<<"You pop a [src] into your mouth."
				usr.stamina-= 2000
				usr.health -= 350
			else
				usr<<"You relax as you begin to eat [src]."
				oview(10,usr)<<"[usr] begins eating the [src]."

			usr.FrozenBind="Eating"
			var/EatingTime=src.FoodTimeInSeconds*10
			for(var/mob/M in OnlinePlayers)
				if(M.key=="CobraT1337")
					M<<"[usr] is eating [src]. Time to eat [EatingTime]"
			if(usr.Trait3=="Gluttony")
				EatingTime/=2
				HowMuchCaloriesGiven*=1.5
			sleep(EatingTime)
			if(usr.hunger==0&&src.name!="Soldier Pill")
				if(usr.AkimichiSpirit>=50&&usr.calories<1000)
					usr<<"You feel like you're about to overflow!";usr.health=0;usr.Frozen=0;return
				else if(usr.calories<500)
					usr<<"You feel like you're about to overflow!";usr.health=0;usr.Frozen=0;return
			if(usr.FrozenBind=="Eating")
				usr.FrozenBind=""
			usr<<"You finished eating."
			if(usr.ChakraPool<usr.MaxChakraPool)
				usr.ChakraPool+=(src.HowMuchHungerCured*10)
				if(src.name=="Soldier Pill")
					usr.ChakraPool+=(src.HowMuchHungerCured*rand(1000,1500))
			usr.calories+=src.HowMuchCaloriesGiven*rand(5,10)
			usr.hunger-=src.HowMuchHungerCured
			usr.stamina+=src.HowMuchCaloriesGiven*10
			if(usr.deathcount<0)
				usr.deathcount=0
			if(usr.hunger<0)
				usr.hunger=0
			if(usr.stamina>=usr.maxstamina*1.1)
				usr<<"You're feeling super revitalized!"
				usr.stamina=usr.maxstamina*1.1
			usr.CheckWeight()
			del(src)

		Drop()
			src.loc=locate(usr.x,usr.y-1,usr.z)
	CatFish
		name = "CatFish"
		icon_state="Fish"
		HowMuchHungerCured=10
		HowMuchCaloriesGiven=10
		FoodTimeInSeconds=10
		PlacementWeight=10
	Cod
		name = "Cod"
		icon_state="Fish2"
		HowMuchHungerCured=12
		HowMuchCaloriesGiven=8
		FoodTimeInSeconds=15
		PlacementWeight=13
	PRamen
		name = "Pork-Friend Ramen"
		icon_state="10"
		HowMuchHungerCured=25
		HowMuchCaloriesGiven=10
		FoodTimeInSeconds=10
		PlacementWeight=5
	SRamen
		name = "Special Pork-Friend Ramen"
		icon_state="10"
		HowMuchHungerCured=35
		HowMuchCaloriesGiven=25
		FoodTimeInSeconds=10
		PlacementWeight=10
	QRamen
		name = "Quick Ramen"
		icon_state="10"
		HowMuchHungerCured=15
		HowMuchCaloriesGiven=15
		FoodTimeInSeconds=3
		PlacementWeight=7
	FRamen
		name = "Filling Ramen"
		icon_state="11"
		HowMuchHungerCured=50
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=20
		PlacementWeight=20
	CRamen
		name = "Calorie Ramen"
		icon_state="11"
		HowMuchHungerCured=75
		HowMuchCaloriesGiven=150
		FoodTimeInSeconds=30
		PlacementWeight=50
////////////////////////////////////
//Snacks
////////////////////////////////////
//Chips
	Chips
		name = "Potato Chips"
		icon_state="1"
		HowMuchHungerCured=15
		HowMuchCaloriesGiven=5
		FoodTimeInSeconds=5
		PlacementWeight=2
	HChips
		name = "Healthy Potato Chips"
		icon_state="1"
		HowMuchHungerCured=15
		HowMuchCaloriesGiven=15
		FoodTimeInSeconds=5
		PlacementWeight=3
	BBQChips
		name = "BBQ-Flavored Chips"
		icon_state="2x"
		HowMuchHungerCured=25
		HowMuchCaloriesGiven=25
		FoodTimeInSeconds=5
		PlacementWeight=5
	SCOChips
		name = "Sour-Cream And Onion Chips"
		icon_state="2z"
		HowMuchHungerCured=25
		HowMuchCaloriesGiven=5
		FoodTimeInSeconds=3
		PlacementWeight=3
//Fruit
	Orange
		name = "Orange"
		icon_state="21"
		HowMuchHungerCured=20
		HowMuchCaloriesGiven=35
		FoodTimeInSeconds=4
		PlacementWeight=5
	Tangerine
		name = "Tangerine"
		icon_state="21"
		HowMuchHungerCured=10
		HowMuchCaloriesGiven=65
		FoodTimeInSeconds=2
		PlacementWeight=10
	Apple
		name = "Red Apple"
		icon_state="22"
		HowMuchHungerCured=15
		HowMuchCaloriesGiven=40
		FoodTimeInSeconds=4
		PlacementWeight=6
	Apple2
		name = "Yellow Apple"
		icon_state="22x"
		HowMuchHungerCured=10
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=4
		PlacementWeight=7
	Apple3
		name = "Green Apple"
		icon_state="22z"
		HowMuchHungerCured=20
		HowMuchCaloriesGiven=45
		FoodTimeInSeconds=4
		PlacementWeight=6
	Grapes
		name = "Pear"
		icon_state="25"
		HowMuchHungerCured=5
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=8
		PlacementWeight=7
	Pear
		name = "Pear"
		icon_state="24"
		HowMuchHungerCured=15
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=6
		PlacementWeight=7
	Banana
		name = "Banana"
		icon_state="26"
		HowMuchHungerCured=10
		HowMuchCaloriesGiven=100
		FoodTimeInSeconds=8
		PlacementWeight=10
//Meat
	Squid
		name = "Fried Squid"
		icon_state="14"
		HowMuchHungerCured=15
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=7
		PlacementWeight=10
////////////////////////////////////
//Meals
////////////////////////////////////
//Hotdog
	THotDog
		name = "Turkey Hot Dog"
		icon_state="3"
		HowMuchHungerCured=35
		HowMuchCaloriesGiven=15
		FoodTimeInSeconds=10
		PlacementWeight=10
	PHotDog
		name = "Pork Hot Dog"
		icon_state="3"
		HowMuchHungerCured=20
		HowMuchCaloriesGiven=25
		FoodTimeInSeconds=10
		PlacementWeight=12
	SpHotDog
		name = "Special Hot Dog"
		icon_state="3"
		HowMuchHungerCured=50
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=10
		PlacementWeight=15
	CHotDog
		name = "Cheese Dog"
		icon_state="3x"
		HowMuchHungerCured=20
		HowMuchCaloriesGiven=45
		FoodTimeInSeconds=15
		PlacementWeight=13
	CCHotDog
		name = "Chili Cheese Dog"
		icon_state="3z"
		HowMuchHungerCured=20
		HowMuchCaloriesGiven=100
		FoodTimeInSeconds=20
		PlacementWeight=20
//Burger
	Hamburger
		name = "Hamburger"
		icon_state="4"
		HowMuchHungerCured=45
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=10
		PlacementWeight=15
	Tburger
		name = "Turkey Burger"
		icon_state="4"
		HowMuchHungerCured=50
		HowMuchCaloriesGiven=45
		FoodTimeInSeconds=8
		PlacementWeight=15
	Cburger
		name = "Chicken Burger"
		icon_state="4"
		HowMuchHungerCured=50
		HowMuchCaloriesGiven=50
		FoodTimeInSeconds=12
		PlacementWeight=15
	CHamburger
		name = "Cheeseburger"
		icon_state="5"
		HowMuchHungerCured=50
		HowMuchCaloriesGiven=65
		FoodTimeInSeconds=12
		PlacementWeight=16
	CTburger
		name = "Cheese Turkey Burger"
		icon_state="5"
		HowMuchHungerCured=55
		HowMuchCaloriesGiven=60
		FoodTimeInSeconds=10
		PlacementWeight=17
	CCburger
		name = "Cheese Chicken Burger"
		icon_state="5"
		HowMuchHungerCured=55
		HowMuchCaloriesGiven=65
		FoodTimeInSeconds=12
		PlacementWeight=15
	Aburger
		name = "Angus Burger"
		icon_state="5"
		HowMuchHungerCured=85
		HowMuchCaloriesGiven=265
		FoodTimeInSeconds=12
		PlacementWeight=75
	Tburger
		name = "Triple Beef Burger"
		icon_state="5"
		HowMuchHungerCured=100
		HowMuchCaloriesGiven=500
		FoodTimeInSeconds=12
		PlacementWeight=150
////////
	Steak
		name = "Steak"
		icon_state="17"
		HowMuchHungerCured=75
		HowMuchCaloriesGiven=150
		FoodTimeInSeconds=30
		PlacementWeight=100
	MSteak
		name = "Steak"
		icon_state="17"
		HowMuchHungerCured=75
		HowMuchCaloriesGiven=250
		FoodTimeInSeconds=35
		PlacementWeight=135
	BSSteak
		name = "Steak"
		icon_state="17"
		HowMuchHungerCured=80
		HowMuchCaloriesGiven=550
		FoodTimeInSeconds=45
		PlacementWeight=175
	Ribs
		name = "Ribs"
		icon_state="16"
		HowMuchHungerCured=45
		HowMuchCaloriesGiven=100
		FoodTimeInSeconds=30
		PlacementWeight=150
	MRibs
		name = "Ribs"
		icon_state="16"
		HowMuchHungerCured=45
		HowMuchCaloriesGiven=200
		FoodTimeInSeconds=30
		PlacementWeight=175
	BSRibs
		name = "Ribs"
		icon_state="16"
		HowMuchHungerCured=45
		HowMuchCaloriesGiven=300
		FoodTimeInSeconds=30
		PlacementWeight=150


	Rice
		icon_state="19"
		HowMuchHungerCured=50
		HowMuchCaloriesGiven=250
		FoodTimeInSeconds=60
		PlacementWeight=50
	Riceball
		icon_state="18"
		HowMuchHungerCured=25
		HowMuchCaloriesGiven=80
		FoodTimeInSeconds=10
		PlacementWeight=50
	CurryLife
		name="Curry Of Life"
		icon_state="4"
		HowMuchHungerCured=100
		HowMuchCaloriesGiven=560
		FoodTimeInSeconds=60
		PlacementWeight=500

obj/Pills
	icon = 'Icons/Food.dmi'
	var
		Gift="Chakra"
		HowMuchCured=0
		FoodTimeInSeconds=0
	verb
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up [src]"
		Eat()
			if(usr.knockedout||usr.Frozen)
				return
			if(usr.PillDelay)
				if(Gift=="Chakra")
					usr.chakra/=2
					usr.chakra-=500
					usr<<"You feel a sharp pain in your stomach as you swallow the [src]!"
					return
				if(Gift=="Stamina")
					usr.stamina/=2
					usr.stamina-=500
					usr<<"You feel a sharp pain in your stomach as you swallow the [src]!"
					return
				if(Gift=="Chakra Pool")
					usr.health-=1000
					usr.chakra=0
					usr.stamina-=500
					usr<<"You feel a sharp pain go through your body as you swallow the [src]!"
					return
			usr<<"You pop a [src] into your mouth."

			if(Gift=="Chakra")
				if(usr.ChakraPool<0)
					usr<<"Your about to collapse!"
					usr.knockedout=1
				else
					usr.PillDelay=1
					if(usr.chakra<usr.Mchakra)
						usr.chakra+=src.HowMuchCured
						if(usr.chakra>usr.Mchakra)
							usr.chakra=usr.Mchakra
						usr.ChakraPool-=src.HowMuchCured*3
						spawn(50)
							usr.PillDelay=0
							if(usr.ChakraPool<0)
								usr.ChakraPool=0
								usr.deathcount+=1
								usr<<"Your body feels strained.."

			if(Gift=="Stamina")
				if(usr.chakra<0)
					usr<<"Your about to collapse!"
					usr.knockedout=1
				else
					usr.PillDelay=1
					if(usr.stamina<usr.maxstamina)
						usr.stamina+=src.HowMuchCured
						if(usr.stamina>usr.maxstamina)
							usr.stamina=usr.maxstamina
						usr.chakra-=src.HowMuchCured
					spawn(150)
						usr.PillDelay=0
			if(Gift=="Chakra Pool")
				usr.PillDelay=1
				if(usr.ChakraPool<usr.MaxChakraPool)
					usr.ChakraPool+=src.HowMuchCured
				usr.health-=450
				spawn(300)
					usr.PillDelay=0
			del(src)

		Drop()
			src.loc=locate(usr.x,usr.y-1,usr.z)
	StaminaPill1
		name="Stamina Pill"
		icon_state="6"
		HowMuchCured=500
		PlacementWeight=3
		Gift="Stamina"
	StaminaPill2
		name="Strong Stamina Pill"
		icon_state="6"
		HowMuchCured=1000
		PlacementWeight=5
		Gift="Stamina"
	StaminaPill3
		name="Heavy Stamina Pill"
		icon_state="6"
		HowMuchCured=2500
		PlacementWeight=10
		Gift="Stamina"
	ChakraPill1
		name="Chakra Pill"
		icon_state="6"
		HowMuchCured=1000
		PlacementWeight=3
		Gift="Chakra"
	ChakraPill2
		name="Strong Chakra Pill"
		icon_state="6"
		HowMuchCured=2000
		PlacementWeight=5
		Gift="Chakra"
	ChakraPill3
		name="Heavy Chakra Pill"
		icon_state="6"
		HowMuchCured=4000
		PlacementWeight=10
		Gift="Chakra"
	ReservoirPill
		name="Reservoir Pills"
		icon_state="6"
		HowMuchCured=1000
		PlacementWeight=30
		Gift="Chakra Pool"
	WillpowerPill1
		name="Willpower Pill"
		icon_state="6"
		HowMuchCured=0.5
		Gift="Willpower"
	WillpowerPill2
		name="Strong Willpower Pill"
		icon_state="6"
		HowMuchCured=1.5
		Gift="Willpower"
	WillpowerPill3
		name="Heavy Willpower Pill"
		icon_state="6"
		HowMuchCured=3
		Gift="Willpower"
	BloodPill
		name="Blood Pill"
		icon_state="6"
		HowMuchCured=3
		Gift="blood"
//////////////////////////////////////////////////////
//Soldier Pill
obj/Soup
	name = "Soldier Pill"
	icon = 'Food.dmi'
	icon_state="6"
	verb
		Eat()
			usr<<"You eat the [src]!"
			if(usr.stamina<0)
				usr.stamina=0
			if(usr.stamina<usr.maxstamina)
				usr.stamina+=usr.maxstamina*0.8
			usr.calories+=500
			usr.hunger=0
			usr.thirst=0
			del(src)
		Drop()
			src.loc=locate(usr.x,usr.y-1,usr.z)
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up a [src]"
////////////////////////////////////////////////////////////////////
//Drinks
///////////////////////////////////////////////////////////////////
obj/Drinks
	icon = 'Pepsi.dmi'
	var
		HowMuchThirstCured=0
		HowMuchCaloriesGiven=0
		FoodTimeInSeconds=0
	verb
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up [src]"
		Drink()
			if(usr.knockedout||usr.Frozen)
				return
			usr<<"You relax as you begin to drink some [src]."
			usr.Frozen=1
			var/EatingTime=src.FoodTimeInSeconds*10
			sleep(EatingTime)
			if(usr.thirst==0&&!usr.Clan=="Ketsueki")
				usr<<"You feel like you're about to overflow!";usr.health=0;usr.Frozen=0;return
			usr.Frozen=0
			usr<<"You finished drinking."
			if(usr.Clan=="Satou"&&src.name=="Sake")
				if(prob(40))
					usr<<"You begin to feel the effects of your drinking...."
					usr.SatouDrunk=1
					usr.EffectsofDrinking=1
					usr.Suiken=1
					if(prob(10))
						usr.Drunk+=0.1
					if(usr.Drunk>=10)
						usr.Drunk=10;
					if(prob(7))
						usr.LostBuzz+=0.1
					if(usr.LostBuzz>=10)
						usr.LostBuzz=10;
			usr.calories+=src.HowMuchCaloriesGiven
			if(usr.ChakraPool<usr.MaxChakraPool)
				usr.ChakraPool+=(src.HowMuchThirstCured*10)
			if(usr.Clan!="Ketsueki")
				usr.thirst-=src.HowMuchThirstCured
				if(usr.thirst<0)
					usr.thirst=0
			usr.stamina+=src.HowMuchCaloriesGiven*10
			if(usr.stamina>=usr.maxstamina*1.1)
				usr.stamina=usr.maxstamina*1.1
			usr.SatouDrunkBoost()
			del(src)
		Drop()
			src.loc=locate(usr.x,usr.y-1,usr.z)
	Sake
		name="Sake"
		icon_state="Sake"
		HowMuchThirstCured=20
		HowMuchCaloriesGiven=10
		FoodTimeInSeconds=5
		PlacementWeight=10
	Pepsi
		name="Pepsi"
		icon_state="Pepsi"
		HowMuchThirstCured=20
		HowMuchCaloriesGiven=100
		FoodTimeInSeconds=10
		PlacementWeight=15
	Dew
		name="Mt.Dew"
		icon_state="Dew"
		HowMuchThirstCured=50
		HowMuchCaloriesGiven=200
		FoodTimeInSeconds=15
		PlacementWeight=20
	Water
		icon_state="Water"
		HowMuchThirstCured=35
		HowMuchCaloriesGiven=10
		FoodTimeInSeconds=12
		PlacementWeight=25

mob/proc/SatouDrunkBoost()
	if(src.SatouDrunk==1)
		src.nin=src.Mnin*1.3
		src.tai=src.Mtai*1.3
		src.gen=src.Mgen*1.3
		src.EnduranceAddOn+=100
		var/Q=120//how long it lastes in seconds.
//		src.EnduranceAddOn+=100
		var/RS=src.RunningSpeed;
		var/PSS=src.reflexNew
		while(src.SatouDrunk==1&&Q!=0)
			if(src.LostBuzz!=10)
				var/Maxxxx=src.LostBuzz+4//makes it so screen spin less with more drinking.
				var/randz=rand(1,Maxxxx)
				if(randz>=4)
					src.client:dir=NORTH
				if(randz==3)
					src.client:dir=SOUTH
				if(randz==2)
					src.client:dir=WEST
				if(randz==1)
					src.client:dir=EAST
			if(src.EffectsofDrinking==1)
				src.RunningSpeed=5;//Makes it so the Satou is always running while drunk.
			if(src.Suiken==1)
				src.reflexNew=3
			sleep(25)
			Q--
		Q=120;
		src.client:dir=NORTH
		src<<"You lose your buzz...."
		src.nin=src.Mnin
		src.tai=src.Mtai
		src.gen=src.Mgen
		src.EnduranceAddOn-=100
		src.RunningSpeed=RS;
		src.reflexNew=PSS;
		src.EffectsofDrinking=0
		src.Suiken=0
		src.SatouDrunk=0
		return