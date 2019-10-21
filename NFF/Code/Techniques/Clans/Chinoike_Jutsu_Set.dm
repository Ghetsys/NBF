/* Outras variaveis de interesse:
   KetsuryuganMastery;
*/
mob/var
	//Booleana para verificação da ativação do Ketsuryugan
	tmp/ketsu
	tmp/ExplodingHuman=0
	tmp/PunchGen=0
	tmp/PunchedTarget

obj/Jutsu
	BloodNeedle
		icon='Icons/Jutsus/HyoutonTechniques.dmi'
		icon_state = "needles"
		density=1
		layer=MOB_LAYER+1
		Move_Delay=0
		var/TilesA=0
		var/TilesMax=10
		var/Ketsu
		New()
			..()
			spawn(45)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(Ketsu>100) Ketsu=100
				if(M.Kaiten||M.sphere)
					return
				if(M.Deflection)
					walk(src,0);src.dir=turn(src.dir,pick(45,-45));walk(src,src.dir);return
				var/mob/O=src.Owner;var/damage=300;Ketsu*=0.01
				damage=((1+(src.TilesA*pick(0.01,0.025)))*((damage*Ketsu)/2));M.StunAdd(3);src.density=0;src.loc=M.loc;walk(src,0)
				if(damage>125)
					damage=125
				M.DamageProc(damage,"Health",O,"Agulhas de Sangue","grey")
				M.SoundEngine('SFX/Slice.wav',4)
				spawn() M.Bloody()
				spawn(10) del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			else if(istype(A,/obj/))
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(rand(50,150),"Health",src.Owner)
				else
					del(src)
		Move()
			..()
			if(src.TilesA<src.TilesMax)
				src.TilesA++

