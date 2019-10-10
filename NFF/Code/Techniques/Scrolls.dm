mob/Scroll_Vender
	name = "Scroll Seller"
	icon = 'ScrollkeeperNPC.dmi'
	CNNPC = 1
	health = 9999999999999999999999999999999999999999999999
	verb/Command()
		set src in oview(1)
		set hidden=1
		switch(input(usr,"Qual Pergaminio Você gostaria de comprar?", text) in list ("Pergaminio de Experiencia","Cancel"))
			if("Pergaminio de Experiencia")
				switch(input(usr,"Isso custa 200 ryos , tem certeza que deseja comprar?",text) in list("Sim","Não"))
					if("Sim")
						if(usr.Yen>200)
							usr<<"Ate mais!"
							var/obj/Scrolls/GenerativeScroll/A=new();A.loc=usr
							usr.Yen-=200
						else
							usr<<"Você não tem dinheiro suficiente.";return
///////////////////////////////////
mob/var/tmp/GenerativeScrollOn=0
mob/var/tmp/PressAButton=""
mob/var/tmp/CanUseScroll=1
obj/var/ItemDescription=""
obj/Scrolls/
	icon='scrolls.dmi'
	BigShurikenWeaponScroll
		name="Shuriken"
		icon_state="Katon scroll"
	/*	New()
			var/obj/Scrolls/BigShurikenWeaponScroll/A=new
			A.ItemDescription="Combination: "
		Click()
			winshow(usr,"ItemDescription",1)*/



	MultiKageShurikenWeaponScroll
		name="Kage Shuriken"
		icon_state="Katon scroll"
		Click()
	MissileBomb
		name="MissileBomb"
		icon_state="Katon scroll"

	HoukaWeaponScroll
		name="MissileBomb"
		icon_state="Katon scroll"
	GenerativeScroll
		name="Pergaminio de Exp"
		icon_state="gay scroll"
		Click()
			if(usr.Mogu||(usr.firing&&usr.GenerativeScrollOn==0)||(usr.Frozen&&usr.GenerativeScrollOn==0)||usr.knockedout||usr.FrozenBind!="")
				return
			if(usr.GenerativeScrollOn==2||usr.GenerativeScrollOn==3||usr.GenerativeScrollOn==4||usr.GenerativeScrollOn==5||usr.GenerativeScrollOn==6)
				usr<<"You're already reading another scroll.";usr.Frozen=0
			if(!usr.CanUseScroll)
				usr<<"Wait the damn delay!";return
			if(usr.GenerativeScrollOn)
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"You stop reading the scroll!"
				for(var/obj/Effects/P in usr.client.screen)
					if(istype(P,/obj/Effects/ZMash))
						del(P)
					if(istype(P,/obj/Effects/XMash))
						del(P)
		//		for(var/obj/Effects/ZMash/A in usr.client.screen)
		//			del(A)
		//		for(var/obj/Effects/XMash/A in usr.client.screen)
		//			del(A)
				usr.icon_state="";usr.Frozen=0
			else
				if(usr.Mogu||usr.firing||usr.Frozen||usr.knockedout||usr.FrozenBind!="")
					return
				usr.icon_state="rest";usr.Frozen=1
				src.CreateScroll()
				usr<<"You sit down as you begin to read the scroll. Your EXP is slowly going up!"
			//	if(usr.Mogu||usr.firing||usr.Frozen||usr.FrozenBind!="")
				usr.GenerativeScrollOn=1
				var/obj/scroll/H = new();H.loc=locate(src.x,src.y-1,src.z)
				while(usr.GenerativeScrollOn)
					usr.chakra-=10
					if(prob(50))
						usr.PressAButton="Z"
						usr.client.screen+=new/obj/Effects/ZMash
						spawn(15)
							if(usr.PressAButton=="Z")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/P in usr.client.screen)
									if(istype(P,/obj/Effects/ZMash))
										del(P)
									if(istype(P,/obj/Effects/XMash))
										del(P)
							//	for(var/obj/Effects/ZMash/A in usr.client.screen)
							//		del(A)
							//	for(var/obj/Effects/XMash/A in usr.client.screen)
							//		del(A)
								usr.Frozen=0
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					else
						usr.PressAButton="X"
						usr.client.screen+=new/obj/Effects/XMash
						spawn(15)
							if(usr.PressAButton=="X")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								usr.Frozen=0
								for(var/obj/Effects/P in usr.client.screen)
									if(istype(P,/obj/Effects/ZMash))
										del(P)
									if(istype(P,/obj/Effects/XMash))
										del(P)
							//	for(var/obj/Effects/ZMash/A in usr.client.screen)
							//		del(A)
							//	for(var/obj/Effects/XMash/A in usr.client.screen)
							//		del(A)
								usr.Frozen=0
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					sleep(100)
				usr.PressAButton=""
				del(H)


	KatonScroll
		name="Fire Generative Scroll"
		icon_state="Katon scroll"
		Click()
			if(usr.GenerativeScrollOn==1||usr.GenerativeScrollOn==3||usr.GenerativeScrollOn==4||usr.GenerativeScrollOn==5||usr.GenerativeScrollOn==6)
				usr<<"You're already reading another scroll.";return
			if(!usr.CanUseScroll)
				usr<<"Wait the damn delay!";return
			if(usr.GenerativeScrollOn==2)
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"You stop reading the scroll!"
				for(var/obj/Effects/ZMash/A in usr.client.screen)
					del(A)
				for(var/obj/Effects/XMash/A in usr.client.screen)
					del(A)
				usr.icon_state="";usr.Frozen=0
				usr.GenerativeScrollOn=0
			else
				usr.icon_state="rest";usr.Frozen=1
				usr<<"You sit down as you begin to read the scroll!"
				usr.GenerativeScrollOn=2
				while(usr.GenerativeScrollOn==2)
					if(usr.JutsuInLearning!="")
						if(usr.TypeLearning=="Katon")
							usr.exp+=rand(10,25)
							if(usr.Subscriber)
								usr.exp+=rand(5,10)
					usr.chakra-=10
					if(prob(50))
						usr.PressAButton="Z"
						usr.client.screen+=new/obj/Effects/ZMash
						spawn(15)
							if(usr.PressAButton=="Z")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					else
						usr.PressAButton="X"
						usr.client.screen+=new/obj/Effects/XMash
						spawn(15)
							if(usr.PressAButton=="X")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					sleep(100)
	FuutonScroll
		name="Fuuton Generative Scroll"
		icon_state="Fuuton scroll"
		Click()
			if(usr.GenerativeScrollOn==1||usr.GenerativeScrollOn==2||usr.GenerativeScrollOn==4||usr.GenerativeScrollOn==5||usr.GenerativeScrollOn==6)
				usr<<"You're already reading another scroll.";return
			if(!usr.CanUseScroll)
				usr<<"Wait the damn delay!";return
			if(usr.GenerativeScrollOn==3)
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"You stop reading the scroll!"
				for(var/obj/Effects/ZMash/A in usr.client.screen)
					del(A)
				for(var/obj/Effects/XMash/A in usr.client.screen)
					del(A)
				usr.icon_state="";usr.Frozen=0
				usr.GenerativeScrollOn=0
			else
				usr.icon_state="rest";usr.Frozen=1
				usr<<"You sit down as you begin to read the scroll!"
				usr.GenerativeScrollOn=3
				while(usr.GenerativeScrollOn==3)
					if(usr.JutsuInLearning!="")
						if(usr.TypeLearning=="Fuuton")
							usr.exp+=rand(10,25)
							if(usr.Subscriber)
								usr.exp+=rand(10,15)
					usr.chakra-=10
					if(prob(50))
						usr.PressAButton="Z"
						usr.client.screen+=new/obj/Effects/ZMash
						spawn(15)
							if(usr.PressAButton=="Z")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					else
						usr.PressAButton="X"
						usr.client.screen+=new/obj/Effects/XMash
						spawn(15)
							if(usr.PressAButton=="X")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					sleep(100)
	DotonScroll
		name="Doton Generative Scroll"
		icon_state="Doton scroll"
		Click()
			if(usr.GenerativeScrollOn==1||usr.GenerativeScrollOn==2||usr.GenerativeScrollOn==3||usr.GenerativeScrollOn==5||usr.GenerativeScrollOn==6)
				usr<<"You're already reading another scroll.";return
			if(!usr.CanUseScroll)
				usr<<"Wait the damn delay!";return
			if(usr.GenerativeScrollOn==4)
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"You stop reading the scroll!"
				for(var/obj/Effects/ZMash/A in usr.client.screen)
					del(A)
				for(var/obj/Effects/XMash/A in usr.client.screen)
					del(A)
				usr.icon_state="";usr.Frozen=0
				usr.GenerativeScrollOn=0
			else
				usr.icon_state="rest";usr.Frozen=1
				usr<<"You sit down as you begin to read the scroll!"
				usr.GenerativeScrollOn=4
				while(usr.GenerativeScrollOn==4)
					if(usr.JutsuInLearning!="")
						if(usr.TypeLearning=="Doton")
							usr.exp+=rand(10,25)
							if(usr.Subscriber)
								usr.exp+=rand(10,15)
					usr.chakra-=10
					if(prob(50))
						usr.PressAButton="Z"
						usr.client.screen+=new/obj/Effects/ZMash
						spawn(15)
							if(usr.PressAButton=="Z")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					else
						usr.PressAButton="X"
						usr.client.screen+=new/obj/Effects/XMash
						spawn(15)
							if(usr.PressAButton=="X")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					sleep(100)
	SuitonScroll
		name="Suiton Generative Scroll"
		icon_state="Suiton scroll"
		Click()
			if(usr.GenerativeScrollOn==1||usr.GenerativeScrollOn==2||usr.GenerativeScrollOn==3||usr.GenerativeScrollOn==4||usr.GenerativeScrollOn==6)
				usr<<"You're already reading another scroll.";return
			if(!usr.CanUseScroll)
				usr<<"Wait the damn delay!";return
			if(usr.GenerativeScrollOn==5)
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"You stop reading the scroll!"
				for(var/obj/Effects/ZMash/A in usr.client.screen)
					del(A)
				for(var/obj/Effects/XMash/A in usr.client.screen)
					del(A)
				usr.icon_state="";usr.Frozen=0
				usr.GenerativeScrollOn=0
			else
				usr.icon_state="rest";usr.Frozen=1
				usr<<"You sit down as you begin to read the scroll!"
				usr.GenerativeScrollOn=5
				while(usr.GenerativeScrollOn==5)
					if(usr.JutsuInLearning!="")
						if(usr.TypeLearning=="Suiton")
							usr.exp+=rand(10,25)
							if(usr.Subscriber)
								usr.exp+=rand(10,15)
					usr.chakra-=10
					if(prob(50))
						usr.PressAButton="Z"
						usr.client.screen+=new/obj/Effects/ZMash
						spawn(15)
							if(usr.PressAButton=="Z")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					else
						usr.PressAButton="X"
						usr.client.screen+=new/obj/Effects/XMash
						spawn(15)
							if(usr.PressAButton=="X")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					sleep(100)
	RaitonScroll
		name="Raiton Generative Scroll"
		icon_state="Raiton scroll"
		Click()
			if(usr.GenerativeScrollOn==1||usr.GenerativeScrollOn==2||usr.GenerativeScrollOn==3||usr.GenerativeScrollOn==4||usr.GenerativeScrollOn==5)
				usr<<"You're already reading another scroll.";return
			if(!usr.CanUseScroll)
				usr<<"Wait the damn delay!";return
			if(usr.GenerativeScrollOn==6)
				usr.CanUseScroll=0
				spawn(150)
					usr.CanUseScroll=1
				usr<<"You stop reading the scroll!"
				for(var/obj/Effects/ZMash/A in usr.client.screen)
					del(A)
				for(var/obj/Effects/XMash/A in usr.client.screen)
					del(A)
				usr.icon_state="";usr.Frozen=0
				usr.GenerativeScrollOn=0
			else
				usr.icon_state="rest";usr.Frozen=1
				usr<<"You sit down as you begin to read the scroll!"
				usr.GenerativeScrollOn=6
				while(usr.GenerativeScrollOn==6)
					if(usr.JutsuInLearning!="")
						if(usr.TypeLearning=="Raiton")
							usr.exp+=rand(10,25)
							if(usr.Subscriber)
								usr.exp+=rand(10,15)
					usr.chakra-=10
					if(prob(50))
						usr.PressAButton="Z"
						usr.client.screen+=new/obj/Effects/ZMash
						spawn(15)
							if(usr.PressAButton=="Z")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					else
						usr.PressAButton="X"
						usr.client.screen+=new/obj/Effects/XMash
						spawn(15)
							if(usr.PressAButton=="X")
								usr.CanUseScroll=0
								spawn(150)
									usr.CanUseScroll=1
								usr<<"You didn't press it fast enough!"
								for(var/obj/Effects/ZMash/A in usr.client.screen)
									del(A)
								for(var/obj/Effects/XMash/A in usr.client.screen)
									del(A)
								usr.PressAButton=""
								usr.GenerativeScrollOn=0
					sleep(100)
