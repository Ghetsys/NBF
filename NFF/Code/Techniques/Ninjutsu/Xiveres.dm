mob/var/StoredSouls=0

////////////////////////
////Xiveres Jutsu

mob/var/SoulAbsorbalMastery=0
mob/var/SoulBonus=0
mob/var/SoulCap=25
mob/var/SoulKnowledge=0
mob/var/TargetByXiveres=0

mob/proc
	XiveresCytoplasm()
		if(src.knockedout||src.firing||src.Frozen)
			return
		if(src.StoredSouls<1)
			src<<"You need at least 1 soul to utilize this jutsu.";return
		var/ChakraLoss=500
		src.StoredSouls-=1
		src.chakra-=ChakraLoss
		src.Handseals(40-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src<<"You convert your Souls into a form of harmful Cytoplasm"
		src.icon_state="Jutsu";src.Frozen=1;src.firing=1
		spawn(20)
			src.Frozen=0;src.firing=0;src.icon_state=""
		var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/A=new();A.Owner=src;A.nin=src.nin;A.JutsuLevel=1
		var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/B=new();B.Owner=src;B.nin=src.nin;B.JutsuLevel=1
		var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/C=new();C.Owner=src;C.nin=src.nin;C.JutsuLevel=1
		var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/D=new();D.Owner=src;D.nin=src.nin;D.JutsuLevel=1
		var/obj/Jutsu/Elemental/Acid/MeltingAcidWave/E=new();E.Owner=src;E.nin=src.nin;E.JutsuLevel=1
		if(src.dir==NORTH)
			A.loc=locate(src.x,src.y+1,src.z);A.dir=NORTH;A.Edge=8
			B.loc=locate(src.x-1,src.y+1,src.z);B.dir=NORTH;B.Edge=8
			C.loc=locate(src.x+1,src.y+1,src.z);C.dir=NORTH;C.Edge=8
			D.loc=locate(src.x-2,src.y+1,src.z);D.dir=NORTH;D.Edge=7
			E.loc=locate(src.x+2,src.y+1,src.z);E.dir=NORTH;E.Edge=9
		if(src.dir==SOUTH)
			A.loc=locate(src.x,src.y-1,src.z);A.dir=SOUTH;A.Edge=2
			B.loc=locate(src.x-1,src.y-1,src.z);B.dir=SOUTH;B.Edge=2
			C.loc=locate(src.x+1,src.y-1,src.z);C.dir=SOUTH;C.Edge=2
			D.loc=locate(src.x-2,src.y-1,src.z);D.dir=SOUTH;D.Edge=1
			E.loc=locate(src.x+2,src.y-1,src.z);E.dir=SOUTH;E.Edge=3
		if(src.dir==WEST)
			A.loc=locate(src.x-1,src.y,src.z);A.dir=WEST;A.Edge=6
			B.loc=locate(src.x-1,src.y-2,src.z);B.dir=WEST;B.Edge=9
			C.loc=locate(src.x-1,src.y-1,src.z);C.dir=WEST;C.Edge=6
			D.loc=locate(src.x-1,src.y+1,src.z);D.dir=WEST;D.Edge=6
			E.loc=locate(src.x-1,src.y+2,src.z);E.dir=WEST;E.Edge=3
		if(src.dir==EAST)
			A.loc=locate(src.x+1,src.y,src.z);A.dir=EAST;A.Edge=4
			B.loc=locate(src.x+1,src.y-2,src.z);B.dir=EAST;B.Edge=7
			C.loc=locate(src.x+1,src.y-1,src.z);C.dir=EAST;C.Edge=4
			D.loc=locate(src.x+1,src.y+1,src.z);D.dir=EAST;D.Edge=4
			E.loc=locate(src.x+1,src.y+2,src.z);E.dir=EAST;E.Edge=1
		walk(A,A.dir);walk(B,B.dir);walk(C,C.dir);walk(D,D.dir);walk(E,E.dir)

	XiveresSoulUnleash()
		var/MainStat=""
		var/Activated=0
		var/A=0
		if(src.knockedout||src.firing)
			return
		if(Activated==1)
			src<<"Nope.";return
		if(src.StoredSouls<5)
			src<<"You need at least 5 Souls to utilize this jutsu.";return
		src.StoredSouls-=5
		src<<"You feed on the Souls you have Stored."
		sleep(10)
		if(src.GenSkill>src.NinSkill&&src.GenSkill>src.TaiSkill)
			src<<"The souls sense you are strongest with control over your chakra. Your control has been boosted temporarily."
			MainStat="Control"
		else if(src.TaiSkill>src.NinSkill&&src.TaiSkill>src.GenSkill)
			src<<"The souls sense you are strongest with Brute Force. Your forcefullness has been boosted temporarily."
			MainStat="Physique"
		else if(src.NinSkill>src.GenSkill&&src.NinSkill>src.TaiSkill)
			src<<"The souls sense you are strongest with manipulating your chakra. Your chakra has been boosted temporarily."
			MainStat="Capacity"
		else
			src<<"The souls sense you are balanced among all stats. Your body has been moderatly boosted temporariliy."
			MainStat="Balanced"
		sleep(10)
		if(MainStat=="Control")
			src.gen=src.Mgen*1.3
			Activated=1
		if(MainStat=="Capacity")
			src.nin=src.Mnin*1.3
			Activated=1
		if(MainStat=="Physique")
			src.tai=src.Mtai*1.3
			Activated=1
		if(MainStat=="Balanced")
			src.tai=src.Mtai*1.1;src.nin=src.Mnin*1.1;src.gen=src.Mgen*1.1
			Activated=1
		while(Activated==1)
			if(A>45||src.chakra<=0)
				Activated=2
			A++
			src.chakra-=rand(30,55)
			if(src.knockedout)
				Activated=2
			sleep(10)
		if(Activated==2)
			if(MainStat=="Control")
				src<<"You stop feeding on the Souls. You lose the enpowerment."
				src.gen=src.Mgen
				Activated=0
				return
			if(MainStat=="Capacity")
				src<<"You stop feeding on the Souls. You lose the enpowerment."
				src.nin=src.Mnin
				Activated=0
				return
			if(MainStat=="Physique")
				src<<"You stop feeding on the Souls. You lose the enpowerment."
				src.tai=src.Mtai
				Activated=0
				return
			if(MainStat=="Balanced")
				src<<"You stop feeding on the Souls. You lose the enpowerment."
				src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
				Activated=0
				return



	XiveresSoulAbsorb()
		var/Process=0
		var/ProcessContinue=0
		if(src.knockedout||src.firing)
			return
		else
			var/list/People=list()
			for(var/mob/Q in get_step(src,src.dir))
				if(Q.client&&Q.knockedout)
					People+=Q
			var/mob/M
			if(People.len>0)
				M=pick(People)
			if(M.client)
				if(M.knockedout&&M.client&&(M.XiveresMember!=1))
					src.Frozen=1
					src<<"You place your hands on [M]."
					sleep(5)
					src<<"You begin to concentrate on the Soul Absorbtion.";M<<"<font color=#660198>Your body begins to go numb...</font>"
					var/obj/Mshar/A=new();A.screen_loc = "1,1 to 19,19"
					M.client.screen+=A
					src.client.screen+=A;A.icon_state="Soul"
					Process=1
					spawn(50)
						if(Process==1)
							M<<"<font color=#660198>Your body feels strange....Almost as though your life is being sucked away...</font>"
							src<<"Just a little longer until you steal their soul...."
					while(Process==1)
						src.icon_state="throw"
						ProcessContinue+=1
						if(ProcessContinue>=5)
							Process=2
						if(src.knockedout)
							src<<"You become unconcious, ruining the Soul Absorbtion process!"
							src.client.screen-=A;Process=0;src.FrozenBind="";Process=0;src.Frozen=0;M.client.screen-=A
						if(M.knockedout!=1)
							src<<"[M] woke up ruining the Soul Absorbtion process!"
							src.client.screen-=A;Process=0;src.FrozenBind="";Process=0;src.Frozen=0;M.client.screen-=A
						sleep(10)
					if(Process==2) //For a success
						if(prob(45+src.SoulAbsorbalMastery))
							if(!M.deathcount) //This should never happen, because if they're KO'd deathcount should be > 0
											//This is only here as a fail-safe.
								src<<"You weren't able to get any of [M]'s soul for some reason?.."
								M<<"The strange sensation passes..."
								src.client.screen-=A
							if(M.deathcount>0&&M.deathcount<=2)
								src.StoredSouls+=0.2
								if(M.Bijuu!="")
									if(prob(30))
										src<<"You extract some of the Bijuu's Soul, which increases your Soul Cap!"
										src.SoulBonus+=1
										world<<"<font color=#660198>The Life of a Bijuu was Weakened...</font>"
								if(src.StoredSouls>SoulCap+src.SoulBonus)
									src.StoredSouls=SoulCap+src.SoulBonus
								src<<"<font color=#660198>This soul still has the strength to fight, You weren't able to get much...</font>"
								M<<"<font color=#660198>You feel slightly odd and weakened...What happened?</font>"
								src.Frozen=0
								src.client.screen-=A;M.client.screen-=A
								if(prob(15))
									src.SoulAbsorbalMastery+=rand(1,5)*0.1
									src.SoulKnowledge+=rand(1,4)*0.1
							else if(M.deathcount>2&&M.deathcount<=3)
								src.StoredSouls+=0.5
								if(M.Bijuu!="")
									if(prob(30))
										src<<"You extract some of the Bijuu's Soul, which increases your Soul Cap!"
										src.SoulBonus+=1
										world<<"<font color=#660198>The Life of a Bijuu was Weakened...</font>"
								if(src.StoredSouls>SoulCap+src.SoulBonus)
									src.StoredSouls=SoulCap+src.SoulBonus
								src<<"<font color=#660198>This soul has been weakened a bit. You were able to grab just bit more of it...</font>"
								M<<"<font color=#660198>Your body gets extremly weak...You feel lifeless...?</font>"
								src.Frozen=0
								src.client.screen-=A;M.client.screen-=A
								if(prob(25))
									src.SoulAbsorbalMastery+=rand(1,6)*0.1
								if(prob(25))
									src.SoulKnowledge+=rand(2,6)*0.1
							else if(M.deathcount>3)
								if(M.Bijuu!="")
									if(prob(30))
										src<<"You extract some of the Bijuu's Soul, which increases your Soul Cap!"
										world<<"<font color=#660198>The Life of a Bijuu was Weakened...</font>"
										src.SoulBonus+=1
								src.StoredSouls+=1
								if(src.SoulAbsorbalMastery>=80)
									src.StoredSouls+=pick(0,1)
								if(src.StoredSouls>SoulCap+src.SoulBonus)
									src.StoredSouls=SoulCap+src.SoulBonus
								src<<"<font color=#660198>This soul was on the brink of death... Taking it was easy....</font>"
								M<<"<font color=#660198>You feel as though a chunk of your life force was ripped away...</font>"
								src.client.screen-=A;M.client.screen-=A
								src.Frozen=0
								if(prob(45))
									src.SoulAbsorbalMastery+=rand(2,7)*0.1
								if(prob(40))
									src.SoulKnowledge+=rand(4,9)*0.1
							src.FrozenBind=""
						else
							src<<"<font color=#660198>You placed your hands on his stomach...But didn't feel a sense of his soul...</font>"
							M<<"<font color=#660198>Removes their hands off your stomach....what were they trying to do?</font>"
							src.FrozenBind=""
							src.Frozen=0
							if(prob(20))
								src.SoulAbsorbalMastery+=rand(2,4)*0.1
							if(prob(20))
								src.SoulKnowledge+=rand(1,10)*0.1
							src.client.screen-=A;M.client.screen-=A
					else
						src<<"The absorbtion failed!"
						if(prob(10))
							src.SoulAbsorbalMastery+=rand(3,5)*0.1
							src.SoulKnowledge+=rand(2,6)*0.1
						M<<"The strange sensation passes..."
						src.Frozen=0
						src.client.screen-=A;M.client.screen-=A

	XiveresLeaderSoulSummon()
		if(src.StoredSouls<1)
			src<<"You need at least 1 Soul to use this jutsu.";return
		if(src.knockedout||src.Frozen||src.firing)
			return
		src.ChakraDrain(75000)
		src.StoredSouls-=1
		src.Handseals(150-src.HandsealSpeed)
		for(var/mob/M in world)
			spawn()
				if(M.XiveresMember)
					M.FrozenBind="XiveresTeleporting"
					M<<"You're unable to move your body!"
					sleep(10)
					M<<"<font color=#D2DDF1>Your body converts to its raw spiritual energy and raises into the atmosphere..</font>"
					spawn(35)
						M.loc = locate(src.x+rand(1,4),src.y+rand(1,4),src.z)
						M<<"The leader of Xiveres, [src], has summoned you!"
						M.FrozenBind=""
				else
					M<<"<font color=#D2DDF1>Bright pillars of lights erupt into the sky and begin traveling towards a central location...</font>"

	XiveresLeaderSacrificialRejuvination()
		if(src.knockedout||src.firing||src.Frozen)
			return
		if(src.StoredSouls<2)
			src<<"You need at least 2 Souls to use this jutsu.";return
		src.ChakraDrain(75000)
		src.StoredSouls-=2
		for(var/mob/M in oview(8,src))
			src.FrozenBind="XiveresSacrifice"
			oview()<<"[src] removes a seal from his chest!"
			sleep(10)
			src.ChakraDrain(35000)
			src.deathcount+=10
			oview()<<"[src] begins to grow extremly weak..."
			sleep(10)
			if(M.XiveresMember!=1)
				M<<"<font color=#5A5479>The air becomes dense with evil demonic chakra...</font>"
			else
				M<<"[src] is starting to release his very own soul into the atmosphere to heal you! Get Close to him!"
			spawn(30)
				for(var/mob/A in oview(4,src))
					if(A.XiveresMember)
						A.health+=rand(750,900)
						if(A.health>A.maxhealth)
							A.health=A.maxhealth
						A.stamina+=(A.maxstamina*0.35)
						if(A.stamina>A.maxstamina)
							A.stamina=A.maxstamina
					else
						A.FrozenBind="Soul Fear"
						A<<"<font color=#5A5479>An uncontrollable fear overcomes your body!! What's going on!?</font>"
						spawn(25)
							A.FrozenBind=""
							A<<"You shrug the Sensations off!"
		src<<"You've released your soul to feed your Members...."
		src.DamageProc(200000,"Health",usr)

	XiveresSelfishPunishment()
		if(src.knockedout||src.firing||src.Frozen)
			return
		if(src.StoredSouls<2)
			src<<"You need at least 2 Souls to use this jutsu.";return
		src.ChakraDrain(95000)
		src.StoredSouls-=2
		for(var/mob/M in world)
			if(M.XiveresMember)
				M<<"You lose the ability to feel...your whole body is going numb..."
				sleep(35)
				M<<"You lose all the strength in your legs..."
				M.FrozenBind="SelfishXiveres"
				M<<"Your vision begins to fade..."
				var/obj/Mshar/A=new();A.screen_loc = "1,1 to 19,19"
				M.client.screen+=A;A.icon_state="blinder"
				sleep(30)
				M.deathcount+=15
				M<<"You feel your soul leaving your body...!"
				sleep(20)
				M<<"You hear the voice of your leader as you begin to die ever so slowly..."
				sleep(25)
				M<<"Begone..."
				M.DamageProc(5000,"Health",src)
				M.FrozenBind=""
				M.client.screen-=A

	XiveresSoulAssault()
		var/TakingAffect=0
		var/obj/Mshar/A=new();A.screen_loc = "1,1 to 19,19"
	//	M.client.screen+=A;A.icon_state="blinder"
		if(src.knockedout||src.firing||src.Frozen)
			return
		if(src.StoredSouls<3)
			src<<"You need at least 3 souls to use this jutsu.";return
		var/mob/M=src.target
		if(src.ntarget)
			src<<"You can't unleash souls unless you have someone targetted.";return
		var/Distance=get_dist(src,M)
		if(Distance>7)
			src<<"The souls can't reach the victim...";return
		src.StoredSouls-=3
		if(M&&M.client)
			M.client.screen+=A;A.icon_state="blinder"
			src.icon_state="handseal"
			src<<"You release stored souls and convert them to Demonic Chakra to attack [M]! Moving will stop the Demonic forces."
			M<<"<font color=#9E0508>Your body feels extremly cold...Something demonic and sinister is approaching! Fight it by tapping spacebar!</font>"
			src.FrozenBind="XiveresSoulTrap"
			M.FrozenBind="XiveresSoulTrap"
			TakingAffect=1
		while(TakingAffect==1&&src.icon_state=="handseal")
			src.icon_state="handseal"
			src.FrozenBind="XiveresSoultrap"
			M.health-=20
			M.stamina-=(M.maxstamina*0.015)
			if(src.knockedout)
				TakingAffect=2
				src.FrozenBind=""
				M.FrozenBind=""
			if(M.Struggle>50)
				M<<"<font color=#9E0508>You feel the demonic presence weakening!</font>"
				M.client.screen-=A
				src.FrozenBind=""
				M.FrozenBind=""
				TakingAffect=0
			if(M.knockedout)
				TakingAffect=2
			sleep(5)
		if(TakingAffect!=1)
	//		M<<"You feel the demonic presence fade away completly.."
			src.FrozenBind=""
			if(TakingAffect==2)
				src<<"[M] has become consumed by the soul!"
			else
				src<<"<font color=#FF92BB>[M] has fought off the soul!</font>"
			M.client.screen-=A
			M.FrozenBind=""
			M.client.screen-=A
			M.client.screen-=A
		M.FrozenBind=""
		M.client.screen-=A
		src.FrozenBind=""





	XiveresSoulTransportation()
		if(src.knockedout)
			return;
		if(src.StoredSouls<5)
			src<<"You need 5 souls to use this technique..."
		if(src.ChakraPool<5000)
			src<<"You may have the proper amount of Souls, but that's useless if you don't have Reservoir..."
			return;
		//Creates a dead mob as the skin.
		var/mob/P = new /mob/player
		P.health=5000;P.icon=src.icon;P.overlays=src.overlays;P.name="[src]";P.Village=src.Village;
		P.icon_state="dead";P.loc=src.loc;P.knockedout=1;P.Dead=1;P.FrozenBind="Dead"
		spawn()
			P.DeleSelf(300)
		//orange(12,src)<<"<font size = 2>[src] is dead!</font>"//Death message to trick them.
		//Generic auto get up stuff
		src.sight&=~(SEE_SELF|BLIND)
		src.Struggle=0
		src.icon_state=""
		src.Frozen=0
		src.firing=0
		src.knockedout=0
		src.Endurance=src.MEndurance
		src.Frozen=0
		src.icon_state=""
		src.Guarding=0
		src.gencounter=0
		src.StoredSouls-=8
		src<<"Your Soul leaves the Body you were currently in....."
		src.StruggleAgainstDeath=0;
		src.health=src.maxhealth-350
		src.stamina=src.maxstamina-650
		src.ChakraPool-=rand(3000,5000)
		if(src.ChakraPool<0)
			src.ChakraPool=0
		src.invisibility=50//Its a kawa so invisible
		src.firing=1//don't abuse invisiblity
		src.Running=1;
		spawn(20)
			src.ImmuneToDeath=0
			src.invisibility=0
			src.firing=0
		return


	XiveresSoulRemove()
		if(src.knockedout||src.firing)
			return
		else
			src.chakra-=1000
			for(var/mob/M in get_step(src,src.dir))
				src<<"You begin to rip out [M]'s soul!"
				src.Frozen=1
				M.Frozen=1
				M<<"font color=#660198><font size=2>You feel something terribly wrong!</font>"
				sleep(150)
				src.Frozen=0
				if(M in get_step(src,src.dir))
					src<<"You pull out [M]'s soul and add it to your soul storage for later use."
					src.StoredSouls+=1
					src<<"You have [src.StoredSouls] Stored Souls."
					M<<"<font color=#660198><font size=3>You feel your soul being pulled from your body!</font>"
					M.health=0
					M.knockedout=1
					M.icon_state="dead"
					M.DeathStruggle(src,1)
					src<<"[M]'s max vitality is [M.maxhealth]"
					src<<"[M]'s max stamina is [M.maxstamina]"
					src<<"[M]'s max chakra is [M.Mchakra]"
					src<<"[M]'s Village is [M.Village]"
					src<<"[M]'s Age is [M.Age]"
					src<<"[M]'s Death Age is [M.DeclineAge]"
					src<<"[M]'s rank is [M.rank]"
					src<<"[M]'s Clan is [M.Clan]"
					src<<"[M] has [M.LearnedJutsus.len] Jutsu."
					if(M.Village=="Leaf") world<<"<font color=#660198><font size=4>A loud piercing scream is heard throughout the Leaf village as someone's life was forcibly stolen..</font>"
					if(M.Village=="Rock") world<<"<font color=#660198><font size=4>A loud piercing scream is heard throughout the Rock village as someone's life was forcibly stolen..</font>"
					if(M.Village=="Sound") world<<"<font color=#660198><font size=4>A loud piercing scream is heard throughout the Sound village as someone's life was forcibly stolen..</font>"
					if(M.Village=="Rain") world<<"<font color=#660198><font size=4>A loud piercing scream is heard throughout the Rain village as someone's life was forcibly stolen..</font>"
					oview()<<"<font color=red><font size=4> You watch as [src] pulls the life out of [M]!</font>"
					var/input=input(src,"Would you like a readout of all their jutsu?") in list("Yes","No")
					if(input=="Yes")
						for(var/obj/SkillCards/A in M.LearnedJutsus)
							src<<"They have <b>[A]</b> with <b>[A.Uses]</b>."
							sleep(1)
					return


	XiveresHeal()
		if(src.firing||src.knockedout)
			return
		if(src.target)
			src.dir=get_dir(src,src.target)
		flick("throw",src)
		if(src.StoredSouls==0)
			src<<"You do not have enough souls to perform this jutsu!";return
		src.StoredSouls-=1
		for(var/mob/M in get_step(src,src.dir))
			M<<"[src] uses their stored souls to restore your body."
			src<<"You begin to heal [M]"
			if(M.StruggleAgainstDeath>0)
				M.Struggle+=rand(99,99)
		///	M.deathcount=0
			if(M.health<M.maxhealth)
				M.health+=M.maxhealth
				if(M.deathcount<0)
					M.deathcount=0
				if(M.health>M.maxhealth)
					M.health=M.maxhealth
			if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath&&!M.CBleeding)
				M.Dead=0
				M.icon_state=""
				M.FrozenBind=""
				M.sight&=~(SEE_SELF|BLIND)
				orange(12,M)<<"<font size = 2>[M] was brought back from the brink of death!</font>"
			if(M.stamina<M.maxstamina)
				M.stamina+=M.maxstamina
				if(M.stamina>M.maxstamina)
					M.stamina=M.maxstamina
			M.chakra+=M.Mchakra
			if(M.chakra>M.Mchakra)
				M.chakra=M.Mchakra
			M.ChakraPool+=rand(300,600)
			if(M.screwed)
				if(prob(src.Focus*rand(-5,5)))
					M.screwed=0;M<<"Your nerves were healed.";src<<"You healed their nerves."
			if(M.CBleeding)
				if(prob(usr.Focus*rand(-5,5)))
					M.CBleeding=0;M<<"Your no longer bleeding.";src<<"Your healed their internal bleeding."

	XiveresToBase()
		if(src.KiriOpen) return
		viewers(src)<<"<i>[src] preforms a string of handseals!</i>"
		src.Handseals(30)
		if(src.HandsSlipped) return
		viewers(src)<<"<i><font color = gray>[src] thrusts his hand forward and a black gate opens!</font></i>"
		var/obj/KiriGate/K=new();K.loc=locate(usr.x,usr.y+1,usr.z)
		var/obj/KiriGate/K2=new();K2.loc=locate(32,64,32)
		spawn(100) src.KiriOpen=0
		K.openlocation=K2.loc;K2.openlocation=K.loc
		K.Owner=src;K2.Owner=src
		src.KiriOpen=1


	XiveresGate_Warp()
		if(src.KiriOpen)
			return
		else
			var/input=input(src,"Warp where?") in list("Leaf","Sound","Rock","Rain","Lava Lake","Jail")
			viewers(src)<<"<i>[src] preforms a string of handseals!</i>"
			src.Handseals(30)
			if(src.HandsSlipped) return
			viewers(src)<<"<i><font color = gray>[src] thrusts his hand forward and a black gate opens!</font></i>"
			var/obj/KiriGate/K=new();K.loc=locate(usr.x,usr.y+1,usr.z)
			var/obj/KiriGate/K2=new()
			if(input=="Leaf") K2.loc=locate(155,94,11)
			if(input=="Sound") K2.loc=locate(52,18,4)
			if(input=="Rock") K2.loc=locate(151,9,14)
			if(input=="Rain") K2.loc=locate(82,77,6)
			if(input=="Lava Lake") K2.loc=locate(144,120,34)
			if(input=="Jail") K2.loc=locate(57,120,35)
			spawn(100) src.KiriOpen=0
			K.openlocation=K2.loc;K2.openlocation=K.loc
			K.Owner=src;K2.Owner=src
			src.KiriOpen=1
	ReachForTheSky()
		if(src.ChakraPool<=3000)
			src<<"You don't have enough chakra to reach The Seven Skies Hideout in the sky!"
			return
		src.Handseals(90)
		if(src.HandsSlipped) return
		src.ChakraDrain(40000)
		src.ChakraPool-=4500
		src<<"<i><font color = yellow>You reach your hands torwards the sky as you begin to float upwards..</font></i>"
		src.FrozenBind="Reaching For the Sky"
		spawn(30)
			if(src.knockedout)
				src.FrozenBind=""
				return
			else
				src.loc=locate(85,82,40)
				src.FrozenBind=""
				src<<"<i><font color = yellow>You arrive at the Seven Skies Hideout located high in the sky...</font></i>"
	IndigoWarp()
		if(src.ChakraPool<=5000)
			src<<"You don't have enough chakra to reach the Indigo Hideout!"
			return
		src.Handseals(90)
		if(src.HandsSlipped) return
		src.ChakraDrain(40000)
		src.ChakraPool-=4500
		src<<"<i><font color = red>You reach your hands towards the ground as you begin to melt through it..</font></i>"
		src.FrozenBind="Indigo Warping"
		spawn(30)
			if(src.knockedout||src.firing||src.Frozen)
				src.FrozenBind=""
				return
			else
			//	src.loc=locate(85,82,40)
				src.loc=locate(32,64,32)
				src.FrozenBind=""
				src<<"<i><font color = red>You arrive at an area believed to be abandoned...</font></i>"


	XiveresPersonWarp()
		if(src.KiriOpen)
			return
		else
			var/people[]
			for(var/mob/P in world)
				if(P.SecondName!=""&&"[P.SecondName], [P.FirstName]" in namesknown||P.SecondName==""&&"[FirstName]" in namesknown)
					var/X
					if(P.SecondName!="") X="[P.SecondName], [P.FirstName]"
					if(P.SecondName=="") X="[P.FirstName]"
					people[X]=P
			var/Choice = input("Who do you want to teleport to?") in people +"Cancle"
			if(Choice == "Cancle") return
			var/mob/M=people[Choice]
			src<<"You make a swift slash, a portal opening behind your target and you!"
			flick("weaponslash",src)
			var/obj/KiriGate/K=new();K.loc=get_step(src,src.dir)
			var/obj/KiriGate/K2=new()
			if(M.dir==NORTH) K2.loc=locate(M.x,M.y-1,M.z)
			if(M.dir==SOUTH) K2.loc=locate(M.x,M.y+1,M.z)
			if(M.dir==WEST||M.dir==NORTHWEST||M.dir==SOUTHWEST) K2.loc=locate(M.x+1,M.y,M.z)
			if(M.dir==EAST||M.dir==NORTHEAST||M.dir==SOUTHEAST) K2.loc=locate(M.x-1,M.y,M.z)
			spawn(100) src.KiriOpen=0
			K.openlocation=K2.loc;K2.openlocation=K.loc
			K.Owner=src;K2.Owner=src
			src.KiriOpen=1