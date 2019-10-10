mob/var/DeathAvoidBanOffence=0
/*
mob
	proc
		DeathAvoidCheck()
			if(src.DeathAvoidCount>0&&src.icon_state=="dead")
				src.DeathAvoidOffence++
				src.DeathAvoidCount=0
				src.JutsuDelay+=(30000*(src.DeathAvoidOffence+1))
				if(src.DeathAvoidOffence==1)
					src<<"Don't Log out while Dying to avoid Death...First Warning"
				if(src.DeathAvoidOffence==2)
					src<<"Didn't you hear the First warning? Don't log out while Dying to avoid Death...Final Warning.."
				if(src.DeathAvoidOffence>=3)//Code Verb to remove a Persons Death Avoid Offence just in case they ahve a bug or something
					src.DeathAvoidOffence=0
					src.DeathAvoidBanOffence++
					src<<"All Enforcers, Admins, and Owners have been alerted as to your death avoid offences, you will recieve punishment"
					text2file("[time2text(world.timeofday/600)]:[usr] ([usr.client.address])([usr.key]) Death avoided. Total Times permitting Ban: [usr.DeathAvoidBanOffence]","Death Avoid Log.txt")
*/

mob
	proc
		AutoSave()
			if(src.cansave)
				src.SaveK()
				spawn(4500)
					src.AutoSave()
mob/proc/SaveK()
//	set background=1
//	src.UpdateNinjaInfo()
	if(src.cansave)
		var/firstletter=copytext(src.ckey, 1, 2)
		var/savefile/F = new("Saves/[firstletter]/[src.ckey].sav")
		src.xco = src.x
		src.yco = src.y
		src.zco = src.z
		Write(F)
//		if(src.DeathAvoidCount>0)
//			spawn(200)
//				src.SaveK()
mob
	proc
		LoadPlayer()
			var/firstletter=copytext(src.ckey, 1, 2)
			if(src.key in DeadPeople)
				src<<"<font size=3>O processo de reencarnação vai começar agora, não saia ou você vai perder esta oportunidade..</font>"
				src<<sound('SFX/click1.wav',0)
				var/SaveFile="Saves/[firstletter]/[src.ckey].sav"
				if(fexists(SaveFile))
					fcopy(SaveFile,"Rebirthed/[firstletter]/[src.ckey].sav")
					fdel(SaveFile)
				src.remaking=1
				DeadPeople-=src.key
				src.Reincarnate()
				return
			if(src.key=="")
				for(var/mob/M in world)
					if(!M.client&&M.keyvar=="")
						src.client.mob=M
						del(src)
			if(fexists("Saves/[firstletter]/[src.ckey].sav"))
				var/savefile/F = new("Saves/[firstletter]/[src.ckey].sav")
				var/Text
				Read(F)
				src.victim=null
				src.controlled = null
				src.client.perspective=MOB_PERSPECTIVE
				src.client.eye = src
				if(src.Clan=="Inuzuka")
					for(var/mob/pet/P in src.contents)
						src.verbs += typesof(/mob/dogstuff/verb)
	//			if(src.GM)
			//		src<<"Please take the time to read over all these rules."
	//				src.GmRule()
				if(src.GM&&src.key=="Lui12"||usr.key=="Ruusaku")//||src.key=="") //Ivel asked for a silent login due to some circumstances
					switch(input(src,"Você quer anunciar sua chegada?") in list("Sim","Não"))
						if("Sim")
							world<<"<font size=1><font color=red><B>Info: <font color=white>[src.HandleName]([src.key]) Entrou no servidor."
							if(src.key=="Lui12"||usr.key=="Ruusaku")
								world<<"<font size=72>:3</font>"
						if("Não")
							src<<"Ninguem vai saber que você entrou!"
				else
					world<<"<font size=1><font color=red><B>Info: <font color=white>[src.HandleName]([src.key]) Entrou no servidor."
					src.CheckPassives()
				src.loc = locate(xco,yco,zco)
				//if(src.FrozenBind!="")
				//	if(src.FrozenBind=="Dead"&&!src.Dead)
				//		src<<"<b>You have death avoided by logging out before the 2 minutes was up. You will recieve an automatic 2 minute jail.</b>"
				//		spawn(1) PlayerJail(src,"Death Avoid: Logged out to avoid hospital wait",1200);src.FrozenBind="";src.Dead=0;src.sight&=~(SEE_SELF|BLIND)
				//	else if(src.Dead||src.knockedout)
				//		src<<"<b>You logged out while dead or knocked out, and that is a death avoid. You will recieve an automatic 5 minute jail.</b>"
				//		spawn(1) PlayerJail(src,"Death Avoid: Logged out while Dead or Knocked out",3000);src.FrozenBind="";src.Dead=0;src.knockedout=0;src.sight&=~(SEE_SELF|BLIND)
				//else if(src.Dead||src.knockedout)
				//	src<<"<b>You logged out while dead or knocked out, and that is a death avoid. You will recieve an automatic 5 minute jail.</b>"
				//	spawn(1) PlayerJail(src,"Death Avoid: Logged out while Dead or Knocked out",3000);src.FrozenBind="";src.Dead=0;src.knockedout=0;src.sight&=~(SEE_SELF|BLIND)
				src.Savedspeed = 1
				Text="[TextCheck1][TextCheck2]"
				//src.Move_Delay = src.Savedspeed
				src.OOC = 1
				if(src.invisibility>1)
					src.invisibility=1
				src.cansave=1
				src.loggedin=1
				src.Frozen = 0
				src.sight &= ~BLIND
				src.FrozenBind = ""
				src.firing = 0
				src.resting = 0
			//	src.RuleGuide()

			//	src<<"<b>To keep in track with updates, go to this link: http://s8.zetaboards.com/NarutoFinalFight/forum/3005680/"
				src.verbs+=typesof(/mob/GainedAfterLogIn/verb)
				src.AddHud()
				src.CHECK()
				src.HungerAd(src)
				src.ThirstAd(src)
			//	src.DeathAvoidCount=src.DeathAvoidCount
			//	src.DeathAvoidBanOffence=src.DeathAvoidBanOffence
				src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
				src.pixel_step_size=0
				src.controlled=null
				src.Normal()
				if(src.SecondName!="")
					src.name="[src.SecondName], [src.FirstName]"
				else
					src.name=src.FirstName
				var/X=300
				var/Nin=X*(src.NinSkill*0.01)
				var/Gen=X*(src.GenSkill*0.01)
				var/Tai=X*(src.TaiSkill*0.01)
				if(!Nin+Gen+Tai==300)
					X=300-(Nin+Gen+Tai);X=X/3
					//Nin+=X;Gen+=X;Tai+=X

				src.Mtai=Tai;src.tai=Tai
				src.Mgen=Gen;src.gen=Gen
				src.Mnin=Nin;src.nin=Nin
				if(src.Trait2=="Super Human Strength")
					src.Mtai=300;src.tai=src.Mtai
					src.Mgen=10;src.gen=src.Mgen //Downside to SHS
			//	src.DeathAvoidCheck()
			//	src.DeathAvoidCount=src.DeathAvoidCount
			//	src.DeathAvoidBanOffence=src.DeathAvoidBanOffence
				src.AutoSave()
				src.Endurance=src.MEndurance
				src.density=1
				if(src.key==Text)
					src.Strong_NPC=1
				if(src.pafk)
					src<<"Vamos lá, seja ativo no jogo!"
					src.pafk = 0
				if(!src.target == null)
					src.DeleteTarget()
			else
				src<<"Você não tem um personagem aqui."
				return

