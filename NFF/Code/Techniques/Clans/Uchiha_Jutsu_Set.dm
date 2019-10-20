mob/var/tmp/SharinganNotice=0
mob/var/tmp/UchihaAuraOn=0
mob/var/tmp/GhostParasite=0
obj/Mshar
	icon='Code/Techniques/shading.dmi'
	icon_state="weak"
	screen_loc="1,1 to 19,19"
	layer=MOB_LAYER+10
	mouse_opacity=0
obj/Jutsu/Uchiha
	AmatFireStuff
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state="AmatFire"
		layer=80
		density = 0
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				while(src)
			//		src.SoundEngine('SFX/FireSFX.wav',4)
					for(var/mob/M in src.loc)//range(1,src))
						if(M&&M!=O)
							if(!M.knockedout)
								var/damage=round(O.nin*rand(0.5,1))
								M.DamageProc(damage,"Health",O)
					//		sleep(7)
					sleep(11)
			spawn(600)
				del(src)
	AmatFireStuff2
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state="AmatFire"
		layer=80
		density = 0
		New()
			..()
			spawn()
				var/mob/O=src.Owner
				while(src)
				//	src.SoundEngine('SFX/FireSFX.wav',4)
					for(var/mob/M in oview(1,src))
						if(M&&M!=O)
							if(!M.knockedout)
								var/damage=round(O.nin*rand(0.5,1))
								M.DamageProc(damage,"Health",O)
					sleep(11)
	//		spawn(600)
	//			del(src)
	AMAExplosion
		icon='Icons/Jutsus/KatonTechsBlack.dmi'
		icon_state="AmatExplode"
		layer=6
		density = 0
		New()
			..()
			spawn()
				while(src)
					for(var/mob/M in src.loc)
						var/mob/O=src.Owner
						if(M&&M!=O)
							var/damage=round(O.nin*rand(1.2,1.5))
							if(M.RaiArmor==2)
								damage/=2
							if(!M.knockedout)
								M.DamageProc(damage,"Health",O);M.DamageProc(damage*1.5,"Stamina",O)
					sleep(11)
			spawn(30)
				del(src)
		Del()
		//	var/obj/Jutsu/Uchiha/AMAProjectile/Z=new();Z.loc=src.loc;Z.name="[src]";Z.dir=NORTH;Z.Owner=src.Owner;walk(Z,Z.dir)
			var/num=12
			var/loldir=src.dir
			while(num>0)
				var/obj/Jutsu/Uchiha/AMAProjectile/K=new();K.loc=src.loc;K.nin=pick(40,50);K.dir=loldir;K.name="[src]";K.Owner=src;walk(K,K.dir)
				loldir=turn(loldir,45)
				num--
		//	var/obj/Jutsu/Uchiha/AMAProjectile/C=new();C.loc=src.loc;C.name="[src]";C.dir=SOUTH;C.Owner=src.Owner;walk(C,C.dir)
		//	var/obj/Jutsu/Uchiha/AMAProjectile/B=new();B.loc=src.loc;B.name="[src]";B.dir=EAST;B.Owner=src.Owner;walk(B,B.dir)
		//	var/obj/Jutsu/Uchiha/AMAProjectile/A=new();A.loc=src.loc;A.name="[src]";A.dir=WEST;A.Owner=src.Owner;walk(A,A.dir)
		//	var/obj/Jutsu/Uchiha/AMAProjectile/F=new();F.loc=src.loc;F.name="[src]";F.dir=NORTHEAST;F.Owner=src.Owner;walk(F,F.dir)
		//	var/obj/Jutsu/Uchiha/AMAProjectile/G=new();G.loc=src.loc;G.name="[src]";G.dir=SOUTHWEST;G.Owner=src.Owner;walk(G,G.dir)
		//	var/obj/Jutsu/Uchiha/AMAProjectile/Y=new();Y.loc=src.loc;Y.name="[src]";Y.dir=SOUTHEAST;Y.Owner=src.Owner;walk(Y,Y.dir)
		//	var/obj/Jutsu/Uchiha/AMAProjectile/T=new();T.loc=src.loc;T.name="[src]";T.dir=NORTHWEST;T.Owner=src.Owner;walk(T,T.dir)
			..()
	AMA
		icon='Icons/Jutsus/KatonTechsBlack.dmi'
		icon_state = "Amaterasu"
		layer=MOB_LAYER+2
		density = 0
		New()
			..()
			spawn()
				while(src)
			//		src.SoundEngine2('SFX/FireSFX.wav',volume=50)
					for(var/mob/M in oview(1,src))
						var/mob/O=src.Owner
						if(M&&!M.knockedout&&M!=O)
							var/damage=round(O.nin*rand(1.55,1.6))
							if(M.RaiArmor==2)
								damage/=2
							if(!M.knockedout)
								M.DamageProc(damage,"Health",O)
								M.DamageProc(damage*1.2,"Stamina",O)
					sleep(11)

			spawn(600)
				del(src)
		Move()
			var/obj/Jutsu/Uchiha/AMATrail/Z=new();Z.loc=src.loc;Z.dir=src.dir;Z.Owner=src.Owner
			var/obj/Jutsu/Uchiha/AMATrail/ZZ=new();ZZ.loc=src.loc;ZZ.dir=src.dir;ZZ.Owner=src.Owner
			..()
	AMATrail
		icon='Icons/Jutsus/KatonTechsBlack.dmi'
		icon_state = "Amaterasu"
		layer=MOB_LAYER+2
		density = 0
		New()
			..()
			spawn()
				pixel_x=rand(-8,8)
				pixel_y=rand(-8,8)
				while(src)
				//	src.SoundEngine2('SFX/FireSFX.wav',volume=50)
					for(var/mob/M in range(1,src))
						var/mob/O=src.Owner
						if(M&&M!=O)
							var/damage=round(O.nin*rand(0.5,0.55))
							if(M.RaiArmor==2)
								damage/=2
							if(!M.knockedout)
								M.DamageProc(damage,"Health",O);M.DamageProc(damage*1.5,"Stamina",O)
					sleep(14)

			spawn(300)
				del(src)
	LightAMATrail
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state = "LightAmaterasu"
		layer=MOB_LAYER+2
		density = 0
		New()
			..()
			spawn()
				while(src)
			//		src.SoundEngine('SFX/FireSFX.wav',100)
					for(var/mob/M in range(1,src))
						var/mob/O=src.Owner
						if(M!=O)
							var/damage=round(50*rand(0.5,1))
							if(M.RaiArmor==2)
								damage/=10
							M.DamageProc(damage,"Health",O);M.DamageProc(damage,"Stamina",O)
					sleep(11)

			spawn(300)
				del(src)
	AMAProjectile
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state = "AmaterasuProjectile"
		layer=MOB_LAYER+2
		density = 1
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(11)
				//	src.SoundEngine('SFX/FireSFX.wav',100)
			spawn(100)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner

				var/damage=round(O.nin*rand(25,50));M.DamageProc(damage,"Health",O);M.DamageProc(damage,"Stamina",O)

				src.loc=M.loc;del(src)
			if(istype(A,/obj/))
				return 0
		Move()
			src.AmaterasuFire()
			..()
		Del()
			src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire()
			..()
	WhiteAMAProjectile
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state="WhiteAmaProjectile"
		layer=MOB_LAYER+2
		density = 1
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(11)
		//			src.SoundEngine('SFX/FireSFX.wav',100)

			spawn(600)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner

				var/damage=round(src.nin*rand(50,100))
				M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Stamina",O)

				src.loc=M.loc;del(src)
			if(istype(A,/obj/))
				return 0
			if(istype(A,/turf/))
				del(src)
		Move()
			src.AmaterasuFire()
			..()
		Del()
			src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire();src.AmaterasuFire()
			..()
	UchihaAura
		icon='Icons/Jutsus/Uchiha Aura.dmi'
		icon_state="0,0"
		layer=MOB_LAYER+1
		Part1
			icon_state="0,0"
			pixel_x=-16
		Part2
			icon_state="1,0"
			pixel_x=16
		Part3
			icon_state="0,1"
			pixel_x=-16
			pixel_y=32
		Part4
			icon_state="1,1"
			pixel_x=16
			pixel_y=32
	Susanoo
		icon='Icons/Jutsus/Susanoo.dmi'
		icon_state="5"
		density=1
		layer=MOB_LAYER+1
		var/Type="Itachi"
		var/AmatShieldOn=0
		var/EntonDefenceBoost=0
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(src.Owner==M)
					src.loc=M.loc
		New()
			if(src.Type=="Sasuke")
				src.icon_state=""
			if(src.icon_state==""&&src.Type=="Sasuke")
				src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part11;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part11;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part33;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part77;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part11;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part99
			spawn()
				if(src.Type=="Sasuke")
					src.icon_state=""
				if(src.icon_state=="5"&&src.Type=="Itachi")
					src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part1;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part2;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part3;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part4;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part6;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part7;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part8;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part9
				if(src.icon_state==""&&src.Type=="Sasuke")
					src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part11;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part33;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part77;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part99

				while(src)
					for(var/obj/Jutsu/A in oview(1,src))
						if(A.Owner!=src.Owner)
							del(A)
					for(var/obj/Jutsu/A in src.loc)
						if(A.Owner!=src.Owner)
							del(A)
					if(src.Type=="Itachi"||src.Type=="Sasuke")
						for(var/mob/A in oview(1,src))
							if(A!=src.Owner)
								var/damage=rand(1,500)
								if(src.Type=="Sasuke")
									damage/=2.5
									if(src.EntonDefenceBoost==1)
										damage*=2.5
									if(src.EntonDefenceBoost==2)
										damage*=2.65
									if(src.EntonDefenceBoost==3)
										damage*=3
								A.DamageProc(damage*rand(1,2.5),"Health",src.Owner)
								A.DamageProc(damage*rand(1,2.5),"Stamina",src.Owner)
					sleep(11)
		proc/AmatDefenceProc(LevelOfDefence,PixelY,PixelX,Yvar,Xvar,Number1=1,Number2=3)
			var/mob/P=src.Owner
			if(src.AmatShieldOn==1)
				src.AmatShieldOn=0
				for(var/obj/Jutsu/Uchiha/AmatFireStuff2/A in src)
					del(A)
				for(var/obj/SkillCards/SusanooAmatDefence/A in P.LearnedJutsus)
					A.DelayIt(400,P,"Clan")
				P<<"Você libera o Enton protegendo-o....."
				return
			if(LevelOfDefence=="Light")
				src.AmatShieldOn=1
				src.EntonDefenceBoost=1
				var/a=rand(Number1,Number2)
				while(a>0)
					sleep(1)
					var/obj/Jutsu/Uchiha/AmatFireStuff2/F=new()
					F.Owner=src.Owner
					F.pixel_y=rand(PixelY,PixelY+((Yvar*2)-6))
					F.pixel_x=rand(PixelX,PixelX+((Xvar*2)-1))
		//			F.dir=Dir
					src.overlays+=F
					a--
			if(LevelOfDefence=="Medium")
				src.AmatShieldOn=1
				src.EntonDefenceBoost=2
				var/a=rand(Number1,Number2)
				while(a>0)
					sleep(1)
					var/obj/Jutsu/Uchiha/AmatFireStuff2/F=new()
					F.Owner=src.Owner
					F.pixel_y=rand(PixelY,PixelY+((Yvar*2)-5))
					F.pixel_x=rand(PixelX,PixelX+((Xvar*2)-1))
		//			F.dir=Dir
					src.overlays+=F
					a--
			if(LevelOfDefence=="Heavy")
				src.AmatShieldOn=1
				src.EntonDefenceBoost=3
				var/a=rand(Number1,Number2)
				while(a>0)
					sleep(1)
					var/obj/Jutsu/Uchiha/AmatFireStuff2/F=new()
					F.Owner=src.Owner
					F.pixel_y=rand(PixelY,PixelY+((Yvar*2)-4))
					F.pixel_x=rand(PixelX,PixelX+((Xvar*2)-1))
		//			F.dir=Dir
					src.overlays+=F
					a--

		Part1
			icon_state="1"
			pixel_x=-32
			pixel_y=32
		Part2
			icon_state="2"
			pixel_y=32
		Part3
			icon_state="3"
			pixel_x=32
			pixel_y=32
		Part4
			icon_state="4"
			pixel_x=-32
		Part6
			icon_state="6"
			pixel_x=32
		Part7
			icon_state="7"
			pixel_x=-32
			pixel_y=-32
		Part8
			icon_state="8"
			pixel_y=-32
		Part9
			icon_state="9"
			pixel_x=32
			pixel_y=-32
		Part11
			icon_state="11"
			pixel_x=-18//-32
			pixel_y=24//16//32
		Part33
			icon_state="33"
			pixel_x=14//32
			pixel_y=24//32
		Part77
			icon_state="77"
			pixel_x=-18//-32
			pixel_y=-8//-16//-32
		Part99
			icon_state="99"
			pixel_x=14//32
			pixel_y=-8//-16//-32
