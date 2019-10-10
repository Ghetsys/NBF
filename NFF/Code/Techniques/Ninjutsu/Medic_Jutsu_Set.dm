mob/var/tmp
	scalpel=0
	ChargedChakraForPunch=0
	UserChargingForChakraPunch
	ChargedChakraForKick=0
	UserChargingForChakraKick

obj/Ninjutsu/HealingAura
	icon='Icons/Jutsus/NarutoStuff.dmi'
	icon_state="HealingThing"
	layer=MOB_LAYER+1
	var/Owner
	New()
		..()
		spawn(1200)
			del(src)
/*Mystical Hand Technique:
Heals whommever is in front of the player.
*/
mob/proc/Mystical_Hand_Technique(Uses)
	if(src.firing||src.knockedout)
		return
	if(src.target)
		src.dir=get_dir(src,src.target)
	flick("throw",src)
	src.ChakraDrain(50000)
	if(!src.client)
		spawn(3)
			src.health=0
			src.Death(src)
	for(var/mob/M in get_step(src,src.dir))
		if(Uses>500&&src.HoldingR&&!src.knockedout)
			M<<"[src] uses his chakra to heal you."
			src<<"You begin to heal [M]. Continue to hold down R to keep your chakra flowing into [M] and slowly heal their wounds!"
			while(src.HoldingR&&!src.knockedout&&(M in get_step(src,src.dir)))
				src.ChakraDrain(7500)
				sleep(10)
				var/heal2=(10+(10*Uses)+1)/rand(5,10)
				if(heal2>=350)
					heal2=350

				if(M.StruggleAgainstDeath>0)
					if(prob(Uses/10))
						M.Struggle+=rand((Uses/8),(Uses/10))
				if(M.Poisoned&&src.Cure)
					M.Poisoned=0
					M<<"[src] has cured your Poison."
					return
				if(M.Status!=""&&src.Cure)
					M.StatusEffected=0
					M.Status=""

					M<<"[src] has cured your Ailment."

				if(heal2>400)
					M.deathcount--
					if(M.deathcount<0)
						M.deathcount=0
				if(M.health>M.maxhealth)
					M.health=M.maxhealth
				if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath&&!M.CBleeding)
					M.Dead=0
					M.icon_state=""
					M.FrozenBind=""
					M.sight&=~(SEE_SELF|BLIND)
					orange(12,M)<<"<font size = 2>[M] was revived from the brink of death by [src]!</font>"
				if(M.stamina<M.maxstamina)
					M.stamina+=heal2/4
					if(M.stamina>M.maxstamina)
						M.stamina=M.maxstamina
				if(M.health<M.maxhealth)
					M.health+=heal2/3
		else
			M<<"[src] uses his chakra to heal you."
			src<<"You begin to heal [M]."
			var/Z=30+Uses
			if(Z>100)
				Z=100
			if(prob(Z))
				if(M.StruggleAgainstDeath>0)
					if(prob(Uses/10))
						M.Struggle+=rand((Uses/8),(Uses/10))
				var/randz=rand(1,2)
				var/heal=(10+(10*Uses)+1)/rand(5,10)
				if(heal>100+(100*src.ShousenMastery))
					heal=(100-rand(-25,25))*(src.ShousenMastery+1)
			//	if(src.key=="CobraT1337")
			//		M<<"You feel your body Rejuvinating!"
			//		src<<"You place a large amount of Chakra into your Shousen."
			//		src.chakra-=rand(500,1000)
			//		heal=600
				if(src.ARank=="Healer")
					heal+=rand(50,100)
				if(src.SageMode=="Slug")
					heal*=2
				if(randz==1||src.ARank=="Healer")
					if(M.health<M.maxhealth)
						M.health+=heal
						src<<output("You healed [heal] health.","Attack")
						if(M.Poisoned&&(src.Cure==1))
							M.Poisoned=0
							M<<"[src] has cured your Poison."
							return
						if(M.Status!=""&&src.Cure)
							M.StatusEffected=0
							M.Status=""
							M<<"[src] has cured your Ailment."

						if(heal>400)
							M.deathcount--
							if(M.deathcount<0)
								M.deathcount=0
						if(M.health>M.maxhealth)
							M.health=M.maxhealth
						if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath&&!M.CBleeding)
							M.Dead=0
							M.icon_state=""
							M.FrozenBind=""
							M.sight&=~(SEE_SELF|BLIND)
							orange(12,M)<<"<font size = 2>[M] was revived from the brink of death by [src]!</font>"
					else
						src<<output("They're fully healed in Health.","Attack");return
				if(randz==2||src.ARank=="Healer")
					if(prob(10+round(Uses/100))&&M.deathcount>0)
						M.deathcount-=1
					if(M.Status!=""&&src.Cure)
						M.StatusEffected=0
						M.Status=""
						M<<"[src] has cured your Ailment."

					if(M.stamina<M.maxstamina)
						M.stamina+=heal
						if(M.stamina>M.maxstamina)
							M.stamina=M.maxstamina
						src<<output("You healed [heal] stamina.","Attack")
					else
						src<<output("They're fully healed in Stamina.","Attack");return

				else
					src<<output("Healing failed.","Attack");return
				if(M.screwed)
					if(prob(src.Focus*rand(-5,5)))
						M.screwed=0;M<<"Your nerves were healed.";src<<"You healed their nerves."
				if(M.CBleeding)
					if(prob(usr.Focus*rand(-5,5)))
						M.CBleeding=0;M<<"Your no longer bleeding.";src<<"Your healed their internal bleeding."


