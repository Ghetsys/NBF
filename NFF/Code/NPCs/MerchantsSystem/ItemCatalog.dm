//Realistic consideration with Pricing.
//Kishimoto has described 1 Ryo = 10 Yen in Japanese.
//The average shirt in Japan is about 250 Yen - 1,500 the most.
//Meaning in Ryo the average shirts will be 25 to 150 depending on quality.
//Also:
//
/*
"The rewards for these range from 5,000 ryo- for a simple D-rank mission to
more than 1,000,000 ryo- for an S-rank mission." From Narutowikia and Kishimoto.
*/
/*For swords:
"The art blades run from about 8,500 to 25,000 yen. (86 - 254 dollars)
The practical blades run from 48,000 to 73,000 yen. (488 - 743 dollars) (Not including the 880,000 yen one!)"

//In Ryo 850-2500 would be unusuable swords that are merely art.
//Actual usuable swords are 4800 to 7300.

//Now an actual Katana would range from 16k-20k in Ryo.

//So when placing the price for a Weapon it'd range from 4800 to 84,000 at the most.
//Gotta find a nice me
dium somehow.
*/
obj/BuyableThings
	icon='Icons/Hud/wskillcards.dmi'
	layer=MOB_LAYER+999
	var
		Price=100//Price you buy it at.
		ObjectNumber=1//DO NOT edit this. This is used for designing.
		Tax=0
		//When the objects come up after shopping it allows them to be tiled next
		//to each other.
	Cancel
		icon_state="Cancel"
		Click()
			usr<<sound('SFX/click1.wav',0)
			usr.alreadytalkingtohim=0
			for(var/obj/BuyableThings/Clothing/A in usr.client.screen)
				del(A)
			for(var/obj/BuyableThings/Weapons/A in usr.client.screen)
				del(A)
			for(var/obj/BuyableThings/Food/A in usr.client.screen)
				del(A)
			for(var/obj/BuyableThings/Pills/A in usr.client.screen)
				del(A)
			for(var/obj/BuyableThings/Scrolls/A in usr.client.screen)
				del(A)
			for(var/obj/BuyableThings/Supplies/A in usr.client.screen)
				del(A)
			for(var/obj/BuyableThings/NinjaCash/A in usr.client.screen)
				del(A)
			del(src)
	Clothing//Clothing category
