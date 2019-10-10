
var/TestingChuunin=0
var/list/ChuuninTesters=list()
mob/owner/verb/Test_Chuunin_Map()
	set name="Exame Chunin Nascional 1"
	set category="Comandos"
	TestingChuunin=1
	world<<"[usr]  est� testando um novo mapa para o exame chunin.! "
	for(var/mob/M in OnlinePlayers)
		M.verbs+=new/mob/ChuuninJoin/verb/TestChuuninStuff()
	spawn(300)
		for(var/mob/C in OnlinePlayers)
			C.verbs-=new/mob/ChuuninJoin/verb/TestChuuninStuff()
		for(var/mob/A in ChuuninTesters)
			ChuuninTesters-=A
			A.loc=locate(rand(5,12),rand(8,11),38)
			A.BoulderStrike=0
			A.TakingPartInChuunins=1
			A<<"Este � um mapa Beta para um novo logo para a 1� Fase Chuunin. Chegar ao fim sem ser atingido pelas pedras. A mais ousada vai imediatamente bat�-lo fora, por�m o bloqueio de um pedregulho s� vai empurr�-lo de volta. Torn�-lo at� o fim! "
mob/ChuuninJoin/verb/TestChuuninStuff()
	set name="Test Ajuda"
	set category="Comandos"
	if(TestingChuunin==0)
		usr<<"Nope.";return
	if(ChuuninTesters.len>=20)
		usr<<"Desculpa n�o tem pessoas suficiente para o teste.";usr.verbs-=new/mob/ChuuninJoin/verb/TestChuuninStuff();return
		TestingChuunin=0
	usr<<"Voc� ser� transportado para o local em breve."
	world<<"[usr] escolheu o Teste de Ajuda."
	ChuuninTesters+=usr
	return




mob/var/tmp/BoulderStrike=0
var
	WaitingRoom
	Chuunintime
	Chuunintime2
	Chuunintime1
	Chuuninexam
	list/Spectators = list()


obj
	TeaForestSound//Inb4MassLag
		icon='Icons/Jutsus/DotonTechniques.dmi'
		icon_state=""
		invisibility=100
		dir=SOUTH
		var/list/Inside = list()
		var/list/Listening = list()
		New()
			..()
			spawn()
				while(src)
					for(var/mob/C in oview(30,src))
						if(!(C in Inside))
							Inside+=C
					for(var/mob/M in Inside)
						if(!(locate(M in oview(30,src))))
							Inside-=M
							Listening-=M
						if(M.client)
							if(!(locate(M in Listening)))
								Listening+=M
								M<<sound('ForestOfTreant.mid',channel=7,volume=60)
					sleep(70)
	AutoBoulder
		icon='Icons/Jutsus/DotonTechniques.dmi'
		icon_state=""
		invisibility=100
		dir=SOUTH
		var/tai=1000
		var/EarthChakra=10
		var/BoulderCD=0
		New()
			..()
			spawn()
				while(src)
					sleep(150)
					BoulderCD=0
			//		world<<"15 Seconds has passed for the Auto Boulder Obj."
					if(prob(50)&&BoulderCD==0)
						BoulderCD=1
					//	world<<"A Dango has been set off!"
						var/obj/Jutsu/Elemental/Doton/BigDoton/K=new();
						K.ChuuninBoulder=1
						K.name="Boulder";K.dir=src.dir;
						K.Owner=src;K.Move_Delay=pick(0.3,0.5,1)
						K.JutsuLevel=1500000
						K.health=100000
						K.loc=src.loc;sleep(2);
						K.tai=src.tai;
						spawn(3)
							walk(K,src.dir)
			//	sleep(300)
			spawn(300)
				del(src)
	AutoBoulderSide
		icon='Icons/Jutsus/DotonTechniques.dmi'
		icon_state=""
		invisibility=100
		dir=WEST
		var/tai=1000
		var/EarthChakra=10
		New()
			..()
			spawn()
				while(src)
					sleep(125)
				//	world<<"15 Seconds has passed for the Auto Boulder Obj."
					if(prob(40))
					//	world<<"A Dango has been set off!"
						var/obj/Jutsu/Elemental/Doton/BigDoton/K=new();
						K.ChuuninBoulder=1
						K.name="Boulder";K.dir=src.dir;
						K.Owner=src;K.Move_Delay=pick(0.3,0.5,1)
						K.JutsuLevel=1500000
						K.health=100000
						K.loc=src.loc;sleep(2);
						K.tai=src.tai;
						spawn(3)
							walk(K,src.dir)
			//	sleep(300)
			spawn(300)
				del(src)