mob/owner/verb/TestUchihaAura()
	var/obj/Jutsu/Uchiha/UchihaAura/Part1/A=new();var/obj/Jutsu/Uchiha/UchihaAura/Part2/B=new()
	var/obj/Jutsu/Uchiha/UchihaAura/Part3/C=new();var/obj/Jutsu/Uchiha/UchihaAura/Part4/D=new();
	usr.overlays+=A;usr.overlays+=B;usr.overlays+=C;usr.overlays+=D
mob/owner/verb/TestUchihaAuraRemoval()
	var/obj/Jutsu/Uchiha/UchihaAura/Part1/A=new();var/obj/Jutsu/Uchiha/UchihaAura/Part2/B=new()
	var/obj/Jutsu/Uchiha/UchihaAura/Part3/C=new();var/obj/Jutsu/Uchiha/UchihaAura/Part4/D=new();
	usr.overlays-=A;usr.overlays-=B;usr.overlays-=C;usr.overlays-=D
mob/proc/SasukeAmatDefence(HowStrong)
	var/AmatStrength=HowStrong
	src.MUses++
	view()<<"[src] esta em volta de uma Chama Negra..."
	for(var/obj/Jutsu/Uchiha/Susanoo/A in world)
		if(A.Owner==src)
			if(HowStrong=="Light")
			//	A.AmatDefenceProc(AmatStrength,PixelY,PixelX,Yvar,Xvar,Dir=SOUTH,Number1=1,Number2=3)
				A.AmatDefenceProc(AmatStrength,-8,-18,26,32,8,15)
			if(HowStrong=="Medium")
				A.AmatDefenceProc(AmatStrength,-8,-18,26,32,15,24)
			if(HowStrong=="Heavy")
				A.AmatDefenceProc(AmatStrength,-8,-18,26,32,24,30)
