//mob/var/tmp/Akametsuki=0
mob/var/tmp
	ParticleCharge=1
	AkametsukiTrack=0
mob/var/tmp/AkametsukiBlind=0
mob/var/tmp/Rejuvination=0
mob/var/tmp/Majest=0


/*
mob/proc/Akametsuki(Uses)
	if(src.Akametsuki>=1)
		src.Akametsuki=0
		src.see_invisible=0
		src<<"You disactivate Akametsuki!"
		usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
		src.ChakraSight(0)
		src.verbs-=/mob/Kyomou/verb/AkametsukiBlind;src.verbs-=/mob/Kyomou/verb/AkametsukiSearch;src.verbs-=/mob/Kyomou/verb/Rejuvanate
	else
		src.Akametsuki=1
		src.ChakraSight(1)
		src.verbs+=/mob/Kyomou/verb/AkametsukiSearch
		if(src.AkametsukiMastery>20)
			src.Akametsuki=2
		if(src.AkametsukiMastery>30)
			src.Akametsuki=3
		if(src.AkametsukiMastery>50)
			src.verbs+=/mob/Kyomou/verb/Rejuvanate
		if(src.AkametsukiMastery>55)
			src.verbs+=/mob/Kyomou/verb/AkametsukiBlind
		if(src.AkametsukiMastery>100)
			for(var/mob/M in view(src))
				if(M.shari)
					M<<"You Sharingan was disactivated!?";M.ChakraSight(0)
					M.overlays-='Icons/Jutsus/sharinganthing.dmi';usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
					M.shari=0;M.SharCounter=0;M.CopyMode=0;M.IlluminateOff()
				if(M.bya)
					M<<"You Byakugan was disactivated!?";M.ChakraSight(0)
					M.overlays-='Icons/Jutsus/BEyes.dmi';usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
					M.verbs-=/mob/hyuuga/verb/ByakuganSearch;M.verbs-=/mob/hyuuga/verb/ByaSense;M.verbs-=/mob/hyuuga/verb/Watch
					M.bya=0;M.see_invisible=0
				if(M.Akametsuki>=1)
					if(M.AkametsukiMastery*2<src.AkametsukiMastery)
						M<<"A doujutsu like yours has been activated, its power so tremendous it disactivated yours!"
						M.Akametsuki=0;M.see_invisible=0;usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);M.ChakraSight(0)
						M.verbs-=/mob/Kyomou/verb/AkametsukiBlind;M.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
		src<<"You activate Akametsuki!"
		usr.ChangeEyeStyle(usr.EyeStyle,200,0,0)
		src.see_invisible=99
		while(src.Akametsuki>=1)
			var/A=src.AkametsukiMastery
			if(A<1) A=1
			var/ChakraDrain=(src.Mchakra/(A*15))
			if(ChakraDrain>100)
				ChakraDrain=100
			src.chakra-=ChakraDrain
			if(prob(5))
				src.AkametsukiMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2)
			if(src.AkametsukiMastery>=100)
				for(var/mob/M in view(src))
					if(M.shari)
						M<<"You Sharingan was disactivated!?";M.ChakraSight(0)
						M.overlays-='Icons/Jutsus/sharinganthing.dmi';usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
						M.shari=0;M.SharCounter=0;M.CopyMode=0;M.IlluminateOff()
					if(M.bya)
						M<<"You Byakugan was disactivated!?"
						M.overlays-='Icons/Jutsus/BEyes.dmi';usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);M.ChakraSight(0)
						M.verbs-=/mob/hyuuga/verb/ByakuganSearch;M.verbs-=/mob/hyuuga/verb/ByaSense;M.verbs-=/mob/hyuuga/verb/Watch
						M.bya=0;M.see_invisible=0
					if(M.Akametsuki>=1)
						if(M.AkametsukiMastery*2<src.AkametsukiMastery)
							M<<"A doujutsu like yours has been activated, its power so tremendous it disactivated yours!"
							M.Akametsuki=0;M.see_invisible=0;usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);M.ChakraSight(0)
							M.verbs-=/mob/Kyomou/verb/AkametsukiBlind;M.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
			sleep(50)

*/
mob/Kyomou/verb/Rejuvanate()
	set category = "Doujutsu"
	set name = "Rejuvination"
	if(src.Rejuvination)
		return
	if(src.Akametsuki<1)
		src<<"You need to have Akametsuki on!";return
	else
		src.Rejuvination=1;spawn(10) src.Rejuvination=0
		for(var/mob/M in get_step(src,src.dir))
			if(!M.client||!src.client)
				return
			src.chakra-=100
			M<<"[usr] gives up their chakra to heal you!"
			usr<<"You give up your chakra to heal [M]!"
			M.health+=100;M.stamina+=100
			if(M.health>=M.maxhealth)
				M.health=M.maxhealth
			if(M.stamina>=M.maxstamina)
				M.stamina=M.maxstamina
			if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath)
				M.Dead=0
				M.icon_state=""
				M.FrozenBind=""
				M.sight&=~(SEE_SELF|BLIND)
				orange(12,M)<<"<font size = 2>[M] was revived from the brink of death!</font>"

			return
