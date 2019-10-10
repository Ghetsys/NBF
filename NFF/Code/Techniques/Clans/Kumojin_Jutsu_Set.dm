mob/var/tmp
	SpiderNPC=0
	NenkinOn=0
	Kumosenkyuu=0
	ImmuneToWebs=0
	Webdelay=0
	MazeG=0

mob/proc
	RemoveImmunityToWebs()
		spawn(75)
			if(src.ImmuneToWebs)
				src.ImmuneToWebs=0
obj/Jutsu/Spider
	icon='Icons/Jutsus/SpiderTechniques.dmi'
	webshot
		icon_state="Shot"
		density=1
		layer = 4
		New()
			..()
			spawn(10)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				if(M==src.Owner)
					return
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/obj/Jutsu/Spider/web/K=new();K.loc=src.loc;K.Owner=src.Owner
			..()
	web
		icon_state="5"
		layer=TURF_LAYER+1
		density=0
		var/list/CaptureList=list()
		var/StruggleOutofWebs=35
		var/CanBind=1
		Owner
		New()
			..()
			overlays+=/obj/Jutsu/Spider/web/A;overlays+=/obj/Jutsu/Spider/web/B;overlays+=/obj/Jutsu/Spider/web/C;overlays+=/obj/Jutsu/Spider/web/D
			overlays+=/obj/Jutsu/Spider/web/E;overlays+=/obj/Jutsu/Spider/web/F;overlays+=/obj/Jutsu/Spider/web/G;overlays+=/obj/Jutsu/Spider/web/H
			spawn()
				while(src)
					sleep(1)
					for(var/mob/M in oview(1,src))
						var/mob/O=src.Owner
						if(M!=O&&CanBind==1)
							if(!M.knockedout&&!M.ImmuneToDeath&&M.FrozenBind==""&&!M.ImmuneToWebs)
								M.FrozenBind="Spider Web"
								M<<"Você foi paralizado pelas teias! segure a barra de espaço para sair da teia!"
								M.Struggle=0
								src.CaptureList.Add(M)
							if(M in src.CaptureList)
								if(M.Struggle>(src.StruggleOutofWebs*1.5))
									src.CaptureList.Remove(M)
									M.ImmuneToWebs=1
									if(M.FrozenBind=="Spider Web")
										M.FrozenBind=""
									M.RemoveImmunityToWebs()
									M<<"Você esta livre das teias!"
				//	for(var/obj/Jutsu/Spider/kunai/A in oview(1,src))
				//		walk(A,0)
				//	for(var/obj/Jutsu/Spider/arrow/A in oview(1,src))
				//		walk(A,0)
			spawn(300)
				del(src)
		Click()
			var/mob/O=src.Owner
			if(src.CanBind==0&&O.Webdelay==0)
				src.CanBind=1;
				O.Webdelay=300
			..()
		Del()
			var/mob/O=src.Owner
			O.MazeG=0;
			for(var/mob/M in src.CaptureList)
				src.CaptureList.Remove(M)
				if(M.FrozenBind=="Spider Web")
					M.FrozenBind=""
				M.ImmuneToWebs=1;M.RemoveImmunityToWebs()
			for(var/obj/Jutsu/Spider/kunai/A in oview(1,src))
				walk(A,A.dir)
			for(var/obj/Jutsu/Spider/arrow/A in oview(1,src))
				walk(A,A.dir)
			..()
		A
			icon_state="1"
			pixel_x = -32
			pixel_y = 32
		B
			icon_state="5"
			pixel_y = 32
		C
			icon_state="3"
			pixel_x = 32
			pixel_y = 32
		D
			icon_state="5"
			pixel_x = -32
		E
			icon_state="5"
			pixel_x = 32
		F
			icon_state="7"
			pixel_x = -32
			pixel_y = -32
		G
			icon_state="5"
			pixel_y = -32
		H
			icon_state="8"
			pixel_x = 32
			pixel_y = -32
	Kumosouiki
		icon_state="Souki"
		density=0
		layer=TURF_LAYER+1
		New()
			spawn()
				while(src)
					sleep(1)
					for(var/mob/M in src.loc)
						var/mob/O=src.Owner
						if(M==O)
							return
						else
							O<<"[M] tocou a teia de aranha [src.x],[src.y],[src.z]."
					sleep(11)
			spawn(6000)
				del(src)
	kunai
		icon_state = "NenkinKunai"
		density = 1
		var/Exploding=0
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				var/ArmorAddUpForM=0
				for(var/obj/Clothes/Headband/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUArmor/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				for(var/obj/Clothes/ANBUHandGuards/CA in M.contents)
					if(CA.worn)
						ArmorAddUpForM+=CA.ArmorAddOn
				if(prob(ArmorAddUpForM/2))
					view(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir);M.Deflection=0;sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.Deflection)
					view(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir);M.Deflection=0;sleep(5)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.sphere)
					src.loc=M.loc
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					del(src)
				if(M.Kaiten)
					walk(src,0);src.dir = turn(src.dir,45);walk(src,src.dir,0);return
				if(M.sphere)
					return
				var/percentile=O.GoldenSpike*0.01
				var/damage=(M.maxhealth*0.05)+(M.maxhealth*percentile)
				if(prob(src.Percision*3))
					M.DamageProc(damage*2,"Health",O)
					view(M)<<"[M] foi acertado pela kunai de [O]'s Tirando [damage] de dano!!"
					view(M)<<sound('SFX/Slice.wav',0)
					M.Bloody()
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					if(prob(4))
						return
				else
					M.DamageProc(damage,"Health",O)
					view(M)<<"[M] foi acertado pela kunai de [O]'s Tirando [damage] de dano!!"
					view(M)<<sound('SFX/Slice.wav',0)
					M.Bloody()
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc
					if(prob(2))
						return
				del(src)
			if(istype(A,/obj/WEAPONS))
				//var/obj/W = A
				src.dir=turn(src.dir,pick(45,-45))
				sleep(6)
				if(src.Exploding)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=src.Owner
				del(src)
			if(istype(A,/obj/Jutsu/Elemental))
				//var/obj/W = A
				if(src.Exploding)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=src.Owner
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					if(src.Exploding)
						var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=src.Owner
					del(src)
	arrow
		icon_state="arrow"
		density = 1
		layer = MOB_LAYER+999999999
		New()
			..()
			spawn(25)
				del(src)
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				if(M.Deflection)
					view(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir);M.Deflection=0
				if(M.sphere)
					src.loc=M.loc;del(src)
				if(M.Kaiten)
					walk(src,0)
					src.dir = turn(src.dir,pick(45,-45))
					walk(src,src.dir,0)
					return
				if(M.sphere)
					return
				var/percentile=O.GoldenSpike*0.02
				var/damage=(M.maxhealth*0.25)+(M.maxhealth*percentile)
				if(prob(src.Percision*3))
					M.DamageProc(damage*2,"Health",O)
					view(M)<<"[M] foi acertado pela Flecha de [O]'s Tirando [damage] de dano!!"
					view(M)<<sound('SFX/Slice.wav',0)
					spawn() M.Bloody();M.Bloody();M.Bloody()
				else
					M.DamageProc(damage,"Health",O)
					view(M)<<"[M] foi acertado pela Flecha de [O]'s Tirando [damage] de dano!!"
					view(M)<<sound('SFX/Slice.wav',0)
					spawn() M.Bloody();M.Bloody();M.Bloody()
				src.loc=M.loc
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
	ArcherArrow
		icon_state="arrow"
		density = 1
		layer = MOB_LAYER+999999999
		Move_Delay=3//was 4
		var/SuperSpeed=0
		var/ArrowStrength=0

		New()
			..()
			spawn(25)
				del(src)
		Bump(A)
			..()
			var/mob/O = src.Owner
			if(ismob(A))
				var/mob/M = A
				if(M.Deflection)
					view(M)<<sound('SFX/SwordClash.wav',0);src.dir=turn(src.dir,45);walk(src,src.dir);M.Deflection=0
				if(M.sphere)
					src.loc=M.loc;del(src)
				if(M.Kaiten)
					walk(src,0)
					src.dir = turn(src.dir,pick(45,-45))
					walk(src,src.dir,0)
					return
				if(M.sphere)
					return
			//	var/percentile=0.05
				var/damage=(150*(ArrowStrength/1.5))
				if(prob(src.Percision*3))
					M.DamageProc(damage*2,"Health",O)
					view(M)<<"[M] foi acertado pela Flecha de [O]'s Tirando [damage] de dano!!"
					view(M)<<sound('SFX/Slice.wav',0)
					spawn()
						M.Bloody()
						M.Bloody()
						M.Bloody()
				else
					M.DamageProc(damage,"Health",O)
					view(M)<<"[M] foi acertado pela Flecha de [O]'s Tirando [damage] de dano!!"
					view(M)<<sound('SFX/Slice.wav',0)
					spawn() M.Bloody();M.Bloody();M.Bloody()
				src.loc=M.loc
				step(M,src.dir)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
	bow
		icon='Icons/Jutsus/SpiderTechniques.dmi'
		icon_state="Warbow"
		density = 0
		layer = MOB_LAYER+999999999
	bowU
		icon='Icons/Jutsus/bow underlay.dmi'
		icon_state="Warbow"
		density = 0
		layer = OBJ_LAYER
