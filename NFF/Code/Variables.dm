mob/var/tmp/ServerMessage=0
mob/var/Doujutsu="" //<-- Use only for implanted Doujutsus.
mob/var/list/namesknown[0]
////////////////////////////////////////////
//Stats
mob/var/CBleeding=0
mob/var/ImportPermission=0
obj/var/tmp/controllable=0
mob/var/ContractSummon=""
mob/var/tmp/keyvar=""
mob/var/Yonkami=0
mob/var/tmp/resting=0
mob/var/tmp/EnduranceAddOn=0
mob/var/tmp/Opponent=""//<-- text version of their opponent's ckey variable. Used for automatic tournaments.
mob/var
//Voice System
	Voice
	ScreenX=25
	ScreenY=25
	OriginalX=25
	OriginalY=25
//////////////
	RB=0//knigts org
	GottenChuunin=0
	FireWeaponEnhance=0
	GottenJounin=0
	tmp/CoroOn=0
	DeclineAge=0
	HyuugaClanBranch=""
	SenbonAim="Feet"
	InDojo=0
	tmp/GravityChange=0
	tmp/PoisonOn=0
	tmp/UnderWater=""
	tmp/BloodLust=0
	tmp/Kochou=0
	tmp/FuuinControl=0
	tmp/FuuinControlled=0
	tmp/FiveElementSeal=0
	tmp/Poisoned=0
	tmp/UsingPoison=0
	tmp/SatouDrunk=0
	tmp/HoshiAutoRun=0
	tmp/CE=0
	tmp/DotonSpear=0
	tmp/DotonArmor=0
	tmp/BodyFlickerFlight=0
	tmp/ChakraSense=0
	tmp/ConversusinEye=0
	tmp/ConversusinSecondStage=0
	tmp/MassMurderer=0
	ConversusinSecondStageMastery=0
	ConversusinMastery=0
	chakra=1000
	Mchakra=1000
	FirstElement=1
	MajesticMastery=0
	ChakraPool=3000
	MaxChakraPool=3000
	maxhealth=1000
	health=1000
	stamina=750
	maxstamina=750
	wounds = 0
	maxblood=100
	SelfHeal=0
	blood = 100
	hunger=0
	thirst=0
	MEndurance=100
	TaijutsuStyle="Basic"
	KenjutsuStyle=""
	rank="Student"
	savedname = "None"
	Village = "None"
	Yen=0
	NinSkill=0
	TaiSkill=0
	GenSkill=0
	FireE=0
	WaterE=0
	LightningE=0
	WindE=0
	EarthE=0
	bounty=0
	ChakraC = 10
	kills=0
	deaths=0
	calories=100
	goldinbank=0
	Element = ""
//Stats
	tmp/tai=25
	tmp/gen=25
	tmp/nin=25
	Mtai=25
	Mnin=25
	Mgen=25
//Village Stuff
	BeginningVillage=""
	VMorale=0//Village Morale
	Guild/Guild
	GuildRank

//
	Trait=""
	Trait2=""
	Trait3=""
	FirstName=""
	SecondName=""
	HandleName=""
	TitleName=""
	Age=10
	AgeEXP=0
	JutsuInLearning=""
	JutsuEXPCost=0
	JutsuMEXPCost=0
	TypeLearning=""
	JutsuDelay=0
	KRA=0
	ElementalCapacity=0
	BaseR=0
	BaseG=0
	BaseB=0
	reye=0
	geye=0
	beye=0
	eye
	eye2
	ClanLeader=0
	ChakraColorR=0
	ChakraColorB=0
	ChakraColorG=0
	pafk=0
	gottenuchihacrest=0
mob/var/CanNavigate=0
mob/var/Gender=""
mob/var/WeaponInRightHand=""
mob/var/WeaponInLeftHand=""
mob/var/SavedPetIcon=""
mob/var/hair=""
mob/var/IronGateMember=0
mob/var/IronGateLeader=0
mob/var/HunterNinMember=0
//NewClans
mob/var/
	Clan=""
atom/movable/var
	random
	xco=0
	yco=0
	zco=0
	view=9
//Jutsu Stuff
mob/var/
	CanGetMangekyo=0
	HasMangekyo=0
	mangekyouC="None"
	MMove1="None"
	MMove2="None"
	MMove3="None"
	hasdog=0
	Konchuu = 0
//Jutsu Uses
mob/var/
	MUses=0
mob/var/
	FishingSkill=0
	FishingExpert=0
mob/var/tmp/Fishing=0
//JutsuLearn
mob/var/list/LearnedJutsus=list("")
mob/var/PetName=""
mob/var/PetsHealth=0
mob/var/PetsMHealth=0
mob/var/PetsChakra=0
mob/var/PetsMChakra=0
mob/var/PetsStamina=0
mob/var/PetsMStamina
mob/var/PTai=0
mob/var/PMTai=0
mob/var/PNin=0
mob/var/PMNin=0
mob/var/PGen=0
mob/var/PMGen=0
mob/var/PetsAge=0
mob/var/PetAgeEXP=0
mob/var/PetsHappyness=0//0-Happy To 10-Aggressive
mob/var/FeastStrength=25
mob/var
	halfb = 0

//Clan Passives
mob/var
//Kyomou
	AkametsukiMastery=0
	ParticleMastery=0
	Distortion=0
	ParticleUsage=0
//Aburame
	Canlearnnanobugs=0;
	BugMastery=0//MaxLevel=50, This must be increased to gain new Bug jutsu.
	BugManipulation=1//MaxLevel=30, Increasing this increases the amount of bugs created within an Aburame's body.
	BugKeeper=0
	BugCapacity=1//MaxLevel=30,
	Feast=0
	KekkaiHealth=0
	KekkaiCap=0
//Akimichi
	SizeMastery=0
	SizeCap=0
	AkimichiSpirit=0
//Fuuma
	WeaponMaster=0
	ChakraControl=0
	Survivability=0
	Awareness=1
	Reaction=0
//Hatake
	WhiteChakra=0//MaxLevel=100, Increasing this increases the user's ability all together. For every increase of this, the user's chakra increases and also their ability with the White Tanto sword allows a damage increase.
	CanGetOneEyeShar=0
	CanGetOneEyedMangekyo=0
//Haku
	SnowFall=0
	IceRush=0
//Hoshigaki
//Hoshigaki Variables 1.1
	samehadeChakaraDrain = 0.1
	samehadeThrowingStrength = 0.1
	samehadeStrength = 0.1
	samehadeQuest = 4
	samehadeUnleash = 0.2
	samehadeChakara = 0
	samehadeEquipped = 0
	SamehadeAbsorbtion=0
	AttackFirstTalkLater=1
//Hyuuga
	ByakuganMastery=0//MaxLevel=125, Allows Hyuuga to improve their Byakugan's strength and reach new phases and such.
	StanceMastery=0//MaxLevel=75, Allows Hyuuga to learn Hakke stances.
	ChakraPercision=0
	TenketsuAccuracy=0
	SensoryRange=0
	Rejection=0
//Satou
	Drunk=0
	LostBuzz=0
	Weightful=0
	Shield=0
//Inuzuka
	Training=0
	Obediance=0
	SpeedTraining=0
	Aggression=0
	Canine=0
	SuperHearing=0
//Iwazuka
	ExplosiveMastery=0
	ClayMastery=0
	ClayDrain=0
	QuickClay=0
	list/KibakuAbilities=list("Bird","Spider","Grasshopper","Spear","Wall","Flower","ClaySenbon","Spear")
//Kaguya
	BoneMastery=0//MaxLevel=50, Needed to learn Kaguya bone techniques.
	BoneArmor=0//MaxLevel=10, Increases defence and such.
	DanceMastery=0//MaxLevel=30, Increases the attack of Dances.
	Underlayer=0//MaxLevel=10, Decreases damage of health based attacks.
	SawaMaster=0
	Terpsichorean=0//MaxLevel=5, Increases damage of dances.
	tmp/ControllingSawa=0
	tmp/ControllingSawaCount=0
//Ketsueki
	BloodFeast=0//MaxLevel=10, Increases the amount of EXP gained from Drinking someone's Blood. Also decreases the time thirst rises.
	FeralRage=0//MaxLevel=25, Everytime the user is in view of blood they gain stronger.
	BloodManipulation=0//MaxLevel=50, Learn techniques that require Blood.
	SealMastery=0//MaxLevel=100
	BloodClot=0//MaxLevel=1, All percentile hitting attacks are reduced.
	ThirstHold=0
//Kumojin
	SpiderMastery=0
	WebMastery=0
	WebStrength=0
	BodyofanArachnid=0
	GoldnowDiamond=0
	GoldenSpike=0
//Kusakin
	GrassMastery=0//MaxLevel=100
	Senju=0//MaxLevel=100
	SturdyComposition=0//MaxLevel=20
//Fuuma
	Versatile=0;
	Stealth=0;
//Nara
	ShadowManipulation=0//MaxLevel=100, Needed to learn Shadow techniques. If 100 is reached
	ShadowReach=0//MaxLevel=20, Increases the reach of shadow techniques.
	ShadowStrength=0//MaxLevel=15, Increases the strength of Shadow techniques to keep a bind.
	ShadowMastery=0//MaxLevel=20
	ShadowLimit=0//MaxLevel=10
	ShadowKnowledge=0
//Sabaku
	SandMastery=0
	AutoProtection=0
	Shukaku=0
	SandAmount=100
	MaxSandAmount=100
	SandCapacity=0
	SandPackage=0
//Yotsuki
	Teamwork=0
	Buffet=0
	AdvancedWielding=0
	OnewiththeSword=1
//Chinoike
	KetsuryuganMastery=0
//Uchiha
	ArgonReincarnate=0
	LoveAndHate=0//Will be a new passive that will give Uchihas a little more to do...
	KnowUchihaPast=0//Will be a little Sidequest thing which might make it possible for an Uchiha to get Mangekyou Sharingan if they dont' already have potential
	UchihaMastery=0//MaxLevel=30, Increasing this does nothing until it reaches level 30. At level 30, an Uchiha has a higher chance and easier time getting Mangekyou. An Uchiha also has the ability to control the Kyuubi if given the chance. Sharingan is on full potential at all times
	SharinganMastery=0
//Basic Passives
	StaminaRegeneration=0 //MaxLevel=25, Increases Rate of Stamina Regeneration by 0.5% of Max Stamina per Skill Point Level.
	DurabilityMastery=0//MaxLevel=25, Decreases damage done by Taijutsu attacks to STAMINA, by 2% for each Skill Point Level.
	Acceleration=0//MaxLevel=30,
	RunningSpeed=0//MaxLevel=15
//Sensory Passives
	Auraoff=0
//Fuuinjutsu Passives
	FuuinjutsuKnowledge=0
	WeaponMaster2=0
//Medical Passives
	ShousenMastery=0
	Cure=0
	GenerationMastery=0
	ScalpelMastery=0
	ChakraLeech=0
	OukashouMastery=0
	ChakraMode=0
	ChakraModeMastery=0
//Elemental Passives
	KatonKnowledge=0
	FireChakra=0//MaxLevel=20, Increases damage of Fire Style Jutsus up to BaseDamage+(BaseDamage*.1) For each Skill Point Level
	FireImmunity=0//MaxLevel=5
	HousenkaExpert=0//MaxLevel=2. Level 1 = Housenka Expert, Level 2 = Housenka Master.
	Inferno=0//MaxLevel=3. Each point upgrades the size of your goukakyuu.
	Broil=0//MaxLevel=5, Increases chance of burning by 3%, and duration by 5 seconds.
	DragonTamer=0//MaxLevel=3 Increases number of dragons you shoot during gouryuuka
	DragonsRage=0//MaxLevel=2 Increases explosive range for houka, ryuuka and gouryuuka
	BlueFire//MaxLevel=10
	Magma=0//MaxLevel=1

	SuitonKnowledge=0
	WaterChakra=0// "" Water Style ""
	WaterPressure=0//MaxLevel=5, Increases the pressure of water projectiles dealing 10% more damage for each point.
	WaterSpawn=0//MaxLevel=3, Allows user to create their own water for water jutsus. Jutsus operate at 50% efficiency. +10% for each additional point
	OneWithWater=0//MaxLevel=1, Water is changing and fluid. It adapts and changes its enviornment over periods of time.
	              //During battle, taking repeated damage from a specific element increases your resistance to it.
	              //The user loses the resistance if they take damage from a second type of element.
	BakuExpert=0//MaxLevel=2, cost=2, Increases range.
	WaterDragonMaster//MaxLevel=2, cost=1, increases speed and damage.
	WaterSharksExpert//MaxLevel=4, cost=1, increases number of sharks fired by 1 for each point.
	BladedWater=0//Using the utmost control over their suiton element, the user is able to surround their water techniques with thin blades of water that spiral around the attack, increases its damage potential to even cut an opponent open. To utilize this passive the user must press and hold Z before using their jutsu

	LightningChakra=0// "" Lightning Style ""
	RaitonKnowledge=0
	ShockTreatment=0
	KirinCheck1=0
	KirinCheck2=0
	tmp/Shocked=0 //Activated to 1 by the Shocktreatment passive
	RaikyuuExpert=0//MaxLevel=3
	NagashiExpert=0//MaxLevel=2
	ChidoriSenbonExpert=0//MaxLevel=2
	Static=0//MaxLevel=5 Increases stun of raitons
	Electromagnetivity=0//MaxLevel=3 Increases chances of screwing up an opponent's nervous system. Throwing off their movement.

	WindChakra=0// "" Wind Style ""
	FuutonKnowledge=0
	ReppushouExpert=0//MaxLevel=2
	WindVelocity=0//MaxLevel=5, This passive increases the speed of all the user's fuuton jutsus by 25% for each point
	TorrentialWinds=0//MaxLevel=3, With this passive the user's fuuton jutsus leave after trails that continue to push back and deal light damage in their path. The trails will last 2 seconds longer for each additional point
	VacuumSphereExpert=0//MaxLevel=2, Level 1 = Expert, Level 2 = Master
	DaitoppaExpert=0//MaxLevel=2, Level 1 = Expert, Level 2 = Master
	WindSwordMastery=0//MaxLevel=2, Each level upgrades the damage and range of the jutsu. Point cost = 2
	Tornado=0//MaxLevel=1, This passive gives the ability of all fuuton jutsus the user uses to suck nearby enemies into them.

	DotonKnowledge=0
	EarthChakra=0// "" Earth Style ""
	BoulderExpert=0//MaxLevel=1, Upgrades speed of boulder and damage = 1.5x normal
	BoulderMaster=0//MaxLevel=1, Upgrades size of boulder and damage = 1.75x normal
	DoryuudanMaster=0//MaxLevel=3, Increases number of spikes shot out by 2.
	DoryuuhekiExpert=0//MaxLevel=1, Upgrades the size of Doryuuheki.
	CalloftheSwamp=0//MaxLevel=4, Increases Yomi Numa's range by 2 for each point.
	SoftEarth//MaxLevel=4, Doton jutsus used on mud turfs or yomi numa get a damage boost of 5% for each point.
	LikeAStone=0//MaxLevel=4, Increases the user's resistance to unwanted movement by 15% for each point. This helps prevent pushback from fuuton, suiton, and other knockback
	LikeAMountain=0//MaxLevel=4, Increases the user's resistance to being stunned or flinching by 10% for each point.

	WoodChakra=0//
	IceChakra=0//