obj/Makam
	icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state = "strong"
	layer=MOB_LAYER+1
	screen_loc="1,1 to 19,19"
	mouse_opacity = 1

obj/Kyomou
	Particles
		icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
		icon_state = "strong"
		mouse_opacity = 0
		layer=MOB_LAYER+1
		invisibility=100
		var
			Owner




mob/Kyomou/verb/AkametsukiBlind()
	set name="Akametsuki Blind"
	set category="Doujutsu"
	if(usr.AkametsukiBlind)
		return
	usr.Target()
	if(usr.ntarget)
		return
	var/mob/M=src.target
	if(!M.client)
		return
	if(M.Majest)

		src<<"A strange power overwhelms your eyes! Its power so tremendous it disactivated your Akametsuki!"
		src.Akametsuki=0;src.see_invisible=1;src.overlays-='Icons/Jutsus/SEyes.dmi'
		src.verbs-=/mob/Kyomou/verb/AkametsukiBlind;src.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
	for(var/obj/Makam/X in M.client.screen)
		del(X)
	var/obj/Makam/MM=new()
	M.client.screen+=MM
	usr.ChakraDrain(25000)
	usr<<"You blind [M] with a red vision!"
	if(usr.AkametsukiMastery>100)
		MM.icon_state="strong"
	usr.AkametsukiBlind=1;spawn(900)
		usr.AkametsukiBlind=0
	var/Z=usr.AkametsukiMastery*10
	if(Z>300)
		Z=300
	spawn(Z)
		for(var/obj/Makam/ZX in M.client.screen)
			del(ZX)




mob/Kyomou/verb/AkametsukiSearch()
	set name="Akametsuki Search"
	set category="Doujutsu"
	if(usr.AkametsukiTrack)
		usr.AkametsukiTrack=0
		usr.firing=0
		usr.controlled=null
		usr.client.perspective=MOB_PERSPECTIVE
		usr.client.eye=usr
		for(var/mob/Kyomou/AkametsukiTrack/P in world) if(P.Owner == usr) del(P)
	else
		usr.firing=1
		var/mob/Kyomou/AkametsukiTrack/P=new()
		P.loc=locate(usr.x-1,usr.y,usr.z)
		P.Owner=usr
		usr.controlled = P
		usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
		usr.client.eye = P
		usr.AkametsukiTrack=1


mob/Kyomou/AkametsukiTrack
	name=""
	density=0



mob/Kyomou/verb
	ChangeParticles()
		set name="Change Particles"
		set category="Doujutsu"
		usr.ParticleCharge=round(input(usr,"Set your Particle Charge.") as num)







