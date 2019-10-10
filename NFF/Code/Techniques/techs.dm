mob/var/FrozenBind=""
obj/SmokeCloud
	icon='NarutoStuff.dmi'
	icon_state="Smoke"
	layer=MOB_LAYER+2
	New()
//		src.SoundEngine('Smoke.wav',10)
		..()
		spawn(5)
			del(src)
obj/Log
	icon = 'log.dmi'
	icon_state = ""
	density=1
obj/DojoLog
	icon = 'log.dmi'
	icon_state = ""
	density=1
obj/SwordLog
	icon = 'SwordLog.dmi'
	icon_state = ""
	density = 1

obj/var/tmp
	speeding=0
	Move_Delay = 0

mob/proc
	WarpDodge(obj/O)
		if(src.Stun>0||src.FrozenBind!=""||src.icon_state=="handseal")
			return
		var/list/Turfs=list()
		for(var/turf/T in orange(5,src))
			if(!T.density && !(T in getline(src,O)))
				Turfs+=T
		if(Turfs.len>0)
			WarpEfx(src.x,src.y,src.z)
			flick("zan",src)
			src.loc=pick(Turfs)
	TestDodge(obj/O)
		if(src.Stun>0||src.FrozenBind!=""||src.icon_state=="handseal"||src.icon_state=="Block")
			return
		var/RandomChoice=pick("Dodge","Shushin","Counter") //Counter falls to Shushin if the object cannot be effectively countered.
																//Block is the last resort if there are no good tiles to move to.
		if(RandomChoice=="Counter")
			src<<"Countering!"
			if(istype(O,/obj/WEAPONS/))
				if(src.WeaponInLeftHand||src.WeaponInRightHand)
					src.LeftHandSheath=1;src.RightHandSheath=1
					src.FaceAtom(O);src.icon_state="Block";src.Guarding=1
					spawn(13)
						src.LeftHandSheath=0;src.RightHandSheath=0
						src.icon_state="";src.Guarding=0
				else
					RandomChoice=pick("Dodge","Shushin")
					src<<"Mudou para [RandomChoice]!"
			else if(istype(O,/obj/Jutsu/Elemental/))
				var/random=rand(1,3)
				if(random==1)
					var/obj/SkillCards/Doryuuheki/A=locate(/obj/SkillCards/Doryuuheki) in src.LearnedJutsus
					if(A&&!A.Delay)
						A.Activate(src)
					else
						random=2
				if(random==2)
					var/obj/SkillCards/DorukiGaeshi/A=locate(/obj/SkillCards/DorukiGaeshi) in src.LearnedJutsus
					if(A&&!A.Delay)
						src.FaceAtom(O)
						A.Activate(src)
					else
						random=3
				if(random==3)
					var/obj/SkillCards/Kaiten/A=locate(/obj/SkillCards/Kaiten) in src.LearnedJutsus
					if(A&&!A.Delay)
						A.Activate(src)
					else
						random=4
				if(random==4)
					RandomChoice="Shushin"
					src<<"Switching to Shushin!"
			else
				RandomChoice="Dodge"
				src<<"Switching to Dodge!"
		if(RandomChoice=="Shushin")
			src<<"Attempting to dodge by: [RandomChoice]"
			var/list/Turfs=list()
			for(var/turf/T in orange(3,src))
				if(!T.density && !(T in getline(src,O)))
					Turfs+=T
			if(Turfs.len>0)
				flick("zan",src)
				src.loc=pick(Turfs)

			else
				RandomChoice="Block"
		if(RandomChoice=="Dodge")
			src<<"Attempting to dodge by: [RandomChoice]"
			var/list/Turfs=list()
			for(var/turf/T in orange(1,src))
				if(get_dir(src,T)==src.dir||get_dir(src,T)==turn(src.dir,45)||get_dir(src,T)==turn(src.dir,-45)||get_dir(src,T)==turn(src.dir,90)||get_dir(src,T)==turn(src.dir,-90))
					if(!T.density && !(T in getline(src,O)))
						Turfs+=T
			if(Turfs.len>0)
				var/turf/L=pick(Turfs)
				src.Move(L,get_dir(src,L))
			else
				RandomChoice="Block"
		if(RandomChoice=="Block")
			src<<"Blocking!"
			src.FaceAtom(O);src.icon_state="Block";src.Guarding=1
			spawn(16)
				src.LeftHandSheath=0;src.RightHandSheath=0
				src.icon_state="";src.Guarding=0

obj/Move()
	if(src.speeding==1&&src.Move_Delay>=0)
		return
	if(src.speeding <= 0||src.Move_Delay<0)
		src.speeding = 1
		for(var/atom/movable/A in get_steps(src,src.dir,2))
			if(ismob(A))
				if(A:key==""||(A:key==""&&prob(15))||(A:key==""&&prob(15)))
				//	A:TestDodge(src)
					A:WarpDodge(src)
			//	if((A:key=="Shiharu"&&prob(15))||(A:key=="TheUndyingOne"&&prob(15)))
			//		A:WarpDodge(src)
				if(A:FTG_Mode)
					if(prob(20)||(A:Guarding&&prob(30)))
						A:WarpDodge(src)
		..()
		if(!(istype(src,/obj/WEAPONS)))
			sleep(src.Move_Delay)
		src.speeding = 0
