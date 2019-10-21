mob/var/tmp/Guarding = 0
mob/var/tmp/Stun=0
mob/var/tmp/KaitoChance=0
mob/var/tmp/HaveBoStaffEquipped=0
mob/var/tmp/UsingKaitoInvis=0
mob/var/ArcherMastery=0

mob/GainedAfterLogIn/verb
	G()
		set hidden=1
		if(usr.ControllingPuppet1)
			for(var/mob/Puppet/Dragon/A in oview(15,src))
				sleep(1)
				if(A.Owner==usr&&A.AdjustableRoomCollapsation&&A.Carrying==1)
					A.Frozen=1
					view()<<"O Dragão Puppet começa a deixar fora um fusível!"
				//	for(var/mob/C in CaughtInRoom)
				//		spawn()
				//			if(C.client)
				//				C<<"Quick! Get out!"
					sleep(20)
					var/obj/Jutsu/Explosion/K=new();K.loc=A.loc;K.Owner=src.Owner
				//	if(A.ControlType==WhichOne&&A.Owner==src)
					var/obj/Puppet_Summoning_Scrolls/AC=A.PuppetOrigin;
					AC.Summoned=0
					for(var/mob/M in A.loc)//in CaughtInRoom
						spawn()
							if(M.client)
								M.DamageProc(rand(300,500),"Health",src)
					for(var/obj/SkillCards/Puppet_Master_Jutsu/P in usr.LearnedJutsus)
						P.DelayIt(300,usr)
				//	src.Frozen=0
					del(A)
					return
				if(A.Owner==usr&&A.CanBreatheIce==1)
					A.PuppetIceBall("Light")
					return
				else if(A.Owner==usr&&A.CanBreatheIce==2)
					A.PuppetIceBall("Medium")
					return
				else if(A.Owner==usr&&A.CanBreatheIce==3)
					A.PuppetIceBall("Heavy")
					return
		if(usr.InEisou)
			for(var/obj/Jutsu/Elemental/Raiton/EisouHead/A in oview(30))
				if(A.Owner==usr&&A.MainHead)
					A.Execute()
					return
		if(usr.InSemideusChakraArm)
			for(var/obj/Jutsu/SemideusChakraArmTip/A in oview(10))
				if(A.Owner==usr&&A.Grabbed)
					A.Crush()
					return
		for(var/obj/ExpandShuriken/S in oview(15))
			if(S.Owner==usr)
				S.ShootDirection()
		if(usr.Fishing==1)
			if(usr.PressAButton=="X"&&(usr.PressAButton!="Z"))
				usr<<"A macro X foi selecionada"
				usr.PressAButton=""
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
			if(usr.PressAButton=="Z")
				usr<<"A macro Z foi selecionada."
				usr.PressAButton="Z"
		if(usr.GenerativeScrollOn)
			if(usr.PressAButton=="X")
				usr<<"Você ganhou 100 de EXP!"
				usr.exp+=100
				if(usr.Subscriber)
					usr.exp+=pick(20,25,50)
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
			//	for(var/obj/Effects/ZMash/A in usr.client.screen)
			//		del(A)
			//	for(var/obj/Effects/XMash/A in usr.client.screen)
			//		del(A)
				usr.PressAButton=""
				if(usr.GenerativeScrollOn==2)
					if(prob(5))
						usr.KatonKnowledge+=1
				if(usr.GenerativeScrollOn==3)
					if(prob(5))
						usr.FuutonKnowledge+=1
				if(usr.GenerativeScrollOn==4)
					if(prob(5))
						usr.DotonKnowledge+=1
				if(usr.GenerativeScrollOn==5)
					if(prob(5))
						usr.SuitonKnowledge+=1
				if(usr.GenerativeScrollOn==6)
					if(prob(5))
						usr.RaitonKnowledge+=1
			if(usr.PressAButton=="Z")
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"Botão Errado!"
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
		//		for(var/obj/Effects/ZMash/A in usr.client.screen)
	//				del(A)
	//			for(var/obj/Effects/XMash/A in usr.client.screen)
	//				del(A)
				usr.PressAButton=""
				usr.GenerativeScrollOn=0
				usr.Frozen=0
		if(usr.AutoSphere)
			if(usr.sphere)
				usr.FrozenBind="";usr.firing=0
				for(var/obj/Jutsu/Sand/Sphere/Zzz in world)
					if(Zzz.Owner==usr)
						del(Zzz)
				usr.sphere=0;
				usr<<"Você derruba a esfera de areia.";
				usr.usingS=0
				usr.icon_state=""
				usr.Frozen=0
				usr.icon_state=""
				return
			else
				usr.chakra-=150
				usr.SandSphere()
				return
		if(usr.AutoSatetsu)
			if(usr.sphere)
				usr.FrozenBind="";usr.firing=0
				for(var/obj/Jutsu/Sant/SatetsuSphere/Zzz in world)
					if(Zzz.Owner==usr)
						del(Zzz)
				usr.sphere=0;
				usr<<"Você derruba a esfera de ferro.";
				usr.usingS=0
				usr.icon_state=""
				usr.Frozen=0
				usr.icon_state=""
				return
			else
				usr.chakra-=150
				usr.SatetsuSphere()
				return
		if(usr.sphere)
			usr.SatetsuAttack()
		if(usr.Mogu||usr.firing)
			return
		else
			if(usr.Status=="Asleep")
				return
			if(src.target)
				src.dir=get_dir(src,src.target)
			usr.icon_state="Block"
			usr.Guarding=1
//			if(usr.Akametsuki>=1)
//				usr.Particle_Release()
			if(usr.KiriOpen)
				for(var/obj/KiriGate/K in oview(10,src))//was in world
					del(K)
			var/Z=usr.Impenetrable
			usr.Endurance+=usr.Endurance*Z
			if(!usr.Dodging)
				if(usr.FrozenBind!="")
					return
				usr.Dodging=1
				spawn(Z)
					usr.Dodging=0
			if(usr.GenjutsuKai==1)
				usr.gencounter=1
			if(usr.Charging)
				if(usr.RightHandSheath||usr.LeftHandSheath)
					var/obj/WEAPONS/AA=src.WeaponInRightHand
					var/obj/WEAPONS/B=src.WeaponInLeftHand
					if(istype(AA,(/obj/WEAPONS/SageMonkeyBoStaff))||istype(AA,(/obj/WEAPONS/ApexStaff)))
						usr.HaveBoStaffEquipped=1
					if(istype(B,(/obj/WEAPONS/SageMonkeyBoStaff))||istype(AA,(/obj/WEAPONS/ApexStaff))||istype(AA,(/obj/WEAPONS/BoomStaff)))
						usr.HaveBoStaffEquipped=1
					if(istype(AA,(/obj/WEAPONS/BoomStaff)))
						usr.HaveBoStaffEquipped=2
					if(istype(B,(/obj/WEAPONS/BoomStaff)))
						usr.HaveBoStaffEquipped=2
			while(usr.Guarding)
				sleep(2)//Argon pls
				while(usr.Charging)
					sleep(1)
					if(usr.HaveBoStaffEquipped==1)
						sleep(5)
						usr.chakra-=50
						spawn(1) for(var/obj/Jutsu/Elemental/A in oview(2))
							spawn(1) if(A&&A.JutsuLevel>0&&A.Element!="Raiton")
								spawn(1)
									walk(A,0);step_away(A,usr);sleep(1);step_away(A,usr);sleep(1);step_away(A,usr);sleep(1);step_away(A,usr)
									if(A.speeding) walk(A,A.dir)
						for(var/mob/M in oview(2))
							spawn(1)
								if(M!=usr)
									M.Strafe()
									step_away(M,usr);sleep(1);step_away(M,usr);sleep(1);step_away(M,usr);sleep(1);step_away(M,usr);sleep(1);M.Normal();sleep(1)
					else
						sleep(100)


mob/GainedAfterLogIn/verb
	GRelease()
		set hidden=1
		if(usr.Mogu)
			return
		usr.Endurance=usr.MEndurance
		if(usr.BoneMembrane)
			usr.Endurance=100000
		usr.icon_state=""
		usr.Guarding=0
		usr.gencounter=0
		if(usr.Kaiten)
			usr.Kaiten=0
		//if(usr.Akametsuki>=1)
		//	for(var/obj/Kyomou/Particles/ac in usr.JutsuList)
			//	del(ac)
		if(usr.UsingDomuCrush)
			usr.UsingDomuCrush=0
			if(usr.DotonCrushTarget!=null)
				var/mob/P=usr.DotonCrushTarget
				var/Check=0
				for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in range(1,P))
					if(Objects.Owner==usr)
						Objects.icon_state="[Objects.icon_state]A"
						Check=1
				if(Check)
					if(P.InHydro) usr.DotonCrushNumber /= 5
					if(P.BoneMembrane) P.DamageProc(50,"Health",usr,"Earth Crush","brown")
					else P.DamageProc((usr.DotonCrushNumber-P.Endurance),"Health",usr)
					for(var/turf/T in range(1,P))
						var/a=rand(3,5)
						while(a>0)
							spawn()P.Bloody()
							a--
				sleep(11)
				if(!P.knockedout)
					P.sight &= ~BLIND
				usr.DotonCrushTarget=null
				usr.DotonCrushNumber=0
				for(var/obj/Jutsu/Elemental/Doton/DorouDomu/O in range(1,P))
					if(O.Owner==usr)
						del(O)

			else
				for(var/obj/Jutsu/Elemental/Doton/DorouDomu/Objects in range(10,usr))
					spawn()
						if(Objects.Owner==usr)
							Objects.icon_state="[Objects.icon_state]A"
							sleep(11)
							del(Objects)
			usr<<"Você parar de usar Iwakazushi e libertar a Terra."
			for(var/obj/SkillCards/DorouDomuCrush/AC in usr.LearnedJutsus)
				AC.DelayIt(1200,usr,"Nin")
			usr.DotonCrushTarget=null
		if(usr.TimeToAttack==7)
			src.TimeToAttack=8
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			sd_Alert(usr, "Você esta sendo Vijiado!","[src]",,,,0,"400x150",,style)
			for(var/obj/Effects/XMash/AAC in src.client.screen)
				del(AAC)
		for(var/obj/Jutsu/Elemental/Raiton/Raikyuu/R in orange(20,usr))
			if(R.Owner==usr)
				del(R)
mob/var/tmp
	RightHandDelay=0
	LeftHandDelay=0
	KickDelay=0
	AttackDelay = 0
	Deflection=0
	Combos=0
	HasArrow=0
	LeftHandSheath=0
	RightHandSheath=0
	ChargingAttack="None"
	RHP=0
	LHP=0
mob/GainedAfterLogIn/verb
	LSheath()
		set hidden=1
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.LeftHandSheath)
			usr<<"Você coloca seu armamente em sua mão Esquerda."
			usr.LeftHandSheath=0
		else
			usr<<"Você tirou seu armamento de sua mão Esquerda!"
			usr.LeftHandSheath=1
			//viewers(4)<<sound('SFX/Unsheath.wav',0,volume=35)
			usr.SoundEngine('SFX/Unsheath.wav',5)//Might be causing lag amg
			if(usr.TimeToAttack==13)
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
				sd_Alert(usr, "Você não esta mais usando armamento!","[src]",,,,0,"400x150",,style)
				usr.TimeToAttack=14

mob/GainedAfterLogIn/verb
	RSheath()
		set hidden=1
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.RightHandSheath)
			usr<<"Você coloca seu armamente em sua mão Direita."
			usr.RightHandSheath=0
		else
			usr<<"Você tirou seu armamento de sua mão Direita!"
	//		viewers(4)<<sound('SFX/Unsheath.wav',0,volume=35)
			usr.SoundEngine('SFX/Unsheath.wav',5)//Might be causing lag amg
			usr.RightHandSheath=1
			if(usr.TimeToAttack==13)
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
				sd_Alert(usr, "Você não esta mais usando armamento!","[src]",,,,0,"400x150",,style)
				usr.TimeToAttack=14
mob/GainedAfterLogIn/verb
	A2Down()
		set hidden=1
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.knockedout||src.LHP>0) return
		usr.ChargingAttack="Left"
		if(usr.target)
			var/mob/M=usr.target
			if(M.shari&&M.SharinganMastery>500||M.bya&&M.ByakuganMastery>500)
				M<<"Você percebe os músculos de [usr] seu braço esquerdo esta tenso!"

		if(usr.GateIn=="Initial")
			usr.LHP+=5;
		if(usr.Trait!="Powerful"&&usr.RaiArmor!=2)
			if(usr.GateIn!="View")
				while(usr.LHP<25&&usr.ChargingAttack=="Left")
					if(usr.runningspeed>0)
						if(usr.key=="Lui12"||usr.key=="Ruusaku")
							usr<<"Você carrega isso [LHP]."
						usr.LHP+=pick(0,0.5)
						if(usr.TaijutsuStyle=="Quick Fist")
							usr.LHP++
						sleep(1)
					else
						usr.LHP++
						if(usr.TaijutsuStyle=="Quick Fist")
							usr.LHP++
						sleep(1)
			else
				while(usr.ChargingAttack=="Left")
					usr.LHP+=pick(2,3)
					sleep(1)
		else
			if(usr.GateIn!="View")
				while(usr.LHP<30&&usr.ChargingAttack=="Left")
					if(usr.key=="Lui12"||usr.key=="Ruusaku")
						usr<<"Você carrega isso para [LHP]."
					if(usr.runningspeed>0)
						usr.LHP++
					else
						usr.LHP+=pick(2,3)
					sleep(1)
			else
				while(usr.ChargingAttack=="Left")
					usr.LHP+=pick(2,3)
					sleep(1)
mob/GainedAfterLogIn/verb
	ADown()
		set hidden=1
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.knockedout||src.RHP>0) return
		usr.ChargingAttack="Right"
		if(usr.target)
			var/mob/M=usr.target
			if(M.shari&&M.SharinganMastery>500||M.bya&&M.ByakuganMastery>600)
				M<<"Você percebe os músculos de [usr]seu braço direito esta tenso!"

		if(usr.GateIn=="Initial")
			usr.RHP+=5
		if(usr.Trait!="Powerful"&&usr.RaiArmor!=2)
			if(usr.GateIn!="View")
				while(usr.RHP<25&&usr.ChargingAttack=="Right")
					if(usr.runningspeed>0)
						usr.RHP+=pick(0,0.5)
						if(usr.TaijutsuStyle=="Quick Fist")
							usr.RHP++
						sleep(1)
					else
						usr.RHP++
						if(usr.TaijutsuStyle=="Quick Fist")
							usr.RHP++
						sleep(1)
			else
				while(usr.ChargingAttack=="Right")
					usr.RHP+=pick(2,3)
					sleep(1)
		else
			if(usr.GateIn!="View")
				while(usr.RHP<30&&usr.ChargingAttack=="Right")
					if(usr.runningspeed>0)
						usr.RHP++
					else
						if(!usr.DoingPalms)
							usr.RHP+=pick(2,3)
						else
							usr.RHP++
					sleep(1)
			else
				while(usr.ChargingAttack=="Right")
					if(!usr.DoingPalms)
						usr.RHP+=pick(2,3)
					else
						usr.RHP++
					sleep(1)
mob/GainedAfterLogIn/verb//LeftHand
	A2()
		set hidden=1
		if(src.ControllingPuppet2==1)
	//		world<<"[src] controlling a puppet detected in A2 verb."
			src.AttackVerb2()
			return
		var/obj/WEAPONS/LALA = usr.WeaponInLeftHand
		var/obj/WEAPONS/LELE = usr.WeaponInRightHand
		src.ChargingAttack=""
		src.invisibility=1
		if(istype(LALA,(/obj/WEAPONS/InvisibleKaito))&&usr.LeftHandSheath==1)//&&usr.LHP>=13
		//	if(usr.invisibility==99)
		//		usr.invisibility=0
			usr.invisibility=99
			spawn()
				while(usr.invisibility==99)
					usr.ChakraDrain(1000)
					sleep(15)
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.knockedout) return
		if(usr.Guarding&&usr.ChargedChakraForPunch>0)
			usr.HitTheGround()
		if(istype(LALA,/obj/WEAPONS/BoomStaff)||istype(LELE,/obj/WEAPONS/BoomStaff))
			if(usr.Guarding)
				usr.BoomStickExp()
				return
		if(usr.LHP>0)
			var/Powa=usr.LHP;usr.LHP=0
			usr.AttackVerb2(Powa)
mob/GainedAfterLogIn/verb//RightHand
	A()
		set hidden=1
		var/obj/WEAPONS/LOLO = usr.WeaponInRightHand
		var/obj/WEAPONS/LULU = usr.WeaponInLeftHand
		src.ChargingAttack=""
		src.invisibility=1
		if(istype(LOLO,(/obj/WEAPONS/InvisibleKaito))&&usr.RightHandSheath==1)
			if(usr.invisibility==99)
				usr.invisibility=0
			usr.invisibility=99
			spawn()
				while(usr.invisibility==99)
					usr.ChakraDrain(1000)
					sleep(15)
		if((istype(LOLO,/obj/WEAPONS/Bow))&&usr.RightHandSheath&&(src.UsingBow!=1)&&(!src.AttackDelay))
			src.RHP=0
			src.ArrowLaunching()
			return
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.knockedout) return
		if(istype(LOLO,/obj/WEAPONS/BoomStaff)||istype(LULU,/obj/WEAPONS/BoomStaff))
			if(usr.Guarding)
				usr.BoomStickExp()
				return
		if(usr.Guarding&&usr.ChargedChakraForPunch>0)
			usr.HitTheGround()
		if(usr.RHP>0)
			var/Powa=usr.RHP;usr.RHP=0
			usr.AttackVerb(Powa)
mob/GainedAfterLogIn/verb//Kick
	Kick()
		set hidden=1
		if(src.KBunshinOn)
			usr=src.controlled
		else
			usr=src
		if(usr.knockedout) return
		usr.AttackVerb3()
		if(usr.Guarding&&usr.ChargedChakraForKick>0)
			usr.HitTheGroundKick()
mob/var/tmp/CreationDelayLeft=0
mob/var/tmp/CreationDelayRight=0
mob/proc/AttackVerb2(var/Power)
	set background=1
	for(var/mob/Puppet/Talon/A in oview(12,src))
		if(A.Owner==usr&&A.CanThrowKunais==1)//Light Kunai Attachment
			if(A.KunaiDelay)
				return
			A.KunaiDelay=1
			A.KunaiThrowing("Slow")
			spawn(30)
				A.KunaiDelay=0
			return
		if(A.Owner==usr&&A.CanThrowKunais==2)//Medium Kunai Attachment
			if(A.KunaiDelay)
				return
			A.KunaiDelay=1
			A.KunaiThrowing("Medium")
			spawn(25)
				A.KunaiDelay=0
			return
		if(A.Owner==usr&&A.CanThrowKunais==3)//Medium Kunai Attachment
			if(A.KunaiDelay)
				return
			A.KunaiDelay=1
			A.KunaiThrowing("Fast")
			spawn(20)
				A.KunaiDelay=0
			return
		else if(A.Owner==usr&&A.CanThrowRapidKunais==1)
			if(A.RapidKunaiDelay)
				return
			A.RapidKunaiDelay=1
			A.KunaiThrowing()
			spawn(200)
				A.RapidKunaiDelay=0
			return
		else if(A.Owner==usr&&A.CanThrowRapidKunais==2)
			if(A.RapidKunaiDelay)
				return
			A.RapidKunaiDelay=1
			A.KunaiThrowing()
			spawn(300)
				A.RapidKunaiDelay=0
			return
		else if(A.Owner==usr&&A.CanThrowRapidKunais==3)
			if(A.RapidKunaiDelay)
				return
			A.RapidKunaiDelay=1
			A.KunaiThrowing()
			spawn(350)
				A.RapidKunaiDelay=0
			return
	if(src.Status=="Asleep")
		return
	if(src.Mogu||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.LeftHandDelay)
		return
	if(!src.Kumosenkyuu)
		src.AttackDelay=1
		spawn(10-src.TaijutsuMastery)
			src.AttackDelay=0
	if(src.FrozenBind!="")
		if(src.FrozenBind!="Spider Web"&&src.FrozenBind!="Syrup") return
	if(src.KagDance=="Tessenka")
		src.LeftHandDelay=1
		spawn(40)
			src.LeftHandDelay=0
		if(prob(5))
			src.DanceMastery+=pick(0.1,0.2)
		src.Frozen=1//;src.TessenkaOut=1
		spawn(20) src.Frozen=0
		var/obj/Jutsu/Kaguya/TessenkaW2/B=new();B.Head=1;B.MaxLength=round(Power/2);B.Owner=src;B.loc=locate(src.x,src.y,src.z);B.dir=src.dir;walk(B,B.dir)
		return
	if(src.Tsutakei&&src.GrassMastery>75)
		src.LeftHandDelay=1
		spawn(40)
			src.LeftHandDelay=0
		var/obj/Jutsu/Elemental/Mokuton/KusakinW2/B=new();
		B.Owner=src;
		B.loc=locate(src.x,src.y,src.z);
		B.dir=src.dir;
		walk(B,B.dir)
		return
	if(src.target)
		if(src.GateIn=="Wound"||src.GateIn=="Limit"||src.GateIn=="View"||src.Venatu)
			if(src.stamina>=src.maxstamina*0.1&&src.health>=src.maxhealth*0.25)
				flick("zan",src);var/mob/M=src.target
				if(M.z==src.z)
					var/Z=rand(1,4)
					if(Z==1)
						src.loc=locate(M.x,M.y-1,M.z)
					if(Z==2)
						src.loc=locate(M.x,M.y+1,M.z)
					if(Z==3)
						src.loc=locate(M.x-1,M.y,M.z)
					if(Z==4)
						src.loc=locate(M.x+1,M.y,M.z)
		src.dir=get_dir(src,src.target)
	var/ZZ=rand(1,3)
	if(ZZ==1) viewers()<<sound('SFX/AttackSwish1.wav',0,volume=35)
	if(ZZ==2) viewers()<<sound('SFX/AttackSwish2.wav',0,volume=35)
	if(ZZ==3) viewers()<<sound('SFX/AttackSwish3.wav',0,volume=35)
	if(src.client)
		spawn() src.Voice("Attack")
	if(src.LeftHandSheath)
		if(src.WeaponInLeftHand!="")
