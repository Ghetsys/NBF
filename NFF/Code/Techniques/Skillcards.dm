mob/var/tmp/DoingPalms=0
mob/var/tmp/TrappedInGedoMazo=0
/*
mob/owner/verb/CreateACustomJutsu()
	name="Create a Custom Taijutsu"
	set category="Attacks"
	var/obj/SkillCards/Custom_Taijutsu/A=new()
	switch(input(src,"Does this move require charging? Charging a technique increases the time of the Charge.",text)in list("Yes","No"))
		if("Yes")
			var/Amount=input(usr,"How long do you want it to Charge? Note, 100 will equal 10 seconds.","Combo") as num
			A.Charge=Amount
	if(usr.TaijutsuKnowledge>100)
		switch(input(src,"Is this attack a Combo? .",text)in list("Yes","No"))
			if("Yes")
				A.Combo=1
	switch(input(src,"Is this a Striker type move or a Teleporter type Move? Strike moves attack straightforward while Teleporter moves teleports to the enemy if you're running and attacks.",text)in list("Striker","Teleporter"))
		if("Striker")
			A.MoveType="Striker".
		if("Teleporter")
			A.MoveType="Teleporter"
	switch(input(src,"Is this a Forgward move or a Spinner move? Forward moves attack forward with a strong attack, Spinner move spins around and attacks.",text)in list("Forward","Spinner"))
		if("Forward")
			A.SpinerOrStriker="Striker"
		if("Spinner")
			A.SpinerOrStriker="Spinner"
	switch(input(src,"Is this a push back move or a stunner? A Push back moves pushes back the enemy when they're hit while a Stunner stuns the enemy after their hit.",text)in list("Push Back","Stunner"))
		if("Push Back")
			A.StunOrPush="Push"
		if("Stunner")
			A.StufnOrPush="Stun"
	var/characterfirstname=input(src,"What is this technique's name?","Name")
	A.name=characterfirstname
	var/EXP=input(usr,"How much EXP is required to learn this technique? Note the higher EXP the harder it'll be to learn the technique but the stronger it'll be.","EXP Usage") as num
	if(EXP<1000)
		EXP=1000
		usr<<"EXP automatically set to 1000."
	if(EXP>200000)
		EXP=200000
		usr<<"EXP automatically set to 200,000."
	A.ExpCost=round(EXP)
	usr.JutsuInLearning=A
	usr.JutsuEXPCost=0
	usr.exp=0
	usr.JutsuMEXPCost=A.ExpCost
	src<<"You are in training for [A.name]."
	src.TypeLearning="Taijutsu"
*/
mob/proc/Slot(N as num)
	var/SLOT=N+(10*(text2num(src.SlotYourOn)-1))
	for(var/obj/SkillCards/A in src.LearnedJutsus)
		if(A.Slot==SLOT)
			if(A.Target_Required)
				if(!usr.target)
					A.DelayIt(15,usr,"None");return
			if(A.TurnedOn)
				A.TurnedOn=0
				A.Deactivate(usr)
				return
			if(A.BunshinAble)
				if(usr.KBunshinOn)
					var/C=src.controlled
					usr=C
				else
					usr=src
			if(usr.resting||usr.meditating)
				usr<<"Você não pode fazer isso, você está descansando ou em modo de geração de chakra."
				return
	//		if(usr.ManeCommand)
	//			usr.ManeCommand=0
	//			A.Activate(usr)
	//			return
			if(usr.knockedout)
				if((istype(A,/obj/SkillCards/CursedSealActivation)))
					usr<<"Você usa o selo amaldiçoado para reviver-se.."
				else if((istype(A,/obj/SkillCards/BodyShedding)))
					usr<<"Você usou o Mudança de pele  para reviver-se."
				else if((!(istype(A,/obj/SkillCards/BodyShedding)))&&(!(istype(A,/obj/SkillCards/CursedSealActivation)))&&(!(istype(A,/obj/SkillCards/FalseDeath))))
					usr<<"Não agora."
					return
			if((usr.firing&&!usr.intank&&!usr.ControllingPuppet1&&!usr.ControllingPuppet2)||usr.Dead||usr.FrozenBind=="Dead"||(usr.DoingPalms&&src.name!="Body Flicker"&&src.name!="128 Palms"))
				usr<<"Não agora."
				return
			if(src.ByakuganTrack&&!(istype(A,/obj/SkillCards/Search))&&!(istype(A,/obj/SkillCards/Watch)))
				usr<<"Você não pode fazer isso enquanto estiver usando habilidades extensoras do Byakugan."
				return
			if(usr.Status=="Asleep")
				usr<<"Você está consumido por um belo sono.., incrível."
			if(A.Delay)
				usr<<output("Você deve esperar para usar esta técnica.","Attack")
				return
	//		if(usr.InKageMane)
			//	var/obj/SkillCards/P = src//To show taht this is the skillcard you're using
	//			for(var/mob/M in oview(10,usr))
	//				if(M!=usr&&M.KageManed)
	//					if(locate(A) in M.LearnedJutsus)
	//						var/obj/SkillCards/P = A
	//						if(usr.key=="CobraT1337")
	//							usr<<"[M] does have the Skillcard [src]. [M] will use [P]."
	//						M.ManeCommand=1
	//						P.Activate(M)
			A.Activate(usr)
mob/GainedAfterLogIn/verb
	ChangeSlot()
		set hidden=1
		if(usr.SlotYourOn=="1")
			usr.SlotYourOn="2"
			usr.UpdateQuickSlots()
			return
		if(usr.SlotYourOn=="2")
			usr.SlotYourOn="1"
			usr.UpdateQuickSlots()
			return
	Slot1()
		set hidden=1
		usr.Slot(1)
	Slot2()
		set hidden=1
		usr.Slot(2)
	Slot3()
		set hidden=1
		usr.Slot(3)
	Slot4()
		set hidden=1
		usr.Slot(4)
	Slot5()
		set hidden=1
		usr.Slot(5)
	Slot6()
		set hidden=1
		usr.Slot(6)
	Slot7()
		set hidden=1
		usr.Slot(7)
	Slot8()
		set hidden=1
		usr.Slot(8)
	Slot9()
		set hidden=1
		usr.Slot(9)
	Slot10()
		set hidden=1
		usr.Slot(10)




mob/proc/CustomTaijutsu(AttName,AttackIconState="Attack1",ChargeTime,MoveType,SpinerOrStriker,Combo,StunOrPush,EXPCost,CallOutName)
	if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!=""|src.doingG)
		return
	else
		var/ChargeLength
		if(ChargeTime)
			ChargeLength=ChargeTime
		if(ChargeLength>=0)
			src.icon_state="Power"
		while(ChargeLength>0)
			if(src.icon_state!="Power")
				return
			ChargeLength--
			sleep(1)
		if(CallOutName)
			view<<"[usr]: [AttName]!"//Put them calling out the name.
		MoveStart
		if(src.target)
			src.dir=get_dir(src,src.target)
		var/Damage=src.tai
		if(EXPCost>25000&&EXPCost<=75000)
			Damage=Damage*rand(25,90)
		if(EXPCost>75000&&EXPCost<=125000)
			Damage=Damage*rand(90,150)
		if(EXPCost>125000)
			Damage=Damage*rand(150,300)
		if(EXPCost>25000) Damage+=EXPCost*0.1
		if(EXPCost>50000) Damage+=EXPCost*0.01
		if(EXPCost>75000) Damage+=EXPCost*0.001
		if(EXPCost>100000) Damage+=EXPCost*0.0001
		if(EXPCost>125000) Damage+=EXPCost*0.00001
		if(EXPCost>150000) Damage+=EXPCost*0.000001
		if(EXPCost>200000) Damage+=EXPCost*0.0000001
		Damage=Damage+Damage*(ChargeTime*0.01)
		if(Combo>0)
			Damage=Damage+1/Combo
		if(MoveType=="Teleporter")
			if(src.target&&src.Running)
				var/mob/M=src.target;src.loc=locate(M.x,M.y-1,M.z)
				Damage=Damage-Damage*0.1
		if(SpinerOrStriker=="Striker")
			flick(AttackIconState,src)
			for(var/mob/M in get_step(src,src.dir))
				Damage=((Damage/(M.Endurance+1))/(M.BaikaCharged+1))
				src.DodgeCalculation(M)
				if(M.Dodging)
					M.Dodge();return
				else
					if(M.Guarding)
						viewers()<<sound('SFX/Guard.wav',0)
					else
						viewers()<<sound('SFX/HitMedium.wav',0)
					M.DamageProc(Damage,"Stamina",src)
					if(StunOrPush=="Stun")
						M.StunAdd(5)
					if(StunOrPush=="Push")
						flick("rasenganhit",M)
						M.HitBack(rand(2,7),src.dir)
		if(SpinerOrStriker=="Spinner")
			var/SpinTime=8
			while(SpinTime)
				flick(AttackIconState,src)
				for(var/mob/M in get_step(src,src.dir))
					Damage=((Damage/(M.Endurance+1))/(M.BaikaCharged+1))
					src.DodgeCalculation(M)
					if(M.Dodging)
						M.Dodge();return
					else
						Damage=Damage/4
						M.DamageProc(Damage,"Stamina",src)
						if(StunOrPush=="Stun")
							M.StunAdd(5)
						if(StunOrPush=="Push")
							M.dir=usr.dir
							flick("rasenganhit",M)
							M.HitBack(rand(1,7),usr.dir)
				src.dir--
				if(src.dir<=0)
					src.dir=8
				//DamageThing
				SpinTime--
				sleep(1)
		if(Combo>0)
			Combo--
			goto MoveStart

/*proc/V_alert(title,T,mob/M)
	if(!T||!istext(T)) return
	if(M.showing_window)
		while(M.showing_window)
			sleep(6)
		sleep(3)
	M.showing_window=1
	M<<browse\
({"<body bgcolor=black><font color=white><font face=Manga Speak><big><b><center>[title]</big></b></center><hr>[T]<BR><BR><hr />
<center><a href=?action=V_alert&source=\ref[src]>OK</a></center>"},"window=V_alert;titlebar=0;size=380x380")


client/Topic(href,href_list[])
	switch(href_list["action"])
		if("V_alert")
			usr<< browse(null,"window=V_alert")
			usr.showing_window=0
	return ..()




obj/var/Mastered=0
mob/proc/Learn(var/Techniquename)
	var/NewTechnique=text2path("/obj/Techniques/[Techniquename]")
//	var/obj/X=new NewTechnique()
//	if(src.Skills.Find(X))	return
//	src.Skills=X
	//if(src.Level!=1)	src<<"<b>You Learned [X]!!"
obj/SkillCards/proc/Upgrade(mob/M)
	if(src.UpgradeLV==0)	return
	if(src.LV==src.UpgradeLV)
		M.Learn("[src.Upgrade]")
obj/SkillNum
	icon='SkillNums.dmi'
	layer=HUD_LAYER+1
*/
obj/SkillCards
	var

		Uses=0
		Delay=0
		BunshinAble=1
		NonKeepable=0
		TurnedOn=0
		Copied=0
		LV=1
		MLV=10
		EPcost=1
		Jtype=""
		Jnature="Neutral"
		Jname=""
		Upgrade=""
		UpgradeLV=0
		list/seals=list("")
		des=""
		effect=""
		Slot=null
		Target_Required=0
	icon='Skillcards.dmi'
/*	New()
		//src.Jname="[src.Jnature][src.name]"
		var/obj/SkillNum/X=new()
		X.icon_state="[src.LV]"
		mouse_drag_pointer=src.icon_state
		src.overlays+=X
		src.UpdateLV()
		..()
	MouseDrop(over_object,src_location,over_location)
		if(istype(over_object,/obj/HUD/ActualHUD/TechniqueInfo))
			src.DisplayInfo()
		else if(istype(over_object,/obj/HotKey))
			over_object:icon_state=src.icon_state
			over_object:mouse_drag_pointer=src.icon_state
			var/obj/SkillNum/X=new()
			X.icon_state="[src.LV]"
			over_object:overlays+=X
			usr.HotKeys[over_object:slot]=src


	proc
		UpdateLV()
			src.overlays.Remove(src.overlays)
			var/obj/SkillNum/X=new()
			X.icon_state="[src.LV]"
			src.overlays+=X
		DisplayInfo()
			var/T="<center><b>[src.Jtype]Technique</center></b><hr>[src.des]<ul>[src.effect]</ul>"
			if(length(src.seals)>1)
				T+="<font color=white><hr><b>Technique: </b>"
				for(var/X as anything in src.seals)
					T+="[X] "
			//var/icon/I=new(src.icon,icon_state=src.icon_state,dir=SOUTH)
			//usr<<browse_rsc(I,"Picture")
			V_alert("[src.name] ([src.EPcost] EP)",T,usr)
*/
	proc
		Activate(mob/M)
			if(M.Phasing&&(istype(src,/obj/SkillCards/Phase)))
				M<<"Você libera o Jutsu Intangivel, você esta começando a solidificar.."
				M.Phasing=0
				src.DelayIt(10,M,"Clan")
				return
			else if(M.Phasing)
				M<<"ocê não pode fazer isso, mantendo o Jutsu Intangivel!"
				return
			else if(M.invisibility==100&&!(istype(src,/obj/SkillCards/Invisibility))&&!(istype(src,/obj/SkillCards/MindGenjutsu))&&!(istype(src,/obj/SkillCards/FalseBunshin)))
				M<<"Você não pode atacar enquanto estiver invisível."
				return
			..()
		Deactivate(mob/M)
			..()
		DelayIt(Time,mob/M,Type="None")
			if(src.Delay)
				return
			var/Delay
			if(M&&Type=="Clan")
				Delay=Time
			if(M&&Type=="Tai")
				Delay=Time-M.TaijutsuMastery
			if(M&&Type=="Nin")
				Delay=Time-(M.NinjutsuMastery*2)
				//
				//
				if(prob(Time/10)&&M.NinjutsuMastery<10)
					M.NinjutsuMastery+=0.1
				if(prob(Time/10))
					M.NinjutsuKnowledge+=1
				if(M.NinjutsuKnowledge<10)
					if(prob(35))
						M.NinjutsuKnowledge++
				//The above code snippet was repeated throughout almost all ninjutsu skillcards in this file
				//When a code snippet is repeated exactly the same, there is no reason to do so because it just wastes space.
				//Instead we turn it into a proc to keep things efficient.

				//I also changed the probability from 15 to Time/10. This prevents people from spamming jutsus with low delays
				//to increase the passive quickly. Instead it is now the higher the delay, the higher the chance it has to raise.
				//Thus balancing it out.

			if(Type=="Gen")
				Delay=Time
			if(Type=="None")
				Delay=Time
			if(Type=="Element")
				Delay=Time-((M.NinjutsuMastery*2)+round(M.GenSkill*2.5)) // The point of this change was to give Control a little bit of an effect.
				//We can also place all the elemental passive raising here like we did with Ninjutsu but I was too lazy at this point,
				//after doing all the Ninjutsu ones. Its not hard just tedious.
			if(M&&M.Clan=="Fuuma"&&Type!="Element") //The reason I went through and catagorized it like this also prevents Fuumas passive from acting on jutsu that it should not.
				Delay=Delay*0.5
			if(M&&M.Trait=="Speedy")
				Delay*=0.9
			if(M&&M.Trait2=="Hyperactivity"&&M.stamina<M.maxstamina/2)
				Delay*=0.85
			src.Delay=1
			if(M.Trait3=="Unyielding")
				Delay/=1.85
			src.overlays+='Skillcards2.dmi'
			if(M&&M.client)
				if(Slot!=null)
					for(var/obj/HUD/HotKeys/A in M.client.screen)
						if(A.type==text2path("/obj/HUD/HotKeys/Slot[Slot]"))
							A.overlays+='Skillcards2.dmi'
				//		M.UpdateCards()//Added 6/19/2013
			spawn(Delay)
				src.Delay=0
				src.overlays-='Skillcards2.dmi'
				if(M&&M.client)
					if(Slot!=null)
						for(var/obj/HUD/HotKeys/A in M.client.screen)

							if(A.type==text2path("/obj/HUD/HotKeys/Slot[Slot]"))
								A.overlays-='Skillcards2.dmi'
				//			M.UpdateCards()//Added 6/19/2013
	MouseDrag()
		mouse_drag_pointer=icon(src.icon,src.icon_state)
	MouseDrop(over_object,src_location,over_location,src_control,over_control)
		if(src!=over_object)
			if(src_control=="JutsuTab.Grid"&&over_control=="JutsuTab.Grid"&&over_object)
				usr.LearnedJutsus.Swap(usr.LearnedJutsus.Find(src),usr.LearnedJutsus.Find(over_object))
				usr<<output(src,"[over_control]:[over_location]")
				usr<<output(over_object,"[src_control]:[src_location]")
			else if(src_control=="JutsuTab.Grid"&&over_control=="mapwindow.map"&&istype(over_object,/obj/HUD/HotKeys/))
				var/obj/SkillCards/A = src
				if(!A)
					return
				else
					if(A.Delay)
						usr<<"Você não pode mudar o slot enquanto seu jutsu estiver em espera..";return
					for(var/obj/SkillCards/C in usr.LearnedJutsus)
						if(C.Slot==over_object:Slot)
							C.Slot=null
					A.Slot=over_object:Slot
					usr<<"You set [A] to slot [over_object:Slot]."
					//for(var/obj/HUD/HotKeys/Slot1/X in usr.client.screen)
					over_object:icon=A.icon
					over_object:icon_state=A.icon_state
					var/icon/I=new('Skillcards.dmi',"HotKey[over_object:Slot]")
					over_object:overlays+=I
		mouse_drag_pointer = MOUSE_INACTIVE_POINTER
		if(usr.resting||usr.meditating)
			usr<<"Você não pode fazer isso, você está descansando ou em modo de geração de chakra."
			return
		if((usr.firing&&(!usr.InKageMane&&src.name!="Shadow Mimic Jutsu")&&!usr.intank&&!usr.ControllingPuppet1&&!usr.ControllingPuppet2)||usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms&&src.name!="128 Palms")
			usr<<"Não agora."//(usr.firing&&!usr.InKageMane&&src.name!="Shadow Mimic Jutsu")
			return
		if(usr.knockedout)
			if((istype(src,/obj/SkillCards/CursedSealActivation)))
				usr<<"Você ativar o poder do Selo  Amaldiçoado e forçar-se para acordar!!"
			else if((istype(src,/obj/SkillCards/BodyShedding)))
				usr<<"Você usou a troca de pele para reviver você. "
			else if(!istype(src,/obj/SkillCards/FalseDeath))
				usr<<"Não agora."
				return
		if(usr.Status=="Asleep")
			usr<<"Você está consumido por um belo sono.., incrível.."
		if(src.Delay>0)
			usr<<output("Você deve esperar para usar esta técnica.","Attack")
			return
		if(src.BunshinAble)
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
	Click()
		if(src.Target_Required)
			if(!usr.target)
				src.DelayIt(15,usr,"None");return
		if(src.TurnedOn)
			src.TurnedOn=0
			src.Deactivate(usr)
			return
//		if(usr.ManeCommand)
//			usr.ManeCommand=0
//			src.Activate(usr)

//			return
		if(usr.resting||usr.meditating)
			usr<<"Você não pode fazer isso, você está descansando ou em modo de geração de chakra."
			return
		if((usr.firing&&(!usr.InKageMane&&src.name!="Shadow Mimic Jutsu")&&!usr.intank&&!usr.ControllingPuppet1&&!usr.ControllingPuppet2)||usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms&&src.name!="128 Palms")
			usr<<"Not now."//(usr.firing&&!usr.InKageMane&&src.name!="Shadow Mimic Jutsu")
			return
		if(usr.knockedout)
			if((istype(src,/obj/SkillCards/CursedSealActivation)))
				usr<<"Você ativar o poder do Selo  Amaldiçoado e forçar-se para acordar!"
			else if((istype(src,/obj/SkillCards/BodyShedding)))
				usr<<"Você usou a troca de pele para reviver você."
			else if(!istype(src,/obj/SkillCards/FalseDeath))
				usr<<"Não agora."
				return
		if(usr.Status=="Asleep")
			usr<<"Você usou a troca de pele para reviver você.."
		if(src.Delay>0)
			usr<<output("Você deve esperar para usar esta técnica.","Attack")
			return
		if(src.BunshinAble)
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
//		if(usr.InKageMane)
//			for(var/mob/M in oview(10,usr))
//				if(M!=usr&&M.KageManed)
//					if(locate(src) in M.LearnedJutsus)
//						var/obj/SkillCards/P = src
//						if(usr.key=="CobraT1337")
//							usr<<"[M] does have the Skillcard [src]. [M] will use [src]."
//						M.ManeCommand=1
//						P.Activate(M)

		src.Activate(usr)
		..()

////////////////////////////////////////
//Exclusive Stuff
/////////////////////
	Custom_Taijutsu
		name="CustomJutsu"
		icon_state="CustomJutsu"
		var
			ExpCost=0

			Style
			//If Style is Taijutsu
			Charge=0//Charge time
			Combo=0
			MoveType="Striker"//Striker or Teleport. Striker = Asshou, Teleport like Senpuu that teleports if you're running
			SpinerOrStriker="Spinner"//1 = Strike Forward
			StunOrPush
			AttackIconState

			CallOutName=0
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/DelayTime=src.ExpCost*0.01
				if(DelayTime>600)
					DelayTime=600
				src.DelayIt(DelayTime,usr)
				var/AmountofCombos=0
				if(Combo)
					AmountofCombos=src.ExpCost/10000
				usr.CustomTaijutsu(src.name,AttackIconState="Attack1",src.Charge,src.MoveType,src.SpinerOrStriker,AmountofCombos,src.StunOrPush,src.ExpCost,src.CallOutName)
				src.Uses+=1
	CustomJutsuNinjutsu
		name="CustomJutsu"
		icon_state="CustomJutsu"
		var
			ExpCost=0


			//If Style is Ninjutsu
			ChakraNature
			Projectile
			//If style is Projectile
			ProjectilesIconState
////////////////////////////////////////
//Clans
/////////////////////
//Aburame//////////////

	SummonKonchuu
		name="Invocar Insetos"
		icon_state="SummonKonchuu"
		Activate(mob/M)
			if(M.SummonedNumber>=10)
				M.DelBugs()
				src.DelayIt(100,M)
				return
			src.DelayIt(10,M,"Clan")
			src.Uses+=1
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			M.SummonKonchuu()
	UnsummonKonchuu
		name="Esconjurar Insetos"
		icon_state="UnsummonKonchuu"
		Activate(mob/M)
			M.unsummonkonchuu()
	PlaceBug
		name="Colocar inseto"
		icon_state="PlaceBug"
		Activate(mob/M)
			src.DelayIt(200,M,"Clan")
			src.Uses+=1
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			src.DelayIt(300,M)
			M.Placekonchuu()
	UnPlaceBug
		name="Tirar inseto"
		icon_state="UnPlaceBug"
		Activate(mob/M)
			src.Uses+=1
			M.DestroyKonchuu()
	KonchuuTracking
		name="Inseto Rastreamento"
		icon_state="KonchuuTracking"
		Activate(mob/M)
			src.DelayIt(350,M,"Clan")
			src.Uses+=1
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			M.Konchuutracking()
	KikkaichuDrain
		name="Inseto Drenagem"
		icon_state="KikkaichuDrain"
		Activate(mob/M)
			src.Uses+=1
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			M.KonchuuDrain()
	KekkaiSheild
		name="Inseto Escudo"
		icon_state="KekkaiSheild"
		Activate(mob/M)
			src.Uses+=1
			if(M.UsingBugShield)
				M.UsingBugShield=0
				for(var/mob/Bugs/BugShield/B in world)
					if(B.Owner==usr)
						walk_towards(B,M)
						spawn(40)
							if(B)
								del(B)
				src.DelayIt(300,M,"Clan")
				return
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			M.KonchuuShield()
	MushiDama
		name="Esfera de Insetos"
		icon_state="MushiDama"
		Activate(mob/M)
			src.Uses+=1
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			src.DelayIt(850,M,"Clan")
			M.MushiDama()
	KekkaiKonchuuBunshin
		name="Clone de Inseto Jutsu"
		icon_state="MushiBunshin"
		Activate(mob/M)
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.1
			src.Uses+=1
			src.DelayIt(300,M,"Clan")
			M.KekkaiKonchuuBunshinnoJutsu()
	KekkaiArashi
		name="Tempestade de Insetos"
		icon_state="KekkaiArashi"
		Activate(mob/M)
			if(prob(15))
				M.BugMastery+=0.1;if(M.BugMastery>50) M.BugMastery=50
			if(prob(15))
				if(M.BugMastery>=50)
					M.BugKeeper+=0.5
			src.Uses+=1
			src.DelayIt(650,M,"Clan")
			M.KekkaiArashi()
	//Special bug Attacks
	NanoMite1
		name="NanoMite Burst"
		icon_state="NanoBurst"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(50,M,"Clan")
//			M.SpecialSwarm(Mode="Health",Controllable=0,Number=1,Line=0,Circle=0,RequiredBugs=20)
	NanoMite2
		name="NanoMite Swarm"
		icon_state="NanoSwarm"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
	//		M.SpecialSwarm(Mode="Health",Controllable=0,Number=1,Line=1,Circle=0,RequiredBugs=200)
	NanoMite3
		name="NanoMite Gathering"
		icon_state="NanoGathering"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(650,M,"Clan")
		//	M.SpecialSwarm(Mode="Health",Controllable=1,Number=1,Line=0,Circle=1,RequiredBugs=4000)
	NanoMite4
		name="NanoMite Omni Burst"
		icon_state="NanoOmni"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(450,M,"Clan")
		//	M.SpecialSwarm(Mode="Health",Controllable=0,Number=1,Line=0,Circle=1,RequiredBugs=1600)
	NanoMite5
		name="NanoMite Medic Swarm"
		icon_state="NanoSwarmHeal"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(450,M,"Clan")
		//	M.SpecialSwarm(Mode="Health Heal",Controllable=1,Number=3,Line=0,Circle=0,RequiredBugs=1500)
