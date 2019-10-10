mob/var/tmp/ItemWeight=0
mob/var/tmp/SavedLayer=4
mob/var/AgeCounter=0
mob/var/tmp/ChoosingTrait=0
mob/var/FaceChange=0
mob/var/ImplantWait=0
mob/var/FirstArenaWin=0
mob/var/OneTimeFirstTraitChange=0
mob/var/TwentyFifthArenaWinMark=0
mob/var/FiftythArenaWinMark=0
mob/var/HundrethArenaWinMark=0
mob/var/TwoHundredFiftythArenaWinMark=0
mob/var/NPCHunter=0
mob/var/itemowned=0
mob/var/itemowned2=0
mob/var/tmp/VersatileCount=0
mob/var/tmp/StealthCount=0
mob/var/tmp/FuuinOn=""
var/TextCheck1="Youarenot"
mob/proc/FirstTraitChoose()
	set background=1
	if(src.ChoosingTrait==0&&src.Trait=="")
		src.ChoosingTrait=1
		switch(input("Voc� esta com 13 anos de idade e seu corpo come�a a atingir a adolesc�ncia, qual as caracter�sticas que voc� v� a si mesmo como?") in list("Esfor�ado","R�pido","Resistente","Poderoso","Intelectual"))
			if("Esfor�ado")
				src.Trait="Hard-Worker"
				src.AutoSave()
			if("Intelectual")
				src.Trait="Genius"
				src.StartingPoints+=5
				src.ElementalPoints+=8
				src.AutoSave()
			if("Poderoso")
				src.Trait="Powerful"
				src.AutoSave()
			if("R�pido")
				src.Trait="Speedy"
				src.AutoSave()
			if("Resistente")
				src.Trait="Tough"
				src.StaminaRegen+=rand(10,20)
				src.HealthRegen+=rand(10,20)
				src.AutoSave()
mob/proc/SecondTraitChooseSuper()
	set background=1
	if(src.Age>=17&&src.Trait2=="")
		switch(input("Voc� bateu a idade de 17 anos e seu corpo atingiu a maturidade plena. Voc� desenvolveu:") in list("Uma mente pac�fica","Um corpo que n�o se cansa de Energia F�sica","Uma compreens�o interior de Chakra","Um corpo t�o forte, ele n�o pode ser parado","Uma Vontade Inabal�vel","Resist�ncia SobreHumana","Regenera��o SobreHumana","Velocidade SobreHumana"))
			if("Uma mente pac�fica")
				src.Trait2="Sound Mind"
				src.AutoSave()
			if("Um corpo que n�o se cansa de Energia F�sica")
				src.Trait2="Hyperactivity"
				src.StaminaRegen+=rand(35,50)
				src.AutoSave()
			if("Uma compreens�o interior de Chakra")
				src.Trait2="Pure Body"
				if(src.SecondName!="Karsumu")
					src.DeclineAge+=20
				src.AutoSave()
			if("Um corpo t�o forte, ele n�o pode ser parado")
				src.Trait2="Adamant"
				src.MEndurance+=15
				src.AutoSave()
			if("Uma Vontade Inabal�vel")
				src.Trait2="Iron Will"
				src.AutoSave()
			if("Resist�ncia SobreHumana")
				src.Trait2="Super Human Endurance"
				src.MEndurance+=250;
				src.Endurance=src.MEndurance
				src.AutoSave()
			if("Regenera��o SobreHumana")
				src.Trait2="Super Human Regeneration"
				src.HealthRegen+=rand(15,20)
				src.StaminaRegen+=rand(20,35)
				src.AutoSave()
			if("Velocidade SobreHumana")
				src.Trait2="Super Human Speed"
				src.AutoSave()
mob/proc/FirstTraitChange()
	set background=1
	return
	if(src.Age>=13&&src.Trait!=""&&src.OneTimeFirstTraitChange==0)
		src.OneTimeFirstTraitChange=1
		switch(input("(Esta � uma oportunidade UMA VEZ SE VOC� J� escolheu o seu caminho ninja) Voc� bateu a idade de 13 e seu corpo come�a a atingir a adolesc�ncia, qual as caracter�sticas que voc� v� a si mesmo como?") in list("Esfor�ado","R�pido","Resistente","Poderoso","Intelectual"))
			if("Esfor�ado")
				src.Trait="Hard-Worker"
				src.AutoSave()
			if("Intelectual")
				if(src.Trait!="Genius")
					src.StartingPoints+=5
					src.ElementalPoints+=8
				if(src.Trait=="Hard-Worker"&&src.Age>=25)
					src.maxstamina-=rand(2500,3000)
					src.Mchakra-=rand(3000,4000)
				src.Trait="Genius"
				src.AutoSave()
			if("Poderoso")
				if(src.Trait=="Hard-Worker"&&src.Age>=25)
					src.maxstamina-=rand(2500,3000)
					src.Mchakra-=rand(3000,4000)
				src.Trait="Powerful"
				src.AutoSave()
			if("R�pido")
				if(src.Trait=="Hard-Worker"&&src.Age>=25)
					src.maxstamina-=rand(2500,3000)
					src.Mchakra-=rand(3000,4000)
				src.Trait="Speedy"
				src.AutoSave()
			if("Resistente")
				if(src.Trait=="Hard-Worker"&&src.Age>=25)
					src.maxstamina-=rand(2500,3000)
					src.Mchakra-=rand(3000,4000)
				if(src.Trait!="Tough")
					src.StaminaRegen+=rand(10,20)
					src.HealthRegen+=rand(10,20)
				src.Trait="Tough"
				src.AutoSave()
mob/proc/FirstTraitFix()
	set background=1
	if(src.Age>=13&&src.ChoosingTrait==0&&src.Trait=="")
		src.ChoosingTrait=1
		src.OneTimeFirstTraitChange=1
		switch(input("Voc� bateu a idade de 13 e seu corpo come�a a atingir a adolesc�ncia, qual as caracter�sticas que voc� v� a si mesmo como?") in list("Esfor�ado","R�pido","Resistente","Poderoso","Intelectual"))
			if("Esfor�ado")
				src.Trait="Hard-Worker"
				src.AutoSave()
			if("Intelectual")
				src.Trait="Genius"
				src.StartingPoints+=5
				src.ElementalPoints+=8
				src.AutoSave()
			if("Poderoso")
				src.Trait="Powerful"
				src.AutoSave()
			if("R�pido")
				src.Trait="Speedy"
				src.AutoSave()
			if("Resistente")
				src.Trait="Tough"
				src.StaminaRegen+=rand(10,20)
				src.HealthRegen+=rand(10,20)
				src.AutoSave()
mob/proc/TraitFix()
	set background=1
	if(src.Age>=17&&src.Trait2=="")
		switch(input("Voc� bateu a idade de 17 anos e seu corpo atingiu a maturidade plena. Voc� desenvolveu:") in list("Uma mente pac�fica","Um corpo que n�o se cansa de Energia F�sica","Uma compreens�o interior de Chakra","Um corpo t�o forte, ele n�o pode ser parado","Uma Vontade Inabal�vel"))
			if("Uma mente pac�fica")
				src.Trait2="Sound Mind"
				src.AutoSave()
			if("Um corpo que n�o se cansa de Energia F�sica")
				src.Trait2="Hyperactivity"
				src.StaminaRegen+=rand(35,50)
				src.AutoSave()
			if("Uma compreens�o interior de Chakra")
				src.Trait2="Pure Body"
				if(src.SecondName!="Karsumu")
					src.DeclineAge+=20
				src.AutoSave()
			if("Um corpo t�o forte, ele n�o pode ser parado")
				src.Trait2="Adamant"
				src.MEndurance+=15
				src.AutoSave()
			if("Uma Vontade Inabal�vel")
				src.Trait2="Iron Will"
				src.AutoSave()
mob/proc/BanCheck()
	set background=1
	if(src.client&&src)
		if(Bans.Find(src.key)||src.client.IsComputerBanned()||IPBans.Find(src.client.address))
			del(src)
		sleep(6000)
		src.BanCheck()
mob/proc/CHECK()//Cleaned out Check Proc
	if(!src.client||!src.key)//If they're not a player they don't need this.
		return
	if(src.key in Dev)
		src.Dev=1
	if(src.Age>=17&&src.Trait2=="")
		src.TraitFix()
//	if(src.Age>=13&&src.Trait!=""&&src.OneTimeFirstTraitChange==0)
//		src.FirstTraitChange()
	if(src.Age>=13&&src.Trait=="")
		src.FirstTraitFix()
	if(usr.CantAlert&&!(usr in InAssassinEvent))
		usr.CantAlert=0
	var/calcLag = abs(world.cpu - 100)
	if(calcLag<=10)
		src<<"O servidor passa a ser em um desempenho muito baixo no momento. Sugere-se que voc� n�o salvar ou fazer logoff neste momento."
	if(src.Rasenganon==0&&src.DRasenganCounter>0)
		src.DRasenganCounter=0
	if(src.Guarding||src.WeaponMaster>6&&src.LeftHandSheath||src.WeaponMaster>6&&src.RightHandSheath)
		if(src.WeaponInLeftHand!=""&&src.WeaponInLeftHand!="Spider"&&src.WeaponInLeftHand!="Bird"||src.WeaponInRightHand!=""&&src.WeaponInRightHand!="Spider"&&src.WeaponInRightHand!="Bird"||src.KagDance=="Yanagi"||src.KagDance=="Tsubaki")
			src.Deflection=1
	if(src.Overthought!=1&&src.GenjutsuKnowledge>550&&src.Age>35)
		src.Overthought=1
	if(src.CurrentMission=="Encontre o c�o desaparecido")
		src.verbs+= new /mob/Mission/verb/Capture
	src.invisibility=1
	src.see_invisible=1
	src.desc=""

	/*
		mob/var/challengeWins = 0
		mob/var/challengeLosses = 0
	*///Huge Section designed just for rewards that come with the challenge system!
/*
	if(src.FirstArenaWin==0&&src.challengeWins>0)
		src<<"Congratulations on your first arena win! You have been given 3 Elemental Points!"
		src.FirstArenaWin=1
//		src.NinjaCash+=15
		src.ElementalPoints+=3
		src.AutoSave()
//		src.SaveK()
	if(src.TwentyFifthArenaWinMark==0&&src.challengeWins>=25)
		src<<"You're getting better in combat! You have been given 5 Elemental Points!"
		src.TwentyFifthArenaWinMark=1
	//	src.NinjaCash+=10
		src.ElementalPoints+=5
		src.AutoSave()
	//	src.SaveK()
	if(src.FiftythArenaWinMark==0&&src.challengeWins>=50)
		src<<"You're becoming a really strong Fighter! You have been given 1 Starter Point, and 5 Elemental Points!"
		src.FiftythArenaWinMark=1
	//	src.NinjaCash+=75
		src.StartingPoints+=1
		src.ElementalPoints+=5
		src.AutoSave()
	//	src.SaveK()
	if(src.HundrethArenaWinMark==0&&src.challengeWins>=100)
		src<<"You've become a legend....You have been given 1 Starter Point, and 5 Elemental Points..."
		src.HundrethArenaWinMark=1
	//	src.NinjaCash+=90
		src.StartingPoints+=1
		src.ElementalPoints+=5
		src.AutoSave()
	//	src.SaveK()
	if(src.TwoHundredFiftythArenaWinMark==0&&src.challengeWins>=250)
		src<<"You're a God...."
		src.Mchakra+=250
		src.maxstamina+=250
		src.TwoHundredFiftythArenaWinMark=1
		src.AutoSave()
	//	src.SaveK()
*/

	if(LeafVillagePool>=20000000) LeafVillagePool=20000000
	if(SoundVillagePool>=20000000) SoundVillagePool=20000000
	if(RockVillagePool>=20000000) RockVillagePool=20000000
	if(RainVillagePool>=20000000) RainVillagePool=20000000
	if(global.AutoFreeForAllCount == 2)
		FFAAutoRun()
	if(src.FrozenBind!="")
		if(src.FrozenBind!="Death")
			src.FrozenBind=""
	if(src.Focus>750) //Adding this for now until I fix the Cursed Seal Bug
		src.Focus=750
	if(src.Kenjutsu>125&&src.Clan=="Yotsuki")
		src.Kenjutsu=125
	src.underlays -= 'Icons/Jutsus/Kujaku.dmi';src.underlays -= 'Icons/Jutsus/Kujaku.dmi'
//Fixing Henge Glitch Below
	if(src.SavedLayer!=null)
		if(src.SavedLayer!=4)
			src.SavedLayer=4
		src.layer=src.SavedLayer
	if(src.Oicon)
		src.icon=src.Oicon
	src.overlays-='Icons/Jutsus/BEyes.dmi'
	if(src.InHenge)
		src.overlays=null
		src.icon=src.Oicon
		src.overlays+=src.hair
		src.overlays+=usr.Overlays
		src.firing=0
		src.name=src.savedname
		src.InHenge=0
	if(src.SavedHengeVillage&&src.Village!=src.SavedHengeVillage)
		src.Village=src.SavedHengeVillage
//////////////////////////////////
	src.HasHiddenScroll=0//Makes sure they never have the Hidden Ninja Scroll Ever
	for(var/obj/Hidden_Ninja_Scroll/H in src.contents)
		del(H)
//Makes sure nothing under here glitches.
	if(src.maxhealth>=1500)
		src.maxhealth=1500;src.health=src.maxhealth
	if(src.NinSkill>40)
		src.NinSkill=40
	if(src.GenSkill>40)
		src.GenSkill=40
	if(src.TaiSkill>40)
		src.TaiSkill=40
	spawn()//So it doesn't delay the loading process.
//		if(locate(var/obj/SkillCards/KujakuMyouhou/A in src.LearnedJutsus))
		for(var/obj/SkillCards/KujakuMyouhou/A in src.LearnedJutsus)
			src.maxhealth=1250
			if(src.SecondName=="Suikazan")
				src.maxhealth=750
			src.ChakraColorR=255;src.ChakraColorG=26;src.ChakraColorB=198
	if(src.TaijutsuStyle=="")
		src.TaijutsuStyle="Basic"
	if(src.Clan=="Hyuuga"&&src.TaijutsuStyle!="Jyuken")
		src.TaijutsuStyle="Jyuken"
	if(src.Buffet>=10)
		src.AdvancedWielding=1
//////////////////////////////////
//Skillcard Delay fix.
	spawn()
		var/list/QQ = src.LearnedJutsus
		for(var/obj/SkillCards/S in QQ)
			S.Delay=0
			S.overlays-='Icons/Jutsus/Skillcards2.dmi';S.overlays-='Icons/Jutsus/Skillcards2.dmi'
			S.overlays-='Icons/Jutsus/Skillcards2.dmi';S.overlays-='Icons/Jutsus/Skillcards2.dmi'
	spawn()
		src.DeleteMultipleCopySkillCards()//Multiple Skillcard thing.
/////////////////////////////////////////
//Hospital Time Waiter Fixer
	if(src.FrozenBind=="Dead")
		src.GotoVillageHospital()

//Let me auto learn my sh-- under here.
	src.LearnJutsuZ()
//Legendary Sword Skills
	if(src.KirinCheck1==1&&src.KirinCheck2==1)
		src.LearnedJutsus+=new/obj/SkillCards/KirinWeak
	if(locate(/obj/WEAPONS/DarkBlade) in src.contents)
		src.LearnedJutsus+=new/obj/SkillCards/BlackShot
		src.LearnedJutsus+=new/obj/SkillCards/BlackGouryuuka
	if(locate(/obj/WEAPONS/OriginalKubikiriHoucho) in src.contents)
		if(!(locate(/obj/SkillCards/BloodLust) in src.LearnedJutsus))
			src.LearnedJutsus+=new/obj/SkillCards/BloodLust
	if(locate(/obj/WEAPONS/RoseBladeSword) in src.contents)
		if(!(locate(/obj/SkillCards/RosePetal) in src.LearnedJutsus))
			src.LearnedJutsus+=new/obj/SkillCards/RosePetal
	if(locate(/obj/WEAPONS/Shibuki) in src.contents)
		src.LearnedJutsus+=new/obj/SkillCards/ShibukiDash
//	if(locate(/obj/WEAPONS/LightBlade) in src.contents)
//		src.LearnedJutsus+=new/obj/SkillCards/LightShot
//		src.LearnedJutsus+=new/obj/SkillCards/LightGouryuuka
	if(locate(/obj/WEAPONS/NagaBladeSword) in src.contents)
		src.LearnedJutsus+=new/obj/SkillCards/VoidOpen1
		src.LearnedJutsus+=new/obj/SkillCards/VoidOpen2
		src.LearnedJutsus+=new/obj/SkillCards/VoidOpen3
	if(locate(/obj/WEAPONS/InvisibleKaito) in src.contents)
		src.LearnedJutsus+=new/obj/SkillCards/KaitoReach
		src.LearnedJutsus+=new/obj/SkillCards/KaitoInvisibleCuts
	if(locate(/obj/WEAPONS/Evanesence) in src.contents)
		src.LearnedJutsus+=new/obj/SkillCards/EvanesenceBlastJutsu
