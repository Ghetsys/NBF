mob/var/tmp/Skill_Tree=0
mob/var/tmp/clicking=0
mob/var/DarkFlames=0
obj/PassiveUp
	icon='Icons/Jutsus/Skillcards.dmi'
	icon_state="SwiftYes"
	layer=8

	pixel_y=32
	New()
		..()
		spawn(15)
			del(src)
mob/GainedAfterLogIn/verb
	WeaponSkill()
		set hidden=1
		if(usr.Skill_Tree||!usr.loggedin||!usr.cansave)
			usr<<sound('SFX/click2.wav',0)
			client.perspective=MOB_PERSPECTIVE
			client.eye=usr
			usr.Skill_Tree=0
			return
		else
			usr.EquipmentTree=0
			usr<<"Sua visão mudou, mas você ainda está no mesmo lugar."
			usr<<sound('SFX/click1.wav',0)
			usr.Skill_Tree=1
			client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			client.eye=locate(113,182,30)
			return
	ElementalView()
		set name="Informações de Elemento"
		set category="Comandos"
		if(usr.Skill_Tree||!usr.loggedin||!usr.cansave)
			usr<<sound('SFX/click2.wav',0)
			client.perspective=MOB_PERSPECTIVE
			client.eye=usr
			usr.Skill_Tree=0
			return
		else
			usr.EquipmentTree=0
			usr<<"Sua visão mudou, mas você ainda está no mesmo lugar."
			usr<<sound('SFX/click1.wav',0)
			usr.Skill_Tree=1
			client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			client.eye=locate(34,13,30)
			return
	ElementalSkill()
		set hidden=1
		if(usr.Skill_Tree||!usr.loggedin||!usr.cansave)
			usr<<sound('SFX/click2.wav',0)
			client.perspective=MOB_PERSPECTIVE
			client.eye=usr
			usr.Skill_Tree=0
			return
		else
			usr.EquipmentTree=0
			usr<<"Sua visão mudou, mas você ainda está no mesmo lugar."
			usr<<sound('SFX/click1.wav',0)
			usr.Skill_Tree=1
			client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			client.eye=locate(68,182,30)
			return
	GenSkill()
		set hidden=1
		if(usr.Skill_Tree||!usr.loggedin||!usr.cansave)
			usr<<sound('SFX/click2.wav',0)
			client.perspective=MOB_PERSPECTIVE
			client.eye=usr
			usr.Skill_Tree=0
			return
		else
			usr.EquipmentTree=0
			usr<<"Sua visão mudou, mas você ainda está no mesmo lugar."
			usr<<sound('SFX/click1.wav',0)
			usr.Skill_Tree=1
			client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			client.eye=locate(159,182,30)
			return
	JutSkill()
		set hidden=1
		if(usr.Skill_Tree||!usr.loggedin||!usr.cansave)
			usr<<sound('SFX/click2.wav',0)
			client.perspective=MOB_PERSPECTIVE
			client.eye=usr
			usr.Skill_Tree=0
			return
		else
			usr.EquipmentTree=0
			usr<<"Sua visão mudou, mas você ainda está no mesmo lugar."
			usr<<sound('SFX/click1.wav',0)
			usr.Skill_Tree=1
			client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
			client.eye=locate(10,182,1)
			return
	ClanSkill()
		set hidden=1
		if(usr.Skill_Tree||!usr.loggedin||!usr.cansave)
			usr<<sound('SFX/click2.wav',0)
			client.perspective=MOB_PERSPECTIVE
			client.eye=usr
			usr.Skill_Tree=0
			return
		else
			usr.EquipmentTree=0
			usr<<sound('SFX/click1.wav',0)
			if(usr.Clan=="Aburame")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(160,159,30);return
			if(usr.Clan=="Akimichi")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(114,135,30);return
			if(usr.Clan=="Fuuma")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(45,135,30);return
			if(usr.Clan=="Hoshigaki")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(22,135,30);return
			if(usr.Clan=="Hyuuga")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(22,159,30);return
			if(usr.Clan=="Inuzuka")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(114,159,30);return
			if(usr.Clan=="Iwazuka")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(183,111,30);return
			if(usr.Clan=="Kaguya")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(122,116,30);return
			if(usr.Clan=="Ketsueki")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(68,159,30);return
			if(usr.Clan=="Kumojin")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(45,159,30);return
			if(usr.Clan=="Kusakin")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(137,135,30);return
			if(usr.Clan=="Kyomou")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(91,135,30);return
			if(usr.Clan=="Nara")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(91,159,30);return
			if(usr.Clan=="Sabaku")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(160,135,30);return
			if(usr.Clan=="Shiroi")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(183,135,30);return
			if(usr.Clan=="Yotsuki")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(68,135,30);return
			if(usr.Clan=="Uchiha")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(183,159,30)
				usr.ClanPassives()
			if(usr.Clan=="Satou")
				usr<<"Sua visão mudou, mas você ainda está no mesmo lugar.";usr.Skill_Tree=1;client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE;client.eye=locate(92,119,30);return
mob/proc
	ClanPassives()
		for(var/image/I in src.client.images)
			if(I.icon=='Icons/Jutsus/Skilltree.dmi')
				del(I)
		if(src.Clan=="Uchiha")
			var/turf/Sharingan=locate("Sharingan Mastery");var/turf/Sharingan1=locate("Sharingan 1");var/turf/Sharingan2=locate("Sharingan 2");var/turf/Sharingan3=locate("Sharingan 3")
			var/turf/Haste=locate("Haste");var/turf/Goukakyuu=locate("Goukakyuu Mastery");var/turf/DarkFlames=locate("Dark Flames");var/turf/LoveHate=locate("Love and Hate")
			var/turf/Sleep=locate("Sleep");var/turf/Stakes=locate("Stakes");var/turf/Counter=locate("Counter");var/turf/Copy=locate("Copy")

			var/image/I1 = image('Icons/Jutsus/Skilltree.dmi',Sharingan,"Unavailable",110);var/image/I2 = image('Icons/Jutsus/Skilltree.dmi',Sharingan1,"Unavailable",110)
			var/image/I3 = image('Icons/Jutsus/Skilltree.dmi',Sharingan2,"Unavailable",110);var/image/I4 = image('Icons/Jutsus/Skilltree.dmi',Sharingan3,"Unavailable",110)
			var/image/I5 = image('Icons/Jutsus/Skilltree.dmi',Haste,"Unavailable",110);var/image/I6 = image('Icons/Jutsus/Skilltree.dmi',Goukakyuu,"Unavailable",110)
			var/image/I7 = image('Icons/Jutsus/Skilltree.dmi',DarkFlames,"Unavailable",110);var/image/I8 = image('Icons/Jutsus/Skilltree.dmi',LoveHate,"Unavailable",110)
			var/image/I9 = image('Icons/Jutsus/Skilltree.dmi',Sleep,"Unavailable",110);var/image/I10 = image('Icons/Jutsus/Skilltree.dmi',Stakes,"Unavailable",110)
			var/image/I11 = image('Icons/Jutsus/Skilltree.dmi',Counter,"Unavailable",110);var/image/I12 = image('Icons/Jutsus/Skilltree.dmi',Copy,"Unavailable",110)

			if(src.UchihaMastery>=1)
				I5.icon_state="";I6.icon_state=""
				if(src.UchihaMastery>=100)
					I5.icon_state="Achieved";I6.icon_state="Achieved"

			if(src.SharinganMastery>1)
				I1.icon_state="Achieved";I2.icon_state="Achieved";I3.icon_state=""
				if(src.SharinganMastery>=45)
					I3.icon_state="Achieved";I4.icon_state=""
					if(src.SharinganMastery>=91)
						I4.icon_state="Achieved";I9.icon_state="";I10.icon_state="";I11.icon_state="";I12.icon_state=""
						if(locate(/obj/SkillCards/Konsui) in src.LearnedJutsus)
							I9.icon_state="Achieved"
						if(locate(/obj/SkillCards/Kasegui) in src.LearnedJutsus)
							I10.icon_state="Achieved"
						if(locate(/obj/SkillCards/GenjutsuCounter) in src.LearnedJutsus)
							I11.icon_state="Achieved"
						if(locate(/obj/SkillCards/SharinganCopy) in src.LearnedJutsus)
							I12.icon_state="Achieved"

						if(I9.icon_state=="Achieved"&&I10.icon_state=="Achieved"&&I11.icon_state=="Achieved"&&I12.icon_state=="Achieved")
							I7.icon_state=""
							if(src.DarkFlames)
								I7.icon_state="Achieved";I8.icon_state=""
								if(src.LoveAndHate)
									I8.icon_state="Achieved"

			src<<I1;src<<I2;src<<I3;src<<I4;src<<I5;src<<I6;src<<I7;src<<I8;src<<I9;src<<I10;src<<I11;src<<I12
		else
			var/turf/Uchiha=locate("Uchiha Mastery")
			var/image/I = image('Icons/Jutsus/Skilltree.dmi',Uchiha,"Unavailable",110)
			src<<I


turf
	Skilltree
		icon = 'Icons/Jutsus/Skilltree.dmi'
		Unavailble
			icon_state="Unavailable"
			layer=MOB_LAYER+99
		Background
			icon='PNG/ST copy.PNG'
			layer =4
		Left_Right
			icon_state = "Left - Right"
			layer = MOB_LAYER+98
		Up_Down
			icon_state = "Up - Down"
			layer = MOB_LAYER+98
		Turn
			icon_state = "Turn"
			layer = MOB_LAYER+98
		JutsuTreeTai
			layer=MOB_LAYER+100
			icon='PNG/Hud/Taijutsu.png'
			Click()
				usr.EquipmentTree=0
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(10,159,1)
				usr<<sound('SFX/click1.wav',0)
		JutsuTreeNin
			layer=MOB_LAYER+100
			icon='PNG/Hud/Ninjutsu.png'
			Click()
				usr.EquipmentTree=0
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(33,159,1)
				usr<<sound('SFX/click1.wav',0)
		JutsuTreeGen
			layer=MOB_LAYER+100
			icon='PNG/Hud/Genjutsu.png'
			Click()
				usr.EquipmentTree=0
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(56,159,1)
				usr<<sound('SFX/click1.wav',0)
///////////////////////////////////////////////////////////////
//Basic Jutsu
////////////////////////////////////////////////////////////////////////////////////////////////
turf
	Skilltree/JutsuTree
		layer=MOB_LAYER+98
		icon='Icons/Hud/JutsuTree.dmi'
		Click()
			usr<<sound('SFX/click1.wav',0)
		BunshinTechnique
			name="Bunshin No Jutsu"
			icon_state="Bunshin"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/BunshinJutsu in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Bunshin No Jutsu",200,"BunshinJutsu","Bunshin no Jutsu é uma técnica de clone básico que cria uma imagem de si mesmo. Não é real mas pode ser utilizado para fins de distracção.","Ninjutsu")
		HengeTechnique
			name="Henge No Jutsu"
			icon_state="Henge"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/Henge in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Henge No Jutsu",200,"Henge","Henge no Jutsu é uma técnica ninja básica que disfarça-se na aparência do outro.","Ninjutsu")
		KawaTechnique
			name="Kawarimi No Jutsu"
			icon_state="Subsitution"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/Kawarimi in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Kawarimi No Jutsu",200,"Kawarimi","Kawarimi no Jutsu é um jutsu básico que substitui-lo com um tronco para escapar de danos.","Ninjutsu")
		ExpKawaTechnique
			name="Exploding Kawarimi No Jutsu"
			icon_state="ExpSubsitution"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/ExpKawarimi in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Exploding Kawarimi No Jutsu",6000,"ExpKawarimi","Explosão de Kawarimi no Jutsu é um jutsu de substituição mais avançado que substitui-lo por um tronco que depois de um tempo explodira..","Ninjutsu")
		ShunshinTechnique
			name="Shunshin No Jutsu"
			icon_state="Shunshin"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/Shushin in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Shushin No Jutsu",500,"Shushin","Shushin No Jutsu é uma técnica de cintilação do corpo para o movimento de alta velocidade através de uma curta distância.","Ninjutsu")
		NawanukeTechnique
			name="Escaping Skill"
			icon_state="Nawanuke"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/Nawanuke in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Escaping Skill",1000,"Nawanuke","A técnica básica Ninpo que permite que um ninja para escapar de fios. Muito útil..","Ninjutsu")
		Choke
			name="Choke"
			icon_state="Choke"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/Choke in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Choke",8500,"Choke","Estrangulamento é uma técnica física poderosa para pegar um adversário pelo pescoço e sufocá-los.","Taijutsu")
		HiddenLotus//HiddenLotus
			name="Hidden Lotus"
			icon_state="Gate2"
			Click()
				var/list/P=usr.LearnedJutsus
				if(/obj/SkillCards/HiddenLotus in P)
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")
					return
				else if(usr.ViewGate!=1)
					usr<<"Você precisa aprender o Sexta Portão para aprender este jutsu!";return
				else
					usr.LearnJutsu("Hidden Lotus",100000,"HiddenLotus","Lotus oculta é um jutsu que exigi o uso de portas de chakra, o usuário é capaz de correr na velocidade da luz, destruindo o corpo do adversário com socos como uma bola de pingue-pongue..","Taijutsu")
		GateAssault//GateAssault
			name="Gates Assault"
			icon_state="Gate1"
			Click()
				var/list/P=usr.LearnedJutsus
				if(/obj/SkillCards/GateAssault in P)
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")
					return
				else if(usr.LifeGate!=1)
					usr<<"Você precisa aprender o Quarto Portão para aprender este jutsu!";return
				else
					usr.LearnJutsu("Gates Assault",75000,"GateAssault","Portões assalto é um jutsu que permite que você bater o seu adversário com força brutal em alta velocidade para que eles não têm tempo para se defender.","Taijutsu")
		Gateprimaria//lotusprimaria
			name="Lótus Primária"
			icon_state="Gate3"
		ChokeSlam
			name="Choke"
			icon_state="ChokeSlam"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/Choke in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else if(!(locate(/obj/SkillCards/Choke) in A))
					usr<<"Você precisa aprender o Estrangulamento para aprender este jutsu!";return
				else
				//	usr.LearnJutsu("Choke Slam",8500,"ChokeSlam","Choke is a powerful physical technique to pick up an opponent by the neck, and suffocate them, but by then slamming them, even more damage is caused!","Taijutsu")
		FingerPush
			name="Finger Push"
			icon_state="FingerPush"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/FingerPush in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					if(usr.rank!="Special Jounin"&&usr.rank!="Jounin"&&usr.rank!="Hokage"&&usr.rank!="Tsuchikage"&&usr.rank!="Otokami"&&usr.rank!="Amekoutei")
						usr<<"Você precisa ser pelo menos um Jounin especial para ganhar este jutsu.";return
					usr.LearnJutsu("Finger Push",5000,"FingerPush","Dedo impulso é uma technqiue física que requer pouco esforço, mas extremo taijutsu. Usando um dedo ele passa rapidamente um adversário depressa em uma grande área muito rapidamente, causando pequenos danos.","Taijutsu")
		ExplodingFormation
			name="Exploding Formation"
			icon_state="ExplodingFormation"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/ExplodingFormation in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Exploding Formation",5000,"ExplodingFormation","Formação de explosão é uma técnica ninjutsu que explode todas as Etiquetas de explosão do usuario, ao mesmo tempo, em vez de separadamente. .","Ninjutsu")
		PersonSwapJutsu
			name="Person Swap Jutsu"
			icon_state="PerSubsitution"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/BodySwitch in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//		color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Person Swap Jutsu",10000,"BodySwitch","O Jutsu Substituto de Pessoa é uma técnica que permite que você troque as posições depressa com outra pessoa concedidas que não são hábeis o suficiente para impedi-lo..","Ninjutsu")
		BunshinSubstitution
			name="Clone Substitution Jutsu"
			icon_state="Bunshin Swap"
			Click()
				var/list/A=usr.LearnedJutsus
				if(/obj/SkillCards/BunshinSubsitutionJutsu in A)
				//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
					sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
					return
				else
					usr.LearnJutsu("Clone Substitution Jutsu",5000,"BunshinSubsitutionJutsu","Um jutsu de substituição rápida, que cria um clone de sombra para tomar o seu lugar enquanto você é capaz de fazer uma fuga rápida.","Ninjutsu")

