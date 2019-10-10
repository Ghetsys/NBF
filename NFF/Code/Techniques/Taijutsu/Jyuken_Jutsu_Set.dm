//Palm Thrust = High Pushback and Moderate Stamina Damage. No Tenketsu collapsed or Chakra Damage.

mob
	proc
		PalmThrust()
			if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!="")
				return
			else if(!src.bya)
				src<<"Você precisa ativar Byakugan para usar isto!";return
			else
				if(src.target)
					var/mob/M=src.target;src.dir=get_dir(src,M)
				sleep(1);flick("Attack1",src);src.StaminaDrain(50);var/damage=round(rand(src.tai*200,src.tai*220));var/damage2=damage*0.15
				damage+=src.StanceMastery*round(src.GenSkill/10)
				for(var/mob/M in get_step(src,src.dir))
					if(M.KagDance=="Karamatsu")
						src.health-=damage2
						src<<output("Você tenta golpear [M] mas seus ossos faz você parar de atacar!","Attack");M<<output("Você defendeu o golpe de [src]","Attack")
						if(M.Deflection)
							src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
						return
					if(!M.Mogu)
						if(M.Kaiten|M.ingat)
							spawn() src.HitBack(4,(src.dir-4))
							return
						if(M.sphere)
							viewers()<<sound('SFX/Guard.wav',0);return
						src.DodgeCalculation(M)
						if(M.Dodging)
							M.Dodge()
						else
							if(M.Guarding||M.FrozenBind=="DoBind")
								viewers()<<sound('SFX/Guard.wav',0)
							else
								viewers()<<sound('SFX/HitMedium.wav',0)
							spawn()AttackEfx(M.x,M.y,M.z)
							src<<"Você empurrou a palma da mão em frente para [M] corpo, empurrando-o de volta!"
							src<<output("[M] Foi atingido tirando [damage2] de dano!","Attack")
							M<<"[src] empurra a palma da mão em seu corpo, empurrando-o de volta!"
							flick("rasenganhit",M);damage=(damage/(M.Endurance))/(M.BaikaCharged+1);M.DamageProc(damage,"Stamina",src);M.HitBack(8,src.dir)
		TenketsuStrike()
			if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!="")
				return
			else if(!src.bya)
				src<<"Você precisa ativar Byakugan para usar isto!";return
			else
				if(src.target)
					var/mob/M=src.target;src.dir=get_dir(src,M)
				sleep(1);flick("Attack1",src);src.StaminaDrain(150)
				for(var/mob/M in get_step(src,src.dir))
					if(M.KagDance=="Karamatsu")
						src<<output("Você tenta golpear [M] mas seus ossos faz você parar de atacar!","Attack");M<<output("Você defendeu o golpe de [src]","Attack")
						if(M.Deflection)
							src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
						return
					if(!M.Mogu)
						if(M.Kaiten|M.ingat)
							spawn() src.HitBack(4,(src.dir-4))
							return
						if(M.sphere)
							viewers()<<sound('SFX/Guard.wav',0);return
						src.DodgeCalculation(M)
						if(M.Dodging)
							M.Dodge()
						else
							if(M.Guarding||M.FrozenBind=="DoBind")
								viewers()<<sound('SFX/Guard.wav',0)
							else
								viewers()<<sound('SFX/HitMedium.wav',0)
							spawn()AttackEfx(M.x,M.y,M.z)
							src<<"Você aponta diretamente para [M] Tenketsu!"
							src.Frozen=1
							M.Frozen=1
							M<<"[src] golpeia um direto para o seu corpo!"
							var/WhatHappened=rand(1,2)
							sleep(30)
							if(src.ByakuganMastery>1000&&src.TenketsuAccuracy>14)
								WhatHappened=rand(1,3)
							if(src.ByakuganMastery>3000&&src.TenketsuAccuracy>=20)
								WhatHappened=rand(3,5)
							if(WhatHappened==1)
								M<<"Você se sente uma pequena quantidade de chakra deixar o seu corpo!"
								src<<"Você perdeu [M] Tenketsu por apenas um pouco."
								M.chakra-=rand(150,500)
								M.Frozen=0;src.Frozen=0
							if(WhatHappened==2)
								M<<"Você se sente uma pequena quantidade de chakra deixar o seu corpo!"
								src<<"Você estava perto de bater [M] Tenketsu!"
								M.chakra-=rand(250,800)
								M.Frozen=0;src.Frozen=0
							if(WhatHappened==3)
								M<<"Você sente seu corpo ficar fraco com seu chakra baixo!"
								src<<"Você acertou [M] apenas uma pequena parte do Tenketsu!"
								M.chakra-=(M.chakra/4)
								M.Frozen=0;src.Frozen=0
								M.Bloody()
							if(WhatHappened==4)
								M<<"Você sente seu corpo ficar extemamente cansado, como [src] quase bateu seu Tenketsu perfeitamente!"
								src<<"Você acertou [M] Tenketsu quase perfeitamente!"
								M.chakra-=(M.chakra/3)
								M.Bloody();M.Bloody();M.Bloody();
								M.Frozen=0;src.Frozen=0
							if(WhatHappened==5)
								M<<"Você fica tonto e cai no chão, como [src] bateu em seu Tenketsu com precisão mortal!"
								src<<"Você acertou [M] Tenketsu perfeitamente!"
								M.chakra=(M.Mchakra*0.05)
								M.Bloody();M.Bloody();M.Bloody();M.Bloody();M.Bloody()
								M.Status="Asleep"
								M.StatusEffected=7
								M.Frozen=0;src.Frozen=0




//Tenketsu Burst = Momentary Expulsion of Chakra from Every Tenketsu to Blow Back Objects or Binds as a quick defense as moderate chakra cost. Does no damage.