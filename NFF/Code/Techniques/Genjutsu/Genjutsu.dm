mob/var/tmp/InGenjutsu=""
mob/var/tmp/CastingGenjutsu=0
mob/var/tmp/GenjutsuBy
mob/var/tmp/gencounter=0
mob/var/tmp/DamageS
mob/proc
	GenjutsuSight()
		if(prob((src.GenjutsuSight*10)+5))
			src<<"Use o genjutsu Kai agora!"
			return
obj/Genjutsu
	var/Owner
//Basic Genjutsu Guidelines
//Target-Based Genjutsu
/*Explanation of Proc:
 Genjutsu Name - The name of the genjutsu. Will be actually used so its case-space specific.
 Type - Type is the Genjutsu Type. Depending on the type will affect how the
genjutsu is casted. If it's a Target based one it'll require a target. But set that as
"Target". If it's a Area based one like Nemurihane where it releases a chakra field
set that as "Area".
 GenjutsuAffect - The affect of the Genjutsu. Whether it is a Frozen one or ect. Set it to:
"Frozen" or ect. Still working on.
 ChakraCost - The amoutn of initial chakra cost just to start it.
 GenjutsuCastTime - The amount of time it takes for the user to cast. Done like sleep,
meaning 100 = 10 seconds, 30 = 3 seconds.
 TimeUntilGenjutsuTakesPlace - The amount of time it takes for the genjutsu to affect
the user. Also primarily the time of when the genjutsu is done. Exact seconds here.
 ChakraDrain - Drain the user takes to keep up the Genjutsu. Area-based Genjutsu would
only take chakra to keep up the field of chakra around the user.
 StaminaDrain - Drain the opponent takes toward Stamina while in the Genjutsu.
*/
obj/Genjutsu/Feathers
	icon='Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state="Feathers"
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER+999
obj/Genjutsu/Gravity
	icon='Code/Techniques/shading.dmi'
	icon_state="strong"
	screen_loc="1,1 to 19,19"
obj/Genjutsu/OvanScreen
	icon='lava.dmi'
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER-2
obj/Genjutsu/OceanScreen
	icon='WaterGenjutsu.dmi'
	icon_state="water235"
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER+10
obj/Genjutsu/OceanScreen2
	icon='WaterGenjutsu.dmi'
	icon_state="water235"
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER-1;
obj/Genjutsu/AOEGenjutsu
	icon='Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state="AOE"
	invisibility=99
	var/TypeOfGenjutsu
	New()
		..()
		spawn()
			while(src)
				var/mob/O=src.Owner
				if(!O) del(src)
				for(var/mob/M in src.loc)
					if(M.knockedout||M==O||M.InGenjutsu!=""||M.Status=="Asleep")
						continue
					if(M.Clan=="Fuuma")
						if(prob(M.Awareness*5))
							M<<"Você livrou-se do Genjutsu."
							del(src)
					if(src.TypeOfGenjutsu=="Nemurihane")
						M.GenjutsuSight()
						var/X=(round(5-(O.ChakraRadiator/2)))
						if(X<2)
							X=2;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1.5)))
									M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [O] 's Genjutsu!"
									O<<"[M] cancelado seu Genjutsu!"
									if(prob(4))
										M.GenjutsuSight+=pick(0.04,0.05,0.06,0.08,0.10)
										if(M.GenjutsuSight>=10) M.GenjutsuSight=10
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"Você é incapaz de cancelar este genjutsu, é muito forte."
							X--
							sleep(11)
						M.CaughtInGenjutsu("Nemurihane")



					if(src.TypeOfGenjutsu=="Kasumi")
						M.GenjutsuSight()
						var/X=(round(5-(O.ChakraRadiator/2)))
						if(X<2)
							X=2;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1.5)))
									M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [O] 's Genjutsu!"
									O<<"[M] cancelado seu Genjutsu!"
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"Você é incapaz de cancelar este genjutsu, é muito forte."
							X--
							sleep(11)
						M.CaughtInGenjutsu("Kasumi")



					if(src.TypeOfGenjutsu=="Ovan")
						M.GenjutsuSight()
						var/X=(round(4-(O.ChakraRadiator/2)))
						if(X<3)
							X=3;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1.5)))
									M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [O] 's Genjutsu!"
									O<<"[M] Cancelado seu genjutsu"
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"Você é incapaz de cancelar este genjutsu, é muito forte."
							X--
							sleep(11)
						M.CaughtInGenjutsu("Ovan")


