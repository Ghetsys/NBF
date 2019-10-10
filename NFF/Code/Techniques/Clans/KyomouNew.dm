///////Here's the idea. There will be 3 Kyomou NPCs, who all teach a different set of moves.
///////They teach a kyomou how to use their particles, and life force in different ways.
///////Now, each move is seperated into tiers. How many tiers? Haven't decided. Maybe 7? which makes 21 moves?
///////However, you can only get 1 jutsu from any tier, so in the end you can only have up to 7 jutsu.
///////Each teacher teaches one jutsu of each tier. So there are three groups.
///////The Three groups are as followed: Illusion/Supplement, Offensive, and Life-Force
///////Illusion/Supplement would have genjutsu/genjutsu-like moves, and moves that distort one's chakra.
///////Offensive would be more aggresive moves,
///////Life-Force would be kind of a mix. There'd be healing,
///////		but also some damageing moves that revolve around some sort of life-fore manipulation.

///////Now, the last two tiers would be considered "Super Tiers" if you will,
///////Essentually, you are only allowed to know so many moves, from any of the groups,
///////So when you get to the second last tier, you won't be able to learn from the teacher who taught you the most,
///////And at the last one, you won't be able to pick from the one you just came from.
///////My reasoning for this, is that Kyomous are a clan of secrets, and deny giving out TOO much information.

///////Kyomou, Tokui	Illusion/Supplement
///////Kyomou, Gekido	Offense
///////Kyomou, Eien		Life-Force

///////Tier (Aka Req)	 Tokui - Eien - Gekido								EXP

///////Tier 1 (25)  	: Blind - Burn - Rejuvination			10k
///////Tier 2 (60)  	: Chakra Clones - Migrane - Chakra Damage			15k
///////Tier 3 (100) 	: Doujutsu Counter - Anorexiation - Chakra Restore	20k
///////Tier 4 (150) 	: Daze - Stamina Damage - Reservoir Absorbtion		20k
///////Tier 5 (200) 	: Stun - Vitality Damage - Disruption				25k
///////Tier 6 (500) 	: Sleep - Redirection - Life Absorbtion				35k
///////Tier 7 (1000)	: Constraint - Release - Life-Force Restoration		50k

///////Move Descriptions

//Blind - This move will cause the affected's screen to be covered with red, and unable to target people. DONE
//Burn - Causes the affected to feel the after affects of a burning fire. DONE
//Rejuvination - Uses chakra from the user to heal the wounds of the affected. DONE

//Chakra Clones - Creates any number of clones resembeling those in the area, including one's self. Clones have a chakra Aura. DONE
//Migrane - Causes the affected's screens to wobble out of control as they suffer damage from the trauma of a migrane. DONE
//Chakra Damage - Causes the affected's body to leak chakra. DONE

//Doujutsu Counter - If the affected posseses a doujutsu, it is deactivated. DONE
//Anorexiation - This causes the body of the affected to reject calories, and food. There's a chance of causing
	//an auto immune response. DONE
//Chakra Restore - Causes the affected to produce more chakra. DONE

//Daze - Causes the affected to become dazed and confused, as their eye-sight goes crazy. DONE
//Stamina Damage - Causes the affected's body to cramp, and damage itself. DONE
//Reservoir Absorbtion - The user uses their particles to steal away reserved chakra from the affected. DONE

//---- The rest below are for a later update (Unlearnable)

//Stun - The affected are not only stunned, but also forced to walk. DONE
//Vitality Damage - Tricks the body of the affected into performing an auto-immune response, causing vitality damage. DONE
//Disruption - This causes a disruption in the chakra of any affected, or jutsus. (undoes charged moves, and deletes jutsu objs.) DONE

//Sleep - Causes the brain of the affected to release sleep inducing hormones. DONE
//Redirection - This allows the user to absorb incoming moves, and transform the damage into one's own stats. (Nin, gen, tai)
//Life Absorbtion - This allows the user to sap the life from any affected, (Stamina, Chakra, Reservoir, and WP) DONE

//Constraint - This causes the chakras of anyone close to another to become linked, and constrained, disallowing them from
	//walking too far from the other, with out difficulty, or consiquense.
//Release - The user uses their particles to unlock their body's potential, which pushes them into overdrive,
	//multiplying all of their stats, and constantly healing their stamina. The cost is the chakra reservoir, and vitality.
//Life-Force Restoration - The user converts their own chakra into life-force, which swells into the affected. DONE


///////Modes of Transport
///////Of course, there is more than 1 way for these affects to reach their target.

//Direct Contact - This is the most potent, and least costly method, as it requires you to be within a single tile from your target. DONE
//Projectile Particles - Projectiles lose their potency in distance, and require a bit more chakra to create.
//Particle Field - Particle Fields aren't as potent as the other forms, and cost extra chakra to spread ones chakra that far.
	//The way fields will work is that when creating one, one must remain stationary, and while they do, the field expands
	//until it reaches a maximum size. The speed at which the expand (like all methods) is determined by "Particle Usage"
	//They only last for a while (duration dependent on Akametsuki mastery) DONE


//TO DO LIST:
	//Edit Attack file, so that punching and kicking transfers Particle affects... (Same for slashing)
	//Edit Weapon file, so thrown weapons transfer particles...
	//
	//
	//


mob/var/tmp/Majest=0
mob/var/tmp/AkametsukiBlind=0
mob/var/tmp/Rejuvination=0
var/FriendlyAka=list("Rejuvenescer","Restaurar Chakra","Regeneração de Vida")//Can be made to only work on allies, while others don't work on allies
mob/var/tmp
	ParticleAffect=""
	Akametsuki=0
	AkametsukiTrack=0


obj/Makam
	icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
	icon_state = "strong"
	layer=MOB_LAYER+1
	screen_loc="1,1 to 19,19"
	mouse_opacity = 1
