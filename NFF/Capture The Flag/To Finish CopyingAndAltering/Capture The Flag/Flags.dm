mob
	Bump(O)
		..()
		if(istype(O,/obj/Health))
			if(!O:used)
				if(src.hp < 100)
					O:used=1
					O:density=0
					src.hp=100
					O:icon_state=""
					src.Move(get_step(src,src.dir))
					spawn(rand(100,300))
						if(O:used)
							O:used=0
							O:density=1
							O:icon_state="HP"
obj
	Health
		icon_state="HP"
		var/used=0
		density=1
	Flags
		density=1
		var/pickingup=0
		Red
			icon_state="RFlag"
			name="Red Flag"
			proc/Loc()
				var/InTurf
				for(var/turf/T in world)
					if(src in T)
						InTurf=1
				if(InTurf)
					var/L=src.loc
					while(src.loc==L)
						if(prob(50))
							if(prob(33))
								if(src.x != 1)
									src.x--
							else if(prob(33))
								if(src.x < world.maxx)
									src.x++
						else
							if(prob(33))
								if(src.y != 1)
									src.y--
							else if(prob(33))
								if(src.y < world.maxy)
									src.y++
				var/A=25
				src.pixel_y=25
				while(A)
					src.pixel_y--
					sleep(1)
					A--
		Blue
			icon_state="BFlag"
			name="Blue Flag"
			proc/Loc()
				var/InTurf
				for(var/turf/T in world)
					if(src in T)
						InTurf=1
				if(InTurf)
					var/L=src.loc
					while(src.loc==L)
						if(prob(50))
							if(prob(33))
								if(src.x != 1)
									src.x--
							else if(prob(33))
								if(src.x < world.maxx)
									src.x++
						else
							if(prob(33))
								if(src.y != 1)
									src.y--
							else if(prob(33))
								if(src.y < world.maxy)
									src.y++
				var/A=25
				src.pixel_y=25
				while(A)
					src.pixel_y--
					sleep(1)
					A--
		Fuzzy
			icon_state="FuzzyYellow"
			name="Place Flag Here"
			density=0
			var/id


area
	BlueFlag
		Entered(M)
			..()
			if(ismob(M))
				var/carry=0
				for(var/obj/Flags/Red/R in M:flags)
					del R
					carry=1
					break
				if(carry)
					for(var/obj/Flags/Fuzzy/F in src)
						del F
					var/obj/Flags/Red/R = new()
					for(var/A=1,A<=length(arenas),A++)
						if(arenas[A] == playingz)
							R.loc=locate(redlocx[A], redlocy[A], playingz)
							R.Loc()
					M:scores++
					if(bluescore<99 && bluescore<maxscore-1)
						bluescore++
						for(var/mob/A in world)
							if(A != M)
								A<<Message("OtherScore",M,M:color)
							else
								A<<Message("SrcScore",M,M:color)
					else
						bluescore++
						world<<"<b><font color=blue>Blue team wins:"
						world<<Message("ReportScore")
						sleep(15)
						world.Reboot()
	RedFlag
		Entered(M)
			..()
			if(ismob(M))
				var/carry=0
				for(var/obj/Flags/Blue/B in M:flags)
					del B
					carry=1
					break
				if(carry)
					for(var/obj/Flags/Fuzzy/F in src)
						del F
					var/obj/Flags/Blue/B = new()
					for(var/A=1,A<=length(arenas),A++)
						if(arenas[A] == playingz)
							B.loc=locate(bluelocx[A], bluelocy[A], playingz)
							B.Loc()
					M:scores++
					if(redscore<99 && redscore<maxscore-1)
						redscore++
						for(var/mob/A in world)
							if(A != M)
								A<<Message("OtherScore",M,M:color)
							else
								A<<Message("SrcScore",M,M:color)
					else
						redscore++
						world<<"<b><font color=red>Red team wins:"
						world<<Message("ReportScore")
						sleep(15)
						world.Reboot()


var
	global
		redcarry
		bluecarry