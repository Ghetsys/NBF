mob/EventTrainers/
	GrandmaSage
		name="Grandma Sage"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		Village="Rain"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='TemariH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(50,125,25)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Shirt.dmi';
				src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/facewrap.dmi';
			//	src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return

				sleep(3)
			var/Check=0
			for(var/obj/SkillCards/Shousen/P in usr.LearnedJutsus)
				if(P.Uses>1500)
					Check++
			for(var/obj/SkillCards/Chikatsu/B in usr.LearnedJutsus)
				if(B.Uses>1000)
					Check++
			if(usr.GenSkill>usr.TaiSkill&&usr.GenSkill>usr.NinSkill)
				Check++
			for(var/obj/SkillCards/Oukashou/A in usr.LearnedJutsus)
				if(A.Uses>750)
					Check++
			if(usr.NinjutsuKnowledge>1750)
				Check++
			if(usr.Age>45)
				Check++
			if(usr.rank=="Jounin"||usr.rank=="S.Jounin")
				Check++
			if(usr.Mchakra>7000)
				Check++
			for(var/obj/SkillCards/ChakraMode/X in usr.LearnedJutsus)
				if(X.Uses>500)
					Check+=2
			for(var/obj/SkillCards/ChakraAbsorb/E in usr.LearnedJutsus)
				if(E.Uses>500)
					Check++
			if(Check>=6)
				if(usr.Clan=="Basic")
					switch(input(usr,"Hello..", "Would you like to learn the true power of a Medic?") in list ("Yes","No"))
						if("Yes")
							if(usr.NinjutsuKnowledge<2000&&Check<7)
								usr<<"You need more Ninjutsu Knowledge.";return
							if(usr.Mchakra<6000)
								usr<<"You need more chakra.";return
							if(usr.BeginningVillage!="Rain")
								usr<<"You were never born a Basic Ninja from Rain Village..Leave this place.."
								return
							usr.LearnJutsu("Sage Ape Slug",300000,"SageModeSlug","Sage mode is a technique taught by the eldest medic of the Hidden Rain Village. This technique requires the control over nature chakra in order to manipulate and allows the user to become unbelivably skilled in Medical Ninjutsu","Ninjutsu");return
			else
				usr<<"I hope that one day this village becomes masters at Medical Jutsu."

		/*
		MessageTheySay = "Ah, Hello there dear. I have something I would like to teach you. This has been passed down from one Generation of Ninja to another!"
	//	CommandThing(usr)
	//		if(Mchakra<8000)
	//			usr <<"You're not ready for this."
	//			return
	//		.=..()
	//	New()
	//		.=..()
	//		spawn()
	//			src.InventorySet+=new/obj/BuyableThings/Scrolls/Slug_Katsuya_Summoning_Scroll
				src.InventorySet+=new/obj/BuyableThings/Cancel
				src.icon=null;
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52);
				src.icon=Base
				var/Hairstyle='TemariH.dmi'//Set the NPC's Hairstyle
				Hairstyle+=rgb(50,125,25)
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi';
				src.overlays+='Icons/New Base/MaleEyes.dmi';
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Shirt.dmi';
				src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi';
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/facewrap.dmi';
				src.overlays+=Hairstyle


*/

// Monkey