obj/Kyomou
	Particles
		icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
		icon_state = "strong"
		mouse_opacity = 0
		layer=MOB_LAYER+1
		invisibility=100
		var
			Owner
			Dist
			Affect
		New()
			spawn()
				..()
				var/mob/O = src.Owner
				while(src)
					if(src.Affect=="Atordoamento")
						for(var/atom/movable/M in src.loc)
							if(istype(M,/obj))
								O.AkametsukiAffect("Field",Affect,O=M)
							else if(M!=O)
								O.AkametsukiAffect("Field",Affect,M)
					else
						var/dev=(2/src.Dist)//Too weak...
						if(src.Dist==1) dev=1//So that point blank isn't too strong...
						for(var/mob/M in src.loc)
							if(M!=O&&M.client)
								O.AkametsukiAffect("Field",Affect,M,dev)
					sleep(11)
			spawn(800)
				del(src)
		Del()
			var/mob/P = src.Owner
			var/duration = min(10,max(round(P.AkametsukiMastery/30),20))+src.Dist
				//between 10 and 2 seconds, while those furthest from the center delete last
			sleep(duration)
			..()
	WaveParticles
		icon = 'Kyomou.dmi'
		icon_state="Wave"
		mouse_opacity = 0
		invisibility=100
		density=0
		var
			mob/Owner
			Dist=1
			Affect
		New()
			..()
			spawn(300)
				del(src)
		Crossed(atom/movable/A)
			..()
			if(src.Affect())
				del(src)
		Move(turf/NewLoc)
			if(src.Affect()) //When attempting to move, attempt to Affect Current loc
				del(src)
				return //If an effect was given, this is deleted, and stop the Move() proc.
			if(!NewLoc) //Delete if trying to walk into the void
				del(src)
				return
			if(NewLoc.density) //Manually check if the next loc is dense, because this obj is non-dense
				del(src) //I have it liek this, so that it doesn't unintendedly act as a shield...
				return
			if(..()) //carry out default Move() proc
				Dist++
				if(src.Affect()) //After moving, check current loc, for effect again.
					del(src)
					return
		proc/Affect()
			for(var/atom/movable/A in src.loc)
				sleep(2)
				if(A != src)
					if(A == Owner)
						del(src)
						return 1
					if(src.Affect=="Atordoamento" && istype(A,/obj))
						spawn() Owner.AkametsukiAffect("Wave",Affect,O=A)
						return 1
					else if(ismob(A))
						var/dev=(3/src.Dist)
						spawn() Owner.AkametsukiAffect("Wave",Affect,A,dev)
						return 1
			return 0
	BulletParticles
		icon = 'Kyomou.dmi'
		icon_state="Bullet"
		mouse_opacity = 0
		invisibility=100
		density=0
		var
			mob/Owner
			Dist
			Affect
		New()
			..()
			spawn(300)
				del(src)
		Crossed(atom/movable/A)
			..()
			if(src.Affect())
				del(src)
		Move(turf/NewLoc)
			if(src.Affect()) //When attempting to move, attempt to Affect Current loc
				del(src)
				return //If an effect was given, this is deleted, and stop the Move() proc.
			if(!NewLoc) //Delete if trying to walk into the void
				del(src)
				return
			if(NewLoc.density) //Manually check if the next loc is dense, because this obj is non-dense
				del(src) //I have it liek this, so that it doesn't unintendedly act as a shield...
				return
			if(..()) //carry out default Move() proc
				Dist++
				if(src.Affect()) //After moving, check current loc, for effect again.
					del(src)
					return
		proc/Affect()
			for(var/atom/movable/A in src.loc)
				if(A != src)
					if(A == Owner)
						return 1
					if(src.Affect=="Atordoamento" && istype(A,/obj))
						spawn() Owner.AkametsukiAffect("Bullet",Affect,O=A)
						return 1
					else if(ismob(A))
						var/dev=(rand(5,9)/src.Dist)
						spawn() Owner.AkametsukiAffect("Bullet",Affect,A,dev)
						return 1
			return 0


mob/Kyomou/verb
	AkametsukiSearch()
		set name="Akametsuki Procurar"
		set category="Doujutsu"
		if(usr.AkametsukiTrack)
			usr.AkametsukiTrack=0
			usr.firing=0
			usr.controlled=null
			usr.client.perspective=MOB_PERSPECTIVE
			usr.client.eye=usr
			for(var/mob/Kyomou/AkametsukiTrack/P in world)
				if(P.Owner == usr)
					del(P)
		else
			usr.firing=1
			var/mob/Kyomou/AkametsukiTrack/P=new()
			P.loc=locate(usr.x-1,usr.y,usr.z)
			P.Owner=usr
			usr.controlled = P
			usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			usr.client.eye = P
			usr.AkametsukiTrack=1
	RefreshSight()
		set name = "Ver Auras"
		set category = "Doujutsu"
		src.ChakraSight(0)
		spawn(20)
			src.ChakraSight(1)
		src.verbs-=/mob/Kyomou/verb/RefreshSight
		spawn(300)
			if(src.Akametsuki && !(locate(/mob/Kyomou/verb/RefreshSight) in src.verbs))
				src.verbs+=/mob/Kyomou/verb/RefreshSight

mob/Kyomou/AkametsukiTrack
	name=""
	density=0


mob/proc
	AkametsukiSearch2(Uses)
		if(usr.AkametsukiTrack)
			src.AkametsukiTrack=0
			src.firing=0
			src.controlled=null
			src.client.perspective=MOB_PERSPECTIVE
			src.client.eye=src
			for(var/mob/Kyomou/AkametsukiTrack/P in world)
				if(P.Owner == src)
					del(P)
		else
			src.firing=1
			var/mob/Kyomou/AkametsukiTrack/P=new()
			P.loc=locate(src.x-1,src.y,src.z)
			P.Owner=src
			src.controlled = P
			src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			src.client.eye = P
			src.AkametsukiTrack=1
	AkametsukiIllumin(Uses)
		src.ChakraSight(0)
		src.ChakraSight(1)
		src.verbs-=/mob/Kyomou/verb/RefreshSight
		sleep(300)
		if(src.Akametsuki && !(locate(/mob/Kyomou/verb/RefreshSight) in src.verbs))
			src.verbs+=/mob/Kyomou/verb/RefreshSight
mob/proc
	Akametsuki(Uses)
		if(src.Akametsuki>=1)
			src.Akametsuki=0
			src.see_invisible=1
			src<<"Você desativa seu Akametsuki!"
			usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye)
			src.ChakraSight(0)
			src.verbs-=/mob/Kyomou/verb/AkametsukiSearch;
			src.verbs-=/mob/Kyomou/verb/RefreshSight
		else
			src.Akametsuki=1;
			src.ChakraSight(1);
			src.verbs+=/mob/Kyomou/verb/AkametsukiSearch;
			src.verbs+=/mob/Kyomou/verb/RefreshSight
			if(src.AkametsukiMastery>30)
				src.Akametsuki=2
			if(src.AkametsukiMastery>60)
				src.Akametsuki=3
			src<<"Você ativa seu Akametsuki!";
			usr.ChangeEyeStyle(usr.EyeStyle,200,0,0);
			src.see_invisible=100
			if(src.ParticleUsage>10)
				src.ParticleUsage=10
			while(src.Akametsuki>=1)
				sleep(10)
				var/A=src.AkametsukiMastery
				if(A<1) A=1
				var/ChakraDrain=(src.Mchakra/(A*15))
				if(ChakraDrain>100)
					ChakraDrain=100
				if(ChakraDrain<10)
					ChakraDrain=10
				src.chakra-=ChakraDrain
				if(prob(2))
					src.AkametsukiMastery+=pick(0.1,0.2,0.3,0.4,0.5)