turf
	Skilltree/ArvoreJutsus
		layer=MOB_LAYER+98
		icon='Icons/Jutsus/Skillcards.dmi'
		Click()
			usr<<sound('SFX/click1.wav',0)
		Uzumaki
			KageBushi
				name="Jutsu Clone da Sombra"
				icon_state="KageBunshin"
				Click()
					var/list/A=usr.LearnedJutsus
					if(/obj/SkillCards/KageBunshin in A)
					//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
						return
					if(usr.NinjutsuKnowledge<30)
						usr<<"Você precisa de 30 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					else
						usr.LearnJutsu("Clone da Sombra",40000,"KageBunshin","O Jutsu Clone da Sombra, faz um clone com metade do seu chakra atual controlavel e denso.","Ninjutsu");return
			TajuKageBushi
				name="Jutsu Clone da Sombra"
				icon_state="TKageBunshin"
				Click()
					if(usr.NinjutsuKnowledge<100)
						usr<<"Você precisa de 100 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/KageBunshin) in usr.LearnedJutsus)
						usr.LearnJutsu("Multiplos clones da Sombra",50000,"TKageBunshin","Multiplos clones da Sombra , é um Jutsu de Multiplos Clones densos da Sombra que Sao controlaveis pelo mouse!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Jutsu clone da Sombra primeiro";return
			RasenganSkill
				name="Rasengan"
				icon_state="Rasengan"
				Click()
					if(usr.NinjutsuKnowledge<200)
						usr<<"Você precisa de 200 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/KageBunshin) in usr.LearnedJutsus)
						usr.LearnJutsu("Rasengan",100000,"Rasengan","Rasengan é uma tecnica poderosa, que gira o chakra na mão do usuario rapidamente, e quanto mais carregado mais forte é o impacto!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Jutsu clone da Sombra primeiro";return
			KageBusExplosao
				name="Clone da Sombra Explosivo"
				icon_state="BakuretsuBunshin"
				Click()
					if(usr.NinjutsuKnowledge<140)
						usr<<"Você precisa de 140 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/KageBunshin) in usr.LearnedJutsus)
						usr.LearnJutsu("Clone da Sombra explosivo",35000,"BakuretsuBunshin","Clone da Sombra explosivo é uma tecnica que faz um clone da sombra ou varios explodirem com seu comando!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Jutsu clone da Sombra primeiro";return
			ShurikenKageBushi
				name="Shuriken Clone das Sombras"
				icon_state="KageShuriken"
				Click()
					if(usr.NinjutsuKnowledge<120)
						usr<<"Você precisa de 120 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/KageBunshin) in usr.LearnedJutsus)
						usr.LearnJutsu("Shuriken Clone das Sombras",18000,"KageShuriken","Shuriken Clone das Sombras duplica shurikens que você usa para causar mais dano e duplicar as shurikens.","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Jutsu clone da Sombra primeiro";return

			CloneSombraAttack
				name="Ataque do Clone da Sombra"
				icon_state="KageBunshin"
				Click()
					if(usr.NinjutsuKnowledge<45)
						usr<<"Você precisa de 45 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/KageBunshin) in usr.LearnedJutsus)
						usr.LearnJutsu("Ataque do Clone da sombra",10000,"KageBunshinAttack","Ataque do Clone da sombra é um jutsu que faz seus clones atacarem qualquer coisa que chegue perto deles sem estar Targetado!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Jutsu clone da Sombra primeiro";return

			MoinhoDaSombra
				name="Shuriken das Sombras"
				icon_state="WindmilClone"
				Click()
					if(usr.NinjutsuKnowledge<55)
						usr<<"Você precisa de 55 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/KageBunshin) in usr.LearnedJutsus)
						usr.LearnJutsu("Shuriken das Sombras",12500,"WindmillCloneAttack","Shuriken das Sombras é uma tecnica que joga um clone da sombra em forma de uma shuriken gigante que recebe dano do clone quando colidir com o inimigo","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Jutsu clone da Sombra primeiro";return

			RasenRengan
				name="Rasenrengan"
				icon_state="doublerasengan2"
				Click()
					if(usr.NinjutsuKnowledge<565)
						usr<<"Você precisa de 565 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/Giant_Rasengan) in usr.LearnedJutsus)
						usr.LearnJutsu("Rasenrengan",125000,"Double_Rasengan","Rasenrengan é uma tecnica onde o Ninja usa primeiro um rasengan comum depois se concentra para criar um igual ele na outra mão, dobrando seu poder destrutivo nas duas mãos!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Rasengan Gigante primeiro";return

			MultiploRasengan
				name="Rasenrengan"
				icon_state="BarragemRasengan"
				Click()
					if(usr.NinjutsuKnowledge<750)
						usr<<"Você precisa de 750 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(locate(/obj/SkillCards/Double_Rasengan) in usr.LearnedJutsus)
						usr.LearnJutsu("Multiplos Rasengan",150000,"RasenganBarrage","Multiplos Rasengan, é uma tecnica que utiliza Clones da sombra com Rasengan's , fazendo assim quando um deles com um rasengan.","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Raserengan primeiro";return

			OodamaRasen
				name="Barragem de Rasengan"
				icon_state="OodamaRasengan"
				Click()
					if(usr.NinjutsuKnowledge<400)
						usr<<"Você precisa de 400 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(usr.Mchakra<6500)
						usr<<"Você não tem chakra o suficiente para aprender isso.";return
					if(locate(/obj/SkillCards/Rasengan) in usr.LearnedJutsus)
						usr.LearnJutsu("Rasengan Gigante",150000,"Giant_Rasengan","Rasengan gigante, é um jutsu usado em conjunto com o rasengan , duplicando seu tamanho e seu poder destrutivo!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Barragem de rasengan Primeiro primeiro";return


			CombNarutoUzu
				name="Combo Naruto Uzumaki"
				icon_state="Combo Naruto Uzumaki"
				Click()
					if(usr.NinjutsuKnowledge<400)
						usr<<"Você precisa de 400 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					if(usr.Mchakra<6500)
						usr<<"Você não tem chakra o suficiente para aprender isso.";return
					if(locate(/obj/SkillCards/Rasengan) in usr.LearnedJutsus)
						usr.LearnJutsu("Rasengan Gigante",150000,"Giant_Rasengan","Rasengan gigante, é um jutsu usado em conjunto com o rasengan , duplicando seu tamanho e seu poder destrutivo!","Ninjutsu");return
					else
						usr<<"Você precisa aprender o Barragem de rasengan Primeiro primeiro";return
//
//
		Nara
			KagePossesao
				name="Possesao da Sombra"
				icon_state="KageShibari"
				Click()
					usr.LearnJutsu("Possesão da Sombra",8000,"KageShibari","Possesão da Sombra é uma tecnica de paralizia poderosa , que o usuario controla sua sombra para paralizar um inimigo ou varios.","Ninjutsu");return

			KageEnforcamento
				name="Enforcamento da Sombra"
				icon_state="KageKubiShibari"
				Click()
					var/found=0
					for(var/obj/SkillCards/KageShibari/P in A)
						if(P.type == /obj/SkillCards/KageShibari) found=1
					if(!found)
						usr<<"Você precisa aprender o jutsu possesão da sombra primeiro!";return
					if(usr.ShadowManipulation<35)
						usr<<"Você precisa de 35 de manipulaçao da sombra para aprender este jutsu!";return
					else
						usr.LearnJutsu("Enforcamento da Sombra",30000,"KageKubiShibari","Enforcamento da Sombra é um jutsu usado em conjunto com possesão da sombra , depois de pegar seu inimigo com a sombra use o jutsu para inforca-lo","Ninjutsu");return

			KageAgulhas
				name="Agulhas da Sombra"
				icon_state="KageNui"
				Click()
					var/found=0
					for(var/obj/SkillCards/KageShibari/P in A)
						if(P.type == /obj/SkillCards/KageShibari) found=1
					if(!found)
						usr<<"Você precisa aprender o jutsu possesão da sombra primeiro!";return
					var/found2=0
					for(var/obj/SkillCards/KageKubiShibari/P in A)
						if(P.type == /obj/SkillCards/KageKubiShibari) found2=1
					if(!found2)
						usr<<"Você precisa aprender o jutsu Enforcamento da Sombra primeiro!";return
					if(usr.ShadowManipulation<70)
						usr<<"Você precisa de 70 de manipulaçao da sombra para aprender este jutsu!";return
					else
						usr.LearnJutsu("Agulhas da Sombra",45000,"KageNui","O Jutsu Agulas da sombra é um jutsu usado em conjunto com possesão da sombra , disfere varias agulhas formada pela sombra no inimigo tirando sua vitalidade.","Ninjutsu");return



			DefesaSombra
				name="Defesa da Sombra"
				icon_state="KageHara"
				Click()
					var/found=0
					for(var/obj/SkillCards/KageShibari/P in A)
						if(P.type == /obj/SkillCards/KageShibari) found=1
					if(!found)
						usr<<"Você precisa aprender o jutsu possesão da sombra primeiro!";return
					var/found2=0
					for(var/obj/SkillCards/KageKubiShibari/P in A)
						if(P.type == /obj/SkillCards/KageKubiShibari) found2=1
					if(!found2)
						usr<<"Você precisa aprender o jutsu Enforcamento da Sombra primeiro!";return
					var/found3=0
					for(var/obj/SkillCards/KageNui/P in A)
						if(P.type == /obj/SkillCards/KageNui) found3=1
					if(!found3)
						usr<<"Você precisa aprender o jutsu Agulhas da Sombra primeiro!";return
					if(usr.ShadowManipulation<70)
						usr<<"Você precisa de 70 de manipulaçao da sombra para aprender este jutsu!";return
					else
						usr.LearnJutsu("Defesa da Sombra",30000,"KageHara","Defesa da Sombra é um jutsu derivado do Agulhas da Sombra, cria uma defesa de agulhas de sombra em volta do usuario.","Ninjutsu");return

			EstilonuiSombra
				name="Estilo Nui Sombra de area"
				icon_state="KageNuiArea"
				Click()
					var/found=0
					for(var/obj/SkillCards/KageShibari/P in A)
						if(P.type == /obj/SkillCards/KageNui) found=1
					if(!found)
						usr<<"Você precisa aprender o jutsu Agulhas da Sombra primeiro!";return
					if(usr.ShadowManipulation<75)
						usr<<"Você precisa de 75 de manipulaçao da sombra para aprender este jutsu!";return
					else
						usr.LearnJutsu("Estilo Nui Sombra de area",50000,"KageNuiField","É uma forma avançada da Agulha da sombra , com o dano aumentado e formas diferentes.","Ninjutsu");return


			PerfuSombra
				name="Perfuração da Sombra violenta"
				icon_state="Perfuracao da Sombra violenta"
				Click()
					var/found=0
					for(var/obj/SkillCards/KageShibari/P in A)
						if(P.type == /obj/SkillCards/KageNui) found=1
					if(!found)
						usr<<"Você precisa aprender o jutsu Agulhas da Sombra primeiro!";return
					if(usr.ShadowManipulation<80)
						usr<<"Você precisa de 80 de manipulaçao da sombra para aprender este jutsu!";return
					else
						usr.LearnJutsu("Perfuração da Sombra violenta",75000,"ForrbiddenShadowArtMassiveNuiOnslaught","um dos jutsus mais fortes de nara,um monte de sombras saem do usuário perfurando o oponente dolorosamente e bem devagar.","Ninjutsu");return

//


		Hyuuga
			Rotacao
				name="Rotação"
				icon_state="Kaiten"
				Click()
					usr.LearnJutsu("Kaiten",15000,"Kaiten","Kaiten é um jutsu que joga tudo e todo projetil longe , é considerado uma defesa quase absoluta.","Taijutsu");return

			SeQatoGolpe
				name="64 Golpes"
				icon_state="Rokujuu"
				Click()
					if(usr.StanceMastery<35)
						usr<<"Você precisa de 35 de mestre da estancia!";return
					if(usr.ByakuganMastery<25)
						usr<<"Você precisa de 25 de conhecimento no Byakugan!";return
					else
						usr.LearnJutsu("Hakke Rokujonyonshou 64 golpes",30000,"Rokujuu","É uma poderosa tecnica do clan , o shinobi atinge 64 pontos de chakra do inimigo , o impedindo de moldar chakra temporariamente.","Taijutsu");return

			KaiKizu
				name="Kaiten Kizu"
				icon_state="KaitenKizu"
				Click()
					var/found=0
					for(var/obj/SkillCards/Kaiten/P in A)
						if(P.type == /obj/SkillCards/Kaiten) found=1
					if(!found)
						usr<<"Você precisa aprender o Kaiten Primeiro!";return
					if(usr.StanceMastery<50)
						usr<<"Você precisa de 50 de mestre da estancia!";return
					else
						usr.LearnJutsu("Kaiten Kizu",35000,"KaitenKizu","Kaiten kizu , é uma tecnica derivada do Kaiten rotação , so que ao inves de jogar tudo em volta para longe o atrai , todo inimigo que estiver por perto.","Taijutsu");return

			HakeKushou
				name="Palma de Ar"
				icon_state="Impenetrable"
				Click()
					if(usr.StanceMastery<50)
						usr<<"Você precisa de 50 de mestre da estancia!";return
					if(usr.ByakuganMastery<50)
						usr<<"Você precisa de 50 de conhecimento no Byakugan!";return
					else
						usr.LearnJutsu("Hakke Kuushou",15000,"Kuusho","Hakke Kuushou palma do ar , desfere uma invisivel rajada de ar que acerta o inimigo mandando-o para longe!","Taijutsu");return


			Palmada
				name="Palmada"
				icon_state="Kuusho"
				Click()
					if(usr.StanceMastery<30)
						usr<<"Você precisa de 30 de mestre da estancia!";return
					if(usr.ByakuganMastery<75)
						usr<<"Você precisa de 75 de conhecimento no Byakugan!";return
					else
						usr.LearnJutsu("Palm Thrust",25000,"PalmThrust","É um taijutsu onde se utiliza o estilo Jyuken aonde o hyuuga da uma palmada com chakra nos seu adversario, jogando-o para longe.","Taijutsu");return

//


		Mokuton
			BarreiraMadeira
				name="Jutsu Domo de Madeira"
				icon_state="MokuShouheki"
				Click()
					usr.LearnJutsu("Jutsu Domo de Madeira",12000,"MokuShouheki","Jutsu Domo de Madeira faz pilares de madeira aparecem da esquerda e da direita. Os pilares de madeira une-se em uma forma de cúpula com o usuário no centro..","Mokuton");return

			FlorestMokuton
				name=" Surgimento da Floresta Escura"
				icon_state="JukaiKoutan"
				Click()
					usr.LearnJutsu("Surgimento da Floresta Escura",35000,"JukaiKoutan","Surgimento da Floresta Escura faz o usuario capaz de transformar uma área em uma vasta floresta em questão de momentos com árvores completas em qualquer tipo de terreno que ele esteja...","Mokuton");return

			EspinhosMokuton
				name="Espinhos de Madeira"
				icon_state="WoodSpikes"
				Click()
					usr.LearnJutsu("Espinhos de Madeira",15000,"WoodSpikes","Espinhos de Madeira cria varios epsinhos apartir de frente ao usuario, perfurando tudo oque esta em sua frente.","Mokuton");return

			GrandFloresta
				name="Técnica da Grande Floresta"
				icon_state="Técnica da Grande Floresta"
				Click()return

			Paredemadeira
				name="Parede de madeira"
				icon_state="Parede de madeira"
				Click()return

			TecnicaEstacas
				name="Técnica das Estacas"
				icon_state="Técnica das Estacas"
				Click()return




		Inuzuka
			QuatroPatas
				name="Shikyaku"
				icon_state="Shikyaku"
				Click()
					usr.LearnJutsu("Jutsu 4 Patas",8000,"Shikyaku","É um jutsu aonde um inuzuka fica com suas mâos e pes no châo imitando um cachorro , isso lhe da algumas habilidades adicionais de cachorro.","Taijutsu");return

			UnhasCachorro
				name="Garras da Besta"
				icon_state="BeastClaws"
				Click()
					usr.LearnJutsu("Homem-Besta Garras",10000,"BeastClaws","Um inuzuka cria garras com seu chakra , igual de um cachorro que pode ser fundido com chakra tornando o parecido com uma espada em cada uma das mãos.","Taijutsu");return

			CachoExplosiv
				name="Cachorro Explosivo"
				icon_state="ExplodingPuppy"
				Click()
					usr.LearnJutsu("Cachorro Explosivo",12000,"ExplodingPuppy","É um jutsu aonde o inuzuka explode seu cachorro , lançando kunais para todos os lados com a explosão.","Ninjutsu");return


			TransCachorro
				name="Transformar Cachorro"
				icon_state="JuujinBunshin"
				Click()
					var/found=0
					for(var/obj/SkillCards/Shikyaku/P in A)
						if(P.type == /obj/SkillCards/Shikyaku) found=1
					if(!found)
						usr<<"Você precisa aprender o Jutsu 4 patas primeiro!";return
					if(usr.Training<20)
						usr<<"Você precisa de 20 da passiva de Treinamento!";return
					else
						usr.LearnJutsu("Homem-Besta Clone",15000,"JuujinBunshin","É um jutsu aonde o inuzuka transforma seu cachorro em um clone de si, podendo usar jutsus adicionais com ele.","Ninjutsu");return



			Tsuuga
				name="Tsuuga"
				icon_state="Tsuuga"
				Click()
					var/found=0
					for(var/obj/SkillCards/Shikyaku/P in A)
						if(P.type == /obj/SkillCards/Shikyaku) found=1
					if(!found)
						usr<<"Você precisa aprender o Jutsu 4 patas primeiro!";return

					if(usr.Training<30)
						usr<<"Você precisa de 30 da passiva de Treinamento!";return
					if(usr.Canine<5)
						usr<<"Você precisa de 5 da passiva canina!";return
					else
						usr.LearnJutsu("Tsuuga",20000,"Tsuuga","é um jutsu aonde o usuario sozinho gira violentamento , podendo acertar seus oponentes ao encosta-los.","Taijutsu");return



			Gatsuuga
				name="Gatsuuga"
				icon_state="Gatsuuga"
				Click()
					var/found=0
					for(var/obj/SkillCards/Shikyaku/P in A)
						if(P.type == /obj/SkillCards/Shikyaku) found=1
					if(!found)
						usr<<"Você precisa aprender o Jutsu 4 patas primeiro!";return
					var/found2=0
					for(var/obj/SkillCards/Tsuuga/P in A)
						if(P.type == /obj/SkillCards/Tsuuga) found2=1
					if(!found2)
						usr<<"Você precisa aprender o jutsu Tsuuga primeiro!";return
					if(usr.Training<35)
						usr<<"Você precisa de 35 da passiva de Treinamento!";return
					if(usr.Canine<10)
						usr<<"Você precisa de 10 da passiva canina!";return
					else
						usr.LearnJutsu("Gatsuuga",35000,"Gatsuuga","É um jutsu poderoso, aonde o ninja utiliza o Tsuuga junto com seu cachorro , formando assim dois tornados muito forte , capaz de matar um oponente rapidamente.","Taijutsu");return




			LoboDuasCab
				name="Lobo de duas cabeças"
				icon_state="DoubleHeadedWolf"
				Click()
					var/found=0
					for(var/obj/SkillCards/Shikyaku/P in A)
						if(P.type == /obj/SkillCards/Gatsuuga) found=1
					if(!found)
						usr<<"Você precisa aprender o Gatsuuga primeiro!";return
					if(usr.Training<35)
						usr<<"Você precisa de 35 da passiva de Treinamento!";return
					if(usr.Canine<50)
						usr<<"Você precisa de 50 da passiva canina!";return
					else
						usr.LearnJutsu("Lobo de Duas Cabeças",50000,"DoubleHeadedWolf","É um jutsu supremo do clan Inuzuka, O Inuzuka se funde com seu cachorro , se transformando em um lobo de duas cabeças!","Taijutsu");return


			LoboDuasCabTornado
				name="Tornado do Lobo"
				icon_state="Haki"
				Click()
					var/found=0
					for(var/obj/SkillCards/DoubleHeadedWolf/P in A)
						if(P.type == /obj/SkillCards/DoubleHeadedWolf) found=1
					if(!found)
						usr<<"Você precisa aprender o Lobo de Duas Cabeças primeiro!";return
					if(usr.Training<35)
						usr<<"Você precisa de 35 da passiva de Treinamento!";return
					if(usr.Canine<50)
						usr<<"Você precisa de 50 da passiva canina!";return
					else
						usr.LearnJutsu("Tornado do Lobo",50000,"Garouga","Esse jutsu cria um dano e uma devastação gigantes, e eleito o melhor jutsu do clan Inuzuka!","Taijutsu");return
//


		Gouken
			KonhaReppu
				name="Renppu"
				icon_state="Renppu"
				Click()
					if(usr.TaijutsuKnowledge<50)
						usr<<"Você precisa de no minimo 40 de conhecimento em Taijutsu.";return
					else
						usr.LearnJutsu("Konoha Reppu",9000,"KonohaReppu","O ataque é um giro de chute baixo simples, mas um usuário forte o suficiente pode enviar um adulto grande voando como se não pesasse nada.","Taijutsu");return

			KonhaSenppu
				name="Senpuu"
				icon_state="Senpuu"
				Click()
					if(usr.TaijutsuKnowledge<75)
						usr<<"Você precisa de no minimo 75 de conhecimento em Taijutsu.";return
					else
						usr.LearnJutsu("Konoha Senpuu",9000,"KonohaSenpuu","Um taijutsu onde se inicia uma sucessão de chutes altos e chutes baixos.","Taijutsu");return


			KonhaGourikiSenppu
				name="KonohaGorikiSenpu"
				icon_state="KonohaGorikiSenpu"
				Click()
					var/found=0
					for(var/obj/SkillCards/KonohaSenpuu/P in A)
						if(P.type == /obj/SkillCards/KonohaSenpuu) found=1
					if(!found)
						usr<<"Você precisa aprender o Konoha Senppu primeiro!";return

					if(usr.TaijutsuKnowledge<150)
						usr<<"Você precisa de no minimo 150 de conhecimento em Taijutsu.";return
					else
						usr.LearnJutsu("Konoha Gouriki Senpuu",18000,"KonohaGenkurikiSenpuu","Um taijutsu usando uma combinação de velocidade e poder. A essência desta técnica está concentrada em um chute giratório, com tal velocidade que uma única pessoa não pode acompanhar o movimento, esmagando o inimigo com uma força avassaladora..","Taijutsu");return

			KonhaDaiSenppu
				name="DaiSenpuu"
				icon_state="DaiSenpuu"
				Click()
					var/found=0
					for(var/obj/SkillCards/KonohaSenpuu/P in A)
						if(P.type == /obj/SkillCards/KonohaSenpuu) found=1
					if(!found)
						usr<<"Você precisa aprender o Konoha Senppu primeiro!";return

					if(usr.TaijutsuKnowledge<100)
						usr<<"Você precisa de no minimo 100 de conhecimento em Taijutsu.";return
					else
						usr.LearnJutsu("Konoha Dai Senpuu",15000,"KonohaDaiSenpuu","Esta técnica é uma série de ataques de chutes, começando com um chute baixo, ligado em um chute de médio e chute alto e depois terminando com uma queda de calcanhar..","Taijutsu");return

			KonhaDaiSenkou
				name="Daisenko"
				icon_state="Daisenko"
				Click()
					var/found=0
					for(var/obj/SkillCards/KonohaSenpuu/P in A)
						if(P.type == /obj/SkillCards/KonohaDaiSenpuu) found=1
					if(!found)
						usr<<"Você precisa aprender o Konoha Dai Senpuu primeiro!";return

					if(usr.TaijutsuKnowledge<250)
						usr<<"Você precisa de no minimo 250 de conhecimento em Taijutsu.";return
					else
						usr.LearnJutsu("Konoha Dai Senkou",20000,"KonohaDaiSenkou","O usuário salta em seu oponente e desencadeia um poderoso chute lateral com objetivo de acertar a cabeça, lançando o adversário para longe..","Taijutsu");return

			KonhaShoffu
				name="Konoha Shoffu"
				icon_state="Konoha Shofu"
				Click()
					if(usr.TaijutsuKnowledge<500)
						usr<<"Você precisa de no minimo 500 de conhecimento em Taijutsu.";return
					else
						usr.LearnJutsu("Konoha Shofuu",20000,"KonohaShofuu","Com este poderoso taijutsu, o usuário inicia logo acima da cabeça. Porque o poder do chute do solo é imediatamente convertido em um golpe, o inimigo atingido com esse ataque será lançado para cima. !","Taijutsu");return

			DainamikkuEntori
				name="Dainamikku Entori"
				icon_state="Dainamikku Entori"
				Click()
					if(usr.TaijutsuKnowledge<500)
						usr<<"Você precisa de no minimo 500 de conhecimento em Taijutsu.";return
///
///


		Akimachi
			NikudanSesha
				name="Nikudan"
				icon_state="Nikudan"
				Click()
					var/found=0
					for(var/obj/SkillCards/Baika/P in A)
						if(P.type == /obj/SkillCards/Baika) found=1
					if(!found)
						usr<<"Você precisa aprender o Baika No Jutsu primeiro!";return
					else
						usr.LearnJutsu("Nikudan Sensha",25000,"Nikudan","rimeiro o usuário usa a Técnica do Tamanho Múltiplo para tornar-se uma bola de tamanho humano, então ele dobra seus membros e utiliza o chakra para impulsionar-se em um rolo poderoso.","Taijutsu");return

			BaikaJutsu
				name="Baika"
				icon_state="Baika"
				Click()
					usr.LearnJutsu("Baika No Jutsu",20000,"Baika","Esta é uma técnica secreta passada no clã Akimichi, que aumenta o tamanho do corpo do usuário através da conversão de suas calorias em chakra..","Ninjutsu");return




			BubunBaika
				name="BrawlerKnowledge"
				icon_state="BrawlerKnowledge"
				Click()
					var/found=0
					for(var/obj/SkillCards/Baika/P in A)
						if(P.type == /obj/SkillCards/Baika) found=1
					if(!found)
						usr<<"Você precisa aprender o Baika No Jutsu primeiro!";return
					if(usr.SizeMastery<35)
						usr<<"Você precisa de 35 Mestre de Tamanho para isto.";return
					else
						usr.LearnJutsu("Bubun Baika No Jutsu",45000,"BubunBaika"," Ao inchar uma única parte do corpo é possível utilizar o peso para aumentar o poder dos ataques físicos..","Taijutsu");return





			AkimachiSlam
				name="DoubleStrike"
				icon_state="DoubleStrike"
				Click()
					var/found=0
					for(var/obj/SkillCards/Baika/P in A)
						if(P.type == /obj/SkillCards/Baika) found=1
					if(!found)
						usr<<"Você precisa aprender o Baika No Jutsu primeiro!";return
					if(usr.SizeMastery<35)
						usr<<"Você precisa de 35 Mestre de Tamanho para isto.";return
					else
						usr.LearnJutsu("Choharite",55000,"AkimachiSlam","Um jutsu poderoso do clan Akimachi aonde o usuario depois de aumentar seu tamanho, bate com as palmas da mão no chao , causando um grande dano a tudo em sua volta.","Taijutsu");return

//




		Aburame
			MuroInseto
				name="Muro de insetos"
				icon_state="KekkaiSheild"
				Click()
					if(usr.BugMastery<10)
						usr<<"Você precisa de 10 mestre de insetos passiva.";return
					else
						usr.LearnJutsu("Muro de Insetos",45000,"KekkaiSheild","Esta técnica utiliza os kikaichu como um escudo, tendo-lhes voando em forma de cúpula em alta velocidade!","Ninjutsu");return

			CloneInseto
				name="Técnica do Clone de Inseto"
				icon_state="MushiBunshin"
				Click()
					if(usr.BugMastery<15)
						usr<<"Você precisa de 15 mestre de insetos passiva.";return
					else
						usr.LearnJutsu("Técnica do Clone de Inseto",15000,"KekkaiKonchuuBunshin","A técnica secreta exclusiva para o clã Aburame, onde milhares de kikaichu estão reunidos em um só lugar para assumir a aparência do usuário.","Ninjutsu");return

			Esferansetos
				name="Esfera de Insetos"
				icon_state="MushiDama"
				Click()
					var/found=0
					for(var/obj/SkillCards/KekkaiSheild/P in A)
						if(P.type == /obj/SkillCards/KekkaiSheild) found=1
					if(!found)
						usr<<"Você precisa aprender o Muro de insetos primeiro!";return
					if(usr.BugKeeper<30)
						usr<<"Você precisa de 30 mestre de insetos passiva.";return
					else
						usr.LearnJutsu("Esfera de Insetos",45000,"MushiDama","Esta técnica cobre todo o corpo do inimigo com os kikaichu viventes dentro do corpo do membro do clã Aburame. Os kikaichu de sensoriamento de chakra são espalhados por uma vasta gama e no momento em que localizam o inimigo, os insetos, seguindo as ordens do usuário, reúnem-se de uma só vez. Os insetos cercam completamente o alvo, fazendo um globo. Eles contém o inimigo e começam a comer o seu chakra picada por picada. Em pouco tempo, a morte vai chegar. Mesmo se o alvo conseguir escapar, os insetos vão segui-lo imediatamente.!","Ninjutsu");return


			TempesInseto
				name="Esfera de Insetos"
				icon_state="KekkaiArashi"
				Click()
					var/found=0
					for(var/obj/SkillCards/MushiDama/P in A)
						if(P.type == /obj/SkillCards/MushiDama) found=1
					if(!found)
						usr<<"Você precisa aprender o Esfera de Insetos primeiro!";return
					if(usr.BugKeeper<50)
						usr<<"Você precisa de 50 mestre de insetos passiva.";return
					else
						usr.LearnJutsu("Tornado de Inseto",50000,"KekkaiArashi","Esta técnica cobre todo o corpo do inimigo com os kikaichu que vivem dentro do corpo do membro do clã Aburame. Os kikaichu sensores de chakra são espalhados por uma vasta gama, e no momento em que localizam o inimigo, os insetos, seguindo ordens do usuário, reúnem de uma só vez completamente em torno do alvo criando um tornado em movimento rápido que aparentemente desintegra o alvo.!","Ninjutsu");return



		Papel
			KageBushi
				name="Jutsu Clone da Sombra"
				icon_state="KageBunshin"
				Click()
					var/list/A=usr.LearnedJutsus
					if(/obj/SkillCards/KageBunshin in A)
					//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
							color:white;}</style>"
						sd_Alert(usr, "Você já conhece esta técnica!","[src.name]")//,,,,0,"400x150",,style);
						return
					if(usr.NinjutsuKnowledge<30)
						usr<<"Você precisa de 30 de Conhecimento em Ninjutsu para aprender esta tecnica";return
					else
						usr.LearnJutsu("Clone da Sombra",40000,"KageBunshin","O Jutsu Clone da Sombra, faz um clone com metade do seu chakra atual controlavel e denso.","Ninjutsu");return

		Shiroi
			ShurikenYuuki
				name="Shuriken de Gelo"
				icon_state="YukiShuriken"
				Click()
					usr.LearnJutsu("Yuki Shuriken",15000,"SnowShuriken","Yuki Shuriken is a technique that can be done anywhere, allowing the user to create shurikens of snow to throw at the enemy. Although it may sound weak, the snow is surprisingly real hard.","Hyouton");return

			SenbonGelo
				name="Senbon de Gelo"
				icon_state="Sensatsu"
				Click()
					if(usr.IceRush<15)
						usr<<"You don't have enough Ice Rush.";return
					else
						usr.LearnJutsu("Sensatsu Suishou",15000,"SensatsuSuishou","Sensatsu Suishou is a technique which turns water nearby into needles of ice that can easily rip an enemy into pieces.","Hyouton");return

			EspinhoSawaGelo
				name="Grande espinhos de gelo"
				icon_state="AisuSawarabi"
				Click()
					if(usr.IceRush<15)
						usr<<"You don't have enough Ice Rush.";return
					else
						usr.LearnJutsu("Sensatsu Suishou",15000,"SensatsuSuishou","Sensatsu Suishou is a technique which turns water nearby into needles of ice that can easily rip an enemy into pieces.","Hyouton");return

			CriandoGelo
				name="Criaçao de gelo"
				icon_state="IceField"
				Click()
					if(usr.IceRush<45)
						usr<<"You don't have enough Ice Rush.";return
					else
						usr.LearnJutsu("Hyouton: Ice Creation",40000,"IceField","Ice Creation is a jutsu that allows a user that practices enough to create large bodies of ice upon their created Water.","Hyouton");return

			EspelhosGelo
				name="Espelhos de Gelo"
				icon_state="MakyouHyoushou"
				Click()
					if(usr.IceRush<50)
						usr<<"You don't have enough Ice Rush.";return
					else
						usr.LearnJutsu("Makyou Hyoushou",50000,"MakyouHyoushou","Makyou Hyoushou is a jutsu that allows the user to create crystal mirrors practically unbreakable. After creating them they can move through them at high speeds, having an incredible advantage over their enemy.","Hyouton");return

			EspinhGelo
				name="Espinhos de Gelo"
				icon_state="IceShard"
				Click()
					usr.LearnJutsu("Ice Shard Jutsu",10000,"IceShard","Ice Shard Jutsu is a technique that requires water. Using the water provided, by adding Hyouton you're able to add a strong shard of ice, like icicles, that are able to pierce enemies on all sides.","Hyouton");return

			EspinhosGelo
				name="Espinhos de Gelo"
				icon_state="IceShard"
				Click()
					if(usr.IceRush<45)
						usr<<"You don't have enough Ice Rush.";return
					else
						usr.LearnJutsu("Aisu Sawarabi",25000,"ISawarabi","Aisu Sawarabi is a technique utilizing the moist air around you to form ice spikes out of nowhere. It requires no handseals, thus can be done in some of the most dangerous situations.","Hyouton");return


		Iwazuka
			C1
				name="C1"
				icon_state="C1"
				Click()
					usr.LearnJutsu("C1",15000,"C1","C1 is the basic type of explosive, and useful in long range combat.");return

			C2
				name="C2"
				icon_state="C2"
				Click()
					var/found2=0
					for(var/obj/SkillCards/C1/P in A)
						if(P.type == /obj/SkillCards/C1)
							found2=1
					if(!found2)
						usr<<"You need to know how to use C1 first!";return
					if(usr.ExplosiveMastery<25)
						usr<<"You need more Explosive Mastery!";return
					else
						usr.LearnJutsu("C2",25000,"C2","C2 is a more deadly type of explosive and can create bigger and guided and more deadly explosives.","Ninjutsu");return

			C3
				name="C3"
				icon_state="C3"
				Click()
					var/found2=0
					for(var/obj/SkillCards/C2/P in A)
						if(P.type == /obj/SkillCards/C2)
							found2=1
					if(!found2)
						usr<<"You need to learn to use C2 first!";return
					if(usr.ExplosiveMastery<75)
						usr<<"You need more Explosive Mastery!";return
					else
						usr.LearnJutsu("C3",50000,"C3","C3 is extremely explosive and dangerous. It is capable of making huge explosives and even bigger explosions. Stay back when you light these off...","Ninjutsu");return

			C4
				name="C4"
				icon_state="C4"
				Click()
					var/found2=0
					for(var/obj/SkillCards/C3/P in A)
						if(P.type == /obj/SkillCards/C3)
							found2=1
					if(!found2)
						usr<<"You need to learn to use C3 first!";return
					if(usr.ExplosiveMastery<100)
						usr<<"You need more Explosive Mastery!";return
					else
						usr.LearnJutsu("C4",100000,"C4","C4 is extremely lethal explosion that create parasetic explosives that are so small that only chakra viewers could possibly see it!","Ninjutsu");return

			PassaroArgila
				name="Passaro de argila"
				icon_state="IwazukaCarrierBird"
				Click()
					var/found2=0
					for(var/obj/SkillCards/C4/P in A)
						if(P.type == /obj/SkillCards/C4)
							found2=1
					if(!found2)
						usr<<"You need to learn to use C4 first!";return
					if(usr.ExplosiveMastery<100)
						usr<<"You need more Explosive Mastery!";return
					else
						usr.LearnJutsu("Clay_Carrier",40000,"Clay_Carrier","Clay Carrier is a mount used to get from one place to another.!","Ninjutsu");return

			C0
				name="C0"
				icon_state="C5"
				Click()
					var/found2=0
					for(var/obj/SkillCards/Clay_Carrier/P in A)
						if(P.type == /obj/SkillCards/Clay_Carrier)
							found2=1
					if(!found2)
						usr<<"You need to learn Clay Carrier first!";return
					else
						usr.LearnJutsu("C0",250000,"C0","C0 is a suicidal jutsu, which has a very high ratio to kill both of you....use it at your own risk.","Ninjutsu")

		Sabaku
			OlhoAreia
				name="Olho de Areia"
				icon_state="Sandeye"
				Click()
					usr.LearnJutsu("Sandeye",8000,"Sandeye","Sand eye is a simple technique allowing the Sabaku Clan user to see whenever they are blinded.");return

			ManipulAreia
				name="Manipulação de areia"
				icon_state="SunaTate"
				Click()
					if(usr.SandMastery<25)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Manipulation",20000,"SunaSoujou","Sand Manipulation is a powerful technique that allows the user to control a large quanity of Sand to attack their enemies with.","Ninjutsu");return

			SabakuKyuu
				name="Sabaku Kyuu"
				icon_state="SabakuKyuu"
				Click()
					if(usr.SandMastery<60)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Coffin",35000,"SabakuKyuu","Sand Coffin is a technique that captures a target in a torrent of sand using Shield of Sand, to bind them successfully.","Ninjutsu");return

			SabakuSousou
				name="Funeral do Deserto"
				icon_state="SabakuSousou"
				Click()
					var/found=0
					for(var/obj/SkillCards/SabakuKyuu/P in A)
						if(P.type == /obj/SkillCards/SabakuKyuu) found=1
					if(!found)
						usr<<"You need to learn Sand Coffin to use this jutsu!";return

					if(usr.SandMastery<60)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Burial",50000,"SabakuSousou","Sand Burial is the finisher to Sand Coffin, making it so that you may crush the sand as soon as you capture them.","Ninjutsu");return


			CorrentesaAreia
				name="Correntesa de Areia"
				icon_state="BakuryuRyusa"
				Click()
					var/found=0
					for(var/obj/SkillCards/SabakuKyuu/P in A)
						if(P.type == /obj/SkillCards/SabakuKyuu) found=1
					if(!found)
						usr<<"You need to learn Sand Burial to use this jutsu!";return

					if(usr.SandMastery<90)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Quicksand Waterfall Current",35000,"BakuryuRyusa","Quicksand Waterfall Current shoots off a sea of sand that captures tons of targets!","Ninjutsu");return

			FuneralDeserto
				name="Funeral Imperial do Deserto"
				icon_state="BakuryuRyusaBurial"
				Click()
					if(usr.SandMastery<100)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Desert Imperial Funeral",50000,"SabakuTaisou","Desert Imperial Funeral is the finisher to Bakuryu Ryusa, collasping all the sand destroying all the captured targets inside.","Ninjutsu");return

			ShurikenAreia
				name="Shuriken Areia"
				icon_state="SunaShuriken"
				Click()
					if(usr.SandMastery<5)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Shuriken",25000,"SunaShuriken","Sand Shuriken is a technique creating dense shurikens out of sand that can dice an enemy into bits.","Ninjutsu");return

			EspinhoAreia
				name="Espinho de Areia"
				icon_state="SandWhip"
				Click()
					if(usr.SandMastery<50)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Whip",50000,"SunaWhip","Description Coming soon.","Ninjutsu");return

			CloneAreia
				name="Clone de Areia"
				icon_state="SunaBunshin"
				Click()
					if(usr.SandMastery<15)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Clone",30000,"SunaBunshin","Sand Clone is a technique that transforms the shield of sand into a clone, letting it work as an offensive attack.","Ninjutsu");return

			ShukakuArm
				name="Arm Shukaku"
				icon_state="SandArm"
				Click()
					if(usr.SandMastery<35)
						usr<<"You need more Sand Mastery.";return
					if(!usr.Shukaku)
						usr<<"You need a certain passive.";return
					else
						usr.LearnJutsu("Sand Arm",50000,"SandArm","Sand Arm is a jutsu similiar to the arm of the Shukaku. The user creates a hand of sand and stretches it out to attack the enemy with great force.","Ninjutsu");return


			EsferaAreia
				name="Esfera de Areia"
				icon_state="SandSphere"
				Click()
					if(usr.SandMastery<40)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sand Sphere",35000,"SandSphere","Sand Sphere is a powerful defence guarding you from your enemy's attacks.","Ninjutsu");return

			AreiaMovedissa
				name="Areia Movedissa"
				icon_state="SabakuTaisou"
				Click()
					if(usr.SandMastery<100)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sabaku Sand Field",50000,"SabakuSandField","Sand Field is a devastating jutsu, allowing the user to create a wave of sand around them, engulfing anyone around it.","Ninjutsu");return

			AreiaMovedissaAfundar
				name="Areia Movedissa Afundar"
				icon_state="SunaSoujou"
				Click()
					if(usr.SandMastery<100)
						usr<<"You need more Sand Mastery.";return
					else
						usr.LearnJutsu("Sabaku Sand Field Burial",85000,"SabakuSandFieldBurial","A continuation of the Deadly jutsu Sabaku Sand Field, this is the final blow, crushing anyone within it.","Ninjutsu");return






////////////////////////////////////////////////////////////////////////////////////////////////
//Passives
///////////////////////////////////////////////////
//BasicPassives
turf
	Skilltree/Passives/BasicPassives
		layer = MOB_LAYER+97
		StaminaRegeneration
			name="Recovery"
			icon_state="StaminaRegeneration"
		DurabilityMastery
			name="Durability"
			icon_state="DurabilityMastery"
		BodyFlickerRepetition
			name="Body Flicker Repetition"
			icon_state="BFR"
			var/price="So pode aumentar com os seus restos de pontos de jutsus."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/Shushin) in usr.LearnedJutsus))
					alert(usr,"Esse passivo não está disponível para você neste momento. Você precisa aprender o Corpo Cintilação Jutsu primeiro!")
					return
				alert(usr, "[src] decreases the delay of Body Flicker by 2 seconds per point, but can only reach a minimum of a 0.5 second delay. Como Treinar-lo: [price] [usr.BodyFlickerRepetition]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.BodyFlickerRepetition<maxprice)
					usr.clicking=1
					switch(input(usr,"Gostaria de aumentar esse passiva utilizando os seus pontos de jutsus que sobraram?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<150*(usr.BodyFlickerRepetition))
								usr<<"Você precisa de [150*(usr.BodyFlickerRepetition)] Conhecimento de Taijutsu antes de poder aumentar esse passivo mais.";usr.clicking=0;return
							usr.BodyFlickerRepetition++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		BodyFlickerDistance
			name="Body Flicker Distance"
			icon_state="BFD"
			var/price="So pode aumentar com os seus restos de pontos de jutsus."
			var/maxprice=4
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/Shushin) in usr.LearnedJutsus))
					alert(usr,"Esse passivo não está disponível para você neste momento. Você precisa aprender o Corpo Cintilação Jutsu primeiro!")
					return
				alert(usr, "Aumenta o número de quadrados que você pode saltar usando Corpo de cintilação em 1 por ponto. Como Treinar-lo:: [price] [usr.BodyFlickerDistance]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Gostaria de aumentar esse passiva utilizando os seus pontos de jutsus que sobraram?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<50*(usr.BodyFlickerDistance))
								usr<<"Você precisa de [50*(usr.BodyFlickerDistance)] Conhecimento de Taijutsu antes de poder aumentar esse passivo mais.";usr.clicking=0;return
							usr.BodyFlickerDistance++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0

		BodyFlickerMaster
			name="Body Flicker Master"
			icon_state="BFM"
			var/price="So pode aumentar com os seus restos de pontos de jutsus."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/Shushin) in usr.LearnedJutsus))
					alert(usr,"Esse passivo não está disponível para você neste momento. Você precisa aprender o Corpo Cintilação Jutsu primeiro!")
					return
				alert(usr, "[src] diminui o dreno Chakra do Corpo de cintilação no Jutsu. Como Treinar-lo: [price] [usr.BodyFlickerMaster]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Gostaria de aumentar esse passiva utilizando os seus pontos de jutsus que sobraram?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<200*(usr.BodyFlickerMaster+1))
								usr<<"Você precisa de [200*(usr.BodyFlickerMaster+1)] Conhecimento de Taijutsu antes de poder aumentar esse passivo mais.";usr.clicking=0;return
							usr.BodyFlickerMaster++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Acceleration
			name="Acceleration"
			icon_state="Acceleration"
			var/price="Ao correr."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.RunningSpeed<1)
					alert(usr,"Esse passivo não está disponível para você neste momento. Você precisa de 1/5 de duração velocidade antes que possa ver este passivo.")
					return
				alert(usr, ".[src] é um passivo que diminui a quantidade de tempo que leva para atingir a velocidade máxima quando estiver correndo. Como Treinar-lo: [price] [usr.Acceleration]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Gostaria de aumentar esse passiva utilizando os seus pontos de jutsus que sobraram?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.Acceleration<10)
								usr.Acceleration++;usr.StartingPoints--;usr.clicking=0
							else
								alert(usr,"Desculpe, esse passivo não pode ser mais aumentada.")
					usr.clicking=0
		RunningSpeed
			name="RunningSpeed"
			icon_state="RunningSpeed"
			var/price="Ao correr."
			var/maxprice=5
			Click()
				if(usr.TaijutsuKnowledge<50)
					alert(usr,"Esse passivo não está disponível para você neste momento. Você precisa de 50 Conhecimento de Taijutsu antes de poder ver este passivo.")
					return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] é um passivo que aumenta a velocidade máxima quando estiver correndo. Como Treinar-lo:: [price] [usr.RunningSpeed]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Gostaria de aumentar esse passiva utilizando os seus pontos de jutsus que sobraram?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.RunningSpeed<5)
								usr.RunningSpeed++;usr.StartingPoints--;usr.clicking=0
							else
								alert(usr,"Desculpe, esse passivo não pode ser mais aumentada.")
					usr.clicking=0
//Elemental Passives
turf
	Skilltree/Passives/ElementalPassives
		layer = MOB_LAYER+97
		icon='Icons/Jutsus/Skilltree.dmi'
		ReturnToScreen
			icon='Icons/Hud/BaseSelectStuff.dmi'
			icon_state="Doner"
			layer=105
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.client.perspective=MOB_PERSPECTIVE
				usr.client.eye=usr
		Convert
			icon_state="Convert"
			Click()
				//Argon code #111125
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to convert some of your Starting Points to Elemental Points? WARNING: This cannot be reversed..") in list("No","Yes"))
						if("Yes")
							var/Number=input(usr,"How many points do you wish to convert?") as num
							if(Number>usr.StartingPoints)
								Number=usr.StartingPoints
							if(Number<1)
								Number=1
							switch(input(usr,"CONFIRM: Convert [Number] Starting Points to [Number*3] Elemental Points for a total of [(Number*3)+usr.ElementalPoints] Elemental Points and [usr.StartingPoints-Number] Starting Points?") in list("No","Yes"))
								if("Yes")
									usr.StartingPoints-=Number;usr.ElementalPoints+=Number*3
									alert(usr,"Conversion Successful.")
					usr.clicking=0
				else if(usr.clicking)
					alert(usr,"Slow down. One pop up at a time.");return
				else
					alert(usr,"You have no Starting Points to convert to Elemental Points!");return
		Jutsus
			icon='Icons/Jutsus/Skillcards.dmi'
			//Katon
			Hikibou
				icon_state="Hikibou"
				Click()
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Katon Hikibou No Jutsu",10000,"Hikibou","Katon Hikibou No Jutsu é uma técnica onde o usuário aquece o ar ao redor. Após o aquecimento do ar, a região vai queimar em chamas. É muito inútil no início, mas quanto mais você usá-lo mais forte ele fica. 3 Pontos de Jutsus","Katon",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"[src]:Eu receio que você não tem a capacidade de aprender este jutsu"
			RaseKa
				icon_state="Spinning Fire"
				Click()
					for(var/obj/SkillCards/Hikibou/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(!(locate(/obj/SkillCards/Hikibou) in usr.LearnedJutsus))
						usr<<"Você precisa saber Hikibou antes que você pode aprender este jutsu.";return
					if(usr.FireChakra<2)
						usr<<"Você precisa de pelo menos 2/20 Dominio de Fogo antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >=15))
						usr.LearnJutsu("Katon Spinning Fire",20000,"SpinningFire","Katon RaseKa é um jutsu que dispara uma bola de fogo em direção ao oponente, envolvendo-os em chamas se acertar o jutsu,e a explosao também.. 4 Pontos de Jutsus","Katon",4)
					//	usr.ElementalPointDeduction=4
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Housenka
				icon_state="Housenka"
				Click()
					if(usr.FireChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Fogo antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints>=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Katon Housenka No Jutsu",10000,"Housenka","Katon Housenka No Jutsu é um jutsu que atira várias bolas de fogo da boca que explodem e causa um pequeno incêndio em contacto de um alvo.. 3 Pontos de Jutsus","Katon",3)
					//	usr.ElementalPointDeduction =3
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			HousenkaTsumabeni
				icon_state="FireShuriken"
				Click()
					if(!(locate(/obj/SkillCards/KatonHouka) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Houka antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/KatonHouka/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FireChakra<3)
						usr<<"Você precisa de pelo menos 3/20 Dominio de Fogo antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints>=3)&&(usr.Mnin>=15))
						usr.LearnJutsu("Katon: Pheonix Sage Flower",25000,"PhoenixSageFlower","Flor de Fenix Avancado é um jutsu que permite que ao usuario utilizar seu Chakra e Shuriken para criar shurikens de fogo.. 3 Pontos de Jutsus","Katon",3)
					//	usr.ElementalPointDeduction=3
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			KatonFlameBullet
				icon_state="KaNoSenbon"
				Click()
					if(usr.FireChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Fogo antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints>=3)&&(usr.Mnin>=15))
						usr.LearnJutsu("Katon Endan",15000,"KatonFlameBullet","Katon Endan é um jutsu que utiliza um pequeno projétil de fogo que explode em contato.. 3 Pontos de Jutsus","Katon",3)
				//		usr.ElementalPointDeduction=3
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			KatonFlameBulletAdvance
				icon_state="KaNoSenbon"
				Click()
					if(usr.FireChakra<3)
						usr<<"Você precisa de pelo menos 3/20 Dominio de Fogo antes que você possa aprender este jutsu.";return
					if(!(locate(/obj/SkillCards/KatonFlameBullet) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Bala de Chama antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/KatonFlameBullet/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=4)&&(usr.Mnin>=19))
						usr.LearnJutsu("Katon Dai Endan",30000,"KatonFlameBulletAdvance","Katon Dai Endan é como Katon Endan mas o usuário utiliza projéteis ainda mais poderosos. 4 Pontos de Jutsus","Katon",4)
				//		usr.ElementalPointDeduction=4
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			KatonFlameEmber
				icon_state="KaNoSenbon"
				Click()
					if(usr.FireChakra<5)
						usr<<"Você precisa de pelo menos 5/20 Dominio de Fogo antes que você possa aprender este jutsu.";return
					if(!(locate(/obj/SkillCards/KatonFlameBulletAdvance) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Dai Endan antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/KatonFlameBulletAdvance/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=3)&&(usr.Mnin>=21))
						usr.LearnJutsu("Katon Flame Ember",20000,"FlameEmber","Katon Chama Ember é semelhante ao jutsu de como Endan, porém este queima o adversário.. 3 Pontos de Jutsus","Katon",3)
					//	usr.ElementalPointDeduction=3
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			Goukakyuu
				icon_state="Goukakyuu"
				Click()
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Katon Goukakyuu No Jutsu",20000,"Goukakyuu"," Katon Goukakyuu no Jutsu é um jutsu em area que libera fogo pela boca. Ela abrange uma area pequena, que pode melhorar, de modo que pode ser muito útil em combate.. 3 Pontos de Jutsus","Katon",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			AshPileBurning
				icon_state="AshRelease"
				Click()
					if(!(locate(/obj/SkillCards/Goukakyuu) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Goukakyuu antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/Goukakyuu/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 24))
						usr.LearnJutsu("Katon: Ash Pile Burning",25000,"AshPileBurning","Katon Ash pilha ardente é um jutsus que permite ao usuário criar um Katon em uma fumaca com substâncias, causa menos danos, mas tem uma chance maior para queimar o inimigo. Também não é apagada pela água.. 4 Pontos de Jutsus","Katon",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			Gouenkyuu
				icon_state="FireDragon"
				Click()
					if(!(locate(/obj/SkillCards/Goukakyuu) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Goukakyuu antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/Goukakyuu/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=5)&&(usr.Mnin>=25))
						usr.LearnJutsu("Katon: Gouenkyuu",45000,"KatonHoukaAdvanced","Katon Gouen Kyuu é uma versão avançada do Goukakyuu, permitindo que o usuário disparar o projétil de fogo, que, em seguida, empurra qualquer coisa que tocar, depois explode e causa um incendio na area. 5 Pontos de Jutsus "," Katon ",5)
				//		usr.ElementalPointDeduction=5
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			GoukaMekkyaku
				icon_state="Kaheki"
				Click()
					if(!(locate(/obj/SkillCards/KatonHoukaAdvanced) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Gouenkyuu antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/KatonHoukaAdvanced/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=5)&&(usr.Mnin>=28))
						usr.LearnJutsu("Katon: Great Majestic Fire Annihilation",75000,"GoukaMekkyakuNoJutsu","Uma técnica usada uma vez pelo lendário Uchiha Madara, esta técnica destrói tudo por onde passa com uma enorme onda de fogo.. 5 Pontos de Jutsus","Katon",5)
					//	usr.ElementalPointDeduction=5
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."

			Ryuusenka
				icon_state="Ryuusenka"
				Click()
					if(!(locate(/obj/SkillCards/Ryuuka) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Ryuuka antes para que você possa aprender este jutsu.";return
					for(var/obj/SkillCards/Ryuuka/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.KatonKnowledge<500)
						usr<<"Você precisa de pelo menos 500 Conhecimento em Katon!";return
					if((usr.ElementalPoints>=6)&&(usr.Mnin>=25))
						usr.LearnJutsu("Katon: Ryuusenka",75000,"KatonDragonWar","Katon Ryuusenka é realmente um jutsus perigoso. Permitindo ao usuário combinar Houka e Katon Ryuuka em uma combinação feroz e mortal. 6 Pontos de Jutsus","Katon",6)
					//	usr.ElementalPointDeduction=6
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Ryuuka
				icon_state="Ryuuka"
				Click()
					if(usr.KatonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Katon!!";return
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 25))
						usr.LearnJutsu("Katon Ryuuka No Jutsu",30000,"Ryuuka","Katon Ryuuka No Jutsu é uma forma concentrada de Karyuu Endan que dispara uma rajada concentrada que explode ao contato de um objeto físico.. 3 Pontos de Jutsus","Katon",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Houka
				icon_state="Houka"
				Click()
					if(!(locate(/obj/SkillCards/Housenka) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Housenka antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Housenka/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.KatonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Katon!!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Katon Houka",20000,"KatonHouka","Katon Houka é uma técnica poderos de bola de fogo que pode ser considerado um reforço para o Housenka. Ele funciona, atirando uma bola de fogo gigante que explode em contato ou através do tempo para causando uma chama ainda maior. 4 Pontos de Jutsus","Katon",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			ChouHouka
				icon_state="ChouHouka"
				Click()
					if(usr.DragonsRage<1)
						usr<<"Você precisa de pelo menos 1 ponto na passiva Raiva do Dragao antes que você possa aprender este jutsu!";return
					if(usr.KatonKnowledge<250)
						usr<<"Você precisa de pelo menos 250 Conhecimento em Katon!!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 33))
						usr.LearnJutsu("Katon Chou Houka",100000,"ChouHouka","Katon Chou Houka é uma bola de fogo poderos é um reforço para Katon Houka! Este jutsus é normalmente o mesmo que o Katon Houka exceto por ser menos concentrado e menos poderoso, disparando várias bolas de fogo em todas as direções, se treinada o suficiente . 5 Pontos de Jutsus","Katon",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			KaryuuEndan
				icon_state="KaryuuEndan"
				Click()
					if(!(locate(/obj/SkillCards/KatonFlameBulletAdvance) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Dai Edan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/KatonFlameBulletAdvance/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.KatonKnowledge<300)
						usr<<"Você precisa de pelo menos 300 Conhecimento em Katon!!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 32))
						usr.LearnJutsu("Katon Karyuu Endan",100000,"KaryuuEndan","Katon Karyuu Endan dispara uma grande rajada de fogo em uma direção reta que queima os inimigos e arrasta todos que forem pegos. Tem um poder de destruição incrível Considerada um dos Jutsus mais fortes de Katon. 5 Pontos de Jutsus","Katon",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Gouryuuka
				icon_state="Gouryuuka"
				Click()
					if(!(locate(/obj/SkillCards/KatonDragonWar) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Katon Ryuukasenka antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/KatonDragonWar/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.KatonKnowledge<650)
						usr<<"Você precisa de pelo menos 650 Conhecimento em Katon!!";return
					if((usr.ElementalPoints >=6)&&(usr.Mnin >= 34))
						usr.LearnJutsu("Katon Gouryuuka",125000,"Gouryuuka","Gouryuuka é um poderoso Cabeça de Fogo de Dragão expulso da boca do usuário. Ele incinera tudo em seu caminho e depois explode e incendia tudo ao seu redor. 6 Pontos de Jutsus",6)
				//		usr.ElementalPointDeduction = 6
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			//Raiton
			Raikyuu
				icon_state="Raikyu"
				Click()
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Raiton; Raikyuu No Jutsu",10000,"Raikyuu","Raiton; Raikyuu No Jutsu é uma técnica onde o usuário carrega chakra de raio dentro de suas mãos e dispara-o. 3 Pontos de Jutsus","Raiton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Ikazuchi
				icon_state="Ikazuchi"
				Click()
					if(!(locate(/obj/SkillCards/RairyuuGarou) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Rairyuu Garou antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/RairyuuGarou/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<50)
						usr<<"Você precisa de pelo menos 50 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Raiton; Ikazuchi No Kiba",20000,"IkazuchiKiba","Raiton; Ikazuchi No Kiba é uma técnica Raiton poderoso que dispara raios de luz em todos os lados do usuário!! 4 Pontos de Jutsus","Raiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Touei
				icon_state="Touei"
				Click()
					if(!(locate(/obj/SkillCards/Tatsumaki) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Rairyuu no Tatsumaki antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Tatsumaki/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<650)
						usr<<"Você precisa de pelo menos 650 Conhecimento em Raiton!";return
					if((usr.ElementalPoints>=5)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Raiton, Touei",60000,"Touei","Raiton Touei é um jutsu que lhe permite concentrar-se temporariamente o seu chakra elemental em rápidas explosões de movimentos instantâneo.. 5 Pontos de Jutsus","Raiton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Garou
				icon_state="Garou"
				Click()
					if(usr.LightningChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Raio antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Raiton; Rai no Garou",20000,"RairyuuGarou","Raiton; Rai no Garou é uma técnica onde o usuário gira rapidamente em um violento tornado, atraindo a energia estática que pode rasgar o oponente em pedaços.. 3 Pontos de Jutsus","Raiton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			OldGian
				icon_state="Gian"
				Click()
					if(!(locate(/obj/SkillCards/Jibashi) in usr.LearnedJutsus)&&!(locate(/obj/SkillCards/Hinoko) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Raiton Jibashi ou Rairyuu Hinoko antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Jibashi/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					for(var/obj/SkillCards/Hinoko/C in usr.LearnedJutsus)
						if(C:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<550)
						usr<<"Você precisa de pelo menos 550 Conhecimento em Raiton!";return
					if((usr.ElementalPoints>=5)&&(usr.Mnin>=30))
						usr.LearnJutsu("Raiton: Impaling Electrocution",35000,"OldGian","Raiton: Empalando Electrocução é semelhante ao lendário Raiton: Gian. O usuário cria uma explosão horizontal de Raiton Chakra que espeta o inimigo, causando dano contínuo e atordoando o inimigo. 5 Pontos de Jutsus","Raiton",5)
				//		usr.ElementalPointDeduction=5
						usr.Frozen=0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Tatsumaki
				icon_state="Tatsumaki"
				Click()
					if(!(locate(/obj/SkillCards/Jibashi) in usr.LearnedJutsus)&&!(locate(/obj/SkillCards/Hinoko) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Raiton Jibashi ou Rairyuu Hinoko antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Jibashi/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					for(var/obj/SkillCards/Hinoko/C in usr.LearnedJutsus)
						if(C:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<500)
						usr<<"Você precisa de pelo menos 500 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 37))
						usr.LearnJutsu("Raiton; Rairyuu no Tatsumaki",50000,"Tatsumaki","Raiton; Raiton; Rairyuu No Tatsumaki é um jutsu onde o usuário cria um forte dragão de Raiton que é controlável a vontade do usuario.. 5 Pontos de Jutsus","Raiton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			RaiYoroi
				icon_state="RaiYoroi"
				Click()
					if(!(locate(/obj/SkillCards/Raikyuu) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Raikyuu antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Raikyuu/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Raiton; Raigeki No Yoroi",30000,"Yoroi","Raiton; Raigeki No Yoroi é uma técnica poderosa que absorve todas as técnicas Raiton disparadas contra o usuário!! 4 Pontos de Jutsus","Raiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Gian
				icon_state="Gian"
				Click()
					if(!(locate(/obj/SkillCards/Tatsumaki) in usr.LearnedJutsus)||!(locate(/obj/SkillCards/ChidoriEisou) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Rairyuu Tatsumaki e Chidori Senbon antes para que você possa aprender este jutsu!";return
					if(usr.RaitonKnowledge<650)
						usr<<"Você precisa de pelo menos 650 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=7)&&(usr.Mnin >= 37))
						usr.LearnJutsu("Raiton; Gian",150000,"Gian","Raiton; Gian é uma técnica extremamente poderosa que dispara uma linha de raio a partir do usuário que atinge o alvo poderosamente causando uma explosão de eletricidade em sua volta! 7 Pontos de Jutsus","Raiton",7)
					//	usr.ElementalPointDeduction = 7
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Jibashi
				icon_state="Jibashi"
				Click()
					if(!(locate(/obj/SkillCards/IkazuchiKiba) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Ikazuchi no Kiba antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/IkazuchiKiba/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Raiton; Jibashi",30000,"Jibashi","Raiton; Jibashi é um jutsu onde o usuario lanca impulsos elétricos são direcionados ao alvo designado, recebendo uma carga de Choque e atordoá-los!! 4 Pontos de Jutsus","Raiton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Hinoko
				name="Hinoko"
				icon_state="Hinoko"
				Click()
					if(!(locate(/obj/SkillCards/Yoroi) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Raigeki Yoroi antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Yoroi/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.RaitonKnowledge<400)
						usr<<"Você precisa de pelo menos 400 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Raiton; Hinoko",45000,"Hinoko","Raiton; Hinoko é um jutsu eléctrico rápido que utiliza forma e manipulacao de natureza para formar uma lâmina de vibração de luz que vai rapidamente e causa aos atingidos, bem como entorpece temporariamente seus corpos!! 4 Pontos de Jutsus","Raiton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			//Chidori
			Chidori
				icon_state="Chidori"
				Click()
					if(usr.LightningChakra<5)
						usr<<"Você precisa de pelo menos 5/20 Dominio de Raio antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Chidori",20000,"Chidori","Chidori é uma técnica que gera tanto chakra que se torna visível como eletricidade. Um movimento poderoso que pode danificar o adversário inteiramente!! 3 Pontos de Jutsus","Ninjutsu",3)
				//		usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
						usr.Frozen = 0
						return
			Raikiri
				icon_state="Raikiri"
				Click()
					if(!(locate(/obj/SkillCards/Chidori) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Chidori Yoroi antes para que você possa aprender este jutsu!";return
					if(usr.RaitonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Raikiri",50000,"Raikiri","Raikiri é uma alteração mais forte do Chidori, permitindo mais mobilidade para o usuário.. 5 Pontos de Jutsus","Ninjutsu",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
						usr.Frozen = 0
						return
			DoubleRaikiri
				icon_state="DoubleRaikiri"
			RaikiriWolf
				icon_state="RaikiriWolf"
				Click()
					if(!(locate(/obj/SkillCards/Raikiri) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Raikiri antes para que você possa aprender este jutsu!";return
					if(usr.RaitonKnowledge<300)
						usr<<"Você precisa de pelo menos 300 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 36))
						usr.LearnJutsu("Raikiri Wolf",50000,"RaikiriWolf","Raikiri Wolf é uma técnica forte utilizando Raikiri na manipulação de chakra máximo, manifestando um lobo relâmpago que segue seu objetivo. 5 Pontos de Jutsus","Ninjutsu",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
						usr.Frozen = 0
						return
			ChidoriSenbon
				icon_state="ChidoriSenbon"
				Click()
					if(!(locate(/obj/SkillCards/Chidori) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Chidori antes para que você possa aprender este jutsu!";return
					if(usr.RaitonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 20))
						usr.LearnJutsu("Chidori Senbon",20000,"ChidoriSenbon","Chidori Senbon é uma alteração de Chidori. Ele usa a manipulação forma de fazer uma senbon usando as propriedades naturais do Chidori. 4 Pontos de Jutsus","Ninjutsu",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
						usr.Frozen = 0
						return
			ChidoriNagashi
				icon_state="ChidoriNagashi"
				Click()
					if(!(locate(/obj/SkillCards/ChidoriSenbon) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Chidori Senbon antes para que você possa aprender este jutsu!";return
					if(usr.RaitonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 25))
						usr.LearnJutsu("Chidori Current",30000,"ChidoriNagashi","Chidori Nagashi é uma alteração de Chidori. É uma corrente paralisante que é transferido através do corpo e para fora. 5 Pontos de Jutsus","Ninjutsu",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
						usr.Frozen = 0
						return
			ChidoriEisou
				icon_state="ChidoriEisou"
				Click()
					if(!(locate(/obj/SkillCards/ChidoriNagashi) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Chidori Nagashi antes para que você possa aprender este jutsu!";return
					if(usr.RaitonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Raiton!";return
					if((usr.ElementalPoints >=6)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Chidori Spear",50000,"ChidoriEisou","Chidori Eiso é uma alteração de Chidori. É uma lança que se estende de um raio capaz de cortar qualquer coisa e paralisar um corpo que perfura através da carga elétrica pura. 6 Pontos de Jutsus","Ninjutsu",6)
				//		usr.ElementalPointDeduction = 6
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
						usr.Frozen = 0
						return
			//Doton
			DoryoDango
				icon_state="DoryoDango"
				Click()
					if(usr.EarthChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Terra antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints>=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Doton Doryo Dango",10000,"DoryoDango","Doton Doryo Dango é uma técnica em que o usuário usa a sua força para puxar uma pedra do chão e jogá-lo com muita força. 3 Pontos de Jutsus","Doton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			RockFist
				icon_state="DotonFist"
				Click()
					if((usr.ElementalPoints>=3))
						usr.LearnJutsu("Earth Style: Rock Fist",25000,"DotonKengan","Doton Punho de Rocha é uma técnica em que o usuário usa a sua força para criar um punho de pura Terra; verdadeiramente seus socos danificam o adversário.. 3 Pontos de Jutsus","Doton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			DotonSpear
				icon_state="DotonSpear"
				Click()
					if(!(locate(/obj/SkillCards/DotonKengan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Doton Kengan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DotonKengan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.EarthChakra<4)
						usr<<"You need 4/20 Earth Mastery first!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Earth Style: Spear",25000,"DotonSpear","Doton Doryo Dango is a technique in which the user uses their strength to pull a boulder from the ground and throw it with great force. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			DotonArmor
				icon_state="DotonArmor"
				Click()
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Earth Style: Rock Armor",15000,"DotonArmor","Armadura de Rocha é uma técnica em que o usuário manipula seu chakra para formar uma armadura De terra resistente em cima de seu corpo, protegendo-os de danos. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen=0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			KoukaArmor
				icon_state="DotonArmorStronger"
				Click()
					if(!(locate(/obj/SkillCards/DotonArmor) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Armadura de Doton antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DotonArmor/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=5))
						usr.LearnJutsu("Earth Style: Rock Armor Advanced",40000,"KoukaArmor","Kouka Armor é uma versão muito mais avançada e mais forte que a Armadura de Rocha. 5 Pontos de Jutsus","Doton");return
			Doryuudan
				icon_state="Doryuudan"
				Click()
					if(!(locate(/obj/SkillCards/Taiga) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Doton taiga antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Taiga/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Doton; Doryuudan No Jutsu",35000,"Doryuudan","Doton; Doryuudan No Jutsu é um jutsu forte que invoca um dragão que lança espinhos de sua boca. 4 Pontos de Jutsus","Doton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			DotonDoseikiryuu
				icon_state="Doryuudan"
				Click()
					if(!(locate(/obj/SkillCards/Doryuudan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Doton Doryuudan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Doryuudan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<250)
						usr<<"Você precisa de pelo menos 250 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=5)&&(usr.Mnin >= 34))
						usr.LearnJutsu("Doton; Earth and Stone Dragon",35000,"DotonDoseikiryuu","Terra e Pedra do Dragão é um jutsu forte que invoca um dragão que vai demolir tudo que passar em sua frente, muito mais forte impacto do que Doryuudan. 5 Pontos de Jutsus","Doton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Doryuuheki
				icon_state="Doryuuheki"
				Click()
					if(!(locate(/obj/SkillCards/MoveStopper) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o MoveStropper antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/MoveStopper/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Doton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 20))
						usr.LearnJutsu("Doton; Doryuuheki No Jutsu",20000,"Doryuuheki","Doton;Doryuuheki é um jutsu que cria uma forte muralha de defesa na frente de você para bloquear técnicas. 4 Pontos de Jutsus","Doton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			YomiNuma
				icon_state="YomiNuma"
				Click()
			//		if(!(locate(/obj/SkillCards/DoryoDango) in usr.LearnedJutsus))
			//			usr<<"You need to know Doryo Dango first!";return
			//		for(var/obj/SkillCards/DoryoDango/P in usr.LearnedJutsus)
			//			if(P:Copied==1)
			//				usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
			//				return
					if(!(locate(/obj/SkillCards/SwampBrambles) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Swap Brambles antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/SwampBrambles/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<300)
						usr<<"Você precisa de pelo menos 300 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=5)&&(usr.Mnin >= 37))
						usr.LearnJutsu("Doton; Yomi Numa No Jutsu",50000,"YomiNuma","Doton; Yomi Numa produz um pântano forte que captura todos os que estão dentro dela.. 5 Pontos de Jutsus","Doton",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."


			DotonArijigoku
				icon_state="DotonHole"
				Click()
					if(!(locate(/obj/SkillCards/SwampBrambles) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Swap Brambles antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/YomiNuma/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<350)
						usr<<"Você precisa de pelo menos 350 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 35))
						usr.LearnJutsu("Antlion",50000,"DotonArijigoku","Um jutsu que altera as propriedades da terra a espiral para dentro em um ponto central, forçando o adversário a lutar para fora, ou enfrentar graves danos.. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			SwampBrambles
				icon_state="SwampBrambles"
				Click()
					if(!(locate(/obj/SkillCards/DoryoDango) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Doryo Dango antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DoryoDango/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
				//	if(!(locate(/obj/SkillCards/YomiNuma) in usr.LearnedJutsus))
				//		usr<<"You need to know Yomi Numa first!";return
			//		for(var/obj/SkillCards/YomiNuma/P in usr.LearnedJutsus)
			//			if(P:Copied==1)
			//				usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
			//				return
					if(usr.DotonKnowledge<225)
						usr<<"Você precisa de pelo menos 225 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 32))
						usr.LearnJutsu("Rushing Swamp Waves",50000,"SwampBrambles","Este jutsu é uma versão mais fraca de seu jutsu parente, Pântano do Submundo. É capaz de capturar qualquer um que os passos pé nele e abrandar-los enquanto causando dano. 4 Pontos de Jutsus","Doton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			DorukiGaeshi
				icon_state="DorukiGaeshi"
				Click()
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Doton; Doruki Gaeshi",10000,"DorukiGaeshi","Doton; Doruki Gaeshi é um jutsu que coloca um muro de terra de defesa na frente de você para protegê-lo. 3 Pontos de Jutsus","Doton",3)
				//		usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			MoveStopper
				icon_state="MoveStopper"
				Click()
					if(!(locate(/obj/SkillCards/DorukiGaeshi) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Doruki Gaeshi antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DorukiGaeshi/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Doton!";return
					if((usr.ElementalPoints > 4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Move Stopper",20000,"MoveStopper","Mover Stopper é uma técnica de terra que cria uma barreira ao redor do oponente prendendo-os de se mover. Uma boa técnica de captura. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Mole
				icon_state="Mole"
				Click()
					if(usr.SoftEarth<1)
						usr<<"Você precisa ter 1/4  Da passive Soft Earth primeiro!";return
					if(usr.DotonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Doton: Moguragakure No Jutsu",20000,"Moguragakure","Doton: Moguragakure no Jutsu é um jutsu em que o usuário permanece escondido no subsolo profundo, que eles podem usar para a sua vantagem para algumas outras coisas que precisam. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			TsuchiWana
				icon_state="TsuchiWana"
				Click()
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Doton; Tsuchi Wana",25000,"TsuchiWana","Doton; Tsuchi Wana é uma técnica que cria um campo de rochas ao redor do alvo, e ele fica paralizado. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Taiga
				icon_state="Taiga"
				Click()
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 20))
						usr.LearnJutsu("Doton; Doryu Taiga",30000,"Taiga","Doton; Doryuu Taiga é uma técnica que cria um fluxo de rio feito de lama, empurrando o alvo longe. 4 Pontos de Jutsus","Doton",2)
					//	usr.ElementalPointDeduction = 2
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			RisingEarthSpikes
				icon_state="RisingEarthSpikes"
				Click()
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 25))
						usr.LearnJutsu("Doton;Rising Earth Spikes",15000,"RisingEarthSpikes","O usuário poe suas maos no chão criando uma série de espinhos de terra levandos em uma linha reta. 4 Pontos de Jutsus","Doton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			RisingEarthPillars
				icon_state="RisingEarthSpikes"
				Click()
					if(!(locate(/obj/SkillCards/RisingEarthSpikes) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Espinhos de terra antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/RisingEarthSpikes/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Doton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Doton;Earth Pillars",30000,"RisingEarthPillars","Doton; Pilares da Terra cria lentamente uma quantidade maciça de Pilares de terra em volto do usuario.. facilmente penetra inimigos à sua volta se for pego..5 Pontos de Jutsus","Doton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			ColumnSpikes
				icon_state="ColumnSpikes"
				Click()
					if(!(locate(/obj/SkillCards/RisingEarthSpikes) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Doryuudan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/RisingEarthSpikes/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<500)
						usr<<"Você precisa de pelo menos 500 Conhecimento em Doton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Doton;Earth Column Spikes",30000,"ColumnSpikes","Doton; Coluna Espinhos de Terra cria quatro pilares de médio porte, que cercam o alvo e empalam ele/ela repetitivamente..5 Pontos de Jutsus","Doton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Domu
				icon_state="Domu"
				Click()
					if(!(locate(/obj/SkillCards/TsuchiWana) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Tsuchi Wana antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/TsuchiWana/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Doton!";return
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 36))
						usr.LearnJutsu("Doton: Dorou Domu",44000,"DorouDomu","Doton: Dorou Domu é uma esfera terrestre defensiva. Ele rodeia e impede quase qualquer ataque de penetrar. Infelizmente, é difícil de dominar e enquanto estiver em uso não for possível ver do lado de fora. 3 Pontos de Jutsus","Doton",3)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			DotonKakouSekkan
				icon_state="DomuCrush"
				Click()
					if(!(locate(/obj/SkillCards/DorouDomu) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Dorou Domu antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DorouDomu/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Doton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Doton: Descending Stone Coffin",44000,"DotonKakouSekkan","Doton: Descendente do Dorou Domu. Ela envolve o adversário e impede quase qualquer ataque de penetrar. 5 Pontos de Jutsus","Doton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			DomuCrush
				icon_state="DomuCrush"
				Click()
					if(!(locate(/obj/SkillCards/DorouDomu) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Dorou Domu antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DorouDomu/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.DotonKnowledge<300)
						usr<<"Você precisa de pelo menos 300 Conhecimento em Doton!";return
					if((usr.ElementalPoints>=6)&&(usr.Mnin >= 36))
						usr.LearnJutsu("Doton; Earth Crush Jutsu",75000,"DorouDomuCrush","Doton; Esmagamento Terra é um jutsu forte que cobre o inimigo com uma barreira de terra que pode esmagar sobre ele ,esse jutsu é um golpe mortal. 6 Pontos de Jutsus","Doton",6)
					//	usr.ElementalPointDeduction = 6
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			//Fuuton
			WindTrick
				icon_state="WindTrick"
				Click()
					if((usr.ElementalPoints>4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Wind Trick",20000,"WindTrick","Truque de vento é um jutsu utilizando correntes de vento. Ela produz uma forte corrente de vento que empurra para trás alvos próximos e possíveis atacantes, o atual aumento do vento em tamanho requer maior domínio dela.. 4 Pontos de Jutsus","Fuuton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			SpinningWind
				icon_state="SpinningWind"
				Click()
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Spinning Wind",10000,"SpinningWind","Giro do vento é uma técnica que emite uma pequena rajada de vento que deixa o alvo dentro de um vento em rotacao em uma pequena quantidade de tempo. 3 Pontos de Jutsus","Fuuton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			KazeDangan
				icon_state="KazeDangan"
				Click()
					if(usr.WindChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Vento antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Kaze Dangan No Jutsu",10000,"KazeDangan","Fuuton Kaze Dangan no Jutsu é uma técnica que dispara uma bala rápido que atinge o adversário com incrível força e pressão.. 3 Pontos de Jutsus","Fuuton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Reppushou
				icon_state="Reppushou"
				Click()
					if(usr.WindChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Vento antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints > 3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Fuuton Reppushou No Jutsu",10000,"Reppushou","Fuuton Reppushou No Jutsu é um jutsu que atira uma onda de vento que podem atirar de volta o inimigo ou acelerar as seus jutsus.. 3 Pontos de Jutsus","Fuuton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Daitoppa
				icon_state="Daitoppa"
				Click()
					if(!(locate(/obj/SkillCards/Reppushou) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Reppushou antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Reppushou/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FuutonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 16))
						usr.LearnJutsu("Fuuton Daitoppa No Jutsu",30000,"Daitoppa","Fuuton Daitoppa no Jutsu é uma técnica que dispara uma rajada de vento que atira alvos de volta. Ele pode ser usado para a incendiar a area. 4 Pontos de Jutsus","Fuuton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			KazeKiri
				icon_state="Kazekiri"
				Click()
					if(!(locate(/obj/SkillCards/VacuumCannon) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Vacum cannon antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/VacuumCannon/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FuutonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Kaze Kiri No Jutsu",30000,"KazeKiri","Kaze Kiri no Jutsu é uma técnica que é muito facilmente de desviar, mas incrivelmente poderoso. Ele dispara uma lâmina de vento que atravessa o alvo, que pode causar uma série de prejuízos a quem estiver atras.. 4 Pontos de Jutsus","Fuuton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			KazeGai
				icon_state="KazeGai"
				Click()
					if(usr.FuutonKnowledge<550)
						usr<<"Você precisa de pelo menos 550 Conhecimento em Fuuton!";return
					if(!(locate(/obj/SkillCards/KazeKiri) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o KazeKiri antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/KazeKiri/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints >=6)&&(usr.Mnin >= 37))
						usr.LearnJutsu("Kaze Gai No Jutsu",50000,"KazeGai","Kaze Gai no jutsu é uma técnica Rank A. As bordas são nítidas ainda o jutsu mantem a força bruta suficiente para ser concentrada como uma técnica de vento, não apenas empurrando o alvo de volta, mas cortando-os , como eles são empurrados e cortados faz desta técnica implacável.É preciso uma grande quantidade um pouco grande de chakra embora.. 6 Pontos de Jutsus","Fuuton",6)
					//	usr.ElementalPointDeduction = 6
						usr.Frozen = 0
						return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			Renkuudan
				icon_state="Renkuudan"
				Click()
					if(usr.FuutonKnowledge<400)
						usr<<"Você precisa de pelo menos 400 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints >=7)&&(usr.Mnin >= 45))
						for(var/obj/SkillCards/Daitoppa/P in usr.LearnedJutsus)
							if(P:Copied==1)
								usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
								return
						if(!(locate(/obj/SkillCards/Daitoppa) in usr.LearnedJutsus))
							usr<<"Você precisa aprender o Daitoppa antes para que você possa aprender este jutsu!";return
							usr.Frozen = 0
							return
						else
							usr.LearnJutsu("Fuuton Renkuudan No Jutsu",85000,"Renkuudan","Fuuton Renkuudan No Jutsu é uma forte e poderosa rajada de vento que explode em contato com o inimigo! 7 Pontos de Jutsus","Fuuton",7)
					//		usr.ElementalPointDeduction = 7
							usr.Frozen = 0
							return
					else
						usr<<"[src]: Eu receio que você não tem a capacidade de aprender este jutsu."
			VacuumWave
				icon_state="SenbonDice"
				Click()
					if(usr.WindChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Vento antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints > 3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("VacuumWave",15000,"VacuumWave","Um jutsu que faz com que o usuário a tome uma respiração profunda e gire em torno enquanto comprime o ar eles liberam uma lâmina de vento que podem cercar o usuário. 3 Pontos de Jutsus","Fuuton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			VacuumSerialWaves
				icon_state="SenbonDice"
				Click()
					if(!(locate(/obj/SkillCards/VacuumWave) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o VacumWave antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/VacuumWave/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Vacuum Fuuton: Serial Waves",50000,"VacuumSerialWaves","Um jutsu que cria uma enorme quantidade de lâminas de vento que são disparados a partir do usuário em diferentes ângulos. 5 Pontos de Jutsus","Fuuton",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			SenbonDice
				icon_state="SenbonDice"
				Click()
					if(!(locate(/obj/SkillCards/ChidoriNagashi) in usr.LearnedJutsus))
						usr<<"You need to know Chidori Nagashi first!";return
					if((usr.ElementalPoints >=6)&&(usr.Mnin >= 30))
					//	usr.LearnJutsu("Chidori Spear",10000,"ChidoriEisou","Chidori Spear is an alteration of Chidori. It is an extending spear of lightning able to cut through anything and paralyze a body it peirces through the sheer electrical charge.","Ninjutsu",3)
					//	usr.ElementalPointDeduction = 6
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Yaiba
				icon_state="WindBlade"
				Click()
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Fuuton Kaze No Yaiba",20000,"Yaiba","Fuuton Kaze no Yaiba é uma técnica poderosa que dá ao usuário uma espada de vento que corta sua vítima. 4 Pontos de Jutsus","Fuuton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			DaiKamaitachi
				icon_state="KazeNoSenbon"
				Click()
					if(!(locate(/obj/SkillCards/Yaiba) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Kaze Yaiba antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Yaiba/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FuutonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Giant WindCutter Jutsu",30000,"DaiKamaitachi","Um jutsu que corta o corpo do alvo e é capaz de afastar projéteis e pessoas com a mera facilidade.. 4 Pontos de Jutsus","Fuuton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			Kakeami
				icon_state="KazeNoSenbon"
				Click()
					if(!(locate(/obj/SkillCards/DaiKamaitachi) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Dai Kamaitachi antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/DaiKamaitachi/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FuutonKnowledge<325)
						usr<<"Você precisa de pelo menos 325 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 34))
						usr.LearnJutsu("Casting Wind Net",30000,"Kakeami","O usuário cria várias correntes estreitas de vento que formam uma grande rede. Esses ventos são nítidos o suficiente para cortar através de um oponente, causando ferimentos graves a as laminas tem um padrão cruzado. 5 Pontos de Jutsus","Fuuton",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			VacuumCannon
				icon_state="KazeNoSenbon"
				Click()
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Vacuum Cannon",30000,"VacuumCannon","O usuário dispara um pequeno, potente e quase invisível rajada de vento concentrada e forte.. 3 Pontos de Jutsus","Fuuton",3)
				//		usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			VacuumSphere
				icon_state="KazeNoSenbon"
				Click()
					if(!(locate(/obj/SkillCards/VacuumCannon) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Vacum cannon antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/VacuumCannon/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FuutonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Vacuum Sphere",30000,"VacuumSphere","Vacuum Esfera é uma técnica que dispara muitas bala projétil de vento que têm a capacidade de perfurar um inimigo. Dispara incrivelmente rápido, tornando muito letal.. 5 Pontos de Jutsus","Fuuton",5)
			//			usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			VacuumGreatSphere
				icon_state="KazeNoSenbon"
				Click()
					if(!(locate(/obj/SkillCards/VacuumSphere) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Esfera de Vacum antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/VacuumSphere/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.FuutonKnowledge<300)
						usr<<"Você precisa de pelo menos 300 Conhecimento em Fuuton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Vacuum Great Sphere",30000,"VacuumGreatSphere","Vacuum Grande Esfera é uma técnica que dispara uma bala projétil grande o vento que têm a capacidade de perfurar um inimigo. Disparada incrivelmente rápido, tornando muito letal; muito mais forte que a Vacuum Esfera. 5 Pontos de Jutsus","Fuuton",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			//Suiton
			Mizurappa
				icon_state="Mizurappa"
				Click()
					if(usr.WaterChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Agua antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=3)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Suiton Mizurappa No Jutsu",10000,"Mizurappa","Suiton Mizurappa No Jutsu é uma técnica de feixe de agua que jorra água para fora da boca do usuário com grande força e pressão.. 3 Pontos de Jutsus","Suiton",3)
					//	usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			BubbleCapture
				icon_state="Mizurappa"
				Click()
					if(usr.WaterChakra<1)
						usr<<"Você precisa de pelo menos 1/20 Dominio de Agua antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Suiton Bubble Capture",15000,"BubbleCapture","Suiton BubbleCapture é um Jutsu que permite ao usuário criar uma bolha que pode prender um oponente e sufocá-los lentamente dentro dela, quando o ar se esgotar.. 4 Pontos de Jutsus","Suiton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			BubbleBeam
				icon_state="Mizurappa"
				Click()
					if(usr.WaterChakra<4)
						usr<<"Você precisa de pelo menos 4/20 Dominio de Agua antes que você possa aprender este jutsu.";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 15))
						usr.LearnJutsu("Suiton Bubble Beam",15000,"BubbleBeam","Suiton Bubblebeam é um Jutsu que permite ao usuário criar uma grande quantidade de bolhas na forma de um V para atingir o adversário, batendo-los e empurrá-los de volta severamente quando atingidos.. 5 Pontos de Jutsus","Suiton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Syrup
				icon_state="StickySyrup"
				Click()
					if(!(locate(/obj/SkillCards/Mizurappa) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Mizurappa antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Mizurappa/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<100)
						usr<<"Você precisa de pelo menos 100 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Mizuame Nabara No Jutsu",30000,"MizuameNabara","Mizuame Nabara No Jutsu é um jutsu que cria xarope pegajoso ao redor do usuário fazendo com que aqueles presos nele fique imóvel por um tempo. 4 Pontos de Jutsus","Suiton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Suigadan
				icon_state="Suigadan"
				Click()
					if(!(locate(/obj/SkillCards/MizuBunshin) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Mizu Bushin antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/MizuBunshin/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suigadan",30000,"Suigadan","O Suigadan é um poderoso jutsu de água que envia quatro espinhos em espiral de água para atacar um adversário da parte de baixo. Este ataque deve ser bem cronometrado, pois não pode ser utilizado se o alvo não está em cima da água. 4 Pontos de Jutsus","Suiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Suiryuudan
				icon_state="Suiryuudan"
				Click()
					if(!(locate(/obj/SkillCards/Suikoudan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Suikodan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Suikoudan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<400)
						usr<<"Você precisa de pelo menos 400 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Suiryuudan No Jutsu",35000,"Suiryuudan","Suiton Suiryuudan No Jutsu é um jutsu que invoca um dragão feito de agua para atacar um jogador alvo. 5 Pontos de Jutsus","Suiton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Suikoudan
				icon_state="Suikoudan"
				Click()
					if(!(locate(/obj/SkillCards/WaterCreation) in usr.LearnedJutsus))
						usr<<"Você precisa aprender a Criacao de Agua antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/WaterCreation/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<250)
						usr<<"Você precisa de pelo menos 250 Conhecimento em Suiton!";return
					if((usr.ElementalPoints>=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Suikoudan No Jutsu",40000,"Suikoudan","Suiton Suikoudan No Jutsu é um jutsu que convoca um tubarão feito de agua para atacar um jogador alvo. 5 Pontos de Jutsus","Suiton",5)
					//	usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			Daikoudan
				icon_state="Suikoudan"
				Click()
					if(!(locate(/obj/SkillCards/Suikoudan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Suikodan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Suikoudan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<350)
						usr<<"Você precisa de pelo menos 350 Conhecimento em Suiton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Daikoudan No Jutsu",40000,"Daikoudan","Suiton Suikoudan No Jutsu é um jutsu que convoca um tubarão ainda maior feito de agua para atacar qualquer vítima à vista.. 4 Pontos de Jutsus","Suiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			Senjikizame
				icon_state="MultipleSharks"
				Click()
					if(!(locate(/obj/SkillCards/Suikoudan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Suikodan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Suikoudan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<300)
						usr<<"Você precisa de pelo menos 300 Conhecimento em Suiton!";return
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Thousand Man Eating Sharks",40000,"Senjikizame","Esse jutsu cria uma grande quantidade de tubarões para devorar todos os inimigos em seu caminho. 4 Pontos de Jutsus","Suiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Daibakufu
				icon_state="Daibakufu"
				Click()
					if(!(locate(/obj/SkillCards/MizuTeppou) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Mizu Teppou antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/MizuTeppou/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<200)
						usr<<"Você precisa de pelo menos 200 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Daibakufu No Jutsu",25000,"Daibakufu","Suiton Daibakufu No Jutsu é um jutsu que dispara uma grande corrente que mantem o inimigo dentro com danos repetitivos.. 4 Pontos de Jutsus","Suiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			Daibakuryuu
				icon_state="Whirlpool"
				Click()
					if(!(locate(/obj/SkillCards/MizuTeppou) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Mizu teppou antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/MizuTeppou/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Daibakuryuu",25000,"Daibakuryuu","Suiton Daibakuryuu é um jutsu que permite criar uma forte onda de água, sugando o adversario em cima e danificado. 5 Pontos de Jutsus","Suiton",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			BakuSuishouha
				icon_state="BakuSuishou"
				Click()
					if(!(locate(/obj/SkillCards/MizuameNabara) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Mizuame Nabara antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/MizuameNabara/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<250)
						usr<<"Você precisa de pelo menos 250 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=5)&&(usr.Mnin >= 35))
						usr.LearnJutsu("Suiton Baku Suishouha No Jutsu",50000,"BakuSuishouha","Suiton Baku Suishou no Jutsu é uma técnica que dispara um grande tsunami de agua que cobre o campo com água que pode ser usada a favor do usuário.. 5 Pontos de Jutsus","Suiton",5)
				//		usr.ElementalPointDeduction = 5
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			WaterCreation
				icon_state="WaterCreation"
				Click()
					if((usr.ElementalPoints>=2)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Water Creation Jutsu",10000,"WaterCreation","Criacao de Agua é um jutsu que cria uma fonte de agua ao redor do usuario que permite aos jogadores usarem livremente.. 2 Pontos de Jutsus","Suiton",2)
				//		usr.ElementalPointDeduction = 2
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Suijinheki
				icon_state="Suijinheki"
				Click()
					if(!(locate(/obj/SkillCards/WaterCreation) in usr.LearnedJutsus))
						usr<<"Você precisa aprender a Criacao de Agua antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/WaterCreation/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<150)
						usr<<"Você precisa de pelo menos 150 Conhecimento em Suiton!";return
					if((usr.ElementalPoints>=3)&&(usr.Mnin >= 22))
						usr.LearnJutsu("Suiton Suijinheki No Jutsu",5000,"Suijinheki","Suiton Suijinheki no Jutsu é um jutsu que cria uma cachoeira em frente ao usuario para bloquear técnicas recebidas. 3 Pontos de Jutsus","Suiton",3)
				//		usr.ElementalPointDeduction = 3
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."
			Teppoudama
				icon_state="Water Bullet"
				Click()
					if((usr.ElementalPoints>=4)&&(usr.Mnin >= 30))
						usr.LearnJutsu("Suiton Teppoudama",25000,"Teppoudama","Suiton Teppoudama é um projétil de bala de água forte e rápido que quando colide com algo explode com uma grande onda de choque batendo em todos por perto e arremesa para longe com muita força. 4 Pontos de Jutsus","Suiton",4)
				//		usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			MizuTeppou
				icon_state="WaterGun"
				Click()
					if(!(locate(/obj/SkillCards/Teppoudama) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Teppoudama antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Teppoudama/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=4)&&(usr.Mnin>=30))
						usr.LearnJutsu("Suiton Water Gun",20000,"MizuTeppou","E um jutsu avançado que dispara um poderoso tiro de água no oponente, danificando-os ferozmente. 4 Pontos de Jutsus","Suiton",4)
				//		usr.ElementalPointDeduction=4
						usr.Frozen=0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			MizuBunshin
				icon_state="SuitonBunshin"
				Click()
					if(!(locate(/obj/SkillCards/Suikoudan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Suikodan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Suikoudan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if((usr.ElementalPoints>=4)&&(usr.Mnin>=30))
						usr.LearnJutsu("Suiton: Water Clones",35000,"MizuBunshin","E um jutsu que permite ao ninja criar clones de agua poderosos.. 5 Pontos de Jutsus","Suiton",5)
				//		usr.ElementalPointDeduction=5
						usr.Frozen=0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			WaterPrison
				icon_state="WaterPrison"
				Click()
					if(!(locate(/obj/SkillCards/Suiryuudan) in usr.LearnedJutsus))
						usr<<"Você precisa aprender o Suiryuudan antes para que você possa aprender este jutsu!";return
					for(var/obj/SkillCards/Suiryuudan/P in usr.LearnedJutsus)
						if(P:Copied==1)
							usr<<"Você usou Sharingan Copiador para aprender este Jutsu! Você precisa saber como usá-lo originalmente! "
							return
					if(usr.SuitonKnowledge<350)
						usr<<"Você precisa de pelo menos 350 Conhecimento em Suiton!";return
					if((usr.ElementalPoints >=4)&&(usr.Mnin >= 45))
						usr.LearnJutsu("Suiton Suirou",50000,"WaterPrison","É uma técnica Suiton que engole um adversário com uma esfera de agua que prende tanto o usuário quanto a vítima.. 4 Pontos de Jutsus","Suiton",4)
					//	usr.ElementalPointDeduction = 4
						usr.Frozen = 0
						return
					else
						usr<<"Eu receio que você não tem a capacidade de aprender este jutsu."

			Shousen
				icon_state="Shousen"
				Click()
					if(!(locate(/obj/SkillCards/Shousen) in usr.LearnedJutsus))
						if(usr.GenSkill+(usr.ChakraC/25)>=14)
							if((usr.ElementalPoints >=3)&&(usr.NinjutsuKnowledge>150))
								usr.LearnJutsu("Heal",50000,"Shousen","Shousen Jutsu é um jutsu medicc que capacita a pessoa a curar alguém utilizando o seu chakra. 3 Pontos de Jutsus","Ninjutsu",3)
							else
								usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
						else if(usr.GenSkill<11)
							usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
					else
						usr<<"Você ja aprendeu [src]!";return
			ShousenMastery
				name="Shousen Mastery"
				icon_state="ShousenUpgrade"
				var/price="Pontos de Jutsus"
				var/maxprice=3
				var/cost=2
				Click()
					if(locate(/obj/SkillCards/Shousen) in usr.LearnedJutsus)
						if(3<=usr.ShousenMastery)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] é um passivo que permite aumentar a capacidade de cura por 200 pontos no Shousen. Como Treinar lo: [price] [usr.ShousenMastery]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Gostaria de aumentar esse passiva utilizando seus Pontos de Jutsus? Custo: [cost] Pontos de Jutsus por ponto.") in list ("Nao","Sim"))
								if("Sim")
									usr.ShousenMastery++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
									return
					else
						usr<<"Você precisa aprender o Shousen antes para que você possa aprender isto!";return
			Chikatsu
				icon_state="Chikatsu"
				Click()
					if(locate(/obj/SkillCards/Shousen) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/Chikatsu) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=17)
								if((usr.ElementalPoints >=4)&&(usr.NinjutsuKnowledge>250))
									usr.LearnJutsu("Chikatsu Saisei no Jutsu",45000,"Chikatsu","Chikatsu Saisei no Jutsu é uma técnica que ajuda as pessoas na faixa de sua técnica. O melhor que você está na cura, quanto mais usada maior o alcance. 4 Pontos de Jutsus","Ninjutsu",4)
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<14)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
							else if(!(locate(/obj/SkillCards/Shousen) in usr.LearnedJutsus))
								usr<<"You need to learn Shousen first!";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Shousen antes para que você possa aprender este jutsu!";return
			Cure
				name="Advanced Healing"
				icon_state="Cure"
				var/price="Pontos de Jutsus"
				var/maxprice=1
				var/cost=1
				Click()
					if(locate(/obj/SkillCards/Chikatsu) in usr.LearnedJutsus)
						if(1<=usr.Cure)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] é um passivo que lhe permite tambem curar efeitos adicionais como Envenenamento, Queimadura, e Paralisia usando o Shousen .. Como Treinar lo..: [price] [usr.Cure]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Gostaria de aumentar esse passiva utilizando seus Pontos de Jutsus? Custo: [cost] Pontos de Jutsus por ponto.") in list ("Nao","Sim"))
								if("Sim")
									usr.Cure++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
									return
					else
						usr<<"Você precisa aprender o Chikatsu antes para que você possa aprender isto!";return
			SelfHeal
				icon_state="Meisagakure"
				Click()
					if(locate(/obj/SkillCards/Chikatsu) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/SelfHeal) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=20)
								if((usr.ElementalPoints >=4)&&(usr.NinjutsuKnowledge>500))
									usr.LearnJutsu("Self Regeneration",50000,"SelfHeal","Auto regeneracao é uma tecnica conhecida para apenas o mais forte dos ninja medico. Isso lhes permite curar-se atraves da conversao de seu chakra, curando suas feridas e órgãos vitais. 6 Pontos de Jutsus","Ninjutsu",6)
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<19)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
							else if(!(locate(/obj/SkillCards/Chikatsu) in usr.LearnedJutsus))
								usr<<"Você precisa aprender o Chikatsu antes para que você possa aprender isto!";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Chikatsu antes para que você possa aprender isto!";return
			GenerationMastery
				name="Self Healing Mastery"
				icon_state="GenerationMastery"
				var/price="Pontos de Jutsus"
				var/maxprice=2
				var/cost=2
				Click()
					if(locate(/obj/SkillCards/SelfHeal) in usr.LearnedJutsus)
						if(2<=usr.GenerationMastery)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] é uma passiva aumentada por aqueles que aprenderam a manter a sua capacidade de curar-se. Reduzindo o Custo de Chakra, e aumenta a taxa em que você cura para cada Ponto usado , como treiná-lo: [price] [usr.GenerationMastery]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Gostaria de aumentar esse passiva utilizando seus Pontos de Jutsus? Custo: [cost] Pontos de Jutsus por ponto.") in list ("Nao","Sim"))
								if("Sim")
									usr.GenerationMastery++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
									return
					else
						usr<<"Você precisa aprender o Curar-se antes para que você possa aprender isto!";return
			ChakraNoMesu
				icon_state="ChakraNoMesu"
				Click()
					if(locate(/obj/SkillCards/Shousen) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=12)
								if((usr.ElementalPoints >=4)&&(usr.NinjutsuKnowledge>150))
									usr.LearnJutsu("Chakra No Mesu",35000,"ChakraNoMesu","Chakra No Mesu é uma técnica que permite Medicos rasgar corpos abertos para a cirurgia.Apesar ele pode ser usado para táticas ofensivas tambem. 3 Pontos de Jutsus","Ninjutsu",3)
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<11)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Shoushen antes para que você possa aprender isto!";return
			Leg_Slice
				icon_state="ChakraNoMesu"
				Click()
					if(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/Leg_Slice) in usr.LearnedJutsus))
							if((usr.GenSkill+(usr.ChakraC/25))>=15)
								if(usr.ScalpelMastery>=2)
									if(usr.NinjutsuKnowledge>150)
										usr.LearnJutsu("Leg Slice",35000,"Leg_Slice"," Leg Slice is a technique utilizing the chakra Scalpels to slice the legs of the victim, rendering them from Running.","Ninjutsu")
									else
										usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<12)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Chakra No Mesu antes para que você possa aprender isto!";return
			Muscle_Slice
				icon_state="ChakraNoMesu"
				Click()
					if(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/Muscle_Slice) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=14)
								if(usr.ScalpelMastery>=2)
									if(usr.NinjutsuKnowledge>150)
										usr.LearnJutsu("Muscle Slice",35000,"Muscle_Slice","Muscle Slice is a technique utilizing the chakra scalpels, causing the opponent to bleed severly over time.","Ninjutsu")
									else
										usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<12)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Chakra No Mesu antes para que você possa aprender isto!";return
			Neck_Slice
				icon_state="ChakraNoMesu"
				Click()
					if(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/Neck_Slice) in usr.LearnedJutsus))
							if(usr.GenSkill>=8)
								if(usr.ScalpelMastery>=1)
									if(usr.NinjutsuKnowledge>150)
										usr.LearnJutsu("Neck Slice",35000,"Neck_Slice","Neck Slice is a technique utilizing the chakra scalpels, causing the opponent to feel massive pain once struck in the neck..","Ninjutsu")
									else
										usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<8)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Chakra No Mesu antes para que você possa aprender isto!";return
			ScalpelMastery
				name="Scalpel Mastery"
				icon_state="ChakraNoMesuUpgrade"
				var/price="By raising it with leftover Elemental Points"
				var/maxprice=2
				var/cost=1
				Click()
					if(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus)
						if(usr.GenSkill+(usr.ChakraC/25)<15)
							usr<<"Você não tem o controle suficiente com seu chakra para aprender isso.";return
						if(2<=usr.ScalpelMastery)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] is a passive proving your knowledge of Chakra Scalpels; enabling you to learn techniques for them .How to Train it: [price] [usr.ScalpelMastery]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
								if("Yes")
									usr.ScalpelMastery++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
									return
					else
						usr<<"Você precisa aprender o Chakra No Mesu antes para que você possa aprender isto!";return
			ChakraAbsorbtion
				icon_state="ChakraAbsorb"
				Click()
					if(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/ChakraAbsorb) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=17)
								if(usr.NinjutsuKnowledge>500)
									usr.LearnJutsu("Chakra Absorbtion Technique",25000,"ChakraAbsorb","Chakra Absorbtion Technique is a very powerful Jutsu that allows the user to steal the chakra from a living being once they get close enough just by placing their hand upon them.","Ninjutsu")
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<15)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return

						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"Você precisa aprender o Chakra No Mesu antes para que você possa aprender isto!";return
			ChakraLeech
				name="Chakra Leech"
				icon_state="ChakraAbsorb"
				var/price="By raising it with leftover Elemental Points"
				var/maxprice=2
				var/cost=2
				Click()
					if(locate(/obj/SkillCards/ChakraAbsorb) in usr.LearnedJutsus)
						if(2<=usr.ChakraLeech)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] is a passive for those who want to strengthen their Chakra Absorbtion Technique. This causes chakra to be drained at a much faster rate, along with a slightly increase in drain amount. How to Train it: [price] [usr.ChakraLeech]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
								if("Yes")
									usr.ChakraLeech++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
									return
					else
						usr<<"You must know Chakra Absorb first!";return
			Oukashou
				icon_state="Oukashou"
				Click()
					if(locate(/obj/SkillCards/ChakraNoMesu) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/Oukashou) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=18)
								if(usr.NinjutsuKnowledge>300)
									usr.LearnJutsu("Oukashou",50000,"Oukashou","Oukashou is a jutsu that generates chakra into the user hand to release for a strong taijutsu attack!","Taijutsu")
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<15)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"You must know Chakra Scaples first!";return
			AdvanceChakraControl
				name="Advanced Chakra Control"
				icon_state="Oukashou"
				var/price="By raising it with leftover Elemental Points"
				var/maxprice=2
				var/cost=2
				Click()
					if(locate(/obj/SkillCards/Oukashou) in usr.LearnedJutsus)
						if(2<=usr.OukashouMastery)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] is a passive for those who have learned to fully utilize their Chakra Punching Abilities, learning to even use multiple punches per use!. How to Train it: [price] [usr.OukashouMastery]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
								if("Yes")
									usr.OukashouMastery++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
									return
					else
						usr<<"You must know Oukashou first!";return
			PoisonGas
				name="Medical Ninjutsu: Poison Gas"
				icon_state="TripleChakraWave"
				Click()
					if(!(locate(/obj/SkillCards/PoisonFog) in usr.LearnedJutsus))
						if(usr.GenSkill+(usr.ChakraC/25)>=15)
							if(usr.NinjutsuKnowledge>100)
								usr.LearnJutsu("Medical Ninjutsu: Poison Fog",50000,"PoisonFog","Poison Fog is a medical Ninjutsu that creates a poisinous gass that can greatly damage the opponent.","Ninjutsu")
							else
								usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
						else if(usr.GenSkill<12)
							usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
					else
						usr<<"Você ja aprendeu [src]!";return

			PoisonMist
				name="Medical Ninjutsu: Poison Mist"
				icon_state="TripleChakraWave"
				Click()
					if(locate(/obj/SkillCards/PoisonFog) in usr.LearnedJutsus)
						if(usr.GenSkill+(usr.ChakraC/25)>=16)
							if(usr.NinjutsuKnowledge>300)
								if(usr.PoisonKnowledge>50)
									usr.LearnJutsu("Medical Ninjutsu: Poison Mist",50000,"PoisonMist","Poison Mist is a medical Ninjutsu that causes the opponent to make poison surround them, easily poisoning people who like to get up close.","Ninjutsu")
								else
									usr<<"You need more Poison Knowledge to learn this technique!";return
							else
								usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
						else if(usr.GenSkill+(usr.ChakraC/25)<13)
							usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu.";return
					else
						usr<<"You need to learn Poison Fog before you can learn this Jutsu!";return
			PoisonClone
				name="Medical Ninjutsu: Poison Clone Release"
				icon_state="PoisonClone"
				Click()
					if(locate(/obj/SkillCards/PoisonMist) in usr.LearnedJutsus)
						if(usr.GenSkill+(usr.ChakraC/25)>18)
							if(usr.NinjutsuKnowledge>350)
								if(usr.PoisonKnowledge>50)
									usr.LearnJutsu("Medical Ninjutsu: Poison Clone Release",50000,"PoisonClone","Poison Clone Release is a medical Ninjutsu allowing the medic to enfuse their bunshin with poison gas, causing poison gas to spew from the bunshin once it's destroyed.","Ninjutsu")
								else
									usr<<"You need more Poison Knowledge to learn this technique";return
							else
								usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
						else if(usr.GenSkill+(usr.ChakraC/25)<18)
							usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu.";return
					else
						usr<<"You need to learn Poison Mist and Clone Jutsu before you can learn this Jutsu!";return


			ChakraMode
				icon_state="Meisagakure"
				Click()
					if(locate(/obj/SkillCards/SelfHeal) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/ChakraMode) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=28)
								if(usr.NinjutsuKnowledge>750)
									usr.LearnJutsu("Forbidden Medical Ninjutsu: Chakra Release",100000,"ChakraMode","Chakra Release, a forbidden Medical Ninjutsu, is known to only a few medics within the World due to it's extreme power. Do not use this jutsu unless you're willing to face the consequences.","Ninjutsu")
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<24)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"You must know Self Heal first!";return
			ForbiddenMedicalKnowledge
				name="Forbidden Medical Ninjutsu Knowledge"
				icon_state="Meisagakure"
				var/price="By raising it with leftover Elemental Points"
				var/maxprice=1
				var/cost=3
				Click()
					if(locate(/obj/SkillCards/ChakraMode) in usr.LearnedJutsus)
						if(1<=usr.ChakraModeMastery)
							usr<<"Você não pode aumentar essa passive mais." ; return
						usr<<sound('SFX/click1.wav',0)
						alert(usr,"[src] has learned the most dangerous Medical Ninjutsu, but you can increase the strength of it with this passive.... How to Train it: [price] [usr.ChakraModeMastery]/[maxprice]","[src.name]")
						if(usr.ElementalPoints>=cost&&!usr.clicking)
							usr.clicking=1
							switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
								if("Yes")
									usr.ChakraModeMastery++;usr.ElementalPoints-=cost;usr.clicking=0
								else
									usr.clicking=0
					else
						usr<<"You must know Chakra Mode first!";return
			ChakraKick
				icon_state="Oukashou"
				Click()
					if(locate(/obj/SkillCards/Oukashou) in usr.LearnedJutsus)
						if(!(locate(/obj/SkillCards/ChakraKick) in usr.LearnedJutsus))
							if(usr.GenSkill+(usr.ChakraC/25)>=22)
								if(usr.NinjutsuKnowledge>500)
									usr.LearnJutsu("Cherry Blossom Slam",100000,"ChakraKick","Chakra Blossom Slam is a much more powerful version of Cherry Blossom Collision, but utilizing the leg for a much more devastating attack.","Ninjutsu")
								else
									usr<<"Você não tem oque é necessario para aprender esta tecnica!";return
							else if(usr.GenSkill<19)
								usr<<"Você não tem o controle suficiente com seu chakra para aprender este Jutsu..";return
						else
							usr<<"Você ja aprendeu [src]!";return
					else
						usr<<"You must know Oukashou first!";return

		//Passives
		FireChakra
			name="Fire Mastery"
			icon_state="FireChakra"
			var/price="Using fire based techniques.."
			var/maxprice=20
			var/cost=1
			Click()
				if(usr.FireChakra>20)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				alert(usr,"[src] is a passive that allows you to increase your damage done by fire jutsu. How to Train it: [price] [usr.FireChakra]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							usr.FireChakra++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		KatonKnowledge
			name="Katon Knowledge"
			icon_state="KatonKnowledge"
			var/price="Using fire based techniques.."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to learn stronger fire based techniques. How to Train it: [price] [usr.KatonKnowledge]/[maxprice]","[src.name]")
		Broil
			icon_state="Broil"
			var/maxprice=5
			var/cost=1
			Click()
				if(5<=usr.Broil)
					usr<<"You cannot raise this any further." ; return
				alert(usr,"[src] is a passive that increases your chance to leave your opponents with a burn, as well as the duration of the burn. Current: [usr.Broil]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<50*(usr.Broil+1))
								usr<<"You need [50*(usr.Broil+1)] Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Broil++;usr.ElementalPoints-=cost;usr.clicking=0

						else
							usr.clicking=0
							return
		Inferno
			icon_state="Inferno"
			var/maxprice=3
			var/cost=1
			Click()
				if(3<=usr.Inferno)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Goukakyuu) in usr.LearnedJutsus))
					usr<<"You need to know Katon Goukakyuu first!";return
				for(var/obj/SkillCards/Goukakyuu/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the size of your Fireball (Goukakyuu) Jutsu. Current: [usr.Inferno]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<25*(usr.Inferno+1))
								usr<<"You need [25*(usr.Inferno+1)] Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Inferno++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Housenka_Expert
			icon_state="HousenkaExpert"
			var/maxprice=2
			var/cost=2
			Click()
				if(2<=usr.HousenkaExpert)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Housenka) in usr.LearnedJutsus))
					usr<<"You need to know Katon Housenka first!";return
				for(var/obj/SkillCards/Housenka/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the number of fireballs shot when using Phoenix Flower (Housenka) Jutsu. Current: [usr.HousenkaExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<25*(usr.HousenkaExpert+1))
								usr<<"You need [25*(usr.HousenkaExpert+1)] Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.HousenkaExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Dragons_Rage
			icon_state="DragonsRage"
			var/maxprice=2
			var/cost=2
			Click()
				if(2<=usr.DragonsRage)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Ryuuka) in usr.LearnedJutsus))
					usr<<"You need to know Ryuuka first!";return
				for(var/obj/SkillCards/Ryuuka/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the range of your fire style jutsus' explosions. Current: [usr.DragonsRage]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<100*(usr.DragonsRage+1))
								usr<<"You need [100*(usr.DragonsRage+1)] Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.DragonsRage++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Dragon_Tamer
			icon_state="DragonTamer"
			var/maxprice=3
			var/cost=2
			Click()
				if(3<=usr.DragonTamer)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Gouryuuka) in usr.LearnedJutsus))
					usr<<"You need to know Katon Gouryuuka first!";return
				for(var/obj/SkillCards/Gouryuuka/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the mastery of your dragon heads shot when using Grand Dragon Fire (Gouryuuka) Jutsu.. The Strength, Speed, and Chakra Drain will all increase(Drain will lower). It also increases how fast you are able to master Jutsu such as Gouryuuka and Chou Houka much quicker. Current: [usr.DragonTamer]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<200*(usr.DragonTamer+1))
								usr<<"You need [200*(usr.DragonTamer+1)] Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.DragonTamer++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		FireImmunity
			name="Flame Resistance"
			icon_state="FireImmunity"
			var/maxprice=5
			var/cost=1
			Click()
				if(5<=usr.FireImmunity)
					usr<<"You cannot raise this any further." ; return
				if(usr.FireChakra<1)
					usr<<"You need at least 1 point in Fire Master before you can raise this passive!";return
				alert(usr,"[src] is a passive that increases your resistance to your own fire, so you can use them at close range with less recoil. Damage is reduced by 10% for each point. Current: [usr.FireImmunity]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<35*(usr.FireImmunity+1))
								usr<<"You need [35*(usr.FireImmunity+1)] Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.FireImmunity++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		BlueFire
			name="Blue Fire"
			icon_state="BlueFlames"
			var/maxprice=1
			var/cost=7
			Click()
				if(1<=usr.BlueFire)
					usr<<"You cannot raise this any further." ; return
				if(usr.Magma==1)
					usr<<"You already have Magma, you can't learn this!";return
				if(usr.BlueFire==1)
					usr<<"You already have this.";return
				if(!(locate(/obj/SkillCards/KaryuuEndan) in usr.LearnedJutsus)||(!(locate(/obj/SkillCards/GoukaMekkyakuNoJutsu) in usr.LearnedJutsus)))
					usr<<"You need to know Katon Karyuu Endan first and Mekkyaku first!";return
				for(var/obj/SkillCards/KaryuuEndan/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				for(var/obj/SkillCards/GoukaMekkyakuNoJutsu/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the power of your Fire Style Jutsus by 1.5x and also permanently changes the color of them to blue. Current: [usr.BlueFire]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<1250)
								usr<<"You need 1250 Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.BlueFire=1;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Magma
			name="Magma"
			icon_state="Magma"
			var/maxprice=1
			var/cost=5
			Click()
				if(usr.Magma==1)
					usr<<"You cannot raise this any further." ; return
				if(usr.Magma==1)
					usr<<"You already have this.";return
				if(usr.BlueFire==1)
					usr<<"You already have Blue Fire, you can't learn this!";return
			//	if(!(locate(/obj/SkillCards/ChouHouka) in usr.LearnedJutsus))
			//		usr<<"You need to know Chou Houka and Katon Ryuusenka first!";return
				if(!(locate(/obj/SkillCards/KatonDragonWar) in usr.LearnedJutsus))
					usr<<"You need to know both Katon Ryuusenka first!";return
				for(var/obj/SkillCards/KatonDragonWar/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the residual heat around your fireballs, so opponents are damanged just by being near them. Current: [usr.Magma]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.KatonKnowledge<1000)
								usr<<"You need 1000 Katon Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Magma=1;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		SuitonKnowledge
			name="Suiton Knowledge"
			icon_state="SuitonKnowledge"
			var/price="Using water based techniques.."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to learn stronger water based techniques. How to Train it: [price] [usr.SuitonKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		WaterChakra
			name="Water Mastery"
			icon_state="WaterChakra"
			var/price="Using water based techniques.."
			var/maxprice=20
			var/cost=1
			Click()
				if(usr.WaterChakra>20)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to increase your damage done by water jutsu. How to Train it: [price] [usr.WaterChakra]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							usr.WaterChakra++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		WaterPressure
			name="Water Pressure"
			icon_state="WaterPressure"
			var/maxprice=5
			var/cost=1
			Click()
				if(10<=usr.WaterPressure)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Mizurappa) in usr.LearnedJutsus))
					usr<<"You need to know Mizurappa first!";return
				for(var/obj/SkillCards/Mizurappa/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] Increases the pressure of water projectiles dealing 15% more damage for each point.. Current: [usr.WaterPressure]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking&&usr.WaterPressure<5)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.SuitonKnowledge<35*(usr.WaterPressure+1))
								usr<<"You need [35*(usr.WaterPressure+1)] Suiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.WaterPressure++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		WaterSpawn
			name="Water Creation"
			icon_state="WaterSpawn"
			var/maxprice=3
			var/cost=2
			Click()
				if(3<=usr.WaterSpawn)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/WaterCreation) in usr.LearnedJutsus))
					usr<<"You need to know Water Creation first!";return
				for(var/obj/SkillCards/WaterCreation/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that allows you to utilize water jutsus without an existing water source. They will be weaker than normal (50%), however, but the damage increases by 10% for each additional point. Current: [usr.WaterSpawn]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.SuitonKnowledge<50*(usr.WaterSpawn+1))
								usr<<"You need [50*(usr.WaterSpawn+1)] Suiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.WaterSpawn++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		OneWithWater
			name="One With Water"
			icon_state="OneWithWater"
		SuikoudanMastery
			icon_state="SuikoudanMastery"
			var/maxprice=4
			var/cost=1
			Click()
				if(4<=usr.WaterSharksExpert)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Suikoudan) in usr.LearnedJutsus))
					usr<<"You need to know Suikoudan first!";return
				for(var/obj/SkillCards/Suikoudan/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the number of water sharks created when you use Man Eating Water Sharks (Suikoudan) Jutsu. Current: [usr.WaterSharksExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.SuitonKnowledge<75*(usr.WaterSharksExpert+1))
								usr<<"You need [75*(usr.WaterSharksExpert+1)] Suiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.WaterSharksExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		SuiyuudanMastery
			icon_state="SuiryuudanMastery"
			var/maxprice=2
			var/cost=2
			Click()
				if(2<=usr.WaterDragonMaster)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Suiryuudan) in usr.LearnedJutsus))
					usr<<"You need to know Suiryuudan first!";return
				for(var/obj/SkillCards/Suiryuudan/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the efficiency of your Water Dragon (Suiryuudan) Jutsu. Current: [usr.WaterDragonMaster]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.SuitonKnowledge<100*(usr.WaterDragonMaster+1))
								usr<<"You need [100*(usr.WaterDragonMaster+1)] Suiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.WaterDragonMaster++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		BakuSuihouExpert
			icon_state="BakuExpert"
			var/maxprice=2
			var/cost=2
			Click()
				if(2<=usr.BakuExpert)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/BakuSuishouha) in usr.LearnedJutsus))
					usr<<"You need to know Baku Suishouha first!";return
				for(var/obj/SkillCards/BakuSuishouha/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the range your Bursting Collision Water Waves (Baku Suishouha) Jutsu covers when used. Current: [usr.BakuExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.SuitonKnowledge<125*(usr.BakuExpert+1))
								usr<<"You need [125*(usr.BakuExpert+1)] Suiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.BakuExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		RaitonKnowledge
			name="Raiton Knowledge"
			icon_state="RaitonKnowledge"
			var/price="Using lightning based techniques."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				sd_Alert(usr, "[src] is a passive that allows you to learn stronger lightning based techniques. How to Train it: [price] [usr.RaitonKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		LightningChakra
			name="Lightning Mastery"
			icon_state="LightningChakra"
			var/price="Using lightning based techniques.."
			var/maxprice=20
			var/cost=1
			Click()
				if(usr.LightningChakra>20)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to increase your damage done by lightning jutsu. How to Train it: [price] [usr.LightningChakra]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							usr.LightningChakra++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Static
			name="Static"
			icon_state="Static"
			var/maxprice=3
			var/cost=2
			Click()
				if(3<=usr.Static)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/IkazuchiKiba) in usr.LearnedJutsus))
					usr<<"You need to know Ikazuchi Kiba first!";return
				for(var/obj/SkillCards/IkazuchiKiba/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the duration your opponents are stunned for upon being struck with a Lightning Style Jutsu. Current: [usr.Static]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.RaitonKnowledge<50*(usr.Static+1))
								usr<<"You need [50*(usr.Static+1)] Raiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Static++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Electromagnetivity
			name="Electromagnetivity"
			icon_state="Electromagnetivity"
			var/maxprice=3
			var/cost=2
			Click()
				if(3<=usr.Electromagnetivity)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Tatsumaki) in usr.LearnedJutsus))
					usr<<"You need to know Rairyuu Tatsumaki first!";return
				for(var/obj/SkillCards/Tatsumaki/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the chance you will temporarily screw up an opponent's nervous system upon being struck with a Lightning Style Jutsu. Current: [usr.Electromagnetivity]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.RaitonKnowledge<100*(usr.Electromagnetivity+1))
								usr<<"You need [100*(usr.Electromagnetivity+1)] Raiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Electromagnetivity++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		ShockTreatment
			name="Shock Treatment"
			icon_state="ShockTreatment"
			var/maxprice=5
			var/cost=2
			Click()
				if(5<=usr.ShockTreatment)
					usr<<"You cannot raise this any further.";return
				if(!(locate(/obj/SkillCards/Raikiri) in usr.LearnedJutsus))
					usr<<"You need to know Raikiri first!";return
				for(var/obj/SkillCards/Raikiri/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that allows your raiton to cause such strong electrucutions they have the ability to screw with the brain, disabling usage of handseals for a while.Each point raises the chance by 10%. Current: [usr.ShockTreatment]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental points per point.") in list("No","Yes"))
						if("Yes")
							if(usr.RaitonKnowledge<100*(usr.ShockTreatment+1))
								usr<<"You need [100*(usr.ShockTreatment+1)] Raiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.ShockTreatment++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return


		RaikyuuExpert
			name="Raikyuu Expert"
			icon_state="RaikyuuExpert"
			var/maxprice=3
			var/cost=1
			Click()
				if(3<=usr.RaikyuuExpert)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Raikyuu) in usr.LearnedJutsus))
					usr<<"You need to know Raikyuu first!";return
				for(var/obj/SkillCards/Raikyuu/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that upgrades the size and power of your Lightning Ball (Raikyuu) Jutsu. Current: [usr.RaikyuuExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.RaitonKnowledge<50*(usr.RaikyuuExpert+1))
								usr<<"You need [50*(usr.RaikyuuExpert+1)] Raiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.RaikyuuExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		ChidoriSenbonExpert
			name="Chidori Senbon Expert"
			icon_state="ChidoriSenbon"
			var/maxprice=2
			var/cost=1
			Click()
				if(usr.ChidoriSenbonExpert>2)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/ChidoriSenbon) in usr.LearnedJutsus))
					usr<<"You need to know Chidori Senbon first!";return
				alert(usr,"[src] is a passive that increases the number of electrical senbon thrown when using Chidori Senbon Jutsu. Current: [usr.ChidoriSenbonExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.RaitonKnowledge<75*(usr.ChidoriSenbonExpert+1))
								usr<<"You need [75*(usr.ChidoriSenbonExpert+1)] Raiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.ChidoriSenbonExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		ChidoriNagashiExpert
			name="Chidori Nagashi Expert"
			icon_state="NagashiExpert"
			var/maxprice=2
			var/cost=1
			Click()
				if(usr.NagashiExpert>2)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/ChidoriNagashi) in usr.LearnedJutsus))
					usr<<"You need to know Chidori Nagashi first!";return
				alert(usr,"[src] is a passive that increases the range of your Chidori Current (Nagashi) Jutsu. Current: [usr.NagashiExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.RaitonKnowledge<90*(usr.NagashiExpert+1))
								usr<<"You need [90*(usr.NagashiExpert+1)] Raiton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.NagashiExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		FuutonKnowledge
			name="Fuuton Knowledge"
			icon_state="WindKnowledge"
			var/price="Using wind based techniques."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to learn stronger wind based techniques. How to Train it: [price] [usr.FuutonKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		WindChakra
			name="Wind Mastery"
			icon_state="WindChakra"
			var/price="Using wind based techniques.."
			var/maxprice=20
			var/cost=1
			Click()
				if(usr.WindChakra>20)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to increase your damage done by wind jutsu. How to Train it: [price] [usr.WindChakra]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							usr.WindChakra++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		ReppushouExpert
			icon_state="ReppushouExpert"
			var/maxprice=3
			var/cost=1
			Click()
				if(3<=usr.ReppushouExpert)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Reppushou) in usr.LearnedJutsus))
					usr<<"You need to know Reppushou first!";return
				for(var/obj/SkillCards/Reppushou/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the size of your Wind Palm (Reppushou) Jutsu. Current: [usr.ReppushouExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<70*(usr.ReppushouExpert+1))
								usr<<"You need [70*(usr.ReppushouExpert+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.ReppushouExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		DaitoppaMastery
			icon_state="DaitoppaMastery"
			var/maxprice=2
			var/cost=2
			Click()
				if(usr.DaitoppaExpert>2)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Daitoppa) in usr.LearnedJutsus))
					usr<<"You need to know Daitoppa first!";return
				for(var/obj/SkillCards/Daitoppa/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the range of your Great Breakthrough (Daitoppa) Jutsu. Current: [usr.DaitoppaExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&usr.DaitoppaExpert<2&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<100*(usr.DaitoppaExpert+1))
								usr<<"You need [100*(usr.DaitoppaExpert+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.DaitoppaExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		WindSwordMastery
			icon_state="WindSwordMastery"
			var/maxprice=2
			var/cost=1
			Click()
				if(usr.WindSwordMastery>2)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/Yaiba) in usr.LearnedJutsus))
					usr<<"You need to know Kaze Yaiba first!";return
				for(var/obj/SkillCards/Yaiba/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the range and damage of your Wind Sword (Kaze Yaiba) Jutsu. Current: [usr.WindSwordMastery]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&usr.WindSwordMastery<2&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<60*(usr.WindSwordMastery+1))
								usr<<"You need [60*(usr.WindSwordMastery+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.WindSwordMastery++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		VacuumSphereExpert
			icon_state="VacuumSphere"
			var/maxprice=2
			var/cost=2
			Click()
				if(usr.VacuumSphereExpert>2)
					usr<<"You cannot raise this any further." ; return
				if(!(locate(/obj/SkillCards/VacuumSphere) in usr.LearnedJutsus))
					usr<<"You need to know Vacuum Sphere first!";return
				for(var/obj/SkillCards/VacuumSphere/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr,"[src] is a passive that increases the number of shots fired when you use Vacuum Sphere Jutsu. Current: [usr.VacuumSphereExpert]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<120*(usr.VacuumSphereExpert+1))
								usr<<"You need [120*(usr.VacuumSphereExpert+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.VacuumSphereExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		WindVelocity
			icon_state="WindVelocity"
			var/maxprice=5
			var/cost=1
			Click()
				return
			/*
				if(5<=usr.WindVelocity)
					usr<<"You cannot raise this any further." ; return
				if(usr.WindChakra<1)
					usr<<"You need at least 1 / 20 Wind Mastery before you can view this passive!";return
				alert(usr,"[src] is a passive that increases the speed of your Wind Jutsus. Current: [usr.WindVelocity]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<20*(usr.WindVelocity+1))
								usr<<"You need [20*(usr.WindVelocity+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.WindVelocity++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
							*/
		Torrential_Winds
			icon_state="TorrentialWinds"
			var/maxprice=3
			var/cost=1
			Click()
				if(3<=usr.TorrentialWinds)
					usr<<"You cannot raise this any further." ; return
	//			if(usr.WindVelocity<2)
	//				usr<<"You need at least 2 / 5 Wind Velocity before you can view this passive!";return
				alert(usr,"[src] is a passive that leaves a trail of streaming air, that will damage anyone caught in them, behind all your Wind Jutsus if you press and hold Z before firing them. Current: [usr.TorrentialWinds]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<100*(usr.TorrentialWinds+1))
								usr<<"You need [100*(usr.TorrentialWinds+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.TorrentialWinds++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Tornado
			icon_state="Tornado"
			var/maxprice=1
			var/cost=5
			Click()
				if(usr.Tornado>1)
					usr<<"You cannot raise this any further." ; return
				alert(usr,"[src] is a passive gives your Wind Jutsus the ability to suck in all opponents in a 1 tile range around them. Current: [usr.Tornado]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.FuutonKnowledge<200*(usr.Tornado+1))
								usr<<"You need [200*(usr.Tornado+1)] Fuuton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Tornado++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		EarthChakra
			name="Earth Mastery"
			icon_state="EarthChakra"
			var/price="Using earth based techniques.."
			var/maxprice=20
			var/cost=1
			Click()
				if(usr.EarthChakra>20)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to increase your damage done by earth jutsu. How to Train it: [price] [usr.EarthChakra]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							usr.EarthChakra++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		DotonKnowledge
			name="Doton Knowledge"
			icon_state="DotonKnowledge"
			var/price="Using earth based techniques.."
			var/maxprice=20
			Click()

				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that allows you to learn stronger earth based techniques. How to Train it: [price] [usr.DotonKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Like_A_Stone
			icon_state="LikeAStone"
			var/maxprice=4
			var/cost=1
			Click()
				if(usr.LikeAStone>=4)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that increases your resistance to unwanted movement from jutsus or other forms of attacks. Current: [usr.LikeAStone]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<50*(usr.LikeAStone+1))
								usr<<"You need [50*(usr.LikeAStone+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.LikeAStone++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Like_A_Mountain
			icon_state="LikeAMountain"
			var/maxprice=4
			var/cost=2
			Click()
				if(usr.LikeAMountain>=4)
					usr<<"You cannot raise this any further."
					return
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] is a passive that increases your resistance to being stunned or flinching from punches for each point. Current: [usr.LikeAMountain]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<60*(usr.LikeAMountain+1))
								usr<<"You need [60*(usr.LikeAMountain+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.LikeAMountain++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		DangoExpert
			icon_state="BoulderExpert"
			var/maxprice=1
			var/cost=2
			Click()
				if(usr.BoulderExpert>1)
					usr<<"You cannot raise this any further."
					return
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/DoryoDango) in usr.LearnedJutsus))
					usr<<"You need to know Doryo Dango first!";return
				for(var/obj/SkillCards/DoryoDango/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr, "[src] is a passive that increases the speed of your boulder, as well as the damage by 1.5x normal. Current: [usr.BoulderExpert]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.BoulderMaster)
					usr<<"You already have Boulder Master so you cannot obtain this passive.";return
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<75*(usr.BoulderExpert+1))
								usr<<"You need [75*(usr.BoulderExpert+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.BoulderExpert++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		DangoMaster
			icon_state="BoulderMaster"
			var/maxprice=1
			var/cost=2
			Click()
				if(usr.BoulderMaster>1)
					usr<<"You cannot raise this any further."
					return
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/DoryoDango) in usr.LearnedJutsus))
					usr<<"You need to know Doryo Dango first!";return
				for(var/obj/SkillCards/DoryoDango/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr, "Upgrades size of boulder and damage multiples 1.75x normal. Current: [usr.BoulderMaster]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.BoulderExpert)
					usr<<"You already have Boulder Expert so you cannot obtain this passive.";return
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<75*(usr.BoulderMaster+1))
								usr<<"You need [75*(usr.BoulderMaster+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.BoulderMaster++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		DoryuudanMaster
			icon_state="DoryuudanMaster"
			var/maxprice=3
			var/cost=1
			Click()
				if(usr.DoryuudanMaster>=3)
					usr<<"You cannot raise this any further."
					return
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/Doryuudan) in usr.LearnedJutsus))
					usr<<"You need to know Doryuudan first!";return
				for(var/obj/SkillCards/Doryuudan/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr, "Increases number of earth spikes shot out by 2 when using Mud Dragon Jutsu. Current: [usr.DoryuudanMaster]/[maxprice]","[src.name]")
				if(usr.ElementalPoints>=cost&&!usr.clicking&&usr.DoryuudanMaster<3)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<80*(usr.DoryuudanMaster+1))
								usr<<"You need [80*(usr.DoryuudanMaster+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.DoryuudanMaster++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		DoryuuhekiExpert
			icon_state="DoryuuhekiExpert"
		SoftEarth
			icon_state="SoftEarth"
			var/maxprice=4
			var/cost=2
			Click()
				if(!(locate(/obj/SkillCards/DorukiGaeshi) in usr.LearnedJutsus))
					usr<<"You need to know Doruki Gaeshi first!";return
				if(usr.SoftEarth>4)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				if(usr.EarthChakra<10)
					usr<<"You need 10 / 20 Earth Mastery first!";return
				alert(usr, "[src] is a passive that raises the efficiency of your Earth Style jutsus when used on muddy turfs or other forms of soft earth. Current: [usr.SoftEarth]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<75*(usr.SoftEarth+1))
								usr<<"You need [75*(usr.SoftEarth+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.SoftEarth++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
		Call_of_the_Swamp
			icon_state="CalloftheSwamp"
			var/maxprice=4
			var/cost=1
			Click()
				if(usr.CalloftheSwamp>4)
					usr<<"You cannot raise this any further." ; return
				usr<<sound('SFX/click1.wav',0)
				if(!(locate(/obj/SkillCards/YomiNuma) in usr.LearnedJutsus))
					usr<<"You need to know Yomi Numa first!";return
				for(var/obj/SkillCards/YomiNuma/P in usr.LearnedJutsus)
					if(P:Copied==1)
						usr<<"You used Sharingan Copy to learn this Jutsu! You need to know how to preform it originally!"
						return
				alert(usr, "[src] is a passive that increases the range of your swamp by 2 tiles for each point. Current: [usr.CalloftheSwamp]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.ElementalPoints>=cost&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points? COST: [cost] Elemental Points per point.") in list ("No","Yes"))
						if("Yes")
							if(usr.DotonKnowledge<100*(usr.CalloftheSwamp+1))
								usr<<"You need [100*(usr.CalloftheSwamp+1)] Doton Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.CalloftheSwamp++;usr.ElementalPoints-=cost;usr.clicking=0
						else
							usr.clicking=0
							return
//ClanPassives
turf
	Skilltree/Passives/ClanPassives
		layer = MOB_LAYER+1000
		layer= 106
		icon='Icons/Jutsus/Skilltree.dmi'
		AkametsukiMastery
			name="Domínio do Akametsuki"
			icon_state="AkametsukiMastery"
			var/price="Aumenta à medida que o usuário permanece com o Akametsuki ativo."
			var/maxprice="Sem limite"
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				sd_Alert(usr, "[src] aumenta o domínio sobre Akametsuki. Necessário para alcançar mais formas e também diminui o uso de chakra. Como treinar-lo: [price] [usr.AkametsukiMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		ParticleMastery
			name="Domínio de Partícula"
			icon_state="ParticleMastery"
			var/price="Aumenta à medida que o usuário usa suas técnicas de partículas à base de chakra."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				sd_Alert(usr, "[src] permite que o usuário realize suas técnicas relacionadas ao clã. Como Treinar lo: [price] [usr.ParticleMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Distortion
			name="Distorção"
			icon_state="Distortion"
			var/price="Aumenta à medida que o usuário cria clones."
			var/maxprice="Sem Limite"
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				sd_Alert(usr, "[src] aumenta o domínio sobre os Clones de partículas. Como Treinar lo: [price] [usr.Distortion]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		ParticleUsage
			name="Uso de Partículas"
			icon_state="ParticleUsage"
			var/price="Aumenta à medida que o usuário executa partículas."
			var/maxprice=10
			Click()
				usr<<sound('click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				sd_Alert(usr, "Partículas normalmente exigem 90% chakra para eles para ser liberado de seu corpo, mas quando você ganhar o controle, você pode reduzir a quantidade máximo de chakra em 5% cada ponto. Como Treinar lo: [price] [usr.ParticleUsage]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

//
		BugManipulation
			name="Manipulação de Inseto"
			icon_state="BugManipulation"
			var/price="Naturalmente aumenta para um Aburame."
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				sd_Alert(usr, "[src] aumenta a quantidade de insetos que é feita pelo usuário a cada segundo. Como Treinar lo: [price] [usr.BugManipulation]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		BugMastery
			name="Domínio de Inseto"
			icon_state="BugMastery"
			var/price="Aumenta quanto mais você Chamar/Voltar seus insetos."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				sd_Alert(usr, "[src] permite que você obtenha novos Kikaichu Jutsu. Como Treinar lo: [price] [usr.BugMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		BugKeeper
			name="Deposito de insetos"
			icon_state="BugKeeper"
			var/price="Aumenta o mais que você usa e chamar/Voltar seus insetos depois que você já dominou o Domínio de Inseto."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] permite que você obtenha novo Kikaichu Jutsu. Como Treinar lo: [price] [usr.BugKeeper]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Feast
			name="Velocidade Kikaichu"
			icon_state="Feast"
			var/price="Aumenta mais a sua velocidade Kikaichu em alguém."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] permite que você obtenha novo Kikaichu Jutsu. Como Treinar lo: [price] [usr.Feast]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		BugCapacity
			name="Capacidade de Insetos"
			icon_state="BugCapacity"
			var/price="Naturalmente aumenta para um Aburame."
			var/maxprice=15
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta a quantidade máxima dos insetos que um Aburame pode conter. Como Treinar lo: [price] [usr.BugCapacity]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		KekkaiHealth
			name="Inseto Vida"
			icon_state="KekkaiHealth"
			var/price="Naturalmente aumenta para um Aburame."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta a saúde máximo de insetos em 25 por ponto. Como Treinar lo: [price] [usr.KekkaiHealth]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		KekkaiCap
			name="Inseto Cap"
			icon_state="KekkaiCap"
			var/price="Naturalmente aumenta para um Aburame."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] Aumenta o dano máximo que um inseto pode lidar por 50. Como Treinar lo: [price] [usr.KekkaiCap]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		KekkaiDrain
			name="Kekkai Drenagem"
			icon_state="KekkaiDrain"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.LearnJutsu("Kikkaichu Drain",15000,"KikkaichuDrain","Kikkaichu dreno é uma técnica que utiliza os insetos fêmeas e capacidade do Kikkaichu para drenar chakra, deixando-os escorrer o chakra de pessoas com os insetos do sexo feminino sobre eles.","Ninjutsu")
		KekkaiTracking
			name="Kekkai Rastreamento"
			icon_state="KekkaiTracking"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.LearnJutsu("Kikkaichu Tracking",10000,"KonchuuTracking","Kikaichu Rastreamento é uma técnica que utiliza insetos fêmeas de um Aburame, permitindo que o Aburame para rastrear essas fêmeas e encontrar a localização de um inimigo.","Ninjutsu")
///////////////////////////////////////////////Sarutobi Clan///////////////////////////////////////////////////////////////////
		WillOfFire
			name="Will Of Fire"
			icon_state="WillOfFire"
			var/price="Naturally increases for an Sarutobi"
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src]The will to never give up increases your will power.. How to Train it: [price] [usr.WillOfFire]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		JutsuMastery
			name="Mestre de Jutsu"
			icon_state="JutsuMastery"
			var/price="Aumenta quanto mais você usa elemental Ninjutsu"
			var/maxprice=25
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src]Para cada ponto seus ninjutsu dano aumenta para as técnicas elementares .. Como Treinar lo: [price] [usr.JutsuMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		HeartOfALeader
			name="Heart Of A Leader"
			icon_state="HeartOfALeader"
			var/price="Increases through combat"
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src]For every point your phy/cap/con raise by one point.. How to Train it: [price] [usr.HeartOfALeader]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		MonkeyStyle
			name="Monkey Stance"
			icon_state="MonkeyStyle"
			var/price="By attacking"
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src]Is a passive that unlocks your potential. How to Train it: [price] [usr.MonkeyStyle]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
////////////////////////Complete Sarutobi//////////////////////////////////////////////////////////////////////






/////////////////////////////////////
		ByakuganMastery
			name="Domínio do Byakugan"
			icon_state="ByakuganMastery"
			var/price="Ao ativar o Byakugan."
			var/maxprice="Sem Limite"
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] é um passiva que permite que o seu Byakugan melhora-lo, torná-lo melhor. Preciso para aprender novas fases de Byakugan. Como Treinar lo: [price] [usr.ByakuganMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		StanceMastery
			name="Domínio de Postura"
			icon_state="StanceMastery"
			var/price="Ao atacar!"
			var/maxprice=75
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] é um passiva que permite que você aprenda as diferenças em suas posições Hyuuga. Como Treinar lo: [price] [usr.StanceMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ChakraPercision
			name="Chakra Precisão"
			icon_state="ChakraPercision"
			var/price="Usando Jyuken taijutsu e aterrando golpes de sucesso, enquanto Byakugan está ativo!"
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "Quanto mais uma Hyuuga usa Jyuken o melhor que conseguir em bater tenketsu, eventualmente, aumentar a quantidade de chakra que é \
				tomada quando uma tenketsu é atingido. Para cada golpe que tira mais 10 chakra \
				danos causados por estática.. Como Treinar lo: [price] [usr.ChakraPercision]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		TenketsuAccuracy
			name="Precisão Tenketsu"
			icon_state="TenketsuAccuracy"
			var/price="Usando Jyuken taijutsu e aterrando golpes de sucesso, enquanto Byakugan está ativo!"
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "Quanto mais uma Hyuuga usa Jyuken o melhor que eles têm uma chance de acertar chakra no tenketsu \
				cada vez que Este passivo aumenta a precisão, enquanto Byakugan está ativo. \
				Aumenta a precisão de 4% cada nível. danos causados por estática .. .. Como Treinar lo: [price] [usr.TenketsuAccuracy]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SensoryRange
			name="Faixa sensorial"
			icon_state="SensoryRange"
			var/price="Esquivando-se com Byakuga ativo!"
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "Hyuuga tem uma maior chance de se esquivar de armas quando Byakugan está ativo, por causa da escala que Este passivo aumenta a chance de 5% em cada ponto. Também ajuda a proteger contra ataques Jyuken Estilo voltadas para você, Como Treinar lo : [price] [usr.SensoryRange]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Rejection
			name="Rejeição"
			icon_state="Rejection"
			var/price="Esquivando-se de taijutsu com sucesso!"
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "A chance para bloquear e empurrar para trás um adversário usando taijutsu a partir de qualquer local, menos por trás,  enquanto Byakugan esta ativo ganha 4% de chance de aumentar isto e mais 4% por ponto, Como Treinar lo : [price] [usr.Rejection]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		HakkeBaindo
			name="Hakke Baindo"
			icon_state="HakkeBaindo"
		ChakraFilm
			name="Chakra Film"
			icon_state="ChakraFilm"
		SuperiorityComplex
			name="Superiority Complex"
			icon_state="SuperiorityComplex"
		StrivingforSuccess
			name="Striving For Success"
			icon_state="StrivingForSuccess"
/////////////////////////////////////
		Uchiha
			name="Mestre Uchiha"
			icon_state="Uchiha"
			var/price="Naturalmente aumenta para um Uchiha!"
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] é um passivo que depois de maximizar você é capaz de ser um Uchiha completo. Todos jutsus estilo Uchiha são reforçados.. Como Treinar lo: [price] [usr.UchihaMastery]/[maxprice] Note:: Activation Type Passive","[src.name]")//,,,,0,"400x150",,style)
		LoveAndHate
			name="Amor e ódio"
			icon_state="UchihaPast"
			var/price="Saiba mais sobre o passado horrível do seu Clan"
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] é um passivo para lembrar Uchihas do segundo Massacre Uchiha, e dar a atual geração de Uchihas esperança para o futuro..Como Treinar lo: [price] [usr.LoveAndHate]/[maxprice]","[src.name]")
		//	name="Uchiha Mastery"
		ArgonReincarnate
			name="Reencarnação de Massacre"
			icon_state="ReincarnationArgon"
			var/price="Repetir o passado de seu clan"
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] é um passivo recebido por Uchihas que não se importam com os outros membros de seu clã, mas sim apenas consigo mesmo.. provam isso repetindo os atos malignos do passado. Como Treinar lo: [price] [usr.ArgonReincarnate]/[maxprice]","[src.name]")
		SharinganMastery
			name="Domínio do Sharingan"
			icon_state="Sharingan Mastery"
			var/price="Naturalmente aumenta com o tempo que o Sharingan estiver ativo."
			var/maxprice="Sem Limite"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] é um passiva que aumenta a capacidade do Sharinga, Aumenta seus reflexos naturais com cada nova etapa de Sharingan enquanto ele estiver ativo, Como Treinar lo: [price] [usr.SharinganMastery]/[maxprice]","[src.name]")
		SharinganOne
			name="Sharingan Ativo"
			icon_state="Sharingan1"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery>0)
					alert(usr, "Seu Sharingan está ativo. Ele tem apenas um tomoe, mas você está bem em seu caminho para se tornar um poderoso Uchiha.","[src.name]")
				else
					alert(usr,"Sharingan é o orgulho do clã Uchiha que Um dia ele vai ativar em momentos de estresse ou necessidade que Até então você só pode esperar.","[src.name]")
		SharinganOneTwo
			name="Sharingan adeptado"
			icon_state="Sharingan2"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery>=45)
					alert(usr, "Seu Sharingan está desenvolvendo bem, e agora contém dois tomoe. Seus olhos são poderosos é agora capaz de ler sinais da mão, mas ainda há espaço para crescer.","[src.name]")
				else
					alert(usr,"Sharingan desenvolve em fases, e com cada etapa que concede é hospedeiras mais e mais fortes habilidades e melhorias. Use-o mais para desenvolvê-lo.","[src.name]")
		SharinganOneTwoThree
			name="Sharingan Mature"
			icon_state="Sharingan3"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery>=91)
					alert(usr, "Seu Sharingan atingiu a maturidade. Você agora é um Uchiha de pleno direito, mas estão lá ainda maiores alturas para chegar?","[src.name]")
				else
					alert(usr,"Sharingans que atingem a maturidade de três tomoe têm a habilidade de lançar poderoso genjutsu, ver através de e contra jutsus, e até mesmo copiá-los para um ponto.","[src.name]")
		SharCopy
			name="Sharingan Copiador"
			icon_state="SharCopy"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery<91)
					usr<<"Você precisa de mais Domínio de Sharingan.";return
				usr.LearnJutsu("Sharingan Copy",35000,"SharinganCopy","Sharingan Copy is one of the Sharingan's really beautiful natures, allowing you to copy a technique and use it fully until next relog.","Ninjutsu")
		GenjutsuCounter
			name="Demonic Illusion: Mirror Heaven and Earth Change"
			icon_state="GenjutsuCounter"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery<91)
					usr<<"Você precisa de mais Domínio de Sharingan.";return
				if(usr.GenjutsuKnowledge<100)
					usr<<"You need more Genjutsu Knowledge.";return
				usr.LearnJutsu("Demonic Illusion: Mirror Heaven and Earth Change",35000,"GenjutsuCounter","Demonic Illusion: Mirror Heaven and Earth Change is a spectacular Sharingan ability that literally counter-acts an enemy's Genjutsu.","Genjutsu")
		Kasegui
			name="Demonic Illusion: Shackling Stakes"
			icon_state="Kasegui"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery<91)
					usr<<"Você precisa de mais Domínio de Sharingan.";return
				usr.LearnJutsu("Demonic Illusion: Shackling Stakes",35000,"Kasegui","Demonic Illusion: Shackling Stakes is one of Sharingan's principle Genjutsu techniques, allowing you to bind someone within shakles merely by looking into their eyes.","Genjutsu")
		Sleep
			name="Demonic Illusion: Hypnosis"
			icon_state="Sleep"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SharinganMastery<91)
					usr<<"You need more Sharingan Mastery.";return
				usr.LearnJutsu("Demonic Illusion: Hypnosis",35000,"Konsui","Demonic Illusion: Hypnosis is a interesting technique of the Sharingan, allowing you to cause someone to fall asleep simply by looking them in the eye and rotating your eyes, causing a hypnosis-like function.","Genjutsu")
		Haste
			name="Haste"
			icon_state="Haste"
			var/price="Tenha o primeiro a passive Mestre Uchiha cheia."
			var/maxprice2=0
			var/maxprice=1
			Click()
				if(usr.UchihaMastery==100)
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "O Ninja Uchiha é conhecidos por seus movimentos rápidos e assassinatos de sucesso. Isso permite que o usuário mova com Shushins de alta velocidade, sem qualquer atraso. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")
		GoukakyuuMastery
			name="Goukakyuu Domínio"
			icon_state="GoukakyuuMastery"
			var/price="Tenha o primeiro a passive Mestre Uchiha cheia."
			var/maxprice2=0
			var/maxprice=1
			Click()
				if(usr.UchihaMastery==100)
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "Um ninja Uchiha é finalmente considerado um ninja quando eles realizam com sucesso o Jutsu Bola de fogo. Essencialmente, suas chamas são originais a paixão do Uchiha permanecerá sempre e queimar mais quente do que os outros. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		DarkFlames
			name="Chamas Negras"
			icon_state="DarkFlames"
			var/price="Requisitos ocultos."
			var/maxprice2=0
			var/maxprice=1
			Click()
				//if(usr.UchihaMastery==100)
				//	maxprice2=1
				maxprice2=0
				if(usr.key=="Lui12"||usr.key=="Ruusaku")
					maxprice2=1
					usr.DarkFlames=1
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "O Uchiha Ninja são disse ter um chakra escuro, tão escuro que eles podem influenciar até mesmo demônios fortes como o Kyuubi. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)


/////////////////////////////////////
		BoneMastery
			name="Domínio de Ossos"
			icon_state="BoneMastery"
			var/price="Naturalmente aumenta para um Kaguya à medida que crescem."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] permite ao usuário aprender técnicas de osso novas. Como Treinar lo: [price] [usr.BoneMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		DanceMastery
			name="Mestre da Dança"
			icon_state="DanceMastery"
			var/price="Naturalmente aumenta para um Kaguya enquanto executam suas danças."
			var/maxprice=30
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] permite ao usuário aprender técnicas de osso novas. Como Treinar lo: [price] [usr.DanceMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		BoneArmor
			name="Armadura de Ossos"
			icon_state="BoneHarden"
			var/price="Tem uma chance de aumentar enquanto você usa Armadura de Ossos."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] Permite ao usuário baixar o dreno de chakra do Endurecimento de Ossos. Como Treinar lo: [price] [usr.BoneArmor]/[maxprice]","[src.name]")
		SawaMaster
			name="Senhor do Sawarabi"
			icon_state="SawaMaster"
			var/price="Tem uma chance de aumentar quando você usa Sawarabi."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] Permite que o usuário para suportar o Dreno de Chakra que o Sawarabi coloca em seu corpo, e estende o alcance que o Sawarabi é capaz de ir. Como Treinar lo: [price] [usr.SawaMaster]/[maxprice]","[src.name]")
		Underlayer
			name="Subcamada"
			icon_state="Underlayer"
			var/price="Começa no Maximo"
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr,"[src] Você tem um apertado massa óssea de subcamada debaixo de sua pele. Devido a isso você é ineficaz a acertos críticos. Como Treinar lo: [price] [usr.Underlayer]/[maxprice]","[src.name]")
		Terpsichorean
			name="Terpsichorean"
			icon_state="Terpsichorean"
/////////////////////////////////////
		Training
			name="Treinamento"
			icon_state="Training"
			var/price="Através de treinamento e usando o seu cão."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta o domínio sobre Treinamento Inuzuka e proficiênciente em aprender técnicas. Como Treinar lo: [price] [usr.Training]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Obediance
			name="Obediência"
			icon_state="Obediance"
			var/price="Você recebera quando tiver 20 de Treinamento."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] Ensinar o seu cão a obediêncer. Como Treinar lo: [price] [usr.Obediance]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SpeedTraining
			name="Treino de Velocidade"
			icon_state="SpeedTraining"
			var/price="Ao ordenar o seu cão se mover."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta a velocidade de seus cães! Como Treinar lo: [price] [usr.SpeedTraining]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Aggression
			name="Agressão"
			icon_state="Aggression"
			var/price="Ao ordenar o seu cão atacar alguem."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] Aumenta a taxa de acertos críticos do seu cão. Como Treinar lo: [price] [usr.Aggression]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Canine
			name="Canino"
			icon_state="Canine"
			var/price="Apenas por ter seu cão e ficar perto dele."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta as abilidades caninas do usuário! Como Treinar lo: [price] [usr.Canine]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Scent
			name="Scent"
			icon_state="Scent"
			Click()
				usr<<sound('SFX/click1.wav',0)
		NinjaHound
			name="Ninja Hound"
			icon_state="NinjaHound"
			Click()
				usr<<sound('SFX/click1.wav',0)
		Friendship
			name="Friendship"
			icon_state="Friendship"

		LupineSpeed
			name="Velocidade Tremenda"
			icon_state="LupineSpeed"
			var/price="Quando aprender o Shikyaku."
			var/maxprice=1
			var/maxprice2=0
			Click()
				var/caught=0
				for(var/obj/SkillCards/Shikyaku/A in usr.LearnedJutsus)
					caught=1
				if(usr.Clan=="Inuzuka"&&caught)
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "Permite Inuzuka correr um 1/2 mais rápido que um Ninja normal, enquanto no modo besta. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SuperHearing
			name="Super Audição"
			icon_state="SuperHearing"
			var/price="Estando no Modo Besta."
			var/maxprice=6
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "Permite ouvir pessoas 4 quadrados fora sua tela enquanto no modo besta. Aumenta um quadrado por ponto. Como Treinar lo: [price] [usr.SuperHearing]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
/////////////////////////////////
		ShadowManipulation
			name="Manipulação da sombra"
			icon_state="ShadowManipulation"
			var/price="Apenas usando sua sombra."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta a competência da sombra do usuário! Como Treinar lo: [price] [usr.ShadowManipulation]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ShadowReach
			name="Alcance da Sombra"
			icon_state="ShadowReach"
			var/price="Apenas movendo sua sombra."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta o alcance de tecnicas da Sombra! Como Treinar lo: [price] [usr.ShadowReach]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ShadowStrength
			name="Força da Sombra"
			icon_state="ShadowStrength"
			var/price="Ao capturar com sua sombra e outras técnicas da Sombra."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta a força do usuário de suas técnicas da Sombra! Como Treinar lo: [price] [usr.ShadowStrength]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ShadowMastery
			name="Domínio da Sombra"
			icon_state="ShadowMastery"
			var/price="Aumento naturalmente para um Nara."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
				//var/style = "<style>BODY {margin:0;font:arial;background:black;\
				//	color:white;}</style>"
				alert(usr, "[src] Permite ao usuário o conhecimento sobre suas sombras e usá-las corretamente. Como Treinar lo: [price] [usr.ShadowMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ShadowLimit
			name="Limite de sombra"
			icon_state="ShadowLimit"
			var/price="Aumenta à medida que você usa o Shibari."
			var/maxprice=15
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] diminui a quantidade de chakra usado para mover uma sombra por porcentagem. Como Treinar lo: [price] [usr.ShadowLimit]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ShadowExtension
			name="Extensão da sombra"
			icon_state="ShadowExtension"
			var/price="Uma vez que o Limite de sombra é maximizada, ele permite aumentar sua escala."
			var/maxprice2=0
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.ShadowLimit>=10)
					maxprice2=1
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] diminui a quantidade de chakra usado para mover uma sombra por uma porcentagem. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ShadowKnowledge
			name="Shadow Knowledge"
			icon_state="ShadowKnowledge"
		ShadowCreativity
			name="Shadow Creativity"
			icon_state="ShadowCreativity"
		ShadowRelease
			name="Shadow Release"
			icon_state="ShadowRelease"
/////////////////////////////
		BloodFeast
			name="Festa de Sangue "
			icon_state="BloodFeast"
			var/price="Aumenta ao Sugar sangue dos Outros"
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] aumenta a quantidade de EXP adquirida a partir de alguém que você beber o sangue. Também diminui a quantidade de sede sobre os Jutsus de Selos do Ketsueki. Como Treinar lo: [price] [usr.BloodFeast]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ThirstHold
			name="Espera de Sede"
			icon_state="ThirstHold"
			var/price="Aumenta naturalmente ao longo do tempo."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] aumenta o controle do usuário, tornando-os os controladores sobre sua existencia vampírica. Como Treinar lo: [price] [usr.ThirstHold]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		FeralRage
			name="Fúria Feroz"
			icon_state="FeralRage"
			var/price="Eleva quando um Ninja Ketsueki vê sangue."
			var/maxprice=25
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] faz com que cada vez que o usuário está em vista de sangue tornam-se muito mais forte. Como Treinar lo: [price] [usr.FeralRage]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		BloodManipulation
			name="Manipulação de sangue"
			icon_state="BloodManipulation"
			var/price="Aumenta naturalmente para uma Ketsueki Ninja. Também aumenta quanto mais você usar seus jutsu."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite manipular as células de sangue para fazer suas técnicas. Como Treinar lo: [price] [usr.BloodManipulation]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SealMastery
			name="Domínio do Selo"
			icon_state="SealMastery"
			var/price="Aumenta quanto mais você realizar Selos do Ketsueki!"
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite que você aprenda técnicas de Selagem mais complexas baseados de fora de sua herança Ketsueki. Como Treinar lo: [price] [usr.SealMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		BloodClot
			name="Blood Clot"
			icon_state="BloodClot"
//////////////////////
		SpiderMastery
			name="Domínio da Aranha"
			icon_state="SpiderMastery"
			var/price="Aumenta quanto mais você usar jutsu Nenkin ou relacionados a isso."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Permite que você aprenda técnicas de aranha e relacionados, e verdadeiramente dominar suas habilidades. Como Treinar lo: [price] [usr.SpiderMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		WebMastery
			name="Domínio de Teia"
			icon_state="WebMastery"
			var/price="Aumenta naturalmente para uma Kumojin Ninja. aumenta Também quanto mais você usar seus jutsu de Teia."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite que você aprenda técnicas relacionadas com a teia, e verdadeiramente dominar suas habilidades. Como Treinar lo: [price] [usr.WebMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		WebStrength
			name="Força da Teia"
			icon_state="WebMastery"
			var/price="Aumenta quanto mais você usa seu jutsu baseado em teia."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Fortalece a durabilidade do seu teias, tornando mais difícil de sair de tal. Como Treinar lo: [price] [usr.WebStrength]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		BodyofanArachnid
			name="Corpo de um aracnídeo"
			icon_state="SpiderMastery"
			var/price="Requerimento Oculto."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Ao longo do tempo Kumojins crescer braços múltiplos que irão ajudá-los em combate. Como Treinar lo: [price] [usr.BodyofanArachnid]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		GoldnowDiamond
			name="O ouro Diamante."
			icon_state="GoldnowDiamond"
			var/price="Aumenta conforme você usa sua armadura Kumojin."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Ao longo do tempo Kumojins crescer braços múltiplos que irão ajudá-los em combate. Como Treinar lo: [price] [usr.GoldnowDiamond]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)


		GoldenSpike
			name="Espinhos Dourados"
			icon_state="GoldenSpike"
			var/price="Aumenta à medida que executa ataques relacionados a Kumonenkin."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] aumenta o dano de todas as técnicas relacionados a Espinhos Dourados. Como Treinar lo: [price] [usr.GoldenSpike]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
///////////////////////
		SnowFall
			name="Queda de neve"
			icon_state="SnowFall"
			var/price="Aumenta naturalmente, também pelo uso de técnicas relacionados ao clã."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite que você aprender técnicas de neve Hyouton. Como Treinar lo: [price] [usr.SnowFall]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		IceRush
			name="Ponta de gelo"
			icon_state="IceRush"
			var/price="Aumenta naturalmente, também pelo uso de técnicas relacionados ao clã."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite a você aprender técnicas de gelo Hyouton. Como Treinar lo: [price] [usr.IceRush]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		IceChakra
			name="Domínio do Gelo"
			icon_state="IceChakra"
			var/price="Uso de técnicas relacionados ao clã."
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] é um passivo que lhe permite aumentar o seu dano feito por jutsus de gelo. Como Treinar lo: [price] [usr.IceChakra]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

//////////////////////
		SandMastery
			name="Domínio da Areia"
			icon_state="SandMastery"
			var/price="Aumenta à medida que executa técnicas relacionado a areia."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite a você aprender técnicas relacionadas areia e dominar a sua areia. Como Treinar lo: [price] [usr.SandMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		AutoProtection
			name="Proteção Automatica"
			icon_state="AutoProtection"
			var/price="Aumenta quando você defende com sucesso usando sua Areia."
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O [src] passivo é um passivo que faz com que a areia o proteja de ataques, como ataque basico \
							completamente, desde que o usuário estiver com a areia defendendo. Aumentar este, aumenta sua chance de se defender contra \
							para cada vez que essa passive é aumenta a chance sobe em 5%. Ele usa-se tambem menos chakra cada vez que defende-o. Como treinar-lo:: [price] [usr.AutoProtection]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Shukaku
			name="Shukaku"
			icon_state="Shukaku"
			var/price="Requerimento Oculto."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O [src] era uma figura altamente respeitada do Clan Sabaku, dando a pessoa original do clã, \
							Gaara, a capacidade de controlar areia. Porque é considerado como um deus para nos dias de hoje aos membros do clã Sabaku, \
							o Shukaku desempenha uma grande influência sobre suas técnicas. Aprender esta permite que você aprenda técnicas poderosas \
							com base no Shukaku. Como Treinar lo: [price] [usr.Shukaku]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SandCapacity
			name="Capacidade de Areia"
			icon_state="SandMastery"
			var/price="Aumenta à medida que executa técnicas relacionado a areia."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Permite transportar mais areia dentro de sua cabaça. Como Treinar lo: [price] [usr.SandCapacity]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SandPackage
			name="Capacidade de Transporte"
			icon_state="SandMastery"
			var/price="Aumenta à medida que executa técnicas relacionado a areia."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite transportar mais areia. Como Treinar lo: [price] [usr.SandPackage]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Erosion
			name="Erosão"
			icon_state="SandMastery"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SandMastery<50)
					usr<<"You need more Sand Mastery.";return
				usr.LearnJutsu("Erosion",35000,"SandErosion","Erosion allows you to convert your doton into sand for your sand jutsu.","Ninjutsu")

//////////////////////
		GrassMastery
			name="Domínio da Grama"
			icon_state="GrassMastery"
			var/price="Aumenta à medida que executa técnicas relacionado a Grama."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Permite o conhecimento ao usuário sobre o controle da vegetação para suas ordens, e usar suas técnicas. Como Treinar lo: [price] [usr.GrassMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Senju
			name="Clan Senju"
			icon_state="Senju"
			var/price="A primeira estatística para ser realmente capaz de aprender a técnica de madeira aumenta em um ponto aleatório no tempo. Depois disso, ele aumenta à medida que executa técnicas relacionadas Madeira."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O Kusakin Kekkai Genkai é dito ser derivado a partir de um Experimento com Mokuton \
							Não se sabe o  seu nome, mas a capacidade de criar mokuton era admiravel \
							ainda retinha controle da natureza. Este passivo permite que você aprenda técnicas estilo Mokuton. Como Treinar lo: [price] [usr.Senju]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		WoodChakra
			name="Domínio da Madeira"
			icon_state="WoodChakra"
			var/price="Usando técnicas à baseadas em madeira.."
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] é um passivo que lhe permite aumentar o seu dano feito por jutsus de madeira. Como Treinar lo: [price] [usr.WoodChakra]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SturdyComposition
			name="Composição resistente"
			icon_state="WoodChakra"
			var/price="Usando a sua madeira e técnicas de grama."
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] é um passivo que lhe permite moldar seu Doton e Suiton em formas muito mais fortes que você é capaz de utilizar, tornando suas criações muito mais durável, mais forte e até mesmo possível atingir maiores danos. Como Treinar lo: [price] [usr.SturdyComposition]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		NatureBond
			name="Natureza"
			icon_state="lit"
			var/price="Ganha Automaticamente quando você é um Kusakin"
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] é um passivo que mostra seus laços com a natureza. Ele permite que a compreensão mais rápida para aprender Jutsus de Estilo  madeira e grama usando esses tipos relacionados, acelerando a taxa, e você começa Conhecimento sobre dois elementos Doton e Suiton. Como Treinar lo: [price] 1/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

//////////////////////
		AkimichiSpirit
			name="Espírito Akimichi"
			icon_state="AkimichiSpirit"
			var/price="Aumenta conforme você permaneça perto do seu clã."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Um Akimichi deve ter orgulho sobre quem eles são. Como Treinar lo: [price][usr.AkimichiSpirit]/[maxprice] Nota: A activação da passiva","[src.name]")//,,,,0,"400x150",,style)
		Blubber
			name="Gordura"
			icon_state="Blubber"
			var/price="Ativa conforme o Espírito Akimichi estiver maximo."
			var/maxprice2=0
			var/maxprice=1
			Click()
				if(usr.AkimichiSpirit==50)
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O clã Akimichi precisa manter suas calorias alta, por isso, enquanto eles têm 1000 calorias torna-se impossível para conseguir um acerto crítico em deles .Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Ingestion
			name="Ingestão"
			icon_state="Ingestion"
			var/price="Ativa conforme o Espírito Akimichi estiver maximo."
			var/maxprice2=0
			var/maxprice=1
			Click()
				if(usr.AkimichiSpirit==50)
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Sendo realmente bons comedores, contanto que continue assim eles não terão que se preocupar em passar mal de mais de tanto comer e apenas continuar a comer com conteúdo. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Tank
			name="Tanque"
			icon_state="Tank"
			var/price="Ativa conforme o Espírito Akimichi estiver maximo."
			var/maxprice2=0
			var/maxprice=1
			Click()
				if(usr.AkimichiSpirit==50)
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Um Akimchi é mais assustador quando andando! Ao caminhar seus danos de taijutsu tornam-se dramaticamente diferente. Como Treinar lo: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)




		SizeMastery
			name="Domínio de Tamanho"
			icon_state="SizeMastery"
			var/price="Aumenta à medida que você usa Baika No Jutsu."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] permite que o usuário mais conhecimento sobre o aumento de seu tamanho em uso de suas calorias. Como Treinar lo: [price] [usr.SizeMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		SizeCap
			name="Capacidade de Tamanho"
			icon_state="SizeCap"
			var/price="Aumenta à medida que você usa Baika No Jutsu."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] aumenta o limite de Baika no Jutsu técnicas relacionadas, permitindo variações mais fortes. Como Treinar lo: [price] [usr.SizeCap]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)


////////////////////
		Teamwork
			name="Trabalho em equipe"
			icon_state="Teamwork"
			var/price="Vai aumentando conforme você esta perto de pessoas do seu clan."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Você ganha um boost conforme você está perto de pessoas do seu clan,o clan yotsuki. Como treinar isso: [price] [usr.Teamwork]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Buffet
			name="Bufê"
			icon_state="Buffet"
			var/price="Quanto mais voce usa uma espada."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] é uma passiva muito boa,quanto mais dano você receber de atques corpo a corpo, sua katana vai fazer mais dano ate o proximo corte. Quando você finalmente der esse corte, O boost vai acabar e terá que repetir o processo. Como treinar : [price] [usr.Buffet]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		AdvancedWielding
			name="Empunhamento avançado"
			icon_state="Kenjutsu"
			var/price="É maximizado quando você maximiza Bufê."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Com eficiencia o suficiente com a espada, voce aprendeu a usar uma espada de duas maos.só com uma mao, permitindo inumeras possibilidades na arte do kenjutsu. Como treinar: [price] [usr.AdvancedWielding]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		OneWiththeSword
			name="Usuario natural de nascimento"
			icon_state="Buffet"
			var/price="Nasce com isto maximizado."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Sendo do seu clan, você aprendeu a usar espada mais rapido e com mais eficiencia, sendo capaz de maximizar passivas de kenjutsu muito mais rápido que pessoas normais. How to Train it: [price] [usr.OnewiththeSword]/[maxprice]","[src.name]")


		SlashandBeyond
			name="Corte e além"
			icon_state="Sharper"
			var/price="Nasce com isso maximizado."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Sendo orgulho de ser um Yotsuki, você é capaz de aprender cada pequeno detalhe de como ferir com um tipo de espada, te possibilitando ir mais alem do que uma pessoa normal na arte de usar uma espada. Como treinar : [price] 1/[maxprice]","[src.name]")

		LightningArmorYotsuki
			name="Armadura instintiva"
			icon_state="Static"
			var/price="Nasce com isso maximizado."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Seu clan é naturalmente melhor com o elemento Raiton; especialmente o jutsu Rai no Yoroi, possibilitando um gasto de chakra muito pequeno no uso de Raiton. Como treinar: [price] 1/[maxprice]","[src.name]")

		LightningChakraYotsuki
			name="Elemento instintivo"
			icon_state="Electromagnetivity"
			var/price="Nasce com isso maximizado."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] Por ser um yotsuki, o uso de chakra na hora de criar tecnicasa Raiton é muito mais natural para você, reduzindo o custo de chakra para jutsus Raiton. Como treinar : [price] 1/[maxprice]","[src.name]")
//////////////////Hoshigaki
		samehadeUnleash
			name = "Desbloquear a Samehada"
			icon_state = "SamehadePassive"
			var/price =  "Usando o Desbloquear a Samehada, aumenta rapido estando no modo Desbloqueado. Niveis altos aumentam o numero de jutsus usaveis."
			var/maxprice = 4
			Click()
				if(usr.Clan == "Hoshigaki")
					alert(usr, "Deixa o Hoshigaki converter chakra em jutsus especiais.\
					How to train : [price]  [usr.samehadeUnleash] / [maxprice]")

		samehadeChakaraDrain
			name = "Drenagem de chakra da Samehada"
			icon_state = "SamehadePassive"
			var/price =  "Usando Drenagem de chakra da Samehada, afeta a quantidade de chakra roubados."
			var/maxprice = 3
			Click()
				if(usr.Clan == "Hoshigaki")
					alert(usr, "Deixa o hoshigaki drenar mais chakra usando a Samehada.\
					How to train : [price]  [usr.samehadeChakaraDrain] / [maxprice]")
		samehadeStrength
			name = "Força jogando a Samehada"
			icon_state = "SamehadePassive"
			var/price =  "Usando a bainha da Samehada, afeta o dano da bainha e o dreno de chakra."
			var/maxprice = 3
			Click()
				if(usr.Clan == "Hoshigaki")
					alert(usr, "Deixa o ataque de bainha do Hoshigaki hitar mais, e dar mais dano.\
					How to train : [price]  [usr.samehadeStrength] / [maxprice]")
		samehadeThrowingStrength
			name = "Força da Samehada"
			icon_state = "SamehadePassive"
			var/price =  "Usando o Jogar a Samehada, afeta o dano do arremesso e o alcance do ataque."
			var/maxprice = 3
			Click()
				if(usr.Clan == "Hoshigaki")
					alert(usr, "Deixa a samehada jogar sua espada por mais dano.\
					How to train : [price]  [usr.samehadeThrowingStrength] / [maxprice]")

		/////////////////
		SharpSkin
			name="Pele Afiada"
			icon_state="SharpSkin"
			var/price="É maximizada automaticamente quando você é um Hoshigaki."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Hoshigaki")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Qualquer ataque corporal feito em um hoshigaki em um\
				combate mano-a-mano vai resultar no alvo levar\
				 dano(Como socar ou chutar.) How to Train it: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		WaterHealing
			name="Cura Aquatica"
			icon_state="WaterHealing"
			var/price="Maximizada automaticamente quando você é um Hoshigaki."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Hoshigaki")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "Defendendo na agua sua vitalidade vai regenerar 10 por segundo. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		HydroBuff
			name="Hydro Buff"
			icon_state="HydroBuff"
			var/price="Maximizado automaticamente quando você é um hoshigaki."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Hoshigaki")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "Enquanto luta na agua, seu poder aumenta devagar. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		SamehadeAbsorbtion
			name="Absorção da Samehada"
			icon_state="SamehadeAbsorbtion"
			var/price="Aumenta conforme você usa a Samehada."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "A samehada tem a habilidade de absorver o chakra máximo de um oponente\
				 a cada hit. O alcance aumenta por cada ponto. \
			       Como Treinar: [price] [usr.SamehadeAbsorbtion]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		SamehadeReturn
			name="Retorno da Samehada"
			icon_state="SamehadeReturn"
			Click()
				usr<<sound('SFX/click1.wav',0)
				usr.LearnJutsu("Samehade Return",15000,"SamehadeReturn","Uma técnica que deixa o Hoshigaki retornar a samehada para sua mão \
				. A espada sendo muito leal, a qualquer momento se eles quizerem que volte para sua mao esquerda ou direita ele\
				 pode usar essa técnica.","Ninjutsu")


		QuickSilver
			name="Silver Rápido"
			icon_state="QuickSilver"
			var/price="Automaticamente quando você é um Hoshigaki."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Hoshigaki")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "enquanto você estiver na água, você vai correr não importa oque. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Dive
			name="Mergulho"
			icon_state="Dive"

		SamehadePartnership
			name="Parceiro Samehada"
			icon_state="SamehadePartnership"

		SamehadeRepel
			name="Repelir com a Samehada"
			icon_state="SamehadeRepel"

		AttackFirstTalkLater
			name="Ataque primeiro fale depois"
			icon_state="AttackFirstTalkLater"
			var/price="Atacando rápido depois que mira."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "Quando atacar alguem IMEDIATAMENTE depois de mirar \
				depois você ganha um boost parcial que aumenta a cada dano \
			    feito com a samehada com +10 de ataque estático.. Como treinar : [price] [usr.AttackFirstTalkLater]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)


/////////////////////////////
		WeaponMaster
			name="Mestre de armas"
			icon_state="WeaponMaster"
			var/price="Aumenta conforme você vai usando armas."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Ninjas do clã Fuuma sao mais eficientes com armas e podem se adaptar mais rápido com armas\
				 sendo capazes de usar todo seu potencial, adicionando mais 1% de dano a cada arma que usar. Como treinar : [price] [usr.WeaponMaster]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		ChakraControl
			name="Controle de Chakra"
			icon_state="ChakraControl"
			var/price="Aumenta o quanto mais você acerta na Intensidade de Chakra."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Ninjas do clan fuuma sao mais eficientes com seu chakra\
				 sendo capazes de ter um nivel alto no controle de seus chakras. Como treinar : [price] [usr.ChakraControl]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Genius
			name="Genio"
			icon_state="Genius"
			var/price="Automaticamente quando você é um Fuuma."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Fuuma")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Sendo grandes genios, eles tem a força de um Genio, Aumentando o stat deles em +5 em um stat. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Stealth
			name="Sobrevivencia"
			icon_state="Stealth"
			var/price="Automaticamente quando você é um Fuuma."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Fuuma")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Ninjas do clan Fuuma sao um estorvo para um ninja de verdade. Eles podem ficar invisiveis se ficarem parados por 30 segundos. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Survivability
			name="Sobrevivencia"
			icon_state="Survivability"
			var/price="Aumenta quanto mais você for posto em situaçoes de morte."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O clan fuuma tem uma trait muito sortuda que os ajuda a sobreviver. \
				Por causa disso,quanto mais forçado em uma situaçao de morte você tem chances de sobreviver. \
				Como, quando estiver falhando em levantar você vai levantar mesmo nao estando na hora. Aumenta em 3%. Como treinar : [price] [usr.Survivability]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Awareness
			name="Consciencia"
			icon_state="Awareness"
			var/price="Aumenta quanto mais você é posto em técnicas Genjutsu."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O clan Fuuma é bem sucedido em qualquer tipo de jutsu, mais seu excelente controle de chakra faz seu chakra ser dificil de manipular por um inimigo usando Genjutsu.\
				[src] Aumenta as chances de resistir aos efeitos de Genjutsus. Aumenta em 5% a cada ponto. Como treinar : [price][usr.Awareness]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		JutsuIdealist
			name="Idealista de jutsu"
			icon_state="JutsuIdealist"
			var/price="Automaticamente quando você é um Fuuma."
			var/maxprice=1
			var/maxprice2=1
			Click()
				if(usr.Clan=="Fuuma")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Pessoas do clan Fuuma sao genios renomados e podem aprender jutsu em uma velocidade maior que outros ninjas, ganhando um boost parcial\
				 em aprender tecnicas. Isto os possibilita a aprender tecnicas em uma velocidade maior, Dando\
				  um boost moderado em EXP. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Reaction
			name="Reaçao"
			icon_state="Reaction"
			var/price="Requerimento Secreto"
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Pessoas do clan Fuuma sao usuarios de taijutsu excepcionais. Eles tem uma chance maior \
				de desviar armas estando ou nao de frente para o inimigo. Aumenta 5% por cada ponto. Como treinar: [price] [usr.Reaction]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		RapidUse
			name="Uso Rapido"
			icon_state="RapidUse"
			var/price="Automaticamente quando você é um Fuuma."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Fuuma")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Isso vai possibilitar o cooldown de Jutsus Nao-Elementais  de ser mais rapido dividindo o tempo por 2. Como treinar : [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		Versatile
			name="Versátil"
			icon_state="Versatile"
			var/price="Automaticamente quando você é um Fuuma."
			var/maxprice=1
			var/maxprice2=0
			Click()
				if(usr.Clan=="Fuuma")
					maxprice2=1
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Pessoas do clan Fuuma sao esforçados. Eles conseguem se livrar de efeitos de status mais rapido do que ninjas normais. Como treinar: [price] [maxprice2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
/////////////////////////////
//Iwazuka
/////////////////////////////
		ExplosiveMastery
			name="Masterizaçao de Explosões"
			icon_state="ExplosiveMastery"
			var/price="Aumenta quanto mais você usa Katsu."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Masterizaçao de Explosivos é uma passiva que o deixa aprender técnicas mais variadas da arte da explosao. Como treinar : [price] [usr.ExplosiveMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		ClayMastery
			name="Masterizaçao de Arte"
			icon_state="ClayMastery"
			var/price="Aumenta quanto mais você faz lindas criaçoes."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Masterizaçao de Arte é uma passiva que te deixa aprender mais jutsus baseados em argila. Como treinar: [price] [usr.ClayMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		ClayDrain
			name="Dreno da Argila"
			icon_state="Versatile"
			var/price="Aumenta quanto mais você usa sua argila."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Dreno de Argila é uma passiva que te permite diminuir o numero de argila requerida para usar tecnicas avançadas baseadas em argila . Como treinar: [price] [usr.ClayDrain]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

/////////////////////////////
//Satou
/////////////////////////////
		Drunk
			name="Bebado"
			icon_state="Reaction"
			var/price="Bebendo"
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "O ninja do clan Satou é muito resistente ao sake, por conta disto quando eles bebem it eles caem no efeito de confusao mais eles tem uma chance de converter danos feitos à vitalidade em dano na stamina. Essa porcentagem aumenta sua confusao. Como treinar: [price] [usr.Drunk]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Suiken
			name="Suiken"
			icon_state="Awareness"
			var/price="Bebendo."
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Quando bebe Sake, A menor quantidade pode te transformar em um monstro de Taijutsu. Por conta do estilo punho bebado conhecido por todos os Satous, depois de beber sake você vai desviar de qualquer técnica Taijutsu usada em você. Como treinar: [price]","[src.name]")//,,,,0,"400x150",,style)

		LostBuzz
			name="Zumbido perdido"
			icon_state="Awareness"
			var/price="Aumenta Bebendo."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Enquanto você estiver bebado, há uma chance de que a tela nao irá girar,aumentando 10% a cada efeito. Como treinar: [price] [usr.LostBuzz]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		EffectsofDrinking
			name="Os efeitos de beber"
			icon_state="Awareness"
			var/price="Bebendo."
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Quando bebado,um Ninja do clan Satou irá correr em velocidade maxima nao importa oque.Como Treinar: [price]","[src.name]")//,,,,0,"400x150",,style)
		Shield
			name="Defesa"
			icon_state="Versatile"
			var/price="Bloqueando com uma armadura."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "Quando estiver bloqueando com uma armadura, sua defesa aumenta imensamente aumentando a cada ponto na passiva. Cada ponto aumenta a quantidade. Como treinar: [price] [usr.Shield]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

//TaijutsuPassives
turf
	Skilltree/Passives/TaijutsuPassives
		layer = MOB_LAYER+97
		icon='Icons/Jutsus/Skilltree.dmi'
		TaijutsuKnowledge
			name ="Conhecimento de Taijutsu"
			icon_state="TaijutsuKnowledge2"
			var/price="Usando técnicas taijutsu."
			var/maxprice="Sem limites"
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] Aumenta sua variedade de Taijutsus que pode masterizar. Como treinar: [price] [usr.TaijutsuKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Swift
			name="Velocidade"
			icon_state="Swift"
			var/price="Atacando."
			var/maxprice=6
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.TaijutsuKnowledge<50)
					usr.Swift=0;alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 50 de conhecimento de Taijutsu para poder ver essa passiva.")
					return
				alert(usr, "[src] é uma passiva que lhe permite atacar mais rapido a cada ponto. Como treinar: [price] [usr.Swift]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passive usando seus pontos de status?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.Swift>=8)
								usr<<"Você nao pode aumenta mais essa passiva!";usr.clicking=0;return
							if(usr.TaijutsuKnowledge<75*(usr.Swift+1))
								usr<<"Você precisa de [75*(usr.Swift+1)] de conhecimento de Taijutsu para aumentar essa passiva.";usr.clicking=0;return
							usr.Swift++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Rush
			name="Avanço"
			icon_state="Rush"
			var/price="Socando um log ou uma arvore."
			var/maxprice=20
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Swift<1)
					usr.Rush=0;alert(usr,"Essa passive nao está disponivel para você neste momento. Você precisa de 1 de velocidade antes de ver essa passiva.")
					return
				alert(usr, "[src] faz cada ataque consecutivo ser mais forte que o anterior. O limite é igual ao nivel da habilidade. Como treinar: [price] [usr.Rush]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passive com seus pontos de status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<100*(usr.Rush+1))
								usr<<"Você precisa de [100*(usr.Rush+1)] de Conhecimento de Taijutsu antes de aumentar essa passiva.";usr.clicking=0;return
							usr.Rush++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		DoubleStrike
			name="Ataque duplo"
			icon_state="DoubleStrike"
			var/price="Fazendo Combos."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Swift<1)
					usr.DoubleStrike=0;alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 1 de velocidade antes que possa ver essa passiva.")
					return
				alert(usr, "Ataque duplo permite o usuario atacar duas vezes de uma só. Como treinar: [price] [usr.DoubleStrike]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus pontos de status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<100*(usr.DoubleStrike+1))
								usr<<"Você precisa de [100*(usr.DoubleStrike+1)] de conhecimento de Taijutsu antes que possa aumentar essa passiva.";usr.clicking=0;return
							usr.DoubleStrike++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Reflex
			name="Reflexo"
			icon_state="Reflex"
			var/price="Toda vez você pode desviar com sucesso, isso pode aumentar."
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.TaijutsuMastery<1)
					alert(usr,"Esta passiva nao está disponivel para você agora. Você precisa de 1 de Masteria de Taijutsu antes que você possa ver essa passiva.")
					return
				alert(usr, "[src] é uma habilidade que lhe permite desviar melhor de tecnicas de taijutsu, tambem lhe dando chances melhores de usar um. Há um rumor de que um idoso na vila do chá conhece os segredos do Reflexo [usr.reflexNew]/3","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&usr.reflexNew<3)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar esta passiva com seus pontos de status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<300*(usr.reflexNew+1))
								usr<<"Você precisa de [300*(usr.reflexNew+1)] de Conhecimento de Taijutsu antes que possa aumentar esta passiva.";usr.clicking=0;return
							usr.reflexNew++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Buff
			name="Buff"
			icon_state="Buff"
			var/price="Toda vez que levar um dano critico,há uma chance de contra-atacar."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Impenetrable<1)
					usr.Buff=0;alert(usr,"Esta passiva nao está disponivel para voce agora. Você precisa de 1 de Impenetrável antes que você possa ver esta passiva.")
					return
				alert(usr, "[src] diminui a chance de levar um dano critico. Como treinar: [price] [usr.Buff]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar esta passiva usando seus pontos restantes de Status?") in list ("Nao","Sim"))
						if("Sim")
							usr.Buff+=10;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Impenetrable
			name="Impenetravel"
			icon_state="Impenetrable"
			var/price="Apenas defendendo."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.TaijutsuKnowledge<50)
					usr.Impenetrable=0;alert(usr,"Esta passive nao está disponivel para você agora. Você precisa de 50 de conhecimento de Taijutsu antes que você possa ver essa passiva.")
					return
				alert(usr, "[src] aumenta a força da defesa. Como treinar: [price] [usr.Impenetrable]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.Impenetrable<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passive com seus pontos de status restantes?") in list ("Nao","Sim"))
						if("Sim")
							usr.Impenetrable++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Focus
			name="Foco"
			icon_state="Focus"
			var/price="Cada vez que você faz um ataque critico há chances disto aumentar. Quando você é acertado por um ataque critico tambem há chances de aumentar."
			var/maxprice="Sem limites"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.TaijutsuMastery<1)
					usr.Focus=0;alert(usr,"Esta passiva nao está disponivel para você agora. Você precisa de 1 de Masteria em Taijutsu para poder ver esta passiva.")
					return
				alert(usr, "[src] aumenta a chance de dar um ataque critico. Tambem aumenta o foco contra outros ataques, ajudando em outras coisas. Como treinar: [price] [usr.Focus]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"?") in list ("Nao","Sim"))
						if("Sim")
							usr.Focus+=10;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		InitialGate
			name="Portao Inicial"
			icon_state="InitialGate"
			var/maxprice="1"
			Click()
				if(usr.Acceleration<1)
					alert(usr,"Esta passiva nao está disponivel para você agora. Você precisa de 1 / 10 de aceleraçao antes que você possa obter essa passiva.")
					return
				switch(alert("esté é o primeiro portao você gostaria de aprender?","[src]","Aprender","Informaçao"))
					if("Informaçao")
	//					alert("[src] .","[src]")
						return
					if("Aprender")
						if(usr.InitialGate)
						//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
						//		color:white;}</style>"
							alert(usr, "Você ja conhece essa técnica!","[src.name]")//,,,,0,"400x150",,style);
							return
						else
							if(usr.TaijutsuKnowledge<15)
								usr<<"Você precisa de mais Conhecimento de Taijutsu.";return
							usr.LearnJutsu("Initial Gate",10000,"Initial Gate","","Taijutsu")

		HealGate
			name="Portao Da Cura"
			icon_state="HealGate"
			var/maxprice="1"
			Click()
				switch(alert("Este é o segundo portão voce gostaria de aprender?","[src]","Aprender","Informaçao"))
					if("Informaçao")
	//					alert("[src] .","[src]")
						return
					if("Aprender")
						if(usr.HealGate)
						//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							alert(usr, "Você ja conhece essa técnica!","[src.name]")//,,,,0,"400x150",,style);
							return
						else
							if(usr.TaijutsuKnowledge<40)
								usr<<"Você precisa de mais Conhecimento de Taijutsu.";return
							usr.LearnJutsu("Heal Gate",20000,"Heal Gate","","Taijutsu")

		LifeGate
			name="Portao Da Vida"
			icon_state="LifeGate"
			var/maxprice="1"
			Click()
				switch(alert("Este é o terceiro portao você gostaria de aprender?","[src]","Aprender","Informaçao"))
					if("Informaçao")
	//					alert("[src] .","[src]")
						return
					if("Aprender")
						if(usr.LifeGate)
						//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
								color:white;}</style>"
							alert(usr, "Você ja conhece essa técnica!","[src.name]")//,,,,0,"400x150",,style);return
						else
							if(usr.TaijutsuKnowledge<100)
								usr<<"Você precisa de mais Conhecimento de Taijutsu.";return
							usr.LearnJutsu("Life Gate",30000,"Life Gate","","Taijutsu")
		WoundGate
			name="Portão da Dor"
			icon_state="WoundGate"
			var/maxprice="1"
			Click()
				switch(alert("Este é o terceiro portao,você gostaria de aprender?","[src]","Aprender","Informaçao"))
					if("Informaçao")
	//					alert("[src] .","[src]")
						return
					if("Aprender")
						if(usr.WoundGate)
						//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
						//		color:white;}</style>"
							alert(usr, "Você ja conhece essa Tecnica!","[src.name]")//,,,,0,"400x150",,style);
							return
						else
							if(usr.TaijutsuKnowledge<165)
								usr<<"Você precisa de mais Conhecimento de Taijutsu.";return
							usr.LearnJutsu("Wound Gate",40000,"Wound Gate","","Taijutsu")

		LimitGate
			name="Portão do Limite"
			icon_state="LimitGate"
			var/maxprice="1"
			Click()
				switch(alert("Este é o quinto portao você gostaria de aprender?","[src]","Aprender","Informaçao"))
					if("Informaçao")
	//					alert("[src] .","[src]")
						return
					if("Aprender")
						if(usr.LimitGate)
					//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
					//			color:white;}</style>"
							alert(usr, "Você ja conhece essa tecnica!","[src.name]")//,,,,0,"400x150",,style);
							return
						else
							if(usr.TaijutsuKnowledge<200)
								usr<<"Você precisa de mais Conhecimento de Taijutsu.";return
							usr.LearnJutsu("Limit Gate",50000,"Limit Gate","","Taijutsu")
		ViewGate
			name="Portão da Visao"
			icon_state="ViewGate"
			var/maxprice="1"
			Click()
				switch(alert("Esse é o sexto portao,você gostaria de aprender?","[src]","Aprender","Informaçao"))
					if("Informaçao")
	//					alert("[src] .","[src]")
						return
					if("Aprender")
						if(usr.ViewGate)
					//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
					//			color:white;}</style>"
							alert(usr, "Você ja conhece essa tecnica!","[src.name]")//,,,,0,"400x150",,style);
							return
						else
							if(usr.TaijutsuKnowledge<280)
								usr<<"Você precisa de mais Conhecimento de Taijutsu.";return
							usr.LearnJutsu("View Gate",60000,"View Gate","","Taijutsu")
		WonderGate
			name="Portao do Ferimento"
			icon_state="WonderGate"
		DeathGate
			name="Portao da Morte"
			icon_state="DeathGate"
		TaijutsuMastery
			name="Masteria De Taijutsu"
			icon_state="TaijutsuMastery"
			var/price="Usando Técnicas Taijutsu."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.TaijutsuKnowledge<50)
					usr.TaijutsuMastery=0;alert(usr,"Essa passiva nao está disponivel agora. Você precisa de 50 de Conhecimento de Taijutsu antes que você possa ver essa Passiva.")
					return
				alert(usr, "[src] Abaixa a demora das Técnicas Taijutsu. Como treinar: [price] [usr.TaijutsuMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.TaijutsuMastery<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar esta passiva com seus Pontos de Taijutsu restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.TaijutsuKnowledge<100*(usr.TaijutsuMastery+1))
								usr<<"Você precisa de [100*(usr.TaijutsuMastery+1)] de Conhecimento de Taijutsu antes que possa aumentar essa passiva.";usr.clicking=0;return
							usr.TaijutsuMastery++;usr.StartingPoints--
					usr.clicking=0
//Ninjutsu Passives
turf
	Skilltree/Passives/NinjutsuPassives
		layer = MOB_LAYER+97
		ChakraArmor
			name ="Armadura de Chakra"
			icon_state="ChakraArmor"
	//FuuinjutsuStuffPls
		FuuinjutsuKnowledge
			name="Conhecimento de Fuuinjutsu"
			icon_state="FuuinjutsuKnowledge"
			var/price="Usando Fuuinjutsu e lançando em outros Ninjas ativos"
			var/maxprice="Sem limites"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] aumenta a variedade de Fuuinjutsus que você pode Masterizar e utilizar. Como treinar: [price] [usr.FuuinjutsuKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		WeaponMaster2
			name ="Mestre das Armas"
			icon_state="NinjutsuKnowledge"
			var/price="Aumentando com seus Pontos de Status restantes."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] aumenta seu Conhecimento de Armas e Equipamentos, possibilitando você a usar coisas com suas armas. Como treinar: [price] [usr.WeaponMaster2]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.WeaponMaster2<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar esta passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							usr.WeaponMaster2++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		NinjutsuKnowledge
			name ="Conhecimento de Ninjutsu"
			icon_state="ChakraUsage"//"NinjutsuKnowledge"
			var/price="Usando Técnicas Ninjutsu."
			var/maxprice="Sem limites"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] aumenta a variedade de técnicas Ninjutsu que você pode Masterizar. Como Treinar: [price] [usr.NinjutsuKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)


		PoisonKnowledge
			name = "Conhecimento de Veneno"
			icon_state="PoisonKnowledge"
			var/price="Usando Veneno."
			var/maxprice="Sem Limites"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] Aumenta a variedades de venenos que você pode usar. Como Treinar: [price] [usr.PoisonKnowledge]/[maxprice]","[src.name]")

		PoisonExpert
			name ="Especialista em Venenos"
			icon_state="PoisonExpert"
			var/price="Aumentando com seus Pontos de Status restantes."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.PoisonKnowledge<30)
					alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 30 de Conhecimento De Veneno para ver essa Passiva.")
					return
				alert(usr, "[src] Aumenta a duraçao de venenos e diminui a quantidade de tempo necessaria para por nas armas. Como Treinar: [price] [usr.PoisonExpert]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.PoisonExpert<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar esta passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.PoisonKnowledge<50*(usr.PoisonExpert+1))
								usr<<"Você precisa de [50*(usr.PoisonExpert+1)] de Conhecimento de Veneno para aumentar mais essa passiva.";usr.clicking=0;return
							usr.PoisonExpert++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0

		NinjutsuMastery
			name ="Masteria em Ninjutsu"
			icon_state="NinjutsuMastery"
			var/price="Usando Técnicas Ninjutsu."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<50)
					usr.NinjutsuMastery=0;alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 50 de Conhecimento De Ninjutsu para ver essa Passiva.")
					return
				alert(usr, "[src] Diminui o tempo de espera das técnicas de Ninjutsu. Como treinar: [price] [usr.NinjutsuMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.NinjutsuMastery<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa Passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							usr.NinjutsuMastery++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0

		Refill
			name="Reabastecimento de Chakra"
			icon_state="Refill"
/*			var/price="Usando com sucesso técnicas Ninjutsu."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] reabastece o chakra reserva do usuario enquanto eles estiverem parados. Como treinar: [price] [usr.HandsealSpeed]/[maxprice]","[src.name]",,,,0,"400x150",,style)
*/
		ChakraSensor
			name="Sensor de Chakra"
			icon_state="ChakraSensor"
/*			var/price="Usando com sucesso selos de mao."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] possibilita o usuario sentir chakras proximos e suas identidades. Como treinar: [price] [usr.HandsealSpeed]/[maxprice]","[src.name]",,,,0,"400x150",,style)
*/

		HandsealMastery
			name="Masteria em Selos de Mao"
			icon_state="HandsealsMastery"
			var/price="Usando com sucesso Selos de Mao."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<10)
					usr.HandsealsMastery=0;alert(usr,"Essa passiva nao está disponivel para você no momento. Você precisa de 10 de Conhecimento de Ninjutsu para ver essa passiva.")
					return
				alert(usr, "[src] a chance de realizar selos de mao com precisao. Como Treinar: [price] [usr.HandsealsMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.HandsealsMastery<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							usr.HandsealsMastery++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		RealChakraControl
			name ="Controle de Chakra"
			icon_state="Ninjutsu_Control"
			var/price="Usando Intensidade de Chakra ou andando na agua"
			var/maxprice=100
			Click()
				maxprice=100
				if(usr.Clan=="Fuuma")
					maxprice=160
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<50||usr.WaterWalkingMastery!=10)
					if(usr.NinjutsuKnowledge<50)
						alert(usr,"Essa passiva nao esta disponivel para você agora. Você precisa de 50 de Conhecimento de Ninjutsu antes que possa ver essa passiva.")
						return
					if(usr.WaterWalkingMastery<10)
						alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 10 de Maestria em Andar na Agua para ver essa passiva.")
						return
				alert(usr, "[src] aumenta a eficiencia de sua conversao de chakra, reduzindo o dreno de jutsus. Aumenta o quanto de chakra você ganha segurando Z enquanto carrega chakra. Como Treinar: [price] ([usr.ChakraC]% Efficiency).","[src.name]")//,,,,0,"400x150",,style)

		HandsealSpeed
			name="Velocidade de selos de mao"
			icon_state="HandsealSpeed"
			var/price="Usando com sucesso selos de mao."
			var/maxprice=30
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.HandsealsMastery<3)
					usr.HandsealSpeed=0;alert(usr,"Essa passiva nao está disponivel para você no momento. Você precisa de 3 de Maestria em Selos de mao antes que você possa ver essa passiva.")
					return
				alert(usr, "[src] aumenta a velocidade dos selos de mao. Como treinar: [price][usr.HandsealSpeed]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					if(usr.Trait=="Speady"&&usr.HandsealSpeed>=60) return
					if(usr.Trait!="Speedy"&&usr.HandsealSpeed>=maxprice) return
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.NinjutsuKnowledge<50*(usr.HandsealSpeed+1))
								usr<<"Você precisa de [50*(usr.HandsealSpeed+1)] de Conhecimento de Ninjutsu antes que você possa aumentar mais essa passiva.";usr.clicking=0;return
							usr.HandsealSpeed+=10;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		HandsealAgility
			name="Agilidade com selos de mao"
			icon_state="HandsealAgility"
			var/price="Aumenta usando Pontos de Status restantes."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.HandsealsMastery<3)
					usr.HandsealAgility=0;alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 3 de Maestria em selos de mao antes de poder ver essa passiva.")
					return
				alert(usr, "[src] possibilita o usuario a usar selos de mao enquanto corre. Como treinar: [price] [usr.HandsealAgility]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.HandsealAgility<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.NinjutsuKnowledge<100*(usr.HandsealAgility+1))
								usr<<"Você precisa de [100*(usr.HandsealAgility+1)] de Conhecimento de Ninjutsu antes que você possa aumentar mais essa passiva.";usr.clicking=0;return
							usr.HandsealAgility++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		HandsealsActivation
			name="Ativaçao de Selos de Mao"
			icon_state="HandsealsActivation"
/*			var/price="Aumenta usando seus Pontos de Status restantes."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] aumenta as chances do usuario do usuario usar um jutsu bem conhecido jutsu com 200 usos automaticamente sem selos de mao por % cada ponto. Como treinar: [price] [usr.HandsealSpeed]/[maxprice]","[src.name]",,,,0,"400x150",,style)
*/
		OneHandedHandseal
			name="Selos com uma mao"
			icon_state="OneHandedHandseal"
			var/price="Aumentando com seus Pontos de Status restantes."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.HandsealsMastery<3)
					usr.OneHandedSeals=0;alert(usr,"Essa passiva nao está disponivel para você no momento. Você precisa de 3 de Maestria em Selos de mao antes de ver essa passiva .")
					return
				alert(usr, "[src] Possibilita o usuario a usar selos de mao com uma mao. Isso os possibilita a usar selos de mao até nas situaçoes mais perigosas para um jutsu mesmo nos casos em que eles estam desabilitados na area. Como treinar: [price] [usr.OneHandedSeals]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.OneHandedSeals<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.NinjutsuKnowledge<75*(usr.OneHandedSeals+1))
								usr<<"Você precisa de [75*(usr.OneHandedSeals+1)] de Conhecimento de Ninjutsu antes que você possa aumentar essa passiva.";usr.clicking=0;return
							usr.OneHandedSeals++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		WaterWalkingMastery
			name="Maestria em andar na agua"
			icon_state="WaterWalkingMastery"
			var/price="Andando na agua."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<50)
					usr.WaterWalkingMastery=0;alert(usr,"Essa passiva nao está disponivel para você agora. Você precisa de 50 de Conhecimento De Ninjutsu antes de ver essa passiva.")
					return
				alert(usr, "[src] Reduz a quantidade de chakra necessaria para andar na agua. Como treinar: [price] [usr.WaterWalkingMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.WaterWalkingMastery<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							if(usr.NinjutsuKnowledge<10*(usr.WaterWalkingMastery+1))
								usr<<"Você precisa de  [10*(usr.WaterWalkingMastery+1)] de Conhecimento De Ninjutsu para aumentar essa passiva.";usr.clicking=0;return
							usr.WaterWalkingMastery++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
//Genjutsu Passives
turf
	Skilltree/Passives/GenjutsuPassives
		layer=MOB_LAYER+97
		GenjutsuKai
			name="Genjutsu Kai"
			icon_state="GenjutsuKai"
			var/price=10
			var/maxprice=1
			Click()
				src<<sound('SFX/click1.wav',0)
				alert(usr, "[src] possibilita o usuario a se repelir de tecnicas genjutsu apenas Defendendo. Se o usuario bloquear no tempo certo do genjutsu, o genjutsu é cancelado. Se o usuario ja esta paralizado, a quebra do genjutsu nao vai mais funcionar. Custo: [price]</br>[usr.GenjutsuKai]/[maxprice]")
				if("Learn")
					usr<<sound('SFX/click1.wav',0)
					if(usr.GenjutsuKai)
						alert(usr, "Você ja conhece essa tecnica!","[src.name]")
						return
					if(usr.JutsuDelay>0)
						usr<<"Você precisa esperar para aprender outro jutsu!";return
					if(usr.JutsuInLearning!="")
						usr<<"Você ja está tentando aprender alguma coisa."
						return
					else
						usr.JutsuEXPCost=0;usr.JutsuMEXPCost=10000;usr.JutsuInLearning="Genjutsu Kai";usr.TypeLearning="Genjutsu";return
		GenjutsuSight
			name="Visao do Genjutsu"
			icon_state="GenjutsuSight"
			var/price="Cancelando Genjutsus."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] Aumenta em 10% as chances do usuario saber quando usar o Genjutsu kai dentro de um genjutsu. Como treinar: [price] [usr.GenjutsuSight]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.GenjutsuSight<maxprice)
					usr.clicking=1
					switch(input(usr,"Você gostaria de aumentar essa passiva com seus Pontos de Status restantes?") in list ("Nao","Sim"))
						if("Sim")
							usr.GenjutsuSight++;usr.StartingPoints--
					usr.clicking=0
		GenjutsuKnowledge
			name ="Conhecimento de Genjutsu"
			icon_state="GenjutsuKnowledge2"
			var/price="Usando técnicas Genjutsu."
			var/maxprice="Sem limites"
			Click()
				usr<<sound('SFX/click1.wav',0)
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				alert(usr, "[src] Aumenta a variedade de genjutsus que você pode masterizar. Como treinar: [price] [usr.GenjutsuKnowledge]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
		Mentality
			name="Mentalidade"
			icon_state="Mentality"
			var/price="Sucumbindo a efeitos de ninjutsu."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] Aumenta a resistencia mental a danos de Genjutsu, Diminuindo o dano na stamina a cada ponto. Como treinar: [price] [usr.Mentality]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)

		MentalDamage
			name="Dano mental"
			icon_state="MentalDamage"
			var/price="Usando genjutsu"
			var/maxprice=10
			Click()
				alert(usr, "[src] Aumenta o dano mental dado em oponentes atraves de Genjutsu, aumentando o dano na stamina a cada ponto. Como treinar: [price] [usr.MentalDamage]/[maxprice]","[src.name]")

		ChakraManipulator
			name="Mestre em manipulaçao de chakra"
			icon_state="GenjutsuGold"
			var/price="Aumentando com seus Pontos de Status restantes."
			var/maxprice=3
			Click()
				alert(usr,"[src] Você aprende rapido quando você esta aprendendo um novo Genjutsu e aumenta sua eficiencia com Genjutsus. Cada ponto nessa passiva lhe permite usar genjutsu mais eficientemente e muito mais rapido. Como usar: [price] [usr.ChakraManipulator]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.ChakraManipulator<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.GenjutsuKnowledge<75*(usr.ChakraManipulator+1))
								usr<<"You need [75*(usr.ChakraManipulator+1)] Genjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.ChakraManipulator++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0

		Overthought
			name="Overthought"
			icon_state="EvilGen"
			var/price="Hidden Requirements"
			var/maxprice=1
			Click()
				alert(usr, "[src] is given to one that masters the art of Chakra Manipulation torwards using Genjutsu. This allows them to go beyond the normal limit on a Ninjas chakra in releasing for Area Over Effect Genjutsus, increasing the range. How to Train it: [price] [usr.Overthought]/[maxprice]")
		ChakraRadiator
			name="Chakra Radiator"
			icon_state="GenjutsuKo"
			var/price="By Raising with your Elemental Points"
			var/maxprice=3
			Click()
				if(usr.GenjutsuKnowledge<=150)
					usr<<"Get more GenjutsuKnowledge first....";return
				if(usr.ChakraManipulator<=0)
					usr<<"You can't Manipulate chakra well enough to use this...";return
				alert(usr,"[src] You are able to make your chakra stronger when using it as Area Over Effect, increasing the strength of it, causing it to take affect much quicker and increasing the affects that the genjutsu deal. How to Train it: [price] [usr.ChakraRadiator]/[maxprice]")
				if(usr.ElementalPoints>=3&&!usr.clicking&&usr.ChakraRadiator<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your Elemental Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.GenjutsuKnowledge<200*(usr.ChakraRadiator+1))
								usr<<"You need [200*(usr.ChakraRadiator+1)] Genjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.ChakraRadiator++;usr.ElementalPoints-=3;usr.clicking=0
					usr.clicking=0



//Weapon Passives
turf
	Skilltree/Passives/WeaponPassives
		layer=MOB_LAYER+97
		Bow
			name="Archery"
			icon_state="BowMastery"
			var/price="By using the Bow"
			var/maxprice=100
			Click()
				maxprice=100
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the proficiency and a user's knowledege of Bows. How to Train it: [price] [usr.ArcherMastery]/[maxprice]","[src.name]")

		Kenjutsu
			name="Kenjutsu"
			icon_state="Kenjutsu"
			var/price="By using the sword."
			var/maxprice=100
			Click()
				maxprice=100
				if(usr.Clan=="Yotsuki")
					maxprice=125
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the proficiency and a user's knowledge of Swords. How to Train it: [price] [usr.Kenjutsu]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.Kenjutsu<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							usr.Kenjutsu+=5;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Bojutsu
			name="Bojutsu"
			icon_state="Bojutsu"
			var/price="By using the Bo-Staff."
			var/maxprice=100
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the proficiency and a user's knowledge of Bo-Staffs. How to Train it: [price] [usr.Bojutsu]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.Bojutsu<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							usr.Bojutsu+=5;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		HeavySlam
			name="Heavy Slam"
			icon_state="Bojutsu"
			var/price="By raising it with your leftover Stat Points."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Bojutsu<10)
					usr.HeavySlam=0;alert(usr,"This passive is unavailable to you at this time. You need 10 Bojutsu before you can view this passive.")
					return
				alert(usr, "[src] increases the user's chance to severely cripple the opponent by slamming them hard with a Bo, also causing severe stamina damage. Chance increases by 5% for each point. How to Train it: [price] [usr.HeavySlam]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&5>=usr.HeavySlam)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Bojutsu<20*(usr.HeavySlam+1))
								usr<<"You need [20*(usr.HeavySlam+1)] Bojutsu before you can raise this passive further.";usr.clicking=0;return
							usr.HeavySlam++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		SpeedSlice
			name="Speed Dice"
			icon_state="SpeedSlice"
			var/price="The more you slice."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Kenjutsu<5&&usr.Bojutsu<5)
					usr.SpeedDice=0;alert(usr,"This passive is unavailable to you at this time. You need 5 Kenjutsu or 5 Bojutsu skill before you can view this passive.")
					return
				alert(usr, "[src] increases the speed of sword slashing attacks. How to Train it: [price] [usr.SpeedDice]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.SpeedDice<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Kenjutsu<5*(usr.SpeedDice+1))
								usr<<"You need [5*(usr.SpeedDice+1)] Kenjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.SpeedDice++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		DisarmingSlash
			name="Disarming Slash"
			icon_state="Deflection"
			var/price="By raising with leftover Skillpoints."
			var/maxprice=1
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.Kenjutsu<20)
				//	usr.DeflectionZ=0
					alert(usr,"This passive is unavailable to you at this time. You need 20 kenjutsu before you can view this passive.")
					return
				alert(usr, "[src] allows you to automatically deflect slash-based attacks if you have a weapon equipped. How to Train it: [price] [usr.DisarmingSlash]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.DisarmingSlash<1)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Kenjutsu<20*(usr.DisarmingSlash+1))
								usr<<"You need [20*(usr.DisarmingSlash+1)] Kenjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.DisarmingSlash++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Deflection
			name="Deflection"
			icon_state="Deflection"
			var/price="By deflecting weapons."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SpeedDice<1)
			//		usr.DeflectionZ=0;
					alert(usr,"This passive is unavailable to you at this time. You need 1 Speed Dice skill before you can view this passive.")
					return
				alert(usr, "[src] allows you to automatically deflect slash-based attacks if you have a weapon equipped. How to Train it: [price] [usr.DeflectionZ]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.DeflectionZ<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Kenjutsu<10*(usr.DeflectionZ+1))
								usr<<"You need [10*(usr.DeflectionZ+1)] Kenjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.DeflectionZ++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		SlashStrength
			name="Slash Strength"
			icon_state="SlashStrength"
			var/price="By raising it with your leftover Stat Points."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.DeflectionZ<1)
			//		usr.SlashStrength=0;
					alert(usr,"This passive is unavailable to you at this time. You need 1 Deflection skill before you can view this passive.")
					return
				alert(usr, "[src] allows the user to go over the cap of their current Sword, increasing the cap by 10 damage for each point.How to Train it: [price] [usr.SlashStrength]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.SlashStrength<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Kenjutsu<5*(usr.SlashStrength+0))
								usr<<"You need [5*(usr.SlashStrength+0)] Kenjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.SlashStrength++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Gash
			name="Gash"
			icon_state="Gash"
			var/price="By raising it with your leftover Stat Points."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SpeedDice<2)
				//	usr.Gash=0;
					alert(usr,"This passive is unavailable to you at this time. You need 2 Speed Dice before you can view this passive.")
					return
				alert(usr, "[src] gives you a chance to cause a deep cut in the opponent's body with a sword, causing them to bleed for a time. Each point in this passive increases the chance by 10%. How to Train it: [price] [usr.Gash]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.Gash<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Kenjutsu<10*(usr.Gash+1))
								usr<<"You need [10*(usr.Gash+1)] Kenjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.Gash++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		VitalSlash
			name="Vital Slash"
			icon_state="VitalSlash"
			var/price="By raising it with your leftover Stat Points."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.SpeedDice<1)
					usr.VitalSlash=0;alert(usr,"This passive is unavailable to you at this time. You need 1 Speed Dice before you can view this passive.")
					return
				alert(usr, "[src] increases the user's chance to hit a vital organ when slashing with combos taking an immediate 500 Vitality damage and forcing the opponent to walk. Chance increases by 0.5% for each point. How to Train it: [price] [usr.VitalSlash]/[maxprice]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.VitalSlash<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.Kenjutsu<20*(usr.VitalSlash+1))
								usr<<"You need [25*(usr.VitalSlash+1)] Kenjutsu Knowledge before you can raise this passive further.";usr.clicking=0;return
							usr.VitalSlash++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		ShurikenMastery
			name="Shuriken Mastery"
			icon_state="ShurikenMastery"
			var/price="By throwing Shuriken."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the proficiency and a user's knowledge of shuriken. How to Train it: [price] [usr.ShurikenMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							usr.ShurikenMastery+=10;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		KunaiMastery
			name="Kunai Mastery"
			icon_state="KunaiMastery"
			var/price="By throwing Kunai."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the proficiency and a user's knowledge of kunai. How to Train it: [price] [usr.KunaiMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							usr.KunaiMastery+=10;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		SenbonMastery
			name="Senbon Mastery"
			icon_state="SenbonMastery"

			var/price="By throwing Senbons."
			var/maxprice="No Limit"
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the proficiency and a user's knowledge of Senbons. How to Train it: [price] [usr.SenbonMastery]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							usr.SenbonMastery+=10;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		SenbonImpale
			name="Acupuncture"
			icon_state="Acupuncture"
			var/price="By raising with Starting Points."
			var/maxprice=3
			Click()
				usr<<sound('SFX/click1.wav',0)
				//var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] increases the chance to directly hit the enemy in a direct place where you're looking, causing enhanced Accuracy. How to Train it: [price] [usr.SenbonImpale]/[maxprice]","[src.name]")//,,,,0,"400x150",,style)
				if(usr.StartingPoints>=1&&!usr.clicking)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Starting Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.SenbonImpale==3)
								usr<<"You can't raise this passive any further";usr.clicking=0;return
							if(usr.SenbonMastery<30*(usr.SenbonImpale+1))
								usr<<"You need [30*(usr.SenbonImpale+1)] Weapon Mastery before you can raise this passive further.";usr.clicking=0;return
							usr.SenbonImpale++;usr.StartingPoints-=1;usr.clicking=0
					usr.clicking=0
		NeedleTreatment
			name="Needle Treatment"
			icon_state="NeedleTreatment"
