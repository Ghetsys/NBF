turf
	MouseEntered(src)
		if(usr.UsingControllingWindmill)
			for(var/obj/WindmillC/C in world)
				if(C.Owner==usr)
					walk_towards(C,src)
		if(usr.UsingAmaterasu)
			for(var/obj/Jutsu/Uchiha/AMA/T in world)
				if(T.Owner==usr)
					walk_towards(T,src)
		if(usr.UsingRasenganBarrage)
			for(var/mob/npcs/RBunshin/R in oview(20))
				if(R.Owner==usr)
					walk_towards(R,src)
		if(usr.InJibashi)
			for(var/obj/Jutsu/Elemental/Raiton/Jibashi/J in oview(20))
				if(J.Owner==usr)
					walk_towards(J,src)


//Iwazuka Stuff
		if(usr.Guiding!=null&&usr.Guiding!="")
			for(var/mob/Kibaku/K in oview(30))
				if(usr.Guiding==K)
					walk_towards(K,src)
		if(usr.usemurderofcrows)
			for(var/mob/Jutsu/MurderCrows/A in oview(20))
				if(A.Owner==usr)
					walk_towards(A,src)
		if(usr.Kawarimi)
			for(var/mob/Klog/A in oview(30))
				if(A.Controllable&&A.Owner==usr)
					walk_towards(A,src)
			for(var/mob/Klog2/A in oview(30))
				if(A.Controllable&&A.Owner==usr)
					walk_towards(A,src)