//Weapon Passives
mob/var
	ShurikenMastery=0//Increases proficiency of Shurikens.
	KunaiMastery=0//Increases proficiency of Kunai.
	SenbonMastery=0// dur.
	Percision=0//MaxLevel=10, Increases accuracy of weapons to perform critical damage.
	ThrowingStrength//MaxLevel=5, Increasing this increases the speed of weapons,
	SpeedDice=0//MaxLevel=10, Increases speed of katana strike
	DeflectionZ=0//MaxLevel=5
	Kenjutsu=5
	AbleToMoonsplitter=0
	SenbonImpale=0
	Bojutsu=5
	HeavySlam=0
	DisarmingSlash=0
	MakeCrator=0
	Gash=0
	SlashStrength=0
	VitalSlash=0
	Acupuncture=0
//Ninjutsu Passives
mob/var
	NinjutsuKnowledge=0
	PoisonKnowledge=0
	PoisonExpert=0//MaxLevel=5, Increases the duration of poisons and lowers the time to place Poisons upon your weapons.
	HandsealsMastery=0//MaxLevel=3, Increases chance of performing accurate Handseals by 25%.
	HandsealSpeed=0//MaxLevel=10, Increases handseal speed drastically.
	OneHandedSeals=0//MaxLevel=5
	HandsealAgility=0
	Efficiency=0
	NinjutsuMastery=0
	ChakraArmor=0//MaxLevel=20, Increases defence against chakra based attacks.
	WaterWalkingMastery=0
//Genjutsu Passives
mob/var
	GenjutsuKnowledge=0
	GenjutsuMastery=0
	GenjutsuKai=0//MaxLevel=1, User must guard to counter a genjutsu.
	ChakraManipulator=0//MaxLevel= 3, User is able to learn Genjutsu and Genjutsu Knowledge much Quicker
	Overthought=0
	ChakraRadiator=0
	GenjutsuSight=0//MaxLevel=10, Increasing this allows the user to recognize Genjutsu Better.
	Mentality=0
	MentalDamage=0
//Taijutsu Passives
mob/var
	TaijutsuKnowledge=0
	Swift=0//MaxLevel=5,Decreases Delay of attack
	BaseSwift=0 //This will make sure no one tries to abuse to get their swift up Via Kochou
	Rush=0//MaxLevel=10,Increases strength of each attack as long as the user was not hit. Max Level equals how far it goes before resetting.
	DoubleStrike=0//MaxLevel=10, Increases chance of attacking twice by 10% each time.
	Focus=1 //MaxLevel=5, Increases chance of getting a critical hit on a target for each strike.
	Reflex=0//MaxLevel=30, Increases chance to dodge and land taijutsu techniques.
	Buff=0//MaxLevel=5, Decreases chance of target getting a critical hit on the user.
	Impenetrable=0//MaxLevel=10, Increases guard strength and defence.
	TaijutsuMastery=0//MaxLevel=10, decreases the delay of taijutsu and also performs high attack.
	InitialGate=0//MaxLevel=1, Allows the user to achieve first gate by holding down D and Z.
	HealGate=0//MaxLevel=1, Allows the user to achieve the second gate right after the first gate.
	LifeGate=0
	WoundGate=0
	LimitGate=0
	ViewGate=0
	BodyFlickerRepetition=0
	BodyFlickerDistance=0
	BodyFlickerMaster=0

mob/var
	HealthRegen=10
	StaminaRegen=10
	tmp/NegativeHealthRegen=0
	tmp/NegativeStaminaRegen=0
mob/var
	cmission=0
	dmission=0
	bmission=0
	amission=0
	smission=0
	FailedMissions=0
mob/var
	guild_name = "None"

	guild_leader=0
	guild_member=0
	guild_rank=""
	in_guild = 0

	LeafVillagePermit=0
	RockVillagePermit=0
	SoundVillagePermit=0
	RainVillagePermit=0
	PermissionToStartSquad=0
	VillageCouncil=0
	SoundOrganization=0
	SoundOrganizationRank=0
	Anbu=0
	KonohaMilitaryPoliceForceMember=0
mob/var
	Oicon
	rhair
	bhair
	ghair
	tmp/Savedspeed = 1
///////////////////////////////////////////
//UnImportantTmpVariables
mob/var/tmp
	PrevHealthAmount=0
	PrevStaminaAmount=0
	PrevWoundAmount = 0
	PrevBloodAmount = 0
	PrevChakraAmount=0
	PrevChakraResAmount=0
	UsingHealthPack=0
	loggedin=0
	NPC=0
	BunshinG=0
	firing=0
	title
	SIcon = ""
	move=1
	screwed = 0
	seen=0
	points=0
	canattack=1
	canrest=0
	Dead=0
	Genintest
	Geninmade
	menus
	Kaiten = 0
	tempmix
	tempmix2
	tempmix3
	Jujin=0
	bya=0
	Spam = 0
	meditating=0
//	BO= 0
	Henge = 0
	spamcheck = 0
	times=0
	rhit=0

	CNNPC=0
	OOC=0
	injail=0
	muted=0
	AllowMove = "On"
	WorldChat = "On"
	PMOn = "On"
	HearAll = "Off"
	FontColor = "#FF0000" // players cant change it
	NameColor = "#00FF00"
	score=0
	cansave=0
mob/var/tmp/blevel="D"
mob/var/tmp/exp=0
mob/var/tmp/Endurance=100
mob/var/tmp/damageaddup=0
mob/var/tmp/viewing_blood = 0
mob/var/tmp/switching_huds = 0
mob
	Stat()
		sleep(7)//was sleep(9) on 12/14/2012 but this should make the Hud look nicer!!//was sleep(1) 11/16/2012

		if(!src.client||!src.key)
			return
	//	if(src.health<1)
	//		src.health=0
		//if(src.Clan=="Yotsuki"&&src.SpeedDice>4&&src.DeflectionZ>=5)
		//	if(src.LeftHandSheath&&src.WeaponInLeftHand!=""||src.RightHandSheath&&src.WeaponInRightHand!="")
		//		src.Deflection=1
		if(src.loggedin&&src.client&&(src in OnlinePlayers))//added &&src.client
			statpanel("Info")
			if(src.StruggleAgainstDeath>0)
				stat("Struggle: [((src.Struggle)/(src.StruggleAgainstDeath))*100]%")
		//	if(src.GateIn!=""&&src.GateIn!=null)
		//		src.Running=1
			stat("-------------------{[usr]}-------------------")
			stat("Idade: [Age]")
			if(src.Village!="Missing")
				stat("Vila: [Village]")
				if(src.Village == "Leaf")
					stat("Mensagem da Vila: [leafVillageMessage]")
				else if(src.Village == "Rain")
					stat("Mensagem da Vila: [rainVillageMessage]")
				else if(src.Village == "Rock")
					stat("Mensagem da Vila: [rockVillageMessage]")
				else if(src.Village == "Sound")
					stat("Mensagem da Vila: [soundVillageMessage]")
				stat("Moral na Vila: [VMorale]")
			if(src.Clan!="Basic")
				stat("Clan: [Clan]")
				if(src.Clan == "Hoshigaki")
					if(src.samehadeEquipped == 1)
						stat("Chakra da Samehada: [samehadeChakara]")
			stat("Rank: [rank]")
			stat("Classe: [blevel]")
			stat("Preco pela sua cabeca: [y2k_Uncondense_Num(bounty)]")
			stat("Peso: [y2k_Uncondense_Num(ItemWeight)]")
			stat("-------------------{Stats}-------------------")
			if(src.Trait)
				stat("Habilidade Primaria: [src.Trait]");
				if(src.Trait2)
					stat("Habilidade Segundaria: [src.Trait2]")
		//	if(src.Clan=="Hyuuga"&&src.Age>=25) stat("Branch: [src.HyuugaClanBranch]");
			stat("Vitalidade: [(health/maxhealth)*100]%")
			stat("Energia: [(stamina/maxstamina)*100]%")
			stat("Chakra: [(chakra/Mchakra)*100]%")
			if(src.XiveresMember||src.XiveresLeader) stat("Stored Souls: [src.StoredSouls]");
	//		if(locate(/obj/SkillCards/Conversusin) in usr.LearnedJutsus)
	//			stat("Eye Mastery: [src.ConversusinMastery]");
			stat("Chakra Reserva: [(ChakraPool/MaxChakraPool)*100]%")
			if(src.health!=src.PrevHealthAmount)
				src.PrevHealthAmount=src.health;
			//	src.UpdateHealth();
		//		if(src.TypeOfHud=="Swirl")
				src.UpdateHealth2()
		//		else if(src.TypeOfHud=="Classic")
		//			src.UpdateHealth()
			if(src.chakra!=src.PrevChakraAmount)
				src.PrevChakraAmount=src.chakra
		//		if(src.TypeOfHud=="Swirl")
				src.UpdateChakra2()//src.UpdateChakra()
		//		else if(src.TypeOfHud=="Classic")
		//			src.UpdateChakra()
			if(src.stamina!=src.PrevStaminaAmount)
				src.PrevStaminaAmount=src.stamina;
				//src.UpdateStamina()
		//		if(src.TypeOfHud=="Swirl")
				src.UpdateStamina2()
		//		else if(src.TypeOfHud=="Classic")
		//			src.UpdateStamina()

		//	if(src.wounds != src.PrevWoundAmount)
			//	src.PrevWoundAmount = src.wounds; src.UpdateWounds()

			if(src.ChakraPool!=src.PrevChakraResAmount)
				src.PrevChakraResAmount=src.ChakraPool
		//		if(src.TypeOfHud=="Swirl")
				src.UpdateChakraReservoir2()
		//		else if(src.TypeOfHud=="Classic")
		//			src.UpdateChakraResevoir()

			if(src.health<=0)
				if(!src.knockedout)
					src.Death(src)
			var/A=src.Mtai+src.Mnin+src.Mgen
			if(A<1) A=1
			//var/tt=round(src.tai*100/src.Mtai)
			var/tt=(src.tai/A)*10
			//var/nn=round(src.nin*100/src.Mnin)
			var/nn=(src.nin/A)*10
			//var/gg=round(src.gen*100/src.Mgen)
			var/gg=(src.gen/A)*10
		//	stat("Physique: [tt*10]%/Stat: [src.TaiSkill]")
		//	stat("Capacity: [nn*10]%/Stat: [src.NinSkill]")
		//	stat("Control: [gg*10]%/Stat: [src.GenSkill]")
			stat("Físico Stat: ([tt*10]%)")
			stat("Capacidade Stat: ([nn*10]%)")
			stat("Controle Stat: ([gg*10]%)")
			if(src.StartingPoints>0||src.ElementalPoints>0)
				stat("------------------{Pontos}-------------------")
				stat("Pontos Iniciais: [StartingPoints]")
				stat("Pontos de Jutsus: [ElementalPoints]")
			if(src.JutsuInLearning!="")
				stat("----------------{Experiencia}-----------------")
				stat("Você esta aprendendo: [JutsuInLearning]")
				stat("Exp Requirida: [JutsuEXPCost] de um total de [JutsuMEXPCost]")
				stat("Tipo de Jutsu: [TypeLearning]")
			if(src.JutsuDelay>0)
				stat("Tempo restante para aprender outro jutsu: [JutsuDelay]")
			if(src.FireE||src.WaterE||src.LightningE||src.EarthE||src.WindE)
				stat("-----------------{Elementos}------------------")
				if(src.FireE)
					stat("Katon")
				if(src.WaterE)
					stat("Suiton")
				if(src.LightningE)
					stat("Raiton")
				if(src.EarthE)
					stat("Doton")
				if(src.WindE)
					stat("Fuuton")
				if(src.Clan=="Shiroi"||src.Clan=="Kusakin")
					if(src.WindE&&src.WaterE&&src.Clan=="Shiroi")
						stat("Hyouton")
					if(src.EarthE&&src.WaterE&&src.Clan=="Kusakin")
						stat("Mokuton")
			stat("-------------------{Else}--------------------")
			if(src.InGenjutsu=="Kiga")
				stat("Fome: 100%")
			else
				stat("Fome: [hunger]%")
			if(src.InGenjutsu=="Nodono Kawaki")
				stat("Sede: 100%")
			else
				stat("Sede: [thirst]%")
			if(src.Clan=="Aburame")
				stat("Insetos: [Konchuu]")
			if(src.Clan=="Akimichi")
				stat("Calorias: [y2k_Uncondense_Num(calories)]")
	//		if(src.Clan=="Sabaku")
	//			stat("Sand: [SandAmount]")
			if(src.CanNavigate)
				stat("Loc:X [usr.x] Y [usr.y]")
			stat("Ryo: [y2k_Uncondense_Num(Yen)]")
			stat("Ninja Cash:  [NinjaCash]")
			stat("Ryo no Banco: [y2k_Uncondense_Num(goldinbank)]")
			stat("--------------------------------------")
			if(src.Clan=="Inuzuka")
				if(src.hasdog&&!src.PetOut)
					statpanel("Cachorro")
					stat("-------------------{[src.PetName]}-------------------")
					stat("Idade: [PetsAge]")
					stat("Restante para proximo aniversario: [PetAgeEXP]/12342")
					stat("Felicidade: [PetsHappyness]")
					stat("-------------------{Stats}-------------------")
					stat("Vida: [PetsHealth]/[PetsMHealth]")
					stat("Chakra: [PetsChakra]/[PetsMChakra]")
					stat("Energia: [PetsStamina]/[PetsMStamina]")
					stat("Fisico: [PTai]/[PMTai]")
					stat("Controle: [PNin]/[PMNin]")
					stat("Capacidade: [PGen]/[PMGen]")
			statpanel("Missões")
			if(src.CurrentMission!="")
				stat("-------------------{Info}-------------------")
				stat("Missao Atual: [CurrentMission]")
				stat("Tempo Limite: [TimeLimit]")
			stat("-------------------{Missoes Completas}-------------------")
			stat("Rank D: [dmission]")
			stat("Rank C: [cmission]")
			stat("Rank B: [bmission]")
			stat("Rank A: [amission]")
			stat("Rank S: [smission]")
			var/MissioNPassed=src.dmission+src.cmission+src.bmission+src.amission+src.smission
			stat("Missoes Passadas: [MissioNPassed]")
			stat("Missoes Falhadas: [FailedMissions]")
			stat("Taxa de sucesso: [MissioNPassed-FailedMissions]")
			var/ARARA=src.kills-src.deaths
			if(src.Village!="Missing")
				ARARA+=(src.dmission*1)+(src.cmission*5)+(src.bmission*10)+(src.amission*25)+(src.smission*50)
			//if(ARARA<0)
			//	ARARA=0
			stat("Nivel Ninja: [y2k_Uncondense_Num(ARARA)]")
			stat("Desafios Ganhos: [challengeWins]")
			stat("Desafios Perdidos: [challengeLosses]")
			stat("Taxa de Desafios: [challengeRating]")