//Iwazuka Stuff Start
			if(src.WeaponInLeftHand=="Space Time Hand"||src.WeaponInLeftHand=="Space Time Leg")
				if(src.WeaponInLeftHand=="Space Time Hand")
					src.SpaceTimeHand()
					return
				if(src.WeaponInLeftHand=="Space Time Leg")
					src.SpaceTimeLeg()
					return
			if(src.WeaponInLeftHand=="Wall"||src.WeaponInLeftHand=="Mine"||src.WeaponInLeftHand=="Spear"||src.WeaponInLeftHand=="ClayKunai"||src.WeaponInLeftHand=="ClaySenbon"||src.WeaponInLeftHand=="Flower"||src.WeaponInLeftHand=="Bird"||src.WeaponInLeftHand=="Spider"||src.WeaponInLeftHand=="Grasshopper")
				if(src.CreationDelayLeft)
					return
				var/HaveClay=0
				for(var/obj/RandomEquipment/Argila/AS)
					HaveClay=1;
					AS.Ammount-=1
					spawn()
						AS.ReCheckAmount()
				if(!HaveClay)
					usr<<"Você ficou sem argila!";return
				src.CreationDelayLeft=1
				if(src.CSet=="C1")
					spawn(5)
						src.CreationDelayLeft=0
				if(src.CSet=="C2")
					spawn(27)
						src.CreationDelayLeft=0
				if(src.CSet=="C4")
					spawn(70)
						src.CreationDelayLeft=0
				src.icon_state="Block";
				src.Frozen=1
				if(src.WeaponInLeftHand=="Wall")
					if(src.CSet=="C1")
						sleep(1)
					if(src.CSet=="C2")
						sleep(8)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new();var/mob/Kibaku/Wall/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=get_step(src,src.dir);S.loc=get_step(src,src.dir)
					if(src.CSet=="C1")
						src.chakra-=100
					if(src.CSet=="C2")
						src.chakra-=550;A.icon='Icons/Jutsus/IwazukaTechniques1.dmi'
					if(src.CSet=="C4")
						src.chakra-=4000;A.icon='Icons/Jutsus/IwazukaTechniques1.dmi'
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="Flower")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100
					if(src.CSet=="C2")
						src.chakra-=550
					if(src.CSet=="C4")
						src.chakra-=4000
					var/mob/Kibaku/Flower/A=new();A.Owner=src;A.CSet=src.CSet;A.icon_state="Flower2";A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="Bird")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/Bird/A=new();
						A.Owner=src;
						A.CSet=src.CSet;
						A.layer=src.layer;
						A.loc=src.loc;
						S.loc=A.loc;
						A.density=1;
						walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/Bird/A=new();A.Owner=src;A.CSet=src.CSet;A.icon_state="Bird2";A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;src.Guiding=A
					//	if(src.target)
					//		var/mob/AX=src.target;walk(A,AX.loc)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="Mine")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/Mine/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=0;
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/Mine/A=new();A.Owner=src;A.CSet=src.CSet;A.icon_state="Mine2";A.layer=src.layer;A.loc=src.loc;
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="Spear")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/Spear/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/Spear/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="Grasshopper")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/GrassHopper/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=0;//walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/GrassHopper/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=0;//walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="ClayKunai")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/ClayKunai/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/ClayKunai/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="ClaySenbon")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/ClaySenbon/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=500;var/mob/Kibaku/ClaySenbon/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInLeftHand=="Spider")
					if(src.CSet=="C1")
						var/counter=0
						for(var/mob/Kibaku/C1Spider/S in world)
							if(S.Owner==src)
								counter++
						if(counter>=21)
							src<<"Você teve bastante aranhas C1 Fora. Exploda isso";return
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					if(src.CSet=="C1")
						src.chakra-=100;var/obj/SmokeCloud/S=new()
						var/n=rand(4,7)
						while(n>0)
							var/mob/Kibaku/C1Spider/A=new();A.layer=src.layer;A.Owner=src;A.CSet=src.CSet;A.pixel_x=rand(-16,16);A.pixel_y=rand(-16,16);A.loc=src.loc;S.loc=A.loc;n--
						for(var/mob/Kibaku/C1Spider/B in view(3,src))
							spawn()
								var/steps=rand(1,5)
								while(steps>0)
									step(B,src.dir)
									steps--
							src.Frozen=0
							return
					if(src.CSet=="C2")
						sleep(15);src.chakra-=550
					if(src.CSet=="C4")
						sleep(50);src.chakra-=4000
					var/obj/SmokeCloud/S=new();var/mob/Kibaku/Spider/A=new();A.layer=src.layer
					A.Owner=src;A.CSet=src.CSet;A.icon_state="Spider2";src.Guiding=A;src.chakra-=150
					A.loc=src.loc;S.loc=A.loc;src.Frozen=0;src.icon_state="";return
//Iwazuka Stuff End

/*
			if(src.WeaponInLeftHand=="Sand Sword")
				var/Damage=10
				var/Delay=6
				flick("weaponslash",src)
				src.LeftHandDelay=1
				src.Deflection=1;spawn(2+src.DeflectionZ)
					src.Deflection=0
				spawn(Delay-src.SpeedDice)
					src.LeftHandDelay=0
					if(prob(2))
						if(src.SpeedDice<5)
							src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
				for(var/mob/M in get_step(src,src.dir))
					if(M.Mogu)
						return
					src.DodgeCalculation(M,"Kenjutsu")
					if(M.Dodging)
						M.Dodge();return
					if(M.Yotsuki&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*3)&&M.RightHandSheath||M.Deflection||M.WeaponMaster>6&&M.LeftHandSheath||M.WeaponMaster>6&&M.RightHandSheath)
						M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
						spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
						if(prob(1))
							M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
						return
					else
						var/Type="Chakra"
						src.SliceHit(M,Damage,Type,Power)
						if(prob(src.DoubleStrike*3))
							src.SliceHit(M,Damage,Type,Power)
						if(prob(M.DeflectionZ*10))
							M.Deflection=1;spawn(2+src.DeflectionZ)
								M.Deflection=0*/

//			var/TargetArea=get_step(src,src.dir))
//			if(src.SageMode=="Toad")
//				TargetArea=oview(2,src)
			if(src.WeaponInLeftHand=="DotonSpear")
				var/Damage=(src.EarthChakra/10)+1
				var/Delay=15
				flick("weaponslash",src)
				src.LeftHandDelay=1
				src.Deflection=1;spawn(2+src.DeflectionZ)
					src.Deflection=0
				spawn(Delay-src.SpeedDice)
					src.LeftHandDelay=0
					if(src.Clan!="Yotsuki")
						if(prob(2))
							if(src.SpeedDice<5)
								var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
								src.overlays+=I
								spawn(15)
									src.overlays-=I
								src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
				for(var/mob/M in get_step(src,src.dir))
					if(M.Mogu)
						return
					src.DodgeCalculation(M,"Kenjutsu")
					if(M.Dodging)
						M.Dodge();return
					if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*3)&&M.RightHandSheath||M.Deflection||M.WeaponMaster>6&&M.LeftHandSheath||M.WeaponMaster>6&&M.RightHandSheath)
						M<<output("Suas armas desviam um dos outro!","Attack");src<<output("Suas armas desviam um do outro!","Attack");viewers()<<sound('SFX/SwordClash.wav',0,volume=40);M.Deflection=0;src.Deflection=0
						spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
						if(prob(1))
							M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
						return
					else
						var/Type="Normal"
						src.SliceHit(M,Damage,Type,Power)
						if(prob(src.DoubleStrike*3))
							src.SliceHit(M,Damage,Type,Power)
						if(prob(M.DeflectionZ*15))
							M.Deflection=1;spawn(2+src.DeflectionZ)
								M.Deflection=0
				for(var/mob/M in get_step(src,src.dir))
					if(M.Mogu)
						return
					src.DodgeCalculation(M,"Kenjutsu")
					if(M.Dodging)
						M.Dodge();return
					if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*3)&&M.RightHandSheath||M.Deflection||M.WeaponMaster>6&&M.LeftHandSheath||M.WeaponMaster>6&&M.RightHandSheath)
						M<<output("armas desviam um dos outro!","Attack");src<<output("armas desviam um dos outro!","Attack");viewers()<<sound('SFX/SwordClash.wav',0,volume=40);M.Deflection=0;src.Deflection=0
						spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
						if(prob(1))
							M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
						return
					else
						var/Type="Normal"
						src.SliceHit(M,Damage,Type,Power)
						if(prob(src.DoubleStrike*3))
							src.SliceHit(M,Damage,Type,Power)
						if(prob(M.DeflectionZ*10))
							M.Deflection=1;spawn(2+src.DeflectionZ)
								M.Deflection=0
			else
				var/obj/WEAPONS/A=src.WeaponInLeftHand
				src.LeftHandDelay=1
				if(A.WhatDoesItDo=="Throw")
					if(istype(A,(/obj/WEAPONS/Kunai)))
						src.KunaiThrowing()
						if(prob(3)) src.KunaiMastery+=pick(0.1,0.2)
						spawn(10-src.Swift) //was 8
							src.LeftHandDelay=0
						if(A.ammount<=0)
							src.WeaponInLeftHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/MarkedKunai)))
						src.MarkedKunaiThrowing()
						if(prob(3)) src.KunaiMastery+=pick(0.1,0.2)
						spawn(10-src.Swift) //was 8
							src.LeftHandDelay=0
						if(A.ammount<=0)
							src.WeaponInLeftHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/Senbon)))
						src.SenbonThrowing("Left")
						if(prob(5))
							src.SenbonMastery+=pick(0.1,0.2)
						spawn(10-src.Swift)
							src.LeftHandDelay=0
						if(A.ammount<=0)
							src.WeaponInRightHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/Shuriken)))
						src.ShurikenThrow("Left",Power)
						if(prob(3))
							src.ShurikenMastery+=pick(0.1,0.2)
						spawn(10-src.Swift)
							src.LeftHandDelay=0
						if(A.ammount<=0)
							src.WeaponInLeftHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/WindmillShuriken)))
						src.WShurikenThrow()
						if(prob(5))
							src.ShurikenMastery+=pick(0.5,1)
						spawn(25-src.Swift)
							src.LeftHandDelay=0
						if(A.ammount<=0)
							src.WeaponInLeftHand=""
							del(A)
						return
				var/Damage=A.PercentDamage
				var/Delay=A.WeaponDelay
				var/Handed=A.HandedWeapon
				if(istype(A,/obj/WEAPONS/SamehadeNew))
					Delay+=10
				if(istype(A,/obj/WEAPONS/OriginalSamehade))
					Delay+=5
				if(istype(A,/obj/WEAPONS/DarkBlade))
					if(Power>=6&&Power<11)
						src.BlackSmallShot()
					else if(Power>11)
						src.BlackBladeSpread()

				if(istype(A,/obj/WEAPONS/LightBlade))
					if(Power>=6)
						src.LightSmallShot()
				if(istype(A,/obj/WEAPONS/Evanesence))
					if(Power>=12)
						src.YellowChakra()
				if(A.WhatDoesItDo=="Slash")
					var/SizeRating=A.SizeRating
					flick("weaponslash",src)
					src.LeftHandDelay=1
					src.Deflection=1;spawn(2+src.DeflectionZ)
						src.Deflection=0
					if(Handed=="Two")
						src.RightHandDelay=1
						spawn(Delay-src.SpeedDice)
							src.RightHandDelay=0
					spawn(Delay-src.SpeedDice)
						src.LeftHandDelay=0
						if(src.Clan!="Yotsuki")
							if(prob(2))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5

						if(prob(25))
							if(src.Buffet<10&&src.Clan=="Yotsuki")
								src.Buffet+=0.01;if(src.Buffet>10) src.Buffet=10


					if(isobj(A,/obj/WEAPONS/Kunai))
						if(prob(5))
							src.KunaiMastery+=pick(0.1,0.2)
					if(isobj(A,/obj/WEAPONS/MarkedKunai))
						if(prob(10))
							src.KunaiMastery+=pick(0.1,0.2)
					if(istype(A,/obj/WEAPONS/Shibuki)||istype(A,/obj/WEAPONS/BoomStaff))
						if(Power>=15)
							src.ShibukiExplode(Power)	//Explosion only occurs after a 20 charge.
							return								//In addition, if it explodes, it doesn't do the rest.
					if(istype(A,/obj/WEAPONS/SamehadeNew))
						for(var/mob/M in oview(src.SamehadeAbsorbtion))
							var/loal=rand(50,135)
				//			if(!M.client)
				//				return
							if(M.name=="Kikaichu"&&!M.client)
								loal=rand(10,20)
								del(M)
							if(M.Clone&&!M.client)
								var/obj/SmokeCloud/S=new()
								S.loc = locate(M.x,M.y,M.z)
								M.loc=null
							//	spawn(100)
								del(M)
							if(!M.client)
								return
							if(M.knockedout)
								src<<"Você é incapaz de roubar Chakra, enquanto eles estão nocauteado!"
								return
							M.chakra-=loal
							if(src.chakra<src.Mchakra*1.5)
								src.chakra+=loal

							if(M.Kaiten)
								M<<"O chakra para a rotação foi drenada?"
								M.Kaiten=0
					if(istype(A,/obj/WEAPONS/OriginalSamehade))
						for(var/mob/M in oview(6))
							var/loal=rand(150,230)
							if(M.name=="Kikaichu"&&!M.client)
								loal=rand(10,20)
								del(M)
							M.chakra-=loal
							if(src.chakra<src.Mchakra*1.5)
								src.chakra+=loal
							if(M.Clone&&!M.client)
								var/obj/SmokeCloud/S=new()
								S.loc = locate(M.x,M.y,M.z)
								M.loc=null
								spawn(100)
									del(M)
							if(M.Kaiten)
								M<<"O chakra para a rotação foi drenada?"
								M.Kaiten=0
								M<<"A Lâmina desativa sua rotação, e drenou seu chakra?!"
								M.chakra-=500
					for(var/obj/Jutsu/Sand/Sphere/AAAC in get_step(src,src.dir))
						for(var/mob/ZZZ in world)
							if(AAAC.Owner==ZZZ)
								if(prob(1))
									ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
								if(ZZZ.AutoProtection>=20)
									ZZZ.SandAttack()
						src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
					for(var/mob/Sand/SunaNoTate/AAAC in get_step(src,src.dir))
						for(var/mob/ZZZ in world)
							if(AAAC.Owner==ZZZ)
								if(prob(1))
									ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
						src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
	//				for(var/mob/M in get_step(src,src.dir))
	//					if(DisarmingSlash==1)
	//						if(rand(1,10)==1)
	//							M.WeaponInLeftHand="";
	//							M.WeaponInRightHand="";
	//							M.LeftHandSheath=0
	//							M.RightHandSheath=0
					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M,"Kenjutsu")
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							if(src.KagDance=="Yanagi")
								src.Yanagi(M);src.Yanagi(M)
								if(prob(src.DoubleStrike*10))
									src.Yanagi(M);src.Yanagi(M)
								return
							//if(src.KagDance=="Tsubaki")
								// Shouldnt need this here since it only equips to the Right Hand.
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							if(istype(A,(/obj/WEAPONS/SamehadeNew)))
								src.SamehadeNew(M,Power)
								if(prob(src.DoubleStrike*3))
									src.SamehadeNew(M,Power)
								if(prob(M.DeflectionZ*10))
									M.Deflection=1;spawn(2+src.DeflectionZ)
										M.Deflection=0
								return
							else if(istype(A,(/obj/WEAPONS/OriginalSamehade)))
								src.OriginalSamehade(M,Power)
								if(prob(src.DoubleStrike*3))
									src.OriginalSamehade(M,Power)
								if(prob(M.DeflectionZ*12))
									M.Deflection=1;spawn(2+src.DeflectionZ)
										M.Deflection=0
							else if(istype(A,(/obj/WEAPONS/MeleeKunai)))
								src.KunaiHit(M)
								if(prob(src.DoubleStrike*3))
									src.KunaiHit(M)
								if(prob(M.DeflectionZ*10))
									M.Deflection=1;spawn(5+src.DeflectionZ)
										M.Deflection=0
							else
								src.SliceHit(M,Damage,Type,Power,SizeRating,A.ReflexDecreaser,A.StunChance,A.CriticalChance)
								if(prob(src.DoubleStrike*3)&&SizeRating==1)
									src.SliceHit(M,Damage,Type,Power,SizeRating,A.ReflexDecreaser,A.StunChance,A.CriticalChance)
								if(prob(M.DeflectionZ*10))
									M.Deflection=1;spawn(2+src.DeflectionZ)
										M.Deflection=0
					return
				if(A.WhatDoesItDo=="Claws")
					flick("Attack2",src)
					src.LeftHandDelay=1
					spawn(Delay-src.Swift)
						src.LeftHandDelay=0
						if(prob(2))
							if(src.Swift<6)
								src.Swift+=0.01
								var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
								src.overlays+=I
								spawn(15)
									src.overlays-=I
								if(src.Swift>6) src.Swift=6
					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M)
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							src.ClawsHit(M,Damage,Type,Power)
							if(prob(src.DoubleStrike*3))
								src.ClawsHit(M,Damage,Type,Power)
					return
				if(A.WhatDoesItDo=="Staff")
					flick("weaponslash",src)
					src.LeftHandDelay=1
					spawn(Delay-src.SpeedDice)
						src.LeftHandDelay=0
						if(src.Clan!="Yotsuki")
							if(prob(2))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5

					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M)
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							if(istype(A,/obj/WEAPONS/Shibuki)||istype(A,/obj/WEAPONS/BoomStaff))
								if(Power>=15)
									src.ShibukiExplode(Power)	//Explosion only occurs after a 20 charge.
									return
							src.StaveHit(M,Damage,Type,Power,A.PercentDamage)
							if(prob(src.DoubleStrike*3))
								src.StaveHit(M,Damage,Type,Power,A.PercentDamage)
					return
				if(A.WhatDoesItDo=="NunChuk")
					flick("weaponslash",src)
					src.LeftHandDelay=1
					spawn(Delay-src.SpeedDice)
						src.LeftHandDelay=0
						if(src.Clan!="Yotsuki")
							if(prob(2))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M)
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							src.NunchukHit(M,Damage,Type,Power)
							src.NunchukHit(M,Damage,Type,Power)
							if(prob(src.DoubleStrike*3))
								src.NunchukHit(M,Damage,Type,Power)
								src.NunchukHit(M,Damage,Type,Power)
					return
	if(src.TaijutsuStyle=="Jyuken")
		if(prob(5))
			src.StanceMastery+=(rand(1,5)*0.01);if(src.StanceMastery>75) src.StanceMastery=75
	src.LeftHandDelay=1
	spawn()
		if(src.TimeToAttack==1)
			src.TimeToAttack=2
			var/style = "<style>BODY {margin:0;font:arial;background:black;\
				color:white;}</style>"
			sd_Alert(usr, "Você impressionantemente socou o ar!","[src]",,,,0,"400x150",,style)
			for(var/obj/Effects/ASMash/AAC in src.client.screen)
				del(AAC)
	src.Combos+=1;spawn(5)
		src.Combos-=1;if(src.Combos<0)
			src.Combos=0
			if(src.Combos>=3)
				if(prob(5))
					if(src.Swift>=6)
						if(src.DoubleStrike<10)
							src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10
	if(src.Kumosenkyuu)
		if(src.HasArrow)
			src<<"Você tem uma flecha já feita! atire logo!";src.LeftHandDelay=0;return
		spawn(40-src.Swift)
			src.LeftHandDelay=0
		src<<"Você começa a desenvolver ouro pegajoso dentro de sua boca.";sleep(4);src.icon_state="Jutsu"
		src.overlays-='Icons/Jutsus/SpiderTechniques.dmi';src.overlays+='Icons/Jutsus/SpiderTechniques.dmi';sleep(6);src.overlays-='Icons/Jutsus/SpiderTechniques.dmi';src.HasArrow=1;return
	if(src.ZankuuhaOn)
		flick("Attack2",src)
		spawn(8-src.Swift)
			src.LeftHandDelay=0
		var/obj/Jutsu/Zankuuha/A=new();A.loc=src.loc;A.Owner=src;A.name="[src]";A.dir=src.dir;walk(A,src.dir)
		return
