mob/var
	tmp/UnableToChargeChakra=0
	tmp/ByakuganTrack=0
	tmp/Byawatching=0
	tmp/KaitenCharge=0
	tmp/Kuusho=0
	tmp/TenketsuHagemi
	tmp/ByakuganExplode=0
mob/proc
	ByaChakra()
		for(var/mob/M in oview(15,src))
			if(M.client&&M!=src&&src.bya&&M.z==src.z)
				spawn()
					var/image/I=image('Icons/Jutsus/Chakra Pulse.dmi',M,"",FLY_LAYER+999999999999999999)
					src << I;spawn(300) del(I)
					while(I&&M)
						var/Percentage=(M.ChakraPool+1)/M.MaxChakraPool
						Percentage=Percentage*100
						if(Percentage>50)
							I.icon_state=""
						else if(Percentage<50&&Percentage>0)
							I.icon_state="low"
						else if(Percentage<=0)
							I.icon_state="none"
						sleep(11)
	Make_HC()
		var/a=25;var/b=-2;var/c=2;var/d=5;var/e=1;var/f=""
		while(a>0)
			var/obj/HyuugaCircle/H=new()
			if(d==5) f="a"
			if(d==4) f="b"
			if(d==3) f="c"
			if(d==2) f="d"
			if(d==1) f="e"
			H.icon_state="[f][e]";H.Owner=src;e ++
			if(e>5)
				e=1;d --
			H.loc=locate(src.x+b,src.y+c,src.z);b ++
			if(b>2)
				b=-2;c --
			a --
