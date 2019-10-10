mob/proc
	Asshou()
		if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!=""|src.BrokenArms)
			return
		else
			var/Z=rand(1,2)
			if(Z==1)
				flick("Attack1",src)
			if(Z==2)
				flick("Attack2",src)
			if(src.target)
				src.dir=get_dir(src,src.target)
			src.StaminaDrain(100)
			for(var/mob/M in get_step(src,src.dir))
				if((M.ReactionAbove&&prob(55+(M.HanshaDefence*10))&&M.tai<src.tai)||(M.ReactionAbove&&prob(70+(M.HanshaDefence*10))&&M.tai>=src.tai))
					M<<"Você agarra os braços de [src] quando ele tenta soca-lo e você soca-o na cara!"
					src<<"[M] agarra o seu braço quando você tenta  soca-lo e ele soca você na cara!"
					flick("Attack1",M)
					flick("rasenganhit",src)
					if(M.tai<src.tai)
						M.StaminaDrain(100)
					else
						M.StaminaDrain(50)
						src.stamina-=(M.tai*2)
						src.HitBack(10,M.dir)
						if(M.ReactionAboveCounter&&prob(25))
							M<<"Você tentou quebrar os braços de [src] braços enquanto você o agarra!"
							src<<"Você nao consegue mais sentir seus braços!"
							src.BrokenArms=1
							src.BrokenArmsTime=(M.tai*2)
						return
				if(M.KagDance=="Karamatsu")
					src.health-=rand(150,300)
					src<<output("Você tenta atacar [M] mas seus ossos o impedem de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
					if(M.Deflection)
						src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
					return
				if(!M.Mogu)//&&M.FrozenBind!="DoBind")
					src.DodgeCalculation(M)
					if(M.Dodging || M.InHydro)
						M.Dodge();return
					if(M.Kaiten|M.ingat)
						spawn() src.HitBack(4,(src.dir-4))
						return
					if(M.intank|M.sphere||M.Mogu)
						viewers()<<sound('SFX/Guard.wav',0);return
					else
						spawn()AttackEfx(M.x,M.y,M.z)
						var/damage=round(rand(usr.tai*1000,usr.tai*1200));var/Damage=(damage/(M.Endurance))/(M.BaikaCharged+1)
						if(src.Trait=="Powerful")
							damage*=1.25
						if(Damage>1250)//Raised Asshous cap
							for(var/obj/Jutsu/Elemental/Doton/EarthB/P in M.loc)
								del(P)
							Damage=1250
						if(M.Guarding)
							viewers()<<sound('SFX/Guard.wav',0)
						else
							viewers()<<sound('SFX/HitMedium.wav',0)
							flick("hit",M)
						M.DamageProc(Damage,"Stamina",src,"Asshou","green");src.ExpGain(M,damage)
						spawn() M.HitBack(5,src.dir)

	DropKick()
		if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!=""|src.doingG|src.BrokenLegs)
			return
		src.StaminaDrain(150)
		var/Damage=round(rand(src.tai*12,src.tai*17))*100
		var/damage2=(Damage*0.15)/100
		for(var/mob/M in get_step(src,src.dir))
			if((M.ReactionBelow&&prob(55+(M.HanshaDefence*10))&&M.tai<src.tai)||(M.ReactionBelow&&prob(70+(M.HanshaDefence*10))&&M.tai>=src.tai))
				M<<"Você desviou do chute do [src] como ele tenta chutar você e você chuta-o!"
				src<<"[M] rapidamente desvia seu ataque e,em seguida,repete seus movimentos!"
				flick("crashingleg",M)
				flick("rasenganhit",src)
				if(M.tai<src.tai)
					M.StaminaDrain(100)
				else
					M.StaminaDrain(50)
				src.stamina-=Damage
				src.HitBack(10,M.dir)
				if(M.ReactionBelowCounter&&prob(25))
					M<<"Você conseguiu causar trauma cerebral no [src] quando você o chutou!"
					src<<"Você se sente tonto!"
					src.DizzyProc(50)
				return
			if(M.KagDance=="Karamatsu")
				src.health-=damage2
				src<<output("Você tenta atacar [M] mas seus ossos o impedem de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
				if(M.Deflection)
					src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
				return
			if(!M.Mogu)//&&M.FrozenBind!="DoBind")
				src.DodgeCalculation(M)
				if(Damage>=1500&&M.FrozenBind=="DoBind")
					for(var/obj/Jutsu/Elemental/Doton/EarthB/P in M.loc)
						del(P)
				if(M.Dodging || M.InHydro)
					M.Dodge();return
				if(M.Kaiten|M.ingat)
					spawn() src.HitBack(4,(src.dir-4))
					return
				if(M.intank|M.sphere||M.Mogu)
					viewers()<<sound('SFX/Guard.wav',0);return
				else
					flick("crashingleg",src)
					src.pixel_y=16;sleep(1);src.pixel_y=4;sleep(1);src.pixel_y=0
					Damage/=(M.Endurance/1.2)
					M.DamageProc(Damage,"Stamina",src,"the Drop Kick","green")
					M.icon_state="Dead"
					M.StunAdd(5)
					spawn(10)
						M.icon_state="Running"
	Shoushitzu()
		if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!="")
			return
		else
			if(src.target)
				src.dir=get_dir(src,src.target)
			viewers()<<sound('SFX/AttackSwish2.wav',0)
			flick("crashingleg",src)
			src.StaminaDrain(145)
			var/damage=round(rand(src.tai*750,src.tai*1550))
			var/damage2=(damage*0.15)/100
			for(var/mob/M in get_step(src,src.dir))
				if(damage>=1500)
					for(var/obj/Jutsu/Elemental/Doton/EarthB/P in M.loc)
						del(P)
				if((M.ReactionBelow&&prob(55+(M.HanshaDefence*10))&&M.tai<src.tai)||(M.ReactionBelow&&prob(70+(M.HanshaDefence*10))&&M.tai>=src.tai))
					M<<"Você desviou do chute de [src] quando ele tentou te chutar e você o chuta devolta!"
					src<<"[M] rapidamente desviou de seu ataque e repetiu seus movimentos!"
					flick("crashingleg",M)
					flick("rasenganhit",src)
					if(M.tai<src.tai)
						M.StaminaDrain(100)
					else
						M.StaminaDrain(50)
					src.stamina-=damage
					src.HitBack(10,M.dir)
					if(M.ReactionBelowCounter&&prob(25))
						M<<"Você conseguiu causar um trauma cerebral no [src] quando você o chutou!"
						src<<"Você se sente tonto!"
						src.DizzyProc(50)
					return
				if(M.KagDance=="Karamatsu")
					src.health-=damage2
					src<<output("Você tentou atacar [M] mas seus ossos o impedem de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
					if(M.Deflection)
						src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
					return
				if(!M.Mogu&&M.FrozenBind!="DoBind")
					if(M.Kaiten|M.ingat)
						spawn() src.HitBack(4,(src.dir-4))
						return
					src.DodgeCalculation(M)
					if(M.Dodging || M.InHydro)
						M.Dodge();return
					if(M.Guarding)
						viewers()<<sound('SFX/Guard.wav',0)
					else
						viewers()<<sound('SFX/HitStrong.wav',0)
					spawn()AttackEfx(M.x,M.y,M.z)
					M.DamageProc(((damage/(M.Endurance/1.5))/(M.BaikaCharged+1)),"Stamina",src,"Shoushitzu","green")
					if(!M.Guarding)
						M.dir=src.dir;step(M,M.dir);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);M.StunAdd(2)


	CAsshou()
		if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!=""|src.BrokenArms)
			return
		else
			var/Z=rand(1,2)
			if(Z==1)
				flick("Attack1",src)
			if(Z==2)
				flick("Attack2",src)
			if(src.target)
				src.dir=get_dir(src,src.target)
			src.StaminaDrain(300)
			for(var/mob/M in get_step(src,src.dir))
				if((M.ReactionAbove&&prob(55+(M.HanshaDefence*10))&&M.tai<src.tai)||(M.ReactionAbove&&prob(70+(M.HanshaDefence*10))&&M.tai>=src.tai))
					M<<"Você agarrou o braço de [src] quando ele tentou te socar mas você o socou devolta!"
					src<<"[M] agarrou seu braço quando você tentou soca-lo mas ele te socou devolta!"
					flick("Attack1",M)
					flick("rasenganhit",src)
					if(M.tai<src.tai)
						M.StaminaDrain(100)
					else
						M.StaminaDrain(50)
						src.stamina-=(M.tai*2)+100
						src.HitBack(10,M.dir)
						if(M.ReactionAboveCounter&&prob(25))
							M<<"Você tentou quebrar os braços de [src] enquanto você o segurava!"
							src<<"Você nao consegue mais sentir seus braços!"
							src.BrokenArms=1
							src.BrokenArmsTime=(M.tai*2)
						return
				if(M.KagDance=="Karamatsu")
					src.health-=rand(150,300)
					src<<output("Você tentou atacar [M] mas seus ossos o impedem de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
					if(M.Deflection)
						src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
					return
				if(!M.Mogu)//&&M.FrozenBind!="DoBind")
					src.DodgeCalculation(M)
					if(M.Dodging || M.InHydro)
						M.Dodge();return
					if(M.Kaiten|M.ingat)
						spawn() src.HitBack(4,(src.dir-4))
						return
					if(M.intank|M.sphere||M.Mogu)
						viewers()<<sound('SFX/Guard.wav',0);return
					else
						spawn()AttackEfx(M.x,M.y,M.z)
						var/damage=round(rand(usr.tai*1300,usr.tai*1400));var/Damage=(damage/(M.Endurance))/(M.BaikaCharged+1)
						if(Damage>1750)
							Damage=1750
						if(Damage>=1500)
							for(var/obj/Jutsu/Elemental/Doton/EarthB/P in M.loc)
								del(P)
						if(M.Guarding)
							viewers()<<sound('SFX/Guard.wav',0)
						else
							viewers()<<sound('SFX/HitMedium.wav',0)
							flick("hit",M)
						M.DamageProc(Damage,"Stamina",src,"Chou Asshou","green");src.ExpGain(M,damage)
						spawn() M.HitBack(10,src.dir)

	L_Kick()
		if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!="")
			return
		else
			var/mob/M
			for(var/mob/O in get_step(src,src.dir))
				M=O
				break
			if(!M)
				return
			flick("highkick",src);var/damage=round(rand(src.tai*95,src.tai*155));var/damage2=(damage*0.15)/100
			src.StaminaDrain(400)
			if(M.KagDance=="Karamatsu")
				src.health-=damage2
				src<<output("Você tentou atacar [M] mas seus ossos o impediram de ataca-lo!","Attack");M<<output("You block out [src]'s attack","Attack")
				if(M.Deflection)
					src.DamageProc(src.maxhealth*0.03,"Health",M);spawn()Blood(src.x,src.y,src.z)
				return
			damage/=(M.Endurance/10)
			if(!M.Mogu && !M.InHydro)
				if(damage>=1500)
					for(var/obj/Jutsu/Elemental/Doton/EarthB/P in M.loc)
						del(P)
				if(M.Kaiten|M.ingat|M.intank)
					spawn() src.HitBack(4,turn(src.dir,180))
					return
				if(M.sphere)
					viewers()<<sound('SFX/Guard.wav',0)
				else
					if(M.Guarding)
						viewers()<<sound('SFX/Guard.wav',0)
					else
						viewers()<<sound('SFX/HitStrong.wav',0)
					M.DamageProc(damage,"Stamina",src,"Flash Kick","green")
					M.RestrictOwnMovement=1
					spawn(5)
						M.RestrictOwnMovement=0
					M.dir=get_dir(M,src)
					spawn() M.HitBack(rand(5,6),src.dir)
					spawn() AttackEfx(M.x,M.y,M.z)
					spawn() AttackEfx(M.x,M.y,M.z)
					spawn() AttackEfx(M.x,M.y,M.z)
					spawn(5)
						var/turf/T=get_step(M,turn(M.dir,pick(90,-90)))
						if(!T.density)
							flick("zan",src)
							sleep(3)
							src.invisibility=99
							src.Frozen=1
							src.loc=T
							sleep(3)
							src.dir=get_dir(src,M)
							src.invisibility=1
							if(!M.Guarding)
								flick("crashingleg",src)
								spawn() M.HitBack(rand(5,10),src.dir)
								spawn() AttackEfx(M.x,M.y,M.z)
								spawn() AttackEfx(M.x,M.y,M.z)
								spawn() AttackEfx(M.x,M.y,M.z)
								M.DamageProc(damage*1.2,"Stamina",src,"Flash Kick","green")
							src.Frozen=0
	DownwardPalm()
		if(src.Stun>=1|src.DoingHandseals|src.doingG|src.inso|src.Kaiten|src.resting|src.meditating|src.sphere|src.ingat|src.firing|src.FrozenBind!="")
			return
		else
			src.icon_state="Power"
			sleep(3)
			viewers(8,src)<<"[src] bateu suas maos no chao e mandou uma onda de choque!"
			flick("beastman",src)
			for(var/mob/M in view(round(src.tai/10),src))
				spawn()
					M.HitBack(get_dir(src,M),6)
			spawn(3)
				src.icon_state=""