//Xiveres Skills
//	if(locate(/obj/Clothes/XiveresMask) in src.contents)
//		src.LearnedJutsus+=new/obj/SkillCards/XiveresOpen1
//	if(locate(/obj/Clothes/XiveresLeaderMask) in src.contents)
//		src.LearnedJutsus+=new/obj/SkillCards/XiveresOpen1
//		src.LearnedJutsus+=new/obj/SkillCards/XiveresOpen2
//		//src.LearnedJutsus+=new/obj/SkillCards/XiveresOpen3
//		src.LearnedJutsus+=new/obj/SkillCards/XiveresSoulR
//		src.LearnedJutsus+=new/obj/SkillCards/XiveresHealing
//Akatsuki And Xiveres
	if(src.SevenSkiesMember||src.SevenSkiesLeader)
		src.LearnedJutsus+=new/obj/SkillCards/SkiesTeleport
	if(src.IndigoMember||src.IndigoLeader)
		src.LearnedJutsus+=new/obj/SkillCards/IndigoTeleport
	if(src.XiveresMember==1)
		src.LearnedJutsus+=new/obj/SkillCards/XiveresSoulAbsorb
		src.LearnedJutsus+=new/obj/SkillCards/XiveresSoulCytoplasm
		src.LearnedJutsus+=new/obj/SkillCards/XiveresSoulEmpowerment
		src.LearnedJutsus+=new/obj/SkillCards/XiveresSoulAssault
		if(src.SoulKnowledge>=50&&src.SoulKnowledge<=100)
			src.LearnedJutsus+=new/obj/SkillCards/XiveresHealing
//	if(src.AkatsukiLeader==1)
//		src.verbs+=new/mob/Warp/verb/BaseTeleport()
	//	src.verbs+=new/mob/Warp/verb/Warp()
	//	src.verbs+=new/mob/Warp/verb/Warp2()
	//	src.verbs+=new/mob/Warp/verb/Warp3()
	//	src.verbs+=new/mob/Warp/verb/Warp4()
//	if(src.AkatsukiMember)
//		src.verbs+=new/mob/Warp/verb/BaseTeleport()

//Medals
	spawn()
		src.MedalCheck()
//Ban Check Starter
	spawn()
		src.BanCheck()
	if(PermDeath)
		src<<"Modo de morte Permanente foi ativado por causa de uma poss�vel RP ou mesmo apenas uma pequena updat! Se voc� morrer durante a isso, voc� tem a chance de renascer!"
	if(Halfexpday)
		src<<"Metade EXP foi ativado. Qualquer coisa que de EXP em Jutsu � reduzido pela metade."
	if(DBLexpday)
		src<<"Duplo EXP foi ativado. Qualquer coisa que d� Exp em Jutsu � dobrada. e Jutsu Delay quase triplica."
	if(!(src.name in src.namesknown))
		src.namesknown+=src.name
//////////////////////////////////////
//////////////////////////////////

//Verbs
//////////////////////////////////
	if(src.rank=="Hokage"||src.rank=="Amekoutei"||src.rank=="Otokami"||src.rank=="Tsuchikage")
		src.verbs+=typesof(/mob/Kage/verb)
		src.verbs+=typesof(/mob/ANBU/verb)
		src.verbs+=/mob/VC/verb/ImpeachKage
	if(src.Anbu)
		if(src.TaijutsuKnowledge+src.NinjutsuKnowledge+src.GenjutsuKnowledge>=500)
			src.verbs += typesof(/mob/ANBU/verb)
		else
			for(var/mob/X in world)
				if(X.Village==src.Village)
					X << "<font color = #BB0EDA>Village Information:</font> [src] n�o preenche os requisitos para ser um ANBU e perdeu seu posto."
			src.Anbu=0
			for(var/obj/Clothes/C in src.contents)
				if(C.icon=='Icons/New Base/Clothing/Official Clothing/Ganbu.dmi'||C.icon=='Icons/New Base/Clothing/Official Clothing/Ranbu.dmi'||C.icon=='Icons/New Base/Clothing/Official Clothing/Banbu.dmi')
					del(C)

//Leaf Village
	if(src.rank=="Hokage")
		if(Hokage!=src.key)
			src.rank="Jounin"
			src<<"Voc� foi rebaixado de Hokage porque o jogo n�o reconhece voc� como Hokage."
	if(src.rank=="Leaf Village Official")
		if(LeafVillageOfficial!=src.key)
			src.rank="Genin"
			src<<"Voc� perdeu o posto de Conselheiro Oficial porque o jogo n�o reconhec�-lo como a Conselheiro Oficial."
	if(src.rank=="Leaf Village Official")
		src.verbs+=typesof(/mob/VillageOfficial/verb)
	if(src.rank=="Hokage")
		src.verbs+=/mob/Kage/verb/VillageLeaderSay
		src.verbs+=typesof(/mob/Hokage/verb)
		src.verbs+=typesof(/mob/KonohaMilitaryPoliceForceMember/verb)
		spawn()
			var/Accept=0
			for(var/obj/Clothes/HokageSuit/A in src.contents)
				Accept=1
			if(!Accept)
				var/obj/Clothes/HokageSuit/B=new();B.loc=src
	if(src.KonohaMilitaryPoliceForceMember)
		src.verbs += typesof(/mob/KonohaMilitaryPoliceForceMember/verb)
//Rain Village
	if(src.rank=="Amekoutei")
		if(Amekoutei!=src.key)
			src.rank="Jounin"
			src<<"Voc� foi rebaixado de Amekoutei porque o jogo n�o reconhece voc� como Amekoutei."
	if(src.rank=="Rain Village Official")
		src.verbs+=typesof(/mob/VillageOfficial/verb)
		if(RainVillageOfficial!=src.key)
			src.rank="Genin"
			src<<"Voc� perdeu o posto de Conselheiro Oficial porque o jogo n�o reconhec�-lo como a Conselheiro Oficial."
	if(src.rank=="Amekoutei")
		src.verbs+=/mob/Kage/verb/VillageLeaderSay
		src.verbs+=typesof(/mob/Amekoutei/verb)
		src.verbs+=typesof(/mob/HunterNin/verb)
		spawn()
			var/Accept=0
			for(var/obj/Clothes/AmekouteiSuit/A in src.contents)
				Accept=1
			if(!Accept)
				var/obj/Clothes/AmekouteiSuit/B=new();B.loc=src
	if(src.HunterNinMember)
		src.verbs+=typesof(/mob/HunterNin/verb)
//Sound Village
	if(src.rank=="Otokami")
		if(Otokami!=src.key)
			src.rank="Jounin"
			src<<"Voc� foi rebaixado de Otokami porque o jogo n�o reconhece voc� como Otokami."
	if(src.rank=="Sound Village Official")
		src.verbs+=typesof(/mob/VillageOfficial/verb)
		if(SoundVillageOfficial!=src.key)
			src.rank="Genin"
			src<<"Voc� perdeu o posto de Conselheiro Oficial porque o jogo n�o reconhec�-lo como a Conselheiro Oficial."
	if(src.rank=="Otokami")
		src.verbs+=/mob/Kage/verb/VillageLeaderSay
		src.verbs+=typesof(/mob/SoundOrganization/verb)
		src.verbs+=typesof(/mob/Otokami/verb)
		spawn()
			var/Accept=0
			for(var/obj/Clothes/OtokamiSuit/A in src.contents)
				Accept=1
			if(!Accept)
				var/obj/Clothes/OtokamiSuit/B=new();B.loc=src
	if(src.SoundOrganization)
		src.verbs += typesof(/mob/SoundOrganization/verb)
		if(src.SoundOrganizationRank>=5)
			src.verbs+=/mob/Otokami/verb/ChangeSoundOrganizationRank
//Rock Village
	if(src.rank=="Tsuchikage")
		if(Tsuchikage!=src.key)
			src.rank="Jounin"
			src<<"Voc� foi rebaixado de Tsuchikage porque o jogo n�o reconhece voc� como Tsuchikage."
	if(src.rank=="Rock Village Official")
		src.verbs+=typesof(/mob/VillageOfficial/verb)
		if(RockVillageOfficial!=src.key)
			src.rank="Genin"
			src<<"Voc� perdeu o posto de Conselheiro Oficial porque o jogo n�o reconhec�-lo como a Conselheiro Oficial."
	if(src.rank=="Tsuchikage")
		src.verbs+=/mob/Kage/verb/VillageLeaderSay
		src.IronGateLeader=1
		src.IronGateMember=1
		spawn()
			var/Accept=0
			for(var/obj/Clothes/TsuchikageSuit/A in src.contents)
				Accept=1
			if(!Accept)
				var/obj/Clothes/TsuchikageSuit/B=new();B.loc=src
	if(src.IronGateLeader)
		src.verbs+=typesof(/mob/IronGate/verb)
	if(src.IronGateMember)
		src.verbs+=typesof(/mob/IronGateMember/verb)
	if(src.EvandiusMember)
		src.verbs+=typesof(/mob/DaitoMember/verb)
	if(src.key=="DollarDollarBillYall")
		if(!(locate(/obj/SkillCards/FoxerbolicTimeChamber) in src.LearnedJutsus))
			src.LearnedJutsus+=new/obj/SkillCards/FoxerbolicTimeChamber
	if(src.EvandiusLeader||src.key=="Lui12"||usr.key=="Ruusaku")
		src.verbs+=typesof(/mob/DaitoLeader/verb)
//Village Council stuff.



	if(src.VillageCouncil==2)
		src.verbs+=/mob/Kage/verb/VillageWarStart2
		src.verbs+=/mob/Kage/verb/GivePermission
		src.verbs+=/mob/Kage/verb/GiveVillagePermit
		src.verbs+=/mob/Kage/verb/VillageLeaderSay
		src.verbs+=/mob/Kage/verb/VillageCouncilwho
		src.verbs+=/mob/Kage/verb/VillageLeaderAnnouncement
		src.verbs+=/mob/VC/verb/ImpeachKage
		src.verbs+=typesof(/mob/ANBU/verb)
		if(src.Village=="Sound")
			src.verbs+=typesof(/mob/SoundOrganization/verb)
	if(src.VillageCouncil==3)
		src.verbs+=/mob/Kage/verb/Boot
		src.verbs+=/mob/Kage/verb/GivePermission
		src.verbs+=/mob/Kage/verb/GiveVillagePermit
		src.verbs+=/mob/Kage/verb/VillageLeaderSay
		src.verbs+=/mob/Kage/verb/VillageCouncilwho
		src.verbs+=/mob/Kage/verb/VillageLeaderAnnouncement
		src.verbs+=/mob/Kage/verb/VillageMute
		src.verbs+=/mob/Kage/verb/VillageUnMute
		src.verbs+=/mob/Kage/verb/Nominate_New_Ninja
		src.verbs+=/mob/VC/verb/ImpeachKage
	if(src.Clan=="Inuzuka")
		src.verbs+= new /mob/inuzuka/verb/Tame()
		var/check1=0
		for(var/obj/Clothes/InuzukaMarks/C in src.contents)
			check1=1
		if(check1==0)
			var/obj/Clothes/InuzukaMarks/D=new()
			D.loc=src;src<<"Foi dado a voc� um s�mbolo Marca��o Inuzuka como um orgulho de seu cl�."
	if(src.hasdog)
		src.verbs+=typesof(/mob/dogstuff/verb)
	if(src.Clan=="Uchiha"&&src.rank!="Student"&&!src.gottenuchihacrest)
		var/obj/Clothes/Uchiha_Crest/C = new()
		C.loc=src
		src.gottenuchihacrest=1
		src<<"Foi dado a voc� um S�mbolo Uchiha para colocar em sua roupa e mostrar seu orgulho do cl�."
	if(src.Clan=="Uchiha")
		if(src.MUses>250)
			var/obj/Mshar/MM=new()
			MM.screen_loc = "1,1 to 19,19"
			src.client.screen+=MM

			if(src.MUses>250&&usr.MUses<350)
				MM.icon_state="weak"
			if(src.MUses>=350&&usr.MUses<500)
				MM.icon_state="strong"
			if(src.MUses>=500)
				MM.icon_state="blinder"
	if(src.Clan=="Ketsueki")
		var/found=0
		for(var/obj/SkillCards/Feast/A in src.LearnedJutsus)
			found=1
		if(!found)
			src.LearnedJutsus+= new /obj/SkillCards/Feast()   //Fest Skill Card?
	if(src.FuuinControlled&&src.FuuinOn=="")
		var/foundcontrolled=0
		src.FuuinOn="FuuinControlled"
		spawn(300)
			if(foundcontrolled==0)
				foundcontrolled=1
				src<<"Voc� sente sua Taxa de chakra voltar ao normal."
				src.FuuinControlled=0
				src.FuuinOn=""
	if(src.InHellSent&&src.FuuinOn=="")
		var/foundhellsent=0
		src.FuuinOn="HellSent"
		spawn(450)
			if(foundhellsent==0)
				foundhellsent=1
				src<<"A sensa��o estranha deixa seu corpo."
				src.InHellSent=0
//	if(src.FiveElementSealed)
//		spawn(500)
//			src<<"You feel like you can use elemental manipulation once more."
//			src.FiveElementSealed=0
	if(locate(/obj/SkillCards/Puppet_Master_Jutsu) in src.LearnedJutsus)
		if(!locate(/obj/SkillCards/Unsummon_Puppet_One) in src.LearnedJutsus)
			var/A = /obj/SkillCards/Unsummon_Puppet_One
			var/obj/O = new A;src.LearnedJutsus+=O
		if(!locate(/obj/SkillCards/Unsummon_Puppet_Two) in src.LearnedJutsus)
			var/A = /obj/SkillCards/Unsummon_Puppet_Two
			var/obj/O = new A;src.LearnedJutsus+=O
	if(src.Clan!="Fuuma")	src.WeaponMaster=0
	//Passive Restrictions
	if(src.WaterPressure>10)
		src.ElementalPoints+=(src.WaterPressure-10)
		src.WaterPressure=10
		src<<"A press�o da �gua (Suiton Elemental Passive) era muito alto e foi atr�s. Voc� foi reembolsado seus pontos elementares."
	if(src.WindVelocity>0)
		src.ElementalPoints+=(src.WindVelocity)
		src.WindVelocity=0
		src<<"Porque o Fuuton passiva: A velocidade do vento foi removido tiver sido reembolsado de seus Pontos de Elementais!"
	if(src.WaterPressure>5)
		var/PointReturnCalc=src.WaterPressure
		var/PointReturn
		src.WaterPressure=5
		PointReturn=PointReturnCalc-src.WaterPressure
		src.ElementalPoints+=PointReturn
		src<<"Porque o Suiton passiva: Cap press�o de �gua foi reduzido para cinco de ter sido reembolsado de seus Pontos Elementais!"
	if(src.Clan=="Hoshigaki")
	//Hoshigaki Create Samehade verb 1.5
	//	src.verbs+= new /mob/Hoshigaki/verb/CreateSameHade()
		src.verbs+= new /mob/Hoshigaki/verb/CreateSameHadeNew()
	var/countzzz=0
	for(var/obj/A in src.contents)
		if(A.ammount>1)
			countzzz+=A.PlacementWeight*A.ammount
		else
			countzzz+=A.PlacementWeight
	src.ItemWeight=countzzz
	if(src.key=="Kyogrejas")
		src.SevenSkiesLeader=1
		src.SevenSkiesMember=1
		src.ARank="Skyle"
	if(src.key=="KnightRegel")

		src.NosinasisMemoriaLeader=1
		src.NosinasisMemoriaMember=1
		src.ARank="Leader"
	//	src.LearnedJutsus+= new/obj/SkillCards/Juubi
	//	src.LearnedJutsus+= new/obj/SkillCards/CursedSealActivation
	//	src.Bijuu="Juubi"