/*Chakra Scapel Technique:
Gathers the Chakra Scapels allowing you to attack with them.
*/
mob/proc/Chakra_Scapel()
	if(src.LeftHandSheath||src.RightHandSheath)
		return
	src.scalpel=1
	src.ChakraDrain(7500)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src<<"You concentrate the chakra to your hands to develop chakra scalpels."
	src<<"You now are capable of causing slicing damage using A-S based attacks."
	oview()<<"[src]'s hands begin to eminate blue chakra. The chakra resembles the form of scalpels..."
	while(src.scalpel)
		if(!src.ScalpelDrainLess)
			src.ChakraDrain(6000)
		if(src.knockedout)
			src.scalpel=0
			for(var/obj/SkillCards/ChakraNoMesu/A in src.LearnedJutsus)
				A.DelayIt(450,src,"Nin")
			oview()<<"[src] falls unconcious causing his hands to go back to their original skin tone.";return
		sleep(11)
	src<<"You stop using Chakra Scapels."
	oview()<<"[src]'s hands begin to go back to their original skin tone."

/*Muscle Slice:
Slices the opponents Muscles.
*/
mob/var/tmp/Sliced=0
mob/proc/Muscle_Slice()
	flick("Attack1",src)
	for(var/mob/M in oview(1))
		if(!M.sphere&&!M.Kaiten)
			src.DodgeCalculation(M)
			if(M.Dodging)
				M.Dodge();return
			if(M.Sliced)
				src<<"He's already been damaged..."
				return
			else
				if(!M.knockedout)
					M.Sliced=1
					src<<"You slice [M]'s Muscle!"
					M.InternalBleed()
					viewers()<<sound('SFX/Slice.wav',0);spawn() M.Bloody()
					M.Sliced=0

mob/proc/InternalBleed()
	var/InternalBleeding=rand(25,100)
	if(!(locate(/obj/ReleaseThingyAilment/Bleed) in src.client.screen))
		var/obj/ReleaseThingyAilment/Bleed/P = new()
		P.HowLong=InternalBleeding
		if(src.client)
			src.client.screen+=P
	while(InternalBleeding)
		src.DamageProc(10,"Health",src);
		InternalBleeding--
		spawn() src.Bloody()
		if(src.knockedout||InternalBleeding<=0)
			InternalBleeding=0
		sleep(11)
/*Neck Slice:
Slices the opponent's Neck.
*/
mob/proc/Neck_Slice()
	flick("Attack1",src)
	for(var/mob/M in get_step(src,src.dir))//oview(1))
		if(!M.sphere&&!M.Kaiten)
			src.DodgeCalculation(M)
			if(M.Dodging)
				M.Dodge();return
			if(M.Sliced)
				src<<"He's already been damaged.."
				return
			else
				if(!M.knockedout)
					src<<"You slice at [M]'s Neck, dealing severe damage!"
					M.Sliced=1
					M.DamageProc(rand(M.maxstamina*0.51,M.maxstamina*0.3),"Stamina",src)
					M.DamageProc(rand(M.maxhealth*0.15,M.maxhealth*0.3),"Health",src)
					viewers()<<sound('SFX/Slice.wav',0);spawn()M.Bloody();spawn()M.Bloody();spawn()M.Bloody()
					sleep(600)
					M.Sliced=0
