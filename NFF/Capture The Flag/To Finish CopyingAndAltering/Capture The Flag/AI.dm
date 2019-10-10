mob
	var/tmp
		destination
		next_walk_time			// When is the next time for us to walk?
		walking_delay = 10		// How long between movement?
		movement_percent = 75	// What percentage of the time should it move?
	base_EventCycle()
		if (next_walk_time <= world.time)
			if (destination)
				var/reached_dest = base_StepTowards(destination)
				if(reached_dest)
					destination = null
			next_walk_time = world.time + walking_delay
		return


mob
	icon='Icons.dmi'
	Bots
		var/tmp
			mind
			randwalk=1
		New()
			..()
			mind=1
			AI()
		proc/AI()
			var
				blendredflag=0
				blendblueflag=0
				hasflag=0
			for(var/obj/Flags/O in src.flags)
				hasflag=1
				if(istype(O,/obj/Flags/Red))
					blendredflag=1
				else if(istype(O,/obj/Flags/Blue))
					blendblueflag=1
			var/icon/P=icon('Icons.dmi',"Player")
			var/icon/H=icon('Icons.dmi',"Head")
			if(!src.color)
				P.Blend(rgb(0,0,255))
			else
				P.Blend(rgb(255,0,0))
			P.Blend(H,ICON_OVERLAY)
			if(blendredflag)
				var/icon/MRF = icon('Icons.dmi',"MiniRFlag")
				P.Blend(MRF,ICON_OVERLAY)
			if(blendblueflag)
				var/icon/MBF = icon('Icons.dmi',"MiniBFlag")
				P.Blend(MBF,ICON_OVERLAY)
			src.icon=P
			if(!hasflag)
				var/Walked=0
				if(src.color)
					for(var/obj/Flags/Blue/BF in world)
						if(BF.z == src.z)
							if(get_dist(src,BF)<=1)
								src.Move(BF.loc)
							else
								src.destination=BF
							Walked=1
				else
					for(var/obj/Flags/Red/RF in world)
						if(RF.z == src.z)
							if(get_dist(src,RF)<=1)
								src.Move(RF.loc)
							else
								src.destination=RF
							Walked=1
				if(!Walked)
					if(src.mind)
						if(src.color)
							if(bluecarry)
								src.destination=bluecarry
								src.randwalk=1
							else
								src.mind=0
						if(!src.color)
							if(redcarry)
								src.destination=redcarry
								src.randwalk=1
							else
								src.mind=0
					if(!src.mind)
						var/LOC
						if(src.color)
							for(var/A=1,A<=length(arenas),A++)
								if(arenas[A] == playingz)
									LOC=locate(redlocx[A], redlocy[A], playingz)
						if(!src.color)
							for(var/A=1,A<=length(arenas),A++)
								if(arenas[A] == playingz)
									LOC=locate(bluelocx[A], bluelocy[A], playingz)
						if(src.randwalk)
							for(var/atom/A in world)
								if(A.loc==LOC)
									src.destination=A
									break
						if(!src.randwalk)
							var/Loc=src.loc
							while(src.loc==Loc)
								var/Dir=pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)
								src.Move(get_step(src,Dir))
								sleep(3)
						if(src.destination)
							if(src.loc == src.destination:loc)
								src.destination=null
								src.randwalk=0
				else
					src.randwalk=1
			else
				src.randwalk=1
				if(src.returnarea)
					if(src.loc==src.returnarea:loc)
						var/Loc=src.loc
						while(src.loc==Loc)
							var/Dir=pick(NORTH,SOUTH,EAST,WEST)
							src.Move(get_step(src,Dir))
							sleep(3)
					src.destination=src.returnarea:loc
					sleep(3)
			for(var/mob/M in oview(5))
				if(M.color != src.color)
					if(prob(75))
						var/D=get_dir(src,M)
						var/obj/Bullet/B = new()
						B.loc=locate(src.x,src.y,src.z)
						B.pixel_y=rand(-15,15)
						B.creator=src
						walk(B,D)
						break
			if(src.hp<=30)
				for(var/obj/Health/O in oview(5))
					if(!O:used)
						src.destination=O
						break
			spawn(rand(3,17))
				src.AI()
		Red
		Blue