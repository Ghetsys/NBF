mob/NPC
	CNNPC=1
	icon='Map/Turfs/HakumeiGetsu.dmi'
	icon_state="NPC"
	health=9999999999999999999999999999999999999999999999

mob/NPC/MerchantNPCs//Merchant System in developement//Just so you know where they are on the map.
	verb/Command()
		set src in oview(1)
		set name="Command"
		set hidden=1
		CommandThing(usr)	//In case certain NPCs have special commands, this has been split into a verb and proc.
	proc/CommandThing(mob/usr)
		var/countzzz=0
		for(var/obj/A in usr.contents)//Just added 12/20/2012
			if(A.ammount>1)
				countzzz+=A.PlacementWeight*A.ammount
			else
				countzzz+=A.PlacementWeight
		usr.ItemWeight=countzzz
		if(Night==1&&src.name!="Snack Vending Machine(NPC)"&&src.name!="Vegan Vending Machine(NPC)")
			usr<<"Come back to me sometime tomorrow when it's not dark...";return
		if(usr.Village!=src.Village&&src.Village!="None")	//Anyone can buy from None Village NPCs
			usr<<"Wait a second. You're not apart of [src.Village]! No way I'm selling you valuables.";return
		if(usr.Village=="Leaf"&&src.Village=="Leaf"&&LeafInDepression==1)
			usr<<"You're not able to buy anything due to the depression....";return
		if(usr.Village=="Rock"&&src.Village=="Rock"&&RockInDepression==1)
			usr<<"You're not able to buy anything due to the depression....";return
		if(usr.Village=="Rain"&&src.Village=="Rain"&&RainInDepression==1)
			usr<<"You're not able to buy anything due to the depression....";return
		if(usr.Village=="Sound"&&src.Village=="Sound"&&SoundInDepression==1)
			usr<<"You're not able to buy anything due to the depression....";return
		usr<<"[MessageTheySay]. (Click a card and select it to buy it.)"
		usr.alreadytalkingtohim=1
		var/Count=0
		for(var/obj/BuyableThings/A in src.InventorySet)//For all the obj/Buyable things in the source or its Inventory Set.
			Count++
			A.ObjectNumber=Count
			var/obj/C = new A.type()
			var/StartingX=2
			StartingX+=Count
			var/StartingY=15
			var/FakeCount=0
			if(Count>13)
				FakeCount=Count-11
				StartingX=FakeCount
				StartingY-=1
			if(Count>27)
				FakeCount=Count-25
				StartingX=FakeCount
				StartingY-=1
			if(Count>41)
				FakeCount=Count-38
				StartingX=FakeCount
				StartingY-=1
			if(Count>54)//Maximum amount of items a seller can sell. (68 maximum)
				FakeCount=Count-52
				StartingX=FakeCount
				StartingY-=1
			C.screen_loc="[StartingX],[StartingY]"
			usr.client.screen+=C
		usr.CheckWeight()
	var
		list/InventorySet=list("")//The list of things they're selling you.
		//Do not go over 20 objects.
		ClanSeller=0//If they're restricted to selling in their Clan.
		VillageSeller=0//If they're restricted to selling in their village.
		SpecialsForAnbu=0//Allows them to get special things for Anbu
		MessageTheySay="So what would you like to buy?"//Editable.
	TeaVillage
		ExampleMerchant
			name="Tester(NPC)"
			Village="Leaf"
//Everything placed in the list determines what the NPC has.
//Everything underneath determines how they look
			New()
				.=..()
				spawn()
//Creating skin color
					//The items needed to be added here.
				//	if(LeafInDepression==1) usr<<"There are no items to be sold due to the depression.";return
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Shirt
					src.InventorySet+=new/obj/BuyableThings/Weapons/Katana
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/KnuckleKnives
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kubiriki_Houchou
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Shuriken
					src.InventorySet+=new/obj/BuyableThings/Cancel
					//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