/*Leg Slice:
Slices the opponent's Leg Tendon.
*/
mob/var/tmp/LegSliced=0

mob/proc/Leg_Slice()
	flick("Attack1",src)
	src.ChakraDrain(40000)
	for(var/mob/M in oview(1))
		if(M.ImmuneToDeath)
			view()<<"[src] was Auto Koed because trying to leg slice someone right when they get up is just sad!"
			src.DamageProc(2000,"Health",M)
		if(!M.sphere&&!M.Kaiten)
			src.DodgeCalculation(M)
			if(M.Dodging)
				M.Dodge()
			if(M.Sliced||M.LegSliced)
				src<<"He's already been damaged.."
				return
			else
				src.ChakraDrain(25000)
				if(!M.knockedout&&M.GateIn=="")
					src<<"You slice [M]'s Tendons!"
					viewers()<<sound('SFX/Slice.wav',0)
			//		var/A=rand(30,55)
					var/A=rand(15,20)
					M<<"Your legs have been sliced forcing you to walk!"
					M.LegSliced=1;M.Sliced=1
					spawn()M.Bloody()
					while(A>0)
						if(prob(15))
							M.Running=0
						A--
						sleep(11)
					M<<"Your legs have healed."
					M.LegSliced=0
					sleep(600)
					M.Sliced=0



/*Chaotic Mental Collision:
Screws up the opponent's nervous movements.
*/
mob/proc/Chaotic_Mental_Collision()
	if(src.firing)
		return
	else
		src.ChakraDrain(25000)
		flick("Attack1",src)
		for(var/mob/M in oview(1))
			spawn()
				if(!M.knockedout)
					M.screwed=1;src<<"You send your chakra into [M]'s nervous system, screwing up their movement!"
					spawn(300)
						if(M&&M.screwed)
							M.screwed=0;M<<"Your nerves begin to heal.";return


/*Healing Resuscitation Regeneration:
Heals in a wide-ranged view.
*/
mob/proc/ChikatsuTechnique()
	if(src.Clone)
		src.health=0
		src.Death(src)
		return
	if(src.firing&&src.Clone)
		if(src.Clone)
			src.health=0
			src.Death(src)
			return
		return
	else
		var/JutsuCost=10
		src.icon_state="rest"
		src.firing=1;
		src.Frozen=1
		src<<"You begin to concentrate."
		var/A=/obj/summoncircle
		var/AXC=0
		for(var/obj/SkillCards/Shousen/Add in src.LearnedJutsus)
			AXC=Add.Uses
		var/healrange=round(AXC/100)
		var/heal=((src.NinSkill+src.GenSkill)/rand(1,2))
		if(healrange>5) healrange=5
	//	if(src.GenSkill>=50||src.ARank=="Healer")
	//		healrange=src.GenSkill
	//		heal=50
		src.underlays-=A;
		src.underlays+=A
		var/sleeptime=(rand(100,200))
		if(src.SageMode=="Slug")
			sleeptime=(rand(30,50))
		for(var/turf/T in oview(healrange,src))
			var/obj/Ninjutsu/HealingAura/B=new();
			B.loc=T;B.Owner=src
			src.JutsuList+=B
		if(src.Allies.len>0)
			while(sleeptime>0&&src.icon_state=="rest")
				for(var/mob/M in oview(healrange,src))
		//			spawn()
					sleep(1)
					if(M in src.Allies&&M in OnlinePlayers)
						M.health+=heal*3
						if(src.SageMode=="Slug")
							M.health+=heal*2
							M.stamina+=heal*2
						M.stamina+=heal*4
						src.chakra-=JutsuCost
						if(M.health>M.maxhealth) M.health=M.maxhealth
						if(M.stamina>M.maxstamina) M.stamina=M.maxstamina
						if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath&&!M.resting)
							M.Dead=0
							M.icon_state=""
							M.FrozenBind=""
							M.sight&=~(SEE_SELF|BLIND)
							orange(12,M)<<"<font size = 2>[M] was revived from the brink of death!</font>"
				sleeptime--

				sleep(13)
		else
			while(sleeptime>0&&src.icon_state=="rest")
				for(var/mob/M in oview(healrange,src))
					sleep(1)
				//	spawn()
					if(M.client)
						M.health+=heal*3
						M.stamina+=heal*4
						if(src.SageMode=="Slug")
							M.health+=heal*2
							M.stamina+=heal*2
						src.chakra-=JutsuCost
						if(M.health>M.maxhealth) M.health=M.maxhealth
						if(M.stamina>M.maxstamina) M.stamina=M.maxstamina
						if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath&&!M.resting)
							M.Dead=0
							M.icon_state=""
							M.FrozenBind=""
							M.sight&=~(SEE_SELF|BLIND)
							orange(12,M)<<"<font size = 2>[M] was revived from the brink of death!</font>"

				sleeptime--

				sleep(13)
		src.firing=0;src.Frozen=0
		src.underlays-=A
		for(var/obj/Ninjutsu/HealingAura/ac in src.JutsuList)
			del(ac)
	//	spawn()
		for(var/obj/Ninjutsu/HealingAura/AB in world)
			if(AB.Owner==src)
				del(AB)