obj/Scrolls/ArtScrolls
	Clay
		var
			ArtworkItTeaches=""
			ClayMasteryRequirement=15
			Learning=0
		verb
			Learn()
				if(src.Learning)
					return
				if(usr.ClayMastery<src.ClayMasteryRequirement)
					usr<<"You need more Clay Mastery!";return
				if(src.ArtworkItTeaches=="")
					usr<<"It seems you've been jipped! There's nothing in this scroll!?";del(src)
				for(var/V in usr.KibakuAbilities)
					if(V==src.ArtworkItTeaches)
						usr<<"You already know this form of art!";return
				usr<<"You begin to study the artwork!"
				src.Learning=1
				sleep(100)
				usr<<"You've learned how to create [src.ArtworkItTeaches]!"
				usr.KibakuAbilities+=src.ArtworkItTeaches
				usr<<"You discard the scroll!"
				del(src)
			Drop()
				usr<<"You drop the scroll."
				del(src)
		FlowerScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Flower"
			ClayMasteryRequirement=0
/*Future Art Scrolls
		MineScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Mines"
			ClayMasteryRequirement=25
		BallScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Ball"
			ClayMasteryRequirement=0
		OwlScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Owl"
			ClayMasteryRequirement=0
		RacoonScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Racoon"
			ClayMasteryRequirement=0
		WyvernScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Wyvern"
			ClayMasteryRequirement=25
		DragonScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Dragon"
			ClayMasteryRequirement=45
		LeviathanScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Leviathan"
			ClayMasteryRequirement=100
		SnakeScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Snake"
			ClayMasteryRequirement=15
		ScorpionScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Scorpion"
			ClayMasteryRequirement=35
		CentipedeScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Centipede"
			ClayMasteryRequirement=45
*/
		WallScroll
			icon_state="Kage Bunshin scroll"
			ArtworkItTeaches="Wall"
			ClayMasteryRequirement=0