///////Jutsu
mob/var/tmp/AkaSleep
mob/var/tmp/list/AkaConst
mob/proc
	ParticleConduction()	//Direct contact
		//Not in yet

	ParticleField()
		set background=1
		if(src.Kaiten||src.firing||src.knockedout)
			return
		src.icon_state="handseal"
		src << "Você começar a emitir um campo de partículas."
		var/count=1
	//	var/PS=list();
		var/spot = src.loc
	//	for(var/obj/Kyomou/Particles/P in PS)
	//		spawn()
	//			del(P)
		for(var/obj/Kyomou/Particles/P in src.JutsuList)
			spawn()
				del(P)
		while(!src.knockedout&&src.Akametsuki && count<(src.Akametsuki*2)&&src.icon_state=="handseal"&&src.loc==spot)
			if(src.ParticleUsage < 10 && prob(4))
				src.ParticleUsage += pick(0.25,0.5,0.75)
				if(src.ParticleUsage > 10)
					src.ParticleUsage=10
			src.ChakraDrain(6500)//Was 5000
			for(var/turf/T in oview(count,src))
				var/found=0
				for(var/obj/Kyomou/Particles/P in T)
			//		if(P in PS)
			//			found=1
					if(P in src.JutsuList)
						found=1
				if(found==0)
					var/obj/Kyomou/Particles/P=new(T);
					P.Owner=src
					P.Affect=src.ParticleAffect
					P.Dist=count;
				//	PS+=P
					src.JutsuList+=P
			count++
			sleep(rand(12,17)-src.ParticleUsage)//was (12,17)
		while(!src.knockedout&&src.Akametsuki&&src.icon_state=="handseal"&&src.loc==spot)
			if(src.ParticleUsage < 10 && prob(0.5))
				src.ParticleUsage += pick(0.25,0.5,0.75)
				if(src.ParticleUsage > 10)
					src.ParticleUsage = 10
			sleep(10)
	//	for(var/obj/Kyomou/Particles/P in PS)
	//		spawn()
	//			del(P)
		for(var/obj/Kyomou/Particles/P in src.JutsuList)
			spawn()
				del(P)
	ParticleWaves()
		set background = 1
		if(src.Kaiten||src.firing)
			return
		var/count=3
		while(count)
			src.ChakraDrain(3000)
			if(prob(count*(99+src.ParticleUsage)/3) || count == 3)
				var/obj/Kyomou/WaveParticles/W = new(get_step(src,src.dir));W.Owner=src;W.dir=src.dir
				walk(W,W.dir,3)
				if(src.ParticleUsage<10 && prob(1))
					src.ParticleUsage += pick(0.25,0.5,0.75)
					if(src.ParticleUsage>10) src.ParticleUsage = 10
			if(prob(count*(99+src.ParticleUsage)/3))
				var/obj/Kyomou/WaveParticles/W = new(get_step(src,turn(src.dir,90)));W.Owner=src;W.dir=src.dir
				walk(W,W.dir,4)
				if(src.ParticleUsage<10 && prob(5))
					src.ParticleUsage += pick(0.25,0.5,0.75)
					if(src.ParticleUsage>10) src.ParticleUsage = 10
			if(prob(count*(99+src.ParticleUsage)/3))
				var/obj/Kyomou/WaveParticles/W = new(get_step(src,turn(src.dir,-90)));W.Owner=src;W.dir=src.dir
				walk(W,W.dir,4)
				if(src.ParticleUsage<10 && prob(5))
					src.ParticleUsage += pick(0.25,0.5,0.75)
					if(src.ParticleUsage>10) src.ParticleUsage = 10
			count--
			sleep(8)

	ParticleBullet()
		set background = 1
		if(src.Kaiten||src.firing)
			return
		flick(pick("Attack1","Attack2"),src)
		src.ChakraDrain(6000)
		var/obj/Kyomou/BulletParticles/B = new(src.loc);B.dir=src.dir;B.Owner=src
		if(src.ParticleUsage<10 && prob(5))
			src.ParticleUsage += pick(0.25,0.5,0.75)
			if(src.ParticleUsage>10) src.ParticleUsage = 10
		walk(B,B.dir)

	AkametsukiClones()
		set background = 1
		if(src.Kaiten||src.firing)
			return
		src.ChakraDrain(10000)
		src.Handseals(40-src.HandsealSpeed*10)
		if(src.HandsSlipped) return
		var/count=15
		while(count>0)
			sleep(2)
			var/mob/Clones/Clone/A=new();var/obj/SmokeCloud/S=new()
			A.RunningSpeed=src.RunningSpeed;A.Acceleration=src.Acceleration;A.Running=1;A.HasAura=1
			PICKASPOT
			var/turf/spot = locate(src.x+rand(-5,5),src.y+rand(-5,5),src.z)
			if( !(spot in view(src)) || !spot || spot.density==1 )
				goto PICKASPOT
			if(A)
				A.name="[src]";A.Owner=src;A.Clan = "Kyomou";A.ChakraColorR=180;src.ChakraColorG=0;src.ChakraColorB=0
				A.icon=src.icon;A.overlays+=src.overlays;A.chakra=src.chakra;A.Mchakra=src.Mchakra
				A.RunningSpeed=src.RunningSpeed;A.Acceleration=src.Acceleration
				S.loc=spot;A.loc=spot
				spawn(600) if(A) del(A)
			for(var/mob/M in range(15,src))//misdirect targets
				if(src==M.target&&prob(10))
					M.target=A
					for(var/image/x in M.client.images)
						if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
							del(x)
					var/image/I = image('Icons/target1.dmi',A);M<<I
				if(M.client)//And now make sure everyone who can see chakra, sees it.
					if(M.shari&&!findtext("Sharingan",M.Doujutsu)||M.bya||M.Akametsuki)
						src.tempmix='Icons/Jutsus/ChakraAuraRed.dmi'
						//src.tempmix+=rgb(src.ChakraColorR,src.ChakraColorG,src.ChakraColorB)
						var/icon/Q=icon(src.tempmix)
						var/image/I=image(Q,A,"",FLY_LAYER+999999999999999991)
						M << I
			count--
			sleep(rand(1,10))

	AkametsukiAffect(Type,Affect,mob/M,num=1,obj/O)
			//Affect: Self Explanatory
			//M: The mob being effected...
			//num: The effeciency multiplier (weaker/stronger effects)
			//O: If not a mob, but an object,
			//F: Avoid Friendly Fire? (The Particle Field is so far the only thing using this.)
		//if(src.key=="RageFury33") num*=2 // :P
		if(!src)
			return
		if(Type=="Field" && M)
			if(M == src)
				return
			if(src.Allies.len>0)
				if( (!(Affect in FriendlyAka)&&M in src.Allies) || (Affect in FriendlyAka&&!(M in src.Allies)) )
					return
		if(Type in list("Wave","Bullet"))
			view() << "O [Affect] [Type] Colidiu com [M]!"
		switch(Affect)
			//Tier 1
			if("Paralizar")
				if(!M.client)
					return
				if(M.knockedout||M.ImmuneToDeath)
					return
				for(var/obj/Makam/X in M.client.screen)
					return
				var/obj/Makam/MM=new()
				M.client.screen+=MM
				//src.ChakraDrain(5000)
				src<<"Você paralizou [M] com sua visão vermelha!"
				if(M.target)
					M.target=null
					for(var/image/x in M.client.images)
						if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
							del(x)
				if(src.AkametsukiMastery>100)
					MM.icon_state="strong"
				var/Z=src.AkametsukiMastery*10
				if(Z>250)//was 450...
					Z=250
				spawn(Z*num)
					for(var/obj/Makam/ZX in M.client.screen)
						del(ZX)
			if("Rejuvenescer")
				if(!M.client||!src.client)
					return

				if(prob(2))
					M<<"[src] dá-se o seu chakra para curar você!"
				src<<"Você da seu chakra para curar [M]!"
				var/VitHeal=src.AkametsukiMastery/5
				var/StamHeal=src.AkametsukiMastery/2
				if(VitHeal>50)
					VitHeal=50
				if(StamHeal>100)
					StamHeal=100
				M.health+=(VitHeal*num)
				M.stamina+=(StamHeal*num)
				if(M.health>=M.maxhealth)
					M.health=M.maxhealth
				if(M.stamina>=M.maxstamina)
					M.stamina=M.maxstamina
				if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath)
					M.Dead=0
					M.icon_state=""
					M.FrozenBind=""
					M.sight&=~(SEE_SELF|BLIND)
					orange(12,M)<<"<font size = 2>[M] Foi revivido!</font>"
			if("Queimar")
				//src.ChakraDrain(1000)
				if(M.knockedout||M.ImmuneToDeath)
					return
				var/image/A=image('Icons/Jutsus/GenjutsuTechniques.dmi',M);
				A.icon_state="Fire"
				M<<A
				spawn(10)
					del(A)
				M.stamina-=50*num
				M.Status="Burn";
				M.StatusEffected=min((src.ParticleUsage*10)*num,30)
			//Tier 2
			if("Miragem")
				if(M.knockedout||M.ImmuneToDeath)
					return
				var/Dur=round(src.ParticleUsage/3)
				var/Str=round(src.AkametsukiMastery/100)
				if(Dur<10)
					Dur=10
				if(Dur>50)
					Dur=50
				if(Str>7)
					Str=7
				Dur=round(Dur*num)
				Str=round(Str*num)
				if(Type == "Field" && Dur>1)
					Dur=10
				spawn()
					Quake_Effect(M,Dur,Str)
				while(Dur>0 && !M.Guarding)
					M.stamina-=(10*Str);
					Dur--
					sleep(10)
			if("Drenamento de Chakra")
				if(M.knockedout||M.ImmuneToDeath)
					return
				var/Damage=src.AkametsukiMastery/2
				if(Damage>275)
					Damage=275
				if(M.chakra>M.Mchakra*0.25)
					M.chakra-=Damage*num
			//Tier 3
			if("Donjutsu Contra")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(M.shari)
					M.Sharingan()
					for(var/obj/SkillCards/Sharingan/S in M.LearnedJutsus)
						S.DelayIt(150,M,"Clan")
				if(M.bya)
					M.ByakuganOn()
					for(var/obj/SkillCards/Byakugan/S in M.LearnedJutsus)
						S.DelayIt(150,M,"Clan")
				if(M.Majest)
					M.MajesticEyes()
					for(var/obj/SkillCards/MajesticEyes/S in M.LearnedJutsus)
						S.DelayIt(150,M,"Clan")
				if(M.Akametsuki && M.AkametsukiMastery < src.AkametsukiMastery-100)
					M.Akametsuki()
					for(var/obj/SkillCards/Akametsuki/S in M.LearnedJutsus)
						S.DelayIt(150,M,"Clan")
			if("Anorexia")
				var/Ano=src.AkametsukiMastery/10
				if(Ano>50)
					Ano=50
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(M.calories>0)
					var/CalDrain=(50*(src.AkametsukiMastery/100))
					M.calories-=(CalDrain*num)
					if(M.calories<0)
						M.calories=0
				M.stamina-=((Ano)*num)
				M.hunger+=round(rand(2,5)*num);
				M.thirst+=round(rand(2,5)*num)
				if(prob((Akametsuki/100)*num))
					M.Bloody();
					M.Bloody();
					M.Bloody();
					M.health-=40
			if("Restaurar Chakra")
				if(M.knockedout||M.ImmuneToDeath)
					return
				var/Cmax=max((M.Mchakra*(src.AkametsukiMastery/100)*num),M.Mchakra)
				if(M.chakra<Cmax)
					var/ReZ=(src.AkametsukiMastery/5*num);
					M.chakra+=ReZ
					if(M.chakra>M.Mchakra*0.75)
						M.chakra=M.Mchakra*0.75
			//Tier 4
			if("Visão Turva")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(Type!="Field")
					var/Dur=(src.AkametsukiMastery/30)
					if(Dur>15)//Was 30
						Dur=15
					while((Dur*num)>0)
						if(prob(40))
							M.client:dir=pick(NORTH,SOUTH,WEST,EAST);
						Dur--
						M.stamina-=10;//Was 50
						sleep(10)
					M.client:dir=NORTH
				else
					if(prob(70)) M.client:dir=pick(NORTH,SOUTH,WEST,EAST)
					M.stamina-=30
					while(src)
					sleep(10)
					M.client:dir=NORTH
			if("Energia")
				if(M.knockedout||M.ImmuneToDeath)
					return
				var/Damage=src.AkametsukiMastery/5
				if(Damage>200)//Was 500
					Damage=200
				Damage += rand(-100,100)
				if(prob(10))
					M<<"Você se sente uma onda de cansaço apoderou-se de você"
				M.DamageProc(Damage,"Stamina",src)
			if("Absorvção Reserva")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(M.ChakraPool>0 && src.ChakraPool<src.MaxChakraPool && M.client)
					var/Drain = (src.AkametsukiMastery*2*num)
					if(src.ChakraPool+Drain>src.MaxChakraPool)
						Drain-=((src.ChakraPool+Drain)-src.MaxChakraPool)	//Subtract by the difference so it doesn't overcap.
					if(M.ChakraPool-Drain<0)
						Drain+=(M.ChakraPool-Drain)	//"Add" the negative, to reduce the drain, so their res doesn't plung into negative.
					src.ChakraPool+=Drain;
					M.ChakraPool-=Drain
			//Tier 5
			if("Atordoamento")
				if(M.knockedout||M.ImmuneToDeath)
					return
				M.Stun+=round((src.AkametsukiMastery/40)*num,5)
				if(M.Stun>30)
					M.Stun=30
				if(prob((src.AkametsukiMastery/40)*num))
					M.Running=0
			if("Vitalidade")
				if(M.knockedout||M.ImmuneToDeath)
					return
				var/Damage=src.AkametsukiMastery/2
				if(Damage>150)
					Damage=150
				M.Bloody();
				M.DamageProc(Damage*num,"Health",src)
			if("Perturbação")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(O)
					if(istype(O,/obj/Jutsu/))
						del(O);return
				if(M.Rasenganon)
					M.RasenganD=0
				if(M.Chidorion||M.Raikirion)
					M.ChidoriD=0
			//Tier 6
			if("Dormir")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(!M.Dead && !M.knockedout && M.StruggleAgainstDeath<1 && M.Status!="Asleep")
					if(!M.AkaSleep)
						M << "Isso é..Estou  me sentindo cansado.... sonolento"
					M.AkaSleep++
					spawn(50)
						M.AkaSleep--
					if(M.Status!="Asleep" && M.AkaSleep > 15)
						M<<"Seu corpo foi completamente Adormecido!"
						M.Status="Asleep"
						M.StatusEffected=(min(src.AkametsukiMastery/10,30))*num
						M.AkaSleep = 0
					//Sleep particles have to build up.
					//you have to reach 15 "hits" in 5 seconds, in order to pass out.
			if("Absorvção de Vida")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(M.health>0&&src.health<src.maxhealth)
					var/Drain = min(src.AkametsukiMastery/5,350)*num
					if(src.health+Drain>src.maxhealth)
						Drain-=((src.health+Drain)-src.maxhealth)
					if(M.health-Drain<0)
						Drain+=(M.health-Drain)
					M.health-=Drain;src.health+=Drain
				if(M.stamina>0&&src.stamina<src.maxstamina)
					var/Drain = min(src.AkametsukiMastery/2,500)*num
					if(src.stamina+Drain>src.maxstamina)
						Drain-=((src.stamina+Drain)-src.maxstamina)
					if(M.stamina-Drain<0)
						Drain+=(M.stamina-Drain)
					M.stamina-=Drain;src.stamina+=Drain
				if(M.ChakraPool>0&&src.ChakraPool<src.MaxChakraPool)
					var/Drain = (src.AkametsukiMastery*2*num)
					if(src.ChakraPool+Drain>src.MaxChakraPool)
						Drain-=((src.ChakraPool+Drain)-src.MaxChakraPool)	//Subtract by the difference so it doesn't overcap.
					if(M.ChakraPool-Drain<0)
						Drain+=(M.ChakraPool-Drain)	//"Add" the negative, to reduce the drain, so their res doesn't plung into negative.
					src.ChakraPool+=Drain;M.ChakraPool-=Drain
				if(src.deathcount>0)
					M.deathcount+=0.1;
					src.deathcount-=0.05
				M.Death(src)
			//Tier 7
			if("Constrangimento")			//Real stuff goes in the Regen proc ;o
				if(M.knockedout||M.ImmuneToDeath)
					return
				M.AkaConst += src
				M<<"Você foi constrangido por [src]!"
				src<<"[M] Foi contrangido por você!"
				spawn(600) M.AkaConst-=src
			if("Regeneração de Vida")
				if(M.knockedout||M.ImmuneToDeath)
					return
				if(M.health<M.maxhealth)
					var/Heal = min(src.AkametsukiMastery/5,350)*num
					if(M.health+Heal>M.maxhealth)
						Heal-=((src.health+Heal)-src.maxhealth)
					M.health+=Heal
				if(M.stamina<M.maxstamina)
					var/Heal = min(src.AkametsukiMastery/2,500)*num
					if(M.stamina+Heal>M.maxstamina)
						Heal-=((M.stamina+Heal)-M.maxstamina)
					M.stamina+=Heal
				if(M.ChakraPool>0&&src.ChakraPool<src.MaxChakraPool)
					var/Heal = (src.AkametsukiMastery*2*num)
					if(M.ChakraPool+Heal>M.MaxChakraPool)
						Heal-=((M.ChakraPool+Heal)-M.MaxChakraPool)	//Subtract by the difference so it doesn't overcap.
					M.ChakraPool+=Heal
				if(M.deathcount>0)
					M.deathcount-=0.1
					if(M.deathcount<0) M.deathcount=0
				if(M.StruggleAgainstDeath>0)
					M.Struggle += src.AkametsukiMastery*num
				if(M.client&&M.Dead&&M.health>=M.maxhealth/2)
					M.Dead=0
					M.icon_state=""
					M.FrozenBind=""
					M.sight&=~(SEE_SELF|BLIND)
					orange(12,M)<<"<font size = 2>[M] Foi revivido!</font>"