//1500 is the maximum any normal clothing wear will cost in Yen.
		Headband
			icon_state="Headband"
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/Headband/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		LightArmor
			icon_state="Cloak"
			Price=80000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(locate(/obj/Clothes/LightArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/BalancedArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/HeavyArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/ANBUArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/LightArmor/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		BalancedArmor
			icon_state="Cloak"
			Price=80000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(locate(/obj/Clothes/LightArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/BalancedArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/HeavyArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/ANBUArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/BalancedArmor/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		HeavyArmor
			icon_state="Cloak"
			Price=80000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(locate(/obj/Clothes/LightArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/BalancedArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/HeavyArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/ANBUArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/HeavyArmor/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		AnbuArmor
			icon_state="Cloak"
			Price=150000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(locate(/obj/Clothes/LightArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/BalancedArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/HeavyArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							else if(locate(/obj/Clothes/ANBUArmor) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/ANBUArmor/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		AnbuHandGuards
			icon_state="Cloak"
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
			//				if(locate(/obj/Clothes/LightArmor) in usr.contents)
			//					usr<<"Sorry, you can only buy one armor at a time.";return
			//				else if(locate(/obj/Clothes/BalancedArmor) in usr.contents)
			//					usr<<"Sorry, you can only buy one armor at a time.";return
			//				else if(locate(/obj/Clothes/HeavyArmor) in usr.contents)
			//					usr<<"Sorry, you can only buy one armor at a time.";return
							if(locate(/obj/Clothes/ANBUHandGuards) in usr.contents)
								usr<<"Sorry, you can only buy one armor at a time.";return
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/ANBUHandGuards/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Cloak
			icon_state="Cloak"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/NewCloak/C=new();C.loc=usr
							usr<<sound('SFX/Cash.wav')
							StartOver
							switch(input(usr,"Would you like me to dye the cloak a certain color for only 10,000 Ryo?") in list ("Yes","No thanks"))
								if("Yes")
									if(usr.Yen<10000)
										usr<<"You don't have enough money!"
										return
									else
										var/R=input(usr,"How much red? (0 to 200)") as num
										var/G=input(usr,"How much green? (0 to 200)") as num
										var/B=input(usr,"How much blue? (0 to 200)") as num
										if(R>200) R=200
										if(G>200) G=200
										if(B>200) B=200
										var/obj/I=new()
										I.icon='Icons/New Base/Clothing/cloak3.dmi'
										I.icon+=rgb(R,G,B)
										var/location=locate(usr.x,usr.y+1,usr.z)
										var/image/I2=image(I,location,"",100,SOUTH)
										usr<<I2
										var/YesNo=input("Is this good?") in list("Yes","No")
										if(YesNo=="Yes")
											usr.Yen-=10000
											C.shirtred=R;C.shirtgreen=G;C.shirtblue=B
											del(I2)
										if(YesNo=="No")
											del(I2)
											goto StartOver
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Cape
			icon_state="Cape"
			Price=75000
			Click()
				if(!(usr.key in Subscribers))
					usr<<"Will be available soon!"
					return
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/Cape/C=new();C.loc=usr
							usr<<sound('SFX/Cash.wav')
							StartOver
							switch(input(usr,"Would you like me to dye the cape a certain color for only 15,000 Ryo?") in list ("Yes","No thanks"))
								if("Yes")
									if(usr.Yen<15000)
										usr<<"You don't have enough money!"
										return
									else
										var/R=input(usr,"How much red? (0 to 200)") as num
										var/G=input(usr,"How much green? (0 to 200)") as num
										var/B=input(usr,"How much blue? (0 to 200)") as num
										if(R>200) R=200
										if(G>200) G=200
										if(B>200) B=200
										var/obj/I=new()
										I.icon='Icons/New Base/Clothing/Cloak.dmi'
										I.icon+=rgb(R,G,B)
										var/location=locate(usr.x,usr.y+1,usr.z)
										var/image/I2=image(I,location,"",100,SOUTH)
										usr<<I2
										var/YesNo=input("Is this good?") in list("Yes","No")
										if(YesNo=="Yes")
											usr.Yen-=10000
											C.shirtred=R;C.shirtgreen=G;C.shirtblue=B
											del(I2)
										if(YesNo=="No")
											del(I2)
											goto StartOver
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		BeginnerFishingRod
			icon_state="BeginnerFishingRod"
			Price=150000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/BeginnerFishingRod/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		ModerateFishingRod
			icon_state="ModerateFishingRod"
			Price=300000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(usr.FishingSkill>=30)
								usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
								var/obj/ModerateFishingRod/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								return
							else
								usr<<"There's no point in selling this to someone who doesn't have enough skill at Fishing.";return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		ExpertFishingRod
			icon_state="ExpertFishingRod"
			Price=500000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(usr.FishingSkill>=60)
								usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
								var/obj/ExpertFishingRod/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								return
							else
								usr<<"There's no point in selling this to someone who doesn't have enough skill at Fishing.";return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		BadassFishingRod
			icon_state="ExpertFishingRod"
			Price=5000000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							if(usr.FishingSkill>=85)
								usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
								var/obj/BadassFishingRod/B=new();B.loc=usr
								usr<<sound('SFX/Cash.wav')
								return
							else
								usr<<"There's no point in selling this to someone who doesn't have enough skill at Fishing.";return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		NinjaHat
			icon_state="Ninja Hat"
			Price=50000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/NewHat/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SunGlasses
			icon_state="Shades"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/SunGlasses/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		C00L_SunGlasses
			icon_state="Shades"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/C00LSunGlasses/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Turban
			icon_state="Turban"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/Turban/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Left_Eyepatch
			icon_state="Eyepatch"
			Price=340
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/LeftEyepatch/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Right_Eyepatch
			icon_state="Eyepatch"
			Price=340
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/RightEyepatch/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Goggles_Orange
			icon_state="Goggles"
			Price=2250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/GogglesOrange/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Goggles_Blue
			icon_state="GogglesBlue"
			Price=2250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/GogglesBlue/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Range_Extender
			icon_state="RangeExtender"
			Price=100000
			Click()
				if(!(usr.key in Subscribers))
					usr<<"Range Extender will be available soon!"
					return
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/RangeExtender/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Mouth_Mask
			icon_state="FaceMask"
			Price=800
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/FaceMask/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Mouth_Mask_Blue
			icon_state="FaceMaskBlue"
			Price=890
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=80;var/red=0;var/green=0
							var/obj/Clothes/FaceMask/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Face_Wrappings
			icon_state="Eyepatch"
			Price=2100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/FaceW2/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Mouth_Breather
			icon_state="Eyepatch"
			Price=7550
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/MouthBreather/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Eye_Scope
			icon_state="Eyepatch"
			Price=4500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/EyeScope/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Black_Scarf
			icon_state="BlackScarf"
			Price=340
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/Scarf/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Gray_Scarf
			icon_state="DarkGrayScarf"
			Price=340
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=85;var/red=85;var/green=85
							var/obj/Clothes/Scarf/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gray_Scarf
			icon_state="GrayScarf"
			Price=340
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=100;var/red=100;var/green=100
							var/obj/Clothes/Scarf/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		White_Scarf
			icon_state="WhiteScarf"
			Price=340
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=150;var/red=150;var/green=150
							var/obj/Clothes/Scarf/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Black_Shirt
			icon_state="BlackShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Gray_Shirt
			icon_state="DarkGrayShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=50;var/red=50;var/green=50
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gray_Shirt
			icon_state="GrayShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=80;var/red=80;var/green=80
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		White_Shirt
			icon_state="WhiteShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=222;var/red=222;var/green=222
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Blue_Shirt
			icon_state="DarkBlueShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=21;var/green=38;var/blue=61
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Blue_Shirt
			icon_state="BlueShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=0;var/blue=130
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sky_Blue_Shirt
			icon_state="SkyBlueShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=95;var/green=130;var/blue=247//was 255
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Red_Shirt
			icon_state="DarkRedShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=100;var/green=0;var/blue=0
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Red_Shirt
			icon_state="RedShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=225;var/green=30;var/blue=30
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Red_Shirt
			icon_state="LightRedShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=200;var/green=50;var/blue=0
							var/red=245;var/green=100;var/blue=80
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Green_Shirt
			icon_state="DarkGreenShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=38;var/green=61;var/blue=21
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Green_Shirt
			icon_state="GreenShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=135;var/blue=0
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Green_Shirt
			icon_state="LightGreenShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=50;var/green=200;var/blue=0
							var/red=0;var/green=236;var/blue=79
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Yellow_Shirt
			icon_state="YellowShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=185;var/green=185;var/blue=25
							var/red=225;var/green=225;var/blue=16
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Orange_Shirt
			icon_state="OrangeShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=100;var/green=100;var/blue=10
							var/red=255;var/green=154;var/blue=0
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pink_Shirt
			icon_state="PinkShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
				//			var/red=200;var/green=80;var/blue=150
							var/red=200;var/green=80;var/blue=150
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Purple_Shirt
			icon_state="PurpleShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=160;var/green=132;var/blue=140
							var/red=95;var/green=40;var/blue=150
							var/obj/Clothes/Shirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Black_Sleeveless_Shirt
			icon_state="BlackSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Gray_Sleeveless_Shirt
			icon_state="DarkGraySleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/blue=85;var/red=85;var/green=85
							var/blue=65;var/red=65;var/green=65
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gray_Sleeveless_Shirt
			icon_state="GraySleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
					//		var/blue=100;var/red=100;var/green=100
							var/blue=85;var/red=85;var/green=85
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		White_Sleeveless_Shirt
			icon_state="WhiteSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=150;var/red=150;var/green=150
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Blue_Sleeveless_Shirt
			icon_state="DarkBlueSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

						//	var/red=0;var/green=0;var/blue=61
							var/red=10;var/green=10;var/blue=134
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Blue_Sleeveless_Shirt
			icon_state="BlueSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
					//		var/red=0;var/green=0;var/blue=130
							var/red=0;var/green=42;var/blue=176
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sky_Blue_Sleeveless_Shirt
			icon_state="SkyBlueSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=25;var/green=75;var/blue=255
							var/red=65;var/green=65;var/blue=220
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Red_Sleeveless_Shirt
			icon_state="DarkRedSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=61;var/green=38;var/blue=21
							var/red=132;var/green=5;var/blue=5
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Red_Sleeveless_Shirt
			icon_state="RedSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
					//		var/red=135;var/green=0;var/blue=0
							var/red=148;var/green=26;var/blue=26
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Red_Sleeveless_Shirt
			icon_state="LightRedSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=50;var/blue=0
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Green_Sleeveless_Shirt
			icon_state="DarkGreenSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=38;var/green=61;var/blue=21
							var/red=42;var/green=92;var/blue=8
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Green_Sleeveless_Shirt
			icon_state="GreenSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=155;var/blue=0
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Green_Sleeveless_Shirt
			icon_state="LightGreenSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=50;var/green=200;var/blue=0
							var/red=0;var/green=135;var/blue=0
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Yellow_Sleeveless_Shirt
			icon_state="YellowSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=185;var/green=185;var/blue=25
							var/red=165;var/green=165;var/blue=25
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Orange_Sleeveless_Shirt
			icon_state="OrangeSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=100;var/green=100;var/blue=10
							var/red=230;var/green=143;var/blue=28
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pink_Sleeveless_Shirt
			icon_state="PinkSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=80;var/blue=150
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Purple_Sleeveless_Shirt
			icon_state="PurpleSleevelessShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
						//	var/red=160;var/green=132;var/blue=140
							var/red=135;var/green=7;var/blue=166
							var/obj/Clothes/SleevelessShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Black_Neckband_Shirt
			icon_state="BlackNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Gray_Neckband_Shirt
			icon_state="DarkGrayNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=85;var/red=85;var/green=85
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gray_Neckband_Shirt
			icon_state="GrayNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=100;var/red=100;var/green=100
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		White_Neckband_Shirt
			icon_state="WhiteNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=150;var/red=150;var/green=150
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Blue_Neckband_Shirt
			icon_state="DarkBlueNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=21;var/green=38;var/blue=61
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Blue_Neckband_Shirt
			icon_state="BlueNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=0;var/blue=130
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sky_Blue_Neckband_Shirt
			icon_state="SkyBlueNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=25;var/green=75;var/blue=255
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Red_Neckband_Shirt
			icon_state="DarkRedNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=61;var/green=38;var/blue=21
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Red_Neckband_Shirt
			icon_state="RedNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=135;var/green=0;var/blue=0
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Red_Neckband_Shirt
			icon_state="LightRedNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=50;var/blue=0
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Green_Neckband_Shirt
			icon_state="DarkGreenNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=38;var/green=61;var/blue=21
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Green_Neckband_Shirt
			icon_state="GreenNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=135;var/blue=0
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Green_Neckband_Shirt
			icon_state="LightGreenNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=50;var/green=200;var/blue=0
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Yellow_Neckband_Shirt
			icon_state="YellowNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=185;var/green=185;var/blue=25
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Orange_Neckband_Shirt
			icon_state="OrangeNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=100;var/green=100;var/blue=10
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pink_Neckband_Shirt
			icon_state="PinkNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=80;var/blue=150
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Purple_Neckband_Shirt
			icon_state="PurpleNeckbandShirt"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=160;var/green=132;var/blue=140
							var/obj/Clothes/SasukeShirt/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Black_Pants
			icon_state="BlackPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Gray_Pants
			icon_state="DarkGrayPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=85;var/red=85;var/green=85
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gray_Pants
			icon_state="GrayPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=100;var/red=100;var/green=100
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		White_Pants
			icon_state="WhitePants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=150;var/red=150;var/green=150
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Blue_Pants
			icon_state="DarkBluePants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=21;var/green=38;var/blue=61
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Blue_Pants
			icon_state="BluePants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=0;var/blue=130
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sky_Blue_Pants
			icon_state="SkyBluePants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=25;var/green=75;var/blue=255
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Red_Pants
			icon_state="DarkRedPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=61;var/green=38;var/blue=21
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Red_Pants
			icon_state="RedPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=135;var/green=0;var/blue=0
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Red_Pants
			icon_state="LightRedPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=50;var/blue=0
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Green_Pants
			icon_state="DarkGreenPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=38;var/green=61;var/blue=21
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Green_Pants
			icon_state="GreenPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=135;var/blue=0
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Green_Pants
			icon_state="LightGreenPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=50;var/green=200;var/blue=0
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Yellow_Pants
			icon_state="YellowPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=185;var/green=185;var/blue=25
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Orange_Pants
			icon_state="OrangePants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=100;var/green=100;var/blue=10
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pink_Pants
			icon_state="PinkPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=80;var/blue=150
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Purple_Pants
			icon_state="PurplePants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=160;var/green=132;var/blue=140
							var/obj/Clothes/Pants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Black_Baggy_Pants
			icon_state="BlackBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=0;var/red=0;var/green=0
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Gray_Baggy_Pants
			icon_state="DarkGrayBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=85;var/red=85;var/green=85
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gray_Baggy_Pants
			icon_state="GrayBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=100;var/red=100;var/green=100
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		White_Baggy_Pants
			icon_state="WhiteBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/blue=150;var/red=150;var/green=150
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Blue_Baggy_Pants
			icon_state="DarkBlueBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=21;var/green=38;var/blue=61
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Blue_Baggy_Pants
			icon_state="BlueBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=0;var/blue=130
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sky_Blue_Baggy_Pants
			icon_state="SkyBlueBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=25;var/green=75;var/blue=255
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Red_Baggy_Pants
			icon_state="DarkRedBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=61;var/green=38;var/blue=21
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Red_Baggy_Pants
			icon_state="RedBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=135;var/green=0;var/blue=0
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Red_Baggy_Pants
			icon_state="LightRedBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=50;var/blue=0
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dark_Green_Baggy_Pants
			icon_state="DarkGreenBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/red=38;var/green=61;var/blue=21
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Green_Baggy_Pants
			icon_state="GreenBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=135;var/blue=0
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Green_Baggy_Pants
			icon_state="LightGreenBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=50;var/green=200;var/blue=0
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Yellow_Baggy_Pants
			icon_state="YellowBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=185;var/green=185;var/blue=25
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Orange_Baggy_Pants
			icon_state="OrangeBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=100;var/green=100;var/blue=10
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pink_Baggy_Pants
			icon_state="PinkBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=200;var/green=80;var/blue=150
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Purple_Baggy_Pants
			icon_state="PurpleBaggyPants"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=160;var/green=132;var/blue=140
							var/obj/Clothes/BaggyPants/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gloves
			icon_state="Gloves"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/Gloves/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sleeves
			icon_state="Gloves"
			Price=500
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/Sleeves/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Shoes
			icon_state="Shoes"
			Price=150
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Clothes/Shoes/B=new();B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Gourd
			icon_state="Gourd"
			Price=200
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafCTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundCTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockCTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainCTax/10)
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/red=0;var/green=0;var/blue=0
							var/obj/Clothes/Gourd/B=new();B.shirtblue=blue;B.shirtgreen=green;B.shirtred=red;B.loc=usr
							usr<<sound('SFX/Cash.wav')
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
	Weapons//Weapon category
//Throwing Type
		Bow
			icon_state="Bow"
			Price=250000
			Click()
				Price=250000
				if(usr.key!="CobraT1337"||!usr.Subscriber)
					usr<<"Will be able to be purchased very soon!";return
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Bow/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai
			icon_state="Kunai"
			Price=1885
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No"))
					if("Yes")
						var/give = input(usr,"How many [src.name] do you wish to buy?")as num
						if(give >= 101)
							usr<<"You cannot purchase more than 100 [src.name] at a time.";return
						if(usr.Yen >= give*src.Price&&give>0)
							usr<<sound('SFX/Cash.wav')
							usr.Yen -= give*src.Price
							var/counter=0
							for(var/obj/WEAPONS/Kunai/O in usr.contents)
								counter+=1
							if(counter<=0)
								var/obj/WEAPONS/Kunai/B = new();B.loc = usr;B.ammount+=give;B.name= "[B.name]"
							else
								for(var/obj/WEAPONS/Kunai/O in usr.contents)
									O.ammount+=give
									O.name= "[O.name]"
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
						else
							usr<<"Not enough money!"
							return
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Bo_Shuriken
			icon_state="Kunai"
			Price=1900
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Katana/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Shuriken
			name="Four-Star Shuriken"
			icon_state="Shuriken"
			Price=1600
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Clan=="Kiro"&&usr.ShurikenMastery<=30)
					usr<<"Oh! I see you're a Kiro! Well, I'll be nice and give you a discount so you can train for a while."
					Price=750

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						var/give = input(usr,"How many [src.name] do you wish to buy?")as num
						if(give >= 101)
							usr<<"You cannot purchase more than 100 [src.name] at a time.";return
						if(usr.Yen >= give*src.Price&&give>0)
							usr<<sound('SFX/Cash.wav')
							usr.Yen -= give*src.Price
							var/counter=0
							for(var/obj/WEAPONS/Shuriken/O in usr.contents)
								counter+=1
							if(counter<=0)
								var/obj/WEAPONS/Shuriken/B = new();B.loc = usr;B.ammount+=give;B.name= "[B.name]"
							else
								for(var/obj/WEAPONS/Shuriken/O in usr.contents)
									O.ammount+=give
									O.name= "[O.name]"
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
						else
							usr<<"Not enough money!"
							return
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Windmill_Shuriken
			icon_state="WShuriken"
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price

							var/obj/WEAPONS/WindmillShuriken/B=locate(/obj/WEAPONS/WindmillShuriken) in usr.contents
							if(B)
								B.ammount++
								usr<<"You have [B.ammount] windmill shurikens total."
							else
								B=new /obj/WEAPONS/WindmillShuriken
								B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Senbon
			icon_state="Senbon"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						var/give = input(usr,"How many [src.name] do you wish to buy?")as num
						if(give >= 101)
							usr<<"You cannot purchase more than 100 [src.name] at a time.";return
						if(usr.Yen >= give*src.Price&&give>0)
							usr<<sound('SFX/Cash.wav')
							usr.Yen -= give*src.Price
							var/counter=0
							for(var/obj/WEAPONS/Senbon/O in usr.contents)
								counter+=1
							if(counter<=0)
								var/obj/WEAPONS/Senbon/B = new();B.loc = usr;B.ammount+=give;B.name= "[B.name]"
							else
								for(var/obj/WEAPONS/Senbon/O in usr.contents)
									O.ammount+=give
									O.name= "[O.name]"
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
						else
							usr<<"Not enough money!"
							return
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

//Katana Type
		Melee_Kunai
			icon_state="Kunai"
			Price=2000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/MeleeKunai/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		KnuckleKnives
			icon_state="KnuckleKnives"
			Price=10000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/KnuckleKnives/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Katana
			icon_state="Katana"
			Price=16000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Katana/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chakra_Convertable_Katana
			icon_state="Katana"
			Price=46450
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Katana/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ninjato
			icon_state="Ninjato"
			Price=24800
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Ninjato/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chakra_Convertable_Ninjato
			icon_state="Ninjato"
			Price=74800
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Katana/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Tachi
			icon_state="Tachi"
			Price=4800
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Tachi/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Tanto
			icon_state="Tanto"
			Price=8000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Tanto/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kodachi
			icon_state="Kodachi"
			Price=18000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Kodachi/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kubiriki_Houchou
			icon_state="KubirikiHouchou"
			Price=84000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/KubirikiHouchou/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Berserker
			icon_state="Berserker"
			Price=80000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Berserker/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
//Staff Type
		Hanbo_Staff
			icon_state="HanboStaff"
			Price=2500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/BoStaff/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Round_Bo_Staff
			icon_state="BoStaff"
			Price=2500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/BoStaff/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Four_Sided_Bo_Staff
			icon_state="BoStaff"
			Price=3500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/FourSidedBoStaff/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Six_Sided_Bo_Staff
			icon_state="BoStaff"
			Price=2500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/SixSidedBoStaff/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Eight_Sided_Bo_Staff
			icon_state="BoStaff"
			Price=10500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/EightSidedBoStaff/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Nunchuks
			icon_state="Nunchuks"
			Price=10500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/WEAPONS/Nunchuks/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return


	Supplies//Supplies category
		KunaiBomb
			icon_state="smokebomb"
			Price=50000
			Click()
				if(usr.key!="CobraT1337"&&!usr.Subscriber)
					usr<<"Will be able to be purchased very soon!";return
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Proxy_Bomb/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SmokeBomb
			icon_state="smokebomb"
			Price=25000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/NinjaEquipment/SmokeBomb/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		ChakraPaper
			icon_state="ChakraPaper"
			Price=8000
			Click()
				usr<<"Sorry this is not for sale."
				return
				/*
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/NinjaEquipment/ChakraPaper/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return*/
		Makibishi
			icon_state="Makibishi"
			Price=300
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
				//			usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/give = input(usr,"How many Makibishi do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*src.Price
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
								var/counter=0
								for(var/obj/Makibishi/O in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/Makibishi/B = new/obj/Makibishi
									B.loc = usr
									B.ammount+=give
									B.name= "Makibishi ([B.ammount])"
								else
									for(var/obj/Makibishi/O in usr.contents)
										O.ammount+=give
										O.name= "Makibishi ([O.ammount])"
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Arame
			icon_state="Wire"
			Price=400
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"O [src.name] Custa [y2k_Uncondense_Num(src.Price)] de Ryo. Deseja comprar?", text) in list ("Sim","No."))
					if("Sim")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);
		//					usr<<sound('SFX/Cash.wav');
		//					usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/give = input(usr,"How many Wires do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								if(give>40)
									usr<<"You can't have more than 40 wires.";return
								if(give<0)
									world<<"<font color=red>[usr] attempted to buy a negative amount of Wires as a money glitch. He wanted to buy [give] to gain [give*Price*(-1)] Ryo.</font>. His key is [usr.key]"
								else
									for(var/obj/RandomEquipment/Arame/B in usr.contents)
										if(B.ammount>39)
											usr<<"Wait, it looks like you can't hold anymore Wires! You can only hold 40 at a time.";return
										if(B.ammount+give>39)
											usr<<"Wait, it looks like you can't hold anymore Wires! You can only hold 40 at a time.";return
									usr<<sound('SFX/Cash.wav')
									usr.Yen -= give*src.Price
									if(usr.Village=="Leaf") LeafVillagePool+=Tax
									if(usr.Village=="Sound") SoundVillagePool+=Tax
									if(usr.Village=="Rock") RockVillagePool+=Tax
									if(usr.Village=="Rain") RainVillagePool+=Tax
									var/counter=0
									for(var/obj/RandomEquipment/Arame/B in usr.contents)
										counter+=1
									if(counter<=0)
										var/obj/RandomEquipment/Arame/B=new()
										B.loc=usr
										B.Ammount+=give
										B.ReCheckAmount()
									else
										for(var/obj/RandomEquipment/Arame/O in usr.contents)
											O.Ammount+=give
											if(O.Ammount>=40)
												O.Ammount=40
											O.ReCheckAmount()
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ointment
			icon_state="Ointment"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"[src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							var/give = input(usr,"How many [src] do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								if(give>50)
									usr<<"You can't have more than 50 packs of Ointment.";return
								if(give<0)
									world<<"<font color=red>[usr] attempted to buy a negative amount of Ointments as a money glitch. He wanted to buy [give] to gain [give*Price*(-1)] Ryo.</font>. His key is [usr.key]"
									return
								for(var/obj/NinjaEquipment/Ointment/B in usr.contents)
									if(B.ammount>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
									if(B.ammount+give>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*src.Price
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
								var/counter=0
								for(var/obj/NinjaEquipment/Ointment/B in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/NinjaEquipment/Ointment/B=new()
									B.loc=usr
									B.ammount+=give
									B.CheckAmount()
								else
									for(var/obj/NinjaEquipment/Ointment/O in usr.contents)
										O.ammount+=give
										O.CheckAmount()
		Healthpack
			icon_state="Healthpack"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"[src.name] costs [src.Price] Ryo. Do you wish to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							var/give = input(usr,"How many [src] do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								if(give>50)
									usr<<"You can't have more than 50 packs of Ointment.";return
								if(give<0)
									world<<"<font color=red>[usr] attempted to buy a negative amount of Healthpacks as a money glitch. He wanted to buy [give] to gain [give*Price*(-1)] Ryo. His key is [usr.key]</font>"
									return
								for(var/obj/NinjaEquipment/Healthpack/B in usr.contents)
									if(B.ammount>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
									if(B.ammount+give>49)
										usr<<"Wait, it looks like you can't hold anymore Ointment! You can only hold 50 at a time.";return
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*src.Price
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
								var/counter=0
								for(var/obj/NinjaEquipment/Healthpack/B in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/NinjaEquipment/Healthpack/B=new()
									B.loc=usr
									B.ammount+=give
									B.CheckAmount()
								else
									for(var/obj/NinjaEquipment/Healthpack/O in usr.contents)
										O.ammount+=give
										O.CheckAmount()
		ExplodingTag
			icon_state="exptag"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"These are exploding tags. You can place them down, then click on them to activate the explosion or learn a jutsu to activate them all at once. They cost 1000 Ryo a piece. Want some?", text) in list ("Yes","No"))
					if("Yes")
						var/HowMany=input(usr,"Alrighty then, how many would you like?") as num
						if(HowMany*Price>usr.Yen)
							usr<<"Sorry, you can't afford that many.."
							return
						if(HowMany<0)
							world<<"<font color=red>[usr] attempted to buy a negative amount of Exploding tags as a money glitch. He wanted to buy [HowMany] to gain [HowMany*Price*(-1)] Ryo. His key is [usr.key] </font>"
							return
						else
							usr<<sound('SFX/Cash.wav')
							usr.Yen-=HowMany*Price
							if(locate(/obj/ExplodingTag) in usr.contents)
								for(var/obj/ExplodingTag/O in usr.contents)
									O.ammount+=HowMany
									O.name= "Exploding Tag ([O.ammount])"
									break
							else
								var/obj/ExplodingTag/B=new()
								B.loc=usr;B.ammount+=HowMany
								if(usr.Village=="Leaf") LeafVillagePool+=Tax
								if(usr.Village=="Sound") SoundVillagePool+=Tax
								if(usr.Village=="Rock") RockVillagePool+=Tax
								if(usr.Village=="Rain") RainVillagePool+=Tax
								B.name= "Exploding Tag ([B.ammount])"
					else
						usr<<sound('SFX/click2.wav',0)
						return

		Paper
			icon_state="Paper"
			Price=100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');
				//			usr<<"You bought a [src.name]!";
				//			usr.Yen-=src.Price
							var/give = input(usr,"How much [src.name] do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*src.Price
								var/counter=0
								for(var/obj/RandomEquipment/Paper/O in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/RandomEquipment/Paper/B=new()
									B.loc=usr
									B.Ammount+=give
									B.ReCheckAmount()
								else
									for(var/obj/RandomEquipment/Paper/O in usr.contents)
										O.Ammount+=give
										O.ReCheckAmount()
										if(usr.Village=="Leaf") LeafVillagePool+=Tax
										if(usr.Village=="Sound") SoundVillagePool+=Tax
										if(usr.Village=="Rock") RockVillagePool+=Tax
										if(usr.Village=="Rain") RainVillagePool+=Tax

							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Poison
			icon_state="Poison"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');
							usr<<"You bought a [src.name]!";
							usr.Yen-=src.Price
							var/obj/RandomEquipment/Poison/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Clay
			icon_state="Clay"
			Price=100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');
	//						usr<<"You bought a [src.name]!";
	//						usr.Yen-=src.Price
							var/give = input(usr,"How much [src.name] do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*src.Price
								var/counter=0
								for(var/obj/RandomEquipment/Argila/O in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/RandomEquipment/Argila/B=new()
									B.loc=usr
									B.Ammount+=give
									B.ReCheckAmount()
									if(usr.Village=="Leaf") LeafVillagePool+=Tax
									if(usr.Village=="Sound") SoundVillagePool+=Tax
									if(usr.Village=="Rock") RockVillagePool+=Tax
									if(usr.Village=="Rain") RainVillagePool+=Tax
								else
									for(var/obj/RandomEquipment/Argila/O in usr.contents)
										O.Ammount+=give
										O.ReCheckAmount()
										if(usr.Village=="Leaf") LeafVillagePool+=Tax
										if(usr.Village=="Sound") SoundVillagePool+=Tax
										if(usr.Village=="Rock") RockVillagePool+=Tax
										if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ink
			icon_state="Ink"
			Price=100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');
						//	usr<<"You bought a [src.name]!";
						//	usr.Yen-=src.Price
							var/give = input(usr,"How much [src.name] do you wish to buy?")as num
							if(usr.Yen>=give*src.Price&&give>0)
								usr<<sound('SFX/Cash.wav')
								usr.Yen -= give*src.Price
								var/counter=0
								for(var/obj/RandomEquipment/Ink/O in usr.contents)
									counter+=1
								if(counter<=0)
									var/obj/RandomEquipment/Ink/B=new()
									B.loc=usr
									B.Ammount+=give
									B.ReCheckAmount()
								else
									for(var/obj/RandomEquipment/Ink/O in usr.contents)
										O.Ammount+=give
										O.ReCheckAmount()
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
	Food
		Red_Apple
			icon_state="RedApple"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Apple/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Yellow_Apple
			icon_state="YellowApple"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Apple2/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Green_Apple
			icon_state="GreenApple"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Apple3/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Orange
			icon_state="Orange"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Orange/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Tangerine
			icon_state="Orange"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Tangerine/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Grapes
			icon_state="Grapes"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Grapes/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pear
			icon_state="Pear"
			Price=150
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Pear/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Potato_Chips
			icon_state="Chips"
			Price=100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Chips/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Healthy_Potato_Chips
			icon_state="Chips"
			Price=100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/HChips/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		BBQ_Potato_Chips
			icon_state="Chips"
			Price=120
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/BBQChips/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sour_Cream_And_Onion_Potato_Chips
			icon_state="Chips"
			Price=120
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/SCOChips/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		PorkFriendRamen
			name="Pork-Friend Ramen"
			icon_state="Ramen"
			Price=400
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/PRamen/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SPorkFriendRamen
			name="Special Pork-Friend Ramen"
			icon_state="Ramen"
			Price=450
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/SRamen/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Quick_Ramen
			icon_state="Ramen"
			Price=340
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/QRamen/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Filling_Ramen
			icon_state="Ramen"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/FRamen/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Calorie_Ramen
			icon_state="Ramen"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CRamen/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Turkey_Hotdog
			icon_state="Hotdog"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/THotDog/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Pork_Hotdog
			icon_state="Hotdog"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/PHotDog/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Special_Hotdog
			icon_state="Hotdog"
			Price=450
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/SpHotDog/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Cheesedog
			icon_state="Cheesedog"
			Price=450
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CHotDog/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chili_Cheesedog
			icon_state="ChiliCheesedog"
			Price=650
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CCHotDog/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Hamburger
			icon_state="Hamburger"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Hamburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chicken_Burger
			icon_state="Hamburger"
			Price=450
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CHamburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Turkey_Burger
			icon_state="Hamburger"
			Price=550
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Tburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Cheeseburger
			icon_state="Cheeseburger"
			Price=350
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Cburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chicken_Cheeseburger
			icon_state="Cheeseburger"
			Price=450
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CCburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Turkey_Cheeseburger
			icon_state="Cheeseburger"
			Price=550
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CTburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Angus_Burger
			icon_state="Cheeseburger"
			Price=750
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Aburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Triple_Beef_Burger
			icon_state="Cheeseburger"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Tburger/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Steak
			icon_state="Steak"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Steak/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Meaty_Steak
			icon_state="Steak"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/MSteak/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Bone_Suckin_Goodass_Steak
			icon_state="Steak"
			Price=2000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/BSSteak/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ribs
			icon_state="Ribs"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Ribs/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Meaty_Ribs
			icon_state="Ribs"
			Price=1000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/MRibs/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Bone_Suckin_Goodass_Ribs
			icon_state="Ribs"
			Price=2000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/BSRibs/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fried_Squid
			icon_state="Squid"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Squid/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Rice
			icon_state="Rice"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Rice/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Riceball
			icon_state="Riceball"
			Price=500
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/Riceball/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Curry_Of_Life_Rice
			icon_state="CurryRice"
			Price=10000
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Food/CurryLife/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return


		Pepsi
			icon_state="Pepsi"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Drinks/Pepsi/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Sake
			icon_state="Sake"
			Price=250
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Drinks/Sake/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Water
			icon_state="Water"
			Price=100
			Click()

				if(usr.Village=="Leaf")
					Tax=Price*(LeafFTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundFTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockFTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainFTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Drinks/Water/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
	Pills
		SoldierPill1
			name="Stamina Pill"
			icon_state="SoldierPill"
			Price=1000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/StaminaPill1/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill2
			name="Strong Stamina Pill"
			icon_state="SoldierPill"
			Price=2500
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/StaminaPill2/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill3
			name="Heavy Stamina Pill"
			icon_state="SoldierPill"
			Price=5000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/StaminaPill3/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill4
			name="Willpower Pill"
			icon_state="SoldierPill"
			Price=5000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/WillpowerPill1/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill5
			name="Strong Willpower Pill"
			icon_state="SoldierPill"
			Price=7500
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/WillpowerPill2/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill6
			name="Heavy Willpower Pill"
			icon_state="SoldierPill"
			Price=10000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/WillpowerPill3/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill7
			name="Chakra Pill"
			icon_state="SoldierPill"
			Price=1000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/ChakraPill1/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill8
			name="Strong Chakra Pill"
			icon_state="SoldierPill"
			Price=1500
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/ChakraPill2/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill9
			name="Heavy Chakra Pill"
			icon_state="SoldierPill"
			Price=3000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/ChakraPill3/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill11
			name="Reservoir Pill"
			icon_state="SoldierPill"
			Price=7500
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/ReservoirPill/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SoldierPill10
			name="BloodPill"
			icon_state="SoldierPill"
			Price=10000
			Click()
				if(usr.Village=="Leaf")
					Tax=Price*(LeafWTax/10)
				if(usr.Village=="Sound")
					Tax=Price*(SoundWTax/10)
				if(usr.Village=="Rock")
					Tax=Price*(RockWTax/10)
				if(usr.Village=="Rain")
					Tax=Price*(RainWTax/10)
				Price=Price+Tax
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Pills/BloodPill/B=new();B.loc=usr
							if(usr.Village=="Leaf") LeafVillagePool+=Tax
							if(usr.Village=="Sound") SoundVillagePool+=Tax
							if(usr.Village=="Rock") RockVillagePool+=Tax
							if(usr.Village=="Rain") RainVillagePool+=Tax
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ketsueki_Blood_Pill
			icon_state="SoldierPill"
			Price=1000
			Click()
				usr<<sound('SFX/click2.wav',0)
		Tension_Pill
			name="Tension Pill"
			icon_state="SoldierPill"
			Price=200000
			Click()
				usr<<sound('SFX/click2.wav',0)
		Determination_Pill
			name="Determination Pill"
			icon_state="SoldierPill"
			Price=500000
			Click()
				usr<<sound('SFX/click2.wav',0)
	Scrolls//Scroll category
		icon_state="Scroll"
		Generative_Scroll
			Price=30000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/GenerativeScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		False_Death_Scroll
			Price=450000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/FalseDeathScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Shadow_Clone_Scroll
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KageBunshinScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Multi_Shadow_Clone_Scroll
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/TajuuKageBunshinScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Exploding_Shadow_Clone_Scroll
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/ExplodingKageBunshinScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Body_Flame_Scroll
			Price=250000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/BodyFlameScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Multiple_Shuriken_Scroll
			Price=500000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/MultipleShurikenScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Multiple_Kunai_Scroll
			Price=500000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/MultipleKunaiScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Raining_Tag_Scroll
			Price=350000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/RainingTagScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chakra_Enhance_Scroll
			Price=25000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/ChakraEnhanceScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai_Barrage_Scroll
			Price=550000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KunaiBarrageScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Weapon_Summoning_Kunai_Scroll
			Price=750000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/WeaponSummoningKunaiScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Expanding_Shuriken_Scroll
			Price=400000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/ExpandingShurikenScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Hair_Needle_Senbon_Scroll
			Price=550000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/HairNeedleSenbonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Weapon_Reverse_Scroll
			Price=38000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/WeaponReverseScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Guiding_Weapon_Scroll
			Price=42000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/GuidingWeaponScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Blazing_Burn_Scroll
			Price=54000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/BlazingBurnScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Karakuri_Scroll
			Price=54000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KarakuriScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Handseal_Seal_Scroll
			Price=75000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/HandsealSealScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Control_Seal_Scroll
			Price=1000000
			Click()//ChakraSealScroll
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/ControlSealScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Chakra_Seal_Scroll
			Price=75000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/ChakraSealScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Five_Element_Seal_Scroll
			Price=3000000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/FiveElementSeal/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		HellSent_Seal_Scroll
			Price=450000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/HellSentSealScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Katon_Generative_Scroll
			Price=30000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/KatonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fireball_Scroll
			Price=25000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/GoukakyuuScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Phoenix_Fire_Scroll
			Price=20000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/HosenkaScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dragon_Fire_Projectile_Scroll
			Price=48000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KaryuuEndanScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fire_Dragon_Scroll
			Price=48000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/RyuukaScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Doton_Generative_Scroll
			Price=30000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/DotonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Hiding_Like_A_Mole_Scroll
			Price=85000
			Click()
				usr<<"disabled"
				return
				/*
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/HidingLikeAMoleScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
				*/
		Fuuton_Generative_Scroll
			Price=30000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/FuutonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Airbender_Scroll_Ichi
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KazeScroll1/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Airbender_Scroll_Ni
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KazeScroll2/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Airbender_Scroll_San
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KazeScroll3/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Airbender_Scroll_Yon
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/KazeScroll4/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Raiton_Generative_Scroll
			Price=30000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/RaitonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Suiton_Generative_Scroll
			Price=30000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/SuitonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Rashoumon_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/RashoumonScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return


//Summons
		Frog_Contract_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/ContractScrolls/Frog_Kingdom_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Slug_Contract_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/ContractScrolls/Slug_Kingdom_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Serpent_Contract_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/ContractScrolls/Serpent_Kingdom_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Canine_Contract_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/ContractScrolls/Canine_Kingdom_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Wolf_Darke_Summoning_Scroll
			Price=85000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Wolf_Darke_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Wolf_Griffin_Summoning_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Wolf_Griffin_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Wolf_Zune_Summoning_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Wolf_Zune_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Wolf_Zute_Summoning_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Wolf_Zute_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Wolf_Coro_Summoning_Scroll
			Price=1000000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Wolf_Coro_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fairy_Contract_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/ContractScrolls/Fairy_Kingdom_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fairy_Joy_Summoning_Scroll
			Price=85000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Fairy_Joy_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fairy_Ene_Summoning_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Fairy_Ene_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fairy_Nega_Summoning_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Fairy_Nega_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fairy_Inf_Summoning_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Fairy_Inf_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Slug_Katsuya_Summoning_Scroll
			Price=10000000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Slug_Katsuya_Summoning_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return










// NINJA CASH STORE ITEMS


	NinjaCash/Scrolls//Scroll category
		icon_state="Scroll"


		NameChangeScroll
			Price = 20
			name="Name Change Scroll"
			Click()
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. Do you want to buy it?",text) in list ("Yes","No"))
					if ("Yes")
						if(usr.NinjaCash>=src.Price)
							usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
							var/obj/NinjaCash/NameChangeScroll/B=new();B.loc=usr
							usr.SaveK()
							return
						else
							usr<<"You dont have enough money."
							return
					if ("No")
						return

		Exp_Scroll
			Price = 40
			name = "25K EXP Scroll X7"
			Click()
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. Do you want to buy it?",text) in list ("Yes","No"))
					if ("Yes")
						if(usr.NinjaCash>=src.Price)
							usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
							var/obj/NinjaCash/ExpScroll/B=new();B.loc=usr
							var/obj/NinjaCash/ExpScroll/C=new();C.loc=usr
							var/obj/NinjaCash/ExpScroll/A=new();A.loc=usr
							var/obj/NinjaCash/ExpScroll/D=new();D.loc=usr
							var/obj/NinjaCash/ExpScroll/E=new();E.loc=usr
							var/obj/NinjaCash/ExpScroll/F=new();F.loc=usr
							var/obj/NinjaCash/ExpScroll/G=new();G.loc=usr
							usr.SaveK()
							return
						else
							usr<<"You dont have enough money."
							return
					if ("No")
						return

		Cooldown_Scroll
			Price = 40
			name = "50K Cooldown Scroll X5"
			Click()
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. Do you want to buy it?",text) in list ("Yes","No"))
					if ("Yes")
						if(usr.NinjaCash>=src.Price)
							usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
							var/obj/NinjaCash/CooldownScroll/A=new(); A.loc=usr
							var/obj/NinjaCash/CooldownScroll/B=new(); B.loc=usr
							var/obj/NinjaCash/CooldownScroll/C=new(); C.loc=usr
							var/obj/NinjaCash/CooldownScroll/D=new(); D.loc=usr
							var/obj/NinjaCash/CooldownScroll/E=new(); E.loc=usr

							usr.SaveK()
							return
						else
							usr<<"You dont have enough money."
							return
					if ("No")
						return

		CharacterbBuildingScroll
			Price = 195
			name = "Character Building Scroll (2 Starting Points and 5 Elemental Points)(One Use per Character)"
			Click()
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. Do you want to buy it?",text) in list ("Yes","No"))
					if ("Yes")
						if(usr.NinjaCash>=src.Price)
							usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
							var/obj/NinjaCash/CharacterBuildingScroll/B=new(); B.loc=usr
							return
						else
							usr<<"You dont have enough money."
							return
					if ("No")
						return

		MangekyouEyeRestore
			Price = 750
			name = "Mangekyou Eye Restore"
			Click()
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. (Heals Mangekyou Eyes to healthy state.) Do you want to buy it?",text) in list ("Yes","No"))
					if ("Yes")
						if(usr.NinjaCash>=src.Price)
							usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
							var/obj/NinjaCash/MangekyouEyeRestore/B=new(); B.loc=usr
							return
						else
							usr<<"You dont have enough money."
							return
					if ("No")
						return
obj/BuyableThings
	Scrolls
		Puppet_Master_Scroll
			Price=25000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Clan!="Basic"&&usr.Clan!="Satou"||usr.Clan!="Satou"&&usr.Clan!="Basic")
							usr<<"I don't think your Clan allows Puppet Masters.";return
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Puppet_Master_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Puppet_Swap_Scroll
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Clan!="Basic"&&usr.Clan!="Satou"||usr.Clan!="Satou"&&usr.Clan!="Basic")
							usr<<"I don't think your Clan allows Puppet Masters.";return
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Puppet_Swap_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Puppet_View_Scroll
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Clan!="Basic"&&usr.Clan!="Satou"||usr.Clan!="Satou"&&usr.Clan!="Basic")
							usr<<"I don't think your Clan allows Puppet Masters.";return
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Puppet_View_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Puppet_Return_Scroll
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Clan!="Basic"&&usr.Clan!="Satou"||usr.Clan!="Satou"&&usr.Clan!="Basic")
							usr<<"I don't think your Clan allows Puppet Masters.";return
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/LearningScrolls/Puppet_Return_Scroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Dragon_Puppet_Scroll
			Price=150000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Summoning_Scrolls/Dragon/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Hawk_Puppet_Scroll
			Price=150000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Summoning_Scrolls/Hawk/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Talon_Puppet_Scroll
			Price=150000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Summoning_Scrolls/Talon/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Structure_Enhancer
			icon_state="Puppet_Piece"
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Structure_Enhancer/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Structure_Enhancer_Lite
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Structure_Enhancer_Lite/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Armor_Enhancer
			icon_state="Puppet_Piece"
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Armor_Enhancer/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Armor_Enhancer_Lite
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Armor_Enhancer_Lite/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Poison_Blades_Attachment
			icon_state="Puppet_Piece"
			Price=50000000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Poison_Blades/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai_Attachment_Beginner
			icon_state="Puppet_Piece"
			Price=500000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Kunai_Attachment_Light/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai_Rapid_Attachment_Beginner
			icon_state="Puppet_Piece"
			Price=425000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Kunai_Rapid_Attachment_Light/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai_Rapid_Attachment_Moderate
			icon_state="Puppet_Piece"
			Price=550000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Kunai_Rapid_Attachment_Medium/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai_Rapid_Attachment_Strong
			icon_state="Puppet_Piece"
			Price=800000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Kunai_Rapid_Attachment_Heavy/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Kunai_Attachment_Moderate
			icon_state="Puppet_Piece"
			Price=500000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Kunai_Attachment_Medium/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Kunai_Attachment_Strong
			icon_state="Puppet_Piece"
			Price=700000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Kunai_Attachment_Heavy/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ice_Spread_Beginner
			icon_state="Puppet_Piece"
			Price=450000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Ice_Spread_Light/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ice_Spread_Moderate
			icon_state="Puppet_Piece"
			Price=750000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Ice_Spread_Medium/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Ice_Spread_Strong
			icon_state="Puppet_Piece"
			Price=2000000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Ice_Spread_Heavy/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Poison_Spread_Beginner
			icon_state="Puppet_Piece"
			Price=350000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Poison_Spread_Light/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Poison_Spread_Moderate
			icon_state="Puppet_Piece"
			Price=500000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Poison_Spread_Medium/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Poison_Spread_Strong
			icon_state="Puppet_Piece"
			Price=750000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Poison_Spread_Heavy/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SmokeScreen_Spread_Beginner
			icon_state="Puppet_Piece"
			Price=400000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/SmokeScreen_Spread_Attachment_Light/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SmokeScreen_Spread_Moderate
			icon_state="Puppet_Piece"
			Price=550000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/SmokeScreen_Spread_Attachment_Medium/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		SmokeScreen_Spread_Strong
			icon_state="Puppet_Piece"
			Price=750000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/SmokeScreen_Spread_Attachment_Heavy/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return

		Power_Enhancer
			icon_state="Puppet_Piece"
			Price=10000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Power_Enhancer/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Power_Enhancer_Lite
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Power_Enhancer_Lite/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Spiked_Arms
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Spiked_Arms/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Adjustable_Room
			icon_state="Puppet_Piece"
			Price=350000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Adjustable_Room/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Adjustable_Room_Collapsing//Adjustable_Room_Collapse
			icon_state="Puppet_Piece"
			Price=500000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Adjustable_Room_Collapse/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Exploding_Return
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Exploding_Return/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Stun_Resister
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Stun_Resister/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Light_Blade_Arms
			icon_state="Puppet_Piece"
			Price=50000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Light_Blade_Arms/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Medium_Blade_Arms
			icon_state="Puppet_Piece"
			Price=75000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Medium_Blade_Arms/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Heavy_Blade_Arms
			icon_state="Puppet_Piece"
			Price=100000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Heavy_Blade_Arms/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		Fast_Return
			icon_state="Puppet_Piece"
			Price=45000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Puppet_Parts/Fast_Return/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return


		BigShurikenWeaponScroll
			icon_state="Scroll"
			Price=45000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/BigShurikenWeaponScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		MultiKageShurikenWeaponScroll
			icon_state="Scroll"
			Price=45000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/MultiKageShurikenWeaponScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		MissileBomb
			icon_state="Scroll"
			Price=45000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/MissileBomb/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return
		HoukaWeaponScroll
			icon_state="Scroll"
			Price=45000
			Click()
				usr<<sound('SFX/click1.wav',0)
				switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ryo. Do you want to buy it?", text) in list ("Yes","No."))
					if("Yes")
						if(usr.Yen>=src.Price)
							usr<<sound('SFX/click1.wav',0);usr<<sound('SFX/Cash.wav');usr<<"You bought a [src.name]!";usr.Yen-=src.Price
							var/obj/Scrolls/HoukaWeaponScroll/B=new();B.loc=usr
							return
						else
							usr<<"Not enough money!";usr<<sound('SFX/click2.wav',0)
					if("No")
						usr<<sound('SFX/click2.wav',0)
						return





	/*	Exp_Scroll
		Price = 499
		name = "25K EXP Scroll X7"
		Click()
			switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. Do you want to buy it?",text) in list ("Yes","No"))
				if ("Yes")
					if(usr.NinjaCash>=src.Price)
						usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
						//add exp scroll
						return
					else
						usr<<"You dont have enough money."
						return
				if ("No")
					return*/

/*	NinjaCash/Weapons
		FireMinorElementalSword
		Price = 1999
		name = "Minor Fire Elemental Sword"
		Click()
			switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. It grants the user to cast 4 low level Fire Jutsus. Do you want to buy it?",text) in list ("Yes","No"))
				if ("Yes")
					if(usr.NinjaCash>=src.Price)
						usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
						//add exp scroll
						return
					else
						usr<<"You dont have enough money."
						return
				if ("No")
					return
		FireMinorElementalSword
		Price = 1999
		name = "Minor Fire Elemental Sword"
		Click()
			switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. It grants the user to cast 4 low level Fire Jutsus. Do you want to buy it?",text) in list ("Yes","No"))
				if ("Yes")
					if(usr.NinjaCash>=src.Price)
						usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
						//add exp scroll
						return
					else
						usr<<"You dont have enough money."
						return
				if ("No")
					return

		WindMinorElementalSword
		Price = 1999
		name = "Minor Fire Elemental Sword"
		Click()
			switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. It grants the user to cast 4 low level Fire Jutsus. Do you want to buy it?",text) in list ("Yes","No"))
				if ("Yes")
					if(usr.NinjaCash>=src.Price)
						usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
						//add exp scroll
						return
					else
						usr<<"You dont have enough money."
						return
				if ("No")
					return


		WaterMinorElementalSword
		Price = 1999
		name = "Minor Fire Elemental Sword"
		Click()
			switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. It grants the user to cast 4 low level Fire Jutsus. Do you want to buy it?",text) in list ("Yes","No"))
				if ("Yes")
					if(usr.NinjaCash>=src.Price)
						usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
						//add exp scroll
						return
					else
						usr<<"You dont have enough money."
						return
				if ("No")
					return


		LightningMinorElementalSword
		Price = 1999
		name = "Minor Fire Elemental Sword"
		Click()
			switch(input(usr,"The [src.name] costs [y2k_Uncondense_Num(src.Price)] Ninja Cash. It grants the user to cast 4 low level Fire Jutsus. Do you want to buy it?",text) in list ("Yes","No"))
				if ("Yes")
					if(usr.NinjaCash>=src.Price)
						usr<<"You bought a [src.name]!";usr.NinjaCash-=src.Price
						//add exp scroll
						return
					else
						usr<<"You dont have enough money."
						return
				if ("No")
					return
*/