/*Chakra Absorbtion Techniques:
Steals Chakra from the opponent.
*/
mob/proc/Chakra_Absorbtion_Technique(Uses)
	if(src.firing||src.knockedout||src.Frozen)
		return
	if(src.target)
		src.dir=get_dir(src,src.target)
	flick("throw",src)
	spawn(2)
		for(var/mob/M in get_step(src,src.dir))
			if(!M.knockedout&&!M.Dead)
				M.Struggle = 0
				src<<"You begin to drain [M]'s chakra.";M<<"Your body begins to feel weaker...your chakra is being drained! Tap SpaceBar to struggle!"
				M.FrozenBind="ChakraAbsorb"
				src.FrozenBind="ChakraAbsorb"

			//	M.Frozen=1
			//	M.firing=1
			//	src.firing=1
			//	src.Frozen=1
				var/CCC=(src.GenSkill*50*(src.ChakraLeech+1))/((M.GenSkill/2)+1)
				if(CCC>300)
					CCC=300
				var/ChakraLeech=1
				while(M in get_step(src,src.dir)&&!M.knockedout&&ChakraLeech)//&&(M.Struggle<(src.GenSkill*30)*(src.ChakraLeech+1)*pick(1,1.5,2)))
					src.icon_state="throw"
					if(M.Struggle>=(src.GenSkill*30)*(src.ChakraLeech+1)*pick(1,1.5,2))
						M<<"You broke away from [src]'s chakra absorbtion!"
						src<<"You lost grasp of [M]'s chakra!"
						M.FrozenBind=""
						src.FrozenBind=""
						ChakraLeech=0
						return
					M.chakra-=CCC
					src.chakra+=CCC
					if(src.chakra>src.Mchakra)
						src.chakra=src.Mchakra
						M<<"Releases their hold on your chakra as they're at their max."
						src<<"You've reached the highest point of your chakra capacity."
						M.FrozenBind=""
						src.FrozenBind=""
						ChakraLeech=0
						return
					if(M.chakra<=0)
						M.chakra=0
						M<<"You've been sucked of your chakra..."
						src<<"You've sucked [M] of their chakra dry.."
						M.FrozenBind=""
						src.FrozenBind=""
						ChakraLeech=0
						return

					sleep(15)

				M<<"You broke away from [src]'s chakra absorbtion!"
				src<<"You lost grasp of [M]'s chakra!"
				M.FrozenBind=""
				src.FrozenBind=""
/*Self Regeneration
Heals a medic while fighting
*/
mob/proc/SelfHeal()
	if(src.firing||src.knockedout)
		src.SelfHeal=0
		return
	if(src.SelfHeal)
		src.SelfHeal=0
		src<<"You stop the regeneration."
	src<<"You begin to convert your chakra into life force, healing your wounds and vital organs!"
	src.SelfHeal=1
	sleep(5)
	var/Location
	Location=src.loc
	while(src.loc==Location&&src.SelfHeal&&!src.knockedout)
		var/HealthHeal=(2*(src.GenSkill*2))
		var/StaminaHeal=(4.5*(src.GenSkill*2))
		if(src.SageMode=="Slug")
			HealthHeal*=2
			StaminaHeal*=2
		src.health+=HealthHeal
		src.stamina+=StaminaHeal
		if(src.stamina>src.maxstamina)
			src.stamina=src.maxstamina
		if(src.health>src.maxhealth)
			src.health=src.maxhealth
			src.SelfHeal=0
			src<<"You're unable to continue healing yourself because you've already healed all your wounds!"
		src.ChakraDrain(35000)
		var/SleepWait=(300/(src.GenerationMastery+1))
	//	sleep(300/(src.GenerationMastery+1))
		if(src.SageMode=="Slug")
			SleepWait/=2
		sleep(SleepWait)
		if(src.chakra<0)
			src.SelfHeal=0
			src<<"You're unable to continue healing yourself because you've run out of chakra!"