obj/Jutsu/Hyuuga
	Jyuuken
		icon = 'jyuken.dmi'
		icon_state = ""
		density=1
		invisibility=99
		Move_Delay=0
		var/nin
		var/hit=0
		New()
			src.pixel_x = rand(-8,8);src.pixel_y = rand(-8,8)
			..()
		Bump(A)
			if(ismob(A))
				if(!src.hit)
					src.hit=1
					var/mob/M=A;var/mob/O=src.Owner
					if(M.Kaiten)
						return
					var/damage = round(O.GenSkill*3)
					spawn()
						JyuukenEfx(M.x,M.y,M.z)
					M.DamageProc(damage,"Stamina",O);view(M)<<"[M] tomou [damage] de dano!"
					src.loc=null
					M.HitBack(5+round(O.SensoryRange),src.dir)
					M.Death(O)
					if(prob(50))
						M.chakra-=M.Mchakra*0.01
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
	JyuukenBig
		icon = 'jyuken.dmi'
		icon_state = "big"
		density=1
		invisibility=50
		Move_Delay=0
		var/nin
		New()
			src.pixel_x = rand(-8,8);src.pixel_y = rand(-8,8)
			..()
			spawn()
				while(src)
					sleep(1)
					for(var/mob/M in oview(1,src))
						spawn(1)
							var/mob/O=src.Owner
							if(M!=O&&!M.Kaiten)
								var/damage = round(src.nin/1.3);damage=round(damage/(M.Endurance))
								if(damage>1000)
									damage=1000
								spawn()
									JyuukenEfx(M.x,M.y,M.z)
								M.stamina-=damage;M.HitBack(10,src.dir)
								M.Death(O)
								if(prob(50))
									M.chakra-=M.Mchakra*0.04
			spawn(30)
				del(src)
		Bump(A)
			if(istype(A,/mob/))
				var/mob/M=A
				M.loc=src.loc
				return
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
obj
	HyuugaCircle
		icon = 'Icons/Jutsus/HyuugaTechniques.dmi'
		density = 1
		icon_state = ""
		var/Owner
		New()
			..()
			spawn(300)
				del(src)
	Kaiten
		icon='Icons/Jutsus/HyuugaTechniques.dmi'
		icon_state="Kaiten"
		density=1
		layer=MOB_LAYER+1
		var
			Owner
			Strength
		Del()
			var/mob/O=src.Owner
			O.Kaiten=0
			..()
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				var/distance=0
				distance=(round(O.KaitenCharge))
				if(distance<1) distance=1
				if(distance>10)
					distance=10
				while(src)
					sleep(1)
					spawn(1)
						for(var/obj/Jutsu/Kiriame/S2 in src.loc)
							del(src)
						for(var/obj/Jutsu/Elemental/Raiton/A in oview(distance))
							del(A)
						for(var/obj/Jutsu/A in oview(distance))
							spawn(1)
								if(A&&A.JutsuLevel)
									spawn(1)
										walk(A,0);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
										if(A&&A.speeding)
											walk(A,A.dir)
						for(var/obj/WEAPONS/A in oview(distance))//Recoded for efficiency 11/15/2012
							if(istype(A,/obj/WEAPONS/Shuriken))
								spawn(1)
									if(A)
										spawn(1)
											walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
											if(A.speeding) walk(A,A.dir)
							if(istype(A,/obj/WEAPONS/Kunai))
								spawn(1)
									if(A)
										spawn(1)
											walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
											if(A.speeding) walk(A,A.dir)
							if(istype(A,/obj/WEAPONS/Senbon))
								spawn(1)
									if(A)
										spawn(1)
											walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
											if(A.speeding) walk(A,A.dir)


						/*
						for(var/obj/WEAPONS/Shuriken/A in oview(distance))
							spawn(1)
								if(A)
									spawn(1)
										walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
										if(A.speeding) walk(A,A.dir)
						for(var/obj/WEAPONS/Kunai/A in oview(distance))
							spawn(1)
								if(A)
									spawn(1)
										walk(A,0);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
										if(A.speeding) walk(A,A.dir)
						for(var/obj/WEAPONS/Senbon/A in oview(distance))
							spawn(1)
								if(A)
									spawn(1)
										walk(A,0);step_away(A,src);sleep(1);step_away(A,src);sleep(1);step_away(A,src);sleep(1);step_away(A,src)
										if(A.speeding) walk(A,A.dir)
										*/
					for(var/mob/M in oview(distance))
						spawn(1)
							if(M&&M!=src.Owner)
								M.stamina-=M.maxstamina*0.001;M.Strafe()
								if(!M.BeingHitBack)
									M.HitBack(distance+1,get_dir(src,M));M.Normal()
								if(istype(M,/mob/Bugs/)) M.health=0
								M.Death(src.Owner)
	KaitenZ
		icon='Icons/Jutsus/HyuugaTechniques.dmi'
		density=1
		icon_state="Kaiten"
		layer=MOB_LAYER+2
		var/Owner
		Del()
			var/mob/O=src.Owner
			O.Kaiten=0
			..()
		New()
			..()
			spawn()
				var/distance=0
				distance=2
				if(distance<1) distance=1
				while(src)
					sleep(1)
					spawn(1)
						for(var/obj/Jutsu/Kiriame/S2 in src.loc)
							del(src)
						for(var/obj/Jutsu/Elemental/Raiton/A in oview(2))
							del(A)
						for(var/obj/Jutsu/A in oview(2))
							spawn(1)
							if(A&&A.JutsuLevel>0)
								spawn(1)
									step_towards(A,src);sleep(1);step_towards(A,src)

						for(var/obj/WEAPONS/A in oview(distance))//Recoded for efficiency 11/16/2012
							if(istype(A,/obj/WEAPONS/Shuriken))
								spawn(1)
									if(A)
										spawn(1)
											walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
											if(A.speeding) walk(A,A.dir)
							if(istype(A,/obj/WEAPONS/Kunai))
								spawn(1)
									if(A)
										spawn(1)
											walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
											if(A.speeding) walk(A,A.dir)
							if(istype(A,/obj/WEAPONS/Senbon))
								spawn(1)
									if(A)
										spawn(1)
											walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
											if(A.speeding) walk(A,A.dir)




									/*
						for(var/obj/WEAPONS/Shuriken/A in oview(2))
							spawn(1)
							if(A)
								spawn(1)
									step_towards(A,src);sleep(1);step_towards(A,src)
						for(var/obj/WEAPONS/Kunai/A in oview(2))
							spawn(1)
							if(A)
								spawn(1)
									step_towards(A,src);sleep(1);step_towards(A,src)
						for(var/obj/WEAPONS/Senbon/A in oview(2))
							spawn(1)
							if(A)
								spawn(1)
									step_towards(A,src);sleep(1);step_towards(A,src)
									*/


					for(var/mob/M in oview(distance))
						spawn(1)
							if(M!=src.Owner)
								step_towards(M,src);sleep(1);step_towards(M,src)
					for(var/mob/M in oview(1))
						if(istype(M,/mob/Bugs/)) M.health=0
						M.DamageProc(15,"Health",usr)
						spawn()M.Bloody();viewers()<<sound('SFX/Slice.wav',0)

	Kaiten2	//This is a Wind Chakra Imbued Kaiten that emits blades of wind chakra randomly while the user spins
			//This is not the same as "Air Kaiten" which in the future will be a Fuuton and slightly downgraded version of normal Kaiten.
		icon='Icons/Jutsus/HyuugaTechniques.dmi'
		icon_state="Kaiten"
		density=1
		layer=MOB_LAYER+1
		var
			Owner
			Strength
		Del()
			var/mob/O=src.Owner
			O.Kaiten=0
			..()
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				var/distance=rand(8,10)
				while(src)
					sleep(1)
					spawn()
						if(prob(60))
							var/obj/Jutsu/Elemental/Fuuton/KazeKiri/K=new();K.loc=src.loc;K.dir=src.dir;K.Owner=src.Owner;K.JutsuLevel=1000;K.nin=O.nin
							K.Move_Delay=0
							walk(K,pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST),K.Move_Delay)
					spawn(1)
						for(var/obj/Jutsu/Kiriame/S2 in src.loc)
							del(src)
						for(var/obj/Jutsu/Elemental/Raiton/A in oview(distance,src))
							del(A)
						for(var/obj/Jutsu/A in oview(distance))
							spawn(1)
								if(A&&A.JutsuLevel&&A.Owner!=src.Owner)
									spawn(1)
										walk(A,0);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
										walk(A,A.dir)
						for(var/obj/WEAPONS/Shuriken/A in oview(distance,src))
							spawn(1)
								if(A)
									spawn(1)
										walk(A,0);step_away(A,src);sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
										walk(A,A.dir)
						for(var/obj/WEAPONS/Kunai/A in oview(distance,src))
							spawn(1)
								if(A)
									spawn(1)
										walk(A,0);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A));sleep(1);step(A,get_dir(src,A))
										walk(A,A.dir)
						for(var/obj/WEAPONS/Senbon/A in oview(distance,src))
							spawn(1)
								if(A)
									spawn(1)
										walk(A,0);step_away(A,src);sleep(1);step_away(A,src);sleep(1);step_away(A,src);sleep(1);step_away(A,src)
										walk(A,A.dir)
					for(var/mob/M in oview(distance,src))
						spawn(1)
							if(M&&M!=src.Owner)
								M.stamina-=M.maxstamina*0.05;M.Strafe()
								M.HitBack(distance+1,get_dir(src,M));M.Normal()
								if(istype(M,/mob/Bugs/)) M.health=0
								M.Death(src.Owner)