//Change the RGB of Base+=rgb(X,X,X) to set the skin color of the Base.
////////////////////////////////////////////////
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(235,145,52);src.overlays+=Hairstyle
//Works just like Base
////////////////////////////////////////////////
//If Male use these:
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
//If Female use these:
//					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
////////////////////////////////////////////////
//Now just add Clothing.
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

	LeafVillage//All of the NPCs that belong to Leaf place under here.
		Village="Leaf"
		Vegan_Vending_Machine
			name="Vegan Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()

					src.InventorySet+=new/obj/BuyableThings/Food/Red_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Yellow_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Green_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Orange
					src.InventorySet+=new/obj/BuyableThings/Food/Tangerine
					src.InventorySet+=new/obj/BuyableThings/Food/Grapes
					src.InventorySet+=new/obj/BuyableThings/Food/Pear
					src.InventorySet+=new/obj/BuyableThings/Food/Rice
					src.InventorySet+=new/obj/BuyableThings/Food/Riceball
					src.InventorySet+=new/obj/BuyableThings/Food/Water
					src.InventorySet+=new/obj/BuyableThings/Food/Sake
					src.InventorySet+=new/obj/BuyableThings/Cancel
		Vending_Machine
			name="Snack Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Healthy_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/BBQ_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Sour_Cream_And_Onion_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Pepsi
					src.InventorySet+=new/obj/BuyableThings/Cancel
		Grandma_Sage
			name="Grandma_Sage(NPC)"
			MessageTheySay = "Ah, Hello there dear. I have something I would like to teach you. This has been passed down from one Generation of Ninja to another!"
			CommandThing(usr)
				if(Mchakra<8000)
					usr <<"You're not ready for this."
					return
				.=..()
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Slug_Katsuya_Summoning_Scroll

					src.InventorySet+=new/obj/BuyableThings/Cancel

					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='TemariH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(50,125,25)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='Icons/New Base/Clothing/facewrap.dmi';src.overlays+=Hairstyle
		Food_Ichiraku
			name="Ichiraku, Sennin(NPC)"
			icon = 'Icons/Chef.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/PorkFriendRamen
					src.InventorySet+=new/obj/BuyableThings/Food/SPorkFriendRamen
					src.InventorySet+=new/obj/BuyableThings/Food/Quick_Ramen
					src.InventorySet+=new/obj/BuyableThings/Food/Filling_Ramen
					src.InventorySet+=new/obj/BuyableThings/Food/Calorie_Ramen
					src.InventorySet+=new/obj/BuyableThings/Cancel
		Food_MeatShop
			name="Hazu's Meat Shop(NPC)"
			icon = 'Icons/Chef.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Steak
					src.InventorySet+=new/obj/BuyableThings/Food/Meaty_Steak
					src.InventorySet+=new/obj/BuyableThings/Food/Bone_Suckin_Goodass_Steak
					src.InventorySet+=new/obj/BuyableThings/Food/Ribs
					src.InventorySet+=new/obj/BuyableThings/Food/Meaty_Ribs
					src.InventorySet+=new/obj/BuyableThings/Food/Bone_Suckin_Goodass_Ribs
					src.InventorySet+=new/obj/BuyableThings/Cancel



		Medical_SoldierPills
			name="Soldier Pill Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill1
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill2
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill3
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill7
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill8
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill9
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill11
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/InoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