/*

					if(src.TypeOfGenjutsu=="Drowning")
						M.GenjutsuSight()
						var/X=5-(O.ChakraRadiator/2)
						if(X<3)
							X=3;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1)))
									M<<"You release the flow of chakra from your body then bring it back, canceling [O]'s Genjutsu!"
									O<<"[M] canceled your Genjutsu!"
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"You are unable to cancel this genjutsu, it's too strong."
							X--
							sleep(10)
						M.CaughtInGenjutsu("Drowning",O)
*/
					if(src.TypeOfGenjutsu=="Ocean")
						O<<"Você lançou uma torrente de massa de água na zona envolvente!"
						M.GenjutsuSight()
						var/X=(round(4-(O.ChakraRadiator/2)))
						if(X<3)
							X=3;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1.5)))
									M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [O] 's Genjutsu!"
									O<<"[M] cancelado seu Genjutsu!"
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"Você é incapaz de cancelar este genjutsu, é muito forte."
							X--
							sleep(11)
							M.CaughtInGenjutsu("Ocean",O)

					if(src.TypeOfGenjutsu=="BurizadoAOE")
						O<<"Você lançou Burizador na área circundante!"
						M.GenjutsuSight()
						var/X=(round(4-(O.ChakraRadiator/2)))
						if(X<2)
							X=2;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1.5)))
									M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [O] 's Genjutsu!"
									O<<"[M] cancelado seu Genjutsu!"
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"Você é incapaz de cancelar este genjutsu, é muito forte."
							X--
							sleep(11)
							M.CaughtInGenjutsu("BurizadoAOE",O)




					if(src.TypeOfGenjutsu=="KokuangyoAOE")
						O<<"Você lançou Kokuangyo na área circundante!"
						M.GenjutsuSight()
						var/X=3
						if(X<2)
							X=2;
						while(X)
							if(M.gencounter)
								if(M.GenjutsuKnowledge>(O.GenjutsuKnowledge/(M.GenjutsuSight+1.5)))
									M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [O] 's Genjutsu!"
									O<<"[M] canceled your Genjutsu!"
									for(var/obj/Genjutsu/AOEGenjutsu/A in oview(2,M))
										del(A)
								else
									M<<"Você é incapaz de cancelar esta genjutsu, é muito forte."
							X--
							sleep(11)
							M.CaughtInGenjutsu("KokuangyoAOE",O)



				sleep(11)//1 Second Sleep.