///////Kyomou NPCS

mob/Teachers/
	proc/AkametsukiTeacherCheck(mob/M)
		M<<"Ah yes, let's get started then, shall we?"
		var/list/A=M.LearnedJutsus
		if(!(locate(/obj/SkillCards/Akametsuki_Blind) in A)&&!(locate(/obj/SkillCards/Akametsuki_Burn) in A)&&!(locate(/obj/SkillCards/Akametsuki_Rejuvination) in A))
			M << "You must start with the basics of course."
			if(M.AkametsukiMastery<25)
				M<<"However, you do not posses the nescicary mastery to properly control your particles.";return
			M << "I however only am allowed to teach you one move. If you wish, the other proctors may teach you another move if you wish."
			if(src.name=="Kyomou, Gekido") M.LearnJutsu("Akametsuki Rejuvination",10000,"Akametsuki_Rejuvination","An ancient basic to the Kyomou's art of manipulating one's chakra in order to aid the body of another.","Ninjutsu")
			if(src.name=="Kyomou, Tokui") M.LearnJutsu("Akametsuki Blind",10000,"Akametsuki_Blind","This move blinds the enemy in red, and makes their focus much more difficult.","Ninjutsu")
			if(src.name=="Kyomou, Eien") M.LearnJutsu("Akametsuki Burn",10000,"Akametsuki_Burn","A slightly aggresive use of particles, the user causes the body of one's enemy to feel as if they are burning.","Ninjutsu")
			return
		else if(!(locate(/obj/SkillCards/Akametsuki_Clones) in A)&&!(locate(/obj/SkillCards/Akametsuki_Migrane) in A)&&!(locate(/obj/SkillCards/Akametsuki_Chakra_Drain) in A))
			M<<"Well, you're making progress."
			if(M.AkametsukiMastery<60)
				M<<"But not enough progress to learn the next tier of moves.";return
			if(src.name=="Kyomou, Tokui") M.LearnJutsu("Akametsuki Clones",15000,"Akametsuki_Clones","A simple move which creates a collection of illusionary clones, that are capable of fooling those with even the most keen sight.","Ninjutsu")
			if(src.name=="Kyomou, Eien") M.LearnJutsu("Akametsuki Migrane",15000,"Akametsuki_Migrane","The user utilizes the use of their particles to criple the mind of his enemies by causing painful mental damage.","Ninjutsu")
			if(src.name=="Kyomou, Gekido") M.LearnJutsu("Akametsuki Chakra Drain",15000,"Akametsuki_Chakra_Drain","A jutsu which uses particles that trick the body of the affected into leaking chakra..","Ninjutsu")
		else if(!(locate(/obj/SkillCards/Akametsuki_Doujutsu_Counter) in A)&&!(locate(/obj/SkillCards/Akametsuki_Anorexiation) in A)&&!(locate(/obj/SkillCards/Akametsuki_Chakra_Restore) in A))
			M<<"You've exceeded my expectations of your ability!"
			if(M.AkametsukiMastery<100)
				M<<"But you're not ready for the next step in our power!";return
			if(src.name=="Kyomou, Tokui") M.LearnJutsu("Akametsuki Doujutsu Counter",20000,"Akametsuki_Doujutsu_Counter","One of the Kyomou Clan's most faimed abilities! This technique will allow your particles to disable the use of Doujutsus from an enemy!","Ninjutsu")
			if(src.name=="Kyomou, Eien") M.LearnJutsu("Akametsuki Anorexiation",20000,"Akametsuki_Anorexiation","This causes the body of the affected to reject calories and nutrients, breaking itself down. It's possible to even cause an auto-immune response.","Ninjutsu")
			if(src.name=="Kyomou, Gekido") M.LearnJutsu("Akametsuki Chakra Restore",20000,"Akametsuki_Chakra_Restore","A jutsu which uses particles that trick the body of the affected mass producing chakra for itself.","Ninjutsu")
		else if(!(locate(/obj/SkillCards/Akametsuki_Daze) in A)&&!(locate(/obj/SkillCards/Akametsuki_Stamina_Damage) in A)&&!(locate(/obj/SkillCards/Akametsuki_Reservoir_Absorbtion) in A))
			M<<"You've exceeded my expectations of your ability!"
			if(M.AkametsukiMastery<150)
				M<<"But you're not ready for the next step in our power!";return
			if(src.name=="Kyomou, Tokui") M.LearnJutsu("Akametsuki Daze",20000,"Akametsuki_Daze","This particle effect disorients the affected.","Ninjutsu")
			if(src.name=="Kyomou, Eien") M.LearnJutsu("Akametsuki Stamina Damage",20000,"Akametsuki_Stamina_Damage","Causes a ninja to become exhausted, and lose the energy to fight.","Ninjutsu")
			if(src.name=="Kyomou, Gekido") M.LearnJutsu("Akametsuki Reservoir Absorbtion",20000,"Akametsuki_Reservoir_Absorbtion","Attacks one the their reserve of chakra, indirectly impeding their ability to fight.","Ninjutsu")

		else
			M << "Sorry, we don't have anything to teach you at the moment..."
			return
	//	else if(!(locate(/obg/Skillcards/) in A)&&!(locate(/obg/Skillcards/) in A)&&!(locate(/obg/Skillcards/) in A))
	//	else if(!(locate(/obg/Skillcards/) in A)&&!(locate(/obg/Skillcards/) in A)&&!(locate(/obg/Skillcards/) in A))
	//	else if(!(locate(/obg/Skillcards/) in A)&&!(locate(/obg/Skillcards/) in A)&&!(locate(/obg/Skillcards/) in A))

	KyomouTeacher1
		name = "Kyomou, Gekido"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		Village="Rain"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/KakashiH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(220,220,220)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi' + rgb(200,0,0)
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi' + rgb(200,0,0)
				src.overlays+='Icons/New Base/Clothing/cloak3.dmi' + rgb(200,0,0)
				src.overlays+='Icons/New Base/Clothing/Headbands/HeadbandNeck.dmi' + rgb(200,0,0)
				src.overlays-=Hair
				src.overlays+=Hair

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			sleep(3)
			var/Options = list("Tell me about the clan.")
			if(usr.Clan=="Kyomou")
				Options += "I'm a Kyomou too! Teach me!"
			switch(input(usr,"Hello, what can I do for you?", "Kyomou, Gekido") in Options)
				if("Tell me about the clan.")
					var/style = "<style>BODY {margin:0;font:arial;background:black;color:white;}</style>"
					sd_Alert(usr, "Ah, well the history of the clan goes back generations. But according to history it all started with a little boy named Ranmaru. He never knew his parents, but when he grew up, he went to the Hidden Mist Village to become a Ninja.<br>Everything else is a bit fuzy though.","[src]",,,,0,"400x150",,style)
				if("I'm a Kyomou too! Teach me!")
					if(!(locate(/obj/SkillCards/Particle_Field) in usr.LearnedJutsus))
						alert("Good for you. But remember that there is a number of things I can teach you. We'll start small though.")
						switch(input("What would you like to learn?") in list("Teach me to create Particle Fields","Teach me to control my particles","Nevermind"))
							if("Teach me to create Particle Fields")
								if(!(locate(/obj/SkillCards/Particle_Waves) in usr.LearnedJutsus))
									//If you haven't learned any other particle method, you get it free!
									var/obj/SkillCards/Particle_Field/P = new();usr.LearnedJutsus += P
									usr << "Very well. Here you go."
									return
								else
									usr.LearnJutsu("Particle Field",20000,"Particle_Field","Allows you to create a field of particles that expand out from you.","Ninjutsu")
									return
							if("Nevermind")
								return
							else
								src.AkametsukiTeacherCheck(usr)
					else
						src.AkametsukiTeacherCheck(usr)

	KyomouTeacher2
		name = "Kyomou, Eien"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		Village="Rain"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/KakashiH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(200,0,0)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi' + rgb(200,0,0)
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi' + rgb(200,0,0)
				src.overlays-=Hair
				src.overlays+=Hair

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			sleep(3)
			var/Options = list("Tell me about the clan.")
			if(usr.Clan=="Kyomou")
				Options += "I'm a Kyomou too! Teach me!"
			switch(input(usr,"Hello, what can I do for you?", "Kyomou, Gekido") in Options)
				if("Tell me about the clan.")
					var/style = "<style>BODY {margin:0;font:arial;background:black;color:white;}</style>"
					sd_Alert(usr, "Hmm, I really don't know too much about the clan. I'm more of a man of action, than a historian anyways. I DO know that the Kyomou clan has always had a relatively low population. I kinda like it that way.","[src]",,,,0,"400x150",,style)
				if("I'm a Kyomou too! Teach me!")
					src.AkametsukiTeacherCheck(usr)

	KyomouTeacher3
		name = "Kyomou, Tokui"
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		Village="Rain"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/MinatoH.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi' + rgb(200,0,0)
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/BaggyPants.dmi'
				src.overlays+='Icons/New Base/Clothing/cloak3.dmi'
				src.overlays+='Icons/New Base/Clothing/Headbands/HeadbandNeck.dmi' + rgb(200,200,200)
				src.overlays-=Hair
				src.overlays+=Hair

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			sleep(3)
			var/Options = list("Tell me about the clan.")
			var/style = "<style>BODY {margin:0;font:arial;background:black;color:white;}</style>"
			if(usr.Clan=="Kyomou")
				Options += "I'm a Kyomou too! Teach me!"
			switch(input(usr,"Hello, what can I do for you?", "Kyomou, Gekido") in Options)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;xolor:white;}</style>"
				if("Tell me about the clan.")
					sd_Alert(usr, "The Kyomou clan is by many considered the scorn of the Doujutsu, as we have the power to decieve those who believe their eyes to see all.","[src]",,,,0,"400x150",,style)
				if("I'm a Kyomou too! Teach me!")
					if(!(locate(/obj/SkillCards/Particle_Waves) in usr.LearnedJutsus) || ( !(locate(/obj/SkillCards/Particle_Bullet) in usr.LearnedJutsus) && usr.AkametsukiMastery >= 60))
						alert("Ah, that is good news. It seems I have a few things to teach you...")
						switch(input("What would you like to learn?") in list("Teach me to create Particle [usr.AkametsukiMastery>=60?(!(locate(/obj/SkillCards/Particle_Waves) in usr.LearnedJutsus)?"Waves":"Bullets"):"Waves"]","Teach me to control my particles","Nevermind"))
							if("Teach me to create Particle Waves")
								if(!(locate(/obj/SkillCards/Particle_Field) in usr.LearnedJutsus))
									//If you haven't learned any other particle method, you get it free!
									var/obj/SkillCards/Particle_Waves/P = new();usr.LearnedJutsus += P
									usr << "Very well. Here you go."
									return
								else
									usr.LearnJutsu("Particle Waves",20000,"Particle_Waves","Allows you to shape your particles into a series of waves.","Ninjutsu")
									return
							if("Teach me to create Particle Bullets")
								usr.LearnJutsu("Particle Bullet",20000,"Particle_Bullet","Allows you to concentrate your particles into a speeding bullet.","Ninjutsu")
								return
							if("Nevermind")
								return
							else
								src.AkametsukiTeacherCheck(usr)
					else
						src.AkametsukiTeacherCheck(usr)