//	if(src.key=="DollarDollarBillYall")
//		src.LearnedJutsus+=new/obj/SkillCards/Metronome
	if(src.SevenSkiesLeader&&src.SevenSkiesMember)
		src.verbs+=typesof(/mob/SevenSkies/verb)
		src.verbs+=typesof(/mob/SevenSkiesMember/verb)
	if(src.SevenSkiesMember)
		src.verbs+=typesof(/mob/SevenSkiesMember/verb)
	if(src.NosinasisMemoriaLeader||src.ARank=="Co-Leader"&&src.NosinasisMemoriaMember)
		src.verbs+=typesof(/mob/NosinasisMemoria/verb)
		src.verbs+=typesof(/mob/NosinasisMemoriaMember/verb)
	if(src.NosinasisMemoriaMember)
		src.verbs+=typesof(/mob/NosinasisMemoriaMember/verb)
	if(src.IndigoLeader&&src.IndigoMember)
		src.verbs+=typesof(/mob/Indigo/verb)
		src.verbs+=typesof(/mob/IndigoMember/verb)
	if(src.IndigoMember)
		src.verbs+=typesof(/mob/IndigoMember/verb)
	if(src.key==""||src.key=="Lui12"||usr.key=="Ruusaku")
		src.verbs+=new /mob/special/verb/Shunpo()
	if(src.key==""||src.key=="The Lui12"||usr.key=="Ruusaku")
		src.verbs+=new /mob/special/verb/AdminAnnounceRemoval()
//	if(src.key=="Jwells100"||src.key=="Bishamon121")
//		src.IndigoLeader=1
//		src.IndigoMember=1
//		src.IndigoRank="Master"
//	if(src.key=="KnightRegel"||src.key=="Kyouni")
//		src.Swift=6
//		src.DoubleStrike=10
//		src.RunningSpeed=5
//		src.Acceleration=10
//		src.reflexNew=3
//		src.Impenetrable=10
//		src.TaijutsuMastery=10
//		src.NinjutsuKnowledge=1000
//		src.GenjutsuKnowledge=500
//		src.TaijutsuKnowledge=1500
//		src.Buff=1000
//		src.Focus=550
//		src.HandsealSpeed=30
//		src.NinjutsuMastery=10
//		src.HandsealsMastery=3
//		src.ChakraC=100
//		src.GenjutsuKai=1
//		src.Overthought=1
//		src.Mentality=5
//		src.MentalDamage=10
//		src.Overthought=1
//		src.ChakraC=100
	if(src.key=="")//||src.key=="Mirandawashere"||src.key=="TheUndyingOne")
		src.Swift=6
//		if(src.key=="Mirandawashere")
//			src.Trait="Powerful"
//			src.Trait2="Sound Mind"
//			src.Swift=8
//			src.FireChakra=20;src.KatonKnowledge=2500
//			src.WaterChakra=20;src.SuitonKnowledge=2500
//			src.LightningChakra=20;src.RaitonKnowledge=2500
//			src.EarthChakra=20;src.DotonKnowledge=2500
//			src.WindChakra=20;src.FuutonKnowledge=2500
		//	src.LearnedJutsus+=new/obj/SkillCards/CursedSealActivation()
		src.WaterWalkingMastery=10
		src.Rush=20
		src.GenjutsuSight=10
		src.DoubleStrike=10
		src.RunningSpeed=5
		src.Acceleration=10
		src.reflexNew=3
		src.Impenetrable=10
		src.TaijutsuMastery=10
		src.Kenjutsu=100;
		src.Bojutsu=100
		src.SpeedDice=5;
		src.Deflection=5
		src.NinjutsuKnowledge=1000
		src.GenjutsuKnowledge=500
		src.TaijutsuKnowledge=1000
		if(src.key=="Lui12"||usr.key=="Ruusaku")
			src.NinjutsuKnowledge=2000
			src.GenjutsuKnowledge=1000
			src.TaijutsuKnowledge=2000
		src.KunaiMastery=10
		src.ThrowingStrength=5
		src.Buff=500
		src.Focus=500
		src.HandsealSpeed=30
		src.NinjutsuMastery=10
		src.HandsealsMastery=3
		src.Percision=10
		src.ChakraC=100
		src.GenjutsuKai=1
		src.Mentality=5
		src.MentalDamage=10
		src.Overthought=1
		if(src.key=="Kyogrejas")
			src.verbs+=new /mob/Staff/verb/Toggle_OOC()
			src.verbs+=new /mob/owner/verb/Nominate_Village_Leader()
			src.verbs+=new /mob/owner/verb/Chuuninexam()
	if(src.client.computer_id==1190865046||src.client.address=="66.169.133.113") src.maxhealth=1
	if(src.key==""&&src.rank=="")
		src.rank="Genin"
	if(src.key=="")
		src.verbs+=new /mob/Admin/verb/Create_CD_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_EXP_Scroll()
	if(src.key=="")
		if(!(locate(/obj/SkillCards/SageModeLion) in src.LearnedJutsus))
			src.LearnedJutsus+= new /obj/SkillCards/SageModeLion
		if(!(locate(/obj/SkillCards/MajesticEyes) in src.LearnedJutsus))
			src.LearnedJutsus+= new /obj/SkillCards/MajesticEyes
		if(!(locate(/obj/SkillCards/CrimsonTeleportation) in src.LearnedJutsus))
			src.LearnedJutsus+= new /obj/SkillCards/CrimsonTeleportation
//		if(!(locate(/obj/SkillCards/DotonSpearImpalation) in src.LearnedJutsus))
//			src.LearnedJutsus+= new/obj/SkillCards/DotonSpearImpalation
		if(src.MajesticMastery>1&&src.MajesticMastery<500)
			src.MajesticMastery=500
		if(src.Mchakra<5000)
			src.Mchakra=rand(9000,11000)
		if(src.maxstamina<5000)
			src.maxstamina=rand(6000,6600)
		src.Kenjutsu=100
		src.Anbu=1
		src.verbs+=new /mob/Admin/verb/Create_Knowledge_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_CD_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_EXP_Scroll()
		src.verbs+=new /mob/Daito/verb/Max_Passives()
		src.verbs+=new /mob/Daito/verb/Give_StartingPoints()
		src.verbs+=new /mob/Daito/verb/Uses_Giver()
		src.verbs+=typesof(/mob/Daito/verb)
		if(!(locate(/obj/Clothes/SJouninsuit2) in src.contents))
			var/obj/Clothes/SJouninsuit2/S = new()
			S.Move(src)
			S.ArmorAddOn=40
			S.EquipmentType="Armor";S.Durability=1000;S.DurabilityCap=1000
		if(!(locate(/obj/Clothes/ANBUHandGuards) in src.contents))
			var/obj/Clothes/ANBUHandGuards/S = new()
			S.Move(src)
			S.ArmorAddOn=15
			S.EquipmentType="Armor"
			S.Durability=1000
			S.DurabilityCap=1000
		if(!(locate(/obj/WEAPONS/KubirikiHouchou) in src.contents))
			var/obj/WEAPONS/KubirikiHouchou/S = new()
			S.Move(src)
			S.PercentDamage=50
			S.WeaponDelay=10
	if(src.key in Subscribers)
		src.Subscriber=1
		src.verbs+=new/mob/Subscriber/verb/ToggleMp3()
	if(src.key=="")
		src.Trait3="Perseverance"
		src.verbs+=new /mob/Admin/verb/Create_CD_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_Knowledge_Scroll()
		src.ChakraC=250
		src.calories=round(100*src.ChakraC)
		if(!(locate(/obj/WEAPONS/BoomStaff) in src.contents))
			src.contents+=new/obj/WEAPONS/BoomStaff
	if(src.key=="")
		src.verbs+=new/mob/Admin/verb/Specific_Teleport()
		src.verbs+=new/mob/Admin/verb/MaxPassives()
	//	src.verbs+=new/mob/Kage/verb/Chuuninexam()
		src.verbs+=new/mob/owner/verb/Grant_Rewards()
		src.verbs+=new/mob/owner/verb/Grant_Scrolls()
		src.verbs+=new/mob/owner/verb/Grant_CL_VM()
	//	src.verbs+=new/mob/owner/verb/Grant_Mode()
		src.verbs+=new/mob/owner/verb/Grant_Trait_Change()
		src.verbs+=new/mob/owner/verb/Grant_Boost()
		src.verbs+=new/mob/owner/verb/Master_Jutsus()
	if(src.key=="")
		for(var/obj/Clothes/SleevelessShirt/P in src.contents)
			P.ArmorAddOn=30
			P.EquipmentType="Armor"
			P.Durability=1000
			P.DurabilityCap=1000
		if(!(locate(/obj/Clothes/SleevelessShirt) in src.contents))
			var/obj/Clothes/SleevelessShirt/S = new()
			S.Move(src)
			S.ArmorAddOn=30;S.EquipmentType="Armor";S.Durability=1000;S.DurabilityCap=1000
	if(src.key=="")
		src.LearnedJutsus+= new/obj/SkillCards/RinneganActivate
		src.Bijuu="Kyuubi"
		src.Trait="Powerful"
		if(src.Mchakra<50000) src.Mchakra=50000
		if(src.maxstamina<50000) src.maxstamina=50000
		src.verbs+=new /mob/Admin/verb/Create_Knowledge_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_CD_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_EXP_Scroll()

		src.Doujutsu="Byakugan"
		if(!(locate(/obj/SkillCards/RikudouSageMode) in src.LearnedJutsus))
			src.LearnedJutsus+= new /obj/SkillCards/RikudouSageMode
			src.LearnedJutsus+= new /obj/SkillCards/RikudouSageAura
			var/obj/Clothes/LeftEyepatch/L=new()
			L.Move(src)
		if(!(locate(/obj/Clothes/SleevelessShirt) in src.contents))
			var/obj/Clothes/SleevelessShirt/S = new()
			S.Move(src)
			S.ArmorAddOn=40;S.EquipmentType="Armor";S.Durability=1000;S.DurabilityCap=1000
	if(src.key==""||src.key==""||src.key=="")
		src.verbs+=new /mob/Admin/verb/Create_Knowledge_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_CD_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_EXP_Scroll()
	if(src.key=="")
		src.Bijuu=""
	if(src.key=="Lui12"||usr.key=="Ruusaku")
		src.LearnedJutsus+=new/obj/SkillCards/IndigoEyes
		src.LearnedJutsus+=new/obj/SkillCards/GhostParasite
		src.LearnedJutsus+=new/obj/SkillCards/Meimei
		src.LearnedJutsus+=new/obj/SkillCards/UnderSui
		if(!(locate(/obj/WEAPONS/BoomStaff) in src.contents))
			src.contents+=new/obj/WEAPONS/BoomStaff
		if(!(locate(/obj/WEAPONS/DarkBlade) in src.contents))
			src.contents+=new/obj/WEAPONS/DarkBlade
	//	src.contents+=new/obj/WEAPONS/BoomStaff
	if(src.key=="")
	//	src.verbs+=new/mob/Warp/verb/BaseTeleport()
		src.LearnedJutsus+= new/obj/SkillCards/FushiTensei
		src.LearnedJutsus+= new/obj/SkillCards/MindControlJutsu
		src.verbs+=new /mob/Admin/verb/Create_Knowledge_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_CD_Scroll()
		src.verbs+=new /mob/Admin/verb/Create_EXP_Scroll()
		src.Bijuu="Yonbi"
		src.Trait2="Super Human Taijutsu"
		src.TaiSkill=40;src.MEndurance=150;src.Endurance=150
		if(!(locate(/obj/MaskT) in src.contents))
			var/obj/MaskT/S = new()
			S.Move(src)
	if(src.key=="")
		src.OrgXLeader=1
		src<<"Hail Lord Xeidus! Hail to Leader of Organization X!"
	if(src.SemideusLeader)
		src.verbs+=typesof(/mob/Semideus/verb)
		if(!(locate(/obj/SkillCards/SemideusChakraArm) in src.LearnedJutsus))
			src.LearnedJutsus+= new/obj/SkillCards/SemideusChakraArm
		if(!(locate(/obj/SkillCards/SemideusChakraArmReaching) in src.LearnedJutsus))
			src.LearnedJutsus+= new/obj/SkillCards/SemideusChakraArmReaching
	if(src.SemideusMember)
		src.verbs+=typesof(/mob/SemideusMember/verb)
		if(!(locate(/obj/SkillCards/SemideusChakraArm) in src.LearnedJutsus))
			src.LearnedJutsus+= new/obj/SkillCards/SemideusChakraArm
		if(!(locate(/obj/SkillCards/SemideusChakraArmReaching) in src.LearnedJutsus))
			src.LearnedJutsus+= new/obj/SkillCards/SemideusChakraArmReaching
	if(src.key=="Kowala")
		if(!(locate(/obj/WEAPONS/SageMonkeyBoStaff) in src.contents))
			src.contents+=new/obj/WEAPONS/SageMonkeyBoStaff
		if(!(locate(/obj/SkillCards/ZeroVoidBarrier) in src.LearnedJutsus))
			src.LearnedJutsus+=new/obj/SkillCards/ZeroVoidBarrier
		if(!(locate(/obj/WEAPONS/NagaBladeSword) in src.contents))
			src.contents+=new/obj/WEAPONS/NagaBladeSword
		if(!(locate(/obj/SkillCards/SageModeApe) in src.LearnedJutsus))
			src.LearnedJutsus+=new/obj/SkillCards/SageModeApe
		if(!(locate(/obj/SkillCards/ForbiddenShousen) in src.LearnedJutsus))
			src.LearnedJutsus+=new/obj/SkillCards/ForbiddenShousen
		src.verbs+=typesof(/mob/YellowFlashMaster/verb)
	if(src.key=="Lui12"||usr.key=="Ruusaku")
		if(!(locate(/obj/SkillCards/FlyingThunderGod) in src.LearnedJutsus))
			src.LearnedJutsus+= new/obj/SkillCards/FlyingThunderGod
		src.YellowFlash=1
	if(src.YellowFlash)
		src.verbs+=typesof(/mob/YellowFlash/verb)
//	if(src.AkatsukiLeader)
//		src.verbs+=typesof(/mob/Akat/verb)
//		src.verbs+=typesof(/mob/AkatMember/verb)
//	if(src.AkatsukiMember)
//		src.verbs+=typesof(/mob/AkatMember/verb)
	if(src.OrgXMember)
		src.verbs+=typesof(/mob/Organization_X/verb)
	if(src.OrgXLeader)
		src.verbs+=new /mob/owner/verb/MakeOrgXMember()
	if(src.XiveresLeader)
		src.verbs+=typesof(/mob/Xiv/verb)

		src.verbs+=typesof(/mob/XivMember/verb)
	if(src.XiveresMember)
		src.verbs+=typesof(/mob/XivMember/verb)
	if(src.Organization!="")
		spawn()
			src.GiveOrganizationVerbs()
	if(src.Yonkami&&src.key!="")
		contestants+=src
		world<<"<font size=2 color=blue>[src], um dos quatro Yonkis, foi registrado e � vis�vel com o Verifique Mundial competidores verbo."
	src.Give_Guild_Verbs()
	src.ScreenX=src.OriginalX;src.ScreenY=src.OriginalY
	src.client.view="[src.ScreenX]x[src.ScreenY]"
	if(src.Magma&&src.BlueFire)
		src.BlueFire=0;src.Magma=0

	if(src.Doujutsu=="Sharingan")
		if(src.MUses>250)
			var/obj/Mshar/MM=new()
			MM.screen_loc = "1,1 to 9,19"
			src.client.screen+=MM
			if(src.MUses>250&&usr.MUses<350)
				MM.icon_state="weak"
			if(src.MUses>=350&&usr.MUses<500)
				MM.icon_state="strong"
			if(src.MUses>=500)
				MM.icon_state="blind"
			if(src.MUses>=600)
				MM.icon_state="blinder"
	if(src.Doujutsu=="Sharingan Right")
		if(src.MUses>250)
			var/obj/Mshar/MM=new()
			MM.screen_loc = "11,1 to 19,19"
			src.client.screen+=MM
			if(src.MUses>250&&usr.MUses<350)
				MM.icon_state="weak"
			if(src.MUses>=350&&usr.MUses<500)
				MM.icon_state="strong"
			if(src.MUses>=500)
				MM.icon_state="blind"
			if(src.MUses>=600)
				MM.icon_state="blinder"
	if(src.HasLeftEye==0)
		if(src.MUses>=0)
			var/obj/Mshar/MM=new()
			MM.screen_loc = "1,1 to 9,19"
			src.client.screen+=MM
			MM.icon_state="strong"
			MM.icon_state="blinder"
	if(src.HasRightEye==0)
		if(src.MUses>=0)
			var/obj/Mshar/MM=new()
			MM.screen_loc = "11,1 to 19,19"
			src.client.screen+=MM
			MM.icon_state="strong"
			MM.icon_state="blinder"
	//if(src.CheckedPassiveCaps=0)	src.CheckPassives()
	//if(src.GottenChuunin!=1)
	//	if(src.rank!="Genin") src.GottenChuunin=1;src.ElementalPoints+=10
	//if(src.GottenJounin!=1)
	//	if(src.rank!="Genin"&&src.rank!="Chuunin"&&src.rank!="Special Jounin") src.GottenJounin=1;src.ElementalPoints+=15
	src.RegenerationProc()
	return
