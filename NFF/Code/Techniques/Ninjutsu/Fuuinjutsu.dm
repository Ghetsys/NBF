

//It's true...These are severely underrated =_=...SHOULD WORK ON!

//Fuuinjutsu: Handseal
////////////////
mob/var/tmp/FuuinjutsuHandseal=0
mob/var/tmp/FuuinjutsuHellsent=0
mob/var/tmp/InHellSent=0
mob/proc/FuuinjutsuHandseal()
	usr.Target()
	if(usr.ntarget)
		return
	else
		src.Handseals(15-src.HandsealSpeed)
		if(src.HandsSlipped) return
		var/ChakraLoss=500
		src.chakra-=ChakraLoss
		var/mob/M =src.target
		if(prob(10))
			src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
		var/Distance=(src.gen/15)+(src.ChakraC/20)//var/Distance=(src.gen/10)+(src.ChakraC/10)
		if(get_dist(M,src)<=Distance)
			src<<"Você gera chakra em [M]! Vai demorar 5 segundos para selá-lo!"
			src.Frozen=1
			M<<"Você se sente um ligeiro aperto em suas mãos."
			sleep(50)
			src.Frozen=0
			if(get_dist(M,src)<=Distance)
				src.icon_state="handseal"
				src<<"Pressione Z para liberar o Fuuinjutsu, contanto que ele está sendo realizada eles serão incapazes de formar selos de mão."
				M<<"O chakra em torno de suas mãos estão te pertubando e selado, o que torna impossível para formar selos de mão!"
				while(M&&src.icon_state=="handseal")
					M.FuuinjutsuHandseal=1
					src.chakra-=pick(5,10)
					sleep(11)
				src<<"Você desfaz o fuinjutsu."
				M.FuuinjutsuHandseal=0
			else
				src<<"O alvo esta fora do alcance.";return
		else
			src<<"Ele esta longe demais para o seu chakra alcançá-lo!"
/////////////////////////////
//Fuuinjutsu: Chakra
////////////////
mob/proc/FuuinjutsuChakra()
	var/ChakraLoss=500//var/ChakraLoss=1000
	var/UsingLocation=0
	src.chakra-=ChakraLoss
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(prob(10))
		src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
	for(var/mob/M in get_step(src,src.dir))
		if(M.knockedout)
			src<<"Tentando usá-lo em uma pessoa nocautiada? patético.";src.health-=1000;return
		src<<"Você gera chakra em [M]! Espere 15 segundos para sela-lo!"
		src.Frozen=1
		M<<"Você sente como se seu chakra estive-se sendo drenado!"
		sleep(150)
		if(M in get_step(src,src.dir))
			src.Frozen=0
			src.icon_state="handseal"
			UsingLocation=src.loc
			src<<"Pressione Z para liberar o Fuuinjutsu, enquanto ele está sendo mantido seu chakra será constantemente selado."
			M<<"Seu sistema circulatório de chakra tem sido selado?"
			while(M&&src.icon_state=="handseal"&&UsingLocation==src.loc)
				if(M.chakra>0)
					M.chakra=0
				src.chakra-=10
				sleep(11)
			src<<"Você libera o Fuuinjutsu."
		else
			src<<"O alvo se Moveu.";return


mob/proc/FuuinjutsuControl()
//	mob/var/tmp/Time=0
	var/SettingUpLocation=0
	src.Handseals(35-src.HandsealSpeed)
	src.ChakraDrain(45000)
	if(src.HandsSlipped) return
	src.Frozen=1
	src.icon_state="handseal"
	SettingUpLocation=src.loc
	src<<"Não se mexa enquanto você prepara o fuuinjutsu"
	if(src.icon_state!="handseal"||src.knockedout||SettingUpLocation!=src.loc)
		src<<"Sua concentração foi quebrada, a preparação para o fuuinjutsu foi cacelada!"
		return
	spawn(100)
		if(prob(10))
			src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
		src.Frozen=0
		src.FuuinControl=1
		src<<"Suas mãos atualmente produzem um Fuuinjutsu! Perfure o adversário para colocá-lo sobre eles!"
		spawn(120)
			if(src.FuuinControl)
				src.FuuinControl=0
				src<<"O Fuuinjutsu perde o efeito."