mob/var/tmp/Dodging=0
mob/var/tmp/GateCharging=0
mob/var/tmp/Charging=0
mob/var/tmp/HealGateTime=0
mob/var/tmp/ConversusinChargeUp=0
mob/var/tmp/ChargingInstance
mob/GainedAfterLogIn/verb
	Z()
		set hidden=1
		usr.TimeToCharge=0
		if(usr.CastingMindControl&&usr.target!=null)
			usr.CastingMindControl=0
			var/mob/M=usr.target
			usr.MindControlStruggle(M)
		if(usr.LandedCurseSealParalysis==1)
			for(var/mob/M in oview(10,usr))
			//	spawn()
				if(M.CursedSealParalysis==1)
					world<<"[M] has it placed on them."
					M.CurseSealParalysis(usr)
			usr.LandedCurseSealParalysis=0
		if(usr.Fishing==1)
			if(usr.PressAButton=="Z"&&(usr.PressAButton!="X"))
				usr<<"Z detected in Chakra Button"
				usr.PressAButton=""
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
			if(usr.PressAButton=="X")
				usr<<"X detected in Chakra Button."
				usr.PressAButton="X"
		if(usr.GenerativeScrollOn)
			if(usr.FrozenBind=="Dead")
				usr<<"Nupe, can't do this while you're dead.";return
			if(usr.PressAButton=="Z")
				usr<<"You gained 100 EXP!"
				if(usr.GenerativeScrollOn==2)
					if(prob(15))
						usr.KatonKnowledge+=1
				if(usr.GenerativeScrollOn==3)
					if(prob(15))
						usr.FuutonKnowledge+=1
				if(usr.GenerativeScrollOn==4)
					if(prob(15))
						usr.DotonKnowledge+=1
				if(usr.GenerativeScrollOn==5)
					if(prob(15))
						usr.SuitonKnowledge+=1
				if(usr.GenerativeScrollOn==6)
					if(prob(15))
						usr.RaitonKnowledge+=1
				usr.exp+=100
				if(usr.Subscriber)
					usr.exp+=rand(20,35)
				usr.PressAButton=""
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
		//		for(var/obj/Effects/ZMash/A in usr.client.screen)
		//			del(A)
		//		for(var/obj/Effects/XMash/A in usr.client.screen)
		//			del(A)//Changed 11/16/12
			if(usr.PressAButton=="X")
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"Wrong button!"
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
//				for(var/obj/Effects/ZMash/A in usr.client.screen)
//					del(A)
//				for(var/obj/Effects/XMash/A in usr.client.screen)
//					del(A)
				usr.PressAButton=""
				usr.GenerativeScrollOn=0
				usr.Frozen=0
		if(usr.Status=="Asleep")
			return
		if(usr.Charging)
			return
		if(usr.inchoke||usr.Mogu||usr.Frozen||usr.knockedout||usr.Stun>=1||usr.DoingHandseals||usr.doingG||usr.inso||usr.Kaiten||usr.resting||usr.ingat||usr.firing&&!usr.intank||usr.FrozenBind!=""||usr.doingG||usr.Shibari||usr.UnableToChargeChakra)
			return
		if(usr.UsingDomu)
			usr<<"You are flowing your chakra into the rocks, you can't generate new chakra right now."
			return
		if(usr.HousenkaShots>=1)
			usr.HousenkaShoot()
			return
		usr.Charging=1
		var/Instance = rand(-1000000,1000000)
		usr.ChargingInstance = Instance//Essentually for keeping Z tap from stacking.
		var/HoldingFor = 0	//How long you've been holding Z.