obj/Scrolls/ContractScrolls
	icon_state="Kage Bunshin scroll"
	var
		ContractKingdom
	verb
		Sign()
			usr<<"You open up the Contract Kingdom Scroll for the [ContractKingdom] Summons."
			if(usr.ContractSummon!="")
				usr<<"It's really nice, but you're already signed to [ContractKingdom].";return
			switch(input(usr,"Are you sure you want to sign this? You can't unsign your name and you can't sign any other contracts.", text) in list ("Yes","No"))
				if("Yes")
					switch(input(usr,"Are you positive?!.", text) in list ("Yes","No"))
						if("Yes")
							switch(input(usr,"Making sure one last time.", text) in list ("Just give it to me already, GOSH!","No"))
								if("Just give it to me already, GOSH!")
									usr<<"The scroll calls you an asshole as you sign your name on the Contract now giving you the ability to Summon [ContractKingdom] Summons."
									usr.ContractSummon=src.ContractKingdom

	Frog_Kingdom_Scroll
		ContractKingdom="Frog"
	Slug_Kingdom_Scroll
		ContractKingdom="Slug"
	Serpent_Kingdom_Scroll
		ContractKingdom="Serpent"
	Canine_Kingdom_Scroll
		ContractKingdom="Canine"
	Fairy_Kingdom_Scroll
		ContractKingdom="Fairy"