mob/proc/LearnThisJutsu()
	if(src.JutsuEXPCost>=src.JutsuMEXPCost)
		if(src.JutsuInLearning=="Genjutsu Kai")
			src.GenjutsuKai=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Past Of The Uchiha Clan")
			src.KnowUchihaPast=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Tero Hasaki")
			src.KenjutsuStyle="Tero Hasaki"
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Hansha")
			src.TaijutsuStyle="Hansha"
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="EternalDefence")
			src.HanshaDefence=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Gouken")
			src.TaijutsuStyle="Gouken"
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Enjouhawa")
			src.TaijutsuStyle="Enjouhawa"
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Rakanken")
			src.TaijutsuStyle="Rakanken"
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Quick Fist")
			src.TaijutsuStyle="Quick Fist"
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Initial Gate")
			src.InitialGate=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Heal Gate")
			src.HealGate=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Life Gate")
			src.LifeGate=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Wound Gate")
			src.WoundGate=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Limit Gate")
			src.LimitGate=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="View Gate")
			src.ViewGate=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="FireChakra")
			src.FireE=1
			src.JutsuDelay=1000
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			src.ElementalPoints-=src.ElementalPointDeduction
			src.ElementalPointDeduction=0
			return
		if(src.JutsuInLearning=="WaterChakra")
			src.WaterE=1
			src.JutsuDelay=1000
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			src.ElementalPoints-=src.ElementalPointDeduction
			src.ElementalPointDeduction=0
			return
		if(src.JutsuInLearning=="WindChakra")
			src.WindE=1
			src.JutsuDelay=1000
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			src.ElementalPoints-=src.ElementalPointDeduction
			src.ElementalPointDeduction=0
			return
		if(src.JutsuInLearning=="EarthChakra")
			src.EarthE=1
			src.JutsuDelay=1000
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			src.ElementalPoints-=src.ElementalPointDeduction
			src.ElementalPointDeduction=0
			return
		if(src.JutsuInLearning=="LightningChakra")
			src.LightningE=1
			src.JutsuDelay=1000
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			src.ElementalPoints-=src.ElementalPointDeduction
			src.ElementalPointDeduction=0
			return
		if(src.JutsuInLearning=="Blue Fire")
			src.BlueFire=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Magma")
			src.Magma=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		if(src.JutsuInLearning=="Water Spawn")
			src.WaterSpawn=1
			src.JutsuDelay=src.JutsuMEXPCost
			src.JutsuInLearning=""
			src.JutsuEXPCost=0
			src.JutsuMEXPCost=0;src.exp=0
			src.TypeLearning=""
			return
		else
			var/C = src.JutsuInLearning
			var/T = text2path("/obj/SkillCards/[C]")
			var/obj/O = new T
			src.LearnedJutsus += O
			src.ElementalPoints-=src.ElementalPointDeduction
			src.UpdateInv()
		if(src.JutsuInLearning=="Puppet_Master_Jutsu")
			var/A = /obj/SkillCards/Unsummon_Puppet_One
			var/B = /obj/SkillCards/Unsummon_Puppet_Two
			var/obj/O = new A;src.LearnedJutsus+=O
			var/obj/C = new B;src.LearnedJutsus+=C
		if(findtext(src.JutsuInLearning,"NanoMite"))
			src<<"You have accepted a group of nanomites into your body, and your feel your body weaken..."
			src.maxhealth-=100
			src.health=src.maxhealth
		src<<"Você aprendeu [src.JutsuInLearning]!"
		if(src.TypeLearning=="Taijutsu"&&src.Trait=="Tough")
			src.JutsuDelay=src.JutsuMEXPCost*1.1
		else
			src.JutsuDelay=src.JutsuMEXPCost
		src.ElementalPointDeduction=0
		src.JutsuInLearning=""
		src.JutsuEXPCost=0
		src.JutsuMEXPCost=0;src.exp=0
		src.TypeLearning=""
mob/var/tmp/adir
client
	command_text = "OOC "
mob/var/tmp/cantele=1
mob/var/tmp/QuickThingTarget=0
mob/var/tmp/CanUseSawaAgain=1
mob/var/Target
//mob
//	DblClick()
//		var/JukaiKoutanOn=0
//		for(var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan2/FA in oview(10,usr))
///			if(FA.Owner==usr)
	//			JukaiKoutanOn=1
	//	if(JukaiKoutanOn)
	///		var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan/A=new()
		//	A.loc=src;A.Owner=usr;A.BindingMob=1
		//	usr.chakra-=250
	//	..()
turf
	DblClick()
		var/JukaiKoutanOn=0
		if(usr.Clan=="Kusakin")
			for(var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan2/FA in oview(10,usr))
				if(FA.Owner==usr)
					JukaiKoutanOn=1
		if(usr.Charging&&JukaiKoutanOn)
			var/obj/Jutsu/Elemental/Mokuton/JukaiKoutan/A=new()
			A.loc=src;A.Owner=usr
			A.BindingMob=1
			usr.chakra-=200
		if(usr.ControllingSawa)
			if(usr.CanUseSawaAgain==1)
				if(usr.ControllingSawaCount>50)
					usr<<"You've used Sawa too much and your body weakens."
					for(var/obj/SkillCards/SawarabiAdvanced/Y in usr.LearnedJutsus)
						Y.DelayIt(900,usr)
					usr.ControllingSawaCount=0
					usr.ControllingSawa=0
					return
				var/turf/S = src
				if(S.z!=src.z)
					return
				for(var/turf/Z in oview(1,src))
					var/obj/Jutsu/Kaguya/SawarabiControl/P=new();P.Owner=usr;P.loc=Z
					usr.ControllingSawaCount++
					usr.CanUseSawaAgain=0
					spawn(12)
						if(usr.CanUseSawaAgain!=1)
							usr.CanUseSawaAgain=1
				usr.ChakraDrain(10000)
			else
				usr<<"It takes time to be able to control Sawa from within the ground at a distance. Be patient."
		if(usr.UsingAmaterasuExplosion)
			var/obj/Jutsu/Uchiha/AMAExplosion/Z=new()
			Z.loc=src;Z.Owner=usr
			usr.UsingAmaterasuExplosion=0
		if(usr.VoidStarMode)
			var/turf/A = src
			if(A.z!=src.z)
				return
			var/obj/Jutsu/Kiro/VoidedStar/P=new()
			P.loc=src;
			P.Owner=usr
			usr.ChakraDrain(30000)
		if(usr.AbleToLavaSummon)
			if(!usr.InXeidus)
				usr.AbleToLavaSummon=0
			var/turf/Y = src
			if(Y.z!=src.z)
				return
			for(var/turf/K in view(4,src))
				var/obj/Jutsu/Elemental/Youton/Lava/B=new();B.Owner=usr;B.JutsuLevel=usr.DotonKnowledge/5+usr.KatonKnowledge/5;B.loc=K
		if(usr.UsingKirin)
			usr.UsingKirin=0;
			var/turf/U = src
			if(U.z!=src.z)
				return;
			for(var/turf/T in view(5,src))
				var/obj/Jutsu/Elemental/Raiton/KirinRaiton/A=new();A.loc=T;A.Owner=usr;A.JutsuLevel=10000/*One does not overpower kirin.*/;
			view()<<"<font size=1><font face=verdana><b><font color=red>[usr]<font color=white> Says: Begone with the thunder clap!"
			usr.overlays-='Icons/Jutsus/Chidori.dmi';
		if(usr.UsingKaitoInvisCuts)
			var/turf/Z = src
			if(Z.z!=usr.z)
				return
			var/obj/Jutsu/KaitoCuts/A=new()
			A.loc=src;A.Owner=usr
			usr<<"You unleash a torrent of invisible slashes!"
			usr.UsingKaitoInvisCuts=0
		if(usr.Mogu)
			var/turf/T = src
			for(var/turf/LA in getline(usr,T))
				if(istype(LA,/turf/Buildings/zDensity))
					break
				if(T.density||T.z!=src.z)
					break
				else
					usr.loc=LA
				sleep(0)
			for(var/obj/SkillCards/Moguragakure/AC in usr.LearnedJutsus)
				AC.DelayIt(100,usr)
			//usr.loc=T
			usr.density=1;usr.layer=usr.SavedLayer;usr.Frozen=0;usr.firing=0;usr.Mogu=0
			usr.CreateCrator()
		if(usr.Clan=="Akimichi"&&usr.Pill=="Red")
			if(!src.density&&usr.cantele)
				if(usr.chakra>=200)
					flick("zan",usr)
					usr.loc = src
					usr.chakra -= 200
					usr.cantele =0
					spawn(10)
						usr.cantele = 1
				else
					usr << "Not enough chakra!"
		if(usr.Trait!="Speedy"&&usr.shunshin&&!usr.CastingGenjutsu&&!usr.SoundSpinningKick&&!usr.LegSliced&&!usr.Guarding||usr.controlled)
			var/mob/USER
			if(usr.controlled)
				USER=usr.controlled
			else
				USER=usr
			if(usr.SusanooIn)
				return
		//	if(!usr.Running)
		//		usr<<"You aren't able to use Body Flicker Jutsu because you aren't running."
		//		return
			if(usr.DragPerson!="None")
				usr<<"You can't shunshin because of the excess weight from dragging somebody!";return
			if(src&&!src.density&&usr.cantele&&USER.FrozenBind==""&&!USER.Frozen&&USER.Stun<1&&USER)
				if(src.z!=USER.z)
					return
				flick("zan",USER)
				if(USER.Clan=="Sabaku")
					USER.overlays-='Sshushin.dmi';
					USER.overlays+='Sshushin.dmi'
					spawn(6) USER.overlays-='Sshushin.dmi'
				else if(USER.UchihaMastery<100)
					USER.overlays -= 'Icons/Jutsus/Shushin.dmi';USER.overlays+='Icons/Jutsus/Shushin.dmi'
					spawn(6) USER.overlays-='Icons/Jutsus/Shushin.dmi'
				else
					if(usr.Trait3!="Unyielding")
						usr.chakra-=usr.Mchakra*0.01/(usr.BodyFlickerMaster+1)
				var/turf/T = src
				var/TilesTraveled=0
				for(var/turf/LA in getline(USER,T))
					if(!usr.Running)
						if(usr.BodyFlickerDistance<=1)//&&TilesTraveled>=usr.BodyFlickerDistance+1)
							if(TilesTraveled>=4)
								break
						if(usr.BodyFlickerDistance>=2&&usr.BodyFlickerDistance<3)
							if(TilesTraveled>=5)
								break
						if(usr.BodyFlickerDistance>=3)
							if(TilesTraveled>=usr.BodyFlickerDistance+1)
								break
					if(TilesTraveled>=(usr.BodyFlickerDistance)+6)
						break
					if(istype(LA,/turf/Buildings/zDensity))
						return
					else if(istype(LA,/turf/Blank))
						return
					else if(istype(LA,/turf/Buildings/House1/Passage))
						return
					else
						USER.loc=LA
						TilesTraveled++
					sleep(0)
				if(USER.Clan=="Sabaku")
					for(var/mob/Sand/SunaNoTate/A in USER.JutsuList)
						if(A.Owner==USER)
							A.loc=USER.loc;A.dir=USER.dir
				if(usr.SelfHeal)
					usr.SelfHeal=0
				if(usr.Trait3!="Unyielding")
					USER.chakra-=usr.Mchakra*0.02/(usr.BodyFlickerMaster+1)
				if(USER.UchihaMastery<100)
					usr.shunshin=0
				else if(USER.chakra<USER.Mchakra*0.5||USER.stamina<USER.maxstamina*0.33)
					usr<<output("You don't have the strength to continue your rapid use the Body Flicker jutsu.","Attack")
					usr.shunshin=0

		else if(usr.Touei&&usr.FrozenBind==""&&!usr.Frozen&&usr.Stun<1&&!usr.resting&&!usr.caught&&usr.Status!="Asleep")
			if(!src.density&&src.z==usr.z)
				var/obj/Jutsu/Elemental/Raiton/R=new()
				R.icon_state="Touei";R.loc=src;R.layer=6
				spawn(5)
					del(R)
				flick("zan",usr)
				usr.loc=src
		else if(usr.FlashFlicker&&usr.FrozenBind==""&&!usr.SoundSpinningKick&&!usr.Frozen&&usr.Stun<1&&!usr.resting&&!usr.caught&&usr.Status!="Asleep")
			if(!src.density&&src.z==usr.z)
				flick("zan",usr)
				usr.overlays+='FlashFlicker.dmi'
				spawn(5)
					usr.overlays-='FlashFlicker.dmi'
		else if(usr.Pill!="Red")
			if(usr.Shibari||usr.hyoushou||usr.resting||usr.caught)
				usr << "Your bound by something and are unable to move!"
				return
		else
			return..()