//		while(usr.Charging&&usr.ConversusinMastery>=300&&usr.ConversusinEye==1)
//			usr.ConversusinChargeUp++
//			if(usr.ConversusinChargeUp==45)
//				usr.ConversusinBestialisAnguisSecondStage()
//			sleep(10)
		while(usr.Charging&&usr.ConversusinMastery>=300&&usr.ConversusinSecondStage&&usr.ConversusinSecondStageMastery>=300)
			usr.ConversusinChargeUp++
			if(usr.ConversusinChargeUp==40)
				usr.ConversusinBestialisAnguisThirdStage()
			sleep(10)
		while(usr.Charging && !usr.IntensityChakra && usr.ChargingInstance == Instance)
			if(usr.Guarding)
				if(usr.GateIn==""&&usr.HealGateTime>0)
					usr<<"Your body cannot take the stress of activating the chakra gates so soon. Wait a while."
					return
				usr.icon_state="Power"
				for(var/mob/Clones/Clone/B in world)
					if(B.Owner==usr)
						del(B)
				var/obj/WEAPONS/LOLO=usr.WeaponInRightHand
				var/obj/WEAPONS/LULU=usr.WeaponInLeftHand
				if(istype(LOLO,/obj/WEAPONS/BoomStaff)||istype(LULU,/obj/WEAPONS/BoomStaff))
					usr.BoomStickDefence()
				if(usr.InitialGate)
					usr.GateCharging+=1
				if(usr.GateCharging>=5)
					if(usr.InitialGate&&usr.GateIn==""&&usr.HealGateTime==0)
						usr<<"You unlock the first gate!"
						usr.GateCharging=0
						usr.GateIn="Initial"
						usr.HealGateTime++
						usr.tai+=usr.Mtai/4
						var/count=0
						for(var/obj/ReleaseThingy/A in usr.client.screen)
							count=1
						if(count==0)
							usr.client.screen+=new/obj/ReleaseThingy
						while(usr.GateIn=="Initial")
							var/drain=15-usr.TaiSkill
							if(drain<0) drain=0
							usr.health-=drain
							if(usr.TaiSkill>usr.GenSkill)
								usr.stamina-=(usr.TaiSkill*2-usr.GenSkill)
							sleep(11)
							usr.Death(usr)
						return
					if(usr.HealGate&&usr.GateIn=="Initial")
						usr<<"You unlock the second gate!"
						usr.GateCharging=0
						usr.GateIn="Heal"
						usr.deathcount+=0.1
						if(usr.stamina<=usr.maxstamina*0.75)
							usr<<"You force your body to give you more energy!"
							usr.deathcount+=1.15
						usr.stamina=usr.maxstamina*1.15
						if(usr.health<usr.maxhealth)
							usr.health+=50
							if(usr.health>usr.maxhealth)
								usr.health=usr.maxhealth
						var/count=0
						for(var/obj/ReleaseThingy/A in usr.client.screen)
							count=1
						if(count==0)
							usr.client.screen+=new/obj/ReleaseThingy
						while(usr.GateIn=="Heal")
							var/drain=20-usr.TaiSkill
							if(drain<0) drain=0
							usr.health-=drain
							usr.HealGateTime++
							usr.chakra-=100
							sleep(11)
							usr.Death(usr)
						return
					if(usr.LifeGate&&usr.GateIn=="Heal")
						usr<<"You unlock the third gate!"
						usr.GateCharging=0
						var/I='Icons/New Base/Base.dmi'
						I += rgb(120,0,0)
						usr.Oicon=usr.icon
						usr.icon=I
						usr.overlays+='Icons/Jutsus/BEyes.dmi'
						usr.GateIn="Life"
						usr.HealGateTime++
						usr.tai+=usr.Mtai/4
						usr.deathcount+=0.5
						usr.overlays+=/obj/Gates
						var/count=0
						for(var/obj/ReleaseThingy/A in usr.client.screen)
							count=1
						if(count==0)
							usr.client.screen+=new/obj/ReleaseThingy
						spawn(30)
							usr.overlays-=/obj/Gates
						while(usr.GateIn=="Life")
							var/drain=35-usr.TaiSkill
							if(drain<0) drain=0
							usr.health-=drain
							sleep(11)
							usr.Death(usr)
						return
					if(usr.WoundGate&&usr.GateIn=="Life")
						usr<<"You unlock the fourth gate!"
						usr.GateCharging=0
						usr.GateIn="Wound"
						usr.HealGateTime++
						usr.deathcount+=1//was 1.5
						usr.tai+=usr.Mtai/4
						usr.overlays+=/obj/Gates1
						var/count=0
						for(var/obj/ReleaseThingy/A in usr.client.screen)
							count=1
						if(count==0)
							usr.client.screen+=new/obj/ReleaseThingy
						spawn(30)
							usr.overlays-=/obj/Gates1
						while(usr.GateIn=="Wound")
							var/drain=50-usr.TaiSkill
							if(drain<5) drain=5
							usr.health-=drain
							usr.stamina-=drain*2
							sleep(11)
							usr.Death(usr)
						return
					if(usr.LimitGate&&usr.GateIn=="Wound")
						usr<<"You unlock the fifth gate!"
						usr.CreatebigCrator()

						usr.GateCharging=0
						usr.GateIn="Limit"
						usr.tai+=usr.tai/2
						usr.HealGateTime++
						usr.deathcount+=0.75//was 2
						usr.overlays+=/obj/Gates2
						var/count=0
						for(var/obj/ReleaseThingy/A in usr.client.screen)
							count=1
						if(count==0)
							usr.client.screen+=new/obj/ReleaseThingy
						spawn(30)
							usr.overlays-=/obj/Gates2
						while(usr.GateIn=="Limit")
							var/drain=45-usr.TaiSkill
							if(drain<20) drain=20
							usr.health-=drain
							usr.stamina-=drain*2
							sleep(11)
							usr.Death(usr)
						return
					if(usr.ViewGate&&usr.GateIn=="Limit")
						usr<<"You unlock the sixth gate!"
						usr.GateCharging=0
						usr.GateIn="View"
						usr.deathcount+=1.5//Was 3
						usr.HealGateTime++
						usr.tai+=usr.tai*2
						usr.pixel_step_size=32
						usr.overlays+=/obj/Gates3
						var/count=0
						for(var/obj/ReleaseThingy/A in usr.client.screen)
							count=1
						if(count==0)
							usr.client.screen+=new/obj/ReleaseThingy
						spawn(30)
							usr.overlays-=/obj/Gates3
						while(usr.GateIn=="View")
							var/drain=60-usr.TaiSkill
							if(drain<30) drain=30
							usr.health-=drain
							usr.stamina-=drain*2
							sleep(11)
							usr.Death(usr)
						return
			else
				if(usr.meditating)
					if(prob(2))
						usr<<"You focus your chakra!"
					if(usr.TypeLearning!="Taijutsu")
						usr.exp+=rand(2,5)
						if(usr.Subscriber)
							usr.exp+=rand(1,3)
					if(usr.TypeLearning=="Genjutsu")
						usr.exp+=rand(5,20)
						if(usr.Subscriber)
							usr.exp+=rand(5,8)
					usr.stamina-=5
				else if(usr.intank)
					usr.GatheredUpMeatTankCalories+=1
					usr.Normal();walk(usr,0)
					if(usr.GatheredUpMeatTankCalories==1)
						usr<<"You begin to charge up for a Meat Tank Rush Attack!"
					usr.calories-=100
					if(usr.GatheredUpMeatTankCalories>=2)
						usr<<"You have charged up [usr.GatheredUpMeatTankCalories] calories!"
					if(usr.GatheredUpMeatTankCalories>4)
						usr.GatheredUpMeatTankCalories=4
				else if(usr.ChargingRaikyuu)
					usr.icon_state="Power"
					usr.chakra-=usr.chakra/usr.GenSkill
					for(var/obj/Jutsu/Elemental/Raiton/Raikyuu/A in oview(3))
						if(findtext(A.icon_state,"Raikyuu",1,0)==1&&A.Owner==usr)
							A.ChargedDamage+=round((usr.NinSkill+usr.LightningChakra)/10)
				else if(usr.RasenganCharge!=0)
					usr.RasenganD+=(usr.chakra/25)
					usr.chakra-=usr.chakra/25
				else if(usr.ChidoriCharge)
					usr.icon_state="weapon"
					if(usr.Raikirion&&usr.ChidoriD<1500)
						usr.ChidoriD+=(usr.chakra*0.01)
						usr.chakra-=usr.Mchakra*0.05
					else
						if(usr.ChidoriD<1200)
							usr.ChidoriD+=(usr.chakra*0.005)
						usr.chakra-=usr.Mchakra*0.05
				else if(usr.UserChargingForChakraPunch)
					usr.ChargedChakraForPunch+=(usr.chakra/rand(10,13))
					usr.chakra-=usr.chakra/rand(8,12)
					//if(usr.ChargedChakraForPunch>1000)
					//	usr.ChargedChakraForPunch=1000
				else if(usr.UserChargingForChakraKick)
					usr.ChargedChakraForKick+=(usr.chakra/rand(10,13))
					usr.chakra-=usr.chakra/rand(9,12)
				else if(usr.ChargingForBaikaNoJutsu&&usr.calories>50)
					if(usr.BaikaCharged>(3+usr.SizeCap))
						usr<<"You can't charge anymore, that is your limit!";return
					usr.calories-=50
					usr.BaikaCharged+=2
					usr<<output("You charged up [usr.BaikaCharged] calories and have [usr.calories] left!","Attack")
					if(usr.BaikaCharged>(2+usr.SizeCap))
						if(prob(50))
							usr.SizeCap+=1
				else
					if(!usr.ChidoriCharge&&!usr.RasenganCharge&&usr.GateIn=="")
						usr.icon_state="handseal"
						if(usr.ChakraPool<=0&&usr.Trait2=="Adamant")
							usr<<"You force yourself to create and mold new chakra!"
							var/ChakraCreated=(usr.ChakraC+(src.GenSkill*2))*4
							src.chakra+=ChakraCreated
							if(src.chakra>src.Mchakra)
								src.chakra=src.Mchakra
							src.deathcount+=0.10
						else if(usr.ChakraPool<=0)
							usr.ChakraPool=0
							usr<<"You have no chakra left to draw out!"
							usr.stamina-=(usr.maxstamina/50)
							return
						else if(usr.chakra<usr.Mchakra)
							var/Drain=((usr.ChakraC*pick(1.0,1.25))+(src.GenSkill*2))*min(HoldingFor,5)//Caps at 5 seconds
							if(usr.InHellSent)
								if(prob(25))
									Drain=0;ChakraPool-=pick(10,15,20)
								if(prob(50))
									Drain/=2;usr.ChakraPool-=pick(25,50,75)
									Drain-=10
								if(prob(40))
									Drain/=3;usr.ChakraPool-=pick(10,20,50,100)
									Drain-=20
								Drain=(Drain*(pick(0.5,0.6,0.7,0.8,1.0)))
							if(usr.SageMode=="Slug")
								Drain*=2.5
							usr.chakra+=Drain
							usr.ChakraPool-=Drain
							if(usr.chakra>usr.Mchakra)
								usr.chakra=usr.Mchakra
							if(prob(80))
								usr.exp+=pick(0.5,1)
								if(usr.Subscriber)
									usr.exp+=pick(0,0.5)
					else
						return
			HoldingFor++
			sleep(8)