mob/proc
	Akametsuki(Uses)
		if(src.Akametsuki>=1)
			src.Akametsuki=0
			src.see_invisible=1
			src<<"You deactivate Akametsuki!"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
			src.ChakraSight(0)
			src.verbs-=/mob/Kyomou/verb/ChangeParticles;src.verbs-=/mob/Kyomou/verb/AkametsukiSearch
			src.verbs-=/mob/Kyomou/verb/AkametsukiBlind;src.verbs-=/mob/Kyomou/verb/Rejuvanate
		else
			src.Akametsuki=1;src.ChakraSight(1);src.verbs+=/mob/Kyomou/verb/AkametsukiSearch;src.verbs+=/mob/Kyomou/verb/ChangeParticles
			if(src.AkametsukiMastery>30)
				src.Akametsuki=2
			if(src.AkametsukiMastery>60)
				src.Akametsuki=3
			if(src.AkametsukiMastery>90)
				src.verbs+=/mob/Kyomou/verb/AkametsukiBlind
			if(src.AkametsukiMastery>120)
				src.verbs+=/mob/Kyomou/verb/Rejuvanate
			src<<"You activate Akametsuki!";usr.ChangeEyeStyle(usr.EyeStyle,200,0,0);src.see_invisible=100
			src<<"Press and hold X to release particles!"
			while(src.Akametsuki>=1)
				sleep(10)
				var/A=src.AkametsukiMastery
				if(A<1) A=1
				var/ChakraDrain=(src.Mchakra/(A*15))
				if(ChakraDrain>100)
					ChakraDrain=100
				if(ChakraDrain<10)
					ChakraDrain=10
				src.chakra-=ChakraDrain
				if(prob(2))
					src.AkametsukiMastery+=pick(0.1,0.2,0.3,0.4,0.5)
