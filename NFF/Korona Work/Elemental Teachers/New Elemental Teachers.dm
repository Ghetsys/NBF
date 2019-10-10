mob/var/ElementalPoints = 50
mob/var/ElementalPointDeduction=0
mob/var/tmp/TalkingToElementalTeacher=0

mob/New_Teachers/
	//Katon
	Katon_Fire_Master
		name = "Adroushan"
		CNNPC = 1
		health = 9999999999999999999
		Village = "Leaf"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/MadaraH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				var/Shirt='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/pants.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"Você precisa estar de frente para ele!";return
			usr<<"[src]: Eu sou o único e verdadeiro Mestre de Katon nesta terra."
			usr.Frozen = 1
			if(usr.FireE)
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(83,35,20)
				usr<<"[src]: Qual jutsu você gostaria de aprender?"
				usr.Frozen=0
				return
			else if(usr.TalkingToElementalTeacher)
				if(!usr.Frozen)
					usr<<"Parece que pegamos algum abusador de bug ..."
					sleep(20)
					world<<"<b><font color=red><TT>Server: Foi pego [usr] em uma tentativa de ganhar múltiplos 'primeiro' elementos e conversando com outro professor, deixando o pop up aberta anterior </TT></font></b>"
					sleep(20)
					Bans:Add(usr.key)
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [usr.key] Teve a key bannida pelo servidor.</font>"
					text2file("[time2text(world.realtime)]: [usr.key] Teve a key bannida do servidor por tentar abusar de bug.<BR>","GMlog.html")
					BanSave()
					del(usr)
				else
					return
			else
				usr.TalkingToElementalTeacher=1
				switch(input(usr,"[src]: Você deseja se tornar um aprendiz de Katon?") in list ("Sim, eu quero queimar meus inimigos.","Não, outros poderes elementais me chamam.."))
					if("Não, outros poderes elementais me chamam..")
						usr<<"[src]: Eu vejo, o seu destino não queima tão brilhantemente"
						usr.Frozen = 0
						usr.TalkingToElementalTeacher=0
						return
					if("Sim, eu quero queimar meus inimigos.")
						usr<<"[src]: Very wise, I shall grant you the power of Katon."
						if(usr.ElementalPoints < 10)
							usr<<"[src]:Você não é capaz de aprender o katon agora."
							usr.Frozen = 0
							usr.TalkingToElementalTeacher=0
							return
						else
							usr<<"[src]: O seu futuro está queimando brilhante."
							sleep(11)
							usr<<"[usr] começou a treinar o Elemento Katon"
							sleep(15)
							usr<<"[src]: Vamos ver quantos Chakra de naturezas você tem."
							var/count=0
							if(usr.FireE)
								count+=1
							if(usr.WaterE)
								count+=1
							if(usr.WindE)
								count+=1
							if(usr.EarthE)
								count+=1
							if(usr.LightningE)
								count+=1
							if(count == 0)
								usr<<"[src]: Então este é seu Primeira Elemento."
								sleep(5)
								usr<<"[src]: Agora assista bem de perto."
								usr.Frozen = 1
								sleep(20)
								usr<<"[src]: Demonstra o Chakra de Fogo "
								var/image/I=image('Icons/Jutsus/KatonTechniques.dmi',src,"Demonstrate Fire",5,SOUTH)
								usr<<I
								sleep(100)
								del(I)
								usr<<"[usr] aprendeu a utilizar Chakra de Fogo!"
									//if(usr.Clan=="Uchiha")
									//	usr<<"[src]: You did well to make this your first element.."
									//else
									//	usr.ElementalPoints-=0
								usr.FireE=1
								usr.Frozen = 0
								usr.TalkingToElementalTeacher=0
							else
								usr<<"[src]: Tudo bem, vou lhe ensinar!"
								usr.TalkingToElementalTeacher=0
								var/AmountofExp=50000;var/NinjutsuKnowledgeReq=0
								if(usr.WaterE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.LightningE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.EarthE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.WindE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.NinjutsuKnowledge<NinjutsuKnowledgeReq)
									usr<<"usr <<[src]: Você não cumpre a exigência do Conhecimento de Ninjutsu [NinjutsuKnowledgeReq] para aprender um outro elemento "
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
									return
								if (usr.ElementalPoints > 10)
									usr.LearnJutsu("Fire Chakra",AmountofExp,"FireChakra","A Natureza de Chakra Fogo é uma poderosa e perigosa natureza de chakra que permite ao usuário exercer e executar técnicas de fogo. Estas técnicas atingido principalmente a vitalidade e energia.","Ninjutsu")
									usr.ElementalPointDeduction = 10
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
									return
								else
									usr<<"[src]: Você ainda não tem a capacidade para aprender o Katon."
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
									return
							usr.TalkingToElementalTeacher=0
	//Suiton
	Suiton_Water_Master
		name = "Aerwyna "
		CNNPC = 1
		health = 9999999999999999999999999999999999999999999999
		Village="Rain"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi';Base+=rgb(235,145,52)
				var/Shirt='Icons/New Base/Clothing/Official Clothing/cvest.dmi';Shirt+=rgb(55,41,122)
				var/Hair='Icons/New Base/Hair/KiraH.dmi';Hair+=rgb(0,0,100)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr.Frozen = 1
			if(usr.WaterE)
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(113,34,20)
				usr<<"[src]: Qual jutsu você gostaria de aprender?"
				usr.Frozen=0
				return
			else if(usr.TalkingToElementalTeacher)
				if(!usr.Frozen)
					usr<<"Parece que pegamos algum abusador de bug ..."
					sleep(20)
					world<<"<b><font color=red><TT>Server: Foi pego [usr] em uma tentativa de ganhar múltiplos 'primeiro' elementos e conversando com outro professor, deixando o pop up aberta anterior </TT></font></b>"
					sleep(20)
					Bans:Add(usr.key)
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [usr.key] Teve a key bannida pelo servidor.</font>"
					text2file("[time2text(world.realtime)]: [usr.key] Teve a key bannida do servidor por tentar abusar de bug.<BR>","GMlog.html")
					BanSave()
					del(usr)
				else
					return
			else
				usr.TalkingToElementalTeacher=1
				switch(input(usr,"[src]: Você deseja se tornar um aprendiz de Suiton?") in list ("Sim, Eu quero lavar meus inimigos.","Não, outros poderes elementais me chamam.."))
					if("Não, outros poderes elementais me chamam..")
						usr<<"[src]: Eu vejo, o seu destino está lavando.."
						usr.Frozen = 0
						usr.TalkingToElementalTeacher=0
						return
					if("Sim, Eu quero lavar meus inimigos.")
						usr<<"[src]: Muito sábio, vou conceder-lhe o poder de Suiton."
						if(usr.ElementalPoints < 10)
							usr<<"[src]: Você não tem a abilidade nescessaria para aprender o Suiton."
							usr.Frozen = 0
							usr.TalkingToElementalTeacher=0
							return
						else
							usr<<"[src]: Seu destino é tão profundo como o oceano."
							usr<<"[usr]: Começa a treinar o Elemento Suiton"
							usr<<"[src]: Vamos ver quantos Chakra de Natureza você tem."
							var/count=0
							if(usr.FireE)
								count+=1
							if(usr.WaterE)
								count+=1
							if(usr.WindE)
								count+=1
							if(usr.EarthE)
								count+=1
							if(usr.LightningE)
								count+=1
							if(count == 0)
								usr<<"[src]: Então esta é seu primeiro elemento."
								sleep(5)
								usr<<"[src]: Agora assista bem de perto."
								usr.Frozen = 1
								sleep(20)
								usr<<"[src]: Demonstra o Chakra de Água."
								var/image/I=image('Icons/Jutsus/SuitonTechniques.dmi',src,"Demonstrate Water",5,SOUTH)
								usr<<I
								sleep(50)
								del(I)
								usr<<"[usr] Aprendeu a utilizar Chakra de Água!"
								if(usr.Clan=="Hoshigaki"||usr.Clan=="Kusakin"||usr.Clan=="Shiroi")
									usr<<"[src]: Você fez bem em fazer o deste seu primeiro elemento.. "
									usr.ElementalPoints-=0
								else
									usr.ElementalPoints-=0
								usr.WaterE=1
								usr.Frozen = 0
								usr.TalkingToElementalTeacher=0
							else
								usr<<"[src]: Tudo bem, vou lhe ensinar!";
								var/AmountofExp=50000;var/NinjutsuKnowledgeReq=0
								if(usr.WaterE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.LightningE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.EarthE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.WindE)
									AmountofExp+=50000;NinjutsuKnowledgeReq+=200
								if(usr.NinjutsuKnowledge<NinjutsuKnowledgeReq)
									usr<<"[src]: Você não atende ao Conhecimento de Ninjutsu necessario para aprender precisa de [NinjutsuKnowledgeReq] Ninjutsu para aprender outro elemento."
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
									return
								if (usr.ElementalPoints > 10)
									usr.LearnJutsu("Water Chakra",AmountofExp,"WaterChakra","O Chakra de Natureza Água é uma poderosa e perigosa natureza de chakra que permite ao usuário exercer e executar técnicas à base de água. Estas técnicas atingido primariamente energia..","Ninjutsu")
									usr.ElementalPointDeduction = 10
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
									return
								else
									usr<<"[src]: Você não tem a abilidade para aprender esse Elemento."
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
									return
							usr.TalkingToElementalTeacher=0


	//Fuuton
	Fuuton_Wind_Master
		name = "Harmattan"
		Village="Rock"
		CNNPC=1
		health=9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/SpikedPonytailH.dmi'
				var/Shirt='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				Shirt+=rgb(128,064,0)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/pants.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi'
				src.overlays+=Shirt
				src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
				src.overlays+=Hair

		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr.Frozen = 1
			if(usr.WindE)
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(132,59,20)
				usr<<"[src]: What jutsu would you like to learn?"
				usr.Frozen=0
				return
			else if(usr.TalkingToElementalTeacher)
				if(!usr.Frozen)
					usr<<"Looks like we caught some bug abuse..."
					sleep(20)
					world<<"<b><font color=red><TT>Server: Caught [usr] in an attempt to gain multiple 'first' elements by unfreezing themselves and talking to another teacher while leaving the previous pop up open.</TT></font></b>"
					sleep(20)
					Bans:Add(usr.key)
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) The key [usr.key] has been Key-Banned by server.</font>"
					text2file("[time2text(world.realtime)]: [usr.key] was Key Banned by server for attempted bug abuse.<BR>","GMlog.html")
					BanSave()
					del(usr)
				else
					return
			else
				usr.TalkingToElementalTeacher=1
				switch(input(usr,"[src]: Do you wish to become a Apperentice of Fuuton?") in list ("Yes, I want to blow my enemies away.","Other Elemental powers call me.."))
					if("Other Elemental powers call me..")
						usr<<"[src]: I see, your destiny is washing away.."
						usr.Frozen = 0
						usr.TalkingToElementalTeacher=0
						return
					if("Yes, I want to blow my enemies away.")
						usr<<"[src]: Well answer me this."
						var/katonknow = input("[src]: 'I pass before the sun, yet make no shadow.'")
						if(findtext(katonknow, "Wind",1,0))
							usr<<"[src]: Very wise, I shall grant you the power of Fuuton."
							if(usr.ElementalPoints < 10)
								usr<<"[src]: I am afraid you are not capitable of learning the power of Fuuton."
								usr.Frozen = 0
								usr.TalkingToElementalTeacher=0
								return
							else
								usr<<"[src]: Your destiny will roar like the mighty winds."
								usr<<"[usr] has begin training the Fuuton Element"
								usr<<"[src]: Let's see how many Chakra Natures you have."
								var/count=0
								if(usr.FireE)
									count+=1
								if(usr.WaterE)
									count+=1
								if(usr.WindE)
									count+=1
								if(usr.EarthE)
									count+=1
								if(usr.LightningE)
									count+=1
								if(count == 0)
									usr<<"[src]: So this is your first element."
									sleep(5)
									usr<<"[src]: Now watch very closely."
									usr.Frozen = 1
									sleep(20)
									usr<<"[src]: Demonstrates Wind Chakra."
									var/image/I=image('Icons/Jutsus/FuutonTechniques.dmi',src,"Demonstrate Wind",5,SOUTH)
									usr<<I
									sleep(100)
									del(I)
									usr<<"[usr] has learned how to utilize Wind Chakra!"
									if(usr.Clan=="Kiro"||usr.Clan=="Shiroi")
										usr<<"[src]: You did well to make this your first element.."
										usr.ElementalPoints-=0
									else
										usr.ElementalPoints-=0
									usr.WindE=1
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
								else
									usr<<"[src]: How many other elements you have mastered"
								/*	if(usr.WaterE)
										if(usr.SuitonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Suiton and you expect to use Fuuton? Get some more Knowledge with Suiton!";return
									if(usr.FireE)
										if(usr.KatonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Katon and you expect to use Fuuton? Get some more Knowledge with Katon!";return
									if(usr.EarthE)
										if(usr.DotonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Doton and you expect to use Fuuton? Get some more Knowledge with Doton!";return
									if(usr.LightningE)
										if(usr.RaitonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Raiton and you expect to use Fuuton? Get some more Knowledge with Raiton!";return*/
									usr<<"[src]: Alright, let's teach you!";
									var/AmountofExp=50000;var/NinjutsuKnowledgeReq=0
									if(usr.WaterE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.LightningE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.EarthE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.WindE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.NinjutsuKnowledge<NinjutsuKnowledgeReq)
										usr<<"[src]: You do not meet the Ninjutsu Knowledge requirement for another element. You need [NinjutsuKnowledgeReq] Ninjutsu Knowledge to learn another element."
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
									if (usr.ElementalPoints > 10)
										usr.LearnJutsu("Wind Chakra",AmountofExp,"WindChakra","The Wind Chakra Nature is a powerful and dangerous chakra nature that allows the user to wield and perform Wind-based techniques. These techniques primarily hit health.","Ninjutsu")
										usr.ElementalPointDeduction = 10
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
									else
										usr<<"[src]: I am afraid you dont have the ability to learn this Element."
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
								usr.TalkingToElementalTeacher=0

	//Doton
	Doton_Earth_Master
		name = "Jaeger"
		CNNPC = 1
		health = 9999999999999999999
		Village = "Rock"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Shirt='Icons/New Base/Clothing/Shirt.dmi'
				Base+=rgb(235,145,52)
				Shirt+=rgb(0,0,0)
				src.icon=Base
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+=Shirt
				src.overlays-='Icons/New Base/Clothing/pants.dmi'
				src.overlays+='Icons/New Base/Clothing/pants.dmi'
				src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/soundoutfit.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"[src]: I am the one true Master of Doton in this land."
			usr.Frozen = 1
			if(usr.EarthE)
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(108,60,20)
				usr<<"[src]: What jutsu would you like to learn?"
				usr.Frozen=0
				return
			else if(usr.TalkingToElementalTeacher)
				if(!usr.Frozen)
					usr<<"Looks like we caught some bug abuse..."
					sleep(20)
					world<<"<b><font color=red><TT>Server: Caught [usr] in an attempt to gain multiple 'first' elements by unfreezing themselves and talking to another teacher while leaving the previous pop up open.</TT></font></b>"
					sleep(20)
					Bans:Add(usr.key)
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) The key [usr.key] has been Key-Banned by server.</font>"
					text2file("[time2text(world.realtime)]: [usr.key] was Key Banned by server for attempted bug abuse.<BR>","GMlog.html")
					BanSave()
					del(usr)
				else
					return
			else
				usr.TalkingToElementalTeacher=1
				switch(input(usr,"[src]: Do you wish to become a Apperentice of Doton?") in list ("Yes, I want to bury my enemies.","Other Elemental powers call me.."))
					if("Other Elemental powers call me..")
						usr<<"[src]: I see, your destiny is as cold as stone"
						usr.Frozen = 0
						usr.TalkingToElementalTeacher=0
						return
					if("Yes, I want to bury my enemies.")
						usr<<"[src]: Well answer me this."
						var/katonknow = input("[src]: 'I am foundation to all, yet I am number three. Without me you would fall, What am I?'")
						if(findtext(katonknow, "Earth",1,0))
							usr<<"[src]: Very wise, I shall grant you the power of Doton."
							if(usr.ElementalPoints < 10)
								usr<<"[src]: I am afraid you are not capitable of learning the power of Doton."
								usr.Frozen = 0
								usr.TalkingToElementalTeacher=0
								return
							else
								usr<<"[src]: Your future is written in stone."
								usr<<"[usr] has begin training the Doton Element"
								usr<<"[src]: Let's see how many Chakra Natures you have."
								var/count=0
								if(usr.FireE)
									count+=1
								if(usr.WaterE)
									count+=1
								if(usr.WindE)
									count+=1
								if(usr.EarthE)
									count+=1
								if(usr.LightningE)
									count+=1
								if(count == 0)
									usr<<"[src]: So this is your first element."
									sleep(5)
									usr<<"[src]: Now watch very closely."
									usr.Frozen = 1
									sleep(20)
									usr<<"[src]: Demonstrates Earth Chakra."
									src.dir=WEST
									src.DotonDorukiGaeshi()
									sleep(20)
									src.dir=SOUTH
									sleep(20)
									usr<<"[usr] has learned how to utilize Earth Chakra!"
									if(usr.Clan=="Iwazuka"||usr.Clan=="Kusakin"||usr.Clan=="Sabaku")
										usr<<"[src]: You did well to make this your first element.."
										usr.ElementalPoints-=0
									else
										usr.ElementalPoints-=0
									usr.EarthE=1
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
								else
									usr<<"[src]: How many other elements you have mastered"
								/*	if(usr.WaterE)
										if(usr.SuitonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Suiton and you expect to use Doton? Get some more Knowledge with Suiton!";return
									if(usr.WindE)
										if(usr.FuutonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Fuuton and you expect to use Doton? Get some more Knowledge with Fuuton!";return
									if(usr.FireE)
										if(usr.KatonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Katon and you expect to use Doton? Get some more Knowledge with Katon!";return
									if(usr.LightningE)
										if(usr.RaitonKnowledge<1000)
											usr<<"[src]: Woah wait, you haven't even mastered Raiton and you expect to use Doton? Get some more Knowledge with Raiton!";return
									usr<<"[src]: Alright, let's teach you!";*/
									var/AmountofExp=50000;var/NinjutsuKnowledgeReq=0
									if(usr.WaterE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.LightningE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.EarthE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.WindE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.NinjutsuKnowledge<NinjutsuKnowledgeReq)
										usr<<"[src]: You do not meet the Ninjutsu Knowledge requirement for another element. You need [NinjutsuKnowledgeReq] Ninjutsu Knowledge to learn another element."
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
									if (usr.ElementalPoints > 10)
										usr.LearnJutsu("Earth Chakra",AmountofExp,"EarthChakra","The Earth Chakra Nature is a powerful and dangerous chakra nature that allows the user to wield and perform earth-based techniques. These techniques primarily hit stamina.","Ninjutsu")
										usr.ElementalPointDeduction = 10
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
									else
										usr<<"[src]: I am afraid you dont have the ability to learn this Element."
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
								usr.TalkingToElementalTeacher=0

	//Raiton
	//Chidori Skill tree is on hold as well as gian
	Raiton_Lightning_Teacher
		name = "Levina"
		CNNPC = 1
		health = 9999999999999999999
		Village = "Sound"
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/KakashiH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(200,200,200)
				var/Shirt='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				Shirt+=rgb(61,100,60)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/pants.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+=Shirt
				src.overlays+=Hair
				src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"[src]: I am the one true Master of Raiton in this land."
			usr.Frozen = 1
			if(usr.LightningE)
				usr.client.perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
				usr.client.eye=locate(62,97,20)
				usr<<"[src]: What jutsu would you like to learn?"
				usr.Frozen=0
				return
			else if(usr.TalkingToElementalTeacher)
				if(!usr.Frozen)
					usr<<"Looks like we caught some bug abuse..."
					sleep(20)
					world<<"<b><font color=red><TT>Server: Caught [usr] in an attempt to gain multiple 'first' elements by unfreezing themselves and talking to another teacher while leaving the previous pop up open.</TT></font></b>"
					sleep(20)
					Bans:Add(usr.key)
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) The key [usr.key] has been Key-Banned by server.</font>"
					text2file("[time2text(world.realtime)]: [usr.key] was Key Banned by server for attempted bug abuse.<BR>","GMlog.html")
					BanSave()
					del(usr)
				else
					return
			else
				usr.TalkingToElementalTeacher=1
				switch(input(usr,"[src]: Do you wish to become a Apperentice of Raiton?") in list ("Yes, I want to zap my enemies .","Other Elemental powers call me.."))
					if("Other Elemental powers call me..")
						usr<<"[src]: I see, your destiny looks shockingly bad.."
						usr.Frozen = 0
						usr.TalkingToElementalTeacher=0
						return
					if("Yes, I want to zap my enemies .")
						usr<<"[src]: Well answer me this."
						var/katonknow = input("[src]: 'I am, in truth, a yellow fork, From tables in the sky, By inadvertent fingers dropped, The awful cutlery. Of mansions never quite disclosed, And never quite concealed, The apparatus of the dark, To ignorance revealed.?'")
						if(findtext(katonknow, "Lightning",1,0))
							usr<<"[src]: Very wise, I shall grant you the power of Raiton."
							if(usr.ElementalPoints < 10)
								usr<<"[src]: I am afraid you are not capitable of learning the power of Raiton."
								usr.Frozen = 0
								usr.TalkingToElementalTeacher=0
								return
							else
								usr<<"[src]: Your future is flashing brightly."
								usr<<"[usr] has begin training the Raiton Element"
								usr<<"[src]: Let's see how many Chakra Natures you have."
								var/count=0
								if(usr.FireE)
									count+=1
								if(usr.WaterE)
									count+=1
								if(usr.WindE)
									count+=1
								if(usr.EarthE)
									count+=1
								if(usr.LightningE)
									count+=1
								if(count == 0)
									usr<<"[src]: So this is your first element."
									sleep(5)
									usr<<"[src]: Now watch very closely."
									usr.Frozen = 1
									sleep(20)
									usr<<"[src]: Demonstrates Lightning Chakara."
									var/image/I=image('Icons/Jutsus/RaitonTechniques.dmi',src,"Demonstrate Lightning",5,SOUTH)
									usr<<I
									sleep(100)
									del(I)
									usr<<"[usr] has learned how to utilize Lightning Chakra!"
									if(usr.Clan=="Yotsuki")
										usr<<"[src]: You did well to make this your first element.."
										usr.ElementalPoints-=0
									else
										usr.ElementalPoints-=0
									usr.LightningE=1
									usr.Frozen = 0
									usr.TalkingToElementalTeacher=0
								else
									usr<<"[src]: How many other elements you have mastered"
									usr<<"[src]: Alright, let's teach you!";
									var/AmountofExp=50000;var/NinjutsuKnowledgeReq=0
									if(usr.WaterE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.LightningE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.EarthE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.WindE)
										AmountofExp+=50000;NinjutsuKnowledgeReq+=200
									if(usr.NinjutsuKnowledge<NinjutsuKnowledgeReq)
										usr<<"[src]: You do not meet the Ninjutsu Knowledge requirement for another element. You need [NinjutsuKnowledgeReq] Ninjutsu Knowledge to learn another element."
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
									if (usr.ElementalPoints > 10)
										usr.LearnJutsu("Lightning Chakra",AmountofExp,"LightningChakra","The Lightning Chakra Nature is a powerful and dangerous chakra nature that allows the user to wield and perform Lightning-based techniques. These techniques primarily hit health.","Ninjutsu")
										usr.ElementalPointDeduction = 10
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
									else
										usr<<"[src]: I am afraid you dont have the ability to learn this Element."
										usr.Frozen = 0
										usr.TalkingToElementalTeacher=0
										return
								usr.TalkingToElementalTeacher=0