/////////////////////////////////
/////////////////////////////////////////////
////////////////////////////////
mob/proc
	OneSharingan()
		//if(src.ShariDelay)  ///Unnecessary.
		//	return
		if(src.shari)
			src<<"Você cobriu seu sharingan querendo parar suas habilidades."
			if(src.Doujutsu=="Sharingan Right")
				src.overlays-='Icons/Jutsus/SEye2.dmi'
			else if(src.Doujutsu=="Sharingan")
				src.overlays-='Icons/Jutsus/SEye.dmi'
			src.shari=0;src.IlluminateOff()
			for(var/obj/SkillCards/SharinganIlluminate/Z in usr.LearnedJutsus)
				del(Z)
			src.GenjutsuCounterMode=0;src.SharCounter=0;src.CopyMode=0
			if(src.mangekyou)
				src.mangekyou=0;src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.IlluminateOff()
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
				src.Phasing=0
				for(var/obj/Mshar/MM in src.client.screen)
					del(MM)
				if(src.MUses>250)
					var/obj/Mshar/MM=new()
					MM.screen_loc = "1,1 to 10,10"
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
			return
		else
			if(!src.shari&&src.SharinganMastery<45)
				src.icon_state="1"
				if(src.Doujutsu=="Sharingan Right")
					src.overlays+='Icons/Jutsus/SEye2.dmi'
				else if(src.Doujutsu=="Sharingan")
					src.overlays+='Icons/Jutsus/SEye.dmi'
				viewers(8,src)<<"a pupila de [src] dilata para formar o Sharingan estágio 1!"
				src.shari=1
				src.Illuminate()
				src.ChakraSight(1)
			//	usr.Illuminate()
				//sleep(30);src.overlays-='Icons/Jutsus/sharinganthing.dmi'
				while(src.shari)
					var/A=src.SharinganMastery
					if(A<1) A=1
					var/ChakraDrain=(src.Mchakra/(A*17))
					if(ChakraDrain>100)
						ChakraDrain=100
					src.chakra-=ChakraDrain
					if(prob(1))
						src.SharinganMastery+=pick(0.01,0.02,0.03,0.04,0.05)
					sleep(11)
			if(!src.shari&&src.SharinganMastery<91&&src.SharinganMastery>=45)
				if(src.Doujutsu=="Sharingan Right")
					src.overlays+='Icons/Jutsus/SEye2.dmi'
				else if(src.Doujutsu=="Sharingan")
					src.overlays+='Icons/Jutsus/SEye.dmi'
				//view()<<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: <FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a0050f>h</FONT><FONT COLOR=#b40b1f>a</FONT><FONT COLOR=#c9102e>r</FONT><FONT COLOR=#dc143c>i</FONT><FONT COLOR=#ca1131>n</FONT><FONT COLOR=#b80d25>g</FONT><FONT COLOR=#a50818>a</FONT><FONT COLOR=#93040c>n</FONT><FONT COLOR=#800000>!</FONT>"
				viewers(8,src)<<"a pupila de [src] dilata para formar o Sharingan estágio 2!"
				src.shari=1
				src.Illuminate()
				src.ChakraSight(1)
			//	usr.Illuminate()
				if(src.SharinganMastery>=45)
					src<<"Você consegue ver através de técnicas de taijutsu um pouco melhor!";usr.SharCounter=1
				//sleep(30);src.overlays-='Icons/Jutsus/sharinganthing.dmi'
				while(src.shari)
					var/A=src.SharinganMastery
					if(A<1) A=1
					var/ChakraDrain=(src.Mchakra/(A*15))
					if(ChakraDrain>100)
						ChakraDrain=100
					if(ChakraDrain<30)
						ChakraDrain=30
					src.chakra-=ChakraDrain
					if(prob(1))
						src.SharinganMastery+=pick(0.03,0.04,0.05,0.06,0.07)
					sleep(11)
			if(!src.shari&&src.SharinganMastery>=91)
				if(src.Doujutsu=="Sharingan Right")
					src.overlays+='Icons/Jutsus/SEye2.dmi'
				else if(src.Doujutsu=="Sharingan")
					src.overlays+='Icons/Jutsus/SEye.dmi'
				//view()<<"<font size=1><font face=verdana><b><font color=white>[src]<font color=green> Says: <FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a0050f>h</FONT><FONT COLOR=#b40b1f>a</FONT><FONT COLOR=#c9102e>r</FONT><FONT COLOR=#dc143c>i</FONT><FONT COLOR=#ca1131>n</FONT><FONT COLOR=#b80d25>g</FONT><FONT COLOR=#a50818>a</FONT><FONT COLOR=#93040c>n</FONT><FONT COLOR=#800000>!</FONT>"
				viewers(8,src)<<"a pupila de [src] dilata para formar o Sharingan estágio 3!"
				src.shari=1
				src.Illuminate()
				src.ChakraSight(1)
			//	usr.Illuminate()
				if(src.SharinganMastery>=91)
					src<<"Você consegue ver atráves de técnicas de taijutsu em um nível muito elevado agora!";src.SharCounter=2
					src.LearnedJutsus+=new/obj/SkillCards/SharinganIlluminate

				if(src.SharinganMastery>125&&src.DoujutsuTechs==0||src.SharinganMastery>200&&src.DoujutsuTechs<2)
					switch(input(src,"Você tem conhecimento de Sharingan o suficiente agora para aprender uma nova técnica do Sharingan.",)in list("Sharingan Copy","Genjutsu Counter","Hypnosis","Shackling Stakes"))
						if("Sharingan Copy") src.LearnJutsu("Sharingan Copy",35000,"SharinganCopy","Sharingan Copy is one of the Sharingan's really beautiful natures, allowing you to copy a technique and use it fully until next relog.","Ninjutsu")
						if("Genjutsu Counter") src.LearnJutsu("Demonic Illusion: Mirror Heaven and Earth Change",35000,"GenjutsuCounter","Demonic Illusion: Mirror Heaven and Earth Change is a spectacular Sharingan ability that literally counter-acts an enemy's Genjutsu.","Genjutsu")
						if("Shackling Stakes") src.LearnJutsu("Demonic Illusion: Shackling Stakes",35000,"Kasegui","Demonic Illusion: Shackling Stakes is one of Sharingan's principle Genjutsu techniques, allowing you to bind someone within shakles merely by looking into their eyes.","Genjutsu")
						if("Hypnosis") src.LearnJutsu("Demonic Illusion: Hypnosis",35000,"Konsui","Demonic Illusion: Hypnosis is a interesting technique of the Sharingan, allowing you to cause someone to fall asleep simply by looking them in the eye and rotating your eyes, causing a hypnosis-like function.","Genjutsu")
					src.DoujutsuTechs++
				//sleep(30);src.overlays-='Icons/Jutsus/sharinganthing.dmi'
				while(src.shari)
					var/A=src.SharinganMastery
					if(A<1) A=1
					var/ChakraDrain=(src.Mchakra/(A*12))
					if(ChakraDrain>100)
						ChakraDrain=100
					if(ChakraDrain<15)
						ChakraDrain=15
					src.chakra-=ChakraDrain
					if(prob(1))
						src.SharinganMastery+=pick(0.05,0.06,0.07,0.08,0.09,0.1)
					sleep(11)
	OneMangekyou()
		if(src.firing)
			return
		if(src.mangekyou)
			src.mangekyou=0;src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.IlluminateOff()
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
			src<<"Você para de usar seu Mangekyou Sharingan.";src.ChakraSight(0);src.Phasing=0
			for(var/obj/Mshar/MM in src.client.screen)
				del(MM)
			if(src.Doujutsu=="Sharingan")
				if(src.MUses>250)
					var/obj/Mshar/MM=new()
					MM.screen_loc = "1,1 to 9,19"
					src.client.screen+=MM
					if(src.MUses>250&&usr.MUses<350)
						MM.icon_state="weak"
					if(src.MUses>=350&&usr.MUses<500)
						MM.icon_state="strong"
					if(src.MUses>=500)
						MM.icon_state="blind"
					if(src.MUses>=600)
						MM.icon_state="blinder"
			if(src.Doujutsu=="Sharingan Right")
				if(src.MUses>250)
					var/obj/Mshar/MM=new()
					MM.screen_loc = "11,1 to 19,19"
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
		else
			if(src.shari)
				src.mangekyou=1;src.ChakraSight(1)
				view(9,src)<<"A pupila de [src] roda rápidamente e forma o Lendário Mangekyou Sharingan!";usr.Illuminate()
				for(var/obj/Mshar/MM in src.client.screen)
					del(MM)
				if(src.Doujutsu=="Sharingan")
					if(src.MUses>350)
						var/obj/Mshar/MM=new()
						MM.screen_loc = "1,1 to 9,19"
						src.client.screen+=MM
						MM.icon_state="weak"
						if(src.MUses>=500)
							MM.icon_state="strong"
						if(src.MUses>=600)
							MM.icon_state="blind"
						if(src.MUses>=700)
							MM.icon_state="blinder"
				if(src.Doujutsu=="Sharingan Right")
					if(src.MUses>250)
						var/obj/Mshar/MM=new()
						MM.screen_loc = "11,1 to 19,19"
						src.client.screen+=MM
						if(src.MUses>250&&usr.MUses<350)
							MM.icon_state="weak"
						if(src.MUses>=350&&usr.MUses<500)
							MM.icon_state="strong"
						if(src.MUses>=500)
							MM.icon_state="blind"
						if(src.MUses>=600)
							MM.icon_state="blinder"
						if(src.MUses>=700)
							MM.icon_state="blinder"
				if(findtext(usr.mangekyouC,"madaraleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Phase
				if(findtext(usr.mangekyouC,"shurikenright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/TimeCollaboration
				if(findtext(usr.mangekyouC,"itachileft",1,0)||findtext(usr.mangekyouC,"sasukeright",1,0)||findtext(usr.mangekyouC,"madararight",1,0)||findtext(usr.mangekyouC,"starright",1,0)||findtext(usr.mangekyouC,"gridlockleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Tsukiyomi
				if(findtext(usr.mangekyouC,"itachiright",1,0)||findtext(usr.mangekyouC,"sasukeleft",1,0)||findtext(usr.mangekyouC,"bladedleft",1,0)||findtext(usr.mangekyouC,"shurikenleft",1,0)||findtext(usr.mangekyouC,"niroleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Amateratsu
				if(findtext(usr.mangekyouC,"sasukeright",1,0)||findtext(usr.mangekyouC,"bladedleft",1,0)||findtext(usr.mangekyouC,"starleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/AmateratsuProjectile
				if(findtext(usr.mangekyouC,"gridlockright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/WhiteAmateratsuProjectile
					src.LearnedJutsus+=new/obj/SkillCards/WhiteAmaterasu360
				if(findtext(usr.mangekyouC,"kakashileft",1,0)||findtext(usr.mangekyouC,"bladedleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Kamui
				if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"niro",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Susanoo
				if(findtext(usr.mangekyouC,"shisuiright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/MindGenjutsu
					src.LearnedJutsus+=new/obj/SkillCards/Invisibility
					src.LearnedJutsus+=new/obj/SkillCards/FalseBunshin
				while(src.mangekyou&&src.chakra>0)
					sleep(100);src.stamina-=(src.maxstamina/100);src.chakra-=(src.Mchakra/60)
					if(prob(10)&&src.MUses>(-30000))//Was -5000
						if(!src.invisibility)
							src.Bloody()
						src.health-=50
				if(src.chakra<=10&&src.mangekyou)
					src<<"Você é incapaz de sustentar o Mangekyou Sharingan com seu nivel de chakra atual entao ele é desativado.."
					src.OneMangekyou()
					return
			else
				src<<"Ative seu sharingan regular primeiro!.";return
	OneMangekyouShisui()
		if(src.firing)
			return
		if(src.mangekyou)
			src.mangekyou=0;src.MUses=-5000;src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.IlluminateOff()
			if(src.MUses>=0)
				src.MUses=-10000000
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
			src<<"Você desativa seu Mangekyou Sharingan.";src.ChakraSight(0);src.Phasing=0
			if(src.SusanooIn)
				for(var/obj/Jutsu/Uchiha/Susanoo/A in world)
					if(A.Owner==src)
						del(A)
				src.SusanooIn=0
			/*if(src.MUses>250)
				var/obj/Mshar/MM=new()
				MM.screen_loc = "1,1 to 10,10"
				src.client.screen+=MM
				if(src.MUses>250&&usr.MUses<350)
					MM.icon_state="weak"
				if(src.MUses>=350&&usr.MUses<500)
					MM.icon_state="strong"
				if(src.MUses>=500)
					MM.icon_state="blind"
				if(src.MUses>=600)
					MM.icon_state="blinder"*/
		else
			if(src.shari)

				src.mangekyou=1;src.ChakraSight(1)
				view(9,src)<<"A pupila de [src] gira e transforma no Mangekyou Sharingan Eterno";usr.Illuminate()
				for(var/obj/Mshar/MM in src.client.screen)
					del(MM)
				if(findtext(usr.mangekyouC,"madaraleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Phase
				if(findtext(usr.mangekyouC,"shurikenright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/TimeCollaboration
				if(findtext(usr.mangekyouC,"itachileft",1,0)||findtext(usr.mangekyouC,"sasukeright",1,0)||findtext(usr.mangekyouC,"madararight",1,0)||findtext(usr.mangekyouC,"starright",1,0)||findtext(usr.mangekyouC,"gridlockleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Tsukiyomi
				if(findtext(usr.mangekyouC,"itachiright",1,0)||findtext(usr.mangekyouC,"sasukeleft",1,0)||findtext(usr.mangekyouC,"bladedleft",1,0)||findtext(usr.mangekyouC,"shurikenleft",1,0)||findtext(usr.mangekyouC,"niroleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Amateratsu
				if(findtext(usr.mangekyouC,"sasukeright",1,0)||findtext(usr.mangekyouC,"bladedleft",1,0)||findtext(usr.mangekyouC,"starleft",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/AmateratsuProjectile
				if(findtext(usr.mangekyouC,"gridlockright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/WhiteAmateratsuProjectile
					src.LearnedJutsus+=new/obj/SkillCards/WhiteAmaterasu360
				if(findtext(usr.mangekyouC,"kakashileft",1,0)||findtext(usr.mangekyouC,"bladedright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Kamui
				if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"niro",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/Susanoo
				if(findtext(usr.mangekyouC,"shisuiright",1,0))
					src.LearnedJutsus+=new/obj/SkillCards/MindGenjutsu
					src.LearnedJutsus+=new/obj/SkillCards/Invisibility
					src.LearnedJutsus+=new/obj/SkillCards/FalseBunshin
				while(src.mangekyou)
					sleep(100);src.stamina-=(src.maxstamina/100);src.chakra-=(rand(50,75))
					if(prob(10)&&src.MUses> (-10000))
						if(src.invisibility<=1)
							src.Bloody()
						src.health-=50
			else
				src<<"Ative seu sharingan regular primeiro.";return

obj/Jutsu/Uchiha

	AMAProject
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
					src.SoundEngine('SFX/FireSFX.wav',5)
			spawn(100)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner

				var/damage=round(O.nin*rand(25,50)*0.4);M.DamageProc(damage,"Health",O);M.DamageProc(damage,"Stamina",O)

				src.loc=M.loc
			if(istype(A,/obj/))
				return 0
		Move()
			var/obj/Jutsu/Uchiha/AMATrail/Z=new();Z.loc=src.loc;Z.dir=src.dir;Z.Owner=src.Owner
			..()
	LightAMAProject
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state = "WhiteAmaProjectile"

		layer=MOB_LAYER+2
		density = 1
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(11)
					src.SoundEngine('SFX/FireSFX.wav',100)
			spawn(100)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner

				var/damage=round(O.nin*rand(25,50)*0.4);M.DamageProc(damage,"Health",O);M.DamageProc(damage,"Stamina",O)

				src.loc=M.loc
			if(istype(A,/obj/))
				return 0
		Move()
			var/obj/Jutsu/Uchiha/LightAMATrail/Z=new();Z.loc=src.loc;Z.dir=src.dir;Z.Owner=src.Owner
			..()
	BlackGouryuuka
		icon='Icons/Jutsus/KatonTechsBlack.dmi'
		G1
			icon_state="Gouryuuka1"
			density=0
			layer=MOB_LAYER+1


		G2
			icon_state="Gouryuuka2"
			density=0
			layer=MOB_LAYER+1

		G3
			icon_state="Gouryuuka3"
			density=1
			layer=MOB_LAYER
			var/nin=10
			New()
				..()
				spawn(100)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.Kaiten||M.sphere)
						del(src)
					var/mob/O=src.Owner
					var/damage=round(rand(src.nin*4,src.nin*7))
					if(M.PaperStyleDance)
						M.PaperStyleDance=0
					M.DamageProc(damage*(1/3),"Stamina",O)
					M.DamageProc(damage*(2/3),"Health",O)
					M.SoundEngine('HitStrong.wav',10)
					if(M.PaperStyleDance)
						M.PaperStyleDance=0
					if(M.RaiArmor)
						M.overlays-='Icons/Jutsus/RaiArmor.dmi'
						M.RaiArmor=0
					if(!M.knockedout&&M.Status=="")
						M.Status="Burn"
						M.StatusEffected=70
					view(M)<<output("<font color=red>[M] levou dano do Gouryuuka!([damage])</font>","Attack")
					spawn(1) M.dir=src.dir;M.HitBack(4,src.dir)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/Jutsu/Elemental/))
					var/obj/Jutsu/Elemental/E=A
					var/mob/O=src.Owner
					var/damage=round(src.nin*pick(0.9,1))
					if(E.Element=="Mokuton"||E.Element=="Hyouton")
						damage*=2
					E.DamageProc((damage),"Stamina",O)
					del(src)
				else if(istype(A,/obj/))
					del(src)
			Del()
				var/mob/O=src.Owner
				var/A=rand(8,12)
				while(A>0)
					src.AmaterasuFire()
					A--
				sleep(2)
				var/num=8
				var/loldir=src.dir
				while(num>0)
					var/obj/Jutsu/Uchiha/SmallAmat/K=new();K.icon_state="AmatSmall";K.Owner=O;K.loc=src.loc;K.nin=src.nin/20;K.dir=loldir;walk(K,K.dir)
					loldir=turn(loldir,45)
					num--
				..()
		G4
			icon_state="Gouryuuka4"
			density=1
			layer=MOB_LAYER
	SmallAmat
		icon='Icons/Jutsus/KatonTechniques.dmi'
		icon_state="AmatSmall"
		layer=MOB_LAYER+2
		density = 1
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(11)
					src.SoundEngine('SFX/FireSFX.wav',100)

			spawn(600)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M==O)
					src.loc=M.loc;return
				var/damage=round(src.nin*rand(5,7))
				M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Stamina",O)
				if(!M.knockedout&&M.Status=="")
					M.Status="Burn"
					M.StatusEffected=70
				src.loc=M.loc;del(src)
			if(istype(A,/obj/))
				return 0
			if(istype(A,/turf/))
				del(src)
/////////////Evanesence Blade//////////////////////
	SmallYellowChakra
		icon='Icons/Jutsus/EvanesenceTech.dmi'
		icon_state="EvanSmallBlast"
		layer=MOB_LAYER+2
		density = 1
		var/nin=30
		New()
			..()
			spawn()
				while(src)
					sleep(11)
					src.SoundEngine('SFX/FireSFX.wav',100)

			spawn(600)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M==O)
					src.loc=M.loc;return
				var/damage=round(src.nin*rand(9,10))
				M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Stamina",O)
				src.loc=M.loc;del(src)
			if(istype(A,/obj/))
				return 0
			if(istype(A,/turf/))
				del(src)


////////////////////LIGHT BLADE//////////////////////////////////////////////
	LightGouryuuka
		icon='Icons/Jutsus/WhiteLightBlade.dmi'
		G1
			icon_state="Gouryuuka1"
			density=0
			layer=MOB_LAYER+1


		G2
			icon_state="Gouryuuka2"
			density=0
			layer=MOB_LAYER+1

		G3
			icon_state="Gouryuuka3"
			density=1
			layer=MOB_LAYER
			var/nin=10
			New()
				..()
				spawn(100)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					if(M.Kaiten||M.sphere)
						del(src)
					var/mob/O=src.Owner
					var/damage=round(rand(src.nin*4,src.nin*7))
					if(M.PaperStyleDance)
						M.PaperStyleDance=0
					M.DamageProc(damage*(1/3),"Stamina",O)
					M.DamageProc(damage*(2/3),"Health",O)

					M.SoundEngine('HitStrong.wav',10)
					if(M.PaperStyleDance)
						M.PaperStyleDance=0
					if(M.RaiArmor)
						M.overlays-='Icons/Jutsus/RaiArmor.dmi'
						M.RaiArmor=0
					view(M)<<output("<font color=red>[M] levou dano do gouryuuka!([damage])</font>","Attack")
					spawn(1) M.dir=src.dir;M.HitBack(4,src.dir)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/Jutsu/Elemental/))
					var/obj/Jutsu/Elemental/E=A
					var/mob/O=src.Owner
					var/damage=round(src.nin*pick(0.9,1))
					if(E.Element=="Mokuton"||E.Element=="Hyouton")
						damage*=2
					E.DamageProc((damage),"Stamina",O)
					del(src)
				else if(istype(A,/obj/))
					del(src)
			Del()
				var/mob/O=src.Owner
				var/A=rand(8,12)
				while(A>0)
					src.AmaterasuFire()
					A--
				sleep(2)
				var/num=8
				var/loldir=src.dir
				while(num>0)
					var/obj/Jutsu/Uchiha/SmallAmat/K=new();K.icon_state="AmatSmall";K.Owner=O;K.loc=src.loc;K.nin=src.nin/20;K.dir=loldir;walk(K,K.dir)
					loldir=turn(loldir,45)
					num--
				..()
		G4
			icon_state="Gouryuuka4"
			density=1
			layer=MOB_LAYER
	LightSmallAmat
		icon='Icons/Jutsus/WhiteLightBlade.dmi'
		icon_state="AmatSmall"
		layer=MOB_LAYER+2
		density = 1
		var/nin=10
		New()
			..()
			spawn()
				while(src)
					sleep(11)
					src.SoundEngine('SFX/FireSFX.wav',100)

			spawn(600)
				del(src)
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M==O)
					src.loc=M.loc;return
				var/damage=round(src.nin*rand(5,7))
				M.DamageProc(damage,"Health",O)
				M.DamageProc(damage,"Stamina",O)
				src.loc=M.loc;del(src)
			if(istype(A,/obj/))
				return 0
			if(istype(A,/turf/))
				del(src)



mob/proc/LightGouryuuka()
	src.health-=150
	src.stamina-=250
	src.ChakraPool-=1000
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/LightGouryuuka/G3/G=new();G.Owner=src;G.nin=src.nin*5
	var/obj/Jutsu/Uchiha/LightGouryuuka/G1/G1=new();G1.icon=G.icon
	var/obj/Jutsu/Uchiha/LightGouryuuka/G2/G2=new();G2.icon=G.icon
	var/obj/Jutsu/Uchiha/LightGouryuuka/G4/G4=new();G4.icon=G.icon
	if(src.dir==SOUTH)
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	if(src.dir==NORTH)
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	if(src.dir==EAST||src.dir==NORTHEAST||src.dir==SOUTHEAST)
		G.pixel_x=-16;G.pixel_y=-16;G4.pixel_x=32
		G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	if(src.dir==WEST||src.dir==NORTHWEST||src.dir==SOUTHWEST)
		G.pixel_x=-16;G.pixel_y=-16;G4.pixel_x=32
		G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
	G.loc=usr.loc
	G.dir=usr.dir;walk(G,G.dir)
mob/proc/LightSmallShot()
	src.stamina-=25
	src.ChakraPool-=50
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/LightSmallAmat/G=new();G.Owner=src;G.nin=src.nin/10
	G.loc=src.loc
	G.dir=usr.dir;walk(G,G.dir)
mob/proc/YellowChakra()
	src.chakra-=rand(300,500)
	src.ChakraPool-=25
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/SmallYellowChakra/D=new();D.Owner=src;D.nin=src.nin/10
	D.loc=src.loc
	D.dir=usr.dir;walk(D,D.dir)
mob/proc/LightShot()
	src.stamina-=100
	src.ChakraPool-=500
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/LightAMAProject/G=new();G.Owner=src;G.nin=src.nin*2.5
	G.loc=src.loc
	G.dir=usr.dir;walk(G,G.dir)


/////////////////////BLACK BLADE/////////////////////////////////////


mob/proc/BlackGouryuuka()
	src.health-=150
	src.stamina-=250
	src.ChakraPool-=1000
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/BlackGouryuuka/G3/G=new();G.Owner=src;G.nin=src.nin*5
	var/obj/Jutsu/Uchiha/BlackGouryuuka/G1/G1=new();G1.icon=G.icon
	var/obj/Jutsu/Uchiha/BlackGouryuuka/G2/G2=new();G2.icon=G.icon
	var/obj/Jutsu/Uchiha/BlackGouryuuka/G4/G4=new();G4.icon=G.icon
	if(src.dir==SOUTH)
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	if(src.dir==NORTH)
		G.pixel_x=-16;G4.pixel_x=32;G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	if(src.dir==EAST||src.dir==NORTHEAST||src.dir==SOUTHEAST)
		G.pixel_x=-16;G.pixel_y=-16;G4.pixel_x=32
		G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	if(src.dir==WEST||src.dir==NORTHWEST||src.dir==SOUTHWEST)
		G.pixel_x=-16;G.pixel_y=-16;G4.pixel_x=32
		G1.pixel_y=32;G2.pixel_x=32;G2.pixel_y=32
	G.overlays+=G1;G.overlays+=G2;G.overlays+=G4
	G.loc=usr.loc
	G.dir=usr.dir;walk(G,G.dir)
mob/proc/BlackSmallShot()
	src.stamina-=25
	src.ChakraPool-=50
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/SmallAmat/G=new();G.Owner=src;G.nin=src.nin/10
	G.loc=src.loc
	G.dir=usr.dir;walk(G,G.dir)
mob/proc/BlackBladeSpread()
	src.stamina-=25
	src.ChakraPool-=50
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/turf/Z=get_step(src.loc,src.dir)
	for(var/turf/P in view(1,Z))
		if(prob(60))
			var/obj/Jutsu/Uchiha/AMATrail/E=new();
			E.Owner=src.Owner
			E.loc=P;
			E.dir=src.dir;

		//	E.nin=60
mob/proc/BlackShot()
	src.stamina-=100
	src.ChakraPool-=500
	src<<"A espada drenou um pouco de sua energia vital para acabar com sua fome..."
	flick("weaponslash",src)
	sleep(1)
	var/obj/Jutsu/Uchiha/AMAProject/G=new();G.Owner=src;G.nin=src.nin*2.5
	G.loc=src.loc
	G.dir=usr.dir;walk(G,G.dir)