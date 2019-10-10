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
					sd_Alert(usr, "Eu vejo que está aprendendo bem.","[src]")//,,,,0,"400x150",,style);return
				else
					sd_Alert(usr, "Se você estiver pronto para virar um genin,deveria fazer o exame!","[src]")//,,,,0,"400x150",,style)
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
					sd_Alert(usr, "Ah carne fresca! Eu amo ve-las! Você poderá bater nelas. Você pode socar pressionando A ou S. Se você aperta A você irar socar com a mão esquerda e se você pressionar com S irar socar com a direita!","[src]")//,,,,0,"400x150",,style)
					usr.client.screen+=new/obj/Effects/ASMash
					usr.TimeToAttack=1;return
				if(usr.TimeToAttack==1)
					sd_Alert(usr, "Vamos lá! Não é tão dificil eu sei que você consegue!","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==2)
					sd_Alert(usr, "Bom! Esse foi um belo soco!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Agora eu preciso que você chute!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Chutar é mais simples que socar. É so pressionar D que você poderá chutar.","[src]")//,,,,0,"400x150",,style)
					usr.client.screen+=new/obj/Effects/DMash
					usr.TimeToAttack=3;return
				if(usr.TimeToAttack==3)
					sd_Alert(usr, "Tendo dificuldades?","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==4)
					sd_Alert(usr, "Ah bom! As 3 formas de combates de taijutsu. Você poderá fazer combos se você for bom o suficiente com taijutsu. Diferentes tipos de luta poderá fazer diferentes promoções de combos.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Agora, precisamos avançar para Corrida. Correr também é outra coisa simples de fazer. Tudo que você precisa fazer é pressionar Correr abaixo na interface. Se você continuar andando, não se preocupe, você vai lentamente começar a aumentar a velocidade. Fale comigo de novo uma vez que você atingir a velocidade máxima.","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=5;return
				if(usr.TimeToAttack==5)
					sd_Alert(usr, "Você me parece um poco lento. PorFavor não me diga que está correndo.","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==6)
					sd_Alert(usr, "Ah bom. Agora vamos abrandar um pouco para algo um pouco mais! Vamos tentar algo mais defensiva! Mostre-me sua posição de guarda!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Bloquear é feito pressionando X. Quando você soltar X você vai parar de bloquear. Guarda também pode ser usado para desviar efetivamente um alvo, por rapidamente liberá-lo você vai esquivar de um ataque de combate corpo-a-corpo instantaneamente. Quando guardando-reduz o dano de ataques físicos baseados.","[src]")//,,,,0,"400x150",,style);usr.client.screen+=new/obj/Effects/XMash
					usr.TimeToAttack=7;return
				if(usr.TimeToAttack==7)
					sd_Alert(usr, "Bem?Onde está o seu bloqueio?","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==8)
					sd_Alert(usr, "Isso é uma boa posar ali mesmo. Espero que o seu chakra é tão feroz também, me mostre o que você tem!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Você pode carregar chakra pressionando Z.","[src]")//,,,,0,"400x150",,style)
					usr.client.screen+=new/obj/Effects/ZMash
					usr.TimeToAttack=9;return
				if(usr.TimeToAttack==9)
					sd_Alert(usr, "Bem?Chakra?","[src]")//,,,,0,"400x150",,style);
					return
				if(usr.TimeToAttack>=10)
					sd_Alert(usr, "Bom trabalho!Eu realmente amo novatos bons!","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Eu sugiro que você olhe em torno de alguns lugares, se você quiser aprender algumas coisas. Você pode querer aprender sobre Jutsu e como eles funcionam antes de avançar.","[src]")//,,,,0,"400x150",,style);
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
					sd_Alert(usr, "Olá! Yo yo! Estou aqui para te ensinar sobre jutsu!","[src]",,,,0,"400x150",,style)
					var/list/buttons = list("O que é Jutsu? "," O que é uma forma de Transformação? "," O que é uma transformação da natureza? "," Quais são os Chakra naturezas? "," Como faço para obter Chakra naturezas? "," Posso aprender mais do que um chakra Natureza? "," Cancelar")
					var/A = sd_Alert(usr, "O que você gostaria de aprender?","[src]", buttons, pick(buttons),0,0,"600x200",,style,4,2)
					if(A=="O que é jutsu?")
						sd_Alert(usr, "Jutsu são técnicas Ninja Disciplina. Existem 3 tipos principais de jutsu: Taijutsu, Ninjutsu e Genjutsu.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Técnicas de taijutsu são técnicas de combate corpo-a-corpo. Eles utilizaram técnicas baseadas artes-marciais, basicamente, onde o usuário poderia utilizar combate físico em prejudicar o inimigo. Eles estão praticamente close-variou mas há exceções para tudo! Eles estão geralmente baseado em seu status de Physique.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Técnicas de Ninjutsu são praticamente como chakra. Eles utilizam chakra para criar ataques e técnicas como sopro de fogo. Eles estão técnicas de longa distância. Seu dano é normalmente baseado fora da intensidade do chakra em seu corpo ou como chamamos a sua capacidade.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Técnicas de Genjutsu é algo um pouco diferente. Estas técnicas são técnicas de ilusão que afetam a mente do oponente. Eles trabalham por corromper o fluxo de chakra do oponente com seu próprio fluxo de chakra e corrompendo o que vêem o que permite fácil de assassinato, mas uma estratégia horrível quando lutando sozinho. Eles são baseados fora de seu controle para utilizar o Genjutsu..","[src]")//,,,,0,"400x150",,style)

					else if(A=="O que é uma forma de Transformação?")
						sd_Alert(usr, "Forma de Transformação é uma forma avançada de controle de chakra usado principalmente para a criação de novo jutsu e técnicas. Ele muda a forma e movimento do chakra determinar o tamanho, alcance e finalidade do jutsu. Forma Manipulação é diferente da Natureza Manipulation como Nature Manipulação realmente muda a natureza do chakra para criar jutsu mais avançado. Alguns ninja pode utilizar tanto a forma e natureza Manipulação para fazer técnicas muito interessantes.","[src]")//,,,,0,"400x150",,style)

					else if(A=="O que é uma transformação da natureza?")
						sd_Alert(usr, "Transformação da natureza se aplica a um elemento para o chakra permitindo que o usuário realmente mudar a natureza de um chakra, alterando suas propriedades e características..","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Existem 5 tipos de Transformações basicas  notado como o 5 Chakra naturezas. Estes cinco tipos são o fundamento de toda jutsu Elemental.","[src]")//,,,,0,"400x150",,style)

					else if(A=="O que é chakra natural?")
						sd_Alert(usr, "..","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Técnicas da Terra são fortes contra as técnicas de água, uma vez que suga toda a água, mas é fraco pelos ataques penetrantes Relampagos. Terra é considerada uma das defesa mais fortes e as suas técnicas não são totalmente ótimo para ofensiva, mas ótimo para técnicas defensivas e suplementares.","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Técnicas de água são fortes contra as técnicas de lançamento de fogo como a água apaga as chamas, mas é fraco contra técnicas Terra considerando a terra absorve a água. Técnicas de água é um bem forte natureza chakra, considerando seus usos versáteis permitindo ao usuário fazer praticamente qualquer coisa com ele, considerando a manipulação forma fácil com água, mas ela atinge principalmente fisicamente a Energia ..","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Técnicas de fogo são fortes contra Técnicas de vento como combustíveis de vento as chamas de fogo, mas é fraco contra técnicas de água, considerando a água coloca-lo para fora. Técnicas de fogo são basicamente o mesmo em todas as formas, lançando chamas da boca do usuário ou outras partes do corpo para fins ainda mais avançadas, mas eles normalmente vêm da boca do usuário. Técnicas de Fogo de lançamento são perigosas para a sua resistência e vitalidade como queima e pode causar ferimentos graves.","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Técnicas de vento são fortes contra Técnicas relâmpago como o vento dispersa as acusações, mas ele é fraco contra as técnicas de lançamento de fogo, considerando que aumenta a força do Fogo. Técnicas de lançamento de vento são considerados os mais fortes, ofensiva chakra natureza porque o vento pode ser moldada para ser tão nítida e mais fina possível, como uma lâmina. Eles normalmente acertar a vitalidade, mas em muitos casos Técnicas de vento pode atingir a resistência por causa de ser mera pressão Chakra.","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Técnicas de raiton é mais forte contra técnicas de doton desde que o elemento penetre na doton, mas é fraco contra técnicas de Fuuton desde que o vento dispersa as acusações. Raiton aumenta as vibrações de alta frequência de chakra do usuário criando um raio. Eles são técnicas que permitem até mesmo efeitos penetrantes que atingiram diretamente para a vitalidade, ou até mesmo causando paralisação através impressionante movimento rápido. É comumente infundido em armas para permitir nitidez mais forte através da vibração..","[src]")//,,,,0,"400x150",,style)

					else if(A=="Como eu pego esses chakras?")
						sd_Alert(usr, "Todo mundo tem uma afinidade para uma natureza chakra. Essa característica é genética, considerando alguns Clãs pode nascer com um certo tipo de Chakra natureza, por exemplo: Uchiha nasce com katon..","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Se você quiser descobrir o seu Affinity você vai ter que colocar o seu chakra em papel Chakra. O Livro Chakra responderá baseado fora de sua base de dados de Afinidade.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Se o papel queimar, você tem Chakra elemental de Fogo. Se o papel ficar molhado, você tem Chakra elemental de Agua. Se o papel se desintegra-se, você tem Chakra elemental de Rêlampago. Se o papel se transforma em terra, você tem Chakra elemental de Terra. E se o papel rasga em dois, você tem Chakra elemental de Vento.","[src]")//,,,,0,"400x150",,style)
						sd_Alert(usr, "Domínio de uma natureza de chakra leva tempo para dominar, mesmo se a sua base de afinidade é o chakra natureza..","[src]")//,,,,0,"400x150",,style)
					else if(A=="Posso aprender mais de Chakra Natural?")
						sd_Alert(usr, "Sim, para a maioria das pessoas que você pode aprender mais de um Chakra Natural embora haja alguns casos em que é simplesmente impossível. A maioria dos Shinobi são capazes de dominar pelo menos duas naturezas de Chakra e até três, se eles são uma marca de elite de Shinobi. Todo mundo nasce com uma quantidade natural de natureza de chakra você pode aprender simplesmente porque é tão difícil. Se você atingir a quantidade máxima de natureza de chakra que você pode aprender , você simplesmente não será capaz de aprender mais..","[src]")//,,,,0,"400x150",,style)

						sd_Alert(usr, "Você não pode aprender outro elemento até você masterializar seu 1 elemento, o que é quando sua inteligencia do elemento chega a 1000..","[src]")//,,,,0,"400x150",,style)



				else
					sd_Alert(usr, "Você deveria falar com o outro professor de ginastica! Haha.","[src]")//,,,,0,"400x150",,style)
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
					sd_Alert(usr, "Armas são facil de usar,confie em mim são faceis! Primeiro você tem que equipar a arma na sua mão esquerda ou direita. Eu lhe dei uma kunai, veja seu inventorio ao clicar no inventorio em cima no canto direito e então equipe ela em uma das mãos para começar a treinar.","[src]")//,,,,0,"400x150",,style)
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
					sd_Alert(usr, "Vamos lá equipe a arma em sua mão,não é tão perigoso..","[src]")//,,,,0,"400x150",,style);return
				if(usr.TimeToAttack==12)
					sd_Alert(usr, "Bom. Agora você precisa pegar ela. Você pode pegar a arma pressionando Q ou E. Quando aperta Q você pega a arma com a mão esquerda. Quando você pega uma arma você pode usa-la em combate, então você podera usar sua arma com seu ataque physical.","[src]")//,,,,0,"400x150",,style)
					sd_Alert(usr, "Você pega a arma.","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=13
					return
				if(usr.TimeToAttack==13)
					sd_Alert(usr, "Vamos lá você não ira se machucar. Pegue a arma pressionando Q ou E..","[src]")//,,,,0,"400x150",,style);return

				if(usr.TimeToAttack==14)
					sd_Alert(usr, "Bom. Agora tente pegar uma arma e taca-la. É realmente facil. Para jogar a arma aperte os botões correspondentes. Se você equipar a arma na mão direita você terá que tacar com a mão direita. Se você equipar com a esquerda tera de tacar com a esquerda.Vamos lá é realmente facil!","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=15
					return
				if(usr.TimeToAttack==15)
					sd_Alert(usr, "Vamos lá é facil. Use o botão da mão esquerda ou direita.","[src]")//,,,,0,"400x150",,style);return

				if(usr.TimeToAttack==16)
					sd_Alert(usr, "Bom trabalho. Parece que você entende como utilizar armas agoar. Quando se trata de armas de arremesso usando esses botões vai jogar as armas, mas quando se trata de armas de curto alcance, como a katana, eles tem primeiramente o mesmo sistema.","[src]")//,,,,0,"400x150",,style)
					usr.TimeToAttack=17
					return

				sd_Alert(usr, "Bom trabalho. Fique aprendendo você está fazendo certo!","[src]")//,,,,0,"400x150",,style)
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
					sd_Alert(usr, "Basicalmente para um ninja as coordenadas são simples.","[src]",,,,0,"400x150",,style)
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
					usr<<"Você nem sequer e capaz de navegar. Você deve aprender como fazer isso antes de fazer o teste!";return
				if(!HaveTransformation)
					usr<<"Você precisa aprender Henge primeiro!";return
				if(!HaveSubsitution)
					usr<<"Você presica aprender 1 O Jutsu de substituição!";return
				if(!HaveClone)
					usr<<"Você precisa aprender primeiro o Clone Jutsu!";return
				if(usr.Genintest)
					return
				if(usr.rank!="Student")
					usr<<"Você ja terminou o teste!";return
				usr.Frozen=1
				usr.Genintest=1
				usr.score=1
				switch(input(usr,"O que é taijutsu?","Test",) in list("Illusion","Long-Ranged Combat","Hand-To-Hand Combat"))
					if("Combate corpo a corpo")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que é Ninjutsu?","Test",) in list("Hand-To-Hand Combat","Illusion","Long-Ranged Combat"))
					if("Combate de longa distancia")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que é genjutsu?","Test",) in list("Long-Ranged Combat","Hand-To-Hand Combat","Illusion"))
					if("Ilusão")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que é as Coordernadas X?","Test",) in list("Left and Right","Up and Down","Diagonals","None Of The Above"))
					if("Direita e Esquerda")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Como você aprende jutsu?","Test",) in list("Gaining EXP","Killing People","Going on Quests"))
					if("Ganhando EXP")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"O que são passives?","Test",) in list("A person's skills","A person's techniques","A person's soul!!!"))
					if("Uma habilidade da pessoa")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Qual o tipo de arma é baseado em cortes ?","Test",) in list("Bo-Staff","Katana","Nunchuks","All Of The Above","Niether"))
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
				switch(input(usr,"Quanto tempo você deve espera para aprender outro jutsu?","Test",) in list("1 Day","1 Age","16 Minutes","Depends on the Jutsu","35 Minutes"))
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
					if("Pela vibração de seu chakra")
						usr.score+=1
					else
						usr.score+=0
				switch(input(usr,"Como você taca uma arma?","Test",) in list("Double Click it","Equipa ela na mão e depois taca","You don't","By pressing G"))
					if("Equipa ela na mão e depois taca.")
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
				switch(input(usr,"Você agora é 1 genin você deseja sair?","Test",) in list("Sim","Não!!!"))
					if("Sim")
						usr.score+=1
					else
						usr.score-=10
				var/Score=0
				if(usr.score!=0)
					Score=(usr.score/20)*100
				usr<<"Você finalizou o testo com [Score] acertos!!!."
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
					usr<<"Você falhou no exame genin!"
					usr<<"Você poderá refaze-lo em 5 minutos!"
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
					switch(input(usr,"Você está indo para o teste? Custa ¥ 20 apenas para iniciá-lo, mas você pode acabar ganhando mais dinheiro! Talvez até mesmo experiência e itens especiais!", text) in list ("Yes","No"))
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
									var/Question=input(usr,"Numero da questão [Questionnumber]! Quanto é [X]-[Z]?","Resposta?") as num
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
										usr<<"Incorreto!Desculpa você perdeu!";usr.alreadytalkingtohim=0;return
							else
								usr<<"Você não tem o dinheiro necessario!";usr.alreadytalkingtohim=0;return
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
						<center><h2>Página 200</h2></center><hr>
						<br>	O mundo do ninja é um mundo vasto que todo Ninja deve compreender , mas a primeira coisa que você deve entender como um ninja é que eles não são Invenciveis . Um ninja pode facilmente morrer a qualquer coisa , que é o Propósito de Jutsus . Há um monte de jutsu neste mundo , mas é dividido em 3 categorias. Ninjutsu , Taijutsu e Genjutsu . Ninjutsu é o auge do Shinobi , onde você pode matar um inimigo a uma distância muito longe com um ataque poderoso e manter-se ileso. A seguir é Taijutsu , o que é muito mais perigoso do que Ninjutsu para quem usa, normalmente. Taijutsu é um estilo de luta de perto , combate corpo-a-corpo . Diferentes ninja têm diferentes tipos de taijutsu , e como um vários tipos de Ninjutsu,vários tipos de Taijutsu existem no mundo . Genjutsu por outro lado é um pouco diferente ,Genjutsu é mais difundido e mais difícil de lidar,considerando que é uma técnica de ilusão .Ela altera a realidade ao redor dos alvos,e eles têm que descobrir como combater a técnica antes que possam ter algum dano grave sobre eles.Não há muitos Genjutsu no mundo,mas há muitos Ninjutsus,no entanto.
						<br>
						<br>	Há também artes mais complicadas que não podem ser discutidos na Academia , é claro que você pode sempre ler livros nas Bibliotecas e entender ainda mais. Vamos explicar a situação de ser um ninja.
						<br>
						<center><h2>Página 201</h2></center><hr>
						<br>    Todas as técnicas ao redor do mundo Ninja se diferem , mas o Ninja deve compreender a si mesmo antes que ele possa entender o inimigo. Um ninja tem três estatísticas vitais , estas estatísticas são Vitalidade, Força e Chakra . Estas estatísticas são importantes , e se for ignorado pode levar ao desaparecimento de um ninja. A primeira estatística a se preocupar é vitalidade . A vitalidade é seu status de saúde e provavelmente o mais importante . Se isso chegar a zero , você morre , exceto para algumas ocasiões especiais . Depois disso , há Chakra . Chakra é o que é usado para fazer técnicas . O Chakra não pode ser usado em alto excesso sem você ter que carregá-lo de volta , é perigoso dependendo de técnicas que você usar, porque eles podem esgotar o seu chakra , que pode ser muito perigoso para você. Stamina por outro lado é a sua energia e você precisa dele para uma variante de coisas , mas é bom você manter a sua resistência para cima, pois se a sua resistência é sempre reduzido para baixo, você vai ser muito lento para qualquer coisa e você pode imediatamente ser morto por um inimigo .
						<br>    Depois disso ,há o controle de Chakra . Cada Ninja precisa de controle de chakra para que eles possam facilmente controlar o Chakra em torno de seu corpo. Sem isso, eles estariam condenados. A quantidade de Chakra cobrada de volta , você ganha baseado fora de seu controle de chakra , assim que ter muito torna melhor para você, se você tem baixo chakra.
						<br>    Os suprimentos de um ninja também são muito importantes . As armas são uma parte vital de um ninja, pois há certas coisas que um Ninja não pode se defender sem técnicas . Armas como Kunai , Shurikens ou mesmo Swords todos fazem dano percentual em cima de um ninja. Junto com coisas como explosões, portanto o usuário e o inimigo devem perceber isso se eles querem sair do mundo para lutar. Porque eles fazem percentual dano baseado diretamente na vitalidade , eles são bastante perigoso e podem exterminar o inimigo imediatamente. Embora os ataques físicos podem ser mais úteis se você é forte o suficiente para conseguir um golpe seco e um poderoso. Porque estes são físicos, é puramente baseado em status do usuário , por isso, se eles são uma pessoa forte  eles podem terminar o jogo ali mesmo . Ataques físicos são ramificados em duas categorias. Ou eles atacam  Vitalidade  diretamente , ou eles atacam Stamina diretamente. Às vezes, eles podem atacar ambos ! Se a sua resistência está esgotado, não se esqueça, ele vai começar a danificar a sua saúde. Às vezes você pode até estar atordoado com o dano que você ganha de um ataque, que deve ter muito cuidado , um ataque simples pode ser o seu último .
						<br>    Para comprar suprimentos , um Ninja deve sempre ter dinheiro também. Eles precisam ser bem alimentado e hidratado totalmente,senão  eles nunca vão estar no seu melhor . Se eles não estiverem totalmente hidratados ou totalmente nutridos , eles podem morrer em batalha mesmo . Para conseguir dinheiro , o Ninja geralmente tem que fazer missões e tarefas para sua vila para ganhar dinheiro. Eles podem vender coisas para os outros ou até mesmo ganhar dinheiro caçando recompensas . É um mundo grande, com o tempo você pode descobrir a melhor maneira de obter dinheiro.
						<br>    é aconselhado para um ninja estar pronto para qualquer evento . Sempre manter armas com você em todos os momentos , pois espera-se que o outro ninja tenha uma arma também. E depois de se qeuipar , não deixe de treinar sempre no caso de essas armas não funcionarem. Pense fora da caixa e aprenda o seu jutsu como se fosse uma parte de seu corpo, domine-o e você não terá nada para se preocupar. Apenas certifique-se de o poder não subir cada vez mais a sua cabeça,nunca subestime seus inimigos,sempre esteja atento pois você pode ser enganado.
						<center><h2>Page 202</h2></center><hr>
						<br>    Como chegamos à última página , há outra coisa que deve ser discutido. Cada Ninja é diferente em todos os sentidos , em habilidades e artes. Alguns Ninja são  mais  diferente do que outros, mas isso é algo que você deve entender como uma pessoa. Quando você nasce , cada ninja tem diferentes potenciais de crescimento e diferente estatística que não pode ser controlado . É claro que você sempre pode ainda treinar-se em determinadas artes de modo que você crescer do jeito que você gosta, mas há certas coisas que você não pode passar.
						<br>    Todo Ninja deve entender que, com suas limitações , há também a sua força. Em técnicas de aprendizagem , há também outra coisa. A Árvore passiva e a arvore de habilidades . A Árvore de habilidades é uma árvore que lhe permite avançar em suas Passives . Passives são coisas que lhe permitem aprimorar suas habilidades ninja e ajudar melhor as coisas mais fáceis , como a perfuração mais rápido ou liberar o cooldown entre Técnicas de Ninjutsu . Depois disso, não é a Árvore Jutsu , que permite que você aprender técnicas de Ninjutsu básico como Kawarimi que todos possam aprender. A Árvore Passive será muito mais útil , mas principalmente para aprender qualquer técnica , você deve sair no mundo e descobrir mais sobre você mesmo a partir de um professor , um livro ou até mesmo aprender  criá-lo em seu próprio país .
						<br>    Para comprar uma passive ou Jutsu , você precisa de pontos de habilidade . Toda vez que você subir de nível você ganha pelo menos 1 Ponto de Habilidade . As pessoas são diferentes , de modo que poderão receber uma quantidade diferente de pontos de habilidade . A fim de subir de nível , porém, você deve ter o seu EXP igual ao seu Max EXP . Fica mais difícil para subir de nível , por isso, em teoria, você pode aprender todos os jutsu do mundo, mas ele vai ficar difícil. É melhor você se concentrar em uma coisa , em vez de tentar aprender tudo, pois nem mesmo os gênios pode se concentrar em tudo . Às vezes , a aprendizagem de uma Jutsu vai proibi-lo de aprender uma outra , também . Os professores também são humanos , para que eles também podem ser ignorantes e não ensiná-lo apenas por causa de seu clã ou até mesmo para uma coisa simples , como o nível .
						<br>    Toda vez que  você subir um nível acima, você ganha um ponto de nível . Você pode usar esse ponto de nivel para adicionar em suas habilidades ainda mais , adicionando a coisas que afetam seu crescimento inicial . Isto é muito útil para a construção de seu personagem.
						<br>    Este é o lugar onde termina os guias . Eu espero que você tenha aprendido muito , este guia não explica tudo sobre o jogo embora, explique algumas das táticas de leitura. Você não terá que ler para sempre , porém, ele termina aqui.
						</body>
						</html>
						"}
					usr << browse("[Stuffz][html]","size=576x576,window=Student Info Guide 101")
					usr.ReadBook=1
					usr.HaveToReadBook=0
				else
					alert("Você já lêu! Você não vai querer lê-lo novamente!","[src]")
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
				switch(alert("Bem-vindo à academia, eu sou o professor aqui. É a sua primeira vez aqui?","[src]","Yes","No"))
					if("Yes")
						if(!usr.rank=="Student")
							alert("as você é um Genin? Você não é um estudante!","[src]")
						else
							if(usr.LearnedAcademy)
								alert("Eu não disse a você cabeça para o professor para começar a sua primeira aula?","[src]")
							else
								alert("Bem-vindo para a academia! Para começar, primeiro temos de começar a ensinar-lhe tudo o que podemos! Dirija-se ao professor em sala de aula a primeira à esquerda para que possamos iniciar.","[src]")
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
						alert("Bom! Agora vá para Romanji lá para que ele possa ensiná-lo sobre Ninja lutando! Ele está na sala à direita de mim.","[src]")
						if(usr.TimeToLearnNinjutsu>=2)
							alert("Oh, você já falou com ele? Em seguida, faça o teste depois de atingir o nível adequado!","[src]");return
						usr.TimeToLearnNinjutsu=1;return
					if(usr.HaveToReadBook)
						alert("Você não leu ainda! Estou de olho em você! Vá até lá e lê-lo ou você nunca vai se tornar um Genin!","[src]")
						return
					if(usr.LearnedAcademy&&!usr.HaveToReadBook&&!usr.ReadBook)
						switch(alert("Did Amano send you?","[src]","Yes","No"))
							if("Yes")
								alert("Vamos começar. Primeiro eu quero que você abra seus livros na página 200 e leia a página 202. Vai ser uma leitura rápida. Depois disso, volte para mim.","[src]")
								usr.HaveToReadBook=1
								return
					else
						alert("Você deveria ir falar com o ninja lá em baixo.","[src]")
						return
				else
					alert("É sempre muito bom ver os alunos todos crescendo.","[src]")
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
								alert("O que você está esperando? Você é um pacifista?","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Você deve saber, A é deixado ataque mão, S é o ataque mão direita, e D é para chutar. Você pode equipar itens com uma das suas mãos e usá-los em conformidade. Agora é hora de um pouco táticas de contador. Para contador, clique em C.","[src]")
								usr.TimeToCounter2=1
								usr.TimeToAttack2=0
								usr.alreadytalkingtohim=0
								return
						if(usr.TimeToCounter2)
							if(usr.TimeToCounter)
								alert("O que você está esperando? Você é um pacifista?","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Agora ele não pode olhar como ele tinha feito nada, mas se você foram atingidos por esse tempo que você teria evadido em outra direção. É uma certeza fogo maneira de evitar ataques. Agora Guarda é um ataque que resiste a você de ataques baseados em Vigor, aumentando a sua resistência. Para Guard, clique em X..","[src]")
								usr.TimeToCounter2=0
								usr.TimeToGuard2=1
								usr.alreadytalkingtohim=0
								return
						if(usr.TimeToGuard2)
							if(usr.TimeToGuard)
								alert("O que você está esperando? Você é um pacifista? ","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Agora, uma coisa final. Mantendo pressionada Z, você vai cobrar chakra! Você cobra Chakra baseado fora de seu controle de chakra, e é a maneira de ganhar Chakra de volta! Ele também dá EXP! Vá em frente, tente!","[src]")
								usr.TimeToGuard2=0
								usr.TimeToCharge2=1
								usr.alreadytalkingtohim=0
								return
						if(usr.TimeToCharge2)
							if(usr.TimeToCharge)
								alert("O que você está esperando? Você é um pacifista?","[src]")
								usr.alreadytalkingtohim=0
								return
							else
								alert("Bom! Agora eu acho que você precisa de mais tempo na experiência como estudante. Eu acho que você deve ir flexionar os músculos, mas primeiro vou dar-lhe 3 Pontos de Perícia. O que eu quero que você faça é aprender Bunshin No Jutsu, Kawarimi no Jutsu e Henge no Jutsu. Você não pode aprender outras técnicas sem ele.","[src]")
								usr.TimeToCharge2=0
								usr.TimeToLearnNinjutsu=2
								usr.alreadytalkingtohim=0
								return
						alert("Ah sim! Eu sempre gosto de ver os novos estudantes aqui e ali! De qualquer forma, vamos começar! Primeiro temos que ensiná-lo a lutar!","[src]")
						alert("O primeiro aspecto da luta está atacando, é claro! Socos, pontapés, todas essas coisas boas. Experimente, Clique A, S ou D e você deve atacar!","[src]")
						usr.TimeToAttack2=1
						usr.TimeToAttack=1
						usr.alreadytalkingtohim=0
						return
					else
						alert("Espero que você experimentou algumas táticas de treinamento!","[src]")
						usr.alreadytalkingtohim=0
						return
				else
					alert("Haha! Então você é um [usr.rank], hein ?! Ótimo, eu sou um professor!","[src]")
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
					alert("Espero que você saiba as maneiras que você pode treinar! Eu prefiro formação em registros, mas muitos trem por desperdiçar o seu chakra e carregá-la de volta! Você pode treinar por Sparring, toda vez que você bater em alguém que você ganha EXP baseado fora do dano que você fez às vezes! Você pode ganhar EXP de leitura, mesmo! Mas Reading soa muito chato.","[src]")
					alert("Sugiro Sparring, a experiência é a melhor maneira de treinar!","[src]")
					return
				else
					alert("Então você certamente sabe como treinar, certo?","[src]")
					return