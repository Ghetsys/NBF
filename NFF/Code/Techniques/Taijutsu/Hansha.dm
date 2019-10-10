//This is a new Taijutsu Style that I'm going to be working on that is solely based on Counter Attacking and Blocking the opponent's taijutsu and weapons (possibly weapons?)
mob/var/tmp
	CalmedMind=0
	CalmedMindTime=0
	SoothingSlam=0
	SoothingCounter=0
	ReactionAbove=0
	ReactionAboveCounter=0
	ReactionBelow=0
	ReactionBelowCounter=0
	BrokenArms=0
	BrokenArmsTime=0
	BrokenLegs=0
	BrokenLegsTime=0
mob/var
	HanshaDefence=0
//Jutsus

// Calm Mind - A meditative State that grants a bonus torwards countering taijutsu by the Ninja standing still and Focusing for a few seconds
mob
	proc
		CalmingMind()
			var/MeditateTime=0
			var/PreparingCalmedMind=0
			var/StageOfCalmMind=0
			if(src.firing||src.Frozen||src.knockedout)
				return
			if(src.stamina<src.maxstamina*0.10)
				src<<"Seu corpo é fraco demais para ir para o estado meditativo.";return
			src.Frozen=1;src.firing=1
			src<<"Você começa a relaxar todos os músculos do seu corpo."
			sleep(15)
			src<<"Você começa a se concentrar sobre os inimigos braço e os movimentos das pernas quando você entra no estado meditativo."
			MeditateTime=1
			src.icon_state="handseal"
			while(MeditateTime==1&&src.icon_state=="handseal")
				PreparingCalmedMind++
				if(PreparingCalmedMind>=6)
					src<<"Você analisou os opositores do braço e os movimentos das pernas, a sua capacidade para combater seu taijutsu tem aumentado."
					StageOfCalmMind=2
					MeditateTime=0
					src.Frozen=0;src.firing=0
				sleep(10)
			if(StageOfCalmMind==2)
				src.CalmedMind=1
				src.CalmedMindTime=(src.TaijutsuKnowledge/50)+rand(10,15)
			while(src.CalmedMind==1)
				src.CalmedMindTime--
				if(src.CalmedMindTime<=0)
					src.CalmedMind=0
					src<<"Você parar de se concentrar tão intensamente na análise dos movimentos dos oponentes.";return
				if(src.knockedout)
					src.CalmedMind=0
					src<<"Como você esta inconsciente você perder a concentração intensa.";return
				sleep(10)
			src<<"Você não conseguiu entrar em estado de meditação."
			src.firing=0
			src.Frozen=0
			return

// Soothing Slam - Chance to counter Moves that involve the opponent grabbing you Ex: Choke
		SoothingSlam(Uses)
			var/StaminaDrain=0
			StaminaDrain=120-src.tai
			if(src.firing||src.Frozen||src.knockedout)
				return
			if(src.stamina<src.maxstamina*0.10)
				src<<"Seu corpo está muito cansado para tentar contra-atacar.";return
			src.StaminaDrain(StaminaDrain)
			src<<"ocê se prepara para qualquer ataque que o adversário pode tentar em você."
			src.SoothingSlam=1
			if(src.TaijutsuKnowledge>1250)
				if(prob(10+(Uses/50)))
					src.SoothingCounter=1
			spawn(30)
				src.SoothingSlam=0
				src.SoothingCounter=0
				src<<"Você para de usar a preparação e abaixa a guarda.";return

// Cautionary Reaction Above - Chance to counter moves that involve the opponent Punching you
		CautionaryReactionAbove(Uses)
			var/StaminaDrain=0
			StaminaDrain=120-src.tai
			if(src.firing||src.Frozen||src.knockedout)
				return
			if(src.stamina<src.maxstamina*0.10)
				src<<"Seu corpo está muito cansado para tentar contra-atacar.";return
			src.StaminaDrain(StaminaDrain)
			src<<"Você se prepara para qualquer taijutsu prejudicial que utilizam armas que o adversário pode tentar em você."
			if(src.TaijutsuKnowledge>1250)
				if(prob(10+(Uses/50)))
					src.ReactionAboveCounter=1
			src.ReactionAbove=1
			spawn(30)
				src.ReactionAbove=0
				src.ReactionAboveCounter=0
				src<<"Você para de usar a preparação e abaixa a guarda.";return

// Cautionary Reaction Below - ^ but for Kicks
		CautionaryReactionBelow(Uses)
			var/StaminaDrain=0
			StaminaDrain=120-src.tai
			if(src.firing||src.Frozen||src.knockedout)
				return
			if(src.stamina<src.maxstamina*0.10)
				src<<"Seu corpo está muito cansado para tentar contra-atacar.";return
			src.StaminaDrain(StaminaDrain)
			src<<"Você se prepara para qualquer taijutsu prejudicial que utilizam pernas que o adversário pode tentar em você."
			if(src.TaijutsuKnowledge>1250)
				if(prob(10+(Uses/50)))
					src.ReactionBelowCounter=1
			src.ReactionBelow=1
			spawn(30)
				src.ReactionBelow=0
				src.ReactionBelowCounter=0
				src<<"Você para de usar a preparação e abaixa a guarda.";return


//Things that Determine Counter Ability
/*
1.	When reversing ASD(basics) the drain and damage is based on your opponents phy. If your opponent charges more you will do less returning damage and returning it will drain more calories/stamina.

2.	When reversing techs it’s the calorie drain/stamina of the initial technique x2 when reversed the stronger the technique the more drain, however the oppone
however the opponent receives even more damage.

4.	Velocity of attacks should also effect damage, if they’re chained faster they should do less damage upon return but provide more drain.

5.	Physique vs. Physique. Low physique players will have very very high drains from reversing high phys techniques but do the same damage of course if not more depending on how far you want to go.

6.	High phy
physique players will take more reversed damage while low physique ones, or gentler styles such as uchiha style and quick fist will take less.
*/
mob/proc/DizzyProc(Time)
	while(src&&Time>=0)
		if(!src.knockedout)
			var/randz=rand(1,4)
			if(randz>=4)
				src.client:dir=NORTH
			if(randz==3)
				src.client:dir=SOUTH
			if(randz==2)
				src.client:dir=WEST
			if(randz==1)
				src.client:dir=EAST
		sleep(5)