mob/proc/ChakraMode()
	src<<"You begin to use the Forbidden Ninjutsu, taking the stakes for this limited power. Better make use of it.."
	src.ChakraMode=1
	if(src.knockedout)
		src.ChakraMode=0
		src<<"You release the Forbidden Ninjutsu...."
		src<<"The jutsu takes it's toll upon you.."
		src.deathcount++
		src.deathcount++
		src.health-=250
		src.stamina-=500
		return
	while(src.ChakraMode)
		src.health+=(4*src.GenSkill*(src.ChakraModeMastery+1))
		src.stamina+=(5*src.GenSkill*(src.ChakraModeMastery+1))
		src.ChakraDrain(23000)
		src.ChakraPool-=rand(200,300)
		sleep(55/(src.ChakraModeMastery+1))
		if(src.knockedout)
			src.ChakraMode=0
			src<<"You release the Forbidden Ninjutsu...."
			src<<"The jutsu takes it's toll upon you.."
			src.deathcount++
			src.deathcount++
			src.health-=250
			src.stamina-=500
			return
		if(src.stamina>src.maxstamina)
			src.stamina=src.maxstamina
		if(src.health>src.maxhealth)
			src.health=src.maxhealth
		if(src.ChakraPool<=0)
			src.ChakraPool=0
			if(src.chakra<=0)
				src.ChakraMode=0
				src<<"You release the Forbidden Ninjutsu...."
				src<<"The jutsu takes it's toll upon you.."
				src.deathcount++
				src.deathcount++
				src.health-=250
				src.stamina-=500
				return
		var/CountDown=1500+(250*src.ChakraModeMastery)
		if(src.SageMode=="Slug")
			CountDown*=1.5
		spawn(CountDown)
			if(src.ChakraMode)
				src.ChakraMode=0
				src<<"You've used up all the time this Forbidden Ninjutsu allows..."
				src<<"The jutsu takes it's toll upon you.."
				src.deathcount++
				src.deathcount++
				src.health-=475
				src.stamina-=1250
				return





/*Cherry Blossom Collision:
Charges chakra for powered up punches.
*/
mob/proc
	ChakraPunch()
		if(src.UserChargingForChakraPunch)
			return
		else
			src.UserChargingForChakraPunch=1+src.OukashouMastery
			src<<"Hold down Z to charge chakra for the immediate attack!"
			oview()<<"[src]'s hands begin to fill up with powerful chakra as they shape a fist"
	HitTheGround()
		if(src.firing||src.knockedout)
			return
		src.ChakraDrain(35000)
		src.icon_state="Attack1"
		sleep(2)
		src.icon_state="beastman"
		spawn(5)
			src.icon_state=""
		var/Damage=src.ChargedChakraForPunch
		if(Damage>85*src.GenSkill)
			Damage=85*src.GenSkill
		src.ChargedChakraForPunch=0
		var/Range=round(Damage/250)
		if(Damage>3000)
			Damage=3000
		if(Range>6)
			Range=6
		view()<<output("<font>[src] slams the ground dealing [Damage]!</font>","Attack")
		src.CreateCrator()
		for(var/turf/T in oview(Range,src))
			spawn()
				if(prob(17))
					T.CreateSmoke("Light")
		for(var/mob/M in oview(Range,src))
			spawn()
				Quake_Effect(M,10,2)
				AttackEfx2(M.x,M.y,M.z)
				M.DamageProc(Damage,"Stamina",src)
				if(M.Mogu)
					M.DamageProc(Damage*2,"Stamina",src)