mob/proc/GenjutsuCanceling()
	if(src.CastingGenjutsu)
		src.CastingGenjutsu=0
		for(var/mob/M in world)
			if(M.GenjutsuBy=="[src]")
				src<<"You release the Genjutsu technique off of [M]!"
				M.GenjutsuBy=""
				src.CastingGenjutsu=0
				if(M.client)
					if(M.InGenjutsu=="Gyaku Bijon")
						M.client:dir=NORTH
					if(M.InGenjutsu=="Burizado")
						for(var/obj/Genjutsu/Blizzard/R in M.client.screen)
							del(R)
					if(M.InGenjutsu=="Gravity")
						for(var/obj/Genjutsu/Gravity/G in M.client.screen)
							del(G)
					if(M.InGenjutsu=="Kokuangyo")
						if(!M.knockedout)
							M.sight &= ~(SEE_SELF|BLIND)
					if(M.InGenjutsu=="Nemurihane")
						for(var/obj/Genjutsu/Feathers/R in M.client.screen)
							del(R)
					if(M.InGenjutsu=="Blazing Burn")
						for(var/image/c in M.client.images)
							if(c.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
								del(c)
					if(M.InGenjutsu=="Vortex")
						for(var/obj/Vortex/A in M.client.screen)
							del(A)
/*					if(M.InGenjutsu=="HekiKonchuu Ishuu")
						for(var/image/c in M.client.images)
							if(c.icon=='Swarm.dmi')
								del(c)
						for(var/obj/FakeSwarm/F in world)
							if(F.Owner==src)
								del(F)*/
				M.InGenjutsu=""
mob/GainedAfterLogIn/verb/ZRelease()
	set hidden=1
	usr.client.removeGrid()
	if(usr.ControllingPuppet1)
		for(var/mob/Puppet/Dragon/A in world)
			if(A.Owner==usr&&A.CanBreatheFire)
				A.PuppetFireBall("Fire")
		//	if(A.Owner==usr&&A.CanBreatheIce==1)
		//		A.PuppetIceBall("Light")
		//	if(A.Owner==usr&&A.CanBreatheIce==2)
		//		A.PuppetIceBall("Medium")
		//	if(A.Owner==usr&&A.CanBreatheIce==3)
		//		A.PuppetIceBall("Heavy")
			//	del(A)
	//	world<<"Recognized as controlling puppet, testing."
//		del(A)
	if(usr.InEisou)
		for(var/obj/Jutsu/Elemental/Raiton/EisouHead/A in world)
			if(A.Owner==usr)
				del(A)
	if(usr.InSemideusChakraArm)
		for(var/obj/Jutsu/SemideusChakraArmTip/A in world)
			if(A.Owner==usr)
				del(A)
	if(usr.inchoke)
		return
	if(usr.KaitenCharge&&!src.Kaiten)
		usr.KaitenCharge+=1
	if(src.Mogu)
		return
	if(src.Clan=="Kiro"||src.Clan=="Sabaku"||src.Clan=="Nara")
		if(src.Clan=="Kiro")
			for(var/obj/Jutsu/Kiro/ShurikenStar/S in src.JutsuList)
				src.chakra+=100
				src.Frozen=0
				del(S)
		else if(src.Clan=="Nara")
			for(var/obj/Nara/KageNui/A in world)
				if(A.Owner==src)
					del(A)
		else if(src.Clan=="Sabaku")
			for(var/obj/Jutsu/Sand/K in world)
				if(istype(K,/obj/Jutsu/Sand/kyuu))
					if(K.Owner==usr)
						del(K)
				else if(istype(K,/obj/Jutsu/Sand/kyuutrail))
					if(K.Owner==usr)
						del(K)
				else if(istype(K,/obj/Jutsu/Sand/SandWave))
					if(K.Owner==usr)
						del(K)
				else if(istype(K,/obj/Jutsu/Sand/SandTurf))
					if(K.Owner==usr)
						del(K)
				sleep(1)//Just added may need to be removed 11/16/2012
	/*	for(var/obj/Jutsu/Sand/kyuu/K in world)
			if(K.Owner==usr)
				del(K)
		for(var/obj/Jutsu/Sand/kyuutrail/K in world)
			if(K.Owner==usr)
				del(K)
		for(var/obj/Jutsu/Sand/SandWave/S in world)
			if(S.Owner==usr)
				del(S)
		for(var/obj/Jutsu/Sand/SandTurf/S2 in world)
			if(S2.Owner==usr)/Changed 11/16/12
	*///		del(S2)
/*
	if(src.Clan=="Nara")
		for(var/obj/Nara/KageNui/A in world)
			if(A.Owner==src)
				del(A)
				*/
	if(src.doingG)
		return
	if(usr.CastingGenjutsu)
		usr.GenjutsuCanceling()
	usr.Charging=0
	if(usr.TimeToAttack==9)
		src.TimeToAttack=10
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
			color:white;}</style>"
		sd_Alert(usr, "You charged your chakra!","[src]",,,,0,"400x150",,style)
		for(var/obj/Effects/ZMash/AAC in src.client.screen)
			del(AAC)
	if(usr.IntensityChakra)
		if(usr.FrozenBind=="Dead"||usr.Frozen||usr.firing||usr.knockedout)
			usr<<"Nupe, can't do this while you're dead.";return
		for(var/obj/BarSlider/B in usr.client.screen)
			if(B.Amount>0)
				usr<<"You were only [B.Amount] off from the middle!!"
				usr.chakra-=rand(30,80)
				usr.IntensityCombos=0
			if(B.Amount<=8&&B.Amount>=-8&&B.Amount!=0)
				usr<<"You still gained some EXP!"
				usr.IntensityCombos+=1
				if(usr.IntensityCombos>3) usr.IntensityCombos=3
				usr.exp+=rand(10,50)
				if(usr.Subscriber)
					usr.exp+=rand(10,20)

			else if (B.Amount==0)
				usr<<"You hit the dead middle!!!"
				usr.IntensityCombos+=2
				if(usr.Clan!="Fuuma"&&prob(5)&&usr.ChakraC<100)
					usr.ChakraC++
					if(usr.ChakraC>100)
						usr.ChakraC=100
				else if(usr.Clan=="Fuuma"&&prob(5)&&usr.ChakraC<150)
					usr.ChakraC++
					if(usr.ChakraC>=160)
						usr.ChakraC=160
				if(usr.IntensityCombos>3) usr.IntensityCombos=3
				if(prob(10)&&((usr.ChakraC<100&&usr.Clan!="Fuuma")||(usr.ChakraC<160&&usr.Clan=="Fuuma")))
					if(src.Clan=="Fuuma")
						usr.ChakraControl+=1
						usr.ChakraC+=1
						if(usr.ChakraControl>10) usr.ChakraControl=10
						if(usr.ChakraC>160) usr.ChakraC=160
				if(usr.TypeLearning!="Taijutsu")
					usr.exp+=(rand(100,250))*usr.IntensityCombos;
					if(usr.Subscriber)
						usr.exp+=rand(100,300)
					usr.chakra+=100
				if(usr.IntensityCombos>1)
					usr.client.screen+=new/obj/BarCombo
			else
				if(B.Amount<=8&&B.Amount>=-8&&B.Amount!=0)
					usr<<"You still gained some EXP!"
					usr.IntensityCombos+=1
					usr.exp+=rand(10,50)
					if(usr.Subscriber)
						usr.exp+=rand(10,25)
				else
					var/V = 0-B.Amount
					usr<<"You were only [V] off from the middle!!"
					usr.chakra-=rand(30,80)
					usr.IntensityCombos=0
			sleep(1)//just added may need to remove 11/16/2012

	if(usr.Guarding)
		usr.icon_state="Block"
	else
		usr.icon_state=""
	if(usr.ChargingRaikyuu)
		for(var/obj/Jutsu/Elemental/Raiton/Raikyuu/A in oview(3))
			if(A.Owner==usr)
				walk(A,usr.dir)
				flick("Attack1",usr)
				usr.ChargingRaikyuu=0
	if(usr.RasenganCharge)
		usr.RasenganCharge=0
	if(usr.intank&&usr.GatheredUpMeatTankCalories>=1)
		usr.Constant()
		var/A=usr.GatheredUpMeatTankCalories
		if(A>10)
			A=10
		while(A>0)
			A--;step(usr,usr.dir);sleep(1)
	if(usr.ChidoriCharge)
		usr.ChidoriCharge=0
		usr.icon_state="running"
		usr.Constant()
	if(usr.UserChargingForChakraPunch)
		usr.UserChargingForChakraPunch=0
		usr<<output("You have 30 seconds to utilize the chakra charged into your punch before it ends! Either Punch or Guard then press an Attack key to strike the ground!","Attack")
		spawn(300)
			usr.ChargedChakraForPunch=0
	if(usr.UserChargingForChakraKick)
		usr.UserChargingForChakraKick=0
		usr<<output("You have 30 seconds to utilize the chakra charged into your leg before it ends!","Attack")
		spawn(300)
			usr.ChargedChakraForKick=0
	if(usr.ChargingForBaikaNoJutsu)
		var/obj/SmokeCloud/A=new();A.loc=usr.loc
		usr.ChargingForBaikaNoJutsu=0;view()<<"<font color=silver><b><font face=verdana>[usr]: Baika No Jutsu!!"
		usr<<output("You have 100 seconds until the jutsu ends, if you don't already waste your calories!","Attack")
		spawn(1000)
			if(usr&&usr.BaikaCharged)
				usr.BaikaCharged=0;usr<<output("Your technique ended.","Attack")