mob/proc
	Particle_Release()
		set background=1
		if(src.Guarding&&!src.resting&&!src.knockedout&&!src.Dead&& (src.chakra/src.Mchakra)*100>=90-(src.ParticleUsage*5) )
			for(var/turf/T in view(2*src.Akametsuki,src))
				var/obj/Kyomou/Particles/B=new();B.loc=T;B.Owner=src
				src.JutsuList.Add(B)
			var/list/SleepList=list()	//List created at beginning
			while(src.Guarding&&src.Akametsuki>0 && (src.chakra/src.Mchakra)*100>=90-(src.ParticleUsage*5))
				//if(src.Charging&&(src.chakra/src.Mchakra)*100>=90-(src.ParticleUsage*5))
				if(src.ParticleUsage<10&&prob(5))
					src.ParticleUsage += pick(0.05,0.1,0.13)
					if(src.ParticleUsage>=10) src.ParticleUsage=10
				var/AB=0;AB-=src.NinSkill;AB+=src.GenSkill;AB-=src.TaiSkill;AB=round(AB);AB+=(src.ParticleCharge*2)
				var/ChakraDrain=100-(src.ParticleUsage*5)
				src.chakra-=ChakraDrain
				var/list/AOEAffected = view(2*src.Akametsuki,src)
				var/ParticleDoesThis="CDamage1"		//(-inf,-70)	Chakra Damage
				if(AB>=-70)
					ParticleDoesThis="HDamage3"		//[-70,-65)		Vitality Heal
				if(AB>=-65)
					ParticleDoesThis="SDamage2"		//[-65,50]		Strong Stamina Damage
				if(AB>50)
					ParticleDoesThis="CDamage2"		//(50,85)		Chakra Heal
				if(AB>=85)
					ParticleDoesThis="HDamage1"		//[85,100]		Weak Vitality Damage
				if(AB>100)
					ParticleDoesThis="SDamage1"		//(100,120] [140,inf)Weak Stamina Damage
				if(AB>120&&AB<140)
					ParticleDoesThis="GenKaiShutOff"//(120,140)		Cancle Gen Kai
				//Precise Particles
				//These are the stronger ones
				if(AB==-496)
					ParticleDoesThis="HDamage2"		//Strong Vitality Damage
				if(AB==(-19))
					ParticleDoesThis="Burn"
				if(AB==51)
					ParticleDoesThis="Resevoir"
				if(AB==99)
					ParticleDoesThis="Screw Movements"
				if(AB==12)
					ParticleDoesThis="Stun"
				if(AB==135)
					ParticleDoesThis="Sleep"
				if(AB==169)
					ParticleDoesThis="ChakraDrain"	//Kiriame effect
				if(AB==100)
					ParticleDoesThis="Sharingan"
				if(AB==200)
					ParticleDoesThis="Byakugan"
				if(ParticleDoesThis=="CDamage1")
					for(var/mob/M in AOEAffected)
						spawn()
							if(M!=src)
								var/Damage=src.AkametsukiMastery/5
								if(Damage<30)
									Damage=30
								if(Damage>150)
									Damage=150
								M.chakra-=Damage
						sleep(3);
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="CDamage2")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)//11/30/12
							spawn()
								if(M!=src)
									var/Damage=src.AkametsukiMastery/5
									if(Damage<50)
										Damage=50
									if(Damage>300)
										Damage=300
									M.chakra+=Damage
									if(M.chakra>M.Mchakra*1.5)
										M.chakra=M.Mchakra*1.5
									if(prob(10))
										M<<"You feel yourself swell up with chakra from the air around you!"
						sleep(3);
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Resevoir")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src && M.ChakraPool > 0)
									M.ChakraPool-= max((src.AkametsukiMastery*3)+rand(100,500),1500)
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="HDamage1")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									var/Damage=src.AkametsukiMastery/5
									if(Damage<15)
										Damage=15
									if(Damage>25)
										Damage=25
									M.health-=Damage
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="HDamage2")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									var/Damage=src.AkametsukiMastery/5
									if(Damage<50)
										Damage=50
									if(Damage>200)
										Damage=200
									M.health-=Damage
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="HDamage3")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src && M.health < M.maxhealth)
									var/Damage=src.AkametsukiMastery/5
									if(Damage<40)
										Damage=40
									if(Damage>100)
										Damage=100
									M.health+=Damage
									if(M.health>M.maxhealth) M.health=M.maxhealth
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="SDamage1")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									var/Damage=src.AkametsukiMastery/10
									if(Damage<50)
										Damage=50
									if(Damage>250)
										Damage=250
									M.stamina-=Damage
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="SDamage2")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									var/Damage=src.AkametsukiMastery/5
									if(Damage<50)
										Damage=50
									if(Damage>300)
										Damage=300
									if(prob(10))
										M<<"You feel a wave of exhaustion come over you.."
										M.thirst+=0.5+rand(0,1)
									M.stamina-=Damage
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="GenKaiShutOff")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									M.gencounter=0
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Screw Movements")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									M.client:dir= pick(NORTH,SOUTH,WEST,EAST)
									spawn(rand(5,30))
										M.client:dir=NORTH
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Sleep")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M.Status!="Asleep" && M!=src)
									if(!(M in SleepList))
										SleepList.Add(M)
										SleepList[M] = 1
									else
										SleepList[M] += 1
									if(SleepList[M] >= 5)	//After 5 loops of being in it (10 seconds)
										M<<"Your body has gone completely numb!"
										M.Status="Asleep"
										M.StatusEffected=min(src.AkametsukiMastery/10,20)
										SleepList.Remove(M)
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Burn")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src&&M.Status=="")
									M<<"The air around you suddenly is scorching hot!"
									M.Status="Burn"
									M.StatusEffected=min(src.AkametsukiMastery/10,20)
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Stun")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src)
									M.Stun+=2
									if(M.Stun>30)
										M.Stun=30
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="ChakraDrain")
					for(var/obj/O in AOEAffected)
						spawn()
							if(istype(O,/obj/Jutsu/Elemental/Katon)||istype(O,/obj/Jutsu/Elemental/Raiton)||istype(O,/obj/Jutsu/Elemental/Fuuton)||istype(O,/obj/Kaiten)||istype(O,/obj/KaitenZ)||istype(O,/obj/Kaiten2)||istype(O,/obj/Jutsu/Kiro)||istype(O,/obj/Jutsu/Sand/Suna2)||istype(O,/obj/Jutsu/Sand/kyuu)||istype(O,/obj/Jutsu/Sand/SandTurf)||istype(O,/obj/Jutsu/Sand/Sphere))
								del(O)
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M.Rasenganon) M.RasenganD=0
								if(M.Chidorion||M.Raikirion) M.ChidoriD=0
								if(M.RaiArmor)
									M.overlays-='RaiArmor.dmi'
									M.overlays-='RaiArmor2.dmi'
									M.tempmix='ChakraAura.dmi';M.tempmix+=rgb(36,45,156)
									var/icon/Q=icon(M.tempmix);M.overlays-=Q
									M.RaiArmor=0;M.Touei=0;M.FlashFlicker=0
								if(M.sphere)
									src.FrozenBind="";src.firing=0;src.sphere=0
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Sharingan")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src&&M.shari)
									M.Sharingan()
									for(var/obj/SkillCards/Sharingan/S in M.LearnedJutsus)
										S.DelayIt(100,M,"Clan")
					goto endparticle//Jumps to end.
				if(ParticleDoesThis=="Byakugan")
					for(var/mob/M in AOEAffected)
						if(M in OnlinePlayers)
							spawn()
								if(M!=src&&M.bya)
									M.ByakuganOn()
									for(var/obj/SkillCards/Byakugan/S in M.LearnedJutsus)
										S.DelayIt(100,M,"Clan")
				endparticle
				sleep(20)

			for(var/obj/Kyomou/Particles/ac in src.JutsuList)
				del(ac)

		sleep(1)