mob/proc/OneEyeAkametsuki()
	if(src.Akametsuki>=1)
		src.Akametsuki=0
		src.see_invisible=1
		src<<"You cover up your Akametsuki, stopping its abilities."
		src.overlays-='Icons/Jutsus/sharinganthing.dmi';src.overlays-='Icons/Jutsus/SEye.dmi'
	//	src.verbs-=/mob/Kyomou/verb/AkametsukiBlind;src.verbs-=/mob/Kyomou/verb/AkametsukiSearch;src.verbs-=/mob/Kyomou/verb/Rejuvanate
	else
		src.Akametsuki=1
		src.verbs+=/mob/Kyomou/verb/AkametsukiSearch
		if(src.AkametsukiMastery>20)
			src.Akametsuki=2
		if(src.AkametsukiMastery>30)
			src.Akametsuki=3
		if(src.AkametsukiMastery>50)
			src.verbs+=/mob/Kyomou/verb/Rejuvanate
		if(src.AkametsukiMastery>55)
			src.verbs+=/mob/Kyomou/verb/AkametsukiBlind
		if(src.AkametsukiMastery>100)
			for(var/mob/M in view(src))
				if(M.shari)
					M<<"You Sharingan was disactivated!?"
					M.overlays-='Icons/Jutsus/sharinganthing.dmi';M.overlays-='Icons/Jutsus/SEyes.dmi'
					M.shari=0;M.SharCounter=0;M.CopyMode=0;M.IlluminateOff()
				if(M.bya)
					M<<"You Byakugan was disactivated!?"
					M.overlays-='Icons/Jutsus/BEyes.dmi';M.overlays-='Icons/Jutsus/BEyes.dmi'
					M.bya=0;M.see_invisible=1
				if(M.Akametsuki>=1)
					if(M.AkametsukiMastery*2<src.AkametsukiMastery)
						M<<"A doujutsu like yours has been activated, its power so tremendous it disactivated yours!"
						M.Akametsuki=0;M.see_invisible=1;M.overlays-='Icons/Jutsus/SEyes.dmi'
						M.verbs-=/mob/Kyomou/verb/AkametsukiBlind;M.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
		src<<"You activate Akametsuki!"
		src.overlays-='Icons/Jutsus/SEyes.dmi';src.overlays+='Icons/Jutsus/SEyes.dmi'
		src.see_invisible=99
		while(src.Akametsuki>=1)
			var/A=src.AkametsukiMastery
			if(A<1) A=1
			var/ChakraDrain=(src.Mchakra/(A*15))
			if(ChakraDrain>100)
				ChakraDrain=100
			src.chakra-=ChakraDrain
			if(prob(1))
				src.AkametsukiMastery+=pick(0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1)
			if(src.AkametsukiMastery>=100)
				for(var/mob/M in view(src))
					if(M.shari)
						M<<"You Sharingan was deactivated!?"
						M.overlays-='Icons/Jutsus/sharinganthing.dmi';M.overlays-='Icons/Jutsus/SEyes.dmi'
						M.shari=0;M.SharCounter=0;M.CopyMode=0;M.IlluminateOff()
					if(M.bya)
						M<<"You Byakugan was deactivated!?"
						M.overlays-='Icons/Jutsus/BEyes.dmi';M.overlays-='Icons/Jutsus/BEyes.dmi'
						M.bya=0;M.see_invisible=1
					if(M.Akametsuki>=1)
						if(M.AkametsukiMastery*2<src.AkametsukiMastery)
							M<<"A doujutsu like yours has been activated, its power so tremendous it disactivated yours!"
							M.Akametsuki=0;M.see_invisible=1;M.overlays-='Icons/Jutsus/SEyes.dmi'
							M.verbs-=/mob/Kyomou/verb/AkametsukiBlind;M.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
			sleep(50)
