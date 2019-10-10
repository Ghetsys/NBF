mob/var/tmp
	feasting=0
	Banpaia=0
	KetsuekiDrain=0
	BeingKetsuekiDrained=0
	BloodPartner
	BloodLink=0
	UsingSixthseal=0
	UsingSealOne=0
mob/proc
	BloodDrain()
		if(src.firing||src.feasting)
			return
		for(var/mob/M in get_step(usr,usr.dir))
			if(src.client.address==M.client.address)
				src<<"Você não pode sugar o sangue de si mesmo!";return
			if(!M.knockedout)
				src<<"Eles precisam ser nocauteado primeiro!";return
			else
				src<<"Você começa a chupar [M]'s sangue."
				if(prob(5)&&BloodFeast<10)
					src.BloodFeast+=pick(0.25,0.5,0.75,1)
					if(src.BloodFeast>10){src.BloodFeast=10}
				src.firing=1;src.Frozen=1;src.feasting=1
				spawn(50)
					if(src.feasting)
						src.firing=0;src.feasting=0;M.firing=0;src.Frozen=0;src<<"Você termina de beber [M]'s sangue."
				while(src.feasting&&M)
					if(M.knockedout)
						src.thirst-=10
						if(src.thirst<0)
							src.thirst=0
							if(M.client)
								if(src.stamina<src.maxstamina*1.5){src.stamina+=rand(100,250)}
								src.exp+=((src.BloodFeast+M.Age))
								if(src.Subscriber)
									src.exp+=(((src.BloodFeast+M.Age))/2)
							src.calories+=10
					else
						src<<"[M] acorda, você para de chupar seu sangue!";src.feasting=0
					sleep(1)
				src.firing=0;M.firing=0;src.Frozen=0

	FirstSeal()
	//	var/CurrentHealth=0
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src<<"Você converter a energia no sangue por todo o seu corpo, que regenera lentamente seu chakra...."
		src<<"Qualquer alteração perceptível na consciência vai desligar isso.."
	//	CurrentHealth=src.health
		src.UsingSealOne=1
		while(src.UsingSealOne&&!src.knockedout)
			src.chakra+=rand(5,12)
			if(prob(1))
				src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
	//		M.ChakraPool+=M.MaxChakraPool*0.01
			if(src.chakra>=src.Mchakra)
				src.chakra=src.Mchakra
				src.UsingSealOne=0
			sleep(5)
		for(var/obj/SkillCards/firstSeal/P in src.LearnedJutsus)
			if(P.TurnedOn)
				P.TurnedOn=0
				P.DelayIt(600,src,"Clan")
				src<<"O Selo Desativa..."
		src.deathcount+=0.15
		src.UsingSealOne=0
		return
	/*
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src<<"You convert energy in the blood all through your body, rejuvanating your chakra completely!"
		var/BloodCost=((src.Mchakra-src.chakra)/200)
		src.chakra=src.Mchakra
		src.deathcount+=0.25
		if(prob(1))
			src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
		spawn(100)
			src.deathcount+=0.15
			src<<"The seal has made you tired, taking up a lot of your blood supply.";src.thirst+=BloodCost*0.5
			src.SealMastery+=1;if(src.SealMastery>100) src.SealMastery=100
			*/
	SecondSeal()
		var/ChakraLost=350-src.BloodManipulation
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(src.thirst>=80)
			src<<"Você tentar abrir o segundo selo, mas você está com muita sede.."
			return
		src.chakra-=ChakraLost;src<<"Você abre o segundo selo em seu corpo, e gera chakra durante todo o seu corpo, relaxando os músculos!";src.Banpaia=1
		if(prob(1))
			src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
		spawn(200+(src.SealMastery*2))
			src.Banpaia=0
	ThirdSeal()
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src<<"Você abre o terceiro selo e liberar uma corrente de sangue por toda parte!";src.thirst+=(40-round(src.BloodFeast*2));var/count=0
		for(var/turf/T in oview(6))
			if(prob(25))
				count+=1;var/obj/undereffect/x=new/obj/undereffect(locate(T.x,T.y,T.z))
				spawn(9)
					if(!x)return
					x.icon='Blood.dmi';var/v=rand(1,7);x.icon_state="l[v]";x.Owner=src
					spawn(900)
						del(x)
			src.health-=2
			if(prob(1))
				src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
	FourthSeal()
		var/mob/M=src.target
		if(!M.client||M.client.address==src.client.address)
			src<<"O quarto selo se recusa a abrir."
			return
		if(src.Banpaia)
			src<<"Você tenta abrir o quarto selo, mas falhou?!"
			sleep(20)
			src<<"Tente fechar o segundo selo primeiro.."
			return
		if(src.KetsuekiDrain) return
		else
			src.Handseals(50-src.HandsealSpeed);if(src.HandsSlipped) return
			spawn(600)
				if(M&&M.BeingKetsuekiDrained)
					M.BeingKetsuekiDrained=0
				src.KetsuekiDrain=0
			M.BeingKetsuekiDrained=1;src.KetsuekiDrain=1
			if(prob(1))
				src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
			M<<"Seu sangue está sendo drenada por [usr]!";src<<"Você esta drenando o sangue do seu alvo!"
			while(src.KetsuekiDrain)
				for(M in oview(1,src))
					if(M.BeingKetsuekiDrained&&!M.knockedout)
						M.health-=M.maxhealth*0.01
						src.ChakraPool-=src.MaxChakraPool*0.0045
						if(src.ChakraPool>0)
							if(src.health<src.maxhealth)
								src.health+=M.maxhealth*0.005
						else
							src.chakra+=src.ChakraPool
							src.ChakraPool=0
				sleep(5)
	FifthSeal()
		var/ChakraLost=900-src.BloodManipulation
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped||usr.ntarget)
			return
		src.chakra-=ChakraLost
		var/mob/M=src.target
		if(!M.client)
			return
		if(M.Clan=="Ketsueki")
			src.BloodPartner=M
			src<<"Você rotulou [M.name] como seu parceiro de sangue."
		else
			src<<"Você não pode rotular [M.name] como seu parceiro de sangue, eles devem ser do Clan Ketsueki."
	SixthSeal()
		var/ChakraLost=(350-(src.BloodManipulation/5))*2
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped)
			return
		src.chakra-=ChakraLost
		if(src.thirst>=80)
			src<<"Você tenta abrir o selo sexto lugar, mas você está com muita sede.."
			return
		if(UsingSixthseal==0)
			src<<"Você começa a se conectar com o seu parceiro de sangue! Todo o dano feito para você vai ser feito para ele, em vez de você!"
			UsingSixthseal=1
			var/mob/M=src.BloodPartner
			while(M&&M.health>0&&UsingSixthseal)
				for(src.BloodPartner in view(10,src))
					src.BloodLink=1
					src.chakra-=pick(0,1)
				sleep(30)
		if(UsingSixthseal==1||src.knockedout||src.thirst>=80)
			UsingSixthseal=0
			src.BloodLink=0
			src.BloodPartner=""
			src<<"Você para de usar o selo..."

	SeventhSeal() //Actually is the Eighth Seal....
		var/ChakraLost=(350-src.BloodManipulation)*8
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped)
			return
		src.chakra-=ChakraLost
		if(src.thirst>=57)
			src<<"Você tenta abrir o Sétimo Selo, mas você está com muita sede.."
			return
		src<<"Seus músculos começam a relaxar e sangue começa a correr através de você."
		src<<"Pressione Z para libertar-se do selo"
		var/EighthSeal=1
		var/Time=120//How long the seal lastes
		var/TT=0
		src.nin=src.Mnin*1.3
		while(EighthSeal==1&&Time>0)
			src.Banpaia=1
			src.stamina+=50
			src.health+=10
			if(src.health>src.maxhealth) src.health=src.maxhealth
			if(TT==4)
				src.thirst+=1
				if(src.thirst>=100)
					src.thirst=100
					EighthSeal=0
					src<<"Sua sede causa danos em você, fazendo você liberrar o selo."
				TT=0
			if(icon_state=="handseal")
				EighthSeal=0
			TT++
			Time--
			sleep(5)
		src.nin=src.Mnin


	KetsuekiBunshin()
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(prob(1))
			src.BloodManipulation+=0.1;if(src.BloodManipulation>100) src.BloodManipulation=100
		src<<"Você gera chakra, transformando cada sangue deixado no chão em clones!"
		var/count=0
		for(var/obj/A in oview())
			if(A.icon=='Blood.dmi')
				if(prob(25)&&count<50)
					var/mob/Clones/Clone/K=new();K.CloneType="TKageBunshin"
					count++
					K.loc=A.loc;K.Owner=src;K.tai=src.Mtai;K.Endurance=0;K.health=src.health/100;src.chakra-=src.chakra/10
					for(var/V in src.vars)
						var/list/BAD = list("locs","cansave","GateIn","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath","Owner")
						if(!BAD.Find(V))
							K.vars[V] = usr.vars[V]
					if(K)
						K.health=1;K.stamina=0;K.icon=src.icon;K.overlays+=src.overlays;K.name="[src.name]";K.Clone=1;K.Running=1
				del(A)
			sleep(1)