mob/proc/CaughtInGenjutsu(WhichGenjutsu,GenCaster)
	var/mob/Caster=GenCaster;
	if(WhichGenjutsu=="Nemurihane"&&src.client)
		src.InGenjutsu="Nemurihane"
		if(src.client)
			for(var/obj/Genjutsu/Feathers/R in src.client.screen)
				del(R)
		src.client.screen+=new/obj/Genjutsu/Feathers
		var/X=5
		while(X>0)
			if(src.InGenjutsu!="Nemurihane")
				X=0
			X--
			sleep(13) //was 11, doubt this will matter
		if(src.InGenjutsu=="Nemurihane")
			src.StatusEffected=rand(7,12)
			src.Status="Asleep"
			src.InGenjutsu=""
			for(var/obj/Genjutsu/Feathers/R in src.client.screen)
				del(R)
			for(var/obj/Genjutsu/Feathers/R in src.client.screen)
				del(R)
			for(var/obj/Genjutsu/Feathers/R in src.client.screen)
				del(R)
	if(WhichGenjutsu=="BurizadoAOE")
		src.InGenjutsu="BurizadoAOE"
		if(!src.client)
			return
		src.client.screen+=new/obj/Genjutsu/Blizzard
		while(Caster.icon_state=="handseal")
			src.Running=0
			var/Bdamage=Caster.gen*1.5
			if(Bdamage>150)
				Bdamage=150;
		//	if(src.Age<=10)
		//		return
		//	src.DamageProc(Bdamage,"Stamina",src)
			src.stamina-=Bdamage//Just took away his stamina so that way it completly avoids armor
			sleep(11)
		for(var/obj/Genjutsu/Blizzard/R in src.client.screen)
			del(R)
		src.InGenjutsu=""
	if(WhichGenjutsu=="Ocean")
		src.InGenjutsu="Ocean"
		src.client.screen+=new/obj/Genjutsu/OceanScreen
		while(Caster.icon_state=="handseal")
			src.Running=0
			var/Bdamage=Caster.gen*2.3
			if(Bdamage>500)
				Bdamage=500
		//	if(src.Age<=10)
		//		return
			src.stamina-=Bdamage
			sleep(11)
		for(var/obj/Genjutsu/OceanScreen/R in src.client.screen)
			del(R)
		src.InGenjutsu=""
	if(WhichGenjutsu=="KokuangyoAOE")
		src.InGenjutsu="KokuangyoAOE"
		while(Caster.icon_state=="handseal")
			src.sight |= BLIND
			var/Kdamage=Caster.gen*2
			if(Kdamage>100)
				Kdamage=100;
		//	if(src.Age<=10)
		//		return
			src.stamina-=Kdamage
			sleep(11)
		src.sight &= ~BLIND
		src.InGenjutsu=""
	if(WhichGenjutsu=="Ovan")
		src.InGenjutsu="Ovan"
		for(var/obj/Genjutsu/OvanScreen/R in src.client.screen)
			del(R)
		src.client.screen+=new/obj/Genjutsu/OvanScreen
		var/X=5
		while(X>0)
			if(src.InGenjutsu!="Ovan")
				X=0
				usr << output("<font color=red>Você sente o aumento da temperatura.</font>", "Attack")
				src.health-=50
				src.stamina-=DamageS
			X--
			sleep(11)
		if(src.InGenjutsu=="Ovan")
			src.StatusEffected=rand(10,13)
			src.Status="OvanGen"
			src.InGenjutsu=""
			for(var/obj/Genjutsu/OvanScreen/R in src.client.screen)
				del(R)
			for(var/obj/Genjutsu/OvanScreen/R in src.client.screen)
				del(R)
			for(var/obj/Genjutsu/OvanScreen/R in src.client.screen)
				del(R)
			src.GenjutsuEffect("OvanGen",0)
			/*
	if(WhichGenjutsu=="Drowning")
		src.InGenjutsu="Drowning"
		for(var/obj/Genjutsu/OceanScreen/R in src.client.screen)
			del(R)
		src.client.screen+=new/obj/Genjutsu/OceanScreen
		var/X=5
		while(X>0)
			if(src.InGenjutsu!="Drowning")
				X=0
				src <<"<font color=blue>You feel oxygen leaving your lungs.</font>"
				src.health-=35
				src.stamina-=DamageS/5
			X--
			sleep(11)
		if(src.InGenjutsu=="Drowning")
			src.StatusEffected=rand(12,15)
			src.Status="Drowning"
			for(var/obj/Genjutsu/OceanScreen/R in src.client.screen)
				del(R)
			for(var/obj/Genjutsu/OceanScreen/R in src.client.screen)
				del(R)
			for(var/obj/Genjutsu/OceanScreen/R in src.client.screen)
				del(R)
			src.InGenjutsu=""
			src.GenjutsuEffect("Drowning",DamageS)
			*/
	/*if(WhichGenjutsu=="Kasumi")
		src.InGenjutsu="Kasumi"
		var/ChakraLoss=100
		src.chakra-=ChakraLoss
		spawn(600)
			for(var/mob/npcs/Bunshin/A in world)
				if(A.original==src)
					del(A)
		if(prob(50))
			src<<"<b>[src] says: <font color = red>Kasumi Juusha No Jutsu!</font>"
		for(var/turf/T in oview(5))
			if(prob(30))
				var/mob/npcs/Bunshin/A=new();A.loc=T;A.original=src
				for(var/mob/npcs/Bunshin/Y in world)
					if(Y.Owner==src)
						Y.icon=src.icon;Y.overlays+=src.overlays
						Y.layer=MOB_LAYER+10;Y.health=1;Y.density=0
						Y.name=src.name;walk_rand(Y,3);sleep(1)
		sleep(600)
		for(var/mob/npcs/Bunshin/Y in world)
			if(Y.Owner==src)
				del(Y)*/

mob/proc/GenjutsuEffect(Effecttype,Drain)
	var/E=Effecttype
//	var/StaminaD=Drain
	/*
	if(E=="Drowning")
		src.Status="Drowning";
		src.client.screen+=new/obj/Genjutsu/OceanScreen2
		while(src.Status=="Drowning"&&src.StatusEffected>0)
			src.stamina-=StaminaD*2
			src.StatusEffected--;
			sleep(11)
		for(var/obj/Genjutsu/OceanScreen2/R in src.client.screen)
			del(R)
		for(var/obj/Genjutsu/OceanScreen2/R in src.client.screen)
			del(R)
		for(var/obj/Genjutsu/OceanScreen2/R in src.client.screen)
			del(R)
		src << "<font color=blue>The genjutsu ends and you feel your lugs refill with air..</font>"
		src.Status="";
		*/
	if(E=="OvanGen")
		src.Status="OvanGen";
		src.client.screen+=new/obj/Genjutsu/OvanScreen
		while(src.StatusEffected>0)
			src.health-=rand(20,35)
			src.StatusEffected--;
			sleep(11);
		for(var/obj/Genjutsu/OvanScreen/RS in src.client.screen)
			del(RS)
		for(var/obj/Genjutsu/OvanScreen/RS in src.client.screen)
			del(RS)
		for(var/obj/Genjutsu/OvanScreen/RS in src.client.screen)
			del(RS)
		src<<"Você está curado do fogo"