//Akimichi//////////////
	Baika
		name="Expansao corporal"
		icon_state="Baika"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.SizeMastery+=pick(1,2);if(M.SizeMastery>50) M.SizeMastery=50
			src.Uses+=1
			src.DelayIt(600,M,"Clan")
			M.BaikaNoJutsu()
	Nikudan
		name="Rolamento Tanque de Carne"
		icon_state="Nikudan"
		Activate(mob/M)
			if(M.intank)
				M.intank=0;M.Normal();M.overlays-='AkimichiTechniques.dmi';M.firing=0
				walk(M,0)
				src.DelayIt(250,M,"Clan")
				return
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.SizeMastery+=pick(1,2);if(M.SizeMastery>50) M.SizeMastery=50
			src.Uses+=1
			M.Nikudan()
	BubunBaika
		name="Expansao corpo Parcial"
		icon_state="BubunBaika"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.SizeMastery+=pick(3,5);if(M.SizeMastery>50) M.SizeMastery=50
			src.DelayIt(450,M,"Clan")
			src.Uses+=1
			M.BubunBaika()
	AkimachiSlam
		name="Batida Akimachi"
		icon_state="DoubleStrike"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.SizeMastery+=pick(3,5);if(M.SizeMastery>50) M.SizeMastery=50
			src.DelayIt(450,M,"Clan")
			src.Uses+=1
			M.AkimachiSlam()
//Haku//////////////////
	SensatsuSuishou
		name="Agulhas da morte"
		icon_state="Sensatsu"
		Target_Required=1
		Activate(mob/M)
			if(M.hyoushou)
				if(!M.target)
					M<<"É preciso mirar no inimigo quando nos espelhos!";return
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(25,100)
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.SensatsuSuishou()
	ISawarabi
		name="Lanças de Gelo"
		icon_state="AisuSawarabi"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(50,350)
			src.DelayIt(550,M,"Clan")
			src.Uses+=1
			M.ISawarabi(src.Uses)
	IceField//IceField
		name="Hyouton: Criacao de gelo"
		icon_state="IceField"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(50,350)
			src.DelayIt(750,M,"Clan")
			src.Uses+=1
			M.IceField(Uses)
	IcePrison
		name="Hyouton: Prisao de Gelo"
		icon_state="IcePrison"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(50,350)
			src.DelayIt(750,M,"Clan")
			src.Uses+=1
			M.IcePrison()


	MakyouHyoushou
		name="Espelhos de Cristais de Gelo"
		icon_state="MakyouHyoushou"
		BunshinAble=0
		Activate(mob/M)
			if(M.hyoushou)
				for(var/obj/Jutsu/Elemental/Hyouton/DemonMirror/S in world)
					if(S.Owner==M)
						del(S)
				sleep(1)
				M.hyoushou=0
				M.UnableToChargeChakra=0
				src.DelayIt(600,M,"Clan")
				return
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(50,350)
			src.Uses+=1
			M.MakyouHyoushou()
	SnowShuriken
		name="Shuriken de Gelo"
		icon_state="YukiShuriken"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(50,350)
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.SnowShuriken(src.Uses)
////Part2
	IceShard
		name="Ice Shard Jutsu"
		icon_state="IceShard"
		Activate(mob/M)
			if(prob(95-src.Uses)||M.Trait=="Genius"&&prob(50)&&src.Uses<100)
				M.IceRush+=pick(0.1,0.2);if(M.IceRush>100) M.IceRush=100
			if(M.TypeLearning=="Hyouton")
				M.exp+=rand(50,350)
			src.DelayIt(250,M,"Clan")
			src.Uses+=1
			M.IceShard(Uses)

//Hoshigaki/////////////
	SamehadeReturn
		icon_state="samehada Return"
		Activate(mob/M)
			M<<"Disabled."
	samehadeChakraDrain
		name="Samehada:Drenagem de chakra"
		icon_state="SamehadeAbsorbtion"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			M.samehadeChakraDrain()
	samehadeShred
		name="Samehada: Retalhar"
		icon_state="SamehadeShred"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			M.SamehadeShred()
	samehadeThrow
		name="Samehada: atirar"
		icon_state="SamehadeThrow"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			M.samehadeThrowing()
	samehadeUnleash
		name="Samehada: Liberar"
		icon_state="Daibakufu"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			M.SamehadeUnleash()
	SamehadeDaibakufu
		name="Samehada: Grande Onda"
		icon_state="Daibakufu"
		NonKeepable = 1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(2650,3200)
			src.DelayIt(700,M,"Element")
			src.Uses+=1
			M.DaibakufuZ()

	SamehadeSuigadan
		name="Samehada: Canino de Agua"
		icon_state="Suigadan"
		Target_Required=1
		NonKeepable = 1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.Suigadan()
	SamehadeSuiryuudan
		name="Samehada: Dragao de Agua"
		icon_state="Suiryuudan"
		BunshinAble=0
		NonKeepable = 1
		Deactivate(mob/M)
			M.SuiryuudanZ()
			src.DelayIt(350,M,"Element")
		Activate(mob/M)
			for(var/obj/Jutsu/Elemental/Suiton/Suiryedan/K in world)
				if(K.Owner==M)
					src.Deactivate(M)
					return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(250,1000)
			src.DelayIt(350,M,"Element")
			src.Uses+=1
			M.SuiryuudanZ()

	SamehadeMizuameNabara
		name="Samehada: Captura do Xarope"
		icon_state="StickySyrup"
		NonKeepable = 1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(1200,M,"Element")
			src.Uses+=1
			M.Syrup_Capture()

	SamehadeMizurappa
		name="Samehada: Violento Choque de Agua"
		icon_state="Mizurappa"
		NonKeepable=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.MizurappaNoJutsu()

	SamehadeSuikoudan
		name="Samehada: Tubarao de Agua"
		icon_state="Suikoudan"
		NonKeepable=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.SuikoudanZ(src.Uses)

	SamehadeBakuSuishouha
		name="Samehada: Colisao de Grandes Ondas"
		icon_state="BakuSuishou"
		NonKeepable=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Esta formando selos para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(725,1500)
			src.DelayIt(1100,M,"Element")
			src.Uses+=1
			M.BakuSuishouha(src.Uses)

	SamehadeTeppoudama
		name="Samehada: Bala de Agua"
		icon_state="Water Bullet"
		NonKeepable=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(750,2000)
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.Teppoudama()


//Hyuuga////////////////
	Byakugan
		icon_state="Byakugan"
		Activate(mob/M)
			src.Uses+=1
			if(M.bya)
				src.DelayIt(150,M,"Clan")
				M.ByakuganOn()

				return
			if(M.knockedout)
				return
			M.ByakuganOn()
			src.Uses+=1
	Range
		name="Alcance"
		icon_state="Range"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			spawn()
				src.DelayIt(30,M,"Clan")
			M.RangeExtension(0)
	Sense
		name="Sentir"
		icon_state="Sense"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			spawn()
				src.DelayIt(30,M,"Clan")
			M.ByaSense()
	Watch
		name="Assistir"
		icon_state="Watch"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			M.Watch()
			spawn()
				src.DelayIt(80,M,"Clan")
	RangeExtend
		name="Alcance Estendido"
		icon_state="RangeExtend"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			spawn()
				src.DelayIt(30,M,"Clan")
			M.RangeExtension(Goggles=1)

	Search
		name="Procurar"
		icon_state="Search"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			spawn()
				src.DelayIt(30,M,"Clan")
			M.ByaSearch()
	Kaiten
		name="Rotacao"
		icon_state="Kaiten"
		Activate(mob/M)
			if(!M.client) return
			if(M.DoingPalms) return
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20)&&M.bya)
				M.TaijutsuKnowledge+=pick(0.5,1,1.2,1.5)
			if(prob(20))
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			src.DelayIt(200,M)
			for(var/obj/SkillCards/KaitenKizu/A in M.LearnedJutsus)
				A.DelayIt(200,M,"Clan")
			src.Uses+=1
			M.Kaiten()
	KaitenKizu
		name="Rotacao Reversa"
		icon_state="KaitenKizu"
		Activate(mob/M)
			if(!M.client) return
			if(M.DoingPalms) return
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20)&&M.bya)
				M.TaijutsuKnowledge+=pick(0.5,1,1.2,1.5)
			if(prob(20)&&M.bya)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(!M.bya)
				M<<"Você precisa ativar o Byakugan!";src.DelayIt(15,M);return
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			M.KaitenKizu()
	Rokujuu
		name="64 Golpes"
		icon_state="Rokujuu"
		Activate(mob/M)
			if(!M.bya)
				M<<"Você precisa ativar o Byakugan!";src.DelayIt(15,M);return
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20)&&M.bya)
				M.TaijutsuKnowledge+=pick(0.5,1,1.2,1.5)
			if(prob(20)&&M.bya)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			oview(M,6)<<"[M] muda sua postura."
			var/Time=50
			if(M.ByakuganMastery>=250)
				Time+=10
			if(M.ByakuganMastery>=500)
				Time+=10
			if(M.ByakuganMastery>=1000)
				Time+=10
			M<<"Você entra na posição 8 trigramas! Você tem [Time/10] segundos para atingir o alvo!";
			M.DoingPalms=1
			spawn(Time)
				if(M.DoingPalms==1)
					M.DoingPalms=0;M<<"Você ficou sem tempo para iniciar o jutsu!"
	Hyakuni
		name="128 Golpes"
		icon_state="Hyakuni"
		Activate(mob/M)
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20))
				M.TaijutsuKnowledge+=pick(0.5,1,1.2,1.5)
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			M.HakkeHyakunijuuhachishouz()
	TenketsuHagemi
		name="Chakra Ponto Rejuvenescedor"
		icon_state="TenketsuHagemi"
		BunshinAble=0
		Activate(mob/M)
			if(!M.bya)
				M<<"Você precisa ativar o Byakugan!";src.DelayIt(15,M);return
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			M.TenketsuHagemi()
	PalmThrust
		name="Impulso de Golpe"
		icon_state="PalmThrust"
		Activate(mob/M)
			if(!M.bya)
				M<<"Você precisa ativar o Byakugan!";src.DelayIt(15,M);return
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20)&&M.bya)
				M.TaijutsuKnowledge+=pick(0.2,0.4,0.45,0.5)
			if(prob(20))
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			src.DelayIt(350,M,"Clan")
			src.Uses+=1
			M.PalmThrust()
	TenketsuStrike
		name="Jyuuken: Batida no Tenketsu"
		icon_state="Kuusho"
		Activate(mob/M)
			if(!M.bya)
				M<<"Você precisa ativar o Byakugan!";src.DelayIt(15,M);return
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20)&&M.bya)
				M.TaijutsuKnowledge+=pick(0.2,0.4,0.45,0.5)
			if(prob(20))
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			src.DelayIt(1200,M,"Clan")
			for(var/obj/SkillCards/Rokujuu/A in M.LearnedJutsus)
				A.DelayIt(200,M,"Clan")
			src.Uses+=1
			M.TenketsuStrike()

	Kuusho
		name="Divino golpe de Ar"
		icon_state="Kuusho"
		Activate(mob/M)
			if(prob(15))
				M.StanceMastery+=0.5;if(M.StanceMastery>75) M.StanceMastery=75
			if(prob(20)&&M.bya)
				M.TaijutsuKnowledge+=pick(0.2,0.4,0.45,0.5)
			if(prob(20))
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			src.DelayIt(17,M,"Clan")
			src.Uses+=1
			M.Kuusho()
//Inuzuka///////////////
	Shikyaku
		name="Tecnica de quatro patas"
		icon_state="Shikyaku"
		Activate(mob/M)
			if(prob(30))
				M.Canine+=pick(0.1,0.2,0.3);if(M.Canine>50) M.Canine=50
			src.DelayIt(170,M,"Clan")
			src.Uses+=1
			M.Shikyaku()
	BeastClaws
		name="Garras do Homem-Fera"
		icon_state="BeastClaws2"
		Activate(mob/M)
			if(prob(30))
				M.Canine+=pick(0.1,0.2,0.3);if(M.Canine>50) M.Canine=50
	//		src.DelayIt(170,M)
			src.Uses+=1
			usr.ManBeastClaws();src.Uses+=1
	JuujinBunshin
		name="Homem-Besta Clone"
		icon_state="JuujinBunshin"
		Activate(mob/M)
			if(prob(30))
				M.Training+=pick(0.1,0.2,0.3);if(M.Training>50) M.Training=50
			src.DelayIt(170,M,"Clan")
			src.Uses+=1
			M.JuujinBunshin()
	Tsuuga
		name="Perfuracao Canina"
		icon_state="Tsuuga"
		Activate(mob/M)
			if(prob(30))
				M.Training+=pick(0.1,0.2,0.3);if(M.Training>50) M.Training=50
			if(prob(30))
				M.Canine+=pick(0.1,0.2,0.3);if(M.Canine>50) M.Canine=50
			src.DelayIt(370,M,"Clan")
			src.Uses+=1
			M.Tsuuga()
	Gatsuuga
		name="Dupla Perfuracao Canina"
		icon_state="Gatsuuga"
		Activate(mob/M)
			if(prob(30))
				M.Training+=pick(0.1,0.2,0.3);if(M.Training>50) M.Training=50
			if(prob(30))
				M.Canine+=pick(0.1,0.2,0.3);if(M.Canine>50) M.Canine=50
			src.DelayIt(500,M,"Clan")
			src.Uses+=1
			M.Gatsuuga1()
	ExplodingPuppy
		name="Explosao de filhote Jutsu"
		icon_state="ExplodingPuppy"
		Activate(mob/M)
			if(prob(30))
				M.Training+=pick(0.1,0.2,0.3);if(M.Training>50) M.Training=50
			src.DelayIt(825,M,"Clan")
			src.Uses+=1
			M.ExplodingPuppy()
	DoubleHeadedWolf
		name="Lobo de duas Cabecas"
		icon_state="DoubleHeadedWolf"
		Activate(mob/M)
			if(M.inso)
				M.inso=0;src.DelayIt(600,M,"Clan");return
			if(prob(30))
				M.Training+=pick(0.1,0.2,0.3);if(M.Training>50) M.Training=50
			if(prob(50))
				M.Canine+=pick(0.1,0.2,0.3);if(M.Canine>50) M.Canine=50
			src.Uses+=1
			M.Soutourou()
	Garouga
		name="Garouga"
		icon_state="Garouga"
		Activate(mob/M)
			if(prob(30))
				M.Training+=pick(0.1,0.2,0.3);if(M.Training>50) M.Training=50
			if(prob(30))
				M.Canine+=pick(0.1,0.2,0.3);if(M.Canine>50) M.Canine=50
			src.Uses+=1
			M.Garouga()
			src.DelayIt(750,M,"Clan")
	ScentCheck
		name="Verificar Aromas"
		icon_state="Garouga"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
			M.CheckScents()
	ScentGather
		name="Reunir um Aroma"
		icon_state="Garouga"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(950,M,"Clan")
			M.ScentTrackStart()
	ScentLocate
		name="Localizar Aroma"
		icon_state="Garouga"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")
			M.TrackScent()
//Iwazuka////////////////
	Katsu
		name="Katsu"
		icon_state="Katsu"
		Activate(mob/M)
			if(prob(20))
				M.ExplosiveMastery+=rand(0.1,0.3);if(M.ExplosiveMastery>100) M.ExplosiveMastery=100
			src.DelayIt(60,M,"Clan")
			src.Uses+=1
			M.Katsu()

	SetLeftHand
		name="Coloque na mao esquerda"
		icon_state="SetLeftHand"
		Activate(mob/M)
			usr.SetLeftHand()
	SetRightHand
		name="Coloque na mao direita"
		icon_state="SetRightHand"
		Activate(mob/M)
			usr.SetRightHand()
	C1
		name="C1"
		icon_state="C1"
		Activate(mob/M)
			usr.C1()
	C2
		name="C2"
		icon_state="C2"
		Activate(mob/M)
			usr.C2()
	C3
		name="C3"
		icon_state="C3"
		Activate(mob/M)
			if(prob(35))
				M.ExplosiveMastery+=0.1;if(M.ExplosiveMastery>100) M.ExplosiveMastery=100
			src.DelayIt(1200,M,"Clan")
			src.Uses+=1
			usr.CreateC3()
	C4
		name="C4"
		icon_state="C4"
		Activate(mob/M)
			if(prob(35))
				M.ExplosiveMastery+=0.1;if(M.ExplosiveMastery>100) M.ExplosiveMastery=100
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			usr.CreateC4()
	C0
		name="C0"
		icon_state="C4"
		Activate(mob/M)
			usr<<"Você tenta explodir a si mesmo, mas nada acontece..."
			return
			if(prob(35))
				M.ExplosiveMastery+=0.1;if(M.ExplosiveMastery>100) M.ExplosiveMastery=100
			src.DelayIt(10000,M,"Clan")
			src.Uses+=1
			usr.CreateC0()

	Clay_Carrier
		name="Passaro Transportador"
		icon_state="IwazukaCarrierBird"
		Activate(mob/M)
			if(prob(35))
				M.ExplosiveMastery+=0.1;if(M.ExplosiveMastery>100) M.ExplosiveMastery=100
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			usr.CreateFlyingBird()

	Spikes
		name="Espinhos Explosivos"
		icon_state="C3"
		Activate(mob/M)
			if(prob(35))
				M.ExplosiveMastery+=0.1;if(M.ExplosiveMastery>100) M.ExplosiveMastery=100
			src.DelayIt(300,M,"Clan")
			src.Uses+=1
			usr.CreateExposiveSpike()

//Kaguya////////////////
	Yanagi
		name="Danca do Salgueiro"
		icon_state="Yanagi"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.YanagiZ()
	TenshiSendan
		name="Balas de Ossos"
		icon_state="TenshiSendan"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			src.DelayIt(15,M,"Clan")
			src.Uses+=1
			M.TenshiSendanAttack()
	Tsubaki
		name="Danca da Camelia"
		icon_state="Tsubaki"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.TsubakiZ()
	Karamatsu
		name="Danca do Larico"
		icon_state="Karamatsu"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.KaramatsuNoMai()
	Ibara
		name="Lancar Ossos"
		icon_state="Ibara"
		BunshinAble=0
		Activate(mob/M)
			if(M.KagDance!="Karamatsu")
				M<<"Você precisa estar com a Dança do lariço ativada!";return
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.Ibara()
	BoneMembrane
		name="Reforcar Ossos"
		icon_state="Karamatsu"
		Activate(mob/M)
			if(M.BoneMembrane)
				M<<"Você para de Reforçãr seus Ossos."
				M.BoneMembrane=0
				if(prob(4))
					M.BoneArmor+=pick(0.03,0.1)
				if(prob(15))
					M.DanceMastery+=pick(0.01,0.1);if(M.DanceMastery>30) M.DanceMastery=30
				if(prob(15))
					M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
				if(M.BoneArmor>=3)
					M.BoneArmor=3
				src.DelayIt(300,M,"Clan")
				return
			src.Uses+=1
			M.BoneMembrane()
	Tessenka
		name="Danca da Clematite: Vinha"
		icon_state="Tessenka"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			src.DelayIt(150,M,"Clan")
			src.Uses+=1
			M.TessenkaNoMai()
	ArmBone
		name="Dança Clematite: Flor"
		icon_state="Drill"
		BunshinAble=0
		Activate(mob/M)
			if(M.KagDance!="Tessenka")
				M<<"Você precisa usar primeiro a Danca da Clematite Vinha!";return
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			src.DelayIt(300,M,"Clan")
			src.Uses+=1
			M.ArmB()
	Sawarabi
		name="Danca das Mudas de Samambaia"
		icon_state="Sawarabi"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			if(prob(10))
				M.SawaMaster+=pick(0.01,0.1,0.2,0.25);if(M.SawaMaster>5) M.SawaMaster=5
			src.DelayIt(1200,M,"Clan")
			src.Uses+=1
			M.Sawarabi(Control=0)
	WorldMethod
		name="Satetsu: World Method"
		icon_state="SatetsuWorld"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(1200,M,"Clan")
			src.Uses+=1
			M.WorldMethod(Control=0)
	SawarabiAdvanced
		name="Danca das Mudas de Samambaia: Controle"
		icon_state="Sawarabi"
		BunshinAble=0
		Activate(mob/M)
			if(M.ControllingSawa)
				M<<"Você para de controlar esse jutsu"
				M.ControllingSawa=0
				src.DelayIt(1450,M,"Clan")
				return
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			if(prob(10))
				M.SawaMaster+=pick(0.01,0.1,0.2,0.25);if(M.SawaMaster>5) M.SawaMaster=5
			src.Uses+=1
			M.Sawarabi(Control=1)
	Kochou
		name="Danca da Borboleta"
		icon_state="WeakBones"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.DanceMastery+=pick(0.1,0.01);if(M.DanceMastery>30) M.DanceMastery=30
			if(prob(15))
				M.BoneMastery+=pick(0.01,0.1);if(M.BoneMastery>100) M.BoneMastery=100
			src.DelayIt(1300,M,"Clan")
			src.Uses+=1
			M.Kochou()



//Kiro////////////////
	ShurikenSoujuu
		name="Jutsu de Controle da Shuriken"
		icon_state="ShurikenSoujuu"
		Activate(mob/M)
			if(M.ShurikenMode)
				if(prob(20))
					M.ShurikenMastery+=pick(0.1,0.2)
				src.DelayIt(250,M,"Clan")
				src.Uses+=1
				M.ShurikenSoujuu()
			else
				M.ShurikenSoujuu()
	ChakraShuriken
		name="Shuriken Chakra no Jutsu"
		icon_state="ChakraShuriken"
		Activate(mob/M)
			if(prob(20))
				M.ShurikenMastery+=pick(0.1,0.2)
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			M.ChakraShuriken()
	SpiralStar
		name="Estrela Giratoria no Jutsu"
		icon_state="SpiralStar"
		Activate(mob/M)
			var/RasenHoshi=0
			for(var/obj/Jutsu/Kiro/ShurikenStar/A in M.JutsuList)
				RasenHoshi=1
				del(A)
			if(RasenHoshi)
				M.Frozen=0
				src.DelayIt(150,M,"Clan")
				return
			if(prob(20))
				M.ShurikenMastery+=pick(0.1,0.2)
			src.DelayIt(50,M,"Clan")
			src.Uses+=1
			M.RasenHoshi()
	ChakraShurikenShield
		name="Escudo de Shurikens"
		icon_state="SpiralStar"
		Activate(mob/M)
//			var/RasenHoshi=0
//			for(var/obj/Jutsu/Kiro/ShurikenStar/A in M.JutsuList)
//				RasenHoshi=1
//				del(A)
//			if(RasenHoshi)
//				M.Frozen=0
//				src.DelayIt(150,M,"Clan")
//				return
			if(prob(20))
				M.ShurikenMastery+=pick(0.1,0.2)
			src.Uses+=1
			src.DelayIt(1000,M,"Clan")
			M.ChakraShurikenShield()
	VoidStar
		name="Criacao de Estrela de Chakra"
		icon_state="SpiralStar"
		Activate(mob/M)
			if(prob(20))
				M.ShurikenMastery+=pick(0.1,0.2)
			src.Uses+=1
			src.DelayIt(1650,M,"Clan")
			M.VoidStar()

	SpiralStarProjectile
		name="Espiral projétil"
		icon_state="SpiralStar"
		Activate(mob/M)
			if(prob(20))
				M.ShurikenMastery+=pick(0.1,0.2)
			src.Uses+=1
			src.DelayIt(15,M,"Clan")
			M.RasenHoshiProjectile()
	ShurikenSmithyJutsu
		name="Shuriken de ferro no Jutsu"
		icon_state="ChakraShuriken"
		Activate(mob/M)
			if(prob(20))
				M.ShurikenMastery+=pick(0.1,0.2)
			src.Uses+=1
			src.DelayIt(750,M,"Clan")
			M.ShurikenSmithyJutsu()



//Ketsueki//////////////
	firstSeal
		name="Primeiro Selo"
		icon_state="1stSeal"
		Deactivate(mob/M)
			if(usr.UsingSealOne)
				usr.UsingSealOne=0
			usr<<"O Selo Desativa..."
			src.TurnedOn=0
			src.DelayIt(600,M,"Clan")
		Activate(mob/M)
			src.TurnedOn=1
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			src.Uses+=1
			M.FirstSeal()
		//	src.DelayIt(600,M,"Clan")

	secondSeal
		name="Segundo Selo"
		icon_state="2ndSeal"
		Deactivate(mob/M)
			if(usr.Banpaia)
				usr.Banpaia=0
			usr<<"Você desativa o segundo selo, seus músculos se contraem-se, e seu movimento volta ao normal.."
			src.TurnedOn=0
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			src.Uses+=1
			src.TurnedOn=1
			src.DelayIt(600,M,"Clan")
			M.SecondSeal()
	thirdSeal
		name="Terceiro Selo"
		icon_state="3rdSeal"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(600,M,"Clan")
			M.ThirdSeal()
	fourthSeal
		name="Quarto Selo"
		icon_state="4thSeal"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(1200,M,"Clan")
			M.FourthSeal()
	fifthSeal
		name="Quinto Selo"
		icon_state="5thSeal"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(1200,M,"Clan")
			M.FifthSeal()
	sixthSeal
		name="Sexto Selo"
		icon_state="6thSeal"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(1200,M,"Clan")
			M.SixthSeal()
	SeventhSeal
		name="Setimo Selo"
		icon_state="7thSeal"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(1200,M,"Clan")
			M.SeventhSeal()
	KetsuekiBunshin
		name="Clone de Sangue Jutsu"
		icon_state="KetsuekiBunshin"
		Activate(mob/M)
			if(prob(15))
				M.SealMastery+=1;if(M.SealMastery>100) M.SealMastery=100
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
			M.KetsuekiBunshin()
	Feast
		icon_state="Morder"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.ThirstHold+=pick(0.1,0.2);if(M.ThirstHold>3) M.ThirstHold=3
			if(prob(15))
				M.BloodManipulation+=pick(0.1,0.2);if(M.BloodManipulation>100) M.BloodManipulation=100
			src.Uses+=1
			src.DelayIt(600,M,"Clan")
			M.BloodDrain()