mob/var
	tmp/TakingPartInChuunins=0
mob/ChuuninJoin/verb/JoinChuunin()
	set category="Chuunin"
	set name="Entrar no Exame"
	if(usr.rank!="Genin")
		usr<<"Voc� n�o � um Genin!"
		usr.verbs-=new/mob/ChuuninJoin/verb/JoinChuunin()
	else
		usr.verbs-=new/mob/ChuuninJoin/verb/JoinChuunin()
		usr<<"Voc� embarcar para o pa�s do Ferro!"
		usr.TakingPartInChuunins=1
//		usr.loc=locate(0,0,0)
		sleep(50)
		usr.loc=locate(12,53,30)
		usr<<"Bem-vindo ao exame Chunin nacional. Espere pacientemente para iniciar o exame. "
		usr<<"<font color=red><font size=2>O Exame Chuunin � muito diferente agora, mas ainda � simples. Para o primeiro teste que voc� vai precisar para passar o essencial. Para o segundo teste, voc� ainda iria atrav�s da floresta da morte e tem que pegar os dois pergaminho. Depois de obter os dois pergaminhos voc� ser� teletransportado para Chuunin Arena do exterior um ref�gio para a 3� parte. N�o deve ser muito dif�cil."
		usr<<"<B>N�o saia do game durante Chuunin! se isso acontecer, Voc� estar� automaticamente fora dele, a menos que voc� sair enquanto a primeira parte ainda estiver coma�ando , e voc� teria que voltar! Tome nota deste!"
		usr<<"N�o use nenhum Jutsu de quaisquer tipos, enquanto na sala de espera ou submetidos na Parte 1 do Exame Chuunin. Voc� foi avisado."
mob/ChuuninJoin/verb/SpectateChuunin()
	set category="Chuunin"
	set name="Spectate Chuunin Exam"
	if(!(locate(usr in Spectators)))
		if(Spectators.len<=10)
			Spectators+=usr
			usr<<"Voc� escolheu assistir este Exame Chunin! se isso acontecer, Voc� estar� convocado para os bancos, quando a terceira parte come�ar!"
			return
		else
			usr<<"Todos os assentos dos espectadores j� foram tomados.";return
	else
		usr<<"Voc� j� est� indo para assistir!";return