mob/proc
	ChakraKick()
		if(src.UserChargingForChakraPunch||src.UserChargingForChakraKick)
			return
		else
			src.UserChargingForChakraKick=1
			src<<"Hold down Z to charge chakra for the immediate attack!"
			oview()<<"[src]'s leg begin to fill up with powerful chakra!"
	HitTheGroundKick()
		if(src.firing||src.knockedout)
			return
		src.ChakraDrain(45000)
		src.icon_state="Power"
		sleep(5)
		src.icon_state="crashingleg"
		spawn(5)
			src.icon_state=""
		var/Damage=src.ChargedChakraForKick
		if(Damage>50*src.GenSkill)
			Damage=50*src.GenSkill
		src.ChargedChakraForKick=0
		var/Range=round(Damage/250)
		if(Damage>1500)  //Chakra Kick has greater range but lower damage cap. This way its different from Chakra Punch.
			Damage=1500;
		if(Range>10)
			Range=10
		src.CreateCrator()
		//for(var/turf/T in oview(Range,src))
		//	spawn()
		//		if(prob(25))
		//			T.CreateSmoke("Light")
		for(var/mob/M in oview(Range,src))
			spawn()
				Quake_Effect(M,10,1)
				AttackEfx2(M.x,M.y,M.z)
				M.DamageProc(Damage,"Stamina",src)
				M.deathcount++
				if(M.Mogu)
					M.DamageProc(Damage*2,"Stamina",src)
					M.deathcount++
					M.deathcount++

mob/proc/PoisonMistJutsu(Uses)
	if(src.firing||src.Kaiten||src.knockedout)
		return
	else
	//	src<<"Disabled for lag."
	//	return
		src.ChakraDrain(55000)
		src.Handseals(50-src.HandsealSpeed)
		view()<<"A poisonous mist begins to linger."
		src.Frozen=1
		var/obj/Poisonmist/A=new();A.loc=locate(src.x,src.y,src.z);A.Poison="Vit";A.PoisonLast=30;
		var/X=1
		while(X<6)
			for(var/turf/D in oview(X,src))
				if(!(D in oview(X-1)))
					var/obj/Poisonmist/B=new();B.loc=D;B.Poison="Vit";B.PoisonLast=30;
			X++
			sleep(6)
		if(X>=6)
			src.Frozen=0


mob/proc/Poisonfog(Uses)
	if(src.firing||src.Kaiten)
		return
	else
		src.ChakraDrain(40000)
		src.Handseals(41-src.HandsealSpeed)
		src<<"You begin to spray a poisonous gas."
		var/X=src.x
		var/Y=src.y
		var/Z=src.z
		var/G=1
		var/H=0
		var/HC=0
		var/GC=6//Max length of the poison gas
		src.firing=1;
		src.Frozen=1
		var/obj/PoisonTail/Q=new();Q.layer=MOB_LAYER+1
		if(src.dir==SOUTH)
			Q.pixel_y = 16
		if(src.dir==NORTH)
			Q.pixel_y=-16;Q.layer=MOB_LAYER-1
		if(src.dir==WEST)
			Q.pixel_x=8
		if(src.dir==EAST)
			Q.pixel_x = -8
		Q.loc=src.loc;step(Q,src.dir)
		if(src.dir==NORTH)
			//Place the Poison Exhale Icon here
			while(G<=GC)
				while(H<=HC)
					var/obj/Poisonmist/A=new();A.loc=locate(X+H,Y+G,Z);A.Poison="Vit";A.PoisonLast=30;
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==SOUTH)
			while(G<=GC)
				while(H<=HC)
					var/obj/Poisonmist/A=new();A.loc=locate(X-H,Y-G,Z);A.Poison="Vit";A.PoisonLast=30
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==WEST)
			while(G<=GC)
				while(H<=HC)
					var/obj/Poisonmist/A=new();A.loc=locate(X-G,Y-H,Z);A.Poison="Vit";A.PoisonLast=30
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==EAST)
			while(G<=GC)
				while(H<=HC)
					var/obj/Poisonmist/A=new();A.loc=locate(X+G,Y+H,Z);A.Poison="Vit";A.PoisonLast=30
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		src.firing=0;
		src.Frozen=0

obj/PoisonTail
	icon='Icons/Jutsus/NarutoStuff.dmi'
	icon_state="PoisonExhale"
	layer = MOB_LAYER+1
	New()
		..()
		spawn(34)
			del(src)