//Kumojin///////////////
	Kumosouiki
		name="Teia de Chakra"
		icon_state="Kumosouiki"
		Activate(mob/M)
			if(prob(15))
				M.WebMastery+=pick(0.5,1); if(M.WebMastery>50) M.WebMastery=50
			if(prob(3))
				M.WebStrength+=0.1;if(M.WebStrength>5) M.WebStrength=5
			src.Uses+=1
			src.DelayIt(350,M,"Clan")
			M.Kumosouiki()
	SpiderSummon
		name="Invocar Aranha"
		icon_state="SpiderSummon"
		Activate(mob/M)
			if(prob(15))
				M.SpiderMastery+=pick(0.5,1); if(M.SpiderMastery>100) M.SpiderMastery=100
			src.Uses+=1
			src.DelayIt(10,M,"Clan")
			M.SpiderSummon()

	GiantWebMaze
		name="Aranha Gigante Teia Labirinto"
		icon_state="Kumoshibari"
		Activate(mob/M)
			if(prob(15))
				M.WebMastery+=pick(0.5,1); if(M.WebMastery>50) M.WebMastery=50
			if(prob(4))
				M.WebStrength+=0.1;if(M.WebStrength>5) M.WebStrength=5
			src.Uses+=1
			src.DelayIt(6000,M,"Clan")
			M.GiantWebMaze()

	Kumoshibari
		name="Teia de Chakra Area"
		icon_state="Kumoshibari"
		Activate(mob/M)
			if(prob(15))
				M.WebMastery+=pick(0.5,1); if(M.WebMastery>50) M.WebMastery=50
			if(prob(4))
				M.WebStrength+=0.1;if(M.WebStrength>5) M.WebStrength=5
			src.Uses+=1
			src.DelayIt(475,M,"Clan")
			for(var/obj/SkillCards/Kumosouka/A in M.LearnedJutsus)
				A.DelayIt(450,M,"Clan")
			M.KumoshibariZ()
	Kumosouka
		name="Teias de chakra Flor"
		icon_state="Kumosouka"
		Activate(mob/M)
			if(prob(15))
				M.WebMastery+=pick(0.5,1); if(M.WebMastery>50) M.WebMastery=50
			if(prob(5))
				M.WebStrength+=0.1;if(M.WebStrength>5) M.WebStrength=5
			src.Uses+=1
			src.DelayIt(450,M)
			for(var/obj/SkillCards/Kumoshibari/A in M.LearnedJutsus)
				A.DelayIt(370,M,"Clan")
			M.KumosoukaZ()
	NenkinYoroi
		name="Armadura de Ouro Pegajosa"
		icon_state="NenkinYoroi"
		Activate(mob/M)
			if(prob(10))
				M.GoldnowDiamond+=pick(0.1,0.2,0.3,0.5); if(M.GoldnowDiamond>5) M.GoldnowDiamond=5
			if(prob(15))
				M.SpiderMastery+=pick(0.5,1); if(M.SpiderMastery>100) M.SpiderMastery=100
			if(prob(15)&&M.GoldenSpike<10)
				M.GoldenSpike+=pick(0.1,0.2);if(M.GoldenSpike>10) M.GoldenSpike=10
			src.Uses+=1
			src.DelayIt(300,M,"Clan")
			M.NenkinNoYoroi()
	Nenkin
		name="Ouro Pegajoso(Kunai)"
		icon_state="Nenkin"
		Activate(mob/M)
			if(prob(15))
				M.SpiderMastery+=pick(0.5,1); if(M.SpiderMastery>100) M.SpiderMastery=100
			if(prob(15)&&M.GoldenSpike<10)
				M.GoldenSpike+=pick(0.1,0.2);if(M.GoldenSpike>10) M.GoldenSpike=10
			src.Uses+=1
			src.DelayIt(30,M,"Clan")
			M.NenkinShoot()

	DaiKumoshibariZ
		name="Florescimento de Teias"
		icon_state="Kumoshibari"
		Activate(mob/M)
			if(prob(15))
				M.WebMastery+=pick(0.5,1); if(M.WebMastery>50) M.WebMastery=50
			if(prob(8))
				M.WebStrength+=0.1;if(M.WebStrength>5) M.WebStrength=5
			src.Uses+=1
			for(var/obj/SkillCards/Kumoshibari/A in M.LearnedJutsus)
				A.DelayIt(370,M,"Clan")
			for(var/obj/SkillCards/Kumosouka/A in M.LearnedJutsus)
				A.DelayIt(270,M,"Clan")
			src.DelayIt(1250,M,"Clan")
			M.DaiKumoshibariZ()

	Kumosenkyuu
		name="Arco De ouro Pegajoso"
		icon_state="Kumosenkyuu"
		Activate(mob/M)
			if(prob(15))
				M.SpiderMastery+=pick(0.5,1); if(M.SpiderMastery>100) M.SpiderMastery=100
			if(prob(15)&&M.GoldenSpike<10)
				M.GoldenSpike+=pick(0.1,0.2);if(M.GoldenSpike>10) M.GoldenSpike=10
			src.Uses+=1
			src.DelayIt(30,M,"Clan")
			M.Kumosenkyuu()
//Kusakin///////////////
	Kamisoriha
		name="Folha Afiada Jutsu"
		icon_state="Kamisoriha"
		Activate(mob/M)
			if(prob(15))
				M.GrassMastery+=pick(0.5,1);if(M.GrassMastery>100) M.GrassMastery=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(300,375)
			src.Uses+=1
			src.DelayIt(110,M,"Clan")
			M.kamisoriha()
	Tsutakei
		name="Vinha-Chicote Jutsu"
		icon_state="Tsutakei"
		Activate(mob/M)
			if(prob(15))
				M.GrassMastery+=pick(0.5,1);if(M.GrassMastery>100) M.GrassMastery=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(225,300)
			src.Uses+=1
			src.DelayIt(210,M,"Clan")
			M.Tsutakei()
	VineFieldJutsu
		name="Vinha Crescimento Jutsu"
		icon_state="Kusahayashi"
		Activate(mob/M)
			if(prob(15))
				M.GrassMastery+=pick(0.5,1);if(M.GrassMastery>100) M.GrassMastery=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(225,300)
			src.Uses+=1
			src.DelayIt(300,M,"Clan")
			M.VineField()

	KusaBushi
		name="No de Grama Jutsu"
		icon_state="KusaBushi"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.GrassMastery+=pick(0.5,1);if(M.GrassMastery>100) M.GrassMastery=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(225,300)
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
			M.KusaBushi()
	Kusahayashi
		name="Floresta de Vinha no Jutsu"
		icon_state="Kusahayashi"
		Activate(mob/M)
			if(prob(15))
				M.GrassMastery+=pick(0.5,1);if(M.GrassMastery>100) M.GrassMastery=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(225,300)
			src.Uses+=1
			src.DelayIt(1200,M,"Clan")
			M.Kusahayashi()
	MokuShouheki
		name="Barreira de Madeira"
		icon_state="MokuShouheki"
		Activate(mob/M)
			if(prob(15))
				M.Senju+=pick(0.5,1,2);if(M.Senju>100) M.Senju=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(450,500)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")
			M.MokuShouheki()
	JukaiKoutan
		name="Crescimento de densa Floresta Jutsu"
		icon_state="JukaiKoutan"
		Activate(mob/M)
			if(prob(15))
				M.Senju+=pick(0.5,1,2);if(M.Senju>100) M.Senju=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(650,1300)
			src.Uses+=1
			src.DelayIt(800,M,"Clan")
			M.JukaiKoutan()
	WoodSpikes
		name="Espinhos de Madeira"
		icon_state="WoodSpikes"
		Activate(mob/M)
			if(prob(15))
				M.Senju+=pick(0.5,1,2);if(M.Senju>100) M.Senju=100
			if(prob(10))
				M.SturdyComposition+=pick(0.01,0.05,0.1);if(M.SturdyComposition>20) M.SturdyComposition=20
			if(M.TypeLearning=="Mokuton")
				M.exp+=rand(650,700)
			src.Uses+=1
			src.DelayIt(450,M,"Clan")
			M.WoodSpikes()




//Kyomou////////////////
	Akametsuki
		name="Akametsuki"
		icon_state="Akametsuki"
		Activate(mob/M)
			if(M.Akametsuki)
				M.Akametsuki()
				src.DelayIt(100,M,"Clan")
				return
			if(M.knockedout)
				return
			M.Akametsuki()
			src.Uses+=1
	AkametsukiSearch
		name="Akametsuki Busca"
		icon_state="Akametsuki"
		Activate(mob/M)
			if(!M.Akametsuki)
				M << "Você precisa ativar o Akametsuki primeiro!"
				return
			if(M.knockedout)
				return
			src.Uses+=1
			src.DelayIt(100,M,"Clan")
			M.AkametsukiSearch2(Uses)

	AkametsukiIlluminate
		name="Akametsuki Iluminar"
		icon_state="Akametsuki"
		Activate(mob/M)
			if(!M.Akametsuki)
				M << "Você precisa ativar o Akametsuki primeiro!"
				return
			if(M.knockedout)
				return
			src.Uses+=1
			src.DelayIt(100,M,"Clan")
			M.AkametsukiIllumin(Uses)

	Particle_Field
		name="Campo de Particulas"
		icon_state="ParticleField"
		Activate(mob/M)
			if(!M.Akametsuki)
				M << "Você precisa ativar o Akametsuki primeiro!";return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.Uses+=1
			src.DelayIt(200,M,"Clan")
			M.ParticleField()
	Particle_Waves
		name="Ondas de Particulas"
		icon_state="ParticleWaves"
		Activate(mob/M)
			if(!M.Akametsuki)
				M << "Você precisa ativar o Akametsuki primeiro!";return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.Uses+=1
			src.DelayIt(100,M,"Clan")
			M.ParticleWaves()
	Particle_Bullet
		name="Bala de Particula "
		icon_state="ParticleBullet"
		Activate(mob/M)
			if(!M.Akametsuki)
				M << "Você precisa ativar o Akametsuki primeiro!";return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.Uses+=1
			src.DelayIt(150,M,"Clan")
			M.ParticleBullet()

	Akametsuki_Rejuvination
		name="Akametsuki rejuvenescimento"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Rejuvination"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas! "
	Akametsuki_Blind
		name="Akametsuki Cegar"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Blind"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Burn
		name="Akametsuki Queimar"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Burn"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Clones
		name="Clones de Particula"
		icon_state="ParticleEffect"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(2000,M,"Nin")
			src.Uses+=1
		//	M.AkametsukiClones()
	Akametsuki_Migrane
		name="Akametsuki enxaqueca"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Migrane"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Chakra_Drain
		name="Akametsuki chakra Drenagem"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Chakra Drain"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Doujutsu_Counter
		name="Akametsuki Doujutsu Contra"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Doujutsu Counter"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Anorexiation
		name="Akametsuki Anorexia"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Anorexiation"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Chakra_Restore
		name="Akametsuki Regeneracao de Chakra"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Chakra Restore"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Daze
		name="Akametsuki ofuscacao"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Daze"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Stamina_Damage
		name="Akametsuki Dano na Energia"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Stamina Damage"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"
	Akametsuki_Reservoir_Absorbtion
		name="Akametsuki Absorcao de reservatório"
		icon_state="ParticleEffect"
		Activate(mob/M)
			M.ParticleAffect = "Reservoir Absorbtion"
			M << "Você já está usando \"[M.ParticleAffect]\" efeito de partículas!"


	MajesticEyes
		name="Majestic Eyes"
		icon_state="GoldEye"
		Activate(mob/M)
			if(M.knockedout)
				return
			M.MajesticEyes()
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
	MajesticIlluminate
		name="Majestic Illuminate"
		icon_state="GoldenIlluminate"
		Activate(mob/M)
			if(M.knockedout)
				return
			M.GoldenIlluminate()
			src.DelayIt(50,M,"Nin")
			src.Uses+=1
	IndigoEyes
		icon_state="GoldEye"
		Activate(mob/M)
			if(M.Indigo)
				M.IndigoEyes()
				src.DelayIt(100,M,"Clan")
				return
			if(M.knockedout)
				return
			M.IndigoEyes()
			src.Uses+=1
	IndigoIlluminate
		name="Illuminating Indigo"
		icon_state="GoldenIlluminate"
		Activate(mob/M)
			if(M.knockedout)
				return
			M.IndigoIlluminate()
			src.DelayIt(50,M,"Nin")
			src.Uses+=1
	Conversusin
		name="Conversusin: Bestialis Anguis"
		icon_state="GoldEye"
		Activate(mob/M)
			if(M.ConversusinEye)
				src.DelayIt(250,M,"Nin")
				M.ConversusinBestialisAnguis()

				return
			if(M.knockedout)
				return
			M.ConversusinBestialisAnguis()
			src.Uses+=1
	ConversusinSecond
		name="Bestialis Anguis: Secondary Transformation"
		icon_state="GoldEye"
		Activate(mob/M)
			if(M.ConversusinSecondStage)
			//	M.ConversusinBestialisAnguisSecondStage()
				src.DelayIt(750,M,"Nin")
				M.ConversusinBestialisAnguisSecondStage()
				return
			if(M.knockedout)
				return
			M.ConversusinBestialisAnguisSecondStage()
			src.Uses+=1
			//SemideusChakraArmReach

	SemideusChakraArm
		name="Semideus Chakra Arm"
		icon_state="KageShibari"
		Activate(mob/M)
			if(M.knockedout)
				return
			src.DelayIt(250,M,"Nin")
			src.Uses+=1
			M.SemideusChakraArmReach()
	SemideusChakraArmReaching
		name="Semideus Chakra Arm Reflection"
		icon_state="KageShibari"
		Activate(mob/M)
			if(M.knockedout)
				return
			src.DelayIt(400,M,"Nin")
			src.Uses+=1
			M.SemideusChakraArmPush()





//Nara//////////////////
	KageShibari
		name="Possesao da Sombra"
		icon_state="KageShibari"
		Activate(mob/M)
			src.Uses+=1
			M.kageshibari()
			src.DelayIt(30,M,"Clan")
	KageMane
		name="Imitacao da Sombra"
		icon_state="KageMane"
		Deactivate(mob/M)
			if(M.InKageMane)
				M.InKageMane=0
			src.DelayIt(60,M,"Clan")
		Activate(mob/M)
			if(M.InKageMane)
				src.Deactivate(M)
			else
				src.Uses+=1
				M.KageMane()
	KageKubiShibari
		name="Enforcamente da Sombra"
		icon_state="KageKubiShibari"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(110,M,"Clan")
			M.KageKubiShibaru()
	KageNui
		name="Sombra de Perfuracao"
		icon_state="KageNui"
		Target_Required=1
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(400,M,"Clan")
			for(var/obj/SkillCards/ForrbiddenShadowArtMassiveNuiOnslaught/S in usr.LearnedJutsus)
				if(!S.Delay)
					S.DelayIt(850,M,"Clan")
			M.KageNuiI()

	KageHara
		name="Sombra-Area Jutsu"
		icon_state="KageHara"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(90,M,"Clan")
			M.KageHara()
	KageNuiField
		name="Sombra Perfurante Area"
		icon_state="KageNui"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(400,M,"Clan")
			M.KageNuiField()
	ForrbiddenShadowArtMassiveNuiOnslaught
		name="Sombra Perfuracao Arremetida"
		icon_state="KageNui"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(950,M,"Clan")
			for(var/obj/SkillCards/KageNui/S in usr.LearnedJutsus)
				if(!S.Delay)
					S.DelayIt(450,M,"Clan")
			M.ForrbiddenShadowArtMassiveNuiOnslaught()
//Sabaku////////////////
	SunaTate
		name="Escudo De Areia"
		icon_state="SunaTate"
		Activate(mob/M)
			if(prob(20))
				M.SandMastery+=pick(0.01,0.2,0.21,0.22,0.23,0.24,0.25);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(50,M,"Clan")
			M.SunaNoTate()
	Sandeye
		name="Terceiro Olho"
		icon_state="Sandeye"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(50,M,"Clan")
			M.Sandeye()
	SunaBunshin
		name="Clone de Areia"
		icon_state="SunaBunshin"
		BunshinAble=0
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(170,M,"Clan")
			M.SunaBunshin()
	SunaSoujou
		name="Manipulacao da Areia"
		icon_state="SunaSoujou"
		Activate(mob/M)
			if(M.SunaMode)
				if(M&&M.SunaMode)
					M<<"Você libera a areia!"
					src.DelayIt(100,M,"Clan")
					M.SunaMode=0
					M.firing=0
					M.controlled=null
					M.client.perspective=MOB_PERSPECTIVE
					M.client.eye=usr
					for(var/mob/Sand/Suna/P in world) if(P.Owner == M) del(P)
					for(var/obj/Jutsu/Sand/Suna2/MM in world) if(MM.Owner == M) del(MM)
					return
			else
				if(prob(15))
					M.SandMastery+=pick(0.01,0.1);if(M.SandMastery>100) M.SandMastery=100
				M.Sunasoujuu()
				src.Uses+=1
	SabakuKyuu
		name="Caixao de Areia"
		icon_state="SabakuKyuu"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(475,M,"Clan")
			for(var/obj/SkillCards/SabakuSousou/S in usr.LearnedJutsus)
				if(!S.Delay)
					S.DelayIt(30,M,"Clan")
			M.SabakuKyuu()
	SatetsuKyuu
		name="Prisão de Ferro"
		icon_state="SatetsuKyuu"
		Target_Required=1
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(475,M,"Clan")
			for(var/obj/SkillCards/SatetsuSousou/S in usr.LearnedJutsus)
				if(!S.Delay)
					S.DelayIt(30,M,"Clan")
			M.SatetsuKyuu()

				//This is to keep people from Kyuu+Sousouing instantly when 1 tile away from the target.
				//It gives the target a CHANCE to struggle out.
	SabakuSousou
		name="Funeral de Areia"
		icon_state="SabakuSousou"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(500,M,"Clan")
			M.SabakuSousou()
	SatetsuSousou
		name="Funeral de Ferro"
		icon_state="SatetsuSousou"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(500,M,"Clan")
			M.SatetsuSousou()
	SabakuSandField
		name="Campo de Areia"
		icon_state="SandWall2"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(900,M,"Clan")
			for(var/obj/SkillCards/SabakuSandFieldBurial/S in usr.LearnedJutsus)
				if(!S.Delay)
					S.DelayIt(15,M,"Clan")
			M.Sabaku_SandField()
	SatetsuSandField
		name="Enterro de Ferro"
		icon_state="SatetsuWall2"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(900,M,"Clan")
			for(var/obj/SkillCards/SatetsuSandFieldBurial/S in usr.LearnedJutsus)
				if(!S.Delay)
					S.DelayIt(15,M,"Clan")
			M.Satetsu_SandField()
	SabakuSandFieldBurial
		name="Campo de Areia Enterro"
		icon_state="BakuryuRyusaBurial"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(700,M,"Clan")
			M.Sabaku_SandFieldBurial()
	SatetsuSandFieldBurial
		name="Comprensão de Ferro"
		icon_state="SatetsuTaisou"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(700,M,"Clan")
			M.Satetsu_SandFieldBurial()
	BakuryuRyusa
		name="Cachoeira de Areia Corrente"
		icon_state="BakuryuRyusa"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(600,M,"Clan")
			M.Bakuryu_Ryusa()
	SunaShuriken
		name="Shuriken de Areia"
		icon_state="SunaShuriken"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(30,M,"Clan")
			M.SunaShuriken(src.Uses)
	SatetsuShuriken
		name="Senbon de Ferro"
		icon_state="SatetsuSenbon"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(30,M,"Clan")
			M.SatetsuShuriken(src.Uses)
	SabakuTaisou
		name="Funeral imperial de Areia"
		icon_state="SabakuTaisou"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(1250,M,"Clan")
			M.Sabaku_Taisou()
	SunaWhip
		name="Chicote de Areia"
		icon_state="SandWhip"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(80,M,"Clan")
			M.SunaWhip()
	SandErosion
		name="Erosão de Areia"
		icon_state="SabakuTaisou"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(1250,M,"Clan")
			M.Erosion()
	SandArm
		name="Braço de Areia"
		icon_state="SandArm"
		Activate(mob/M)
			if(prob(15))
				M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
			src.Uses+=1
			src.DelayIt(550,M,"Clan")
			M.SandArm()
	SandSphere
		name="Esfera de Areia"
		icon_state="SandSphere"
		BunshinAble=0
		Activate(mob/M)
			if(M.sphere)
				M.FrozenBind="";M.firing=0
				for(var/obj/Jutsu/Sand/Sphere/Zzz in world)
					if(Zzz.Owner==M)
						del(Zzz)
				M.sphere=0;M<<"Você desfaz a esfera de areia.";M.usingS=0
				src.DelayIt(250,M,"Clan")
				return
			else
				if(prob(15))
					M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
				src.Uses+=1
				M.SandSphere(Uses)
	SatetsuSphere
		name="Proteção de Ferro"
		icon_state="SatetsuSphere"
		BunshinAble=0
		Activate(mob/M)
			if(M.sphere)
				M.FrozenBind="";M.firing=0
				for(var/obj/Jutsu/Sant/SatetsuSphere/Zzz in world)
					if(Zzz.Owner==M)
						del(Zzz)
				M.sphere=0;M<<"Você desfaz a esfera de ferro.";M.usingS=0
				src.DelayIt(250,M,"Clan")
				return
			else
				if(prob(15))
					M.SandMastery+=pick(0.01,0.2);if(M.SandMastery>100) M.SandMastery=100
				src.Uses+=1
				M.SatetsuSphere(Uses)
//Chinoike/////////////
	Ketsuryugan
		icon_state="Sharingan"//Adicionar icone
		Activate(mob/M)
			if(M.ketsu)
				M.Ketsuryugan()
				src.DelayIt(100,M,"Clan")
				return
			if(M.knockedout)
				return
			M.Ketsuryugan()
			src.Uses+=1
	KetsuryuganExplode
		name="Ketusuryugan: Humano Explosivo"
		icon_state="Sharingan"//Adicionar icone
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")//1200
			M.ExplodingHumanTechnique()
	KetsuryuganGenjutsu
		name="Ketsuryugan: Genjutsu"
		icon_state="Sharingan"//Adicionar icone
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")//300
			M.KetsuryuganGenjutsu()
	KetsuryuganIlluminate
		name="Ketsuryugan: Iluminar"
		icon_state="SharIlluminate"//Adicionar icone
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
			M.KetsuryuganIlluminate()
	KetsuryuganNeedles
		name="Ketsuryugan: Agulhas de Sangue"
		icon_state="Sharingan"//Adicionar icone
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")//Pensar em delay
			M.KetsuryuganNeedle()
	KetsuryuganPunch
		name="Ketsuryugan: Soco"
		icon_state="Sharingan"//Adicionar icone
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")//Pensar em delay
			M.KetsuryuganPunchGenjutsu()