mob/Kage
	verb
		Chuuninexam()
			var/WhichType=0
			set category = "Kage"
			set name = "Exame Chunnin"
			if(Chuunintime||Chuunintime2)
				usr<<"Um Exame Chunnin ja esta acontecendo.";return
			if(usr.z==1)
				if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
					usr<<"Voc� n�o � capaz de fazer um, enquanto trancado na pris�o!"
					return
			var/count=0
			for(var/mob/M in OnlinePlayers)
				if(M.client&&M.rank=="Genin")
					count++
			if(count<20)
				usr<<"Voc� precisa ter pelo menos 20 Genin em iniciar um chuunin!";return
			var/LeafVillageCount=0
			var/RockVillageCount=0
			var/SoundVillageCount=0
			var/RainVillageCount=0
			for(var/mob/M in OnlinePlayers)
				if(M.client&&M.rank=="Genin"&&M.Village=="Leaf")
					LeafVillageCount++
			for(var/mob/M in OnlinePlayers)
				if(M.client&&M.rank=="Genin"&&M.Village=="Rock")
					RockVillageCount++
			for(var/mob/M in OnlinePlayers)
				if(M.client&&M.rank=="Genin"&&M.Village=="Rain")
					RainVillageCount++
			for(var/mob/M in OnlinePlayers)
				if(M.client&&M.rank=="Genin"&&M.Village=="Sound")
					SoundVillageCount++
			WaitingRoom=1
			if(LeafVillageCount<3||RockVillageCount<3||SoundVillageCount<3||RainVillageCount<3)
				usr<<"Voc� precisa de pelo menos 3 Genin em cada aldeia para iniciar um chuunin!";return
			if(!Chuunintime&&!Chuunintime2)
				usr.loc=locate(15,42,30)
				world<<"<font size=3><font color=red>A Exame Chuunin est� sendo organizado no Pa�s do Ferro exterior em um ref�gio! Se voc� quer se juntar a ele sendo Genin voc� vera uma guia para se juntar a ele. Voc� tem 10 minutos!"
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin")
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
//				world<<"<b>If you wish to watch Chuunin exams go to the Exam room and talk to the ticket guy!"
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"Voc� ainda pode participar do Exame Chunnin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 9 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 8 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 7 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 6 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 5 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 4 minutos."
				sleep(230)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 3 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 2 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 1 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					M.verbs-=new/mob/ChuuninJoin/verb/JoinChuunin()
					M.verbs-=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>O Exame Chuunin come�ou agora! Os competidores est�o passando pela primeira parte atualmente!"
			//	WhichType=pick(1,2)
				WhichType=1
				Chuunintime=1
				usr<<"Eles est�o agora a passar pela primeira parte"
				WaitingRoom=0
				for(var/mob/M in OnlinePlayers)
					if(M.TakingPartInChuunins==1)
						M.loc=locate(1,187,32)
						M<<"<b><font color=red>Bem-vindo � 1� Parte do exame! Esta parte � severamente f�cil e um teste de agilidade e resist�ncia para um Ninja. O ponto deste teste � para faz�-lo atrav�s dos obst�culos para a outra regi�o. De cabe�a para baixo, mas � claro que h� um caminho. Como um ninja, voc� deve ser capaz de passar por obst�culos e encontrar o seu caminho em um limite de tempo moderado. Voc� tem 3 minutos!"
				sleep(1100)
				world<<"A primeira parte do Exame Chunnin acabou!"
				for(var/mob/M in OnlinePlayers)
					if(M.TakingPartInChuunins==1)
						M<<"Voc� falhou na primeira parte."
						spawn() M.GotoVillageHospital()
						M.TakingPartInChuunins=0
				Chuunintime=0



				//This Is the Classic Get the Scrolls Second Part of the Chuunin Exam


				sleep(30)
				if(WhichType==1)
					var/heavenorearth=0
					spawn() for(var/mob/M in OnlinePlayers)
						if(M.TakingPartInChuunins==2)
							if(heavenorearth==0)
								var/obj/heavenscroll/H=new();H.loc=M;M.loc=locate(97,187,37)//M.loc=locate(88,192,31)
								heavenorearth=1
							else
								var/obj/earthscroll/E=new();E.loc=M;M.loc=locate(82,8,37)//M.loc=locate(94,1,31)
								heavenorearth=0
							M<<"Voc� passou naa primeira parte do Exame Chunnin!"
							sleep(2)
					world << "<b><font color = red>Chuunin exame parte 2 j� come�ou! Os competidores t�m 10 minutos para obter ambos os pergaminhos!"
					usr.loc=locate(154,85,32)
					usr<<"Nota :: A arena � bem abaixo de voc�. Use Ajuste Chuunin competidores quando a luta come�ar."
					for(var/mob/M in OnlinePlayers)
						if(M.z==30)
							M<<"<b><font color=red>Nota: Sempre que algu�m � nocauteado, eles v�o cair imediatamente o pergaminho que est� segurando o que voc� pode pegar e levar os dois pergaminios para a torre no centro�. Voc� n�o tem que matar. Al�m disso, toda a gente do seu time tem o mesmo pergaminho como voc�, ent�o tente n�o lutam entre si."
					Chuunintime2=1
					sleep(3000)
					for(var/mob/M in OnlinePlayers)
						//if(M.z==31)
						if(M.z==37)
							M<<"<b><font color=red>5 minutos para o fim!"
					sleep(2400)
					for(var/mob/M in OnlinePlayers)
					//	if(M.z==31)
						if(M.z==37)
							M<<"<b><font color=red>1 minuto para o fim!"
					sleep(600)
					world << "<b> Chunin Parte 2 acabou! Agora as partidas come�ar�o."
					spawn() for(var/mob/P in OnlinePlayers)
						if(P.client&&P.z==37)//P.z==31)
							P<<"Voc� n�o conseguiu obter os dois pergaminhos, e assim voc� falhou na parte 2."
							spawn() P.GotoVillageHospital()
							P.TakingPartInChuunins=0

				//This is a new part I want to test; Forest Of Death, literally.

				if(WhichType==2)
			//		var/list/SecondPartDeath
					SecondPartDeath = list()
					var/SecondPartInitialAmount=0
					spawn()
						for(var/mob/M in OnlinePlayers)
							if(M.TakingPartInChuunins==2)
								SecondPartDeath.Add(M)
								M.loc=locate(88,192,31)
								M<<"Voc� passou da primeira parte do Exame Chuunin!"
						//		sleep(2)
					SecondPartInitialAmount=round(SecondPartDeath.len/2)
					world << "<b><font color = red>Chuunin exame parte 2 j� come�ou! Os competidores t�m 10 minutos para lutar at�, no m�ximo [SecondPartInitialAmount] Ninja permanecerem vivos!!"
					usr.loc=locate(154,85,32)
					usr<<"Nota :: A arena � bem abaixo de voc�. Use Ajuste Chuunin competidores quando a luta come�ar."
					for(var/mob/O in SecondPartDeath)
						O<<"<b><font color=red>Note:Os ultimos ninjas [SecondPartInitialAmount] est�o de p� vivo s�o vitoriosos e pode continuar a matar uns aos outros, ou esperar at� que o tempo se esgote e ir para a parte 3."
					Chuunintime2=1
					sleep(3000)
					for(var/mob/P in SecondPartDeath)
						P<<"<b><font color=red>5 Minutos Para Acabar!"
					sleep(2400)
					for(var/mob/Q in SecondPartDeath)
						Q<<"<b><font color=red>1 Minuto Para Acabar!"
					sleep(600)
					world << "[SecondPartDeath.len] permanecem vivos na Floresta da Morte!"
	//				sleep(20)
					if(SecondPartDeath.len>SecondPartInitialAmount)
						for(var/mob/P in SecondPartDeath)
							if(P.client&&P.z==31)
								world<<"Havia mais de [SecondPartInitialAmount] deixados vivos. Todos os competidores do exame Chuunin Falharam!"
								P<<"Havia mais de [SecondPartInitialAmount] deixados vivos. Todos os competidores do exame Chuunin Falharam!"
								P.GotoVillageHospital()
								P.TakingPartInChuunins=0
					else
						for(var/mob/Survivors in SecondPartDeath)
							Survivors.loc = locate(154,85,32)
							SecondPartDeath.Remove(Survivors)
							Survivors << "Prepare-se para os jogos! H� um concess�o suporte para o canto inferior direito com bebidas e armas para voc� se reabastecer."
							world << "[Survivors] has passed chuunin exam part 2!"
				Chuunintime2=0
				usr<<"<b><font size = 2>Use o verbo Colocar Chunin na Luta em seu pessoal para escolher duas pessoas para lutar. O mundo vai ser informado quando um ganhar, apenas convocara o vencedor de volta a voc�."
				usr<<"N�o sair do game durante este processo, caso contr�rio, voc� n�o ser� capaz de continuar a Chuunin sem a ajuda de um GM."
				usr.verbs+=new/mob/Admin/verb/SetChuuninContestant()
				usr.verbs+=new/mob/Admin/verb/MakeChuunin()