mob/proc/FuuinjutsuHellSentRestoration()
//	mob/var/tmp/Time=0
	var/SettingUpLocation=0
	src.Handseals(35-src.HandsealSpeed)
	src.ChakraDrain(40000)
	if(src.HandsSlipped) return
	src.Frozen=1
	src.icon_state="handseal"
	SettingUpLocation=src.loc
	src<<"Não se mexa enquanto você prepara o fuuinjutsu"
	if(prob(15))
		src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
	if(src.icon_state!="handseal"||src.knockedout||SettingUpLocation!=src.loc)
		src<<"Sua concentração foi quebrada, a preparação para o fuuinjutsu foi cacelada!"
		return
	spawn(100)
		src.Frozen=0
		src.FuuinjutsuHellsent=1
		src<<"Suas mãos atualmente produzem um Fuuinjutsu! Perfure o adversário para colocá-lo sobre eles!"
		spawn(120)
			if(src.FuuinjutsuHellsent)
				src.FuuinjutsuHellsent=0
				src<<"O Fuuinjutsu perde o efeito."

mob/proc/FuuinjutsuFiveElementSeal()
	src.Handseals(45-src.HandsealSpeed)
	src.ChakraDrain(95000)
	if(src.HandsSlipped) return
	src.Frozen=1
	src.icon_state="handseal"
	src<<"Não se mexa enquanto você prepara o fuuinjutsu"
	if(prob(20))
		src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
	if(src.icon_state!="handseal"||src.knockedout)
		src<<"Sua concentração foi quebrada, a preparação para o fuuinjutsu foi cacelada!"
	spawn(150)
		src.Frozen=0
		src.FiveElementSeal=1
		src<<"Suas mãos atualmente produzem um Fuuinjutsu! Perfure o adversário para colocá-lo sobre eles!"
		spawn(400)
			if(src.FiveElementSeal)
				src.FiveElementSeal=0
				src<<"O Fuuinjutsu perde o efeito."
mob/var/tmp/CurseSealParalysis=0
mob/var/tmp/CursedSealParalysis=0
mob/var/tmp/LandedCurseSealParalysis=0
mob/var/tmp/FiveElementSealed=0
mob/var/tmp/RemovedUpperCloathing=0
mob/var/ReverseFourSymbolsPlaced=0
mob/proc/RemoveUpperCloathing()
	if(!src.ReverseFourSymbolsPlaced)
		src<<"Você não tem o Fuuinjutsu colocado em você por isso não há necessidade de remover a sua camisa!"
		for(var/obj/SkillCards/UpperCloathingRemoval/P in src.LearnedJutsus)
			del(P)
		return
	view()<<"[src] tira sua camisa na metade superior de seu corpo!"
	for(var/obj/Clothes/Y in src.contents)
		if(Y:bodyarea=="TorsoTop"||Y:bodyarea=="Torso")
			if(Y:worn==1)
				Y.Wear()
				src.RemovedUpperCloathing=1
	for(var/obj/SkillCards/UpperCloathingRemoval/C in src.LearnedJutsus)
		del(C)
obj/Jutsu/Fuuinjutsu/FourSymbolsConsume
	icon='Icons/Jutsus/FourSeal.dmi'
	icon_state="Consume"
	density=0
	layer=1
	New()
		..()
		spawn(1)
			var/mob/O = src.Owner
			while(src&&src.Owner)
				sleep(1)
				for(var/mob/M in src.loc)
					if(!M.knockedout&&M.client&&M!=O)
						M.health-=2500
						M.Death(M)
		spawn(300)
			del(src)