//Uchiha//////////////
	Sharingan
		icon_state="Sharingan"
		Activate(mob/M)
			if(M.shari)
				M.Sharingan()
				src.DelayIt(100,M,"Clan")
				return
			if(M.knockedout)
				return
			M.Sharingan()
			src.Uses+=1
	SharinganIlluminate
		name ="Sharingan iluminar"
		icon_state="SharIlluminate"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
			M.SharinganIlluminate()
	SharinganFocus
		name ="Sharingan Focar"
		icon_state="SharIlluminate"
		BunshinAble=0
		NonKeepable=1
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(250,M,"Clan")
			M.SharinganFocus()

	SharinganCopy
		name="Sharingan Copiar"
		icon_state="SharCopy"
		BunshinAble=0
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(100,M,"Clan")
			M.Sharingancopy()
	GenjutsuCounter
		name="Genjutsu Contra"
		icon_state="GenjutsuCounter"
		BunshinAble=0
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(300,M,"Clan")
			M.GenjutsuCounter()
	Kasegui
		name="Ilusão demoniaca: Suspensão de Estacas"
		icon_state="Kasegui"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(600,M,"Clan")
			M.Kasegui()
	Konsui
		name="Ilusão demoniaca: Hipnose"
		icon_state="Sleep"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(600,M,"Clan")
			M.Konsui()
	Mangekyo
		name="Mangekyo Sharingan"
		icon_state="Mangekyo"
		BunshinAble=0
		Activate(mob/M)
			if(M.knockedout)
				return
			src.Uses+=1
			M.MangekyouPrep()
			if(!M.mangekyou)
				src.DelayIt(700,M,"Clan")
				src.Uses+=1
	OneMangekyo
		name="Um olho Mangekyo Sharingan"
		icon_state="Mangekyo2"
		BunshinAble=0
		Activate(mob/M)
			if(M.knockedout)
				return
			src.Uses+=1
			M.OneMangekyou()
			if(!M.mangekyou)
				src.DelayIt(700,M,"Clan")
				src.Uses+=1
	OneEternalMangekyo
		name="Um olho Eternal Mangekyo Sharingan"
		icon_state="Mangekyo3"
		BunshinAble=0
		Activate(mob/M)
			if(M.knockedout)
				return
			src.Uses+=1
			M.OneMangekyouShisui()
			if(!M.mangekyou)
				src.DelayIt(700,M,"Clan")
				src.Uses+=1
	EternalMangekyo
		name="Mangekyo Sharingan"
		icon_state="EternalMangekyo"
		BunshinAble=0
		Activate(mob/M)
			if(M.knockedout)
				return
			src.Uses+=1
			M.EMS()
			if(!M.mangekyou)
				src.DelayIt(700,M,"Clan")
				src.Uses+=1
	//MangAttacks
	Amateratsu
		name="Amateratsu"
		icon_state="Amaterasu2"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			if(M.UsingAmaterasu)
				src.DelayIt(1800,M,"Clan")
				M.UsingAmaterasu=0
			else
				src.Uses+=1
				M.Amateratsu()
	AmateratsuExplosion
		name="Amateratsu Explosao"
		icon_state="Amaterasu"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			if(M.UsingAmaterasuExplosion)
				src.DelayIt(900,M,"Clan")
				M.UsingAmaterasuExplosion=0
			else
				src.Uses+=1
				M.AmaterasuExplosion()
	AmateratsuProjectile
		name="Amateratsu(Projetil)"
		icon_state="Amaterasu"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.DelayIt(1200,M,"Clan")
			src.Uses+=1
			M.ProjectileAmaterasu()
	WhiteAmateratsuProjectile
		name="Amaterasu Branco"
		icon_state="WhiteAmateratsu"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo";return
			src.DelayIt(900,M,"Clan")
			src.Uses+=1
			M.WhiteProjectileAmaterasu()
	WhiteAmaterasu360
		name="Amaterasu Branco: Tiro Espalhador"
		icon_state="WhiteAmateratsuSmall"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.DelayIt(600,M,"Clan")
			src.Uses+=1
			M.WhiteFireShot()
	Susanoo
		name="Susanoo"
		icon_state="Susanoo"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(M.SusanooIn)
				for(var/obj/Jutsu/Uchiha/Susanoo/A in world)
					if(A.Owner==M)
						del(A)
				M.SusanooIn=0
				src.DelayIt(1200,M,"Clan")
				return
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			else
				src.Uses+=1
				M.Susanoo(src.Uses)
	XeidusCreation
		name="Xeidus Creation"
		icon_state="Xeidus Creation"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(M.InXeidus)
				for(var/obj/Jutsu/Deviant/Xeidus/A in world)
					if(A.Owner==M)
						M.nin=M.Mnin
						M.tai=M.Mtai
						M.gen=M.Mgen
						del(A)
				M.InXeidus=0
				src.DelayIt(1200,M,"Clan")
				return
			src.Uses+=1
			M.XeidusCreation(src.Uses)

	SusanooAmatDefence
		name="Susanoo: Entidade de defesa de Luz"
		icon_state="Susanoo"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.SusanooIn)
				src.DelayIt(200,M,"Clan")
				M<<"Você precisa estar usando o Susanoo!";return
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			else
				src.Uses+=1
				M.SasukeAmatDefence("Light")
	SusanooAmatDefence2
		name="Susanoo: Defesa de Enton"
		icon_state="Susanoo"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.SusanooIn)
				src.DelayIt(200,M,"Clan")
				M<<"Você precisa estar usando o Susanoo!";return
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			else
				src.Uses+=1
				M.SasukeAmatDefence("Medium")
	SusanooAmatDefence3
		name="Susanoo: Defesa de Enton Forte"
		icon_state="Susanoo"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.SusanooIn)
				src.DelayIt(200,M,"Clan")
				M<<"Você precisa estar usando o Susanoo!";return
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			else
				src.Uses+=1
				M.SasukeAmatDefence("Heavy")
	Tsukiyomi
		name="Tsukuyomi"
		icon_state="Tsukiyomi"
		Target_Required=1
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.DelayIt(600,M)
			src.Uses+=1
			for(var/obj/SkillCards/Kamui/A in M.LearnedJutsus)
				A.DelayIt(300,M,"Clan")
			M.Tsukiyomi()
	Kamui
		name="Kamui"
		icon_state="GodsMajesty"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(PermDeath)
				M<<"Disabled during Permanent death mode!"
				return
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.DelayIt(600,M)
			src.Uses+=1
			for(var/obj/SkillCards/Tsukiyomi/A in M.LearnedJutsus)
				A.DelayIt(300,M,"Clan")
			M.Kamui()
	TimeCollaboration
		name="Colaboracao do Tempo"
		icon_state="TimeCollaboration"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.DelayIt(150,M)
			src.Uses+=1
			for(var/obj/SkillCards/Kamui/A in M.LearnedJutsus)
				A.DelayIt(300,M,"Clan")
			M.TimeCollaboration()

	Phase
		name="Intangivel"
		icon_state="Phase"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			else
				src.Uses+=1
				M.Phase()
	GhostParasite//Takashi's Custom
		name="Parasita Fantasma"
		icon_state="Phase"
		BunshinAble=0
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(600,M,"Nin")
			M.GhostParasite()
	NonExistance
		name="Non-Existance"
		icon_state="Phase"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			src.Uses+=1
			M.NonExist()
	MindGenjutsu
		name="KotoAmatsukami 1"
		icon_state="Mind"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.Uses+=1
			M.Mind_Genjutsu()
	Invisibility
		name="KotoAmatsukami 2"
		icon_state="Invisibility"
		NonKeepable=1
		BunshinAble=0
		Deactivate(mob/M)
			if(M.invisibility==100)
				M.Invisibility()
			src.TurnedOn=0
			src.DelayIt(600,M,"Clan")
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.Uses+=1
			src.TurnedOn=1
			M.Invisibility()
	FalseBunshin
		name="KotoAmatsukami 3"
		icon_state="FalseBunshin"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.Uses+=1
			spawn()
				src.DelayIt(200,M,"Clan")
			var/mob/A = input(usr,"Which mob?") as mob in world
			M.False_Bunshin(A)
	GenjutsuBunshin
		name="KotoAmatsukami 4"
		icon_state="GenjutsuBunshin"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.Uses+=1
			spawn()
				src.DelayIt(200,M,"Clan")
			M.Bunshin_MindFuck()
	UchihaAura
		name="Aura de Chakra"
		icon_state="EternalMangekyo"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.mangekyou)
				M<<"Mangekyo Sharingan precisa esta ativo!";return
			src.Uses+=1
			spawn()
				src.DelayIt(200,M,"Clan")
			M.CreateUchihaAura()
	UchihaAuraOff
		name="Desativar Aura de Chakra"
		icon_state="EternalMangekyo"
		NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			src.Uses+=1
			spawn()
				src.DelayIt(50,M,"Clan")
			M.RemoveUchihaAura()



////////////////////////////////////////
//Taijutsu
/////////////////////
	KonohaReppu
		name="Vento Violento da Folha"
		icon_state="Reppu"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] move as pernas para formar [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(150,usr,"Tai")
			src.Uses+=1
			M.Reppu()
	KonohaSenpuu
		name="Redemoinho da Folha"
		icon_state="Senpuu"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] começa a mover seu corpo para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(630,usr,"Tai")
			src.Uses+=1
			M.Senpuu()
	KonohaShofuu
		name="Nascente do vento da Folha"
		icon_state="Shofuu"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(590,usr,"Tai")
			src.Uses+=1
			M.KonohaShofuu()
	KonohaGenkurikiSenpuu
		name="Redemoinho Forte da Folha"
		icon_state="GenkurikiSenpuu"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(580,usr,"Tai")
			src.Uses+=1
			M.KonohaGenkurikiSenpuu()
	KonohaDaiSenpuu
		name="Redemoinho Grande da Folha"
		icon_state="DaiSenpuu"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(650,usr,"Tai")
			src.Uses+=1
			M.KonohaDaiSenpuu()
	KonohaDaiSenkou
		name="Grande Rotacao de Luz da Folha"
		icon_state="DaiSenkou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(400,usr,"Tai")
			src.Uses+=1
			M.KonohaDaiSenkou()
	FingerPush
		name="Mil anos de Dor"
		icon_state="FingerPush"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(150,usr,"Tai")
			src.Uses+=1
			M.TheFingerPush()
	Choke
		name="Enforcar"
		icon_state="Choke"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1


			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] Levanta a Mao no seu pescoço para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(300,usr,"Tai")
			src.Uses+=1
			M.Choke()
	ChokeSlam//ChokeSlamProc
		name="Batida de bloqueador"
		icon_state="Choke Slam"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(650,usr,"Tai")
			src.Uses+=1
			M.ChokeSlamProc()

	HiddenLotus
		name="Lotus Oculta"
		icon_state="Gate2"//LotusProc()
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
//			for(var/mob/A in oview(10))
//				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(2000,usr,"Tai")
			src.Uses+=1
			M.LotusProc()

	GateAssault//GateAssaultProc
		name="Lotus Primaria"
		icon_state="Gate1"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
//			for(var/mob/A in oview(10))
//				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(1500,usr,"Tai")
			src.Uses+=1
			M.GateAssaultProc()
	Axe_Kick
		name="Chute Machado"
		icon_state="AxeKick"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1


			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] begins to charge at you with a fast paced kick called [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(225,usr,"Tai")
			src.Uses+=1
			M.Axe_Kick()
	Lion_Punch
		name="Soco de Leao"
		icon_state="ReflexPunch"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1


			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] appears behind you as they attempt to land [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(200,usr,"Tai")
			src.Uses+=1
			M.LionPunch()
	Shishi
		name="Barragem  de Leos"
		icon_state="Shi-shi"
		Target_Required=1
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(600,usr,"Tai")
			src.Uses+=1
			M.Shishi()
	CalmMind
		name="Mente Calma"
		icon_state="Asshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(200,usr,"Tai")
			src.Uses+=1
			M.CalmingMind()
	SoothingSlam
		name="Batiada Calma"
		icon_state="Asshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);
				if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.SoothingSlam(Uses)
	ReactionAbove
		name="Reacao preventiva Acima"
		icon_state="Asshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.CautionaryReactionAbove(Uses)
	ReactionBelow
		name="Reacao preventiva Abaixo"
		icon_state="Asshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.CautionaryReactionBelow(Uses)
	Asshou
		name="Desintegracao da palma"
		icon_state="Asshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] começa a carregar seu soco para soltar [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(200,usr,"Tai")
			src.Uses+=1
			M.Asshou()
	ChouAsshou
		name="Abrir largamente Desintegracao da Palma"
		icon_state="CAsshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] começa a carregar seu soco para soltar [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.CAsshou()
	DroppingKick
		name="Chute Largo"
		icon_state="Asshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] levanta a perna acima de sua cabeca para chutar [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(500,usr,"Tai")
			src.Uses+=1
			M.DropKick()
	Hoshou
		name="Pressao de Palma"
		icon_state="Hoshou"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.DownwardPalm()
	Shoushitzu
		name="Alta batida de joelho"
		icon_state="Shoushitzu"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1


			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] levanta a perna acima de sua cabeca para chutar [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(400,usr,"Tai")
			src.Uses+=1
			M.Shoushitzu()
	FlashKick
		name="Chute Rapido"
		icon_state="Flash Kick"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(550,usr,"Tai")
			src.Uses+=1
			M.L_Kick()
	KageBuyou
		name="Danca das Sombras"
		icon_state="KageBuyou"
		Target_Required=1
		Activate(mob/M)
			if(prob(15))
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(2500,usr,"Tai")
			src.Uses+=1
			M.KageBuyou()
	QuickFeet
		name="Pés ligeiros"
		icon_state="QuickFoot"
		Activate(mob/M)
			if(M.QuickFeet)
				M<<output("Você saiu do modo Pés ligeiros!","Attack");M.QuickFeet=0;M.Normal()
				src.DelayIt(300,usr,"Tai")
			else
				M<<output("Você entrou do modo Pés ligeiros!","Attack");M.QuickFeet=1;src.Uses+=1;M.Face()
				spawn(50)
					M.QuickFeet=0;M.Normal()
				for(var/mob/A in oview(10))
					if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

	SoundSpinningKick
		name="Pontapé Giro do Som"
		icon_state="Soundspinningkick"
		Deactivate(mob/M)
			src.DelayIt(250,M,"Tai");M.icon_state=""
			M.SoundSpinningKick=0
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=pick(0.1,0.2)
			for(var/mob/A in oview(10))
				if(A.CopyMode)A.SharinganCopy(src.type,src.Uses)
			src.TurnedOn=1
			M.SoundSpinningKick()
			src.Uses+=1

	LeapingSoundSpinKick//LeapingSoundSpinKickProc()
		name="Rotação de Pontape do Som "
		icon_state="SilentStep"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.LeapingSoundSpinKickProc()
	SoundWhirlwindKick
		name="Remoinho de Pontapé do Som"
		icon_state="SoundGreatWhirlwindkick"
		Target_Required=1
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(250,usr,"Tai")
			src.Uses+=1
			M.SoundWhirlwindKick()
	RapidPunch
		name="Socos de velocidade do Som"
		icon_state="RapidPunch"
		Activate(mob/M)
			if(prob(15)&&M.TaijutsuMastery<10)
				M.TaijutsuMastery+=pick(0.01,0.1);if(M.TaijutsuMastery>10) M.TaijutsuMastery=10
			if(prob(15))
				M.TaijutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(300,usr,"Tai")
			src.Uses+=1
			M.RapidPunchProc()




	Karakuri
		name="Movimento Discreto"
		icon_state="Stealth"
		Activate(mob/M)
			for(var/mob/A in oview(10))
				if(A.CopyMode)A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(15,M,"Tai")
			M.Karakuri()
			src.Uses+=1

////////////////////////////////////////
//Genjutsu
/////////////////////
	FalseBugSwarm
		name="Falso Enxame de insetos"
		icon_state="FalseBugSwarm"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<30)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1;if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(15))
				M.GenjutsuKnowledge+=1
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(600,M,"Gen")
			M.GenjutsuProc("HekiKonchuu Ishuu","Affect","Target",300,30,15,50,(usr.gen+(usr.GenjutsuMastery*20)),0)
			src.Uses+=1
	FearofProjectiles
		name="Medo de Projéteis"
		icon_state="FireMod"
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
		//	if(M.GenSkill+(usr.ChakraC/25)<22)
		//		M<<output("The jutsu failed.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1250,M,"Gen")
			src.Uses+=1
			M.FearofProjectiles()
	GazeOfFear
		name="Olhar do medo"
		icon_state="FireMode"
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<15)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1250,M,"Gen")
			src.Uses+=1
			M.GyoushinoKigi()
	DrainingVortex
		name="Drenagem de Vórtice"
		icon_state="FireMode"
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<15)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1250,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Vortex","Affect","Target",300,10,20,110,M.GenjutsuMastery+(M.gen/1.5),1)


	BlazingBurn
		name="Corpo em Chamas"
		icon_state="FireMode"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<15)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(600,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Blazing Burn","Affect","Target",300,30,15,50,(M.gen+(M.GenjutsuMastery*10)),0)


	Kokuangyo
		name="Portador da escuridão"
		icon_state="Kokuangyo"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<15)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(600,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Kokuangyo","Affect","Target",500,10,15,25,M.GenjutsuMastery,1)

	Burizado
		name="Ilusão Tempestade de Nevasca"
		icon_state="Buriza-do"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				src.DelayIt(350,M,"Gen")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<=9)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(350,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Burizado","Affect","Target",300,10,10,75,M.GenjutsuMastery+(M.gen/2),1)

	GravityDestruction
		name="Destruição Gravitacional intensa"
		icon_state="Buriza-do"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				src.DelayIt(350,M,"Gen")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<20)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(350,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Gravity","Affect","Target",300,10,10,75,M.GenjutsuMastery+(M.gen/2)+20,1)

	Kasumi
		name="Técnica Servo da Névoa"
		icon_state="Bunshin"
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<15)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(15))
				M.GenjutsuKnowledge+=1
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(550,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Kasumi",,"Area",250,,,,,)

	AOEBurizado
		name="Ilusão Tempestade de Nevasca(Área)"
		icon_state="Buriza-do"
		BunshinAble=0
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<18)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(15))
				M.GenjutsuKnowledge+=1
			if(M.GenjutsuKnowledge<200)
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(550,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("BurizadoAOE",,"Area",250,,,,,)
	AOEKokuangyo
		name="Portador da escuridão(Área)"
		icon_state="Kokuangyo"
		BunshinAble=0
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<19)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(8*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
				M.GenjutsuKnowledge+=1
			if(M.GenjutsuKnowledge<200)
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(550,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("KokuangyoAOE",,"Area",250,,,,,)
	Nemurihane
		name="Templo de Nirvana"
		icon_state="Nemurihane"
		BunshinAble=0
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<15)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200)
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(550,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Nemurihane",,"Area",250,,,,,)
	Kiga
		name="Fome"
		icon_state="Kiga"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				src.DelayIt(350,M,"Gen")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/10)<5)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(350,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Kiga","Affect","Target",100,10,10,25,((M.gen/3)+M.GenjutsuMastery),1)


	FalseDeath
		name="False Death Jutsu"
		icon_state="FuuinjutsuChakra"
		Activate(mob/M)
			if(M.PlayingDead)
				M.PlayingDead=0
				return
			if(M.knockedout && (Uses<500 || M.NinjutsuKnowledge<1000))
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.Uses+=1
	//		M.FalseDeath(src.Uses)
			src.DelayIt(1250,M,"Nin")

	NodonoKawaki
		name="Sede"
		icon_state="NodonoKawaki"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				src.DelayIt(350,M,"None")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/10)<5)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(350,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Nodono Kawaki","Affect","Target",100,10,10,25,((M.gen/3)+M.GenjutsuMastery),1)
	GyakuBijon
		name="Tontura"
		icon_state="GyakuBijon"
		Target_Required=1
		Activate(mob/M)
			if(M.CastingGenjutsu)
				src.DelayIt(350,M,"None")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<10)
				M<<output("Você não pode manipular seu chakra o suficiente para usar isto.","Attack");return
			if(prob(15))
				M.GenjutsuMastery+=0.1
				if(M.GenjutsuMastery>10) M.GenjutsuMastery=10
			if(prob(7*(M.ChakraManipulator+1)))
				M.GenjutsuKnowledge+=1
			else if(M.GenjutsuKnowledge<200&&prob(5))
				M.GenjutsuKnowledge+=1
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(prob(3))
				M.MentalDamage+=0.1;if(M.MentalDamage>10) M.MentalDamage=10
			src.DelayIt(350,M,"Gen")
			src.Uses+=1
			M.GenjutsuProc("Gyaku Bijon","Affect","Target",250,10,10,25,((M.gen/2)+M.GenjutsuMastery),1)