mob/owner
	verb
		Chuuninexam()
			set category = "Staff"
			set name = "Exame Chunnin"
			if(!Chuunintime&&!Chuunintime2)
				usr.loc=locate(15,42,30)
				world<<"<font size=3><font color=red>A Exame Chuunin est� sendo organizado no Pa�s do Ferro exterior em um ref�gio! Se voc� quer se juntar a ele sendo Genin voc� vera uma guia para se juntar a ele. Voc� tem 10 minutos!"
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin")
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"Voc� ainda pode participar do Exame Chunnin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 9 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 8 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 7 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 6 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 5 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 4 minutos."
				sleep(230)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 3 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 2 minutos."
				sleep(250)
				for(var/mob/M in OnlinePlayers)
					if(M.client&&M.rank=="Genin"&&M.TakingPartInChuunins==0)
						M.verbs+=new/mob/ChuuninJoin/verb/JoinChuunin()
						M<<"You can still join the Chuunin!"
					if(M.client&&(M.rank=="Chuunin"||M.rank=="S.Jounin"||M.rank=="Jounin"))
						M.verbs+=new/mob/ChuuninJoin/verb/SpectateChuunin()
				world<<"<font size=3><font color=red>Haver� um exame Chuunin em 1 minutos."
				sleep(250)
				for(var/mob/M in world)
					M.verbs-=new/mob/ChuuninJoin/verb/JoinChuunin()
				world<<"<font size=3><font color=red>O Exame Chuunin come�ou agora! Os competidores est�o passando pela primeira parte atualmente!"
				Chuunintime=1
				usr<<"Eles est�o agora a passar pela primeira parte"
				for(var/mob/M in world)
					if(M.TakingPartInChuunins==1)
						M.loc=locate(1,187,32)
						M<<"<b><font color=red>Bem-vindo � 1� Parte do exame! Esta parte � severamente f�cil e um teste de agilidade e resist�ncia para um Ninja. O ponto deste teste � para faz�-lo atrav�s dos obst�culos para a outra regi�o. De cabe�a para baixo, mas � claro que h� um caminho. Como um ninja, voc� deve ser capaz de passar por obst�culos e encontrar o seu caminho em um limite de tempo moderado. Voc� tem 3 minutos!"
				sleep(1100)
				world<<"A primeira parte do Exame Chunnin acabou!"
				for(var/mob/M in world)
					spawn()
						if(M.TakingPartInChuunins==1)
							M<<"Voc� falhou na primeira parte."
							spawn() M.GotoVillageHospital()
							M.TakingPartInChuunins=0
				Chuunintime=0
				sleep(30)
				var/heavenorearth=0
				spawn() for(var/mob/M in world)
					if(M.TakingPartInChuunins==2)
						if(heavenorearth==0)
							var/obj/heavenscroll/H=new();H.loc=M;M.loc=locate(rand(70,111),rand(170,191),37)
							heavenorearth=1
						else
							var/obj/earthscroll/E=new();E.loc=M;M.loc=locate(rand(130,173),rand(2,26),37)
							heavenorearth=0
						M<<"Voc� passou naa primeira parte do Exame Chunnin!"
						sleep(2)
				world << "<b><font color = red>Chuunin exame parte 2 j� come�ou! Os competidores t�m 10 minutos para obter ambos os pergaminhos!"
				usr.loc=locate(154,85,32)
				for(var/mob/C in Spectators)
				//	spawn()
					C.loc=locate(116,36,32)
					Spectators-=C
				usr<<"Use o verbo Colocar Chunin na Luta em seu pessoal para escolher duas pessoas para lutar. O mundo vai ser informado quando um ganhar, apenas convocara o vencedor de volta a voc�."
				for(var/mob/M in world)
					if(M.z==37)
						M<<"<b><font color=red>Note: Nota: Sempre que algu�m � nocauteado, eles v�o cair imediatamente o pergaminho que est� segurando o que voc� pode pegar e levar os dois pergaminios para a torre no centro�. Voc� n�o tem que matar. Al�m disso, toda a gente do seu time tem o mesmo pergaminho como voc�, ent�o tente n�o lutam entre si."
				Chuunintime2=1
				sleep(3000)
				for(var/mob/M in world)
					if(M.z==37)
						M<<"<b><font color=red>5 Minutos Restantes para o final do exame!"
				sleep(2400)
				for(var/mob/M in world)
					if(M.z==37)
						M<<"<b><font color=red>1 Minuto Restando para o final do exame!"
				sleep(600)
				world << "<b> Chunin Parte 2 acabou! Agora as partidas come�ar�o."
				spawn()
					for(var/mob/P in world)
						spawn()
							if(P.client&&P.z==31)
								P<<"Voc� n�o conseguiu obter os dois pergaminhos, e assim voc� falhou na parte 2."
								spawn() P.GotoVillageHospital()
								P.TakingPartInChuunins=0
				Chuunintime2=0
				usr<<"<b><font size = 2>Use o verbo , colocar na arena chunin para os que passarao lutar , assim o mundo vai poder ve-los lutando."