//(M.gen+(M.GenjutsuMastery*10)) = Blazing Burn Stamina Drain

mob/proc/GenjutsuProc(GenjutsuName,GenjutsuAffect,GenjutsuType="Target",ChakraCost=100,GenjutsuCastTime=30,TimeUntilGenjutsuTakesPlace,ChakraDrain,StaminaDrain,Kaiable=0)
	var/NameOfGenjutsu=GenjutsuName//Sets the name of the genjutsu, used for future references..
	var/ChakraLoss=ChakraCost//The amount of chakra used. Default is 100.
	DamageS=StaminaDrain;
	ChakraLoss-=src.GenSkill
	if(src.chakra<ChakraLoss)
		src<<"Você não tem chakra o suficiente para utilizar este genjutsu!"
		return
	src.chakra-=ChakraLoss
	src.Handseals(1-src.HandsealSpeed)//Just to make sure the delay stuff isn't a problem.
	if(src.HandsSlipped) return
	if(src.hyoushou==1) return;
	if(GenjutsuType=="Area")
		var/G=3+round(src.GenjutsuKnowledge/75)//How far it goes off
		if(G>15&&src.Overthought)
			G=15
		else if(G>10&&!src.Overthought)
			G=10
		for(var/turf/T in oview(G,src))
			var/obj/Genjutsu/AOEGenjutsu/A=new();A.Owner=src
			A.TypeOfGenjutsu=GenjutsuName//This is important when making AOE Genjutsu
			A.loc=T
		src.CastingGenjutsu=1
		src.icon_state="handseal"
		src<<"Você libera o seu chakra em torno da área do campo. Contanto que você mantenha este handseal up, seu chakra será colocado em torno de uma determinada área afetando outros. Para parar de usá-lo, pressione Z."
		while(src.icon_state=="handseal"&&src.CastingGenjutsu)
			src.chakra-=ChakraCost
			sleep(11)
		for(var/obj/Genjutsu/AOEGenjutsu/A in world)
			if(A.Owner==src)
				del(A)
	if(GenjutsuType=="Target")
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		var/G=round(src.GenjutsuKnowledge/100)//Quickly checked the Distance to see if they can get hit.
		if(get_dist(src,M)>(2+G))
			src<<"[M] esta muito longe para perturbar o seu chakra!"
			return
		if(M.knockedout)
			M<<"Eles estão nocauteado, não há necessidade de lançar um genjutsu sobre eles.";return
		if(M.ImmuneToDeath)
			M<<"Essa pessoa tem apenas alguns tempos recentemente acordado de ser inconsciente fazer o seu sentido de chakra fraco, é impossível colocá-lo sob um genjutsu neste momento"
			return
		if(M.InGenjutsu!="")//This makes it realize that their Chakra is already disturbed
//By another Genjutsu.
			src<<"Parece seu sistema de chakra já está perturbado!"
			src.CastingGenjutsu=0
			src.icon_state=""
		else
			M.GenjutsuSight()
			var/X=TimeUntilGenjutsuTakesPlace//TimeUntilTheGenjutsuTakesPlace
			var/B=src.GenjutsuKnowledge*0.075//GenKnowledge effects delay speed.
			X-=B
			if(src.shari)
				if(src.SharinganMastery>100)
					X=X*0.5
			if(X<1)
				X=1//Can never be lower than 1 second.
			if(X==1&&(GenjutsuName=="Vortex"||GenjutsuName=="KunaiProjectile"))
				X=2//Vortex Genjutsu and Fear Of Projectiles can never be lower than 2 seconds!
			src.CastingGenjutsu=1
			src.icon_state="handseal"
			src<<"Você tem [X] segundos antes do Genjutsu ser ativado!"
			while(X>0&&src.CastingGenjutsu)
				//Can any other effects from this too.
				src.icon_state="handseal"
				if(M.gencounter)
					if(M.GenjutsuKnowledge>(src.GenjutsuKnowledge/(M.GenjutsuSight+1)))
						M<<"Você libera o fluxo de chakra de seu corpo, em seguida, trazê-lo de volta, cancelando [src] 's Genjutsu!"
						src<<"[M] cancelou seu Genjutsu!"
						src.icon_state=""
						src.CastingGenjutsu=0
					else
						M<<"Você é incapaz de cancelar este genjutsu, a sua forte demais."
				sleep(11)
				X--
			if(src.CastingGenjutsu)
				src<<"O genjutsu foi um sucesso!"
				if(M.Clan=="Fuuma")
					if(prob(M.Awareness*5+1))
						M<<"Você livrou-se do Genjutsu!"
						src<<"Eles não sentem os efeitos de seu Genjutsu!"
						return
				M.InGenjutsu=NameOfGenjutsu
				M.GenjutsuBy="[src]"

