mob/var/tmp
	LearnedAcademy=0
	HaveToReadBook=0
	ReadBook=0
	TimeToLearnNinjutsu=0
	TimeToAttack=0
	TimeToAttack2=0
	TimeToCounter=0
	TimeToCounter2=0
	TimeToGuard=0
	TimeToGuard2=0
	TimeToCharge=0
	TimeToCharge2=0
//switch(input(usr,"To convert to the Gouken Ryuu fighting style, it requires 10 Skill points. Do you want to learn it?", "Gouken Ryuu") in list ("Yes","No"))








mob/NPC/DojoNPCs/Tutorial
	DojoOwner
		name="Military General"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"Hi! I am the Dojo Owner. Welcome!"
			sleep(30)
			usr<<"Eh? You look a bit lost. Is there anything I can help you with?"
			Questions
			switch(input(usr,"Do you have any Questions?", "Questions") in list ("What is this place?","Is there anybody else here?","Am I safe here?","What can I do here?","Can I please have some more help?","No"))
				if("What is this place?")
					usr<<"This is the Newbie's Dojo! Here, Ninja such as yourself are able to train basic skills in the most safe environment."
					sleep(30)
					usr<<"Enjoy your stay and make sure you talk to the other NPCs in the Dojo by pressing F to learn things if you're new, as this is the only Safe Zone in the Game!"
					goto Questions
				if("Is there anybody else here?")
					usr<<"Actually yes! There is!"
					sleep(30)
					usr<<"As you look around the Dojo you will meet a few other high Rank Ninja that happen to work with me in the Dojo, and other people who are creating new characters are also here!"
					sleep(30)
					usr<<"Feel free to ask them Questions if you have any, and if you want ask your Villagers also in Village Say!"
					goto Questions
				if("Am I safe here?")
					usr<<"Well, you're definetly safer in here than you are outside since this is a Safe Zone, there's no way people can get in after they have left."
					sleep(30)
				//	usr<<"We have stregthened materials on the doors so it makes it more difficult for Other Villages Ninjas to break in."
				//	sleep(30)
				//	usr<<"It's not completly safe though, if someone is strong enough they can be able to break in."
				//	sleep(30)
				//	usr<<"Not to mention, even your own Villager may try and betray you here. It's best to keep on your toes even in here."
					goto Questions
				if("What can I do here?")
					usr<<"There is plenty to do in the Dojo!"
				//	sleep(30)
				//	usr<<"To the left are two arenas where you may fight your fellow villagers."
					sleep(30)
					usr<<"To the far right are Training Logs that train you faster than the ones outside, so it's wise to use them while you're here!"
					sleep(30)
					usr<<"The Middle of the Dojo contains a large arena that may be used for practicing techniques or sitting in there chairs and chatting!"
					sleep(30)
					usr<<"There is a lot things you can find around the Dojo to help learn how to play and help your training get on track. So Look around!"
					goto Questions
				if("Can I please have some more help?")
					usr<<"Of course! Feel free to ask the people around the Dojo for any questions you have."
					sleep(30)
					usr<<"If you're still questioning things don't be shy to ask your villagers for help in Village Say or Help Say in Commands Tab!"
					sleep(30)
					usr<<"You can also find help on our Games Forum Guide section!"
					sleep(30)
					usr<<"Click this link to our Forums! You'll have to register, but it's worth it!"
					sleep(5)
					usr<<"http://s8.zetaboards.com/NarutoFinalFight/forum/37178/"
					goto Questions
				if("No")
					usr<<"Alright [usr.FirstName]. Enjoy your stay at the Dojo!"
	DojoHelper1
		name="Toko"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/MilitaryCaps.dmi'
				src.overlays+='Icons/New Base/Clothing/Cloak.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"Welcome [usr.FirstName]! I am an assitant, Hideki,  to the Dojo Owner."
			sleep(30)
			usr<<"Fighting is something that all Ninja's must go through in their life at one point."
			sleep(30)
			usr<<"This is the reason we have these Arenas. To help our Ninja learn to defend themselves."
			sleep(30)
			usr<<"You have any questions?"
			Questions
			switch(input(usr,"Do you have any Questions?", "Questions") in list ("Why Fight?","Why do some people seem so Strong?","How can I keep myself alive longer in battle?","Can I betray my villagers?","What if I just can't win?","No"))
				if("Why Fight?")
					usr<<"Some people from other Villages want to show their villages dominance by killing other Ninja from other Villages."
					sleep(30)
					usr<<"In this Ninja World, Rank doesn't matter to most people, people won't hesitate to kill you even at your rank of [usr.rank]..."
					sleep(30)
					usr<<"You must learn to protect yourself, and make your village strong and proud!"
					sleep(30)
					goto Questions
				if("Why do some people seem so Strong?")
					usr<<"Within this World there are mass amounts of hidden powers and things across the land."
					sleep(30)
					usr<<"Ninja seeking Power take it for themselves, and become strong, The Doujutsu Rinnegan, and the Bijuus, are prime examples."
					sleep(30)
					usr<<"If worse comes to worst it may just be a mistake in coding and break game balance."
					sleep(30)
					usr<<"If you believe this to be true make a topic here, on our games Forum!"
					sleep(30)
					usr<<"http://s8.zetaboards.com/NarutoFinalFight/forum/37181/"
					sleep(30)
					goto Questions
				if("How can I keep myself alive longer in battle?")
					usr<<"In Battle there is a hidden Stat called WillPower. This Stat determines how long you're able to continue fighting after being knocked unconcious."
					sleep(30)
					usr<<"As you get koed this Stat lowers, until it becomes so low, you lose the will to get back up, and you die."
					sleep(30)
					usr<<"Don't freak out though, there are methods to increase your Willpower!"
					sleep(30)
					usr<<"Jounin ranked Ninja have a much higher willpower Boost than those of low ranking Ninja, because they have fought for their village much longer, and want to truly protect it."
					sleep(30)
					usr<<"It's also handy to bring a medic into battle with you! They're able to heal you during battle, and even heal your Willpower stat sometimes!"
					sleep(30)
					usr<<"In the worst scenario, you are able to increase your Willpower temporarily by Eating a meal or If you have full strength, your willpower will slowly heal itself as long as you take cover!."
					sleep(30)
					goto Questions
				if("Can I betray my villagers?")
					usr<<"Don't know why you're asking me that....Why would you want to betray your own Villagers?!"
					sleep(30)
					usr<<"If you kill one of your Villagers, it will alert everyone in the village of your betrayal, and if the Kage of your Village is on or a Village Council Member, they may boot you."
					sleep(30)
					usr<<"Being booted results in becoming a Missing Ninja, a Ninja with no Village, and has to care for only themselves."
					sleep(30)
					usr<<"Life of a Missing Ninja is much harder than that of a Ninja with a Village."
					sleep(30)
					goto Questions
				if("What if I just can't win?")
					usr<<"If you come to an opponent that you just can't beat, then don't try even if you know you will lose."
					sleep(30)
					usr<<"There is no shame in running when you're completely outmatched."
					sleep(30)
					usr<<"After you run feel free to alert your fellow villagers in Village Say that you were attacked!"
					sleep(30)
					goto Questions
				if("No")
					usr<<"Learn to Fight, Learn to Live."
					return

	DojoHelper2
		name="Hideki"
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
			//	src.overlays+='Icons/New Base/Clothing/Official Clothing/MilitaryCaps.dmi
				src.overlays+='Icons/New Base/Clothing/Cloak.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"Welcome [usr.FirstName]! I am Hideki, another assitant to the Dojo Owner!"
			sleep(30)
			usr<<"Have you talked to Toko yet? Fighting is important, but so is helping your village!"
			sleep(10)
			usr<<"This is the reason we have Village Say. So we can communicate with one another when we need assitance!"
			sleep(10)
			usr<<"You have any questions?"
			Questions
			switch(input(usr,"Do you have any Questions?", "Questions") in list ("What is a Village Council?","What happens if a Village Council goes out of control?","Why should I do Missions?","How do we elect a new Kage of our Village?","No"))
				if("What is a Village Council?")
					usr<<"Village Councilmen are people that the Kage have put in charge of their Village when they are not able to be present."
					sleep(30)
					usr<<"A good way to think of this is being Second In Command."
					sleep(30)
					usr<<"Village Council is usually chosen only by those who truly deserve it and are trustworthy."
					sleep(30)
					goto Questions
				if("What happens if a Village Council goes out of control?")
					usr<<"Sometimes the power of being a Village Council goes to that members head, and they start doing unreasonable things."
					sleep(30)
					usr<<"These unreasonable things can be muting people for no reason, to booting people for no reason."
					sleep(30)
					usr<<"While these are unreasonable, they aren't declared as game abuse, as the village council member wasn't breaking any rules."
					sleep(30)
					usr<<"If you feel the abuse is unacceptable take a Screenshot with Prt + Scr and show the evidence to the kage when they are online, and hope action is done."
					sleep(30)
					usr<<"If nothing is done, then live with it, or move to another village.!"
					sleep(30)
					goto Questions
				if("Why should I do Missions?")
					usr<<"Doing missions is not only good for you because it gives you money, but it also helps the village!"
					sleep(30)
					usr<<"Missions Give you Money to buy equipment and various Ninja tools, Class Level, which helps you to achieve higher Ninja Ranks( You can also get Class level by killing Other Ninja! )"
					sleep(30)
					usr<<"Missions also give you Village Morale, which displays how much you help your village, and if you have high Enough Village Morale, you are able to learn special Village Jutsu because of your loyalty!"
					sleep(30)
					usr<<"Missions also help your village depending on the amount of mission tax there is!"
					sleep(30)
					goto Questions
				if("How do we elect a new Kage of our Village?")
					usr<<"If your kage is not online enough, Evil and abusive, or just disliked upon by members of the village, you may want to elect a new kage!"
					sleep(30)
					usr<<"You are able to elect a new kage by Asking an Owner when they log on, and they may host a Kage Election!"
					sleep(30)
					usr<<"Another alternative is a Jounin or higher leveled Ninja may ask to challenge their kage for their spot, the Kage must accept."
					sleep(30)
					usr<<"If the Kage wins he can't be challenged for another 3 days, and he may do what he pleases with the loser."
					sleep(30)
					goto Questions
				if("No")
					usr<<"Be a helpful Villager!"
					return


		//		var/style = "<style>BODY {margin:0;font:arial;background:black;\
		//			color:white;}</style>"
		//		sd_Alert(usr, "Ah good thing you made it private! We need more recruits each year! As you may understand already, to talk to someone efficiently you simply have to click F while facing them, of course.","[src]",,,,0,"400x150",,style)
		//		sd_Alert(usr, "In this time of the war, we need tom ake sure we train every ninja efficiently. You should talk to General Issac, he can help.","[src]",,,,0,"400x150",,style)


	DojoHelper3
		name="Shideku"
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
			//	src.overlays+='Icons/New Base/Clothing/Official Clothing/MilitaryCaps.dmi
			//	src.overlays+='Icons/New Base/Clothing/Cloak.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(!src in get_step(usr,usr.dir))
				usr<<"You need to be facing them!";return
			usr<<"Welcome [usr.FirstName]! I am Shideku, another assitant to the Dojo Owner!"
			sleep(10)
			usr<<"Before you are able to fight effectively you should know all you can about yourself!"
			sleep(10)
			usr<<"You have any questions?"
			Questions
			switch(input(usr,"Do you have any Questions?", "Questions") in list ("What does Physique, Capacity, and Control do?","What is different about Chakra, Chakra Reservoir, Vitality, and Stamina?","What are passives?","No"))
				if("What does Physique, Capacity, and Control do?")
					usr<<"These are your three core stats that determine your abilites!"
					sleep(30)
					usr<<"Physique determines your overall ability with Taijutsu. How much overall stamina you have, How much Stamina you are able to take with them, how many calories they drain (Calories are what Taijutsu cost, you can get them by eating meals) , and the drain on the Eight Gates vary heavily on your Physique!"
					sleep(30)
					usr<<"Capacity determines how much Chakra you over all have, and your overall ability with Ninjutsu."
					sleep(30)
					usr<<"While Capacity may determine the power your Ninjutsu may cause, if you don't have enough Control, they may drain very heavily, even if you have high chakra!"
					sleep(30)
					usr<<"Control determines your ability to Control to a much more advanced state, going beyond just the properties of Chakra Control."
					sleep(30)
					usr<<"The higher Control you have, the less your Jutsus will drain on your chakra!"
					sleep(30)
					usr<<"There's a downfall to this though, Since Capacity determines the overall amount of chakra you have, if you have high control and low Capacity, you'll have low chakra."
					sleep(30)
					usr<<"Low Chakra is bad, even if your jutsu drain less."
					sleep(30)
					usr<<"Advanced Elemental Ninjutsu also tend to have a requirement for Capacity, if you don't have enough Capacity, you won't be able to use those advanced Ninjutsu."
					sleep(30)
					usr<<"Same goes for control users, as advanced Genjutsus need an appropriate amount of Control to utilize."
					sleep(30)
					usr<<"All in all, it's best to find a balance between your three stats, especially Capacity and Control!"
					sleep(30)
					goto Questions
				if("What is different about Chakra, Chakra Reservoir, Vitality, and Stamina?")
					usr<<"There are much more Stats than just your 3 primary ones that determine your abilities."
					sleep(30)
					usr<<"Chakra is the obvious known one, Utilizing Jutsu costs this, without Chakra, forcing a jutsu will cost stamina, and eventually vitality!"
					sleep(30)
					usr<<"Chakra Reservoir is the chakra that is within your body, stored in reserves for later use."
					sleep(30)
					usr<<"In order to access these reserves tap Z when you need Chakra!"
					sleep(30)
					usr<<"Being out of Chakra Reservoir and low on Chakra is a very bad sign! When this happens, go rest immediatly by running to a Bed, Bench, or chair! (Click the Rest verb in the Command Tab!)"
					sleep(30)
					usr<<"Vitality is your blood and vital Organs, everyone tends to have the same average amount, about 1500, after all, we are all human."
					sleep(30)
					usr<<"Many things hit straight Vitality and avoid Stamina, These can range from Clan jutsu, to Katon, Raiton, Doton, and even some suiton jutsu! Weapons take direct vitality also!"
					sleep(30)
					usr<<"Stamina is your strength and energy, rather than your vitals. Other things tend to hit Stamina, rather than Vitality, such as Katon, Fuuton, most Suiton, Genjutsu, and Taijutsu!."
					sleep(30)
					usr<<"If you run out of stamina, your body will become very vulnerable, and things that normally hit Stamina will begin to hit your vitals!"
					sleep(30)
					usr<<"Try and keep your stamina up at all times!"
					sleep(30)
					usr<<"All of these Stats, except Vitality, increase with Age! These ages are 18,26,and 35! As you become older, such as age 50, your chakra and stamina will lower."
					sleep(30)
					usr<<"Hitting age 75 will cripple almost any Ninja's Stamina, even the most expert Taijutsu users, however a large chakra boost is given at age 75!"
					sleep(30)
					usr<<"It's always good to try and keep these Stats up any way possible."
					sleep(30)
					usr<<"Medics can heal vitality, along with ointments and healthpacks you can buy from your villages Item Merchant."
					sleep(30)
					usr<<"You can heal your stamina by buying meals and eating them, or by using Stamina Pills, which trade off Chakra for Stamina!"
					sleep(30)
					usr<<"You can also use Chakra Pills to recover Chakra."
					sleep(30)
					usr<<"Resting recovers all of these Stats of course. The only stat that isn't increased is vitality, the best thing to do for this is to wear Armor, which can be achieved later in your Ninja Career."
					sleep(30)
					goto Questions
				if("What are passives?")
					usr<<"Passives are what we Ninja train to increase our skills."
					sleep(30)
					usr<<"Rather than 'Levels', you increase your abilities by doing various things that the passives ask you to do."
					sleep(30)
					usr<<"Read the passive description and it should tell you what to do to raise it!"
					sleep(30)
					goto Questions
				if("No")
					usr<<"Train young Ninja! Train!"
					return