mob/EventTrainers/
	Monkey
		name = "Moria"
		icon_state="MNPC3"
		icon ='Monkey.dmi'
		CNNPC=1
		health=9999999999999999999999999999999999999999999999
		Village="Rock"
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))

				usr<<"You need to be facing them!";return
				usr<<"The Monkanion tribe is ever so strong."
				sleep(3)
			if(usr.NinjutsuKnowledge<3500)
				usr<<"You need more Ninjutsu Knowledge.";return
			if(usr.Mchakra<7000)
				usr<<"You need more chakra.";return

			if(usr.Clan=="Basic")
				switch(input(usr,"Hellooo", "Would you like to join our monkanian alliance?") in list ("Yes","No"))
					if("Yes")
						if(usr.BeginningVillage!="Rock")
							usr<<"You were never born a Basic Ninja from Rock Village..Leave this place.."
							return
						usr << "<b>Here we go!"
						sleep(30)
						usr.loc=locate(174,35,1)
						if(usr.NinjutsuKnowledge<2000)
							usr<<"You need more Ninjutsu Knowledge.";return
						if(usr.Mchakra<6000)
							usr<<"You need more chakra.";return








	Monkey2
		name = "Eldest Monkey: Sageion"
		icon_state="MNPC1"
		icon ='Monkey.dmi'
		CNNPC=1
		health=9999999999999999999999999999999999999999999999
		Village="Rock"
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"Ooh.."
			sleep(5)
			var/found=0
			for(var/obj/SkillCards/SageModeApe/P in A)
				if(P.type == /obj/SkillCards/SageModeApe) found=1
			if(found)
				usr<<"Let it rain.";return
			switch(input(usr,"Sage Mode is a very difficult and dangerous technique, are you sure you'd risk everything for it..?", "Kokuangyo") in list ("Yes","No"))
				if("Yes")
					if(usr.NinjutsuKnowledge<2000)
						usr<<"You need more Ninjutsu Knowledge.";return
					if(usr.SageTest==1)
						usr<<"You haven't completed the test, boy.";return
						var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Great...You've managed to do the test, not bad.","[src]",,,,0,"400x150",,style);return

					usr.LearnJutsu("Sage Ape Mode",500000,"SageModeApe","Sage mode is a technique taught by the eldest monkey of the Jungarion parks. This technique requires the control over nature chakra in order to manipulate.","Ninjutsu");return
	Monkey3
		name = "Morimo"
		icon_state="MNPC4"
		icon ='Monkey.dmi'
		CNNPC=1
		health=9999999999999999999999999999999999999999999999
		Village="Rock"
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			if(usr.Clan=="Basic")
				switch(input(usr,"What is it Human?", "Do you want to go back to your own world?") in list ("Yes","No"))
					if("Yes")
						if(usr.NinjutsuKnowledge<2000)
							usr<<"You need more Ninjutsu Knowledge.";return
						usr << "<b>Here we go!"
						sleep(30)
						usr.loc=locate(141,181,18)


	MonkeyStatue
		name ="Statue"
		icon='MonkeyStatue.dmi'
		icon_state="MonkeyStatue"
		health=9999999999999999999999999999999999999999999999
		CNNPC=1
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"Its well detailed..."

	MonkeyInstructor
		name ="Toru the Instructor"
		icon='Monkey.dmi'
		icon_state="MNPC2"
		health=9999999999999999999999999999999999999999999999
		CNNPC=1
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr.Frozen=1
			usr<<"Why, what a surprise... A human?"
			sleep(11)
			usr<<"Huh?"
			sleep(5)
			usr<<"I assume you are here for the training."
			sleep(11)
			usr<<"Training..Wait a second a monkey talking!?"
			sleep(20)
			usr<<"Anyway, listen human"
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			sd_Alert(usr, "If you aren't already aware, this is the monkey realm and I'm the instructor. You being here must mean you've already been approoved by Moria, in which case he wants you to go through the test. If you manage to pass you may even have the option to learn from our Monkey Elder.Well I've done my part, if you are still interested just head to that building over there and take the test, and good luck boy.","[src]",,,,0,"400x150",,style)




//Monkey Training Session Begins and missions





