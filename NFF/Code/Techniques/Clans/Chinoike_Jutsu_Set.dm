/* Outras variaveis de interesse:
   KetsuryuganMastery;
*/
obj/Jutsu
	KetsuryuganExplosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		var/Kets=0
		var/Con=0
		New()
			spawn() src.SoundEngine('SFX/Bang.wav',100)
			..()
			overlays+=/obj/Jutsu/Explosion/A;overlays+=/obj/Jutsu/Explosion/B;overlays+=/obj/Jutsu/Explosion/C;overlays+=/obj/Jutsu/Explosion/D
			overlays+=/obj/Jutsu/Explosion/E;overlays+=/obj/Jutsu/Explosion/F;overlays+=/obj/Jutsu/Explosion/G;overlays+=/obj/Jutsu/Explosion/H
			spawn()
				sleep(1)
				for(var/mob/M in oview(1,src))
					spawn()
						if(M&&!M.UsingDomu&&!M.Kaiten&&!M.sphere&&!M.SusanooIn)
							if(Kets>400) Kets=400
							var/damage=((Kets*(Con/100))*2);var/damage2=((Kets*(Con/100))*15);var/Chakraz=M.ChakraArmor*0.01
							view(M)<<output("<font color=red>[M] foi atingido por uma explos�o!</font>","Attack")
							if(M)
								if(M.PaperStyleDance)
									M.PaperStyleDance=0
								M.DamageProc(damage-(Chakraz*damage),"Stamina",src.Owner,"explosion","yellow")
								if(M) M.DamageProc(damage2-(Chakraz*damage),"Health",src.Owner,"explosion","red")
				for(var/obj/O in oview(1,src))
					O.DamageProc(400)
			spawn(5)
				del(src)

mob/var
	//Booleana para verifica��o da ativa��o do Ketsuryugan
	tmp/ketsu
	tmp/ExplodingHuman=0