/////////////////////////////////////
	else
		if(src.GateIn!=""||src.Banpaia||src.TaijutsuStyle=="Quick Fist")
			spawn(9-src.Swift) //was 6...wat
				src.LeftHandDelay=0
		else
			spawn(9-src.Swift)
				src.LeftHandDelay=0
		if(src.TaijutsuStyle=="Jyuken"||src.scalpel)
			spawn()
				flick("jyuken",src)
			for(var/obj/Jutsu/Spider/web/A in oview(1))
				del(A)
		else
			spawn()
				flick("Attack2",src)
		if(src.Kumosenkyuu)
			var/ChakraLoss=rand(55,150);ChakraLoss-=src.GenSkill
			spawn(40-src.Swift)
				src.AttackDelay=0
			spawn(1) for(var/obj/Jutsu/Spider/bow/B in view(1,src))
				if(usr==B.Owner)
					flick("WarbowAttack",B)
			spawn(1) for(var/obj/Jutsu/Spider/bowU/B2 in world)
				if(usr==B2.Owner)
					flick("WarbowAttack",B2)
			var/obj/Jutsu/Spider/arrow/K=new();K.loc = locate(src.x,src.y,src.z);K.dir = src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir);src.chakra-=ChakraLoss;return
		if(src.KagDance=="Karamatsu")
			spawn()
				flick("Attack",src);src.dir=NORTH;flick("Attack",src);sleep(1);src.dir=EAST;flick("Attack",src);sleep(1);src.dir=SOUTH;flick("Attack",src);sleep(1);src.dir=WEST;flick("Attack",src)
			for(var/mob/M in oview(src,1))
				if(M.KagDance=="Karamatsu")
					viewers(M)<<"[src] ossos se chocam com [M] ossos e nenhum dano é causado!"
				else
					spawn() src.Kara(M)
			return
		else
			if(src.Rasenganon)//12/20/12
				src.RasenganD*=0.90
				if(RasenganD<=0)
					RasenganD=0
			if(prob(2))//was prob(2)
				if(src.Swift<6)
					src.Swift+=0.01
					var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
					src.overlays+=I
					spawn(15)
						src.overlays-=I
					if(src.Swift>6) src.Swift=6
			if(!src.Chidorion&&!src.Rasenganon&&!src.Raikirion&&usr.ChargedChakraForPunch==0)
				for(var/obj/Jutsu/Sand/Sphere/A in get_step(src,src.dir))
					for(var/mob/ZZZ in world)
						if(A.Owner==ZZZ)
							if(prob(1))
								ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
						if(ZZZ.AutoProtection>=20)
							ZZZ.SandAttack()
					src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
				for(var/mob/Sand/SunaNoTate/A in get_step(src,src.dir))
					for(var/mob/ZZZ in world)
						if(A.Owner==ZZZ)
							if(prob(1))
								ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
					src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			for(var/mob/M in get_step(src,src.dir))
				if(M.Mogu)
					return
				src.DodgeCalculation(M)
				if(M.Dodging)
					M.Dodge();return
				else if(M.RaiArmor==2&&prob(M.reflexNew*20))
					var/list/Turfs=list()
					for(var/turf/T in oview(1,src))
						if(!T.density&&get_dist(src,T)!=0)
							Turfs.Add(T)
					M.loc=pick(Turfs)
					M.dir=get_dir(M,src)
					var/obj/Jutsu/Elemental/Raiton/R=new()
					R.icon_state="Touei";R.loc=src;R.layer=6
					spawn(5)
						del(R)
					flick("zan",M)
					return
				if(src.DoingPalms==1)
					src.HakkeRokujonyonshou(M,Power)
					return
				M.attacker="[src]";M.attacked=1
				if(M.Clan=="Hyuuga")
					if(src.dir==NORTH&&M.dir!=NORTH&&M.dir!=NORTHEAST&&M.dir!=NORTHWEST)
						if(prob(M.Rejection*4))
							if(prob(50)) flick("Attack1",M)
							else flick("Attack2",M)
							step(src,src.dir);src<<"Você foi empurrado para trás!";return
					if(src.dir==SOUTH&&M.dir!=SOUTH&&M.dir!=SOUTHEAST&&M.dir!=SOUTHWEST)
						if(prob(M.Rejection*4))
							if(prob(50)) flick("Attack1",M)
							else flick("Attack2",M)
							step(src,src.dir);src<<"Você foi empurrado para trás!";return
					if(src.dir==EAST&&M.dir!=EAST&&M.dir!=SOUTHEAST&&M.dir!=NORTHWEST)
						if(prob(M.Rejection*4))
							if(prob(50)) flick("Attack1",M)
							else flick("Attack2",M)
							step(src,src.dir);src<<"Você foi empurrado para trás!";return
					if(src.dir==WEST&&M.dir!=WEST&&M.dir!=SOUTHWEST&&M.dir!=NORTHWEST)
						if(prob(M.Rejection*4))
							if(prob(50)) flick("Attack1",M)
							else flick("Attack2",M)
							step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(M.KagDance=="Karamatsu")
					src<<output("Você tenta atacar [M] mas seus ossos faz você parar de atacar, ferindo-o de volta!","Attack");M<<output("Você bloquea o ataque de [src] ferindo-o!","Attack");src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z);return
				if(M.DotonArmor)
					src<<output("Você tenta atacar [M] mas as rochas ao redor de seu corpo  param seu ataque!","Attack");M<<output("Você bloquea o ataque de [src] graças às rochas ao redor de seu corpo.","Attack");return
				if(M.Guarding&&M.AutoProtection>0||M.Guarding&&M.Rejection>=5&&M.ByakuganMastery>1500)
					if(M.AutoProtection==0&&M.chakra>0)
						viewers()<<sound('SFX/JyukenClash.wav',0,volume=45)
						M.dir=get_dir(M,src)
						var/a=pick("Attack1","Attack2")
						flick(a,M)
						spawn() AttackEfx3(M.x,M.y,M.z,M.dir)
						src.chakra-=rand(5,15)
						return
					else if(prob(M.AutoProtection*5))
						var/speedcheck=round(src.tai/3);speedcheck+=rand(1,speedcheck)
						if(M.chakra>speedcheck/2)
							M<<output("A areia bloqueia seu Ataque!","Attack");src<<output("A areia te Protegeu!","Attack");M.overlays -= 'Icons/Jutsus/Sshushin.dmi';M.overlays += 'Icons/Jutsus/Sshushin.dmi';sleep(9);M.overlays -= 'Icons/Jutsus/Sshushin.dmi';M.chakra-=round(speedcheck/2);return

				else

					if(src.Rasenganon&&(src.DRasenganCounter==1))
						if(src.DRasenganCounter==1)
							src.DRasenganCounter-=1
						src.RasenganA(M)
						return
					if(src.scalpel)
						spawn()
							src.ChakraMesu(M)
						if(prob(src.DoubleStrike*10))
							spawn()
								src.ChakraMesu(M)
						return
					else
						spawn()
							src.Attacking(M,Power,src.TaijutsuStyle)
						if(prob(src.DoubleStrike*10))
							spawn()
								src.Attacking(M,Power,src.TaijutsuStyle)
							return
		for(var/obj/A in get_step(src,src.dir))
			if(istype(A,(/obj/Totem)))
				var/obj/Totem/M=A
				oview(8)<<"[src] bate no Totem!"
				if(M.Effect==0&&M.CoolDown==0)
					oview(8)<<"O Totem começa a brilhar Misteriosamente..."
					sleep(10)
					M.Effect=rand(1,10)
					M.CoolDown=150
				else
					src<<"Já existe um efeito que ocorre em lugar!"
			if(A.icon=='Map/Turfs/log.dmi')
				flick("Hit",A);src<<"You hit the log!"
				src.stamina-=rand(10,35);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
				if(src.z==39)
					src.stamina-=rand(10,35);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
					if(prob(8))
						if(usr.TaijutsuKnowledge<2000)
							usr.TaijutsuKnowledge+=1
			//		if(prob(2))
			//			if(src.maxstamina<10000)
			//				src.maxstamina++
					src.exp+=rand(15,30)*src.Combos
					if(src.Subscriber)
						src.exp+=rand(5,10)*src.Combos
				else

					if(istype(A,(/obj/DojoLog)))
						if(prob(5)&&src.Rush<20)
							src.Rush+=0.01
							if(src.Rush>20) src.Rush=20
						if(prob(3)&&src.Swift<6)
							src.Swift+=0.01
							var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
							src.overlays+=I
							spawn(15)
								src.overlays-=I
							if(src.Swift>6) src.Swift=6
					if(prob(1))
						if(src.Rush<20)
							src.Rush+=0.01;if(src.Rush>20) src.Rush=20
					if(src.TypeLearning=="Taijutsu")
						src.exp+=rand(1,10)*src.Combos
						if(src.Subscriber)
							src.exp+=rand(1,5)*src.Combos
						if(src.Combos>=3)
							if(prob(10))
								if(usr.TaijutsuKnowledge<1000)
									usr.TaijutsuKnowledge+=1
								if(src.Swift>=6)
									if(src.DoubleStrike<10)
										src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10

				return
			if((A.icon=='Map/Turfs/Tree.dmi'||A.icon=='Map/Turfs/NewTree3.dmi')&&A.icon_state=="tree10")
				src<<"You hit the tree!"
				src.stamina-=rand(25,50);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
				if(prob(0.1))
					if(src.Rush<20)
						src.Rush+=0.01;if(src.Rush>20) src.Rush=20
				if(prob(9))
					if(usr.TaijutsuKnowledge<1000)
						usr.TaijutsuKnowledge+=1
				if(src.TypeLearning=="Taijutsu")
					src.exp+=rand(1,15)*src.Combos
				return
mob/proc/AttackVerb(var/Power)
	set background = 1
//	if(src.TessenkaOut)
//		for(var/obj/TessenkaW2/B in range(15,src))
//			if(B.Head)
//				B.Head=0;B.density=0;walk(B,0);B.dir=turn(B.dir,180);B.Move_Delay=1;walk(B,B.dir)
//	return
//	world<<"[Power]."
	if(usr.Status=="Asleep")
		return
	if(src.Mogu||src.Guarding||src.doingG||src.resting||src.firing&&!src.Mogu||src.AttackDelay||src.meditating||src.RightHandDelay)
		return
	if(src.FrozenBind!="")
		if(src.FrozenBind!="Spider Web"&&src.FrozenBind!="Syrup")
			return
	if(!src.Kumosenkyuu) src.AttackDelay=1;spawn(10-src.TaijutsuMastery){src.AttackDelay=0}
	if(src.KagDance=="Tessenka")
		src.RightHandDelay=1
		spawn(40)
			src.RightHandDelay=0
		if(prob(5))
			src.DanceMastery+=pick(0.1,0.2)
		src.Frozen=1//;src.TessenkaOut=1
		spawn(20) src.Frozen=0
		var/obj/Jutsu/Kaguya/TessenkaW2/B=new();B.Head=1;B.MaxLength=round(Power/2);B.Owner=src;B.loc=locate(src.x,src.y,src.z);B.dir=src.dir;walk(B,B.dir)
		return
	if(src.Tsutakei)
		src.RightHandDelay=1
		spawn(40)
			src.RightHandDelay=0
		var/obj/Jutsu/Elemental/Mokuton/KusakinW2/B=new();B.Owner=src;B.loc=locate(src.x,src.y,src.z);B.dir=src.dir;walk(B,B.dir)
		return
	if(src.target&&!src.UsingBow)
		if(src.GateIn=="Wound"||src.GateIn=="Limit"||src.GateIn=="View"||src.Venatu)
			flick("zan",src);var/mob/M=src.target
			if(M.z==src.z)
				var/Z=rand(1,4)
				if(Z==1)
					src.loc=locate(M.x,M.y-1,M.z)
				if(Z==2)
					src.loc=locate(M.x,M.y+1,M.z)
				if(Z==3)
					src.loc=locate(M.x-1,M.y,M.z)
				if(Z==4)
					src.loc=locate(M.x+1,M.y,M.z)
		src.dir=get_dir(src,src.target)
	var/ZZ=rand(1,3)
	if(ZZ==1) viewers()<<sound('SFX/AttackSwish1.wav',0,volume=35)
	if(ZZ==2) viewers()<<sound('SFX/AttackSwish2.wav',0,volume=35)
	if(ZZ==3) viewers()<<sound('SFX/AttackSwish3.wav',0,volume=35)
	if(src.client)
		spawn() src.Voice("Attack")
	if(src.RightHandSheath)
		if(src.WeaponInRightHand!="")
			if(src.WeaponInRightHand=="Space Time Hand"||src.WeaponInRightHand=="Space Time Leg")
				if(src.WeaponInRightHand=="Space Time Hand")
					src.SpaceTimeHand()
					return
				if(src.WeaponInRightHand=="Space Time Leg")
					src.SpaceTimeLeg()
					return
			if(src.KagDance=="Tsubaki")
				src.RightHandDelay=1
				spawn(7-src.SpeedDice)
					src.RightHandDelay=0
				spawn() src.TsubakiSlash(turn(src.dir,45))
				spawn() src.TsubakiSlash(src.dir,0.036,0.045,src.reflexNew*10)//was spawn(1)
				spawn() src.TsubakiSlash(turn(src.dir,-45))//was spawn(2)
				return
//Iwazuka Stuff Start
			if(src.WeaponInRightHand=="Wall"||src.WeaponInRightHand=="Mine"||src.WeaponInRightHand=="Spear"||src.WeaponInRightHand=="ClayKunai"||src.WeaponInRightHand=="ClaySenbon"||src.WeaponInRightHand=="Flower"||src.WeaponInRightHand=="Bird"||src.WeaponInRightHand=="Spider"||src.WeaponInRightHand=="Grasshopper")
				if(src.CreationDelayRight)
					return
				var/HaveClay=0
				for(var/obj/RandomEquipment/Argila/AS)
					HaveClay=1;AS.Ammount-=1
					spawn()
						AS.ReCheckAmount()
				if(!HaveClay)
					usr<<"Você ficou sem argila!";return
				src.CreationDelayRight=1
				if(src.CSet=="C1")
					spawn(5)
						src.CreationDelayRight=0
				if(src.CSet=="C2")
					spawn(30)
						src.CreationDelayRight=0
				if(src.CSet=="C4")
					spawn(70)
						src.CreationDelayRight=0
				src.icon_state="Block";src.Frozen=1
				if(src.WeaponInRightHand=="Wall")
					if(src.CSet=="C1")
						sleep(1)
					if(src.CSet=="C2")
						sleep(8)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new();var/mob/Kibaku/Wall/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=get_step(src,src.dir);S.loc=get_step(src,src.dir)
					if(src.CSet=="C1")
						src.chakra-=100
					if(src.CSet=="C2")
						src.chakra-=550;A.icon='Icons/Jutsus/IwazukaTechniques1.dmi'
					if(src.CSet=="C4")
						src.chakra-=4000;A.icon='Icons/Jutsus/IwazukaTechniques1.dmi'
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="Flower")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100
					if(src.CSet=="C2")
						src.chakra-=550
					if(src.CSet=="C4")
						src.chakra-=4000
					var/mob/Kibaku/Flower/A=new();A.Owner=src;A.CSet=src.CSet;A.icon_state="Flower2";A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="Bird")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/Bird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/Bird/A=new();A.Owner=src;A.CSet=src.CSet;A.icon_state="Bird2";A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;src.Guiding=A
				//		if(src.target)
				//			var/mob/AX=src.target;walk(A,AX.loc)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="Grasshopper")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/GrassHopper/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=0;//walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/GrassHopper/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;A.density=0;//walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="Mine")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/Mine/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=0;
					if(src.CSet=="C2")
						src.chakra-=550;var/mob/Kibaku/Mine/A=new();A.Owner=src;A.CSet=src.CSet;A.icon_state="Mine2";A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="Spear")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/Spear/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=400;var/mob/Kibaku/Spear/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="ClayKunai")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/ClayKunai/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=400;var/mob/Kibaku/ClayKunai/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="ClaySenbon")
					if(src.CSet=="C1")
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					var/obj/SmokeCloud/S=new()
					if(src.CSet=="C1")
						src.chakra-=100;var/mob/Kibaku/ClaySenbon/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C2")
						src.chakra-=400;var/mob/Kibaku/ClaySenbon/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc;A.density=1;walk(A,src.dir)
					if(src.CSet=="C4")
						src.chakra-=4000;var/mob/Kibaku/LargeBird/A=new();A.Owner=src;A.CSet=src.CSet;A.layer=src.layer;A.loc=src.loc;S.loc=A.loc
					src.Frozen=0;src.icon_state="";return
				if(src.WeaponInRightHand=="Spider")
					if(src.CSet=="C1")
						var/counter=0
						for(var/mob/Kibaku/C1Spider/S in world)
							if(S.Owner==src)
								counter++
						if(counter>=21)
							src<<"Você tem bastante aranhas C1 fora. Exploda-as";return
						sleep(5)
					if(src.CSet=="C2")
						sleep(30)
					if(src.CSet=="C4")
						sleep(70)
					if(src.CSet=="C1")
						src.chakra-=100;var/obj/SmokeCloud/S=new()
						var/n=rand(4,7)
						while(n>0)
							var/mob/Kibaku/C1Spider/A=new();A.layer=src.layer;A.Owner=src;A.CSet=src.CSet;A.pixel_x=rand(-16,16);A.pixel_y=rand(-16,16);A.loc=src.loc;S.loc=A.loc;n--
						for(var/mob/Kibaku/C1Spider/B in view(3,src))
							spawn()
								var/steps=rand(1,5)
								while(steps>0)
									step(B,src.dir)
									steps--
							src.Frozen=0
							return
					if(src.CSet=="C2")
						sleep(30);src.chakra-=450
					if(src.CSet=="C4")
						sleep(50);src.chakra-=4000
					var/obj/SmokeCloud/S=new();var/mob/Kibaku/Spider/A=new();A.layer=src.layer
					A.Owner=src;A.CSet=src.CSet;A.icon_state="Spider2";src.Guiding=A;src.chakra-=150
					A.loc=src.loc;S.loc=A.loc;src.Frozen=0;src.icon_state="";return