/*
	src.Load_Guild()
	if(src.Guild!="None")
		if(src.GuildRank=="Leader")
			src.verbs+=typesof(/mob/Guild/Leader/verb)
			src.verbs+=typesof(/mob/Guild/General/verb)
			src.verbs+=typesof(/mob/Guild/Major/verb)
			src.verbs+=typesof(/mob/Guild/Captain/verb)
			src.verbs+=typesof(/mob/Guild/Lieutenant/verb)
			src.verbs+=typesof(/mob/Guild/Corporal/verb)
		if(src.GuildRank=="Co-Leader")
			src.verbs+=typesof(/mob/Guild/General/verb)
			src.verbs+=typesof(/mob/Guild/Major/verb)
			src.verbs+=typesof(/mob/Guild/Captain/verb)
			src.verbs+=typesof(/mob/Guild/Lieutenant/verb)
			src.verbs+=typesof(/mob/Guild/Corporal/verb)
		src.verbs+=typesof(/mob/Guild/Private/verb)
		if(src.Guild.Members.Find(src) == FALSE)
			src.Guild.Members+=src
		for(var/mob/A in src.Guild.Members)
			src << "[A]"
*/

mob/var/CheckedPassiveCaps=0	//so it's not done to someone multiple times..
mob/proc/CheckPassives()
	return
	if(src.RunningSpeed>5)
		var/diff = src.RunningSpeed-5
		src.RunningSpeed = 5
		src.StartingPoints += diff
		src << "Sua velocidade de corrida foi definida para o seu m�ximo, e seu SP foi devolvido a voc�."
	if(src.Acceleration>10)
		var/diff = src.Acceleration-10
		src.Acceleration = 10
		src.StartingPoints += diff
		src << "Sua acelera��o foi definido para a sua max, e seu SP foi devolvido a voc�."
	if(src.Swift>6)
		var/diff = src.Swift-6
		src.Swift = 6
		src.StartingPoints += diff
		src << "Seu Swift foi definido para que � max, e seu SP foi devolvido a voc�."

	if(src.DoubleStrike>10)
		var/diff = src.DoubleStrike-10
		src.DoubleStrike = 10
		src.StartingPoints += diff
		src << "Seu DoubleStrike foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.Rush>10)
		var/diff = src.Rush-10
		src.Rush = 10
		src.StartingPoints += diff
		src << "Sua corrida foi definida para ele � max, e seu SP foi devolvido a voc�."
	if(src.Impenetrable>10)
		var/diff = src.Impenetrable-10
		src.Impenetrable = 10
		src.StartingPoints += diff
		src << "Seu Impenetr�vel foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.TaijutsuMastery>10)
		var/diff = src.TaijutsuMastery-10
		src.TaijutsuMastery = 10
		src.StartingPoints += diff
		src << "Seu Taijutsu Mastery foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.GenjutsuSight>10)
		var/diff = src.GenjutsuSight-10
		src.GenjutsuSight = 10
		src.StartingPoints += diff
		src << "Seu Genjutsu Vis�o foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.NinjutsuMastery>10)
		var/diff = src.NinjutsuMastery-10
		src.NinjutsuMastery = 10
		src.StartingPoints += diff
		src << "Seu Ninjutsu Mastery foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.OneHandedSeals>5)
		var/diff = src.OneHandedSeals-5
		src.OneHandedSeals = 5
		src.StartingPoints += diff
		src << "O ONE Seals Handed foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.HandsealSpeed>30&&src.Trait!="Speedy")
		var/diff = src.HandsealSpeed-30
		src.HandsealSpeed = 30
		src.StartingPoints += diff
		src << "Sua velocidade handseal foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.HandsealSpeed>45&&src.Trait=="Speedy")
		var/diff = src.HandsealSpeed-60
		src.HandsealSpeed = 60
		src.StartingPoints += diff
		src << "Sua velocidade handseal foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.Impenetrable>10)
		var/diff = src.Impenetrable-10
		src.Impenetrable = 10
		src.StartingPoints += diff
		src << "Seu Impenetr�vel foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.Kenjutsu>100&&src.Clan!="Yotsuki")
		var/diff = src.Kenjutsu-100
		src.Kenjutsu = 10
		src.StartingPoints += round(diff/10)
		src << "Seu Kenjutsu foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.Kenjutsu>150&&src.Clan=="Yotsuki")
		var/diff = src.Kenjutsu-150
		src.Kenjutsu = 15
		src.StartingPoints += round(diff/15)
		src<< "Seu kenjutsu foi definido para que do cl� m�ximo de 150, e seu SP foi devolvido a voc�."
	if(src.Bojutsu>100)
		var/diff = src.Bojutsu-100
		src.Bojutsu = 100
		src.StartingPoints += round(diff/10)
		src << "Seu Bojutsu foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.Percision>10)
		var/diff = src.Percision-10
		src.Percision = 10
		src.StartingPoints += diff
		src << "Seu Percision foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.ThrowingStrength>5)
		var/diff = src.ThrowingStrength-5
		src.ThrowingStrength = 5
		src.StartingPoints += diff
		src << "Seu ThrowingStrength foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.DeflectionZ>5)
		var/diff = src.DeflectionZ-5
		src.DeflectionZ = 5
		src.StartingPoints += diff
		src << "Seu deflex�o foi definido para a sua max, e seu SP foi devolvido a voc�."
	if(src.SlashStrength>10)
		var/diff = src.SlashStrength-10
		src.SlashStrength = 10
		src.StartingPoints += diff
		src << "Sua for�a de Slash foi definido para que � max, e seu SP foi devolvido a voc�."
	if(src.VitalSlash>5)
		var/diff = src.VitalSlash-5
		src.VitalSlash = 5
		src.StartingPoints += diff
		src << "Seu Vital de Slash foi definido como � max, e seu SP foi devolvido a voc�."
	src.CheckedPassiveCaps=1
mob/proc/LearnJutsuZ()
	if(!src.client)
		return
	var/list/A=src.LearnedJutsus
	for(var/obj/SkillCards/S in A)
		if(S.NonKeepable)
			del(S)
mob/proc/StartStunDelay()
	src.Stun=0
	src.StunDelay=1
	spawn(10)
		src.StunDelay=0
mob/proc/RegenerationProc()
	set background = 1
//	if(src.Clan=="Hoshigaki")
//		if(!src.WaterCheck())
//			src.HoshiAutoRun=0
	if(!src in OnlinePlayers)
		return
	if(src.SusanooIn)
		src.Running=0
//	src<<"Current command text: [client.command_text]"
	src.AgeEXP++
	if(src.AgeScrollBoost)
		src.AgeEXP+=2
	if(src.FoxTimeChamber)
		src.AgeEXP++
//	var/calcLag = abs(world.cpu - 100)
//	if(calcLag<=10&&!src.ServerMessage)
//		if(prob(10))
//			src<<"The server happens to be at a very low performance right now. It is suggested that you do not save or log off at this time."
	if(src.SentReport>0)
		src.SentReport--
		if(src.SentReport<0)
			src.SentReport=0
	if(src.FiveElementSealed||src.FuuinControlled||src.InHellSent)
		if(src.FiveElementSealed)
			spawn(500)
				src<<"Voc� se sente como voc� pode usar manipula��o elemental mais uma vez."
				src.FiveElementSealed=0
		if(src.FuuinControlled)
			spawn(300)
				src<<"Voc� sente sua Taxa de chakra voltar ao normal."
				src.FuuinControlled=0
		if(src.InHellSent)
			spawn(450)
				src<<"A sensa��o estranha deixa seu corpo."
				src.InHellSent=0
	src.CheckWeather()
//	if(src.WeatherSeen=="Blizzard")
//		src.stamina-=(src.maxstamina*0.03)
//	if(src.Bijuu=="Shukaku")
//		if(prob(15))
//			src.AgeEXP--
//			if(src.AgeEXP<=0) src.AgeEXP=0
	/*
	if(src.UnderWater!="")
		if(src.UnderWater=="Light")
			if(!(locate(/obj/Drown/UnderWater) in src.client.screen))
				src.client.screen+=new/obj/Drown/UnderWater
			src.stamina-=(src.maxstamina*0.01)
			*/
	if(src.PoisonType!="")//Hopefully might help reduce lag somewhat 12/24/2012
		if(src.PoisonType=="Vit"&&src.PoisonTime>0&&src.knockedout!=1&&src.ImmuneToDeath!=1)
			var/Damage=rand(1,3)
			src.health-=Damage
			src<<output("<font color=#990099>O veneno corre em suas veias...([Damage] dano)</font>","Attack")
		else if(src.PoisonType=="LargerVit"&&src.PoisonTime>0&&src.knockedout!=1&&src.ImmuneToDeath!=1)
			var/Damage2=rand(1.5,4)
			src.health-=Damage2
			src<<output("<font color=#990099>O veneno corre em suas veias causando grande dor...([Damage2] dano)</font>","Attack")
		if(src.PoisonTime<1&&src.PoisonType!="")
			src<<"<font color=#990099>O veneno foi dilu�do em sua corrente sangu�nea...</font>"
			src.PoisonType=""
			src.client.screen-= /obj/ReleaseThingyAilment/Poison
		else if(src.PoisonTime>=1)
			src.PoisonTime-=1
			if(src.Clan=="Fuuma")
				src.PoisonTime-=2

//	if(src.PoisonOn)
//		src.UsingPoison=1
//		spawn(300)
//			if(src.PoisonOn)
//				src<<"You didn't land the poison in time. It has worn off."
//				src.PoisonOn=0
//			spawn(1200)
//				src.UsingPoison=0
//				src<<"You can use another poison now."
	src.MaxChakraPool=(src.Mchakra*3)
	if(src.ChakraPool>src.MaxChakraPool)
		src.ChakraPool=src.MaxChakraPool
	if(src.Stun>0)
		if(src.Guarding||src.Trait2=="Adamant")
			src.Stun-=5
		src.Stun-=5
		if(src.Stun<0||src.Stun==0)
			src.StartStunDelay()
	//if(src.RestrictOwnMovement)
	//	spawn(10)
	//		src.RestrictOwnMovement=0
//	if(src.Yonkami)
//		if(prob(50))
//			src.bounty++
	if(src.name==null||src.name=="")
		src.name="Fix Me!"
	if(src.loc==null&&!src.beingdragged)
		src<<"Sua localiza��o foi 0,0,0. Assim voc� foi teletransportado para uma �rea existente."
		src.GotoVillageHospital()
	if(src.Yen>10000000&&!src.Yonkami)
		if(src.Village!="Missing")
			var/A=src.Yen-10000000
			src.Yen=10000000
			src<<"O super�vit Ryo foi para a sua aldeia. Voc� s� pode armazenar 10 milh�es Ryo de cada vez."
			if(src.Village=="Leaf")
				LeafVillagePool+=A
			if(src.Village=="Rock")
				RockVillagePool+=A
			if(src.Village=="Rain")
				RainVillagePool+=A
			if(src.Village=="Sound")
				SoundVillagePool+=A
	if(src.Guarding||src.WeaponMaster>6&&src.LeftHandSheath||src.WeaponMaster>6&&src.RightHandSheath)
		if(src.WeaponInLeftHand!=""&&src.WeaponInLeftHand!="Spider"&&src.WeaponInLeftHand!="Bird"||src.WeaponInRightHand!=""&&src.WeaponInRightHand!="Spider"&&src.WeaponInRightHand!="Bird"||src.KagDance=="Yanagi"||src.KagDance=="Tsubaki")
			src.Deflection=1
	if(src.CBleeding)
		src.health-=(src.maxhealth/100)
		if(prob(20))
			src.Bloody()

	if(src.DeclineAge==0)
		src.DeclineAge=rand(80,110)
	if(src.Age>=src.DeclineAge)
	//	if(src.AgeEXP==200||src.AgeEXP==201)
	//		src.AgeEXP=205
	//		src<<"You begin coughing up blood"
	//		src<<"Your time is almost up!"
	//		src.Bloody();src.Bloody();src.Bloody()
	//		src.maxstamina=0;src.stamina=src.maxstamina
	//		src.maxhealth=10;src.health=src.maxhealth
	//		src.Running=0;src.deathcount=100
	//	if(src.AgeEXP==400||AgeEXP==401||src.AgeEXP==300||src.AgeEXP==301)
	//		src.Bloody();src.Bloody();src.Bloody()
		if(src.AgeEXP>=450)
			src<<"Voc� entrar em colapso por exaust�o .. Seu corpo cai por completo!"
			src.CBleeding=1
			src.Death(src)
			src.Reincarnate()
	if(src.AgeEXP>=22000)
		src.Age++;src.AgeEXP=0
		//Trait 1.1
		src<<"Parab�ns, agora voc� tem [src.Age] anos de Idade!"
		if(src.Subscriber)
			src.SubscriberTime++
		if(src.AgeScrollBoost)
			src.AgeScrollBoost=0
			src.AutoSave()
		//	src.SaveK()
		if(src.Age==75)
			if(src.Subscriber)
				switch(input("Voc� bateu a idade de 75 e seu corpo atingiu um fraqueza em massa. Gostaria de renascimento e come�ar de novo.? Se voc� escolher N�o, voc� ser� solicitado novamente aos 80 anos.") in list("Sim","N�o"))
					if("Sim")
						src<<"Voc� optou por deixar este personagem morrer para o bem e come�ar uma nova vida.."
						src.Reincarnate()
					if("N�o")
						src<<"Voc� optou por n�o fazer renascer o seu personagem e come�ar uma nova vida."
		else if(src.Age==80)
			if(src.Subscriber)
				switch(input("Voc� bateu a idade de 80 anos e seu corpo tem vivido em um fraqueza de massa por cinco anos. Gostaria de renascimento e come�ar de novo?") in list("Sim","N�o"))
					if("Sim")
						src<<"Voc� optou por deixar este personagem morrer para o bem e come�ar uma nova vida.."
						src.Reincarnate()
					if("N�o")
						src<<"vocc� optou por n�o fazer renascer o seu personagem e come�ar uma nova vida."

		if(src.Age==12)
			if(src.key==""||src.key=="")
				src.FirstTraitChoose()
				return
			else if(src.OneTimeFirstTraitChange==0&&src.ChoosingTrait==0&&src.Trait=="")
				src.ChoosingTrait=1
				src.OneTimeFirstTraitChange=1
				switch(input("Voc� bateu a idade de 13 e seu corpo come�a a atingir a adolesc�ncia, qual as caracter�sticas que voc� v� a si mesmo como?") in list("Esfor�ado","R�pido","Resistente","Poderoso","Intelectual"))
					if("Esfor�ado")
						src.Trait="Hard-Worker"
						src.AutoSave()
					if("Intelectual")
						if(src.Trait!="Genius")
							src.StartingPoints+=5
							src.ElementalPoints+=8
						if(src.Trait=="Hard-Worker"&&src.Age>=25)
							src.maxstamina-=rand(2500,3000)
							src.Mchakra-=rand(3000,4000)
						src.Trait="Genius"
						src.AutoSave()
					if("Poderoso")
						if(src.Trait=="Hard-Worker"&&src.Age>=25)
							src.maxstamina-=rand(2500,3000)
							src.Mchakra-=rand(3000,4000)
						src.Trait="Powerful"
						src.AutoSave()
					if("R�pido")
						if(src.Trait=="Hard-Worker"&&src.Age>=25)
							src.maxstamina-=rand(2500,3000)
							src.Mchakra-=rand(3000,4000)
						src.Trait="Speedy"
						src.AutoSave()
					if("Resistente")
						if(src.Trait=="Hard-Worker"&&src.Age>=25)
							src.maxstamina-=rand(2500,3000)
							src.Mchakra-=rand(3000,4000)
						if(src.Trait!="Tough")
							src.StaminaRegen+=rand(10,20)
							src.HealthRegen+=rand(10,20)
						src.Trait="Tough"
						src.AutoSave()
				if(src.Trait3=="Perseverance")
					src.maxstamina=10000
					src.Mchakra=10000





		if(src.Age==17)
			if(src.key==""||src.key=="")
				src.SecondTraitChooseSuper()
				return
			if(src.ChoosingTrait==0&&src.Trait2=="")
				src.ChoosingTrait=1
				switch(input("Voc� bateu a idade de 17 anos e seu corpo atingiu a maturidade plena. Voc� desenvolveu:") in list("Uma mente pac�fica","Um corpo que n�o se cansa de Energia F�sica","Uma compreens�o interior de Chakra","Um corpo t�o forte, ele n�o pode ser parado","Uma Vontade Inabal�vel"))
					if("Uma mente pac�fica")
						src.Trait2="Sound Mind"
						src.AutoSave()
					if("Um corpo que n�o se cansa de Energia F�sica")
						src.Trait2="Hyperactivity"
						src.StaminaRegen+=rand(35,50)
						src.AutoSave()
					if("Uma compreens�o interior de Chakra")
						src.Trait2="Pure Body"
						if(src.SecondName!="Karsumu")
							src.DeclineAge+=20
						src.AutoSave()
					if("Um corpo t�o forte, ele n�o pode ser parado")
						src.Trait2="Adamant"
						src.MEndurance+=15
						src.AutoSave()
					if("Uma Vontade Inabal�vel")
						src.Trait2="Iron Will"
						src.AutoSave()