mob/proc/TimeCollaboration()
	src.MUses++
	view()<<"[src] diminui a velocidade do tempo em torno deles!"
	src.health-=25
	if(prob(30))
		src.Bloody()
	src.chakra-=250
	for(var/obj/Jutsu/B in oview(4,src))
		if(B.Owner!=src.Owner)
			walk(B,0)
	for(var/obj/Jutsu/C in src.loc)
		if(istype(C,/obj/Jutsu/Uchiha/Susanoo))
			break
		if(C.Owner!=src.Owner)
			del(C)
	for(var/mob/M in oview(4,src))
		if(M in OnlinePlayers && !M.knockedout)
			M<<"Tempo está diminuindo em torno de você!"
			M.Running=0
			M.StunAdd(20)

obj/proc/AmaterasuFire()
	var/obj/Jutsu/Uchiha/AmatFireStuff/A=new()
	A.loc=src.loc;A.pixel_x+=rand(1,8)
	A.pixel_y+=rand(1,8)
	A.icon='Icons/Jutsus/KatonTechniques.dmi'
	A.icon_state="AmatFire"
	if(src.icon_state=="WhiteAmaProjectile"||src.icon_state=="WhiteAmatSmall")
		A.icon_state="WhiteAmatFire"
	A.Owner=src
mob/proc
	Illuminate()
		src.see_invisible=99
		if(src.mangekyou)
			src.see_invisible=100
	IlluminateOff()
		src.see_invisible=1

mob/var
	DoujutsuTechs=0
	tmp/shari=0
	tmp/mangekyou=0
	tmp/SharCounter=0
	tmp/CopyMode=0
	tmp/GenjutsuCounterMode=0
	tmp/SusanooIn=0
	tmp/UsingAmaterasu=0
	tmp/Phasing=0
	tmp/Kamui=0
obj/WarpEffect
	icon='Warp2.dmi'
	icon_state="Zap"
	layer=5
	pixel_x=-16
	pixel_y=-16
	New()
		..()
		spawn(9)
			del(src)
mob/var/tmp
	MindGenjutsuReady=0
	MindGenjutsuWho="Missing Ninja"
	MindGenjutsuRank="Genin"
	MindGenjutsuWhat="Message"
	MindGenjutsuMode="Say"
	MindGenjutsuTarget
mob/proc
	Mind_Genjutsu()
		usr.Target()
		if(usr.ntarget)
			return
		else if(usr.MindGenjutsuReady)
			usr<<"Você já preparou o Genjutsu da Mente, para cancelar o anterior, Shift + Clique si mesmo. Para executá-lo, Shift + Clique sobre a pessoa, ou Shift + Clique em qualquer outra coisa para fazer o nome digitado dizê-lo com nenhuma bolha de conversa."
			return
		else
			var/mob/M=usr.target
			var/Mode=input(usr,"Chat da Vila ou Chat comum?","Mode",usr.MindGenjutsuMode) in list("Chat comum","Chat da Vila","Cancelar")
			if(Mode=="Cancelar") return
			var/A=input(usr,"O que você quer fazer pensar que [M] esta ouvindo?","Mensagem") as text
			var/B=input(usr,"Quem é que vai dizer? Você pode deixar este campo em branco e basta clicar sobre a pessoa que você quer que eles acham que está dizendo sua mensagem. Se você não clicar em uma pessoa, porém, o nome aparecerá como <i> Ninja Renegado </ i> e nenhuma bolha de chat aparecera.","Nome",usr.MindGenjutsuWho) as text
			usr<<"Agora Shift + Clique na pessoa que você quer, [M] para pensar que está falando. Para cancelar, Shift + Clique em si mesmo. Por nenhuma bolha de chat e o nome padrão, clique em um relevo ou objeto."
			if(B==null)
				B="Missing Ninja"
			usr.MindGenjutsuWho=B;usr.MindGenjutsuWhat=A;usr.MindGenjutsuMode=Mode;usr.MindGenjutsuTarget=M
			usr.MindGenjutsuReady=1
	Invisibility()
		if(src.invisibility==100)
			src.invisibility=1;src.AttackDelay=0
			src<<"Você libera o genjutsu invisibilidade.."
		else
			src.icon_state="handseal"
			src.MUses++
			src<<"Você começa a lançar um genjutsu de invisibilidade em torno de si.."
			spawn(30)
				if(src.icon_state=="handseal")
					src.invisibility=100;src.AttackDelay=1
					src<<"Sucesso! Você está completamente invisível a todos, mas aqueles com os olhos mais perspicazes sera dificil. Neste modo, você é incapaz de atacar."
				else
					src<<"Seu genjutsu falhou."
					for(var/obj/SkillCards/Invisibility/A in src.LearnedJutsus)
						A.DelayIt(600,src,"Clan")

	False_Bunshin(atom/movable/A in world)
		var/mob/Clones/Clone/M = new()
		src.MUses++
		M.CloneType="GenjutsuClone"
		M.name=A.name;M.icon=A.icon;M.overlays=A.overlays;M.Owner=src;M.health=100000;M.density=1
		M.x=src.x-1;M.y=src.y;M.z=src.z

	Bunshin_MindFuck()
		if(src.controlled)
			var/mob/K=src.controlled
			for(var/mob/W in world)
				if(W.client&&W.client.eye==K)
					if(W!=src)
						W.client.eye=src
					else
						src.client.eye=src;src.client.perspective=MOB_PERSPECTIVE
						src.controlled=null
				sleep(25)
				del(K)
			return
		if(!src.target)
			src<<"You need a target.";return
		var/mob/M=usr.target
		var/mob/Clones/Clone/K=new()
		K.loc=locate(src.x,src.y,src.z)
		src.controlled=K;src.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;src.client.eye=K
		for(var/mob/P in range(15,src))
			if(src==P.target)
				M.target=K
				for(var/image/x in M.client.images)
					if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
						del(x)
				var/image/I = image('Icons/target1.dmi',K)
				M<<I
		for(var/mob/W in world)
			if(W.client&&W.client.eye==src)
				W.client.eye=K
		if(K)
			for(var/V in src.vars)
				var/list/BAD = list("locs","cansave","key","ckey","client","type","parent_type","verbs","vars","group","x","y","z","loc","contents","controlled","alterV","alterC","alterR","OriginalVillage","Orank","OClan","ImmuneToDeath")
				if(!BAD.Find(V))
					K.vars[V] = src.vars[V]
			K.CloneType="GenjutsuClone"
			K.RunningSpeed=5;K.Running=1;K.density=1
			K.icon=src.icon;K.overlays+=src.overlays
			K.name="[src.name]";K.Owner=src
			K.tai=K.tai;K.nin=K.nin;K.gen=K.gen
			K.Running=1;K.RunningSpeed=5;src.KBunshinOn=1
			K.icon_state="running";K.Clone=1;K.cansave=0
		while(K&&src.chakra>0&&src.mangekyou)
			src.invisibility=100
			src.sight |= SEE_SELF
			src.density=0
			src.ImmuneToDeath=1
			sleep(20)
		if(K)
			for(var/mob/W in world)
				if(W.client&&W.client.eye==K)
					if(W!=src)
						W.client.eye=src
			sleep(25)
			del(K)
		src.client.eye=src;src.client.perspective=MOB_PERSPECTIVE
		src.controlled=null
		src.invisibility=1
		src.sight &= ~SEE_SELF
		src.density=1
		src.ImmuneToDeath=0




