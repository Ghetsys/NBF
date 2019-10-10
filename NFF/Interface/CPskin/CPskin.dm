mob
	var
		Win = 0

mob
	verb
		Options()
			set hidden = 1
			winset(usr,"DO","is-visible = true")
		Closezz()
			set hidden = 1
			winset(usr,"DO","is-visible = false")
		SkillTreez()
			set hidden = 1
			winset(usr,"skilltrees","is-visible = true")
		SkillTreezC()
			set hidden = 1
			winset(usr,"skilltrees","is-visible = true")