mob/proc
	//Ketsuryugan
	//ChangeEyeStyle(estilo de olho, vermelho, verde, azul)
	//IlluminateOff() <- procedimento para desligar a vis�o de chakra
	Ketsuryugan()
		if(src.ketsu)
			src<<"Voc� desativa o Ketsuryugan.";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.ketsu=0;src.IlluminateOff()
			for(var/obj/SkillCards/KetsuryuganIlluminate/X in usr.LearnedJutsus)
				del(X)
			src.UpdateInv()
		else
			src.icon_state="1";usr.ChangeEyeStyle(usr.EyeStyle,102,0,0)
			//Aqui onde est� o sharinganthing � onde adicionamos a anima��o para o Ketsuryugan
			var/image/I = new('Icons/Jutsus/sharinganthing.dmi');I.pixel_y=32;I.layer=6
			//Provavelmente adicionar bonus para maestria maior
			//Atualiza��o do inventario do player
			//N�o s� invent�rio de itens, mas invent�rio de Jutsu
			//Caso eu adicione algum jutsu ap�s ativar o ketsuryugan (EX: Illuminate)
			src.LearnedJutsus+=new/obj/SkillCards/KetsuryuganIlluminate
			src<<"Voc� ativa o Ketsuryugan"
			src.UpdateInv()
			src.ketsu=1;src.Illuminate();sleep(20);src.ChakraSight(1)
			while(src.ketsu)
				var/A=src.KetsuryuganMastery
				if(A<1)
					A=1
				var/Drain = (src.Mchakra/(A*20))
				if(Drain>50)
					Drain=50
				if(Drain<10)
					Drain=10
				src.chakra-=Drain
				if(prob(1))
					src.KetsuryuganMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
				if(src.Charging&&prob(3))
					src.KetsuryuganMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
				sleep(25)
	//Exploding Human
	//Funciona ao olhar para algu�m, subindo o n�vel de explos�o
	KetsuryuganGenjutsu()
		if(!src.ketsu)
			src<<"Voc� precisa ativar o Ketsuryugan";return
		if(src.firing||src.Frozen)
			return
		//Assim como o sleep de Uchiha, voc� necessita de um alvo
		src.chakra-=(400-src.KetsuryuganMastery)*((80-src.GenSkill)/100)
		var/mob/ST
		var/Distance=round(src.KetsuryuganMastery/100)
		if(Distance<1) Distance = 1
		if(Distance>10) Distance = 10
		//get_steps(referencia, dire��o, numero)
		//retorna a distancia entre A e B
		var/turf/DM = get_steps(src,src.dir,Distance)
		var/a=0
		while(a<Distance&&!ST)
			a++
			DM = get_steps(src,src.dir,a)
			for(var/mob/M in DM)
				if(M!=src&&M.dir==(get_dir(M,src))&&src.dir==(get_dir(src,M))&&M.FrozenBind==""&&!M.knockedout)
					ST=M
					//Busca o primeiro mob em linha reta
					//Se achar, fez contato, sai do for
					break
		src<<"Voc� explode vasos sangu�neos em [ST], fazendo-o sangrar."
		ST.Status="Gashed"; ST.StatusEffected=15
	ExplodingHumanTechnique()
		if(!src.ketsu)
			src<<"Voc� precisa ativar o Ketsuryugan";return
		if(src.firing||src.Frozen)
			return
		//Assim como o sleep de Uchiha, voc� necessita de um alvo
		src.chakra-=(800-src.KetsuryuganMastery)*((80-src.GenSkill)/100)
		var/mob/ST
		var/Distance=round(src.KetsuryuganMastery/100)
		if(Distance<1) Distance = 1
		if(Distance>10) Distance = 10
		//get_steps(referencia, dire��o, numero)
		//retorna a distancia entre A e B
		var/turf/DM = get_steps(src,src.dir,Distance)
		var/a=0
		while(a<Distance&&!ST)
			a++
			DM = get_steps(src,src.dir,a)
			for(var/mob/M in DM)
				if(M!=src&&M.dir==(get_dir(M,src))&&src.dir==(get_dir(src,M))&&M.FrozenBind==""&&!M.knockedout)
					ST=M
					//Busca o primeiro mob em linha reta
					//Se achar, fez contato, sai do for
					break
		src<<"Voc� envenena [ST] utilizando seu chakra."
		if(!ST)
			src<<"Voc� n�o conseguiu fazer contato visual.";return
		if(ST.ImmuneToDeath||ST.knockedout)
			return
		if(ST.ExplodingHuman)
			src<<"O alvo j� est� sob efeito do jutsu";return
		ST<<"Voc� sente algo borbulhando pelo seu sangue";ST.ExplodingHuman++
		var/timer=((src.GenSkill*10)*(1+(src.KetsuryuganMastery/100)))
		if(timer<100) timer = 100
		if(timer>300) timer = 300
		spawn(timer)
			if(ST.ExplodingHuman)
				ST.ExplodingHuman=0
		while(ST.ExplodingHuman)
			if(ST.gencounter&&ST.ExplodingHuman)
				view()<<"[ST] utiliza um contra genjutsu para repelir o jutsu de [src]!";ST.gencounter=0;ST.ExplodingHuman=0;return
			if(ST.ExplodingHuman&&ST.health<=(ST.maxhealth*0.75))
				ST.Running=0
				ST<<"Voc� n�o aguenta mais correr, algo borbulha em voc�"
			if(ST.Status=="Gashed")
				var/obj/Jutsu/KetsuryuganExplosion/K=new();K.loc=ST.loc;K.Owner=src.Owner;K.Con=src.gen;K.Kets=src.KetsuryuganMastery
				ST.ExplodingHuman=0
			if(ST.knockedout||ST.ImmuneToDeath||ST.Dead||(!ST.ExplodingHuman))
				src<<"O jutsu falhou."
				if(ST.ExplodingHuman)
					ST.ExplodingHuman=0
				return
			sleep(8)

	KetsuryuganIlluminate()
		if(!src.ketsu)
			src<<"Voc� precisa ativar o Ketsuryugan!";return
		else
			src<<"Voc� concentra o seu Ketsuryugan para ver chakra."
			src.IlluminateOff()
			src.ChakraSight(0)
			src.Illuminate()
			src.ChakraSight(1)

