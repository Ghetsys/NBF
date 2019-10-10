mob/var/tmp/UsingSpinningSlash=0
mob/var/obj/WEAPONS/CCA

mob
	proc
		DancingCrescentTechnique(Hand2)
			var/Distance=0
			if(Hand2=="Right")
				CCA=src.WeaponInRightHand
			var/Damage=1
			if(CCA.SizeRating==1)
				Distance=5
				Damage=7
			if(CCA.SizeRating==2)
				Distance=3
				Damage=15
			if(CCA.SizeRating==3)
				Distance=1
				Damage=20
			if(src.firing||src.Frozen||src.knockedout)
				return
			src.icon_state="roundhouse-kick"
			sleep(5)
			src<<"Você pula no ar com sua espada!"
			flick("zan",src)
			var/Route = getline(src,get_steps(src,src.dir,Distance))-src.loc //Route between where you are, and your target!
			//get_steps() returns the spot thats [Distance] away from the user
			//And getline creates a path from one to the other. (-src.loc so it doesn't count the current tile)
			for(var/turf/T in Route)
				if(locate(/mob) in T || T.density) //If you encounter a wall, or a mob, break this loop.
					break
				else
					src.loc = T
			src.stamina-=(900/(src.Kenjutsu+1))
			for(var/mob/M in oview(1,src))
				if(M.Mogu||M.Dodging||M.Guarding||M.sphere)
					return
				spawn()
					M.Bloody()
					M.Bloody()
				Damage=(Damage*0.015)
				Damage=M.maxhealth*Damage
				M.DamageProc(Damage,"Health",src)
				viewers(10,M)<<sound('SFX/Slice.wav',0)
			sleep(9);src.icon_state=""

		AnarchistTechnique(Hand2,Uses)
			var/BonusChance=0
			var/BonusChance2=0
			var/AnarchistExpert=0
			AnarchistExpert=(Uses/100)
			if(AnarchistExpert>15)
				AnarchistExpert=15
			BonusChance=((src.Kenjutsu/10)+1)
			if(Hand2=="Right")
				CCA=src.WeaponInRightHand
			if(CCA.SizeRating!=1)
				src<<"Essa arma é muito grande para empalar alguem na cabeça!"
				return
			if(src.target)
				BonusChance2=2
				src.dir=get_dir(src,src.dir)
		//	var/Damage=0.01
			var/X=rand(1,50)
			X+=BonusChance+BonusChance2+AnarchistExpert
			flick("Attack1",src)
			for(var/mob/M in get_step(src,src.dir))
				if(M.sphere)
					return
				src<<"Você estaca a espada diretamente na cabeça de [M]!"
				if(X>=45)
					M<<"Você foi esfaqueado diretamente na cabeça!"
					M.Bloody();M.Bloody();M.Bloody()
					src<<"Você conseguiu perfurar [M] diretamente na cabeça!"
					M.DamageProc(700,"Health",src)
				else if(X>=30)
					M<<"Você foi perfurado diretamente no ombro!"
					M.Bloody()
					src<<"Você conseguiu perfurar [M] diretamente no ombro !"
					M.DamageProc(550,"Health",src)
				else if(X>=10)
					M<<"[src] errou completamente com a espada!"
			src.stamina-=(250/(src.Kenjutsu+1))

		DepartureInFlames(Hand2,Uses)
			var/Experience=(Uses/100)
			if(Experience>10)
				Experience=10
			var/BonusStruggle=0
			var/BonusStruggle2=0
			var/SurviveFlames=30
			if(Hand2=="Right")
				CCA=src.WeaponInRightHand
			if(CCA.SizeRating==1)
				BonusStruggle=10
			if(src.Kenjutsu>=50)
				BonusStruggle2=5
			for(var/mob/M in get_step(src,src.dir))
				if(M.sphere)
					return
				if(M.dir==src.dir)
					src.icon_state="throw"
					src.firing=1;src.Frozen=1
					src<<"Você agarra [M] e rapidamente bota sua espada em baixo do pescoço e fica pronto para cortar!"
					M.Frozen=1;M.firing=1
					if(M.Focus>250)
						M<<"Você percebeu que [src] te agarrou por trás e colocou a espada em baixo de sua garganta."
						M<<"Aperte a barra de espaço rapidamente para sair dos braços dele e parar a espada!"
					spawn(50)
						if(M.Struggle>(SurviveFlames+BonusStruggle+BonusStruggle2+Experience))
							M<<"Você escapou dos braços de [src] e o impediu de cortar sua garganta!"
							src<<"[M] Contra-atacou seu agarrao!"
							M.firing=0;M.Frozen=0;src.Frozen=0;src.firing=0
						else
							M<<"Seu pescoço foi cortado!";src<<"Você cortou o pescoço de [M]!"
							M.firing=0;M.Frozen=0;src.Frozen=0;src.firing=0
							M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();
							spawn(30)
								if(prob(20+BonusStruggle+BonusStruggle2+Experience)||src.key=="")
									M<<"Você está perdendo muito sangue de sua garganta cortada!"
									M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody();
									M.DamageProc(1500,"Health",src)
							M.DamageProc(350,"Health",src)
		KaitengiriTechnique(Hand2)
			var/SpinningLength=0
			var/SpinningExtra=0
			if(Hand2=="Right")
				CCA=src.WeaponInRightHand
			if(CCA.SizeRating!=1)
				SpinningLength=10
			else
				SpinningLength=30
			src.UsingSpinningSlash=1
			SpinningExtra=((src.Kenjutsu/10)+1)
			SpinningLength+=SpinningExtra
			src<<"Você começa a rodar e cortar rapidamente tudo a sua volta!"
			while(SpinningLength>0&&src.UsingSpinningSlash)
				src.icon_state="weaponslash"
				src.StaminaDrain(50)
				for(var/mob/M in oview(1,src))
					if(M.sphere)
						return
					if(M.KagDance=="Karamatsu")
						src.health-=10
						src<<output("Você tenta atacar [M] mas seus ossos o impedem de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
						if(M.Deflection)
							src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
						return
					spawn()
						if(M.Kaiten|M.ingat)
							spawn() src.HitBack(4,(src.dir-4))
							src.UsingSpinningSlash=0
						if(M.sphere||M.FrozenBind=="DoBind")
							viewers()<<sound('SFX/Guard.wav',0)
						else
							src.DodgeCalculation(M)
							if(M.Dodging)
								M.Dodge()
							else
								if(M.Guarding)
									viewers()<<sound('SFX/Guard.wav',0)
								else
									viewers()<<sound('SFX/HitMedium.wav',0)
						M.DamageProc(50,"Health",src)
						sleep(3)
				SpinningLength-=1
				sleep(5)
			src.UsingSpinningSlash=0

		AnzentaruEiketsuTechnique(Hand2)
			if(Hand2=="Right")
				CCA=src.WeaponInRightHand
			var/Damage=0
			Damage=(src.Kenjutsu/10)*5
			if(Damage>350)
				Damage=350
			var/mob/M
			for(var/mob/V in get_steps(src,src.dir,7))
				M = V
				break
			for(var/turf/T in getline(src,M))
				if(M in get_step(src,src.dir))
					if(M.KagDance=="Karamatsu")
						src.health-=350
						src<<output("Você tentou atacar [M] mas seus ossos o impedem de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
						if(M.Deflection)
							src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
						return
					spawn()
						if(M.sphere)
							return
						if(M.Kaiten|M.ingat)
							spawn() src.HitBack(4,(src.dir-4))
							src.UsingSpinningSlash=0
						if(M.sphere||M.FrozenBind=="DoBind")
							viewers()<<sound('SFX/Guard.wav',0)
						else
							src.DodgeCalculation(M)
							if(M.Dodging)
								M.Dodge()
							return
			///	if(T.density)
			//		return
				flick("zan",src)
				src.loc = T
				sleep(1)




		SanjuukenTechnique(Hand2)
			if(src.firing||src.knockedout)
				return
			if(src.target)
				src.dir=get_dir(src,src.target)
			src.Frozen=1
			for(var/mob/M in get_step(src,src.dir))
				if(M.Mogu||M.sphere)
					return
				var/X=3
				var/Damage=1
		//		if(Hand=="Left")
		//			CCA=src.WeaponInLeftHand
		//		if(Hand=="Right")
		//			CCA=src.WeaponInRightHand
				if(Hand2=="Right")
					CCA=src.WeaponInRightHand
				Damage=CCA.PercentDamage
				var/SizeRating=CCA.SizeRating
				if(SizeRating==3&&src.Clan!="Kaguya")
					src<<"Você nao pode fazer uma sequencia de cortes rapidos com uma espada como essa.";return
				var/Type="Normal"
				if(CCA.ChakraDeplters)
					Type="Chakra"
				var/Power=10
				src.stamina-=(max(1000/(src.Kenjutsu+1),100))
				while(X>0&&M)
					flick("weaponslash",usr)
					src.DodgeCalculation(M,"Kenjutsu")
					if(M.Dodging)
						M.Dodge();X=0;return
					else
						spawn(1)
							if(CCA.name=="Tsubaki")
								src.TsubakiSlash(src.dir,0.036,0.045,src.reflexNew*10)
							else if(CCA.name=="Yanagi")
								src.Yanagi(M)
								src.Yanagi(M)
							else
								src.SliceHit(M,Damage,Type,Power,SizeRating)
						M.StunAdd(1)
						X--
					sleep(1)
			src.Frozen=0;return