obj/KaitenDustPart
	icon='Icons/Jutsus/HyuugaTechniques.dmi'
	icon_state="KaitenDust"
	layer=MOB_LAYER+3
	var/Owner
mob/hyuuga/ByakuganTrack
	name=""
	density=0
	Running=1
	New()
		spawn()
			while(src)
				src.Frozen=0;src.FrozenBind="";src.invisibility=99;src.Running=1;src.Stun=0;sleep(50)
mob/proc
	RangeExtension(Goggles)
		if(src.ScreenX!=src.OriginalX&&src.ScreenY!=src.OriginalY)
			src.ScreenX=src.OriginalX;src.ScreenY=src.OriginalY
			src.client.view="[src.ScreenX]x[src.ScreenY]"
			winset(usr, "default.mapwindow", "icon-size=32")
		else if(Goggles)
			if(src.ScreenX==19&&src.ScreenY==19)
				src<<"Você usa o seu extensor de alcance para aumentar sua visão!"
				src.ScreenX=round(src.ScreenX*1.157);src.ScreenY=round(src.ScreenX*1.157)
				src.client.view="[src.ScreenX]x[src.ScreenY]"
				winset(usr, "default.mapwindow", "icon-size=0")
		else if(src.bya)
			if(src.ScreenX==19&&src.ScreenY==19)
				src<<"Você usa o seu Byakugan para aumentar o alcance de visão dos seus olhos!"
				src.ScreenX=round(src.ScreenX*1.263);src.ScreenY=round(src.ScreenX*1.263)
				src.client.view="[src.ScreenX]x[src.ScreenY]"
				winset(usr, "default.mapwindow", "icon-size=0")