obj/Scrolls/LearningScrolls
	var
		NameOfJutsu=""
		EXPRequired
		JutsuObjName=""
		TheDescription=""
		TheJutsuType=""

		KKnowledgeReq=0

		NKnowledgeReq=0
		GKnowledgeReq=0
		TKnowledgeReq=0
		FKnowledgeReq=0
		SummonKingdomRequired=""
		ChakraRequired=0
	verb
		Learn()
			usr<<"You open up the scroll and begin to read it!"
			sleep(50)
			if(TheJutsuType=="Katon")
				if(!usr.FireE)
					usr<<"You need to be able to utilize Katon to learn this technique!";return

			if(TheJutsuType=="Doton")
				if(!usr.EarthE)
					usr<<"You need to be able to utilize Doton to learn this technique!";return

			if(TheJutsuType=="Fuuton")
				if(!usr.WindE)
					usr<<"You need to be able to utilize Fuuton to learn this technique!";return
			if(usr.FuuinjutsuKnowledge<src.FKnowledgeReq)
				usr<<"You don't understand the technique. Perhaps you need more Fuuinjutsu Knowledge.";return
			if(usr.NinjutsuKnowledge<src.NKnowledgeReq)
				usr<<"You don't understand the technique. Perhaps you need more Ninjutsu Knowledge.";return
			if(usr.TaijutsuKnowledge<src.TKnowledgeReq)
				usr<<"You don't understand the technique. Perhaps you need more Taijutsu Knowledge.";return
			if(usr.GenjutsuKnowledge<src.GKnowledgeReq)
				usr<<"You don't understand the technique. Perhaps you need more Genjutsu Knowledge.";return
			usr.LearnJutsu(src.NameOfJutsu,src.EXPRequired,src.JutsuObjName,src.TheDescription,src.TheJutsuType)
		Get()
			set src in oview(1)
			src.loc=usr
		Drop()
			usr<<"You drop the scroll."
			del(src)