mob/var
	list/Particles=list()

obj/Kyomou/Preset
	//icon = 'Icons/Hud/Kyo.dmi'
	var
		Set=1
	New()
		..()
		src.screen_loc="[9-(src.Set)],9"
		src.name="Particle Preset [src.Set]"
	Click()
		usr.ParticleCharge=usr.Particles[src.Set]
		usr<<"<b>[usr.ParticleCharge]</b>"
	verb/SetPreset()
		//set src in loc
		set name="Set Paritcle Preset"
		//set category="Doujutsu"
		var/current=usr.Particles[src.Set]
		switch(input("Are you sure you'd wish to set preset [src.Set] from [current] to [usr.ParticleCharge]?") in list("Yes","No"))
			if("No") return
			if("Yes")
				usr.Particles[src.Set]=usr.ParticleCharge











//////////
mob/proc/OneEyeAkametsuki()
	if(src.Akametsuki>=1)
		src.Akametsuki=0
		src.see_invisible=1
		src<<"You cover up your Akametsuki, stopping its abilities."
		src.overlays-='Icons/Jutsus/sharinganthing.dmi';src.overlays-='Icons/Jutsus/SEye.dmi'
		src.verbs-=/mob/Kyomou/verb/AkametsukiBlind;src.verbs-=/mob/Kyomou/verb/AkametsukiSearch;src.verbs-=/mob/Kyomou/verb/Rejuvanate
	else
		src.Akametsuki=1
		src.verbs+=/mob/Kyomou/verb/AkametsukiSearch
		if(src.AkametsukiMastery>20)
			src.Akametsuki=2
		if(src.AkametsukiMastery>30)
			src.Akametsuki=3
		if(src.AkametsukiMastery>50)
			src.verbs+=/mob/Kyomou/verb/Rejuvanate
		if(src.AkametsukiMastery>55)
			src.verbs+=/mob/Kyomou/verb/AkametsukiBlind
		if(src.AkametsukiMastery>100)
			for(var/mob/M in view(src))
				if(M.shari)
					M<<"You Sharingan was disactivated!?"
					M.overlays-='Icons/Jutsus/sharinganthing.dmi';M.overlays-='Icons/Jutsus/SEyes.dmi'
					M.shari=0;M.SharCounter=0;M.CopyMode=0;M.IlluminateOff()
				if(M.bya)
					M<<"You Byakugan was disactivated!?"
					M.overlays-='Icons/Jutsus/BEyes.dmi';M.overlays-='Icons/Jutsus/BEyes.dmi'
					M.bya=0;M.see_invisible=1
				if(M.Akametsuki>=1)
					if(M.AkametsukiMastery*2<src.AkametsukiMastery)
						M<<"A doujutsu like yours has been activated, its power so tremendous it disactivated yours!"
						M.Akametsuki=0;M.see_invisible=1;M.overlays-='Icons/Jutsus/SEyes.dmi'
						M.verbs-=/mob/Kyomou/verb/AkametsukiBlind;M.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
		src<<"You activate Akametsuki!"
		src.overlays-='Icons/Jutsus/SEyes.dmi';src.overlays+='Icons/Jutsus/SEyes.dmi'
		src.see_invisible=99
		while(src.Akametsuki>=1)
			var/A=src.AkametsukiMastery
			if(A<1) A=1
			var/ChakraDrain=(src.Mchakra/(A*15))
			if(ChakraDrain>100)
				ChakraDrain=100
			src.chakra-=ChakraDrain
			if(prob(1))
				src.AkametsukiMastery+=pick(0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1)
			if(src.AkametsukiMastery>=100)
				for(var/mob/M in view(src))
					if(M.shari)
						M<<"You Sharingan was deactivated!?"
						M.overlays-='Icons/Jutsus/sharinganthing.dmi';M.overlays-='Icons/Jutsus/SEyes.dmi'
						M.shari=0;M.SharCounter=0;M.CopyMode=0;M.IlluminateOff()
					if(M.bya)
						M<<"You Byakugan was deactivated!?"
						M.overlays-='Icons/Jutsus/BEyes.dmi';M.overlays-='Icons/Jutsus/BEyes.dmi'
						M.bya=0;M.see_invisible=1
					if(M.Akametsuki>=1)
						if(M.AkametsukiMastery*2<src.AkametsukiMastery)
							M<<"A doujutsu like yours has been activated, its power so tremendous it disactivated yours!"
							M.Akametsuki=0;M.see_invisible=1;M.overlays-='Icons/Jutsus/SEyes.dmi'
							M.verbs-=/mob/Kyomou/verb/AkametsukiBlind;M.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
			sleep(50)


