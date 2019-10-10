


proc
	Message(action,M as mob,color,flag)
		var/Return="<font color=red><TT>No action found to return."
		var/Flag
		switch(action)
			if("Returned")
				var/F="Blue"
				if(flag)
					F="Red"
				Return="<font color=[color]><b>[F] flag returned!"
			if("SrcScore")
				var/C=rgb(0,0,255)
				if(color)
					C=rgb(255,0,0)
				Return="<font color=[C]><b>You scored!"
			if("OtherScore")
				var/C=rgb(0,0,255)
				var/Team="Blue"
				if(color)
					C=rgb(255,0,0)
					Team="Red"
				Return="<font color=[C]><b>[M] has scored for the [Team] team!"
			if("SrcKill")
				Return="<font color=[color]><b>You killed [M]!"
			if("Killed")
				Return="<font color=[color]><b>Killed by [M]!"
			if("OtherCapture")
				if(flag)
					Flag="red"
				else
					Flag="blue"
				Return="<b><font color=[color]>[M] has captured the [Flag] flag!"
			if("SrcCapture")
				if(flag)
					Flag="red"
				else
					Flag="blue"
				Return="<b><font color=[color]>You captured the [Flag] flag!"
			if("ReportScore")
				Return="<b><font color=[rgb(255,0,0)]>Red: [redscore] / [maxscore]"
				Return+="\n"
				Return+="<b><font color=[rgb(0,0,255)]>Blue: [bluescore] / [maxscore]"
		return Return

	FlagArea(type,M as mob)
		if(type == "Red")
			for(var/A=1,A<=length(arenas),A++)
				if(arenas[A] == playingz)
					var/obj/Flags/Fuzzy/F = new()
					F.icon='Icons.dmi'
					F.icon_state="FuzzyYellow"
					F.id=M
					M:returnarea=F
					F.loc=locate(redlocx[A], redlocy[A], playingz)
		if(type == "Blue")
			for(var/A=1,A<=length(arenas),A++)
				if(arenas[A] == playingz)
					var/obj/Flags/Fuzzy/F = new()
					F.icon='Icons.dmi'
					F.icon_state="FuzzyYellow"
					F.id=M
					M:returnarea=F
					F.loc=locate(bluelocx[A], bluelocy[A], playingz)

	Start()
		playingz=pick(playablez)
		bluescore=0
		redscore=0

	Locate(M as mob,C)
		var/located=0
		if(C=="Red")
			for(var/R=1,R<=length(arenas),R++)
				if(arenas[R] == playingz)
					M:loc=locate(redlocx[R] ,redlocy[R] ,playingz)
					located=1
		if(C=="Blue")
			for(var/B=1,B<=length(arenas),B++)
				if(arenas[B] == playingz)
					M:loc=locate(bluelocx[B] ,bluelocy[B] ,playingz)
					located=1
		if(!located)
			world<<"<font color=red><TT>Could not locate [M]."
		else
			var/L=M:loc
			while(M:loc==L)
				var/P=pick(NORTH,SOUTH,EAST,WEST)
				M:Move(get_step(M,P))
				sleep(3)

	RandReport()
		world<<Message("ReportScore")
		spawn(rand(500,2000))
			RandReport()


	RandWall(pixel1,pixel2)
		var/icon/W=icon('Icons.dmi',"Grass")
		var
			xx=32
			yy=32
		while(yy)
			while(xx)
				var
					C=rand(pixel1,pixel2)
				W.DrawBox(rgb(C,C,C),xx,yy)
				xx--
			xx=32
			yy--
		WallIcon+=W