///////////////////////////////////
mob/proc		//One Eyed Byakugan
	ByaOn()
		if(!src.bya)
			if(Doujutsu=="Byakugan Right")
				var/icon/I=icon('Icons/Jutsus/BEye.dmi');I.Flip(WEST);src.overlays+=I
			if(Doujutsu=="Byakugan")
				src.overlays+='Icons/Jutsus/BEye.dmi'
			src.ChakraSight(1);view()<<"[src]'s olho cresce ficando Brilhante";src.bya=1;src.see_invisible=100;src.ByaChakra()
			if(src.ByakuganMastery==0)
				src.AwardMedal("Byakugan!")
			if(src.ByakuganMastery>150) src.LearnedJutsus+=new /obj/SkillCards/Search
			if(src.ByakuganMastery>350) src.LearnedJutsus+=new /obj/SkillCards/Watch
			if(src.ByakuganMastery>575) src.LearnedJutsus+=new /obj/SkillCards/Sense
	//		if(src.ByakuganMastery>1000) src.LearnedJutsus+=new /obj/SkillCards/Range
			src.UpdateInv()
			src.AwardMedal("Byakugan!")
			while(src.bya)
				if(src.ByakuganExplode)
					src<<"Seu byakugan fecha imediatamente ?! Seu chakra é drenada!";src.chakra-=10000
					if(src.ScreenX!=src.OriginalX&&src.ScreenY!=src.OriginalY)
						src.ScreenX=src.OriginalX;src.ScreenY=src.OriginalY
						src.client.view="[src.ScreenX]x[src.ScreenY]"
						winset(usr, "default.mapwindow", "icon-size=32")
					for(var/obj/SkillCards/Range/R in src.LearnedJutsus)
						del(R)
					src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.bya=0;src.see_invisible=1
				if(src.ByakuganMastery<1) src.ByakuganMastery=1
				var/ChakraDrain=(src.Mchakra/(src.ByakuganMastery*12))
				if(ChakraDrain>95)
					ChakraDrain=95
				if(ChakraDrain<5)
					ChakraDrain=5
				src.chakra-=ChakraDrain
				sleep(15)
				if(prob(1+round(src.GenSkill/10)))
					src.ByakuganMastery+=(rand(1,10)*0.1)
				if(src.Charging)
					if(prob(2))
						src.ByakuganMastery+=(rand(1,10)*0.1)
			var/list/Techniques=list("Watch","Search","Sense")
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
		else
			if(src.bya)
				if(Doujutsu=="Byakugan Right")
					var/icon/I=icon('Icons/Jutsus/BEye.dmi');I.Flip(WEST);src.overlays-=I
				if(Doujutsu=="Byakugan")
					src.overlays-='Icons/Jutsus/BEye.dmi'
		//		for(var/obj/SkillCards/Range/R in src.LearnedJutsus)
		//			del(R)
				for(var/obj/SkillCards/Watch/W in src.LearnedJutsus)
					del(W)
				for(var/obj/SkillCards/Sense/X in src.LearnedJutsus)
					del(X)
				for(var/obj/SkillCards/Search/A in src.LearnedJutsus)
					del(A)
				src.UpdateInv()
				src<<"Você cobre seu byakugan.";src.bya=0;src.see_invisible=1;src.ChakraSight(0)

	///////////////////////////////
				//Regular Byakugan
	ByakuganOn()
		if(!src.bya)
			src.bya=1;
			src.ChangeEyeStyle(usr.EyeStyle,200,200,200);
			src.ChakraSight(1);
			view()<<"[src]'s olho cresce ficando Brilhante";
			src.see_invisible=99;src.ByaChakra()
			if(src.ByakuganMastery==0)
				src.AwardMedal("Byakugan!")
			var/image/I = new('Icons/Jutsus/byakuganthing.dmi');I.pixel_y=32;I.layer=6;I.icon_state="1"
			src.overlays+=I
			spawn(30)
				src.overlays-=I
			if(src.ByakuganMastery>150) src.LearnedJutsus+=new /obj/SkillCards/Search
			if(src.ByakuganMastery>350) src.LearnedJutsus+=new /obj/SkillCards/Watch
			if(src.ByakuganMastery>575) src.LearnedJutsus+=new /obj/SkillCards/Sense
			if(src.ByakuganMastery>1000) src.LearnedJutsus+=new /obj/SkillCards/Range
			src.UpdateInv()
			src.AwardMedal("Byakugan!")
			while(src.bya)
				if(src.ByakuganExplode)
					src<<"Seu byakugan fecha imediatamente ?! Seu chakra é drenada!";src.chakra-=10000
					if(src.ScreenX!=src.OriginalX&&src.ScreenY!=src.OriginalY)
						src.ScreenX=src.OriginalX;src.ScreenY=src.OriginalY
						src.client.view="[src.ScreenX]x[src.ScreenY]"
						winset(usr, "default.mapwindow", "icon-size=32")
					for(var/obj/SkillCards/Range/R in src.LearnedJutsus)
						del(R)
					src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.bya=0;src.see_invisible=1
				if(src.ByakuganMastery<1) src.ByakuganMastery=1
				var/ChakraDrain=(src.Mchakra/(src.ByakuganMastery*12+1))
				if(ChakraDrain>65)
					ChakraDrain=65
				if(ChakraDrain<5)
					ChakraDrain=5
				src.chakra-=ChakraDrain
				sleep(15)
				if(prob(1+round(src.GenSkill/10)))
					src.ByakuganMastery+=(rand(1,10)*0.1)
				if(src.Charging)
					if(prob(2+round(src.GenSkill/10)))
						src.ByakuganMastery+=(rand(1,10)*0.1)
			var/list/Techniques=list("Watch","Search","Sense","Range")
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
		else
			if(src.bya)
				if(src.ScreenX!=src.OriginalX&&src.ScreenY!=src.OriginalY)
					src.ScreenX=src.OriginalX;src.ScreenY=src.OriginalY
					src.client.view="[src.ScreenX]x[src.ScreenY]"
					winset(usr, "default.mapwindow", "icon-size=32")
				for(var/obj/SkillCards/Range/R in src.LearnedJutsus)
					del(R)
				for(var/obj/SkillCards/Watch/W in src.LearnedJutsus)
					del(W)
				for(var/obj/SkillCards/Sense/X in src.LearnedJutsus)
					del(X)
				for(var/obj/SkillCards/Search/A in src.LearnedJutsus)
					del(A)
				src.UpdateInv()
				src<<"Você desativa seu Byakugan.";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.bya=0;src.see_invisible=1;src.ChakraSight(0)

	Kuusho()
		if(src.firing||src.Kaiten)
			return
		if(src.DoingPalms)
			return
		var/ChakraCost=src.nin

		if(src.TaijutsuStyle=="Jyuken")
			src.Kuusho=0
			src.chakra-=ChakraCost
			if(src.target)
				src.dir=get_dir(src,src.target)
			flick("jyuken",src)
			var/obj/Jutsu/Hyuuga/Jyuuken/J=new();J.nin=ChakraCost;J.loc=src.loc;J.Owner=src;J.dir=src.dir;walk(J,J.dir)
	TenketsuHagemi()
		if(src.firing||src.Kaiten||src.inso)
			return
		if(!src.bya)
			src<<"Você precisa estar com o Byakugan Ativo!";return
		else
			src.chakra-=100
			for(var/mob/M in get_step(src,src.dir))
				M<<"Você foi atingido em um dos seus pontos de Chakra!";src<<"Você atingiu [M] em um de seus pontos de chakra, recuperando lentamente seu chakra.";sleep(100);M.TenketsuHagemi=1;M<<"Você de repente se sentir seu chakra sendo regenerado normalmente!"
				while(M.TenketsuHagemi)
					M.chakra+=rand(10,50);M.ChakraPool+=M.MaxChakraPool*0.01
					if(M.chakra>=M.Mchakra||M.ChakraPool>=M.MaxChakraPool)
						M.chakra=M.Mchakra;M.TenketsuHagemi=0
					if(M.ChakraPool>=M.MaxChakraPool)
						M.ChakraPool=M.MaxChakraPool;M.TenketsuHagemi=0
					sleep(5)
				return
	Kaiten()
		if(src.firing)
			return
		if(src.FrozenBind!="")
			src<<"Você está paralizado, você não pode girar agora.";return
		if(src.DoingPalms)
			src<<"Não agora!";return
		if(!src.Kaiten&&!src.firing)
			src.FrozenBind="Jutsu";src.firing=1;src.ChakraDrain(7500);var/ChargeTime=1;src<<"Você entra na postura. Toque Z rapidamente para carregar a força do Kaiten!";src.client.screen+=new/obj/Effects/ZMash;src.KaitenCharge=1
			if(src.TaijutsuMastery<5)
				while(ChargeTime)
					src.icon_state="Block";ChargeTime--;sleep(11)
			else
				src.KaitenCharge=round(src.TaijutsuKnowledge/1000)
				if(src.KaitenCharge<1) src.KaitenCharge=1
			for(var/obj/Effects/ZMash/AAC in src.client.screen)
				del(AAC)
			src<<"Aperte e solte X para parar Kaiten. Ele irá parar automaticamente após [(round(25))/10] segundos.";src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST

			if(src.havekonchuu)	{src.konchuudraining=0;src.konchuuperson=null;src.havekonchuu=0;src<<"Um inseto caiu das costas.."}

			var/obj/Kaiten/A=new();src.JutsuList.Add(A);A.Owner=src;A.loc=src.loc;A.Strength=src.KaitenCharge;var/obj/KaitenDustPart/B=new();src.JutsuList.Add(B);B.Owner=src;B.loc=src.loc
			src.Kaiten=1;spawn(round(25))
				src.Kaiten=0
			var/ZA=1
			while(ZA==1)
				if(src.Kaiten)
					src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;src.stamina-=round(src.maxstamina*0.005);src.ChakraDrain(200)
				else
					src.CreateCrator();src.firing=0;src.FrozenBind=""
					for(var/obj/Kaiten/AAA in src.JutsuList)
						del(AAA)
					for(var/obj/KaitenDustPart/BBB in src.JutsuList)
						del(BBB)
					src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;ZA=0
			src.KaitenCharge=0
	KaitenKizu()
		if(src.firing)
			return
		if(src.FrozenBind!="")
			src<<"Você está paralizado, você não pode girar agora.";return
		if(src.DoingPalms)
			src<<"Não agora!";return
		if(!src.Kaiten&&!src.firing)
			src.FrozenBind="Jutsu";src.firing=1;src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;var/obj/KaitenZ/A=new();A.Owner=src;A.loc=src.loc;var/obj/KaitenDustPart/B=new();B.Owner=src;B.loc=src.loc;src.Kaiten=1;spawn(30)
				src.Kaiten=0
			var/ZA=1
			while(ZA==1)
				if(src.Kaiten)
					src.dir=NORTH;sleep(1);src.dir=WEST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=EAST;src.stamina-=round(src.maxstamina*0.005);src.ChakraDrain(400)
				else
					src.CreateCrator();src.firing=0;src.FrozenBind=""
					for(var/obj/KaitenZ/AAA in world)
						if(src==AAA.Owner)
							del(AAA)
					for(var/obj/KaitenDustPart/BBB in world)
						if(src==BBB.Owner)
							del(BBB)
					src.dir=NORTH;sleep(1);src.dir=WEST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=EAST;ZA=0
	HakkeRokujonyonshou(mob/M,Power)
		var/Drain=400-(src.StanceMastery*1.5)
		if(src.stamina<Drain)
			src<<"Você não tem energia suficiente para realizar este ataque.."
			return
		if(src.firing)
			return
		if(src.Kaiten)
			src<<"Não Agora!"
			return
		if(src.TaijutsuStyle=="Jyuken")
			src.stamina-=Drain;src.DoingPalms=2
			src.Make_HC()
			spawn(25)
			for(var/obj/HyuugaCircle/H in world)
				if(H.Owner==src)
					del(H)
			var/HowFast=rand(1,2)
			var/Damage1Total=0
			var/Damage2Total=0
			var/ClosedTenketsu=0
			var/i=128;var/A=0

			while(i>0&&get_dist(M,src)<=1&&src.bya&&!M.knockedout)
				HowFast=rand(1,2)
				if(M.ImmuneToDeath)
					return
				M.FrozenBind="Palms"
				if(M&&(M.knockedout!=1)&&(M.sphere!=1)&&(M.Kaiten!=1))
					if(M.Status=="Asleep")
						M.Status=""
					if(src.knockedout||get_dist(M,src)>=2)
						i=0
					src.AttackDelay=1;src.dir=get_dir(src,M)
					src.JC++
					flick("jyuken",src)
					if(prob(20+src.StanceMastery+Power))
						M.StunAdd(5)
					if(M.JC>0)
						viewers()<<sound('SFX/JyukenClash.wav',0);M.dir=get_dir(M,src);var/a=pick("Attack1","Attack2");flick(a,M);spawn() AttackEfx3(M.x,M.y,M.z,M.dir)
						M.JC--
					else
						var/damage1=round(Power)
						M.stamina-=damage1/(M.Endurance/10)/4
						spawn()JyuukenEfx(M.x,M.y,M.z)
						var/damage2=round(((Power*1.45)/(5-(src.StanceMastery*0.026))))/4
						M.health-=damage2
						Damage1Total+=damage1
						Damage2Total+=damage2

						if(M.Guarding||M.NenkinOn)
							viewers()<<sound('SFX/Guard.wav',0)
							if(!M.NenkinOn)
								if(M.chakra>0)
									M.chakra-=((M.Mchakra*0.00005)*((src.StanceMastery/3)+(Power*2.2)))
								else
									M.ChakraPool-=((M.Mchakra*0.00003)*((src.StanceMastery/3)+(Power*2)))
						else

							viewers()<<sound('SFX/HitWeak.wav',0)
							if(M.chakra>0)
								M.chakra-=((M.Mchakra*0.0001)*((src.StanceMastery/3)+(Power*2.2)))
							else
								M.ChakraPool-=((M.Mchakra*0.00005)*((src.StanceMastery/3)+(Power*2.2)))
					if(A==2)
						view() << "<font color = #00ffff size = 1>[src] says: 2 Golpes!</font>"
					if(A==6)
						view() << "<font color = #00ffff size = 1>[src] says: 4 Golpes!</font>"
					if(A==14)
						view() << "<font color = #00ffff size = 1>[src] says: 8 Golpes!</font>"
					if(A==30)
						view() << "<font color = #00ffff size = 1>[src] says: 16 Golpes!</font>"
					if(A==62)
						view() << "<font color = #00ffff size = 1>[src] says: 32 Golpes!</font>"
					if(A==126)
						view() << "<font color = #00ffff size = 1>[src] says: 64 Golpes!</font>"
						ClosedTenketsu=1
					if(A==254)
						view() << "<font color = #00ffff size = 1>[src] says: 128 Golpes!</font>"
					A+=1
					i--
					if(M.KujakuMyouhouon)
						M.KujakuMyouhouon=0;M.controlled = null;M.client.perspective=MOB_PERSPECTIVE;M.client.eye = M;M.underlays -= 'Icons/Jutsus/Kujaku.dmi'
						for(var/mob/KujakuMyouhou/KujakuHead/P in world) if(P.Owner==M) del(P)
					if(istype(M,/mob/Bugs/)) del(M)
					if(src.StanceMastery>=75)
						HowFast=pick(0,1)
						if(src.ByakuganMastery>2000||src.Trait=="Speedy")
							if(prob(70))
								HowFast=0
							else
								HowFast=1
				sleep(HowFast)
			spawn(50)
				src.JC=0
			M<<output("<font color=#00ffff>Você foi atingido por [Damage1Total] dano de energia e [Damage2Total] dano em Vitalidade!</font>","Attack")
			view(10,src)<<output("<font color=#00ffff>[M] foi atingido por [Damage1Total] Ddano de energia e [Damage2Total] dano em Vitalidade!</font>","Attack")
			M.Stun=0;step(M,M.dir);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);M.firing=0;src.AttackDelay=0;M.Death(src)
			if((M.JC<1)&&(ClosedTenketsu==1))
				M.UnableToChargeChakra=1
				ClosedTenketsu=0
				M<<"<font color = #00ffff size = 1>[src] bloquiou os seus pontos tenketsu de chakra!</font>"
				spawn(rand(300,500))
					M.UnableToChargeChakra=0;M<<"<font color = #00ffff size = 1>Seus pontos tenketsu de chakra abrem e seu chakra começa a fluir novamente!</font>"
			src.JC=0
			src.AttackDelay=0
			M.FrozenBind=""
			src.DoingPalms=0
	HakkeHyakunijuuhachishouz()
		if(src.DoingPalms!=2)
			src<<"Começe usando o 64 palms e depois use isto!";return
		if(src.TaijutsuStyle=="Jyuken")
			src<<"Você mudar sua postura rapidamente.";src.DoingPalms=3