turf/chuunin22
	density=0
	Enter(A)
		if(CurrentEvent=="Kill The Assassin")
			return
		else if(ismob(A))
			var/mob/M=A
			if(M.client)
				if(M.rank!="Genin")
					M<<"O que voc� est� fazendo, voc� n�o est� no rank Genin!"
					M.GotoVillageHospital()
					M.TakingPartInChuunins=0
				if(M.TakingPartInChuunins==1)
					M.loc=locate(15,42,30)
					M<<"Voc� passou no exame chunin Chunin!"
					M<<"Espere com paciencia ate o tempo acabar para come�ar a proxima parte."
					M.TakingPartInChuunins=2


turf
	chuunin2
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				if(M.client)
					var/Z=0;var/ZX=0
					for(var/obj/heavenscroll/H in M.contents)
						Z=1
					for(var/obj/earthscroll/E in M.contents)
						ZX=1
					if(Z&&ZX&&Chuunintime2)
						M.loc = locate(154,85,32)
						for(var/obj/earthscroll/E in M.contents)
							del(E)
						for(var/obj/heavenscroll/H in M.contents)
							del(H)
						world << "[M] Passou no Exame Chunnin parte 2!"
						M << "Prepare-se para os jogos! H� uma loja que fica no canto inferior direito com bebidas e armas para reabastecer."

					else if(Chuunintime2)
						alert(M,"Voc� precisa encontrar o outro pergaminho.")
					else
						M << "As partidas come�aram."
						for(var/obj/earthscroll/E in M.contents)
							del(E)
						for(var/obj/heavenscroll/H in M.contents)
							del(H)
						M.GotoVillageHospital()
						return
			if(istype(A,/obj/)) del(A)