//////////////////////////////////////////////////////
		Training_Scroll_Merchant
			name="Training_Scroll_Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(25,50,50)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

		GlassesSalesMerchant
			name="Glasses Sales Merchant(NPC)"
			New()
				.=..()
				spawn(10)
					src.InventorySet+=new/obj/BuyableThings/Clothing/SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/C00L_SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/Turban
					src.InventorySet+=new/obj/BuyableThings/Clothing/Range_Extender
					if(src.z==20)
				//		src.InventorySet+=new/obj/BuyableThings/Clothing/Range_Extender
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Orange
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Blue
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask_Blue
					src.InventorySet+=new/obj/BuyableThings/Clothing/Left_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Clothing/Right_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/KimimaroH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+='Icons/New Base/Clothing/Shades.dmi'
		KageBunshinScrollSeller
			name="Hideki(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multi_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multiple_Shuriken_Scroll

					src.InventorySet+=new/obj/BuyableThings/Scrolls/Exploding_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/PartedH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,150);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		FireScrollsSalesman
			name="Ka Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Katon_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SceneH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,25,37)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WaterScrollsSalesman
			name="Sui Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Suiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/MizukageH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,25,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WindScrollsSalesman
			name="Fuu Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fuuton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/WindH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		EarthScrollsSalesman
			name="Do Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Doton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/ShikamaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(50,15,10)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		LightningScrollsSalesman
			name="Rai Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Raiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SasukeTS.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,200)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		KairyuArtShop
			name = "Kairyu(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Supplies/Paper
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ink
					src.InventorySet+=new/obj/BuyableThings/Supplies/Clay
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		Ninja_Supply_Merchant
			name="Ninja Supply Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Headband
					src.InventorySet+=new/obj/BuyableThings/Weapons/Bow
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Melee_Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Windmill_Shuriken
				//	src.InventorySet+=new/obj/BuyableThings/Weapons/Bo_Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Senbon
					src.InventorySet+=new/obj/BuyableThings/Supplies/Makibishi
				//	src.InventorySet+=new/obj/BuyableThings/Supplies/KunaiBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/SmokeBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/ExplodingTag
					src.InventorySet+=new/obj/BuyableThings/Supplies/Arame
					src.InventorySet+=new/obj/BuyableThings/Supplies/Poison
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ointment
					src.InventorySet+=new/obj/BuyableThings/Supplies/Healthpack
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/EmoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/JouninS.dmi';src.overlays+='Icons/New Base/Clothing/Official Clothing/cvest.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+=Hairstyle;src.overlays+='Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi'
		Leaf_Sword_Merchant
			name="Leaf Sword Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Weapons/Katana
					src.InventorySet+=new/obj/BuyableThings/Weapons/Ninjato
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kodachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/KnuckleKnives
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tanto
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/WolverineH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop1
			name="Jack(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt

					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Clothing/NinjaHat
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cloak
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cape
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop2
			name="Jen(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Shoes
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Clothing/NinjaHat
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cloak
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cape
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/TemariH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(180,180,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop3
			name="Araqui(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Scarf
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/OrochimaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,100);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

	RainVillage//All of the NPCs that belong to Rain place under here.
		Village="Rain"
		Vegan_Vending_Machine
			name="Vegan Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Red_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Yellow_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Green_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Orange
					src.InventorySet+=new/obj/BuyableThings/Food/Tangerine
					src.InventorySet+=new/obj/BuyableThings/Food/Grapes
					src.InventorySet+=new/obj/BuyableThings/Food/Pear
					src.InventorySet+=new/obj/BuyableThings/Food/Rice
					src.InventorySet+=new/obj/BuyableThings/Food/Riceball
					src.InventorySet+=new/obj/BuyableThings/Food/Water
					src.InventorySet+=new/obj/BuyableThings/Food/Sake
					src.InventorySet+=new/obj/BuyableThings/Cancel
		Medical_SoldierPills
			name="Soldier Pill Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill1
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill2
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill3
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill7
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill8
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill9
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill11
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/InoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle


		Vending_Machine
			name="Snack Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Healthy_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/BBQ_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Sour_Cream_And_Onion_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Pepsi
					src.InventorySet+=new/obj/BuyableThings/Cancel

		Training_Scroll_Merchant
			name="Training_Scroll_Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(25,50,50)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

		SuzakuShop1
			name="Jack(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Clothing/NinjaHat
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cloak
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cape
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop2
			name="Jen(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Shoes
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/TemariH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(180,180,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop3
			name="Araqui(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Scarf
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/OrochimaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,100);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

		GlassesSalesMerchant
			name="Glasses Sales Merchant(NPC)"
			New()
				.=..()
				spawn(10)
					src.InventorySet+=new/obj/BuyableThings/Clothing/SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/C00L_SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/Turban
					src.InventorySet+=new/obj/BuyableThings/Clothing/Range_Extender
					if(src.z==20)
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Orange
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Blue
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask_Blue
					src.InventorySet+=new/obj/BuyableThings/Clothing/Left_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Clothing/Right_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/narutoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+='Icons/New Base/Clothing/Shades.dmi'
		Ninja_Supply_Merchant
			name="Ninja Supply Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Headband
					src.InventorySet+=new/obj/BuyableThings/Weapons/Bow
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Melee_Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Windmill_Shuriken
				//	src.InventorySet+=new/obj/BuyableThings/Weapons/Bo_Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Senbon
					src.InventorySet+=new/obj/BuyableThings/Supplies/Makibishi
				//	src.InventorySet+=new/obj/BuyableThings/Supplies/KunaiBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/SmokeBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/ExplodingTag
					src.InventorySet+=new/obj/BuyableThings/Supplies/Arame
					src.InventorySet+=new/obj/BuyableThings/Supplies/Poison
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ointment
					src.InventorySet+=new/obj/BuyableThings/Supplies/Healthpack
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/EmoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+=Hairstyle;src.overlays+='Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi'
		Rain_Sword_Merchant
			name="Rain Sword Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Weapons/Katana
					src.InventorySet+=new/obj/BuyableThings/Weapons/Ninjato
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kodachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/KnuckleKnives
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tanto
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kubiriki_Houchou
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SasukeTS.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,100);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		KageBunshinScrollSeller
			name="Renji(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multi_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multiple_Shuriken_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Exploding_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SleekH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(185,185,185)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		FireScrollsSalesman
			name="Kata Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Katon_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SceneH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,25,37)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WaterScrollsSalesman
			name="Suita Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Suiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/MizukageH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,25,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WindScrollsSalesman
			name="Fuuta Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fuuton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/WindH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		EarthScrollsSalesman
			name="Dota Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Doton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/ShikamaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(50,15,10)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		LightningScrollsSalesman
			name="Raita Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Raiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SasukeTS.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,200)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		HinaArtShop
			name = "Eio, Hina(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Supplies/Paper
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ink
					src.InventorySet+=new/obj/BuyableThings/Supplies/Clay
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/MizukageH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(10,10,95)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
	SoundVillage//All of the NPCs that belong to Sound place under here.
		Village="None"
		ArmorRepairBuyMerchant
			name="Yori"
			MessageTheySay="You just going to stand there like an idiot or buy some Armor?"
			New()
				.=..()
				spawn()
					spawn(10)
						src.InventorySet+=new/obj/BuyableThings/Clothing/LightArmor
						src.InventorySet+=new/obj/BuyableThings/Clothing/BalancedArmor
						src.InventorySet+=new/obj/BuyableThings/Clothing/HeavyArmor
						src.InventorySet+=new/obj/BuyableThings/Cancel

						src.icon=null
						var/Base='Icons/New Base/Base.dmi'
						Base+=rgb(235,145,52)
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
			//			src.overlays+='Cloak.dmi'
						src.overlays+='Icons/New Base/Hair/RyuzakiH.dmi'
		FisherJim
			name="Jim the Fisher"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/BeginnerFishingRod
					src.InventorySet+=new/obj/BuyableThings/Clothing/ModerateFishingRod
					src.InventorySet+=new/obj/BuyableThings/Clothing/ExpertFishingRod
					src.InventorySet+=new/obj/BuyableThings/Clothing/BadassFishingRod
					src.InventorySet+=new/obj/BuyableThings/Cancel
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/WolverineH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

		Puppet_Salesman
			name="Ningyo, Burgues"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Dragon_Puppet_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Hawk_Puppet_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Talon_Puppet_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/ItachiH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle


		Puppet_Salesman_Two
			name="Ningyo, Nabucodonosor"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Poison_Blades_Attachment
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Attachment_Beginner
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Attachment_Moderate
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Attachment_Strong
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Rapid_Attachment_Beginner
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Rapid_Attachment_Moderate
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Rapid_Attachment_Strong
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Poison_Spread_Beginner
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Poison_Spread_Moderate
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Poison_Spread_Strong
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Ice_Spread_Beginner
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Ice_Spread_Moderate
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Ice_Spread_Strong
					src.InventorySet+=new/obj/BuyableThings/Scrolls/SmokeScreen_Spread_Beginner
					src.InventorySet+=new/obj/BuyableThings/Scrolls/SmokeScreen_Spread_Moderate
					src.InventorySet+=new/obj/BuyableThings/Scrolls/SmokeScreen_Spread_Strong
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Structure_Enhancer
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Structure_Enhancer_Lite
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Armor_Enhancer
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Armor_Enhancer_Lite
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Power_Enhancer
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Power_Enhancer_Lite
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Spiked_Arms
				//	src.InventorySet+=new/obj/BuyableThings/Scrolls/Adjustable_Room
				//	src.InventorySet+=new/obj/BuyableThings/Scrolls/Adjustable_Room_Collapsing
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Exploding_Return
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Stun_Resister
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fast_Return
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Light_Blade_Arms
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Medium_Blade_Arms
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Heavy_Blade_Arms
					src.InventorySet+=new/obj/BuyableThings/Cancel
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/OrochimaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

		SuzakuShop1
			name="Jack(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Clothing/NinjaHat
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cloak
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cape
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop2
			name="Jen(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Shoes
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/TemariH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(180,180,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop3
			name="Araqui(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Scarf
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/OrochimaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,100);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

		Vegan_Vending_Machine
			name="Vegan Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Red_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Yellow_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Green_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Orange
					src.InventorySet+=new/obj/BuyableThings/Food/Tangerine
					src.InventorySet+=new/obj/BuyableThings/Food/Grapes
					src.InventorySet+=new/obj/BuyableThings/Food/Pear
					src.InventorySet+=new/obj/BuyableThings/Food/Rice
					src.InventorySet+=new/obj/BuyableThings/Food/Riceball
					src.InventorySet+=new/obj/BuyableThings/Food/Water
					src.InventorySet+=new/obj/BuyableThings/Food/Sake
					src.InventorySet+=new/obj/BuyableThings/Cancel
		Medical_SoldierPills
			name="Soldier Pill Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill1
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill2
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill3
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill7
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill8
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill9
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill11
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/InoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle


		Vending_Machine
			name="Snack Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Healthy_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/BBQ_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Sour_Cream_And_Onion_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Pepsi
					src.InventorySet+=new/obj/BuyableThings/Cancel

		Training_Scroll_Merchant
			name="Training_Scroll_Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(25,50,50)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		GlassesSalesMerchant
			name="Glasses Sales Merchant(NPC)"
			New()
				.=..()
				spawn()
					spawn(10)
					src.InventorySet+=new/obj/BuyableThings/Clothing/SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/C00L_SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/Turban
					src.InventorySet+=new/obj/BuyableThings/Clothing/Range_Extender
					if(src.z==20)
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Orange
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Blue
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask_Blue
					src.InventorySet+=new/obj/BuyableThings/Clothing/Left_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Clothing/Right_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/KakashiH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+='Icons/New Base/Clothing/Shades.dmi'
		KageBunshinScrollSeller
			name="Hitsugaya(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multi_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multiple_Shuriken_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Exploding_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'

					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(185,185,185)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		FireScrollsSalesman
			name="Katazo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Katon_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SceneH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,25,37)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WaterScrollsSalesman
			name="Suizo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Suiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/MizukageH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,25,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WindScrollsSalesman
			name="Fuuzo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fuuton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/WindH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		EarthScrollsSalesman
			name="Dozo Li(NPC)"
			Village="Sound"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Doton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Body_Flame_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/ShikamaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(50,15,10)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		LightningScrollsSalesman
			name="Raizo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Raiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SasukeTS.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,200)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		AkagawureArtShop
			name = "Akagawure(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Supplies/Paper
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ink
					src.InventorySet+=new/obj/BuyableThings/Supplies/Clay
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		Ninja_Supply_Merchant
			name="Ninja Supply Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Headband
					src.InventorySet+=new/obj/BuyableThings/Weapons/Bow
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Melee_Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Windmill_Shuriken
				//	src.InventorySet+=new/obj/BuyableThings/Weapons/Bo_Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Senbon
					src.InventorySet+=new/obj/BuyableThings/Supplies/Makibishi
				//	src.InventorySet+=new/obj/BuyableThings/Supplies/KunaiBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/SmokeBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/ExplodingTag
					src.InventorySet+=new/obj/BuyableThings/Supplies/Arame
					src.InventorySet+=new/obj/BuyableThings/Supplies/Poison
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ointment
					src.InventorySet+=new/obj/BuyableThings/Supplies/Healthpack
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/EmoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/SOSuit.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+=Hairstyle;src.overlays+='Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi'
		Sound_Sword_Merchant
			name="Sound Sword Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Weapons/Katana
					src.InventorySet+=new/obj/BuyableThings/Weapons/Ninjato
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kodachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/KnuckleKnives
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tanto
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
	RockVillage//All of the NPCs that belong to Rock place under here.
		Village="Rock"
		WindScrollsSalesman
			name="Fuuza Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fuuton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Airbender_Scroll_Ichi
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Airbender_Scroll_Ni
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Airbender_Scroll_San
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Airbender_Scroll_Yon
					src.InventorySet+=new/obj/BuyableThings/Cancel
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/TousenH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJouninS.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

		Vegan_Vending_Machine
			name="Vegan Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Red_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Yellow_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Green_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Orange
					src.InventorySet+=new/obj/BuyableThings/Food/Tangerine
					src.InventorySet+=new/obj/BuyableThings/Food/Grapes
					src.InventorySet+=new/obj/BuyableThings/Food/Pear
					src.InventorySet+=new/obj/BuyableThings/Food/Rice
					src.InventorySet+=new/obj/BuyableThings/Food/Riceball
					src.InventorySet+=new/obj/BuyableThings/Food/Water
					src.InventorySet+=new/obj/BuyableThings/Food/Sake
					src.InventorySet+=new/obj/BuyableThings/Cancel


		Medical_SoldierPills
			name="Soldier Pill Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill1
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill2
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill3
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill7
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill8
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill9
					src.InventorySet+=new/obj/BuyableThings/Pills/SoldierPill11
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/InoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle


		Vending_Machine
			name="Snack Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Healthy_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/BBQ_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Sour_Cream_And_Onion_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Pepsi
					src.InventorySet+=new/obj/BuyableThings/Cancel

		Training_Scroll_Merchant
			name="Training_Scroll_Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(25,50,50)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		SuzakuShop1
			name="Jack(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/NinjaHat
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gourd
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cloak
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cape
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop2
			name="Jen(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Shoes
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/TemariH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(180,180,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop3
			name="Araqui(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Scarf
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/OrochimaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,100);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

		GlassesSalesMerchant
			name="Glasses Sales Merchant(NPC)"
			New()
				.=..()
				spawn()
					spawn(10)
					src.InventorySet+=new/obj/BuyableThings/Clothing/SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/C00L_SunGlasses
					src.InventorySet+=new/obj/BuyableThings/Clothing/Turban
					src.InventorySet+=new/obj/BuyableThings/Clothing/Range_Extender
					if(src.z==20)
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Orange
						src.InventorySet+=new/obj/BuyableThings/Clothing/Goggles_Blue
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask
						src.InventorySet+=new/obj/BuyableThings/Clothing/Mouth_Mask_Blue
					src.InventorySet+=new/obj/BuyableThings/Clothing/Left_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Clothing/Right_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/itachiH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+='Icons/New Base/Clothing/Shades.dmi'
		KageBunshinScrollSeller
			name="Gero(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multi_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multiple_Shuriken_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Exploding_Shadow_Clone_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(86,10,10)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		FireScrollsSalesman
			name="Katazo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Katon_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SceneH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,25,37)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WaterScrollsSalesman
			name="Suizo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Suiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/MizukageH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,25,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		WindScrollsSalesman
			name="Fuuzo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fuuton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/WindH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,150)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		EarthScrollsSalesman
			name="Dozo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Doton_Generative_Scroll
					//src.InventorySet+=new/obj/BuyableThings/Scrolls/Hiding_Like_A_Mole_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/ShikamaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(50,15,10)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle
		LightningScrollsSalesman
			name="Raizo Li(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Raiton_Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SasukeTS.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(150,150,200)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

		SabuArtShop
			name = "Sabu, Hiru(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Supplies/Paper
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ink
					src.InventorySet+=new/obj/BuyableThings/Supplies/Clay
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/EmoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+='Icons/New Base/Clothing/GogglesOrange.dmi';src.overlays+=Hairstyle

		Ninja_Supply_Merchant
			name="Ninja Supply Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Headband
					src.InventorySet+=new/obj/BuyableThings/Weapons/Bow
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Melee_Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Windmill_Shuriken
				//	src.InventorySet+=new/obj/BuyableThings/Weapons/Bo_Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Senbon
					src.InventorySet+=new/obj/BuyableThings/Supplies/Makibishi
				//	src.InventorySet+=new/obj/BuyableThings/Supplies/KunaiBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/SmokeBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/ExplodingTag
					src.InventorySet+=new/obj/BuyableThings/Supplies/Arame
					src.InventorySet+=new/obj/BuyableThings/Supplies/Poison
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ointment
					src.InventorySet+=new/obj/BuyableThings/Supplies/Healthpack
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/EmoH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+=Hairstyle;src.overlays+='Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi'
		Rock_Sword_Merchant
			name="Rock Sword Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Weapons/Katana
					src.InventorySet+=new/obj/BuyableThings/Weapons/Ninjato
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kodachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tachi
					src.InventorySet+=new/obj/BuyableThings/Weapons/KnuckleKnives
					src.InventorySet+=new/obj/BuyableThings/Weapons/Tanto
					src.InventorySet+=new/obj/BuyableThings/Weapons/Berserker
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RyuzakiH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		Bojutsu_Merchant
			name="Bojutsu Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Weapons/Hanbo_Staff
					src.InventorySet+=new/obj/BuyableThings/Weapons/Round_Bo_Staff
					src.InventorySet+=new/obj/BuyableThings/Weapons/Four_Sided_Bo_Staff
					src.InventorySet+=new/obj/BuyableThings/Weapons/Six_Sided_Bo_Staff
					src.InventorySet+=new/obj/BuyableThings/Weapons/Eight_Sided_Bo_Staff
					src.InventorySet+=new/obj/BuyableThings/Weapons/Nunchuks
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RyuzakiH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
	NonVillage//All of the NPCs that belong to No Village place under here.
		Village="None"
		Vegan_Vending_Machine
			name="Vegan Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Red_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Yellow_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Green_Apple
					src.InventorySet+=new/obj/BuyableThings/Food/Orange
					src.InventorySet+=new/obj/BuyableThings/Food/Tangerine
					src.InventorySet+=new/obj/BuyableThings/Food/Grapes
					src.InventorySet+=new/obj/BuyableThings/Food/Pear
					src.InventorySet+=new/obj/BuyableThings/Food/Rice
					src.InventorySet+=new/obj/BuyableThings/Food/Riceball
					src.InventorySet+=new/obj/BuyableThings/Food/Water
					src.InventorySet+=new/obj/BuyableThings/Food/Sake
					src.InventorySet+=new/obj/BuyableThings/Cancel
		Summon_Scroll_Merchent
			name="Summon Scroll (NPC)"
			New()
				.=..()
				spawn()


					src.InventorySet+=new/obj/BuyableThings/Scrolls/HoukaWeaponScroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/MultiKageShurikenWeaponScroll

					src.InventorySet+=new/obj/BuyableThings/Scrolls/BigShurikenWeaponScroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/MissileBomb

					src.InventorySet+=new/obj/BuyableThings/Cancel
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SasukeH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(180,180,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		Training_Scroll_Merchant
			name="Training_Scroll_Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Generative_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/RandomKarnHair.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(25,50,50)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi';src.overlays+=Hairstyle

		Vending_Machine
			name="Snack Vending Machine(NPC)"
			icon='Icons/SnackMachine.dmi'
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Food/Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Healthy_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/BBQ_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Sour_Cream_And_Onion_Potato_Chips
					src.InventorySet+=new/obj/BuyableThings/Food/Pepsi
					src.InventorySet+=new/obj/BuyableThings/Cancel

		SuzakuShop1
			name="Jack(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Sleeveless_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sleeves
					src.InventorySet+=new/obj/BuyableThings/Clothing/NinjaHat
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cloak
					src.InventorySet+=new/obj/BuyableThings/Clothing/Cape
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop2
			name="Jen(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Baggy_Pants
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Sky_Blue_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Red_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Light_Green_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Orange_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Yellow_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Purple_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Pink_Neckband_Shirt
					src.InventorySet+=new/obj/BuyableThings/Clothing/Shoes
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/TemariH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(180,180,0);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
		SuzakuShop3
			name="Araqui(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Black_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Dark_Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/Gray_Scarf
					src.InventorySet+=new/obj/BuyableThings/Clothing/White_Scarf
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/OrochimaruH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,100);src.overlays+=Hairstyle
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/Clothing/Panties.dmi';src.overlays+='Icons/New Base/FemaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/pants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'

		Ninja_Supply_Merchant
			name="Ninja Supply Merchant(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Weapons/Bow
					src.InventorySet+=new/obj/BuyableThings/Weapons/Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Melee_Kunai
					src.InventorySet+=new/obj/BuyableThings/Weapons/Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Windmill_Shuriken
				//	src.InventorySet+=new/obj/BuyableThings/Weapons/Bo_Shuriken
					src.InventorySet+=new/obj/BuyableThings/Weapons/Senbon
					src.InventorySet+=new/obj/BuyableThings/Supplies/Makibishi
				//	src.InventorySet+=new/obj/BuyableThings/Supplies/KunaiBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/SmokeBomb
					src.InventorySet+=new/obj/BuyableThings/Supplies/ExplodingTag
					src.InventorySet+=new/obj/BuyableThings/Supplies/Arame
					src.InventorySet+=new/obj/BuyableThings/Supplies/Poison
					src.InventorySet+=new/obj/BuyableThings/Supplies/Ointment
					src.InventorySet+=new/obj/BuyableThings/Supplies/Healthpack
					src.InventorySet+=new/obj/BuyableThings/Cancel
