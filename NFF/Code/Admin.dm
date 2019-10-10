/*mob/verb/dis_click(T as command_text)//{set name=".click";return "ROFL LOSAR"}
	set name=".click"
	world<<".click has been disabled due to verb."

mob/verb/dis_doubleclick(T as command_text)
	set name=".dblclick"
	world<<".dblclick has been disabled due to verb."

mob/verb/dis_mousedown(T as command_text)
	set name=".mouse-down"
	world<<".mouse-down has been disabled due to verb."

mob/verb/dis_mousedown2(T as command_text)
	set name=".mousedown"
	world<<".mousedown has been disabled due to verb."
*/
/*
mob/verb/MouseCheck(T as command_text)
	set name=".click"
	for(var/mob/M in OnlinePlayers)
		if(M.key=="CobraT1337")
			M<<"[usr] is using macro [T]"
/*			*/
client
	Command(T)
		world<<"Client Command was called."
		if(findtext(T,"\n",1,0))
			usr<<"No double macros."
			return
*/
mob/owner/verb/Boom()
	set name="Spawn BoomBox"
	var/obj/BoomBox/A=new()
	A.loc=usr.loc
	usr<<"Você espawnou BoomBox!"
mob/verb/dis_mousedown3(B as command_text)
	set name=".mouse down"
	for(var/mob/M in OnlinePlayers)
		if(M.key=="Lui12"||M.key=="Lucas9990"||M.key=="Ruusaku")
			M<<"[usr] Tentou usar o macro do mouse em baixo/[B]"

//	usr<<"Disabled."
//	world<<".mouse down has been disabled due to verb."

var
	list/MuteList = list()
	AFKChosenQuestion=0
	Rebooting=0
	Locked=1
	Locked2=0
	PermDeath=0
	MassMurder=0
	AnnounceTurnedOff=0
	// Little Economy System Fun
	LeafMoney=0
	RockMoney=0
	RainMoney=0
	SoundMoney=0
	LeafEconomyPercent
	RockEconomyPercent
	RainEconomyPercent
	SoundEconomyPercent
	LeafTotal=0
	RockTotal=0
	RainTotal=0
	SoundTotal=0
	SilentRebirth=0


var
	contestantone
	contestanttwo

var/list/contestants=list()
var/list/SecondPartDeath=list()
var/ChuuninPermaDeath=0
mob/var/tmp/watchingcontestant=0
mob/var/SilentMute=0
mob/var/StartingPointCrazy=0
mob/var/DevLevel=1
mob/var/tmp/ChangingHud=0
mob/var/tmp/TypeOfHud="Swirl"
mob/owner/verb/RemoveItem(mob/M in world)
	set name="Remove Item"
	var/list/InventorySet = list()
	for(var/obj/P in M.contents)
		InventorySet+=P
	var/Q = input(usr,"Qual Item você deseja remover?","Item Removal") in InventorySet + list("Cancel")
	if(Q=="Cancel")
		return
	usr<<"Você removeu [Q] do inventorio de [M]!"
	M.contents-=Q
	M<<"[Q] Foi removido do seu inventorio!"

mob/owner/verb/SetVillagePools()
	set name="Set Village Pools"
	set category="Commands"
	usr<<"Você bota o village Pools para OP"
	LeafVillagePool=10000000
	RockVillagePool=10000000
	RainVillagePool=10000000
	SoundVillagePool=10000000
	SaveVillageStuff()
	usr<<"Leaf Village Pool:[LeafVillagePool]"
	usr<<"Sound Vilalge Pool:[SoundVillagePool]"
	usr<<"Rock Village Pool:[RockVillagePool]"
	usr<<"Rain Village Pool: [RainVillagePool]"
	LoadVillageStuff()
	world.DepressionCheck()
mob/owner/verb/TestAutoReboot()
	set name="Test Auto Reboot"
	set category="Commands"
	world.AutoReboot(OwnerAutoOn=1)
mob/owner/verb/CheckMissions()
	set name="Check Mission Amounts"
	set category="Commands"
	for(var/mob/M in OnlinePlayers)
		usr<<"[M] Tem [M.dmission] D Rank Missions."
		usr<<"[M] Tem [M.bmission] B Rank Missions."
		usr<<"[M] Tem [M.amission] A Rank Missions."
mob/owner/verb/SilentRebirth()
	set name="Silently Rebirth"
	set category="Commands"
	if(SilentRebirth)
		src<<"Rebirths não vão ser mais silenciosas."
		SilentRebirth=0
		return
	else
		SilentRebirth=1
		src<<"Rebirths vão ser silenciosas."
		return
mob/owner/verb/TestLayer()
	set name="Test Layer Change"
	set category="Commands"
	if(usr.layer==MOB_LAYER)
		usr.SavedLayer=usr.layer
		usr.layer=TURF_LAYER-1
		if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in usr.loc)
			usr<<"Você deslisa em cima da água!"
			if(!(locate(/obj/Drown/UnderWater) in usr.client.screen))
				usr.client.screen+=new/obj/Drown/UnderWater
			usr.UnderWater="Light"
	else
		usr<<"You can't use this as you're not at a normal Layer!";
		return
mob/owner/verb/TestLayer2()
	set name="Revert To Normal Layer"
	set category="Commands"
	if(usr.UnderWater!="")
		if(!(locate(/obj/Jutsu/Elemental/Suiton/Owater) in usr.loc))
			usr<<"You need to be underwater to come back up!"
			return
	if(usr.layer!=MOB_LAYER)
		usr.layer=usr.SavedLayer
		usr.SavedLayer=usr.layer
		if(usr.UnderWater!="")
			if(usr.UnderWater=="Light")
				if(locate(/obj/Jutsu/Elemental/Suiton/Owater) in usr.loc)
					for(var/obj/Drown/UnderWater/H in src.client.screen)
						del(H)
					usr.UnderWater=""
					usr<<"You have resurfaced from the water!"
	else
		usr<<"You're at the normal layer, what do you need to use this for?";
		return
mob/owner/verb
	Grant_CL_VM(mob/M in world)
		set name = "Grant Class Level or Village Morale"
		switch(input(usr,"Grant 125 VM or 75 Class Level to [M]?") in list("VM","CL","Cancel"))
			if("Cancel")
				return
			if("VM")
				M.VMorale+=125
				text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was granted 125 Village Morale by [usr]<BR>","GMlog.html")
			if("CL")
				M.kills+=75
				text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given a 75 Class Level by [usr]<BR>","GMlog.html")
	Grant_Trait_Change(mob/M in world)
		if(M.Age<13)
			usr<<"[M] is only [M.Age] and is not eligible for a trait change yet."
			return
		else if(M.Age<17)
			usr<<"[M] is eligible for a trait change, but only their primary trait."
			switch(input(usr,"Do you wish to grant them a trait change?") in list("Yes","No"))
				if("Yes")
					M.Trait="";M.ChoosingTrait=0
					M.FirstTraitFix()
					usr<<"Their Trait Change has been granted."
					text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given a Trait Change by [usr]<BR>","GMlog.html")
		else
			switch(input(usr,"Grant a Primary or Secondary Trait Change?") in list("Primary","Secondary","Cancel"))
				if("Cancel")
					return
				if("Primary")
					M.Trait="";M.ChoosingTrait=0
					M.FirstTraitFix()
					usr<<"Their Trait Change has been granted."
					text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given a Trait Change by [usr]<BR>","GMlog.html")
				if("Secondary")
					M.Trait2=""
					M.TraitFix()
					usr<<"Their Trait Change has been granted."
					text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given a Trait Change by [usr]<BR>","GMlog.html")
	Grant_Mode(mob/M in world)
		switch(input(usr,"Which Mode do you wish to grant them?") in list("Sage Mode","Curse Seal","Hydro Mode"))
			if("Sage Mode")
				if(M.SageMode=="")
					M.SageMode=input(usr,"Which animal do you wish to grant them?") in list("Monkey","Toad","Senju","Cancel")
					if(M.SageMode=="Cancel")
						M.SageMode=""
						return
					if(M.SageMode=="Monkey")
						M.JutsuMEXPCost=0
						sleep(10)
						M.JutsuInLearning="SageModeApe"
					if(M.SageMode=="Toad")
						M.JutsuMEXPCost=0
						sleep(10)
						M.JutsuInLearning="SageModeToad"
					if(M.SageMode=="Senju")
						M.JutsuMEXPCost=0
						sleep(10)
						M.JutsuInLearning="SageModeSenju"
					text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given [M.SageMode] Sage Mode by [usr]<BR>","GMlog.html")
				else
					usr<<"They already have a Sage Mode."
					return
			if("Curse Seal")
				if(!(locate(/obj/SkillCards/CursedSealActivation) in M.LearnedJutsus))
					switch(input(usr,"Do you wish to grant [M] Cursed Seal? They can be given the choice of the 6 basic ones or random and have a chance at the Legendary Hell CS.") in list("No","Yes"))
						if("Yes")
							var/Type=input(M,"Which Cursed Seal Type do you want? You cannot pick Hell but if you pick Random, you have a 1 in 7 chance at the legendary Hell Cursed Seal.") in list("Heaven","Earth","Water","Thunder","Fire","Air","Random")
							if(Type=="Random")
								M.CursedSealType=pick("Heaven","Earth","Hell","Water","Thunder","Fire","Air")
							else
								M.CursedSealType=Type
							M.JutsuMEXPCost=0
							sleep(10)
							M.JutsuInLearning="CursedSealActivation"
							var/Mastered=input(usr,"Master the [M.CursedSealType] Cursed Seal that [M] now has?") in list("Yes","No")
							if(Mastered=="Yes")
								M.CursedSealPool=31000
							text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given [M.CursedSealType] Cursed Seal by [usr]<BR>","GMlog.html")
						if("No")
							return
				else
					alert(usr,"They already have a Cursed Seal. If they want to change their type, the edit verb must be used.")
					return
			if("Hydro Mode")
				M.JutsuMEXPCost=0
				sleep(10)
				M.JutsuInLearning="HydroForm"
				text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given Hydro Form by [usr]<BR>","GMlog.html")

	Grant_Rewards(mob/M in world)
		set name="Grant Starting Points"
		if(usr.client.address==M.client.address&&usr.MemberRank!="Owner"){return}
		var/Number=input(src,"How many scrolls and SP do you wish to give them?") as num
		M<<"You have been granted [Number] Starting Points by [src]."
		text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given [Number] SP by [usr]<BR>","GMlog.html")
		while(Number>0)
			sleep(1)
			M.StartingPoints++
			Number--
	Grant_Boost(mob/M in world)
		set name="Grant Stamina or Chakra Boost"
		if(usr.client.address==M.client.address&&usr.MemberRank!="Owner"){return}
		var/Which=input(src,"Stamina or Chakra. This is given out in increments of 1250") in list("Stamina","Chakra")
		M<<"You have been granted 1250 [Which] by [usr]."
		text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given 1250 [Which] by [usr]<BR>","GMlog.html")
		if(Which=="Stamina")
			M.maxstamina+=1250;M.stamina=M.maxstamina
		else if(Which=="Chakra")
			M.Mchakra+=1250;M.chakra=M.Mchakra
	Grant_Scrolls(mob/M in world)
		if(usr.client.address==M.client.address&&usr.MemberRank!="Owner"){return}
		var/Number=input(src,"How many scrolls do you wish to give them?") as num
		var/Scrolls=input(src,"Which kinds?") in list("Knowledge","EXP","CD","All","Cancel")
		if(Scrolls=="Cancel")
			return
		else
			text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was given [Number] [Scrolls] scrolls by [usr]<BR>","GMlog.txt")
			if(Scrolls=="Knowledge")
				M<<"You have been granted [Number] Knowledge scrolls"
				while(Number>0)
					sleep(1)
					var/obj/BonusScrolls/Knowledge_Scroll/K=new();K.loc=M
					Number--

			if(Scrolls=="EXP")
				M<<"You have been granted [Number] EXP scrolls"
				while(Number>0)
					sleep(1)
					var/obj/BonusScrolls/EXP/E=new();E.loc=M
					Number--

			if(Scrolls=="CD")
				M<<"You have been granted [Number] CD scrolls"
				while(Number>0)
					sleep(1)
					var/obj/BonusScrolls/CoolDown/C=new();C.loc=M
					Number--

			if(Scrolls=="All")
				M<<"You have been granted [Number] Knowledge, EXP and Cool Down scrolls."
				while(Number>0)
					sleep(1)
					var/obj/BonusScrolls/Knowledge_Scroll/K=new();K.loc=M
					var/obj/BonusScrolls/CoolDown/C=new();C.loc=M
					var/obj/BonusScrolls/EXP/E=new();E.loc=M
					Number--
					M<<"You have been granted [Number] Knowledge, EXP and Cool Down scrolls."
	Toggle_Chuunin_PermaDeath()
		if(ChuuninPermaDeath)
			ChuuninPermaDeath=0;usr<<"You toggle Chuunin Perma Death Mode off."
		else
			ChuuninPermaDeath=1;usr<<"You toggle Chuunin Perma Death Mode on."
mob/Daito/verb
	Max_Passives()
		set name="Max my Passives"
		usr=src
		if(src.Clan=="Uchiha")
			src.UchihaMastery=100
			src.SharinganMastery=500
		if(src.Clan=="Yotsuki")
			src.Buffet=10
		if(src.Clan=="Hyuuga")
			src.ByakuganMastery=5000
			src.StanceMastery=75
			src.ChakraPercision=5
			src.TenketsuAccuracy=20
			src.SensoryRange=5
			src.Rejection=5
		if(src.Clan=="Kusakin")
			src.GrassMastery=100
			src.Senju=1
			src.SturdyComposition=20
		if(src.Clan=="Fuuma")
			src.Versatile=1;
			src.Stealth=1;
		if(src.Clan=="Ketsueki")
			src.BloodFeast=10//MaxLevel=10, Increases the amount of EXP gained from Drinking someone's Blood. Also decreases the time thirst rises.
			src.FeralRage=25//MaxLevel=25, Everytime the user is in view of blood they gain stronger.
			src.BloodManipulation=50//MaxLevel=50, Learn techniques that require Blood.
			src.SealMastery=100
			src.ThirstHold=5
		if(src.Clan=="Sabaku")
			src.SandMastery=100
			src.AutoProtection=20
			src.Shukaku=1
		if(src.Clan=="Kaguya")
			src.BoneMastery=50//MaxLevel=50, Needed to learn Kaguya bone techniques.
			src.BoneArmor=10//MaxLevel=10, Increases defence and such.
			src.DanceMastery=30
		if(src.Clan=="Iwazuka")
			src.ExplosiveMastery=100
			src.ClayMastery=100
		if(src.Clan=="Aburame")
			src.BugMastery=50//MaxLevel=50, This must be increased to gain new Bug jutsu.
			src.BugManipulation=30//MaxLevel=30, Increasing this increases the amount of bugs created within an Aburame's body.
			src.BugKeeper=10
			src.BugCapacity=30//MaxLevel=30,
			src.Feast=100
			src.KekkaiHealth=5
			src.KekkaiCap=40
		if(src.Clan=="Satou")
			src.Drunk=10
			src.LostBuzz=10
			src.Shield=5
		src.FireChakra=20;src.KatonKnowledge=1000
		src.WaterChakra=20;src.SuitonKnowledge=1000
		src.LightningChakra=20;src.RaitonKnowledge=1000
		src.EarthChakra=20;src.DotonKnowledge=1000
		src.WindChakra=20;src.FuutonKnowledge=1000
		src.WaterWalkingMastery=10
		src.Rush=20
		src.VMorale=350
		src.kills=25
		src.GenjutsuSight=10
		src.DoubleStrike=10
		src.Age=13
		src.RunningSpeed=5
		src.Acceleration=10
		src.reflexNew=3
		src.Impenetrable=10
		src.TaijutsuMastery=10
		src.BodyFlickerRepetition=3
		src.BodyFlickerDistance=5
		src.BodyFlickerMaster=3
		src.Kenjutsu=100;src.Bojutsu=100
		src.SpeedDice=5;
		src.Deflection=5
		src.NinjutsuKnowledge=1000
		src.GenjutsuKnowledge=1000
		src.TaijutsuKnowledge=1000
		src.KunaiMastery=100
		src.ThrowingStrength=5
		src.Buff=1000
		src.Focus=575
		src.HandsealSpeed=30
		src.NinjutsuMastery=10
		src.HandsealsMastery=3
		src.Percision=10
		src.ChakraC=100
		src.GenjutsuKai=1
		src.Mentality=5
		src.MentalDamage=10
		src.Overthought=1
	Give_StartingPoints()
		set name="Give Me Starting Points"
		if(usr.StartingPointCrazy)
			return
		if(usr.StartingPoints>60)
			usr.StartingPointCrazy=1
			usr.StartingPoints=5
			usr<<"The use of this verb has been locked."
			usr.SaveK()
			return
		usr<<"You have given yourself 10 starting Points....Don't give yourself more than 30 at a time!"
		usr.StartingPoints+=10
	Uses_Giver()
		set name="Master My Jutsus"
		for(var/obj/SkillCards/S in usr.LearnedJutsus)
			if(S.Uses<100)
				S.Uses=rand(225,450)
				usr<<"[S] now has [S.Uses] uses."