mob/proc
	SwitchT(mob/M)
		if(M.target==src)
			return
mob/var/tmp/TargetPerm=0
mob/var/tmp/Fast=0
mob/var/npcrange=1
//Unnecessary Coding.
//This was meant for NPCs, not to be used as a verb.
/*
mob/NPCHunterVerbs
	verb
		GetTarget()
			for(var/mob/M in range(10,usr))
				if(M!=usr&&M.client)
					var/image/I = image('Icons/target1.dmi',M)
					usr<<I
					usr.target=M
					usr.TargetPerm=1
					usr<<"<b>You target [M]</b>"
					break
				else
					continue
		ShushinNear()
			if(usr.target)
				var/mob/M = usr.target
				var/list/Turfs=list()
				for(var/turf/T in oview(1,M))
					if(!T.density&&get_dist(M,T)!=0)
						if(get_dir(T,M)==M.dir||turn(get_dir(T,M),45)==M.dir||turn(get_dir(T,M),-45)==M.dir||turn(get_dir(T,M),180)==M.dir)
							Turfs.Add(T)
				usr.loc=pick(Turfs)
				usr.dir=get_dir(usr,M)
				flick("zan",usr)
				usr.overlays+='Icons/Jutsus/Shushin.dmi'
				spawn(6)
					usr.overlays-='Icons/Jutsus/Shushin.dmi'
			else
				usr<<"<TT>PROC CRASH: No Target</TT>"
				return
mob
	proc
		CounterShushin()
			if(src.NPCHunter&&src.HoldingS)
				var/list/Turfs=list()
				for(var/turf/T in oview(5,src))
					if(!T.density)
						for(var/obj/O in T)
							if(!O.density&&!(istype(O,/obj/Jutsu/)))
								Turfs.Add(T)
				src.loc=pick(Turfs)
				src.overlays+='Icons/Jutsus/Shushin.dmi'
				spawn(6)
					src.overlays-='Icons/Jutsus/Shushin.dmi'
			else
				usr<<"<TT>PROC CRASH: No NPCHunter variable</TT>"
				return
*/


mob/owner/verb
	FastNorth()
		set instant = 1
		usr.Move(get_step(usr,NORTH), NORTH)
	FastSouth()
		set instant = 1
		usr.Move(get_step(usr,SOUTH), SOUTH)
	FastWest()
		set instant = 1
		usr.Move(get_step(usr,WEST), WEST)
	FastEast()
		set instant = 1
		usr.Move(get_step(usr,EAST), EAST)
	FastNorthwest()
		set instant = 1
		usr.Move(get_step(usr,NORTHWEST), NORTHWEST)
	FastNortheast()
		set instant = 1
		usr.Move(get_step(usr,NORTHEAST), NORTHEAST)
	FastSoutheast()
		set instant = 1
		usr.Move(get_step(usr,SOUTHEAST), SOUTHEAST)
	FastSouthwest()
		set instant = 1
		usr.Move(get_step(usr,SOUTHWEST), SOUTHWEST)
mob/var/tmp/list/Allies=list()
mob/var/AllyMax=1
mob/var/SavedHengeVillage=""
mob/var/HengeVillage=""
mob/var/tmp/MissleDelay=0
atom
	MouseDown(location,control,params)
		var/list/list_params = params2list(params)
		if(usr.PlacingMarker&&!usr.SealPlacedOn.Find(src))
			if(get_dist(usr,src)<=1)
				usr<<"<font color=#bbab27>You slap your palm on [src] and place a marking seal using your chakra!</font>"
				switch(input(usr,"Do you want to give this marker a special name?") in list("No","Yes"))
					if("Yes")
						if(!(ismob(src)))
							var/Name=input(usr,"Name?") as text
							if(!Name)
								usr.SealPlacedOn+=src
								usr<<"No special name was used."
							else
								usr<<"Placed a seal on '[src]' ([Name])."
								src.tag=Name
								usr.SealPlacedOn+=Name
						else
							usr<<"You can't use a special nametag for a person."
							usr.SealPlacedOn+=src
					else
						usr.SealPlacedOn+=src
				var/image/I=image('Icons/Jutsus/MinatoAura.dmi',src)
				usr<<I
				usr.PlacingMarker=0
				return
			else
				usr<<"You need to be able to touch [src]."
				return
		//if(usr.FTG_Mode)
		//	if(src in usr.SealPlacedOn||src.tag in usr.SealPlacedOn)
		//		var/obj/WarpEffect/W=new();W.loc=usr.loc
		//		var/turf/T=get_step(src,turn(src.dir,180))
		//		if(T)
		//			usr.loc=T;usr.dir=src.dir
		if(usr.MindGenjutsuReady&&!(ismob(src)))
			if(("shift" in list_params))
				var/A=usr.MindGenjutsuWhat
				var/B=usr.MindGenjutsuWho
				var/mob/T=usr.MindGenjutsuTarget
				if(usr.MindGenjutsuMode=="Say")
					T<<"<font face=trebuchet MS><b><font color=red>[B]<font color=white> Says: [html_encode(A)]</font></b>"
					usr<<"<font face=trebuchet MS><b><font color=red>[B]<font color=white> Says: [html_encode(A)]</font></b>"
				if(usr.MindGenjutsuMode=="Village Say")
					var/C=input(usr,"What is their rank?","Rank",usr.MindGenjutsuRank) as text
					if(T.Village=="Leaf")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B6F1B><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B6F1B><b>[B]: [A]"
					if(T.Village=="Rock")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#A0522D><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#A0522D><b>[B]: [A]"
					if(T.Village=="Rain")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B82E6><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B82E6><b>[B]: [A]"
					if(T.Village=="Sound")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#B24A7E><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#B24A7E><b>[B]: [A]"
				usr.MindGenjutsuReady=0

		else if(("alt" in list_params))
			usr<<"All targets and allies cleared."
			usr.Allies=list()
			usr.target=null
			if(usr.controlled!=null)
				usr.MindControlJutsu()
			for(var/image/x in usr.client.images)
				if(x.icon=='Icons/target2.dmi')
					del(x)
			for(var/image/x in usr.client.images)
				if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
					del(x)
	//	else if(("ctrl" in list_params))
	//		if(usr.NinjutsuKnowledge>1000&&usr.GenjutsuKnowledge>1000)
	//			usr.SavedHengeIcon=src.icon;usr.SavedHengeName=src.name;usr.SavedHengeIconState=src.icon_state
	//			usr.SavedHengeOverlays=src.overlays.Copy()
	//			if(istype(src,/mob/))
	//				return
				//	usr.SavedHengeVillage=usr.Village
				//	usr.HengeVillage=src:Village
	//			usr<<"Your saved henge icon has been set to [src.name]'s icon. This is only until you logout."

		else if(usr.Kamui)
			if(ismob(src))

				if(usr.z!=src.z)
					return
				var/iconX = text2num(list_params["icon-x"])
				var/iconY = text2num(list_params["icon-y"])
				usr.WarpHole(src,iconX,iconY)
				return
			else if(isobj(src))
				if(usr.z!=src.z)
					return
				usr.WarpHole(src)
				return
			else
				usr<<"You missed!"
				usr.Kamui=0
				return
		else if(usr.AsuraRealm&&!usr.MissleDelay)
			if(ismob(src)||isturf(src))
				usr.MissleDelay=1
				spawn(40)
					usr.MissleDelay=0
				usr.AsuraMissle(0,src)
		else if(usr.WaterSharksLeft>0&&!usr.firing)
			usr.WaterSharksLeft--
			usr.SuikoudanUse(src)
		else if(usr.Spikesleft>0&&!usr.firing)
			usr.Spikesleft--
			usr.MakeSpike(src)
		else if(usr.NuiNeedlesLeft>0&&!usr.firing)
			usr.NuiNeedlesLeft--
			usr.NuiClick(src)
		else if((usr.MakeCrator>=0)&&(!usr.firing)) //really hope this isn't goign to bug shit./
			return
		else if(usr.CloneSubstituteMode)
			if(isturf(src))
				if(!src.density)
					usr.CloneSubstituteMode=0
					//usr.KageBunshinSubstitution(usr.loc);usr.loc=src
			if(isobj(src))
				//usr.KageBunshinSubstitution(usr.loc)
				usr.CloneSubstituteMode=0;usr.loc=location
			if(ismob(src))
				//usr.KageBunshinSubstitution(src.loc,src)
				usr.CloneSubstituteMode=0
				usr.invisibility=50;spawn(25)
					usr.invisibility=1
		..()