mob/proc/MajesticEyes()
	if(src.Majest)
		src<<"You release your Majestic Eyes.";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.Majest=0;src.ChakraSight(0);
		src.nin=src.Mnin;src.tai=src.Mtai;src.gen=src.Mgen;src.GenjutsuCounterMode=0
		return
	else
		usr.ChangeEyeStyle(usr.EyeStyle,255,215,0)
		if(src.MajesticMastery<1)
			src.Mchakra+=rand(3000,6000);src.chakra=src.Mchakra;src.MajesticMastery=1
			src << "<b><font color=#FFD700>Your eyes pulsate!</font></b>"
		if(src.MajesticMastery<200)
			view()<<"[src]'s eyes turn gold, revealing 1 ring around the pupil!"
		else if(src.MajesticMastery>=200&&src.MajesticMastery>100)
			view()<<"[src]'s eyes turn gold, revealing 2 rings around the pupil!"
		else if(src.MajesticMastery>=300)
			view()<<"[src]'s eyes turn gold, revealing 3 rings around the pupil!"
		if(src.MajesticMastery>=500)
			view()<<"[src]'s eyes turn pure gold, piercing your very soul!"
		src.Majest=1;src.ChakraSight(1)
		src.nin=src.Mnin*1.1
		src.tai=src.Mtai*1.1
		src.gen=src.Mgen*1.1
		while(src.Majest)
			var/A=src.MajesticMastery
			if(A<1) A=1
			if(A>200) src.GenjutsuCounterMode=1
			var/ChakraDrain=(src.Mchakra/(A*15))
			if(ChakraDrain>65) ChakraDrain=65
			if(ChakraDrain<5) ChakraDrain=5
			if(A>=500) ChakraDrain=0
			src.chakra-=ChakraDrain
			if(prob(1))
				src.MajesticMastery +=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
			if(src.Charging&&prob(3))
				src.MajesticMastery +=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
			sleep(25)