//Ninjutsu

	Puppet_Master_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Puppet Master Jutsu"
		EXPRequired=50000
		JutsuObjName="Puppet_Master_Jutsu"
		TheDescription="Puppet Master Jutsu is a technique passed down through generations of ninja controlling puppets via chakra strings."
		TheJutsuType="Ninjutsu"
	Puppet_Swap_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Puppet/Body Swap"
		EXPRequired=15000
		JutsuObjName="Puppet_Body_Swap"
		TheDescription="Puppet Swap is a decietful Puppet Master technique that allows you to switch locations with your Puppet of your choice by cunning clicking onto them."
		TheJutsuType="Ninjutsu"
	Puppet_View_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Puppet Body View"
		EXPRequired=15000
		JutsuObjName="Puppet_Body_View"
		TheDescription="Puppet/Body view is a technique that allows you to take the sight of your Puppet."
		TheJutsuType="Ninjutsu"
	Puppet_Return_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Puppet Return"
		EXPRequired=15000
		JutsuObjName="Puppet_Return"
		TheDescription="Puppet Return is a technique that summons the Puppet back to you."
		TheJutsuType="Ninjutsu"
	FalseDeathScroll
		name="False Death Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="False Death"
		EXPRequired=75000
		JutsuObjName="FalseDeath"
		TheDescription="False Death is a technique that is able to be utilized without the use of chakra but rather with primal instincts. The user plays dead, hoping that the opponent will then leave them there assuming they died so the user can make an escape once they have left."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=225
	KageBunshinScroll
		name="Shadow Clone Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Kage Bunshin No Jutsu"
		EXPRequired=50000
		JutsuObjName="KageBunshin"
		TheDescription="Kage Bunshin No Jutsu is a technique which creates a real clone that can attack the target. This jutsu allows you to control the clone as it has half of your chakra. They disperse after one hit."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=50
	TajuuKageBunshinScroll
		name="Multi-Shadow Clone Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Tajuu Kage Bunshin No Jutsu"
		EXPRequired=50000
		JutsuObjName="TKageBunshin"
		TheDescription="Tajuu Kage Bunshin No Jutsu is a strong version of Tajuu Kage Bunshin No Jutsu which summons tons of clones to fight!"
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=50
	ExplodingKageBunshinScroll
		name="Exploding Clone Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Bakuretsu Bunshin No Jutsu"
		EXPRequired=35000
		JutsuObjName="BakuretsuBunshin"
		TheDescription="Bakuretsu Bunshin No Jutsu is a technique that explodes all the clones the user has created!"
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=75
	BodyFlameScroll
		name="Body Flame Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Body Flame Technique"
		EXPRequired=40000
		JutsuObjName="BodyFlameJutsu"
		TheDescription="Body Flame Technique is a technique that makes the user become engulfed in flames, once they're engulfed in flames their body will eventually teleport to where they set a marker using this Jutsu the first time!"
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=200
	MultipleShurikenScroll
		name="Shadow Shuriken Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Kage Shuriken No Jutsu"
		EXPRequired=50000
		JutsuObjName="KageShuriken"
		TheDescription="Kage Shuriken No Jutsu is a jutsu which clones a thrown shuriken so it can duplicate its damage."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=400
	MultipleKunaiScroll
		name="Shadow Kunai Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Kage Kunai No Jutsu"
		EXPRequired=50000
		JutsuObjName="KageKunai"
		TheDescription="Kage Kunai No Jutsu is a jutsu which clones a thrown Kunai so it can duplicate its damage."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=400
	RainingTagScroll
		name="Raining Tag Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Raining Tags"
		EXPRequired=40000
		JutsuObjName="RainingTags"
		TheDescription="Raining tags is a jutsu which allows the user to engulf the field in tags."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=300
	ChakraEnhanceScroll
		name="Chakra Enhance Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Chakra Enhance"
		EXPRequired=15000
		JutsuObjName="ChakraEnhance"
		TheDescription="Chakra Enhance is a technique that converts the user's chakra temporarily to a weapon forcing it to not only do damage but have stronger effects to maybe even go through objects."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=30
	ExpandingShurikenScroll //ExpandingShuriken
		name="Expanding Shuriken Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Expanding Shuriken"
		EXPRequired=45000
		JutsuObjName="ExpandingShuriken"
		TheDescription="Expanding Shuriken is a jutsu where one throws a single shuriken to confuse the enemy and is able to Press X to to create more in different directions!"
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=400
	KunaiBarrageScroll
		name="Kunai Barrage Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Kunai Barrage"
		EXPRequired=35000
		JutsuObjName="KunaiBarrage"
		TheDescription="Kunai barrage is a jutsu which throws a massive amount of Kunai at the enemy."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=300
	WeaponSummoningKunaiScroll
		name="Weapon Summoning: Kunai"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Weapon Summoning: Kunai"
		EXPRequired=35000
		JutsuObjName="WeaponSummoningKunai"
		TheDescription="Weapon Summoning: Kunai is a jutsu meant for those that are low on ninja tools in a dire situation. It allows them to summon Kunais in the midst of battle to aid them if given the opportunity."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=450
	ControllingWindmillScroll
		name="Manual Windmill Control"
		icon_state="Kage Bunshin Scroll"
		NameOfJutsu="Windmill Control"
		EXPRequired=40000
		JutsuObjName="ControllingWindmill"
		TheDescription="Manual Windmill Control allows the user to create a windmill and move it with their chakra."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=400
	HairNeedleSenbonScroll
		name="Hair Needle Senbon"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Hair Needle Senbon"
		EXPRequired=35000
		JutsuObjName="HairNeedleSenbon"
		TheDescription="Hair Needle Senbon is a jutsu which allows the user to turn their hair into a large sharp amount of Senbons, hurling them at the user."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=300
	WeaponReverseScroll
		name="Weapon Reverse Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Weapon Reverse"
		EXPRequired=15000
		JutsuObjName="WeaponReverse"
		TheDescription="Weapon Reverse is a jutsu that reverses the weapon from the actual direction it was going as long as it was enhanced with the proper chakra.."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=30

	GuidingWeaponScroll
		name="Guiding Weapon Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="GuidingWeapon"
		EXPRequired=30000
		JutsuObjName="GuidingWeapon"
		TheDescription="Guiding Weapone is a jutsu that guides the Chakra-Infused weapon to a target."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=30
