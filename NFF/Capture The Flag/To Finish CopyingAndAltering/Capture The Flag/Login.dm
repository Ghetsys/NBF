mob
	Login()
		.=..()
		src.loc=locate(5,5,2)
		src.movement=0
		switch(input("What team would you like to be on?","Team") in list("Red","Blue","Spectator"))
			if("Red")
				color=1
				name="(Red)[src.key]"
				Locate(src,"Red")
			if("Blue")
				color=0
				name="(Blue)[src.key]"
				Locate(src,"Blue")
			if("Spectator")
				movement=0
				spectator=1
				name="(Spectator)[src.key]"
		sleep(15)
		if(client.address==null || client.address==world.address)
			R
			var/P
			for(var/a=1,a<=length(znames),a++)
				if(playingz == playablez[a])
					P=znames[a]
			switch(alert("Change Z level to play?\nMap to play: [P]","Map","No","Yes"))
				if("Yes")
					Start()
					if(src.color)
						Locate(src,"Red")
					else
						Locate(src,"Blue")
					src.movement=0
					goto R
			switch(alert("Would you like to set a winning score? Default is 100.","Score","Yes","No"))
				if("Yes")
					R
					var/MS=input("What would you like the max score to be?","Max score",100) as num
					if(MS>100 || MS<=0)
						goto R
					else maxscore=MS
			switch(alert("Would you like AI players?","Bots","Yes","No"))
				if("Yes")
					var/R=input("How many red Bots?","Bots")as num
					var/B=input("How many blue Bots?","Bots")as num
					while(R)
						var/mob/Bots/Red/RB = new()
						RB.color=1
						Locate(RB,"Red")
						RB.name="(Red)Red Bot [R]"
						sleep(1)
						R--
					while(B)
						var/mob/Bots/Blue/BB = new()
						BB.color=0
						Locate(BB,"Blue")
						BB.name="(Blue)Blue Bot [B]"
						sleep(1)
						B--
		if(!spectator)
			movement=1