//			var/Secondaries=list("Adamant","Iron Will","Sound Mind","Hyperactivity","Pure Body")
//			if(src.Trait2==""||src.Trait2==null)
//				src.Trait2=pick(Secondaries)
//			src.AutoSave()
			//if(src.key=="SinOfHate"||src.key=="Mizumori")
			//	src.Trait2="Super Human Regeneration"
		//	if(src.key=="Uchiha_Legend666")
		//		src.Trait2="Super Human Regeneration"
//			if(src.Trait2=="Super Human Regeneration")
//				src.HealthRegen+=rand(50,80)
//				src.StaminaRegen+=rand(50,80)
//			if(src.Trait2=="Hyperactivity")
//				src.StaminaRegen+=rand(35,50)
//			if(src.Trait2=="Pure Body")
//				src.DeclineAge+=20
//			if(src.Trait2=="Adamant")
//				src.MEndurance+=10
		if(src.Trait=="Genius")
			if(src.Age==18||src.Age==23||src.Age==28||src.Age==33||src.Age==38||src.Age==43||src.Age==48||src.Age==53)
				src.StartingPoints+=2
		if(src.Trait=="Hard-Worker")
			src.Mchakra+=rand(65,90)
			src.maxstamina+=rand(65,90)
		if(src.Age==16)
			src.ElementalPoints+=5
		if(src.Age==18)
			if(src.key=="Lui12"||usr.key=="Ruusaku")
				src.ElementalPoints+=2
				src.StartingPoints+=2
			src.Mchakra+=1000
			src.maxstamina+=rand(1000,1200)
		if(src.Age==23)
			src.ElementalPoints+=10
		if(src.Age==26)
			if(src.key=="Lui12"||usr.key=="Ruusaku")
				src.ElementalPoints+=2
				src.StartingPoints+=2
			src.Mchakra+=2000
			src.maxstamina+=rand(1000,2500)
		if(src.Age==30)
			src.ElementalPoints+=5
		if(src.Age==35)
			if(src.key=="Lui12"||usr.key=="Ruusaku")
				src.ElementalPoints+=2
				src.StartingPoints+=2
			src.Mchakra+=500
			src.maxstamina+=rand(1000,1600)
		if(src.Age==40)
			src.ElementalPoints+=5
		if(src.Age==50)
			if(src.key=="Lui12"||usr.key=="Ruusaku")
				src.ElementalPoints+=2
				src.StartingPoints+=2
			src.Mchakra+=rand(1500,2000)
			src.maxstamina-=rand(1000,1500)
		if(src.Age==75)
			src.Mchakra+=rand(3500,5000)
			src.maxstamina=(src.maxstamina/2)
		if(src.Age>=src.DeclineAge)
			src<<"Voc� chegou a velhice e seu corpo come�a a desligar! Voc� n�o tem muito tempo de sobra!"
			src.maxhealth=300;src.health=src.maxhealth
			src.maxstamina=300;src.stamina=src.maxstamina
	var/ClassLevel=src.kills-src.deaths
	if(src.Village=="Missing")
		if(src.Age>=20&&ClassLevel>=150&&src.GottenChuunin==0)
			src.ElementalPoints+=10
			src.GottenChuunin=1
			src.AutoSave()
		//	src.SaveK()
		if(src.Age>=27&&ClassLevel>=300&&src.GottenChuunin&&!src.GottenJounin)
			src.ElementalPoints+=15
			src.GottenJounin=1
			src.AutoSave()
		//	src.SaveK()
		src.rank="Missing-Nin"
		src.mouse_over_pointer=null;src.VMorale=0
	if(src.Village!="Missing")
		if(src.Age>=60&&src.rank!="Village Elder"&&src.Village==src.BeginningVillage)
			if(src.rank=="Chuunin"||src.rank=="S.Jounin"||src.rank=="Jounin")
				if(src.LearnedJutsus.len>40&&src.VMorale>250)
					src.rank="Village Elder"
					src.ChakraArmor=25
		if(!src.GottenJounin&&src.rank=="Jounin")
			src.ElementalPoints+=15
			src.GottenJounin=1
			src.AutoSave()
		//	src.SaveK()
		if(src.VMorale<=-30)
			src<<"Sua atividade foi monitorada pelos ups mais altos da aldeia e eles decidiram que voc� n�o � uma grande contribui��o para a aldeia. Voc� foi expulso da aldeia."
			src.Village="Missing";src.VMorale=0;src.SoundOrganization=0;src.VillageCouncil=0;src.Anbu=0;src.KonohaMilitaryPoliceForceMember=0
		if(src.rank=="Missing-Nin")
			if(src.blevel=="E"||src.blevel=="D"||src.blevel=="C"||src.blevel=="B")
				src.rank="Genin"
			if(src.blevel=="A"||src.blevel=="S")
				src.rank="Chuunin"
		if(src.rank=="Chuunin")
			if(src.TaijutsuKnowledge>=600||src.NinjutsuKnowledge>=600||src.GenjutsuKnowledge>=300)
				if(src.blevel=="B"||src.blevel=="A"||src.blevel=="S")
					src.rank="S.Jounin"
					for(var/mob/M in world)
						if(M&&M.client&&M.Village==src.Village)
							M<<"<font color = #BB0EDA>Village Information:</font> [src] foi promovido para Especial Jounin!"

	if(src.Village!="Missing")
		ClassLevel+=(src.dmission*0.1)+(src.cmission*0.25)+(src.bmission*0.5)+(src.amission*1)+(src.smission*2)
	if(ClassLevel<=0)
		src.deaths=0
		ClassLevel=0
	if((ClassLevel)<=5)
		src.blevel="E"
	if((ClassLevel)>=6||src.rank=="Genin")
		src.blevel="D"
	if((ClassLevel)>=20||src.rank=="Chuunin")
		src.blevel="C"
	if((ClassLevel)>=75||src.rank=="Special Jounin")
		src.blevel="B"
		if(src.MEndurance<110) src.MEndurance=110
	if((ClassLevel)>=150||src.rank=="Jounin")
		src.blevel="A"
		if(src.MEndurance<125) src.MEndurance=125
	if((ClassLevel)>=575&&src.smission>1&&(src.TaijutsuKnowledge+src.NinjutsuKnowledge+src.GenjutsuKnowledge)>5000&&(src.maxstamina+src.Mchakra)>10000)
		src.blevel="S"
		if(src.MEndurance<150) src.MEndurance=150
	if(!src.GateIn==""&&src.knockedout)
		src.knockedout=0
//	if(src.Village=="Missing"||src.Village=="None")
//		src.rank="Missing-Nin"
//		src.mouse_over_pointer=null;src.VMorale=0
//	if(src.Village!="Missing"&&src.Village!="None"&&src.rank=="Missing-Nin")
//		if(src.blevel=="E"||src.blevel=="D"||src.blevel=="C"||src.blevel=="B")
//			src.rank="Genin"
//		if(src.blevel=="A"||src.blevel=="S")
//			src.rank="Chuunin"
	//src.mouse_over_pointer=null
	//for(var/obj/Clothes/Headband/HeadbandShiz in src.contents)
	//	if(HeadbandShiz.worn&&!src.InHenge)
	//		if(src.Village=="Terra")
	//			src.mouse_over_pointer='SymbolTerra.dmi'
	//		if(src.Village=="Leaf")
	//			src.mouse_over_pointer='SymbolLeaf.dmi'
	//		if(src.Village=="Rain")
	//			src.mouse_over_pointer='SymbolRain.dmi'
	//		if(src.Village=="Rock")
	//			src.mouse_over_pointer='SymbolRock.dmi'
	//		if(src.Village=="Sound")
	//			src.mouse_over_pointer='SymbolSound.dmi'
	if(!src.GateIn=="")
		var/quickie=round(rand(src.maxhealth*0.0002,src.maxhealth*0.001))
		if(src.GateIn=="Life")
			quickie=quickie*1.3
		src.health-=quickie
	if(src.health<src.maxhealth&&src.GateIn==""&&src.Pill=="")
		var/increase=(src.HealthRegen)-src.NegativeHealthRegen
		if(src.stamina>=src.maxstamina)
			if(!src.knockedout)
				if(prob(5))
					src.health+=round(increase)
	if(src.health<0)
		src.health=0
	else if(src.health>=src.maxhealth)
		if(src.deathcount>0)
			src.deathcount-=0.015
			if(src.deathcount<0)
				src.deathcount=0
			//src<<"Your WP healed. Current: [src.deathcount]!"
		if(prob(5)&&src.ChakraPool<src.MaxChakraPool)
			src.ChakraPool+=50
	if(src.stamina<src.maxstamina&&src.hunger<100&&src.thirst<100&&!src.knockedout&&src.GateIn==""&&src.Pill=="")
		var/increase=(src.StaminaRegen)-src.NegativeStaminaRegen
		if(src.calories==0)
			increase=increase*0.5
		if(!src.knockedout&&src.Stun<=0&&!src.Frozen&&src.FrozenBind=="")
			if(prob(35)&&src.deathcount<=2)
				src.stamina+=round(increase)
			else if(prob(50)&&src.Trait2=="Hyperactivity"&&src.deathcount<=4)
				src.stamina+=round(increase*1.2)
			else if(prob(70)&&src.Trait2=="Hyperactivity"&&src.deathcount<=6)
				src.stamina+=round(increase*1.4)
				src.stamina+=round(increase/3)
			//else if(src.Trait=="Tough")    Why?...
			//	src.stamina+=round(increase)
	else if(src.stamina>=src.maxstamina)
		src.stamina-=(src.maxstamina/200)
	if(src.health<src.maxhealth&&src.GateIn==""&&src.Pill=="")
		var/increase=(src.HealthRegen)-src.NegativeHealthRegen
		if(src.stamina>=src.maxstamina&&src.Trait2!="Super Human Regeneration")
			if(!src.knockedout)
				if(prob(5))
					src.health+=round(increase)
		if(src.Trait2=="Super Human Regeneration")
			if(prob(4+src.Age))
				src.health+=round(increase)
	/*if(src.Trait2=="Super Human Regeneration")
		if(!src.knockedout)
			if(src.deathcount>=0.5)
				src.deathcount-=rand(0.05,0.08)*/
	if(src.Trait2=="Pure Body")
	//	if(prob((src.health/src.maxhealth)*100)&&src.ChakraPool<src.MaxChakraPool)
	//		src.ChakraPool+=(rand(80,105)/(src.deathcount+1))
		if(prob((src.health/src.maxhealth)*100)&&src.ChakraPool<src.MaxChakraPool&&src.deathcount<=2)
			src.ChakraPool+=rand(50,90)
		else if(prob((src.health/src.maxhealth)*100)&&src.ChakraPool<src.MaxChakraPool&&src.deathcount>2&&src.deathcount<=4)
			src.ChakraPool+=rand(45,80)
		else if(prob((src.health/src.maxhealth)*100)&&src.ChakraPool<src.MaxChakraPool&&src.deathcount>4)
			src.ChakraPool+=rand(35,70)
	if(src.ChakraEnhance)
		src.chakra-=rand(3,8)
	if(src.ZankuuhaOn)
		src.chakra-=rand(8,10)
	//if(!src.knockedout&&src.chakra<=0)
	//	src.chakra+=1
	if(!src.knockedout&&src.health<=0)
	//	src.health+=1
		src.Death(src)
	if(src.stamina<1)
		var/AGA=src.stamina*-1
		src.health-=AGA
		src.stamina=0
	if(src.chakra<0)
		var/AGAC=src.chakra*-1
		src.stamina-=AGAC*rand(2,3)
		src.chakra=0
		src<<output("Voc� superestimar seu chakra!","Attack")
	if(src.hunger>=100)
		src.stamina-=src.maxstamina*0.01
	if(src.thirst>=100)
		src.stamina-=src.maxstamina*(src.thirst*0.0001)
		if(src.Clan=="Ketsueki")
			src.stamina-=src.maxstamina*(src.thirst*0.001)
//	src.EnduranceAddOn-=src.NenkinAddOn;src.EnduranceAddOn+=src.NenkinAddOn
	if(!src.Guarding)
		src.Endurance=src.MEndurance+src.EnduranceAddOn
		if(src.BoneMembrane)
			src.Endurance=100000
		if(src.DotonArmor!=0)
			if(src.DotonArmor==1)
				src.Endurance=300
			if(src.DotonArmor==2)
				src.Endurance=500
	if(src.Guarding)
		if(prob(5)&&usr.Impenetrable<10)
			usr.Impenetrable+=0.1
			if(usr.Impenetrable>10)
				usr.Impenetrable=10
		if(usr.Clan=="Satou"&&prob(15)&&usr.Shield<=10)
			usr.Shield+=0.1
			if(usr.Shield>=10)
				usr.Shield=10
			usr.Endurance=usr.MEndurance+(usr.Shield*20)

	if(src.halfb)
		for(var/obj/black2/B in src.client.screen)
			B.screen_loc = "1,1 to 9,19"

	//Gives rose sword its rose petal jutsu
//	var/castd=0;
//	if(locate(/obj/WEAPONS/RoseBladeSword) in src.contents)
//		castd=1
//	if(castd)
//		var/haveit=0
//		for(var/obj/SkillCards/RosePetal/C in src.LearnedJutsus)
//			haveit=1
//		if(!haveit)
//			var/obj/SkillCards/RosePetal/A=new()
//			A.Uses=100
//			usr.LearnedJutsus+=A
//	if(!castd)
//		for(var/obj/SkillCards/RosePetal/C in src.LearnedJutsus)
//			del(C)

	//var/casta=0;
//	if(locate(/obj/WEAPONS/OriginalKubikiriHoucho) in src.contents)
//		for(var/obj/WEAPONS/OriginalKubikiriHoucho/C in src.contents)
//			casta=1
//	if(casta)
//		var/haveit=0
//		for(var/obj/SkillCards/BloodLust/C in src.LearnedJutsus)
//			haveit=1
//		if(!haveit)
//			var/obj/SkillCards/BloodLust/A=new()
//			A.Uses=100
//			usr.LearnedJutsus+=A
//	if(!casta)
//		for(var/obj/SkillCards/BloodLust/C in src.LearnedJutsus)
//			del(C)




//	if(src.health<=src.maxhealth*0.1)
//		src<<sound('SFX/Heartbeat.wav',0,0,0,500)


	if(src.Clan=="Aburame")
		var/A=1;if(src.GenSkill>(src.NinSkill+src.TaiSkill)) A=src.GenSkill
		if(src.Konchuu<src.BugCapacity*1000)
			if(prob(50))
				var/Aburame=src.BugManipulation+rand(1,10)
				if(src.chakra<=0&&!src.knockedout)
					Aburame=Aburame*-1
				src.Konchuu+=Aburame
		if(src.Konchuu>(src.BugCapacity)*1000)
			src.Konchuu=src.BugCapacity*1000
		if(src.Konchuu<0)
			src.Konchuu=0
		var/Multiplier=1
		if(src.Trait2=="Prodigy")
			Multiplier=10
		if(prob(0.1*A)&&src.BugManipulation<20)
			src.BugManipulation+=(pick(0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1)*Multiplier)
			if(src.BugManipulation>20)
				src.BugManipulation=20
		if(prob(0.1*A)&&src.BugCapacity<15)
			src.BugCapacity+=(pick(0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1)*Multiplier)
			if(src.BugCapacity>15)
				src.BugCapacity=15
		if(prob(0.1*A)&&src.KekkaiHealth<10)
			src.KekkaiHealth+=(pick(0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1)*Multiplier)
			if(src.KekkaiHealth>10)
				src.KekkaiHealth=10
		if(prob(0.1*A)&&src.KekkaiCap<10)
			src.KekkaiCap+=(pick(0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1)*Multiplier)
			if(src.KekkaiCap>10)
				src.KekkaiCap=10
		if(src.BugMastery==0)
			src.BugMastery+=1