////////////////////////////////////////
//Fuuinjutsu
/////////////////////
	FuuinjutsuHandseal
		name="Fuuinjutsu: Selo de Mão"
		icon_state="FuuinjutsuHandseal"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.FuuinjutsuHandseal()
	FuuinjutsuChakra
		name="Fuuinjutsu: Chakra"
		icon_state="FuuinjutsuChakra"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.FuuinjutsuChakra()
	FuuinjutsuControl
		name="Fuuinjutsu: Controle"
		icon_state="FuiinjutsuControl"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.GenSkill<17)
				M<<output("O jutsu falhou devido à falta de Controle de chakra.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.FuuinjutsuControl()
	FuuinjutsuCurseSealOfParalysis
		name="Selo Amaldiçoado de paralisia"
		icon_state="FuuinjutsuChakra"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.GenSkill<20&&M.key!="")
				M<<output("O jutsu falhou devido à falta de Controle de chakra.","Attack");return
			src.DelayIt(300,M,"Nin")
			src.Uses+=1
			M.CurseSealOfParalysis()
	ReverseFourSymbols
		name="Reverter quatro Símbolos de Selagem"
		icon_state="FuuinjutsuChakra"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.GenSkill<23&&M.key!="")
				M<<output("O jutsu falhou devido à falta de Controle de chakra.","Attack");return
			src.DelayIt(3600,M,"Nin")
			src.Uses+=1
			M.ReverseFourSymbolsTechnique()
	UpperCloathingRemoval
		name="Retirar a roupa superior"
		icon_state="FuuinjutsuChakra"
		Activate(mob/M)
			src.DelayIt(3600,M,"Nin")
			M.RemoveUpperCloathing()
	FiveElementSeal
		name="Selo dos Cinco Elementos"
		icon_state="FuiinjutsuControl"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.GenSkill<23)
				M<<output("O jutsu falhou devido à falta de Controle de chakra.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.FuuinjutsuFiveElementSeal()
	FuuinjutsuHellSent
		name="Fuuinjutsu: Selo do Inferno"
		icon_state="FuiinjutsuControl"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.GenSkill<21.5)
				M<<output("O jutsu falhou devido à falta de Controle de chakra.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.FuuinjutsuHellSentRestoration()
	MindControlJutsu
		name="Fuuinjutsu: Controle da Mente"
		icon_state="FuuinjutsuControl"
		Deactivate(mob/M)
			M.MindControlJutsu()
			DelayIt(600,M,"Nin")
		Activate(mob/M)
			src.Uses++
			src.TurnedOn=1
			M.CastingMindControl=1
			M<<"Clique em alguém que você deseja controlar para colocar um selo de chakra, em seguida, pressione Z para ativar o selo!"
////////////////////////////////////////
////////////////////////////////////////
//
/////////////////////
	Puppet_Master_Jutsu
		name="Mestre dos Bonecos"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.PuppetMasterJutsu()
	Unsummon_Puppet_One
		name="Desinvocar Bonecos(1)"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.ReturnPuppet("Keyboard")
	Unsummon_Puppet_Two
		name="Desinvocar Bonecos(2)"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.ReturnPuppet("Mouse")
	Hawk_Change_Mode
		name="Mudança Movimento Hawk"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.ChooseHawkMode()
			src.DelayIt(100,M)
	Puppet_Body_Swap
		name="Corpo/Boneco Alternar"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.PositionSwap()
			src.DelayIt(250,M)
	Puppet_Body_View
		name="Corpo/Boneco Ver"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.PuppetView()
	Puppet_Return
		name="Retornar Boneco"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			M.PuppetReturn()
	PuppetPoisonSpread
		name="Boneco Espalhar Veneno Iniciante"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(300)
			M.PoisonRelease("Light")
	PuppetPoisonSpreadMedium
		name="Boneco Espalhar Veneno Medio"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(500)
			M.PoisonRelease("Medium")
	PuppetPoisonSpreadHeavy
		name="Boneco Espalhar Veneno Forte"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			src.Uses+=1
			src.DelayIt(600)
			M.PoisonRelease("Heavy")
	SpreadingSmokeScreenLight
		name="Hawk: Fumaça Espalhar Iniciante"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(istype(M,/mob/Puppet/Hawk))
				//var/mob/A=M.Owner
				src.Uses+=1
				src.DelayIt(450)
				M.HawkSmokeScreen("Light")
	SpreadingSmokeScreenMedium
		name="Hawk: Fumaça Espalhar Medio"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(istype(M,/mob/Puppet/Hawk))
				//var/mob/A=M.Owner
				src.Uses+=1
				src.DelayIt(500)
				M.HawkSmokeScreen("Medium")
	SpreadingSmokeScreenHeavy
		name="Hawk: Fumaça Espalhar Forte"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(istype(M,/mob/Puppet/Hawk))
				//var/mob/A=M.Owner
				src.Uses+=1
				src.DelayIt(650)
				M.HawkSmokeScreen("Heavy")
	SenbonLauncherLight
		name="Talon:Lançamento de Senbon Iniciante"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
	//		world<<"Test. [M] is the mob/M"
			if(istype(M,/mob/Puppet/Talon))
		//		world<<"Type Identified."
				src.Uses+=1
				src.DelayIt(300)
				M.SenbonLauncher(5,5)


////////////////////////////////////////
//Ninjutsu
/////////////////////


////////////////////////////////////////
//Space Time Jutsu - Sorta >_> xD
/////////////////////
	SetLeftHandSpaceTime
		name="Espaço tempo Ninjutsu - Esquerda"
		icon_state="SetLeftHand"
		Activate(mob/M)
			usr.SetLeftHandSpaceTime()
	SetRightHandSpaceTime
		name="Espaço tempo Ninjutsu - Direita"
		icon_state="SetRightHand"
		Activate(mob/M)
			usr.SetRightHandSpaceTime()
	SpaceTimeFreezeTimeSelect
		name="Espaço tempo Ninjutsu - Seleção Paralizar "
		icon_state="SetRightHand"
		Activate(mob/M)
			M.FreezeTimeSelect()
	SpaceTimeFreeze
		name="Espaço tempo Ninjutsu - Paralizar"
		icon_state="SetRightHand"
		Activate(mob/M)
			M.FreezeTime(M.FreezeTime)
//	FreezeHands
//	FreezeLegs
//	FreezeTime
//	VoidInhale
//	VoidExhale
//	VoidDevour
//	VoidTransport

	BunshinJutsu
		name="Jutsu de Clone"
		icon_state="Bunshin"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.BunshinTechniques(src.Uses/2)
	BunshinSubsitutionJutsu
		name="Truque do Clone"
		icon_state="BunshinTrick2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.BunshinSubsitutionTechniques(src.Uses/2)


	Henge
		BunshinAble=0
		name="Jutsu de Transformação"
		icon_state="Henge"
		Deactivate(mob/M)
			if(M.InHenge)
				M.HengeJutsu()
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(250,M,"Nin")
			src.Uses+=1
			src.TurnedOn=1
			M.HengeJutsu()
	Kawarimi
		BunshinAble=0
		name="Jutsu de Substituição"
		icon_state="Kawarimi"
		Deactivate(mob/M)
			if(M.invisibility>1)
				M.invisibility=1
				M.firing=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(300,M,"Nin")
			src.Uses+=1
			src.TurnedOn=1
			for(var/obj/SkillCards/ExpKawarimi/A in M.LearnedJutsus)
				A.DelayIt(300,M)
			M.Kawa(src.Uses)
	ExpKawarimi
		BunshinAble=0
		name="Jutsu de Substituição Explosiva"
		icon_state="ExpKawarimi"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(300,M,"Nin")
			src.Uses+=1
			for(var/obj/SkillCards/Kawarimi/A in M.LearnedJutsus)
				A.DelayIt(300,M)
			M.Kawa2(src.Uses)
	Shushin
		name="Corpo Cintilante"
		icon_state="Shushin"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.UchihaMastery!=100)
				var/Delay=35-(M.BodyFlickerRepetition*10)
				src.DelayIt(max(5,Delay),M,"Tai")
			src.Uses+=1
			M.AbleToMoonsplitter=1
			spawn(50)
				M.AbleToMoonsplitter=0
			M.ShushinnoJutsu(src.Uses)


	Nawanuke
		name="Jutsu de Escape"
		icon_state="Nawanuke"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(50,M)
			src.Uses+=1
			M.Nawanuke()
	ExplodingFormation
		name="Formação de explosão"
		icon_state="ExplodingTagFormation"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(80,M)
			src.Uses+=1
			M.TagExplosion()
	RainingTags
		name="Chover Etiqutas Explosivas"
		icon_state="ExplodingTagFormation"
		Activate(mob/M)
			for(var/obj/SkillCards/ExplodingFormation/P in usr.LearnedJutsus)
				if(!P.Delay)
					P.DelayIt(30,M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(1200,M)
			src.Uses+=1
			M.RainOfTags()
	HariganeGappei
		name="Fio de Chakra"
		icon_state="HariganeGappei"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(90)
			src.Uses+=1
			M.HariganeGappei()
	FuumaTeleportation
		name="Fuuma Teletransporte"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(M.Village!="Rain")
				M<<"Your Rain Village Pride is gone..This doesn't belong to you.."
				del(src)
				return
			if(M.Jailed)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1000,M,"Nin")
			src.Uses+=1
			M.FuumaTeleport()
	SatakeTeleportation
		name="Satake Teletransporte"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(M.Village!="Sound")
				M<<"Your Sound Village Pride is gone..This doesn't belong to you.."
				del(src)
				return
			if(M.Jailed)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1000,M,"Nin")
			src.Uses+=1
			M.SatakeTeleport()
	UzumakiTeleportation
		name="Uzumaki Teletransporte"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(M.Village!="Leaf")
				M<<"Your Leaf Village Pride is gone..This doesn't belong to you.."
				del(src)
				return
			if(M.Jailed)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1000,M,"Nin")
			src.Uses+=1
			M.UzumakiTeleport()
	RendenTeleportation
		name="Renden Teletransporte"
		icon_state="FuumaTeleportation"
		Activate(mob/M)
			if(M.Village!="Rock")
				M<<"Your Rock Village Pride is gone..This doesn't belong to you.."
				del(src)
				return
			if(M.Jailed)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] begins to do handseals for [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1000,M,"Nin")
			src.Uses+=1
			M.RendenTeleport()
	CrimsonTeleportation
		name="Crimson Teleportation"
		icon_state="FuumaTeleportation"
		Activate(mob/M)

			src.DelayIt(1000,M,"Nin")
			src.Uses+=1
			M.CrimsonTeleport()
	Ikusenhari
		name="Chuva de Agulhas"
		icon_state="Ikusenhari"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(600,M,"Nin")
			src.Uses+=1
			M.Ikusenhariz()
	Kirigakure
		name="Névoa Densa Jutsu"
		icon_state="Kirigakure"
		BunshinAble=0
		Activate(mob/M)
			if(M.KirigakureOn)
				M<<"Você libera a névoa."
				for(var/obj/Jutsu/kriga/S2 in world)
					if(S2.Owner==M)
						del(S2)
				for(var/mob/C in OnlinePlayers)
					if(C.key=="Lui12"||usr.key=="Ruusaku")
						C<<"[M] Ativou o Jutsu de se esconder na Nevoa."
				M.KirigakureOn=0;return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				for(var/mob/A in oview(10))
					if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
					if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				src.DelayIt(300,M,"Nin")
				src.Uses+=1
				M.Kirigakure()

	SilentKilling
		name="Matança silenciosa: Assassinato"
		icon_state="SwiftSlash"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(950,M,"Tai")
			src.Uses+=1
			M.SilentKilling()

	Kiriame
		name="Chuva da névoa"
		icon_state="Kiriame"
		BunshinAble=0
		Activate(mob/M)
			if(M.KiriameOn)
				M<<"Você libera a chuva."
				for(var/obj/Jutsu/Kiriame/S2 in world)
					sleep(1)
					if(S2.Owner==M)
						del(S2)
				M.KiriameOn=0;return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(1250,M,"Nin")
				src.Uses+=1
				M.Kiriame()
	RavelRain
		name="Chuva reveladora"
		icon_state="Kiriame"
		BunshinAble=0
		Activate(mob/M)
			if(M.RavelOn)
				M<<"Você libera a chuva."
				for(var/obj/Jutsu/Ravel/S2 in world)
					sleep(1)
					if(S2.Owner==M)
						del(S2)
				M.RavelOn=0;return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(1250,M,"Nin")
				src.Uses+=1
				M.RavelingRain()
	PoisonRain
		name="Chuva toxica"
		icon_state="Kiriame"
		BunshinAble=0
		Activate(mob/M)
			if(M.PoisonRainOn)
				M<<"Você libera a chuva."
				for(var/obj/Jutsu/PoisoningRain/S2 in world)
					sleep(1)
					if(S2.Owner==M)
						del(S2)
				M.PoisonRainOn=0;return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				for(var/mob/C in OnlinePlayers)
					if(C.key=="Lui12"||usr.key=="Ruusaku")
						C<<"[M] ativou a Chuva Toxica."
				src.DelayIt(1250,M,"Nin")
				if(prob(20))
					M.PoisonKnowledge++
				src.Uses+=1
				M.PoisoningRain()


	MurderCrows
		name="Massacre de corvos Disfarce Jutsu"
		icon_state="MurderCrows"
		BunshinAble=0
		Activate(mob/M)
			if(M.usemurderofcrows)
				M<<"Você chama de volta os corvos!"
				for(var/mob/Jutsu/MurderCrows/S2 in world)
					if(S2.Owner==M)
						del(S2)
				M.usemurderofcrows=0
				return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				for(var/mob/P in OnlinePlayers)
					if(P.key=="Lui12")
						P<<"[M] Esta usando os Corvos."
				src.DelayIt(300,M,"Nin")
				src.Uses+=1
				usr.MurderofCrows(src.Uses)
	CrowVoid
		name="Vazio escuro de Corvo comendo homem"
		icon_state="MurderCrows"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(300,M,"Nin")
			src.Uses+=1
			spawn(3)
			usr<<"Este jutsu esta banido por enquanto por causar lag. .-.";return
		//	usr.CrowVoidGenjutsu()

	OvenGenjutsu
		name="Derretimento Alucinatório Jutsu"
		icon_state="Hikibou"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<21)
				M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(900,M,"Nin")
			src.Uses+=1
			spawn(3)
			usr.OvenGenjutsu()

	HallucinatoryDrowningOcean
		name="Afogamento Alucinatório Jutsu"
		icon_state="OceanGen"
		BunshinAble=0
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<21)
				M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				usr.GenjutsuMastery+=0.1
				if(M.Clan=="Basic"&&usr.GenjutsuMastery>20) usr.GenjutsuMastery=20
				else if(M.Clan!="Basic"&&usr.GenjutsuMastery>10) usr.GenjutsuMastery=10
			if(prob(15))
				M.GenjutsuKnowledge+=1

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(750,M,"Gen")
			src.Uses+=1
			var/S=((M.MentalDamage/10)+1)*M.GenSkill
			M.GenjutsuProc("Ocean",,"Area",250,,,,S,)

	HallucinatoryMeltingOvan
		name="Alucinatório Queima de fusão"
		icon_state="Hikibou"
		BunshinAble=0
		Activate(mob/M)
			if(M.CastingGenjutsu)
				return
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.GenSkill+(usr.ChakraC/25)<20)
				M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				usr.GenjutsuMastery+=0.1
				if(M.Clan=="Basic"&&usr.GenjutsuMastery>20) usr.GenjutsuMastery=20
				else if(M.Clan!="Basic"&&usr.GenjutsuMastery>10) usr.GenjutsuMastery=10
			if(prob(15))
				M.GenjutsuKnowledge+=1

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(550,M,"Gen")
			src.Uses+=1
			var/S=((M.MentalDamage/10)+1)*M.GenSkill
			M.GenjutsuProc("Ovan",,"Area",250,,,,S,)

	Haruno
		name="Mão da Natureza Jutsu"
		icon_state="Haruno"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(600,M,"Nin")
			src.Uses+=1
			M.LeafBind()
	KageBunshin
		name="Clone da Sombra"
		icon_state="KageBunshin"
		BunshinAble=0
		Deactivate(mob/M)
			//M<<output("This jutsu is disabled");return
			if(M.KBunshinOn)
				M.firing=0;M.KBunshinOn=0;M.client.perspective=MOB_PERSPECTIVE
				M.client.eye=M;M.controlled=null
		Activate(mob/M)
			//M<<output("This jutsu is disabled");return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(src.Uses<5000) src.DelayIt(350,M,"Nin")
			src.Uses+=1
			src.TurnedOn=1
			M.KageBunshin(src.Uses)

	PoisonClone
		name="Clone Explosivo Envenenado"
		icon_state="PoisonClone3"
		BunshinAble=0
		Deactivate(mob/M)
			//M<<output("This jutsu is disabled");return
			if(M.KBunshinOn)
				M.firing=0;M.KBunshinOn=0;M.client.perspective=MOB_PERSPECTIVE
				M.client.eye=M;M.controlled=null
		Activate(mob/M)
			//M<<output("This jutsu is disabled");return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			if(src.Uses<5000) src.DelayIt(350,M,"Nin")
			src.Uses+=1
			src.TurnedOn=1
			M.PoisonClone(src.Uses)

	KageBunshinSubstitute
		name="Clone da Sombra Subistituição"
		icon_state="KageBunshin"
		BunshinAble=0
		Deactivate(mob/M)
			M.CloneSubstituteMode=0
			if(M.KBunshinOn)
				M.firing=0;M.KBunshinOn=0;M.client.perspective=MOB_PERSPECTIVE
				M.client.eye=M;M.controlled=null
		Activate(mob/M)
			if(src.Uses<5000) src.DelayIt(350,M,"Nin")
			src.Uses+=1
			src.TurnedOn=1
			M.CloneSubstituteMode=1
			M<<"Você ativou a Substituição do Clone da Sombra. Clique em algum lugar para ir lá e você vai deixar uma Clone da Sombra controlado no seu lugar.."
	KageBunshinAttack
		name="Clone das Sombras Ataque"
		icon_state="KageBunshin"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(src.Uses<5000) src.DelayIt(350,M,"Nin")
			src.Uses+=1
			M.ShadowCloneTackle(src.Uses)
	WindmillCloneAttack
		name="Moinho de Vento Clone ataque"
		icon_state="WindmilClone"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(src.Uses<5000) src.DelayIt(150,M,"Nin")
			src.Uses+=1
			M.WindmillCloneAttack(src.Uses)
	WindmillCloneAttack
		name="Moinho de Vento Clone ataque"
		icon_state="KageBunshin"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(src.Uses<5000) src.DelayIt(150,M,"Nin")
			src.Uses+=1
			M.WindmillCloneAttack(src.Uses)
	ShadowClonePunch
		name="Soco do Clone da Sombra"
		icon_state="KageBunshin"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(150,M,"Nin")
			src.Uses+=1
			M.Shadow_Clone_Punch(src.Uses)


	TKageBunshin
		name="Clones da Sombra em Massa"
		icon_state="TKageBunshin"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(2000,M,"Nin")
			src.Uses+=1
			M.Multi_Shadow_Clone(src.Uses)
	BakuretsuBunshin
		name="Clone da Sombra Explodir"
		icon_state="BakuretsuBunshin"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.Uses+=1
			M.Shadow_Clone_Explosion()
			src.DelayIt(600,M,"Nin")
	KageShuriken
		name="Shuriken da Sombra"
		icon_state="KageShuriken"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(300,M,"Nin")
			src.Uses+=1
			M.KageShuriken()
	KageKunai
		name="Kunai da Sombra"
		icon_state="ShadowKunai"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(800,M,"Nin")
			src.Uses+=1
			M.KageKunai()
	ControllingWindmill
		name="Moinho de Vento Controlar"
		icon_state="KageShuriken"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(1050,M,"Nin")
			src.Uses+=1
			M.ControllingWindmill(Uses)
	ChakraBarrier
		name="Barreira de Chakra"
		icon_state="Rasengan"
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta concentrando usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(150,M,"Clan")
				src.Uses+=1
				M.BarrierBlock()
	ChakraBarrierBig
		name="Strengthened Chakra Barrier"
		icon_state="Rasengan"
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta concentrando usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(350,M,"Clan")
				src.Uses+=1
				M.BarrierWall()
	ChakraBarrierTrap
		name="Chakra Barrier Entrapment"
		icon_state="Rasengan"
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta concentrando usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(850,M,"Clan")
				src.Uses+=1
				M.BarrierTrap()
	ChakraBarrierShield
		name="Chakra Barrier Shielding"
		icon_state="Rasengan"
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta concentrando usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(850,M,"Clan")
				src.Uses+=1
				M.BarrierShield()
	ChakraBarrierContainment
		name="Chakra Barrier Containment"
		icon_state="Rasengan"
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta concentrando usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(2400,M,"Clan")
				src.Uses+=1
				M.BarrierContainment()


	Rasengan
		icon_state="Rasengan"
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(1000,M,"Nin")
				src.Uses+=1
				if(src.Uses>=1000&&M.KatonKnowledge>=1000)
					if(!(locate(/obj/SkillCards/KatonRasengan) in M.LearnedJutsus))
						M.LearnedJutsus+= new/obj/SkillCards/KatonRasengan
				if(src.Uses>=1000&&M.FuutonKnowledge>=1000)
					if(!(locate(/obj/SkillCards/FuutonRasengan) in M.LearnedJutsus))
						M.LearnedJutsus+= new/obj/SkillCards/FuutonRasengan
				for(var/obj/SkillCards/FuutonRasengan/P in M.LearnedJutsus)
					P.DelayIt(1000,M,"Nin")
				for(var/obj/SkillCards/KatonRasengan/P in M.LearnedJutsus)
					P.DelayIt(1000,M,"Nin")
				M.Rasengan()
	Rasenshuriken
		name="Rasenshuriken"
		icon_state=""
		Activate(mob/M)
			if(M.Rasenganon)
				M<<output("Você ja esta usando o Rasengan!","Attack");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(5000,M,"Nin")
				src.Uses+=1
				if(src.Uses>=1000&&M.KatonKnowledge>=1000)
					if(!(locate(/obj/SkillCards/KatonRasengan) in M.LearnedJutsus))
						M.LearnedJutsus+= new/obj/SkillCards/KatonRasengan
				if(src.Uses>=1000&&M.FuutonKnowledge>=1000)
					if(!(locate(/obj/SkillCards/FuutonRasengan) in M.LearnedJutsus))
						M.LearnedJutsus+= new/obj/SkillCards/FuutonRasengan
				for(var/obj/SkillCards/FuutonRasengan/P in M.LearnedJutsus)
					P.DelayIt(1000,M,"Nin")
				for(var/obj/SkillCards/KatonRasengan/P in M.LearnedJutsus)
					P.DelayIt(1000,M,"Nin")
				M.Rasenshuriken()
	RasenganBarrage
		name="Barragem de Rasengan"
		icon_state="Rasengan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(1800,M,"Nin")
			src.Uses+=1
			M.RasenganBarrageProc()
	Giant_Rasengan
		name="Rasengan Gigante"
		icon_state="OodamaRasengan"
		Activate(mob/M)
			if(!M.Rasenganon||M.RasenganCharge)
				M<<"Você precisa estar com algum Rasengan ativo!"
				src.DelayIt(100,M,"Nin");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				src.DelayIt(600,M,"Nin")
				src.Uses+=1
				M.Giant_Rasengan()
	Double_Rasengan
		name="Rasengan de Duas Mãos"
		icon_state="doublerasengan3"
		Activate(mob/M)
			if(!M.Rasenganon||M.RasenganCharge)
				M<<"Você precisa estar com algum Rasengan ativo!"
				src.DelayIt(100,M,"Nin");return
			else
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				for(var/obj/SkillCards/Rasengan/P in M.LearnedJutsus)
					P.DelayIt(1000,M,"Nin")
				src.DelayIt(1000,M,"Nin")
				src.Uses+=1
				M.DoubleRasengan()

	ChakraEnhance
		name="Chakra Aprimorado"
		icon_state="ChakraEnhance"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(50,M,"Nin")
			src.Uses+=1
			M.ChakraEnhance()
	ExpandingShuriken
		name="Expansão da Shuriken"
		icon_state="ExpandingShuriken"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.ShurikenMastery<=50)
				M<<output("Você não sabe o suficiente sobre Shurikens para utilizar este jutsu.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(850,M,"Nin")
			src.Uses+=1
			M.ExpandingShurikenProj()
	HairNeedleSenbon
		name="Cabelo Agulha Senbon"
		icon_state="GuidingWeapon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(950,M,"Nin")
			src.Uses+=1
			M.KebariSenbon(src.Uses)
	WeaponSummoningKunai
		name="Arma Invocação: Kunai"
		icon_state="Weapon Summon1"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.KunaiMastery<50)
				M<<"Você não sabe o suficiente sobre Kunai para utilizar este jutsu.";return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(950,M,"Nin")
			src.Uses+=1
			M.WeaponSummoningKunai(src.Uses)
	KunaiBarrage
		name="Barragem de Kunais"
		icon_state="GuidingWeapon"
		Activate(mob/M)
			var/Size=5;
			var/Rounds=1;
			var/Trained=round(src.Uses/200)
			var/Trained2=round(src.Uses/300)
			if(M.key=="Lui12")
				Rounds=10;
				Size=9;
				src.Uses=100;
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(1050,M,"Nin")
			src.Uses+=1
			M.KunaiBarrageProc(Size+Trained,Rounds+Trained2)
	WeaponReverse
		name="Arma reversa"
		icon_state="WeaponReverse"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(50,M,"Nin")
			src.Uses+=1
			M.WeaponReverse()
	GuidingWeapon
		name="Guiar Arma"
		icon_state="GuidingWeapon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(150,M,"Nin")
			src.Uses+=1
			M.GuidingWeapon()
	Shousen
		name="Mão mística"
		icon_state="Shousen3"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.ARank=="Healer")
				src.DelayIt(100,M,"Nin")
			else
				src.DelayIt(120,M,"Nin")
			src.Uses+=1
			for(var/obj/SkillCards/ForbiddenShousen/A in M.LearnedJutsus)
				A.DelayIt(350,M,"Nin")
			M.Mystical_Hand_Technique(src.Uses)

	ForbiddenShousen
		name="Mão mística Avançada"
		icon_state="ShousenUpgrade"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
	//		if(M.ARank=="Healer")
	//			src.DelayIt(50,M,"Nin")
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			for(var/obj/SkillCards/Shousen/A in M.LearnedJutsus)
				A.DelayIt(200,M,"Nin")
			M.Mystical_Hand_Technique_Advanced(src.Uses)

	ChakraNoMesu
		name="Bisturi de Chakra"
		icon_state="ChakraNoMesu"
		Deactivate(mob/M)
			if(M.scalpel)
				M.scalpel=0;src.DelayIt(600,M,"Nin")
			src.TurnedOn=0
		Activate(mob/M)
			src.TurnedOn=1
			src.Uses+=1
			M.Chakra_Scapel()
	Muscle_Slice
		name="Cortar Musculo"
		icon_state="ChakraNoMesu"
		Activate(mob/M)
			if(!M.scalpel)
				M<<"Você precisa ativar o Bisturi de Chakra primeiro.";src.DelayIt(30,M,"Nin");return
			src.DelayIt(300,M,"Nin")
			M.Muscle_Slice()
			src.Uses+=1

	Neck_Slice
		name="Cortar Pescoço"
		icon_state="ChakraNoMesu"
		Activate(mob/M)
			if(!M.scalpel)
				M<<"Você precisa ativar o Bisturi de Chakra primeiro.";src.DelayIt(30,M,"Nin");return
			src.DelayIt(300,M,"Nin")
			M.Neck_Slice()
			src.Uses+=1
	Leg_Slice
		name="Cortar Perna"
		icon_state="ChakraNoMesu"
		Activate(mob/M)
			if(!M.scalpel)
				M<<"Você precisa ativar o Bisturi de Chakra primeiro.";src.DelayIt(30,M,"Nin");return
			src.DelayIt(300,M,"Nin")
			M.Leg_Slice()
			src.Uses+=1

	EyeExtract
		name="Remover Olho"
		icon_state="ChakraNoMesu"
		Activate(mob/M)
			if(!M.scalpel)
				M<<"Você precisa ativar o Bisturi de Chakra primeiro.";src.DelayIt(30,M,"Nin");return
			M.ExtractEye()
			src.Uses+=1
			src.DelayIt(300,M,"Nin")
	Ranshinshou
		name="Colisão Mental Caótica"
		icon_state="Ranshinshou"
		Activate(mob/M)
			if(!M.scalpel)
				M<<"Você precisa ativar o Bisturi de Chakra primeiro.";src.DelayIt(30,M,"Nin");return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(350,M,"Nin")
			src.Uses+=1
			M.Chaotic_Mental_Collision()
	Oukashou
		name="Colisão da Flor de cerejeira"
		icon_state="Oukashou"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/obj/SkillCards/ChakraKick/A in M.LearnedJutsus)
				A.DelayIt(1000,M)
			src.DelayIt(1200,M,"Nin")
			src.Uses+=1
			M.ChakraPunch()
	ChakraKick
		name="Batida da Flor de cerejeira"
		icon_state="ChakraKick"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/obj/SkillCards/Oukashou/A in M.LearnedJutsus)
				A.DelayIt(1000,M)
			src.DelayIt(1200,M,"Nin")
			src.Uses+=1
			M.ChakraKick()
	Chikatsu
		name="Cura Ressuscitação Regeneração"
		BunshinAble=0
		icon_state="Chikatsu"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(1000,M,"Nin")
			src.Uses+=1
			M.ChikatsuTechnique()
	ChakraAbsorb
		name="Absorção de Chakra"
		icon_state="ChakraAbsorb"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(700,M,"Nin")
			src.Uses+=1
			M.Chakra_Absorbtion_Technique(Uses)
	SelfHeal
		name="Auto Regeneração"
		icon_state="selfheal"
		Activate(mob/M)
			if(M.SelfHeal)
				src.DelayIt(2100,M,"Nin")
				M.SelfHeal=0
				M<<"You stop the regeneration Process..."
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(2100,M,"Nin")
			src.Uses+=1
			M.SelfHeal(Uses)
	ChakraMode
		name="Jutsu Proibido Medico: Libertação de Chakra"
		icon_state="ChakraMode"
		Activate(mob/M)
			if(M.ChakraMode)
				M.ChakraMode=0
				M<<"Você para o Ninjutsu Proibido ..... Ele começa a custar em seu corpo!"
				usr.deathcount++
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(5000,M,"Nin")
			src.Uses+=1
			M.ChakraMode(Uses)
	BodyShedding
		name="Troca de Pele"
		icon_state="ChakraMode"
		Activate(mob/M)
			src.DelayIt(5000,M,"Nin")
			src.Uses+=1
			M.BodySheddingProc()
	EyeoftheKagura
		name="Olho do Kagura"
		icon_state="ChakraMode"
		Activate(mob/M)
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.EyeoftheKagura()

	PoisonFog
		name="Fumaça Venenosa"
		icon_state="PoisonFog"
		Activate(mob/M)
			if(M.knockedout)
				return
			if(M.firing||M.Frozen)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(1350,M,"Nin")
			src.Uses+=1
			if(prob(20))
				M.PoisonKnowledge+=1
			M.Poisonfog(Uses)
	PoisonMist
		name="Nevoeiro Venenoso"
		icon_state="PoisonMist"
		Activate(mob/M)
			if(M.knockedout)
				return
			if(M.firing||M.Frozen)
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.DelayIt(950,M,"Nin")
			src.Uses+=1
			if(prob(20))
				M.PoisonKnowledge+=1
			M.PoisonMistJutsu(Uses)



	Meimei
		name="Camuflagem Ocultação"
		icon_state="GansakuSuterusu"
		Deactivate(mob/M)
			M.inMei=0
			src.DelayIt(300,M,"Nin")
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			src.Uses+=1
			src.TurnedOn=1
			src.DelayIt(300,M,"Nin")//Remove this delay it whena ctually want to work on the jutsu again
			M.MieMie()
	BodySwitch
		name="Troca de corpo"
		icon_state="Reflex2"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)

			src.DelayIt(250,M,"Nin")
			src.Uses+=1
			M.PersonSwap()
///
	KujakuMyouhou
		name="Método Pavão Misterioso"
		icon_state="Kujaku2"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(100,M,"Nin")
			src.Uses+=1
			M.KujakuMyouhou()
		//	while(M.KujakuMyouhouon)
		//		if(prob(50))
		//			src.Uses+=1
		//		sleep(100)
	StarShot
		name="Estrela do Pavão"
		icon_state="Kujaku2"
	//	NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.KujakuMyouhouon)
				M<<"Você precisa ativar o Método Pavão Misterioso primeiro!";return

			src.DelayIt(100,M,"Nin")
			M.StarShot()
	StarBind
		name="Paralizia do Pavão"
		icon_state="Kujaku2"
	//	NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.KujakuMyouhouon)
				M<<"Você precisa ativar o Método Pavão Misterioso primeiro!";return

			src.DelayIt(300,M,"Nin")
			M.StarBind()
	StarFeathers
		name="Penas do pavão"
		icon_state="Kujaku2"
	//	NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.KujakuMyouhouon)
				M<<"Você precisa ativar o Método Pavão Misterioso primeiro!";return

			src.DelayIt(350,M,"Nin")
			M.StarFeathers(src.Uses)
	KujakuWall
		name="Muro do Pavão"
		icon_state="Kujaku2"
	//	NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.KujakuMyouhouon)
				M<<"Você precisa ativar o Método Pavão Misterioso primeiro!";return

			src.DelayIt(450,M,"Nin")
			M.KujakuWall()
	KujakuCapture
		name="Captura do pavão"
		icon_state="Kujaku2"
	//	NonKeepable=1
		BunshinAble=0
		Activate(mob/M)
			if(!M.KujakuMyouhouon)
				M<<"Você precisa ativar o Método Pavão Misterioso primeiro!";return

			src.DelayIt(450,M,"Nin")
			M.Kujaku_Capture()

///
	Zankuuha
		name="Onda de Ar Decaptadora"
		icon_state="Zankuuha"
		Activate(mob/M)
			if(!M.ZankuuhaOn)
				M.ZankuuhaOn=1;
				M<<"Você circular as saídas de ar através de sua mão!";
				return
			else
				M.ZankuuhaOn=0;M<<"Você parar a saida de ar corrente em suas mãos."
	ZankuuSpiralingSphere
		name="Ar Esfera Decapitadora"
		icon_state="ZankuuhaSphere"
		Activate(mob/M)
			if(!M.ZankuuhaOn)
				M<<"Você precisa ativar a Onda de Ar Decaptadora Primeiro!";return

			src.DelayIt(1200,M,"Nin")
			src.Uses+=1
			M.ZankuuSpiralingSphere()
	ZankuuKyomeisen
		name="Broca de Som Vibratoria"
		icon_state="ZankuuhaSphere"
		Activate(mob/M)
			if(!M.ZankuuhaOn)
				M<<"Você precisa ativar a Onda de Ar Decaptadora Primeiro!";return
			src.DelayIt(1300,M,"Nin")
			src.Uses+=1
			M.ZankuuSoundDrill()