//Genjutsu

	BlazingBurnScroll
		name="Blazing Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Blazing Burn"
		EXPRequired=40000
		JutsuObjName="BlazingBurn"
		TheDescription="Blazing Burn is a strong Genjutsu technique that makes the target think they are burning to a crisp, engulfed in flames, causing them to go crazy."
		TheJutsuType="Genjutsu"
		GKnowledgeReq=75
//Taijutsu
	KarakuriScroll
		name="Karakuri Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Karakuri"
		EXPRequired=25000
		JutsuObjName="Karakuri"
		TheDescription="Karakuri is a powerful taijutsu technique which allows the user to quickly use their stamina to boost their body and push themselves in the opposite direction allowing for quick movement."
		TheJutsuType="Taijutsu"
		TKnowledgeReq=25
//Fuuinjutsu
	HandsealSealScroll
		name="Handseal-Seal Scroll"
		icon_state="Doton scroll"
		NameOfJutsu="Fuuinjutsu: Handseal"
		EXPRequired=50000
		JutsuObjName="FuuinjutsuHandseal"
		TheDescription="Fuuinjutsu Handseal is a jutsu that seals the opponent's handseals making it impossible for them to generate chakra from handseal based jutsu."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=0
	ControlSealScroll
		name="Control-Seal Scroll"
		icon_state="Doton scroll"
		NameOfJutsu="Fuuinjutsu: Control"
		EXPRequired=65000
		JutsuObjName="FuuinjutsuControl"
		TheDescription="Fuuinjutsu Control is a jutsu that seals the Opponent's control, causing their jutsu's chakra cost to go out of control temporarily."
		TheJutsuType="Fuuinjutsu"
		FKnowledgeReq=25
	HellSentSealScroll
		name="HellSent Seal"
		icon_state="Doton scroll"
		NameOfJutsu="Fuuinjutsu: HellSent"
		EXPRequired=47500
		JutsuObjName="FuuinjutsuHellSent"
		TheDescription="Fuuinjutsu HellSent is a jutsu that partially seals and alters the  Opponent's Chakra control, causing their chakra to restore at altered proportions."
		TheJutsuType="Fuuinjutsu"
		FKnowledgeReq=40
	ChakraSealScroll
		name="Chakra-Seal Scroll"
		icon_state="Doton scroll"
		NameOfJutsu="Fuuinjutsu: Chakra"
		EXPRequired=50000
		JutsuObjName="FuuinjutsuChakra"
		TheDescription="Fuuinjutsu Chakra is a jutsu that allows you to seal the opponent's chakra circulatory system making it impossible for them to generate or utilize chakra."
		TheJutsuType="Ninjutsu"
		NKnowledgeReq=10
	FiveElementSeal
		name="Five Elemental Seal Scroll"
		icon_state="Doton scroll"
		NameOfJutsu="Fuuinjutsu: Five Elemental Seal"
		EXPRequired=65000
		JutsuObjName="FiveElementSeal"
		TheDescription="Fuuinjutsu Five Element Seal is a jutsu created on the bases of wanting to ward your opponent off of utilizing Elemental Techniques, screwing up their chakra's ability to shape transform into elemental properties temporarily."
		TheJutsuType="Fuuinjutsu"
		FKnowledgeReq=60
