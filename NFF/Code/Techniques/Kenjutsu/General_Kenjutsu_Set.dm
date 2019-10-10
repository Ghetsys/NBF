mob/proc
	SwiftSlashTechnique(Hand)
		if(!src||src.firing)
			return
		flick("weaponslash",src)
		for(var/mob/M in oview(1,src))
			if(M.Mogu||M.sphere)
				return
			src.firing=1
			spawn(15) src.firing=0
			if(M.Dodging||M.Guarding)
				M.Dodge();src.firing=0;return
			var/obj/WEAPONS/CCA
			var/Damage=1
			if(Hand=="Left"&&src.Clan!="Kaguya")
				CCA=src.WeaponInLeftHand
			if(Hand=="Right"&&src.Clan!="Kaguya")
				CCA=src.WeaponInRightHand
			if(src.Clan!="Kaguya")
				Damage=25-(CCA.WeaponDelay)
			if(src.Clan=="Kaguya"&&src.KagDance=="Yanagi")
				Damage=rand(15,25)
			if(src.Clan=="Kaguya"&&src.KagDance=="Tsubaki")
				Damage=rand(20,30)
			var/SizeRating=CCA.SizeRating
			if(SizeRating==3&&src.Clan!="Kaguya")
				src<<"Você não pode fazer um strike rápido com uma espada como esta.";src.firing=0;return
			M<<"[src] corta-lo rapidamente com a sua espada!"
			src.stamina-=(1000/(src.Kenjutsu+1))
			spawn()
				M.Bloody()
				M.Bloody()
			Damage=Damage*0.01
			Damage=M.maxhealth*Damage
			M.DamageProc(Damage,"Health",src)
			viewers(10,M)<<sound('SFX/Slice.wav',0)
	ImpaleTechnique(Hand)
		if(src.firing)
			return
		var/obj/WEAPONS/CCA
		if(Hand=="Left")
			CCA=src.WeaponInLeftHand
		if(Hand=="Right")
			CCA=src.WeaponInRightHand
		var/SizeRating=CCA.SizeRating
		if(SizeRating==3&&src.Clan!="Kaguya")
			src<<"Você não pode apanhalar uma espada como esta.";return
		flick("Attack1",src)
		for(var/mob/M in get_step(src,src.dir))
			if(M.Mogu||M.sphere)
				return
			src.DodgeCalculation(M,"Kenjutsu")
			if(M.Dodging)
				M.Dodge();return
			src.firing=1;spawn(15);src.firing=0
			M<<"You were impaled!"
			src.stamina-=(1000/(src.Kenjutsu+1))
			M.StunAdd(rand(3,5))
			spawn() M.Bloody();spawn() M.Bloody()
			var/damage=((src.Focus/10)-(M.Buff/10))+rand(1,5)
			if(damage<1) damage=1
			damage=damage*0.01
			damage=M.maxhealth*damage
			M.DamageProc(damage,"Health",src)
			//if(prob(1))
			//	spawn(rand(100,200)) M.CBleeding=0
			//	M.CBleeding=1
			M.StunAdd(10);viewers()<<sound('SFX/Slice.wav',0)
	RapidStrike(Hand)
		if(src.firing)
			return
		if(src.target)
			src.dir=get_dir(src,src.target)
		src.Frozen=1
		for(var/mob/M in get_step(src,src.dir))
			if(M.Mogu||M.sphere)
				return
			var/X=rand(3,5)
			var/obj/WEAPONS/CCA
			var/Damage=1
			if(Hand=="Left")
				CCA=src.WeaponInLeftHand
			if(Hand=="Right")
				CCA=src.WeaponInRightHand
			Damage=CCA.PercentDamage
			var/SizeRating=CCA.SizeRating
			if(SizeRating==3&&src.Clan!="Kaguya")
				src<<"Você não pode fazer um strike rápido com uma espada como esta.";src.Frozen=0;return
			var/Type="Normal"
			if(CCA.ChakraDeplters)
				Type="Chakra"
			var/Power=10
			src.stamina-=(max(1000/(src.Kenjutsu+1),100))
			while(X>0&&M)
				flick("weaponslash",usr)
				src.DodgeCalculation(M,"Kenjutsu")
				if(M.Dodging)
					M.Dodge();X=0;src.Frozen=0;return
				else
					spawn(1)
						if(CCA.name=="Tsubaki")
							src.TsubakiSlash(src.dir,0.036,0.045,(src.reflexNew*10+1))
						else if(CCA.name=="Yanagi")
							src.Yanagi(M)
							src.Yanagi(M)
						else
							src.SliceHit(M,Damage,Type,Power,SizeRating)
					M.StunAdd(1)
					X--
				sleep(1)
		src.Frozen=0;return

	Moonsplitter()
		if(AbleToMoonsplitter==0)
			src<<"Você não foram rápidos o suficiente para usar isto!"
			return
		if(src.firing)
			return
		if(src.target)
			src.dir=get_dir(src,src.target)
		src.Frozen=1
		for(var/mob/M in get_step(src,src.dir))
			if(M.Mogu==1||M.sphere)
				return
			var/X=src.SpeedDice
			if(src.Clan=="Kaguya")
				X=X*2
			var/obj/WEAPONS/CCA
			var/obj/WEAPONS/CCC

		//	if(Hand=="Left")
			CCA=src.WeaponInLeftHand
			CCC=src.WeaponInRightHand
		//	if(Hand=="Right")
		//		CCA=src.WeaponInRightHand
			var/Damage5=src.Kenjutsu
			var/Damage2=(src.SlashStrength)*10
			var/Damage3=X
			var/Damage4=Damage5+Damage2+Damage3
			if(Damage4>=1000)
				Damage4=1000
			var/SizeRating=CCA.SizeRating
			var/SizeRating2=CCC.SizeRating
			if(SizeRating==3||SizeRating2==3)
				Damage4=Damage4/2


			src.stamina-=(max(1000/(src.Kenjutsu+1),100))
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
		//			else
		//				src.SliceHit(M,Damage,Type,Power,SizeRating)
				src<<"Você balançou sua espada em forma de uma meia-lua!"
				M<<"[src] balançou sua espada em forma de uma meia-lua!"
				M.health-=Damage4
				M.StunAdd(1)
			sleep(1)
		src.Frozen=0;return