obj/Poisonmist
	icon='Icons/Jutsus/NarutoStuff.dmi'
	icon_state="PoisonR"
	layer=MOB_LAYER+2
	var/Poison="Vit"
	var/PoisonLast=30;
	New()
		flick("PoisonA",src)
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		..()
		spawn()
			spawn(2)//was spawn(1) 11/16/12
				src.pixel_x+=rand(-16,16)
				src.pixel_y+=rand(-16,16)
				while(src)
					if(src.dir==NORTHEAST)
						src.pixel_x+=rand(-1,8)
						src.pixel_y+=rand(-1,8)
					if(src.dir==NORTHWEST)
						src.pixel_x+=rand(-8,1)
						src.pixel_y+=rand(-1,8)
					if(src.dir==SOUTHEAST)
						src.pixel_x+=rand(-1,8)
						src.pixel_y+=rand(-8,1)
					if(src.dir==SOUTHWEST)
						src.pixel_x+=rand(-8,1)
						src.pixel_y+=rand(-8,1)
					sleep(6)
					for(var/mob/M in oview(1,src))
				//		if((M.key==usr.key))
				//			return
						if(M.Status=="Asleep")
							return
						if(M.sphere)
							return
						if(M.Kaiten)
							del(src)
						if(M.knockedout)
							M<<"Trying to Poison them while they're knocked out? You're pathetic."
							return
						else
							if(M.key==usr.key)
								if(!(locate(/obj/ReleaseThingyAilment/Poison) in M.client.screen))
									var/obj/ReleaseThingyAilment/Poison/P = new()
									P.HowLong=src.PoisonLast
									if(M.client)
										M.client.screen+=P
								M.health-=rand(4,6)
							else
								M.health-=rand(3,7)
								if(M.client)
									if(!(locate(/obj/ReleaseThingyAilment/Poison) in M.client.screen))
										var/obj/ReleaseThingyAilment/Poison/A = new()
										A.HowLong=src.PoisonLast
										if(M.client)
											M.client.screen+=A
								M.PoisonType=src.Poison
								M.PoisonTime=src.PoisonLast
		spawn(50)
			del(src)
	Del()
		flick("PoisonD",src)
		sleep(2)
		..()

mob/proc/PoisonClone(Number)
	var/ChakraLoss=src.chakra*0.25;src.chakra-=ChakraLoss
	src.Handseals(1)
	if(src.HandsSlipped) return
	src<<"You've created a Bunshin! Click a location to move it there, and press X + Z to destroy the Bunshin. Eminating a poisonous gas!"
	var/mob/Clones/Clone/K=new();var/obj/SmokeCloud/S=new()
	for(var/mob/M in range(15,src))
		if(src==M.target)
			var/Focus=0
//			for(var/obj/Passives/Type_Taijutsu/Focus/ASDD in M.Passives)
//				Focus=ASDD.Current_Number
			if(Number>100&&Focus*2<Number)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
			else
				M.target=null
	K.loc=locate(src.x,src.y,src.z);S.loc=locate(src.x,src.y,src.z)
	if(K)
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
			if(!BAD.Find(V))
				K.vars[V] = src.vars[V]
		K.RunningSpeed=15;K.Running=1;K.density=1
		K.icon=src.icon;K.overlays+=src.overlays
		K.name="[src.name]";K.Owner=src
		K.tai=K.tai/2;K.nin=K.nin/2;K.gen=K.gen/2
		if(Number>100)
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
		K.Running=1;K.RunningSpeed=15
		K.icon_state="running";K.CloneType="KBunshin";K.Clone=1;K.CloneType="TBunshin";K.PoisonClone=1

mob/var/PoisonType=""
mob/var/PoisonTime=0
mob/var
	HasLeftEye=1
	HasRightEye=1
obj/EyeThing
	name="Eye"
	var/Type = ""	//Sharingan, Byakuugan, Akametsuki ect....
	var/Side = "Left"
	var/Clan = ""
	proc/RemoveJutsus(mob/M)
		for(var/obj/SkillCards/S in M.LearnedJutsus)
			if(findtext(src.Type,"sharingan")&&M.Clan!="Uchiha"&&S.name=="Sharingan")
				del(S)
			if(findtext(src.Type,"byakugan")&&M.Clan!="Hyuuga"&&S.name=="Byakugan")
				del(S)
			if(findtext(src.Type,"akametsuki")&&M.Clan!="Kyomou"&&S.name=="Akametsuki")
				del(S)
			if(findtext(src.Type,"mangekyo")&&M.Clan!="Uchiha"&&S.name=="Mangekyo Sharingan")
				del(S)
	proc/GiveJutsu(mob/M)