mob/var/tmp/GateIn=""
obj/Gates
	icon='Gatez.dmi'
	icon_state="2"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates/A
		overlays+=/obj/Gates/B
		overlays+=/obj/Gates/C
	A
		icon_state="1"
		pixel_x = -32
	B
		icon_state="3"
		pixel_x = 32
	C
		icon_state="4"
		pixel_y = 32
obj/Gates1
	icon='Gatez.dmi'
	icon_state="2A"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates1/A
		overlays+=/obj/Gates1/B
		overlays+=/obj/Gates1/C
	A
		icon_state="1A"
		pixel_x = -32
	B
		icon_state="3A"
		pixel_x = 32
	C
		icon_state="4A"
		pixel_y = 32
obj/Gates2
	icon='Gatez.dmi'
	icon_state="2B"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates2/A
		overlays+=/obj/Gates2/B
		overlays+=/obj/Gates2/C
	A
		icon_state="1B"
		pixel_x = -32
	B
		icon_state="3B"
		pixel_x = 32
	C
		icon_state="4B"
		pixel_y = 32
obj/Gates3
	icon='Gatez.dmi'
	icon_state="2C"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates3/A
		overlays+=/obj/Gates3/B
		overlays+=/obj/Gates3/C
	A
		icon_state="1C"
		pixel_x = -32
	B
		icon_state="3C"
		pixel_x = 32
	C
		icon_state="4C"
		pixel_y = 32