//Katon
	GoukakyuuScroll
		name="Fireball Scroll"
		icon_state="Katon scroll"
		NameOfJutsu="Katon: Fireball Jutsu"
		EXPRequired=12500
		JutsuObjName="Goukakyuu"
		TheDescription="Katon: Fireball jutsu is a field ranged jutsu that releases fire from the mouth. It covers a small radius, that can improve, so it can be very useful in combat."
		TheJutsuType="Katon"
		KKnowledgeReq=25
	HosenkaScroll
		name="Phoenix Fire Scroll"
		icon_state="Katon scroll"
		NameOfJutsu="Katon: Phoenix Jutsu"
		EXPRequired=10000
		JutsuObjName="Housenka"
		TheDescription="Katon: Phoenix Fire Jutsu is a jutsu that shoots multiple fire balls from the mouth that explode in fire on contact of a target."
		TheJutsuType="Katon"
		KKnowledgeReq=25
	KaryuuEndanScroll
		name="Fire Dragon Flame Projectile Scroll"
		icon_state="Katon scroll"
		NameOfJutsu="Katon: Fire Dragon Flame Projectile Jutsu"
		EXPRequired=25000
		JutsuObjName="KaryuuEndan"
		TheDescription="Katon: Fire Dragon Flame Projectile shoots a large blast of fire in a straight direction that burns enemies as it flows. It has incredible destruction ratio."
		TheJutsuType="Katon"
		KKnowledgeReq=250
	RyuukaScroll
		name="Dragon Fire Scroll"
		icon_state="Katon scroll"
		NameOfJutsu="Katon: Dragon Fire Jutsu"
		EXPRequired=22500
		JutsuObjName="Ryuuka"
		TheDescription="Katon: Dragon Fire is a concentrated form of Fire Dragon Flame Projectile that shoots a concentrated blast that explodes on contact of a physical object."
		TheJutsuType="Katon"
		KKnowledgeReq=37
//////////////WEAPON SCROLLS////////////////////////


//Doton
//	HidingLikeAMoleScroll
//		name="Hiding-Mole Scroll"
//		icon_state="Doton scroll"
//		NameOfJutsu="Doton: Hiding Like A Mole"
//		EXPRequired=10000
//		JutsuObjName="Moguragakure"
//		TheDescription="Doton: Hiding Like A Mole Jutsu is a jutsu that allows you to go deep underground and pop up as if you were in a wack a mole scenario."
//		TheJutsuType="Doton"