///
//Paper
	Paper_Mode
		name="Estilo de Dança Papel"
		icon_state="PaperMode"
		BunshinAble=0
		Deactivate(mob/M)
			M.PaperStyleDance()
			src.DelayIt(300,M,"Nin")
		Activate(mob/M)
			src.TurnedOn=1
			src.Uses+=1
			M.PaperStyleDance()
	Paper_Shuriken
		name="Shuriken de Papel"
		icon_state="PaperShuriken"
		Activate(mob/M)
			if(!M.PaperStyleDance)
				M<<"Você precisa estar no Estilo de Dança Papel!";return
			src.DelayIt(120,M,"Nin")
			src.Uses+=1
			M.Paper_Shuriken(Uses)
	Paper_Butterfly
		name="Borboletas de Papel"
		icon_state="PaperButterflies"
		var/ButterfliesAreOut=0
		Activate(mob/M)
			if(!M.PaperStyleDance)
				M<<"Você precisa estar no Estilo de Dança Papel!";return
			src.DelayIt(600,M,"Nin")
			src.Uses+=1
			M.Paper_Butterflies(src.Uses)

	Butterfly_Dance
		name="Dança das Borboletas"
		icon_state="ButterflyDance"
		var/ButterfliesAreOut=0
		Activate(mob/M)
			if(!M.PaperStyleDance)
				M<<"Você precisa estar no Estilo de Dança Papel!";return
			src.Uses+=1
			src.DelayIt(600,M,"Nin")
			M.Butterfly_Dance()
	Paper_Spear
		name="Lança de Papel"
		icon_state="PaperSpear"
		Activate(mob/M)
			if(!M.PaperStyleDance)
				M<<"Você precisa estar no Estilo de Dança Papel!";return
			src.Uses+=1
			M.Divine_Spear()
			src.DelayIt(600,M,"Nin")
	Paper_Person
		name="Pessoa de Papel Jutsu"
		icon_state="ExplodingPaper3"
		Activate(mob/M)
			if(!M.PaperStyleDance)
				M<<"Você precisa estar no Estilo de Dança Papel!";return
			src.Uses+=1
			src.DelayIt(1800,M,"Nin")
			M.Person_Explosion(src.Uses)








///////////////////////
//Sensory Jutsu

	ChakraSense
		name="Sentir Chakra"
		icon_state="ChakraSense"
		Activate(mob/M)
			if(M.ChakraSense)
				M.ChakraSense=0
				M<<"Você pára o Sensoriamento de Chakra nas proximidades."
				src.DelayIt(500,M,"Nin")
				return
			M<<"Você começa a relaxar, você começa a sentir chakra nas proximidades."
			src.Uses+=1
			M.Chakra_Sense()

	ChakraAuraRemoval
		name="Ocultar Chakra"
		icon_state="AuraRemoval"
		Activate(mob/M)
			M.ChakraAuraRemoval()




