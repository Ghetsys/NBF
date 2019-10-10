obj
	Bullet
		icon_state="Bullet"
		density=1
		var/creator
		New()
			..()
			var
				xx
				yy
				zz
			R
			if(src.x == xx)
				if(src.y == yy)
					if(src.z == zz)
						del src
			xx=src.x
			yy=src.y
			zz=src.z
			spawn(7)
				goto R
		Bump(M)
			..()
			if(ismob(M))
				if(M:color != src.creator:color)
					M:hp-=rand(1,20)
					if(M:hp<=0)
						M:movement=0
						src.creator:kills++
						M:deaths++
						for(var/obj/Flags/O in M:flags)
							if(istype(O,/obj/Flags/Red))
								del O
								world<<"<b>[M] drops the red flag!"
								var/obj/Flags/Red/R = new()
								for(var/A=1,A<=length(arenas),A++)
									if(arenas[A] == playingz)
										R.loc=locate(redlocx[A], redlocy[A], playingz)
										R.Loc()
										for(var/obj/Flags/Fuzzy/F in world)
											if(F.id==src.creator)
												del F
							else if(istype(O,/obj/Flags/Blue))
								del O
								world<<"<b>[M] drops the blue flag!"
								var/obj/Flags/Blue/B = new()
								for(var/A=1,A<=length(arenas),A++)
									if(arenas[A] == playingz)
										B.loc=locate(bluelocx[A], bluelocy[A], playingz)
										B.Loc()
										for(var/obj/Flags/Fuzzy/F in world)
											if(F.id==src.creator)
												del F
						M:hp=100
						if(M:color)
							Locate(M,"Red")
						if(!M:color)
							Locate(M,"Blue")
						if(src.creator:color)
							creator<<Message("SrcKill",M,rgb(255,0,0))
						if(!src.creator:color)
							creator<<Message("SrcKill",M,rgb(0,0,255))
						if(M:color)
							M<<Message("Killed",src.creator,rgb(255,0,0))
						if(!M:color)
							M<<Message("Killed",src.creator,rgb(0,0,255))
						M:movement=1
			del src