obj/ChakraSystem
	icon='NarutoStuff.dmi'
	icon_state="Aura"
	invisibility=99
obj/ChakraCoils
	icon='Chakra Pulse.dmi'
	invisibility=100
mob/var/tmp/Struggle=0
mob/verb/CENTER()
	set name="DADAMNSPACEBUTTONCHANGE"
	set hidden=1
	usr.Struggle+=0.5
	if(usr.deathcount<=2)
		usr.Struggle+=0.5
	if(usr.deathcount<4)
		usr.Struggle+=0.25
	if((usr.Trait2=="Iron Will"&&usr.deathcount<=3&&usr.rank=="Genin")||(usr.Trait2=="Iron Will"&&usr.deathcount<=6&&usr.rank!="Genin"))
		usr.Struggle+=0.5
	if(usr.TypeLearning=="Taijutsu"&&usr.StruggleAgainstDeath>0)
		usr.exp+=rand(5,10)
	if(usr.rank!="Genin"&&usr.rank!="Chuunin"&&usr.deathcount<=5)
		usr.Struggle+=0.25
		if(usr.rank!="S.Jounin")
			usr.Struggle+=0.25
	if(usr.TheAssassin==1)
		usr.Struggle+=0.6
	//if(usr.rank!="Genin"&&usr.rank!="Chuunin"&&usr.rank!="S.Jounin"&&usr.rank!="Jounin"&&usr.Village!="Missing")
	//	usr.Struggle+=0.5//*(usr.blood*0.01)
	//if(usr.Clan=="Senju")
	//	usr.Struggle+=0.75//*(usr.blood*0.01)

	usr.UpdateStruggle()