//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/MadaraH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+=Hairstyle;src.overlays+='Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi'
		Nobeard
			name="Nobeard(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Left_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Clothing/Right_Eyepatch
					src.InventorySet+=new/obj/BuyableThings/Cancel
	//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/JiraiyaH2.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='LEyePatch.dmi';src.overlays+=Hairstyle
		FuuinjutsuScrollSeller
			name="Haiman(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Handseal_Seal_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Chakra_Seal_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/HellSent_Seal_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Control_Seal_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Five_Element_Seal_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
	//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='Icons/New Base/Clothing/facewrap.dmi';src.overlays+=Hairstyle
		TurbanSalesman
			name="Ior(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Clothing/Turban
					src.InventorySet+=new/obj/BuyableThings/Cancel
	//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='Icons/New Base/Hair/SpikedPonytailH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='Icons/New Base/Clothing/facewrap.dmi';src.overlays+='Turban.dmi'

		AncientScrollSeller
			name="Gekko The Scrollsmen(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/False_Death_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Chakra_Enhance_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Weapon_Reverse_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Kunai_Barrage_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Multiple_Kunai_Scroll
				//	src.InventorySet+=new/obj/BuyableThings/Scrolls/Raining_Tag_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Weapon_Summoning_Kunai_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Expanding_Shuriken_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Hair_Needle_Senbon_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Guiding_Weapon_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Karakuri_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Blazing_Burn_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Rashoumon_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
	//////////////////////////////////////////////////////
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='ExclusiveH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='Icons/New Base/Clothing/facewrap.dmi';src.overlays+=Hairstyle


		Wolf_Summoner
			name="Summoner(NPC)"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Canine_Contract_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Wolf_Darke_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Wolf_Griffin_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Wolf_Zune_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Wolf_Zute_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Wolf_Coro_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fairy_Contract_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fairy_Joy_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fairy_Ene_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fairy_Nega_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Scrolls/Fairy_Inf_Summoning_Scroll
					src.InventorySet+=new/obj/BuyableThings/Cancel

					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='SasukeH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='Icons/New Base/Clothing/facewrap.dmi';src.overlays+=Hairstyle