mob/NPC
	KumojinSpider
		name="Kumo Spider(NPC)"
		icon='Icons/NPCs/Spider.dmi'
		icon_state=""
		health=1000
		stamina=1000
		chakra=1000
		SpiderNPC=1
		CNNPC=0
		Move()
			if(src.Frozen||src.FrozenBind!="")
				if(src.FrozenBind=="Spider Web")
					src.FrozenBind=""
					src.FrozenBindedBy=""
					return 1
				else
					return 0
			..()
		Bump(mob/M)
			..()
			if(istype(M,/mob/))
				if(M==Owner||M.name==src.name)
					return
				else
					if(src.AttackDelay)
						return
					if(M.knockedout)
						walk(src,0);
						return
					if(prob(20))
						if(M.knockedout||M.ImmuneToDeath)
							return
					//	world<<"Web has been set!"
						src.AttackDelay=1
						flick("Attack",src);
						var/obj/Jutsu/Spider/webshot/A=new();A.Owner=src.Owner
						A.loc=M.loc
						spawn(60-src.Swift)
							src.AttackDelay=0
							return
					src.AttackDelay=1;
					flick("Attack",src);
					src.Attacking(M,1)
					if(prob(src.DoubleStrike*10))
						src.Attacking(M,1)
					sleep(11-src.Swift);
					src.AttackDelay=0;
					return
	KumojinSpider
		name="Kumo Spider(NPC)"
		icon='Icons/NPCs/Spider.dmi'
		icon_state=""
		health=1000
		stamina=1000
		chakra=1000
		SpiderNPC=1
		CNNPC=0
		Move()
			if(src.Frozen||src.FrozenBind!="")
				if(src.FrozenBind=="Spider Web")
					src.FrozenBind=""
					src.FrozenBindedBy=""
					return 1
				else
					return 0
			..()
		Bump(mob/M)
			..()
			if(istype(M,/mob/))
				if(M==Owner||M.name==src.name)
					return
				else
					if(src.AttackDelay)
						return
					if(M.knockedout)
						walk(src,0);return
					if(prob(20))
						if(M.knockedout||M.ImmuneToDeath)
							return
					//	world<<"Web has been set!"
						src.AttackDelay=1
						flick("Attack",src);
						var/obj/Jutsu/Spider/webshot/A=new();A.Owner=src.Owner
						A.loc=M.loc
						spawn(60-src.Swift)
							src.AttackDelay=0
							return
					src.AttackDelay=1;flick("Attack",src);src.Attacking(M,1)
					if(prob(src.DoubleStrike*10))
						src.Attacking(M,1)
					sleep(11-src.Swift);src.AttackDelay=0;return