mob/proc/GoldenIlluminate()
	if(!src.shari)
		src<<"You need Majestic Eyes on!";return
	else
		src<<"You focus your eyes to see chakra."
		src.IlluminateOff()
		src.ChakraSight(0)
		src.Illuminate()
		src.ChakraSight(1)

mob/proc/MajesticEyes()
	if(src.Majest)
		src<<"You release your Majestic Eyes.";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.Majest=0;src.ChakraSight(0);
		src.nin=src.Mnin;src.tai=src.Mtai;src.gen=src.Mgen;src.GenjutsuCounterMode=0
		for(var/obj/SkillCards/MajesticIlluminate/Z in usr.LearnedJutsus)
			del(Z)
		return
	else
		usr.ChangeEyeStyle(usr.EyeStyle,255,215,0)
		if(src.MajesticMastery<1)
			src.Mchakra+=rand(3000,6000);src.chakra=src.Mchakra;src.MajesticMastery=1
			src << "<b><font color=#FFD700>Your eyes pulsate!</font></b>"
		if(src.MajesticMastery<200)
			view()<<"[src]'s eyes turn gold, revealing 1 ring around the pupil!"
		else if(src.MajesticMastery>=200&&src.MajesticMastery>100)
			view()<<"[src]'s eyes turn gold, revealing 2 rings around the pupil!"
		else if(src.MajesticMastery>=300)
			view()<<"[src]'s eyes turn gold, revealing 3 rings around the pupil!"
		src.Majest=1;src.ChakraSight(1)
		src.nin=src.Mnin*1.1
		src.tai=src.Mtai*1.1
		src.gen=src.Mgen*1.1
		src.LearnedJutsus+=new/obj/SkillCards/MajesticIlluminate
		if(src.MajesticMastery>=500)
			view()<<"[src]'s eyes turn pure gold, piercing your very soul!"
			src.nin=src.Mnin*1.38
			src.tai=src.Mtai*1.22
			src.gen=src.Mgen*1.35
		while(src.Majest)
			var/A=src.MajesticMastery
			if(A<1) A=1
			if(A>200) src.GenjutsuCounterMode=1
			var/ChakraDrain=(src.Mchakra/(A*15))
			if(ChakraDrain>65) ChakraDrain=65
			if(ChakraDrain<5) ChakraDrain=5
			if(A>=500) ChakraDrain=0
			src.chakra-=ChakraDrain
			if(prob(1))
				src.MajesticMastery +=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
			if(src.Charging&&prob(3))
				src.MajesticMastery +=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
			sleep(25)