/*
			var/price="By throwing Senbons."
			var/maxprice=50
			Click()
				usr<<sound('SFX/click1.wav',0)
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				alert(usr, "[src] gives the user the chance to have a Needle stick inside of an opponent's body, which they'd have to take out. Increases by 1% for each point. How to Train it: [price] [usr.KunaiMastery]/[maxprice]","[src.name]",,,,0,"400x150",,style)
*/
		ThrowingStrength
			name="Throwing Strength"
			icon_state="ThrowingStrength"
			var/price="By throwing weapons."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the speed of thrown weapons. How to Train it: [price] [usr.ThrowingStrength]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.ThrowingStrength<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.KunaiMastery+usr.ShurikenMastery<30*(usr.ThrowingStrength+1))
								usr<<"You need [30*(usr.ThrowingStrength+1)] Weapon Mastery before you can raise this passive further.";usr.clicking=0;return
							usr.ThrowingStrength++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0
		Percision
			name="Percision"
			icon_state="Percision"
			var/price="By hitting direct targets with your kunai."
			var/maxprice=10
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] increases the accuracy of thrown weapons, so they may perform critical damage! How to Train it: [price] [usr.Percision]/[maxprice]","[src.name]")
				if(usr.StartingPoints>=1&&!usr.clicking&&usr.Percision<maxprice)
					usr.clicking=1
					switch(input(usr,"Would you like to raise this passive using your left over Stat Points?") in list ("No","Yes"))
						if("Yes")
							if(usr.KunaiMastery+usr.ShurikenMastery<30*(usr.ThrowingStrength+1))
								usr<<"You need [30*(usr.ThrowingStrength+1)] Weapon Mastery before you can raise this passive further.";usr.clicking=0;return
							usr.Percision++;usr.StartingPoints--;usr.clicking=0
					usr.clicking=0