mob/proc
	Kaiten2()
		if(src.firing)
			return
		if(src.FrozenBind!="")
			src<<"Você está paralizado, você não pode girar agora.";return
		if(src.DoingPalms)
			src<<"Não agora!";return
		if(!src.Kaiten&&!src.firing)
			src.FrozenBind="Jutsu";src.firing=1;src.ChakraDrain(7500);var/ChargeTime=1;src<<"You enter into stance. Tap Z rapidly to charge the strength of the Kaiten!";src.client.screen+=new/obj/Effects/ZMash;src.KaitenCharge=1
			while(ChargeTime)
				src.icon_state="Block";ChargeTime--;sleep(11)
			for(var/obj/Effects/ZMash/AAC in src.client.screen)
				del(AAC)
			src<<"Aperte e solte X para parar o Kaiten. Ele irá parar automaticamente após [(round(25))/10] segundos.";src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST
			if(src.havekonchuu)	{src.konchuudraining=0;src.konchuuperson=null;src.havekonchuu=0;src<<"Um inseto caiu das suas costas.."}
			var/obj/Kaiten2/A=new();src.JutsuList.Add(A);A.Owner=src;A.loc=src.loc;A.Strength=src.KaitenCharge;var/obj/KaitenDustPart/B=new();src.JutsuList.Add(B);B.Owner=src;B.loc=src.loc
			src.Kaiten=1;spawn(round(25))
				src.Kaiten=0
			var/ZA=1
			while(ZA==1)
				if(src.Kaiten)
					src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;src.stamina-=round(src.maxstamina*0.005);src.ChakraDrain(600)
				else
					src.CreateCrator();src.firing=0;src.FrozenBind=""
					for(var/obj/Kaiten2/AAA in src.JutsuList)
						del(AAA)
					for(var/obj/KaitenDustPart/BBB in src.JutsuList)
						del(BBB)
					for(var/turf/T in getring(src,2))
						spawn()
							var/obj/Jutsu/Elemental/Fuuton/KazeKiri/K=new()
							K.loc=T;K.dir=src.dir;K.Owner=src;K.JutsuLevel=1000;K.nin=src.nin;K.Move_Delay=0
							walk(K,get_dir(src,K),K.Move_Delay)
					src.dir=NORTH;sleep(1);src.dir=EAST;sleep(1);src.dir=SOUTH;sleep(1);src.dir=WEST;ZA=0
			src.KaitenCharge=0