mob/proc
	SpiderSummon()
		if(src.Status=="Asleep"||src.intank||src.Guarding||src.DoingHandseals||src.doingG||src.Kaiten||src.resting||src.meditating||src.sphere||src.ingat||src.firing||src.FrozenBind!=""&&src.FrozenBind!="Spider Web"||src.doingG||src.Chidorion||src.Rasenganon)
			return
		src.icon_state="handseal"
		src.ChakraDrain(30000-(src.SpiderMastery*100))
		spawn(10)
			var/obj/SmokeCloud/S=new();S.loc=src.loc
			var/mob/NPC/KumojinSpider/A=new();A.loc=src.loc;A.Owner=src;A.tai=src.SpiderMastery*3;src.icon_state=""
	Kumosouiki()
		if(src.firing||src.Kaiten)
			return
		else
			var/ChakraLoss=10
			src.chakra-=ChakraLoss
			src<<"Você coloca-se uma teia de aranha, se alguem tocá-la irá alertá-lo automaticamente."
	KumoshibariZ()
		if(src.firing||src.Kaiten)
			return
		else
			src.ChakraDrain(5000);var/obj/Jutsu/Spider/webshot/K=new();K.name="[src]";K.loc=locate(src.x,src.y,src.z);K.dir=src.dir;K.Owner=src;K.JutsuLevel=1;walk(K,src.dir)

	DaiKumoshibariZ()
		//var/X=1
		if(src.firing||src.Kaiten)
			return
		else
			src.ChakraDrain(22500);
			/*for(X<=8)
				var/obj/Jutsu/Spider/webshot/K=new();K.name="[src]";K.loc=locate(src.x,src.y,src.z);K.dir=NORTH;K.Owner=src;K.JutsuLevel=1;walk(K,K.dir)
				if(X==2)
					K.dir=NORTHEAST;
				if(X==3)
					K.dir=EAST;
				if(X==4)
					K.dir=SOUTHEAST;
				if(X==5)
					K.dir=SOUTH;
				if(X==6)
					K.dir=SOUTHWEST;
				if(X==7)
					K.dir=WEST;
				if(X==8)
					K.dir=NORTHWEST;
				X++*/
			var/obj/Jutsu/Spider/webshot/A=new();A.name="[src]";A.loc=locate(src.x,src.y,src.z);A.dir=NORTH;A.Owner=src;A.JutsuLevel=1;walk(A,A.dir)
			var/obj/Jutsu/Spider/webshot/B=new();B.name="[src]";B.loc=locate(src.x,src.y,src.z);B.dir=NORTHEAST;B.Owner=src;B.JutsuLevel=1;walk(B,B.dir)
			var/obj/Jutsu/Spider/webshot/C=new();C.name="[src]";C.loc=locate(src.x,src.y,src.z);C.dir=EAST;C.Owner=src;C.JutsuLevel=1;walk(C,C.dir)
			var/obj/Jutsu/Spider/webshot/D=new();D.name="[src]";D.loc=locate(src.x,src.y,src.z);D.dir=SOUTHEAST;D.Owner=src;D.JutsuLevel=1;walk(D,D.dir)
			var/obj/Jutsu/Spider/webshot/E=new();E.name="[src]";E.loc=locate(src.x,src.y,src.z);E.dir=SOUTHWEST;E.Owner=src;E.JutsuLevel=1;walk(E,E.dir)
			var/obj/Jutsu/Spider/webshot/F=new();F.name="[src]";F.loc=locate(src.x,src.y,src.z);F.dir=WEST;F.Owner=src;F.JutsuLevel=1;walk(F,F.dir)
			var/obj/Jutsu/Spider/webshot/G=new();G.name="[src]";G.loc=locate(src.x,src.y,src.z);G.dir=NORTHWEST;G.Owner=src;G.JutsuLevel=1;walk(G,G.dir)
			var/obj/Jutsu/Spider/webshot/H=new();H.name="[src]";H.loc=locate(src.x,src.y,src.z);H.dir=SOUTH;H.Owner=src;H.JutsuLevel=1;walk(H,H.dir)

	KumosoukaZ()
		if(src.firing||src.Kaiten)
			return
		else
			src.ChakraDrain(20000);var/i=5
			while(i>0&&src)
				var/obj/Jutsu/Spider/webshot/F=new();F.JutsuLevel=1;F.name="[src]";F.loc=locate(src.x,src.y,src.z);F.dir=src.dir;F.Owner=src
				if(i==4) F.dir = turn(F.dir,45);step(F,F.dir);F.dir=src.dir
				if(i==3) F.dir = turn(F.dir,-45);step(F,F.dir);F.dir = src.dir
				if(i==2) F.dir = turn(F.dir,45);step(F,F.dir);F.dir=src.dir
				if(i==1) F.dir = turn(F.dir,-45);step(F,F.dir);F.dir=src.dir
				walk(F,F.dir);i --
			return
	NenkinNoYoroi()
		if(src.firing||src.Kaiten)
			return
		else
			src.NenkinOn=1;var/I='Icons/New Base/Base.dmi';I += rgb(138,104,0);src.Oicon=src.icon;src.icon=I;src.overlays+='Icons/New Base/EyesClosed.dmi';src.ChakraDrain(20000)
			spawn(((130+src.GoldenSpike)*(GoldnowDiamond/2)+1))
				src.NenkinOn=0;src<<"A armadura desaparece!";src.icon=usr.Oicon;src.overlays-='Icons/New Base/EyesClosed.dmi'
	NenkinShoot()
		if(src.firing||src.Kaiten)
			return
		else
			src.ChakraDrain(10000)
			var/obj/Jutsu/Spider/kunai/K=new();K.name="[src]";K.loc = locate(src.x,src.y,src.z);K.dir=src.dir;K.Owner=src;K.JutsuLevel=1
			walk(K,src.dir)
	Kumosenkyuu()
		if(src.Kumosenkyuu)
			src<<"Você pega de volta o Arco.";src.Kumosenkyuu=0;src.Frozen=0;src.Normal()
			usr.overlays-= /obj/Jutsu/Spider/bow;usr.underlays-= /obj/Jutsu/Spider/bowU
			return
		if(src.firing||src.Kaiten||src.Frozen)
			return
		else
			src.ChakraDrain(20000);
			src<<"Você endureça a seu teia em uma curva!";
			oview(8,src)<<"<b>[src] endurece a seu teia em uma curva!</b>";
			src.Kumosenkyuu=1;
			src.Face()
			usr.overlays+=new /obj/Jutsu/Spider/bow;
			usr.underlays+=new /obj/Jutsu/Spider/bowU
			usr<<"Ataque para atirar flechas, enquanto ele está em você não pode se mover, mas você pode mudar de direção."

	GiantWebMaze()
		if(src.firing||src.Kaiten)
			return
		else
			Webdelay=0
			src.ChakraDrain(30000)
			src.Handseals(35-src.HandsealSpeed)
			var/obj/Jutsu/Spider/web/A=new();A.loc=locate(src.x,src.y,src.z);A.name="[src]";A.Owner=src;A.CanBind=0;
			src.Frozen=1;
			var/X=1
			while(X<5)
				for(var/turf/D in oview(X,src))
					if(!(D in oview(X-1)))
						var/obj/Jutsu/Spider/web/B=new();
						B.loc=D;
						B.name="[src]";
						B.Owner=src;
						if(prob(20))
							B.CanBind=1;
						else
							B.CanBind=0
				sleep(1)
				X++
			src.Frozen=0;
			usr<<"Você forma um campo de Teia de Aranha."
	//		usr<<"Click the web fields to cause them to bind"
			src.MazeG=1;
			while(src.MazeG==1)
				Webdelay--
				sleep(10)