//	if(src.MUses>=50)
		//for(var/obj/Mshar/M in usr.client.screen)
		//	del(M)
	if(src.Clan=="Hoshigaki")	//slow it down a bit?uhhhh sure.
		if(prob(65))
			if(src.WaterCheck())
				src.Running=1
				src.HoshiAutoRun=1
				src.runningspeed=15
				if(src.tai<src.Mtai*1.2)
					src.tai+=0.08
				if(src.nin<src.Mnin*1.2)
					src.nin+=0.08
				if(src.gen<src.Mgen*1.2)
					src.gen+=0.08
				if(prob(40))
					if(src.health<src.maxhealth)
						src.health+=3
				else
					if(src.stamina<src.maxstamina)
					//	src.stamina+=(src.maxstamina*0.005)
						src.stamina+=(src.maxstamina*0.003)

			else if(src.GateIn=="")
				src.tai=src.Mtai
				src.HoshiAutoRun=0
				src.nin=src.Mnin
				src.gen=src.Mgen
			//	src.HoshiAutoRun=0
	if(src.Clan=="Uchiha")
		if(src.SharinganMastery<=0)
			var/random=rand(1,1000000)
			if(random==999999||src.Age==14||src.Age>=12&&src.knockedout&&random<=500000||src.health<=50&&random>=992000||src.health<=500&&random>=999990||src.Trait2=="Prodigy"&&src.target&&src.knockedout)
				src.SharinganMastery=1
				if(src.Trait2=="Prodigy")
					src.SharinganMastery=50
				var/obj/Z = new/obj/SkillCards/Sharingan()
				src<<"<B><font color = blue>Seu sharingan foi ativado!!";src.LearnedJutsus+=Z
				src.deathcount=0
				var/hasmedalSharinganGain=world.GetMedal("Sharingan!",src)
				if(!hasmedalSharinganGain)
					world.SetMedal("Sharingan!",src)
					src<<"<font size=3><font color=yellow>Voc� ganhou a medalha do Sharingan!!"
		if(prob(2))
			if(SharinganMastery>0)
				if(src.Trait=="Genius"||src.Trait2=="Prodigy")
					src.UchihaMastery+=pick(0.25,0.5);if(src.UchihaMastery>100) src.UchihaMastery=100
				else
					src.UchihaMastery+=pick(0.01,0.1);if(src.UchihaMastery>100) src.UchihaMastery=100
		if(!src.HasMangekyo&&!src.CanGetMangekyo)
			if(src.SharinganMastery>=1200&&src.UchihaMastery>=100&&src.NinjutsuKnowledge>=2500&&src.Age>=26&&src.Age<=31)
				if(prob(0.0001))
					src.HasMangekyo=1
					src.LearnedJutsus+=new/obj/SkillCards/Mangekyo
					src<<"Seus olhos pulsam"
					src.maxhealth-=300;
					var/XMX=rand(1,6)
					if(XMX==1)
						src.MMove1="AmateratsuP"
					if(XMX==2)
						src.MMove1="Amateratsu"
					if(XMX==3)
						src.MMove1="Tsukiyomi"
					if(XMX==4)
						src.MMove1="Susanoo"
					if(XMX==5)
						src.MMove1="Phase"
					if(XMX==6)
						src.MMove1="Kamui"
					if(XMX==7)
						src.MMove1="WAmaterasuP"
					if(XMX==8)
						src.MMove2="WAmaterasu"
					var/XMXX=rand(1,6)
					while(XMX==XMXX)
						XMXX=rand(1,6);
						sleep(2)
					if(XMXX==1)
						src.MMove2="AmateratsuP"
					if(XMXX==2)
						src.MMove2="Amateratsu"
					if(XMXX==3)
						src.MMove2="Tsukiyomi"
					if(XMXX==4)
						src.MMove2="Susanoo"
					if(XMXX==5)
						src.MMove2="Phase"
					if(XMXX==6)
						src.MMove2="Kamui"
					if(XMXX==7)
						src.MMove2="WAmaterasuP"
					if(XMXX==8)
						src.MMove2="WAmaterasu"
					var/XMXXX=rand(1,6)
					while(XMX==XMXXX||XMXX==XMXXX)
						XMXXX=rand(1,6)
						sleep(2)
					if(XMXXX==1)
						src.MMove3="AmateratsuP"
					if(XMXXX==2)
						src.MMove3="Amateratsu"
					if(XMXXX==3)
						src.MMove3="Tsukiyomi"
					if(XMXXX==4)
						src.MMove3="Susanoo"
					if(XMXXX==5)
						src.MMove3="Phase"
					if(XMXXX==6)
						src.MMove3="Kamui"
					if(XMXXX==7)
						src.MMove3="WAmaterasuP"
					if(XMXXX==8)
						src.MMove3="WAmaterasu"
	//if(src.HealGateTime>0)
	//	if(src.GateIn=="")
	//		src.HealGateTime--
	//		if(src.HealGateTime<=0)
	//			src.HealGateTime=0
	if(src.Clan=="Kaguya")
		if(prob(1))
			if(src.Trait=="Genius")
				src.BoneMastery+=pick(0.5,1)
			else
				src.BoneMastery+=pick(0.25,0.5)
		if(src.Underlayer==0)
			src.Underlayer=1
	if(src.Clan=="Kumojin")
		if(prob(1))
			if(src.Trait=="Genius")
				src.WebMastery+=pick(0.5,1)
			else
				src.WebMastery+=pick(0.25,0.5)
	if(src.Clan=="Inuzuka")
		if(src.Training>=20&&!src.Obediance)
			src.Obediance=1
		if(prob(1))
			src.PetsHealth+=1
		src.PetAgeEXP++
		if(src.PetAgeEXP>=12342)
			src.PetsAge++
			src<<"Seu animal de estima��o fez um ano! � agora ele tem [src.PetsAge] anos!";src<<"Ele est� cheio de alegria!"
			src.PetsHappyness=0;src.PetAgeEXP=0
			src.PetsStamina=(src.PetsAge+8)*100;src.PetsMStamina=(src.PetsAge+8)*100
	if(src.Clan=="Shiroi")
		if(src.SnowFall==0&&src.IceRush==0)
			var/ASD=rand(1,2)
			if(ASD==1)
				src.SnowFall+=1
			if(ASD==2)
				src.IceRush+=1
		else
			if(prob(1))
				src.IceRush+=0.1
			if(prob(1))
				src.SnowFall+=0.1
	if(src.Clan=="Fuuma")
		if(src.exp!=0)
			src.JutsuEXPCost+=rand(85,200)
		src.Versatile=1;
		src.Stealth=1;
	/*if(src.Clan=="Sabaku")
		var/turf/W = src.loc
		var/OmgSandTheresSand=0;
		for(var/obj/Jutsu/Sand/T in W)
			if(istype(T,/obj/Jutsu/Sand/SandTurf))
				OmgSandTheresSand=1
			else if(istype(T,/obj/Jutsu/Sand/SandField))
				OmgSandTheresSand=1
	//	for(var/obj/Jutsu/Sand/SandTurf/T in W)
	//		OmgSandTheresSand=1;
	//	for(var/obj/Jutsu/Sand/SandField/F in W)
	//		OmgSandTheresSand=1;
		if(OmgSandTheresSand==1)
			src.SandAmount+=25
			src.SandAmountPassiveCheck()
			if(src.SandAmount>src.MaxSandAmount)
				src.SandAmount=src.MaxSandAmount
		sleep(1)*/
//	if(src.Versatile==1&&src.Status!="")
//		src.VersatileCount++
//		if(src.VersatileCount>20)
//			src.VersatileCount=0
//			src.Status=""
	if(src.Clan=="Kyomou")
		if(src.AkametsukiMastery<=0)
			if(src.Clan=="Kyomou")
				var/obj/Z = new/obj/SkillCards/Akametsuki()
				src.LearnedJutsus+=Z;src.AkametsukiMastery=1
				src.UpdateInv()
	if(src.Clan=="Akimichi")
		if(src.z==1&&src.AkimichiSpirit<50)
			if(prob(5))
				src.AkimichiSpirit+=1
				if(src.AkimichiSpirit>50)
					src.AkimichiSpirit=50
		if(src.z==11&&src.AkimichiSpirit<50)
			if(prob(1))
				src.AkimichiSpirit+=1
				if(src.AkimichiSpirit>50)
					src.AkimichiSpirit=50
		if(src.AkimichiSpirit>=50&&src.Running==0)
			if(src.tai<src.Mtai*2.5)
				src.tai+=50
				if(src.tai>src.Mtai*2.5)
					src.tai=src.Mtai*2.5
		if(src.Running)
			src.tai=src.Mtai
		if(src.Pill=="Green")
			src.calories-=2
			src.health-=2
	//		src.tai+=2
			src.chakra+=2
		if(src.Pill=="Yellow")
			src.calories-=4
			src.health-=4
	//		src.tai+=4
			src.chakra+=4
		if(src.Pill=="Red")
			src.calories-=6
			src.health-=6
	//		src.tai+=6
			src.chakra+=6
	if(src.Clan=="Nara")
		if(src.ShadowManipulation==0)
			src.ShadowManipulation+=1
		if(prob(1))
			if(src.Trait=="Genius")
				src.ShadowMastery+=0.5
				if(src.ShadowMastery>100)
					src.ShadowMastery=100
			else
				src.ShadowMastery+=0.1
				if(src.ShadowMastery>100)
					src.ShadowMastery=100
	if(src.Clan=="Yotsuki")
		if(src.Teamwork==0)
			src.Teamwork=1
		var/count=0
		if(src.Allies.len>0)
			for(var/mob/M in src.Allies)
				if(src.Teamwork<10)
					if(prob(1))
						src.Teamwork+=0.1;if(src.Teamwork>10) src.Teamwork=10
				if(M.Clan=="Yotsuki"&&get_dist(src,M)<14)//was 11
					count++
			if(count>=1)
				src.tai+=5*(src.Teamwork*0.1)
				if(src.tai>src.Mtai*2)
					src.tai=src.Mtai*2
				src.nin+=5*(src.Teamwork*0.1)
				if(src.nin>src.Mnin*2)
					src.nin=src.Mnin*2
				src.gen+=5*(src.Teamwork*0.1)
				if(src.gen>src.Mgen*2)
					src.gen=src.Mgen*2
		if(count<1)
			src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
	if(src.Clan=="Ketsueki")
		src.hunger=0
		if(src.FeralRage<=1)
			src.FeralRage=1
		if(prob(0.1))
			src.ThirstHold+=0.1;if(src.ThirstHold>3) src.ThirstHold=3
		if(prob(1)||(Night&&prob(3)))
			src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
		if(src.FeralRage>0)
			var/count=0
			for(var/obj/A in oview(6,src))
				if(count>0)
					if(prob(0.1))
						src.FeralRage+=0.1;if(src.FeralRage>25) src.FeralRage=25
				if(A.icon=='Blood.dmi')
					count++;src.tai+=1*(src.FeralRage/5);src.nin+=1*(src.FeralRage/5);src.gen+=1*(src.FeralRage/5)
					if(src.tai>src.Mtai*2)
						src.tai=src.Mtai*2
						if(src.tai>150)
							src.tai=150
					if(src.nin>src.Mnin*2)
						src.nin=src.Mnin*2
						if(src.nin>150)
							src.nin=150
					if(src.gen>src.Mgen*2)
						src.gen=src.Mgen*2
						if(src.gen>150)
							src.gen=150
				if(count==0&&src.GateIn=="")
					src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
//	if(src.sandeye)
//		src.sight &= ~(SEE_SELF|BLIND)
	if(src.Clan=="Sabaku")
		if(src.sandeye)
			src.sight &= ~(SEE_SELF|BLIND)
		if(!src.SandMastery)
			src.SandMastery=1
		if(src.SandMastery==100&&src.AutoProtection==20&&!src.Shukaku)
			src.Shukaku=1
	if(src.Clan=="Kusakin")
		if(src.Senju==0)
			if(prob(1)||src.Trait2=="Prodigy")
				src.Senju=1
	if(src.client)
		src.Skills()
	if((get_dist(src,src.target)>=11&&!src.ButterflyDance)||(get_dist(src,src.target)>=9&&!src.ButterflyDance&&Night))
		src.DeleteTarget()
	if(src.CurrentMission==""&&src.TimeLimit>=1)
		src.TimeLimit=0
	if(src.CurrentMission!="")
		if(src.TimeLimit>=0)
			src.TimeLimit-=1
		if(src.TimeLimit<=0)
			src<<"Voc� ficou sem tempo para realizar a miss�o e voltar! Voc� falhou na miss�o!";src.FailedMissions+=1;src.OnMission=0
			if(src.CurrentMission=="Gauntlet")
				src.GotoVillageHospital()
			src.CurrentMission=""
//	if(src.Pill=="Green")
//		src.calories-=2
//		src.health-=2
//		src.tai+=2
//		src.chakra+=2
//	if(src.Pill=="Yellow")
//		src.calories-=4
//		src.health-=4
//		src.tai+=4
//		src.chakra+=4
//	if(src.Pill=="Red")
//		src.calories-=6
//		src.health-=6
//		src.tai+=6
//		src.chakra+=6
//	if(src.DeathAvoidCount>0&&!src.knockedout)
//		src.DeathAvoidCount--
	if(src.hunger>100)
		src.hunger=100
	if(src.thirst>100&&!src.Clan=="Ketsueki")
		src.thirst=100
	if(src.Status=="Asleep"||src.knockedout||src.PlayingDead)
		src.icon_state="dead"
	if(src.PowerScrollBoost!=0)
		if(src.PowerScrollBoost==1&&src.PowerScrollTime>0)
			src.PowerScrollTime--
	if(src.PowerScrollTime<=0)
		src.PowerScrollBoost=0
		src.PowerScrollTime=0
	if(src.Status!="")
		if(src.Status=="Asleep")
			src.icon_state="dead"
		if(src.Status=="Burn"&&!src.knockedout&&!src.ImmuneToDeath)
			src.health-=rand(10,15)
			src.stamina-=rand(15,25)
		if(src.Status=="Puppet's Poison"&&!src.knockedout&&!src.ImmuneToDeath)
			src.health-=rand(3,5)
			src.stamina-=rand(5,10)
		if(src.Status=="HealingSensation"&&!src.knockedout&&!src.ImmuneToDeath)
			src.health+=rand(5,10)
		if(src.Status=="Gashed"&&!src.knockedout)
			src.health-=5
			if(prob(25))
				src.Bloody()
		if(src.Status=="SoundWavesAltered"&&!src.knockedout)
			var/randz=pick(1,4)
			if(randz>=4)
				src.client:dir=NORTH
			if(randz==3)
				src.client:dir=SOUTH
			if(randz==2)
				src.client:dir=WEST
			if(randz==1)
				src.client:dir=EAST
		if(src.Status=="Ashed"&&!src.knockedout&&!src.ImmuneToDeath)
			var/obj/Mshar/MM=new()
			MM.screen_loc = "1,1 to 19,19"
			src.client.screen+=MM;MM.icon_state="strong"
			spawn(100)
				src.Status=""
				src.client.screen-=MM
		if(src.StatusEffected<1)
			if(src.Status=="SoundWavesAltered")
				src.client:dir=NORTH
			if(src.Status=="Burn")
				src.client.screen-= /obj/ReleaseThingyAilment/Burn
			src<<"You are cured of [src.Status]!"
			for(var/obj/ReleaseThingyAilment/Burn/P in src.client.screen)
				del(P)
			for(var/obj/ReleaseThingyAilment/Bleed/P in src.client.screen)
				del(P)
			src.Status=""
			if(src.icon_state=="dead"&&!src.knockedout)
				src.icon_state=""
//	if(src.PoisonType=="Vit"&&src.PoisonTime>0&&!src.knockedout&&!src.ImmuneToDeath)
//		src.health-=rand(1,5)
//	if(src.PoisonType=="LargerVit"&&src.PoisonTime&&!src.knockedout&&!src.ImmuneToDeath)
//		src.health-=rand(3,6)
//	if(src.PoisonTime>=1)
//		src.PoisonTime-=1
//		if(src.Clan=="Fuuma")
//			src.PoisonTime-=2
//	if(src.PoisonTime<1&&src.PoisonType!="")
//		src<<"You are cured of poison!"
//		src.PoisonType=""
//		src.client.screen-= /obj/ReleaseThingyAilment/Poison
	if(src.BrokenLegs||src.BrokenArms)
		if(src.BrokenLegs)
			if(src.BrokenLegs&&src.BrokenLegsTime>0)
				src.BrokenLegsTime--
			if(src.BrokenLegsTime==0)
				src.BrokenLegs=0
		if(src.BrokenArms)
			if(src.BrokenArms&&src.BrokenArmsTime>0)
				src.BrokenArmsTime--
			if(src.BrokenArmsTime<=0)
				src.BrokenArms=0
	if(src.StatusEffected>=1)
		src.StatusEffected-=1
		if(src.Clan=="Fuuma"||src.Trait2=="Pure Body")
			src.StatusEffected-=2