//Iwazuka Stuff End
			else
				var/obj/WEAPONS/A=src.WeaponInRightHand
				src.RightHandDelay=1
				if(src.Rasenganon)//12/20/12
					src.RasenganD*=0.95
					if(src.RasenganD<=0)
						RasenganD=0
				if(A.WhatDoesItDo=="Throw")
					if(istype(A,(/obj/WEAPONS/Bow)))
						if(src.UsingBow)
							src.AttackDelay=1
							if(prob(3))
								src.ArcherMastery+=pick(0.05,0.1,0.15,0.2)
							spawn(60-src.Swift)
								src.RightHandDelay=0;src.LeftHandDelay=0;src.AttackDelay=0
							src.ArrowLaunch(Power)
						return
					if(istype(A,(/obj/WEAPONS/Kunai)))
						src.KunaiThrowing()
						if(prob(5))
							src.KunaiMastery+=pick(0.1,0.2)
						spawn(9-src.Swift)
							src.RightHandDelay=0
						if(A.ammount<=0)
							src.WeaponInRightHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/MarkedKunai)))
						src.MarkedKunaiThrowing()
						if(prob(5))
							src.KunaiMastery+=pick(0.1,0.2)
						spawn(9-src.Swift)
							src.RightHandDelay=0
						if(A.ammount<=0)
							src.WeaponInRightHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/Senbon)))
						src.SenbonThrowing("Right")
						if(prob(5))
							src.SenbonMastery+=pick(0.1,0.2)
						spawn(9-src.Swift)
							src.RightHandDelay=0
						if(A.ammount<=0)
							src.WeaponInRightHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/Shuriken)))
						src.ShurikenThrow("Right",Power)
						if(prob(5))
							src.ShurikenMastery+=pick(0.1,0.2)
						spawn(9-src.Swift)
							src.RightHandDelay=0
						if(A.ammount<=0)
							src.WeaponInRightHand=""
							del(A)
						return
					if(istype(A,(/obj/WEAPONS/WindmillShuriken)))
						src.WShurikenThrow()
						if(prob(5))
							src.ShurikenMastery+=pick(0.5,1)
						spawn(25-src.Swift)
							src.RightHandDelay=0
						//if(A.ammount<=0)
						//	src.WeaponInRightHand=""
						//	del(A)
						return
				var/Damage=A.PercentDamage
				var/Delay=A.WeaponDelay
				var/Handed=A.HandedWeapon
				//Hoshigaki samehade delay 1.3
				if(istype(A,/obj/WEAPONS/SamehadeNew))
					Delay+= 0
				if(istype(A,/obj/WEAPONS/DarkBlade))
					if(Power>=6&&Power<11)
						src.BlackSmallShot()
					else if(Power>=11)
						src.BlackBladeSpread()
				//if(istype(A,/obj/WEAPONS/LightBlade))
				//	if(Power>=25)
				//		src.LightSmallShot()
				if(istype(A,/obj/WEAPONS/Evanesence))
					if(Power>=6)//Was 25
						src.YellowChakra()
				if(A.WhatDoesItDo=="Slash")
					var/SizeRating=A.SizeRating
					flick("weaponslash",src)
					src.RightHandDelay=1
					if(src.KagDance=="Tsubaki")
						src.Deflection=1;spawn(8)
							src.Deflection=0
					else
						src.Deflection=1;spawn(2+src.DeflectionZ)
							src.Deflection=0
					if(Handed=="Two")
						src.LeftHandDelay=1
						spawn(Delay-src.SpeedDice)
							src.LeftHandDelay=0
					spawn(Delay-src.SpeedDice)
						src.RightHandDelay=0
						if(src.Clan!="Yotsuki")
							if(prob(2))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5

						if(prob(25))
							if(src.Buffet<10&&src.Clan=="Yotsuki")
								src.Buffet+=0.01;if(src.Buffet>10) src.Buffet=10
					if(isobj(A,/obj/WEAPONS/Kunai))
						if(prob(5))
							src.KunaiMastery+=pick(0.1,0.2)
					if(istype(A,/obj/WEAPONS/Shibuki)||istype(A,/obj/WEAPONS/BoomStaff))
						if(Power>=15)
							src.ShibukiExplode(Power)	//Explosion only occurs after a 20 charge.
							return								//In addition, if it explodes, it doesn't do the rest.
					if(istype(A,/obj/WEAPONS/SamehadeNew))
						for(var/mob/M in oview(src.SamehadeAbsorbtion))
							var/loal=rand(50,135)
							if(M.name=="Kikaichu"&&!M.client)
								loal=rand(10,20)
								M.loc=null
								spawn(100)
									del(M)
							if(M.Clone&&!M.client)
								var/obj/SmokeCloud/S=new()
								S.loc = locate(M.x,M.y,M.z)
								M.loc=null
							//	spawn(100)
								del(M)
							if(!M.client)
								return
							if(M.knockedout)
								src<<"Você é incapaz de roubar Chakra, enquanto eles estão nocauteado!"
								return
							M.chakra-=loal
							if(src.chakra<src.Mchakra*1.5)
								src.chakra+=loal

							if(M.Kaiten)
								M<<"O chakra para a rotação foi drenada?"
								M.Kaiten=0
					if(istype(A,/obj/WEAPONS/OriginalSamehade))
						for(var/mob/M in oview(6))
							var/loal=rand(150.230)
							if(M.name=="Kikaichu"&&!M.client)
								loal=rand(10,20)
								M.loc=null
								spawn(100)
									del(M)
							M.chakra-=loal
							if(src.chakra<src.Mchakra*1.5)
								src.chakra+=loal
							if(M.Clone&&!M.client)
								var/obj/SmokeCloud/S=new()
								S.loc = locate(M.x,M.y,M.z)
								M.loc=null
								spawn(100)
									del(M)
							if(M.Kaiten)
								M<<"O chakra para a rotação foi drenada?"
								M.Kaiten=0
								M<<"Sua rotação foi drenada pelo seu chakra! Junto com você!"
								M.chakra-=500
					for(var/obj/Jutsu/Sand/Sphere/AAAC in get_step(src,src.dir))
						for(var/mob/ZZZ in world)
							if(AAAC.Owner==ZZZ)
								if(prob(1))
									ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
							if(ZZZ.AutoProtection>=20)
								ZZZ.SandAttack()
						src<<output("The attack was canceled!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
					for(var/mob/Sand/SunaNoTate/AAAC in get_step(src,src.dir))
						for(var/mob/ZZZ in world)
							if(AAAC.Owner==ZZZ)
								if(prob(1))
									ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
						src<<output("The attack was canceled!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M,"Kenjutsu")
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							if(src.KagDance=="Yanagi")
								src.Yanagi(M);src.Yanagi(M)
								if(prob(src.DoubleStrike*10))
									src.Yanagi(M);src.Yanagi(M)
								return
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							if(istype(A,(/obj/WEAPONS/SamehadeNew)))
								src.SamehadeNew(M,Power)
								if(prob(src.DoubleStrike*3))
									src.SamehadeNew(M,Power)
								if(prob(src.DeflectionZ*10))
									src.Deflection=1;spawn(src+src.DeflectionZ)
										src.Deflection=0
								return
							if(istype(A,(/obj/WEAPONS/OriginalSamehade)))
								src.OriginalSamehade(M,Power)
								if(prob(src.DoubleStrike*3))
									src.OriginalSamehade(M,Power)
								if(prob(src.DeflectionZ*12))
									src.Deflection=1;spawn(src+src.DeflectionZ)
										src.Deflection=0
							if(istype(A,(/obj/WEAPONS/Evanesence)))
								src.SliceHit(M,Damage*1.5,Type,Power*3,SizeRating,A.ReflexDecreaser,A.StunChance,A.CriticalChance)
								if(prob(src.DoubleStrike*3))
									src.SliceHit(M,Damage*1.5,Type,Power*3,SizeRating,A.ReflexDecreaser,A.StunChance,A.CriticalChance)
									M.chakra-=pick(50,100)
								if(prob(src.DeflectionZ*12))
									src.Deflection=1;spawn(src+src.DeflectionZ)
										src.Deflection=0

							else
								src.SliceHit(M,Damage,Type,Power,SizeRating,A.ReflexDecreaser,A.StunChance,A.CriticalChance)
								if(prob(src.DoubleStrike*3)&&SizeRating==1)
									src.SliceHit(M,Damage,Type,Power,SizeRating,A.ReflexDecreaser,A.StunChance,A.CriticalChance)
								if(prob(src.DeflectionZ*10))
									src.Deflection=1;spawn(2+src.DeflectionZ)
										src.Deflection=0
					return
				if(A.WhatDoesItDo=="Claws")
					flick("Attack1",src)
					src.RightHandDelay=1
					spawn(Delay-src.Swift)
						src.RightHandDelay=0
						if(prob(2))
							if(src.Swift<6)
								var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
								src.overlays+=I
								spawn(15)
									src.overlays-=I
								src.Swift+=0.01;if(src.Swift>6) src.Swift=6
					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M)
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							src.ClawsHit(M,Damage,Type,Power)
							if(prob(src.DoubleStrike*3))
								src.ClawsHit(M,Damage,Type,Power)
					return
				if(A.WhatDoesItDo=="Staff")
					flick("weaponslash",src)
					src.RightHandDelay=1
					spawn(Delay-src.SpeedDice)
						src.RightHandDelay=0
						if(src.Clan!="Yotsuki")
							if(prob(2))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01
									if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5


					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M)
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							if(istype(A,/obj/WEAPONS/Shibuki)||istype(A,/obj/WEAPONS/BoomStaff))
								if(Power>=15)
									src.ShibukiExplode(Power)	//Explosion only occurs after a 20 charge.
									return
							src.StaveHit(M,Damage,Type,Power,A.PercentDamage)
							if(prob(src.DoubleStrike*3))
								src.StaveHit(M,Damage,Type,Power,A.PercentDamage)
					return
				if(A.WhatDoesItDo=="NunChuk")
					flick("weaponslash",src)
					src.RightHandDelay=1
					spawn(Delay-src.SpeedDice)
						src.RightHandDelay=0
						if(src.Clan!="Yotsuki")
							if(prob(2))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5
						else
							if(prob(5))
								if(src.SpeedDice<5)
									var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
									src.overlays+=I
									spawn(15)
										src.overlays-=I
									src.SpeedDice+=0.01;if(src.SpeedDice>5) src.SpeedDice=5


					for(var/mob/M in get_step(src,src.dir))
						if(M.Mogu)
							return
						src.DodgeCalculation(M)
						if(M.Dodging || M.InHydro)
							M.Dodge();return
						else if(M.RaiArmor==2&&prob(M.reflexNew*20))
							var/list/Turfs=list()
							for(var/turf/T in oview(1,src))
								if(!T.density&&get_dist(src,T)!=0)
									Turfs.Add(T)
							M.loc=pick(Turfs)
							M.dir=get_dir(M,src)
							var/obj/Jutsu/Elemental/Raiton/R=new()
							R.icon_state="Touei";R.loc=src;R.layer=6
							spawn(5)
								del(R)
							flick("zan",M)
							return
						else
							var/Type="Normal"
							if(A.ChakraDeplters)
								Type="Chakra"
							src.NunchukHit(M,Damage,Type,Power)
							src.NunchukHit(M,Damage,Type,Power)
							if(prob(src.DoubleStrike*3))
								src.NunchukHit(M,Damage,Type,Power)
								src.NunchukHit(M,Damage,Type,Power)
					return
	if(src.Kumosenkyuu)
		if(!src.HasArrow)
			src<<"You need to make an arrow to fire one!"
			src.RightHandDelay=0
			return
	if(src.ZankuuhaOn&&src.ZankuuSphere==0)
		flick("Attack1",src)
		spawn(8-src.Swift)
			src.RightHandDelay=0
		var/obj/Jutsu/Zankuuha/A=new();A.loc=src.loc;A.Owner=src;A.name="[src]";A.dir=src.dir;walk(A,src.dir)
		return
	if(src.TaijutsuStyle=="Jyuken")
		if(prob(5))
			src.StanceMastery+=pick(0.01,0.5);if(src.StanceMastery>75) src.StanceMastery=75
	src.RightHandDelay=1
	if(src.TimeToAttack==1)
		src.TimeToAttack=2
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
			color:white;}</style>"
		sd_Alert(usr, "Você impressionantemente socou o ar!","[src]",,,,0,"400x150",,style)
		for(var/obj/Effects/ASMash/AAC in src.client.screen)
			del(AAC)
	src.Combos+=1;spawn(5)
		src.Combos-=1;if(src.Combos<0)
			src.Combos=0
			if(src.Combos>=3)
				if(prob(5))
					if(src.Swift>=6)
						if(src.DoubleStrike<10)
							src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10

	if(src.GateIn!=""||src.Banpaia||src.TaijutsuStyle=="Quick Fist")
		spawn(8-src.Swift)
			src.RightHandDelay=0
	else
		spawn(9-src.Swift)
			src.RightHandDelay=0
	if(src.TaijutsuStyle=="Jyuken"||src.scalpel)
		spawn()
			flick("jyuken",src)
		for(var/obj/Jutsu/Spider/web/A in oview(1))
			del(A)
	else
		spawn()
			flick("Attack1",src)
	if(src.Kumosenkyuu)
		var/ChakraLoss=rand(55,150);ChakraLoss-=src.GenSkill
		src.HasArrow=0
		spawn(40-src.Swift)
			src.AttackDelay=0
		spawn(1) for(var/obj/Jutsu/Spider/bow/B in view(1,src))
			if(usr==B.Owner)
				flick("WarbowAttack",B)
		spawn(1) for(var/obj/Jutsu/Spider/bowU/B2 in world)
			if(usr==B2.Owner)
				flick("WarbowAttack",B2)
		var/obj/Jutsu/Spider/arrow/K=new();K.loc = locate(src.x,src.y,src.z);K.dir = src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir);src.chakra-=ChakraLoss;return
	if(src.KagDance=="Karamatsu")
		spawn()
			flick("Attack",src);src.dir=NORTH;flick("Attack",src);sleep(1);src.dir=EAST;flick("Attack",src);sleep(1);src.dir=SOUTH;flick("Attack",src);sleep(1);src.dir=WEST;flick("Attack",src)
		for(var/mob/M in oview(src,1))
			if(M.KagDance=="Karamatsu")
				viewers(M)<<"[src] ossos se chocam com  [M] ossos e nenhum dano é causado!"
			else
				spawn() src.Kara(M)
		return
	else
		if(prob(2))
			if(src.Swift<6)
				var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
				src.overlays+=I
				spawn(15)
					src.overlays-=I
				src.Swift+=0.01;if(src.Swift>6) src.Swift=6
		if(!src.Chidorion&&!src.Rasenganon&&!src.Raikirion&&usr.ChargedChakraForPunch==0&&src.ZankuuSphere==0)
			for(var/obj/Jutsu/Sand/Sphere/A in get_step(src,src.dir))
				for(var/mob/ZZZ in world)
					if(A.Owner==ZZ)
						if(prob(1))
							ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
					if(ZZZ.AutoProtection>=20)
						ZZZ.SandAttack()
				src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			for(var/mob/Sand/SunaNoTate/A in get_step(src,src.dir))
				for(var/mob/ZZZ in world)
					if(A.Owner==ZZZ)
						if(prob(1))
							ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
				src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
		for(var/mob/M in get_step(src,src.dir))
			if(M.Mogu)
				return
			if(src.DoingPalms==1)
				src.HakkeRokujonyonshou(M,Power)
				return
			M.attacker="[src]";M.attacked=1
			if(M.Clan=="Hyuuga")
				if(src.dir==NORTH&&M.dir!=NORTH&&M.dir!=NORTHEAST&&M.dir!=NORTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(src.dir==SOUTH&&M.dir!=SOUTH&&M.dir!=SOUTHEAST&&M.dir!=SOUTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(src.dir==EAST&&M.dir!=EAST&&M.dir!=SOUTHEAST&&M.dir!=NORTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(src.dir==WEST&&M.dir!=WEST&&M.dir!=SOUTHWEST&&M.dir!=NORTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
			src.DodgeCalculation(M)
			if(M.Dodging)
				if(src.ZankuuSphere)
					src.ZankuuSphere=0;src<<"você errou!"
				if(src.Chidorion||src.Raikirion)
					src.overlays-='Icons/Jutsus/Chidori.dmi';src.ChidoriD=0;src.Chidorion=0;src.Raikirion=0;src.Normal()
				M.Dodge();return
			if(M.KagDance=="Karamatsu")
				src<<output("Você tenta golpear [M] mas seus ossos faz você parar de atacar, ferindo-o de volta!","Attack");M<<output("você bloqueia o ataque de [src] ferindo-o!","Attack");src.DamageProc(src.maxhealth*0.03,"Health",M);M.Bloody();return
			if(M.DotonArmor)
				src<<output("Você tenta golpear [M] mas as rochas ao redor de seu corpo empede o ataque!","Attack");M<<output("Você bloquea o ataque de  [src] , graças às rochas ao redor de seu corpo.","Attack");return
			if(M.Guarding&&M.AutoProtection>0||M.Guarding&&M.Rejection>=5&&M.ByakuganMastery>1500)
				if(M.AutoProtection==0)
					viewers()<<sound('SFX/JyukenClash.wav',0,volume=35)
					M.dir=get_dir(M,src)
					var/a=pick("Attack1","Attack2")
					flick(a,M)
					spawn() AttackEfx3(M.x,M.y,M.z,M.dir)
					src.chakra-=rand(5,15)
					return
				else if(prob(M.AutoProtection*5))
					var/speedcheck=round(src.tai/3);speedcheck+=rand(1,speedcheck)
					if(M.chakra>speedcheck/2)
						M<<output("A areia bloquiou o ataque!","Attack");src<<output("A areia protegeu você do ataque!","Attack");M.overlays -= 'Icons/Jutsus/Sshushin.dmi';M.overlays += 'Icons/Jutsus/Sshushin.dmi';sleep(9);M.overlays -= 'Icons/Jutsus/Sshushin.dmi';M.chakra-=round(speedcheck/2);return

			else
				if(src.Chidorion||src.Raikirion)
					src.ChidoriA(M);return
				if(src.ZankuuSphere>=1)
					src.ZankuuSphere(M);return
				if(src.Rasenganon&&(src.DRasenganCounter==2||src.DRasenganCounter==0))
					if(src.DRasenganCounter==2)
						src.DRasenganCounter-=1
					src.RasenganA(M);return
				if(src.scalpel)
					spawn()
						src.ChakraMesu(M)
					if(prob(src.DoubleStrike*10))
						spawn()
							src.ChakraMesu(M)
					return
				else
					spawn()
						src.Attacking(M,Power,src.TaijutsuStyle)
					if(prob(src.DoubleStrike*10))
						spawn()
							src.Attacking(M,Power,src.TaijutsuStyle)
						return
		for(var/obj/A in get_step(src,src.dir))
			if(istype(A,(/obj/Totem)))
				var/obj/Totem/M=A
				oview(8)<<"[src] Socou o totem!"
				if(M.Effect==0&&M.CoolDown==0)
					oview(8)<<"O Totem começa a brilhar Misteriosamente..."
					sleep(10)
					M.Effect=rand(1,10)
					M.CoolDown=150
				else
					src<<"Já existe um efeito que ocorre em lugar!"
			if(A.icon=='Map/Turfs/log.dmi')
				flick("Hit",A);src<<"Você atingiu o log!"
				if(src.z==39)
					src.stamina-=rand(10,35);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
					if(prob(9))
						if(usr.TaijutsuKnowledge<2000)
							usr.TaijutsuKnowledge+=1
				//	if(prob(2))
				//		if(src.maxstamina<10000)
				//			src.maxstamina++
					src.exp+=rand(15,30)*src.Combos
					if(src.Subscriber)
						src.exp+=rand(10,20)*src.Combos
				else
					src.stamina-=rand(10,35);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
					if(prob(9))
						if(usr.TaijutsuKnowledge<1000)
							usr.TaijutsuKnowledge+=1
					if(prob(25))
						if(src.Rush<20)
							src.Rush+=0.01;if(src.Rush>20) src.Rush=20
					if(src.TypeLearning=="Taijutsu")
						src.exp+=rand(15,30)*src.Combos
						if(src.Subscriber)
							src.exp+=rand(5,7)*src.Combos
					if(src.Combos>=3)
						if(prob(5))
							if(src.Swift>=6)
								if(src.DoubleStrike<10)
									src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10

				return
			if((A.icon=='Map/Turfs/Tree.dmi'||A.icon=='Map/Turfs/NewTree3.dmi')&&A.icon_state=="tree10")
				src<<"You hit the tree!"
				src.stamina-=rand(25,50);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
				if(prob(8))
					if(usr.TaijutsuKnowledge<1000)
						usr.TaijutsuKnowledge+=1
				if(prob(25))
					if(src.Rush<20)
						src.Rush+=0.01;if(src.Rush>20) src.Rush=20
				if(src.TypeLearning=="Taijutsu")
					src.exp+=rand(15,30)*src.Combos
					if(src.Subscriber)
						src.exp+=rand(5,7)*src.Combos
				if(src.Combos>=3)
					if(prob(5))
						if(src.Swift>=6)
							if(src.DoubleStrike<10)
								src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10

				return
mob/proc/AttackVerb3()
	set background=1
	if(usr.Status=="Asleep")
		return
	if(src.Guarding||src.resting||src.firing||src.AttackDelay||src.meditating||src.KickDelay)
		return
	if(src.FrozenBind!="")
		if(src.FrozenBind!="Spider Web"&&src.FrozenBind!="Syrup")
			return
	if(src.target)
		if(src.GateIn=="Wound"||src.GateIn=="Limit"||src.GateIn=="View"||src.Venatu)
			flick("zan",src);var/mob/M=src.target
			if(M.z==src.z)
				var/Z=rand(1,4)
				if(Z==1)
					src.loc=locate(M.x,M.y-1,M.z)
				if(Z==2)
					src.loc=locate(M.x,M.y+1,M.z)
				if(Z==3)
					src.loc=locate(M.x-1,M.y,M.z)
				if(Z==4)
					src.loc=locate(M.x+1,M.y,M.z)
		src.dir=get_dir(src,src.target)
	var/ZZ=rand(1,3)
	if(ZZ==1)
		viewers()<<sound('SFX/AttackSwish1.wav',0,volume=35)
	if(ZZ==2)
		viewers()<<sound('SFX/AttackSwish2.wav',0,volume=35)
	if(ZZ==3)
		viewers()<<sound('SFX/AttackSwish3.wav',0,volume=35)
	if(src.client)
		spawn() src.Voice("Attack")
	src.KickDelay=1
	if(src.TimeToAttack==3)
		src.TimeToAttack=4
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
			color:white;}</style>"
		sd_Alert(src, "Você chutou o ar com sucesso! Wooho?","[src]",,,,0,"400x150",,style)
		for(var/obj/Effects/DMash/AAC in src.client.screen)
			del(AAC)
	src.Combos+=1;spawn(5)
		src.Combos-=1;if(src.Combos<0)
			src.Combos=0
			if(src.Combos>=3)
				if(prob(5))
					if(src.Swift>=6)
						if(src.DoubleStrike<10)
							src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10

	if(src.GateIn!=""||src.Banpaia||src.TaijutsuStyle=="Quick Fist")
		spawn(9-src.Swift)
			src.KickDelay=0
	else
		spawn(15-src.Swift)
			src.KickDelay=0
	if(src.Clan=="Kumojin")
		spawn()
			flick("Attack1",src)
		for(var/obj/Jutsu/Spider/web/A in oview(1))
			if(src.stamina<src.maxstamina)
				src.stamina+=100
			del(A)
	else
		if(src.Combos>=0&&src.Combos<3)
			spawn()
				flick("Attack",src)
		if(src.Combos>=3)
			flick("crashingleg",src)
			if(prob(5))
				if(src.Swift>=6)
					if(src.DoubleStrike<10)
						src.DoubleStrike+=0.01;if(src.DoubleStrike>10) src.DoubleStrike=10
	if(src.KagDance=="Karamatsu")
		flick("Attack",src);src.dir=NORTH;flick("Attack",src);sleep(1);src.dir=EAST;flick("Attack",src);sleep(1);src.dir=SOUTH;flick("Attack",src);sleep(1);src.dir=WEST;flick("Attack",src)
		for(var/mob/M in oview(src,1))
			if(M.KagDance=="Karamatsu")
				viewers(M)<<"[src] ossos se chocam com [M] ossos e nenhum dano é causado!"
			else
				spawn() src.Kara(M)
		return
	else
		if(prob(1))
			if(src.Swift<6)
				var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
				src.overlays+=I
				spawn(15)
					src.overlays-=I
				src.Swift+=0.01;if(src.Swift>6) src.Swift=6
		for(var/obj/Jutsu/Sand/Sphere/A in get_step(src,src.dir))
			for(var/mob/ZZZ in world)
				if(A.Owner==ZZZ)
					if(prob(1))
						ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
					if(ZZZ.AutoProtection>=20)
						ZZZ.SandAttack()
					src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
		for(var/mob/Sand/SunaNoTate/A in get_step(src,src.dir))
			for(var/mob/ZZZ in world)
				if(A.Owner==ZZZ)
					if(prob(1))
						ZZZ.AutoProtection+=pick(0.1,0.5);if(ZZZ.AutoProtection>20) ZZZ.AutoProtection=20
			src<<output("O ataque foi cancelado!","Attack");viewers()<<sound('SFX/Guard.wav',0,volume=35);return
		for(var/mob/M in get_step(src,src.dir))
			if(M.Mogu)
				return
			if(M.Dodging||M.Phasing||M.InHydro)
				M.Dodge();return
			M.attacker="[src]";M.attacked=1
			if(M.Clan=="Hyuuga")
				if(src.dir==NORTH&&M.dir!=NORTH&&M.dir!=NORTHEAST&&M.dir!=NORTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(src.dir==SOUTH&&M.dir!=SOUTH&&M.dir!=SOUTHEAST&&M.dir!=SOUTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(src.dir==EAST&&M.dir!=EAST&&M.dir!=SOUTHEAST&&M.dir!=NORTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
				if(src.dir==WEST&&M.dir!=WEST&&M.dir!=SOUTHWEST&&M.dir!=NORTHWEST)
					if(prob(M.Rejection*4))
						if(prob(50)) flick("Attack1",M)
						else flick("Attack2",M)
						step(src,src.dir);src<<"Você foi empurrado para trás!";return
			src.DodgeCalculation(M)
			if(M.Dodging)
				M.Dodge();return
			else if(M.RaiArmor==2&&prob(M.reflexNew*20))
				var/list/Turfs=list()
				for(var/turf/T in oview(1,src))
					if(!T.density&&get_dist(src,T)!=0)
						Turfs.Add(T)
				M.loc=pick(Turfs)
				M.dir=get_dir(M,src)
				var/obj/Jutsu/Elemental/Raiton/R=new()
				R.icon_state="Touei";R.loc=src;R.layer=6
				spawn(5)
					del(R)
				flick("zan",M)
				return
			if(M.KagDance=="Karamatsu")
				src<<output("Você tenta golpear [M] mas seus ossos faz você parar de atacar, ferindo-o de volta!","Attack");M<<output("você bloqueia o ataque de [src] ferindo-o!","Attack");src.DamageProc(src.maxhealth*0.03,"Health",M);M.Bloody();return
			if(M.DotonArmor)
				src<<output("Você tenta golpear [M] mas as rochas ao redor de seu corpo empede o ataque!","Attack");M<<output("Você bloquea o ataque de  [src] , graças às rochas ao redor de seu corpo.","Attack");return
			if(M.Guarding&&M.AutoProtection>0||M.Guarding&&M.Rejection>=5&&M.ByakuganMastery>1500)
				if(M.AutoProtection==0)
					viewers()<<sound('SFX/JyukenClash.wav',0,volume=40)
					M.dir=get_dir(M,src)
					var/a=pick("Attack1","Attack2")
					flick(a,M)
					spawn() AttackEfx3(M.x,M.y,M.z,M.dir)
					src.chakra-=rand(5,15)
					return
				else if(prob(M.AutoProtection*5))
					var/speedcheck=round(src.tai/3);speedcheck+=rand(1,speedcheck)
					if(M.chakra>speedcheck/2)
						M<<output("A areia bloquiou o ataque!","Attack");src<<output("A areia protegeu você do ataque!","Attack");M.overlays -= 'Icons/Jutsus/Sshushin.dmi';M.overlays += 'Icons/Jutsus/Sshushin.dmi';sleep(9);M.overlays -= 'Icons/Jutsus/Sshushin.dmi';M.chakra-=round(speedcheck/2);return

			else
				if(src.Combos<=1)
					spawn()
						src.Attacking15(M)
					if(prob(src.DoubleStrike*10))
						spawn()
							src.Attacking15(M)
					return
				if(src.Combos<=3)
					spawn()
						src.Attacking16(M)
					if(prob(src.DoubleStrike*10))
						spawn()
							src.Attacking16(M)
					return
		for(var/obj/A in get_step(src,src.dir))
			if(istype(A,(/obj/Totem)))
				var/obj/Totem/M=A
				oview(8)<<"[src] Socou o totem!"
				if(M.Effect==0&&M.CoolDown==0)
					oview(8)<<"O Totem começa a brilhar Misteriosamente..."
					sleep(10)
					M.Effect=rand(1,10)
					M.CoolDown=150
				else
					src<<"Já existe um efeito que ocorre em lugar!"
			if(A.icon=='Map/Turfs/log.dmi')
				flick("Hit",A);src<<"Você acertou uma Madeira!"
				src.stamina-=rand(10,35);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
				if(prob(1))
					if(src.Rush<20)
						src.Rush+=0.01;if(src.Rush>20) src.Rush=20
				if(src.TypeLearning=="Taijutsu")
					src.exp+=rand(1,10)*src.Combos
					if(src.Subscriber)
						src.exp+=rand(1,5)*src.Combos
				return
			if((A.icon=='Map/Turfs/Tree.dmi'||A.icon=='Map/Turfs/NewTree3.dmi')&&A.icon_state=="tree10")
				src<<"You hit the tree!"
				src.stamina-=rand(25,50);spawn()AttackEfx(A.x,A.y,A.z);viewers()<<sound('SFX/Guard.wav',0,volume=35)
				if(prob(1))
					if(src.Rush<20)
						src.Rush+=0.01;if(src.Rush>20) src.Rush=20
				if(src.TypeLearning=="Taijutsu")
					src.exp+=rand(1,15)*src.Combos
					if(src.Subscriber)
						src.exp+=rand(1,6)*src.Combos
				return
mob/proc/SenbonThrowing(Hand)
	if(prob(1)&&src.ThrowingStrength<5)
		src.ThrowingStrength+=pick(0.1,0.3)
		if(src.ThrowingStrength>5) src.ThrowingStrength=5
	viewers()<<sound('SFX/Throw.wav',0,0,1,25)
	var/obj/WEAPONS/Senbon/L=new();L.loc=src.loc;L.dir=src.dir;L.Move_Delay=0
	if(src.WeaponExploding)
		var/counter=0
		for(var/obj/ExplodingTag/O in usr.contents)
			counter+=1
		if(counter<=0)
			src.WeaponExploding=0
		else
			for(var/obj/ExplodingTag/O in usr.contents)
				if(O.ammount>1) O.ammount--
				else del(O)
			L.Exploding=1
			L.icon_state="Throwe"
	if(prob(10)&&src.WeaponMaster<5&&src.Clan=="Fuuma")
		src.WeaponMaster+=0.1;if(src.WeaponMaster>5) src.WeaponMaster=5
	L.Owner=src;walk(L,src.dir,L.Move_Delay)
	L.ChakraEnhance=src.ChakraEnhance
	L.icon='Icons/Senbon.dmi'
	if(Hand=="Left")
		flick("Attack1",src)
	if(Hand=="Right")
		flick("Attack2",src)
	L.icon_state=""
	if(Hand=="Left")
		L.pixel_x=rand(20,22);L.pixel_y=rand(14,16)
	if(Hand=="Right")
		L.pixel_x=rand(10,12);L.pixel_y=rand(14,16)
	for(var/obj/WEAPONS/Senbon/O in src.contents)
		O.ammount-=1
		if(O.ammount<=0)
			if(src.WeaponInLeftHand==O)
				src.WeaponInLeftHand=""
			if(src.WeaponInRightHand==O)
				src.WeaponInRightHand=""
			del(O)
		else
			O.name="[O.oname]"
			O.suffix= " ([O.ammount])"
mob/proc/ShurikenThrow(Hand,Charge)
	var/countr=round(Charge/2)
	var/number
	if(Hand=="Left"&&WeaponInLeftHand!="")
		var/obj/WEAPONS/Q=src.WeaponInLeftHand
		number=Q.ammount
	if(Hand=="Right"&&WeaponInRightHand!="")
		var/obj/WEAPONS/Q=src.WeaponInRightHand
		number=Q.ammount
	if(number<1||number==null)
		number=1
	var/max=round(src.ShurikenMastery/10)
	if(src.ShurikenMastery>40&&src.ShurikenMastery<3000) max=4
	if(countr>max) countr=max
	if(countr>number) countr=number
	if(countr<1) countr=1
	while(countr>0)
		if(prob(1)&&src.ThrowingStrength<5)
			src.ThrowingStrength+=pick(0.1,0.3)
			if(src.ThrowingStrength>5) src.ThrowingStrength=5
		var/obj/WEAPONS/Shuriken/L=new()
		L.loc=src.loc
		if(prob(45))
			if(prob(50))
				var/d=turn(src.dir,45);L.loc=get_step(src,d)
			else
				var/d=turn(src.dir,-45);L.loc=get_step(src,d)
		L.dir=src.dir;L.Move_Delay=1.3
		if(src.WeaponExploding)
			var/counter=0
			for(var/obj/ExplodingTag/O in usr.contents)
				counter+=1
			if(counter<=0)
				src.WeaponExploding=0
			else
				for(var/obj/ExplodingTag/O in usr.contents)
					if(O.ammount>1) O.ammount--
					else del(O)
				L.Exploding=1
				L.icon_state="Throwe"
		if(src.ThrowingStrength>=1&&src.ThrowingStrength<2)
			L.Move_Delay=1.1;L.TileMax=3
		if(src.ThrowingStrength>=2&&src.ThrowingStrength<3)
			L.Move_Delay=0.9;L.TileMax=2
		if(src.ThrowingStrength>=3&&src.ThrowingStrength<4)
			L.Move_Delay=0.6;L.TileMax=2
		if(src.ThrowingStrength>=4&&src.ThrowingStrength<5)
			L.Move_Delay=0.3;L.TileMax=1
		if(src.ThrowingStrength>=5)
			L.Move_Delay=0;L.TileMax=1
		if(prob(10)&&src.WeaponMaster<5&&src.Clan=="Fuuma")
			src.WeaponMaster+=0.1;if(src.WeaponMaster>5) src.WeaponMaster=5
		L.Owner=src;walk(L,src.dir,L.Move_Delay)
		L.ChakraEnhance=src.ChakraEnhance
		L.icon='Icons/shuriken.dmi'
		if(Hand=="Left")
			flick("Attack1",src)
		if(Hand=="Right")
			flick("Attack2",src)
		L.icon_state="throw"

		L.pixel_x=rand(-6,28);L.pixel_y=rand(4,24)
	//	if(Hand=="Right")
	//		L.pixel_x=rand(10,12);L.pixel_y=rand(14,16)
		for(var/obj/WEAPONS/Shuriken/O in src.contents)
			O.ammount-=1
			if(O.ammount<=0)
				if(src.WeaponInLeftHand==O)
					src.WeaponInLeftHand=""
				if(src.WeaponInRightHand==O)
					src.WeaponInRightHand=""
				del(O)
			else
				O.name="[O.oname]"
				O.suffix= " ([O.ammount])"
		spawn(100)
			del(L)
		countr--
mob/proc/WShurikenThrow()
	if(prob(1)&&src.ThrowingStrength<5)
		src.ThrowingStrength+=pick(0.1,0.3)
		if(src.ThrowingStrength>5) src.ThrowingStrength=5
	//if(src.key=="DemonicK")	spawn(1) src.KageShuriken() //Testing Purposes Only.
	var/obj/WEAPONS/WindmillShuriken/L=new();L.loc=src.loc;L.dir=src.dir;L.Move_Delay=1.3
	L.icon='Icons/windmill.dmi'
	if(src.ThrowingStrength>=1&&src.ThrowingStrength<2)
		L.Move_Delay=1.1
	if(src.ThrowingStrength>=2&&src.ThrowingStrength<3)
		L.Move_Delay=0.9
	if(src.ThrowingStrength>=3&&src.ThrowingStrength<4)
		L.Move_Delay=0.6
	if(src.ThrowingStrength>=4&&src.ThrowingStrength<5)
		L.Move_Delay=0.3
	if(src.ThrowingStrength>=5)
		L.Move_Delay=0
	if(prob(10)&&src.WeaponMaster<5&&src.Clan=="Fuuma")
		src.WeaponMaster+=0.5;if(src.WeaponMaster>5) src.WeaponMaster=5
	L.dir=src.dir
	L.ChakraEnhance=src.ChakraEnhance
	L.Owner=src;walk(L,src.dir,L.Move_Delay)
	for(var/obj/WEAPONS/WindmillShuriken/O in src.contents)
		O.ammount-=1
		if(O.ammount<=0)
			if(src.WeaponInLeftHand==O)
				src.WeaponInLeftHand=""
			if(src.WeaponInRightHand==O)
				src.WeaponInRightHand=""
			del(O)
		else
			O.name="[O.oname]"
			O.suffix= " ([O.ammount])"
		return
mob/proc/KunaiThrowing(PuppetSpeed)
	var/HowFast=""
	HowFast=PuppetSpeed
	if(istype(src,/mob/Puppet/Talon/))
		var/mob/Puppet/Talon/C=src
		var/mob/M=C.Owner//Make sure to have this delete!!!!!!!!!!
		var/mob/A
		A=M.target
		C.dir=get_dir(C,A)
		if(C.CanThrowKunais!=0)//!=0)//==1 Because this is the Light Kunai Upgrade
			if(HowFast=="Slow")
				var/obj/WEAPONS/Kunai/KK=new();KK.icon='Icons/New Base/Weapons/kunai.dmi';KK.icon_state="Throwz";KK.loc=src.loc;KK.dir=src.dir;KK.Percision=5;KK.Move_Delay=3
				KK.pixel_x=rand(8,16);KK.pixel_y=rand(8,16)
				KK.PuppetKunaiDamage=1
				KK.Owner=src;
				walk(KK,src.dir,KK.Move_Delay)
				KK.ChakraEnhance=0
				return
			else if(HowFast=="Medium")
				var/obj/WEAPONS/Kunai/KK=new();KK.icon='Icons/New Base/Weapons/kunai.dmi';KK.icon_state="Throwz";KK.loc=src.loc;KK.dir=src.dir;KK.Percision=7;KK.Move_Delay=2
				KK.pixel_x=rand(8,16);KK.pixel_y=rand(8,16)
				KK.PuppetKunaiDamage=2
				KK.Owner=src;
				walk(KK,src.dir,KK.Move_Delay)
				KK.ChakraEnhance=0
				return
			else if(HowFast=="Fast")
				var/obj/WEAPONS/Kunai/KK=new();KK.icon='Icons/New Base/Weapons/kunai.dmi';KK.icon_state="Throwz";KK.loc=src.loc;KK.dir=src.dir;KK.Percision=10;KK.Move_Delay=0
				KK.pixel_x=rand(8,16);KK.pixel_y=rand(8,16)
				KK.PuppetKunaiDamage=3
				KK.Owner=src;
				walk(KK,src.dir,KK.Move_Delay)
				KK.ChakraEnhance=0
				return
		else if(C.CanThrowRapidKunais==1)
			var/AmountThrown=15
			while(AmountThrown>0)
		//	var/mob/M=C.Owner//Make sure to have this delete!!!!!!!!!!
		//	var/mob/A
		//	A=M.target
		//	C.dir=get_dir(C,A)
				sleep(5)
				C.dir=get_dir(C,A)
				var/obj/WEAPONS/Kunai/KKK=new();KKK.icon='Icons/New Base/Weapons/kunai.dmi';KKK.icon_state="Throwz";KKK.loc=src.loc;KKK.dir=src.dir;KKK.Percision=1;KKK.Move_Delay=2
				KKK.pixel_x=rand(8,16);KKK.pixel_y=rand(8,16)
				KKK.PuppetRapidKunaiDamage=1
				KKK.Owner=src;
				walk(KKK,src.dir,KKK.Move_Delay)
				KKK.ChakraEnhance=0
				AmountThrown--
			return
		else if(C.CanThrowRapidKunais==2)
			var/AmountThrown=20
			while(AmountThrown>0)
		//	var/mob/M=C.Owner//Make sure to have this delete!!!!!!!!!!
		//	var/mob/A
		//	A=M.target
		//	C.dir=get_dir(C,A)
				sleep(5)
				C.dir=get_dir(C,A)
				var/obj/WEAPONS/Kunai/KKK=new();KKK.icon='Icons/New Base/Weapons/kunai.dmi';KKK.icon_state="Throwz";KKK.loc=src.loc;KKK.dir=src.dir;KKK.Percision=2.5;KKK.Move_Delay=1.5
				KKK.pixel_x=rand(8,16);KKK.pixel_y=rand(8,16)
				KKK.PuppetRapidKunaiDamage=1
				KKK.Owner=src;
				walk(KKK,src.dir,KKK.Move_Delay)
				KKK.ChakraEnhance=0
				AmountThrown--
			return
		else if(C.CanThrowRapidKunais==3)
			var/AmountThrown=23
			while(AmountThrown>0)
		//	var/mob/M=C.Owner//Make sure to have this delete!!!!!!!!!!
		//	var/mob/A
		//	A=M.target
		//	C.dir=get_dir(C,A)
				sleep(5)
				C.dir=get_dir(C,A)
				var/obj/WEAPONS/Kunai/KKK=new();KKK.icon='Icons/New Base/Weapons/kunai.dmi';KKK.icon_state="Throwz";KKK.loc=src.loc;KKK.dir=src.dir;KKK.Percision=3;KKK.Move_Delay=1.1
				KKK.pixel_x=rand(8,16);KKK.pixel_y=rand(8,16)
				KKK.PuppetRapidKunaiDamage=1
				KKK.Owner=src;
				walk(KKK,src.dir,KKK.Move_Delay)
				KKK.ChakraEnhance=0
				AmountThrown--
			return
//	if(Hand=="Left")
//		flick("Attack1",src)
//	if(Hand=="Right")
	flick("Attack2",src)//LOL
	if(prob(1)&&src.ThrowingStrength<5)
		src.ThrowingStrength+=pick(0.1,0.3)
		if(src.ThrowingStrength>5) src.ThrowingStrength=5
	viewers()<<sound('SFX/Throw.wav',0,0,1,35)
	var/obj/WEAPONS/Kunai/K=new()
	K.icon='Icons/New Base/Weapons/kunai.dmi'
	K.icon_state="Throwz";K.loc=src.loc;K.dir=src.dir;K.Percision=src.Percision;K.Move_Delay=1
	if(src.FTG_Mode)
		src.SealPlacedOn+=K
	if(src.WeaponExploding)
		var/counter=0
		for(var/obj/ExplodingTag/O in usr.contents)
			counter+=1
		if(counter<=0)
			src.WeaponExploding=0
		else
			for(var/obj/ExplodingTag/O in usr.contents)
				if(O.ammount>1) O.ammount--
				else del(O)
			K.Exploding=1
			K.icon_state="Throwze"
	if(src.KunaiMastery>50&&src.ChakraEnhance)
		K.TileMax=3+round(src.KunaiMastery/50)
	//src<<"Starting Kunai Move_Delay = [K.Move_Delay]"
	if(src.ThrowingStrength>=1&&src.ThrowingStrength<2)
		K.Move_Delay=1.1;K.TileMax=5
	if(src.ThrowingStrength>=2&&src.ThrowingStrength<3)
		K.Move_Delay=0.9;K.TileMax=4
	if(src.ThrowingStrength>=3&&src.ThrowingStrength<4)
		K.Move_Delay=0.6;K.TileMax=3
	if(src.ThrowingStrength>=4&&src.ThrowingStrength<5)
		K.Move_Delay=0.3;K.TileMax=2
	if(src.ThrowingStrength>=5)
		K.Move_Delay=0;K.TileMax=1
	//src<<"Your Throwing Strength = [src.ThrowingStrength]"
	//src<<"Final Kunai Move_Delay = [K.Move_Delay]"
	if(prob(10)&&src.WeaponMaster<5&&src.Clan=="Fuuma")
		src.WeaponMaster+=0.2;if(src.WeaponMaster>5) src.WeaponMaster=5

	K.pixel_x=rand(8,16);K.pixel_y=rand(8,16)
	K.Owner=src;walk(K,src.dir,K.Move_Delay)
	K.ChakraEnhance=src.ChakraEnhance
	for(var/obj/WEAPONS/Kunai/Z in src.contents)
		Z.ammount-=1;if(Z.ammount<=0)
			if(src.WeaponInLeftHand==Z)
				src.WeaponInLeftHand=""
			if(src.WeaponInRightHand==Z)
				src.WeaponInRightHand=""
			del(Z)
		else
			Z.name="[Z.oname]"
			Z.suffix= " ([Z.ammount])"
	if(src.TimeToAttack==15)
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
		color:white;}</style>"
		sd_Alert(src, "Você lançar com sucesso um kunai!","[src]",,,,0,"400x150",,style)
		src.TimeToAttack=16

mob/proc/MarkedKunaiThrowing()
	if(prob(1)&&src.ThrowingStrength<5)
		src.ThrowingStrength+=pick(0.1,0.3)
		if(src.ThrowingStrength>5) src.ThrowingStrength=5
	var/obj/WEAPONS/MarkedKunai/K=new();K.icon='Icons/New Base/Weapons/MinatosKunai.dmi';K.icon_state="Thrown";K.loc=src.loc;K.dir=src.dir;K.Percision=src.Percision;K.Move_Delay=1
	if(src.WeaponExploding)
		var/counter=0
		for(var/obj/ExplodingTag/O in usr.contents)
			counter+=1
		if(counter<=0)
			src.WeaponExploding=0
		else
			for(var/obj/ExplodingTag/O in usr.contents)
				if(O.ammount>1) O.ammount--
				else del(O)
			K.Exploding=1
			K.icon_state="Thrown"
	if(src.KunaiMastery>50&&src.ChakraEnhance)
		K.TileMax=3+round(src.KunaiMastery/50)
	//src<<"Starting Kunai Move_Delay = [K.Move_Delay]"
	if(src.ThrowingStrength>=1&&src.ThrowingStrength<2)
		K.Move_Delay=1.1;K.TileMax=5
	if(src.ThrowingStrength>=2&&src.ThrowingStrength<3)
		K.Move_Delay=0.9;K.TileMax=4
	if(src.ThrowingStrength>=3&&src.ThrowingStrength<4)
		K.Move_Delay=0.6;K.TileMax=3
	if(src.ThrowingStrength>=4&&src.ThrowingStrength<5)
		K.Move_Delay=0.3;K.TileMax=2
	if(src.ThrowingStrength>=5)
		K.Move_Delay=0;K.TileMax=1
	//src<<"Your Throwing Strength = [src.ThrowingStrength]"
	//src<<"Final Kunai Move_Delay = [K.Move_Delay]"
	if(prob(10)&&src.WeaponMaster<5&&src.Clan=="Fuuma")
		src.WeaponMaster+=0.2;if(src.WeaponMaster>5) src.WeaponMaster=5
	K.pixel_x=rand(8,16);K.pixel_y=rand(8,16)
	K.Owner=src;walk(K,src.dir,K.Move_Delay)
	K.ChakraEnhance=src.ChakraEnhance
	for(var/obj/WEAPONS/MarkedKunai/Z in src.contents)
		Z.ammount-=1;if(Z.ammount<=0)
			if(src.WeaponInLeftHand==Z)
				src.WeaponInLeftHand=""
			if(src.WeaponInRightHand==Z)
				src.WeaponInRightHand=""
			del(Z)
		else
			Z.name="[Z.oname]"
			Z.suffix= " ([Z.ammount])"
//	if(src.TimeToAttack==15)
//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
//		color:white;}</style>"
//		sd_Alert(src, "You've successfully thrown a kunai!","[src]",,,,0,"400x150",,style)
//		src.TimeToAttack=16
//AttackStyles
////////////////////Place All Attack Procs Here//////////////////
//Basic
//Buffet
mob/var/tmp/RushLimitz=0
mob/var/tmp/BuffetGain=0
mob/var/tmp/JC=0
mob/proc
	Attacking(mob/M,Power,Style="Basic")
		if(M.client)
			if(src.TypeLearning=="Taijutsu")
				src.exp+=rand(10,20)
				if(src.Subscriber)
					src.exp+=rand(5,10)
//Calculations
		var/YourPhysique=src.tai
		YourPhysique=YourPhysique*115 //Was Originally 100
		var/Damage=YourPhysique
		var/RandomModifier=Power*0.1
		Damage=Damage*(RandomModifier/2)
		Damage/=M.Endurance
		if(Damage<10)
			Damage+=rand(4,6)
		if(Damage>300&&src.GateIn!="Wound"&&src.GateIn!="Limit"&&src.GateIn!="View")
			var/DamageAddOn=Damage**((Power/10)/3)
			if(DamageAddOn+300<Damage)
				Damage=300+DamageAddOn
		if(Damage>500)
			Damage=500
//Muscles added here
//		var/Muscles=src.Muscle
//		Muscles=Muscles*0.01
//		Damage=Damage*Muscles
		if(M.InHydro)
			if(Style!="Jyuken" && src.RaiArmor)
				M.Dodge();return
			if(src.RaiArmor)
				M.health -= 50
		if(Style=="Enjouhawa")
			var/ReflexBoost=src.Focus/(M.Focus+1)
			if(ReflexBoost>50)
				ReflexBoost=50
			if(ReflexBoost<10)
				ReflexBoost=10
			Damage+=ReflexBoost

		var/DamagePlus=Power
		if(src.EyesOfHell==2&&src.ConversusinThirdStage)
			if(Power>=20)
				src<<"Indo para arranjar alguém para colorir novamente este..."
				src.GoukakyuuNoJutsu(1000,DemonicFlames=1)
		if(DamagePlus<20)
			DamagePlus=20
		if(Style!="Quick Fist")
			if(src.BaikaCharged>=1)
				DamagePlus=DamagePlus+(DamagePlus*(src.BaikaCharged*0.1))
		Damage=Damage+DamagePlus
		if(Style=="Rakanken")
			Damage+=DamagePlus
		if(src.RushLimitz<src.Rush)
	//		Damage+= (Damage*(RushLimitz*0.2))
			Damage+= (Damage*(RushLimitz*0.05))
/////////////
		if(istype(M,/mob/Sand/SunaNoTate))
			var/random=rand(1,50)
			if(random==50)
				del(M)
		if(M.JC>0)
			viewers()<<sound('SFX/JyukenClash.wav',0,volume=40)
			M.dir=get_dir(M,src)
			var/a=pick("Attack1","Attack2")
			flick(a,M)
			spawn() AttackEfx3(M.x,M.y,M.z,M.dir)
			M.JC--
			return
		if(M.NenkinOn)
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
		if(M.FrozenBind=="DoBind")
			src<<output("Seus punhos saltam inofensivamente fora das rochas...","Attack");M<<output("o punho de [src] salta inofensivamente fora das rochas...","Attack")
			return
		if(M.Kaiten)
			src<<output("[M] rotação atiro você de volta!","Attack");M<<output("Sua rotação jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.DamageProc(rand(1,Damage),"Health",M);M.RushLimitz=0;src.Death(M)
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			return
		if(M.ingat)
			src<<output("[M] rotação atiro você de volta!","Attack");M<<output("Sua rotação jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.DamageProc((src.maxhealth*0.01),"Health",M);M.RushLimitz=0
		else
			if(src.ManBeastClaws||src.ConversusinSecondStage||(src.Bijuu=="Nibi"&&src.TailState>=1))
				src<<"Você corta [M] com suas garras!"
				if(M.Bijuu=="Sanbi"&&(M.TailState==2||M.TailState==3))
					if(prob(80))
						spawn()src.Bloody()
						src.health-=30
				if(M.Clan=="Hoshigaki")
					if(prob(25))
						spawn()src.Bloody()
						src.health-=10
				if(Damage>75&&src.TailState==0)
					Damage=75
				if(src.Bijuu=="Nibi"&&src.TailState==2&&M)
					Damage+=40
					M.Bloody();M.Bloody()
				M<<output("[src] corta-o com suas garras!","Attack")
				if(prob((src.Focus+1)/(M.Buff+1))*10)
					if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
						src<<output("Acerto Crítico!","Attack")
						M<<output("Você deu um Acerto Crítico!","Attack");spawn()Blood(M.x,M.y,M.z)
						M.DamageProc(Damage,"Health",src)
				viewers()<<sound('SFX/Slice.wav',0,volume=45)
				src<<output("You slash [M]!","Attack")
				if(prob(50)&&M)
					spawn()Blood(M.x,M.y,M.z)
				M.DamageProc(Damage,"Health",src)
				M.RushLimitz=0
				src.RushLimitz++
				if(M.Buffet>=1)
					M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
				return
			else
				spawn()
					if(M&&!M.Guarding)
						flick("hit",M)
				if(M.Stun>10)
					M.Stun=10
				if(M.Clan=="Hoshigaki")
					if(prob(25))
						spawn()src.Bloody()
						src.health-=10
				if(M.Bijuu=="Sanbi"&&(M.TailState==2||M.TailState==3))
					if(prob(70))
						spawn()src.Bloody()
						src.health-=20
				if(M.Guarding)
					viewers()<<sound('SFX/Guard.wav',0,volume=35)
				else
					if(prob(src.Focus-M.Buff))
						M.StunAdd(1)
					if(Damage<25)
						viewers()<<sound('SFX/HitWeak.wav',0,volume=30)
					if(Damage>=25&&Damage<100)
						viewers()<<sound('SFX/HitMedium.wav',0,volume=39)
					if(Damage>=100)
						viewers()<<sound('SFX/HitStrong.wav',0,volume=45)


				if(Style=="Jyuken")
					src.JC++
					spawn(src.SensoryRange*3)
						if(src.JC>0)
							src.JC--
					if(prob(1)&&src.ChakraPercision<5)
						src.ChakraPercision+=pick(0.01,0.2);if(src.ChakraPercision>5) src.ChakraPercision=5
					if(prob(3)&&src.TenketsuAccuracy<20&&M.resting==0&&M.knockedout==0&&M.Dead==0&&M.client)
						src.TenketsuAccuracy+=pick(0.01,0.03);if(src.TenketsuAccuracy>20) src.TenketsuAccuracy=20
					Damage=Damage/10
				var/Mlocation=locate(M.x,M.y,M.z)
				if(Style=="Jyuken")
				//	world<<"JyuukenEFX called."
					spawn()
						JyuukenEfx(M.x,M.y,M.z)//Mlocation)
				//	JyuukenEfx(Mlocation)
				else
					spawn()AttackEfx(Mlocation)
				if(Damage>100)
					var/Drain=10
					if(src.TaijutsuMastery>4)
						Drain=(Damage/(src.TaijutsuMastery))
					else
						Drain=(Damage/4)
					if(src.TaijutsuStyle=="Gouken")
						Drain/=3
					src.StaminaDrain(Drain)
				if(src.Kengan==1)
					Damage+=src.tai
					M.HitBack(2,src.dir)
				if(src.ChargedChakraForPunch>0)
					Damage+=(src.ChargedChakraForPunch/2)
					if(Damage>1500)
						Damage=1500
					src.ChargedChakraForPunch=0
					viewers(src)<<"[src] bate em [M] com um golpe de força-aprimorada de chakra"
				if(src.FuuinControl&&M.icon_state!="Block"&&!M.knockedout)
					M.FuuinControlled=1
					src.ChakraDrain(15000)
					src.FuuinControl=0
					src<<"Você sela o controle em [M]!"
					M<<"[src] Colocou um selo em você?"
					if(M.client.computer_id==src.client.computer_id)
						return
					if(prob(20))
						src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
					if(src.knockedout&&M.FuuinControlled)
						M<<"Suas taxas de chakra voltar ao normal."
						M.FuuinControlled=0
					spawn(300)
						if(M.FuuinControlled)
							M.FuuinControlled=0
				if(src.PlacingMarker&&!usr.SealPlacedOn.Find(M))
					src.SealPlacedOn+=M
					var/image/I=image('Icons/Jutsus/MinatoAura.dmi',M)
					src<<I
					src.PlacingMarker=0
					src<<"Você furtivamente coloca um selo de marcação no [M]!"
				if(src.FuuinjutsuHellsent&&!M.knockedout)
					M.InHellSent=1
					src.ChakraDrain(20000)
					src.FuuinjutsuHellsent=0
					src<<"Você  usa o Selo do Inferno em [M]!"
					M<<"[src] Colocou um selo em você?"
					if(M.client.computer_id==src.client.computer_id)
						return
					if(prob(20))
						src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
				if(src.FiveElementSeal==1&&!M.knockedout&&M.icon_state!="Block")
					M.FiveElementSealed=1
					src.ChakraDrain(35000)
					src.FiveElementSeal=0
					src<<"Você usa o Selo de Cinco Elementos em [M]!"
					if(M.Focus>=250&&prob(60))
						M<<"Será que [src] apenas colocou a mão no seu corpo...?"
					M<<"O uso do Chakra para manipular jutsus Elemental foi bloqueado..?"
					if(M.client.computer_id==src.client.computer_id)
						return
					if(prob(20))
						src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
				if(src.CurseSealParalysis&&!M.knockedout&&M.icon_state!="Block")
					M.CursedSealParalysis=1
					src.LandedCurseSealParalysis=1
					src.ChakraDrain(25000)
					src.CurseSealParalysis=0
					src<<"Você cola o Selo Amaldiçoado Paralisia em [M]! Pressione Z quando você quiser definir-lo em [M], mas certifique-se que eles estão dentro do alcance!"
					if(M.Focus>=505)
						M<<"Será que [src] so colocou a mão em seu corpo...?"
					if(M.client.computer_id==src.client.computer_id)
						return
					if(prob(20))
						src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
				if(src.PunchGen&&!M.knockedout&&M.icon_state!="Block")
					src.PunchGen=0
					src<<"Você marcou [M] com um soco, seu próximo Genjutsu poderá ser feito sem um alvo"
					src.PunchedTarget=M
					M<<"Você sente como se um pouco de chakra encostasse em você"
					spawn(src.GenSkill*10)
						if(src.PunchedTarget)
							src.PunchedTarget<<"O chakra que estava em você some"
							src.PunchedTarget=""
							src<<"Você perdeu o alvo"
				if(!M.knockedout)
					M.DamageProc(Damage,"Stamina",src)
				M<<output("[src] bate tirando [Damage] de Dano!","Attack")
				src<<output("[M] foi atingido por [Damage] de Dano!","Attack")
				src.RushLimitz+=1
				if(src.EyesOfHell==2&&src.ConversusinThirdStage)
					if(prob(30))
						M.InternalBleed()
					if(prob(10)&&M.Status!="Burn")
						M.Status="Burn"
						M.StatusEffected=rand(12,15)
				if(src.RushLimitz>=src.Rush)
					src.RushLimitz=0
				if(Style=="Jyuken")
					if(src.Focus>(M.Focus*1.5)&&prob(50+min(src.TenketsuAccuracy,20)))
						M.StunAdd(2)
				if(src&&src.RaiArmor==2)
					if(M&&!M.RaiArmor)
						M.DamageProc(rand(25,40),"Health",src)
						//src.overlays+='Icons/Jutsus/RaiArmor.dmi';src.StunAdd(1)
						//spawn(25)
						//	src.overlays+='Icons/Jutsus/RaiArmor.dmi'
						if(!M){return}
						spawn() M.Bloody()
						spawn() M.Bloody()
				if(M&&M.RaiArmor)
					if(src.RaiArmor!=2)
						src.StunAdd(10)
			var/HitBack=0
			var/JyuukenTime=0
			if(src.ByakuganMastery>7500)
				JyuukenTime=75
			else
				JyuukenTime=100
			HitBack=round(Damage/100)
			if(HitBack<5)
				spawn() M.HitBack(HitBack,src.dir)
			if(Damage>500||src.GateIn=="View"||src.GateIn=="Limit"||src.BubunBaika||Power>19)
				spawn()BangAttackEfx(M.x,M.y,M.z)
				M.Stun=0
				spawn() M.HitBack(5,src.dir)
				if(src.BubunBaika)
					M.HitBack(4,src.dir)
					M.stamina-=250
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(Power>20&&prob(1)&&M.client)
				var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
				src.overlays+=I
				spawn(15)
					src.overlays-=I
				src.Focus+=0.1
			if(Power>20&&prob(1)&&M.Guarding)
				M.Buff+=0.1
			spawn()
				if(prob((src.tai)/(M.tai+1))*20)
					step(M,src.dir)
					if(prob((src.tai)/(M.tai+1))*30)
						step(src,src.dir)
			if(Style=="Gouken")
				spawn()
					if(prob(65))
						step(M,src.dir)
						if(prob(45))
							step(src,src.dir)
			if(!M.ImmuneToDeath&&!M.knockedout)
				spawn(JyuukenTime)
					if(Style=="Jyuken"&&!src.Clone)
						if(M&&!M.knockedout&&src.bya)
							if(prob(8+src.TenketsuAccuracy))
								if(!M.knockedout&&!M.ImmuneToDeath)
									var/ChakraBonusLoss=src.ChakraPercision*10
									if(src.ByakuganMastery>7000)
										ChakraBonusLoss*=1.3
									M.chakra-=M.Mchakra*0.015+ChakraBonusLoss
									if(src.ByakuganMastery>7000&&prob(90))
										M.ChakraPool-=rand(15,25)
								var/Damage2=M.maxhealth*pick(0.02*(src.TenketsuAccuracy/10),0.001*src.TenketsuAccuracy)//was originally divided by 10
								if(src.ByakuganMastery>7000)
									Damage2*=1.1
								M.DamageProc(Damage2,"Health",src)
								if(prob((src.TenketsuAccuracy*0.5)+3)&&M)
									M.DamageProc(M.maxhealth*0.03,"Health",src)
									spawn()M.Bloody();spawn()M.Bloody()
//////////////////////
//Kick2 For Combos
///////////////
mob/proc
	Attacking15(mob/M)
		var/A=src.tai*0.3;var/damage=A;var/RushLimit = src.Rush
		var/DamagePlus=rand(50,100)
		if(src.BaikaCharged>=1)
			DamagePlus=DamagePlus+DamagePlus*(src.BaikaCharged*0.1)
		if(!M)
			return
		var/Mlocation=locate(M.x,M.y,M.z)
		if(M.NenkinOn)
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return

		if(M.ingat)
			src<<output("[M] espiral jogou você pra longe!","Attack");M<<output("Seu espiral jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.health-=src.maxhealth*0.01;M.RushLimitz=0
		if(M.FrozenBind=="DoBind")
			src<<output("Seus punhos saltamin ofensivamente fora das rochas...","Attack");M<<output("[src] punhos saltam inofensivamente fora das rochas...","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			return
		if(M.Kaiten)
			src<<output("[M] Rotação jogou todos para longe!","Attack");M<<output("Sua rotação jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.health-=rand(1,damage);M.RushLimitz=0;src.Death(M)
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			return
		else
			if(M.Bijuu=="Sanbi"&&(M.TailState==2||M.TailState==3))
				if(prob(70))
					spawn()src.Bloody()
					src.health-=20
			if(M.Clan=="Hoshigaki")
				if(prob(25))
					spawn()Blood(src.x,src.y,src.z)
					src.health-=10
			var/damagez=rand(damage*1,damage*2)
			if(src.isdog) damagez=(damagez*8)
			var/damagehit=(round((rand(damagez/2,damagez)*(RushLimitz+1))/(M.Endurance+1)))+DamagePlus
			if(damagehit<1)
				damagehit+=rand(1,35)
			if(M.Endurance>=100000)
				damagehit=0
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack");M<<output("Você deu um Acerto Crítico!","Attack");M.DamageProc(damagehit,"Stamina",src)
				if(!M.Guarding)
					if(M.Stun<=0)
						M.StunAdd(rand(1,2))
				if(prob(1))
					M.Buff+=0.1
				if(prob(1)&&M.client)
					var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
					src.overlays+=I
					spawn(15)
						src.overlays-=I
					src.Focus+=0.1
				spawn()AttackEfx(Mlocation)
			src<<output("Você acerta [M] tirando [damagehit] de dano!","Attack");M<<output("[src] acerta você tirando [damagehit] de dano!","Attack")
			if(M.Guarding)
				viewers()<<sound('SFX/Guard.wav',0,volume=35)
				damagehit=damagehit*0.5
			else
				var/Z=rand(1,3);if(Z==1)
					viewers()<<sound('SFX/HitWeak.wav',0,volume=30)
				if(Z==2)
					viewers()<<sound('SFX/HitMedium.wav',0,volume=39)
				if(Z==3)
					viewers()<<sound('SFX/HitStrong.wav',0,volume=45)
			spawn()AttackEfx(Mlocation);M.DamageProc(damagehit,"Stamina",src);src.RushLimitz+=1;if(src.RushLimitz>=RushLimit)
				src.RushLimitz=0
			if(src.RaiArmor==2)
				M.DamageProc(rand(100,120),"Health",src)
				spawn() Blood(Mlocation)
				spawn() Blood(Mlocation)
			else if(M.RaiArmor)
				src.StunAdd(10);src.Death(M)
			if(!M.Guarding)
				if(M.Stun<=0)
					M.StunAdd(rand(0,1))
				flick("hit",M)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(src.GateIn=="Limit"|src.GateIn=="View")
				if(prob(50)&&M)
					M.dir=src.dir;step(M,M.dir);step(M,M.dir);step(M,M.dir)
			if(M.client)
				if(src.TypeLearning=="Taijutsu")
					src.exp+=rand(10,20)
					if(src.Subscriber)
						src.exp+=rand(5,10)
			M.Death(src);return
mob/proc
	Attacking16(mob/M)
		var/A=src.tai*0.5;var/damage=A;var/RushLimit = src.Rush
		var/DamagePlus=rand(50,100)
		if(src.BaikaCharged>=1)
			DamagePlus=DamagePlus+DamagePlus*(src.BaikaCharged*0.1)
		if(!M)
			return
		var/Mlocation=locate(M.x,M.y,M.z)
		if(M.NenkinOn)
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return

		if(M.ingat)
			src<<output("[M] espiral jogou você pra longe!","Attack");M<<output("Seu espiral jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.health-=src.maxhealth*0.01;M.RushLimitz=0
		if(M.FrozenBind=="DoBind")
			src<<output("Seus punhos saltamin ofensivamente fora das rochas...","Attack");M<<output("[src] punhos saltam inofensivamente fora das rochas...","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			return
		if(M.Kaiten)
			src<<output("[M] Rotação jogou todos para longe!","Attack");M<<output("Sua rotação jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.health-=rand(1,damage);M.RushLimitz=0;src.Death(M)
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			return
		else
			if(M.Bijuu=="Sanbi"&&(M.TailState==2||M.TailState==3))
				if(prob(70))
					spawn()src.Bloody()
					src.health-=20
			if(M.Clan=="Hoshigaki")
				if(prob(25))
					spawn()Blood(src.x,src.y,src.z)
					src.health-=10
			var/damagez=rand(damage*1,damage*2)
			if(src.isdog) damagez=(damagez*8)
			var/damagehit=(round((rand(damagez/2,damagez)*(RushLimitz+1))/(M.Endurance+1)))+DamagePlus
			if(damagehit<1)
				damagehit+=rand(1,35)
			if(M.Endurance>=100000)
				damagehit=0
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack");M<<output("Você deu um Acerto Crítico!","Attack");M.DamageProc(damagehit,"Stamina",src)
				if(!M.Guarding)
					if(M.Stun<=0)
						M.StunAdd(rand(1,2))
				if(prob(1))
					M.Buff+=0.1
				if(prob(1)&&M.client)
					var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
					src.overlays+=I
					spawn(15)
						src.overlays-=I
					src.Focus+=0.1
				spawn()AttackEfx(Mlocation)
			src<<output("Você acerta [M] tirando [damagehit] de dano!","Attack");M<<output("[src] acerta você tirando [damagehit] de dano!","Attack")
			if(M.Guarding)
				viewers()<<sound('SFX/Guard.wav',0,)
				damagehit=damagehit*0.5
			else
				var/Z=rand(1,3);if(Z==1)
					viewers()<<sound('SFX/HitWeak.wav',0,volume=30)
				if(Z==2)
					viewers()<<sound('SFX/HitMedium.wav',0,volume=39)
				if(Z==3)
					viewers()<<sound('SFX/HitStrong.wav',0,volume=45)
			spawn()
				AttackEfx(Mlocation);
				if(!M.knockedout)
					M.DamageProc(damagehit,"Stamina",src);
				src.RushLimitz+=1;
				if(src.RushLimitz>=RushLimit)
					src.RushLimitz=0
			if(src.RaiArmor==2)
				M.DamageProc(rand(125,130),"Health",src)
				spawn() Blood(Mlocation)
				spawn() Blood(Mlocation)
			else if(M.RaiArmor)
				src.StunAdd(10);src.Death(M)
			if(!M.Guarding)
				if(M.Stun<=0)
					M.StunAdd(rand(0,1))
				flick("hit",M)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(src.GateIn=="Limit"|src.GateIn=="View")
				if(prob(50)&&M)
					M.dir=src.dir;step(M,M.dir);step(M,M.dir);step(M,M.dir)
			M.Stun=0;flick("Rasenganhit",M);step(M,src.dir);step(M,src.dir);sleep(1);step(M,src.dir);step(M,src.dir)
			if(M.client)
				if(src.TypeLearning=="Taijutsu")
					src.exp+=rand(10,20)
					if(src.Subscriber)
						src.exp+=rand(5,10)
			M.Death(src);return
/////////////////////////////////////////////////////////////
//Weapons
/////////////////////////////////////////////////////////////
mob/proc
	KunaiHit(mob/M)
		if(prob(1))
			src.KunaiMastery+=pick(0.1,0.2)
		var/damage=M.maxhealth*(0.01+(src.KunaiMastery*0.0005))
		if(damage>M.maxhealth*0.03)
			damage=M.maxhealth*0.03
		if(!M)
			return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0,volume=40);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
		if(M.ingat)
			src<<output("[M] espiral jogou pra longe","Attack");M<<output("Seu espiral jogou [src] para longe!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.health-=src.maxhealth*0.01;M.RushLimitz=0
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas...","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack");M<<output("Sua rotação jogou [src] para tras!","Attack");step(M,src.dir);sleep(1);step(M,src.dir);src.health-=rand(1,damage);M.RushLimitz=0;src.Death(M)
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			return
		else
			M<<output("[src] Cortou você com a Kunai!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack")
				M<<output("Você deu um Acerto Crítico!","Attack")
				M.DamageProc(damage,"Health",src)

			viewers()<<sound('SFX/Slice.wav',0,volume=35)
			src<<output("Você corta [M]!","Attack")
			spawn()Blood(M.x,M.y,M.z)
			if(M.RaiArmor)
				src.StunAdd(10);src.Death(M)
			M.DamageProc(damage,"Health",src)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			M.Death(src)
			return
mob/proc
	ClawsHit(mob/M,Damage,Type,Power)
		var/doodat=(src.Reflex*3)+1/(M.Reflex+1)
		Damage=Damage*0.01                      // Percentile Damage Var of the Weapon
		var/damage=M.maxhealth*(Damage+doodat) //Add that into one percentile and find the amount of health to take.
		damage=damage*((Power/2)*0.1)         //Factor in the Strength put into the slash. Charge for 2 seconds to do 100% damage.
		if(damage>M.maxhealth*Damage)
			damage=M.maxhealth*Damage
		if(src.CE)
			damage=damage*1.15
		var/ArmorAddUpForM=0
		for(var/obj/Clothes/Headband/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUArmor/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUHandGuards/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		if(prob(ArmorAddUpForM))
			viewers()<<sound('SFX/SwordClash.wav',0,volume=40);return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0,volume=40);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas..","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack")
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(rand(1,damage),"Health",M)
			return
		if(M.ingat)
			src<<"[M] espiral joga você para longe!";M<<"Sua espiral joga [src] para longe!"
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(src.maxhealth*0.01,"Health",M)
			return
		else
			if(M.KagDance=="Karamatsu"&&prob(M.DanceMastery+(M.BoneMastery/2)))
				viewers(M,7)<<sound('SFX/SwordClash.wav',0,volume=25)
				M<<output("Você bloquiou [src] ataque com seu Karamatsu!","Attack");M.chakra-=rand(10,15)
				src<<output("Seu ataque foi bloquiado!","Attack")
				return
			M<<output("[src] Cortou Você!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack");M<<output("You were critically hit!","Attack")
				spawn()M.Bloody();M.DamageProc(damage,"Health",src)
				if(src.PoisonOn)
					M.Poisoned()
					src<<"Você conseguiu acertar [M] com sua arma. O veneno esta saindo de sua corrente sanguínea .."
					src.PoisonOn=0
			src<<output("Você cortou [M]!","Attack")
			viewers()<<sound('SFX/Slice.wav',0,volume=25)
			if(M.RaiArmor)
				src.StunAdd(10);src.Death(M)
			if(Type=="Chakra")
				M.chakra-=rand(100,200)
			spawn()M.Bloody()
			src.BuffetGain=0
			if(src.PoisonOn)
				M.Poisoned()
				src<<"Você conseguiu acertar [M] com sua arma. O veneno esta saindo de sua corrente sanguínea.."
				src.PoisonOn=0
			M.DamageProc(damage,"Health",src)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			return
mob/proc
	NunchukHit(mob/M,Damage,Type,Power)
		var/A=src.tai*rand(69,80) //was originally (5,15)
		var/damage=A
//		var/RushLimit = round(src.Rush/3)
//		var/DamagePlus=rand(50,80)
		damage=damage/(M.Endurance+1)
		damage=damage+(damage*((Power*0.15)))

		if(M.NenkinOn)
			viewers()<<sound('SFX/Guard.wav',0,volume=29);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0,volume=29);return
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas..","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=35);return
			return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack")
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(rand(1,damage),"Health",M)
			return
		if(M.ingat)
			src<<"[M] espiral joga você para longe!";M<<"Sua espiral joga [src] para longe!"
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(src.maxhealth*0.01,"Health",M)
			return
		else
			if(M.KagDance=="Karamatsu"&&prob(M.DanceMastery+(M.BoneMastery/2)))
				M<<output("Você bloquiou [src] ataque com seu Karamatsu!","Attack");M.chakra-=rand(10,15)
				src<<output("Seu ataque foi bloquiado!","Attack")
				return
			if(M.DotonArmor)
				src<<output("Você tenta atacar [M], mas as rochas ao redor de seu corpo faz você parar de ataca-lo!","Attack");M<<output("Você bloqueia [src] ataque, graças às rochas em torno de seu corpo.","Attack");return
			M<<output("[src] Acerta você com o Nunchaku!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack");M<<output("Você deu um Acerto Crítico!","Attack")
				M.DamageProc(damage,"Stamina",src)
			src<<output("Você acerta [M]!","Attack")
			viewers()<<sound('SFX/HitWeak.wav',0,volume=30)
			if(M.RaiArmor)
				src.StunAdd(10);src.Death(M)
			M.DamageProc(damage,"Stamina",src)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(prob(src.TaijutsuMastery*2)) M.StunAdd(1)
			return


mob/proc
	StaveHit(mob/M,Damage,Type,Power,Cap)
		var/damage=src.tai*Damage
		damage*=((src.Bojutsu+1)*0.01)
		damage/=(M.Endurance+1)
		damage*=((Power)*0.1)
		if(damage>Cap)
			damage=Cap
		if(damage>500)
			damage=500
		src.StaminaDrain(damage/(10+(src.Bojutsu/10)))
		if(M.NenkinOn)
			viewers()<<sound('SFX/Guard.wav',0,volume=50);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0,volume=40);return
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas..","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=45);return
			return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack");M<<output("Sua rotação jogou [src] para tras!","Attack")
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(rand(1,damage),"Health",M)
			return
		if(M.ingat)
			src<<"[M] espiral joga você para longe!";M<<"Sua espiral joga [src] para longe!"
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(src.maxhealth*0.01,"Health",M)
			return
		if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*1.5))
			if(M.LeftHandSheath||M.RightHandSheath)
				M<<output("Suas armas desviam uns dos outros!","Attack");src<<output("Suas armas desviam uns dos outros!","Attack");viewers()<<sound('SFX/SwordClash.wav',0,volume=45);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(prob(1)&&M.DeflectionZ<5)
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else if(M.Deflection||M.WeaponMaster>=6&&M.LeftHandSheath||M.WeaponMaster>=6&&M.RightHandSheath)
			if(M.dir!=src.dir&&src.dir!=turn(M.dir,45)&&src.dir!=turn(M.dir,-45))
				M<<output("Suas armas desviam uns dos outros!","Attack");src<<output("Suas armas desviam uns dos outros!","Attack");viewers()<<sound('SFX/SwordClash.wav',0,volume=45);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(prob(1)&&M.DeflectionZ<5)
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else
			if(M.KagDance=="Karamatsu"&&prob(M.DanceMastery+(M.BoneMastery/2)))
				M<<output("Você bloquiou [src] ataque com seu Karamatsu!","Attack");M.chakra-=rand(10,15)
				src<<output("Seu ataque foi bloquiado!","Attack")
				return
			if(M.DotonArmor)
				src<<output("Você tenta golpear [M] mas as rochas em volta do corpo bloqueiam seu ataque!","Attack");M<<output("Você bloqueia os ataques de [src] por causa das pedras em volta a você.","Attack");return
			M<<output("[src] bate com o Bastão em você mas não surge efeito!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack");M<<output("Você deu um Acerto Crítico!","Attack")
				M.DamageProc(damage,"Stamina",src)
			src<<output("You hit [M]!","Attack")
			viewers()<<sound('SFX/HitStrong.wav',0,volume=45)
			if(M.RaiArmor)
				src.StunAdd(10);src.health-=50;src.Death(M)
			var/AddOnDamage=(src.SlashStrength*10)
			if(src.SlashStrength>10)
				var/Additional=(src.SlashStrength-10)
				AddOnDamage=100+round(Additional*5)
			damage+=AddOnDamage
			if(prob(7.75*(src.HeavySlam+1)))
				damage+=500+(src.HeavySlam*200)
				M.Running=0
				src<<output("Você conseguiu um grande estrondo em [M] tirando [damage] de dano!","Attack");M<<output("[src] te acertou com um estrondo tirando [damage] de dano!","Attack")
			M.DamageProc(damage,"Stamina",src)
			var/random=0.06
			if(M.client)
				random*=10
			random*=((src.deathcount+M.deathcount)*2) //Using a Bo in an intense and close fighth = higher gain rates.
			if(M.resting||M.knockedout||M.Dead)
				random=0
			if(random>4)
				random=4
			if(prob(random))
				var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
				src.overlays+=I
				spawn(15)
					src.overlays-=I
				src.Bojutsu+=0.1
				if(src.Bojutsu>=115)
					src.Bojutsu=115
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(Damage>500||src.GateIn=="View"||src.GateIn=="Limit"||src.BubunBaika||Power>25)
				spawn()BangAttackEfx(M.x,M.y,M.z)
				M.Stun=0
				spawn() M.HitBack(5,src.dir)
				if(src.BubunBaika)
					M.HitBack(4,src.dir)
					M.stamina-=250
			return

mob/proc
	SliceHit(mob/M,Damage,Type,Power,SizeRating,ReflexDecreaser=0,StunChance=0,CriticalChance=0,PuppetPoison=0)
		//var/KaitoChance=0
//		var/obj/WEAPONS/LULU = usr.WeaponInLeftHand
//		var/obj/WEAPONS/LELE = usr.WeaponInRightHand
		var/PoisonedBlades=0
		if(PuppetPoison)
			PoisonedBlades=1
		var/doodat=(src.Kenjutsu/20)
		if(doodat>5&&SizeRating==2)
			doodat=5
		else if(doodat>2.5&&SizeRating==1)
			doodat=3
		if(doodat<1)
			doodat=1
		//////////////////////////////////////////////////////
		var/Xaa=src.BuffetGain*0.01			//Yotsuki Passive
		doodat*=(0.01+Xaa)                 //Reflex Bonus Damage + Bonus Damage for Yotsuki Passive
		Damage*=0.01                      // Percentile Damage Var of the Weapon
		var/damage=1
		//////////////////////////////////////////////////////
		if(SizeRating==1)
			damage=M.maxhealth*(Damage+(doodat*2)) //Less Kenjutsu (doodat) required to achieve maximum damage
			damage*=((Power/2)*0.1)         //Factor in the Strength put into the slash. Charge for 2 seconds to do 100% damage.
			if(damage>=225)
				damage=225
		if(SizeRating==2)
			damage=M.maxhealth*(Damage+doodat*1.3)
			damage*=((Power/1.5)*0.1)
			if(damage>=550)
				damage=550
		if(SizeRating==3)
			damage=(src.tai) //Example: 30 points Phys = 90 Mtai
			damage*=0.0001 // 90 tai * 0.0001 = 0.009
			damage*=((Power)) // 0.0009 * 25 (full charge) = 0.225 = 22.5%
			damage*=(src.Kenjutsu/100) // 0.225 * (50/100) Kenjutsu = 0.1125 = 11.25% damage
			damage*=M.maxhealth // 1500 max health * 0.1125 = 168.75
			damage=round(damage) // Rounded, 168.75 becomes 169 vitality damage for a full charge slash with only 50 Kenjutsu.
								//This is where the formula ends unless it really is a full charge
			if(Power>20)
				damage*=round((Power/(20-round(src.Kenjutsu/10)))) //169 * (25/(20-(50/10))) = 169 * 25/15 = 281.66667 = 282
			else
				damage+=Damage*100 //returns the "Damage" variable we started with to its original numeric value for a small damage add on, regardless of charge.
		if(damage>750)
			damage=750
		if(M.dir==src.dir)
			damage*=1.25
		src.StaminaDrain(damage/(10+round(src.Kenjutsu/20)))
		damage += 0.02*(src.WeaponMaster)
		if(SizeRating!=3)
			var/ArmorAddUpForM=0
			for(var/obj/Clothes/A in M.contents)
				if(A.worn)
					ArmorAddUpForM+=A.ArmorAddOn
			if(prob(ArmorAddUpForM*(M.reflexNew-1))&&src.dir!=M.dir)
				viewers()<<sound('SFX/SwordClash.wav',0,volume=45);return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0,volume=35);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0,volume=20);return
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas..","Attack")
			viewers()<<sound('SFX/Guard.wav',0,volume=25);return
			return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack");M<<output("Sua rotação jogou [src] para tras!","Attack")
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(rand(1,damage),"Health",M)
			return
		if(M.ingat)
			src<<"[M] espiral joga você para longe!";M<<"Sua espiral joga [src] para longe!"
			step(src,M.dir);sleep(1);step(src,M.dir)
			src.DamageProc(src.maxhealth*0.01,"Health",M)
			return
		if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*1.5))
			if(M.LeftHandSheath||M.RightHandSheath)
				if(prob(100-ReflexDecreaser))
					M<<output("Suas armas desviam uns dos outros!","Attack");src<<output("Suas armas desviam uns dos outros!","Attack");viewers()<<sound('SFX/SwordClash.wav',0,volume=40);M.Deflection=0;src.Deflection=0
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
					if(SizeRating==3&&Power>20)
						M.HitBack(5,get_dir(src,M))
					if(prob(1)&&M.DeflectionZ<5)
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					return
				else
					M<<output("Você tentou desviar de [src]'s espada, mas não consegue!")
		else if(M.Deflection||M.WeaponMaster>=6&&M.LeftHandSheath||M.WeaponMaster>=6&&M.RightHandSheath)
			if(M.dir!=src.dir&&src.dir!=turn(M.dir,45)&&src.dir!=turn(M.dir,-45))
				if(prob(100-ReflexDecreaser))
					M<<output("Suas armas desviam uns dos outros!","Attack");src<<output("Suas armas desviam uns dos outros!","Attack");viewers()<<sound('SFX/SwordClash.wav',0,volume=40);M.Deflection=0;src.Deflection=0
					spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
					if(SizeRating==3&&Power>20)
						M.HitBack(5,get_dir(src,M))
					if(prob(1)&&M.DeflectionZ<5)
						M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
					return
				else
					M<<output("Você tentou desviar de [src]'s espada, mas não consegue!")
		else
			if(M.KagDance=="Karamatsu"&&prob(M.DanceMastery+(M.BoneMastery/2)))
				if(prob(100-ReflexDecreaser))
					viewers(M,7)<<sound('SFX/SwordClash.wav',0,volume=45)
					M<<output("Você bloquiou [src] ataque com seu Karamatsu!","Attack");M.chakra-=rand(10,15)
					src<<output("Seu ataque foi bloquiado!","Attack")
					return
				else
					M<<output("[src]'s espada rompeu suas defesas!")
			if(M.DotonArmor)
				src<<output("Você tenta golpear [M] mas as rochas ao redor de seu corpo empede seu ataque!","Attack");M<<output("Você bloqueia [src]'s ataque por causa das rochas em torno de você.","Attack");return
			SwordEfx(src.x,src.y,src.z,src.dir)
			var/Probability=(src.Focus+1)/(M.Buff+1)
			Probability+=CriticalChance
			if(prob(Probability))
				if(M.Clan!="Kaguya"&&M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&M.calories<=1000)
					src<<output("Acerto Crítico!","Attack");M<<output("Acerto Crítico!","Attack")
					spawn()M.Bloody()
					if(SizeRating==1||SizeRating==3)
						src<<output("O acerto critico tirou [damage*1.5] de dano!","Attack");M<<output("O acerto critico tirou [damage*1.5] de dano!","Attack")
						damage*=1.5
					if(SizeRating==2)
						src<<output("O acerto critico tirou [damage*2] de dano!","Attack");M<<output("O acerto critico tirou [damage*2] de dano!","Attack")
						damage*=2
			M<<output("[src] Corta você tirando [damage] de dano!","Attack")
			src<<output("Você corta [M] tirando [damage] de dano!","Attack")
			if(SizeRating==1)
				viewers()<<sound('SFX/Slice.wav',0,volume=30)
			if(SizeRating==2)
				viewers()<<sound('SFX/Slice.wav',0,volume=45)
			if(SizeRating==3)
				viewers()<<sound('SFX/Slice.wav',0,volume=60)
			if(M.RaiArmor)
				src.StunAdd(10);src.DamageProc(50,"Health",M)
			if(Type=="Chakra")
				M.chakra-=rand(50,150)
			spawn()M.Bloody()
			src.BuffetGain=0
			var/AddOnDamage=(src.SlashStrength*10)
			if(src.SlashStrength>10)
				var/Additional=(src.SlashStrength-10)
				AddOnDamage=100+round(Additional*3.33)
			if(SizeRating==1)
				AddOnDamage/=2
			if(SizeRating==2)
				AddOnDamage/=1.5
			damage+=AddOnDamage
			if(damage>750)
				damage=750
			if(src.CE)
				damage=(damage*1.15)
			if(prob(StunChance*2))//was just Stun Chance
				M.StunAdd(3)
				if(SizeRating>=2)
					M.StunAdd(rand(7,10))
			spawn()
				M.DamageProc(damage,"Health",src)
			if(src.key=="CobraT1337")
				src<<"Damage Was [damage]"
			if(prob(src.Gash*2.2)&&M.Status!="Gashed")
				if(M.knockedout)
					return
				src<<output("You managed to cause a deep gash on [M].","Attack");M<<output("[src]'s slash managed to cause a deep gash on your body..","Attack")
				M.Status="Gashed"
	//			if(M.client)
	//				M.client.screen+=new/obj/ReleaseThingyAilment/Bleed
				M.StatusEffected=(src.Gash*2.2)+rand(5,10)
				if(!(locate(/obj/ReleaseThingyAilment/Bleed) in M.client.screen))
					var/obj/ReleaseThingyAilment/Bleed/P = new()
					P.HowLong=src.StatusEffected
					if(M.client)
						M.client.screen+=P
			if(prob(45)&&PoisonedBlades&&M.Status!="Puppet's Poison")
				if(M.knockedout)
					return
				M.Status="Puppet's Poison"
				M.StatusEffected=35
				if(istype(src,/mob/Puppet/Talon/))
					src.Owner<<"You poisoned [M] with your Puppet's Blades!"
				M<<output("<font color=#4E004E>[src]'s blades had a deadly poison on them and it begins to seep through your veins...</font>","Attack")

			if(src.PoisonOn)
				M.Poisoned()
				src<<"You managed to hit [M] with your weapon. The poison soothing into their bloodstream.."
				src.PoisonOn=0
			if(prob(src.VitalSlash*0.5))
				M.DamageProc(500,"Health",src)
				src<<output("CRITICAL HIT! You slashed [M]'s organs!","Attack");M<<output("CRTICAL HIT! Your organs were slashed by [src]!","Attack")
			if(SizeRating==3)
				spawn() M.DamageProc(damage,"Stamina",src)
			var/random=0.08
			if(M.client)
				random*=10
			random*=((src.deathcount+M.deathcount)*2) //Using a sword in an intense and close fighth = higher gain rates.
			if(random>=4)
				random=4
			if(src.Clan=="Yotsuki")
				random*=5
			if(prob(random))
				var/image/I = new('Icons/Jutsus/Skillcards.dmi');I.pixel_y=32;I.layer=6;I.icon_state="SwiftYes"
				src<<I
				spawn(15)
					del(I)
				src.Kenjutsu+=pick(0.07,0.1,0.12)
				if(src.Clan!="Yotsuki"&&src.Kenjutsu>100)
					src.Kenjutsu=100
				else if(src.Clan=="Yotsuki"&&src.Kenjutsu>125)
					src.Kenjutsu=125
			M.RushLimitz=0
			if(M&&M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			return
mob/proc
	SamehadeNew(mob/M,Power)

		var/damage=(src.tai*2)/(M.tai)
		damage=damage*((Power))
		if(damage>125) damage=125
		if(src.QuickThingTarget)
			if(prob(50))
				src.AttackFirstTalkLater+=1;if(src.AttackFirstTalkLater>10) src.AttackFirstTalkLater=10
			src.QuickThingTarget=0
			damage=damage+src.AttackFirstTalkLater*5
		if(prob(10))
			src.SamehadeAbsorbtion+=pick(0.1,0.5)
			if(src.SamehadeAbsorbtion>3)
				src.SamehadeAbsorbtion=3
		if(!M)
			return
		if(!M.client)
			return
		var/Mlocation=locate(M.x,M.y,M.z)
		if(src.Clan!="Hoshigaki")
			src.health-=damage
			spawn()Blood(src.x,src.y,src.z);viewers()<<sound('SFX/Slice.wav',0)
			src<<"The Samehade rejects you!"
			return
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas..","Attack")
			viewers()<<sound('SFX/Guard.wav',0);return
			return
		var/ArmorAddUpForM=0
		for(var/obj/Clothes/Headband/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUArmor/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUHandGuards/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		if(prob(ArmorAddUpForM))
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0);return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack");M<<output("Sua rotação jogou [src] para tras!","Attack")
			step(M,src.dir);sleep(1);step(M,src.dir)
			src.health -= rand(1,damage)
			src.Death(M)
			return
		if(M.ingat)
			src<<"[M] espiral joga você para longe!";M<<"Sua espiral joga [src] para longe!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health-=src.maxhealth*0.01
			src.Death(M)
			return
		if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*1.5))
			if(M.LeftHandSheath||M.RightHandSheath)
				M<<output("Suas armas desviam uns dos outros!","Attack");src<<output("Suas armas desviam uns dos outros!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(Power>20)
					M.HitBack(5,get_dir(src,M))
				if(prob(1)&&M.DeflectionZ<5)
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else if(M.Deflection||M.WeaponMaster>6&&M.LeftHandSheath||M.WeaponMaster>6&&M.RightHandSheath)
			if(M.dir!=src.dir&&src.dir!=turn(M.dir,45)&&src.dir!=turn(M.dir,-45))
				M<<output("Suas armas desviam uns dos outros!","Attack");src<<output("Suas armas desviam uns dos outros!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(Power>20)
					M.HitBack(5,get_dir(src,M))
				if(prob(1)&&M.DeflectionZ<5)
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else
			if(M.KagDance=="Karamatsu"&&prob(M.DanceMastery+(M.BoneMastery/2)))
				viewers(M,7)<<sound('SFX/SwordClash.wav',0)
				M<<output("Você bloquiou [src] ataque com seu Karamatsu!","Attack");M.chakra-=rand(10,15)
				src<<output("Your attack was blocked!","Attack")
				return
			M<<output("[src] shaves you with the Samehade!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack")
				M<<output("Acerto Crítico!","Attack")
				spawn()
					Blood(Mlocation);
					if(M) M.DamageProc(damage,"Health",src)
			if(!M){return}
			src<<output("You shaved with the Samehade!","Attack")
			spawn()
				Blood(Mlocation);viewers()<<sound('SFX/Slice.wav',0);M.DamageProc(damage,"Health",src);sleep(1)
			spawn(1)
				Blood(Mlocation);viewers()<<sound('SFX/Slice.wav',0);M.DamageProc(damage,"Health",src)
			sleep(1)
			if(M.RaiArmor)
				src.StunAdd(1);src.Death(M)
			if(prob(50)&&M)
				spawn()Blood(Mlocation);viewers()<<sound('SFX/Slice.wav',0);M.DamageProc(damage,"Health",src)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(Power>5)
				if(Power>10)
					Power=10
				M.dir=src.dir
				M.HitBack(Power,src.dir)
				M.stamina-=(Power*10)
			M.Death(src)
			return





mob/proc
	OriginalSamehade(mob/M,Power)

		var/damage=(src.tai*6)/(M.tai*3)
		damage=damage*((Power)*1.25)
		if(damage>800) damage=800
	//	if(src.QuickThingTarget)
	//		if(prob(50))
	//			src.AttackFirstTalkLater+=1;if(src.AttackFirstTalkLater>10) src.AttackFirstTalkLater=10
	//		src.QuickThingTarget=0
		damage=damage+((src.AttackFirstTalkLater*5)+1)
	//	if(prob(10))
	//		src.SamehadeAbsorbtion+=pick(0.1,0.5)
	//		if(src.SamehadeAbsorbtion>3)
	//			src.SamehadeAbsorbtion=3
		if(!M)
			return
		var/Mlocation=locate(M.x,M.y,M.z)
	//	if(src.Clan!="Hoshigaki")
	//		src.health-=damage
	//		spawn()Blood(src.x,src.y,src.z);viewers()<<sound('SFX/Slice.wav',0)
	//		src<<"The Samehade rejects you!"
	//		return
		if(M.FrozenBind=="DoBind")
			src<<output("Sua arma salta inofensivamente para fora das rochas...","Attack");M<<output("[src] arma salta inofensivamente para fora das rochas..","Attack")
			viewers()<<sound('SFX/Guard.wav',0);return
			return
		var/ArmorAddUpForM=0
		for(var/obj/Clothes/Headband/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUArmor/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUHandGuards/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		if(prob(ArmorAddUpForM))
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0);return
		if(M.Kaiten)
			src<<output("[M] rotação joga tudo para tras!","Attack");M<<output("Sua rotação jogou [src] para tras!","Attack")
			step(M,src.dir);sleep(1);step(M,src.dir)
			src.health -= rand(1,damage)
			src.Death(M)
			return
		if(M.ingat)
			src<<"[M] espiral joga você para longe!";M<<"Sua espiral joga [src] para longe!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health-=src.maxhealth*0.01
			src.Death(M)
			return
		if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*1.5))
			if(M.LeftHandSheath||M.RightHandSheath)
				M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(Power>20)
					M.HitBack(5,get_dir(src,M))
				if(prob(1)&&M.DeflectionZ<5)
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else if(M.Deflection||M.WeaponMaster>6&&M.LeftHandSheath||M.WeaponMaster>6&&M.RightHandSheath)
			if(M.dir!=src.dir&&src.dir!=turn(M.dir,45)&&src.dir!=turn(M.dir,-45))
				M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(Power>20)
					M.HitBack(5,get_dir(src,M))
				if(prob(1)&&M.DeflectionZ<5)
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else
			if(M.KagDance=="Karamatsu"&&prob(M.DanceMastery+(M.BoneMastery/3)))
				viewers(M,7)<<sound('SFX/SwordClash.wav',0)
				M<<output("Você bloquiou [src] ataque com seu Karamatsu!","Attack");M.chakra-=rand(10,15)
				src<<output("Your attack was blocked!","Attack")
				return
			M<<output("[src] shaves you with the Samehade!","Attack")
			M.Bloody()
			src<<"Your Samehade is getting hungry..."
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Acerto Crítico!","Attack")
				M<<output("Acerto Crítico!","Attack")
				spawn()
					Blood(Mlocation);
					if(M) M.DamageProc(damage,"Health",src)
			if(!M){return}
			src<<output("You shaved with the Samehade!","Attack")
			spawn()Blood(Mlocation);viewers()<<sound('SFX/Slice.wav',0);M.DamageProc(damage,"Health",src);sleep(1)
			spawn(1)Blood(Mlocation);viewers()<<sound('SFX/Slice.wav',0);M.DamageProc(damage,"Health",src)
			if(prob(60))
				M<<"You feel your chakra levels weaken severely."
				M.chakra-=500
			sleep(1)
			if(M.RaiArmor)
				src.StunAdd(1);src.Death(M)
			if(prob(50)&&M)
				spawn()Blood(Mlocation);viewers()<<sound('SFX/Slice.wav',0);M.DamageProc(damage,"Health",src)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			if(Power>5)
				if(Power>13)
					Power=13
				M.dir=src.dir
				M.HitBack(Power,src.dir)
				M.stamina-=(Power*12)
			M.Death(src)
			return

mob/proc
	Mammoth(mob/M,Power)

		var/damage=(src.tai*4)/(M.tai)
		damage=damage*((Power*1.75))
		if(damage>800) damage=800
		if(src.QuickThingTarget)
			if(prob(50))
				src.SwordLevel+=1;if(src.SwordLevel>10) src.SwordLevel=10
			src.QuickThingTarget=0
			damage=damage+SwordLevel*5
	//	if(prob(10))
		//	src.SamehadeAbsorbtion+=pick(0.1,0.5)
	//		if(src.SamehadeAbsorbtion>3)
	//			src.SamehadeAbsorbtion=3
		if(!M)
			return

mob/proc
	EvanesenceNew(mob/M,Power)

		var/damage=(750)/(M.tai)
		damage=damage*((Power/2))
		damage+=200
		if(damage>600) damage=600
//		if(src.QuickThingTarget)
//			if(prob(50))
//				src.SwordLevel+=1;if(src.SwordLevel>10) src.SwordLevel=10
//			src.QuickThingTarget=0
//			damage=damage+SwordLevel*5
	//	if(prob(10))
		//	src.SamehadeAbsorbtion+=pick(0.1,0.5)
	//		if(src.SamehadeAbsorbtion>3)
	//			src.SamehadeAbsorbtion=3
		if(!M)
			return
/////////////////////////////////////////////////////////////
//Strikes Procs And Other Attacks Placed Here
/////////////////////////////////////////////////////////////
//Chidori
mob/proc
	ChidoriA(mob/M)
		if(!M)
			return
		var/damage=src.ChidoriD*(src.runningspeed/3)
		if(M.Kaiten)
			view() << "<i><font size = 2>[src] tenta defender [M]'s Mas a sua defesa falhou!</font></i>"
			return
		if(M.sphere)
			view() << "<i><font size = 2>[src] tenta defender [M]'s mas a sua defesa foi desfeita!</font></i>"
			M.FrozenBind="";M.firing=0;M.sphere=0;M.usingS=0
			M.overlays -= /obj/Jutsu/Sand/Sphere
		if(M.RaiArmor)
			src<<output("[M] Absorve a Energia!","Attack");M<<output("[M] Absorve a Energia!","Attack");src.overlays-='Icons/Jutsus/Chidori.dmi';src.ChidoriD=0;src.Chidorion=0;src.Raikirion=0;src.Normal();return
		if(src.Chidorion)
			if(damage>800&&src.runningspeed<=15)
				damage=800
		if(src.Raikirion)
			if(damage>1500)
				damage=1500
		if(src.Raikirion)
			view()<<"<i><font size = 2>[src] hit [M] with their Raikiri for [damage] damage!</font></i>"
		else
			view()<<"<i><font size = 2>[src] hit [M] with their Chidori for [damage] damage!</font></i>"
		M.DamageProc(damage,"Health",src)
		M.Bloody();viewers()<<sound('SFX/Slice.wav',0)
		src.overlays-='Icons/Jutsus/Chidori.dmi'
		src.ChidoriD=0;damage=0
		src.Chidorion=0;src.Raikirion=0;src.firing=0
		src.Normal()
		return
//Zankuuha Sphere
mob/proc
	ZankuuSphere(mob/M)
		if(!M)
			return
		var/damage=src.ZankuuSphere
		src.ZankuuSphere=0
		if(M.sphere)
			view() << "<i><font size = 2>[src] has pierced through [M]'s defence!</font></i>"
			M.FrozenBind="";M.firing=0;M.sphere=0;M.usingS=0
			M.overlays -= /obj/Jutsu/Sand/Sphere
		M<<output("You feel your insides ripping up!","Attack")
		var/A=src.dir
		while(damage>=1)
			M.dir=rand(1,8)
			M.StunAdd(1)
			if(M.Stun>5)
				M.Stun=5
			M.DamageProc(M.maxhealth*0.005,"Health",src)
			M.Bloody()
			if(M.knockedout)
				damage=0
			damage--
			sleep(1)
		src.Stun=0
		walk(M,A,0)
		spawn(15)
			walk(M,0)
		src.ZankuuSphere=0
//Rasengan
mob/proc
	RasenganA(mob/M)
		if(!M)
			return
		var/damage=src.RasenganD*rand((src.ChakraC+src.GenSkill+src.NinSkill),round((src.ChakraC+src.GenSkill+src.NinSkill)*1.4))
		if(src.DRasenganCounter==0)
			src.Rasenganon=0
		if(src.DRasenganCounter==1)
			src.overlays-='Icons/Jutsus/Rasengan2.dmi'
		if(M.sphere)
			view() << "<i><font size = 2>[src] has pierced through [M]'s defence!</font></i>"
			M.FrozenBind="";M.firing=0;M.sphere=0;M.usingS=0
			M.overlays -= /obj/Jutsu/Sand/Sphere
		damage=(damage/M.Endurance)
		if(damage>5000)
			damage=5000
		if(src.RasenganType==0.5||src.RasenganType==1.5)
			damage=damage*2

		view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage] damage!</font></i>"
		M.adir=src.dir
		if(src.RasenganType==0||src.RasenganType==50)
			var/image/I = image('Icons/Jutsus/Rasengan.dmi',M,"overlay")
			for(var/mob/P in range(10,M))
				P << I
				spawn(25) del(I)
		if(src.RasenganType==100)
			M.DamageProc(200+src.NinSkill,"Health",src)
			M.Status="Burn"
			M.StatusEffected=rand(15,20)
			var/image/O = image('Icons/Jutsus/KatonRasengan.dmi',M,"overlay")
			for(var/mob/X in range(10,M))
				X << O
				spawn(25) del(O)
		if(src.RasenganType==300)
			M.DamageProc(1400+src.NinSkill,"Health",src)
			M.Status=""
			M.StatusEffected=rand(15,20)
			var/image/O = image('Icons/Jutsus/RasenshurikenEX.dmi',M,"overlay")
			for(var/mob/X in range(10,M))
				X << O
				spawn(25) del(O)
		if(src.RasenganType==200)
			M.DamageProc(450+src.NinSkill,"Health",src)
			M.Status=""
			var/image/A = image('Icons/Jutsus/FuutonRasengan.dmi',M,"overlay")
			for(var/mob/L in range(10,M))
				L << A
				spawn(25) del(A)
		M.Stun=0
		spawn()
			M.DamageProc(damage/100,"Stamina",src)
			if(src.RasenganType==200||src.RasenganType==300)
				M.Bloody()
		spawn()
			M.DamageProc(damage/100,"Stamina",src)
			if(src.RasenganType==200||src.RasenganType==300)
				M.Bloody()
		spawn()
			M.DamageProc(damage/100,"Stamina",src)
			if(src.RasenganType==200||src.RasenganType==300)
				M.Bloody()
		spawn()
			M.DamageProc(damage/100,"Stamina",src)
			if(src.RasenganType==200||src.RasenganType==300)
				M.Bloody()
		M.Running=1
		M.icon_state = "rasenganhit";M.HitBack(rand(10,20),src.dir)
		src.overlays-='Icons/Jutsus/Rasengan2.dmi'
		src.overlays-='Icons/Jutsus/OdamaRasengan.dmi'
		src.overlays-='Icons/Jutsus/KatonRasengan.dmi'
		src.overlays-='Icons/Jutsus/FuutonRasengan.dmi'
		src.overlays-='Icons/Jutsus/Rasengan5.dmi'
		src.overlays-='Icons/Jutsus/Rasengan6.dmi'
		if(src.DRasenganCounter==0)
			src.overlays-='Icons/Jutsus/Rasengan4.dmi'

		M.DamageProc(damage,"Stamina",src)
		var/DamageCheck=0
		DamageCheck=damage
		damage=0
		if(src.DRasenganCounter==0)
			src.Rasenganon=0
		src.firing=0
		spawn(25)
			var/random=rand(1,5)
			if(random<=2&&!M.knockedout&&DamageCheck>2000)
				viewers(M)<<"The rasengan did extensive damage to [M]!"
				M.deathcount++
				damage=rand(300,500)
				M.DamageProc(damage,"Health",src)
				damage=0
				DamageCheck=0
		if(src.DRasenganCounter==0)
			src.RasenganD=0
		return
//Chakra No Mesu
mob/proc
	ChakraMesu(mob/M)
		if(!M)
			return
		var/Mlocation=locate(M.x,M.y,M.z)
		var/damage=rand(1,80)*0.001
		damage=src.gen*damage
		damage=M.maxhealth*(damage*0.01)
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0);return
		if(M.Kaiten)
			src<<"[M]'s rotation shot you back!"
			M<<"Your rotation shot [src] back!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health -= rand(1,damage)
			src.Death(M)
			return
		if(M.ingat)
			src<<"[M]'s spiral shot you back!"
			M<<"Your spiral shot [src] back!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health -= src.maxhealth*0.01
			src.Death(M)
			return
		else
			M<<output("[src] slashes you with their scapels!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Critical Hit!","Attack")
				M<<output("You were critically hit!","Attack")
				M.DamageProc(damage*2,"Health",src)

			if(M.RaiArmor)
				src.StunAdd(10)
			src<<output("You slash [M] with your scapels!","Attack")
			viewers()<<sound('SFX/Slice.wav',0);spawn()Blood(Mlocation)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			M.DamageProc(damage,"Health",src)
			return