mob/proc/ReverseFourSymbolsTechnique()
	var/AttachTime=100
	var/Placing=0
	switch(input(usr,"Gostaria de definir o Fuuinjutsu em seu próprio corpo?", "Tecnica Inversa dos 4 Simbolos") in list ("Sim","Não"))
		if("Não")
			return
		if("Sim")
			if(src.ReverseFourSymbolsPlaced)
				src<<"O o Fuuinjutsu ja esta definido em seu corpo!";return
		//	src.Frozen=1
			for(var/obj/Clothes/Y in src.contents)
				if(Y:bodyarea=="TorsoTop"||Y:bodyarea=="Torso")
					if(Y:worn==1)
						Y.Wear()
			src<<"Você começa a colocar o Fuuinjutsu em seu corpo, espere, pois isso pode levar algum tempo."
			Placing=1
			while(Placing==1&&AttachTime>0)
				if(src.knockedout)
					src<<"Você foi eliminado, terminando a colocação do selo.";return
				AttachTime--
				sleep(2)
			src.LearnedJutsus += new/obj/SkillCards/UpperCloathingRemoval
			src<<"Você colocou o Fuuinjutsu em seu corpo. Antes de morrer remova sua camisa com o Remover Superior Camisa Jutsu e este Fuuinjutsu vai detonar após a sua morte!"
			src.ReverseFourSymbolsPlaced=1



mob/proc/CurseSealOfParalysis()
	var/SettingUpLocation=0
	src.Handseals(35-src.HandsealSpeed)
	src.ChakraDrain(75000)
	if(src.HandsSlipped) return
	src.Frozen=1
	src.icon_state="handseal"
	SettingUpLocation=src.loc
	src<<"Não se mexa enquanto você prepara o fuuinjutsu"
	if(src.icon_state!="handseal"||src.knockedout||SettingUpLocation!=src.loc)
		src<<"Sua concentração foi quebrada, a preparação para o fuuinjutsu foi cacelada!"
		return
	spawn(100)
		if(prob(35))
			src.FuuinjutsuKnowledge+=pick(0.1,0.5,0.6,1)
		src.Frozen=0
		src.CurseSealParalysis=1
		src<<"Suas mãos atualmente produzem um Fuuinjutsu perigoso usado uma vez por Shimura, Danzo! Perfure o adversário para colocá-lo sobre eles!"
		spawn(150)
			if(src.CurseSealParalysis==1)
				src.CurseSealParalysis=0
				src<<"O Fuuinjutsu perde o efeito."

