mob/owner/verb/MakeCharacter()
	set name = "Make a Character"
	set category = "Staff"
	switch(input(usr,"Which character would you like to play as?") in list("Naruto Uzumaki, Sasuke Uchiha"))
		if("Naruto Uzumaki")
			usr.LearnedJutsus=null
			usr.LearnedJutsus+=new/obj/SkillCards/BunshinJutsu
			usr.LearnedJutsus+=new/obj/SkillCards/Kawarimi
			usr.LearnedJutsus+=new/obj/SkillCards/KageBunshin
			usr.LearnedJutsus+=new/obj/SkillCards/TKageBunshin
			usr.LearnedJutsus+=new/obj/SkillCards/Rasengan