mob/var/tmp/canmed=0
mob/GainedAfterLogIn/verb/Meditate()
	set name="Chakra Generation"
	set category ="Attacks"
	if(usr.firing||usr.Kaiten)
		return
	if(usr.resting)
		return
	if(usr.canmed)
		return
	if(usr.IntensityChakra)
		return
	if(usr.Frozen||usr.knockedout||usr.Stun>=1||usr.DoingHandseals||usr.doingG||usr.inso||usr.Kaiten||usr.resting||usr.ingat||usr.firing||usr.FrozenBind!=""||usr.doingG||usr.Shibari||usr.UnableToChargeChakra)
		return
	if(usr.meditating)
		usr.meditating=0
		usr.icon_state=null
		usr.canmed=1
		usr<<"You Stop Generating charkra."
		spawn(100)
			usr.canmed=0
	else
		usr.meditating=1
		usr << "You are now commencing to generate chakra for control!"
		usr.icon_state="handseal"
		usr<<output("To generate chakra you must rapidly click Z! It'll provide you training!","Attack")
mob
	proc
		rest()
			rest
			if(usr.resting)
				if(usr.stamina<usr.maxstamina)
					var/regain = rand(6,15)
					usr.stamina += usr.maxstamina/regain
			//		usr.blood += usr.maxblood/regain
					if(usr.blood>50)
						usr.blood=100
					if(usr.stamina>usr.maxstamina)
						usr.stamina=usr.maxstamina
					if(usr.stamina==usr.maxstamina)
						usr.resting = 0
						usr.Frozen = 0
						usr<<"You have finished resting."
						return
					usr.Frozen=1
					sleep(15)
					goto rest
				else
					sleep(20)
					usr.resting = 0
					usr.Frozen = 0
					usr<<"You have finished resting."
					if(usr.stamina>usr.maxstamina)
						usr.stamina=usr.maxstamina
mob/proc
	ExpGain(mob/M,damage)
		if(!src.client)
			return
		if(src.Age<11)
			return
		if(!M.client||M.client.address==src.client.address||M.knockedout||M.Dead||M.FrozenBind=="Dead")
			return
		var/gain=rand(25,100)
		gain=(gain+(damage*0.01))
		if(gain>500)
			gain=500
		if(prob(10))
			src.exp+=gain
obj/Weapons
	name = null
	icon = 'Weapons.dmi'
	icon_state = ""
	layer = FLY_LAYER+1
	var/ShadowClone=0
	New()
		..()
		if(src.ShadowClone)
			spawn(100)
				var/obj/SmokeCloud/S=new()
				S.loc=src.loc;del(src)
		else
			spawn(600) del(src)
	verb
		Get()
			set src in oview(1)
			var/counter=1
			if(src.icon_state=="kunai"||src.icon_state=="kunai2"||src.icon_state=="kunai3")
				for(var/obj/Weapons/W in view(0,src))
					if(W!=src)
						if(W.icon_state=="kunai"||W.icon_state=="kunai2"||W.icon_state=="kunai3")
							if(!W.ShadowClone)
								counter++
								del(W)
				if(counter==1) usr<<"You picked up a Kunai."
				else if(counter>1) usr<<"You picked up [counter] Kunai."
				var/obj/WEAPONS/Kunai/A=new()
				src.icon_state=""
				var/counta=0
				for(var/obj/WEAPONS/Kunai/O in usr.contents)
					counta+=1
				if(counta<=0)
					A.loc=usr
					A.ammount+=counter;A.name= "Kunai ([A.ammount])"
					del(src)
				else
					for(var/obj/WEAPONS/Kunai/O in usr.contents)
						O.ammount+=counter
						O.name= "[O.name] ([O.ammount])"
						del(src);del(A)
			if(src.icon_state=="shuriken"||src.icon_state=="shuriken2"||src.icon_state=="shuriken3")
				for(var/obj/Weapons/W in view(0,src))
					if(W!=src)
						if(W.icon_state=="shuriken"||W.icon_state=="shuriken2"||W.icon_state=="shuriken3")
							if(!W.ShadowClone)
								counter++
								del(W)
				if(counter==1) usr<<"You picked up a Shuriken."
				else if(counter>1) usr<<"You picked up [counter] Shuriken."
				var/obj/WEAPONS/Shuriken/A=new()
				A.icon_state="Shuriken"
				src.icon_state=""
				var/counta=0
				for(var/obj/WEAPONS/Shuriken/O in usr.contents)
					counta+=1
				if(counta<=0)
					A.loc=usr
					A.ammount+=counter;A.name= "Shuriken ([A.ammount])"
					del(src)
				else
					for(var/obj/WEAPONS/Shuriken/O in usr.contents)
						O.ammount+=counter
						O.name= "[O.name] ([O.ammount])"
						del(src);del(A)
			if(src.icon_state=="needles"||src.icon_state=="needles2")
				for(var/obj/Weapons/W in view(0,src))
					if(W!=src)
						if(W.icon_state=="needles"||W.icon_state=="needles2")
							if(!W.ShadowClone)
								counter++
								del(W)
				if(counter==1) usr<<"You picked up a Senbon."
				else if(counter>1) usr<<"You picked up [counter] Senbon."
				var/obj/WEAPONS/Senbon/A=new()
				src.icon_state=""
				var/counta=0
				for(var/obj/WEAPONS/Senbon/O in usr.contents)
					counta+=1
				if(counta<=0)
					A.loc=usr
					A.ammount+=counter;A.name= "Senbon ([A.ammount])"
					del(src)
				else
					for(var/obj/WEAPONS/Senbon/O in usr.contents)
						O.ammount+=counter
						O.name= "[O.name] ([O.ammount])"
						del(src);del(A)