//Yanagi
mob/proc
	Yanagi(mob/M)
		if(!M)
			return
		var/ArmorAddUpForM=0
		for(var/obj/Clothes/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		if(prob(ArmorAddUpForM/2))
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0);return
		var/damage=M.maxhealth*(0.001*src.TaijutsuMastery)
		if(M.Kaiten)
			src<<"[M]'s rotation shot you back!"
			M<<"Your rotation shot [src] back!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health -= rand(1,damage)
			src.Death(M)
			return
		if(M.ingat)
			src<<"[M]'s spiral shot you back!"
			M<<"Your spiral shot [src] back!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health -= src.maxhealth*0.01
			src.Death(M)
			return
		if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*1.5))
			if(M.LeftHandSheath||M.RightHandSheath)
				M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(prob(1))
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else if(M.Deflection&&prob(40))
			M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
			spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
			if(prob(1))
				M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
			return
		else
			if(prob(2))
				src.DanceMastery+=pick(0.1,0.2)
			M<<output("[src] slashes you with their bone swords!","Attack")
			if(prob((src.Focus+1)/(M.Buff+1))*10)
				if(M.Clan!="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Critical Hit!","Attack")
				M<<output("You were critically hit!","Attack")
				M.Bloody()
				M.DamageProc(damage,"Health",src)
			src.ExpGain(M,damage)
			if(M.RaiArmor)
				src.StunAdd(10)
			src<<output("You slash [M]!","Attack")
			M.Bloody()
			viewers()<<sound('SFX/Slice.wav',0)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			M.DamageProc(damage,"Health",src)
			return