mob
	MouseDown(location,control,params)
		..()
		var/list/list_params = params2list(params)
		if(("shift" in list_params))
			if(usr.MindGenjutsuReady&&usr!=src)
				var/A=usr.MindGenjutsuWhat
				var/B=src.name
				var/mob/T=usr.MindGenjutsuTarget
				if(usr.MindGenjutsuMode=="Say")
					T<<"<font face=trebuchet MS><b><font color=red>[B]<font color=white> Says: [html_encode(A)]</font></b>"
					usr<<"<font face=trebuchet MS><b><font color=red>[B]<font color=white> Says: [html_encode(A)]</font></b>"
					var/number="3";var/px=16;var/py=18
					if(src.dir==NORTH){number="4";px=-16}
					if(src.dir==EAST){number="1";px=-8}
					if(src.dir==WEST){number="2";px=8}
					var/image/I=image('Chat.dmi',loc=src,icon_state=number,layer=5)
					I.pixel_x=px;I.pixel_y=py
					src<<I;usr<<I
					spawn(10+round(length(A)/5))
						del(I)
				if(usr.MindGenjutsuMode=="Village Say")
					var/C=input(usr,"What is their rank?","Rank",usr.MindGenjutsuRank) as text
					if(T.Village=="Leaf")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B6F1B><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B6F1B><b>[B]: [A]"
					if(T.Village=="Rock")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#A0522D><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#A0522D><b>[B]: [A]"
					if(T.Village=="Rain")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B82E6><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#1B82E6><b>[B]: [A]"
					if(T.Village=="Sound")
						T<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#B24A7E><b>[B]: [A]"
						usr<<"<font color = green><font size= 2>(Vsay)([C])<font size= 1> - <font color=#B24A7E><b>[B]: [A]"
				usr.MindGenjutsuReady=0
				return
			else if(usr.MindGenjutsuReady&&usr==src)
				usr<<"Kotoamatsukami Mind Genjutsu cancelled."
				usr.MindGenjutsuReady=0;usr.MindGenjutsuTarget=null
				return
			else
				if(usr.Allies.len>=usr.AllyMax||usr==src)
					usr.Allies=list()
					for(var/image/x in usr.client.images)
						if(x.icon=='Icons/target2.dmi')
							del(x)
				if(usr!=src)
					var/image/I = image('Icons/target2.dmi',src)
					usr<<I
					if(src.name in usr.namesknown)
						usr<<"<b>You target [src] as an ally.</b>"
						if(!(src in usr.Allies))
							src<<"<b>[usr] targetted you as an ally.</b>"
						usr.Allies.Add(src)
					else
						usr<<"<b>You target the [src.Village] Ninja."
						if(!(src in usr.Allies))
							src<<"<b>[usr] targetted you as an ally.</b>"
						usr.Allies.Add(src)
			return
		if(src==usr||get_dist(src,usr) >= 11&&!usr.TargetPerm)
			usr.TargetPerm=0;usr.DeleteTarget();return
		for(var/image/x in usr.client.images)
			if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
				del(x)
		var/image/I = image('Icons/target1.dmi',src)
		usr<<I
		usr.QuickThingTarget=1
		spawn(30)
			if(!usr)
				return
			usr.QuickThingTarget=0
		usr.target=src
		if(usr.UseFushi)
			usr.UseFushi=0
			usr.FushiTensei(src)
		if(!src.client)
			usr<<"<b>You target [src]."
		else
			if(src.name in usr.namesknown)
				usr<<"<b>You target [src]."
				if(usr.XiveresMember||usr.XiveresLeader)
					if(src.deathcount<=2.5)
						usr<<"<font color=#660198>[src] still has the strength to fight...</font>"
					else if(src.deathcount>2.5&&src.deathcount<=5)
						usr<<"<font color=#660198>[src] is succumbing to darkness...</font>"
					else if(src.deathcount>5)
						usr<<"<font color=#660198>[src] is almost completly consumed by the darkness...</font>"
				if(usr.Akametsuki>=1)
					usr<<"[src] has [src.health] health currently!"
				if(usr.Akametsuki>=2)
					usr<<"[src] has [src.stamina] stamina currently!"
				if(usr.Akametsuki==3)
					usr<<"[src] has [src.chakra] chakra currently!"
				if(usr.bya)
					usr<<"[src] has [round((src.chakra/src.Mchakra)*100,0.1)]% of their chakra remaining."
					usr<<"And they have [round((src.ChakraPool/src.MaxChakraPool)*100,0.1)]% reserved chakra remaining."
			else
				usr<<"<b>You target the [src.Village] Ninja."
				if(usr.XiveresMember||usr.XiveresLeader)
					if(src.deathcount<=2.5)
						usr<<"<font color=#660198>[src.Village] still has the strength to fight...</font>"
					else if(src.deathcount>2.5&&src.deathcount<=5)
						usr<<"<font color=#660198>[src.Village] is succumbing to darkness...</font>"
					else if(src.deathcount<5)
						usr<<"<font color=#660198>[src.Village] is almost completly consumed by the darkness...</font>"
				if(usr.Akametsuki>=1)
					usr<<"[src.Village] Ninja has [src.health] health currently!"
				if(usr.Akametsuki>=2)
					usr<<"[src.Village] Ninja has [src.stamina] stamina currently!"
				if(usr.Akametsuki==3)
					usr<<"[src.Village] Ninja has [src.chakra] chakra currently!"
				if(usr.bya)
					usr<<"[src.Village] Ninja has [round((src.chakra/src.Mchakra)*100,0.1)]% of their chakra remaining."
					usr<<"And they have [round((src.ChakraPool/src.MaxChakraPool)*100,0.1)]% reserved chakra remaining."



	DblClick()
		if(src!=usr)
			if(usr.GM||usr.key=="Renounced Hero")
				if(src.key=="KingsHake"||src.key=="DemonicK"||src.key=="Zigo"||src.key=="Darkaizer"||src.key=="XXSharingan123XX")
					return
			//	if(src.AkatsukiMember==1||src.AkatsukiLeader==1)
			//		return
				if(src.oname!=src.name&&src.AkatsukiMember&&usr.MemberRank!="Owner")
					usr<<"<font color=red>Wouldn't you like to know?"

				else
					if(src.oname==null)
						src.oname=src.name
					if(usr.Akametsuki>=1)
						usr<<"[src] has [src.health] health currently!"
					if(usr.Akametsuki>=2)
						usr<<"[src] has [src.stamina] stamina currently!"
					if(usr.Akametsuki==3)
						usr<<"[src] has [src.chakra] chakra currently!"
					if(src.KeyVar!="")
						usr<<"<font color=red>[src]'s real name is [src.name].</font>"
						usr<<"<font color=red>[src]'s key is [src.KeyVar].</font>"
						usr<<"<font color=red>As a GM you honor the fact that this is classified information not to be used IC,"
						usr<<"<font color=red>or to be given to non GMs. Doing so will result in the removal of this feature for you."
					else
						usr<<"<font color=red>[src]'s real name is [src.oname].</font>"
						usr<<"<font color=red>[src]'s key is [src.key].</font>"
						usr<<"<font color=red>As a GM you honor the fact that this is classified information not to be used IC,"
						usr<<"<font color=red>or to be given to non GMs. Doing so will result in the removal of this feature for you."



mob
	Barrier
		health=30000
		maxhealth=100
		Frozen=1
		Death(mob/M)
			if(src.health<1)
				viewers(src)<<"The barrier fades..."
				del(src)
			else
				return
mob
	Barrier2
		health=15000
		maxhealth=100
		Frozen=1
		Death(mob/M)
			if(src.health<1)
				viewers(src)<<"The barrier fades..."
				del(src)
			else
				return
//Iron Gates of Iwa
mob/var/IRank="N/A"
mob/IronGate/verb/InviteA(mob/M in world)
	set category="Iron Gates"
	set name="Invitation"
	switch(input(M,"Would you like to join the Iron Gates of Iwa?","Join?","") in list ("Yes","No"))
		if("Yes")
			if(!M.IronGateMember&&!M.IronGateLeader)
				M.IronGateMember=1
				M.verbs+=typesof(/mob/IronGateMember/verb)
			else
				usr<<"Cannot be done, they're already in the Guild."
		if("No")
			usr<<"[M] denied your invite."
mob/IronGate
	verb/BootA(mob/M in world)
		set category="Iron Gates"
		set name="Boot Iron Gate Member"
		M.IronGateMember=0
		M.verbs-=typesof(/mob/IronGateMember/verb)
	verb/AssignRank(mob/M in world)
		set category="Iron Gates"
		set name="Assign Rank"
		var/Number=input(usr,"What rank do you want to assign [M]?",) as num
		M.IRank=Number
		for(var/mob/X in world)
			if(X.IronGateMember)
				X<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>[M] is now Rank [Number] in the XI Iron Gates of Iwa."