//SageModeSapo
turf
	Skilltree/Passives/SageMode
		EnergiaNatural
			name="Conhecimento em Senjutsu"
			icon_state="Energia Natural"
			var/price="Utilizando Tecnicas Senjutsu."
			var/maxprice=5
			Click()
				usr<<sound('SFX/click1.wav',0)
				alert(usr, "[src] é uma passiva que aumenta sua eficiencia em jutsus de estilo Senjutsu , Como treina-lo? :[price] /Sem limite]","[src.name]")

		SapoComumInvoc
			name="Invocação de Sapo Comum"
			icon_state="Summon"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<300)
					usr<<"Você precisa de 300 de ninjutsu para aprender isto.";return
				usr.LearnJutsu("Invocação de Sapo",10000,"Summoning_Jutsu_Sapo","É o jutsu inicial da invocação , começando invocando coisas simples como um sapo comum.","Ninjutsu")

		SapoDoMonte
			name="Invocação de Sapo do Monte"
			icon_state="Summon"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<500)
					usr<<"Você precisa de 500 de ninjutsu para aprender isto.";return
				usr.LearnJutsu("Invocação de sapo do Monte",25000,"Summoning_Jutsu_Sapo_do_Monte","É um jutsu mas avançado da invocação , começando invocar coisas de grandes distancias como o sapo do Monte.","Ninjutsu")

		SapoMedioDoMonte
			name="Invocação de Sapo Medio do Monte"
			icon_state="Summon"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<800)
					usr<<"Você precisa de 800 de ninjutsu para aprender isto.";return
				usr.LearnJutsu("Invocação de Sapo Medio do Monte",40000,"Summoning_Jutsu_Sapo_Medio","É um jutsu de invocação que necessita de mais chakra e é considerado um otimo jutsu para suporte.","Ninjutsu")

		SapoDeBatalha
			name="Invocação de Sapo de Batalha"
			icon_state="Summon"
			Click()
				usr<<sound('SFX/click1.wav',0)
				if(usr.NinjutsuKnowledge<1200)
					usr<<"Você precisa de 1200 de ninjutsu para aprender isto.";return
				usr.LearnJutsu("Invocação de Sapo de Batalha",100000,"Summoning_Jutsu_Sapo_de_Batalha","Invoca um poderoso sapo gigante, capaz de dar grande dano fisico em seus inimigos.","Ninjutsu")