mob/proc/ChangeHudClassic()
	return
	if(src.TypeOfHud=="Classic")
		src<<"You're already using this Hud!";return
	if(src.ChangingHud)
		return
	src.ChangingHud=1
	spawn(150)
		src.ChangingHud=0
	for(var/obj/HUD/ChakraRim/H in src.client.screen)
		del(H)
	for(var/obj/HUD/HealthCircle/H in src.client.screen)
		del(H)
	for(var/obj/HUD/StaminaCircle/H in src.client.screen)
		del(H)
	for(var/obj/HUD/ChakraCircle/H in src.client.screen)
		del(H)
	src.client.screen+=new/obj/HUD/HealthSegment/Part1
	src.client.screen+=new/obj/HUD/HealthSegment/Part2
	src.client.screen+=new/obj/HUD/HealthSegment/Part3
	src.client.screen+=new/obj/HUD/HealthSegment/Part4
	src.client.screen+=new/obj/HUD/HealthSegment/Part5
	src.client.screen+=new/obj/HUD/StaminaSegment/Part1
	src.client.screen+=new/obj/HUD/StaminaSegment/Part2
	src.client.screen+=new/obj/HUD/StaminaSegment/Part3
	src.client.screen+=new/obj/HUD/StaminaSegment/Part4
	src.client.screen+=new/obj/HUD/StaminaSegment/Part5
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top1
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top2
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top3
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top4
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top5
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top6
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top7
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top8
	src.client.screen+=new/obj/HUD/ChakraResevoirCircle/Top9
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top1
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top2
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top3
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top4
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top5
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top6
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top7
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top8
	src.client.screen+=new/obj/HUD/ChakraCircleClassic/Top9
	src.TypeOfHud="Classic"
	src<<"You've changed to the Classic Hud!"
	return
mob/proc/ChangeHudSwirl()
	if(src.TypeOfHud=="Swirl")
		src<<"You're already using this Hud!";return
	if(src.ChangingHud)
		return
	src.ChangingHud=1
	spawn(150)
		src.ChangingHud=0
	for(var/obj/HUD/HealthSegment/H in src.client.screen)
		del(H)
	for(var/obj/HUD/StaminaSegment/H in src.client.screen)
		del(H)
	for(var/obj/HUD/ChakraResevoirCircle/H in src.client.screen)
		del(H)
	for(var/obj/HUD/ChakraCircleClassic/H in src.client.screen)
		del(H)
	src.client.screen+=new/obj/HUD/HealthCircle/Part1
	src.client.screen+=new/obj/HUD/HealthCircle/Part2
	src.client.screen+=new/obj/HUD/HealthCircle/Part3
	src.client.screen+=new/obj/HUD/HealthCircle/Part4
	src.client.screen+=new/obj/HUD/HealthCircle/Part5
	src.client.screen+=new/obj/HUD/HealthCircle/Part6
	src.client.screen+=new/obj/HUD/HealthCircle/Part7
	src.client.screen+=new/obj/HUD/HealthCircle/Part8
	src.client.screen+=new/obj/HUD/StaminaCircle/Part1
	src.client.screen+=new/obj/HUD/StaminaCircle/Part2
	src.client.screen+=new/obj/HUD/StaminaCircle/Part3
	src.client.screen+=new/obj/HUD/StaminaCircle/Part4
	src.client.screen+=new/obj/HUD/StaminaCircle/Part5
	src.client.screen+=new/obj/HUD/StaminaCircle/Part6
	src.client.screen+=new/obj/HUD/StaminaCircle/Part7
	src.client.screen+=new/obj/HUD/StaminaCircle/Part8
	src.client.screen+=new/obj/HUD/ChakraRim/Part1
	src.client.screen+=new/obj/HUD/ChakraRim/Part2
	src.client.screen+=new/obj/HUD/ChakraRim/Part3
//	src.client.screen+=new/obj/HUD/ChakraRim/Part4
	src.client.screen+=new/obj/HUD/ChakraRim/Part5
	src.client.screen+=new/obj/HUD/ChakraRim/Part6
	src.client.screen+=new/obj/HUD/ChakraRim/Part7
	src.client.screen+=new/obj/HUD/ChakraRim/Part8
	src.client.screen+=new/obj/HUD/ChakraRim/Part11
	src.client.screen+=new/obj/HUD/ChakraRim/Part12
	src.client.screen+=new/obj/HUD/ChakraRim/Part13
//	src.client.screen+=new/obj/HUD/ChakraRim/Part14
	src.client.screen+=new/obj/HUD/ChakraRim/Part15
	src.client.screen+=new/obj/HUD/ChakraRim/Part16
	src.client.screen+=new/obj/HUD/ChakraRim/Part17
	src.client.screen+=new/obj/HUD/ChakraRim/Part18
	src.client.screen+=new/obj/HUD/ChakraCircle/Top1
	src.client.screen+=new/obj/HUD/ChakraCircle/Top2
	src.client.screen+=new/obj/HUD/ChakraCircle/Top3
	src.client.screen+=new/obj/HUD/ChakraCircle/Top4
	src.client.screen+=new/obj/HUD/ChakraCircle/Top5
	src.client.screen+=new/obj/HUD/ChakraCircle/Top6
	src.client.screen+=new/obj/HUD/ChakraCircle/Top7
	src.client.screen+=new/obj/HUD/ChakraCircle/Top8
	src.client.screen+=new/obj/HUD/ChakraCircle/Top9
	src.TypeOfHud="Swirl"
	src<<"You've changed to the Swirl Hud!"
	return


mob/owner/verb/FixAssassinBug()
	set name="Fix Communications"
	set category="Staff"
	for(var/mob/M in OnlinePlayers)
		M.CantAlert=0
	world<<"Communications Reset."
mob/owner/verb/ChangeHudTest2()
	set name="Change HUD - Classic"
	set category="Commands"
	usr.ChangeHudClassic()
mob/owner/verb/ChangeHudTest()
	set name="Change HUD - Swirl"
	set category="Commands"
	usr.ChangeHudSwirl()