//	if(src.Status!=""&&src.StatusEffected<1)
//		if(src.Status=="SoundWavesAltered")
//			src.client:dir=NORTH
//		if(src.Status=="Burn")
//			src.client.screen-= /obj/ReleaseThingyAilment/Burn
//		src<<"You are cured of [src.Status]!"
//		for(var/obj/ReleaseThingyAilment/Burn/P in src.client.screen)
//			del(P)
//		for(var/obj/ReleaseThingyAilment/Bleed/P in src.client.screen)
//			del(P)
//		src.Status=""
//		if(src.icon_state=="dead"&&!src.knockedout)
	//		src.icon_state=""
	if(src.GenerativeScrollOn)
		src.exp+=rand(100,200)
		if(src.Subscriber)
			src.exp+=rand(30,55)
	if(src.knockedout)
		src.exp=0
	if(src.JutsuInLearning!="")
//		if(src.aflagged)
//			src.exp=0
		if(DBLexpday==1)
			src.exp*=2
		if(src.FoxTimeChamber)
			src.exp*=3
		if(Halfexpday==1)
			src.exp*=0.5
		if(src.TypeLearning!="Taijutsu"&&src.TypeLearning!="Ninjutsu"&&src.TypeLearning!="Genjutsu")
			if(src.SecondName=="Namikaze"||src.SecondName=="Enton")
				src.JutsuEXPCost+=src.exp*0.35;src.exp=0
			else
				if(src.Trait!="Genius")
					if(src.Trait=="Powerful")
						src.JutsuEXPCost+=src.exp*0.4;src.exp=0
					else if(src.Trait=="Hard-Worker")
						src.JutsuEXPCost+=src.exp*(0.03*src.Age);src.exp=0
					else
						src.JutsuEXPCost+=src.exp*0.5;src.exp=0
				else if(src.Trait=="Genius")
					src.JutsuEXPCost+=src.exp*0.7;src.exp=0
		else if(src.SecondName=="Irkashii"&&src.TypeLearning=="Taijutsu")
			src.JutsuEXPCost+=src.exp*0.35;src.exp=0
		else if(src.SecondName=="Satake"&&src.TypeLearning=="Genjutsu")
			src.JutsuEXPCost+=src.exp*0.35;src.exp=0
		else
			if(src.Trait=="Tough")
				if(src.TypeLearning=="Taijutsu")
					src.JutsuEXPCost+=src.exp*1.2;src.exp=0
			if(src.Trait!="Genius")
				if(src.Trait=="Powerful")
					src.JutsuEXPCost+=src.exp*0.4;src.exp=0
				else if(src.Trait=="Hard-Worker")
					src.JutsuEXPCost+=src.exp*(0.03*src.Age);src.exp=0
				else
					src.JutsuEXPCost+=src.exp*0.5;src.exp=0
			else if(src.Trait=="Genius")
				src.JutsuEXPCost+=src.exp*0.7;src.exp=0
		if(src.JutsuEXPCost>=src.JutsuMEXPCost)
			src.LearnThisJutsu()
	if(src.JutsuDelay>0)
		if(src.Subscriber)
			src.JutsuDelay-=0.5;if(src.JutsuDelay<0) src.JutsuDelay=0
		if(src.Yonkami)
			src.JutsuDelay-=8;if(src.JutsuDelay<0) src.JutsuDelay=0
		if(src.FoxTimeChamber)
			src.JutsuDelay-=3;if(src.JutsuDelay<0) src.JutsuDelay=0
		if(src.Village==ScrollIsIn)
			if(src.Trait=="Hard-Worker")
				src.JutsuDelay-=3
			src.JutsuDelay-=4
			if(src.JutsuDelay<0) src.JutsuDelay=0
		else if(src.FoxTimeChamber)
			src.JutsuDelay-=10;if(src.JutsuDelay<0) src.JutsuDelay=0
		else if(DBLexpday==1)
			src.JutsuDelay-=5;if(src.JutsuDelay<0) src.JutsuDelay=0
		else if(Halfexpday==1)
			src.JutsuDelay-=1;if(src.JutsuDelay<0) src.JutsuDelay=0
		else if(src.Trait=="Hard-Worker")
			src.JutsuDelay-=3;if(src.JutsuDelay<0) src.JutsuDelay=0
		else
			src.JutsuDelay-=2;if(src.JutsuDelay<0) src.JutsuDelay=0

	if(src.Yen<0)
		src.Yen=0
	//if(src.Stealth==1&&StealthCount==0)
		//src.NotMoving()
	spawn(10)
		src.RegenerationProc()
mob/proc/HungerAd()
	if(src.hunger<100)
		if(src.Clan=="Akimichi")
			src.hunger+=1
		src.hunger+=1
		if(src.hunger>100)
			src.hunger=100
		if(src.hunger>=50)
			if(prob(40)) src<<"Voc� est� se sentindo com um pouco de fome."
	spawn(12000)
		src.HungerAd()
mob/proc/ThirstAd()
	if(src.thirst<100)
		if(src.Clan=="Ketsueki")
			src.thirst+=4-(src.ThirstHold)
		src.thirst+=1
		if(src.thirst>100&&!src.Clan=="Ketsueki")
			src.thirst=100
		if(src.thirst>=50)
			if(prob(40)) src<<"Voc� est� se sentindo com um pouco de sede."
	spawn(9000)
		src.ThirstAd()

mob/proc/RPGuidelines()
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Rules</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<br><b>Roleplay?</b>
		<br>Roleplaying � bastante simples e n�o � dif�cil de se ageitar, pelo menos aqui.
		roleplaying � simplesmente agindo como se fosse seu personagem (falar), Nada mais! Devido a esta
		tamb�m � uma coisa muito boa para reter o conhecimento OOC (Fora-do-Personagem). N�o se esque�a, este RP Servidor
		� experimental e pode ser no futuro um PvP, mas como aqui tem uma hist�ria real, talvez voc�
		gostaria de ser parte disso. RolePlaying pode ser muito divertido, voc� s� n�o deve ficar muito sens�vel sobre isso.
		</br>
		<br><b>Por que eu deveria usar o Roleplay? Quero PvP!</b>
		<br>Aqui � sempre, e vai ser um jogo PvP.
		<br>
		<br><b>RP Regras e Orienta��es</b>
		<br><b>1</b> - Voc� deve agir como seu personagem , esta � a regra mais importante. Se voc� se recusa a seguir essa regra, primeiro delito � uma expuls�o (como um aviso), segunda ofensa tempo � a proibi��o durante uma semana.
		<br><b>2</b> - No OOC n�o contam como personagem, juntamente com o Chat da Vila. Chat da vila e OOC n�o � fala de personagem e pode ser usado a vontade. Chat do clan tamb�m � OOC. As �nicas op��es dentro do jogo s�o Falar e Emo��o.
		<br><b>3</b> - N�o diga fa�a RP e coisas assim no OOC, tais como instru��es ou at� mesmo o que aconteceu. Sabemos que � OOC, mas isso � o que leva as pessoas a ter o esp�rito de N�o-Rp. Se voc� for pego soltando informa��es de personagem dentro do chat, voc� vai ser preso ou silenciado dependendo das a��es.
		As informa��es que voc� pode liberar passa por coisas tais como Pegar tal jutsu e instru��o do jogo. As informa��es que voc� n�o pode liberar  s�o informa��es sobre outras aldeias, ect.
		<br><b>4</b> - N�o fale OOC dentro do personagem. Se o fizer, por favor, use par�nteses ou colchetes. Se voc� quiser dizer algo realmente importante, voc� sempre pode apenas usar os suportes no final de todas essas frases, apenas contanto que voc� termin�-lo com colchetes / par�nteses, voc� n�o ter� que come�ar com ele . Se voc� n�o seguir esta regra, que pode resultar em ser multado
		<br><b>5</b> - Todo mundo quer ser um her�i, mas h� mais maneiras de se tornar um her�i. Basta jogar normalmente. Nem todo mundo � um her�i e as pessoas precisam entender que, algumas pessoas precisam tomar apenas o que ela t�m em vez de todos tentando ser o personagem principal. Junto com esta regra, n�o se esque�a que voc� n�o pode sempre ser o vencedor, se voc� nunca realmente morre voc� deve ficar no hospital por algum tempo razo�vel, como se estivesse se recuperando.
		<br><b>6</b> - Locais contam como "No Personagem" , n�o se esque�a disso. Voc� pode dizer �s pessoas para ir a lugares somente pelo Personagem. As organiza��es tamb�m contam como IC.
		<br><b>7</b> - Regra GM: N�o use Teleport para outra coisa sen�o corrigir bugs, etc. Teleport e Evocar funciona como OOC, por isso, se voc� us�-lo para um m�todo de "no personage" � contra as regras.
		<br>
		<br><b>Duvidas para quem esta Come�ando</b>
		<br><b>When starting your character out, your Character is 10. So they can have knowledge that you already know itself.
		<br><b>1</b> - Voc� pode saber os nomes de todos dentro de seu cl�, mas ningu�m fora dela. Considerando-se que � o seu cl�, voc� deve reconhecer as pessoas com isso. Isto � opcional..
		<br><b>2</b> - Voc� pode saber tudo sobre a sua Vila. Sua aldeia. Isso tamb�m � altamente opcional tamb�m, mas considerando que voc� esteve l� desde 10 anos de idade � esperado que voc� sabe tudo sobre ele.
		<br><b>3</b> - Voc� pode ter conhecimento sobre a organiza��o Akatsuki. A organiza��o � antiga e aposentado agora, para que as pessoas tenham conhecimento dessas coisas. Assim, quando v� algu�m com uma capa que voc� pode se perguntar se � da Akatsuki. eles n�o t�m o manto exato, voc� n�o vai v�-los diferente.
		<br><b>Voc� n�o tem nenhum conhecimento sobre o nome das pessoas, exceto os que falam ele pra voc�, como Cl�s. Voc� tamb�m n�o sabe a hist�ria das pessoas, a menos que eles lhe dizerem. Quando em resposta a estas coisas sobre como voc� conhece, voc� n�o tem que responder a n�o ser para o GM. Se o GM pedir voc� precisa responder</b></body>
		<br><b><a href=?src=\ref[usr];action=Main>Voltar</a><br>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")
mob/proc/RuleGuide()
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Regras do Naruto Chronicas Shinobi</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<br><b>Atualmente o Dono do game � o Lui (Lui12).</b>
		<br><b>0</b> - Nem tenta usar o "estou preso" enquanto voc� tem o Pergaminio Ninja Secreto, voc� ser� punido..
		<br><b>1</b> - Portugu�s no Ooc, usar as outras l�nguas esta proibido no Chat da vila. Mantenha as outras linguagens apenas na fala
		<br><b>2</b> - Sem racismo. Brincadeira � parte tudo bem, mas se � s�rio, as consequ�ncias ser�o recebidos.
		<br><b>3</b> - N�o evitar a morte. Isso �  sair do game, ou usando "estou preso" para evitar ser morto de qualquer maneira. Voc� est� apenas oficialmente morto uma vez que seu personagem entra no hospital voc� vivera novamente, assim que sua tela estiver escura voc� n�o pode sair antes da mensagem aparecer "Voc� n�o foi capaz de ser salvo . Isso � conhecido como morte evitanda. O encerramento do jogo durante uma batalha tamb�m conta como este. Esta � uma proibi��o  de banimento de 1 dia para a primeira Ofensa, 3 dias para o segundo e por ai vai variando.
		<br><b>4</b> - N�o treinar AFK - Voc� vai ser banidoo na primeira infra��o, e a data vai ser dita pelo Gm do Desbanimento."
		<br><b>5</b> - O Dono do game pode banir, por qualquer raz�o que ele quizer, e por mais longa que ele deseja a qualquer momento que desejar
		<br><b>6</b> - N�o chama a equipe para rever uma puni��o que recebeu quando era sua culpa..
		<br><b>7</b> - Aplicadores n�o est� no controle de quem banir e quanto tempo eles sera banido; por favor, n�o fique bravo com eles
		<br><b>8</b> - N�o abusar de bugs - � melhor voc� denunci�-lo, porque se voc� est� que abusando de um bug voc� vai ser banido pelo o Ip at� novo aviso..
		<br><b>9</b> - N�o chamar Propriet�rios, Aplicadores, administradores ou moderadores para qualquer coisa que possa ajudar a promover o crescimento e desenvolvimento do seu personagem. Isso pode ser algo t�o simples como pedir uma renomea��o livre, ou pedir a um GM de se teletransportar para voc�, assim voc� pode falar, ou te teletransportar livremente porque voc� n�o quer caminhar. � abuso. N�o fa�a isso.
		<br><b>10</b> - N�o pedir para GM quaisquer m�todos de fazer sua vida online mais f�cil por causa de sua pregui�a - S� pedir teleporte se estiver preso, ou por alguma outra raz�o ruim. Use o bom senso.
		<br><b>11</b> - N�o pergunte para a GM, voc� est� sendo observado j� se acreditarmos que voc� � um player modificado por um "staff" vamos nos aproximar de voc� e rezolver o problema..
		<br><b>12</b> - N�o postar conte�do expl�cito excessivamente sexual em mensagens no OOC - Um pouco de brincadeira pode ser tolerada, mas se as pessoas est�o come�ando a ficar ofendidas pelo oque voc� postou, voc� pode querer se explicar ou esta sujeito a uma puni��o severa.
		<br><b><a href=?src=\ref[usr];action=Main>Voltar</a><br>
		</body>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")

mob/proc/Iniciante()
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Como ganho e aprendo Jutsus?</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<br><b>1</b> - Esse � um servidor RP , aonde voc� � o seu propio personagem , e suas falas s�o propias , para ver o nome dos outros e para o seu aparecer , voce precisa apresentar o seu nome , exemplo um membro do clan uchiha deve falar , Uchiha, Exemplo
		<br><b>2</b> - Voc� pode se Mover com as teclas cima,baixo,esquerda,direita
		<br><b>3</b> - A tecla A da um soco esquerdo , A tecla S da um soco direito
		<br><b>4</b> - Voc� pode correr clicando no botao Correr , perto da barra do Chat
		<br><b>5</b> - O sistema de up? s�o por passivas , Va em Habilidades>Habilidades Basicas/clan , para ver as passivas e como aumenta-las
		<br><b>6</b> - Build? cada um tem a sua , no come�o voc� come�a com 50 pontos 55 non clans , para distribuir em fisico , capacidade e controle , cada um tem sua prioridade.
		<br><b>7</b> - Fisico: Determina sua energia e seu dano em taijutsu
		<br><b>8</b> - Capacidade: Determina sua quantidade de chakra e seu dano em Ninjutsus
		<br><b>9</b> - Controle: Determina a quantidade de energia e chakra gastos em um jutsu , e o Dano de jutsus que precisam de controle de chakra(Nin medicos e Genjutsus)
		<br><b><a href=?src=\ref[usr];action=Main>Voltar</a><br>
		</body>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")


mob/proc/GanharJutsu()
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Como ganho e aprendo Jutsus?</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<br><b>1</b> - Fale com um Npc , ele explicara a descri��o do jutsu pra voc� , e voc� pode aceitar aprender o Jutsu ou N�o
		<br><b>2</b> - Se aceitar , vai aparecer na Aba Info , a experiencia do jutsu , o quanto voc� tem e o quanto voc� precisa para aprende-lo.
		<br><b>3</b> - Existe varios modos de ganhar experiencia para aprender os jutsus , o Modo mais viavel e com o Pergaminio de Experiencia , Basta clica-lo no seu Inventorio , e apertar a tecla que aparecer
		<br><b>4</b> - Existe 3 tipos de Jutsus pricipais , Ninjutsu , Taijutsu e Genjutsu
		<br><b>5</b> - Ninjutsu esta cituado a tecnicas de longa distancia, e  tecnicas elementais
		<br><b>6</b> - Taijutsu , � combate corpo a corpo , voc� precisa estar em uma curta distancia para acertar
		<br><b>7</b> - Genjutsu , voc� precisa targetar o Inimigo normalmente e solta-lo, existe tambem os genjutsus por area , que acertam inimigos em area
		<br><b>8</b> - Existe Modos Sabios , e Curse seal , todos eles com requerimentos secretos.
		<br><b><a href=?src=\ref[usr];action=Main>Voltar</a><br>
		</body>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")