mob/Kyomou/verb/Rejuvanate()
	set category = "Doujutsu"
	set name = "Rejuvination"
	if(src.Rejuvination)
		return
	if(src.Akametsuki<1)
		src<<"You need to have Akametsuki on!";return
	else
		src.Rejuvination=1;spawn(10) src.Rejuvination=0
		for(var/mob/M in get_step(src,src.dir))
			if(!M.client||!src.client)
				return
			src.chakra-=100
			M<<"[usr] gives up their chakra to heal you!"
			usr<<"You give up your chakra to heal [M]!"
			M.health+=100;M.stamina+=100
			if(M.health>=M.maxhealth)
				M.health=M.maxhealth
			if(M.stamina>=M.maxstamina)
				M.stamina=M.maxstamina
			if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath)
				M.Dead=0
				M.icon_state=""
				M.FrozenBind=""
				M.sight&=~(SEE_SELF|BLIND)
				orange(12,M)<<"<font size = 2>[M] was revived from the brink of death!</font>"

			return






mob/Kyomou/verb/AkametsukiBlind()
	set name="Akametsuki Blind"
	set category="Doujutsu"
	if(usr.AkametsukiBlind)
		return
	usr.Target()
	if(usr.ntarget)
		return
	var/mob/M=src.target
	if(!M.client)
		return
	if(M.Majest)

		src<<"A strange power overwhelms your eyes! Its power so tremendous it disactivated your Akametsuki!"
		src.Akametsuki=0;src.see_invisible=1;src.overlays-='Icons/Jutsus/SEyes.dmi'
		src.verbs-=/mob/Kyomou/verb/AkametsukiBlind;src.verbs-=/mob/Kyomou/verb/AkametsukiSearch;M.verbs-=/mob/Kyomou/verb/Rejuvanate
	for(var/obj/Makam/X in M.client.screen)
		del(X)
	var/obj/Makam/MM=new()
	M.client.screen+=MM
	usr.ChakraDrain(25000)
	usr<<"You blind [M] with a red vision!"
	if(usr.AkametsukiMastery>100)
		MM.icon_state="strong"
	usr.AkametsukiBlind=1;spawn(900)
		usr.AkametsukiBlind=0
	var/Z=usr.AkametsukiMastery*10
	if(Z>300)
		Z=300
	spawn(Z)
		for(var/obj/Makam/ZX in M.client.screen)
			del(ZX)




mob/Kyomou/verb/AkametsukiSearchOriginal()
	return
	/*
	set name="Akametsuki Search"
	set category="Doujutsu"
	if(usr.AkametsukiTrack)
		usr.AkametsukiTrack=0
		usr.firing=0
		usr.controlled=null
		usr.client.perspective=MOB_PERSPECTIVE
		usr.client.eye=usr
		for(var/mob/Kyomou/AkametsukiTrack/P in world) if(P.Owner == usr) del(P)
	else
		usr.firing=1
		var/mob/Kyomou/AkametsukiTrack/P=new()
		P.loc=locate(usr.x-1,usr.y,usr.z)
		P.Owner=usr
		usr.controlled = P
		usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
		usr.client.eye = P
		usr.AkametsukiTrack=1
		*/