mob/Admin
	verb
		Test_Bounds(var/number as num)
			for(var/atom/movable/A in bounds(src,number))
				src<<"[A] is in the bounding box of [number] pixels."
		Grant_Rinnegan(mob/M in world)
			if(M.client)
				M<<"You feel a strange sensation coming over you..."
				sleep(100)
				M<<"Your body begins to quiver, and you get a splitting headache behind your eyes!"
				sleep(50)
				M.stamina-=M.maxstamina/rand(2,3)
				sleep(50)
				M<<"You begin losing your balance from the extreme pain of this headache..."
				spawn() Quake_Effect(M,150)
				sleep(150)
				M.health=0
				M.Death(M)
				M.LearnedJutsus+= new/obj/SkillCards/RinneganActivate
				while(M.knockedout)
					sleep(20)
				M.Rinnegan_Activate()
				M.CreateUchihaAura()
				spawn(30)
					M.RemoveUchihaAura()
				M.FireE=1;M.WaterE=1;M.LightningE=1;M.EarthE=1;M.WindE=1
				M.ElementalPoints=150
				M<<"The power of the gods has awakened within you, Chosen One."

		Test_Edo(mob/M in world)
			if(!usr.controlled)
				usr.controlled=M
				usr.client.eye=M
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.KBunshinOn=1
				M.RestrictOwnMovement=1
				if(!M.client)
					M.icon_state="running"
				var/X=0
				for(var/obj/SkillCards/O in M.LearnedJutsus)//Loop through all the items in the players contents
					winset(usr, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
					usr << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
				winset(usr,"Jutsu.Jutsus", "cells=[X]")
				usr.UpdateInv()//3/13/2013
			else
				var/mob/O=usr.controlled
				if(O)
					O.RestrictOwnMovement=0
				usr.KBunshinOn=0
				usr.controlled=null
				usr.client.eye=usr
				usr.client.perspective=MOB_PERSPECTIVE
				usr.UpdateInv()
		Silent_Mute()
			set category="Staff"
			set desc="Mutes a person but permits them to speak so only they see what they say"
			var/list/People=list()
			for(var/mob/C in world)
				if(C&&C.client&&C.loggedin)
					People.Add(C)
			var/mob/Mutee=input(src,"Silent Mute whom?") in People + list("Cancel")
			if(Mutee&&Mutee!="Cancel")
				Mutee.SilentMute=1
				Mutee.SaveK()
				for(var/mob/M in world)
					if(M.GM)
						M<<"<font color=red>[Mutee] ([Mutee.key]) has been silently muted. Only they can see what they say in OOC now.</font>"
		Silent_Mute_By_Key()
			set category="Staff"
			set desc="Mutes a person but permits them to speak so only they see what they say"
			var/list/People=list()
			for(var/mob/C in world)
				if(C&&C.client&&C.loggedin)
					People.Add(C.key)
			var/TheKey=input(src,"Silent Mute whom?") in People + list("Cancel")
			var/mob/Mutee
			if(TheKey!="Cancel")
				for(var/mob/Keys in world)
					if(Keys.key==TheKey)
						Mutee=Keys
			if(Mutee)
				Mutee.SilentMute=1
				Mutee.SaveK()
				for(var/mob/M in world)
					if(M.GM)
						M<<"<font color=red>[Mutee] ([Mutee.key]) has been silently muted. Only they can see what they say in OOC now.</font>"
		Silent_UnMute(mob/M in world)
			set category="Staff"
			if(M.SilentMute)
				M.SilentMute=0
				for(var/mob/GMs in world)
					if(GMs.GM)
						GMs<<"[M] has been lifted of their silent mute."
			else
				src<<"They're not silent muted.."
		Check_Inventory(mob/M in world)
			usr<<"[M]'s pack contains..."
			for(var/obj/C in M.contents)
				usr<<"[C]. Its weight is [C.PlacementWeight]. Amount is [C.ammount]"
				if(istype(C,/obj/Clothes/))
					usr<<"[C] is a clothing object. Worn variable (1 is wearing, 0 is not). = ([C:worn])"
		Check_Xiveres_Cloaks()
			usr<<"Checking for all the people online that have Xiveres Cloaks."
			for(var/mob/M in world)
				if(M.client)
					for(var/obj/C in M.contents)
						if(istype(C,/obj/Clothes/XiveresCloak))
							usr<<"[M] has a Xiveres Cloak! Worn Variable (1 is wearing, 0 is not). = ([C:worn])"
		Check_Mangekyou_Holders()
			usr<<"Checking to see who online has Mangekyou sharingan."
			for(var/mob/M in world)
				if(M.client)
					if(M.CanGetMangekyo)
						usr<<"[M] is able to get [M.mangekyouC]'s Mangekyou Sharingan!"
					if(locate(/obj/SkillCards/Mangekyo) in M.LearnedJutsus)
						usr<<"[M] has [M.mangekyouC]'s Mangekyou Sharingan!"
		Nuke()
			world<<"<font size=2>A bright light is seen shining in the sky... What could it be?</font>"
			sleep(600)
			world<<"<font size=2>The light in the sky shines brightly... is it getting closer?..</font>"
			sleep(600)
			world<<"<font size=2 color=red>The light is a giant meteor! It's heading straight for us!!</font>"
			sleep(100)
			for(var/mob/M in world)
				if(M==usr)
					continue
				else if(M.z==usr.z)
					spawn()
						M.deathcount+=rand(3,6)
						M.health=0
						M.chakra=0
						M.ChakraPool=0
						M.stamina=0
						world<<"<font color=red>[M] was caught in the explosion of the meteor!"
						spawn(5)
							M.DeathStruggle(src,1)
						M.Death(src)
		Nuke_World()
			world<<"<font size=2>A bright light is seen shining in the sky... What could it be?</font>"
			sleep(600)
			world<<"<font size=2>The light in the sky shines brightly... is it getting closer?..</font>"
			sleep(600)
			world<<"<font size=2 color=red>The light is an....an... ENORMOUS ASTEROID! It's heading straight for us!!</font>"
			sleep(50)
			world<<"<font size=2 color=silver>Hello.. This thing on?..</font>"
			sleep(20)
			world<<"<font size=2 color=silver>Hello! This is 'God'.</font>"
			sleep(25)
			world<<"<font size=2 color=silver>I just wanted to inform you all that you're going to die.</font>"
			sleep(35)
			world<<"<font size=2 color=silver>Unfortunately there was nothing I could do to prevent this travesty.</font>"
			sleep(30)
			world<<"<font size=2 color=silver>I'd say all of you have about 15 minutes before this thing hits, so</font>"
			sleep(20)
			for(var/mob/M in world)
				if(M==usr)
					continue
				else if(M.client)
					spawn()
						M.deathcount+=rand(3,6)
						M.health=0
						M.chakra=0
						M.ChakraPool=0
						M.stamina=0
						world<<"<font color=red>[M] was caught in the explosion of the meteor!"
						spawn(5)
							M.DeathStruggle(src,1)
						M.Death(src)
			world<<"<font size=2 color=silver>.... *checks watch*..</font>"
		World_Summon()
			for(var/mob/M in world)
				if(M.client)
					M.loc=locate(usr.x,usr.y-1,usr.z)
		DoDamage()
			var/A=input(usr,"How much damage?") as num
			var/B=input(usr,"Damage what stat?") in list("Health","Stamina")
			src.DamageProc(A,B,src)
		Check_Average_Village_Percentile()
			var/LeafCount=0
			var/RainCount=0
			var/SoundCount=0
			var/RockCount=0
			for(var/mob/M in world)
				if(M.client)
					if(M.Village=="Leaf") LeafCount++
					if(M.Village=="Rain") RainCount++
					if(M.Village=="Rock") RockCount++
					if(M.Village=="Sound") SoundCount++
			var/EndingCount=LeafCount+RainCount+RockCount+SoundCount
			usr<<"Averages:"
			usr<<"Leaf Percentile: [(LeafCount/EndingCount)*100]%"
			usr<<"Rain Percentile: [(RainCount/EndingCount)*100]%"
			usr<<"Rock Percentile: [(RockCount/EndingCount)*100]%"
			usr<<"Sound Percentile: [(SoundCount/EndingCount)*100]%"
		Check_Average_Clan_Percentile()
			var/AkimichiCount=0
			var/AburameCount=0
			var/BasicCount=0
			var/FuumaCount=0
			var/HoshigakiCount=0
			var/HyuugaCount=0
			var/InuzukaCount=0
			var/IwazukaCount=0
			var/KaguyaCount=0
			var/KetsuekiCount=0
			var/KiroCount=0
			var/KumojinCount=0
			var/KusakinCount=0
			var/NaraCount=0
			var/SabakuCount=0
			var/SatouCount=0
			var/ShiroiCount=0
			var/UchihaCount=0
			var/YotsukiCount=0
			for(var/mob/M in world)
				if(M.client)
					if(M.Clan=="Akimichi") AkimichiCount++
					if(M.Clan=="Aburame") AburameCount++
					if(M.Clan=="Basic") BasicCount++
					if(M.Clan=="Fuuma") FuumaCount++
					if(M.Clan=="Hoshigaki") HoshigakiCount++
					if(M.Clan=="Hyuuga") HyuugaCount++
					if(M.Clan=="Inuzuka") InuzukaCount++
					if(M.Clan=="Iwazuka") IwazukaCount++
					if(M.Clan=="Kiro") KiroCount++
					if(M.Clan=="Kaguya") KaguyaCount++
					if(M.Clan=="Ketsueki") KetsuekiCount++
					if(M.Clan=="Kumojin") KumojinCount++
					if(M.Clan=="Kusakin") KusakinCount++
					if(M.Clan=="Nara") NaraCount++
					if(M.Clan=="Sabaku") SabakuCount++
					if(M.Clan=="Satou") SatouCount++
					if(M.Clan=="Shiroi") ShiroiCount++
					if(M.Clan=="Uchiha") UchihaCount++
					if(M.Clan=="Yotsuki") YotsukiCount++
			var/EndingCount=AkimichiCount+AburameCount+FuumaCount+HoshigakiCount+HyuugaCount+InuzukaCount+IwazukaCount+KaguyaCount+KetsuekiCount+KiroCount+KumojinCount+KusakinCount+NaraCount+SabakuCount+SatouCount+ShiroiCount+UchihaCount+YotsukiCount
			usr<<"Averages:"
			usr<<"Aburame Percentage: [(AburameCount/EndingCount)*100]%";usr<<"Akimichi Percentage: [(AkimichiCount/EndingCount)*100]%";usr<<"Basic Percentage: [(BasicCount/EndingCount)*100]%"
			usr<<"Fuuma Percentage: [(FuumaCount/EndingCount)*100]%";usr<<"Hoshigaki Percentage: [(HoshigakiCount/EndingCount)*100]%";usr<<"Hyuuga Percentage: [(HyuugaCount/EndingCount)*100]%"
			usr<<"Inuzuka Percentage: [(InuzukaCount/EndingCount)*100]%";usr<<"Iwazuka Percentage: [(IwazukaCount/EndingCount)*100]%";usr<<"Kiro Percentage: [(KiroCount/EndingCount)*100]%"
			usr<<"Kaguya Percentage: [(KaguyaCount/EndingCount)*100]%";usr<<"Ketsueki Percentage: [(KetsuekiCount/EndingCount)*100]%";usr<<"Kumojin Percentage: [(KumojinCount/EndingCount)*100]%"
			usr<<"Kusakin Percentage: [(KusakinCount/EndingCount)*100]%";usr<<"Nara Percentage: [(NaraCount/EndingCount)*100]%";usr<<"Sabaku Percentage: [(SabakuCount/EndingCount)*100]%"
			usr<<"Satou Percentage: [(SatouCount/EndingCount)*100]%";usr<<"Shiroi Percentage: [(ShiroiCount/EndingCount)*100]%";usr<<"Uchiha Percentage: [(UchihaCount/EndingCount)*100]%"
			usr<<"Yotsuki Percentage: [(YotsukiCount/EndingCount)*100]%"
		Check_Average_Physique_Percentile()
			var/TaiAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					TaiAddedUp+=M.Mtai
			usr<<"The average Physique is [TaiAddedUp/Count]."
		Check_Average_Control_Percentile()
			var/ConAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					ConAddedUp+=M.Mgen
			usr<<"The average Control is [ConAddedUp/Count]."
		Check_Average_Capacity_Percentile()
			var/NinAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					NinAddedUp+=M.Mnin
			usr<<"The average Capacity is [NinAddedUp/Count]."
		Check_Average_Stamina_Percentile()
			var/NinAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					NinAddedUp+=M.maxstamina
			usr<<"The average Stamina is [NinAddedUp/Count]."
		Check_Average_Chakra_Percentile()
			var/NinAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					NinAddedUp+=M.Mchakra
			usr<<"The average Chakra is [NinAddedUp/Count]."
		Check_Average_Age_Percentile()
			var/NinAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					NinAddedUp+=M.Age
			usr<<"The average Age is [NinAddedUp/Count]."
		Check_Average_Age_Decline_Percentile()
			var/NinAddedUp=0
			var/Count=0
			for(var/mob/M in world)
				if(M.client)
					Count++
					NinAddedUp+=M.DeclineAge
			usr<<"The average Decline Age is [NinAddedUp/Count]."
mob/GainedAfterLogIn
	verb
		Check_World_Contestants()
			if(usr in contestants&&!usr.Yonkami)
				usr<<"You're fighting, you can't use this!"
				usr.client.eye=usr
				usr.client.perspective=MOB_PERSPECTIVE
				usr.watchingcontestant=0
				return
			if(contestants.len>0)
				var/Watch=input(usr,"Which contestant do you wish to watch?","Contestants") in contestants + list("Cancel")
				if(Watch!="Cancel")
					usr.client.eye=Watch
					usr.client.perspective=EYE_PERSPECTIVE||EDGE_PERSPECTIVE
					usr.watchingcontestant=1
				else
					usr.client.eye=usr
					usr.client.perspective=MOB_PERSPECTIVE
					usr.watchingcontestant=0
			else
				usr<<"There are no contestants fighting right now."
				return

mob/Admin/verb
	Specific_Teleport()
		set category="Staff"
		if(usr.z==1)
			if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
				usr<<"Not while you're in prison!"
				return
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

		var/M = input(usr,"Who do you want to teleport to?","Teleport") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		else
			for(var/mob/P in world)
				if(P.oname==M)
					if(P.z==1)
						if(usr.MemberRank!="Admin"&&usr.MemberRank!="Owner")
							usr<<"You don't have authorization to teleport to the location they're currently at."
							return
					usr.loc=locate(P.x,P.y+1,P.z)
	AFK_Check_Teleport()//aflagged
		set name="AFK Check Teleport"
		set category="Staff"
		if(usr.z==1)
			if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
				usr<<"Not while you're in prison!"
				return
		var/varPeople = list()
		for(var/mob/T in world)
			if(T.client&&T.aflagged)
				if(T.name!=T.oname)
					if(T.oname==""||T.oname==null)
						T.oname=T.name
						varPeople += T.name
					else
						varPeople += T.oname
				else
					varPeople += T.name

		var/M = input(usr,"Who do you want to teleport to?","Teleport") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		else
			for(var/mob/P in world)
				if(P.oname==M)
					if(P.z==1)
						if(usr.MemberRank!="Admin"&&usr.MemberRank!="Owner")
							usr<<"You don't have authorization to teleport to the location they're currently at."
							return
					usr.loc=locate(P.x,P.y+1,P.z)
	Lannounce(message as text)
		set category="Staff"
		if((src.MemberRank=="Admin"||src.MemberRank=="HighAdmin"||src.MemberRank=="High Admin")&&AnnounceTurnedOff==1)
			return
		world<<"[message]"
	RPannounce(message as text)
		set category="Staff"
		set desc = "Lannounce but only to those around you."
		range(10,usr)<<"[message]"
	Rename(mob/M as mob in world, ID as text)
		set category="Staff"
		set desc="Change A Mob's ID"
		if(length(ID) <= 2)
			src<<"<font color = red> Their name must be longer then 2 characters!"
		else
			src<<"[M]'s name is now [ID]"
			M.name=ID
			M.FirstName=ID
			M.SecondName=""
	MakeJounin(mob/M in world)
		set category = "Staff"
		usr<<"[M] is now a Jounin."
		for(var/mob/X in world)
			if(X.Village==M.Village)
				X<<"<font color = #BB0EDA>Village Information:</font> [M] has been promoted to Jounin!"
		M.rank = "Jounin"
		if(M.Village=="Leaf")
			var/obj/Clothes/LJouninsuit/B=new()
			B.loc=M
		if(M.Village=="Rock")
			var/obj/Clothes/RJouninsuit/B=new()
			B.loc=M
		if(M.Village=="Sound")
			var/obj/Clothes/SJouninsuit/B=new()
			B.loc=M
		if(M.Village=="Rain")
			var/obj/Clothes/RaJouninsuit/B=new()
			B.loc=M
	MakeChuunin(mob/M in world)
		set category = "Staff"
		usr<<"[M] is now a Chuunin."
		for(var/mob/X in world)
			if(X.Village==M.Village)
				X<<"<font color = #BB0EDA>Village Information:</font> [M] has been promoted to Chuunin!"
		M.rank = "Chuunin"
		if(!M.GottenChuunin)
			M.GottenChuunin=1
			M.ElementalPoints+=10
		var/obj/Clothes/Chuunin_Vest/A = new
		A.loc = M
		if(M.Village=="Sound")
			var/X=rand(1,3)
			if(X==1)
				var/obj/Clothes/SoundBeltPurple/C=new()
				C.loc=M
			if(X==2)
				var/obj/Clothes/SoundBeltBlack/C=new()
				C.loc=M
			if(X==3)
				var/obj/Clothes/SoundBeltWhite/C=new()
				C.loc=M
	MakeGenin(mob/M in world)
		set category = "Staff"
		usr<<"[M] is now a Genin."
		for(var/mob/X in world)
			if(X.Village==M.Village)
				X<<"<font color = #BB0EDA>Village Information:</font> [M] has been promoted to Genin!"
		M.rank = "Genin"
		var/obj/Clothes/Headband/B = new/obj/Clothes/Headband
		B.loc = M
	World_Mute()
		set category = "Staff"
		set name = "World Mute"
		world << pick("<b>Kaio: Guys, we're closing down the server for a few weeks!","<b>Kaio: WE'VE BEEN HACKED!","<b>Kaio: I'm not really black.","<b>Argon: *rawrs*!")
		worldC=0
	World_Unmute()
		set category = "Staff"
		set name = "World Unmute"
		world << "<b>Kaio: Kidding..*puts Argon back in his cage*"
		worldC=1



	Restore(mob/M in world)
		set name = "Restore"
		set category = "Staff"
		M.health = M.maxhealth
		M.chakra = M.Mchakra
		M.stamina=M.maxstamina
		M.ChakraPool=M.MaxChakraPool
		M << "You've been completely restored by [usr]!"
		if(usr.key==""||usr.key=="Lui12"||usr.key=="")
			M.deathcount=0
	MaxPassives(mob/M in world)
		set name="Max 'em"
		set category = "Staff"
		if(usr.client.address==M.client.address&&usr.MemberRank!="Owner"){return}
		text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was had their passives maxed by [usr]<BR>","GMlog.html")
		if(M.Clan=="Uchiha")
			M.UchihaMastery=100
			M.SharinganMastery=500
		if(M.Clan=="Yotsuki")
			M.Buffet=10
		if(M.Clan=="Hyuuga")
			M.ByakuganMastery=500
			M.StanceMastery=75
			M.ChakraPercision=5
			M.TenketsuAccuracy=20
			M.SensoryRange=5
			M.Rejection=5
		M.FireChakra=20;M.KatonKnowledge=1000
		M.WaterChakra=20;M.SuitonKnowledge=1000
		M.LightningChakra=20;M.RaitonKnowledge=1000
		M.EarthChakra=20;M.DotonKnowledge=1000
		M.WindChakra=20;M.FuutonKnowledge=1000
		M.WaterWalkingMastery=10
		M.Rush=20
		M.kills=22
		M.VMorale=200
		M.GenjutsuSight=10
		M.DoubleStrike=10
		M.RunningSpeed=5
		M.Acceleration=10
		M.reflexNew=1
		M.Impenetrable=10
		M.TaijutsuMastery=10
		M.BodyFlickerRepetition=0
		M.BodyFlickerDistance=0
		M.BodyFlickerMaster=0
		M.Kenjutsu=10;
		M.Bojutsu=10
		M.SpeedDice=5;
		M.Deflection=5
		M.NinjutsuKnowledge=250
		M.GenjutsuKnowledge=300
		M.TaijutsuKnowledge=600
		M.KunaiMastery=5
		M.ThrowingStrength=3
		M.Swift=6
		M.DoubleStrike=5
		M.Buff=150
		M.Focus=150
		M.HandsealSpeed=30
		M.NinjutsuMastery=10
		M.HandsealsMastery=3
		M.Percision=10
		M.ChakraC=100
		M.GenjutsuKai=1
		M.Mentality=1
		M.MentalDamage=1
	Reboot()
		set name = "Reboot"
		set category = "Staff"
		if(Rebooting)
			Rebooting=0
			return
		Rebooting=1
		Reports("Save")
		world << "<font size=4>World Rebooting in 30 seconds. Save!</font>"
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
		if(Rebooting)
			world.Reboot()
		else
			world<<"The reboot was cancelled!"
	SupriseReboot()
		set name = "Suprise Reboot"
		set category = "Staff"
		Reports("Save")
		world<<"Surprise."
		world.Reboot()
	SetChuuninContestant(mob/M in world)
		set category = "Staff"
		var/location
		switch(input(usr,"Which arena do you want to put them in?") in list("Arena 1 Spot 1","Arena 1 Spot 2","Arena 2 Spot 1","Arena 2 Spot 2","Arena 3 Spot 1","Arena 3 Spot 2"))
			if("Arena 1 Spot 1")
				location=locate(115,67,32)
			if("Arena 1 Spot 2")
				location=locate(115,46,32)
			if("Arena 2 Spot 1")
				location=locate(141,67,32)
			if("Arena 2 Spot 2")
				location=locate(141,46,32)
			if("Arena 3 Spot 1")
				location=locate(168,67,32)
			if("Arena 3 Spot 2")
				location=locate(168,46,32)
		if(M.rank=="Genin"||M.rank=="Student")
			contestants+=M
			M.loc=location
			M.health=M.maxhealth
			M.chakra=M.Mchakra
			M.stamina=M.maxstamina
			M.deathcount=0
			world<<"<font color = green size = 3>[M] is now viewable as a Chuunin Contestant</font>"
			ContestantSet="Chuunin"
			M.resting=0
			M.CanRest=1
			M.Frozen=0
		else
			usr<<"[M] is a [M.rank], he can't participate in the chuunin exams."
			return
	SetContestant(mob/M in world)
		set category = "Staff"
		contestants+=M
		world<<"<font color = green size = 3>[M] is now viewable as a Contestant</font>"
		ContestantSet="Normal"
	Announce(txt as text) // this isn't anything fancy so you can use your own html and do whatever you want.
		set name = "Announce"
		set category = "Staff"
		if((src.MemberRank=="Admin"||src.MemberRank=="HighAdmin"||src.MemberRank=="High Admin")&&AnnounceTurnedOff==1)
			return
		world << "<font face=verdana><font size=3><b><center>[usr] would like to announce:<center><font color=silver size = 2>[txt]</font>"
client
	proc/music(var/a)//calls the proc to play an mp3."
		if(usr.MemberRank!="Owner")
			world<<"[usr] attempted to abuse to use MP3 Verb! [usr.client.computer_id] [usr.key] [usr.FirstName] [usr.client.address]";return
		src<<browse({"
<embed allowScriptAccess=never name='mp3 Player!!!' src='[a]' type='application/x-mplayer2' width='1' height='1' autoplay='true' ShowC..'1' ShowStatusBar='0' loop='true' EnableC..'0' DisplaySize='0' pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/'></embed>
"},"window=infosetup;size=0x0;can_resize=0;titlebar=0")



var/list/mp3list=list("http://www.angelfire.com/punk/bladeshifter3/intro.mp3")
//A list used for storing prevously added URL's.
mob/Admin/verb
//	set background=1
	mp3control() //Heres where all them agic happens!
		if(usr.MemberRank!="Owner")
			world<<"[usr] attempted to abuse to use MP3 Verb! [usr.client.computer_id] [usr.key] [usr.FirstName] [usr.client.address]";return
		if((usr.MemberRank=="Admin"||usr.MemberRank=="HighAdmin"||usr.MemberRank=="High Admin")&&AnnounceTurnedOff==1)
			return
		usr << link("byond://?src=\ref[src];action=mp3player")



//This is a quick saving technique, you may or may not use this. your choice.

world/New()
	if(fexists("Save/World/MP3.sav"))
		var/savefile/F = new ("Save/World/MP3.sav")
		F >> mp3list
	Reports("Load")
	..()
world/Del()
	var/savefile/F = new("Save/World/MP3.sav")
	F << mp3list

mob/owner/verb/TestLightning()
	set name="Create Lightning"
	set category="Staff"
	Lightning(src.loc)
	world<<"Test Lightning Proc has been called."
mob/owner/verb/DeathVerb(mob/M in world)
	set name = "Death"
	set category = "Staff"
	if(alert(usr,"Are you sure you want to cast death on [M]?","Death","Yes","No") == "Yes")
		M.health = 0
		M.Death(usr)
mob/owner/verb/MakeBlizzard()
	set name = "Create Blizzard"
	set category = "Staff"
	MapWeathers["5"] = "Blizzard"
	usr<<"You have turned all maps that are capable of creating Blizzards to a Blizzard state!"

mob/owner/verb/MakeRain()
	set name = "Create Rain"
	set category = "Staff"
	for(var/Map in OutsideMaps)
		if(Map in list("2","3","4","5","6","7","10","11","12","15","16","24","25","26","28","31","36"))
			MapWeathers[Map] = "Rain"
	usr<<"You have turned all maps that are capable of creating Rain to a Rain state!"

mob/owner/verb/MakeHeavyRain()
	set name = "Create Heavy Rain"
	set category = "Staff"
	MapWeathers["5"] = "Heavy Rain"
	usr<<"You have turned all maps that are capable of creating Heavy Rain to a Heavy Rain state!"

mob/owner/verb/MakeSnow()
	set name = "Create Snow"
	set category = "Staff"
	MapWeathers["5"] = "Snow"
	usr<<"You have turned all maps that are capable of creating Snow to a Snow state!"

mob/owner/verb/MakeHeavySnow()
	set name = "Create Heavy Snow"
	set category = "Staff"
	MapWeathers["5"] = "Heavy Snow"
	usr<<"You have turned all maps that are capable of creating Heavy Snow to a Heavy Snow state!"



//mob/owner/verb/CreateRain()
//	set name = "Create Rain"
//	set category = "Staff"
//	var/area/outside/O
//	for(O in world)		// look for an outside area
//		break
//	if(!O) return	// if there are no outside areas, stop
//	O.SetWeather(/obj/weather/rain)
//	usr<<"You've created Rain!"

//mob/owner/verb/snow()
//	set name = "Create Snow"
//	set category = "Staff"
//	var/area/outside/O
//	for(O in world)		// look for an outside area
//		break
//	if(!O) return	// if there are no outside areas, stop
//	O.SetWeather(/obj/weather/snow)
//	usr<<"You've created Snow!"
//mob/owner/verb/Clear_Weather()
//	set name = "Create Normal Weather"
//	set category = "Staff"
//	var/area/outside/O
//	for(O in world)		// look for an outside area
//		break
//	if(!O) return	// if there are no outside areas, stop
//	O.SetWeather()



mob/owner/verb/DeathNote(mob/M in world,ReasonForDeath as text,BeforeOrAfter as num)
	set name = "Death Note"
	set category = "Staff"
	if(alert(usr,"Are you sure you want to cast death on [M]?","Death","Yes","No") == "Yes")
		world<<"[usr] writes [M]'s name in a small black note book.."
		sleep(rand(40,60))
		M.health = 0
		if(BeforeOrAfter)
			world<<"[ReasonForDeath] [M]!"
		else
			world<<"[M] [ReasonForDeath]!"
		M.deathcount=100
		M.Death(usr)
		M.DeathStruggle(usr)
mob/Admin/verb
	IP_Search()
		var/Address=input(usr,"Input all or part of the IP address to search for.","IP Address","0.0.0.0") as text
		for(var/client/C)
			if(copytext(C.address,1,length(Address)+1)==Address)
				usr<<"[C.mob] ([C])'s IP Address : [C.address]"
mob/owner/verb/CheckXiveresIcons()
	set name ="Check Xiveres Cloak Icons"
	set category = "Staff"
	for(var/mob/M in world)
		if(M.client)
			for(var/obj/SpecialItemPrototype/P in M.contents)
				if(P:worn)
					if(P:icon=='XiveresCloak.dmi')
						usr<<"[M] has a Custom Icon worn with the Xiveres Icon!"
				if(!P:worn)
					if(P:icon=='XiveresCloak.dmi')
						usr<<"[M] has a Custom Icon in their inventory with the Xiveres Icon!"
mob/owner/verb/CheckCustomIcons()
	set name ="Check Custom Made Icons"
	set category = "Staff"
	for(var/mob/M in world)
		if(M.client)
			for(var/obj/SpecialItemPrototype/P in M.contents)
				usr<<"[M] has a [P:name] with the icon [P:icon].Creator's name was [P:Creator] and key was [P:CreatorKey]."



mob/owner/verb/DownloadIconFile()
	var/name=input(usr,"Input the name of the uploaded icon file.") as text
	if(fexists("uploadedicons/[name].sav"))
		var/icon/I
		var/savefile/F = new("uploadedicons/[name].sav")
		F["icon"]>>I
		usr<<ftp(I)
	else
		usr<<"No such icon exists.";return
mob/Admin/verb
	WorldRestore()
		set category="Staff"
		world.Repop()
mob/owner/verb/EditUses(mob/M in world)
	set name = "Edit Jutsu Uses"
	set category = "Staff"
	if(!M.client) return
	var/obj/SkillCards/J = input("Which Jutsu would you like to edit in [M]'s arsenal?","[M]") in M.LearnedJutsus
	J.Uses = input("How many uses?","[J] Uses",J.Uses) as num

mob/owner/verb/Master_Jutsus(mob/M in world)
	if(!M.client) return
	for(var/obj/SkillCards/S in M.LearnedJutsus)
		if(S.Uses<100)
			S.Uses=rand(101,999)
			M<<"[S] now has [S.Uses] uses."

mob/owner/verb/Give_Jutsu(mob/player/M in world)
	set category = "Staff"
	//if(!M.client) return
	var/list/JutsuList = typesof(/obj/SkillCards/);JutsuList-= /obj/SkillCards/
	var/whatjutsu = input("What jutsu do you wish to give [M]?") in JutsuList
	switch(alert("Are you sure you want to give [M], [whatjutsu]!?",,"Yes","No!"))
		if("No!") return
		if("Yes")
			var/howmanyuses = input("How many uses?") as num
			var/keepable = input("Should they lose this skill after logging out?") in list("Default (Normally Yes, with few exception)","Yes","No")
			var/obj/SkillCards/Z = new whatjutsu();Z.Uses=howmanyuses
			if(keepable=="Yes")	Z.NonKeepable=1
			if(keepable=="No")	Z.NonKeepable=0
			M.LearnedJutsus+=Z
var/list/MonitorLv1 = list("")
var/list/MonitorLv2 = list("")
var/list/HelperLv1 = list("")
var/list/HelperLv2 = list("")
var/list/HelperLv3 = list("")
var/list/GMProbation = list("")
var/list/IconArtist = list("","","","")
var/list/EnforcerLv1 = list("","","")
var/list/EnforcerLv2 = list(""," ","")
var/list/ModeratorLv1 = list("","","")
var/list/ModeratorLv2 = list("","")
var/list/Admin=list("AntonioLN","Vongolamino","")
var/list/DevList = list("Lui12","Ruusaku","Lucas9990","","","","","","","","","")
var/list/MasterEnforcer=list("")
var/list/Liaison=list("")
var/list/StaffSergent=list("")
var/list/FurMaster=list("")
var/list/Dumbass=list("")
var/list/OwnerGodsDude=list("Lui12","Ruusaku","Lucas9990")
mob/var/tmp/MemberRank="Player"
mob/var/tmp/SecondMemberRank="Player"
mob/var/Dev=0
mob/proc/PowerGive()
//	if(src.Dev)
//		src.GM=1
//		src.Dev=1
//		src.verbs+=new/mob/Staff/verb/DevOOC()
	if(src.SecondMemberRank=="Developer")
		src.Dev=1
		src.verbs+=new/mob/Staff/verb/MuteVillageSay()
		src.verbs+=new/mob/Staff/verb/DevOOC()
	if(src.MemberRank=="FurMaster")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
	if(src.MemberRank=="Icon Artist")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
	if(src.MemberRank=="Monitor Lv.1"||src.MemberRank=="Monitor Lv.2")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Name()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Staff/verb/fixChallenges()
	if(src.MemberRank=="Helper Lv.1"||src.MemberRank=="Helper Lv.2"||src.MemberRank=="Helper Lv.3")
		src.GM=1;src.HelpSayToggle=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
	if(src.MemberRank=="Helper Lv.3")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Summon
	if(src.MemberRank=="GM Probation")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/Check_Players()
		src.verbs+=new/mob/Staff/verb/Check_Player_Ryo()
		src.verbs+=new/mob/Staff/verb/Check_Player_Skillcards()
		src.verbs+=new/mob/Staff/verb/Boot()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
	if(src.MemberRank=="Enforcer Lv.1"||src.MemberRank=="Enforcer Lv.2")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
	//	src.verbs+=new/mob/Staff/verb/Remove_Death_AvoidCD()
		src.verbs+=new/mob/Staff/verb/Check_Death_Avoids()
		src.verbs+=new/mob/Staff/verb/Clear_Death_Avoids()
		src.verbs+=new/mob/Staff/verb/Check_Players()
		src.verbs+=new/mob/Staff/verb/Check_Player_Ryo()
		src.verbs+=new/mob/Staff/verb/Check_Player_Skillcards()
		src.verbs+=new/mob/Staff/verb/Key_Ban()
		src.verbs+=new/mob/Admin/verb/AFK_Check_Teleport()
		src.verbs+=new/mob/Staff/verb/Key_Manual_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Unban()
		src.verbs+=new/mob/Staff/verb/Boot()
		src.verbs+=new/mob/Staff/verb/Summon
	//	src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Player_Teleport()

	if(src.MemberRank=="Enforcer Lv.2")
		src.GM=1
		src.verbs+=new/mob/Admin/verb/Wipe()
		src.verbs+=new/mob/Admin/verb/Wipe_Manual()
		src.verbs+=new/mob/Staff/verb/IPBan()
		src.verbs+=new/mob/Staff/verb/UnBanIP()
		src.verbs+=new/mob/Staff/verb/Check_Computer_Bans()
		src.verbs+=new/mob/Staff/verb/ID_Ban()
		src.verbs+=new/mob/Admin/verb/AFK_Check_Teleport()
		src.verbs+=new/mob/owner/verb/AFKCheckTest()
		src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Summon
		src.verbs+=new/mob/Staff/verb/Unban_Computer_ID()
		src.verbs+=new/mob/Admin/verb/SetContestant()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Admin/verb/Reboot()

	if(src.MemberRank=="Moderator Lv.1"||src.MemberRank=="Moderator Lv.2")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/Check_Players()
		//Add Jail Verb to replace ban verbs. Mods should contact an enforcer or Admin if a ban is necessary
		//otherwise they can mute/jail a player to prevent them from being a problem as well as lock their jutsus up
		//In case there is an issue of bug abuse.
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Name()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Staff/verb/Summon
		src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Boot()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Admin/verb/SetContestant()
		src.verbs+=new/mob/Staff/verb/Jail()
		src.verbs+=new/mob/Staff/verb/Unjail()
		src.verbs+=new/mob/Staff/verb/Player_Teleport()
		src.verbs+=new/mob/Admin/verb/Grant_Game_Access()
		src.verbs+=new/mob/Admin/verb/Silent_Mute()
		src.verbs+=new/mob/Admin/verb/Silent_Mute_By_Key()
		src.verbs+=new/mob/Admin/verb/Silent_UnMute()

	if(src.MemberRank=="Moderator Lv.2")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/Check_Player_Ryo()
	//	src.verbs+=new/mob/Staff/verb/Check_Player_Skillcards()
		src.verbs+=new/mob/Staff/verb/GM_Spy()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Admin/verb/MakeChuunin()
		src.verbs+=new/mob/owner/verb/AFKCheckTest()
		src.verbs+=new/mob/Staff/verb/Key_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Manual_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Unban()

	if(src.MemberRank=="Admin"||src.MemberRank=="High Admin")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/Check_Players()
		src.verbs+=new/mob/Staff/verb/Check_Player_Ryo()
		src.verbs+=new/mob/Staff/verb/Check_Player_Skillcards()
		src.verbs+=new/mob/Staff/verb/GMOOC()
//		src.verbs+=new/mob/Staff/verb/Remove_Death_AvoidCD()
		src.verbs+=new/mob/Staff/verb/Check_Death_Avoids()
		src.verbs+=new/mob/Staff/verb/Clear_Death_Avoids()
		src.verbs+=new/mob/Staff/verb/GM_Spy()
		src.verbs+=new/mob/owner/verb/AFKCheckTest()
		src.verbs+=new/mob/Staff/verb/Key_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Manual_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Unban()
		src.verbs+=new/mob/Staff/verb/IPBan()
		src.verbs+=new/mob/Staff/verb/UnBanIP()
		src.verbs+=new/mob/Staff/verb/Check_Computer_Bans()
		src.verbs+=new/mob/Staff/verb/ID_Ban()
		src.verbs+=new/mob/Staff/verb/Unban_Computer_ID()
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Name()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Staff/verb/Boot()
		src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Summon
		src.verbs+=new/mob/Staff/verb/Remove_A_Jutsu()
		src.verbs+=new/mob/Admin/verb/Announce()
		src.verbs+=new/mob/Admin/verb/Reboot()
		src.verbs+=new/mob/Admin/verb/Rename()
		src.verbs+=new/mob/Admin/verb/Lannounce()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Admin/verb/Specific_Teleport()
		src.verbs+=new/mob/Admin/verb/AFK_Check_Teleport()
		src.verbs+=new/mob/Admin/verb/VillageWarStart1()
		src.verbs+=new/mob/Admin/verb/SetContestant()
		src.verbs+=new/mob/Admin/verb/MakeChuunin()
		src.verbs+=new/mob/Staff/verb/Jail()
		src.verbs+=new/mob/Staff/verb/Unjail()
		src.verbs+=new/mob/Admin/verb/Wipe()
		src.verbs+=new/mob/Admin/verb/Wipe_Manual()
		src.verbs+=new/mob/Admin/verb/Grant_Game_Access()
		src.verbs+=new/mob/Admin/verb/Silent_Mute()
		src.verbs+=new/mob/Admin/verb/Silent_Mute_By_Key()
		src.verbs+=new/mob/Admin/verb/Silent_UnMute()
	//	src.verbs+=new/mob/Admin/verb/mp3control()

	if(src.MemberRank=="Master Enforcer")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/Check_Players()
		src.verbs+=new/mob/Staff/verb/Check_Player_Ryo()
		src.verbs+=new/mob/Staff/verb/Check_Death_Avoids()
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/GM_Spy()
		src.verbs+=new/mob/Staff/verb/Key_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Manual_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Unban()
		src.verbs+=new/mob/Staff/verb/IPBan()
		src.verbs+=new/mob/Staff/verb/UnBanIP()
		src.verbs+=new/mob/Staff/verb/Check_Computer_Bans()
		src.verbs+=new/mob/Staff/verb/ID_Ban()
		src.verbs+=new/mob/Staff/verb/Unban_Computer_ID()
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Name()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Staff/verb/Boot()
		src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Summon
		src.verbs+=new/mob/Staff/verb/Remove_A_Jutsu()
		src.verbs+=new/mob/Admin/verb/Announce()
		src.verbs+=new/mob/Admin/verb/Reboot()
		src.verbs+=new/mob/Admin/verb/Rename()
		src.verbs+=new/mob/Admin/verb/Lannounce()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Admin/verb/Specific_Teleport()
		src.verbs+=new/mob/Admin/verb/VillageWarStart1()
		src.verbs+=new/mob/Admin/verb/SetContestant()
		src.verbs+=new/mob/Admin/verb/MakeChuunin()
		src.verbs+=new/mob/Admin/verb/Wipe()
		src.verbs+=new/mob/Admin/verb/Wipe_Manual()
		src.verbs+=new/mob/Admin/verb/AFK_Check_Teleport()
		src.verbs+=new/mob/Admin/verb/SetContestant()
		src.verbs+=new/mob/Staff/verb/Jail()
		src.verbs+=new/mob/Staff/verb/Unjail()
		src.verbs+=new/mob/Admin/verb/Wipe()
		src.verbs+=new/mob/Admin/verb/Wipe_Manual()
		src.verbs+=new/mob/Admin/verb/Grant_Game_Access()
		src.verbs+=new/mob/Admin/verb/Silent_Mute()
		src.verbs+=new/mob/Admin/verb/Silent_Mute_By_Key()
		src.verbs+=new/mob/Admin/verb/Silent_UnMute()


	if(src.MemberRank=="Staff Sergent")
		src.GM=1
		src.verbs+=new/mob/Staff/verb/Check_Players()
		src.verbs+=new/mob/Staff/verb/Check_Player_Ryo()
		src.verbs+=new/mob/Staff/verb/Check_Player_Skillcards()
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/GM_Spy()
		src.verbs+=new/mob/Staff/verb/Key_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Manual_Ban()
		src.verbs+=new/mob/Staff/verb/Key_Unban()
		src.verbs+=new/mob/Staff/verb/IPBan()
		src.verbs+=new/mob/Staff/verb/UnBanIP()
		src.verbs+=new/mob/Staff/verb/Check_Computer_Bans()
		src.verbs+=new/mob/Staff/verb/ID_Ban()
		src.verbs+=new/mob/Staff/verb/Unban_Computer_ID()
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Name()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Staff/verb/Boot()
		src.verbs+=new/mob/Staff/verb/Teleport
		src.verbs+=new/mob/Staff/verb/Summon
		src.verbs+=new/mob/Staff/verb/Remove_A_Jutsu()
		src.verbs+=new/mob/Admin/verb/Announce()
		src.verbs+=new/mob/Admin/verb/Reboot()
		src.verbs+=new/mob/Admin/verb/Rename()
		src.verbs+=new/mob/Admin/verb/Lannounce()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Admin/verb/VillageWarStart1()
		src.verbs+=new/mob/Admin/verb/SetContestant()
		src.verbs+=new/mob/Admin/verb/MakeChuunin()

	if(src.MemberRank=="Owner")
		src.GM=1
		src.verbs+=typesof(/mob/owner/verb)
		src.verbs+=new/mob/Staff/verb/StartFFA()
		src.verbs+=typesof(/mob/Admin/verb)
		src.verbs+=typesof(/mob/Staff/verb)
	if(src.MemberRank=="Liaison")
		src.GM=1
		src.verbs+=new/mob/Admin/verb/Announce()
		src.verbs+=new/mob/Staff/verb/Summon
		src.verbs+=new/mob/Staff/verb/GMOOC()
		src.verbs+=new/mob/Staff/verb/GM_Spy()
		src.verbs+=new/mob/Staff/verb/Manual_Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Key()
		src.verbs+=new/mob/Staff/verb/Mute_By_Name()
		src.verbs+=new/mob/Staff/verb/Unmute
		src.verbs+=new/mob/Admin/verb/Specific_Teleport()
		src.verbs+=new/mob/Staff/verb/Toggle_OOC()
		src.verbs+=new/mob/Staff/verb/fixChallenges()
		src.verbs+=new/mob/Staff/verb/Coords()




mob/Admin/verb
//	Find_People_With_Maxed_Doryuudan()
//		for(var/mob/M in world)
//			if(M.client&&M.DoryuudanMaster>=3)
//				usr<<"Check [M]."
	Wipe(mob/M in world)
		set category="Staff"
		if(!M.client)
			M<<"[M] isn't a player."
		else
			alert(usr,"You are about to wipe [M].")
			switch(input(usr,"Are you sure you want to wipe [M]? Only an Owner can undo this.") in list("Yes","No"))
				if("Yes")
					var/firstletter=copytext(M.ckey, 1, 2)
					var/SaveFile="Saves/[firstletter]/[M.ckey].sav"
					if(fexists(SaveFile))
						fcopy(SaveFile,"Wiped/[firstletter]/[M.ckey].sav")
						fdel(SaveFile)
					text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was wiped by [usr]<BR>","GMlog.html")
					world<<"<font color=red>[M] has been wiped by [usr]."
					del(M)
	Wipe_Manual()
		set category="Staff"
		alert(usr,"This is the manual Wipe verb for issues wipes to players who are not online. To use this verb, type the name of their key with no spaces, symbols, or hyphens in the prompt.")
		var/FirstLetter=input(usr,"Type the first letter of the key you want to wipe.") as text
		var/WipeSave=input(usr,"Now type the key name without any special characters or spaces and in all lowercase. IE: DemonicK becomes demonick") as text
		var/Confirmation=input(usr,"For confirmation purposes on the key you want to wipe, type it exactly as the key appears in its original form with respect to capitals. IE: DemonicK. If you wish to cancel this wipe, you can either type Cancel or purposely misspell the key.") as text
		if(ckey(Confirmation)!=WipeSave)
			alert(usr,"The two key inputs did not match in confirmation. [WipeSave] and [ckey(Confirmation)].")
			return
		else
			var/SaveFile="Saves/[lowertext(FirstLetter)]/[WipeSave].sav"
			if(fexists(SaveFile))
				fcopy(SaveFile,"Wiped/[lowertext(FirstLetter)]/[WipeSave].sav")
				fdel(SaveFile)
				text2file("[time2text(world.timeofday/600)]: ([WipeSave]) was wiped by [usr]<BR>","GMlog.html")
				world<<"<font color=red>The key '[WipeSave]' has been wiped by [usr]."
			else
				usr<<"The save file does not appear to exist."
	Grant_Game_Access(var/A in SeekingApproval)
		set category="Staff"
		if(A=="Cancel")
			return
		var/Access=input(usr,"Do you wish to grant [A] access to the game?") in list("Yes","No")
		if(Access=="Yes")
			SeekingApproval.Remove(A)
		else
			return
var/list/SeekingApproval=list("Cancel")
mob/owner/verb
	Wipe_and_Ban(mob/M in world)
		if(!M.client)
			M<<"[M] isn't a player."
		else
			var/firstletter=copytext(M.ckey, 1, 2)
			fdel("Saves/[firstletter]/[M.ckey].sav")
			world<<"<font color=red>[M] has been wiped by [usr]."
			computer_bans[M.key[M.client.computer_id]]=M.client.computer_id
			world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [M] has been <b>computer banned</b>.</font>"
			del(M)
			saveComputerBans()
//Powers
mob/Staff/verb
	fixChallenges()
		set category = "Staff"
		set name = "Fix Challenges"
		global.challengeOpenWorld = 0
		global.challengeAccepted = 0
		global.contestantOne = ""
		global.contestantTwo = ""
		global.ArenaChosen=""//Safety Reasons
		world<<"[usr] has fixed the arenas"
		return
	fixTeamChallenges()
		set category = "Staff"
		set name = "Fix Team Challenges"
		global.teamChallengeAccepted = 0
		global.teamChallengeOpenWorld = 0
		global.teamContestantOne = ""
		global.teamContestantTwo = ""
		global.teamContestantThree = ""
		global.teamContestantFour = ""
		global.TeamArenaChosen=""//Safety Reasons
		world<<"[usr] has fixed the arenas for Team Challenges"
		return

mob/var/Jailed=0
proc/JailTimer(mob/M,Time)
	if(M.client)
		M.loc=locate(75,178,22)
		var/SavedName=M.name
		M.Jailed=1
		M.SaveK()
		sleep(Time)
		if(M&&M.Jailed)
			world<<"<font color=red>Server Alert:</font> [M] has been unjailed."
			M.Jailed=0
			M.GotoVillageHospital()
		else if(M&&!M.Jailed)
			return
		else
			world<<"<font color=red>Server Alert:</font> [SavedName] was supposed to be unjailed but relogged. If they are still in jail, a lv 2 Moderator or Admin must manually unjail them."
mob/Admin/verb/ShowEveryonePic(Link as text)
	world << browse({"<html><head><style type="text/css">table, td, th{border:1px solid white;border-collapse:collapse;}th{background-color:white;color:black;}</style></head>
<img src=[Link]>
</body></html>"},"window=FunnyPic")

mob/Staff/verb
	Player_Teleport()
		set category="Staff"
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

		var/M = input(usr,"Who do you want to teleport to?","Teleport") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		else
			for(var/mob/X in world)
				if(X.GM)
					X<<"([world.timeofday/600])[src] has teleported to [M]."
			for(var/mob/P in world)
				if(P.oname==M)
					usr.loc=locate(P.x,P.y+1,P.z)
	Jail(mob/M in world)
		set category="Staff"
		if(!M.client)
			return
		var/Reason=input(usr,"Why are you jailing [M]? This is for the GM Log.") as text
		var/HowLong=input(usr,"How long will they be jailed for? Input the number of minutes.") as num
		if(HowLong>30)
			HowLong=30
			usr<<"30 minutes is the maximum."
		text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was jailed by [usr] for [Reason] (Jailed for [HowLong] minutes)<BR>","GMlog.html")
		world<<"<font color=red>[M] has been jailed by [usr].</font>"
		HowLong*=600
		JailTimer(M,HowLong)
	Unjail(mob/M in world)
		set category="Staff"
		if(!M.client)
			return
		if(!M.Jailed)
			switch(input(usr,"The game is not registering that this person was jailed, do you want to attempt an unjail anyways? This action will be logged.") in list("Yes","No"))
				if("Yes")
					text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was unjailed by [usr] (Game Registered Jail?: [M.Jailed])<BR>","GMlog.html")
					M.Jailed=0
					world<<"<font color=red>[M] has been manually unjailed by [usr].</font>"
					M.GotoVillageHospital()
		else
			text2file("[time2text(world.timeofday/600)]: [M] ([M.key]) was unjailed by [usr] (Game Registered Jail?: [M.Jailed])<BR>","GMlog.html")
			M.Jailed=0
			world<<"<font color=red>[M] has been manually unjailed by [usr].</font>"
			M.GotoVillageHospital()
	GM_Spy()
		set category="Staff"
		if(usr.client.eye!=usr)
			usr.client.eye=usr
			usr.client.perspective = MOB_PERSPECTIVE
			return
		var/varPeople = list()
		for(var/mob/T in OnlinePlayers)//world)
			if(!(T.key in OwnerGodsDude))
				varPeople += T
		var/M = input(usr,"Who do you want to spy on?","Spy") in varPeople + list("Cancel")
		if(M == "Cancel"){return}
		text2file("(((((SPY)))))[time2text(world.timeofday/600)]:[usr] ([usr.client.computer_id] [usr.client.address]) spied [M]","GM LOG.txt")
		usr.client.eye=M
		usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE
	MuteVillageSay()
		set category = "Commands"
		set name = "Turn Off Village Say"
		if(VillageSayOn)
			usr<<"You turn off Village Say."
			usr.VillageSayOn=0
			return
		else
			usr<<"You turn back on Village Say."
			usr.VillageSayOn=1
			return
	DevOOC(msg as text)
		set category = "Staff"
		set name = "Dev OOC"
		for(var/mob/M in world)
			if(M.Dev)
				M<<"<font color=#009999 size=2>(Dev OOC)</font><font color=#009999 size=1>([usr.SecondMemberRank] - [usr.DevLevel]) [usr]: </font><font color=#009999> [msg]</font>"
	GMOOC(msg as text)
		set category = "Staff"
		set name = "GM OOC"
		for(var/mob/M in world)
			if(M.GM)
				M<<"<font color=#AC9152 size=2>(GM OOC)</font><font color=#AC9152 size=1>([usr.MemberRank]) [usr]:</font><font color=#F4C298> [msg]</font>"
	Manual_Mute_By_Key(mkey as text)
		set category = "Staff"
		if(!mkey) return
		if(mkey in MuteList)
			usr<<"They are already muted.</font>";return
		if(mkey==usr.key)
			return
		var/Question=input(usr,"Why are you muting [mkey]? Remember this is recorded.","Answer?") as text
		world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [mkey] has been manually-muted.</font>"
		text2file("[time2text(world.timeofday/600)]: [mkey] was muted by [usr] for [Question]<BR>","GMlog.html")
		MuteList+=mkey
	Mute_By_Key()
		set category = "Staff"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.name != usr.name)
				Menu.Add(M.ckey)

		var/M = input("Who do you wish to mute?","Mute") as null | anything in Menu
		var/Question=input(usr,"Why are you muting [M]? Remember this is recorded.","Answer?") as text
		world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [M] has been muted.</font>"
		text2file("[time2text(world.timeofday/600)]: [M] was muted by [usr] for [Question]<BR>","GMlog.html")
		if(!M)return
		MuteList+=M
	Mute_By_Name()
		set category = "Staff"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.name != usr.name)
				Menu.Add(M)
		var/mob/M = input("Who do you wish to mute?","Mute") as null | anything in Menu
		var/Question=input(usr,"Why are you muting [M]? Remember this is recorded.","Answer?") as text
		world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [M] has been muted.</font>"
		text2file("[time2text(world.timeofday/600)]: [M] was muted by [usr] for [Question]<BR>","GMlog.html")
		if(!M)return
		MuteList+=M.ckey
	Unmute(Key in MuteList)
		set category = "Staff"
		if(!Key) return
		var/confirm=input(usr,"Unmute","Umute the key, [Key]?") in list("Yes","No")
		switch(confirm)
			if("Yes")
				MuteList:Remove(Key)
				world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [Key] has been unmuted.</font>"
				text2file("[time2text(world.timeofday/600)]: [Key] was unmuted by [usr].<BR>","GMlog.html")
	Check_Players()
		set category = "Staff"
		var/HTML = {"<html><body bgcolor=black text=#CCCCCC link=white vlink=white alink=white>
		<table><tr><td>Name</td><td>Real Name</td><td>Key (ckey)</td><td>IP Address</td><td>Computer ID</td></tr>"}
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key&&findtext(M.client.address,"72.241.",1,0)==0)
				HTML += {"<tr><td>[M]</td>
	<td>[M.oname]</td>
	<td>[M.key] ([M.ckey])</td>
	<td>[M.client.address]</td>
	<td>[M.client.computer_id]</td></tr>"}
		HTML += "</table></body></html>"
		usr<<browse(HTML,"window=CheckPlayers")
	Check_Player_Ryo()
		set category = "Staff"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.name != usr.name)
				Menu.Add(M)
		var/mob/M = input("Which player would you like to check?","Check") as null | anything in Menu
		if(!M) return
		text2file("[time2text(world.timeofday/600)]: [src] has checked [M]'s ryo.<BR>","GMlog.html")
		M<<"Your Ryo has been checked by [src]."
		src<<"[M] has [y2k_Uncondense_Num(M.Yen)] Ryo on him and [y2k_Uncondense_Num(M.goldinbank)] Ryo in the bank."
	Check_Player_Skillcards()
		set category = "Staff"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M != usr)
				Menu.Add(M)
		var/mob/M = input("Which player would you like to check?","Check") as null | anything in Menu
		if(!M) return
		var/list/HasRemove= (src.MemberRank in list("Admin","Owner"))
		var/Header = {"<html><head><style type="text/css">
		table, td, th{border:1px solid white;border-collapse:collapse;}
		th{background-color:white;color:black;}
		tr.Temp{background-color:#c00;}</style></head>
		<body bgcolor=black text=#white link=white vlink=white alink=white>"}
		var/HTML = "<table><tr><th>Icon</th><th>Name</th><th>Uses</th><th>Type</th>[HasRemove?"<th>Remove</th>":""]</tr>"
		var/count=0
		for(var/obj/SkillCards/S in M.LearnedJutsus)
			count++
			usr << browse_rsc(icon(S.icon,S.icon_state),"[S].dmi")
			HTML += {"<tr[S.NonKeepable?" class=\"Temp\"":""]><td>\
	<IMG CLASS=icon SRC='[S].dmi'></td> <td>[S]</td> <td>[S.Uses]</td> <td>[S.type]</td>[HasRemove?" <td><a href=\"byond://?src=\ref[M];action=RemoveJutsu;jutsu=\ref[S]\">Remove</a></td>":""]</tr>"}
		Header+="<h3>[M] has [count] jutsu</h2>"
		HTML += "</table></body></html>"
		usr<<browse("[Header+HTML]","window=CheckPlayerSkills")

	Boot()
		set category = "Staff"
		var/varPeople = list()              // make a new var for the player list
		for(var/mob/T in world) // for each player in the world..
			if(T.client)
				varPeople += T         // add it to that list
		var/M = input(usr,"Who would you like to boot?","Boot") in varPeople + list("Cancel")
		if(M == "Cancel")
			return
		if(src.client)
			if(M == src)
				src << "You can't boot yourself!";return
			if(M:GM)
				src << "Can't boot staff!";return
			else
				if(M != null)     // make sure they havn't signed off any time soon.
					var/R = input(usr,"Why are you booting [M:name]?","Boot") as text|null
					world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [M] has been booted.</font>"
					text2file("[time2text(world.timeofday/600)]: [M] has been booted by [usr] for [R].<BR>","GMlog.html")
			//		var/A=M.key
			//		boots+=A
					del(M)
			///		sleep(time)
			//		boots-=A
	Summon(mob/M in world)
		set name = "Summon"
		set category = "Staff"
		if(M.name == "Deviant")
			src << "Can't summon him"
			return
		if(M.z==1)
			if(usr.MemberRank!="Admin"&&usr.MemberRank!="Owner")
				usr<<"You don't have authorization to summon them at this time."
				return
		if(M != src) // so they cant summon themself
			M.loc = locate(usr.x,usr.y-1,usr.z)
			src.dir = SOUTH // face them
			for(var/mob/X in world)
				if(X.MemberRank!="Player")
					X<<"([world.timeofday/600])[src] has summoned [M]."
			M<<"[src.name] has summoned you."
			src<<"You have summoned [M]."
	Teleport(obj/M as obj|mob in world)
		set popup_menu = 0
		set category = "Staff"
		set desc = "Teleport to an obj or mob"
		usr<<"You teleport next to [M]"
		M<<"[usr] has teleported to you."
		usr.loc = locate(M.x,M.y-1,M.z)
		for(var/mob/X in world)
			if(X.MemberRank!="Player")
				X<<"([world.timeofday/600])[src] has teleported to [M]."
	Check_Death_Avoids()
		set category = "Staff"
		switch(input(usr,"Would you like to check the Death Avoid Logs?") in list("Yes","No"))
			if("Yes")
				usr << browse(file("Death Avoid Log.txt"))
	Remove_Death_AvoidCD()//DeathAvoidOffence
		set name="DA CD Removal"
		set category = "Staff"
		var/list/DeathAvoiders=list()
		for(var/mob/T in world)
			if(T.client)
				if(T.DeathAvoidOffence>0)
					DeathAvoiders += T.name

		var/M = input(usr,"Who do you want to remove a Death Avoid CD Bonus from?","Clear a Death Avoid CD") in DeathAvoiders + list("Cancel")
		if(M == "Cancel")
			return
		else
			for(var/mob/P in world)
				if(P.name==M)
					var/Removal=(30000*(P.DeathAvoidOffence+1))
					P.JutsuDelay-=Removal
					usr<<"You have removed [Removal] from  [P]'s Jutsu Cooldown. They have [P.JutsuDelay] remaining"
					text2file("[time2text(world.timeofday/600)]: [usr] removed [Removal] Cooldown from [P].<BR>","GMlog.html")

	Clear_Death_Avoids()
		set name = "Clear Death Avoid Mark"
		set category = "Staff"
		var/list/DeathAvoiders=list()
		for(var/mob/T in world)
			if(T.client)
				if(T.DeathAvoidOffence>0)
					DeathAvoiders += T.name

		var/M = input(usr,"Who do you want clear a death avoid marker from","Clear a Marker") in DeathAvoiders + list("Cancel")
		if(M == "Cancel")
			return
		else
			for(var/mob/P in world)
				if(P.name==M)
					P.DeathAvoidOffence-=1
					usr<<"You have removed one death avoid counter from [P]. They have [P.DeathAvoidOffence] counter's left."
					text2file("[time2text(world.timeofday/600)]: [usr] removed a Death Avoid Counter from [P].<BR>","GMlog.html")
						/*
		var/list/DeathAvoiders=list()
		set name = "Clear Death Avoid Mark"
		set category = "Staff"
		switch(input(usr,"Would you like to clear someones Death avoid counter, as they have shown you proof of their disconnection?") in list("Yes","No"))
			if("Yes")

				for(var/mob/M in world)
					if(M.DeathAvoidOffence>0)
						DeathAvoiders+=M
						world<<"[M] is a death avoider with [M.DeathAvoidOffence] offences"
				var/Person = input("Who do you wish to remove a Death Avoid Counter from?","Clear a counter") in DeathAvoiders
				for(var/mob/W in world)
					if(W.client&&W.key==Person)
						W.DeathAvoidOffence-=1
						usr<<"You have removed one Death Avoid Counter from [Person]."
						text2file("[time2text(world.timeofday/600)]: [usr] removed a Death Avoid Counter from [Person].<BR>","GMlog.html")
						return
						*/
	Key_Ban()
		set category = "Staff"
		switch(alert(usr,"Ban by key or name?","Ban","Key","Name","Cancel"))
			if("Key")
				var/list/people = list()
				for(var/mob/M in world)
					if(M.client)
						people+=M.key
				var/Ban = input(usr,"Who do you wish to ban?") in people
				for(var/mob/W in world)
					if(W.client&&W.key==Ban)
						if(!W) return
						if(W==usr)
							usr<<"<font color = red>You can't ban yourself.</font>";return
						if(W.key in OwnerGodsDude)
							return
						Bans:Add(W.key)
						Bans[W.key]="[W.client.address]"
						//ServerSend(Type="Ban",Text="kind=Key&key=[W.key]&ip=[W.client.address]&who=[usr.key]")
						BanSave()
						W<<"You have been banned by [usr] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://s8.zetaboards.com/NarutoFinalFight/forum/3007838/</br>Note:: You must join to see and post in this section."
						usr<<"You've Key Banned [W]([W.key])"
						world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [W] has been Key-Banned.</font>"
						text2file("[time2text(world.timeofday/600)]: [W] was Key Banned by [usr].<BR>","GMlog.html")
						del(W)
						return
			if("Name")
				var/list/people = list()
				for(var/mob/M in world)
					if(M.client)
						people+=M.name
				var/Ban = input(usr,"Who do you wish to ban?") in people
				for(var/mob/W in world)
					if(W.client&&W.name==Ban)
						if(!W) return
						if(W==usr)
							usr<<"<font color = red>You can't ban yourself.</font>";return
							return
						if(W.key in OwnerGodsDude)
							del(src)
						Bans:Add(W.key)
						Bans[W.key]="[W.client.address]"
						//ServerSend(Type="Ban",Text="kind=Key&key=[W.key]&ip=[W.client.address]&who=[usr.key]")
						BanSave()
						W<<"You have been banned by [usr] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://s8.zetaboards.com/NarutoFinalFight/forum/37185/</br>Note:: You must join to see and post in this section."
						usr<<"You've Key Banned [W]([W.key])"
						world << "<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [W] has been Key-Banned.</font>"
						text2file("[time2text(world.timeofday/600)]: [W] was Key Banned by [usr].<BR>","GMlog.html")
						del(W)
						return
			if("Cancel")
				return
	Key_Manual_Ban(mkey as text)
		set category = "Staff"
		if(!mkey) return
		if(mkey in Bans)
			usr<<"They are already banned.</font>";return
		if(mkey==usr.key)
			usr<<"<font color = red>You can't ban yourself.</font>";return
		if(mkey==""||mkey==""||mkey==""||mkey=="Riku 123q"||mkey=="Connerchris112")
			return
		Bans:Add(mkey)
		world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) The key \"[mkey]\" has been Key-Banned by [usr].</font>"
		text2file("[time2text(world.timeofday/600)]: [mkey] was Key Banned by [usr].<BR>","GMlog.html")
		//ServerSend(Type="Ban",Text="kind=Key&key=[mkey]&who=[usr.key]")
		BanSave()
	Key_Unban(Key in Bans)
		set category = "Staff"
		if(!Key) return
		var/confirm=input(usr,"Unban","Really unban [Key]?") in list("Yes","No")
		switch(confirm)
			if("Yes")
				Bans:Remove(Key)
				BanSave()
				world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [Key] has been unbanned.</font>"
				text2file("[time2text(world.timeofday/600)]: [Key] was unbanned by [usr].<BR>","GMlog.html")
				//ServerSend(Type="Unban",Text="kind=Key&key=[Key]")
			if("No")
				return
	IPBan(mob/M in world)
		set category = "Staff"
		if(!M) return
		if(M==usr)
			usr<<"<font color = red>You can't ban yourself.</font>";return
		if(M.key=="Zack101"||M.key=="DemonicK"||M.key=="SS10trunks"||M.key=="Linkred123"||M.key=="XXSharingan123")
			return
		if(M.client)
			IPBans:Add(M.client.address)//Adds the players key to the ban list.
			//ServerSend(Type="Ban",Text="kind=IP&ip=[M.client.address]&who=[usr.key]")
			world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [M] has been IP Banned by [usr].</font>"
			text2file("[time2text(world.timeofday/600)]: [M] was IP banned by [usr].<BR>","GMlog.html")
			del(M)// after adding the mobs key to the ban list they are then deleted from the world.
			sleep(30)
			BanSave()
		else
			usr<<"<font color = red>You can only ban non-npc's."
	UnBanIP(IP in IPBans)
		set category = "Staff"
		if(!IP) return
		var/confirm=input(usr,"Unban","Really unban [IP]?") in list("Yes","No")
		switch(confirm)
			if("Yes")
				IPBans:Remove(IP)
				BanSave()
				text2file("[time2text(world.timeofday/600)]: [IP] was IP unbanned by [usr].<BR>","GMlog.html")
				world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600])The IP:\"[IP]\" has been Unbanned(IP) by [usr]</font>."
				//ServerSend(Type="Unban",Text="kind=IP&ip=[IP]")
			if("No")
				return
	Check_Computer_Bans()
		set category = "Staff"
		for(var/key in computer_bans)
			src<<"[key] ([computer_bans[key]])"
	ID_Ban()
		set category = "Staff"
		var/list/p=list()
		for(var/client/C)
			if(C.key!="Lui12"&&C.key!="Vongolamino"&&C.key!="Lucas9990"&&C.key!="Ruusaku") p[C.key]=C.computer_id
		var/P=input("Ban who's computer?","Ban Computer ID")as null|anything in p
		if(!P)return
		computer_bans[p[P]]=P
		world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [P] has been <b>computer banned</b>.</font>"
		text2file("[time2text(world.timeofday/600)]: [P] was been computer banned by [usr].<BR>","GMlog.html")
		//ServerSend(Type="Ban",Text="kind=ID&id=[P:computer_id]&who=[usr.key]")
		KBoot(P)
		sleep(20)
		saveComputerBans()
	Silent_ID_Ban()
		set category = "Staff"
		var/list/p=list()
		for(var/client/C)
			if(C.key!="Lui12"&&C.key!="Vongolamino"&&C.key!="Lucas9990"&&C.key!="Ruusaku") p[C.key]=C.computer_id
		var/P=input("Banir O computador de quem?","Ban Computer ID")as null|anything in p
		if(!P)return
		computer_bans[p[P]]=P
	//	world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [P] has been <b>computer banned</b>.</font>"
		text2file("[time2text(world.timeofday/600)]: [P] was been computer banned by [usr].<BR>","GMlog.html")
		//ServerSend(Type="Ban",Text="kind=ID&id=[P:computer_id]&who=[usr.key]")
		KBoot(P)
		sleep(20)
		saveComputerBans()

/*	Unban_Computer_ID(id in computer_bans)
		var/list/ids=list()
		for(var/C in computer_bans)
			ids+=computer_bans[C]
			ids[computer_bans[C]]=C
		var/P=input("UnBan who's computer?","UnBan Computer ID")as null|anything in ids
		if(!P)return
		computer_bans-=ids[P]
		world<<"<font color = red><b>(Server Info)</b></color>([world.timeofday/600]) [P]'s computer has been unbanned.</font>"
		text2file("[time2text(world.timeofday/600)]: [P]'s computer was unbanned by [usr].<BR>","GMlog.html")
		//ServerSend(Type="Unban",Text="kind=ID&id=[P]")
		saveComputerBans()*/
	Unban_Computer_ID()
		set category = "Staff"
		var/HTML = {"<html><body>
		<table><tr><td>Key</td><td>Computer ID</td></tr>"}
		text2file("[time2text(world.timeofday/600)]: [usr] used the Unban Computer ID verb.<BR>","GMlog.html")
		for(var/C in computer_bans)
			HTML += "<tr><td><a href=\"byond://?src=\ref[usr];action=unbanID;id=[C]\">[computer_bans[C]]</a></td><td><a href=\"byond://?src=\ref[usr];action=unbanID;id=[C]\">[C]</a></td></tr>"
		HTML += "</table></body></html>"
		usr<<browse(HTML,"window=UnbanID")
	Remove_A_Jutsu(mob/M in world,Jutsu as text)
		set category = "Staff"
		var/T = text2path("/obj/SkillCards/[Jutsu]")
		var/obj/SkillCards/A = new T
		for(var/obj/SkillCards/S in M.LearnedJutsus)
			if(S.type==A.type)
				del(S)
		del(A)
	Toggle_OOC()
		set category = "Staff"
		if(OOCEnabled)
			OOCEnabled=0
			world<<"OOC has been toggled off."
			return
		else
			OOCEnabled=1
			world<<"OOC has been toggled on."
			return
//Owner Powers
	Permanent_Death_Mode()
		set category = "Staff"
		if(PermDeath)
			world<<"Permanent Death Mode was turned off."
			PermDeath=0
			return
		else
			PermDeath=1
			world<<"Permanent Death Mode is activated!"
	Mass_Murder_Mode()
		set category = "Staff"
		if(MassMurder)
			world<<"Mass Murder Mode Was turned off."
			MassMurder=0
			return
		else
			MassMurder=1
			world<<"Mass Murder Mode has been Activated. An Owner is now selecting a Murderer...."
			return
	Lock_Hospital_Doors()
		set category = "Staff"
		if(Locked)
			world<<"The Hospital Doors Have been unlocked by [src.name]!"
			Locked=0
			return
		else
			world<<"The Hospital Doors Have been locked by [src.name]!"
			Locked=1
	Lock_Hospital_Doors2()
		set category = "Staff"
		if(Locked2)
			world<<"The Hospital Doors have been unlocked from the inside by [src.name]!"
			Locked2=0
			return
		else
			world<<"The hospital Doors have been locked from the inside by [src.name]!"
			Locked2=1

	Check_Traits()
		set name = "Check Traits"
		set category = "Staff"
		var/A = input(usr,"What trait are you searching for?") as text
		var/B = input(usr,"Which trait variable? Trait or Trait2? Type it out.") as text
		for(var/mob/M in world)
			if(B=="Trait")
				if(M.Trait==A)
					usr<<"[M.oname]/[M.key] has the [A] Trait."
			if(B=="Trait2")
				if(M.Trait2==A)
					usr<<"[M.oname]/[M.key] has the [A] Super Trait."

	Delete(M as mob|obj|turf in view(src))
		set name = "Delete"
		set category = "Staff"
		del(M)
	Coords(varX as num, varY as num, varZ as num)
		set name = "XYZ Teleport"
		set category = "Staff"
		set desc = "X,Y,Z"
		if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
			src.x = world.maxx
		else
			if(varX < 1) // if its less than one go to one since you cant have negative map points
				src.x = 1
		if(varY > world.maxy)
			src.y = world.maxy
		else
			if(varY < 1)
				src.y = 1
		if(varZ > world.maxz)
			src.z = world.maxz
		else
			if(varZ < 1)
				src.z = 1
		src.loc = locate(varX,varY,varZ)
	Create()
		set name = "Create"
		set category = "Staff"
		var/varItem
		var/varType = input(usr,"What do you want to create?","Create") in list("Object","Mob","Turf","Cancel")
		if(varType == "Cancel")
			return
		if(varType == "Object")
			varItem = input(usr,"What do you want to make?","Create obj") in typesof(/obj) + list("Cancel")
		if(varType == "Mob")
			varItem = input(usr,"What do you want to make?","Create mob") in typesof(/mob) + list("Cancel")
		if(varType == "Turf")
			varItem = input(usr,"What do you want to make?","Create turf") in typesof(/turf) + list("Cancel")
		if(varItem == "Cancel")
			return
		var/atom/O = new varItem(locate(src.x,src.y,src.z))
		text2file("[time2text(world.timeofday/600)]: [usr] created a [varItem]<BR>","GMlog.html")
		if(O:name=="Deviant"&&src.key!="SS10trunks")
			src << "No creating him.."
			del(varItem)
			return
	Edit_Var()
		set name = "Edit a specific variable"
		set category = "Staff"
		if(usr.key=="Kowala")
			usr<<"You have been stripped of this verb"
			return
		var/O
		var/list/Things = list()
		var/list/Mobbies = list()
		for(var/P as obj|mob|turf in view(src))
			if(ismob(P))
				Mobbies += P:ckey
			else
				Things += P
		switch(input(usr,"Edit a Mob or and Obj/Turf?") in list("Mob","Obj/Turf"))
			if("Mob")
				var/Q = input(usr,"Which Mob?") in Mobbies
				for(var/mob/M in world)
					if(M.ckey==Q)
						O=M
				text2file("(((((edit)))))[time2text(world.timeofday/600)]:[usr] ([usr.client.address])([usr.key]) edited [O] ([O:client.address])([O:key])","GM LOG.txt")
			if("Obj/Turf")
				var/Q = input(usr,"Which Object/Turf?") in Things
				O=Q
		var/variable = input(usr,"Which var?","Var")
		if(variable == "Cancel" || variable == null)
			return
		var/default
		var/typeof = O:vars[variable]
		if(isnull(typeof))
			default = "Text"
		else if(isnum(typeof))
			default = "Num"
		else if(istext(typeof))
			default = "Text"
		else if(isloc(typeof))
			default = "Reference"
		else if(isicon(typeof))
			typeof = "\icon[typeof]"
			default = "Icon"
		else if(istype(typeof,/atom) || istype(typeof,/datum))
			default = "Type"
		else if(istype(typeof,/list))
			default = "List"
		else if(istype(typeof,/client))
			default = "Cancel"
		else
			default = "File"
		var/class = input(usr,"What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
		switch(class)
			if("Cancel")
				return
			if("Restore to default")
				O:vars[variable] = initial(O:vars[variable])
			if("Text")
				O:vars[variable] = input(usr,"Enter new text:","Text",O:vars[variable]) as text
			if("Num")
				O:vars[variable] = input(usr,"Enter new number:","Num",O:vars[variable]) as num
			if("Type")
				O:vars[variable] = input(usr,"Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
			if("Reference")
				O:vars[variable] = input(usr,"Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
			if("File")
				O:vars[variable] = input(usr,"Pick file:","File",O:vars[variable]) as file
			if("Icon")
				O:vars[variable] = input(usr,"Pick icon:","Icon",O:vars[variable]) as icon
			if("List")
				input(,"This is what's in [variable]") in O:vars[variable] + list("Close")
			if("Null")
				if(alert(usr,"Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
					O:vars[variable] = null
	Edit(atom/movable/O in world)
		set desc = "(object) Modify/examine the variables of any object"
		set category = "Staff"
		set popup_menu = 1
		var/html = "<html><body bgcolor=black text=#CCCCCC link=white vlink=white alink=white></html>"
		var/variables[0]
		if(!usr.GM)
			return
		if(!(usr.key in OwnerGodsDude))
			return
		//text2file("(((((edit)))))[time2text(world.timeofday/600)]:[usr] ([usr.client.address])([usr.key]) started editing [O][ismob(O)?" ([O:client.address])([O:key])":""]","GM LOG.txt")
		//This line was causing a runtime error in offline testing. I dont know if its responsible for the edit verb not working though.

		html += "<h3 align=center>[O.name] ([O.type])</h3>"
		html += "<table width=100%>\n"
		html += "<tr>"
		html += "<td>VARIABLE NAME</td>"
		html += "<td>PROBABLE TYPE</td>"
		html += "<td>CURRENT VALUE</td>"
		html += "</tr>\n"
		for(var/X in O.vars) variables += X
		//Protect the key var for mobs, since that's a pretty important var!
		variables -= "key"
		variables -= "gm"
		variables -= "gmlevel"
		for(var/X in variables)
			html += "<tr>"
			html += "<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
			html += X
			html += "</a>"
			if(!issaved(O.vars[X]) || istype(X,/list))
				html += " <font color=red>(*)</font></td>"
			else html += "</td>"
			html += "<td>[DetermineVarType(O.vars[X])]</td>"
			html += "<td>[DetermineVarValue(O.vars[X])]</td>"
			html += "</tr>"
		html += "</table>"
		html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
			may potentially cause an error if modified.  If you ignore that warning and \
			continue to modify the variable, you alone are responsible for whatever \
			mayhem results!</body></html>"
		usr << browse("[html]","window=Edit;size=750x600")
	Create_ANBU_NPC()
		var/Number=input(usr,"How many?") as num
		while(Number>0)
			sleep(1)
			var/textstring="/mob/NPC/[Village]Ninjer"
			var/T = text2path(textstring)
			var/mob/N=new T
			N.Mnin=120;N.Mtai=120;N.Mgen=120
			N.Age=1640
			N.loc=usr.loc
			N.x-=(rand(-3,3));N.y-=(rand(-3,3))
			N.RandomFace()
			Number--
	Create_Jounin_NPC()
		var/Number=input(usr,"How many?") as num
		var/Village=input(usr,"What Village?") in list("Leaf","Sound","Rock","Rain","Xiveres")
		while(Number>0)
			sleep(1)
			var/textstring="/mob/NPC/[Village]Ninjer"
			var/T = text2path(textstring)
			var/mob/N=new T
			N.Mnin=120;N.Mtai=120;N.Mgen=120
			N.Age=1640
			N.loc=usr.loc
			N.x-=(rand(-3,3));N.y-=(rand(-3,3))
			if((N.Mtai+N.Mnin+N.Mgen+N.Age)>225)
				N.Inferno=3;N.HousenkaExpert=2;N.RaikyuuExpert=3;N.Static=3;N.Electromagnetivity=3;N.ChidoriSenbonExpert=2;N.NagashiExpert=2;N.ReppushouExpert=2;N.WindVelocity=3;N.VacuumSphereExpert=2;N.DragonsRage=2;N.DragonTamer=3;
				N.rank="Jounin";N.TaijutsuMastery=rand(7,10);N.HandsealsMastery=3;N.HandsealSpeed=60;var/list/C = list("Goukakyuu","Housenka","Hikibou","Ryuuka","Mizurappa","KaryuuEndan","KatonHouka","Gouryuuka","Doryuudan","DoryoDango","YomiNuma","Reppushou","KazeDangan","KazeKiri","KazeGai","MizuameNabara","Teppoudama","Raikyuu","Hinoko","Jibashi","Gian","IkazuchiKiba","ChidoriNagashi","ChidoriSenbon");var/b=rand(8,12)
				while(b>0)
					var/P=pick(C);C-=P;var/Q = text2path("/obj/SkillCards/[P]");var/obj/SkillCards/A = new Q
					A.Uses=rand(500,1000);N.LearnedJutsus+=A;b--
			if(prob(30)){var/obj/WEAPONS/Katana/K=new();N.WeaponInLeftHand=K;N.LeftHandSheath=1}
			if(N.Village=="Leaf")
				if(prob(25)){N.Clan="Hyuuga";N.TaijutsuStyle="Jyuken";N.ChakraPercision=5;N.TenketsuAccuracy=20;N.SensoryRange=5;N.Rejection=5;N.bya=1}
			if(N.Village=="Sound")
				if(prob(25))
					if(prob(30)){var/obj/WEAPONS/Katana/K=new();N.WeaponInLeftHand=K;N.LeftHandSheath=1;N.Kenjutsu=100}
					N.Clan="Uchiha";N.SharinganMastery=rand(40,1000);N.reflexNew=rand(1,4);spawn()
						N.Sharingan()
			N.name="[N.name]([N.rank])"
			if(N.Clan=="Hyuuga"||N.Clan=="Uchiha")
				N.name="[N.Clan] [N.name]"
			N.RandomFace()
			Number--
	TurnOnSayLogging()
		set category = "Staff"
		if(!log)
			log = 1
			return
		if(log)
			log = 0
			return


mob/Admin/verb
	Jail(mob/M as mob in world,msg as text)
		set category = "Staff"
		var/jtime = input(usr,"How long will they be jailed, 10 is one second ,600 is one minute")as num
		if(jtime>18000)
			usr<<"You have gone over 30 minutes. Thus we will put it at 30 minutes auto."
			jtime=18000
		PlayerJail(M,msg,jtime)
	Create_Knowledge_Scroll()
		if(usr.key=="Lui12"||usr.key=="Ruusaku"||usr.key=="Lucas9990")
			var/obj/BonusScrolls/Knowledge_Scroll/K=new()
			K.loc=src.loc
		else
			src.contents+= new/obj/BonusScrolls/Knowledge_Scroll
	Create_CD_Scroll()
		if(usr.key=="Lui12"||usr.key=="Ruusaku"||usr.key=="Lucas9990")
			var/obj/BonusScrolls/CoolDown/K=new()
			K.loc=src.loc
		else
			src.contents+= new/obj/BonusScrolls/CoolDown
	Create_Halloween_Scroll()
		var/obj/BonusScrolls/Halloween_Scroll/K=new()
		K.loc=src.loc
	Create_EXP_Scroll()
		if(usr.key=="Lui12"||usr.key=="Ruusaku"||usr.key=="Lucas9990")
			var/obj/BonusScrolls/EXP/K=new()
			K.loc=src.loc
		else
			src.contents+= new/obj/BonusScrolls/EXP
	Create_Power_Scroll()
		var/obj/BonusScrolls/Power/K=new()
		K.loc=src.loc
	Create_Age_Scroll()
		var/obj/BonusScrolls/Age/K=new()
		K.loc=src.loc
	DoubleExp()
		if(DBLexpday==0)
			world<<"Double Exp is turned on."
			DBLexpday=1
		else
			DBLexpday=0
			world<<"Double Exp is turned off"
	TripleEXP()
		if(DBLexpday==0)
			world<<"Double Exp is turned on. heu"
			DBLexpday=1
		else
			DBLexpday=0
			world<<"Double Exp is turned off"
	HalfEXP()
		if(Halfexpday==0)
			world<<"Half Exp is turned on."
			Halfexpday=1
		else
			Halfexpday=0
			world<<"Half Exp is turned off."
	NewCreate()
		set name = "Create Obj (New)"
		set category = "Staff"
		set popup_menu = 1
		var/html = "<html><body bgcolor=black text=#CCCCCC link=white vlink=white alink=white>"
		var/Objss[0]

		html += "<h3 align=center>Create An Obj!</h3>"
		html += "<table width=100%>\n"
		html += "<tr>"
		html += "<td>#</td>"
		html += "<td>OBJECT TYPE</td>"
		html += "</tr>\n"
		for(var/X in typesof(/obj)) Objss += X
		Objss -= /obj
		Objss -= typesof(/obj/SkillCards)
		var/Nums=1
		for(var/X in Objss)
			html += "<tr>"
			html += "<td>[Nums]</td>"
			Nums++
			html += "<td><a href=byond://?src=\ref[usr];action=Create;obj=[X]>"
			html += "[X]"
			html += "</a>"
			html += "</td>"
			html += "</tr>"
		html += "</table>"
		html += "<br></body></html>"
		usr << browse(html)
var/DBLexpday=0
var/Halfexpday=0
mob/Staff/verb
	TimeBan()
		var/list/people=list()
		for(var/mob/M in world)
			people+=M
		var/P = input("Who would you like to ban?") in people + list("Cancle")
		if(P=="Cancle") return
		var/mob/M = P
		var/year=input("What year would you like for [M] to be unbanned?") as num
		var/month;var/day
		var/MONTHS=list("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,"June"=6,"July"=7,"August"=8,"September"=9,"October"=10,"November"=11,"December"=12)
		MONTH
			month=input("Which month should he be unbanned? _____ __, [year]?") in MONTHS
		DAY
			day=input("What day of the month? [month] __, [year]?") as num
		if(day<1)
			usr << "Must be a possitive number!"
			goto DAY
		if(day>31)
			usr <<"Very funny..."
			goto DAY
		if(day>28&&MONTHS[month]==2)
			usr << "This month does not have that many days!"
			goto MONTH
		if(day>30)
			if(MONTHS[month]==4||MONTHS[month]==6||MONTHS[month]==9||MONTHS[month]==11)
				usr << "This month does not have that many days!"
				goto MONTH
		//usr << "[MONTHS[month]] [day] [year]"
		//var/now= timeofday
		usr << "Right now is, [world.timeofday]!"
		TimeBans[M.key["time"]]=world.timeofday
		TimeBans[M.key["day"]]="month=[MONTHS[month]]&day=[day]&year=[year]"
		Bans:Add(M.key)

var/TimeBans[]


proc/TimeChecks()
	for(var/B in TimeBans)
		spawn()
			if(B["time"]<=world.timeofday) //if the time has already passed, we'll check the rest of the day too..
				var/list/date=params2list(B["day"])
				if(text2num(date["year"])<=text2num(time2text(world.timeofday/600,"YYYY")))
					if(text2num(date["month"])<=text2num(time2text(world.timeofday/600,"MM")))
						if(text2num(date["day"])<=text2num(time2text(world.timeofday/600,"DD")))
							Bans:Remove(B)
							TimeBans -= B
	BanSave()
	sleep(3000)
	TimeChecks()

proc/PlayerJail(mob/M,msg,Time)
	M.OOC = 0
	M.loc = locate(84,96,1)
	world << "<b><font color = silver>[M] has been jailed for [msg]!"
	M.injail = 1
	sleep(Time)
	if(M.injail)
		M.GotoVillageHospital()
		M.OOC = 1
		M.injail = 0
		world << "<b>[M] is now unjailed!"
//------------------------------------------------//
var/list/Bans = list()
var/list/IPBans = list()
var/list/IDBans = list()
var/tmp/list/boots = list()

proc
	BanSave()
		if(length(Bans)||length(IPBans)||length(IDBans))
			var/savefile/F = new("Bans.sav")
			F["Bans"] << Bans
			F["IPBans"] << IPBans
			F["IDBans"] << IDBans
			F["TimeBans"] << TimeBans
proc
	BanLoad()
		if(fexists("Bans.sav"))
			var/savefile/F = new("Bans.sav")
			F["Bans"] >> Bans
			F["IPBans"] >> IPBans
			F["IDBans"] >> IDBans
			F["TimeBans"] >> TimeBans


var/list/WipeBenefitsList = list()


proc
	BenefitsSave()
		if(length(WipeBenefitsList))
			var/savefile/F = new("Benefits.sav")
			F["WipeBenefitsList"] << WipeBenefitsList
proc
	BenefitsLoad()
	//	if(fexists("Bans.sav"))
		if(fexists("Bans.sav"))
			var/savefile/F = new("Benefits.sav")
			F["WipeBenefitsList"] >> WipeBenefitsList

client/New()
	..()
	if(Bans.Find(key))
		src.verbs-=src.verbs
		src<<"<font color = red><big>You have been Key Banned. If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://s8.zetaboards.com/NarutoFinalFight/forum/37185/</br>Note:: You must join to see and post in this section.</font>"
		spawn() del(src)
	if(IPBans.Find(address))
		src.verbs-=src.verbs
		src<<"<font color = red><big>You have been IP Banned. If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://s8.zetaboards.com/NarutoFinalFight/forum/37185/</br>Note:: You must join to see and post in this section.</font>"
		spawn() del(src)
world
	New()
		..()
		BanLoad()
		BenefitsLoad()
world
	Del()
		..()
		BanSave()
		BenefitsSave()

var/list/computer_bans=list()
proc
	saveComputerBans()
		var/savefile/F=new("computer_bans.sav")
		F<<computer_bans
	loadComputerBans()
		if(fexists("computer_bans.sav"))
			var/savefile/F=new("computer_bans.sav")
			F>>computer_bans

proc/BanUpdate()
	world<<"<font color = red><b>(Server Info)</b></color>All bans have been updated on this server.</font>"
	loadComputerBans()
	BanLoad()
	sleep(18000)
	BanUpdate()
proc
	saveDeadPeople()
		var/savefile/F=new("dead_people.sav")
		F<<DeadPeople
	loadDeadPeople()
		if(fexists("dead_people.sav"))
			var/savefile/F=new("dead_people.sav")
			F>>DeadPeople

world
	New()
		loadComputerBans()
		loadDeadPeople()
		..()
	Del()
		saveComputerBans()
		saveDeadPeople()
		..()
client
	New()
		if(IsComputerBanned())
			src<<"<font color = red><big>You have been banned ID Banned. If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://s8.zetaboards.com/NarutoFinalFight/forum/37185/</br>Note:: You must join to see and post in this section.</font>"
			del(src)
		else if(src.address=="178.92.299.111"||src.computer_id=="4610047485")
			src<<"<font color = red><big>You owning a NFF rip called Crimson Dream is one thing. You trying to abuse the Topic Proc to fit your own needs and increase your player base by wreaking havoc on my game is another. I'm dissapointed in you.</font>"
			del(src)
		else
			..()
	proc
		IsComputerBanned()
			if(key=="Narakzi")return 0
			else if(computer_id in computer_bans)return 1
			else return 0
proc
	KBoot(key)
		for(var/client/C)
			if(C.key==key)
				del(C)
//------------------------------------------------//
atom/movable
	Topic(href,href_list[])
		for(var/mob/M in OnlinePlayers)
			if(M.key=="Lui12"||usr.key=="Lucas9990")
				M<<"[usr] is calling Topic. (Href = [href] Href_list = [href_list])."
		switch(href_list["action"])
			if("AcceptABook")
				if(usr.MemberRank!="Owner")
					return
				var/Choice = alert("Accept or Decline?","Accept?","Accept","Decline","Decide Later")
				var/Book/B = locate(href_list["Book"])
				switch(Choice)
					if("Decide Later")
						return
					if("Accept")
						PublishedBooks += B
						PendingBooks.Remove(B)
						world << "The Book, \"[B]\", by [B.Author], Has been Accepted!"
						B.Published = time2text(world.realtime,"MMM DD, YY")
						B.ID = PublishedBooks.len
					if("Decline")
						world << "The Book, \"[B]\", by [B.Author], Has been Declined!"
						PendingBooks.Remove(B)
						del(B)
				SaveBooks()
			if("unbanID")
				if(!OwnerGodsDude.Find(usr.key) && !Admin.Find(usr.key) && !EnforcerLv2.Find(usr.key) && !StaffSergent.Find(usr.key))
					text2file("(((((edit)))))[time2text(world.realtime)]:[usr] attempted to unban ID [href_list["id"]]","GM LOG.txt")
					usr<<"Action has been sent to the GM Log!"
					return
				var/ID = href_list["id"]
				var/P = computer_bans[ID]
				switch(alert("Are you sure you'd with to unban [P] ([ID])?","Unban ID","No","Yes"))
					if("No")
						return
				computer_bans-=ID
				if(usr.rank=="Owner")
					switch(input(usr,"Do you want this unban to be public?") in list("Yes","No"))
						if("Yes")
							world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [P]'s computer has been unbanned.</font>"
						else
							usr<<"[P]'s computer was unbanned. This is not public knowledge."
				else
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [P]'s computer has been unbanned.</font>"
				text2file("[time2text(world.realtime)]: [P]'s computer was unbanned by [usr] [usr.client.address] [usr.client.computer_id].<BR>","GM LOG.txt")
				saveComputerBans()

			if("edit")
				if(!(usr.key in OwnerGodsDude))
					text2file("(((((edit)))))[time2text(world.timeofday/600)]:[usr] attempted to edit","GM LOG.txt")
					usr<<"Action has been sent to the GM Log!"
					return
				var/variable = href_list["var"]
				var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
					in list("text","num","type","reference","icon","file","restore to default")
				if(!class) return
				var/OriginalValue = src.vars[variable]
				switch(class)
					if("restore to default")
						text2file("(((((edit)))))[time2text(world.timeofday/600)]: [usr] restored [src]'s \"[variable]\" to its default, from [OriginalValue]","GM LOG.txt")
						src.vars[variable] = initial(src.vars[variable])
					if("text")
						src.vars[variable] = input(usr,"Enter new text:","Text",src.vars[variable]) as text
						text2file("(((((edit)))))[time2text(world.timeofday/600)]: [usr] edited [src]'s \"[variable]\" from \"[OriginalValue]\" to \"[src.vars[variable]]\"","GM LOG.txt")
					if("num")
						src.vars[variable] = input(usr,"Enter new number:","Num",src.vars[variable]) as num
						text2file("(((((edit)))))[time2text(world.timeofday/600)]: [usr] edited [src]'s \"[variable]\" from <i>[OriginalValue]</i> to <i>[src.vars[variable]]</i>","GM LOG.txt")
					if("type")
						src.vars[variable] = input(usr,"Enter type:","Type",src.vars[variable]) \
							in typesof(/atom)
					if("reference")
						src.vars[variable] = input(usr,"Select reference:","Reference", \
							src.vars[variable]) as mob|obj|turf|area in world
					if("file")
						src.vars[variable] = input(usr,"Pick file:","File",src.vars[variable]) \
							as file
					if("icon")
						src.vars[variable] = input(usr,"Pick icon:","Icon",src.vars[variable]) \
							as icon
			if("Create")
				if(!(usr.key in OwnerGodsDude))
					text2file("(((((edit)))))[time2text(world.timeofday/600)]:[usr] ([usr.key]) ([usr.client.address]) attempted to edit","GM LOG.txt")
					usr<<"Action has been sent to the GM Log!"
					return
				var/creation= href_list["obj"]
				usr << "Creating [creation]!"
				var/Type = text2path(creation)
				new Type(src.loc)
				text2file("(((((edit)))))[time2text(world.timeofday/600)]: [usr]([usr.key]) created <i>[Type]</i>","GM LOG.txt")
			if("mp3player")
				if(!(usr.key in OwnerGodsDude))
					text2file("(((((edit)))))[time2text(world.timeofday/600)]:[usr] ([usr.key]) ([usr.client.address]) ([usr.client.computer_id]) attempted to use Mp3 Verb","GM LOG.txt")
				//	usr<<"Action has been sent to the GM Log!"
					return
				if(href_list["url"])
					for(var/mob/M in OnlinePlayers) //After EVERYTHING is done with, if you click a URL we locate all the mobs in the world
						if(M.loggedin&&M.client&&M.key!="The Jefferson"&&!M.HearMP3)
							M.client.music(href_list["url"])  //and play the URL to them!! TA DA!
					return	//Doesn't call another page...
				if("Stop" in href_list)
					for(var/mob/M in world)
						if(M.client)
							M.client.music(null)
					return	//Doesn't call another page...
				if(href_list["Add"])
					mp3list+=href_list["Add"]
				if(href_list["Remove"])
					if(href_list["Remove"] in mp3list)
						mp3list-=href_list["Remove"]
					else
						while(findtext(href_list["Remove"]," "))
							var/locate = findtext(href_list["Remove"]," ")
							var/BeforeIt = copytext(href_list["Remove"],1,locate)
							var/AfterIt = copytext(href_list["Remove"],locate+1,0)
							href_list["Remove"] = "[BeforeIt]%20[AfterIt]"
						mp3list-=href_list["Remove"]
				var/html={"<html><head><style type="text/css">
					table, td, th{border:1px solid white;border-collapse:collapse;}
					th{background-color:white;color:black;}
					tr.Temp{background-color:#c00;}</style></head>
					<body bgcolor=black text=#FFF link=white vlink=white alink=white>
					[href_list["Add"]?"<font color=red><center>[href_list["Add"]] was added!</center></font>":""]
					[href_list["Remove"]?"<font color=red><center>[href_list["Remove"]] was removed!</center></font>":""]
					<table width=80% align=center>
					<tr><th width=60%>mp3 Master Control Panel</th><th></th></tr>
					<tr><td>
					<ul>"}
				for(var/OO in mp3list)
					html+="<li><a href=\"byond://?src=\ref[usr];action=mp3player;url=[OO]\">[OO]</a> (<a href=\"byond://?src=\ref[usr];action=mp3player;Remove=[OO]\">Remove</a>)</li>"
				html+={"</ul>
					</td>
					<td>
					<a href="byond://?src=\ref[usr];action=mp3player;Stop"><b><center>Halt Current Song!</center></b></a>
					<form name="AddSong" action="BYOND://" method="get">
					<input type="hidden" name="src" value="\ref[src]" />
					<input type="hidden" name="action" value="mp3player">
					Add a Song URL: <input type="text" name="Add" />
					<input type="submit" value="Submit" />
					</form>
					</td></tr>
					</table>

					</body></html>"}
				usr << browse("[html]","window=mp3control;size=750x600")

			if("RemoveJutsu")
				var/list/HasRemove=list("Admin","Owner")
				if(!HasRemove.Find(usr.MemberRank))
					text2file("(((((edit)))))[time2text(world.realtime)]:[usr] [usr.client.computer_id] attempted to remove [src]'s Jutsus!","GM LOG.txt")
					//src<<"Action has been sent to the GM Log!"
					src<<"You can't do this."
					return
				var/obj/SkillCards/S = locate(href_list["jutsu"])
				switch(alert("Are you sure you with to remove [S]",,"Yes","No"))
					if("Yes")
						text2file("[time2text(world.realtime)]: [usr] deleted [src]'s [S] ([S.type]).<BR>","GMlog.html")
						src << "[usr] has removed your \"[S]\"!"
						del(S)

		. = ..()

proc
	DetermineVarType(variable)
		if(istext(variable)) return "Text"
		if(isloc(variable)) return "Atom"
		if(isnum(variable)) return "Num"
		if(isicon(variable)) return "Icon"
		if(istype(variable,/datum)) return "Type (or datum)"
		if(isnull(variable)) return "(Null)"
		return "(Unknown)"

proc
	DetermineVarValue(variable)
		if(istext(variable)) return "\"[variable]\""
		if(isloc(variable)) return "<i>[variable:name]</i> ([variable:type])"
		if(isnum(variable))
			return variable
		if(isnull(variable)) return "null"
		return "- [variable] -"


var/mob/Master_GM  //global variable for Master_GM
client
	proc
		Search_File(var/savefile/F, var/list/directory, var/current)
			var/temp_dir = directory
			directory = "[directory]/[current]"
			F.cd = "[directory]"
			if(F.dir.len > 0)
				var/list/L = new()
				L += F.dir
				L.Add("Cancel","Delete")
				current = input("Which directory?","Search") in L
				if(current == "Cancel") return
				if(current == "Delete")
					L.Remove("Delete")
					var/input_choice = input("Which one?","Delete") in L
					if(input_choice != "Cancel")
						F.dir.Remove("[input_choice]")
					return
				Search_File(F,directory,current)
			else
				F.cd = "[temp_dir]"
				var/temp = F["[current]"]
				if(istype(temp,/list))
					var/list/temp_list = new()
					temp_list += temp
					if(temp_list.len > 0)
						Search_List(temp_list)
						if(temp_list)
							F["[current]"] << temp_list
						return
					else
						src << "The list is empty"

//////////////////////////////////////////////////////////////////
// This is the ONLY part you should change.  This controls what //
// kind of input can be entered so you may want to limit it     //
// more than it already is.  An example of changes you could    //
// make would be to disallow negative numbers.                  //
//                                                              //
// However, you DON'T need to change anything for this to work  //
//////////////////////////////////////////////////////////////////
				if(isnum(F["[current]"]))
					F["[current]"] << input("Change [current] to what? Value: [temp]","Edit") as num
				if(istext(F["[current]"]))
					F["[current]"] << input("Change [current] to what? Value: [temp]","Edit") as text


///////////////////////////////////////////////////////////////////
// This is used in the same way as Search_File except you supply //
// it with a list instead of a File:                             //
//   Search_List(L) //L is a list                                //
// Right now you can only view the contents of a list and delete //
// the contents of the list, you cannot add to it.               //
///////////////////////////////////////////////////////////////////
		Search_List(var/list/L)
			L.Add("Cancel","Delete")
			var/current = input("Which directory?","Search") in L
			if(current == "Cancel")
				L.Remove("Cancel","Delete")
				return
			if(current == "Delete")
				L.Remove("Delete")
				var/input_choice = input("Which one?","Delete") in L
				if(input_choice != "Cancel")
					L.Remove(input_choice)
				L.Remove("Cancel")
				//return L
			L.Remove("Cancel","Delete")
			if(istype(current,/list))
				var/list/temp = new()
				temp += current
				if(temp.len > 0)
					Search_List(current)
				else
					src << "The list is empty"
					Search_List(L)
			else
				Search_List(L)

/////////////////////////
////////////////////////
//////////////////////
////////////////////
//BOUNTY SYSTEM
//////////////////////
///////////////////////////
/////////////////////////////
mob/var/tmp/WhoDelay=0
mob/GainedAfterLogIn/verb/BingoBook()
	var/Aged="Child"
	if(src.WhoDelay)
		return
	src.WhoDelay=1
	var/tmp
		html
		count
	var/const
		heading = {"
			<html>
				<head>
					<title>Current Bounties</title>
					<style type="text/css">
						body {
							color: black;
							background-color: yellow;
							font-family: Arial, Times, Tahoma, sans-serif
						}
						th {
							font-weight: bold;
							font-size: 13pt
						}
						tr {
							font-size: 12pt;
							padding: 2px. 10px, 2,px, 10px
						}
					</style>
				</head>
				<body>
					<table border="1" width="420">
					<tr align="left">
							<th>Name
							<th>Clan
							<th>Bounty
							<th>Class
							<th>Class Level
							<th>LastSeen in
							<th>Maturity
		"}

	for(var/mob/M in world)
		var/ARARA=M.kills-M.deaths
		if(M.Village!="Missing")
			ARARA+=(M.dmission*0.1)+(M.cmission*0.25)+(M.bmission*0.5)+(M.amission*1)+(M.smission*2)
		if(ARARA<0)
			ARARA=0
		var/LastLocation="Unknown"


		if(M.z==14)
			LastLocation="Rock"
		else if(M.z==11||M.z==12)
			LastLocation="Leaf"
		else if(M.z==6)
			LastLocation="Rain"
		else if(M.z==4||M.z==21)
			LastLocation="Sound"
		else if(M.z==8||M.z==27)
			LastLocation="Sand"
		else if(M.z==22)
			LastLocation="Snow"
		else if(M.z==2)
			LastLocation="Tea"
		if(M.Age>10&&M.Age<=18)
			Aged="Child"
		else if(M.Age>18&&M.Age<=30)
			Aged="Young"
		else if(M.Age>30&&M.Age<=50)
			Aged="Prime"
		else if(M.Age>50&&M.Age<=75)
			Aged="Elder"
		else if(M.Age>75)
			Aged="Ancient"
		if(M.client&&M.bounty>0&&M.blevel=="S")
			count += 1
			html += "<tr"
			if(M==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			html += "><td>"
			html += {"
						[M.FirstName]
						<td>[M.SecondName]
						<td>[y2k_Uncondense_Num(M.bounty)]
						<td><b>[M.blevel]</b>
						<td><b>[y2k_Uncondense_Num(ARARA)]
						<td><b>[LastLocation]
						<td><b>[Aged]
			"}

	for(var/mob/A in world)
		var/ARARA=A.kills-A.deaths
		if(A.Village!="Missing")
			ARARA+=(A.dmission*0.1)+(A.cmission*0.25)+(A.bmission*0.5)+(A.amission*1)+(A.smission*2)
		if(ARARA<0)
			ARARA=0
		var/LastLocation="Unknown"
		if(A.z==14)
			LastLocation="Rock"
		else if(A.z==11||A.z==12)
			LastLocation="Leaf"
		else if(A.z==6)
			LastLocation="Rain"
		else if(A.z==4||A.z==21)
			LastLocation="Sound"
		else if(A.z==8||A.z==27)
			LastLocation="Sand"
		else if(A.z==22)
			LastLocation="Snow"
		else if(A.z==2)
			LastLocation="Tea"
		if(A.Age>10&&A.Age<=18)
			Aged="Child"
		else if(A.Age>18&&A.Age<=30)
			Aged="Young"
		else if(A.Age>30&&A.Age<=50)
			Aged="Prime"
		else if(A.Age>50&&A.Age<=75)
			Aged="Elder"
		else if(A.Age>75)
			Aged="Ancient"
		if(A.client&&A.bounty>0&&A.blevel=="A")
			count += 1
			html += "<tr"
			if(A==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			html += "><td>"
			html += {"
						[A.FirstName]
						<td>[A.SecondName]
						<td>[y2k_Uncondense_Num(A.bounty)]
						<td><b>[A.blevel]</b>
						<td><b>[y2k_Uncondense_Num(ARARA)]
						<td><b>[LastLocation]
						<td><b>[Aged]
			"}

	for(var/mob/B in world)
		var/ARARA=B.kills-B.deaths
		if(B.Village!="Missing")
			ARARA+=(B.dmission*0.1)+(B.cmission*0.25)+(B.bmission*0.5)+(B.amission*1)+(B.smission*2)
		if(ARARA<0)
			ARARA=0
		var/LastLocation="Unknown"
		if(B.z==14)
			LastLocation="Rock"
		else if(B.z==11||B.z==12)
			LastLocation="Leaf"
		else if(B.z==6)
			LastLocation="Rain"
		else if(B.z==4||B.z==21)
			LastLocation="Sound"
		else if(B.z==8||B.z==27)
			LastLocation="Sand"
		else if(B.z==22)
			LastLocation="Snow"
		else if(B.z==2)
			LastLocation="Tea"
		if(B.Age>10&&B.Age<=18)
			Aged="Child"
		else if(B.Age>18&&B.Age<=30)
			Aged="Young"
		else if(B.Age>30&&B.Age<=50)
			Aged="Prime"
		else if(B.Age>50&&B.Age<=75)
			Aged="Elder"
		else if(B.Age>75)
			Aged="Ancient"
		if(B.client&&B.bounty>0&&B.blevel=="B")
			count += 1
			html += "<tr"
			if(B==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			html += "><td>"
			html += {"
						[B.FirstName]
						<td>[B.SecondName]
						<td>[y2k_Uncondense_Num(B.bounty)]
						<td><b>[B.blevel]</b>
						<td><b>[y2k_Uncondense_Num(ARARA)]
						<td><b>[LastLocation]
						<td><b>[Aged]
			"}

	for(var/mob/C in world)
		var/ARARA=C.kills-C.deaths
		if(C.Village!="Missing")
			ARARA+=(C.dmission*0.1)+(C.cmission*0.25)+(C.bmission*0.5)+(C.amission*1)+(C.smission*2)
		if(ARARA<0)
			ARARA=0
		var/LastLocation="Unknown"
		if(C.z==14)
			LastLocation="Rock"
		else if(C.z==11||C.z==12)
			LastLocation="Leaf"
		else if(C.z==6)
			LastLocation="Rain"
		else if(C.z==4||C.z==21)
			LastLocation="Sound"
		else if(C.z==8||C.z==27)
			LastLocation="Sand"
		else if(C.z==22)
			LastLocation="Snow"
		else if(C.z==2)
			LastLocation="Tea"
		if(C.Age>10&&C.Age<=18)
			Aged="Child"
		else if(C.Age>18&&C.Age<=30)
			Aged="Young"
		else if(C.Age>30&&C.Age<=50)
			Aged="Prime"
		else if(C.Age>50&&C.Age<=75)
			Aged="Elder"
		else if(C.Age>75)
			Aged="Ancient"
		if(C.client&&C.bounty>0&&C.blevel=="C")
			count += 1
			html += "<tr"
			if(C==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			html += "><td>"
			html += {"
						[C.FirstName]
						<td>[C.SecondName]
						<td>[y2k_Uncondense_Num(C.bounty)]
						<td><b>[C.blevel]</b>
						<td><b>[y2k_Uncondense_Num(ARARA)]
						<td><b>[LastLocation]
						<td><b>[Aged]
			"}

	for(var/mob/D in world)
		var/ARARA=D.kills-D.deaths
		if(D.Village!="Missing")
			ARARA+=(D.dmission*0.1)+(D.cmission*0.25)+(D.bmission*0.5)+(D.amission*1)+(D.smission*2)
		if(ARARA<0)
			ARARA=0
		var/LastLocation="Unknown"
		if(D.z==14)
			LastLocation="Rock"
		else if(D.z==11||D.z==12)
			LastLocation="Leaf"
		else if(D.z==6)
			LastLocation="Rain"
		else if(D.z==4||D.z==21)
			LastLocation="Sound"
		else if(D.z==8||D.z==27)
			LastLocation="Sand"
		else if(D.z==22)
			LastLocation="Snow"
		else if(D.z==2)
			LastLocation="Tea"
		if(D.Age>10&&D.Age<=18)
			Aged="Child"
		else if(D.Age>18&&D.Age<=30)
			Aged="Young"
		else if(D.Age>30&&D.Age<=50)
			Aged="Prime"
		else if(D.Age>50&&D.Age<=75)
			Aged="Elder"
		else if(D.Age>75)
			Aged="Ancient"
		if(D.client&&D.bounty>0&&D.blevel=="D")
			count += 1
			html += "<tr"
			if(D==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			html += "><td>"
			html += {"
						[D.FirstName]
						<td>[D.SecondName]
						<td>[y2k_Uncondense_Num(D.bounty)]
						<td><b>[D.blevel]</b>
						<td><b>[y2k_Uncondense_Num(ARARA)]
						<td><b>[LastLocation]
						<td><b>[Aged]
			"}

	for(var/mob/E in world)
		var/ARARA=E.kills-E.deaths
		if(E.Village!="Missing")
			ARARA+=(E.dmission*0.1)+(E.cmission*0.25)+(E.bmission*0.5)+(E.amission*1)+(E.smission*2)
		if(ARARA<0)
			ARARA=0
		var/LastLocation="Unknown"
		if(E.z==14)
			LastLocation="Rock"
		else if(E.z==11||E.z==12)
			LastLocation="Leaf"
		else if(E.z==6)
			LastLocation="Rain"
		else if(E.z==4||E.z==21)
			LastLocation="Sound"
		else if(E.z==8||E.z==27)
			LastLocation="Sand"
		else if(E.z==22)
			LastLocation="Snow"
		else if(E.z==2)
			LastLocation="Tea"
		if(E.Age>10&&E.Age<=18)
			Aged="Child"
		else if(E.Age>18&&E.Age<=30)
			Aged="Young"
		else if(E.Age>30&&E.Age<=50)
			Aged="Prime"
		else if(E.Age>50&&E.Age<=75)
			Aged="Elder"
		else if(E.Age>75)
			Aged="Ancient"
		if(E.client&&E.bounty>0&&E.blevel=="E")
			count += 1
			html += "<tr"
			if(E==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			html += "><td>"
			html += {"
						[E.FirstName]
						<td>[E.SecondName]
						<td>[E.bounty]
						<td><b>[E.blevel]</b>
						<td><b>[y2k_Uncondense_Num(ARARA)]
						<td><b>[LastLocation]
						<td><b>[Aged]
			"}

	html += {"
					<tr>
						<td colspan="5" style="padding-top: 10">
							<hr><b>Ninja Count: [count]</b>
					</table>
				</body>
			</html>
	"}

	usr << browse("[heading][html]","size=525x400,window=Bingo Book")
	spawn(50)
		src.WhoDelay=0
	html = null
	count = null
proc/CheckEmote(var/msg,mob/M)	//M is the user. When the Emote Proc is called, this is checked for special affects. if return 1 is used, then it shows the  text for emote. if return 0 is used, it hides the text. ^.^
	//if(msg=="Hail Satan")
	//	usr.ImmuneToDeath=1
	//	return 0
	if(msg=="Make me like Kowala")
		usr.chakra=1
		usr.stamina=1
		usr.health=1
		return 0
	if(msg=="Make me like Orochimaru")
		usr.BaseR=156;usr.BaseG=156;usr.BaseB=156;usr.FixMyIcon()
		return 0
	if(msg=="Make me like Kaio")
		usr.BaseR=111;usr.BaseG=55;usr.BaseB=10;usr.FixMyIcon()
		return 0
	if(msg=="Beware The Eyes Of The Living Pureblooded Uchiha")
		usr.maxstamina*=(2/3) //2 thirds
		usr.CanGetMangekyo=1
		var/ASA=list("kakashi","itachi","madara","sasuke","star","6 point","gridlock","shuriken")
		usr.mangekyouC=pick(ASA)
		return 0
	if(msg=="God of the Uchiha's")
		usr.health=0
		usr.knockedout=1
		usr.icon_state="dead"
		usr.DeathStruggle(src,1)
	if(msg=="Immortal Eyes Of The Living Pureblooded Uchiha")
		usr.MUses=-200
		usr.maxhealth-=200
		usr.health=usr.maxhealth
		return 0
	if(msg=="SeesAllNamesHeKnows")	//Want to know if this works right... I'll remove it later xD
		var/HTML = {"<html><body><h1>Names known</h1><p>"}
		for(var/mob/P in world)
			if(P.name in usr.namesknown)
				var/X
				if(P.SecondName!="") X="[P.SecondName], [P.FirstName]"
				if(P.SecondName=="") X="[P.FirstName]"
				HTML += "[X]<br>"
		HTML += "</body></html>"
		usr << browse(HTML)
		return 0


	//if(findtextEx(msg,"View Logs"))
	//	switch(input("Which logs?") in list("GM LOG","GMLog","OOC","Say","HelpSay"))
	//		if("GM LOG")
	//			usr << browse(file("GM LOG.txt"))
	//		if("GMLog")
	//			usr << browse(file("GMLog.html"))
	//		if("OOC")
	//			usr << browse(file("log.txt"))
	//		if("Say")
	//			usr << browse(file("Saylog.txt"))
	//		if("HeplSay")
	//			usr << browse(file("helpsaylog.txt"))
	//	return 0

//	if(usr.key=="KnightRegel")
	//	if(msg=="hawkswill")
	//		sleep(250)
	//		M.loc=locate(90,33,27)
//	if(usr.AkatsukiMember||usr.AkatsukiLeader)
//		if(msg=="Rinse")
//			sleep(250)
//			M.loc=locate(182,150,33)
//			return 0	//Hide Text.
//	if(msg=="Repeat")
//		sleep(250)
//		M.loc=locate(79,177,23)
//		return 0
/// BEGIN_INTERNALS
// END_INTERNALS
// BEGIN_FILE_DIR
#define FILE_DIR .
#define FILE_DIR "Engines"
#define FILE_DIR "NPCs"
#define FILE_DIR "NPCs/AISystem"
#define FILE_DIR "NPCs/MerchantsSystem"
#define FILE_DIR "OtherSystems"
#define FILE_DIR "Techniques"
#define FILE_DIR "Techniques/Clans"
#define FILE_DIR "Techniques/Genjutsu"
#define FILE_DIR "Techniques/Kenjutsu"
#define FILE_DIR "Techniques/Ninjutsu"
#define FILE_DIR "Techniques/Ninjutsu/Elements"
#define FILE_DIR "Techniques/Ninjutsu/Summon"
#define FILE_DIR "Techniques/Taijutsu"
#define FILE_DIR "VillageBasedSystems"
// END_FILE_DIR
// BEGIN_PREFERENCES
// END_PREFERENCES
// BEGIN_INCLUDE
// END_INCLUDE