mob/var/tmp/UsingAmaterasuExplosion=0
mob/var/EternalMangekyoSharingan=0 //0 = None or Regular. 1 = Eternal MS. 2 = Extended Life MS.



mob/proc
	Sharingan()
//		if(src.Clan!="Uchiha")
//			return
		if(src.mangekyou)
			return
		if(src.shari)
			src<<"You release your sharingan.";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.shari=0;src.IlluminateOff();src.GenjutsuCounterMode=0;src.SharCounter=0;src.CopyMode=0;src.ChakraSight(0);
			for(var/obj/SkillCards/SharinganIlluminate/Z in usr.LearnedJutsus)
				del(Z)
			for(var/obj/SkillCards/SharinganFocus/Z in usr.LearnedJutsus)
				del(Z)
			src.UpdateInv()
			return
		else
			if(!src.shari)
				src.icon_state="1";usr.ChangeEyeStyle(usr.EyeStyle,200,0,0)
				var/image/I = new('Icons/Jutsus/sharinganthing.dmi');I.pixel_y=32;I.layer=6
				if(src.SharinganMastery==0)
					src.AwardMedal("Sharingan!")
				if(src.SharinganMastery<45)
					view()<<"[src]'s olhos brilham vermelho, revelando 1 tomoe!";I.icon_state="1 tomoe"
				if(src.SharinganMastery<91&&src.SharinganMastery>=45)
					view()<<"[src]'s olhos brilham vermelho, revelando 2 tomoe!";I.icon_state="2 tomoe"
				if(src.SharinganMastery>=91)
					view()<<"[src]'s olhos brilham vermelho, revelando 3 tomoe!";I.icon_state="3 tomoe"
				if(src.SharinganMastery>200)
					view()<<"[src]'s olhos brilha vermelho, revelando um Sharingan muito maduro!"
					src.LearnedJutsus+=new/obj/SkillCards/SharinganFocus
				if(src.SharinganMastery>=31)
					src<<"Você pode ver através de técnicas de taijutsu muito melhor agora!";usr.SharCounter=1
				if(src.SharinganMastery>=61)
					src.LearnedJutsus+=new/obj/SkillCards/SharinganIlluminate
					src<<"Você pode ver através de técnicas de taijutsu em um nível elevado!";src.SharCounter=2
				src.UpdateInv()
				src.overlays+=I
				spawn(30)
					src.overlays-=I
					del(I)
				src.shari=1;src.Illuminate();sleep(30);src.ChakraSight(1)
				while(src.shari)
					var/A=src.SharinganMastery
					if(A<1) A=1
					var/ChakraDrain=(src.Mchakra/(A*15))
					if(ChakraDrain>65)
						ChakraDrain=65
					if(ChakraDrain<5)
						ChakraDrain=5
					src.chakra-=ChakraDrain
					if(prob(1))
						src.SharinganMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
					if(src.Charging&&prob(3))
						src.SharinganMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
					sleep(25)
	Sharingancopy()
		if(!src.shari)
			src<<"Você precisa ativar o Sharingan!";return
		else
			src<<"O próximo ataque feito por qualquer ninja será copiada por você!";src.CopyMode=1
	SharinganFocus()
		if(!src.shari)
			src<<"Você precisa ativar o Sharingan!";return
		else
			if(src.SharinganNotice)
				src<<"Você para de se concentrar em seus selos de mão"
				src.SharinganNotice=0
				return
			else
				src<<"Você começa a se concentrar em selos de mão do adversário."
				src.SharinganNotice=1
	SharinganIlluminate()
		if(!src.shari)
			src<<"Você precisa ativar o Sharingan!";return
		else
			src<<"Você concentra o seu Sharingan para ver chakra."
			src.IlluminateOff()
			src.ChakraSight(0)
			src.Illuminate()
			src.ChakraSight(1)
	GenjutsuCounter()
		if(!src.shari)
			src<<"Você precisa ativar o Sharingan!";return
		else
			var/TimeLimit=100+(usr.SharinganMastery/10);src<<"Você tem a capacidade de combater genjutsu em [TimeLimit/10] segundos.";src.GenjutsuCounterMode=1
			spawn(TimeLimit)
				src.GenjutsuCounterMode=0
	Konsui()
		if(!src.shari)
			src<<"Você precisa ativar o Sharingan!";return
		if(src.firing||src.Frozen)
			return
		src.chakra-=500
		for(var/mob/M in get_step(src,src.dir))
			if(M.dir==(get_dir(M,src))&&usr.dir==(get_dir(src,M)))
				if(M.knockedout)
					src<<"Ele esta atualmente nocauteado!";return
				if(M.Majest)
					src<<"Você olha profundamente para os olhos de [M]!"
					spawn(15)
						src<<"Seus olhos dourados viram através de sua hipnose, e impediu seu genjutsu de trabalhar!"
				if(M.FrozenBind=="Sharingan")
					src<<"Você já capturou-los em um genjutsu, você não pode lançar o feitiço Hypnosis quando eles estão com tanta dor!";return
				M<<"[src] olha profundamente em seus olhos, seus olhos giram rapidamente!";src<<"Você olha profundamente para os olhos de [M]!";var/SleepingCount=30
				while(SleepingCount>0)
					if(SleepingCount>10&&M.gencounter)
						view()<<"[M] usa Genjutsu Contra para prevenir [src] ataque de ser executado!";M.gencounter=0;SleepingCount=0;return
					if(SleepingCount==20)
						M<<"Você se sente um pouco cansado."
					if(SleepingCount==10)
						M<<"Você se sente como se estivesse entrado em colapso."
					if(SleepingCount<=10)
						M.Running=0
					if(SleepingCount==1)
						M<<"Você está cansado demais, você está em colapso."
						M.Status="Asleep";M.icon_state="dead"
						M.StatusEffected=min(rand(src.SharinganMastery/25,src.SharinganMastery/15),20)
					SleepingCount-=1
					if(M.knockedout||M.ImmuneToDeath||M.Dead)
						src<<"O Genjutsu Falhou."
						SleepingCount=0
						return
					sleep(11)
			else
				usr<<"Você precisa fazer contato com os olhos!";return
	Kasegui()
		if(!src.shari)
			src<<"Você precisa ativar o Sharingan!";return
		if(src.firing)
			return
		if(src.Frozen)
			return
		var/Damage=(src.SharinganMastery+src.GenjutsuKnowledge)
		var/mob/ST   //Specified Target     I defined these variables so that the mob or turf is not lost in runtime
											//By movement or other things
		var/Distance=round(src.SharinganMastery/100)
		if(Distance<1) Distance=1
		if(Distance>10) Distance=10
		var/turf/DM = get_steps(src,src.dir,Distance)  //Distance Marker
		var/a=0
		while(a<Distance&&!ST)
			a++
			DM = get_steps(src,src.dir,a)
			for(var/mob/M in DM)
				if(M!=src&&M.dir==(get_dir(M,src))&&src.dir==(get_dir(src,M))&&M.FrozenBind==""&&!M.knockedout)
					ST=M   //Catch the first mob in the line. If he makes eyecontact then he's caught
					//If not, then the jutsu ends because anyone behind him wouldn't make eyecontact period.
					break
		if(!ST)
			src<<"Você não poderia fazer contato visual com ninguém.";return
		if(ST.ImmuneToDeath)
			return
		ST.FrozenBind="Sharingan"
		var/b=(ST.GenjutsuSight+(ST.GenjutsuKnowledge/100))///10))
		if(b<1) b=1
		Damage=(Damage/b)+src.Mgen
		var/StartHealth=ST.health
		var/image/A=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);A.icon_state="1";var/image/B=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);B.icon_state="2"
		var/image/C=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);C.icon_state="3";var/image/D=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);D.icon_state="4"
		var/image/E=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);E.icon_state="5";var/image/F=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);F.icon_state="6"
		var/image/G=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);G.icon_state="7";var/image/H=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);H.icon_state="8";var/image/I=image('Icons/Jutsus/GenjutsuTechniques.dmi',ST);I.icon_state="9"
		src<<A;src<<B;src<<C;src<<D;src<<F;src<<G;src<<H;src<<I
		if(ST.client) ST<<A;ST<<B;ST<<C;ST<<D;ST<<F;ST<<G;ST<<H;ST<<I
		sleep(18)
		ST.stamina-=Damage
		src<<output("[ST] foi ferido pelo genjutsu!([Damage])","Attack")
		while(ST&&src&&ST.FrozenBind=="Sharingan"&&!src.firing&&ST.Status!="Asleep")
			if(ST.health>(StartHealth-100)&&src.shari&&src.dir==(get_dir(src,ST)))
				var/ChakraDrain=100;src.chakra-=ChakraDrain;ST.FrozenBind="Sharingan";src<<E;ST<<E;ST.firing=1;src.UnableToChargeChakra=1;sleep(11)
				if(prob(10))
					ST.stamina-=Damage/10;src<<output("[ST] foi ferido pelo genjutsu!([Damage/10])","Attack")
				if(src.chakra<ChakraDrain)
					src<<"A ligação em [ST] foi quebrada!"
					ST.FrozenBind="";src.UnableToChargeChakra=0;step(src,ST.dir)
					for(var/image/x in src.client.images)
						if(x.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
							del(x)
					if(ST.client)
						for(var/image/c in ST.client.images)
							if(c.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
								del(c)
			else
				src<<"Você quebra o vínculo!";ST.firing=0;src.UnableToChargeChakra=0;ST.FrozenBind=""
				for(var/image/x in src.client.images)
					if(x.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
						del(x)
				if(ST.client)
					for(ST in src.view)
						for(var/image/x in ST.client.images)
							if(x.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
								del(x)
		ST<<"O Genjutsu foi quebrado!"
		ST.firing=0;src.UnableToChargeChakra=0;ST.FrozenBind=""
		for(var/image/x in src.client.images)
			if(x.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
				del(x)
		if(ST.client)
			for(var/image/x in ST.client.images)
				if(x.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
					del(x)



	MangekyouPrep()
		if(src.firing)
			return
		if(src.mangekyou)
			src.mangekyou=0
			if(!src.shari)
				src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.IlluminateOff()
			else
				src<<"Você libera o sharingan mangekyou, e seus olhos voltam ao seu estado 3 tomoe.."
			var/list/Techniques=list("MindGenjutsu","Invisibility","FalseBunshin","GenjutsuBunshin","Kamui","TimeCollaboration","Phase","Amateratsu","AmateratsuProjectile","WhiteAmaterasuProjectile","Susanoo","Tsukiyomi","WhiteAmaterasu360","SusanooAmatDefence","SusanooAmatDefence2","SusanooAmatDefence3")
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
			var/X=0
			for(var/obj/SkillCards/O in src.LearnedJutsus)//Loop through all the items in the players contents
				winset(src, "Jutsu.Jutsus", "current-cell=1,[++X]")	//Add multiple cells horizontally for each obj
				src << output(O, "Jutsu.Jutsus")//Send the obj's in src.contents to the Grid
			winset(src,"Jutsu.Jutsus", "cells=[X]")
			src<<"Você desativa o Mangekyou Sharingan.";src.ChakraSight(0);src.Phasing=0;src.mangekyou=0
			for(var/obj/Mshar/MM in src.client.screen)
				del(MM)
			if(src.MUses>250)
				var/obj/Mshar/MM=new()
				MM.screen_loc = "1,1 to 19,19"
				src.client.screen+=MM
				if(src.MUses>250&&usr.MUses<350)
					MM.icon_state="weak"
				if(src.MUses>=350&&usr.MUses<500)
					MM.icon_state="strong"
				if(src.MUses>=500)
					MM.icon_state="blind"
				if(src.MUses>=600)
					MM.icon_state="blinder"
			if(src.SusanooIn)
				for(var/obj/Jutsu/Uchiha/Susanoo/A in world)
					if(A.Owner==src)
						del(A)
				src.SusanooIn=0
			src.RemoveUchihaAura()
			src.UpdateInv()
		else
			if(!src.shari)
				src<<"Ative o seu Sharingan primeiro."
				return
				//src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.shari=0;src.IlluminateOff();src.GenjutsuCounterMode=0;src.SharCounter=0;src.CopyMode=0;src.ChakraSight(0);return
			src.mangekyou=1;src.ChakraSight(1);src.ChangeEyeStyle(src.EyeStyle,200,0,0)
			view(9,src)<<"[src]'s pupilas giram e se transformar no Lendario Mangekyou Sharingan!";usr.Illuminate()
			var/image/A = new('Icons/Jutsus/sharinganthing.dmi');
			A.pixel_y=32;A.layer=6 //Begin Added stuff
			if(!src.EternalMangekyoSharingan)
				A.icon_state="[src.mangekyouC]"
			else if(src.EternalMangekyoSharingan==2)
				A.icon_state="ELMS"
			src.overlays+=A
			spawn(30)
				src.overlays-=A
				del(A)//End Added stuff
			if(src.mangekyouC=="6 point")
				src.mangekyouC="bladed"
			for(var/obj/Mshar/MM in src.client.screen)
				del(MM)
			if(src.MUses>350)
				var/obj/Mshar/MM=new()
				MM.screen_loc = "1,1 to 19,19"
				src.client.screen+=MM
				MM.icon_state="weak"
				var/obj/I=new()
				var/obj/I2=new()
				I.icon='Icons/Jutsus/sharinganthing.dmi';I2.icon=I.icon
				I.pixel_y=16;I2.pixel_y=16
				I.pixel_x=-20;I2.pixel_x=20
				if(src.MUses>=500)
					MM.icon_state="strong"
					I.icon_state="blind 1";I2.icon_state=I.icon_state
				if(src.MUses>=600)
					MM.icon_state="blind"
					I.icon_state="blind 2";I2.icon_state=I.icon_state
				if(src.MUses>=700)
					MM.icon_state="blinder"
					I.icon_state="blind 3";I2.icon_state=I.icon_state
				src.overlays+=I;src.overlays+=I2
				spawn(20)
					src.overlays-=I;src.overlays-=I2
					del(I)
			else
				var/obj/I=new();var/obj/I2=new()
				I.icon='Icons/Jutsus/sharinganthing.dmi';I2.icon=I.icon
				I.icon_state="[src.mangekyouC]";I2.icon_state=I.icon_state
				I.pixel_y=16;I2.pixel_y=16
				I.pixel_x=-20;I2.pixel_x=20
				src.overlays+=I;src.overlays+=I2
				spawn(20)
					src.overlays-=I;src.overlays-=I2
					del(I)
			if(findtext(usr.mangekyouC,"kakashi",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Phase
			if(findtext(usr.mangekyouC,"shuriken",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/TimeCollaboration
			if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"madara",1,0)||findtext(usr.mangekyouC,"star",1,0)||findtext(usr.mangekyouC,"gridlock",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Tsukiyomi
			if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"bladed",1,0)||findtext(usr.mangekyouC,"shuriken",1,0)||findtext(usr.mangekyouC,"niro",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Amateratsu
			if(findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"bladed",1,0)||findtext(usr.mangekyouC,"star",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/AmateratsuProjectile
			if(findtext(usr.mangekyouC,"gridlock",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/WhiteAmateratsuProjectile
				src.LearnedJutsus+=new/obj/SkillCards/WhiteAmaterasu360
			if(findtext(usr.mangekyouC,"kakashi",1,0)||findtext(usr.mangekyouC,"bladed",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Kamui
			if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"niro",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Susanoo
			if(findtext(usr.mangekyouC,"sasuke",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/SusanooAmatDefence
				for(var/obj/SkillCards/Susanoo/P in usr.LearnedJutsus)
					if(P.Uses>=10)
						usr<<"Você sente como se você é capaz de usar o Enton de forma mais eficaz...!"
						if(!(locate(/obj/SkillCards/SusanooAmatDefence2) in usr.LearnedJutsus))
							src.LearnedJutsus+=new/obj/SkillCards/SusanooAmatDefence2
				for(var/obj/SkillCards/SusanooAmatDefence2/X in usr.LearnedJutsus)
					if(X.Uses>=15)
						usr<<"Você sente como se você já domina-se o uso do Enton..,,,"
						if(!(locate(/obj/SkillCards/SusanooAmatDefence3) in usr.LearnedJutsus))
							src.LearnedJutsus+=new/obj/SkillCards/SusanooAmatDefence3
			if(findtext(usr.mangekyouC,"shisui",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/MindGenjutsu
				src.LearnedJutsus+=new/obj/SkillCards/Invisibility
				src.LearnedJutsus+=new/obj/SkillCards/FalseBunshin
				src.LearnedJutsus+=new/obj/SkillCards/GenjutsuBunshin
			if(findtext(usr.MMove1,"AmateratsuP",1,0)||findtext(usr.MMove2,"AmateratsuP",1,0)||findtext(usr.MMove3,"AmateratsuP",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/AmateratsuProjectile
			if(findtext(usr.MMove1,"Amateratsu",1,0)||findtext(usr.MMove2,"Amateratsu",1,0)||findtext(usr.MMove3,"Amateratsu",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Amateratsu
			if(findtext(usr.MMove1,"Tsukiyomi",1,0)||findtext(usr.MMove2,"Tsukiyomi",1,0)||findtext(usr.MMove3,"Tsukiyomi",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Tsukiyomi
			if(findtext(usr.MMove1,"Susanoo",1,0)||findtext(usr.MMove2,"Susanoo",1,0)||findtext(usr.MMove3,"Susanoo",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Susanoo
			if(findtext(usr.MMove1,"Phase",1,0)||findtext(usr.MMove2,"Phase",1,0)||findtext(usr.MMove3,"Phase",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Phase
			if(findtext(usr.MMove1,"Kamui",1,0)||findtext(usr.MMove2,"Kamui",1,0)||findtext(usr.MMove3,"Kamui",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Kamui
			if(findtext(usr.MMove1,"WAmaterasuP",1,0)||findtext(usr.MMove2,"WAmaterasuP",1,0)||findtext(usr.MMove3,"WAmaterasuP",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/WhiteAmateratsuProjectile
			if(findtext(usr.MMove1,"WAmaterasu",1,0)||findtext(usr.MMove2,"WAmaterasu",1,0)||findtext(usr.MMove3,"WAmaterasu",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/WhiteAmaterasu360
			src.UpdateInv()
			while(src.shari&&src.mangekyou&&src.chakra>0)
				sleep(120)
				if(prob(20))
					src.stamina-=(src.maxstamina/100)
				src.chakra-=rand(75,90)
				if(prob(10))
					if(src.invisibility<=1)
						src.Bloody()
					src.health-=70
			if(!src.shari&&src.mangekyou)
				src.MangekyouPrep()
				return
			else if(src.chakra<=10&&src.mangekyou)
				src<<"Você é incapaz de sustentar o Mangekyou com os seus níveis de chakra atual, e ele desativa.."
				src.MangekyouPrep()
				return
		src.UpdateInv()

	Amateratsu()
		src.MUses+=10;
		src.chakra-=1500;
		src.stamina-=rand(200,350);
		src.health-=rand(150,250)
		if(src.MUses<=0)
			src.health-=150
	//	src.Handseals(50-src.HandsealSpeed)
	//	if(src.HandsSlipped) return
		src.SaveK()
		src.UsingAmaterasu=1;var/obj/Jutsu/Uchiha/AMA/K=new();K.loc=src.loc;K.dir=src.dir;K.name="[src]";K.Owner=src
		while(src.UsingAmaterasu)
			src.chakra-=80;
			src.health-=45;
			src.stamina-=35;
			sleep(pick(60,70))
		src.client.perspective=MOB_PERSPECTIVE;src.client.eye=src;del(K)
	AmaterasuExplosion()
		src<<"Você começa a se concentrar em uma localização muito duro e começar a formar uma manifestação de Enton!"
		src<<"Clique duas vezes em uma área para desovar uma partícula Enton que vai lançar em Amaterasu no tempo!"
		src.MUses+=5;src.chakra-=850;src.stamina-=rand(100,250);src.health-=rand(50,150)
	//	src.HandSeals(50-src.HandsealSpeed)
		src.UsingAmaterasuExplosion=1
		src.SaveK()
		while(src.UsingAmaterasuExplosion)
			src.chakra-=25;src.health-=25;src.stamina-=25;sleep(10)
	AmaterasuFire()
		var/obj/Jutsu/Uchiha/AmatFireStuff/A=new();A.loc=src.loc;A.pixel_x+=rand(1,8);A.pixel_y+=rand(1,8);A.icon='Icons/Jutsus/KatonTechniques.dmi';A.icon_state="AmatFire";A.Owner=src
		if(src.icon_state=="WhiteAmaProjectile")
			A.icon_state="WhiteAmatFire"
	ProjectileAmaterasu()
	//	if(!src.InSusano)
		src.chakra-=500;src.stamina-=rand(150,300);src.MUses+=3
		src.SaveK()
	//	src.Handseals(50-src.HandsealSpeed)
	//	if(src.HandsSlipped) return
		var/obj/Jutsu/Uchiha/AMAProjectile/K=new();K.loc=src.loc;K.dir=src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir)
	WhiteProjectileAmaterasu()
		src.chakra-=450;src.stamina-=rand(150,300);src.MUses+=5
		src.SaveK()
	//	src.Handseals(31-src.HandsealSpeed)
	//	if(src.HandsSlipped) return
		var/obj/Jutsu/Uchiha/WhiteAMAProjectile/K=new();K.loc=src.loc;K.nin=src.nin;K.dir=src.dir;K.name="[src]";K.Owner=src;walk(K,src.dir)
	WhiteFireShot()
		set name = "White Amaterasu: 360 Degrees"
		src.chakra-=1000;src.stamina-=rand(250,400);src.MUses+=10
		src.SaveK()
		var/num=8
		var/loldir=src.dir
		while(num>0)
			var/obj/Jutsu/Uchiha/WhiteAMAProjectile/K=new();K.icon_state="WhiteAmatSmall";K.loc=src.loc;K.nin=src.nin/10;K.dir=loldir;K.name="[src]";K.Owner=src;walk(K,K.dir)
			loldir=turn(loldir,45)
			num--
	Tsukiyomi()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M   //Specified Target     I defined these variables so that the mob or turf is not lost in runtime
											//By movement or other things
		var/Distance=round(src.SharinganMastery/100)
		if(Distance<1) Distance=1
		if(Distance>10) Distance=10
		var/turf/DM = get_steps(src,src.dir,Distance)  //Distance Marker
		var/a=0
		while(a<Distance&&!M)
			a++
			DM = get_steps(src,src.dir,a)
			for(var/mob/P in DM)
				if(P!=src&&P.dir==(get_dir(P,src))&&src.dir==(get_dir(src,P))&&P.FrozenBind==""&&!P.knockedout)
					M=P   //Catch the first mob in the line. If he makes eyecontact then he's caught
					//If not, then the jutsu ends because anyone behind him wouldn't make eyecontact period.
					break
		if(!M)
			src<<"Você não fez contato visual com ninguém.";return
		src.MUses+=5
		src.SaveK()
		src.Handseals(10-src.HandsealSpeed)
		if(src.HandsSlipped) return
		if(M.FrozenBind!="")
			src<<"Eles já estão paralizados agora.";return
		if(M.knockedout)
			src<<"Not now.";return
		if(M in oview(4))
			src.Struggle=0;M.Struggle=0
			src<<"Rapidamente, segure a barra de espaço para fazer dano a [M]'s força de vontade!"
			M<<"De repente você está preso em um Genjutsu! Segure a barra de espaço para escapar!";M.FrozenBind="Tsukiyomi"
			spawn(1)
				var/i=rand(40,60)
				while(i>0)
					sleep(1);M<<output("[src] Corta você!","Attack");M<<sound('SFX/Slice.wav',0);i--
			M.sight |= (SEE_SELF|BLIND);var/obj/A=new();A.icon='Icons/Jutsus/sharinganthing.dmi';A.icon_state="[usr.mangekyouC]";A.screen_loc="10,10";A.layer=MOB_LAYER+1;M.client.screen+=A
			spawn(60)
				if(M.Struggle<src.Struggle+5)
					M.deathcount+=((src.Struggle/10)-(M.Struggle/10))
				else
					src<<"[M] superou o Tsukiyomi!"
					M<<"Seu Tsukiyomi acabou!"
				M.FrozenBind="";M.sight &= ~(SEE_SELF|BLIND)
				for(var/obj/C in M.client.screen)
					if(C.icon=='Icons/Jutsus/sharinganthing.dmi')
						del(C)
	Phase()
		if(src.Phasing)
			src<<"Você começa a voltar e gradualmente esta de volta à realidade."
			src.Phasing=0
			src.density=1
			return
		src.Phasing=1;src<<"Você começa a teleportar seu corpo para outra realidade, ninguem podera te acertar, mas você é incapaz de atacar."

		while(src.Phasing)
			src.density=0;src.chakra-=100;sleep(20)
		src.density=1
	Kamui()
		if(src.knockedout||src.Dead||!src.mangekyou)
			src.firing=0
			return
		src.MUses+=10;
		src.health-=rand(150,250);src<<"Seus olhos se sentem tensos."
		src.Kamui=1
		src.SaveK()
		src<<"Você está pronto a sua técnica Kamui. Clique em um alvo para deformar-lo. Seja preciso para fazer o maior dano possível."
		while(src.Kamui)
			src.chakra-=(src.Mchakra/100)
			src.stamina-=(src.maxstamina/25)
			sleep(7)
	WarpHole(atom/movable/M,iconX,iconY)
		var/obj/WarpEffect/W=new()
		W.pixel_x+=iconX;W.pixel_y+=iconY;W.loc=M.loc
		if(ismob(M))
			if(!M.density)
				src<<"Por alguma razão, eles não são afetados!?";src.Kamui=0;return
			else if(iconX>=14&&iconX<=18&&iconY>=23&&iconY<=26)
				src.Kamui=0
				spawn()
					Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z)
				spawn()
					Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z)
				src<<"Você usa o seu Mangekyou para criar um buraco sem fim em [M]'s cabeça , e o mata Instantaneamente!"
				M:Stun=10
				M<<"[src] faz um buraco em sua cabeça sem fim com o seu Mangekyou!"
				M:health=0;M:stamina=0;M:Death(src)
				spawn(2)
					M:DeathStruggle(src,1)
			else if(iconX>=13&&iconX<=19&&iconY>=10&&iconY<=17)
				src.Kamui=0
				spawn()
					Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z);Blood(M.x,M.y,M.z)
				src<<"Você usa o seu Mangekyou para criar um buraco sem fim em [M]'s corpo, causando dano massivo!"
				M:Stun=10
				M<<"[src] Cria uma buraco no seu corpo com o Manegkyou Sharingan!"
				M.DamageProc(500,"Health",src)
				M:CBleeding=1
			else
				src.Kamui=0
				spawn()
					Blood(M.x,M.y,M.z)
				src<<"Você usa o seu Mangekyou para criar um buraco sem fim em [M], mas você pega de raspão neles!"
				M:Stun=5
				M<<"[src] Criou um buraco sem fim com o Mangekyou , mas passa de raspão em você!"
				M:DamageProc(100,"Health",src)
		else if(isobj(M))
			if(istype(M,/obj/Jutsu/Uchiha/Susanoo))
				var/obj/Jutsu/Uchiha/Susanoo/A=M
				var/mob/P = A.Owner
				if(!A.Owner||!P)
					return
				P<<"Seu Susano foi entortado?!"
				P.SusanooIn=0
				src.Kamui=0
				src<<"Você entortado com sucesso a distância [P]'s Susano'o!"
				del(M)
			if(istype(M,/obj/VillageScrollPost))
				src<<"Nah."
				src.Kamui=0
				src.DamageProc(2000,"Health")
				return
			if(istype(M,/obj/Hidden_Ninja_Scroll))
				src<<"Nah."
				src.Kamui=0
				src.DamageProc(2000,"Health")
				return
			src.Kamui=0
			viewers(src)<<"[src] usa seu Mangekyou para criar um buraco sem fim sobre [M], mas não consegue atingir!"
			del(M)
	Susanoo(Uses)
		if(Uses<100)
			src.chakra-=2000;
			src.stamina-=rand(500,1200)
		if(src.MUses<=0)
			src.health-=100
		src.MUses+=20;
		src.Handseals(1-src.HandsealSpeed)
		src.SaveK()
		if(src.HandsSlipped) return
		var/obj/Jutsu/Uchiha/Susanoo/K=new();K.name="[src]";K.Owner=src;src.SusanooIn=1;K.loc=src.loc;walk_towards(K,src)
		if(src.mangekyouC=="itachi") K.Type="Itachi"
		if(src.mangekyouC=="sasuke") K.Type="Sasuke"
		while(src.SusanooIn)
			src.chakra-=pick(75,100,120);
			src.stamina-=pick(50,65,70,80);
			src.Running=0
			if(src.MUses<=0)
				if(prob(30))
					src.health-=80
			if(prob(15))
				src.Bloody();
				src.health-=250;
				src.MUses+=1
			sleep(60)



	EMS()
		if(src.firing)
			return
		if(src.mangekyou)
			src.mangekyou=0;src.MUses=-5000;src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.IlluminateOff()
			for(var/obj/SkillCards/MindGenjutsu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Invisibility/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/FalseBunshin/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kamui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/TimeCollaboration/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Phase/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Amateratsu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/AmateratsuProjectile/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/WhiteAmateratsuProjectile/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Susanoo/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Tsukiyomi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kamui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/WhiteAmaterasu360/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/AmateratsuExplosion/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SusanooAmatDefence/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SusanooAmatDefence2/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/SusanooAmatDefence3/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/UchihaAura/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/UchihaAuraOff/A in src.LearnedJutsus)
				del(A)
			src<<"Você para de usar seu Mangekyou Sharingan.";
			src.RemoveUchihaAura()
			src.UpdateInv()
			src.ChakraSight(0);
			src.Phasing=0;
			src.mangekyou=0
			if(src.SusanooIn)
				for(var/obj/Jutsu/Uchiha/Susanoo/A in world)
					if(A.Owner==src)
						del(A)
				src.SusanooIn=0
		else
			if(!src.shari)
				src<<"Ative o sharingan normal primeiro.";return
			src.mangekyou=1;src.ChakraSight(1);src.ChangeEyeStyle(src.EyeStyle,200,0,0)
			view(9,src)<<"[src]'s pupila Gira e se Transforma no Eterno Mangekyou Sharingan!";usr.Illuminate()
			for(var/obj/Mshar/MM in src.client.screen)
				del(MM)
			var/obj/I=new();var/obj/I2=new()
			I.icon='Icons/Jutsus/sharinganthing.dmi';I2.icon=I.icon
			I.icon_state="";I2.icon_state=I.icon_state
			I.pixel_y=16;I2.pixel_y=16
			I.pixel_x=-20;I2.pixel_x=20
			src.overlays+=I;src.overlays+=I2
			spawn(20)
				src.overlays-=I;src.overlays-=I2
				del(I)
			src.CreateUchihaAura()
			spawn(30)
				src.RemoveUchihaAura()
			src.LearnedJutsus+=new/obj/SkillCards/Phase
			src.LearnedJutsus+=new/obj/SkillCards/TimeCollaboration
			src.LearnedJutsus+=new/obj/SkillCards/Tsukiyomi
			src.LearnedJutsus+=new/obj/SkillCards/Amateratsu
			src.LearnedJutsus+=new/obj/SkillCards/AmateratsuProjectile
			src.LearnedJutsus+=new/obj/SkillCards/AmateratsuExplosion
			src.LearnedJutsus+=new/obj/SkillCards/WhiteAmateratsuProjectile
			src.LearnedJutsus+=new/obj/SkillCards/WhiteAmaterasu360
			src.LearnedJutsus+=new/obj/SkillCards/Kamui
			src.LearnedJutsus+=new/obj/SkillCards/Susanoo
			src.LearnedJutsus+=new/obj/SkillCards/SusanooAmatDefence
			src.LearnedJutsus+=new/obj/SkillCards/SusanooAmatDefence2
			src.LearnedJutsus+=new/obj/SkillCards/SusanooAmatDefence3
			src.LearnedJutsus+=new/obj/SkillCards/MindGenjutsu
			src.LearnedJutsus+=new/obj/SkillCards/Invisibility
			src.LearnedJutsus+=new/obj/SkillCards/FalseBunshin
			src.LearnedJutsus+=new/obj/SkillCards/UchihaAura
			src.LearnedJutsus+=new/obj/SkillCards/UchihaAuraOff
			src.UpdateInv()
			while(src.mangekyou)
				sleep(100);src.chakra-=(rand(50,75))
			if(src.chakra<=10&&src.mangekyou)
				src<<"Você é incapaz de sustentar o Mangekyou com os seus níveis de chakra atual para que ele desativa.."
				src.EMS()
				return
