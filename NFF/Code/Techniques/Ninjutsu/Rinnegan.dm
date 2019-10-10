mob/var/tmp/RinneganOn=0
mob/proc
	Rinnegan_Activate()
		if(src.RinneganOn)
			src.RinneganOn=0
			src<<"Você desativa o Rinnengan."
			var/list/Techniques=list("ShinraTensei","BashoTenin","SoulRip","RinneganSummon","AsuraRealm","AsuraRocket","AsuraPunch","NarakaSoulRip","NarakaRestoration")
			while(Techniques.len>0)
				var/Choice=pick(Techniques)
				Techniques.Remove(Choice)
				var/Path=text2path("/obj/SkillCards/[Choice]")
				var/obj/SkillCards/S = locate(Path) in src.LearnedJutsus
				if(!S)
					continue
				else
					S.NonKeepable=1
					src.LearnedJutsus-=S
			var/X=0
			for(var/obj/SkillCards/O in src.LearnedJutsus)//Loop through all the items in the players contents
				winset(src, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
				src << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
			winset(src,"Jutsu.Jutsus", "cells=[X]")
		else
			src.RinneganOn=1
			view(9,src)<<" Os olhos de [src] começam a se transformar em um roxo e prateado bonito e começar a ondular para o exterior.."
			var/obj/I=new()
			I.icon='Rinnegan.dmi'
			I.icon_state="Rinnegan"
			I.pixel_y=16
			src.overlays+=I
			spawn(12)
				src.overlays-=I
				del(I)
			var/list/Techniques=list("ShinraTensei","BashoTenin","SoulRip","RinneganSummon","AsuraRealm","NarakaSoulRip","NarakaRestoration")
			while(Techniques.len>0)
				var/Choice=pick(Techniques)
				Techniques.Remove(Choice)
				var/Path=text2path("/obj/SkillCards/[Choice]")
				var/obj/SkillCards/S = new Path
				S.NonKeepable=1
				src.LearnedJutsus+=S
			var/X=0
			for(var/obj/SkillCards/O in src.LearnedJutsus)//Loop through all the items in the players contents
				winset(src, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
				src << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
			winset(src,"Jutsu.Jutsus", "cells=[X]")
			src.nin=src.Mnin*1.4
			src.gen=src.Mgen*1.4
			while(src.RinneganOn)
				src.chakra-=rand(20,40)
				sleep(15)
			src.nin=src.Mnin
			src.gen=src.Mgen
			/*
			//Deva
			var/obj/SkillCards/ShinraTensei/S=new()
			S.NonKeepable=1
			src.LearnedJutsus+=S
			var/obj/SkillCards/BashoTenin/B=new()
			B.NonKeepable=1
			src.LearnedJutsus+=B
			//Human
			var/obj/SkillCards/SoulRip/SR=new()
			SR.NonKeepable=1
			src.LearnedJutsus+=SR
			//Animal
			var/obj/SkillCards/RinneganSummon/RS=new()
			RS.NonKeepable=1
			src.LearnedJutsus+=RS*/
	ShinraTensei()
		src.chakra-=100
		spawn()
			for(var/obj/Jutsu/J in oview(6,src))
				spawn()
					walk(J,get_dir(src,J))
					sleep(40)
					walk(J,0)
		for(var/mob/M in oview(6,src))
			spawn()
				M.Strafe()
				M.HitBack(10,get_dir(src,M))
				M.Normal()
	BashoTenin()
		src.chakra-=(src.chakra*0.01)
		var/turf/T = src.loc
		spawn()
			for(var/obj/Jutsu/J in oview(6,src))
				walk_towards(J,T)
				sleep(40)
				walk(J,0)
		for(var/mob/M in oview(6,src))
			spawn()
				M.Strafe()
				walk_towards(M,T,0)
				sleep(40)
				M.Normal()
				walk(M,0)

	SoulRemove()
		if(src.knockedout)
			return
		else
			src.chakra-=2500
			for(var/mob/M in get_step(src,src.dir))
				src<<"Você começa a arrancar a Alma de[M] . Espere 15 segundos!"
				src.Frozen=1
				M<<"You feel something terribly wrong! Move now!"
				sleep(150)
				src.Frozen=0
				if(M in get_step(src,src.dir))
					src<<"Você puxa a alma de [M]!"
					M<<"Você sente sua alma sendo puxada de seu corpo!"
					M.health=0
					M.knockedout=1
					M.icon_state="dead"
					M.DeathStruggle(src,1)
					src<<"A vitalidade de [M] e [M.maxhealth]"
					src<<"A stamina de  [M] e [M.maxstamina]"
					src<<"O chakra de [M] e [M.Mchakra]"
					src<<"A vila de [M] e [M.Village]"
					src<<"A idade de [M] e [M.Age]"
					src<<"A Decline de [M] e [M.DeclineAge]"
					src<<"O rank de [M] e [M.rank]"
					src<<"O clan de [M] e  [M.Clan]"
					src<<"[M] tem [M.LearnedJutsus.len] Jutsu."
					var/input=input(src,"Gostaria de uma leitura de todo os seus jutsu?") in list("Sim","Não")
					if(input=="Sim")
						for(var/obj/SkillCards/A in M.LearnedJutsus)
							src<<"Ele tem <b>[A]</b> with <b>[A.Uses]</b>."
							sleep(1)
					return
				else
					src<<"Me parece que o target se moveu."
					return

	RinneganSummon(mob/M)
		if(global.contestantTwo == src||global.contestantOne == src)
			src<<"Arena é destinado a um em um, não dois em um."
			world<<"[src] Tentou Sumonar [M] enquanto ele estava na arena, sendo assim ele perde automaticamente a luta!"
			del(src)
			del(M)
		if(!M)
			return
		if(!M.client)
			var/obj/O=new()
			src.chakra-=500
			O.icon='Icons/Jutsus/NarutoStuff.dmi'
			O.loc=get_step(src,src.dir)
			flick("Smoke",O)
			sleep(3)
			M.loc=O.loc
			sleep(3)
			O.loc=null
		else
			src<<"You attempt to summon [M]."
			src.chakra=0
			src.Mchakra-=50
			src.deathcount+=5
			M<<"[src] Está tentando lhe sumonar. Para aceitar, clique no ícone no canto inferior esquerdo da sua tela."
			M<<"Se você não aceitar dentro de 15 segundos a opção expira."
			var/obj/SummonRequest/A=new /obj/SummonRequest
			A.Requester=src;A.Requestee=M
			M.client.screen+=A
	NarakaRestoration()
		if(src.firing||src.knockedout)
			return
		if(src.target)
			src.dir=get_dir(src,src.target)
		flick("throw",src)
		src.chakra-=400
		for(var/mob/M in get_step(src,src.dir))
			M<<"[src] Usa o Rinnengan para restaura seu corpo."
			src<<"Você começa a curar [M]"

			if(M.StruggleAgainstDeath>0)

				M.Struggle+=rand(80,100)

			if(M.health<M.maxhealth)
				M.health+=rand(300,500)
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
				orange(12,M)<<"<font size = 2>[M] foi trazida de volta da beira da morte!</font>"
			if(M.stamina<M.maxstamina)
				M.stamina+=rand(600,800)
				if(M.stamina>M.maxstamina)
					M.stamina=M.maxstamina
			M.chakra+=rand(100,200)
			M.ChakraPool+=rand(300,600)
			if(M.screwed)
				if(prob(src.Focus*rand(-5,5)))
					M.screwed=0;M<<"Seus nervos estão curados.";src<<"Você curou os nervos dele."
			if(M.CBleeding)
				if(prob(usr.Focus*rand(-5,5)))
					M.CBleeding=0;M<<"Você não está mais sangrando.";src<<"Você curou os sangrametos interno dele."
	NarakaSoulRemove()
		if(src.knockedout)
			return
		else
			src.chakra-=1000
			for(var/mob/M in get_step(src,src.dir))
				src<<"Você começa a puxar a alma de [M]. Você tem 15 segundos, toque rapidamente na barra de espaço para rasgar a sua alma para fora!"
				src.FrozenBind="Rinnegan"
				M.FrozenBind="Rinnegan"
				src.Struggle=0
				M.Struggle=0
				M<<"Sua alma está sendo rasgado fora! Luta rápida para mantê-lo dentro de você! Toque na barra de espaço rapidamente!"
				var/i=15
				while(i>0&&!src.knockedout&&M in get_step(src,src.dir))
					i--
					sleep(10)
				if(src.knockedout)
					src<<"O jutsu falhou porque você perdeu a consciência!"
					src.FrozenBind="";M.FrozenBind=""
					return
				src.FrozenBind=""
				M.FrozenBind=""
				if(M in get_step(src,src.dir))
					if(src.Struggle+50>M.Struggle)
						src<<"Você puxa a Alma de [M]!"
						M<<"Sua alma foi arrancada de você! Seu corpo começa a ficar mole e morre.."
						M.health=0
						M.knockedout=1
						M.icon_state="dead"
						M.DeathStruggle(src,1)
						return
					else
						src<<"[M] conseguiu lutar o suficiente para manter sua alma dentro dele. A tecninca falhou."
						M<<"Você puxa sua alma completamente para trás dentro de si e se libertar da tecninca de [src]!"
				else
					src<<"Me parece que o target se moveu."
					return



	EdoTensei()
		if(!usr.controlled)
			var/list/people=list()
			for(var/mob/P in oview(8))
				if(findtext(P.name,"'s corpse")&&P.FrozenBind=="Dead")
					people += P
			var/who = input("Qual corpo você gostaria de entrar?") in people+"Cancel"
			if(who=="Cancel") return
			var/mob/M = who
			M.FrozenBind="";M.knockedout=0;M.Dead=0
			usr.controlled=M
			usr.client.eye=M
			usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			usr.KBunshinOn=1
			M.RestrictOwnMovement=1
			if(!M.client)
				M.icon_state="running"
			var/X=0
			for(var/obj/SkillCards/O in M.LearnedJutsus)//Loop through all the items in the players contents
				winset(usr, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
				usr << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
				winset(usr,"Jutsu.Jutsus", "cells=[X]")
		else
			var/mob/O=usr.controlled
			if(O)
				O.RestrictOwnMovement=0
			usr.KBunshinOn=0
			usr.controlled=null
			usr.client.eye=usr
			usr.client.perspective=MOB_PERSPECTIVE
			usr.UpdateInv()



	EdoGetStats(mob/M) //proc corpses call to get the original's vars...
		for(var/V in src.vars)
			var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath","Owner","KBunshinOn")
			if(!BAD.Find(V))
				src.vars[V] = M.vars[V]
obj
	SummonRequest
		icon='Something.dmi'
		screen_loc="1,1"
		var
			Requester
			Requestee
		New()
			..()
			spawn(150)
				del(src)
		Click()
			if(usr==src.Requestee)
				if(usr.knockedout)
					usr<<"noep"
					del(src)
				var/obj/O=new()
				var/mob/M=Requester
				O.icon='Icons/Jutsus/NarutoStuff.dmi'
				O.loc=get_step(M,M.dir)
				flick("Smoke",O)
				sleep(3)
				usr.loc=O.loc
				sleep(3)
				O.loc=null
			else
				usr<<"Você não está suposto a clicar nisto."
				return
mob/var/tmp/AsuraRealm=0
mob/proc/ToggleAsura()
	if(src.AsuraRealm)
		src.AsuraRealm=0
		src<<"Você desativa o Asura Realm."
		for(var/obj/SkillCards/AsuraPunch/A in src.LearnedJutsus)
			del(A)
		for(var/obj/SkillCards/AsuraRocket/A in src.LearnedJutsus)
			del(A)
		return
	else
		src.AsuraRealm=1
		src<<"Você ativa o Asura Realm."
		src<<"Neste modo você pode usar um perfurador de Rocket lidar fraco danos resistência, um para a frente poderoso foguete míssil, ou clique para enviar um foguete mais fraca que as casas em que no local alvo."
		src.LearnedJutsus+=new/obj/SkillCards/AsuraPunch
		src.LearnedJutsus+=new/obj/SkillCards/AsuraRocket
		while(src.AsuraRealm)
			src.chakra-=150
			sleep(rand(20,40))
mob/proc/AsuraRealmPunch()
	flick("Attack1",src)
	var/obj/Android/RocketPunch/A=new()
	A.icon+=rgb(src.BaseR,src.BaseG,src.BaseB)
	A.loc=src.loc
	A.Owner=src
	A.dir=src.dir
	walk(A,A.dir)

mob/proc/AsuraMissle(Strong=0,atom/Target)
	src.chakra-=150
	var/obj/Android/Missle/M=new()
	M.Owner=src
	M.loc=src.loc
	if(Strong)
		src.chakra-=200
		M.StrongMissle=1
	if(Target)
		walk_to(M,Target)
	else
		walk(M,src.dir)
obj/Android/Missle
	icon='Rinnegan.dmi'
	icon_state="Missile"
	density=1
	var/StrongMissle=0
	var/Owner
	New()
		spawn(25)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M.sphere) return
			if(M.Kaiten)
				src.dir=turn(src.dir,pick(90,-90,180))
				return
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			del(src)
	Del()
		if(src.StrongMissle)
			var/obj/Jutsu/StrongExplosion/K=new()
			K.loc=src.loc
			K.Owner=src.Owner
		else
			var/obj/Jutsu/Explosion/K=new()
			K.loc=src.loc
			K.Owner=src.Owner
		..()
obj/Android/RocketPunch
	icon='Rinnegan.dmi'
	icon_state="RocketPunch"
	density=1
	var/Owner
	New()
		spawn(25)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			var/mob/O=src.Owner
			if(M.sphere) return
			if(M.Kaiten)
				if(prob(25))
					src.dir=turn(src.dir,90)
					return
				if(prob(25))
					src.dir=turn(src.dir,-90)
					return
				else
					src.dir=turn(src.dir,180)
					return
			M.DamageProc(200,"Stamina",O)
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
		if(istype(A,/obj/))
			del(src)
	Del()
		for(var/mob/Q in oview(2,src))
			spawn()
				Q.HitBack(10,get_dir(src,Q))
		sleep(3)
		..()