mob/proc/CurseSealParalysis(mob/A)
	var/JuuinjutsuActivated=0
	var/JuuinjutsuActivated2=0
	var/JuuinjutsuTimer1=0
	var/JuuinjutsuTimer2=0
	src.CursedSealParalysis=0
	A.FrozenBind="Danzo Jutsu"
	A.icon_state="handseal"
	src<<"Seu corpo começa a desacelerar e perder os sentidos..."
	sleep(20)
	src<<"Você não pode se mover mais..."
	src.FrozenBind="Danzo Jutsu"
	sleep(20)
	src<<"Seu corpo esta completamente paralisado ... O que está acontecendo...!?"
	view()<<"<font size=1><font face=verdana><b><font color=red>[A]<font color=white> Fala: Este é o meu Juuinjutsu .... Selo Amaldiçoado de paralisia .... Deixe te consumir..</font>"
	sleep(30)
	JuuinjutsuActivated=1
	src<<"Lutar contra o Juuinjutsu! Segure Barra de espaço suficiente para liberar Chakra do seu corpo e se libertar do Juuinjutsu!"
	while(JuuinjutsuActivated==1&&JuuinjutsuTimer1<=40)
		if(A.knockedout)
			src.overlays-='Icons/Jutsus/DanzoFuuin.dmi';src.overlays-='Icons/Jutsus/DanzoFuuin2.dmi'
			src.FrozenBind=""
			return
		src.health-=3
		src.stamina-=pick(3,5)
		JuuinjutsuTimer1+=2
		sleep(5)
	src.overlays-='Icons/Jutsus/DanzoFuuin.dmi'
	src.overlays+='Icons/Jutsus/DanzoFuuin.dmi'
	view()<<"<font size=1><font face=verdana><b><font color=red>[A]<font color=white> Fala: Pare de lutar contra isso ... Você não pode sair dela ... É impossível...</font>"
	sleep(30)
	src.Struggle=0
	src<<"Continue a segurar a barra de espaço!"
	JuuinjutsuActivated2=1
	var/ChanceToEscape=100
	while(JuuinjutsuActivated2==1&&JuuinjutsuTimer2<=40)
		if((src.Struggle+(src.deathcount*50))>ChanceToEscape)
			src.chakra-=1000
			src<<"Você força chakra o suficiente para fora do seu corpo para escapar do Juuinjutsu!"
			A<<"[src] Conseguiu sair fora do seu Juuinjutsu!"
			src.overlays-='Icons/Jutsus/DanzoFuuin.dmi';
			src.overlays-='Icons/Jutsus/DanzoFuuin2.dmi'
			src.FrozenBind=""
			A.FrozenBind="";A.icon_state=""
			return
		if(A.knockedout)
			src<<"[A] foi nocauteando resultou na liberção do Juuinjutsu!"
			src.overlays-='Icons/Jutsus/DanzoFuuin.dmi';
			src.overlays-='Icons/Jutsus/DanzoFuuin2.dmi'
			src.FrozenBind=""
			return
		src.health-=3
		src.stamina-=pick(3,5)
		JuuinjutsuTimer2+=2
		sleep(5)
	view()<<"<font size=1><font face=verdana><b><font color=red>[A]<font color=white> Fala: Eu lhe disse que não havia esperança .... É inútil continuar lutando mais ... Você é fraco..</font>"
	sleep(17)
	src.overlays+='Icons/Jutsus/DanzoFuuin2.dmi'
	sleep(20)
	view()<<"<font size=1><font face=verdana><b><font color=red>[A]<font color=white> Fala: Agora.....Morra!</font>"
	sleep(10)
	src.Quake_Effect_Self(src,3,2)
	sleep(10)
	src.DamageProc(2000,"Health",A)
	src.overlays-='Icons/Jutsus/DanzoFuuin.dmi';
	src.overlays-='Icons/Jutsus/DanzoFuuin2.dmi'
	src.FrozenBind=""
	A.FrozenBind="";
	A.icon_state=""
	return

mob/var/tmp/CastingMindControl=0
mob/proc/MindControlStruggle(mob/M)
	if(usr.controlled)
		usr<<"Você esta controlando [usr.controlled] e cai em sono profundo.."
		usr.MindControlJutsu()
		return
	if(M.knockedout||M.Dead)
		src<<"Você ganha o controle de seu corpo com bastante facilidade."
		M.knockedout=0
		M.Dead=0
		src.MindControlJutsu(M)
		sleep(50)
		while(src.controlled==M)
			if(M.Struggle>src.chakra||src.chakra<10||src.knockedout)
				src.MindControlJutsu(M)
				src<<"Você perde o controle sobre [M]!"
				M<<"Sua mente esta livre agora!"
			src.chakra-=rand(75,150)
			sleep(50)
	else
		M<<"Você sente sua mente desaparecendo, segure rapidamente espaço para resistir!"
		src<<"Você começa empurar seu controle na mente de [M]'s, Segure espaço para ter mais controle!"
		M.Struggle=0;src.Struggle=0
		spawn(100)
			if(M.Bijuu!="")
				M.Struggle*=2
			if(M.Struggle>src.Struggle+30)
				M<<"Você resistiu o que estava fazendo com que a sua mente perde-se a consciência..."
				src<<"[M] resiste ao seu controle da mente.."
				M.Struggle=0;src.Struggle=0
				return
			else
				src<<"Sucesso, você agora controla a mente de [M]'s!"
				src.MindControlJutsu(M)
				sleep(50)
				while(src.controlled==M)
					if(M.Struggle>src.chakra||src.chakra<10||src.knockedout)
						src.MindControlJutsu(M)
						src<<"Você perde o controle sobre [M]!"
						M<<"Sua mente agora esta livre de controle!"
					src.chakra-=rand(75,150)
					sleep(50)