//
/* All the Others!

*/
mob/NPC/RandomNPCs/Tutorial
	TutorialGuy1
		name="Military General"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "Ah good thing you made it private! We need more recruits each year! As you may understand already, to talk to someone efficiently you simply have to click F while facing them, of course.","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "In this time of the war, we need tom ake sure we train every ninja efficiently. You should talk to General Issac, he can help.","[src]",,,,0,"400x150",,style)
	TutorialGuy2
		name="General Issac"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				if(usr.TimeToAttack==1)
					sd_Alert(usr, "C'mon! What's the big idea, punch!","[src]",,,,0,"400x150",,style);return
				if(usr.TimeToAttack==2)
					sd_Alert(usr, "Ah, so there is potential in you yet!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Alright private, now I need you to simply kick. It's not that difficult!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Kicking is as simple as Punching. Merely use the D macro and you will kick.","[src]",,,,0,"400x150",,style)
					usr.TimeToAttack=3;return
				if(usr.TimeToAttack==3)
					sd_Alert(usr, "Kick already! Don't tell me you're a pacikick?!","[src]",,,,0,"400x150",,style);return
				if(usr.TimeToAttack==4)
					sd_Alert(usr, "Ah good. You have great leg strength! Speaking of leg strength, let's see you run!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Running in NFF is also another simple thing to do. All you have to do is press Running below on the interface. If you keep walking, don't fret, you'll slowly begin to increase in speed.","[src]",,,,0,"400x150",,style)
					usr.TimeToAttack=5;return
				if(usr.TimeToAttack==5)
					sd_Alert(usr, "You seem rather slow. Please don't tell me you're running.","[src]",,,,0,"400x150",,style);return
				if(usr.TimeToAttack==6)
					sd_Alert(usr, "Ah good. Now let's slow down a bit for something a bit more! Let's try out something more defensive! Show me your guarding stance!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "Guarding is done by holding down X. When you release X you stop guarding. Guarding can also be used to effectively dodge a target, by quickly releasing it you will dodge a hand-to-hand combat attack instantly.","[src]",,,,0,"400x150",,style)
					usr.TimeToAttack=7;return
				if(usr.TimeToAttack==7)
					sd_Alert(usr, "Well? Where is that guarding?","[src]",,,,0,"400x150",,style);return
				if(usr.TimeToAttack==8)
					sd_Alert(usr, "That's some good posing right there. I hope your chakra is as fierce too, show me what you got!","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "You can charge chakra by holding down Z.","[src]",,,,0,"400x150",,style)
					usr.TimeToAttack=9;return
				if(usr.TimeToAttack==9)
					sd_Alert(usr, "Well? Chakra?","[src]",,,,0,"400x150",,style);return
				if(usr.TimeToAttack==10)
					sd_Alert(usr, "Ah, that's what I like to see, an exceptionally good novice! You might just have a chance to live kid.","[src]",,,,0,"400x150",,style)
					sd_Alert(usr, "I suggest you look around some bit if you want to learn some things.","[src]",,,,0,"400x150",,style);return
				sd_Alert(usr, "Considering you actually joined this war, you must have guts! I like guts kids, I hope you're not like the rest of these weaklings here! I need you to do something real simple for me private, alright? First, show me your punching skills!","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "The attack functions are simple. Punching would be seperated between A-S. A would be punching with your left hand and S would be punching with your right hand, try it.","[src]",,,,0,"400x150",,style)
				usr.TimeToAttack=1
	TutorialGuy3
		name="Philosophical Ren"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
						color:white;}</style>"
				if(usr.TimeToAttack<10)
					sd_Alert(usr, "War is pointless, in my opinion. But this is for the great [usr.Village] that is.","[src]",,,,0,"400x150",,style);return

				if(usr.TimeToAttack==10)
					var/list/buttons = list("Yes", "No")
					sd_Alert(usr, "Each generation will pass the next, that's the law of life. Do you think so?</br></br>Note:: Saying yes will take you away from the Tutorial, are you ready for that?", "[src]", buttons, pick(buttons),0,0,"250x250")
					if("Yes")
						usr.GoingThroughTutorial=0
						usr.SaveK()
						sd_Alert(usr, "I'm glad that's a thought. Let's look into the next generation befoer we go on with this point-less war.","[src]",,,,0,"400x150",,style)
						sleep(1)
						usr.overlays-='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
						usr.overlays-='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi'
						usr.overlays-='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi'
						usr.overlays-='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
						if(usr.Clan=="Aburame")
							usr.loc=locate(21,36,11);return
						if(usr.Clan=="Akimichi")
							usr.loc=locate(61,22,11);return
						if(usr.Clan=="Hyuuga")
							usr.loc=locate(174,40,11);return
						if(usr.Clan=="Nara")
							usr.loc=locate(25,69,11);return
						if(usr.Clan=="Kusakin")
							usr.loc=locate(93,143,12);return
		//Rain
						if(usr.Clan=="Fuuma")
							usr.loc=locate(144,170,6);return
						if(usr.Clan=="Hoshigaki")
							usr.loc=locate(152,125,6);return
		//Sound
						if(usr.Clan=="Uchiha")
							usr.loc=locate(150,52,4);return
						if(usr.Clan=="Kumojin")
							usr.loc=locate(151,184,4);return
						if(usr.Clan=="Kaguya")
							usr.loc=locate(172,43,5);return
		//Rock
						if(usr.Clan=="Iwazuka")
							usr.loc=locate(125,185,14);return
						else
							if(usr.Village=="Leaf")
								usr.loc=locate(65,57,11)
							if(usr.Village=="Rain")
								usr.loc=locate(111,170,6)
							if(usr.Village=="Sound")
								usr.loc=locate(119,130,4)
							if(usr.Village=="Rock")
								usr.loc=locate(46,172,14)


					if("No")
						sd_Alert(usr, "Soon in time, you'll come to understand this.","[src]",,,,0,"400x150",,style);return
	TutorialGuy4
		name="General Hughes"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "I don't think the last tutorial dude, explained it well enough! So I'll explain it!","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "The A-S commands aren't just for punching, but they're for using weapons. Equip a weapon to your left or right hand and you will use it when you attack! That's the fact!","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "What? You don't know what A-S commands a--. Oh right! Yeah, you're right, this isn't all just a game. Harhar.","[src]",,,,0,"400x150",,style);return
	TutorialGuy5
		name="Laughing Man"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
				src.overlays+='Icons/New Base/Hair/MadaraH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "I'm not crazy! We're just going into war, and it's great to laugh when going into war! Haha!","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "Hey, I hope you know that being a ninja means you can jump. Press Space bar next time around to jump, it's real fun actually!","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "Oh right, Spacebar doesn't exist here. SOrry, I was thinking of Microsoft...Wait, Microsoft doesn't exist either, woops woops! Harhar!","[src]",,,,0,"400x150",,style)
				return
	TutorialGuy6
		name="Emo Ninja"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
				src.overlays+='Icons/New Base/Hair/KiraH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "This war is useless, we're all just going to die.","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "I suggest you sit still and take damage. Blocking reduces physical attacks by two, but vitality based attacks still go through. You can never prevent the blood from releasing. I'm sorry.","[src]",,,,0,"400x150",,style)
				sd_Alert(usr, "But I guess you already learned that in the academy?","[src]",,,,0,"400x150",,style)
				return
	TutorialGuy7
		name="Scientific Lard"
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
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
				src.overlays+='Icons/New Base/Hair/narutoH.dmi'
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(src in get_step(usr,usr.dir))
				var/style = "<style>BODY {margin:0;font:arial;background:black;\
					color:white;}</style>"
				sd_Alert(usr, "Always check the guide up top if you need help...Oh right, this isn't a game, my fault!","[src]",,,,0,"400x150",,style)
				return

mob/NPC/RandomNPCs/Tutorial
	PunchingSue
		name="Training Ninja"
		icon='Map/Turfs/HakumeiGetsu.dmi'
		icon_state="Moon2"
		CNNPC=1
		Village="Leaf"
		health = 9999999999999999999999999999999999999999999999
		New()
			..()
			spawn()
				src.icon=null
				var/Base='Icons/New Base/Base.dmi';Base+=rgb(235,145,52)
				var/Hair=pick('Icons/New Base/Hair/BuzH.dmi','Icons/New Base/Hair/ExclusiveH.dmi','Icons/New Base/Hair/HinaH.dmi','Icons/New Base/Hair/InoH.dmi','Icons/New Base/Hair/itachiH.dmi','Icons/New Base/Hair/KakashiH.dmi','Icons/New Base/Hair/KiraH.dmi','Icons/New Base/Hair/leeH.dmi','Icons/New Base/Hair/MadaraH.dmi','Icons/New Base/Hair/narutoH.dmi','Icons/New Base/Hair/PainbodyH.dmi','Icons/New Base/Hair/RyuzakiH.dmi','Icons/New Base/Hair/SasukeH.dmi','Icons/New Base/Hair/SasukeTS.dmi','Icons/New Base/Hair/shikaH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/ThreadsH.dmi','Icons/New Base/Hair/WindH.dmi')
				Hair+=rgb(rand(10,150),rand(10,150),rand(10,150))
				src.icon=Base
				src.overlays+='Icons/New Base/Clothing/Boxers.dmi'
				src.overlays+='Icons/New Base/MaleEyes.dmi'
				src.overlays+='Icons/New Base/Eyes.dmi'
				src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
				src.overlays+=Hair
				src.icon_state="Attack1"