mob/proc/ExtractEye()
	if(!src.ntarget)
		src << "You need to target them first!";return
	if(!src.scalpel)
		src <<"You must have Scalpels Activated for precission!"
		return	//If you want, you can program some medic tools, but this is for now ;o
	var/mob/T = src.target
	for(var/mob/M in get_step(src,src.dir))
		if(M==T)
			viewers(4) << "[src] begins to cut into [T]'s eye socket with deadly accuracy!"
			src.firing=1;src.FrozenBind="EyeExtract"
			M.firing=1;M.FrozenBind="EyeExtract"
			var/which=input("Which eye would you like to remove?") in list("Left","Right")
			sleep(100)
			M.Bloody()
			spawn(5) M.Bloody()
			var/found=0
			if(which=="Left")
				viewers() << "[src] finishes carefully cutting [M]'s left eye!"
				M.HasLeftEye=0
			if(which=="Right")
				viewers() << "[src] finishes carefully cutting [M]'s right eye!"
				M.HasRightEye=0
			var/obj/EyeThing/E
			for(var/obj/EyeThing/F in M.contents)
				if(F.Side==which)
					found=1
					E=F
			if(!found)
				E = new()
				E.Side=which
				E.Clan = M.SecondName
				for(var/obj/SkillCards/S in M.LearnedJutsus)
					if(S.name == "Sharingan")
						if(E.Type=="") E.Type="Sharingan"
						else
							E.Type = "[E.Type], Sharingan"
					if(S.name == "Byakugan")
						if(E.Type=="") E.Type="Byakugan"
						else
							E.Type = "[E.Type], Byakugan"
					if(S.name == "Akametsuki")
						if(E.Type=="") E.Type="Akametsuki"
						else
							E.Type = "[E.Type], Akametsuki"
					if(S.name == "Mangekyo Sharingan")
						if(E.Type=="") E.Type="Mangekyo ([M.mangekyouC])"
						else
							E.Type = "[E.Type], Mangekyo ([M.mangekyouC])"
				E.loc = src
			else
				E.RemoveJutsus(M)
				E.loc = src
				E.GiveJutsu(M)


mob/proc/Chakra_Sense()
	if(src.knockedout)
		src.ChakraSense=0
		return
	if(src.ChakraSense)
		src.ChakraSense=0
		return
	src.ChakraDrain(5500)
	sleep(10)
	src.ChakraSense=1
	src<<"You're now able to sense chakra! Press Z + C to see if there is any noticable Chakra around you!"
	while(src.ChakraSense)
		src.ChakraDrain(3700)
		sleep(15)

mob/proc/ChakraAuraRemoval()
	var/k=3500//the drain of the jutsu.
	if(src.Auraoff==0)
		src<<"You begin to conceal your chakra."
		src.Auraoff=1;
	else if(src.Auraoff==1)
		src<<"You begin to reveal your chakra again."
		src.Auraoff=0;
	for(var/mob/M in OnlinePlayers)
		if(M in oview(20))
			M.ChakraSight(0)
	while(src.Auraoff==1)
		src.ChakraDrain(k)
		sleep(rand(25,30))

mob/var/tmp/watching=0
mob/proc/EyeoftheKagura(mob/M in world)
	if(!usr.watching)
		usr<<"You watch [M]!"
		usr<<"[M]'s current location is [M.x],[M.y],[M.z].";
		if(!M.InGenjutsu=="")
			usr<<"[M] is currently under the effects of [M.InGenjutsu]'s Genjutsu";
		usr.watching=1
		usr.client.perspective = EYE_PERSPECTIVE
		usr.client.eye=M
		while(usr.watching)
			usr.ChakraDrain(1500)
			usr.client.perspective=MOB_PERSPECTIVE
			usr.client.eye=usr
			usr.watching=0
			sleep(50)
	else
		usr.client.perspective=MOB_PERSPECTIVE
		usr.client.eye=usr
		usr.watching=0