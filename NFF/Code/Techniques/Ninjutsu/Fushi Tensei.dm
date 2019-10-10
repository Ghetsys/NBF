mob/var/ImplantLimit=0
mob/var/tmp/UseFushi=0
mob/proc
	FushiTensei(mob/M)

		if(src.knockedout)
			return
		if(src.Age<=src.AgeCounter+2)
			src<<"You must wait until it has been two years from the last time you used this jutsu!"
		else
			if(get_dist(src,M)<=2)
				if(M.Age<15)
					src<<"You must find a mature body to steal.."
					return
				src<<"You cast the Fushi Tensei Jutsu! Quick, struggle to pull their soul out!"
				src.AgeCounter=src.Age
				src.SaveK()
				src.Frozen=1
				src.ImmuneToDeath=1;M.ImmuneToDeath=1
				M<<"You feel something terribly wrong! [src] is trying to pull your soul out!"
				src.Struggle=0;M.Struggle=0
				spawn(300)
					src.Frozen=0;src.ImmuneToDeath=0;M.ImmuneToDeath=0
					if(src.Struggle>M.Struggle)
						src<<"You have stolen [M]'s body!"
						M<<"You feel your soul being stored inside of [src]'s mind!"
						M.health=0
						M.knockedout=1
						M.icon_state="dead"
						M.DeathStruggle(src,1)
						CheckClan()
						src.FirstName=M.FirstName
						src.SecondName=M.SecondName
						src.NinSkill=M.NinSkill
						src.TaiSkill=M.TaiSkill
						src.GenSkill=M.GenSkill
						src.Village=M.Village
						src.blood=M.blood
						src.thirst=M.thirst
						src.hunger=M.hunger
						src.VillageCouncil=M.VillageCouncil
						src.IronGateMember=M.IronGateMember
						src.Anbu=M.Anbu
						src.HunterNinMember=M.HunterNinMember
						src.Trait=M.Trait
						src.Trait2=M.Trait2
						src.Bijuu=M.Bijuu
						src.BijuuMastery=M.BijuuMastery
						src.Age=M.Age
						src.maxhealth=M.maxhealth
						src.maxstamina=M.maxstamina
						src.Mchakra=M.Mchakra
						src.DeclineAge=M.DeclineAge
						for(var/obj/SkillCards/CursedSealActivation/A in src.LearnedJutsus)
							del(A)
						for(var/obj/SkillCards/RinneganActivate/A in src.LearnedJutsus)
							del(A)
						for(var/obj/SkillCards/OneMangekyo/A in src.LearnedJutsus)
							del(A)
						for(var/obj/SkillCards/OneEternalMangekyo/A in src.LearnedJutsus)
							del(A)
						src.mangekyouC=M.mangekyouC
						src.Clan=M.Clan
						src.CanGetMangekyo=M.CanGetMangekyo
						src.LearnedJutsus+=M.LearnedJutsus
						src.Doujutsu=M.Doujutsu
						src.HasLeftEye=M.HasLeftEye
						src.HasRightEye=M.HasRightEye
						src.MUses=M.MUses
						src.icon=M.icon
						src.contents+=M.contents
						src.overlays-=src.overlays
						src.overlays+=M.overlays
						src.BugMastery=M.BugMastery;src.BugManipulation=M.BugManipulation;src.BugKeeper=M.BugKeeper
						src.BugCapacity=M.BugCapacity;src.Feast=M.Feast;src.KekkaiHealth=M.KekkaiHealth;src.KekkaiCap=M.KekkaiCap

						src.SizeMastery=M.SizeMastery;src.SizeCap=M.SizeCap;src.AkimichiSpirit=M.AkimichiSpirit

						src.WeaponMaster=M.WeaponMaster;src.ChakraControl=M.ChakraControl
						src.Survivability=M.Survivability;src.Awareness=M.Awareness;src.Reaction=M.Reaction

						src.SnowFall=M.SnowFall;src.IceRush=M.IceRush

						src.samehadeChakaraDrain=M.samehadeChakaraDrain;src.samehadeThrowingStrength=M.samehadeThrowingStrength
						src.samehadeStrength=M.samehadeStrength;src.samehadeQuest=M.samehadeQuest
						src.samehadeUnleash=M.samehadeUnleash;src.samehadeChakara=M.samehadeChakara
						src.samehadeEquipped=M.samehadeEquipped;src.SamehadeAbsorbtion=M.SamehadeAbsorbtion
						src.AttackFirstTalkLater=M.AttackFirstTalkLater

						src.ByakuganMastery=M.ByakuganMastery;src.StanceMastery=M.StanceMastery;src.ChakraPercision=M.ChakraPercision
						src.TenketsuAccuracy=M.TenketsuAccuracy;src.SensoryRange=M.SensoryRange;src.Rejection=M.SensoryRange

						src.Training=M.Training;src.Obediance=M.Obediance;src.SpeedTraining=M.SpeedTraining
						src.Aggression=M.Aggression;src.Canine=M.Canine;src.SuperHearing=M.SuperHearing

						src.ExplosiveMastery=M.ExplosiveMastery;src.ClayMastery=M.ClayMastery;src.KibakuAbilities=M.KibakuAbilities

						src.BoneMastery=M.BoneMastery;src.BoneArmor=M.BoneArmor;src.DanceMastery=M.DanceMastery
						src.Underlayer=M.Underlayer;src.Terpsichorean=M.Terpsichorean

						src.BloodFeast=M.BloodFeast;src.FeralRage=M.FeralRage;src.BloodManipulation=M.BloodManipulation
						src.SealMastery=M.SealMastery;src.BloodClot=M.BloodClot;src.ThirstHold=M.ThirstHold

						src.SpiderMastery=M.SpiderMastery;src.WebMastery=M.WebMastery;src.GoldenSpike=M.GoldenSpike

						src.GrassMastery=M.GrassMastery;src.Senju=M.Senju

						src.ShadowManipulation=M.ShadowManipulation;src.ShadowReach=M.ShadowReach;src.ShadowStrength=M.ShadowStrength
						src.ShadowMastery=M.ShadowMastery;src.ShadowLimit=M.ShadowLimit;src.ShadowKnowledge=M.ShadowKnowledge

						src.SandMastery=M.SandMastery;src.AutoProtection=M.AutoProtection;src.Shukaku=M.Shukaku

						src.Teamwork=M.Teamwork;src.Buffet=M.Buffet

						src.SharinganMastery=M.SharinganMastery
						src.UchihaMastery=M.UchihaMastery
						//Basic Passives
						src.StaminaRegeneration=M.StaminaRegeneration;src.Acceleration=M.Acceleration;src.RunningSpeed=M.RunningSpeed
						if(src.FireE==0)
							src.FireE=M.FireE
						if(src.WaterE==0)
							src.WaterE=M.WaterE
						if(src.WindChakra==0)
							src.WindE=M.WindE
						if(src.LightningE==0)
							src.LightningE=M.LightningE
						if(src.EarthE==0)
							src.EarthE=M.EarthE
						src.WoodChakra=M.WoodChakra
						src.IceChakra=M.IceChakra
						//Weapon Passives
						src.ThrowingStrength=M.ThrowingStrength
						src.SpeedDice=M.SpeedDice;src.DeflectionZ=M.DeflectionZ;src.Kenjutsu=M.Kenjutsu;src.Bojutsu=M.Bojutsu
						src.SlashStrength=M.SlashStrength;src.VitalSlash=M.VitalSlash
						//Ninjutsu Passives
						src.HandsealSpeed=M.HandsealSpeed
						src.OneHandedSeals=M.OneHandedSeals;src.HandsealAgility=M.HandsealAgility
						src.ChakraArmor=M.ChakraArmor;src.WaterWalkingMastery=M.WaterWalkingMastery
						//Taijutsu Passives
						src.Swift=M.Swift;src.Rush=M.Rush;src.DoubleStrike=M.DoubleStrike
						src.reflexNew=M.reflexNew;src.Buff=M.Buff;src.Impenetrable=M.Impenetrable

						M.remaking=1
						M.SaveK()
						sleep(20)
						M<<"Your soul has been released and you will be reincarnated. To begin this process, reconnect to the game and select Load."
						DeadPeople+=M.key
						del(M)
						return
					else
						src<<"The jutsu failed! [M] managed to resist your pull on their soul!"
						return
			else
				src<<"You need to target someone closer to you to activate the fuuinjutsu!"
				return



	CheckClan()
		if(src.Clan=="Uchiha")
			for(var/obj/SkillCards/Sharingan/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SharinganCopy/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/GenjutsuCounter/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kasegui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Konsui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Mangekyo/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/EternalMangekyo/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Aburame")
			for(var/obj/SkillCards/SummonKonchuu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/UnsummonKonchuu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/PlaceBug/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/UnPlaceBug/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KonchuuTracking/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KikkaichuDrain/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KekkaiSheild/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/MushiDama/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KekkaiKonchuuBunshin/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KekkaiArashi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/NanoMite1/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/NanoMite2/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/NanoMite3/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/NanoMite4/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/NanoMite5/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Akimichi")
			for(var/obj/SkillCards/Baika/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Nikudan/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/BubunBaika/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Shiroi")
			for(var/obj/SkillCards/SensatsuSuishou/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/ISawarabi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/MakyouHyoushou/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SnowShuriken/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Hoshigaki")
			for(var/obj/SkillCards/SamehadeReturn/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Hyuuga")
			for(var/obj/SkillCards/Byakugan/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Range/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kaiten/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KaitenKizu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Rokujuu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Hyakuni/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/TenketsuHagemi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kuusho/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Inuzuka")
			for(var/obj/SkillCards/Shikyaku/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/BeastClaws/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/JuujinBunshin/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Tsuuga/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Gatsuuga/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/ExplodingPuppy/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/DoubleHeadedWolf/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Garouga/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Iwazuka")
			for(var/obj/SkillCards/Katsu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SetLeftHand/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SetRightHand/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/C1/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/C2/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/C3/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/C4/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Clay_Carrier/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Kaguya")
			for(var/obj/SkillCards/Yanagi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/TenshiSendan/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Tsubaki/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Karamatsu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Ibara/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/BoneMembrane/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Tessenka/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/ArmBone/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Sawarabi/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Kiro")
			for(var/obj/SkillCards/ShurikenSoujuu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/ChakraShuriken/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SpiralStar/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SpiralStarProjectile/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/ShurikenSmithyJutsu/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Ketsueki")
			for(var/obj/SkillCards/firstSeal/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/secondSeal/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/thirdSeal/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/fourthSeal/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KetsuekiBunshin/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Feast/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Kumojin")
			for(var/obj/SkillCards/Kumosouiki/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SpiderSummon/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kumoshibari/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kumosouka/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/NenkinYoroi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Nenkin/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kumosenkyuu/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Kusakin")
			for(var/obj/SkillCards/Kamisoriha/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Tsutakei/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KusaBushi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kusahayashi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/MokuShouheki/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/JukaiKoutan/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/WoodSpikes/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Kyomou")
			for(var/obj/SkillCards/Akametsuki/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Nara")
			for(var/obj/SkillCards/KageShibari/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KageMane/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KageKubiShibari/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KageNui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/KageHara/A in src.LearnedJutsus)
				del(A)
		if(src.Clan=="Sabaku")
			for(var/obj/SkillCards/SunaTate/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Sandeye/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SunaBunshin/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SunaSoujou/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SabakuKyuu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SabakuSousou/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/BakuryuRyusa/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SunaShuriken/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SabakuTaisou/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SandArm/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SandSphere/A in src.LearnedJutsus)
				del(A)

	HideIdentity()
		if(src.FaceChange>=1)
			src<<"You must wait to use this jutsu again."
		else
			src.FaceChange=3
			var/village=input(src,"What village to you wish to infiltrate?","Village")
			src.Village=village
			var/characterfirstname=input(src,"What is your first name?","Name")
			src.FirstName=characterfirstname
			//Last Name
			switch(input(src,"Do you have a Last name?",text) in list ("Yes","No"))
				if("Yes")
					var/charactersecondname=input(src,"What is your last name?","Name")
					src.SecondName=charactersecondname
					return
				if("No")
					src.SecondName=""
					return

	ImplantDNA()
		if(src.ImplantWait>=1)
			src<<"You must wait to use this jutsu again.";return
		if(src.ImplantLimit==2)
			src<<"You can no longer use this jutsu.";return
		else
			src.ImplantLimit+=1
			src.ImplantWait=5
			var/clan=input(src,"What Clans DNA would you like to implant into yourself, be careful of what you choose, this jutsu can only be used twice.","DNA Implant")
			src.Clan=clan







	FushiRebirth()
		var/True=0
//	var/Skillpoints=0
		for(var/mob/M in world)
			if(M.name == "[src.name]'s corpse")
				src<<"Because your body escaped harm, the gods have decided to return you to life!"
				True=1
		if(src.Age<15)
			src<<"The gods have decided you were too young to be stolen away from the world and thus have ressurected you and your body."
			True=1
		if(True&&!src.remaking)
			src.VariablesTakeAway()
			src.GotoVillageHospital()
			return
		else if(!True&&!src.remaking)
			src<<"Your body has been destroyed and you are now dead, but the gods like their solitude and have decided to reincarnate you."
			world<<"<font color=#8b0000>[src] has been murdered by [src.killer].</font>"
			src.remaking=1
			src.SaveK()
			sleep(20)
			src<<"To being the reincarnation process, reconnect to the game, and select Load."
			DeadPeople+=src.key
			del(src)
		if(src.remaking)
			src<<"However, the gods have decided to bless you with some 'perks' this time around..You will automatically start with any element you choose as well as 60 Elemental Points and extra Starting Points. You'll also begin with 50 knowledge in your dominant stat, and have 20,000 Ryo."
			src<<"<font size=2>(If you log out before this process is over, you'll have to make a new character without the benefits listed here.)</font>"
			src.Yen=20000
			src.StartingPoints=60;src.ElementalPoints=60
			src.loc=locate(170,170,1)
			PickVillage
			var/Village=input(src,"Which Village do you want to be born in?") in list("Leaf","Rock","Rain","Sound")
			if(Village=="Leaf")
				src.Village="Leaf"
				var/Clan=input(src,"Alright, now which clan do you want to be born into?") in list("Hyuuga","Aburame","Inuzuka","Nara","Akimichi","Kusakin","Basic","Cancel")
				if(Clan=="Cancel")
					goto PickVillage
				else
					src.Clan=Clan
					if(Clan=="Hyuuga") src.Clan="Hyuuga"
					if(Clan=="Aburame") src.Clan="Aburame"
					if(Clan=="Inuzuka") src.Clan="Inuzuka"
					if(Clan=="Nara") src.Clan="Nara"
					if(Clan=="Akimichi") src.Clan="Akimichi"
					if(Clan=="Kusakin") src.Clan="Kusakin"
			if(Village=="Rock")
				src.Village="Rock"
				var/Clan=input(src,"Alright, now which clan do you want to be born into?") in list("Sabaku","Iwazuka","Satou","Kiro","Basic","Cancel")
				if(Clan=="Cancel")
					goto PickVillage
				else
					src.Clan=Clan
					if(Clan=="Sabaku") src.Clan="Sabaku"
					if(Clan=="Iwazuka") src.Clan="Iwazuka"
					if(Clan=="Satou") src.Clan="Satou"
					if(Clan=="Kiro") src.Clan="Kiro"
			if(Village=="Rain")
				src.Village="Rain"
				var/Clan=input(src,"Alright, now which clan do you want to be born into?") in list("Shiroi","Fuuma","Hoshigaki","Kyomou","Ketsueki","Basic","Cancel")
				if(Clan=="Cancel")
					goto PickVillage
				else
					src.Clan=Clan
					if(Clan=="Shiroi") src.Clan="Shiroi"
					if(Clan=="Fuuma") src.Clan="Fuuma"
					if(Clan=="Hoshigaki") src.Clan="Hoshigaki"
					if(Clan=="Kyomou") src.Clan="Kyomou"
					if(Clan=="Ketsueki") src.Clan="Ketsueki"
			if(Village=="Sound")
				src.Village="Sound"
				var/Clan=input(src,"Alright, now which clan do you want to be born into?") in list("Kaguya","Uchiha","Kumojin","Yotsuki","Basic","Cancel")
				if(Clan=="Cancel")
					goto PickVillage
				else
					src.Clan=Clan
					if(Clan=="Kaguya") src.Clan="Kaguya"
					if(Clan=="Uchiha") src.Clan="Uchiha"
					if(Clan=="Kumojin") src.Clan="Kumojin"
					if(Clan=="Yotsuki") src.Clan="Yotsuki"
			var/sk = 50+(rand(5,10))
			var/TotalPoints=sk
			Skill
			sk=TotalPoints
			src.StartingPoints=sk
			alert(src,"Time to choose your Potential. Your Potential determines your stats and pretty much what you can do. Divide them wisely (this will determine the amount of damage you can inflict for a lot of things among others.)")
			var/b = input(src,"What is your Physique? This will determine your damaged inflicted by physical attacks, and your overall Physical abilities(such as stamina.): 40 is the maximum you can use on this skill, 5 is the minimum, and you have a total of [sk] points left.",) as num
			if(b<5)
				b=5
			if(b>40)
				b = 40
			if(b>sk)
				src<<"Nope, sorry you've used up too much of your Skill Points, start over."
				goto Skill
			sk -= b
			src.TaiSkill = b
			//////////////////////////
			var/c=input(src,"What is your Chakra Capacity? Your Chakra Capacity is the intensity of your chakra, thus the more of this you have the more damage your initial techniques involving chakra will perform and the maximum chakra you have.: 40 is the maximum you can use on this skill, 5 is the minimum, and you have a total of [sk] points left.",) as num
			if(c<5)
				c=5
			if(c>40)
				c = 40
			if(c>sk)
				src<<"Nope, sorry you've used up too much of your Skill Points, start over."
				goto Skill
			sk -= c
			src.NinSkill = c
				//////////////////////////
			var/d = input(src,"What is your Chakra's Control? This stat is much different from your Chakra Control as it is your Chakra's Controlling nature. This determines things involving control over your enemy such as Genjutsu since it involves controlling your opponent's chakra.: 40 is the maximum you can use on this skill, 5 is the minimum, and you have a total of [sk] points left.",) as num
			if(d<5)
				d=5
			if(d>40)
				d = 40
			if(d>sk)
				src<<"Nope, sorry you've used up too much of your Skill Points, start over."
				goto Skill
			sk -= d
			src.GenSkill = d
			switch(input(usr,"You have [usr.TaiSkill] Physical Potential, [usr.NinSkill] Capacity Potential, and [usr.GenSkill] Controlling Potential with [sk] Starting Points remaining. Is This correct?",) in list ("Yes","No"))
				if("No")
					goto Skill
			src.StartingPoints=sk
			if((src.GenSkill+src.NinSkill+src.TaiSkill+src.StartingPoints)!=TotalPoints)
				usr<<"Something went wrong in the creation process. Please try again."
				goto Skill
			var/list/L
			L=list("Fire","Water","Wind","Earth","Lightning")
			if(src.Element==""||!src.Element)
				src.Element=input(src,"What Element do you want to start off with?") in L
			if(src.Clan=="Shiroi")
				src<<"Shiroi's automatically start off with both Water and Wind"
				src.Element="Water";src.WaterE=1;src.WindE=1
			if(src.Clan=="Yogan")
				src<<"Yogan já começa com os elementos Katon e Doton"
				src.Element="Katon";src.FireE=1;src.EarthE=1
				src.WaterE=0;src.WindE=0;src.LightningE=0
			else if(src.Clan=="Kusakin")
				src<<"Kusakin's automatically start off with both Earth and Water"
				src.EarthE=1;src.WaterE=1;src.Element="Earth"
				src.FireE=0;src.WindE=0;src.LightningE=0
			else
				if(src.Element=="Fire")
					src.FireE=1
				if(src.Element=="Water")
					src.WaterE=1
				if(src.Element=="Lightning")
					src.LightningE=1
				if(src.Element=="Wind")
					src.WindE=1
				if(src.Element=="Earth")
					src.EarthE=1
			src.ElementalCapacity=5
			if(src.Clan=="Kyomou")
				src.ChakraColorR=180;src.ChakraColorG=0;src.ChakraColorB=0
			else
				src.ChakraColorR=100;src.ChakraColorG=100;src.ChakraColorB=255
			src.ChakraC=rand(50,75)
			if(prob(25))
				var/choice=rand(1,3)
				if(choice==1)
					src.TaiSkill+=5
				if(choice==2)
					src.NinSkill+=5
				if(choice==3)
					src.GenSkill+=5
			var/B=rand(1,500)
			if(B==1)
				src.Trait2="Super Taijutsu"
				src.TaiSkill+=15
			if(B==2)
				src.Trait2="Super Ninjutsu"
				src.NinSkill+=15
			if(B==3)
				src.Trait2="Super Genjutsu"
				src.GenSkill+=15
			if(B==4)
				src.Trait2="Super Human Strength"
				src.TaiSkill+=5
			if(B==5)
				src.Trait2="Super Human Regeneration"
			if(src.Clan=="Uchiha")
				if(prob(50))
					src.CanGetMangekyo=1
					var/ASA=list("kakashi","itachi","madara","sasuke","star","6 point","gridlock","shuriken")
					var/Mangekyo=pick(ASA);src.mangekyouC=Mangekyo
			src.HealthRegen=rand(5,15);src.StaminaRegen=rand(10,20)
			if(src.Trait=="Tough")
				src.HealthRegen+=rand(2,5)
				src.StaminaRegen=rand(2,5)
			/*if(src.Trait2=="Super Human Regeneration")
				if(src.deathcount<=1)
					src.deathcount-=rand(1,3)
				src.HealthRegen+=rand(70,100)*/
			if(src.Clan=="Iwazuka")
				src.LearnedJutsus+= new /obj/SkillCards/Katsu
				src.LearnedJutsus+= new /obj/SkillCards/SetLeftHand
				src.LearnedJutsus+= new /obj/SkillCards/SetRightHand
			src.BoyOrGirl()
			src.GoToThingy()
			src.NameChoose()
			src.cansave=1
			src.OOC=1
			src.desc=""
			//src.Move_Delay=src.Savedspeed
			src.view=9
			src.OOC = 1
			src.cansave=1
	//		src.Updates()
			src.loggedin=1
			src.Frozen = 0
			src.sight &= ~BLIND
			src.FrozenBind = ""
			src.firing = 0
			src.resting = 0
	//		src.RuleGuide()
			src.verbs+=typesof(/mob/GainedAfterLogIn/verb)
			spawn()
				src.AddHud()
				src.HungerAd()
				src.Huds()
				src.ThirstAd()
				src.RegenerationProc()
			src.maxhealth=1500;src.health=src.maxhealth
			src.maxstamina=src.TaiSkill*150
			if(src.maxstamina>7000)
				src.maxstamina=7000
			src.stamina=src.maxstamina
			src.Mchakra=src.NinSkill*200
			if(src.Mchakra>10000)
				src.Mchakra=10000
			src.chakra=src.Mchakra
			if(src.Clan=="Aburame")
				src.Mchakra=rand(900,2000);src.chakra=src.Mchakra
			if(src.Clan=="Hoshigaki")
				src.Mchakra=rand(7000,10000);src.chakra=src.Mchakra
			if(src.TaiSkill>src.NinSkill&&src.TaiSkill>src.GenSkill)
				src.TaijutsuKnowledge=50
				src.TaijutsuMastery=5
				src.Acceleration=2.5
				src.Swift=3
				src.DoubleStrike=5
			if(src.NinSkill>src.TaiSkill&&src.NinSkill>src.GenSkill)
				src.NinjutsuKnowledge=50
				src.NinjutsuMastery=5
				src.WaterWalkingMastery=5
				src.HandsealsMastery=3
				src.HandsealSpeed=20
			if(src.GenSkill>src.TaiSkill&&src.GenSkill>src.NinSkill)
				src.GenjutsuKnowledge=50
				src.GenjutsuSight=5
				src.GenjutsuKai=1
				src.ChakraC=rand(75,100)
			if(src.Trait2=="Super Genjutsu")
				src.ChakraC=rand(90,100)
			if(src.Clan=="Aburame")
				src.loc=locate(156,150,1)
			else if(src.Clan=="Akimichi")
				src.loc=locate(156,150,1)
			else if(src.Clan=="Fuuma")
				src.loc=locate(144,170,6)
			else if(src.Clan=="Hoshigaki")
				src.loc=locate(152,125,6)
			else if(src.Clan=="Hyuuga")
				src.loc=locate(156,150,1)
			else if(src.Clan=="Nara")
				src.loc=locate(156,150,1)
			else if(src.Clan=="Kusakin")
				src.loc=locate(156,150,1)
	//Sound
			else if(src.Clan=="Uchiha")
				src.loc=locate(46,51,21)
			else if(src.Clan=="Kumojin")
				src.loc=locate(121,38,21)
			else if(src.Clan=="Kaguya")
				src.loc=locate(98,43,21)
			else
				if(src.Village=="Leaf")
					src.loc=locate(156,150,1)
				if(src.Village=="Rain")
					src.loc=locate(82,100,6)
				if(src.Village=="Sound")
					src.loc=locate(119,130,4)
				if(src.Village=="Rock")
					src.loc=locate(46,172,14)
			for(var/mob/M in world)
				if(M.Village==usr.Village)
					M<<"<font color = #BB0EDA>Village Information:</font> [usr] has become a Genin of the village!"
			src.rank ="Genin"
			src.score=0
			var/obj/Clothes/Headband/BAA=new();BAA.loc=src
			src<<"You were given a couple of items to start your Genin career."
			var/obj/BonusScrolls/CoolDown/D=new();D.ammount=10;D.loc=src
			var/obj/BonusScrolls/EXP/EXPSCROLL=new();EXPSCROLL.ammount=10;EXPSCROLL.loc=src
			var/obj/BonusScrolls/Knowledge_Scroll/F=new();F.ammount=10;F.loc=src//
			//src << "To appologize for the recent, accidental wipes caused by an unfortunate bug, you've been given a Knowledge Boosting scroll. ~The Owners"

			src.CanNavigate=1
			if(src.Clan=="Uchiha")
				var/obj/Clothes/Uchiha_Crest/C = new()
				C.loc = src
				src.gottenuchihacrest=1
				src<<"You've been given an Uchiha Crest Symbol to place on your clothing and show your clan pride."
			var/obj/WEAPONS/Kunai/AAA=new();AAA.ammount=10;AAA.loc=src
			var/obj/WEAPONS/Shuriken/C=new();C.ammount=10;C.loc=src
			src.pixel_step_size=0
			src.controlled=null
			src.remaking=0
			src.Normal()
			src.CHECK()
			src.AutoSave()