//Frozen Type Genjutsu: Both you and your Opponent are frozen while holding this Genjutsu.
//Can add any visuals to it.
//Frozen One Example:
		if(GenjutsuAffect=="Frozen")
			while(M.InGenjutsu==NameOfGenjutsu)
				src.CastingGenjutsu=1
				src.icon_state="handseal"
	//As a side note, for surplus Genjutsu Added you'd have to add that to the movement
//	system or w/e techs whether or not it freezes or if you can guard.
				src.chakra-=ChakraDrain
				//Drain to keep it up. The user can just close the
				//Genjutsu anytime they like with Z.
			//	if(M.Age<=10)
			//		return
				M.stamina-=StaminaDrain
				//And of course the mental stability it causes.
				if(M.knockedout)
					src.GenjutsuCanceling()
				sleep(11)
	//Make sure it's a high sleep amount. Don't want to cause lag from one gen.

//Affect Genjutsu
//This is mainly visuals and stuff it says. Because of this the user won't really be
//frozen from it. This is Genjutsu like Hunger/Thirst.
//You'd have to literally add the affect in the coding of it and such.
		if(GenjutsuAffect=="Affect")
		/*
			if(GenjutsuName=="HekiKonchuu Ishuu")
				for(var/turf/T in orange(10,M))
					if(prob(50))
						var/obj/Genjutsu/FakeSwarm/F=new();F.loc=T;F.Person=M;var/I=image('Swarm.dmi',F);M<<I;F.Owner=src
*/
			while(src&&M.InGenjutsu==NameOfGenjutsu&&M.client)
				src.CastingGenjutsu=1
				src.icon_state="handseal"
				if(M.GenjutsuCounterMode&&(M.GenjutsuKnowledge-src.GenjutsuKnowledge)>=20)
					src.InGenjutsu=NameOfGenjutsu
					src.GenjutsuBy="[src]"
					while(src.InGenjutsu==NameOfGenjutsu)
						if(src.InGenjutsu=="Kiga")
							if(prob(50))
								src<<"Você está se sentindo um pouco com fome!"
						if(src.InGenjutsu=="Nodono Kawaki")
							if(prob(50))
								src<<"Você está se sentindo um pouco com sede!"
						if(src.InGenjutsu=="Gyaku Bijon")
							var/randz=rand(1,4)
							if(randz==1)
								src.client:dir=NORTH
							if(randz==2)
								src.client:dir=SOUTH
							if(randz==3)
								src.client:dir=WEST
							if(randz==4)
								src.client:dir=EAST
						if(src.InGenjutsu=="Burizado")
							for(var/obj/Genjutsu/Blizzard/R in src.client.screen)
								del(R)
							src.client.screen+=new/obj/Genjutsu/Blizzard
							src.Running=0
						if(src.InGenjutsu=="Vortex")
							for(var/obj/Vortex/B in src.client.screen)
								del(B)
							src.client.screen+=new/obj/Vortex
						if(src.InGenjutsu=="Gravity")
							for(var/obj/Genjutsu/Gravity/R in src.client.screen)
								del(R)
							src.client.screen+=new/obj/Genjutsu/Gravity
							var/stamdamage=StaminaDrain*((src.MentalDamage+4)/3)
					//		if(src.Age<=10)
					//			return
							src.stamina-=stamdamage
							src.Running=0
							src.stamina-=stamdamage
							if(prob(10))
								src<<"Você sente seu corpo enfraquecer enquanto você cai de um joelho ..."
								src.stamina-=rand(300,500)
								src.deathcount+=0.15
								src.FrozenBind="Gravity"
								spawn(5)
									if(src.FrozenBind=="Gravity")
										src<<"You get back up."
										src.FrozenBind=""
							src.deathcount+=0.05
						if(src.InGenjutsu=="Kokuangyo")
							src.sight |= (SEE_SELF|BLIND)
							if(src.target&&src.Focus<400)
								src.target=null
						if(src.InGenjutsu=="Blazing Burn")
							for(var/image/c in src.client.images)
								if(c.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
									del(c)
							var/image/A=image('Icons/Jutsus/GenjutsuTechniques.dmi',src);A.icon_state="Fire"
							for(var/mob/X in viewers(8,src))
								if(prob(50))
									X<<"<font face=trebuchet MS><b><font color=red>[M]<font color=white> Says: Ahhh it burns!!!</font></b>"
							step_rand(src)
						var/stamdamage=StaminaDrain*((src.MentalDamage+4)/3)
						if(stamdamage>1000)
							stamdamage=1000
						src<<output("[M] esta tomando!([stamdamage]) de dano do genjutsu","Attack")
					//	if(src.Age<=10)
					//		return
						src.stamina-=stamdamage
						if(prob(2))
							src.Mentality+=pick(0.01,0.05,0.1);if(src.Mentality>=5)	src.Mentality=5;
						if(M.knockedout||src.knockedout)
							src.GenjutsuCanceling()
						sleep(11)
				else
					if(Kaiable)
						if(M.gencounter)
							if(M.GenjutsuKnowledge>(src.GenjutsuKnowledge/(M.GenjutsuSight+1)))
								M<<"Você libera o Genjutsu!"
								M.GenjutsuBy=""
								if(M.GenjutsuBy=="[src]")
									src<<"Você libera a técnica Genjutsu fora de [M]!"
								if(M.InGenjutsu=="Gyaku Bijon")
									M.client:dir=NORTH
								if(M.InGenjutsu=="Burizado")
									for(var/obj/Genjutsu/Blizzard/R in M.client.screen)
										del(R)
								if(M.InGenjutsu=="Vortex")
									for(var/obj/Vortex/B in M.client.screen)
										del(B)
								if(M.InGenjutsu=="Gravity")
									for(var/obj/Genjutsu/Gravity/R in M.client.screen)
										del(R)
								if(M.InGenjutsu=="Kokuangyo")
									if(!M.knockedout)
										M.sight &= ~(SEE_SELF|BLIND)
								if(M.InGenjutsu=="Blazing Burn")
									for(var/image/c in M.client.images)
										if(c.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
											del(c)
								M.InGenjutsu=""
							else
								M<<"Você é incapaz de liberar este genjutsu, é muito forte para você."
					if(M.InGenjutsu=="Kiga")
						if(prob(25))
							M<<"Você está se sentindo um pouco com fome!"
					if(M.InGenjutsu=="Nodono Kawaki")
						if(prob(25))
							M<<"Você está se sentindo um pouco com sede!"
					if(M.InGenjutsu=="Gyaku Bijon")
						var/randz=rand(1,4)
						if(randz==1)
							M.client:dir=NORTH
						if(randz==2)
							M.client:dir=SOUTH
						if(randz==3)
							M.client:dir=WEST
						if(randz==4)
							M.client:dir=EAST
					if(M.InGenjutsu=="Burizado")
						for(var/obj/Genjutsu/Blizzard/R in M.client.screen)
							del(R)
						M.client.screen+=new/obj/Genjutsu/Blizzard
						M.Running=0
					if(M.InGenjutsu=="Gravity")
						for(var/obj/Genjutsu/Gravity/R in M.client.screen)
							del(R)
						M.client.screen+=new/obj/Genjutsu/Gravity
						M.Running=0
						M.deathcount+=0.05
					if(M.InGenjutsu=="Vortex")
						for(var/obj/Vortex/B in M.client.screen)
							del(B)
						M.client.screen+=new/obj/Vortex
					if(M.InGenjutsu=="Kokuangyo")
						M.sight |= (SEE_SELF|BLIND)
						if(M.target&&M.Focus<400)
							M.target=null
					if(M.InGenjutsu=="HekiKonchuu Ishuu")
						if(prob(20))
							M<<"Sua carne está sendo devorado pelo konchuu!"
					if(M.InGenjutsu=="Blazing Burn")
						for(var/image/c in M.client.images)
							if(c.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
								del(c)
						var/image/A=image('Icons/Jutsus/GenjutsuTechniques.dmi',M);A.icon_state="Fire"
						M<<A
						for(var/mob/X in viewers(8,M))
							if(prob(50))
								X<<"<font face=trebuchet MS><b><font color=red>[M]<font color=white> Says: Ahhh ele queima !!!</font></b>"
						step_rand(M)
			//		if(M.Age<=10)
			//			return
					M.stamina-=(StaminaDrain)*((src.MentalDamage*(0.15))+1)
					if(M.InGenjutsu=="Vortex")
						M.chakra-=(((StaminaDrain*((src.MentalDamage*(0.15)+1))/4)))
					if(prob(2))
						M.Mentality+=pick(0.01,0.05,0.1);if(M.Mentality>=5) M.Mentality=5;
					if(M.knockedout)
						src.GenjutsuCanceling()
				//And of course the mental stability it causes.
				sleep(10)
///////////////////////////////////////////////////////////////////////////////////////////////
//D Rank Ninjutsu
/////////////////////////////////////////////////////////////////////
/////HekiKonchuu Ishuu
obj/var/tmp/Person
obj/Genjutsu/FakeSwarm
	icon='Icons/Jutsus/Swarm.dmi'

//	density=1
/*	if(src.TypeOfGenjutsu=="Kasumi")
		var/ChakraLoss=100
		src.chakra-=ChakraLoss
		spawn(600)
			for(var/mob/npcs/Bunshin/A in world)
				if(A.original==src)
					del(A)
		if(prob(50))
			src<<"<b>[src] says: <font color = red>Kasumi Juusha No Jutsu!</font>"
		for(var/turf/T in oview(5))
			if(prob(30))
				var/mob/npcs/Bunshin/A=new();A.loc=T;A.original=src
				for(var/mob/npcs/Bunshin/Y in world)
					if(Y.original==src)
						Y.icon=src.icon;Y.overlays+=src.overlays
						Y.layer=MOB_LAYER+10;Y.health=1;Y.density=0
						Y.name=src.name;walk_rand(Y,3);sleep(1)
		sleep(600)
		for(var/mob/npcs/Bunshin/Y in world)
			if(Y.original==src)
				del(Y)*/
///////////////////////////////////////////////////////
//Nemuri
//////////////////////////


obj/Genjutsu/Blizzard
	icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state="Blizzard"
	layer = MOB_LAYER+1
	screen_loc="1,1 to 19,19"
	mouse_opacity=0

///////////////////////////////////////////////////////////////////////////////////////////////
//B Rank Ninjutsu
/////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////
//A Rank Ninjutsu
/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//Kokuangyo
//////////////////////////
obj/black
	icon = 'BLANK BLACK.dmi'
	screen_loc = "1,1 to 13,13"
	layer = MOB_LAYER+999
obj/black2
	icon = 'BLANK BLACK.dmi'
	screen_loc = "1,1 to 6,13"
	layer = MOB_LAYER+999
///////////////////////////////////////////////////////////////////////////////////////////////
//S Rank Ninjutsu
/////////////////////////////////////////////////////////////////////



obj/GazeIcon
	icon='Icons/Jutsus/GenjutsuIcon.dmi'
	icon_state = "EyesofFear"
obj/Gaze
	icon='Icons/Jutsus/GenjutsuIcon.dmi'
	icon_state = "gaze"
	var/MoveCount=10;//how far it travels.
	New()
		..()
		spawn(600)//So just incase the user bugs, after a minute it will delete
			del(src)
	Move()
		..()
		if(src.MoveCount<0)
			del(src);
		src.MoveCount--;
	Bump(A)
		..()
		if(ismob(A))
			var/mob/M = A
			if(M.Kaiten||M.sphere)
				return
			if(src.dir==turn(M.dir,180))
				M.Fear();
			del(src)
		if(istype(A,/obj/))
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
obj/Vortex
	icon='GenjutsuIcon.dmi'
	icon_state = "vortex"
	layer = MOB_LAYER+3
	screen_loc="CENTER,CENTER"
	var/User;
	New()
		..()
		spawn(600)//So just incase the user bugs, after a minute it will delete
			del(src)
mob/proc/Fear()
	src.nin*=0.25;
	src.tai*=0.25;
	src<<"Seus joelhos começam a tremer como o medo te consome .."
	src.Running=0;
	sleep(200)
	src.nin=src.NinSkill*3;
	src.tai=src.TaiSkill*3;
//Gaze of Fear
mob/proc/GyoushinoKigi()
	src.ChakraDrain(25000)
	var/obj/GazeIcon/I=new();
	I.loc=locate(src.x,src.y+1,src.z)
	spawn(20)
		del(I)
	var/obj/Gaze/G=new();
	G.loc=src.loc;
	G.dir=src.dir
	//var/i=10;
//	walk(G,G.dir);
	walk(G,src.dir);

//DrainingVortex
mob/proc/Kadou()
	src.ChakraDrain(15000)
	src.Target()
	if(src.ntarget)
		return
	var/mob/M=src.target
//	if(FrozenBind=="Vortex") return;//Prevents many people from stacking it.
//	M.FrozenBind="Vortex"
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	M<<"Um estranho vórtice começa a se formar .."
	if(M.GenjutsuKnowledge>src.GenjutsuKnowledge)
		M<<"Você libera o Genjutsu.!";src.Frozen=0;M.FrozenBind="";return
	var/TimeTillCast=max((11-(src.GenjutsuKnowledge/100))*10,2)//Min of 2 seconds always
	while(TimeTillCast>0)
		if(M.gencounter)
			if(M.GenjutsuKnowledge>(src.GenjutsuKnowledge/(M.GenjutsuSight+1)))
				M<<"Você libera o Genjutsu!"
				M.FrozenBind=""
				src.Frozen=0
				return;
		TimeTillCast--;
		sleep(10)//one second delay
	if(src.icon_state!="handseal")
		src.Frozen=0
		M.FrozenBind=""
		return;
	var/obj/Vortex/V = new();V.User=src;
	M.client.screen += V;
	while(src.icon_state=="handseal")
//		M.Frozen=1;
		src.Frozen=1;
		var/ChakraDrain=src.gen*3
		var/Damage=(src.gen*((src.MentalDamage/2)+1))
	//	if(M.Age<=10)
	//		return
		M.stamina-=Damage
		src.chakra-=ChakraDrain
		M.ChakraPool-=ChakraDrain*1.5
		sleep(17);
	src.Frozen=0;M.Frozen=0;M.FrozenBind="";M.FrozenBind="";



obj/illusionKunai
	icon='Icons/New Base/Weapons/Kunai.dmi'
	icon_state="Throwz"
	screen_loc="CENTER-6,CENTER-6"
	var/Owner;
	New()
		..()
		spawn(600)//So just incase the user bugs, after a minute it will delete
			del(src)
	Bump(A)
		..()
		if(ismob(A))
	//		var/mob/M = A
	//		var/mob/O = src.Owner;
	//		if(M.Kaiten||M.sphere)
	//			return
	//		M<<"You been hit by Kunai for 90 damage";
	//		M.DamageProc(90,"Health",O);
			del(src)
		if(istype(A,/obj/))
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)

mob/proc/FireIllusionKunai(Target)
	var/mob/M = Target
	var/obj/illusionKunai/K = new(); K.Owner=src;
//	var/obj/illusionKunai/C = new() C.Owner=src;
	var/distance=8;
	var/X=round(rand(1,8));
	if(X==1) K.dir=SOUTH;
	if(X==2) K.dir=EAST;
	if(X==3) K.dir=NORTH;
	if(X==4) K.dir=WEST;

	if(X==5) K.dir=NORTHEAST;
	if(X==6) K.dir=SOUTHEAST;
	if(X==7) K.dir=SOUTHWEST;
	if(X==8) K.dir=NORTHWEST;
	M.client.screen += K;
	while(distance>0)
		if(X==1) K.screen_loc="CENTER,CENTER+[distance]";
		if(X==2) K.screen_loc="CENTER-[distance],CENTER";
		if(X==3) K.screen_loc="CENTER,CENTER-[distance]";
		if(X==4) K.screen_loc="CENTER+[distance],CENTER";
		if(X==5) K.screen_loc="CENTER-[distance],CENTER-[distance]";
		if(X==6) K.screen_loc="CENTER-[distance],CENTER+[distance]";
		if(X==7) K.screen_loc="CENTER+[distance],CENTER+[distance]";
		if(X==8) K.screen_loc="CENTER+[distance],CENTER-[distance]";
		distance--;
		sleep(3);
	var/damage=src.gen*rand(1.2,1.4)
//	if(src.key=="CobraT1337")
//		damage+=75
//	if(M.Age<=10)
//		return
	M<<"Você foi atingido por Kunai para [damage] danos";
//	M.DamageProc(damage,"Health",src);
	M.health-=damage
	del(K);

mob/proc/FearofProjectiles()
	src.ChakraDrain(15000)

	src.Target()
	if(src.ntarget)
		return
	var/mob/M=src.target
	M.GenjutsuSight()
	src.icon_state="handseal"

	var/TimeTillCast=max((11-(src.GenjutsuKnowledge/100))*10,2)//Min of 2 seconds always
	while(TimeTillCast>0)
		if(M.gencounter)
			if(M.GenjutsuKnowledge>(src.GenjutsuKnowledge/(M.GenjutsuSight+1)))
				M<<"Você libera o Genjutsu!"
				return;
		TimeTillCast--;
		sleep(10)//one second delay

	if(src.icon_state!="handseal") return;
//	M<<"Welcome to a world were kunai will rain upon you...."
	while(src.icon_state=="handseal")
		src.ChakraDrain(4000)//Given somewhat big train because freezes the oppenet.
	//	M.FrozenBind="FearofProjectiles";//M.Frozen=1;
		src.Frozen=1;
		src.FireIllusionKunai(M);
		sleep(3);
//	src.Frozen=1;
	src.Frozen=0;