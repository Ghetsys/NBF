mob
	Bump(F)
		..()
		if(istype(F,/turf/Wall))
			for(var/obj/Flags/O in F)
				F:density=0
				spawn(13)
					F:density=1
				break
		if(src.color)
			if(istype(F,/obj/Flags/Blue))
				if(F:pickingup)
					return 0
				F:pickingup=1
				bluecarry=src
				src.flags+=new/obj/Flags/Blue
				FlagArea("Red",src)
				for(var/mob/M in world)
					if(M != src)
						M<<Message("OtherCapture",src,rgb(255,0,0),0)
					else
						M<<Message("SrcCapture",src,rgb(255,0,0),0)
				del F
				src.Move(get_step(src,src.dir))
		else
			if(istype(F,/obj/Flags/Red))
				if(F:pickingup)
					return 0
				F:pickingup=1
				redcarry=src
				src.flags+=new/obj/Flags/Red
				FlagArea("Blue",src)
				for(var/mob/M in world)
					if(M != src)
						M<<Message("OtherCapture",src,rgb(0,0,255),1)
					else
						M<<Message("SrcCapture",src,rgb(0,0,255),1)
				del F
				src.Move(get_step(src,src.dir))