//Karamatsu
mob/proc
	Kara(mob/M)
		if(!M)
			return
		var/Mlocation=locate(M.x,M.y,M.z)
		var/ArmorAddUpForM=0
		for(var/obj/Clothes/Headband/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUArmor/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		for(var/obj/Clothes/ANBUHandGuards/A in M.contents)
			if(A.worn)
				ArmorAddUpForM+=A.ArmorAddOn
		if(prob(ArmorAddUpForM))
			viewers()<<sound('SFX/SwordClash.wav',0);return
		if(M.NenkinOn)
			viewers()<<sound('SFX/SwordClash.wav',0);return
		var/damage=M.maxhealth*0.01
		if(M.sphere)
			viewers()<<sound('SFX/Guard.wav',0);return
		if(M.Kaiten)
			src<<"[M]'s rotation shot you back!"
			M<<"Your rotation shot [src] back!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health -= rand(1,damage)
			src.Death(M)
			return
		if(M.ingat)
			src<<"[M]'s spiral shot you back!"
			M<<"Your spiral shot [src] back!"
			step(M,src.dir)
			sleep(1)
			step(M,src.dir)
			src.health -= src.maxhealth*0.01
			src.Death(M)
			return
		if(M.Clan=="Yotsuki"&&prob((M.DeflectionZ+M.Buffet+M.Teamwork+M.SpeedDice)*1.5))
			if(M.LeftHandSheath||M.RightHandSheath)
				M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
				spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
				if(prob(1))
					M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
				return
		else if(M.Deflection||M.WeaponMaster>6&&M.LeftHandSheath||M.WeaponMaster>6&&M.RightHandSheath)
			M<<output("Your weapons deflect each other!","Attack");src<<output("Your weapons deflect each other!","Attack");viewers()<<sound('SFX/SwordClash.wav',0);M.Deflection=0;src.Deflection=0
			spawn() AttackEfx4(M.x,M.y,M.z,M.dir);AttackEfx4(src.x,src.y,src.z,src.dir)
			if(prob(1))
				M.DeflectionZ+=pick(0.1,0.3);if(M.DeflectionZ>5) M.DeflectionZ=5
			return
		else
			if(prob(2))
				src.DanceMastery+=pick(0.1,0.2)
			M<<output("[src] slashes you with their bones!","Attack")
			M.Deflection=1
			spawn(src.DanceMastery)
				M.Deflection=0
			if(prob(src.Focus*10))
				if(!M.Clan=="Kaguya"||M.AkimichiSpirit!=50||M.AkimichiSpirit==50&&!M.calories<=1000)
					src<<output("Critical Hit!","Attack")
				M<<output("You were critically hit!","Attack")
				M.DamageProc(damage,"Health",src)
			if(prob(src.DanceMastery/2))
				if(M.LeftHandSheath)
					M<<"[src] knocked the weapon in your left hand away from you (Sheathed)."
					M.LeftHandSheath=0
				if(M.RightHandSheath)
					M<<"[src] knocked the weapon in your right hand away from you (Sheathed)."
					M.RightHandSheath=0
			if(M.RaiArmor)
				src.StunAdd(10)
			src<<output("You attack [M] with Karamatsu No Mai!!","Attack")
			spawn()Blood(Mlocation)
			viewers()<<sound('SFX/Slice.wav',0)
			M.RushLimitz=0
			if(M.Buffet>=1)
				M.BuffetGain+=1;if(M.BuffetGain>round(M.Buffet)) M.BuffetGain=round(M.Buffet)
			src.dir=get_dir(src,M)
			M.DamageProc(damage,"Health",src)
			return
obj/ApexStaffExtension
	icon='Icons/New Base/Weapons/SageMonkeyBoStaff.dmi'
	icon_state="Extend"
	layer=4
	New()
		spawn(4)
			del(src)
mob/proc/ApexStaffExtend()
	flick("throw",src)
	for(var/turf/T in getline(src,get_steps(src,src.dir,3)))
		var/obj/ApexStaffExtension/A=new()
		A.loc=T;A.dir=src.dir
		var/turf/NewLoc=get_step(A,A.dir)
		for(var/mob/M in A.loc)
			if(M!=src)
				M.DamageProc(rand(100,200),"Stamina",src)
				for(var/i=3,i>0,i--)
					spawn()
						AttackEfx(M.x,M.y,M.z)
				if(NewLoc)
					M.HitBack(1,src.dir)
/*
mob/proc/GashSystem()
	var/tmp/Gashed=0
	if(Gashed<5)
		src.Bloody()
		src.health-=20
		Gashed+=1
		sleep(rand(20,40))
		if(src.knockedout)
			return
	if(src.knockedout)
		return
*/

mob/var/tmp/UsingBow=0
mob/var/BowTips=1
mob/proc/ArrowLaunch(ArrowSwift)
	var/ArrowSpeed=ArrowSwift
	if(ArrowSpeed>=4.5)
		ArrowSpeed=4.5
	var/obj/Jutsu/Spider/ArcherArrow/K=new();K.loc = locate(src.x,src.y,src.z)
	K.Move_Delay=(4.5-ArrowSpeed)
	if(K.Move_Delay<=0)
		K.Move_Delay=0
	K.ArrowStrength=(4.5-ArrowSpeed)
	K.dir = src.dir
	K.name="[src]"
	K.Owner=src
	walk(K,src.dir)
	spawn(10)
		src.UsingBow=0
//	world<<"This is the value of the Arrow's Move Delay. [K.Move_Delay]."
	return
//	src.chakra-=ChakraLoss
mob/proc/ArrowLaunching()
	src.UsingBow=1
//	src<<"You are frozen
	if(src.BowTips)
		src<<"Hold down S and release it when you want to release your Arrow! The longer you hold it down the stronger and faster your arrow will be!"
	src.BowTips=0
	return