mob/proc/MindControlJutsu(mob/M)
	usr=src
	if(!usr.controlled&&M)
		usr.controlled=M
		usr.client.eye=M
		usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
		usr.KBunshinOn=1
		M.RestrictOwnMovement=1
		M.icon_state="running"
		var/X=0
		for(var/obj/SkillCards/O in M.LearnedJutsus)//Loop through all the items in the players contents
			winset(usr, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
			usr << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
		winset(usr,"Jutsu.Jutsus", "cells=[X]")
		usr<<"Alt+Clique em qualquer coisa para liberar o Jutsu Controlador de Mente!"
		usr.UpdateInv()//3/13/2013
	else
		var/mob/O=usr.controlled
		if(O)
			O.RestrictOwnMovement=0
			O<<"Sua mente foi libertado do controle externo!"
		usr.KBunshinOn=0
		usr.controlled=null
		usr.client.eye=usr
		usr.client.perspective=MOB_PERSPECTIVE
		usr.UpdateInv()







































	/*



	/*
	This unnamed Fuuinjutsu is used by Danzou. After touching the skin of his target with the palm of his hand, Danzou will secretly place a seal on their body. This seal can then be activated a short time later. When activated, the seal will expand to spead over the target's body and bind them in place. With them bound, Danzou can attack at leisure. The seal can be overcome with a powerful enough chakra like a manifestation of Susanoo.
	*/
////Fuinjutsu Knowledge: Increases as the user preforms sealing tehniques, allowing them to create a wide array of seals. 0/10 (Increases by .1 naturally)

Center:

1. Fuinjutsu Resistance: Lessen the duration of Fuinjutsu while blocking. 0/1 (Increased with sps)

2. Seal Removal (Jutsu): This technique is a counter seal which releases the previous fuinjutsu.

3. Limit Release Seal (Jutsu): Allows its users to place a seal on themselves granting a temporary boost in their overall chakra as well as stats depending on their seal strength and duration.

Left:

1. Fuinjutsu Duration: Increases the time in which the users sealing jutsu lasts. (0/3 Increases .01 each point allows 10 seconds on top of the static duration fuinjutsu already have.)

2. Seal Artisan: Doubles the duration of your seals 0/1 (Increased by sps.)

Right:

1. Fuinjutsu Strength: Enhances the effects of your Fuinjutsu sometimes doubling or tripling their power. 0/3 (Increased by sps)

2. Fuinjutsu Agility: Halves the time it takes to prepare a seal and allows the user to walk while preparing them. As a side effect the user takes 25% less time to seal bijuus. 0/1 (Increased by sps)

Possible additional seals:

Digestive Seal: Increases the targets overall calorie drain and rapidly induces hunger.

Synapse Seal: Causes the brain and nerve screw effects/has a short duration without passives.

Super Crazy Idea Spectacular:

Immature Dead Demon Consuming Seal: Requires all fuinjutsu passives maxed and a minimum of 20-25 starter points worth of control. This suicide seal has a single tile and use when activated with the same CD of tajuu kage bunshin. If you miss you've got to wait quite some time. When hit by said seal the sealer and the target are both frozen and the targets willpower is steadily drained while the sealers vitality is siphoned. When the sealer is either out of vitality or releases the jutsu both players are knocked out. The sealer is guaranteed to die while the opponent still has a chance to get up if their willpower is high enough to warrant a struggle.
			*/