// NINJA CASH NPC
		NinjaCashMerchant
			name="Ninja Cash SalesMan"
			New()
				.=..()
				spawn()
					src.InventorySet+=new/obj/BuyableThings/NinjaCash/Scrolls/Exp_Scroll
					src.InventorySet+=new/obj/BuyableThings/NinjaCash/Scrolls/Cooldown_Scroll
					src.InventorySet+=new/obj/BuyableThings/NinjaCash/Scrolls/CharacterbBuildingScroll
					src.InventorySet+=new/obj/BuyableThings/NinjaCash/Scrolls/MangekyouEyeRestore
					src.InventorySet+=new/obj/BuyableThings/NinjaCash/Scrolls/NameChangeScroll
					src.InventorySet+=new/obj/BuyableThings/Cancel
					//NPC Looks
					src.icon=null;var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(235,145,52);src.icon=Base
					var/Hairstyle='ExclusiveH.dmi'//Set the NPC's Hairstyle
					Hairstyle+=rgb(0,0,0)
					src.overlays+='Icons/New Base/Clothing/Bra.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi'
					src.overlays+='Icons/New Base/Clothing/Shirt.dmi';src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					src.overlays+='Icons/New Base/Clothing/facewrap.dmi';src.overlays+=Hairstyle








mob/NPC/RandomNPCs/SoundVillagers/Merchants
	ClayArtwork
		name="Iwazuka, Hideki(NPC)"
		CNNPC=1
		health=99999999999999999999999999999999999999999999999999999999999
		Village="Rock"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		New()
			.=..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi'
				src.overlays+='Icons/New Base/Hair/KakashiH.dmi'
				src.overlays+='Icons/New Base/Hair/KiraH.dmi'
		verb/Buy()
			set src in oview(3)
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			var/list/buttons = list("Yes", "No")
			if(!usr.Clan=="Iwazuka")
				usr<<"I sell a lot of artwork for Clay users! In my life I guess I just decided to waste it making beautiful works of art, cause art is just that glorious!";return
			switch(input(usr,"I have a lot of artwork you might be interested in? Want to look through my inventory?")in list("What do you have?","Nothing"))
				if("What do you have?")
					switch(input(usr,"Alright this is what I have.")in list("Flower Artwork","Wall Artwork","Nevermind"))
						if("Wall Artwork")
							var/Price=1000
							sd_Alert(usr, "<u>Wall Artwork</u></br>Allows you to create Walls of art!</br></br>Cost: [Price]","Scroll", buttons, \
								pick(buttons),0,0,"400x150",,style)
							if("Yes")
								usr<<sound('SFX/click1.wav',0)
								if(usr.Yen<Price)
									sd_Alert(usr, "You don't have enough yen!","Shop",,,,0,"400x150",,style);return
								else
									usr.Yen-=Price
									var/obj/Scrolls/ArtScrolls/Clay/WallScroll/B=new()
									B.loc=usr
									usr<<sound('SFX/Cash.wav')
						if("Flower Artwork")
							var/Price=500
							sd_Alert(usr, "<u>Flower Artwork</u></br>Allows you to create flower art!</br></br>Cost: [Price]","Scroll", buttons, \
								pick(buttons),0,0,"400x150",,style)
							if("Yes")
								usr<<sound('SFX/click1.wav',0)
								if(usr.Yen<Price)
									sd_Alert(usr, "You don't have enough yen!","Shop",,,,0,"400x150",,style);return
								else
									usr.Yen-=Price
									var/obj/Scrolls/ArtScrolls/Clay/FlowerScroll/B=new()
									B.loc=usr
									usr<<sound('SFX/Cash.wav')

//////////////////////////////////////////////////
///New Armor Merchant
//////////////////////////////////////////////////
