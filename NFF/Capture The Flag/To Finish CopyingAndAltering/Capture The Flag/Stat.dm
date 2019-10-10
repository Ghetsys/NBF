mob
	Stat()
		.=..()
		if(client.address==null || client.address==world.address)
			if(world.port)
				var/WS=""
				WS+="{Host: [src.key]}"
				var
					RP=0
					BP=0
					RB=0
					BB=0
				for(var/mob/M in world)
					if(istype(M,/mob/Bots))
						if(M.color)
							RB++
						else
							BB++
					if(M.client)
						if(M.color)
							RP++
						else
							BP++
				WS+=" {Red/Blue Players: [RP]/[BP]}"
				if(!(RB+BB))
					WS+=" {No Bots}"
				else
					WS+=" {Bots: [RB] Red / [BB] Blue}"
				world.status=WS
		var
			blendredflag=0
			blendblueflag=0
		if(!spectator)
			statpanel("Info")
			stat("Health:",hp)
			stat("Kills:",kills)
			stat("Times Scored:",scores)
			stat("Deaths:",deaths)
			stat("World Status:",world.status)
			statpanel("Flags")
			for(var/obj/Flags/O in src.flags)
				stat(O)
				if(istype(O,/obj/Flags/Red))
					blendredflag=1
				else if(istype(O,/obj/Flags/Blue))
					blendblueflag=1
		if(src.color != "None")
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
		for(var/obj/Number/O in src.client.screen)
			src.client.screen-=O
		UpdateScore()
		if(src.spectator)
			if(src.watch)
				src.client.eye=src.watch
				src.loc=locate(src.watch:x,src.watch:y,2)
				src.eyex=src.watch:x
				src.eyey=src.watch:y
			else
				src.loc=locate(src.eyex,src.eyey,2)
				src.client.eye=locate(src.eyex,src.eyey,playingz)
		statpanel("Red Players")
		for(var/mob/M in world)
			var
				statM=0
			if(istype(M,/mob/Bots))
				statM=1
			if(M.client)
				statM=1
			if(!M.color)
				statM=0
			if(M.spectator)
				statM=0
			if(statM)
				var/obj/PlayerObject/PO = new()
				PO.name=M.name
				if(src.watch==M)
					PO.name+=" (Watching)"
				PO.suffix="Kills: [M.kills]; Deaths: [M.deaths]; Scored: [M.scores]"
				for(var/obj/Flags/O in M.flags)
					if(istype(O,/obj/Flags/Blue))
						PO.suffix="Carrying Blue Flag"
				PO.icon=M.icon
				PO.displayed=M
				stat(PO)
		statpanel("Blue Players")
		for(var/mob/M in world)
			var
				statM=0
			if(istype(M,/mob/Bots))
				statM=1
			if(M.client)
				statM=1
			if(M.color)
				statM=0
			if(M.spectator)
				statM=0
			if(statM)
				var/obj/PlayerObject/PO = new()
				PO.name=M.name
				if(src.watch==M)
					PO.name+=" (Watching)"
				PO.suffix="Kills: [M.kills]; Deaths: [M.deaths]; Scored: [M.scores]"
				for(var/obj/Flags/O in M.flags)
					if(istype(O,/obj/Flags/Red))
						PO.suffix="Carrying Red Flag"
				PO.icon=M.icon
				PO.displayed=M
				stat(PO)
		statpanel("Spectators")
		for(var/mob/M in world)
			var
				statM=0
			if(M.client)
				statM=1
			if(!M.spectator)
				statM=0
			if(statM)
				var/obj/PlayerObject/PO = new()
				PO.name=M.name
				PO.icon=M.icon
				stat(PO)
		if(prob(20))
			movement=1

obj
	PlayerObject
		var/displayed
		Click()
			if(!displayed)
				return 0
			var/choices=list()
			if(usr.spectator)
				if(usr.watch != src.displayed)
					choices+="Watch"
				if(usr.watch == src.displayed)
					choices+="Stop Watching"
			choices+="Info"
			choices+="Cancel"
			switch(input("What would you like to do?","[name]") in choices)
				if("Watch")
					usr.watch=src.displayed
				if("Stop Watching")
					usr.watch=0
				if("Info")
					return Info(usr)
		proc/Info(mob/M as mob)
			M<<{"<b>***[displayed:name]***
 - Health: [displayed:hp]
 - Kills: [displayed:kills]
 - Deahts: [displayed:deaths]
 - Times Scored: [displayed:scores]"}