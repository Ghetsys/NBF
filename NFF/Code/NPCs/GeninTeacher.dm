mob/var/tmp/alreadytalkingtohim=0
//Leaf
mob/NPC/RandomNPCs/LeafVillagers/Academy
	Principle
		name="Principle(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Hair/SpikeyH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
		//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
		//			color:white;}</style>"
				if(usr.TimeToAttack<20)
					sd_Alert(usr, "Eu vejo que est� aprendendo bem.","[src]")//,,,,0,"400x150",,style);return
				else
					sd_Alert(usr, "Se voc� estiver pronto para virar um genin,deveria fazer o exame!","[src]")//,,,,0,"400x150",,style)
					return

	GymTeacher1
		name="Gym Teacher: Kado(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
			//	var/style = "<style>BODY {margin:0;font:arial;background:black;\
			//		color:white;}</style>"
				if(usr.TimeToAttack==0)
					sd_Alert(usr, "Ah carne fresca! Eu amo ve-las! Voc� poder� bater nelas. Voc� pode socar pressionando A ou S. Se voc� aperta A voc� irar socar com a m�o esquerda e se voc� pressionar com S irar socar com a direita!","[src]")//,,,,0,"400x150",,style)
					usr.client.screen+=new/obj/Effects/ASMash
					usr.TimeToAttack=1;return
				if(usr.TimeToAttack==1)
					sd_Alert(usr, "Vamos l�! N�o � t�o dificil eu sei que voc� consegue!","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==2)
					sd_Alert(usr, "Bom! Esse foi um belo soco!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Agora eu preciso que voc� chute!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Chutar � mais simples que socar. � so pressionar D que voc� poder� chutar.","[src]")//,,,,0,"400x150",,style)
					usr.client.screen+=new/obj/Effects/DMash
					usr.TimeToAttack=3;return
				if(usr.TimeToAttack==3)
					sd_Alert(usr, "Tendo dificuldades?","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==4)
					sd_Alert(usr, "Ah bom! As 3 formas de combates de taijutsu. Voc� poder� fazer combos se voc� for bom o suficiente com taijutsu. Diferentes tipos de luta poder� fazer diferentes promo��es de combos.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Agora, precisamos avan�ar para Corrida. Correr tamb�m � outra coisa simples de fazer. Tudo que voc� precisa fazer � pressionar Correr abaixo na interface. Se voc� continuar andando, n�o se preocupe, voc� vai lentamente come�ar a aumentar a velocidade. Fale comigo de novo uma vez que voc� atingir a velocidade m�xima.","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=5;return
				if(usr.TimeToAttack==5)
					sd_Alert(usr, "Voc� me parece um poco lento. PorFavor n�o me diga que est� correndo.","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==6)
					sd_Alert(usr, "Ah bom. Agora vamos abrandar um pouco para algo um pouco mais! Vamos tentar algo mais defensiva! Mostre-me sua posi��o de guarda!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Bloquear � feito pressionando X. Quando voc� soltar X voc� vai parar de bloquear. Guarda tamb�m pode ser usado para desviar efetivamente um alvo, por rapidamente liber�-lo voc� vai esquivar de um ataque de combate corpo-a-corpo instantaneamente. Quando guardando-reduz o dano de ataques f�sicos baseados.","[src]")//,,,,0,"400x150",,style);usr.client.screen+=new/obj/Effects/XMash
					usr.TimeToAttack=7;return
				if(usr.TimeToAttack==7)
					sd_Alert(usr, "Bem?Onde est� o seu bloqueio?","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==8)
					sd_Alert(usr, "Isso � uma boa posar ali mesmo. Espero que o seu chakra � t�o feroz tamb�m, me mostre o que voc� tem!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Voc� pode carregar chakra pressionando Z.","[src]")//,,,,0,"400x150",,style)
					usr.client.screen+=new/obj/Effects/ZMash
					usr.TimeToAttack=9;return
				if(usr.TimeToAttack==9)
					sd_Alert(usr, "Bem?Chakra?","[src]")//,,,,0,"400x150",,style);
					return
				if(usr.TimeToAttack>=10)
					sd_Alert(usr, "Bom trabalho!Eu realmente amo novatos bons!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Eu sugiro que voc� olhe em torno de alguns lugares, se voc� quiser aprender algumas coisas. Voc� pode querer aprender sobre Jutsu e como eles funcionam antes de avan�ar.","[src]")//,,,,0,"400x150",,style);
					return
	GymTeacher2
		name="Teacher: Kaylo(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Hair/leeH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"

				if(usr.TimeToAttack>=10)
					sd_Alert(usr, "Ol�! Yo yo! Estou aqui para te ensinar sobre jutsu!","[src]",,,,0,"400x150",,style)
					var/list/buttons = list("O que � Jutsu? "," O que � uma forma de Transforma��o? "," O que � uma transforma��o da natureza? "," Quais s�o os Chakra naturezas? "," Como fa�o para obter Chakra naturezas? "," Posso aprender mais do que um chakra Natureza? "," Cancelar")
					var/A = sd_Alert(usr, "O que voc� gostaria de aprender?","[src]", buttons, pick(buttons),0,0,"600x200",,style,4,2)
					if(A=="O que � jutsu?")
						sd_Alert(usr, "Jutsu s�o t�cnicas Ninja Disciplina. Existem 3 tipos principais de jutsu: Taijutsu, Ninjutsu e Genjutsu.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "T�cnicas de taijutsu s�o t�cnicas de combate corpo-a-corpo. Eles utilizaram t�cnicas baseadas artes-marciais, basicamente, onde o usu�rio poderia utilizar combate f�sico em prejudicar o inimigo. Eles est�o praticamente close-variou mas h� exce��es para tudo! Eles est�o geralmente baseado em seu status de Physique.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "T�cnicas de Ninjutsu s�o praticamente como chakra. Eles utilizam chakra para criar ataques e t�cnicas como sopro de fogo. Eles est�o t�cnicas de longa dist�ncia. Seu dano � normalmente baseado fora da intensidade do chakra em seu corpo ou como chamamos a sua capacidade.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "T�cnicas de Genjutsu � algo um pouco diferente. Estas t�cnicas s�o t�cnicas de ilus�o que afetam a mente do oponente. Eles trabalham por corromper o fluxo de chakra do oponente com seu pr�prio fluxo de chakra e corrompendo o que v�em o que permite f�cil de assassinato, mas uma estrat�gia horr�vel quando lutando sozinho. Eles s�o baseados fora de seu controle para utilizar o Genjutsu..","[src]")//,,,,0,"400x150",,style)

					else if(A=="O que � uma forma de Transforma��o?")
						sd_Alert(usr, "Forma de Transforma��o � uma forma avan�ada de controle de chakra usado principalmente para a cria��o de novo jutsu e t�cnicas. Ele muda a forma e movimento do chakra determinar o tamanho, alcance e finalidade do jutsu. Forma Manipula��o � diferente da Natureza Manipulation como Nature Manipula��o realmente muda a natureza do chakra para criar jutsu mais avan�ado. Alguns ninja pode utilizar tanto a forma e natureza Manipula��o para fazer t�cnicas muito interessantes.","[src]")//,,,,0,"400x150",,style)

					else if(A=="O que � uma transforma��o da natureza?")
						sd_Alert(usr, "Transforma��o da natureza se aplica a um elemento para o chakra permitindo que o usu�rio realmente mudar a natureza de um chakra, alterando suas propriedades e caracter�sticas..","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Existem 5 tipos de Transforma��es basicas� notado como o 5 Chakra naturezas. Estes cinco tipos s�o o fundamento de toda jutsu Elemental.","[src]")//,,,,0,"400x150",,style)

					else if(A=="O que � chakra natural?")
						sd_Alert(usr, "..","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "T�cnicas da Terra s�o fortes contra as t�cnicas de �gua, uma vez que suga toda a �gua, mas � fraco pelos ataques penetrantes Relampagos. Terra � considerada uma das defesa mais fortes e as suas t�cnicas n�o s�o totalmente �timo para ofensiva, mas �timo para t�cnicas defensivas e suplementares.","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "T�cnicas de �gua s�o fortes contra as t�cnicas de lan�amento de fogo como a �gua apaga as chamas, mas � fraco contra t�cnicas Terra considerando a terra absorve a �gua. T�cnicas de �gua � um bem forte natureza chakra, considerando seus usos vers�teis permitindo ao usu�rio fazer praticamente qualquer coisa com ele, considerando a manipula��o forma f�cil com �gua, mas ela atinge principalmente fisicamente a Energia ..","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "T�cnicas de fogo s�o fortes contra T�cnicas de vento como combust�veis de vento as chamas de fogo, mas � fraco contra t�cnicas de �gua, considerando a �gua coloca-lo para fora. T�cnicas de fogo s�o basicamente o mesmo em todas as formas, lan�ando chamas da boca do usu�rio ou outras partes do corpo para fins ainda mais avan�adas, mas eles normalmente v�m da boca do usu�rio. T�cnicas de Fogo de lan�amento s�o perigosas para a sua resist�ncia e vitalidade como queima e pode causar ferimentos graves.","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "T�cnicas de vento s�o fortes contra T�cnicas rel�mpago como o vento dispersa as acusa��es, mas ele � fraco contra as t�cnicas de lan�amento de fogo, considerando que aumenta a for�a do Fogo. T�cnicas de lan�amento de vento s�o considerados os mais fortes, ofensiva chakra natureza porque o vento pode ser moldada para ser t�o n�tida e mais fina poss�vel, como uma l�mina. Eles normalmente acertar a vitalidade, mas em muitos casos T�cnicas de vento pode atingir a resist�ncia por causa de ser mera press�o Chakra.","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "T�cnicas de raiton � mais forte contra t�cnicas de doton desde que o elemento penetre na doton, mas � fraco contra t�cnicas de Fuuton desde que o vento dispersa as acusa��es. Raiton aumenta as vibra��es de alta frequ�ncia de chakra do usu�rio criando um raio. Eles s�o t�cnicas que permitem at� mesmo efeitos penetrantes que atingiram diretamente para a vitalidade, ou at� mesmo causando paralisa��o atrav�s impressionante movimento r�pido. � comumente infundido em armas para permitir nitidez mais forte atrav�s da vibra��o..","[src]")//,,,,0,"400x150",,style)

					else if(A=="Como eu pego esses chakras?")
						sd_Alert(usr, "Todo mundo tem uma afinidade para uma natureza chakra. Essa caracter�stica � gen�tica, considerando alguns Cl�s pode nascer com um certo tipo de Chakra natureza, por exemplo: Uchiha nasce com katon..","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Se voc� quiser descobrir o seu Affinity voc� vai ter que colocar o seu chakra em papel Chakra. O Livro Chakra responder� baseado fora de sua base de dados de Afinidade.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Se o papel queimar, voc� tem Chakra elemental de Fogo. Se o papel ficar molhado, voc� tem Chakra elemental de Agua. Se o papel se desintegra-se, voc� tem Chakra elemental de R�lampago. Se o papel se transforma em terra, voc� tem Chakra elemental de Terra. E se o papel rasga em dois, voc� tem Chakra elemental de Vento.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Dom�nio de uma natureza de chakra leva tempo para dominar, mesmo se a sua base de afinidade � o chakra natureza..","[src]")//,,,,0,"400x150",,style)
					else if(A=="Posso aprender mais de Chakra Natural?")
						sd_Alert(usr, "Sim, para a maioria das pessoas que voc� pode aprender mais de um Chakra Natural embora haja alguns casos em que � simplesmente imposs�vel. A maioria dos Shinobi s�o capazes de dominar pelo menos duas naturezas de Chakra e at� tr�s, se eles s�o uma marca de elite de Shinobi. Todo mundo nasce com uma quantidade natural de natureza de chakra voc� pode aprender simplesmente porque � t�o dif�cil. Se voc� atingir a quantidade m�xima de natureza de chakra que voc� pode aprender , voc� simplesmente n�o ser� capaz de aprender mais..","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Voc� n�o pode aprender outro elemento at� voc� masterializar seu 1 elemento, o que � quando sua inteligencia do elemento chega a 1000..","[src]")//,,,,0,"400x150",,style)



				else
					sd_Alert(usr, "Voc� deveria falar com o outro professor de ginastica! Haha.","[src]")//,,,,0,"400x150",,style)
					return
	GymTeacher3
		name="Gym Teacher: Radon(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Hair/MadaraH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
		//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
		//			color:white;}</style>"
				if(usr.TimeToAttack==10)
					sd_Alert(usr, "Ei aqui.Estou aqui para lhe ensinar sobre armas.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Armas s�o facil de usar,confie em mim s�o faceis! Primeiro voc� tem que equipar a arma na sua m�o esquerda ou direita. Eu lhe dei uma kunai, veja seu inventorio ao clicar no inventorio em cima no canto direito e ent�o equipe ela em uma das m�os para come�ar a treinar.","[src]")//,,,,0,"400x150",,style)
					var/counter=0
					for(var/obj/WEAPONS/Kunai/O in usr.contents)
						counter+=1
					if(counter<=0)
						var/obj/WEAPONS/Kunai/B=new()
						B.loc = usr
						B.ammount=1
						B.name= "[B.name] ([B.ammount])"
					usr.TimeToAttack=11
					return
				if(usr.TimeToAttack==11)
					sd_Alert(usr, "Vamos l� equipe a arma em sua m�o,n�o � t�o perigoso..","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==12)
					sd_Alert(usr, "Bom. Agora voc� precisa pegar ela. Voc� pode pegar a arma pressionando Q ou E. Quando aperta Q voc� pega a arma com a m�o esquerda. Quando voc� pega uma arma voc� pode usa-la em combate, ent�o voc� podera usar sua arma com seu ataque physical.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Voc� pega a arma.","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=13
					return
				if(usr.TimeToAttack==13)
					sd_Alert(usr, "Vamos l� voc� n�o ira se machucar. Pegue a arma pressionando Q ou E..","[src]")//,,,,0,"400x150",,style);return

				if(usr.TimeToAttack==14)
					sd_Alert(usr, "Bom. Agora tente pegar uma arma e taca-la. � realmente facil. Para jogar a arma aperte os bot�es correspondentes. Se voc� equipar a arma na m�o direita voc� ter� que tacar com a m�o direita. Se voc� equipar com a esquerda tera de tacar com a esquerda.Vamos l� � realmente facil!","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=15
					return
				if(usr.TimeToAttack==15)
					sd_Alert(usr, "Vamos l� � facil. Use o bot�o da m�o esquerda ou direita.","[src]")//,,,,0,"400x150",,style);return

				if(usr.TimeToAttack==16)
					sd_Alert(usr, "Bom trabalho. Parece que voc� entende como utilizar armas agoar. Quando se trata de armas de arremesso usando esses bot�es vai jogar as armas, mas quando se trata de armas de curto alcance, como a katana, eles tem primeiramente o mesmo sistema.","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=17
					return

				sd_Alert(usr, "Bom trabalho. Fique aprendendo voc� est� fazendo certo!","[src]")//,,,,0,"400x150",,style)
	GymTeacher4
		name="Teacher: Statis(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Hair/JiraiyaH2.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"

				sd_Alert(usr, "Hey I'm here to teach you about your stats and how they affect combat?","[src]")//,,,,0,"400x150",,style)
				var/list/buttons = list("What is my Vitality?","What is my Chakra?","What is Stamina?","What are Calories?","How do I deal with Damage?","I'm Hungry/Thirsty, what do I do?","How do I increase my Health/Chakra/Stamina?","How do I level up?","What is a Passive?","How do I increase my passives?","Cancel")
				var/A = sd_Alert(usr, "What would you like to know?","[src]", buttons, pick(buttons),0,0,"600x200",,style,4,2)
				if(A=="What is Vitality?")
					sd_Alert(usr, "Vitality is your Health. If this reaches 0 you are knocked out. When your Stamina is full your Vitality will restore though, on the bright side.","[src]")//,,,,0,"400x150",,style)
				else if(A=="What is Chakra?")
					sd_Alert(usr, "Your Chakra is your energy source that allows to create Ninjutsu techniques and even genjutsu techniques. If you try to use a technique without any chakra normally it'll overstress it and pull straight from your stamina.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Don't fret though. Even without chakra you can still get it back by charging with Z. Charging your chakra takes straight from your Chakra Resevoir. Your chakra Resevoirs are basically like tanks allowing you to refill your chakra out from this resevoir. To replenish your resevoir you can eat or rest.","[src]")//,,,,0,"400x150",,style)
				else if(A=="What is Stamina?")
					sd_Alert(usr, "Stamina is your basic energy. Your stamina is required to do simple tasks and is primarily used for attacking. When hit with physical attacks normally they hit Stamina first. Once your Stamina reaches 0 it'll begin to hurt your Vitality directly so try to keep that in mind. Your stamina recovers on your own as long as you have calories.","[src]")//,,,,0,"400x150",,style)
				else if(A=="What are Calories?")
					sd_Alert(usr, "Calories are a source of energy utilized for Stamina. Normally all actions will take up Stamina but if you have calories they'll take up Calories first. Also without any calories you won't be able to regenerate. Eating and Drinking is a big part of keeping healthy and normally healthy foods consists of tons of healthy calories. Try to keep a moderate amount of calories at least, remember to occassionally eat because you can't see them so you can't be sure.","[src]")//,,,,0,"400x150",,style)

				else if(A=="How do I deal with Damage?")
					sd_Alert(usr, "<b>Part of being a ninja is understand you can get hurt.</b> No one is invincible, but some others are better at things than others. A lot of these things are pure genes. Everyone is born with a maximum of 1500 Vitality, while others are born with Chakra levels ranging from 1,000 to 10,000 and Stamina levels ranging from 1,000 to 7,000. But as you grow your Stamina increases along with your Chakra until you reach your decline age, which is normally 60.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "You won't be able to know how much of a stat you have but you can know how much of a percentage of that stat is left.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "With that you must understand which techniques would attack what Stat. It's very basic. Physical attacks would hit Stamina first, as Physical attacks can be endured but if deadly enough it can hit your Vitals..","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Attacks that are meant to hit the vitals or organs directly, such as Lightning or Sharp Objects would hit Vitality first. In most cases of Vitality hitting objects, they're all percentile based. No matter who you are, unless you have a jutsu guarding you against it, if I cut you with a knife you will take damage.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Things like Lightning or Fire will hit towards vitality but at different damaging effects. Fire and Lightning damage is normally random between the attacks in damage. <b>Things that are hurting you through sharp features will normally be percentile based.</b>.","[src]")//,,,,0,"400x150",,style)

				else if(A=="I'm Hungry/Thirsty, what do I do?")
					sd_Alert(usr, "You eat or drink. The purpose of eating is for not only filling up your stomach but also to increase your calories allowing for more actions. Since you can't see calories you just have to assume you have enough based off of whether or not you're recovering nicely. ","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Try not to overeat. It's bad for you and you can vomit from it. ","[src]")//,,,,0,"400x150",,style)

				else if(A=="How do I increase my Health/Chakra/Stamina?")
					sd_Alert(usr, "As you increase with age, your Chakra and Stamina will just naturally get better. Your Vitality will never change, it'll always be 1500. In worst case scenario the vitality number can actually even drop. This is essentially not so different considering you'll still die to the same amount of slashes but attacks like Lightning would kill you faster. When getting strong things still look out for their cost. ","[src]")//,,,,0,"400x150",,style)

				else if(A=="How do I level up?")
					sd_Alert(usr, "Level up? Ninja don't level up or have humans. This game is a passive based game and skill-based. If anything it's far from levels because that can take a lot away from skills. A strong ninja is just a ninja that is really skillful. Imagine it like everyone with the same things, slightly except with different perks in different fields that allow them to have advantages. Every ninja is different and self-improvement is done in terms of passives. ","[src]")//,,,,0,"400x150",,style)

				else if(A=="What is a Passive?")
					sd_Alert(usr, "A Passive is your skill in a certain thing. Having a passive maxed shows you are essentially good at it and it also allows you to be good at things passively. This game doesn't require levels but instead you train your passives to get better. One of the most basic Passives are Reflex and Swift. Reflex for example would make you dodge more while Swift would increase your punching speed. ","[src]")//,,,,0,"400x150",,style)

				else if(A=="How do I increase my passives?")
					sd_Alert(usr, "You increase your passives by training them. To figure out how to train a passive you'd access your Passive Tree and look into them. It normally explains how to train a passive within those fields. ","[src]")//,,,,0,"400x150",,style)
	GymTeacher5
		name="Teacher: Juto(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Hair/ShikamaruH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"

				sd_Alert(usr, "Hey I'm here to teach you about jutsu and learning them!","[src]",,,,0,"400x150",,style)
				var/list/buttons = list("How do I learn Jutsu?","Help me Learn my First Jutsu?","Why does my Jutsu keep failing?","Where can I learn more jutsu?","Cancel")
				var/A = sd_Alert(usr, "What would you like to know?","[src]", buttons, pick(buttons),0,0,"600x200",,style,4,2)
				if(A=="How do I learn Jutsu?")
					sd_Alert(usr, "Learning Jutsu is easy. All you have to do is go and find a way to hear or learn about the jutsu to begin with and once you do train in that certain field until you reach the maximum exp. For example, if you're learning Clone Jutsu then you train until you reach the maximum EXP and then bam you have the jutsu!","[src]",,,,0,"400x150",,style)

					sd_Alert(usr, "Unless the Jutsu came to you automatically, after learning a Jutsu you will go through a delay which is equivalent to the time it took to learn the jutsu in seconds. Other things can affect the cooldown delay to make it go down faster. <b>Use this time to master your jutsu or any passives instead of sitting there waiting to learn more.</b>","[src]",,,,0,"400x150",,style)

				else if(A=="Help me Learn my First Jutsu?")
					sd_Alert(usr, "I'm generous, why not! I'll help you learn your first jutsu. Clone Jutsu.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "When about to be taught a technique a box will come in asking you if you'd like to learn the technique with the description and EXP available. You can't learn a jutsu you already know twice of course.","[src]",,,,0,"400x150",,style)

					usr.LearnJutsu("Bunshin No Jutsu",200,"BunshinJutsu","Bunshin No Jutsu is a basic clone technique that creates an image of yourself. It is not real but can be used for distraction purposes.","Ninjutsu")

				else if(A=="Why does my Jutsu keep failing?")
					sd_Alert(usr, "In order to stop your jutsu from failing you have to master it! This is difficult but basically mastering a jutsu would be about 100 uses of the technique. The more you sue a technique the higher chance you have at using it correctly but failing doesn't incoporate a delay at all it just increases annoyance when trying to click the Skillcard.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Another factor is that Jutsu require a certain thing to be on or working to work. Handseal Mastery for example is a passive that makes it so your hands don't slip when performing a jutsu. This is something you want to master and it's relatively fast. Remember some jutsu evolve the more you use them so using them is a good thing to do.","[src]",,,,0,"400x150",,style)

				else if(A=="Where can I learn more jutsu?")
					sd_Alert(usr, "Woaaah, calm down there Tiger! First you'll have to learn your Basic jutsu. Clone Jutsu, Transformation Jutsu and Subsitution Jutsu to pass the academy.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "But to answer your questions, people teach you jutsu. You can learn from NPC Teachers roaming around your village or even around the world that teach techniques. You can also learn a jutsu from a scroll or universal basic ninja skills can be learnable through the Passive Tree in the Jutsu section.","[src]",,,,0,"400x150",,style)
	GymTeacher6
		name="Teacher: Choordo(NPC)"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				Base+=rgb(235,145,52)
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Hair/ShikamaruH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"

				if(usr.TimeToAttack==17)
					sd_Alert(usr, "Eu vou te ensinar os basico das coordenadas!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Basicalmente para um ninja as coordenadas s�o simples.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "There's an X coordination and a Y coordination. Whever you're located on the map is where exactly the coordination leads to.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "So imagine a map as a giant graph and divide in into squares. Let's say you're on that first square, that's 1x and 1y.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Now let's say you move to the right, now you're on x2 and y1. But not you move up one and you're on x2 and y2. It's simple really!","[src]",,,,0,"400x150",,style)
					usr.TimeToAttack=18;usr.CanNavigate=1
				if(usr.TimeToAttack==18)
					sd_Alert(usr, "Now that you've understand I feel like I've fully gotten to my students! Such a beautiful moment, remember me!","[src]",,,,0,"400x150",,style)
					return
				else
					sd_Alert(usr, "You should talk to the other teachers first!","[src]",,,,0,"400x150",,style)

obj/Exams
	icon = 'Test.dmi'
	var
		PointsRequiredToPass=10
	GeninExam
		dir=SOUTH
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/HaveClone=0
				var/HaveSubsitution=0
				var/HaveTransformation=0
				for(var/obj/SkillCards/BunshinJutsu/A in usr.LearnedJutsus)
					HaveClone=1
				for(var/obj/SkillCards/Kawarimi/A in usr.LearnedJutsus)
					HaveSubsitution=1
				for(var/obj/SkillCards/Henge/A in usr.LearnedJutsus)
					HaveTransformation=1
				if(!usr.CanNavigate)
					usr<<"Voc� nem sequer e capaz de navegar. Voc� deve aprender como fazer isso antes de fazer o teste!";return
				if(!HaveTransformation)
					usr<<"Voc� precisa aprender Henge primeiro!";return
				if(!HaveSubsitution)
					usr<<"Voc� presica aprender 1 O Jutsu de substitui��o!";return
				if(!HaveClone)
					usr<<"Voc� precisa aprender primeiro o Clone Jutsu!";return
				if(usr.Genintest)
					return
				if(usr.rank!="Student")
					usr<<"Voc� ja terminou o teste!";return
				usr.Frozen=1
				usr.Genintest=1
				usr.score=1
				switch(input(usr,"O que � taijutsu?","Test",) in list("Illusion","Long-Ranged Combat","Hand-To-Hand Combat"))
					if("Combate corpo a corpo")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que � Ninjutsu?","Test",) in list("Hand-To-Hand Combat","Illusion","Long-Ranged Combat"))
					if("Combate de longa distancia")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que � genjutsu?","Test",) in list("Long-Ranged Combat","Hand-To-Hand Combat","Illusion"))
					if("Ilus�o")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que � as Coordernadas X?","Test",) in list("Left and Right","Up and Down","Diagonals","None Of The Above"))
					if("Direita e Esquerda")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Como voc� aprende jutsu?","Test",) in list("Gaining EXP","Killing People","Going on Quests"))
					if("Ganhando EXP")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que s�o passives?","Test",) in list("A person's skills","A person's techniques","A person's soul!!!"))
					if("Uma habilidade da pessoa")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Qual o tipo de arma � baseado em cortes ?","Test",) in list("Bo-Staff","Katana","Nunchuks","All Of The Above","Niether"))
					if("Katana")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Quanto de dano a kunai deveria dar?","Test",) in list("Porcentos","100 Dano","Depende na capacidade do ninja","Depends on the Ninja's Physique","Depends on the Ninja's Control"))
					if("Porcentos")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que presica para usar ninjutsu?","Test",) in list("Shape Manipulation","Nature Manipulation","Chakra","Determination","All of the Above"))
					if("Chakra")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Quanto tempo voc� deve espera para aprender outro jutsu?","Test",) in list("1 Day","1 Age","16 Minutes","Depends on the Jutsu","35 Minutes"))
					if("Depende do jutsu")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Qual elemento e considerado chakra da natureza?","Test",) in list("Katon Jutsu","Genjutsu","Taijutsu","Kenjutsu"))
					if("Katon Jutsu")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Quanto de chakra 1 ninja novo deveria ter?","Test",) in list("1","2","3","4","5","6"))
					if("2")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Porque Fuuton acaba com Raiton?","Test",) in list("It breaks the lightning in two","It disrupts the chakra","It seperates the eletrical charges","It just does"))
					if("Pois separa os raios")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Como alguem usa Raiton?","Test",) in list("By Vibrating their chakra at high frequencies","By turning their chakra white and sparky","By making their chakra random and unpredictable"))
					if("Pela vibra��o de seu chakra")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Como voc� taca uma arma?","Test",) in list("Double Click it","Equipa ela na m�o e depois taca","You don't","By pressing G"))
					if("Equipa ela na m�o e depois taca.")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"What passive determines your ability to perform handseals correctly?","Test",) in list("Handseal Skill","Handseal Mastery","Handseal Proficiency","Handseal Speed"))
					if("Handseal Mastery")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"How can someone be casted under a Genjutsu?","Test",) in list("By making them smell bad smells","By corrupting their chakra with their own chakra","By using psychological tricks"))
					if("By corrupting their chakra with their own chakra")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Um ninja pode ter quantos chakra naturais?","Test",) in list("1","2","3","4","5","Depends on The Ninja"))
					if("Depende do Ninja")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que reduz o dano de taijutsu?","Test",) in list("Guarding","Passives","All Of The Above","Nothing"))
					if("Bloquear")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Voc� agora � 1 genin voc� deseja sair?","Test",) in list("Sim","N�o!!!"))
					if("Sim")
						usr.score+=1
					else
						usr.score-=10
				var/Score=0
				if(usr.score!=0)
					Score=(usr.score/20)*100
				usr<<"Voc� finalizou o testo com [Score] acertos!!!."
				usr.Frozen=0
				if(Score>=70)
					usr<<"<font size=2><b><font color=yellow>Congratulations you have passed the Genin Exam with [Score] Points!"
					for(var/mob/M in world)
						if(M.Village==usr.Village)
							M<<"<font color = #BB0EDA>Village Information:</font> [usr] has passed the Genin Exam and has become apart of the village!"
					usr.rank ="Genin"
					usr.Genintest=0
					usr.score=0
					var/obj/Clothes/Headband/B=new();B.loc=usr
					usr<<"You were given a couple of items to start your Genin career."
					if(usr.Clan=="Uchiha")
						var/obj/Clothes/Uchiha_Crest/C = new()
						C.loc = usr
						usr.gottenuchihacrest=1
						usr<<"You've been given an Uchiha Crest Symbol to place on your clothing and show your clan pride."
					var/obj/WEAPONS/Kunai/A=new();A.ammount=10;A.loc=usr
					var/obj/WEAPONS/Shuriken/C=new();C.ammount=10;C.loc=usr
					usr.Yen+=1000
					usr.move=0
	//Leaf
					if(usr.Clan=="Aburame")
						usr.loc=locate(21,36,11)
					if(usr.Clan=="Akimichi")
						usr.loc=locate(61,22,11)
					if(usr.Clan=="Fuuma")
						usr.loc=locate(144,170,6)
					if(usr.Clan=="Hoshigaki")
						usr.loc=locate(152,125,6)
					if(usr.Clan=="Hyuuga")
						usr.loc=locate(174,40,11)
					if(usr.Clan=="Nara")
						usr.loc=locate(25,69,11)
					if(usr.Clan=="Kusakin")
						usr.loc=locate(93,143,12)
	//Sound
					if(usr.Clan=="Uchiha")
						usr.loc=locate(150,52,4)
					if(usr.Clan=="Kumojin")
						usr.loc=locate(151,184,4)
					if(usr.Clan=="Kaguya")
						usr.loc=locate(172,43,5)
					else
						if(usr.Village=="Terra")
							if(prob(50))
								usr.loc=locate(65,57,11)
							else
								usr.loc=locate(46,172,14)
						if(usr.Village=="Leaf")
							usr.loc=locate(65,57,11)
						if(usr.Village=="Rain")
							usr.loc=locate(111,170,6)
						if(usr.Village=="Sound")
							usr.loc=locate(119,130,4)
						if(usr.Village=="Rock")
							usr.loc=locate(46,172,14)
				else
					usr<<"Voc� falhou no exame genin!"
					usr<<"Voc� poder� refaze-lo em 5 minutos!"
					spawn(3000)
						usr.Genintest=0

//Sound
mob/var/TalkedToIntroductionTeacher=0
mob/var/tmp/TakingTest=0
obj/TestBook
	name="Math State"
	icon = 'Map/Turfs/Landscapes.dmi'
	icon_state="Book"
	verb/Command()
		set src in oview(1)
		set name="Command"
		set hidden=1
		if(src in get_step(usr,usr.dir))
			if(src in get_step(usr,usr.dir))
				if(usr.alreadytalkingtohim)
					return
				else
					usr.alreadytalkingtohim=1
					switch(input(usr,"Voc� est� indo para o teste? Custa � 20 apenas para inici�-lo, mas voc� pode acabar ganhando mais dinheiro! Talvez at� mesmo experi�ncia e itens especiais!", text) in list ("Yes","No"))
						if("Yes")
							if(usr.Yen>20)
								usr.TakingTest=1
								usr.Yen-=20
								var/Questionnumber=0
								TestTake
									var/X=rand(1,100)
									var/Z=rand(1,100)
									var/Answer=X-Z
									Questionnumber+=1
									var/Question=input(usr,"Numero da quest�o [Questionnumber]! Quanto � [X]-[Z]?","Resposta?") as num
									if(Question==Answer)
										var/YenGain=2*Questionnumber
										if(YenGain>100) YenGain=100-rand(-15,15)
										usr<<"Correct! [YenGain] Yen!"
										usr.Yen+=YenGain
										if(Questionnumber>35)
											var/EXPGain=5*Questionnumber
											if(EXPGain>250) EXPGain=250-rand(-25,25)
											usr<<"Voce ganhou um bonus de EXP [EXPGain]!"
											usr.exp+=EXPGain
										goto TestTake
									else
										usr<<"Incorreto!Desculpa voc� perdeu!";usr.alreadytalkingtohim=0;return
							else
								usr<<"Voc� n�o tem o dinheiro necessario!";usr.alreadytalkingtohim=0;return
						if("No")
							usr.alreadytalkingtohim=0









obj
	StudentBook
		name = "Student Guide 101"
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state="Book"
		verb
			Readzzz()
				set src in oview(1)
				set name="Read Book"
				set category="Book"
				var/tmp
					html
				if(usr.HaveToReadBook)
					html = {"
					<html>
						<head>
							<style type="text/css">
								body {
									color: white;
									background-color: black;
									font-family: Arial, Times, Tahoma, sans-serif
								}
								th {
									font-weight: bold;
									font-size: 10pt
								}
								tr {
									font-size: 12pt;
									padding: 2px. 10px, 2,px, 10px
								}
							</style>
						</head>
				"}
					var/Stuffz = {"
						<html>
						<STYLE>BODY{font-family: Verdana}</STYLE>
						<head>
						<title>Student 101 Guide</title>
						</head>
						<body bgcolor=#f5f5f5 text=#000000>
						<center><h2>P�gina 200</h2></center><hr>
						<br>	O mundo do ninja � um mundo vasto que todo Ninja deve compreender , mas a primeira coisa que voc� deve entender como um ninja � que eles n�o s�o Invenciveis . Um ninja pode facilmente morrer a qualquer coisa , que � o Prop�sito de Jutsus . H� um monte de jutsu neste mundo , mas � dividido em 3 categorias. Ninjutsu , Taijutsu e Genjutsu . Ninjutsu � o auge do Shinobi , onde voc� pode matar um inimigo a uma dist�ncia muito longe com um ataque poderoso e manter-se ileso. A seguir � Taijutsu , o que � muito mais perigoso do que Ninjutsu para quem usa, normalmente. Taijutsu � um estilo de luta de perto , combate corpo-a-corpo . Diferentes ninja t�m diferentes tipos de taijutsu , e como um v�rios tipos de Ninjutsu,v�rios tipos de Taijutsu existem no mundo . Genjutsu por outro lado � um pouco diferente ,Genjutsu � mais difundido e mais dif�cil de lidar,considerando que � uma t�cnica de ilus�o .Ela altera a realidade ao redor dos alvos,e eles t�m que descobrir como combater a t�cnica antes que possam ter algum dano grave sobre eles.N�o h� muitos Genjutsu no mundo,mas h� muitos Ninjutsus,no entanto.
						<br>
						<br>	H� tamb�m artes mais complicadas que n�o podem ser discutidos na Academia , � claro que voc� pode sempre ler livros nas Bibliotecas e entender ainda mais. Vamos explicar a situa��o de ser um ninja.
						<br>
						<center><h2>P�gina 201</h2></center><hr>
						<br>    Todas as t�cnicas ao redor do mundo Ninja se diferem , mas o Ninja deve compreender a si mesmo antes que ele possa entender o inimigo. Um ninja tem tr�s estat�sticas vitais , estas estat�sticas s�o Vitalidade, For�a e Chakra . Estas estat�sticas s�o importantes , e se for ignorado pode levar ao desaparecimento de um ninja. A primeira estat�stica a se preocupar � vitalidade . A vitalidade � seu status de sa�de e provavelmente o mais importante . Se isso chegar a zero , voc� morre , exceto para algumas ocasi�es especiais . Depois disso , h� Chakra . Chakra � o que � usado para fazer t�cnicas . O Chakra n�o pode ser usado em alto excesso sem voc� ter que carreg�-lo de volta , � perigoso dependendo de t�cnicas que voc� usar, porque eles podem esgotar o seu chakra , que pode ser muito perigoso para voc�. Stamina por outro lado � a sua energia e voc� precisa dele para uma variante de coisas , mas � bom voc� manter a sua resist�ncia para cima, pois se a sua resist�ncia � sempre reduzido para baixo, voc� vai ser muito lento para qualquer coisa e voc� pode imediatamente ser morto por um inimigo .
						<br>    Depois disso ,h� o controle de Chakra . Cada Ninja precisa de controle de chakra para que eles possam facilmente controlar o Chakra em torno de seu corpo. Sem isso, eles estariam condenados. A quantidade de Chakra cobrada de volta , voc� ganha baseado fora de seu controle de chakra , assim que ter muito torna melhor para voc�, se voc� tem baixo chakra.
						<br>    Os suprimentos de um ninja tamb�m s�o muito importantes . As armas s�o uma parte vital de um ninja, pois h� certas coisas que um Ninja n�o pode se defender sem t�cnicas . Armas como Kunai , Shurikens ou mesmo Swords todos fazem dano percentual em cima de um ninja. Junto com coisas como explos�es, portanto o usu�rio e o inimigo devem perceber isso se eles querem sair do mundo para lutar. Porque eles fazem percentual dano baseado diretamente na vitalidade , eles s�o bastante perigoso e podem exterminar o inimigo imediatamente. Embora os ataques f�sicos podem ser mais �teis se voc� � forte o suficiente para conseguir um golpe seco e um poderoso. Porque estes s�o f�sicos, � puramente baseado em status do usu�rio , por isso, se eles s�o uma pessoa forte  eles podem terminar o jogo ali mesmo . Ataques f�sicos s�o ramificados em duas categorias. Ou eles atacam  Vitalidade  diretamente , ou eles atacam Stamina diretamente. �s vezes, eles podem atacar ambos ! Se a sua resist�ncia est� esgotado, n�o se esque�a, ele vai come�ar a danificar a sua sa�de. �s vezes voc� pode at� estar atordoado com o dano que voc� ganha de um ataque, que deve ter muito cuidado , um ataque simples pode ser o seu �ltimo .
						<br>    Para comprar suprimentos , um Ninja deve sempre ter dinheiro tamb�m. Eles precisam ser bem alimentado e hidratado totalmente,sen�o  eles nunca v�o estar no seu melhor . Se eles n�o estiverem totalmente hidratados ou totalmente nutridos , eles podem morrer em batalha mesmo . Para conseguir dinheiro , o Ninja geralmente tem que fazer miss�es e tarefas para sua vila para ganhar dinheiro. Eles podem vender coisas para os outros ou at� mesmo ganhar dinheiro ca�ando recompensas . � um mundo grande, com o tempo voc� pode descobrir a melhor maneira de obter dinheiro.
						<br>    � aconselhado para um ninja estar pronto para qualquer evento . Sempre manter armas com voc� em todos os momentos , pois espera-se que o outro ninja tenha uma arma tamb�m. E depois de se qeuipar , n�o deixe de treinar sempre no caso de essas armas n�o funcionarem. Pense fora da caixa e aprenda o seu jutsu como se fosse uma parte de seu corpo, domine-o e voc� n�o ter� nada para se preocupar. Apenas certifique-se de o poder n�o subir cada vez mais a sua cabe�a,nunca subestime seus inimigos,sempre esteja atento pois voc� pode ser enganado.
						<center><h2>Page 202</h2></center><hr>
						<br>    Como chegamos � �ltima p�gina , h� outra coisa que deve ser discutido. Cada Ninja � diferente em todos os sentidos , em habilidades e artes. Alguns Ninja s�o  mais  diferente do que outros, mas isso � algo que voc� deve entender como uma pessoa. Quando voc� nasce , cada ninja tem diferentes potenciais de crescimento e diferente estat�stica que n�o pode ser controlado . � claro que voc� sempre pode ainda treinar-se em determinadas artes de modo que voc� crescer do jeito que voc� gosta, mas h� certas coisas que voc� n�o pode passar.
						<br>    Todo Ninja deve entender que, com suas limita��es , h� tamb�m a sua for�a. Em t�cnicas de aprendizagem , h� tamb�m outra coisa. A �rvore passiva e a arvore de habilidades . A �rvore de habilidades � uma �rvore que lhe permite avan�ar em suas Passives . Passives s�o coisas que lhe permitem aprimorar suas habilidades ninja e ajudar melhor as coisas mais f�ceis , como a perfura��o mais r�pido ou liberar o cooldown entre T�cnicas de Ninjutsu . Depois disso, n�o � a �rvore Jutsu , que permite que voc� aprender t�cnicas de Ninjutsu b�sico como Kawarimi que todos possam aprender. A �rvore Passive ser� muito mais �til , mas principalmente para aprender qualquer t�cnica , voc� deve sair no mundo e descobrir mais sobre voc� mesmo a partir de um professor , um livro ou at� mesmo aprender  cri�-lo em seu pr�prio pa�s .
						<br>    Para comprar uma passive ou Jutsu , voc� precisa de pontos de habilidade . Toda vez que voc� subir de n�vel voc� ganha pelo menos 1 Ponto de Habilidade . As pessoas s�o diferentes , de modo que poder�o receber uma quantidade diferente de pontos de habilidade . A fim de subir de n�vel , por�m, voc� deve ter o seu EXP igual ao seu Max EXP . Fica mais dif�cil para subir de n�vel , por isso, em teoria, voc� pode aprender todos os jutsu do mundo, mas ele vai ficar dif�cil. � melhor voc� se concentrar em uma coisa , em vez de tentar aprender tudo, pois nem mesmo os g�nios pode se concentrar em tudo . �s vezes , a aprendizagem de uma Jutsu vai proibi-lo de aprender uma outra , tamb�m . Os professores tamb�m s�o humanos , para que eles tamb�m podem ser ignorantes e n�o ensin�-lo apenas por causa de seu cl� ou at� mesmo para uma coisa simples , como o n�vel .
						<br>    Toda vez que  voc� subir um n�vel acima, voc� ganha um ponto de n�vel . Voc� pode usar esse ponto de nivel para adicionar em suas habilidades ainda mais , adicionando a coisas que afetam seu crescimento inicial . Isto � muito �til para a constru��o de seu personagem.
						<br>    Este � o lugar onde termina os guias . Eu espero que voc� tenha aprendido muito , este guia n�o explica tudo sobre o jogo embora, explique algumas das t�ticas de leitura. Voc� n�o ter� que ler para sempre , por�m, ele termina aqui.
						</body>
						</html>
						"}
					usr << browse("[Stuffz][html]","size=576x576,window=Student Info Guide 101")
					usr.ReadBook=1
					usr.HaveToReadBook=0
				else
					alert("Voc� j� l�u! Voc� n�o vai querer l�-lo novamente!","[src]")
					return






//////////////////////////////////////////
mob/Teachers/AcademyTeacher
	LeafAcad1
		name = "Jigetsu, Amano"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/narutoH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,100,0)
				src.icon=Base
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb
			Speak()
				set src in oview(1)
				set category="NPC"
				switch(alert("Bem-vindo � academia, eu sou o professor aqui. � a sua primeira vez aqui?","[src]","Yes","No"))
					if("Yes")
						if(!usr.rank=="Student")
							alert("as voc� � um Genin? Voc� n�o � um estudante!","[src]")
						else
							if(usr.LearnedAcademy)
								alert("Eu n�o disse a voc� cabe�a para o professor para come�ar a sua primeira aula?","[src]")
							else
								alert("Bem-vindo para a academia! Para come�ar, primeiro temos de come�ar a ensinar-lhe tudo o que podemos! Dirija-se ao professor em sala de aula a primeira � esquerda para que possamos iniciar.","[src]")
								usr.LearnedAcademy=1
	LeafAcad2
		name="Hakudou, Kujo"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/shikaH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,0)
				src.icon=Base
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb
			Speak()
				set src in oview(1)
				set category="NPC"
				if(usr.rank=="Student")
					if(usr.ReadBook)
						alert("Bom! Agora v� para Romanji l� para que ele possa ensin�-lo sobre Ninja lutando! Ele est� na sala � direita de mim.","[src]")
						if(usr.TimeToLearnNinjutsu>=2)
							alert("Oh, voc� j� falou com ele? Em seguida, fa�a o teste depois de atingir o n�vel adequado!","[src]");return
						usr.TimeToLearnNinjutsu=1;return
					if(usr.HaveToReadBook)
						alert("Voc� n�o leu ainda! Estou de olho em voc�! V� at� l� e l�-lo ou voc� nunca vai se tornar um Genin!","[src]")
						return
					if(usr.LearnedAcademy&&!usr.HaveToReadBook&&!usr.ReadBook)
						switch(alert("Did Amano send you?","[src]","Yes","No"))
							if("Yes")
								alert("Vamos come�ar. Primeiro eu quero que voc� abra seus livros na p�gina 200 e leia a p�gina 202. Vai ser uma leitura r�pida. Depois disso, volte para mim.","[src]")
								usr.HaveToReadBook=1
								return
					else
						alert("Voc� deveria ir falar com o ninja l� em baixo.","[src]")
						return
				else
					alert("� sempre muito bom ver os alunos todos crescendo.","[src]")
					return
	LeafAcad3
		name="Romanji"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='Icons/New Base/Hair/MadaraH.dmi'
				Base+=rgb(235,145,52)
				Hair+=rgb(0,0,100)
				src.icon=Base
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb
			Speak()
				set src in oview(1)
				set category="NPC"
				if(usr.alreadytalkingtohim)
					return
				usr.alreadytalkingtohim=1
				if(usr.rank=="Student")
					if(usr.TimeToLearnNinjutsu==1)
						if(usr.TimeToAttack2)
							if(usr.TimeToAttack)
								alert("O que voc� est� esperando? Voc� � um pacifista?","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Voc� deve saber, A � deixado ataque m�o, S � o ataque m�o direita, e D � para chutar. Voc� pode equipar itens com uma das suas m�os e us�-los em conformidade. Agora � hora de um pouco t�ticas de contador. Para contador, clique em C.","[src]")
								usr.TimeToCounter2=1
								usr.TimeToAttack2=0
								usr.alreadytalkingtohim=0
								return
						if(usr.TimeToCounter2)
							if(usr.TimeToCounter)
								alert("O que voc� est� esperando? Voc� � um pacifista?","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Agora ele n�o pode olhar como ele tinha feito nada, mas se voc� foram atingidos por esse tempo que voc� teria evadido em outra dire��o. � uma certeza fogo maneira de evitar ataques. Agora Guarda � um ataque que resiste a voc� de ataques baseados em Vigor, aumentando a sua resist�ncia. Para Guard, clique em X..","[src]")
								usr.TimeToCounter2=0
								usr.TimeToGuard2=1
								usr.alreadytalkingtohim=0
								return
						if(usr.TimeToGuard2)
							if(usr.TimeToGuard)
								alert("O que voc� est� esperando? Voc� � um pacifista? ","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Agora, uma coisa final. Mantendo pressionada Z, voc� vai cobrar chakra! Voc� cobra Chakra baseado fora de seu controle de chakra, e � a maneira de ganhar Chakra de volta! Ele tamb�m d� EXP! V� em frente, tente!","[src]")
								usr.TimeToGuard2=0
								usr.TimeToCharge2=1
								usr.alreadytalkingtohim=0
								return
						if(usr.TimeToCharge2)
							if(usr.TimeToCharge)
								alert("O que voc� est� esperando? Voc� � um pacifista?","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Agora eu acho que voc� precisa de mais tempo na experi�ncia como estudante. Eu acho que voc� deve ir flexionar os m�sculos, mas primeiro vou dar-lhe 3 Pontos de Per�cia. O que eu quero que voc� fa�a � aprender Bunshin No Jutsu, Kawarimi no Jutsu e Henge no Jutsu. Voc� n�o pode aprender outras t�cnicas sem ele.","[src]")
								usr.TimeToCharge2=0
								usr.TimeToLearnNinjutsu=2
								usr.alreadytalkingtohim=0
								return
						alert("Ah sim! Eu sempre gosto de ver os novos estudantes aqui e ali! De qualquer forma, vamos come�ar! Primeiro temos que ensin�-lo a lutar!","[src]")
						alert("O primeiro aspecto da luta est� atacando, � claro! Socos, pontap�s, todas essas coisas boas. Experimente, Clique A, S ou D e voc� deve atacar!","[src]")
						usr.TimeToAttack2=1
						usr.TimeToAttack=1
						usr.alreadytalkingtohim=0
						return
					else
						alert("Espero que voc� experimentou algumas t�ticas de treinamento!","[src]")
						usr.alreadytalkingtohim=0
						return
				else
					alert("Haha! Ent�o voc� � um [usr.rank], hein ?! �timo, eu sou um professor!","[src]")
					return
	LeafAcad4
		name="Hito, Jigui"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			.=..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi'
				var/Hair='ThreadsH.dmi'
				Base+=rgb(111,55,0)
				Hair+=rgb(0,0,0)
				src.icon=Base
				src.overlays-='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays-='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays-='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
				src.overlays-='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
				src.overlays-='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
				src.overlays-=Hair
				src.overlays+=Hair
		verb
			Speak()
				set src in oview(1)
				set category="NPC"
				if(usr.rank=="Student")
					alert("Espero que voc� saiba as maneiras que voc� pode treinar! Eu prefiro forma��o em registros, mas muitos trem por desperdi�ar o seu chakra e carreg�-la de volta! Voc� pode treinar por Sparring, toda vez que voc� bater em algu�m que voc� ganha EXP baseado fora do dano que voc� fez �s vezes! Voc� pode ganhar EXP de leitura, mesmo! Mas Reading soa muito chato.","[src]")
					alert("Sugiro Sparring, a experi�ncia � a melhor maneira de treinar!","[src]")
					return
				else
					alert("Ent�o voc� certamente sabe como treinar, certo?","[src]")
					return