///Teleporter
turf/EventTrainers/SageMode
	ToSageMode
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(117,4,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(173,105,1)
			else
				..()
	OutSageMode
		density=0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.loc=locate(174,40,1)
			else if(isobj(A))
				var/obj/B=A
				B.loc=locate(174,40,1)
			else

				..()
















mob/var
	SageTest=1
	BananaMission=1


//Bannana Hunting
//BookAssignment

obj/SageExam
	icon = 'Test.dmi'
	var
		PointsRequiredToPass=10
	SageModeExam
		dir=SOUTH
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
			//	var/HaveClone=0
			//	var/HaveSubsitution=0
			//	var/HaveTransformation=0
			//	for(var/obj/SkillCards/BunshinJutsu/A in usr.LearnedJutsus)
			//		HaveClone=1
			//	for(var/obj/SkillCards/Kawarimi/A in usr.LearnedJutsus)
			//		HaveSubsitution=1
			//	for(var/obj/SkillCards/Henge/A in usr.LearnedJutsus)
			//		HaveTransformation=1
			//	if(!usr.CanNavigate)
			//		usr<<"You aren't even able to navigate. You should learn how to do this before you take the test!";return
			//	if(!HaveTransformation)
			//		usr<<"You need to learn Transformation Jutsu first!";return
			//	if(!HaveSubsitution)
			//		usr<<"You need to learn Subsitution Jutsu first!";return
			//	if(!HaveClone)
			//		usr<<"You need to learn Clone Jutsu first!";return
			//	if(usr.Genintest)
			//		return
			//	if(usr.rank!="Sage")
			//		usr<<"You've already graduated";return
				usr.Frozen=1
				usr.score=1
				switch(input(usr,"What is Sage Nature?","Test",) in list("Chakra control over nature ","The phenomena of the physical world collectively","Each of the centers of spiritual power in the human body"))
					if("The phenomena of the physical world collectively")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What is H2O composed of?","Test",) in list("H and 2 stand for 2 hydrogen atoms, while O means one oxygen atom"," composed of nature","The five elements"))
					if("H and 2 stand for 2 hydrogen atoms, while O means one oxygen atom")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What is an atom?","Test",) in list("Atoms are the basic building blocks of ordinary matter","Atoms are composed of particles called raitons","The art in which sage has been passed through"))
					if("Atoms are the basic building blocks of ordinary matter")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What is the X Coordinate?","Test",) in list("Left and Right","Up and Down","Diagonals","None Of The Above"))
					if("Left and Right")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What is the nature behind fire elemental?","Test",) in list("Combustion or burning"," Discharge a gun or other weapon","Knowledge over matter"))
					if("Combustion or burning")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What are passives?","Test",) in list("A person's skills","A person's techniques","A person's soul!!!"))
					if("A person's skills")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Which weapon would logically hit percentile based?","Test",) in list("Bo-Staff","Katana","Nunchuks","All Of The Above","Niether"))
					if("Katana")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Why is nature chakra such an efficent way of usage in combat?","Test",) in list("The nature behind life is used for killing","Its refers to the food chain","The nature chakra uses energy from sourroundings"))
					if("Percentile")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What is required in making Ninjutsu techniques?","Test",) in list("Shape Manipulation","Nature Manipulation","Chakra","Determination","All of the Above"))
					if("All of the Above")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"How long do you have to wait for a Learning Cooldown?","Test",) in list("1 Day","1 Age","16 Minutes","Depends on the Jutsu","35 Minutes"))
					if("Depends on the Jutsu")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Which one of these is considered Nature Manipulation?","Test",) in list("Katon Jutsu","Genjutsu","Taijutsu","Kenjutsu"))
					if("Katon Jutsu")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"How many Chakra Natures is an average ninja able to utilize?","Test",) in list("1","2","3","4","5","6","Cannot be determined"))
					if("Cannot be determined")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Why does Wind Release beat Lightning Release?","Test",) in list("It breaks the lightning in two","It disrupts the chakra","It seperates the eletrical charges","It just does"))
					if("It seperates the eletrical charges")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"How does someone utilize Lightning Release?","Test",) in list("By Vibrating their chakra at high frequencies","By turning their chakra white and sparky","By making their chakra random and unpredictable"))
					if("By Vibrating their chakra at high frequencies")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"How would you throw a weapon?","Test",) in list("Double Click it","Equip it to a hand, unseath it then attack","You don't","By pressing G"))
					if("Equip it to a hand, unseath it then attack.")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What passive determines your ability to perform handseals correctly?","Test",) in list("Handseal Skill","Handseal Mastery","Handseal Proficiency","Handseal Speed"))
					if("Handseal Mastery")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"How can someone be casted under a Genjutsu?","Test",) in list("By making them smell bad smells","By corrupting their chakra with their own chakra","By using psychological tricks"))
					if("By corrupting their chakra with their own chakra")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"A ninja can have a maximum of how many chakra natures?","Test",) in list("1","2","3","4","5","Depends on The Ninja"))
					if("Depends on The Ninja")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What reduces damage of Physical attacks?","Test",) in list("Guarding","Passives","All Of The Above","Nothing"))
					if("Guarding")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Who summoned you to the monkey realm?","Test",) in list("Makio","Moria","Manio","Mokia"))
					if("Moria")
						usr.score+=1
					else
						usr.score-=10
				var/Score=0
				if(usr.score!=0)
					Score=(usr.score/20)*100
				usr<<"You've finished your test with a [Score]!!!."
				usr.Frozen=0
				usr.SageTest=2
				if(Score>=70)
					usr<<"<font size=2><b><font color=yellow>Congratulations you have passed the sage mode exam [Score] Points!"
					usr.rank ="Sage"
					usr.SageTest=0
					usr.score=0
			//		var/obj/Clothes/Headband/B=new();B.loc=usr
			//		usr<<"You were given a couple of items to start your Genin career."
			//		if(usr.Clan=="Uchiha")
			//			var/obj/Clothes/Uchiha_Crest/C = new()
			//			C.loc = usr
			//			usr.gottenuchihacrest=1
			//			usr<<"You've been given an Uchiha Crest Symbol to place on your clothing and show your clan pride."
			//		var/obj/WEAPONS/Kunai/A=new();A.ammount=10;A.loc=usr
			//		var/obj/WEAPONS/Shuriken/C=new();C.ammount=10;C.loc=usr
			//		usr.Yen+=1000
			//		usr.move=0
				if(usr.SageTest==2)
					usr<<"<You've already failed the test once, don't bother!";return


//BossMonkey

mob/NPC
	Boss
		CNNPC=0
		name="Emma(NPC)"
		icon='Icons/New Base/Base.dmi'
		icon_state=""
		Village="Missing"
		rank="Missing-Nin"
		Age=200
		ChakraC=70
		KatonKnowledge=500
		SuitonKnowledge=501
		RaitonKnowledge=500
		DotonKnowledge=500
		FuutonKnowledge=500
		FireChakra=20
		WindChakra=20
		Swift=5
		HandsealSpeed=20
		Reflex=70
		maxhealth=2500
		health=2500
		Mchakra=9000
		chakra=9000
		maxstamina=8000
		stamina=8000
		Mtai=140
		Mnin=100
		Mgen=100
		tai=140
		nin=100
		gen=100
		Pedestrian=1
		NeedsFace=1
		part1p=0
		tempmix3=0
		viewsight=100
		AOS=1
		walks=0