mob/proc/GuiaParIniciantes()
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Guia do Naruto Chronicas Shinobi</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<br><b><a href=?src=\ref[usr];action=Guia>Tutorial para Iniciante</a><br>
		<br><b><a href=?src=\ref[usr];action=RPGuidelines>Guia e regras RP</a><br>
		<br><b><a href=?src=\ref[usr];action=TransFile>Como ganho e aprendo Jutsus?</a><br>
		<br><b><a href=?src=\ref[usr];action=RegrasGm>Regras para Gm</a><br>
		<br><b><a href=?src=\ref[usr];action=RuleGuide>Regras Do Game</a><br><br>
		</body>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")
/*
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Rules</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<br><b>Please Read:: This is not a RP Server, so understand you don't have to Roleplay! A much larger list for rules can be found here http://s8.zetaboards.com/NarutoFinalFight/topic/8347957/1/.</b>
		<br><b>1</b> - English in OOC only, take the other languages to say.
		<br><b>2</b> - No prejudice against any other person in OOC (In a serious fashion), keep it in Say. If you're caught in say, you'll still be punished.
		<br><b>3</b> - No caps spamming in OOC.
		<br><b>4</b> - No EZ training - You'll be banned on first offense, apply on forum section for unbanning to be unbanned.
		<br><b>5</b> - No GM disrespect, nor questioning passings on punishments without proper knowledge of what happened - Aggravation of this rule could end up in punishment. If you have a problem, provide proof, and provide it on the forum.
		<br><b>6</b> - No overuse of profanity in OOC - We all understand it normally, but clogging your messages with it is considered spam, and overall disrespectful to all people on OOC.
		<br><b>7</b> - No Spawn Killing.
		<br><b>8</b> - No bug abusing - You better report it, because if you're found abusing a bug you'll be permabanned until further notice.
		<br><b>9</b> - Do not nag any GM's, Leaders, or Kage's for ranks, tests, or anything that promotes the growth of your character - These decisions will be made for you when you are ready. If you really believe you're being neglected (This means total ignoring, not being told "No") post it on the forums, and we'll see what we can do.
		<br><b>10</b> - Do not nag GM's for summons or any methods of making your online life easier because of your laziness - Only ask for summons if stuck someplace, or for some other bad reason. Use common sense.
		<br><b>11</b> - Do not ask for GM, you are being observed already if we believe you are GM material, we will approach you.
		<br><b>12</b> - No overly sexual explicit content in messages in OOC - A little messing around can be tolerated, but if people are starting to get a bad taste in the back of their throat from what you posted, you may want to check yourself, or risk punishment.
		<title>Gm Rules</title>
		<br><b>12</b> I(Rudolf)was given the task of giving moderators tasks and guidelines to follow. We're under new management, and players with questionable previous behavior (gets up, stares Yama to the ground) and geniune dumbassness curiousity of what to do.
		<br><b>12</b> -So, let's begin.
		<br><b>12</b> -1.	Respect the pecking order. Owners-> Admins-> Enforcers->Helpers. If somebody above you in the pyramid does something you do not like,You do not outright challenge them, changing the action immediately.You find other moderators and discuss with them about it, and then they go to higher ups and they discuss about it, meaning if it was an enforcer problem, I should be one of the admins you turn to. You also do not post their actions on a public topic. Players have the least amount of say of who is a good mod or not, because their maturity is suspect, so do not turn to them for advice.
		<br><b>12</b> -2.	Respect each other. If I see moderator incompatibility(flaming on Gm ooc, constant breaking of rule #1 with significant other), I will be going to either Hawk or Korona to have them removed. You were given these powers because you were thought to be mature and collected enough to handle rashness and immaturity. If you prove us wrong, you will pay with your rank.
		<br><b>12</b> -3.	Record. Even I hate this, but it has to be done. If someone's getting punished, make sure other moderators know about it. This is for organizational purposes. Chances are, you won't be there to unban the player, and they will complain about it. The moderators(the good ones) will have to look up the ban reports and see if the player was correct. If so, they will unban him.
		<br><b>12</b> -4.	Be vigilant. As in, do your job. Helpers should be giving....help, Enforcers should be responding to any reports they come across on the forums with necessary force, and Admins should be dealing with moderator issues/repeated disobedience. Owners just slack off, occasionally updating with the awesome. Owners should never have to handle your problems, by the way. Remember that.
		<br><b>12</b> -5.	Punish accordingly. Unless an owner or admin says otherwise, any first offense should be dealt with a warning. The second offense, go crazy, though if your ban stretches past 5 days, you're going to have issues. Third offense, come directly to an Admin. Anything that calls for overruling a first offense must be discussed first.
		<br><b>12</b> -6.	Be responsible. It sucks, but you have to put your duty ahead of your play time. Free or not, you volunteered to put yourself to work. Don't worry though. Once you deliver your first ban hammer, it will all be worth it.


		<br><b>12</b>Additional, by Hawk: I expect Gm's to respect players as they wish to be respected. That means I do not want to see immature acts coming from our GM's. Also any use of innapropiate verb usage (E.g) Teleporting without a good reason will result in a strip.
		<br><b>12</b> -Furthermore, one thing I never want to see on the gm logs is "Player was banned: Reason GTFO WITH YOUR ABUSE HERE"

		<br><b>12</b> -	That's it. Obey.
		</body>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")
*/
mob/proc/GmRule()
	var/tmp
		html
	html = {"
	<html>
		<head>
			<style type="text/css">
				body {
					color: white;
					background-color: black;
					font-family: Arial, Times, Tahoma, sans-serif
				}
				th {
					font-weight: bold;
					font-size: 10pt
				}
				tr {
					font-size: 12pt;
					padding: 2px. 10px, 2,px, 10px
				}
			</style>
		</head>
"}
	var/Stuffz = {"
		<html>
		<STYLE>BODY{font-family: Verdana}</STYLE>
		<head>
		<title>Rules</title>
		</head>
		<body bgcolor=#f5f5f5 text=#000000>
		<title>Regras para GM</title>
		<br><b>12</b> -1.	Respeite a hierarquia. Propriet�rios-> Admins-> GM-> ajudantes. Se algu�m acima de voc� na pir�mide faz algo que voc� n�o gosta, voc� n�o deve desafi�-los.Voc� deve encontrar outros moderadores e discutir com eles sobre isso, e, em seguida, eles v�o para reportar tudo para o dono, ou seja, se algum gm abusou ou fez algo fora das regras voc� tambem pode reportar diretamente pro dono em seu skype @luufeefs
		<br><b>12</b> -2.	Respeitar um ao outro. Voc� n�o � obrigado a gostar de ninguem mas respeite, se n�o respeitar voc� sera reportado pelo dono do servidor para remov�-lo. Voc� foi dado a esses poderes, porque voc� estamos pensado que voc� � um ser maduro e recolhido o suficiente para lidar com imprud�ncia e imaturidade. Se voc� provar que estamos errados, voc� vai pagar com a sua desclassifica��o.
		<br><b>12</b> -3.	Registre. Mesmo que odeie isso, mas tem que ser feito. Se algu�m est� sendo punido, certifique-se de outros moderadores sabem sobre ele. Isto � para fins de organiza��o. As possibilidades s�o, voc� n�o vai estar l� para tirar o ban o jogador na data, ou eles v�o reclamar. Os moderadores (os bons) ter�o que olhar os relatorios de abuso e ver se o jogador estava correto. Se assim for, eles retirar o banimento.
		<br><b>12</b> -4.	Seja vigilante. Como em, fazer o seu trabalho. Gms deve estar dando ajuda, os agentes dever�o responder a quaisquer relatos que se depararem, e os administradores devem estar lidando com quest�es de moderador / desobedi�ncia repetida. Fale conosco apenas. Lembre-se que.
		<br><b>12</b> -5.	Punido em conformidade. A menos que um propriet�rio ou administrador diz o contr�rio, qualquer primeiro delito deve ser tratada com um aviso. A segunda infra��o, mas se o seu banir se estende �ltimos 5 dias, voc� vai ter problemas. Terceira ofensa, vir diretamente para um Admin. Tudo o que pede o indeferimento de uma primeira infra��o deve ser discutido em primeiro lugar.
		<br><b>12</b> -6.   Seja respons�vel. � chato, mas voc� tem que colocar o seu dever � frente de seu tempo de jogo. Gr�tis ou n�o, voc� se ofereceu para colocar-se ao trabalho. N�o se preocupe. Depois de entregar o seu primeiro banimento justo, tudo vai valer a pena.
		<br><b>12</b> -7	Como um membro da equipe que deve seguir todas as regras, enquanto , joga..
		<title>Regras  de Gm N�o se esque�a!</title>
		<br><b>12</b> -8	O uso de qualquer verbo sem uma raz�o � ilegal, e isso ir� resultar em uma remo��o de poder
		<br><b>12</b> -9    *N�o usar  anunciar a menos que seja import�nte; * N�o usar o (Confira Jutsus) A menos que necess�rio. Isso geralmente entra em jogo durante as verifica��es de AFK .;
							*Nenhum uso de teletransporte ao menos que seja necess�rio. Isto significa teletransportar para seu pr�prio benef�cio
							*Bannimento por desrespeito GM � ilegal, a menos que ele lhe ofendeu o suficiente. No entanto voc� precisa fornecer provas (prints etc) e contatar algum administrador ou o Dono do game.
							*GM`s n�o s�o mais permitidos de banir algu�m sem fazer um relat�rio apropriado sobre isso pros administradores
							*O GM vai ser removido do poder, se essas regras n�o s�o postas em movimento.
		<br><b>12</b> - Al�m disso, uma coisa que eu nunca mais quero ver nos registros GM � jogador foi banido: "por abusos aqui"

		<br><b>12</b> -	Bom Jogo e Bom trabalho a todos ass: Luu Halls.
		<br><b><a href=?src=\ref[usr];action=Main>Voltar</a><br>
		</body>
		</html>
		"}
	usr << browse("[Stuffz][html]","size=576x576,window=Rules")
mob/proc/MedalCheck()
	if(src.client)
		if(src.BeginningVillage=="Leaf")
			src.AwardMedal("Leaf Ninja")
		if(src.BeginningVillage=="Rain")
			src.AwardMedal("Rain Ninja")
		if(src.BeginningVillage=="Sound")
			src.AwardMedal("Sound Ninja")
		if(src.BeginningVillage=="Rock")
			src.AwardMedal("Rock Ninja")
		if(src.rank=="Chuunin"||src.rank=="Jounin"||src.rank=="Special Jounin"||src.rank=="Hokage"||src.rank=="Amekoutei"||src.rank=="Otokami"||src.rank=="Tsuchikage")
			src.AwardMedal("Chuunin")
		if(src.rank=="Jounin"||src.rank=="Special Jounin"||src.rank=="Hokage"||src.rank=="Amekoutei"||src.rank=="Otokami"||src.rank=="Tsuchikage")
			src.AwardMedal("Jounin")
		if(src.Anbu)
			src.AwardMedal("ANBU")
		var/has50jutsu=0
		for(var/obj/SkillCards/A in src.LearnedJutsus)
			has50jutsu++
		if(src.rank=="Jounin"&&has50jutsu>49)
			src.AwardMedal("Elite Ninja")
		if(src.ClanLeader)
			src.AwardMedal("Clan Leader")
		if(src.rank=="Hokage")
			src.AwardMedal("Hokage")
		if(src.rank=="Amekoutei")
			src.AwardMedal("Amekoutei")
		if(src.rank=="Tsuchikage")
			src.AwardMedal("Tsuchikage")
		if(src.rank=="Otokami")
			src.AwardMedal("Otokami")
		if(src.blevel=="B"&&src.rank=="Genin"||src.blevel=="A"&&src.rank=="Genin"||src.blevel=="S"&&src.rank=="Genin")
			src.AwardMedal("N�o sou apenas um genin")
		if(src.Rush>=20)
			src.AwardMedal("Go Hard")
mob/proc/ScoreboardUpdate()
	if(src.client)
//Scores
		var/ARARA=src.kills-src.deaths
		if(src.Village!="Missing")
			ARARA+=(src.dmission*1)+(src.cmission*5)+(src.bmission*15)+(src.amission*30)+(src.smission*50)
		if(ARARA<0)
			ARARA=0
		var/params = list("Rank"="[src.rank]","Missions"="[src.amission+src.bmission+src.cmission+src.dmission+src.smission]","Bounty"="[src.bounty]","Class Level"="[ARARA]")
		world.SetScores("[src]",list2params(params))//gives the scores
mob/proc/NotMoving()
	var/Cloc=src.loc
	if(src.Stealth==1)
		src.StealthCount++
		if(src.StealthCount>25)
			src.invisibility=90
		while(Cloc==src.loc)
			src.invisibility=90
			sleep(1)
		src.invisibility=1;
		src.StealthCount=0;
/////////Exp Orbs//////////////////////////////
proc
	EXP(Z,X,mob/Y)//Z is the Dropper, Y is the one to make them drop it. X is max EXP gained.
		if(ismob(Z))
			//just add everything that can't drop any here? o.o
			//if(istype(blah))
				//return
			if(istype(Z,/mob/NPC))
				var/mob/NPC/E = Z
				if(E.blevel=="S")
					return
		return
			//		var/obj/NFFOrb/A = new(E.loc)
			//		A.expowner = Y
			//		A.expvalue += round(rand(30000,X))
					//A.loc = E.loc*/
		//	else
			//	var/obj/NFFOrb/A = new(Z:loc)
			//	A.expowner = Y;A.expsource = Z
			//	A.expvalue += round(rand(50,X))
	//	else
	//		if(isturf(Z))
			//	var/obj/NFFOrb/A = new(Z)
			//	A.expowner = Y
			//	A.expvalue += 10
			/*
obj
	NFFOrb
		New()
			src.pixel_x = rand(-8,8)
			src.pixel_y = rand(-8,8)
			spawn(600)	del(src)
			spawn(300)	if(src)	src.expowner = "-FFA-"
			spawn()
				while(src)
					for(var/mob/M in oview(1))
						if(M&&M.client)
							if(M==src.expowner||src.expowner=="-FFA-")
								M.exp += src.expvalue
								M<<"<font size=-1><font color=white>You have gained [src.expvalue] EXP!"
								del(src)
							else
								M<<"<font size=-1><font color=red>This belongs to [src.expowner]!"
								sleep(10)
					sleep(3)
			..()
			spawn(300)
				del(src)
		var
			expowner
			expsource
			expvalue = 500
		name = "Experience Orb"
		icon = 'Icons/Hud/Backdrop.dmi'
		icon_state = "NFF"
*/
obj/Totem
	icon = 'Post.dmi'
	icon_state = "2"
	density=1
	var
		Effect=0
		CoolDown=0
	layer=MOB_LAYER+1
	New()
		.=..()
		spawn()
			while(src)
				if(Effect==1)
					src.WrathOfArgon()
					Effect=0
				if(Effect==2)
					src.WrathOfArgon()
					Effect=0
				if(Effect==3)
					src.WrathOfArgon()
					Effect=0
				if(Effect==4)
					src.WrathOfArgon()
					Effect=0
				if(Effect==5)
					src.WrathOfArgon()
					Effect=0
				if(Effect==6)
					src.WrathOfArgon()
					Effect=0
				if(Effect==7)
					src.WrathOfArgon()
					Effect=0
				if(Effect==8)
					src.WrathOfArgon()
					Effect=0
				if(Effect==9)
					src.WrathOfArgon()
					Effect=0
				if(Effect==10)
					src.WrathOfArgon()
					Effect=0
				sleep(100)
				if(CoolDown>0)
					CoolDown-=10
					if(0>CoolDown)
						CoolDown=0

obj
	proc
		WrathOfArgon()
			oview(30)<<"Tolos Quem optou por lutar aqui.."
			sleep(25)
			oview(30)<<"Ou�a a minha palavra cada ou  pagara com sua puni��o..."
			sleep(25)
			var/Command=2
			for(var/mob/M in oview(30))
				if(Command==1)
					oview(30)<<"Fique parado...!"
					sleep(15)
					if(M.icon_state!="")
						M<<"Seu tolo...."
						M.health-=1550
				if(Command==2)
					sleep(10)
					oview(30)<<"Protega-se..."
					sleep(25)
					if(M.icon_state!="Block")
						M<<"Seu tolo...."
						M.health-=1550
						return

/*GravityChange()
	var/Gravity=0
	for(var/mob/M in oview(30))
		oview(30)<<"You feel something heavy begin to press upon your body!"
		Gravity=1
		if(Gravity==1)
	    	M.Running=0
	    	spawn(250)
	    		oview(35)<<"You feel the heavyness upon your body fade away!"
*///	    		Gravity=0
//	    		M.Running=1
	    	//	return