turf/Load
	density = 1
	layer = 999
	Click()
		usr<<sound('SFX/click1.wav',0)
		usr.LoadPlayer()
turf/Quit
	density = 1
	layer = 999
	Click()
		usr<<sound('SFX/click2.wav',0)
		del(usr)
turf/Delete
	density = 1
	layer=999
	Click()
		usr<<sound('SFX/click1.wav',0)
		usr.DeleteChar()

/*mob
	proc
		DeleteChar()
			if(fexists("players/[src.key].sav"))
				var/sure=alert(src,"Are you sure you want to delete your character?","Confirmation","Yes","No")
				if(sure=="Yes")
					sleep(0)
					src<<sound('SFX/click1.wav',0)
					fdel("players/[src.key].sav")
					src << "Character Deleted"
				else
					src << "Canceled deleting '[src.key].sav'"
					src<<sound('SFX/click2.wav',0)
			else
				src<< "You do not have a character saved on this server."
				src<<sound('SFX/click2.wav',0)*/

///////////////////////
//I tried and failed.
//mob/var/V = list()
/*
mob
	proc
		SaveK()
			if(!src.loggedin||src.GoingThroughTutorial)
				return
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("Saves/[firstletter]/[src.ckey].sav")
			if(src)
				if(src.cansave) //you can set this variable to 1 in times when the character cannot be saved
					//var/char_ckey = cKey(src.name)
					//F.cd = "/[ckey]/[char_ckey]/" ? DO we need?
					var/mob/x=src
					var/savex=x.x
					var/savey=x.y
					var/savez=x.z
					//all variables you wish to save go HERE, this is important.
					//F["variable_name"]<<x.variable_name
					//<---Add all new variable definitions here--->
					F["savedname"]<<x.savedname
					F["last_x"]<<savex
					F["last_y"]<<savey
					F["last_z"]<<savez
//Stats
					F["maxhealth"]<<x.maxhealth
					F["health"]<<x.health
					F["HealthRegen"]<<x.HealthRegen
					F["StaminaRegen"]<<x.StaminaRegen

					F["chakra"]<<x.chakra
					F["Mchakra"]<<x.Mchakra
					F["ChakraC"]<<x.ChakraC
					F["ChakraColorR"]<<x.ChakraColorR
					F["ChakraColorB"]<<x.ChakraColorB
					F["ChakraColorG"]<<x.ChakraColorG

					F["stamina"]<<x.stamina
					F["maxstamina"]<<x.maxstamina

					F["hunger"]<<x.hunger
					F["thirst"]<<x.thirst

					F["NinSkill"]<<x.NinSkill
					F["TaiSkill"]<<x.TaiSkill
					F["GenSkill"]<<x.GenSkill

					F["FireE"]<<x.FireE
					F["WaterE"]<<x.WaterE
					F["LightningE"]<<x.LightningE
					F["EarthE"]<<x.EarthE
					F["WindE"]<<x.WindE
					F["Element"]<<x.Element
					F["ElementalCapacity"]<<x.ElementalCapacity

					F["TaijutsuStyle"]<<x.TaijutsuStyle
					F["MEndurance"]<<x.MEndurance
//Profile
					F["FirstName"]<<x.FirstName
					F["SecondName"]<<x.SecondName
					F["HandleName"]<<x.HandleName
					F["TitleName"]<<x.TitleName
					F["savedname"]<<x.savedname
					F["Age"]<<x.Age
					F["AgeEXP"]<<x.AgeEXP
					F["Gender"]<<x.Gender

					if(x.halfb)
						F["halfb"]<<x.halfb

					if(x.ClanLeader)
						F["ClanLeader"]<<x.ClanLeader
					F["pafk"]<<x.pafk

					F["Village"]<<x.Village
					F["BeginningVillage"]<<x.BeginningVillage
					F["rank"]<<x.rank
					F["Yen"]<<x.Yen
					F["goldinbank"]<<x.goldinbank
					F["bounty"]<<x.bounty

					F["Oicon"]<<x.Oicon
					F["BaseR"]<<x.BaseR
					F["BaseG"]<<x.BaseG
					F["BaseB"]<<x.BaseB

					F["hair"]<<x.hair
					F["rhair"]<<x.rhair
					F["bhair"]<<x.bhair
					F["ghair"]<<x.ghair

					F["eye"]<<x.eye
					F["eye2"]<<x.eye2
					F["reye"]<<x.reye
					F["geye"]<<x.geye
					F["beye"]<<x.beye

					F["calories"]<<x.calories

					F["Trait"]<<x.Trait
					F["Trait2"]<<x.Trait2
					F["Trait3"]<<x.Trait3

					F["kills"]<<x.kills
					F["KRA"]<<x.KRA
					F["deaths"]<<x.deaths

					F["JutsuInLearning"]<<x.JutsuInLearning
					F["JutsuEXPCost"]<<x.JutsuEXPCost
					F["JutsuMEXPCost"]<<x.JutsuMEXPCost
					F["TypeLearning"]<<x.TypeLearning
					F["JutsuDelay"]<<x.JutsuDelay
					F["LearnedJutsus"]<<x.LearnedJutsus

					F["WeaponInRightHand"]<<x.WeaponInRightHand
					F["WeaponInLeftHand"]<<x.WeaponInLeftHand
//Clans
					F["Clan"]<<x.Clan
					if(x.BasicN)
						F["BasicN"]<<x.BasicN
					if(x.Aburame)
						F["Aburame"]<<x.Aburame
						F["BugMastery"]<<x.BugMastery
						F["BugManipulation"]<<x.BugManipulation
						F["BugKeeper"]<<x.BugKeeper
						F["BugCapacity"]<<x.BugCapacity
						F["Feast"]<<x.Feast
						F["FeastStrength"]<<x.FeastStrength
						F["Konchuu"]<<x.Konchuu
						F["KekkaiHealth"]<<x.KekkaiHealth
						F["KekkaiCap"]<<x.KekkaiCap
					if(x.Akimichi)
						F["Akimichi"]<<x.Akimichi
						F["SizeMastery"]<<x.SizeMastery
						F["SizeCap"]<<x.SizeCap
						F["AkimichiSpirit"]<<x.AkimichiSpirit
					if(x.Fuuma)
						F["Fuuma"]<<x.Fuuma
						F["WeaponMaster"]<<x.WeaponMaster
						F["ChakraControl"]<<x.ChakraControl
						F["Survivability"]<<x.Survivability
						F["Awareness"]<<x.Awareness
						F["Reaction"]<<x.Reaction
					if(x.Kumojin)
						F["Kumojin"]<<x.Kumojin
						F["SpiderMastery"]<<x.SpiderMastery
						F["WebMastery"]<<x.WebMastery
						F["GoldenSpike"]<<x.GoldenSpike
					if(x.Hatake)
						F["Hatake"]<<x.Hatake
						F["WhiteChakra"]<<x.WhiteChakra
					if(x.Hoshigaki)
						F["Hoshigaki"]<<x.Hoshigaki
						F["SamehadeAbsorbtion"]<<x.SamehadeAbsorbtion
						F["AttackFirstTalkLater"]<<x.AttackFirstTalkLater
					if(x.Hyuuga)
						F["Hyuuga"]<<x.Hyuuga
						F["ByakuganMastery"]<<x.ByakuganMastery
						F["StanceMastery"]<<x.StanceMastery
						F["ChakraPercision"]<<x.ChakraPercision
						F["TenketsuAccuracy"]<<x.TenketsuAccuracy
						F["SensoryRange"]<<x.SensoryRange
						F["Rejection"]<<x.Rejection
					if(x.Inuzuka)
						F["Inuzuka"]<<x.Inuzuka
						F["Training"]<<x.Training
						F["Obediance"]<<x.Obediance
						F["SpeedTraining"]<<x.SpeedTraining
						F["Aggression"]<<x.Aggression
						F["Canine"]<<x.Canine
						F["SuperHearing"]<<x.SuperHearing
					if(x.Itohara)
						F["Itohara"]<<x.Itohara
					if(x.Iwazuka)
						F["Iwazuka"]<<x.Iwazuka
					if(x.Jinmetsu)
						F["Jinmetsu"]<<x.Jinmetsu
					if(x.Kagami)
						F["Kagami"]<<x.Kagami
					if(x.Kaguya)
						F["Kaguya"]<<x.Kaguya
						F["BoneMastery"]<<x.BoneMastery
						F["BoneArmor"]<<x.BoneArmor
						F["DanceMastery"]<<x.DanceMastery
						F["Underlayer"]<<x.Underlayer
						F["Terpsichorean"]<<x.Terpsichorean
					if(x.Kamizuru)
						F["Kamizuru"]<<x.Kamizuru
					if(x.Ketsueki)
						F["Ketsueki"]<<x.Ketsueki
						F["BloodManipulation"]<<x.BloodManipulation
						F["SealMastery"]<<x.SealMastery
						F["BloodFeast"]<<x.BloodFeast
						F["FeralRage"]<<x.FeralRage
						F["BloodClot"]<<x.BloodClot
						F["ThirstHold"]<<x.ThirstHold
					if(x.Kiri)
						F["Kiri"]<<x.Kiri
					if(x.Kiro)
						F["Kiro"]<<x.Kiro
					if(x.Kokaji)
						F["Kokaji"]<<x.Kokaji
					if(x.Kumojin)
						F["Kumojin"]<<x.Kumojin
						F["SpiderMastery"]<<x.SpiderMastery
						F["WebMastery"]<<x.WebMastery
						F["GoldenSpike"]<<x.GoldenSpike
					if(x.Kurama)
						F["Kurama"]<<x.Kurama
					if(x.Kusakin)
						F["Kusakin"]<<x.Kusakin
						F["GrassMastery"]<<x.GrassMastery
						F["Senju"]<<x.Senju
					if(x.Kyomou)
						F["Kyomou"]<<x.Kyomou
						F["AkametsukiMastery"]<<x.AkametsukiMastery
						F["ParticleMastery"]<<x.ParticleMastery
						F["Distortion"]<<x.Distortion
					if(x.Luna)
						F["Luna"]<<x.Luna
					if(x.Nara)
						F["Nara"]<<x.Nara
						F["ShadowManipulation"]<<x.ShadowManipulation
						F["ShadowReach"]<<x.ShadowReach
						F["ShadowStrength"]<<x.ShadowStrength
						F["ShadowMastery"]<<x.ShadowMastery
						F["ShadowLimit"]<<x.ShadowLimit
					if(x.Sabaku)
						F["Sabaku"]<<x.Sabaku
						F["SandMastery"]<<x.SandMastery
						F["AutoProtection"]<<x.AutoProtection
						F["Shukaku"]<<x.Shukaku
					if(x.Sarutobi)
						F["Sarutobi"]<<x.Sarutobi
					if(x.Satou)
						F["Satou"]<<x.Satou
					if(x.Shinto)
						F["Shinto"]<<x.Shinto
					if(x.Shiroi)
						F["Shiroi"]<<x.Shiroi
						F["SnowFall"]<<x.SnowFall
						F["IceRush"]<<x.IceRush
					if(x.Urase)
						F["Urase"]<<x.Urase
					if(x.Uchiha)
						F["Uchiha"]<<x.Uchiha
						F["UchihaMastery"]<<x.UchihaMastery
						F["SharinganMastery"]<<x.SharinganMastery
						F["gottenuchihacrest"]<<x.gottenuchihacrest
						F["CanGetMangekyo"]<<x.CanGetMangekyo
						F["mangekyouC"]<<x.mangekyouC
						F["MUses"]<<x.MUses
					if(x.Yamanaka)
						F["Yamanaka"]<<x.Yamanaka
					if(x.Yotsuki)
						F["Yotsuki"]<<x.Yotsuki
						F["Teamwork"]<<x.Teamwork
						F["Buffet"]<<x.Buffet
//Passives
					if(x.StaminaRegeneration)
						F["StaminaRegeneration"]<<x.StaminaRegeneration
					if(x.DurabilityMastery)
						F["DurabilityMastery"]<<x.DurabilityMastery
					if(x.Acceleration)
						F["Acceleration"]<<x.Acceleration
					if(x.RunningSpeed)
						F["RunningSpeed"]<<x.RunningSpeed
//Weapons
					if(x.ShurikenMastery)
						F["ShurikenMastery"]<<x.ShurikenMastery
					if(x.KunaiMastery)
						F["KunaiMastery"]<<x.KunaiMastery
					if(x.Percision)
						F["Percision"]<<x.Percision
					if(x.ThrowingStrength)
						F["ThrowingStrength"]<<x.ThrowingStrength
					if(x.SpeedDice)
						F["SpeedDice"]<<x.SpeedDice
					if(x.DeflectionZ)
						F["DeflectionZ"]<<x.DeflectionZ
//Ninjutsu
					if(x.NinjutsuKnowledge)
						F["NinjutsuKnowledge"]<<x.NinjutsuKnowledge
					if(x.NinjutsuMastery)
						F["NinjutsuMastery"]<<x.NinjutsuMastery
					if(x.ChakraArmor)
						F["ChakraArmor"]<<x.ChakraArmor
					if(x.HandsealsMastery)
						F["HandsealsMastery"]<<x.HandsealsMastery
					if(x.HandsealSpeed)
						F["HandsealSpeed"]<<x.HandsealSpeed
					if(x.Efficiency)
						F["Efficiency"]<<x.Efficiency
					if(x.WaterWalkingMastery)
						F["WaterWalkingMastery"]<<x.WaterWalkingMastery
//Genjutsu
					if(x.GenjutsuKnowledge)
						F["GenjutsuKnowledge"]<<x.GenjutsuKnowledge
					if(x.GenjutsuMastery)
						F["GenjutsuMastery"]<<x.GenjutsuMastery
					if(x.GenjutsuKai)
						F["GenjutsuKai"]<<x.GenjutsuKai
					if(x.GenjutsuSight)
						F["GenjutsuSight"]<<x.GenjutsuSight
//Taijutsu
					if(x.TaijutsuKnowledge)
						F["TaijutsuKnowledge"]<<x.TaijutsuKnowledge
					if(x.TaijutsuMastery)
						F["TaijutsuMastery"]<<x.TaijutsuMastery
					if(x.Swift)
						F["Swift"]<<x.Swift
					if(x.Rush)
						F["Rush"]<<x.Rush
					if(x.DoubleStrike)
						F["DoubleStrike"]<<x.DoubleStrike
					if(x.Focus)
						F["Focus"]<<x.Focus
					if(x.Reflex)
						F["Reflex"]<<x.Reflex
					if(x.Buff)
						F["Buff"]<<x.Buff
					if(x.Impenetrable)
						F["Impenetrable"]<<x.Impenetrable
					if(x.Penetration)
						F["Penetration"]<<x.Penetration
					if(x.Counter)
						F["Counter"]<<x.Counter
					if(x.CrossBlock)
						F["CrossBlock"]<<x.CrossBlock
					if(x.InitialGate)
						F["InitialGate"]<<x.InitialGate
					if(x.HealGate)
						F["HealGate"]<<x.HealGate
					if(x.LifeGate)
						F["LifeGate"]<<x.LifeGate
					if(x.WoundGate)
						F["WoundGate"]<<x.WoundGate
					if(x.LimitGate)
						F["LimitGate"]<<x.LimitGate
					if(x.ViewGate)
						F["ViewGate"]<<x.ViewGate
//Chakra Nature
					if(x.FireE)
						F["KatonKnowledge"]<<x.KatonKnowledge
						F["FireChakra"]<<x.FireChakra
						F["FireImmunity"]<<x.FireImmunity
						F["BurningPassion"]<<x.BurningPassion
						F["Pyromaniac"]<<x.Pyromaniac
						F["Melting"]<<x.Melting
						F["BlueFire"]<<x.BlueFire
						F["Cooldown"]<<x.Cooldown
						F["Magma"]<<x.Magma
					if(x.WaterE)
						F["SuitonKnowledge"]<<x.SuitonKnowledge
						F["WaterChakra"]<<x.WaterChakra
						F["WaterPressurex1"]<<x.WaterPressurex1
						F["WaterPressurex2"]<<x.WaterPressurex2
						F["WaterPressurex4"]<<x.WaterPressurex4
						F["WaterSpawn"]<<x.WaterSpawn
					if(x.LightningE)
						F["RaitonKnowledge"]<<x.RaitonKnowledge
						F["LightningChakra"]<<x.LightningChakra
						F["Static"]<<x.Static
						F["Electromagnetivity"]<<x.Electromagnetivity
					if(x.WindE)
						F["FuutonKnowledge"]<<x.FuutonKnowledge
						F["WindChakra"]<<x.WindChakra
					if(x.EarthE)
						F["DotonKnowledge"]<<x.DotonKnowledge
						F["EarthChakra"]<<x.EarthChakra
					if(x.EarthE&&x.WaterE&&x.Kusakin)
						F["WoodChakra"]<<x.WoodChakra
					if(x.WindE&&x.WaterE&&x.Shiroi)
						F["IceChakra"]<<x.IceChakra
//Pet System
					if(x.hasdog)
						F["hasdog"]<<x.hasdog
						F["PetName"]<<x.PetName
						F["PetsHappyness"]<<x.PetsHappyness

						F["PetsAge"]<<x.PetsAge
						F["PetAgeEXP"]<<x.PetAgeEXP

						F["PetsHealth"]<<x.PetsHealth
						F["PetsMHealth"]<<x.PetsMHealth

						F["PetsChakra"]<<x.PetsChakra
						F["PetsMChakra"]<<x.PetsMChakra

						F["PetsStamina"]<<x.PetsStamina
						F["PetsMStamina"]<<x.PetsMStamina

						F["PTai"]<<x.PTai
						F["PMTai"]<<x.PMTai
						F["PNin"]<<x.PNin
						F["PMNin"]<<x.PMNin
						F["PGen"]<<x.PGen
						F["PMGen"]<<x.PMGen

						F["SavedPetIcon"]<<x.SavedPetIcon
//Guild
					F["PermissionToStartSquad"]<<x.PermissionToStartSquad
					if(x.in_guild)
						F["in_guild"]<<x.in_guild
						F["guild_name"]<<x.guild_name

						F["guild_leader"]<<x.guild_leader
						F["guild_co_leader"]<<x.guild_co_leader
						F["guild_member"]<<x.guild_member
						F["guild_rank"]<<x.guild_rank
						F["in_guild"]<<x.in_guild
						F["party_count"]<<x.party_count

						F["guild_invite"]<<x.guild_invite
						F["guild_announce"]<<x.guild_announce
						F["guild_boot"]<<x.guild_boot
						F["guild_change_rank"]<<x.guild_change_rank

//Extras
					F["LeafVillagePermit"]<<x.LeafVillagePermit
					F["RockVillagePermit"]<<x.RockVillagePermit
					F["SoundVillagePermit"]<<x.SoundVillagePermit
					F["RainVillagePermit"]<<x.RainVillagePermit

					F["smission"]<<x.smission
					F["amission"]<<x.amission
					F["bmission"]<<x.bmission
					F["cmission"]<<x.cmission
					F["dmission"]<<x.dmission
					F["FailedMissions"]<<x.FailedMissions

					if(x.akatsukimember)
						F["akatsukimember"]<<x.akatsukimember
						F["akatsukileader"]<<x.akatsukileader
					if(x.soundmember)
						F["soundmember"]<<x.soundmember
						F["soundleader"]<<x.soundleader
					if(x.VillageCouncil)
						F["VillageCouncil"]<<x.VillageCouncil
					if(x.SoundOrganization)
						F["SoundOrganization"]<<x.SoundOrganization
					if(x.Anbu)
						F["Anbu"]<<x.Anbu

					F["LearnedAcademy"]<<x.LearnedAcademy
					F["HaveToReadBook"]<<x.HaveToReadBook
					F["ReadBook"]<<x.ReadBook
//////////////////////////////////Ect
					var/itemlist[]=new
					for(var/obj/o in x.contents)//this saves the contents as a list of types, if you want to save items
					//that are dynamic then you need to instead of this for statement use F["contents"]<<x.contents and in LoadMob
					//replace the While code that loads this list with F["contents"]>>x.contents This is really inefficient however
						itemlist+=o
					F["itemlist"]<<itemlist
					F["last_x"]<<savex
					F["last_y"]<<savey
					F["last_z"]<<savez
mob
	proc
		LoadPlayer()
			var/firstletter=copytext(src.ckey, 1, 2)
			if(fexists("Saves/[firstletter]/[src.ckey].sav"))
				var/savefile/F = new("Saves/[firstletter]/[src.ckey].sav")
				Read(F)
				src.client.perspective=MOB_PERSPECTIVE
				src.client.eye = src
				if(src.Inuzuka)
					for(var/mob/pet/P in src.contents)
						src.verbs += typesof(/mob/dogstuff/verb)
				if(src.GM)
					switch(input(src,"Do you want to announce your arrival?") in list("Yes","No"))
						if("Yes")
							world<<"<font size=1><font color=red><B>Info: <font color=white>[src.HandleName]([src.key]) has logged in."
						if("No")
							src<<"No one knows you logged in...woohoo!"
				else
					world<<"<font size=1><font color=red><B>Info: <font color=white>[src.HandleName]([src.key]) has logged in."
				src.loc = locate(xco,yco,zco)
				src.Savedspeed = 1
				src.Move_Delay = src.Savedspeed
				src.view=9
				client.view = src.view
				src.OOC = 1
				if(src.invisibility>0)
					src.invisibility=0
				src.cansave=1
				src.Updates()
				src.loggedin=1
				src.Frozen = 0
				src.sight &= ~BLIND
				src.Frozen2 = 0
				src.firing = 0
				src.resting = 0
				src.RuleGuide()
				winset(src,"Browser","is-visible=true")
				src.verbs+=typesof(/mob/GainedAfterLogIn/verb)
				src.AddHud()
				src.CHECK()
				src.HungerAd(src)
				src.ThirstAd(src)
				src.RegenerationProc()
				src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
				src.pixel_step_size=0
				src.controlled=null
				src.Normal()
				if(src.SecondName!="")
					src.name="[src.SecondName], [src.FirstName]"
				else
					src.name=src.FirstName
				var/X=300
				var/Nin=X*(src.NinSkill*0.01)
				var/Gen=X*(src.GenSkill*0.01)
				var/Tai=X*(src.TaiSkill*0.01)
				if(!Nin+Gen+Tai==300)
					X=300-(Nin+Gen+Tai);X=X/3
					Nin+=X;Gen+=X;Tai+=X

				src.Mtai=Tai;src.tai=Tai
				src.Mgen=Gen;src.gen=Gen
				src.Mnin=Nin;src.nin=Nin
				if(src.Trait2=="Super-Human Strength")
					src.Mtai=500;src.tai=src.Mtai
				src.AutoSave()
				src.Endurance=src.MEndurance
				src.density=1
				if(src.pafk)
					src<<"Come on, Be active in the game!"
					src.pafk = 0
				if(!src.target == null)
					src.DeleteTarget()
				//F.cd = "/[ckey]/[char_ckey]/"
				var/newx
				var/newy
				var/newz
				F["last_x"]>>newx
				F["last_y"]>>newy
				F["last_z"]>>newz
				src.loc=locate(newx,newy,newz)
				var/mob/x=src
				var/savex=x.x
				var/savey=x.y
				var/savez=x.z
/*				//all variables you wish to save go HERE, this is important.
				//F["variable_name"]<<x.variable_name
				//<---Add all new variable definitions here--->
				F["savedname"]>>x.savedname
				F["last_x"]>>savex
				F["last_y"]>>savey
				F["last_z"]>>savez
	//Stats
				F["maxhealth"]>>x.maxhealth
				F["health"]>>x.health
				F["HealthRegen"]>>x.HealthRegen
				F["StaminaRegen"]>>x.StaminaRegen

				F["chakra"]>>x.chakra
				F["Mchakra"]>>x.Mchakra
				F["ChakraC"]>>x.ChakraC
				F["ChakraColorR"]>>x.ChakraColorR
				F["ChakraColorB"]>>x.ChakraColorB
				F["ChakraColorG"]>>x.ChakraColorG

				F["stamina"]>>x.stamina
				F["maxstamina"]>>x.maxstamina

				F["hunger"]>>x.hunger
				F["thirst"]>>x.thirst

				F["NinSkill"]>>x.NinSkill
				F["TaiSkill"]>>x.TaiSkill
				F["GenSkill"]>>x.GenSkill

				F["FireE"]>>x.FireE
				F["WaterE"]>>x.WaterE
				F["LightningE"]>>x.LightningE
				F["EarthE"]>>x.EarthE
				F["WindE"]>>x.WindE
				F["Element"]>>x.Element
				F["ElementalCapacity"]>>x.ElementalCapacity

				F["TaijutsuStyle"]>>x.TaijutsuStyle
				F["MEndurance"]>>x.MEndurance
	//Profile
				F["FirstName"]>>x.FirstName
				F["SecondName"]>>x.SecondName
				F["HandleName"]>>x.HandleName
				F["TitleName"]>>x.TitleName
				F["savedname"]>>x.savedname
				F["Age"]>>x.Age
				F["AgeEXP"]>>x.AgeEXP
				F["Gender"]>>x.Gender

				if(x.halfb)
					F["halfb"]>>x.halfb

				if(x.ClanLeader)
					F["ClanLeader"]>>x.ClanLeader
				F["pafk"]>>x.pafk

				F["Village"]>>x.Village
				F["BeginningVillage"]>>x.BeginningVillage
				F["rank"]>>x.rank
				F["Yen"]>>x.Yen
				F["goldinbank"]>>x.goldinbank
				F["bounty"]>>x.bounty

				F["Oicon"]>>x.Oicon
				F["BaseR"]>>x.BaseR
				F["BaseG"]>>x.BaseG
				F["BaseB"]>>x.BaseB

				F["hair"]>>x.hair
				F["rhair"]>>x.rhair
				F["bhair"]>>x.bhair
				F["ghair"]>>x.ghair

				F["eye"]>>x.eye
				F["eye2"]>>x.eye2
				F["reye"]>>x.reye
				F["geye"]>>x.geye
				F["beye"]>>x.beye

				F["calories"]>>x.calories

				F["Trait"]>>x.Trait
				F["Trait2"]>>x.Trait2
				F["Trait3"]>>x.Trait3

				F["kills"]>>x.kills
				F["KRA"]>>x.KRA
				F["deaths"]>>x.deaths

				F["JutsuInLearning"]>>x.JutsuInLearning
				F["JutsuEXPCost"]>>x.JutsuEXPCost
				F["JutsuMEXPCost"]>>x.JutsuMEXPCost
				F["TypeLearning"]>>x.TypeLearning
				F["JutsuDelay"]>>x.JutsuDelay
				F["LearnedJutsus"]>>x.LearnedJutsus

				F["WeaponInRightHand"]>>x.WeaponInRightHand
				F["WeaponInLeftHand"]>>x.WeaponInLeftHand
	//Clans
				F["Clan"]>>x.Clan
				F["BasicN"]>>x.BasicN

				F["Aburame"]>>x.Aburame
				F["Akimichi"]>>x.Akimichi
				F["Fuuma"]>>x.Fuuma
				F["Hoshigaki"]>>x.Hoshigaki
				F["Kumojin"]>>x.Kumojin
				F["Hatake"]>>x.Hatake
				F["Hyuuga"]>>x.Hyuuga
				F["Inuzuka"]>>x.Inuzuka
				F["Itohara"]>>x.Itohara
				F["Iwazuka"]>>x.Iwazuka
				F["Jinmetsu"]>>x.Jinmetsu
				F["Kagami"]>>x.Kagami
				F["Kaguya"]>>x.Kaguya
				F["Kamizuru"]>>x.Kamizuru
				F["Ketsueki"]>>x.Ketsueki
				F["Kiri"]>>x.Kiri
				F["Kiro"]>>x.Kiro
				F["Kokaji"]>>x.Kokaji
				F["Kumojin"]>>x.Kumojin
				F["Kurama"]>>x.Kurama
				F["Kusakin"]>>x.Kusakin
				F["Kyomou"]>>x.Kyomou
				F["Luna"]>>x.Luna
				F["Nara"]>>x.Nara
				F["Sabaku"]>>x.Sabaku
				F["Sarutobi"]>>x.Sarutobi
				F["Satou"]>>x.Satou
				F["Shinto"]>>x.Shinto
				F["Shiroi"]>>x.Shiroi
				F["Urase"]>>x.Urase
				F["Uchiha"]>>x.Uchiha
				F["Yamanaka"]>>x.Yamanaka
				F["Yotsuki"]>>x.Yotsuki

				F["BugMastery"]>>x.BugMastery
				F["BugManipulation"]>>x.BugManipulation
				F["BugKeeper"]>>x.BugKeeper
				F["BugCapacity"]>>x.BugCapacity
				F["Feast"]>>x.Feast
				F["FeastStrength"]>>x.FeastStrength
				F["Konchuu"]>>x.Konchuu
				F["KekkaiHealth"]>>x.KekkaiHealth
				F["KekkaiCap"]>>x.KekkaiCap

				F["SizeMastery"]>>x.SizeMastery
				F["SizeCap"]>>x.SizeCap
				F["AkimichiSpirit"]>>x.AkimichiSpirit
		//					if(x.Fuuma)
				F["WeaponMaster"]>>x.WeaponMaster
				F["ChakraControl"]>>x.ChakraControl
				F["Survivability"]>>x.Survivability
				F["Awareness"]>>x.Awareness
				F["Reaction"]>>x.Reaction

				F["SpiderMastery"]>>x.SpiderMastery
				F["WebMastery"]>>x.WebMastery
				F["GoldenSpike"]>>x.GoldenSpike

				F["WhiteChakra"]>>x.WhiteChakra

		//				if(x.Hoshigaki)
				F["SamehadeAbsorbtion"]>>x.SamehadeAbsorbtion
				F["AttackFirstTalkLater"]>>x.AttackFirstTalkLater

				F["ByakuganMastery"]>>x.ByakuganMastery
				F["StanceMastery"]>>x.StanceMastery
				F["ChakraPercision"]>>x.ChakraPercision
				F["TenketsuAccuracy"]>>x.TenketsuAccuracy
				F["SensoryRange"]>>x.SensoryRange
				F["Rejection"]>>x.Rejection

				F["Training"]>>x.Training
				F["Obediance"]>>x.Obediance
				F["SpeedTraining"]>>x.SpeedTraining
				F["Aggression"]>>x.Aggression
				F["Canine"]>>x.Canine
				F["SuperHearing"]>>x.SuperHearing

		//				if(x.Itohara)

		//				if(x.Iwazuka)

		//				if(x.Jinmetsu)

		//				if(x.Kagami)

				F["BoneMastery"]>>x.BoneMastery
				F["BoneArmor"]>>x.BoneArmor
				F["DanceMastery"]>>x.DanceMastery
				F["Underlayer"]>>x.Underlayer
				F["Terpsichorean"]>>x.Terpsichorean

		//				if(x.Kamizuru)

				F["BloodManipulation"]>>x.BloodManipulation
				F["SealMastery"]>>x.SealMastery
				F["BloodFeast"]>>x.BloodFeast
				F["FeralRage"]>>x.FeralRage
				F["BloodClot"]>>x.BloodClot
				F["ThirstHold"]>>x.ThirstHold

		//				if(x.Kiri)

		//				if(x.Kiro)

		//				if(x.Kokaji)

		//		F["SpiderMastery"]>>x.SpiderMastery
				F["WebMastery"]>>x.WebMastery
				F["GoldenSpike"]>>x.GoldenSpike

		//		if(x.Kurama)

				F["GrassMastery"]>>x.GrassMastery
				F["Senju"]>>x.Senju

				F["AkametsukiMastery"]>>x.AkametsukiMastery
				F["ParticleMastery"]>>x.ParticleMastery
				F["Distortion"]>>x.Distortion

		//				if(x.Luna)

				F["ShadowManipulation"]>>x.ShadowManipulation
				F["ShadowReach"]>>x.ShadowReach
				F["ShadowStrength"]>>x.ShadowStrength
				F["ShadowMastery"]>>x.ShadowMastery
				F["ShadowLimit"]>>x.ShadowLimit

				F["SandMastery"]>>x.SandMastery
				F["AutoProtection"]>>x.AutoProtection
				F["Shukaku"]>>x.Shukaku

		//				if(x.Sarutobi)

		//				if(x.Satou)

		//				if(x.Shinto)

				F["SnowFall"]>>x.SnowFall
				F["IceRush"]>>x.IceRush

		//				if(x.Urase)

				F["UchihaMastery"]>>x.UchihaMastery
				F["SharinganMastery"]>>x.SharinganMastery
				F["gottenuchihacrest"]>>x.gottenuchihacrest
				F["CanGetMangekyo"]>>x.CanGetMangekyo
				F["mangekyouC"]>>x.mangekyouC
				F["MUses"]>>x.MUses

		//				if(x.Yamanaka)

				F["Teamwork"]>>x.Teamwork
				F["Buffet"]>>x.Buffet
	//Passives
				F["StaminaRegeneration"]>>x.StaminaRegeneration
				F["DurabilityMastery"]>>x.DurabilityMastery
				F["Acceleration"]>>x.Acceleration
				F["RunningSpeed"]>>x.RunningSpeed
	//Weapons
				F["ShurikenMastery"]>>x.ShurikenMastery
				F["KunaiMastery"]>>x.KunaiMastery
				F["Percision"]>>x.Percision
				F["ThrowingStrength"]>>x.ThrowingStrength
				F["SpeedDice"]>>x.SpeedDice
				F["DeflectionZ"]>>x.DeflectionZ
	//Ninjutsu
				F["NinjutsuKnowledge"]>>x.NinjutsuKnowledge
				F["NinjutsuMastery"]>>x.NinjutsuMastery
				F["ChakraArmor"]>>x.ChakraArmor
				F["HandsealsMastery"]>>x.HandsealsMastery
				F["HandsealSpeed"]>>x.HandsealSpeed
				F["Efficiency"]>>x.Efficiency
				F["WaterWalkingMastery"]>>x.WaterWalkingMastery
	//Genjutsu
				F["GenjutsuKnowledge"]>>x.GenjutsuKnowledge
				F["GenjutsuMastery"]>>x.GenjutsuMastery
				F["GenjutsuKai"]>>x.GenjutsuKai
				F["GenjutsuSight"]>>x.GenjutsuSight
	//Taijutsu
				F["TaijutsuKnowledge"]>>x.TaijutsuKnowledge
				F["TaijutsuMastery"]>>x.TaijutsuMastery
				F["Swift"]>>x.Swift
				F["Rush"]>>x.Rush
				F["DoubleStrike"]>>x.DoubleStrike
				F["Focus"]>>x.Focus
				F["Reflex"]>>x.Reflex
				F["Buff"]>>x.Buff
				F["Impenetrable"]>>x.Impenetrable
				F["Penetration"]>>x.Penetration
				F["Counter"]>>x.Counter
				F["CrossBlock"]>>x.CrossBlock
				F["InitialGate"]>>x.InitialGate
				F["HealGate"]>>x.HealGate
				F["LifeGate"]>>x.LifeGate
				F["WoundGate"]>>x.WoundGate
				F["LimitGate"]>>x.LimitGate
				F["ViewGate"]>>x.ViewGate
	//Chakra Nature
				if(x.FireE)
					F["KatonKnowledge"]>>x.KatonKnowledge
					F["FireChakra"]>>x.FireChakra
					F["FireImmunity"]>>x.FireImmunity
					F["BurningPassion"]>>x.BurningPassion
					F["Pyromaniac"]>>x.Pyromaniac
					F["Melting"]>>x.Melting
					F["BlueFire"]>>x.BlueFire
					F["Cooldown"]>>x.Cooldown
					F["Magma"]>>x.Magma
				if(x.WaterE)
					F["SuitonKnowledge"]>>x.SuitonKnowledge
					F["WaterChakra"]>>x.WaterChakra
					F["WaterPressurex1"]>>x.WaterPressurex1
					F["WaterPressurex2"]>>x.WaterPressurex2
					F["WaterPressurex4"]>>x.WaterPressurex4
					F["WaterSpawn"]>>x.WaterSpawn
				if(x.LightningE)
					F["RaitonKnowledge"]>>x.RaitonKnowledge
					F["LightningChakra"]>>x.LightningChakra
					F["Static"]>>x.Static
					F["Electromagnetivity"]>>x.Electromagnetivity
				if(x.WindE)
					F["FuutonKnowledge"]>>x.FuutonKnowledge
					F["WindChakra"]>>x.WindChakra
				if(x.EarthE)
					F["DotonKnowledge"]>>x.DotonKnowledge
					F["EarthChakra"]>>x.EarthChakra
				if(x.EarthE&&x.WaterE&&x.Kusakin)
					F["WoodChakra"]>>x.WoodChakra
				if(x.WindE&&x.WaterE&&x.Shiroi)
					F["IceChakra"]>>x.IceChakra
	//Pet System
				F["hasdog"]>>x.hasdog
				if(x.hasdog)
					F["PetName"]>>x.PetName
					F["PetsHappyness"]>>x.PetsHappyness

					F["PetsAge"]>>x.PetsAge
					F["PetAgeEXP"]>>x.PetAgeEXP

					F["PetsHealth"]>>x.PetsHealth
					F["PetsMHealth"]>>x.PetsMHealth

					F["PetsChakra"]>>x.PetsChakra
					F["PetsMChakra"]>>x.PetsMChakra

					F["PetsStamina"]>>x.PetsStamina
					F["PetsMStamina"]>>x.PetsMStamina

					F["PTai"]>>x.PTai
					F["PMTai"]>>x.PMTai
					F["PNin"]>>x.PNin
					F["PMNin"]>>x.PMNin
					F["PGen"]>>x.PGen
					F["PMGen"]>>x.PMGen
					F["SavedPetIcon"]>>x.SavedPetIcon
	//Guild
				F["PermissionToStartSquad"]>>x.PermissionToStartSquad
				F["in_guild"]>>x.in_guild
				if(x.in_guild)
					F["guild_name"]>>x.guild_name

					F["guild_leader"]>>x.guild_leader
					F["guild_co_leader"]>>x.guild_co_leader
					F["guild_member"]>>x.guild_member
					F["guild_rank"]>>x.guild_rank
					F["in_guild"]>>x.in_guild
					F["party_count"]>>x.party_count

					F["guild_invite"]>>x.guild_invite
					F["guild_announce"]>>x.guild_announce
					F["guild_boot"]>>x.guild_boot
					F["guild_change_rank"]>>x.guild_change_rank

	//Extras
				F["LeafVillagePermit"]>>x.LeafVillagePermit
				F["RockVillagePermit"]>>x.RockVillagePermit
				F["SoundVillagePermit"]>>x.SoundVillagePermit
				F["RainVillagePermit"]>>x.RainVillagePermit

				F["smission"]>>x.smission
				F["amission"]>>x.amission
				F["bmission"]>>x.bmission
				F["cmission"]>>x.cmission
				F["dmission"]>>x.dmission
				F["FailedMissions"]>>x.FailedMissions

				F["akatsukimember"]>>x.akatsukimember
				F["akatsukileader"]>>x.akatsukileader
				F["soundmember"]>>x.soundmember
				F["soundleader"]>>x.soundleader
				F["VillageCouncil"]>>x.VillageCouncil
				F["SoundOrganization"]>>x.SoundOrganization
				F["Anbu"]>>x.Anbu

				F["LearnedAcademy"]>>x.LearnedAcademy
				F["HaveToReadBook"]>>x.HaveToReadBook
				F["ReadBook"]>>x.ReadBook
	//////////////////////////////////Ect	var/list/itemlist
				var/list/itemlist
				F["itemlist"]>>itemlist
				F["last_x"]<<savex
				F["last_y"]<<savey
				F["last_z"]<<savez*/*/


client/var/tmp/Creating=0


mob
	proc
		DeleteChar()
			if(!src.client)
				return
			var/firstletter=copytext(src.ckey, 1, 2)
			if(fexists("Saves/[firstletter]/[src.ckey].sav"))
				var/sure=alert(src,"Tem certeza de que deseja apagar o seu personagem?","Confirmar","Sim","Não")
				if(sure=="Sim")
					sleep(0)
					src<<sound('SFX/click1.wav',0)
					fdel("Saves/[firstletter]/[src.ckey].sav")
					src << "Personagem deletado"
				else
					src << "Deletação Cancelada '[src.key].sav'"
					src<<sound('SFX/click2.wav',0)
			else
				src<< "Você não tem uma save nesse servidor."
				src<<sound('SFX/click2.wav',0)
client
	Del()
		..()
		del(mob)
		return ..()