////////////////////////
//Kenjutsu
	SwiftSlash
		name="Corte Rapido"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
	//	verb/SetHand()
	//		set src in usr.contents
	//		switch(input(src,"Which hand would you like to set Swift Slash too?",text)in list("Left","Right"))
	//			if("Left")
	//				Hand="Left"
	//			if("Right")
	//				Hand="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				if(M.WeaponInLeftHand=="")
					M<<"Você precisa de uma arma em sua mão esquerda para usar isto!";return
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(A!=""&&M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.SwiftSlashTechnique(Hand)
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")

	Impale
		name="Empalar"
		icon_state="Impale"
		var/Hand="Left"
		verb/SetHand()
			set src in usr.contents
			switch(input(src,"Que mão que você gostaria de definir o Jutsu?",text)in list("Esquerda","Direita"))
				if("Esquerda")
					Hand="Left"
				if("Direita")
					Hand="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.ImpaleTechnique(Hand)
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")
	RapidStrike
		name="Batida Rápida"
		icon_state="RapidStrike"
		var/Hand="Left"
		verb/SetHand()
			set src in usr.contents
			switch(input(src,"Que mão que você gostaria de definir o Jutsu?",text)in list("Esquerda","Direita"))
				if("Esquerda")
					Hand="Left"
				if("Direita")
					Hand="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				if(M.WeaponInLeftHand=="")
					M<<"Você precisa de uma arma em sua mão esquerda para usar isto!";return
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(250,M,"Tai")
				src.Uses+=1
				M.RapidStrike(Hand)
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")

	Moonsplitter
		name="Batida Crescente da Lua"
		icon_state="MoonSplitter"
		var/Hand="Left"
		var/Hand2="Right"
	//	verb/SetHand()
	//		set src in usr.contents
	//		switch(input(src,"Which hand would you like to set Swift Slash too?",text)in list("Left","Right"))
	//			if("Left")
	//				Hand="Left"
	//			if("Right")
	//				Hand="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(AOk)
				src.DelayIt(500,M,"Tai")
				src.Uses+=1
				M.Moonsplitter()
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")

	DancingCrescent
		name="Dança de Cortes"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
		//		src.DelayIt(300,M,"Tai")
		//		src.Uses+=1
	//			M.DancingCrescentTechnique(Hand2)
			else
				M<<"Você precisa ter uma espada em sua mão!"
	//			src.DelayIt(10,M,"Tai")
	Anarchist
		name="Anarquista"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(A!=""&&M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(A!=""&&M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.AnarchistTechnique(Hand2)
			else
				M<<"Você precisa ter uma espada em sua mão Direita!"
				src.DelayIt(10,M,"Tai")
	DepartureInFlames
		name="Partindo Chamas"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(A!=""&&M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(A!=""&&M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.DepartureInFlames(Hand2,Uses)
			else
				M<<"Você precisa ter uma espada em sua mão Direita!"
				src.DelayIt(10,M,"Tai")
	Kaitengiri
		name="Kaitengiri"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(A!=""&&M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(A!=""&&M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.KaitengiriTechnique(Hand2)
			else
				M<<"Você precisa ter uma espada em sua mão Direita!"
				src.DelayIt(10,M,"Tai")
	AnzentaruEiketsu
		name="Anzentaru Eiketsu"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(A!=""&&M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(A!=""&&M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.AnzentaruEiketsuTechnique(Hand2)
			else
				M<<"Você precisa ter uma espada em sua mão Direita!"
				src.DelayIt(10,M,"Tai")
	Sanjuuken
		name="Sanjuuken"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
				M.SanjuukenTechnique(Hand2)
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")
	Taitari
		name="Taiatari"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
			//	M.TaitariTechnique()
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")
	HasakiCounter
		name="Hasaki Contra"
		icon_state="SwiftSlash"
		var/Hand="Left"
		var/Hand2="Right"
		Activate(mob/M)
			var/AOk=0
			if(Hand=="Left")
				var/obj/WEAPONS/A=M.WeaponInLeftHand
				if(M.LeftHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(Hand2=="Right")
				var/obj/WEAPONS/A=M.WeaponInRightHand
				if(M.RightHandSheath&&A.WhatDoesItDo=="Slash")
					AOk=1
			if(M.Clan=="Kaguya"&&(M.KagDance=="Yanagi"||M.KagDance=="Tsubaki"))
				AOk=1
				Hand="Left"
			if(AOk)
				src.DelayIt(300,M,"Tai")
				src.Uses+=1
			//	M.HasakiCounterTechnique()
			else
				M<<"Você precisa ter uma espada em sua mão!"
				src.DelayIt(10,M,"Tai")
/////////////////////////////////////////////
///OverPowered Katon
////////////////////////////////////////////
	Metronome
		name="Metrónomo"
		icon_state="Hikibou"
		Activate(mob/M)
			view(M)<<"[M] sacode o dedo!"

			var/Rand=pick(1,2,3,4,5,6,7,8,9)
			if(Rand==1)
				M.MassiveLavaOverFlowingJutsu(src.Uses)
			if(Rand==2)
				M.PainMechining()
			if(Rand==3)
				M.ChouHouka()
			if(Rand==4)
				M.BakuSuishouha()
			if(Rand==5)
				M.KazeGai()
			if(Rand==6)
				M.Sawarabi(Control=0)
			if(Rand==7)
				M.Sawarabi(Control=1)
			if(Rand==8)
				M.Gian()
			if(Rand==9)
				M.Gian()
	//		if(Rand==10)
	//
			src.DelayIt(200,M,"Nin")

	MassiveLavaOverFlowingJutsuOP
		name="Lava Maçiva no Jutsu"
		icon_state="Ryuusenka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(200,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.MassiveLavaOverFlowingJutsu(src.Uses)
	HeadMincingPain
		name="Head Mincing Pain"
		icon_state="Moesashi"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
			src.DelayIt(2000,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.PainMechining(src.Uses)
////////////////////////////////////////
//Katon
/////////////////////
	Hikibou
		name="Truque do Fogo"
		icon_state="Hikibou"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return

			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(src.Uses>150)
				src.DelayIt(140,M,"Element")
			else
				src.DelayIt(100,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.Hikibou(src.Uses)
	Goukakyuu
		name="Grande Bola de Fogo Jutsu"
		icon_state="Goukakyuu"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(200,M,"Element")
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			if(!M.client)
				M.HoldingR=1
				spawn(30)
					M.HoldingR=0
			M.GoukakyuuNoJutsu(src.Uses)

	PhoenixSageFlower
		name="Flor de Fenix  no Fio"
		icon_state="Fire Shuriken"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(450,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.KatonHousenkaTsumabeniNoJutsu(src.Uses)

	FlameEmber
		name="Brasa de Fogo"
		icon_state="FlameEmber"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(550,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.Kiritsuhi(src.Uses)


	SpinningFire
		name="Fogo Giratorio"
		icon_state="SpinningFire"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(620,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.KatonRaseKa(src.Uses)



	AshPileBurning
		name="Cinzas Ardentes"
		icon_state="AshPile"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(200,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			if(!M.client)
				M.HoldingR=1
				spawn(30)
					M.HoldingR=0
			M.HaisekishoNoJutsu(src.Uses)

	GoukaMekkyakuNoJutsu
		name="Grande Aniquilação de Fogo"
		icon_state="Kaheki"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			src.DelayIt(1500,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			if(!M.client)
				M.HoldingR=1
				spawn(30)
					M.HoldingR=0
			M.GoukaMekkyakuNoJutsu(src.Uses)


	Housenka
		name="Fogo Místico da Fénix"
		icon_state="Housenka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(310,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1

			M.KatonHousenkaNoJutsu(src.Uses)
	KatonFlameBullet
		name="Katon Endan"
		icon_state="Housenka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(175,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1

			M.FireSpit(src.Uses)

	KatonFlameBulletAdvance
		name="Katon Dai Endan"
		icon_state="FlameEmberAdvance"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(650,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1

			M.FireSpitBarrage(src.Uses)

	Ryuuka
		name="Jutsu do Dragão de Fogo"
		icon_state="Ryuuka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(600,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1

			M.KatonRyuuka()
	KaryuuEndan
		name="Projétil Chama de Dragão"
		icon_state="KaryuuEndan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(900,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.KKE()

	KatonDragonWar
		name="Guerra dos Dragões"
		icon_state="FireDragon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(2500,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.KatonRyuusenka()

	KatonHouka
		name="Foguete de Fogo Jutsu"
		icon_state="Houka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(700,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.KatonHouka(src.Uses)

	KatonHoukaAdvanced
		name="Gouenkyuu No Jutsu"
		icon_state="Houka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(1000,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.GouenkyuuNoJutsu(src.Uses)

	ChouHouka
		name="Super Foguete de Fogo Jutsu"
		icon_state="ChouHouka"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(1500,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.ChouHouka(src.Uses)
	Gouryuuka
		name="Grande Dragão de Fogo"
		icon_state="Gouryuuka"
		BunshinAble=0
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.KatonKnowledge+=1
				if(src.Uses<100)
					M.KatonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.FireChakra<20)
				M.FireChakra+=pick(0.01,0.1)
				if(M.FireChakra>20)
					M.FireChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			src.DelayIt(1500,M,"Element")

			if(M.TypeLearning=="Katon")
				M.exp+=rand(25,100)
			src.Uses+=1

			M.Gouryuuka(src.Uses)
	KatonRasengan
		name="Rasengan de Fogo"
		icon_state="KatonRasengan"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"Você não pode fazer isso, você está descansando ou em modo de geração de chakra."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.Rasenganon)
				usr<<output("Você já está usando o Rasengan!","Attack");return
			if(src.Delay>0)
				usr<<output("Você deve esperar para usar esta técnica.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Genius")
					if(prob(95-src.Uses))
						usr<<output("O Jutsu falhou.","Attack");return
				else if(usr.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("O Jutsu falhou.","Attack");return
				if(prob(15))
					usr.KatonKnowledge+=1
				for(var/obj/SkillCards/FuutonRasengan/P in usr.LearnedJutsus)
					P.DelayIt(1000,usr,"Nin")
				for(var/obj/SkillCards/Rasengan/P in usr.LearnedJutsus)
					P.DelayIt(1000,usr,"Nin")

				src.DelayIt(1000,usr,"Element")
				src.Uses+=1
				usr.KRasengan()
////////////////////////////////////////
//Fuuton
/////////////////////
	WindTrick
		name="Truque do Vento"
		icon_state="WindTrick"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(25,100)
			src.DelayIt(400,M,"Element")
			src.Uses+=1
			M.WindTrick(Uses)
	SpinningWind
		name="Vento Giratorio"
		icon_state="SpinningWind"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.SpinningWind(Uses)
	SenbonDice
		name="Senbon de Vento"
		icon_state="SenbonDice"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.FuutonSenbonDice(src.Uses)
	Reppushou
		name="Palma da Ventania"
		icon_state="Reppushou"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(25,100)
			src.DelayIt(420,M,"Element")
			src.Uses+=1
			if(!M.client)
				M.HoldingR=1
				spawn(30)
					M.HoldingR=0
			M.FuutonReppushou()
	BloodLust
		name="Luxuria de Sangue"
		icon_state="RapidPunch"
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/OriginalKubikiriHoucho)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/OriginalKubikiriHoucho))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					src.DelayIt(5000,usr,"Tai")
					spawn() M.BloodLust()
					M.deathcount+=0.5

				else
					usr<<"Você precisa usar a lâmina lendária primeiro."
					return
			else
				usr<<"Você precisa equipar a lâmina lendária primeiro."
				return
	KazeDangan
		name="Aaceleração do Ar"
		icon_state="KazeDangan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(25,100)
			src.DelayIt(120,M,"Element")
			src.Uses+=1
			M.FuutonKazeDanganzz()
	Daitoppa
		name="Grande Bola de Vento"
		icon_state="Daitoppa"
		Deactivate(mob/M)
			if(M.UsingDaitoppa)
				if(M.TypeLearning=="Fuuton")
					M.exp+=rand(25,100)
				M.Daitoppa()
				return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(25,100)
			src.DelayIt(480,M,"Element")
			src.TurnedOn=1
			if(!M.client)
				M.HoldingR=1
				spawn(30)
					M.HoldingR=0
			M.Daitoppa()
			src.Uses+=1
	Yaiba
		name="Espada de vento"
		icon_state="Yaiba"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1000)
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.KazeNoYaibaJutsu()
	Renkuudan
		name="Perfuração Ar Concentrada"
		icon_state="Renkuudan"
		Activate(mob/M)
		//	if(M.ElementalCapacity!=1)
		//		M<<"You have the capacity for more than 1 nature. This jutsu is only for 1 nature users.";return

			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(550,2000)
			src.DelayIt(800,M,"Element")
			src.Uses+=1
			M.RenkuudanJutsu()
	KazeKiri
		name="Grande Corte de Vento"
		icon_state="Kazekiri"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"


			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(700,M,"Element")
			src.Uses+=1
			M.FuutonKazeKiri()
	KazeGai
		name="Gigante Corte de Vento"
		icon_state="KazeGai"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(2500,3500)
			src.DelayIt(900,M,"Element")
			src.Uses+=1
			M.KazeGai()
	VacuumCannon
		name="Canão de Vácuo"
		icon_state="KazeNoSenbon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(330,M,"Element")
			src.Uses+=1
			M.FuutonVacuumCannon(src.Uses)
	VacuumSphere
		name="Esfera de Vácuo"
		icon_state="KazeNoSenbon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(350,M,"Element")
			src.Uses+=1
			M.FuutonVacuumSphere(src.Uses)
	VacuumGreatSphere
		name="Grande Esfera de Vácuo"
		icon_state="KazeNoSenbon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(520,M,"Element")
			src.Uses+=1
			M.FuutonVacuumGreatSphere(src.Uses)
	VacuumWave
		name="Onda de Vácuo"
		icon_state="KazeNoSenbon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(450,M,"Element")
			src.Uses+=1
			M.FuutonVacuumWave(src.Uses)

	VacuumSerialWaves
		name="Multiplas Ondas de Vácuo"
		icon_state="KazeNoSenbon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(500,M,"Element")
			src.Uses+=1
			M.FuutonVacuumSerialWaves(src.Uses)
	DaiKamaitachi
		name="Grande Remoinho Cortante"
		icon_state="MugenSaijinDaitoppa"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(2500,3500)
			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.FuutonDaiKamaitachi()
	Kakeami
		name="Rede de Vento"
		icon_state="TornadoTrap"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(2500,3500)
			src.DelayIt(500,M,"Element")
			src.Uses+=1
			M.FuutonKakeami()
	FuutonRasengan
		name="Rasengan de Vento"
		icon_state="FuutonRasengan"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"Você não pode fazer isso, você está descansando ou em modo de geração de chakra."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Não agora."
				return
			if(usr.Rasenganon)
				usr<<output("Você ja esta usando o Rasengan!","Attack");return
			if(src.Delay>0)
				usr<<output("Você deve esperar para usar esta técnica.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Genius")
					if(prob(95-src.Uses))
						usr<<output("O Jutsu falhou.","Attack");return
				else if(usr.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("O Jutsu falhou.","Attack");return
				if(prob(15))
					usr.FuutonKnowledge+=1
				for(var/obj/SkillCards/Rasengan/P in usr.LearnedJutsus)
					P.DelayIt(1000,usr,"Nin")
				for(var/obj/SkillCards/KatonRasengan/P in usr.LearnedJutsus)
					P.DelayIt(1000,usr,"Nin")

				src.DelayIt(1000,usr,"Element")
				src.Uses+=1
				usr.WRasengan()
//Last Airbender
	Gust
		name="Ventania"
		icon_state="MugenSaijinDaitoppa"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(300,M,"Element")
			src.Uses+=1
			M.Gust()
	Whirlwind
		name="Redemoinho"
		icon_state="TornadoTrap"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(340,M,"Element")
			src.Uses+=1
			M.Whirlwind()
	AirDash
		name="Empurrão de vento"
		icon_state="Air Dash"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.AirDash()
	AirBall
		name="Bola de Ar"
		icon_state="KazeDangan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15))
				M.FuutonKnowledge+=1
				if(src.Uses<100)
					M.FuutonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WindChakra<20)
				M.WindChakra+=pick(0.01,0.1)
				if(M.WindChakra>20)
					M.WindChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Fuuton")
				M.exp+=rand(250,1500)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.FuutonAirBall()
//////////////////////////////
///Suiton
//////////////////////////
	WhirlPoolControl
		name="Tornado Destrutivo"
		icon_state="WaterPrison"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.WhirlPoolControlling()
	WaterPrison
		name="Prisão de Água"
		icon_state="Suirou"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.WaterPrison()
	HydroForm
		name="Corpo de Água"
		icon_state="HydroMode2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.HydroForm()
	Mizurappa
		name="Onda de água Violenta"
		icon_state="Mizurappa"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.MizurappaNoJutsu()
	MizuameNabara
		name="Captura de Xarope Amido"
		icon_state="StickySyrup"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(1200,M,"Element")
			src.Uses+=1
			M.Syrup_Capture()

	WaterCreation
		name="Criar Água"
		icon_state="WaterCreation"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(250,1000)
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.CreateWater()
	Suijinheki
		name="Parede de água"
		icon_state="Suijinheki"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(250,1000)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.Suijinheki(Uses)


	Suiryuudan
		name="Jutsu Dragão de Água"
		icon_state="Suiryuudan"
		BunshinAble=0
		Deactivate(mob/M)
			M.SuiryuudanZ()
			src.DelayIt(350,M,"Element")
		Activate(mob/M)
			for(var/obj/Jutsu/Elemental/Suiton/Suiryedan/K in world)
				if(K.Owner==M)
					src.Deactivate(M)
					return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(250,1000)
			src.DelayIt(350,M,"Element")
			src.Uses+=1
			M.SuiryuudanZ()
	Suikoudan
		name="Jutsu Tubarão de Água"
		icon_state="Suikoudan2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.SuikoudanZ(src.Uses)

	Daikoudan
		name="Grande Bala de Tubarão"
		icon_state="GiantShark"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.Daikoudan(src.Uses)
	BubbleCapture
		name="Captura de Bolha"
		icon_state="Suikoudan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(550,M,"Element")
			src.Uses+=1
			M.BubbleCreation(src.Uses)
	BubbleBeam//BubbleBeamJutsu()
		name="Bolhas Explosivas"
		icon_state="Suikoudan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(550,M,"Element")
			src.Uses+=1
			M.BubbleBeamJutsu(src.Uses)

	Senjikizame
		name="Mil Tubarões Famintos"
		icon_state="SuikoudanLot"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.Senjikizame(src.Uses)

	MizuTeppou
		name="Arma de Água"
		icon_state="WaterGun"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(300,M,"Element")
			src.Uses+=1
			M.MizuTeppou(src.Uses)

	MizuBunshin
		name="Clone de Água"
		icon_state="SuitonBunshin"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(550,M,"Element")
			src.Uses+=1
			M.MizuBunshin(src.Uses)


	Daibakuryuu
		name="Grande fluxo de Cachoeira"
		icon_state="Vortex"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(550,M,"Element")
			src.Uses+=1
			M.Daibakuryuu(src.Uses)
		//	M.WhirlPoolControlling()

	UnderSui
		name="Puxão rápida"
		icon_state="Suigadan"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.UnderWaterPull()
	Suigadan
		name="Canino de Água"
		icon_state="Suigadan"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.Suigadan()
	Daibakufu
		name="Grande Cachoeira Jutsu"
		icon_state="BakuSuishouha2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(2650,3200)
			src.DelayIt(700,M,"Element")
			src.Uses+=1
	//		M<<"Will be reenabled soon"
			M.DaibakufuZ()
	BakuSuishouha
		name="Grande Colisão de Ondas"
		icon_state="BakuSuishouha"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=10
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(725,1500)
			src.DelayIt(1550,M,"Element")
			src.Uses+=1
			M.BakuSuishouha(src.Uses)
	Teppoudama
		name="Bala de Água"
		icon_state="Water Bullet"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Rain")
				Check+=8
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.SuitonKnowledge+=1
				if(src.Uses<100)
					M.SuitonKnowledge+=pick(1,1.2)
			if(prob(15)&&M.WaterChakra<20)
				M.WaterChakra+=pick(0.01,0.1)
				if(M.WaterChakra>20)
					M.WaterChakra=20

			if(M.TypeLearning=="Suiton")
				M.exp+=rand(750,2000)
			src.DelayIt(380,M,"Element")
			src.Uses+=1
			M.Teppoudama()
///////////////////////////////
///Raiton
//////////////////////////
	Yoroi
		name="Armadura Relâmpago"
		icon_state="RaitonYoroi"
		Deactivate(mob/M)
			src.TurnedOn=0
			M.RaiArmor=0
			M.overlays-='RaiArmor.dmi'
			M.overlays-='RaiArmor2.dmi'
			M.tempmix='ChakraAura.dmi';M.tempmix+=rgb(36,45,156)
			var/icon/Q=icon(M.tempmix);M.overlays-=Q
			M.Touei=0
			src.DelayIt(700,M,"Element")
			return

		Activate(mob/M)
		//	src.TurnedOn=1
			if(M.RaiArmor)
				M.overlays-='RaiArmor.dmi'
				M.overlays-='RaiArmor2.dmi'
				M.tempmix='ChakraAura.dmi';M.tempmix+=rgb(36,45,156)
				var/icon/Q=icon(M.tempmix);M.overlays-=Q
				M.RaiArmor=0
				M.Touei=0
				src.DelayIt(700,M,"Element")
				return


			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.05,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			src.Uses+=1
			src.TurnedOn=1
			M.RaigekiYoroiz(src.Uses)

	FlashFlicker
		name="Cintilação Rapida"
		icon_state="RaiYoroi"
		Activate(mob/M)

			if(M.RaiArmor)
				M.overlays-='RaiArmor.dmi'
				M.overlays-='RaiArmor2.dmi'
				M.tempmix='ChakraAura.dmi';M.tempmix+=rgb(255,255,0)
				var/icon/Q=icon(M.tempmix);M.overlays-=Q
				M.RaiArmor=0;M.FlashFlicker=0
				src.DelayIt(10,M)
				return


			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			src.Uses+=1
			M.FlashFlicker(src.Uses)
	RaitonYoroi
		name="Relâmpago avançado Armadura"
		icon_state="LightningArmor"
		Activate(mob/M)
			if(M.RaiArmor)
				M.overlays-='RaiArmor2.dmi'
				M.overlays-='RaiArmor.dmi'
				M.overlays-='RaitonYoroi.dmi'
				M.RaiArmor=0;M.Touei=0
				M.tai=M.Mtai
				src.DelayIt(1200,M,"Element")
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.Raiton_Armor(src.Uses)
	Touei
		name="Cintilação de Luz"
		icon_state="Touei"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode)
					if(A.SharinganMastery<1000)
						A<<"[M]'s handsigns were too fast for you to read.."
					else
						A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			src.DelayIt(450,usr,"Element")
			src.Uses+=1
			M.Touei()
	Raikyuu
		name="Bola de Raio"
		icon_state="Raikyu"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)

			src.DelayIt(300,M,"Element")
			src.Uses+=1
			M.Raikyuuz()
	Tatsumaki
		name="Relâmpago Dragão Tornado"
		icon_state="Tatsumaki"
		BunshinAble=0
		Deactivate(mob/M)
			src.DelayIt(350,M,"Element")
			M.Tatsumaki()

		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
		//	src.DelayIt(350,M,"Element")
			src.Uses+=1
			src.TurnedOn=1
			M.Tatsumaki()
	IkazuchiKiba
		name="Parafuso de relâmpago Canino"
		icon_state="Ikazuchi"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.IkazuchiKiba(src.Uses)
	Hinoko
		name="Corte Relampago"
		icon_state="Hinoko"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.Hinoko()
	RairyuuGarou
		name="Rotação relâmpago"
		icon_state="Garou"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			src.DelayIt(450,M,"Element")
			src.Uses+=1
			M.RairyuuGarou()
	Jibashi
		name="Assassinato Eletromagnético"
		icon_state="Jibashi"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1500)
			src.DelayIt(500,M,"Element")
			src.Uses+=1
			M.Jibashi()
	ThunderRing
		name="Divino Anel de Trovão"
		icon_state="Jibashi"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1500)
			src.DelayIt(500,M,"Element")
			src.Uses+=1
			M.DevineThunderRing(Uses)
	OldGian//OldGian()
		name="Eletrocussão Empaladora"
		icon_state="OldGian"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1500)
			src.DelayIt(500,M,"Element")
			src.Uses+=1
			M.OldGian()

	Gian
		name="Escuridão Falsa"
		icon_state="Gian"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(2500,3500)
			src.DelayIt(1200,M,"Element")
			src.Uses+=1
			M.Gian()
	Chidori
		icon_state="Chidori"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20
			if(M.TypeLearning=="Raiton")
				M.exp+=rand(25,100)
			if(M.RaitonKnowledge>3500&&src.Uses>10000)
				M.KirinCheck2=1
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.Chidoriz(0)
	ChidoriNagashi
		icon_state="Nagashi2"
		name = "Corrente Relâmpago"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20
			for(var/obj/SkillCards/Chidori/T in usr.LearnedJutsus)
				if(T&&!T.Delay)
					T.DelayIt(150,M,"Element")
			if(M.TypeLearning=="Raiton")
				M.exp+=rand(350,1000)
			src.DelayIt(500,M,"Element")
			src.Uses+=1
			M.ChidoriNagashi()
	ChidoriSenbon
		icon_state="ChidoriSenbon"
		name = "Chidori Senbon"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20
			for(var/obj/SkillCards/Chidori/T in usr.LearnedJutsus)
				if(T&&!T.Delay)
					T.DelayIt(150,M,"Element")
			if(M.TypeLearning=="Raiton")
				M.exp+=rand(550,1000)
			src.DelayIt(400,M,"Element")
			src.Uses+=1
			M.ChidoriSenbon()
	ChidoriEisou
		name = "Chidori Lança"
		icon_state="ChidoriEisou2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20
			for(var/obj/SkillCards/Chidori/T in usr.LearnedJutsus)
				if(T&&!T.Delay)
					T.DelayIt(150,M,"Element")
			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1000)
			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.ChidoriEisou()
	Raikiri
		icon_state="Raikiri"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20
			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1000)
			if(M.RaitonKnowledge>3500&&src.Uses>10000)
				M.KirinCheck1=1
			src.DelayIt(600,M,"Element")
			src.Uses+=1
			M.Chidoriz(1)
	RaikiriWolf
		name="Raikiri Lobo"
		icon_state="RaikiriWolf"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1000)
			src.DelayIt(850,M,"Element")
			src.Uses+=1
			M.RaikiriWolf()
	BlackPanther
		name="Pantera Negra"
		icon_state="RaikiriWolf"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1000)
			src.DelayIt(850,M,"Element")
			src.Uses+=1
		//	M.BlackPantherJutsu()
	KirinWeak
		name="Kirin(fraco)"
		icon_state="Chidori"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1000)
			src.DelayIt(1000,M,"Element")
			src.Uses+=1
			M.KirinWeakProc()
	KirinStrong
		name="Kirin(forte)"
		icon_state="Raikiri"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(MapWeathers["[M.z]"] == "Heavy Rain")
				Check+=8
			if(prob(Check))
				M.RaitonKnowledge+=1
			if(prob(15)&&M.LightningChakra<20)
				M.LightningChakra+=pick(0.01,0.1)
				if(M.LightningChakra>20)
					M.LightningChakra=20

			if(M.TypeLearning=="Raiton")
				M.exp+=rand(250,1000)
			src.DelayIt(2500,M,"Element")
			src.Uses+=1
			M.KirinStrongProc()
/////////////////////////////
///Doton
///////////////////////
	RockFlurry
		name="Chuva de Meteoros de Rocha"
		icon_state="RockFlurry"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(700,M,"Element")
			src.Uses+=1
	//		M.RockFlurry(src.Uses)
	DoryoDango
		name="Pedaço de Terra"
		icon_state="BigRock"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(250,M,"Element")
			src.Uses+=1
			M.DotonDoryoDangoz(src.Uses)
	DotonSpear
		name="Estilo Terra: Lança"
		icon_state="DotonSpear"
		Activate(mob/M)
			if(M.DotonSpear)
				M.overlays-='Earth Spear.dmi'
				M.DotonSpear=0
				M.WeaponInLeftHand=""
				M<<"The Spear breaks apart."
				src.DelayIt(1200,M,"Element")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.Doton_Spear(src.Uses)
	DotonSpearImpalation
		name="Estilo Terra: Lança empaladora"
		icon_state="DotonSpear"
		Activate(mob/M)
			if(!M.DotonSpear)
				M.overlays-='Earth Spear.dmi'
				M.DotonSpear=0
				M.WeaponInLeftHand=""
				M<<"You need Doton Spear activated to use this technique!"
				src.DelayIt(1200,M,"Element")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.Doton_Spear_Impalation(src.Uses)
	DotonKengan
		name="Estilo Terra: Punho de Pedra"
		icon_state="DotonFist"
		Activate(mob/M)
			if(M.Kengan)
				M.Kengan=0
				M.WeaponInLeftHand=""
				M<<"The fist breaks apart."
				src.DelayIt(1200,M,"Element")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.Uses+=1
			M.DotonKengan(src.Uses)
	DotonArmor
		name="Estilo Terra: Armadura de Pedra"
		icon_state="EarthArmor"
		Activate(mob/M)
			if(M.DotonArmor)
				M.overlays-='Earth Armor.dmi'
				M.DotonArmor=0
				view()<<"[M] begins to shed the rock skin."
				src.DelayIt(1200,M,"Element")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.Uses+=1
			src.DelayIt(750,M,"Element")
			M.Doton_Armor(src.Uses)

	KoukaArmor
		name="Estilo Terra: Endurecimento"
		icon_state="DotonArmorStronger"
		Activate(mob/M)
			if(M.DotonArmor)
				M.overlays-='Earth Armor.dmi'
				M.DotonArmor=0
				view()<<"[M] begins to shed the rock skin."
				M.EnduranceAddOn=0;
				src.DelayIt(1200,M,"Element")
				return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.Uses+=1
			src.DelayIt(750,M,"Element")
			M.Kouka(src.Uses)

	ColumnSpikes
		name="Coluna de Espinhos"
		icon_state="ColumnSpikes"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20
			if(M.DotonKnowledge<=300)
				M.DotonKnowledge+=0.5
			src.DelayIt(650,M,"Nin")
			src.Uses+=1
			M.ColumnSpikes()
	RisingEarthSpikes
		name="Espinhos de Terra"
		icon_state="RisingEarthSpikes"
		Activate(mob/M)
		//	src<<"Disabled because it causes lag."; return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			src.DelayIt(600,M,"Nin")
			src.Uses+=1
			M.RisingEarthSpikes()
	RisingEarthPillars
		name="Subir Pilares de Terra"
		icon_state="RisingEarthSpikes"
		Activate(mob/M)
		//	usr<<"Disabled because it causes lag.";return
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			src.DelayIt(950,M,"Nin")
			src.Uses+=1
			M.RisingEarthPillars()
	Doryuudan
		name="Dragão de Terra"
		icon_state="Doryuudan"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"


			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(450,M,"Element")
			src.Uses+=1
			M.DotonDoryuudanTechnique()
	DotonDoseikiryuu
		name="Dragão de Terra e pedra"
		icon_state="Doryuudan2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(450,M,"Element")
			src.Uses+=1
			M.DotonDoseikiryuu()
	DotonArijigoku
		name="Antlion"
		icon_state="DotonHole"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(450,M,"Element")
			src.Uses+=1
			M.DotonArijigoku()
	Moguragakure
		name="Ocultação da Topeira"
		icon_state="Moguragakure"
		Activate(mob/M)
			if(M.Mogu)
				M.density=1;M.layer=M.SavedLayer;M.Frozen=0;M.firing=0;M.Mogu=0
				M.CreateCrator();M.Mogu=0;src.DelayIt(450,M,"Element");return
			else
				if(M.FrozenBind=="Wire")
					src.DelayIt(150,M,"Element")
					return
				if(src.Uses<100&&M.Trait!="Genius")
					if(prob(95-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				else if(M.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						M<<output("O Jutsu falhou.","Attack");return
				if(M.FiveElementSealed)
					src<<"Você não é capaz de usar Chakra Elemental agora!"
					src.DelayIt(200,M)
					return
				var/Check=15
				if(M.Clan=="Kusakin")
					Check+=8
				if(prob(Check))
					M.DotonKnowledge+=1
				if(prob(15)&&M.EarthChakra<20)
					M.EarthChakra+=pick(0.01,0.1)
					if(M.EarthChakra>20)
						M.EarthChakra=20

				for(var/mob/A in oview(10))
					if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
					if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

				if(M.TypeLearning=="Doton")
					M.exp+=rand(25,100)
				if(!M.EarthE)
					M<<"Você não tem Doton!";del(src)

				src.Uses+=1
				M.Moguragakureno()
	Taiga
		name="Rio de Lama"
		icon_state="Taiga"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(700,M,"Element")
			src.Uses+=1
			M.DoryuuTaiga()


	YomiNuma
		name="Pântano do Submundo"
		icon_state="YomiNuma"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			for(var/obj/SkillCards/SwampBrambles/P in M.LearnedJutsus)
				if(!P.Delay)
					P.DelayIt(150,M)
			if(M.TypeLearning=="Doton")
				M.exp+=rand(2500,3500)
			src.DelayIt(1200,M,"Element")
			src.Uses+=1
			M.DotonYomuNuma(src.Uses)

	SwampBrambles
		name="Pântano De terra"
		icon_state="YomiNuma"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			for(var/obj/SkillCards/YomiNuma/P in M.LearnedJutsus)
				if(!P.Delay)
					P.DelayIt(200,M)
			if(M.TypeLearning=="Doton")
				M.exp+=rand(1100,1500)
			src.DelayIt(400,M,"Element")
			src.Uses+=1
			M.SwampBrambles()
	TsuchiWana
		name="Encontro de Colisão de Rocha"
		icon_state="TsuchiWana"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(25,100)
			src.DelayIt(1200,M,"Element")
			src.Uses+=1
			M.TsuchiWana()
	DorukiGaeshi
		name="Parede de Lama"
		icon_state="DorukiGaeshi"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(250,1000)
			src.DelayIt(150,M,"Element")
			src.Uses+=1
			M.DotonDorukiGaeshi(Uses)
	MoveStopper
		name="Parede de Movimento"
		icon_state="MoveStopper"
		Target_Required=1
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"

			if(M.TypeLearning=="Doton")
				M.exp+=rand(250,1000)
			src.DelayIt(725,M,"Element")
			src.Uses+=1
			M.MoveStopper()
	Doryuuheki
		name="Parede Estilo Terra"
		icon_state="Doryuuheki"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			for(var/obj/SkillCards/TsuchiWana/T in usr.LearnedJutsus)
				if(!T.Delay)
					T.DelayIt(70,M,"Element")
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20
			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Doton")
				M.exp+=rand(250,1000)

			src.DelayIt(650,M,"Element")
			src.Uses+=1
			M.DotonWall()
	DorouDomu
		name="Barreira de Terra"
		icon_state="Domu"
		Deactivate(mob/M)
			M.DotonDorouDomu()
			src.DelayIt(650,M,"Element")
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			for(var/mob/A in oview(10))
				if(A.CopyMode) A.SharinganCopy(src.type,src.Uses)
				if(A.SharinganNotice&&A.SharinganMastery>100) A<<"[M] esta fazendo selos de mão para [src.name]!"
			if(M.TypeLearning=="Doton")
				M.exp+=rand(250,1000)
			src.Uses+=1
			src.TurnedOn=1
			M.DotonDorouDomu()
	DorouDomuCrush
		name="Esmegamento de Terra"
		icon_state="DomuCrush"
		Target_Required=1
		BunshinAble=0
		Deactivate(mob/M)
			src.DelayIt(1200,M,"Element")
			M.DotonCrush()
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			//for(var/mob/A in oview(10))
			//	if(A.CopyMode)
			//		A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Doton")
				M.exp+=rand(2500,5200)
			src.Uses+=1
			src.TurnedOn=1
			M.DotonCrush()

	DotonKakouSekkan
		name="Caixão de pedra"
		icon_state="StoneCoffin"
		Target_Required=1
		BunshinAble=0
		Deactivate(mob/M)
			src.DelayIt(1200,M,"Element")
			M.DotonKakouSekkan()
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("O Jutsu falhou.","Attack");return
			if(M.FiveElementSealed)
				src<<"Você não é capaz de usar Chakra Elemental agora!"
				src.DelayIt(200,M)
				return
			var/Check=15
			if(M.Clan=="Kusakin")
				Check+=8
			if(prob(Check))
				M.DotonKnowledge+=1
			if(prob(15)&&M.EarthChakra<20)
				M.EarthChakra+=pick(0.01,0.1)
				if(M.EarthChakra>20)
					M.EarthChakra=20

			//for(var/mob/A in oview(10))
			//	if(A.CopyMode)
			//		A.SharinganCopy(src.type,src.Uses)

			if(M.TypeLearning=="Doton")
				M.exp+=rand(2500,5200)
			src.Uses+=1
			src.TurnedOn=1
			if(src.TurnedOn)
				src.Deactivate(M);return
			M.DotonKakouSekkan()




//Summoning

//Summoning
	Rashoumon
		name="Rashoumon"
		icon_state="Rashoumon"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Genius")
					if(prob(95-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				else if(usr.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				if(prob(15))
					usr.NinjutsuMastery+=0.1;if(usr.NinjutsuMastery>10) usr.NinjutsuMastery=10
				if(prob(15))
					usr.NinjutsuKnowledge+=1

				src.Delay=1;spawn(600-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(600-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.RashoumonSummon()

	RikudouSageMode
		name="Sage Mode: Six Paths"
		icon_state=""
		BunshinAble=0
		Deactivate(mob/M)
			src.DelayIt(1200,M,"Nin")
			M<<"You release your control over the natural energy in your body..."
			M.SageMode=""
		Activate(mob/M)
			if((M.client.address=="50.126.150.52")||(M.client.computer_id==3816862431))
				return
			src.Uses+=1
			src.TurnedOn=1
			spawn() src.DelayIt(1200,M,"Nin")
			M.RikudouSageMode()
	RikudouSageAura
		name="Sage Mode: Toggle Aura"
		icon_state=""
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(50,M,"Nin")
			M.ToggleSageAura()
//Animals
	SpirallingSpheres
		name="Sage Technique: Spiralling Sphere"
		icon_state="SpiralingSphere"
		NonKeepable=1
		BunshinAble=0
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.SageMode=="")
				usr<<"You need to be in Sage Mode before you can use this!"
				return
			src.DelayIt(1200,usr,"Nin")
			usr.SpirallingSpheres()
	SageModeApe
		name="Modo Sabio: Macaco"
		icon_state="SageModeApe"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.SageMode!="")
				usr<<"You disactivate Sage Mode."
				usr.SageMode=""
				usr.deathcount++
				usr.deathcount++
				src.Delay=1;spawn(550)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(550)
					src.overlays-='Skillcards2.dmi'
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+30
				var/T=120-src.Uses
				if(A>180)
					A=180
				if(T<25)
					T=25
				usr.SageMode(T,A,"Monkey")
				src.Uses+=1
	SageModeSlug
		name="Modo Sabio: Lesma"
		icon_state="SageModeSlug"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.SageMode!="")
				usr<<"You disactivate Sage Mode."
				usr.deathcount++
				usr.deathcount++
				usr.SageMode=""
				src.Delay=1;spawn(550)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(550)
					src.overlays-='Skillcards2.dmi'
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+30
				var/T=120-src.Uses
				if(A>180)
					A=180
				if(T<15)
					T=15
				usr.SageMode(T,A,"Slug")
				src.Uses+=1
	SageModeLion
		name="Modo Sabio: Leão"
		icon_state="SageModeLion"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.SageMode!="")
				usr.deathcount++
				usr.deathcount++
				usr<<"You disactivate Sage Mode."
				usr.SageMode=""
				src.DelayIt(550)
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+300
				var/T=3
				if(A>1200)
					A=1200
				usr.SageMode(T,A,"Lion")
				src.Uses+=1
	SageModeToad
		name="Modo Sabio: Sapo"
		icon_state="SageModeToad2"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.SageMode!="")
				usr<<"You disactivate Sage Mode."
				usr.deathcount++
				usr.deathcount++
				usr.SageMode=""
				src.Delay=1;spawn(550)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(550)
					src.overlays-='Skillcards2.dmi'
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+30
				var/T=120-src.Uses
				if(A>180)
					A=180
				if(T<25)
					T=25
				usr.SageMode(T,A,"Toad")
				src.Uses+=1
	SageModeApe
		name="Modo Sabio: Macaco"
		icon_state="SageModeApe"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.SageMode!="")
				usr<<"You disactivate Sage Mode."
				usr.SageMode=""
				usr.deathcount++
				src.Delay=1;spawn(550)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(550)
					src.overlays-='Skillcards2.dmi'
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+30
				var/T=120-src.Uses
				if(A>180)
					A=180
				if(T<25)
					T=25
				usr.SageMode(T,A,"Monkey")
				src.Uses+=1

	SageModeSenju
		name="Modo Sabio: Mokuton"
		icon_state="Sage Mokuton"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.SageMode!="")
				usr<<"Você desativa o Modo Sabio."
				usr.SageMode=""
				usr.deathcount++
				src.Delay=1;spawn(550)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(550)
					src.overlays-='Skillcards2.dmi'
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+30
				var/T=120-src.Uses
				if(A>300)
					A=300
				if(T<25)
					T=25
				usr.SageMode(T,A,"Senju")
				src.Uses+=1
////////////////////////
////////////////Kyuubi Chakra///////////////////////////////////////////
	KyuubiTail
		name="9 Tail"
		icon='Icons/Jutsus/Skillcards.dmi'
		icon_state="Kyuubi"

		Click()
			if((usr.client.address=="50.126.150.52")||(usr.client.computer_id==3816862431))
				return
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(usr.Bijuu!="")
				usr.icon_state="handseal"
				usr<<"You disactivate your chakra."
			/*if(src.knockedout)
				usr<<"You aura disapears."
				src.overlays-='Icons/Jutsus/Bijuu/Kyuubi1.dmi'
				src.overlays-='Icons/Jutsus/Bijuu/Kyuubi2.dmi'
				usr.nin=usr.Mnin
				usr.gen=usr.Mgen
				usr.tai=usr.Mtai*/

				if(usr.Bijuu=="KyuubiTail")
					//usr.overlays-='SageMonkeyTail.dmi'
					var/icon/A='Icons/New Base/Base.dmi'
					A+=rgb(usr.BaseR,usr.BaseG,usr.BaseB)
					usr.icon=null
					usr.icon=A
					usr.nin=usr.Mnin
					usr.gen=usr.Mgen
					usr.tai=usr.Mtai
				usr.Bijuu=""
				usr.icon_state=""
				src.Delay=1;spawn(550)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(550)
					src.overlays-='Skillcards2.dmi'
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				var/A=src.Uses+30
				var/T=30-src.Uses
				if(A>50)
					A=50
				if(T<20)
					T=20
				usr.Bijuu(T,A,"KyuubiTail")
				src.Uses+=1
/////////////////////////////////////////////////////////////////////////////////////////////////////
	MeltingAcidWave
		name="Acid Spit Jutsu"
		icon_state="MeltingAcidWave"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Genius")
					if(prob(95-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				else if(usr.Trait=="Genius"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				src.DelayIt(600,usr,"Nin")
				src.Uses+=1
				usr.AcidWave()
	ZeroVoidBarrier
		name="Zero Void Barrier"
		icon_state="ZeroVoidBarrier"
		Deactivate(mob/M)
			M.ZeroVoidBarrier()
			src.DelayIt(30,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			src.Uses+=1
			src.TurnedOn=1
			M.ZeroVoidBarrier()
	BodyFlameJutsu
		name="Body Flame Teleportation"
		icon_state="bodyflame2"
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Genius")
				if(prob(95-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Genius"&&src.Uses<50)
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			src.Uses+=1
			src.DelayIt(750,M,"Nin")
			M.BodyFlameJutsu()
	CursedSealActivation
		name="Selo Amaldiçoado"
		icon_state="CurseSeal"
		Deactivate(mob/M)
			src.DelayIt(1200,M,"Nin")
			M.CursedSealActivation()

			return
		Activate(mob/M)
			src.Uses+=1
			src.TurnedOn=1
			if(M.knockedout)
				spawn() src.DelayIt(1200,M,"Nin")
			M.CursedSealActivation()
	Kyuubi
		name="Nine Tailed Kyuubi Chakra"
		icon_state="Kyuubi"
		Click()
			if(src.Delay>0)
				usr<<sound('SFX/click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
					usr.TailState=0
					src.Delay=1;spawn(400)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(400-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(usr.BijuuMastery>100)
						Controllable=1
					src.Uses++
					usr.ReleaseKyuubi(1,Controllable)
	Juubi
		name="Juubi"
		icon_state="Kyuubi"
		Click()
			if(src.Delay>0)
				usr<<sound('SFX/click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='Icons/Jutsus/Bijuu/Juubi.dmi'
					usr.TailState=0
					src.Delay=1;spawn(400)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(400-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(usr.BijuuMastery>100)
						Controllable=1
					src.Uses++
					usr.ReleaseJuubi(1,Controllable)
	Nibi
		name="Two Tailed Cat Chakra"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('SFX/click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='cataura.dmi'
					usr.TailState=0
					src.Delay=1;spawn(400)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(400-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(usr.BijuuMastery>100)
						Controllable=1
					src.Uses++
					usr.ReleaseNibi(1,Controllable)
	Rehiam
		name="Rehiam Chakra"
		icon_state="Rehiam"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='Rehiam.dmi'
					usr.TailState=0
					src.Delay=1;spawn(400)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(400-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(usr.BijuuMastery>100)
						Controllable=1
					src.Uses++
					usr.ReleaseRehiam(1,Controllable)
	BlackShot
		name="Enton: Release"
		icon_state="BlackShot"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/DarkBlade)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/DarkBlade))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.BlackShot()
					src.DelayIt(350,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return

/*	EvanesenceChakra
		name="Evanesence: Chakra Blast"
		icon_state="BlackShot"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/Evanesence)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/Evanesence))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.YellowChakra()
					src.DelayIt(750,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return
				*/

	ShibukiDash
		name="Shibuki Explosive Dash"
		icon_state="BlackShot"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/Shibuki)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/Shibuki))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.ShibukiExpDash()
					src.DelayIt(930,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return
	KaitoReach//KaitoExtend(
		name="Kaito: Invisible Assault"
		icon_state="BlackShot"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/InvisibleKaito)||istype(usr.WeaponInLeftHand,/obj/WEAPONS/InvisibleKaito))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.KaitoExtend()
					src.DelayIt(930,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return

	KaitoInvisibleCuts
		name="Kaito: Invisible Slashes"
		icon_state="BlackShot"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/InvisibleKaito)||istype(usr.WeaponInLeftHand,/obj/WEAPONS/InvisibleKaito))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.KaitoInvisCuts()
					src.DelayIt(930,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return

	EvanesenceBlastJutsu
		name="Evanesence: Chakra Wave Blast"
		icon_state="BlackShot"
		NonKeepable=1
		Activate(mob/M)
			if((istype(usr.WeaponInRightHand,/obj/WEAPONS/Evanesence))||(istype(usr.WeaponInLeftHand,/obj/WEAPONS/Evanesence)))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.EvanesenceBlastJutsu()
					src.DelayIt(250,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return
	LightShot
		name="Enton: Release"
		icon_state="BlackShot"
		NonKeepable=1
		/*Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/LightBlade)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/LightBlade))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.LightShot()
					src.DelayIt(100,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return*/

	BlackGouryuuka
		name="Enton: Dragonic Rage"
		icon_state="BlackGouryuuka"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/DarkBlade)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/DarkBlade))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.BlackGouryuuka()
					src.DelayIt(750,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return
	/*LightGouryuuka
		name="Enton: Dragonic Rage"
		icon_state="BlackGouryuuka"
		NonKeepable=1
		Activate(mob/M)
			if(istype(usr.WeaponInRightHand,/obj/WEAPONS/LightBlade)&&istype(usr.WeaponInLeftHand,/obj/WEAPONS/LightBlade))
				if(usr.LeftHandSheath||usr.RightHandSheath)
					src.Uses+=1
					spawn() M.LightGouryuuka()
					src.DelayIt(200,usr,"Nin")
				else
					usr<<"You need to unsheath the legendary blade first."
					return
			else
				usr<<"You need to equip the legendary blade first."
				return*/
//Naga Sword
	VoidOpen1
		name="Naga; Reverse Warp"
		icon_state="ReverseWarp"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(100)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(100-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.OpenVoid()
	VoidOpen2
		name="Naga; Portal"
		icon_state="Portal"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(50)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(50-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.OpenVoid2()
	VoidOpen3
		name="Naga; Human Portal"
		icon_state="Portal"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(50)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(50-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.OpenVoid3()

//Rose Blade Sword

	RosePetal
		name="Petal Rose"
		icon_state="PetalRose"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.LegendaryPetals==1)
				src.overlays+='Skillcards2.dmi'
				src.Delay=1;spawn(600-usr.NinjutsuMastery)
					src.Delay=0
					src.overlays-='Skillcards2.dmi'
				usr.SummonPetals()
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Uses+=1
				usr.SummonPetals()


	//Rinnegan
	RinneganActivate
		name="Rinnegan"
		icon_state="Rinnegan"
		Activate(mob/M)
			src.DelayIt(150,M)
			src.Uses++
			M.Rinnegan_Activate()
	ShinraTensei
		name="Deva: Shinra Tensei"
		icon_state="Shinra"
		Activate(mob/M)
			src.DelayIt(50,M)
			src.Uses+=1
			M.ShinraTensei()
	BashoTenin
		name="Deva: Basho Tenin"
		icon_state="Basho"
		Activate(mob/M)
			src.DelayIt(50,M)
			src.Uses+=1
			M.BashoTenin()
	RinneganSummon
		name="Animal: Summon"
		icon_state="Summon"
		Activate(mob/M)
			src.DelayIt(5000,M)
			src.Uses+=1
			var/list/Mobs=list()
			for(var/mob/D in world)
				Mobs+=D
			var/mob/Person=input(M,"Summon who?") in Mobs
			M.RinneganSummon(Person)
	SoulRip
		name="Human: Soul Extraction"
		icon_state="Soul"
		Activate(mob/M)
			src.DelayIt(600,M)
			src.Uses+=1
			M.SoulRemove()
	AsuraRealm
		name="Asura: Toggle"
		icon_state="Asura"
		Activate(mob/M)
			src.DelayIt(600,M)
			src.Uses+=1
			M.ToggleAsura()
	AsuraPunch
		name="Asura: Rocket Punch"
		icon_state="Rocket Punch"
		NonKeepable=1
		Activate(mob/M)
			src.DelayIt(60,M)
			src.Uses+=1
			M.AsuraRealmPunch()
	AsuraRocket
		name="Asura: Missle"
		icon_state="Missle"
		NonKeepable=1
		Activate(mob/M)
			src.DelayIt(300,M)
			src.Uses+=1
			M.AsuraMissle(1,0)
	NarakaSoulRip
		name="Naraka: Soul Removal"
		icon_state="Soul"
		Activate(mob/M)
			src.DelayIt(600,M)
			src.Uses+=1
			M.NarakaSoulRemove()
	NarakaRestoration
		name="Naraka: Restoration"
		icon_state="Restoration"
		Activate(mob/M)
			src.DelayIt(300,M)
			src.Uses+=1
			M.NarakaRestoration()

/////////////////
//Xiveres Jutsus
	XiveresSoulAbsorb
		BunshinAble=0
		name="Xiveres: Soul Absorbtion"
		icon_state="Soul"
		Activate(mob/M)
			src.DelayIt(350,M)
			src.Uses+=1
			M.XiveresSoulAbsorb()
	XiveresLeaderSummon
		name="Xiveres Leader: Soul Summon"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(5000,M)
			src.Uses+=1
			M.XiveresLeaderSoulSummon()
	XiveresSoulCytoplasm
		name="Xiveres: Soul Conversion Cytoplasm"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(600,M)
			src.Uses+=1
			M.XiveresCytoplasm()
	XiveresSoulEmpowerment
		name="Xiveres: Soul Empowerment"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(1250,M)
			src.Uses+=1
			M.XiveresSoulUnleash()
	XiveresSoulAssault
		name="Xiveres: Soul Assault"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(650,M)
			src.Uses+=1
			M.XiveresSoulAssault()
	XiveresLeaderSuicideHeal
		name="Xiveres Leader: Sacrificial Rejuvination"
		icon_state="XiveresSoul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(1250,M)
			src.Uses+=1
			M.XiveresLeaderSacrificialRejuvination()
	XiveresPunishment
		name="Xiveres: Betraying Punishment"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(3000,M)
			src.Uses+=1
			M.XiveresSelfishPunishment()
	XiveresBodySoulRemoval
		name="Xiveres: Soul Body Transfer"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(1000,M)
			src.Uses+=1
			M.XiveresSoulTransportation()
	XiveresSoulR
		name="Xiveres: Soul Removal"
		icon_state="Soul"
		BunshinAble=0
		Activate(mob/M)
			src.DelayIt(600,M)
			src.Uses+=1
			M.XiveresSoulRemove()
	XiveresHealing
		name="Xiveres: Soul Replenishing"
		icon_state="XiveresSoul"
		BunshinAble=0
		Activate(mob/M)
			src.Uses+=1
			M.XiveresHeal()

	XiveresOpen1
		name="Xiveres: Teleport"
		icon_state="ReverseWarp"
		NonKeepable=1
		BunshinAble=0
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(100)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(100-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.XiveresToBase()
	XiveresOpen2
		name="Xiveres: Portal"
		icon_state="Portal"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(50)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(50-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.XiveresGate_Warp()

	XiveresOpen3
		name="Xiveres: Specific Teleport"
		icon_state="Portal"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(50)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(50-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.XiveresPersonWarp()
	FoxerbolicTimeChamber
		name="Foxerbolic Time Chamber"
		icon_state="Portal"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(50)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(50-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.FoxTimeChamber()
	SkiesTeleport
		name="Reach For The Sky"
		icon_state="ReverseWarp"
		NonKeepable=1
		BunshinAble=0
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(650)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(650-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.ReachForTheSky()
	IndigoTeleport
		name="Head back to Base"
		icon_state="ReverseWarp"
		NonKeepable=1
		BunshinAble=0
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.Delay=1;spawn(650)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(650-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				src.Uses+=1
				usr.IndigoWarp()
//////////////////
///Minato Space Time jutsus



///////////////
//Sasuna I tested all of these and none of them have an issue with savefiles.
//If you have a legitimate reason for disabling these, please contact me
//Otherwise they're fine.
//////////////
	FlyingThunderGod
		name="Flying Thunder God"
		icon_state="FTG"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.DelayIt(100,usr,"Nin")
				src.Uses+=1
				usr.Flying_Thunder_God_Mode()		//Please contact me on MSN. You need to explain why you keep disabling these.

	FlyingThunderGod1
		name="Flying Thunder God Lv 1"
		icon_state="FTG1"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.DelayIt(300,usr,"Nin")
				src.Uses+=1
				usr.Flying_Thunder_God_1()

	FlyingThunderGod2
		name="Flying Thunder God Lv 2"
		icon_state="FTG2"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.DelayIt(1,usr,"Nin")
				src.Uses+=1
				usr.Flying_Thunder_God_2()

	MarkerPlace
		name="Place Marking Seal"
		icon_state="Place"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.DelayIt(20,usr,"Nin")
				src.Uses+=1
				usr.Place_Marker()

	MarkerPlaceQuick
		name="Place Quick Marking Seal"
		icon_state="Place"
		NonKeepable=1
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				src.DelayIt(50,usr,"Nin")
				src.Uses+=1
				usr.Place_Marker_Quick()

/////////////////////////////
//Summons


	Summoning_Jutsu_Joy
		name="Summoning(Joy)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Joy")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Joy",1,500)
	Summoning_Jutsu_Ene
		name="Summoning(Ene)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Ene")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Ene",1,500)
	Summoning_Jutsu_Nega
		name="Summoning(Nega)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Nega")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Nega",1,500)
	Summoning_Jutsu_Inf
		name="Summoning(Inf)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			src.DelayIt(300,M,"Nin")
			M.Unsummon("Fairy Inf")

			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Fairy Inf",1,500)
	Summoning_Jutsu_Darke
		name="Summoning(Darke)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			M.Unsummon("Wolf Darke")
			src.DelayIt(300,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Darke",1,1000)
	Summoning_Jutsu_Griffin
		name="Summoning(Griffin)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			M.Unsummon("Wolf Griffin")
			src.DelayIt(300,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Griffin",1,1000)
	Summoning_Jutsu_Zune
		name="Summoning(Zune)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			M.Unsummon("Wolf Zune")
			src.DelayIt(300,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Zune",1,1000)
	Summoning_Jutsu_Zute
		name="Summoning(Zute)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			M.Unsummon("Wolf Zute")
			src.DelayIt(300,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Zute",1,1000)
	Summoning_Jutsu_Coro
		name="Summoning(Coro)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			M.Unsummon("Wolf Coro")
			src.DelayIt(300,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.DelayIt(650)
			src.TurnedOn=1
			M.SummoningJutsu("Wolf Coro",3,5000)
	////////SLUG/////////
	Summoning_Jutsu_Katsuya
		name="Summoning(Katsuya)"
		icon_state="FuumaTeleportation"
		Deactivate(mob/M)
			M.Unsummon("Slug Katsuya")
			src.DelayIt(300,M,"Nin")
			return
		Activate(mob/M)
			if(src.Uses<100&&M.Trait!="Speedy")
				if(prob(50-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			else if(M.Trait=="Speedy"&&src.Uses<50)
				if(prob(25-src.Uses))
					M<<output("The jutsu failed.","Attack");return
			var/BloodOffering=0
			for(var/obj/undereffect/A in M.loc)
				if(A.icon=='Blood.dmi')
					BloodOffering=1
			if(!BloodOffering)
				M<<"You must be standing on Blood to Summon!";return
			src.Uses+=1
			src.TurnedOn=1
			M.SummoningJutsu("Slug Katsuya",3,5000)

//Bijuu//////////////
//Shukaku
	Shukaku0
		name="Power State(Shukaku)"
		icon_state="Shukaku"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='ShukakuSand.dmi'
					usr.overlays-='ShukakuSand.dmi'
					usr.overlays-='ShukakuSand.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
				//	if(usr.sphere)
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseShukaku0(Controllable)

	ShukakuAirBullet
		name="Shukaku: Drilling Air Bullet"
		icon_state="Nibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You need to be in the Shukaku form to use this attack!";return
				src.Uses++
				src.Delay=1;spawn(750-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(750-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.RenkuudanJutsu()
				return
//Artificial Nibi
	ArtificialNibi0
		name="Power State(Artificial: Nibi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0)
					usr<<"You release the artificial chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/ArtificialNibi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/ArtificialNibi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseArtificialNibi0(Controllable,0,0.5)

	ArtificialNibi1
		name="One-Tailed(Artificial Nibi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5)
					usr<<"You release the artificial chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/ArtificialNibi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/ArtificialNibi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=1
					usr<<"<font color=red>You allow more of the Artificial Nibi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseArtificialNibi0(Controllable,0,1)
	ArtificialNibi2
		name="Two-Tailed(Artificial Nibi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5&&usr.TailState!=1)
					usr<<"You release the Artificial chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/ArtificialNibi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/ArtificialNibi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==1)
					usr.TailState=2
					usr<<"<font color=red>You allow more of the Artificial Nibi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=2
					usr<<"<font color=red>You let the Artificial Nibi's chakra gush forth, instantly forming two chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseArtificialNibi0(Controllable,0,2)

	ArtificialNibiFlame
		name="Artificial Nibi: Cindering Flames"
		icon_state="Nibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=2)
					usr<<"You need to be in the second tailed form to use this attack!";return
				src.Uses++
				src.Delay=1;spawn(60-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(650-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.ArtificialNibiFlameProjectile()
				return
	ArtificialNibiUnstoppableFlames
		name="Artificial Nibi: Flames of Neglect"
		icon_state="Nibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=2)
					usr<<"You need to be in the second tailed form to use this attack!";return
				src.Uses++
				src.Delay=1;spawn(1000-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(1000-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.ArtificialMassiveLavaOverFlowingJutsu()
				return
//Nibi
	Nibi0
		name="Power State(Nibi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Nibi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Nibi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseNibi0(Controllable,0,0.5)

	Nibi1
		name="One-Tailed(Nibi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Nibi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Nibi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=1
					usr<<"<font color=red>You allow more of the Nibi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseNibi0(Controllable,0,1)
	Nibi2
		name="Two-Tailed(Nibi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5&&usr.TailState!=1)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Nibi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Nibi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==1)
					usr.TailState=2
					usr<<"<font color=red>You allow more of the Nibi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=2
					usr<<"<font color=red>You let the Nibi's chakra gush forth, instantly forming two chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseNibi0(Controllable,0,2)

	NibiFlame
		name="Nibi: Cindering Flames"
		icon_state="Nibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=2)
					usr<<"You need to be in the second tailed form to use this attack!";return
				src.Uses++
				src.Delay=1;spawn(60-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(650-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.NibiFlameProjectile()
				return
	NibiUnstoppableFlames
		name="Nibi: Flames of Neglect"
		icon_state="Nibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=2)
					usr<<"You need to be in the second tailed form to use this attack!";return
				src.Uses++
				src.Delay=1;spawn(1000-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(1000-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.MassiveLavaOverFlowingJutsu()
				return

//Sanbi


	Sanbi0
		name="Power State(Sanbi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Sanbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseSanbi0(Controllable,0,0.5)

	Sanbi1
		name="One-Tailed(Sanbi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Sanbi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=1
					usr<<"<font color=red>You allow more of the Sanbi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseSanbi0(Controllable,0,1)

	Sanbi2
		name="Two-Tailed(Sanbi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Sanbi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==1)
					usr.TailState=2
					usr<<"<font color=red>You allow more of the Sanbi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=2
					usr<<"<font color=red>You let the Sanbi's chakra gush forth, instantly forming two chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseSanbi0(Controllable,0,1)
	Sanbi3
		name="Three-Tailed(Sanbi)"
		icon_state="Nibi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Sanbi0/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Sanbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==2)
					usr.TailState=3
					usr<<"<font color=red>You allow more of the Sanbi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=3
					usr<<"<font color=red>You let the Sanbi's chakra gush forth, instantly forming three chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseSanbi0(Controllable,0,1)

	SuitonRavashingWave
		name="Sanbi: Ravashing Destruction"
		icon_state="Nibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if((usr.TailState!=2&&usr.TailState!=3)&&usr.key!="CobraT1337")
					usr<<"You need to be in at least the second tailed form to use this attack!";return
				src.Uses++
				src.Delay=1;spawn(1000-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(1000-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.SuitonRavashingDestruction()
				return
/*

	Sanbi
		name="Power State(Sanbi)"
		icon_state="Sanbi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='demonturtle.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
		//			usr.ReleaseSanbi(Controllable)
	Sanbi1
		name="One-Tailed(Sanbi)"
		icon_state="Sanbi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='demonturtle.dmi'
					usr.overlays-='demonturtletail1O.dmi'
					usr.underlays-='demonturtletail1U.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
			//		usr.ReleaseSanbi1(Controllable)
	Sanbi2
		name="Two-Tailed(Sanbi)"
		icon_state="Sanbi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=1)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='demonturtle.dmi'
					usr.overlays-='demonturtletail1O.dmi'
					usr.underlays-='demonturtletail1U.dmi'
					usr.overlays-='demonturtletail2O.dmi'
					usr.underlays-='demonturtletail2U.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
				//	usr.ReleaseSanbi2(Controllable)
	Sanbi3
		name="Three-Tailed(Sanbi)"
		icon_state="Sanbi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=2)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='demonturtle.dmi'
					usr.overlays-='demonturtletail1O.dmi'
					usr.underlays-='demonturtletail1U.dmi'
					usr.overlays-='demonturtletail2O.dmi'
					usr.underlays-='demonturtletail2U.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
				//	usr.ReleaseSanbi3(Controllable)
				*/



//Yonbi
	Yonbi
		name="Power State(Yonbi)"
		icon_state="Yonbi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Yonbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi4/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					src.DelayIt(650,usr)
					usr.ReleaseYonbi(Controllable,0,0.5)
	Yonbi1
		name="One-Tailed(Yonbi)"
		icon_state="Yonbi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Yonbi/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi4/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=1
					usr<<"<font color=red>You allow more of the Yonbi's chakra to slip out, forming a single chakra tail..</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					src.DelayIt(650,usr)
					usr.ReleaseYonbi(Controllable,0,1)

	Yonbi2
		name="Two-Tailed(Yonbi)"
		icon_state="Yonbi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=1&&usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Yonbi/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi4/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==1)
					usr.TailState=2
					usr<<"<font color=red>You allow more of the Yonbi's chakra to slip out, forming two chakra tails!</font>"
					return
				else if(usr.TailState>0&&usr.TailState==0.5)
					usr.TailState=2
					usr<<"<font color=red>You let the Yonbi's chakra gush forth, instantly forming two chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					src.DelayIt(650,usr)
					usr.ReleaseYonbi(Controllable,0,2)

	Yonbi3
		name="Three-Tailed(Yonbi)"
		icon_state="Yonbi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=1&&usr.TailState!=0.5&&usr.TailState!=2)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Yonbi/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi4/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==2)
					usr.TailState=3
					usr<<"<font color=red>You allow more of the Yonbi's chakra to slip out, forming three chakra tails!</font>"
					return
				else if(usr.TailState>0&&usr.TailState==2)
					usr.TailState=3
					usr<<"<font color=red>You let the Yonbi's chakra gush forth, instantly forming two chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					src.DelayIt(650,usr)
					usr.ReleaseYonbi(Controllable,0,3)

	Yonbi4
		name="Four-Tailed(Yonbi)"
		icon_state="Yonbi"
		Click()
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.BijuuTransforming)
					return
				if(usr.TailState>0&&usr.TailState!=1&&usr.TailState!=0.5&&usr.TailState!=2&&usr.TailState!=3)
					usr<<"You release the chakra cloak from your body."
					usr.TailState=0
					for(var/obj/SkillCards/Yonbi/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi1/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi2/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					for(var/obj/SkillCards/Yonbi3/Y in usr.LearnedJutsus)
						spawn() Y.DelayIt(650,usr)
					src.DelayIt(650,usr)
					return
				else if(usr.TailState>0&&usr.TailState==3)
					usr.TailState=4
					usr<<"<font color=red>You allow more of the Yonbi's chakra to slip out, forming four chakra tails!</font>"
					return
				else if(usr.TailState>0&&usr.TailState==3)
					usr.TailState=4
					usr<<"<font color=red>You let the Yonbi's chakra gush forth, instantly forming four chakra tails!!</font>"
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					src.DelayIt(650,usr)
					usr.ReleaseYonbi(Controllable,0,4)


	LavaStream
		name="Lava Stream"
		icon_state="Yonbi"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Speedy")
					if(prob(95-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				else if(usr.Trait=="Speedy"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				src.DelayIt(600,usr,"Nin")
				src.Uses+=1
				usr.Lavastream()
	LavaRiver
		name="Lava River"
		icon_state="Yonbi"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Speedy")
					if(prob(95-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				else if(usr.Trait=="Speedy"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				src.DelayIt(600,usr,"Nin")
				src.Uses+=1
				usr.LavaRiver(src.Uses)
	VolcanicLavaStream
		name="Volcanic Lava Stream"
		icon_state="Yonbi"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Speedy")
					if(prob(95-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				else if(usr.Trait=="Speedy"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				src.DelayIt(600,usr,"Nin")
				src.Uses+=1
				usr.VolcanicLavaSprout()
	VolcanicLavaCreation
		name="LavaCreation"
		icon_state="Yonbi"
		Click()
			if(usr.resting||usr.meditating)
				usr<<"You can't do this, you're resting or in chakra generation mode."
				return
			if(usr.Dead||usr.FrozenBind=="Dead"||usr.DoingPalms)
				usr<<"Not now."
				return
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<output("You must wait to use this technique.","Attack");return
			else
				if(src.Uses<100&&usr.Trait!="Speedy")
					if(prob(95-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				else if(usr.Trait=="Speedy"&&src.Uses<50)
					if(prob(50-src.Uses))
						usr<<output("The jutsu failed.","Attack");return
				src.DelayIt(600,usr,"Nin")
				src.Uses+=1
				usr.VolcanicLavaCreation()
//Gobi
	Gobi
		name="Power State(Gobi)"
		icon_state="Gobi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseGobi(Controllable)
//Gobi2
	GobiType2
		name="One-Tailed(Gobi)"
		icon_state="Gobi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseGobiType2(Controllable)
	GobiType21
		name="Two-Tailed(Gobi)"
		icon_state="Gobi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=1)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseGobiType21(Controllable)
//Rokubi
	Rokubi
		name="Power State(Rokubi)"
		icon_state="Rokubi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='Bijuu1.dmi'
					usr.overlays-='Bijuu1.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					if(src.Uses==550)
						usr.LearnedJutsus+=new /obj/SkillCards/Rokubi1
					src.Uses++
					usr.ReleaseRokubi(Controllable)
	Rokubi1
		name="One-Tailed(Rokubi)"
		icon_state="Rokubi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='Bijuu1.dmi'
					usr.overlays-='Bijuu1.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseRokubi1(Controllable)

	Rokubi2
		name="Two-Tailed(Rokubi)"
		icon_state="Rokubi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=1)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseRokubi2(Controllable)
//Shichibi
	Shichibi
		name="Power State(Shichibi)"
		icon_state="Nanabi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseShichibi(Controllable)
//Shichibi
	Shichibi1
		name="One-Tailed(Shichibi)"
		icon_state="Nanabi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='DemonAura0.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseShichibi1(Controllable)


//Nanabi
	Nanabi
		name="Power State(Nanabi)"
		icon_state="Nanabi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseNanabi(Controllable)
//NanabiType2
	NanabiType2
		name="One-Tailed(Nanabi)"
		icon_state="Nanabi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='DemonAura0.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseNanabiType2(Controllable)
	FlameFest
		name="Flame Fest(Nanabi)"
		icon_state="Nanabi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState<=0.5)
					usr<<"You need to be in the tail form!";return
				src.Uses++
				src.Delay=1;spawn(60-usr.NinjutsuMastery)
					src.Delay=0
				src.overlays+='Skillcards2.dmi'
				spawn(650-usr.NinjutsuMastery)
					src.overlays-='Skillcards2.dmi'
				usr.NanabiFlameFest()

	Doragon
		name="Power State(Doragon)"
		icon_state="Hachibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.DelayIt(600,usr,"Nin")
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=1
					src.Uses++
					usr.ReleaseDoragon(Controllable)



//Hachibi
	Hachibi
		name="Power State(Hachibi)"
		icon_state="Hachibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseHachibi(Controllable)
//Hachibi
	HachibiType2
		name="One-Tailed(Hachibi)"
		icon_state="Hachibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseHachibiType2(Controllable)
//Hachibi
	HachibiType3
		name="Two-Tailed(Hachibi)"
		icon_state="Hachibi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=1)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseHachibiType3(Controllable)
//Kyuubi
	Kyuubi0
		name="Power State(Kyuubi)"
		icon_state="Kyuubi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseKyuubi0(Controllable)
	Kyuubi1
		name="One-Tailed(Kyuubi)"
		icon_state="Kyuubi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=0.5)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseKyuubi1(Controllable)
	Kyuubi2
		name="Two-Tailed(Kyuubi)"
		icon_state="Kyuubi"
		Click()
			if(usr.KBunshinOn)
				var/A=usr.controlled
				usr=A
			else
				usr=usr
			if(src.Delay>0)
				usr<<sound('Click2.wav');return
			else
				if(usr.Bijuu=="")
					del(src)
				if(usr.TailState!=1)
					usr<<"You release the chakra cloak from your body."
					usr.overlays-='kyuubi.dmi'
					usr.overlays-='kyuubi1.dmi'
					usr.overlays-='kyuubi2.dmi'
					usr.TailState=0
					src.Delay=1;spawn(60-usr.NinjutsuMastery)
						src.Delay=0
					src.overlays+='Skillcards2.dmi'
					spawn(650-usr.NinjutsuMastery)
						src.overlays-='Skillcards2.dmi'
					return
				else
					var/Controllable=0
					if(src.Uses>100)
						Controllable=1
					src.Uses++
					usr.ReleaseKyuubi2(Controllable)
	Kurama
		name="Call On Kurama!"
		icon_state="Kurama"
		Click()
			usr<<sound('Click2.wav');return
	EdoTensei
		name="Impure World Resurrection"
		icon_state="EdoSummon"
		Deactivate(mob/M)
			usr.EdoTensei()
			src.DelayIt(300,M,"Nin")
		Activate(mob/M)
			src.Uses+=1
			usr.EdoTensei()
	FushiTensei
		name="Living Corpse Reincarnation"
		icon_state="FushiTensei"
		Activate(mob/M)
			src.DelayIt(3000,M)
			src.Uses+=1
			M.UseFushi=1
			M<<"You prepare the seal for Fushi Tensei. Click on a target within 2 tiles of you to activate it!"

	HideIdentity
		name="Hide Identity"
		icon_state="Henge"
		Activate(mob/M)
			src.DelayIt(300,M)
			src.Uses+=1
			M.HideIdentity()

	DNATransfer
		name="DNA Implant"
		icon_state="Implant"
		Activate(mob/M)
			src.DelayIt(300,M)
			src.Uses+=1
			M.ImplantDNA()

//Sapos




////////////////////////////////////////////////////////
mob/proc/SharinganCopy(Type,Uses)
	if(src.client)
		var/A = new Type
		if(A)
			if(!(locate(Type) in src.LearnedJutsus))
				src.LearnedJutsus+=A
				A:NonKeepable=1
				A:Copied=1
				A:Uses=Uses
				src<<"You have copied [A:name]!"
				src.CopyMode=0
////////////////////////////////////////////////////
//RosePetal Proc

mob/var/list/Petallist=new
mob/var/tmp/LegendaryPetals=0
mob/proc
	SummonPetals()
		if(src.LegendaryPetals==2)
			usr<<"You are already using Rose Petal Blade for something else!"
			return
		if(src.LegendaryPetals)
			usr.LegendaryPetals=0
			usr<<"You return the petals back into your sword!"
			usr.firing=0
			usr.controlled=null
			usr.client.perspective=MOB_PERSPECTIVE
			usr.client.eye=usr
			for(var/mob/RoseBlade/petals/P in world) if(P.Owner == usr) del(P)
		else
			var/mob/RoseBlade/petals/A=new()
			A.loc=src.loc
			A.Owner=src
			src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			src.client.eye=A
			src.chakra-=500
			src.controlled=A
			src.icon_state="Guard"
			src.firing=1
			src<<"You release a torrent of Rose Petals from your sword!"
			src.LegendaryPetals=1
			while(src.LegendaryPetals)
				src.chakra-=50
				sleep(50)



/////////////////////////////////////////////////////////
//Petal Objects

mob/RoseBlade/petals
	icon = 'Zanpakutou.dmi'
	icon_state = "Petals"
	density = 1
	health=10000000000000000000000000000
	//Running=1
	var
		Hit=0
	Move()
		var/obj/Jutsu/RoseBlade/Mpetal/L=new()
		L.loc = src.loc
		L.Owner = src.Owner
		..()
	Bump(A)
		if(ismob(A))
			var/mob/O = src.Owner
			var/mob/M = A
			if(M.Kaiten||M.sphere)
				return
			if(!src.Hit)
				src.Hit=1
				spawn(5)
					src.Hit=0
				var/damage=rand(125,500)
				M.DamageProc(damage,"Health",O)
				spawn()
					M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody()
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				return 0
		if(istype(A,/obj/Jutsu/RoseBlade/Mpetal/))
			var/obj/Jutsu/RoseBlade/Mpetal/B = A
			src.loc=B.loc
		if(istype(A,/obj/))
			return 0

obj/Jutsu
	RoseBlade/Mpetal
		icon='Zanpakutou.dmi'
		icon_state="Petals"
		density=1
		pixel_step_size=16
		New()
			..()
			spawn(60)
				del(src)