//Fuuton
//Summoning
	RashoumonScroll
		name="Rashoumon Scroll"
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Rashoumon"
		EXPRequired=35000
		JutsuObjName="Rashoumon"
		TheDescription="Rashoumon is a powerful defensive shield that blocks powerful techniques in coming. It's known as the gate that no one passes."
		NKnowledgeReq=200
//Last Airbender Event
//Wind
	KazeScroll1
		name="Airbender Scroll Ichi"
		icon_state="Fuuton"
		NameOfJutsu="Air Style: Gust"
		EXPRequired=15000
		JutsuObjName="Gust"
		TheDescription="Fuuton: Gust is a jutsu that propels a gust of wind at the enemy."
		TheJutsuType="Fuuton"
	KazeScroll2
		name="Airbender Scroll Ni"
		icon_state="Fuuton"
		NameOfJutsu="Air Style: Whirlwind"
		EXPRequired=30000
		JutsuObjName="Whirlwind"
		TheDescription="Fuuton: Whirlwind is a technique where the user spins rapidly and shoots off a powerful whirlwind."
		TheJutsuType="Fuuton"
	KazeScroll3
		name="Airbender Scroll San"
		icon_state="Fuuton"
		NameOfJutsu="Air Style: Air Dash"
		EXPRequired=10000
		JutsuObjName="AirDash"
		TheDescription="Fuuton: Air Dash is a technique that dashes the user forward for quicker movement."
		TheJutsuType="Fuuton"
	KazeScroll4
		name="Airbender Scroll Yon"
		icon_state="Fuuton"
		NameOfJutsu="Air Style: Air Ball"
		EXPRequired=15000
		JutsuObjName="AirBall"
		TheDescription="Fuuton: Air Ball is a technique that shoots a pressurized ball of wind."
		TheJutsuType="Fuuton"

	Fairy_Joy_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Joy)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Joy"
		TheDescription="Joy are one of the mysterious, pure summons just recently found that summons a Fairy. She is said to heal whoever she's near."
		SummonKingdomRequired="Fairy"
	Fairy_Ene_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Ene)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Ene"
		TheDescription="Ene are one of the mysterious, pure summons just recently found that summons a Fairy. She is said to energize whoever she's near."
		SummonKingdomRequired="Fairy"
	Fairy_Nega_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Nega)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Nega"
		TheDescription="Nega are one of the mysterious, pure summons just recently found that summons a Fairy. She is said to hurt whoever she's near."
		SummonKingdomRequired="Fairy"
	Fairy_Inf_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Inf)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Inf"
		TheDescription="Inf are one of the mysterious, pure summons just recently found that summons a Fairy. She is said to give information on whoever is near."
		SummonKingdomRequired="Fairy"
//////Summoning Scroll//////
	Wolf_Darke_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Darke)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Darke"
		TheDescription="Darke is a strong wolf, said to be loyal since the dark ages."
		ChakraRequired=1500
		SummonKingdomRequired="Canine"
	Wolf_Griffin_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Griffin)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Griffin"
		TheDescription="Griffin is a support wolf. He has the ability of replicating space time, by summoning you whenever your chakra is ready!"
		ChakraRequired=1500
		SummonKingdomRequired="Canine"
	Wolf_Zune_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Zune)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Zune"
		TheDescription="No one knows who Zune is, or what he is. But his spirit has a good ass nose."
		ChakraRequired=2500
		SummonKingdomRequired="Canine"
	Wolf_Zute_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Zute)"
		EXPRequired=25000
		JutsuObjName="Summoning_Jutsu_Zute"
		TheDescription="No one knows who Zute is, or what he is. But his spirit has a good ass nose."
		ChakraRequired=2500
		SummonKingdomRequired="Canine"
	Wolf_Coro_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Coro)"
		EXPRequired=100000
		JutsuObjName="Summoning_Jutsu_Coro"
		TheDescription="Coro is the embodiment of badass. You'll never ride him."
		ChakraRequired=5000
		SummonKingdomRequired="Canine"
//slug
	Slug_Katsuya_Summoning_Scroll
		icon_state="Kage Bunshin scroll"
		NameOfJutsu="Summoning Jutsu(Katsuya)"
		EXPRequired=1000000
		JutsuObjName="Summoning_Jutsu_Katsuya"
		TheDescription="Katsuya only follows those who she can latch onto"
		ChakraRequired=9000
		SummonKingdomRequired="Katsuya"