mob/IronGateMember/verb/TalkWithMembers(msg as text)
	set category="Iron Gates"
	set name="Iron Gates Say"
	set desc = "Say something to every member of the Iron Gates."
	var/list/L = list("<")
	for(var/H in L)
		if(findtext(msg,H))
			alert(usr,"No HTML in text!");return
		if(length(msg)>=400)
			alert(usr,"Message is too long");return
	for(var/mob/M in world)
		if(M.IronGateMember||M.IronGateLeader)
			M<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>(<FONT COLOR=#696969>.</FONT><FONT COLOR=#828280>:</FONT><FONT COLOR=#9b9b96>:</FONT><FONT COLOR=#b5b5ad>|</FONT><FONT COLOR=#cecec4>X</FONT><FONT COLOR=#e7e7da>I</FONT><FONT COLOR=#fffff0> </FONT><FONT COLOR=#eaeade>I</FONT><FONT COLOR=#d5d5ca>r</FONT><FONT COLOR=#bfbfb7>o</FONT><FONT COLOR=#aaaaa3>n</FONT><FONT COLOR=#949490> </FONT><FONT COLOR=#7f7f7c>G</FONT><FONT COLOR=#696969>a</FONT><FONT COLOR=#7f7f7c>t</FONT><FONT COLOR=#949490>e</FONT><FONT COLOR=#aaaaa3>s</FONT><FONT COLOR=#bfbfb7> </FONT><FONT COLOR=#d5d5ca>o</FONT><FONT COLOR=#eaeade>f</FONT><FONT COLOR=#fffff0> </FONT><FONT COLOR=#eaeade>I</FONT><FONT COLOR=#d5d5ca>w</FONT><FONT COLOR=#bfbfb7>a</FONT><FONT COLOR=#aaaaa3>|</FONT><FONT COLOR=#949490>:</FONT><FONT COLOR=#7f7f7c>:</FONT><FONT COLOR=#696969>.</FONT><font size=1> - [usr.IRank])-[usr.oname]<font color=#DD0000>: [msg]</font>"
mob/IronGateMember/verb/IronGateWho()
	set category="Iron Gates"
	set name="Iron Gates Who"
	usr<<"<font color=red>Online Iron Gate Members -"
	for(var/mob/M in world)
		if(M.IronGateMember&&M.client){usr<<"<font color = #CCCCCC>[M.oname]"}


//Daito's Org
mob/var
	YRank="N/A"
	EvandiusMember=0
	EvandiusLeader=0
mob/DaitoLeader
	verb/EvandiusInvite(mob/M in world)
		set category="Organization"
		set name="Invite to Organization"
		switch(input(M,"Would you like to join Fleur de Lis?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.EvandiusMember&&!M.EvandiusLeader)
					M.EvandiusMember=1
					M.verbs+=typesof(/mob/DaitoMember/verb)
				else
					usr<<"Cannot be done, they're already in the Organization."
			if("No")
				usr<<"[M] denied your invite."

	verb/EvandiusBoot(mob/M in world)
		set category="Organization"
		set name="Boot from Organization"
		M.EvandiusMember=0
		M.verbs-=typesof(/mob/DaitoMember/verb)
	verb/AssignARank(mob/M in world)
		set category="Organization"
		set name="Assign Rank"
		var/Number=input(usr,"What rank do you want to assign [M]?",) as num
		M.YRank=Number
		for(var/mob/X in world)
			if(X.EvandiusMember)
				X<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>[M] is now Rank [Number] in Fleur de Lis."
mob/DaitoMember
	verb/EvandiusSay(msg as text)
		set category="Organization"
		set name="Fleur de Lis Say"
		set desc = "Say something to every member of the Fleur de Lis."
		var/list/L = list("<")
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.EvandiusMember||M.EvandiusLeader)
				M<<"<font face=trebuchet MS><font color=#003366>Fleur de Lis<font size=1> - ([usr.YRank])-[usr.oname]</font><font face=trebuchet MS><font color=#336699>: [msg]</font>"
	verb/EvandiusWho()
		set category="Organization"
		set name="Fleur de Lis Who"
		usr<<"<font color=#003366>Online Fleur de Lis Members -"
		for(var/mob/M in world)
			if(M.EvandiusMember&&M.client){usr<<"<font color = #336699>[M.oname]"}

mob/var
	ARank="N/A"
	AkatsukiMember=0
	AkatsukiLeader=0

obj/Clothes/AkatsukiCloak
	icon='Icons/New Base/Clothing/Official Clothing/AKAS.dmi'
	name="Akatsuki Cloak"
	bodyarea="TorsoTop"
	ArmorAddOn=0
	layer=MOB_LAYER+1
	worn=0
	Wear()
		..()
obj/Clothes/AkatsukiHat
	icon='Icons/New Base/Clothing/Official Clothing/AKAH.dmi'
	name="Akatsuki Hat"
	bodyarea="FaceTop"
	layer=MOB_LAYER+1
	worn=0
	Wear()
		if(src.worn == 1)
			src:worn = 0
			usr.name = usr.oname
			usr.overlays -= src.icon
			usr << "You remove the [src.name]."
			src.suffix = ""
		else
			src:worn = 1
			usr.oname = usr.name
			usr.name = "????"
			usr.overlays += src.icon
			usr << "You wear the [src.name]."
			src.suffix = "Equipped"
mob/Akat
	verb/AkatInvite(mob/M in world)
		set category="Akatsuki"
		set name="Invite to Akatsuki"
		switch(input(M,"Would you like to join Akatsuki?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.AkatsukiMember&&!M.AkatsukiLeader)
					M.AkatsukiMember=1
					M.verbs+=typesof(/mob/AkatMember/verb)
					var/obj/Clothes/AkatsukiCloak/A=new()
					A.Move(M)
					var/obj/Clothes/AkatsukiHat/A2=new()
					A2.Move(M)
				else
					usr<<"Cannot be done, they're already in the Organization."
			if("No")
				usr<<"[M] denied your invite."

	verb/AkatBoot(mob/M in world)
		set category="Akatsuki"
		set name="Boot from Akatsuki"
		M.AkatsukiMember=0
		M.verbs-=typesof(/mob/AkatMember/verb)
	verb/AssignARank(mob/M in world)
		set category="Akatsuki"
		set name="Assign Member Rank"
		var/Number=input(usr,"What rank do you want to assign [M]?",) as num
		M.ARank=Number
		for(var/mob/X in world)
			if(X.AkatsukiMember)
				X<<"<font size=2><font face=trebuchet MS><font color=red>[M] is now Rank [Number] in Akatsuki."
mob/AkatMember
	verb/AkatsukiSay(msg as text)
		set category="Akatsuki"
		set name="Akatsuki Say"
		set desc = "Say something to every member of the Akatsuki"
		var/list/L = list("<")
		if(usr.CantAlert)
			usr<<"You can't use this right now."
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.AkatsukiMember||M.AkatsukiLeader)
				M<<"<font face=trebuchet MS><font color=red size=2>(Akatsuki Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=gray>: [msg]</font>"
	verb/AkatsukiWho()
		set category="Akatsuki"
		set name="Akatsuki Who"
		usr<<"<font color=red>Online Akatsuki Members -"
		for(var/mob/M in world)
			if(M.AkatsukiMember&&M.client){usr<<"<font color = gray>[M.oname]"}
/*	verb/Astral_Window(mob/M in world)
		set category = "Akatsuki"
		set name="Astral"
		if(!src.AstralWindow)
			AstralWindow = 1
			var/obj/AstralWindow/AA=new();AA.screen_loc = "13,7";src.client.screen += AA;AA.Watch = M;AA.RSpot=list("x"=-3,"y"=3)
			var/obj/AstralWindow/AB=new();AB.screen_loc = "14,7";src.client.screen += AB;AB.Watch = M;AB.RSpot=list("x"=-2,"y"=3)
			var/obj/AstralWindow/AC=new();AC.screen_loc = "15,7";src.client.screen += AC;AC.Watch = M;AC.RSpot=list("x"=-1,"y"=3)
			var/obj/AstralWindow/AD=new();AD.screen_loc = "16,7";src.client.screen += AD;AD.Watch = M;AD.RSpot=list("x"=0,"y"=3)
			var/obj/AstralWindow/AE=new();AE.screen_loc = "17,7";src.client.screen += AE;AE.Watch = M;AE.RSpot=list("x"=1,"y"=3)
			var/obj/AstralWindow/AF=new();AF.screen_loc = "18,7";src.client.screen += AF;AF.Watch = M;AF.RSpot=list("x"=2,"y"=3)
			var/obj/AstralWindow/AG=new();AG.screen_loc = "19,7";src.client.screen += AG;AG.Watch = M;AG.RSpot=list("x"=3,"y"=3)

			var/obj/AstralWindow/BA=new();BA.screen_loc = "13,6";src.client.screen += BA;BA.Watch = M;BA.RSpot=list("x"=-3,"y"=2)
			var/obj/AstralWindow/BB=new();BB.screen_loc = "14,6";src.client.screen += BB;BB.Watch = M;BB.RSpot=list("x"=-2,"y"=2)
			var/obj/AstralWindow/BC=new();BC.screen_loc = "15,6";src.client.screen += BC;BC.Watch = M;BC.RSpot=list("x"=-1,"y"=2)
			var/obj/AstralWindow/BD=new();BD.screen_loc = "16,6";src.client.screen += BD;BD.Watch = M;BD.RSpot=list("x"=0,"y"=2)
			var/obj/AstralWindow/BE=new();BE.screen_loc = "17,6";src.client.screen += BE;BE.Watch = M;BE.RSpot=list("x"=1,"y"=2)
			var/obj/AstralWindow/BF=new();BF.screen_loc = "18,6";src.client.screen += BF;BF.Watch = M;BF.RSpot=list("x"=2,"y"=2)
			var/obj/AstralWindow/BG=new();BG.screen_loc = "19,6";src.client.screen += BG;BG.Watch = M;BG.RSpot=list("x"=3,"y"=2)

			var/obj/AstralWindow/CA=new();CA.screen_loc = "13,5";src.client.screen += CA;CA.Watch = M;CA.RSpot=list("x"=-3,"y"=1)
			var/obj/AstralWindow/CB=new();CB.screen_loc = "14,5";src.client.screen += CB;CB.Watch = M;CB.RSpot=list("x"=-2,"y"=1)
			var/obj/AstralWindow/CC=new();CC.screen_loc = "15,5";src.client.screen += CC;CC.Watch = M;CC.RSpot=list("x"=-1,"y"=1)
			var/obj/AstralWindow/CD=new();CD.screen_loc = "16,5";src.client.screen += CD;CD.Watch = M;CD.RSpot=list("x"=0,"y"=1)
			var/obj/AstralWindow/CE=new();CE.screen_loc = "17,5";src.client.screen += CE;CE.Watch = M;CE.RSpot=list("x"=1,"y"=1)
			var/obj/AstralWindow/CF=new();CF.screen_loc = "18,5";src.client.screen += CF;CF.Watch = M;CF.RSpot=list("x"=2,"y"=1)
			var/obj/AstralWindow/CG=new();CG.screen_loc = "19,5";src.client.screen += CG;CG.Watch = M;CG.RSpot=list("x"=3,"y"=1)

			var/obj/AstralWindow/DA=new();DA.screen_loc = "13,4";src.client.screen += DA;DA.Watch = M;DA.RSpot=list("x"=-3,"y"=0)
			var/obj/AstralWindow/DB=new();DB.screen_loc = "14,4";src.client.screen += DB;DB.Watch = M;DB.RSpot=list("x"=-2,"y"=0)
			var/obj/AstralWindow/DC=new();DC.screen_loc = "15,4";src.client.screen += DC;DC.Watch = M;DC.RSpot=list("x"=-1,"y"=0)
			var/obj/AstralWindow/DD=new();DD.screen_loc = "16,4";src.client.screen += DD;DD.Watch = M;DD.RSpot=list("x"=0,"y"=0)
			var/obj/AstralWindow/DE=new();DE.screen_loc = "17,4";src.client.screen += DE;DE.Watch = M;DE.RSpot=list("x"=1,"y"=0)
			var/obj/AstralWindow/DF=new();DF.screen_loc = "18,4";src.client.screen += DF;DF.Watch = M;DF.RSpot=list("x"=2,"y"=0)
			var/obj/AstralWindow/DG=new();DG.screen_loc = "19,4";src.client.screen += DG;DG.Watch = M;DG.RSpot=list("x"=3,"y"=0)

			var/obj/AstralWindow/EA=new();EA.screen_loc = "13,3";src.client.screen += EA;EA.Watch = M;EA.RSpot=list("x"=-3,"y"=-1)
			var/obj/AstralWindow/EB=new();EB.screen_loc = "14,3";src.client.screen += EB;EB.Watch = M;EB.RSpot=list("x"=-2,"y"=-1)
			var/obj/AstralWindow/EC=new();EC.screen_loc = "15,3";src.client.screen += EC;EC.Watch = M;EC.RSpot=list("x"=-1,"y"=-1)
			var/obj/AstralWindow/ED=new();ED.screen_loc = "16,3";src.client.screen += ED;ED.Watch = M;ED.RSpot=list("x"=0,"y"=-1)
			var/obj/AstralWindow/EE=new();EE.screen_loc = "17,3";src.client.screen += EE;EE.Watch = M;EE.RSpot=list("x"=1,"y"=-1)
			var/obj/AstralWindow/EF=new();EF.screen_loc = "18,3";src.client.screen += EF;EF.Watch = M;EF.RSpot=list("x"=2,"y"=-1)
			var/obj/AstralWindow/EG=new();EG.screen_loc = "19,3";src.client.screen += EG;EG.Watch = M;EG.RSpot=list("x"=3,"y"=-1)

			var/obj/AstralWindow/FA=new();FA.screen_loc = "13,2";src.client.screen += FA;FA.Watch = M;FA.RSpot=list("x"=-3,"y"=-2)
			var/obj/AstralWindow/FB=new();FB.screen_loc = "14,2";src.client.screen += FB;FB.Watch = M;FB.RSpot=list("x"=-2,"y"=-2)
			var/obj/AstralWindow/FC=new();FC.screen_loc = "15,2";src.client.screen += FC;FC.Watch = M;FC.RSpot=list("x"=-1,"y"=-2)
			var/obj/AstralWindow/FD=new();FD.screen_loc = "16,2";src.client.screen += FD;FD.Watch = M;FD.RSpot=list("x"=0,"y"=-2)
			var/obj/AstralWindow/FE=new();FE.screen_loc = "17,2";src.client.screen += FE;FE.Watch = M;FE.RSpot=list("x"=1,"y"=-2)
			var/obj/AstralWindow/FF=new();FF.screen_loc = "18,2";src.client.screen += FF;FF.Watch = M;FF.RSpot=list("x"=2,"y"=-2)
			var/obj/AstralWindow/FG=new();FG.screen_loc = "19,2";src.client.screen += FG;FG.Watch = M;FG.RSpot=list("x"=3,"y"=-2)

			var/obj/AstralWindow/GA=new();GA.screen_loc = "13,1";src.client.screen += GA;GA.Watch = M;GA.RSpot=list("x"=-3,"y"=-3)
			var/obj/AstralWindow/GB=new();GB.screen_loc = "14,1";src.client.screen += GB;GB.Watch = M;GB.RSpot=list("x"=-2,"y"=-3)
			var/obj/AstralWindow/GC=new();GC.screen_loc = "15,1";src.client.screen += GC;GC.Watch = M;GC.RSpot=list("x"=-1,"y"=-3)
			var/obj/AstralWindow/GD=new();GD.screen_loc = "16,1";src.client.screen += GD;GD.Watch = M;GD.RSpot=list("x"=0,"y"=-3)
			var/obj/AstralWindow/GE=new();GE.screen_loc = "17,1";src.client.screen += GE;GE.Watch = M;GE.RSpot=list("x"=1,"y"=-3)
			var/obj/AstralWindow/GF=new();GF.screen_loc = "18,1";src.client.screen += GF;GF.Watch = M;GF.RSpot=list("x"=2,"y"=-3)
			var/obj/AstralWindow/GG=new();GG.screen_loc = "19,1";src.client.screen += GG;GG.Watch = M;GG.RSpot=list("x"=3,"y"=-3)
		else
			for(var/obj/AstralWindow/W in src.client.screen)
				W.Watch = M
		usr << "Click the generated screen to turn off the window!"

mob/var/tmp/AstralWindow=0
obj/AstralWindow
	layer = 9999999999999999999999999999999999999999
	var
		mob/Watch
		list/RSpot = list("x","y")
	Del()
		sleep(5)
		..()
	Click()
		usr.AstralWindow = 0
		for(var/obj/AstralWindow/W in usr.client.screen)
			spawn() del(W)
	New()
		..()
		spawn()
			if(RSpot["x"] == 3 || RSpot["x"] == -3 || RSpot["y"] == 3 || RSpot["y"] == -3)
				var/icon/Outline = icon('BaseSelectStuff.dmi');Outline.SwapColor(rgb(34,34,34,161),rgb(0,0,0,0))
				if(RSpot["x"] == 3)
					if(RSpot["y"] == 3)
						Outline = icon(Outline,"box4")
					else if(RSpot["y"] == -3)
						Outline = icon(Outline,"box1")
					else
						Outline = icon(Outline,"box8")
				else if(RSpot["x"] == -3)
					if(RSpot["y"] == 3)
						Outline = icon(Outline,"box3")
					else if(RSpot["y"] == -3)
						Outline = icon(Outline,"box2")
					else
						Outline = icon(Outline,"box6")
				else if(RSpot["y"] == 3)
					Outline = icon(Outline,"box7")
				else if(RSpot["y"] == -3)
					Outline = icon(Outline,"box5")
				src.overlays += Outline
			src.underlays += icon('white.dmi')
			while(src)
				if(src.Watch)
					var/turf/T = locate(src.Watch.x+RSpot["x"],src.Watch.y+RSpot["y"],src.Watch.z)
					if(T)
						src.icon = T.pic3()
					else
						src.icon = null
				else
					src.icon = null
				sleep(5)
*/
/*turf
	proc/pic3()
		var/icon/i = icon(src.icon,src.icon_state,src.dir)
		for(var/atom/o in src.contents)
			var/icon/i2 = icon(o.icon,o.icon_state,o.dir,1)
			for(var/o2 in o.overlays)
				i2.Blend(icon(o2:icon,o2:icon_state,o2:dir,1),ICON_OVERLAY)
			for(var/o2 in o.underlays)
				i2.Blend(icon(o2:icon,o2:icon_state,o2:dir,1),ICON_UNDERLAY)
			i.Blend(i2,ICON_OVERLAY)
		return i
*/


/*mob/var/tmp/AstralDelay=0
obj
	AstralRelease
		icon='Backdrop.dmi'
		icon_state="release"
		layer=FLY_LAYER+666
		screen_loc="1,1"
		Click()
			usr.AstralDelay=0
			usr.KBunshinOn=0
			usr.firing=0
			usr.controlled=null
			usr.client.perspective=MOB_PERSPECTIVE
			usr.client.eye=usr
			for(var/mob/npcs/Bunshin/K in world)
				if(K.Owner==usr)
					del(K)
			del(src)
mob/akatsukimember/verb/Astral_Projection()
	set category="Organization"
	var/dx=1;var/dy=1;var/dz=1
	switch(input(usr,"Do you want to go to a specific location or to another Akatsuki Member?") in list("Location","Member"))
		if("Location")
			dx=input(usr,"Choose an x coordinate") as num
			dy=input(usr,"Choose a y coordinate") as num
			dz=input(usr,"Choose a z coordinate") as num
		if("Member")
			var/list/Members=list()
			for(var/mob/M in world)
				if(M.akatsukimember)
					Members+=M
			var/mob/SpecificMember=input(usr,"Which member?") in Members
			dx=SpecificMember.x;dy=SpecificMember.y;dz=SpecificMember.z
	if(src.AstralDelay)
		src<<"You need to wait to use this.";return
	usr.AstralDelay=1
	spawn(600)
		usr.AstralDelay=0
	usr.chakra-=400
	usr.Handseals(70-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/mob/npcs/Bunshin/K=new()
	K.loc=locate(dx,dy,dz)
	K.Owner=src;sleep(5)
	usr.client.screen+=new /obj/AstralRelease
	usr.controlled=K;usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;usr.client.eye=K
	if(K)
		K.health=1;K.stamina=0
		K.icon='Base.dmi';var/Khair=usr.hair;Khair-=rgb(255,255,255);K.overlays+=Khair;K.overlays+='JinKo.dmi'
		K.name="[src.name]";K.Owner=src
		K.tai=1;K.nin=1;K.gen=1
		K.Clone=1;K.Running=1;K.human=1
		usr.KBunshinOn=1
		usr.firing=1
		return*/

mob/var
	OrgXMember=0
	OrgXLeader=0
	Zodiac="N/A"
mob/Organization_X
	verb
		XSay(msg as text)
			set category="Organization X"
			set name="Org Say"
			set desc = "Say something to every online member"
			var/list/L = list("<font")
			for(var/H in L)
				if(findtext(msg,H))
					alert(usr,"No HTML in text!");return
				if(length(msg)>=400)
					alert(usr,"Message is too long");return
			for(var/mob/M in world)
				if(M.OrgXMember)
					M<<"<font face=trebuchet MS><font color=#5B4D4D size=2>(Organization X)</font><font size=1 color=#5B4D4D> - ([usr.Zodiac]) - [usr.oname]</font><font face=trebuchet MS><font color=#A38A8A>: [msg]</font>"
		XWho()
			set category="Organization X"
			set name="Org Who"
			usr<<"<font color=#5B4D4D>Online Members -"
			for(var/mob/M in world)
				if(M.OrgXMember&&M.client){usr<<"<font color = #A38A8A>[M.oname]"}
mob/owner/verb/MakeOrgXMember(mob/M in world)
	if(M.client&&!M.OrgXMember)
		M.OrgXMember=1
		M.verbs+=typesof(/mob/Organization_X/verb)
		var/Zodiac=input(usr,"Which Zodiac are they?") in list("Picses","Aries","Aquarius","Gemini","Scorpio","Virgo","Leo","Libra","Sagitarrius","Tauro","Cancer","Capricorn")
		M.Zodiac=Zodiac


mob/Xiv
	verb/XivInvite(mob/M in world)
		set category="Xiveres"
		set name="Invite to Xiveres"
		switch(input(M,"Would you like to join Xiveres?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.XiveresMember&&!M.XiveresLeader)
					M.XiveresMember=1
					M.verbs+=typesof(/mob/XivMember/verb)
					var/obj/Clothes/XiveresCloak/A=new()
					A.Move(M)
					var/obj/Clothes/XiveresMask/A2=new()
					A2.Move(M)
				else
					usr<<"Cannot be done, they're already in the Organization."
			if("No")
				usr<<"[M] denied your invite."

	verb/XivBoot(mob/M in world)
		set category="Xiveres"
		set name="Boot from Xiveres"
		M.XiveresMember=0
		M.verbs-=typesof(/mob/XivMember/verb)
	verb/AssignARank(mob/M in world)
		set category="Xiveres"
		set name="Assign Member Rank"
		var/Number=input(usr,"What rank do you want to assign [M]?",) as num
		M.ARank=Number
		for(var/mob/X in world)
			if(X.XiveresMember)
				X<<"<font size=2><font face=trebuchet MS><font color=red>[M] is now Rank [Number] in Xiveres."
mob/Xiv
	verb/Astral(mob/M in world)
		set category = "Xiveres"
		if(!src.AstralWindow)
			AstralWindow = 1
			var/obj/AstralWindow/AA=new();AA.screen_loc = "13,7";src.client.screen += AA;AA.Watch = M;AA.RSpot=list("x"=-3,"y"=3)
			var/obj/AstralWindow/AB=new();AB.screen_loc = "14,7";src.client.screen += AB;AB.Watch = M;AB.RSpot=list("x"=-2,"y"=3)
			var/obj/AstralWindow/AC=new();AC.screen_loc = "15,7";src.client.screen += AC;AC.Watch = M;AC.RSpot=list("x"=-1,"y"=3)
			var/obj/AstralWindow/AD=new();AD.screen_loc = "16,7";src.client.screen += AD;AD.Watch = M;AD.RSpot=list("x"=0,"y"=3)
			var/obj/AstralWindow/AE=new();AE.screen_loc = "17,7";src.client.screen += AE;AE.Watch = M;AE.RSpot=list("x"=1,"y"=3)
			var/obj/AstralWindow/AF=new();AF.screen_loc = "18,7";src.client.screen += AF;AF.Watch = M;AF.RSpot=list("x"=2,"y"=3)
			var/obj/AstralWindow/AG=new();AG.screen_loc = "19,7";src.client.screen += AG;AG.Watch = M;AG.RSpot=list("x"=3,"y"=3)

			var/obj/AstralWindow/BA=new();BA.screen_loc = "13,6";src.client.screen += BA;BA.Watch = M;BA.RSpot=list("x"=-3,"y"=2)
			var/obj/AstralWindow/BB=new();BB.screen_loc = "14,6";src.client.screen += BB;BB.Watch = M;BB.RSpot=list("x"=-2,"y"=2)
			var/obj/AstralWindow/BC=new();BC.screen_loc = "15,6";src.client.screen += BC;BC.Watch = M;BC.RSpot=list("x"=-1,"y"=2)
			var/obj/AstralWindow/BD=new();BD.screen_loc = "16,6";src.client.screen += BD;BD.Watch = M;BD.RSpot=list("x"=0,"y"=2)
			var/obj/AstralWindow/BE=new();BE.screen_loc = "17,6";src.client.screen += BE;BE.Watch = M;BE.RSpot=list("x"=1,"y"=2)
			var/obj/AstralWindow/BF=new();BF.screen_loc = "18,6";src.client.screen += BF;BF.Watch = M;BF.RSpot=list("x"=2,"y"=2)
			var/obj/AstralWindow/BG=new();BG.screen_loc = "19,6";src.client.screen += BG;BG.Watch = M;BG.RSpot=list("x"=3,"y"=2)

			var/obj/AstralWindow/CA=new();CA.screen_loc = "13,5";src.client.screen += CA;CA.Watch = M;CA.RSpot=list("x"=-3,"y"=1)
			var/obj/AstralWindow/CB=new();CB.screen_loc = "14,5";src.client.screen += CB;CB.Watch = M;CB.RSpot=list("x"=-2,"y"=1)
			var/obj/AstralWindow/CC=new();CC.screen_loc = "15,5";src.client.screen += CC;CC.Watch = M;CC.RSpot=list("x"=-1,"y"=1)
			var/obj/AstralWindow/CD=new();CD.screen_loc = "16,5";src.client.screen += CD;CD.Watch = M;CD.RSpot=list("x"=0,"y"=1)
			var/obj/AstralWindow/CE=new();CE.screen_loc = "17,5";src.client.screen += CE;CE.Watch = M;CE.RSpot=list("x"=1,"y"=1)
			var/obj/AstralWindow/CF=new();CF.screen_loc = "18,5";src.client.screen += CF;CF.Watch = M;CF.RSpot=list("x"=2,"y"=1)
			var/obj/AstralWindow/CG=new();CG.screen_loc = "19,5";src.client.screen += CG;CG.Watch = M;CG.RSpot=list("x"=3,"y"=1)

			var/obj/AstralWindow/DA=new();DA.screen_loc = "13,4";src.client.screen += DA;DA.Watch = M;DA.RSpot=list("x"=-3,"y"=0)
			var/obj/AstralWindow/DB=new();DB.screen_loc = "14,4";src.client.screen += DB;DB.Watch = M;DB.RSpot=list("x"=-2,"y"=0)
			var/obj/AstralWindow/DC=new();DC.screen_loc = "15,4";src.client.screen += DC;DC.Watch = M;DC.RSpot=list("x"=-1,"y"=0)
			var/obj/AstralWindow/DD=new();DD.screen_loc = "16,4";src.client.screen += DD;DD.Watch = M;DD.RSpot=list("x"=0,"y"=0)
			var/obj/AstralWindow/DE=new();DE.screen_loc = "17,4";src.client.screen += DE;DE.Watch = M;DE.RSpot=list("x"=1,"y"=0)
			var/obj/AstralWindow/DF=new();DF.screen_loc = "18,4";src.client.screen += DF;DF.Watch = M;DF.RSpot=list("x"=2,"y"=0)
			var/obj/AstralWindow/DG=new();DG.screen_loc = "19,4";src.client.screen += DG;DG.Watch = M;DG.RSpot=list("x"=3,"y"=0)

			var/obj/AstralWindow/EA=new();EA.screen_loc = "13,3";src.client.screen += EA;EA.Watch = M;EA.RSpot=list("x"=-3,"y"=-1)
			var/obj/AstralWindow/EB=new();EB.screen_loc = "14,3";src.client.screen += EB;EB.Watch = M;EB.RSpot=list("x"=-2,"y"=-1)
			var/obj/AstralWindow/EC=new();EC.screen_loc = "15,3";src.client.screen += EC;EC.Watch = M;EC.RSpot=list("x"=-1,"y"=-1)
			var/obj/AstralWindow/ED=new();ED.screen_loc = "16,3";src.client.screen += ED;ED.Watch = M;ED.RSpot=list("x"=0,"y"=-1)
			var/obj/AstralWindow/EE=new();EE.screen_loc = "17,3";src.client.screen += EE;EE.Watch = M;EE.RSpot=list("x"=1,"y"=-1)
			var/obj/AstralWindow/EF=new();EF.screen_loc = "18,3";src.client.screen += EF;EF.Watch = M;EF.RSpot=list("x"=2,"y"=-1)
			var/obj/AstralWindow/EG=new();EG.screen_loc = "19,3";src.client.screen += EG;EG.Watch = M;EG.RSpot=list("x"=3,"y"=-1)

			var/obj/AstralWindow/FA=new();FA.screen_loc = "13,2";src.client.screen += FA;FA.Watch = M;FA.RSpot=list("x"=-3,"y"=-2)
			var/obj/AstralWindow/FB=new();FB.screen_loc = "14,2";src.client.screen += FB;FB.Watch = M;FB.RSpot=list("x"=-2,"y"=-2)
			var/obj/AstralWindow/FC=new();FC.screen_loc = "15,2";src.client.screen += FC;FC.Watch = M;FC.RSpot=list("x"=-1,"y"=-2)
			var/obj/AstralWindow/FD=new();FD.screen_loc = "16,2";src.client.screen += FD;FD.Watch = M;FD.RSpot=list("x"=0,"y"=-2)
			var/obj/AstralWindow/FE=new();FE.screen_loc = "17,2";src.client.screen += FE;FE.Watch = M;FE.RSpot=list("x"=1,"y"=-2)
			var/obj/AstralWindow/FF=new();FF.screen_loc = "18,2";src.client.screen += FF;FF.Watch = M;FF.RSpot=list("x"=2,"y"=-2)
			var/obj/AstralWindow/FG=new();FG.screen_loc = "19,2";src.client.screen += FG;FG.Watch = M;FG.RSpot=list("x"=3,"y"=-2)

			var/obj/AstralWindow/GA=new();GA.screen_loc = "13,1";src.client.screen += GA;GA.Watch = M;GA.RSpot=list("x"=-3,"y"=-3)
			var/obj/AstralWindow/GB=new();GB.screen_loc = "14,1";src.client.screen += GB;GB.Watch = M;GB.RSpot=list("x"=-2,"y"=-3)
			var/obj/AstralWindow/GC=new();GC.screen_loc = "15,1";src.client.screen += GC;GC.Watch = M;GC.RSpot=list("x"=-1,"y"=-3)
			var/obj/AstralWindow/GD=new();GD.screen_loc = "16,1";src.client.screen += GD;GD.Watch = M;GD.RSpot=list("x"=0,"y"=-3)
			var/obj/AstralWindow/GE=new();GE.screen_loc = "17,1";src.client.screen += GE;GE.Watch = M;GE.RSpot=list("x"=1,"y"=-3)
			var/obj/AstralWindow/GF=new();GF.screen_loc = "18,1";src.client.screen += GF;GF.Watch = M;GF.RSpot=list("x"=2,"y"=-3)
			var/obj/AstralWindow/GG=new();GG.screen_loc = "19,1";src.client.screen += GG;GG.Watch = M;GG.RSpot=list("x"=3,"y"=-3)
		else
			for(var/obj/AstralWindow/W in src.client.screen)
				W.Watch = M
		usr << "Click the generated screen to turn off the window!"
mob/XivMember
	verb/XiveresSay(msg as text)
		set category="Xiveres"
		set name="Xiveres Say"
		set desc = "Say something to every member of Xiveres"
		var/list/L = list("<")
		if(usr.CantAlert)
			usr<<"You can't use this right now."
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.XiveresMember||M.XiveresLeader)
				M<<"<font face=trebuchet MS><font color=red size=2>(Xiveres Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=gray>: [msg]</font>"
	verb/XiveresWho()
		set category="Xiveres"
		set name="Xiveres Who"
		usr<<"<font color=red>Online Xiveres Members -"
		for(var/mob/M in world)
			if(M.XiveresMember&&M.client){usr<<"<font color = gray>[M.oname]"}
mob/var
	XiveresMember=0
	XiveresLeader=0
obj/Clothes/XiveresCloak
	icon='XiveresCloakUpdate.dmi'
	name="Xiveres Cloak"
	bodyarea="TorsoTop"
	EquipmentType="Armor"
	ArmorAddOn=35
	layer=MOB_LAYER+1
	worn=0
	Durability=75
	DurabilityCap=75
	Wear()
		..()
obj/Clothes/XiveresMask
	icon='Icons/New Base/Clothing/Member Shop Clothing/IchigoMask.dmi'
	name="Xiveres Mask"
	bodyarea="FaceTop"
	ArmorAddOn=2
	layer=MOB_LAYER+1
	worn=0
	Wear()
		if(src.worn == 1)
			src:worn = 0
			usr.name = usr.oname
			usr.overlays -= src.icon
			usr << "You remove the [src.name]."
			src.suffix = ""
		else
			src:worn = 1
			usr.oname = usr.name
			usr.name = "Wandering Soul"
			usr.overlays += src.icon
			usr << "You wear the [src.name]."
			src.suffix = "Equipped"

obj/Clothes/XiveresLeaderMask
	name = "Xiveres Leader Mask"
	bodyarea="FaceTop"
	icon='Icons/New Base/Clothing/Member Shop Clothing/IchigoMask2.dmi'//dont have a base icon so cant make weights icon!lol
	ArmorAddOn=20
	layer = MOB_LAYER + 1
	worn = 0
	var/OwnerActivated=0

	Wear()
		if(src.worn == 1)
			src:worn = 0
			usr.name = usr.oname
			usr.overlays -= 'Icons/New Base/Clothing/Member Shop Clothing/IchigoMask2.dmi'//temp icon
			usr << "You remove the [src.name]."
			src.suffix = ""
		else
			src:worn = 1
			usr.oname = usr.name
			usr.name = "Xiveres Ghost"
			usr.overlays += 'Icons/New Base/Clothing/Member Shop Clothing/IchigoMask2.dmi'
			usr << "You wear the [src.name]."
			src.suffix = "Equipped"

//Sono Karite
obj/Clothes/SonoKariteMask
	name = "Hidden Mask"
	bodyarea="FaceTop"
	icon='Tobi.dmi'//dont have a base icon so cant make weights icon!lol
	layer = MOB_LAYER + 1
	worn = 0
	var/OwnerActivated=0

	Wear()
		if(src.worn == 1)
			src:worn = 0
			usr.name = usr.oname
			usr.overlays -= 'Tobi.dmi'//temp icon
			usr << "You remove the [src.name]."
			src.suffix = ""
		else
			src:worn = 1
			usr.oname = usr.name
			usr.name = "Sono Karite"
			usr.overlays += 'Tobi.dmi'
			usr << "You wear the [src.name]."
			src.suffix = "Equipped"
obj/Clothes/AnchientMask
	name = "Tobi"
	bodyarea="FaceTop"
	icon='Tobi.dmi'//dont have a base icon so cant make weights icon!lol
	layer = MOB_LAYER + 1
	worn = 0
	var/OwnerActivated=0

	Wear()
		if(src.worn == 1)
			src:worn = 0
			usr.name = usr.oname
			usr.overlays -= 'Tobi.dmi'//temp icon
			usr << "You remove the [src.name]."
			src.suffix = ""
		else
			src:worn = 1
			usr.oname = usr.name
			usr.name = "Tobi"
			usr.overlays += 'Tobi.dmi'
			usr << "You wear the [src.name]."
			src.suffix = "Equipped"



//Senju Clan
mob/var
	SenjuLeader=0
	YellowFlash=0
mob/Senju
	verb/Invite(mob/M in world)
		set category="Clan"
		set name="Invite to Senju"
		switch(input(M,"Would you like to join the Senju Clan?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.SenjuLeader&&M.Clan=="Basic")
					M.Clan="Senju"
					M.verbs+=typesof(/mob/SenjuMember/verb)
				else
					usr<<"Cannot be done, they're already in the Senju or some other clan."
			if("No")
				usr<<"[M] denied your invite."

	verb/Boot(mob/M in world)
		set category="Clan"
		set name="Exile from Senju"
		if(M.Clan=="Senju")
			M.Clan="Basic"
			M.verbs-=typesof(/mob/SenjuMember/verb)
			for(var/mob/X in world)
				if(X.Clan=="Senju")
					X<<"<font color=#deb887>[M] has been Exiled from the Senju Clan!</font>"

mob/YellowFlashMaster
	verb/Invite(mob/M in world)
		set category="Guild"
		set name="Invite to Students"
		switch(input(M,"Would you like to join the Students of the Yellow Flash?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.YellowFlash)
					M.YellowFlash=1
					M.SaveK()
					sleep(30)
					M<<"You should relog to complete your initiation."
				else
					usr<<"Cannot be done, they're already in the Senju or some other clan."
			if("No")
				usr<<"[M] denied your invite."

	verb/Boot(mob/M in world)
		set category="Guild"
		set name="Exile from Students"
		if(M.YellowFlash)
			M.YellowFlash=0
			var/Path=text2path("/obj/SkillCards/FlyingThunderGod")
			var/obj/SkillCards/S = locate(Path) in M.LearnedJutsus
			if(!S)
			//	continue
				return
			else
				S.NonKeepable=1
				M.LearnedJutsus-=S
			for(var/mob/X in world)
				if(X.YellowFlash)
					X<<"<font color=#deb887>[M] has been Exiled from the Students of the Yellow Flash!</font>"
			M.SaveK()
			sleep(50)
			del(M)


mob/YellowFlash
	verb/GuildSay(msg as text)
		set category="Guild"
		set name="Guild Say"
		set desc = "Say something to every student"
		var/list/L = list("<")
		if(usr.CantAlert)
			usr<<"You can't use this right now."
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.YellowFlash)
				M<<"<font face=trebuchet MS><font color=#a0900c size=2>(Guild Say)</font><font size=1> - [usr.name]</font><font face=trebuchet MS><font color=#e8d31e>: [msg]</font>"
	verb/GuildWho()
		set category="Guild"
		set name="Guild Who"
		usr<<"<font color=#a0900c>Online Students of the Yellow Flash:"
		for(var/mob/M in world)
			if(M.YellowFlash){usr<<"<font color = #e8d31e>[M.oname]</font>"}

mob/Semideus
	verb/Invite(mob/M in world)
		set category="Clan"
		set name="Invite to Hebi"
		switch(input(M,"Would you like to join Hebi?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.SemideusLeader&&!M.SemideusMember)
					M.SemideusMember=1
					M.verbs+=typesof(/mob/SemideusMember/verb)
				else
					usr<<"Cannot be done, they're already in Hebi"
			if("No")
				usr<<"[M] denied your invite."

	verb/Boot(mob/M in world)
		set category="Clan"
		set name="Exile from Hebi"
		if(M.SemideusMember)
			M.SemideusMember=0
			M.verbs-=typesof(/mob/SemideusMember/verb)
			for(var/mob/X in world)
				if(X.SemideusMember)
					X<<"<font color=#deb887>[M] has been Exiled from Hebi!</font>"

mob/SemideusMember
	verb/ClanSay(msg as text)
		set category="Clan"
		set name="Clan Say"
		set desc = "Say something to every member of Hebi"
		var/list/L = list("<")
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.SemideusMember)
				M<<"<font face=trebuchet MS><font color=green size=2>(Semideus Say)</font><font size=1> - [usr.name]</font><font face=trebuchet MS><font color=#deb887>: [msg]</font>"
	verb/ClanWho()
		set category="Clan"
		set name="Semideus Who"
		usr<<"<font color=green>Online Hebi Members -"
		for(var/mob/M in world)
			if(M.SemideusMember&&M.client){usr<<"<font color = #deb887>[M.oname]</font>"}

mob/SenjuMember
	verb/ClanSay(msg as text)
		set category="Clan"
		set name="Clan Say"
		set desc = "Say something to every member of the Senju"
		var/list/L = list("<")
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.Clan=="Senju")
				M<<"<font face=trebuchet MS><font color=green size=2>(Senju Say)</font><font size=1> - [usr.name]</font><font face=trebuchet MS><font color=#deb887>: [msg]</font>"
	verb/ClanWho()
		set category="Clan"
		set name="Senju Who"
		usr<<"<font color=green>Online Senju Clan Members -"
		for(var/mob/M in world)
			if(M.Clan=="Senju"&&M.client){usr<<"<font color = #deb887>[M.oname]</font>"}



mob/NosinasisMemoria
	verb/NosinasisMemoriaInvite(mob/M in world)
		set category="Nosinasis Memoria"
		set name="Invite to Nosinasis Memoria"
		switch(input(M,"Would you like to join Nosinasis Memoria?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.NosinasisMemoriaMember&&!M.NosinasisMemoriaLeader)
					M.NosinasisMemoriaMember=1
					M.verbs+=typesof(/mob/NosinasisMemoriaMember/verb)
					var/obj/Clothes/NosinasisMemoriaCloak/A=new()
					A.Move(M)
				else
					usr<<"Cannot be done, they're already in the Organization."
			if("No")
				usr<<"[M] denied your invite."

	verb/NosinasisMemoriaBoot(mob/M in world)
		set category="Nosinasis Memoria"
		set name="Boot from Organization"
		if(M.ARank=="Co-Leader"&&src.ARank!="Leader")
			src<<"Only the leader can boot a Co-Leader."
			return
		if(M.ARank!="Leader")
			M.NosinasisMemoriaMember=0
			M.verbs-=typesof(/mob/NosinasisMemoriaMember/verb)
		else
			src<<"[M] is the leader and cannot be booted."
			return
	verb/Promote(mob/M in world)
		set category="Nosinasis Memoria"
		set name="Promote Member"
		var/Choice=input(usr,"What rank do you want to assign [M]?",) in list("Co-Leader","Healer","Combatant","Infiltrator")
		M.ARank=Choice
		for(var/mob/X in world)
			if(X.NosinasisMemoriaMember)
				X<<"<font size=2><font face=trebuchet MS><font color=red>[M] is now a [Choice] in Nosinasis Memoria."
mob/NosinasisMemoriaMember
	verb/NosinasisMemoriaSay(msg as text)
		set category="Nosinasis Memoria"
		set name="Nosinasis Memoria Say"
		set desc = "Say something to every member of Nosinasis Memoria"
		var/list/L = list("<")
		if(usr.CantAlert)
			usr<<"You can't use this right now."
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.NosinasisMemoriaMember||M.NosinasisMemoriaLeader)
				M<<"<font face=trebuchet MS><font color=gray size=2>(Nosinasis Memoria Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=red>: [msg]</font>"
	verb/NosinasisMemoriaWho()
		set category="Nosinasis Memoria"
		set name="Nosinasis Memoria Who"
		usr<<"<font color=red>Online Nosinasis Memoria Members -"
		for(var/mob/M in world)
			if(M.NosinasisMemoriaMember&&M.client){usr<<"<font color = gray>[M.oname]"}











mob/SevenSkies
	verb/SevenSkiesInvite(mob/M in world)
		set category="Seven Skies"
		set name="Invite to 7 Skies"
		switch(input(M,"Would you like to join Seven Skies?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.SevenSkiesMember&&!M.SevenSkiesLeader)
					M.SevenSkiesMember=1
					M.verbs+=typesof(/mob/SevenSkiesMember/verb)
				else
					usr<<"Cannot be done, they're already in the Organization."
			if("No")
				usr<<"[M] denied your invite."

	verb/SevenSkiesBoot(mob/M in world)
		set category="Seven Skies"
		set name="Boot from Organization"
		if(M.ARank=="Strato"&&src.ARank!="Skyle")
			src<<"Only the leader can boot a Co-Leader."
			return
		if(M.ARank!="Skyle")
			M.SevenSkiesMember=0
			M.verbs-=typesof(/mob/SevenSkiesMember/verb)
		else
			src<<"[M] is the leader and cannot be booted."
			return
	verb/Promote(mob/M in world)
		set category="Seven Skies"
		set name="Promote Member"
		var/Choice=input(usr,"What rank do you want to assign [M]?",) in list("Strato","Enox","Thermo","Axis","Angle","Plaxo")
		M.ARank=Choice
		for(var/mob/X in world)
			if(X.SevenSkiesMember)
				X<<"<font size=2><font face=trebuchet MS><font color=blue>[M] is now a [Choice] in Seven Skies."
mob/SevenSkiesMember
	verb/SevenSkiesSay(msg as text)
		set category="Seven Skies"
		set name="Seven Skies Say"
		set desc = "Say something to every member of Seven Skies"
		var/list/L = list("<")
		if(usr.CantAlert)
			usr<<"You can't use this right now."
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"No HTML in text!");return
			if(length(msg)>=400)
				alert(usr,"Message is too long");return
		for(var/mob/M in world)
			if(M.SevenSkiesMember||M.SevenSkiesLeader)
				if(usr.ARank=="Skyle")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#FF0000>: [msg]</font>"
				if(usr.ARank=="Axis")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#01DF74>: [msg]</font>"
				if(usr.ARank=="Enox")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#FFFF00>: [msg]</font>"
				if(usr.ARank=="Thermo")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#DF7401>: [msg]</font>"
				if(usr.ARank=="Angle")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#FF00FF>: [msg]</font>"
				if(usr.ARank=="Plaxo")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#81BEF7>: [msg]</font>"
				if(usr.ARank=="Strato")
					M<<"<font face=trebuchet MS><font color=gray size=2>(Seven Skies Say)</font><font size=1> - ([usr.ARank]) - [usr.oname]</font><font face=trebuchet MS><font color=#FFFFFF>: [msg]</font>"

	verb/SevenSkiesWho()
		set category="Seven Skies"
		set name="Seven Skies Who"
		usr<<"<font color=red>Online Seven Skies Members -"
		for(var/mob/M in world)
			if(M.SevenSkiesMember&&M.client){usr<<"<font color = gray>[M.oname]"}



mob/var
	NosinasisMemoriaMember=0
	NosinasisMemoriaLeader=0
	SevenSkiesMember=0
	SevenSkiesLeader=0
	HebiLeader=0
	HebiMember=0


obj/Clothes/NosinasisMemoriaCloak
	icon='XiveresCloak.dmi'
	name="Nosinasis Memoria Cloak"
	bodyarea="TorsoTop"
	ArmorAddOn=25
	EquipmentType="Armor"
	layer=MOB_LAYER+1
	worn=0
	Durability=55
	DurabilityCap=55