////////////////
mob/var/tmp/IntensityCombos=0
obj/BarSlider
	icon='Slider.dmi'
	var/Amount=0
	var/direction="Up"
	screen_loc="15,15"
	layer=MOB_LAYER+3
	New()
		..()
		spawn()
			Start()
	proc/Start()
		while(1==1)
			if(direction=="Up")
				while(pixel_y<64)
					pixel_y+=8
					Amount+=8
					screen_loc="15,15:[pixel_y]"
					sleep(1)
				direction="Down"
			else if(direction=="Down")
				while(pixel_y>-64)
					Amount-=8
					pixel_y-=8
					screen_loc="15,15:[pixel_y]"
					sleep(1)
				direction="Up"
obj/BarCombo
	icon='Slider Background.dmi'
	icon_state="Combo"
	screen_loc="16,16"
	layer=MOB_LAYER+2
	New()
		spawn()
			while(src)
				sleep(2)
				src.pixel_y+=1
				sleep(1)
				src.pixel_y+=1
				sleep(1)
				src.pixel_y+=1
				sleep(1)
				src.pixel_y+=1
				sleep(1)
		spawn(6)
			del(src)
obj/Bar
	icon='Slider Background.dmi'
	icon_state="1"
	screen_loc="15,14"
	layer=MOB_LAYER+2
obj/Bar12
	icon='Slider Background.dmi'
	icon_state="1"
	screen_loc="15,15"
	layer=MOB_LAYER+2
obj/Bar123
	icon='Slider Background.dmi'
	icon_state="1"
	screen_loc="15,16"
	layer=MOB_LAYER+2
obj/Bar2
	icon='Slider Background.dmi'
	icon_state="2"
	screen_loc="15,17"
	layer=MOB_LAYER+2
obj/Bar3
	icon='Slider Background.dmi'
	icon_state="3"
	screen_loc="15,13"
	layer=MOB_LAYER+2
mob/var/tmp/IntensityChakra=0
mob/GainedAfterLogIn/verb/ChakraI()
	set name="Chakra Intensity"
	set category ="Attacks"
	if(usr.firing||usr.Kaiten)
		return
	if(usr.resting)
		return
	if(usr.canmed)
		return
	if(usr.meditating)
		return
	if(usr.Frozen||usr.knockedout||usr.Stun>=1||usr.DoingHandseals||usr.doingG||usr.inso||usr.Kaiten||usr.resting||usr.ingat||usr.firing||usr.FrozenBind!=""||usr.doingG||usr.Shibari||usr.UnableToChargeChakra)
		return
	if(usr.IntensityChakra)
		usr.IntensityChakra=0
		usr.icon_state=""
		for(var/obj/O in usr.client.screen)
			if(istype(O,/obj/BarSlider))
				del O
			if(istype(O,/obj/Bar))
				del O
			if(istype(O,/obj/Bar12))
				del O
			if(istype(O,/obj/Bar123))
				del O
			if(istype(O,/obj/Bar2))
				del O
			if(istype(O,/obj/Bar3))
				del O
	else
		usr.IntensityChakra=1
		usr << "You are now working on your Chakra Intensity!"
		usr.icon_state="handseal"
		usr.client.screen += new/obj/Bar
		usr.client.screen += new/obj/Bar12
		usr.client.screen += new/obj/Bar123
		usr.client.screen += new/obj/Bar2
		usr.client.screen += new/obj/Bar3
		usr.client.screen += new/obj/BarSlider
//		usr<<output("To generate chakra you must rapidly click Z! It'll provide you training!","Attack")
	/*	for(var/obj/O in usr.client.screen)
			if(O.type == /obj/BarSlider)
				del O
		for(var/obj/O in usr.client.screen)
			if(O.type == /obj/Bar)
				del O
		for(var/obj/O in usr.client.screen)
			if(O.type==/obj/Bar12)
				del O
		for(var/obj/O in usr.client.screen)
			if(O.type == /obj/Bar123)
				del O
		for(var/obj/O in usr.client.screen)
			if(O.type == /obj/Bar2)
				del O
		for(var/obj/O in usr.client.screen)
			if(O.type == /obj/Bar3)
				del O
				*/ //Made different 11/16/12
	//	usr<<"You Stop Generating charkra."

mob/var/tmp
	SavedHengeIcon
	SavedHengeName=""
	SavedHengeIconState=""
	list/SavedHengeOverlays=list()
	HoldingS=0
	HoldingR=0
mob
	verb/R()
		set name="R"
		set hidden=1
		usr.HoldingR=1
		usr.Strafe()
	verb/RRelease()
		set hidden=1
		usr.HoldingR=0
		usr.Normal()
	verb/S()
		set name="S"
		set hidden=1
		usr.HoldingS=1
		if(usr.Charging)
			if(usr.bya||usr.Akametsuki||usr.ChakraSense||usr.SageMode=="Toad")
				usr.client.removeGrid()
				usr.client.drawGrid(10)
				usr.client.radarUpdate()
				return
	verb/SRelease()
		set name="SRelease"
		set hidden=1
		usr.client.removeGrid()
		usr.HoldingS=0





obj/Genjutsu/red
	icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state = ""
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER+1000
obj/Genjutsu/red2
	icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state = "strong"
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER+1000