obj
	earthscroll
		name = "Pergaminio da Terra"
		icon = 'scrolls.dmi'
		icon_state = "6"
		verb
			Get()
				set src in oview(1)
				var/AX=0
				var/MobCheck=0
				if(CurrentEvent!="")
					usr<<"Voc� n�o pode pegar isso agora.";return
				for(var/mob/M in view(3,src))
					if(M!=usr&&!M.knockedout&&!M.Dead&&M.client)
						MobCheck=1
				if(MobCheck)
					usr<<"Voc� n�o pode pegar voc� esta vendo!";return
				for(var/obj/earthscroll/A in usr.contents)
					AX=1
				if(AX)
					usr<<"Voc� ja tem o Pergaminio da Terra!";return
				else
					src.loc = usr
					usr<<"Voc� pegou [src]"

			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
			Destroy()
			 set hidden = 1
			 del(src)
obj
	heavenscroll
		name = "Pergaminio do Ceu"
		icon = 'scrolls.dmi'
		icon_state = "7"

		verb
			Get()
				set src in oview(1)
				var/AX=0
				var/MobCheck=0
				for(var/mob/M in view(3,src))
					if(M!=usr&&!M.knockedout&&!M.Dead&&M.client)
						MobCheck=1
				if(MobCheck)
					usr<<"Voc� n�o pode pegar voc� esta vendo!";return
				if(CurrentEvent!="")
					usr<<"Voc� n�o pode pegar isso agora.";return
				for(var/obj/heavenscroll/A in usr.contents)
					AX=1
				if(AX)
					usr<<"Voc� ja tem o Pergaminio do Ceu!";return
				else
					src.loc = usr
					usr<<"Voc� pegou [src]"

			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
			Destroy()
			 set hidden = 1
			 del(src)