mob/proc
	//Ketsuryugan
	//ChangeEyeStyle(estilo de olho, vermelho, verde, azul)
	//IlluminateOff() <- procedimento para desligar a visão de chakra
	Ketsuryugan()
		if(src.ketsu)
			src<<"Você desativa o Ketsuryugan.";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.ketsu=0;src.IlluminateOff()
			for(var/obj/SkillCards/KetsuryuganIlluminate/X in usr.LearnedJutsus)
				del(X)
			src.UpdateInv()
		else
			src.icon_state="1";usr.ChangeEyeStyle(usr.EyeStyle,102,0,0)
			//Aqui onde está o sharinganthing é onde adicionamos a animação para o Ketsuryugan
			var/image/I = new('Icons/Jutsus/sharinganthing.dmi');I.pixel_y=32;I.layer=6 //Adicionar animação
			//Provavelmente adicionar bonus para maestria maior
			//Atualização do inventario do player
			//Não só inventário de itens, mas inventário de Jutsu
			//Caso eu adicione algum jutsu após ativar o ketsuryugan (EX: Illuminate)
			src.LearnedJutsus+=new/obj/SkillCards/KetsuryuganIlluminate
			src<<"Você ativa o Ketsuryugan"
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
	//Funciona ao olhar para alguém, subindo o nível de explosão
	KetsuryuganGenjutsu()
		if(!src.ketsu)
			src<<"Você precisa ativar o Ketsuryugan";return
		if(src.firing||src.Frozen)
			return
		//Assim como o sleep de Uchiha, você necessita de um alvo
		src.ChakraDrain(10000)
		var/mob/ST
		var/Distance=round(src.KetsuryuganMastery/100)
		if(Distance<1) Distance = 1
		if(Distance>10) Distance = 10
		//get_steps(referencia, direção, numero)
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
		src<<"Você explode vasos sanguíneos em [ST], fazendo-o sangrar."
		ST.Status="Gashed"; ST.StatusEffected=15
	ExplodingHumanTechnique()
		if(!src.ketsu)
			src<<"Você precisa ativar o Ketsuryugan";return
		if(src.firing||src.Frozen)
			return
		//Assim como o sleep de Uchiha, você necessita de um alvo
		src.ChakraDrain(30000)
		var/mob/ST
		var/Distance=round(src.KetsuryuganMastery/100)
		if(Distance<1) Distance = 1
		if(Distance>10) Distance = 10
		//get_steps(referencia, direção, numero)
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
		src<<"Você envenena [ST] utilizando seu chakra."
		if(!ST)
			src<<"Você não conseguiu fazer contato visual.";return
		if(ST.ImmuneToDeath||ST.knockedout)
			return
		if(ST.ExplodingHuman)
			src<<"O alvo já está sob efeito do jutsu";return
		ST<<"Você sente algo borbulhando pelo seu sangue";ST.ExplodingHuman=1
		var/timer=((src.GenSkill*10)*(1+(src.KetsuryuganMastery/100)))
		if(timer<100) timer = 100
		if(timer>300) timer = 300
		spawn(timer)
			if(ST.ExplodingHuman)
				ST.ExplodingHuman=0
		sleep(8)
		while(ST.ExplodingHuman)
			if(ST.gencounter&&ST.ExplodingHuman)
				view()<<"[ST] utiliza um contra genjutsu para repelir o jutsu de [src]!";ST.gencounter=0;ST.ExplodingHuman=0;return
			if(ST.ExplodingHuman&&timer<=50)
				ST.Running=0
				ST<<"Você não aguenta mais correr, algo borbulha em você"
			if(ST.Status=="Gashed")
				var/obj/Jutsu/Explosion/K=new()
				K.loc=ST.loc
				K.Owner=src
				timer=0
				ST.ExplodingHuman=0
			if(ST.knockedout||ST.ImmuneToDeath||ST.Dead)
				src<<"O jutsu falhou."
				if(ST.ExplodingHuman)
					ST.ExplodingHuman=0
				return
			timer--
			if(timer==0&&ST.ExplodingHuman)
				ST.ExplodingHuman=0
				src<<"O tempo para explodir [ST] acabou"
			sleep(8)

	KetsuryuganIlluminate()
		if(!src.ketsu)
			src<<"Você precisa ativar o Ketsuryugan!";return
		else
			src<<"Você concentra o seu Ketsuryugan para ver chakra."
			src.IlluminateOff()
			src.ChakraSight(0)
			src.Illuminate()
			src.ChakraSight(1)
	//Agulha de Sangue
	//Torna todo o sangue a vista em agulhas que vão em direção ao alvo
	//As agulhas garantem sangramento
	KetsuryuganNeedle()
		src.Target()
		if(src.ntarget)
			src<<"Você necessita de um alvo!"
			return
		if(!src.ketsu)
			src<<"Você precisa ativar o Ketsuryugan!";return
		else
			if(usr.firing||usr.knockedout)
				return
			else
				var/T=src.target
				src.ChakraDrain(6500)
				oview(src)<<"[src] começa a manipular o sangue à sua volta, tornando-os em agulhas"
				sleep(15)
				for(var/obj/undereffect/X in oview())
					spawn()
						if(X.icon=='Blood.dmi')
							var/obj/Jutsu/BloodNeedle/S=new()
							S.loc=X.loc
							del(X)
							S.Owner=src
							S.density=0
							spawn(7)
								if(S)
									S.density=1
							var/D=get_dir(S,T)
							walk(S,D)
							walk(S,D)
							walk(S,D)
							walk(S,D)

	//Genjutsu: Soco
	//Efeito:
	//Após socar, o alvo fica marcado em um target secundario
	//O primeiro genjutsu dentro de X segundos não necessita de um alvo
	KetsuryuganPunchGenjutsu()
		if(!src.ketsu)
			src<<"Você precisa ativar o Ketsuryugan"
		else
			src.ChakraDrain(5000)
			src<<"Dentro dos próximo [src.GenSkill] segundos, seu soco marcará um alvo para ser afetado por Genjutsus"
			src.PunchGen=1
			spawn(src.GenSkill*10)
				if(src.PunchGen)
					src.PunchGen=0
					src<<"Você perdeu a concentração"