mob/var/tmp/SenseCoolDown=0
mob/proc
	ByaSense()//Made to not lag as much 11/16/12
		set name="Byakugan Sentido"
		set category="Doujutsu"
	//	set desc="Senses everyone on the map within a certain radius and enhances your reflexes temporarily!"
		var/a=rand(10,14)
		src.chakra-=300
		if(!src.SenseCoolDown)
			src.ChakraSight(0)
			src.ByaChakra();
			src.ChakraSight(1)
		src.SenseCoolDown=1
		spawn(20)
			if(src.SenseCoolDown)
				src.SenseCoolDown=0
		while(a>0)
			if(src.WeaponInLeftHand!=""&&src.LeftHandSheath)
				src.Deflection=1
			if(src.WeaponInRightHand!=""&&src.RightHandSheath)
				src.Deflection=1
			src.JC++
			spawn(6+src.SensoryRange)
				if(src.JC>0) src.JC--
			sleep(1)
			a--
	Watch()
		set name="Assistir"
		set category="Doujutsu"
	//	set desc="Keep constant watch on a target."
//		for(var/mob/P in view(10,usr))
	//		var/mob/M = P
		var/mob/M
		for(var/mob/P in oview(10,src))
			M=P
			break
		if(!src.Byawatching)
			src<<"Você assite [M]!"
			src.Byawatching=1;
			src.client.perspective = EYE_PERSPECTIVE;
			src.client.eye=M
			while(src.Byawatching)
				src.chakra-=rand(15,35)
				if(M.z!=src.z)
					src<<"Eles estão fora de alcance!";
					src.client.perspective=MOB_PERSPECTIVE;
					src.client.eye=src;
					src.Byawatching=0
				sleep(50)
		else
			src.client.perspective=MOB_PERSPECTIVE;src.client.eye=src;src.Byawatching=0
	ByaSearch()
		set name="Byakugan Procurar"
		set category="Doujutsu"
		if(usr.ByakuganTrack)
			usr.ByakuganTrack=0;usr.firing=0;usr.controlled=null;usr.client.perspective=MOB_PERSPECTIVE;usr.client.eye=usr
			for(var/mob/hyuuga/ByakuganTrack/P in world) if(P.Owner == usr) del(P)
		else
			var/mob/hyuuga/ByakuganTrack/P=new();P.loc=locate(usr.x-1,usr.y,usr.z);P.Owner=usr;P.RunningSpeed=15;P.Running=1;usr.controlled = P;usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;usr.client.eye = P;usr.ByakuganTrack=1

obj/HTag
	icon='Icons/Weapons.dmi'
	icon_state="HTag"
	verb/Set()
		for(var/mob/M in get_step(src,src.dir))
			if(M.Clan=="Hyuuga")
				M.ByakuganExplode=1
				spawn(200)
					M.ByakuganExplode=0
					del(src)
				usr<<"Você coloco o selo em [M]!"
			else
				usr<<"Ele não é um hyuuga."
