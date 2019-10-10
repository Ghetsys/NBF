//var/list/ServerList=list("byond://75.126.182.129:2011","byond://75.126.182.129:2012")
//This is the list of official servers.
/*
This system should make some things easier. One bug with kages, is that if they move to another server, they glitch.
This way, this won't happen. Also would be able to be used in the case of instantly updating bans.
*/
/*
proc/ServerSend(Type as text,Text as text,mob/Who)
	return
	switch(Type)
		if("Kage")
			var/mob/M=Who
			for(var/S in ServerList)
				if(S!="byond://[world.address]:[world.port]")
					world.Export("[S]?type=Kage&key=[M.key]&village=[M.Village]")
		if("Ban")
			for(var/S in ServerList)
				if(S!="byond://[world.address]:[world.port]")
					world.Export("[S]?type=Ban&[Text]")
		if("Unban")
			for(var/S in ServerList)
				if(S!="byond://[world.address]:[world.port]")
					world.Export("[S]?type=Unban&[Text]")

world/Topic(T)
	var/list/S = params2list(T)
	switch(S["type"])
		if("Kage")
			var/M = S["key"]
			var/Village=S["village"]
			if(Village=="Leaf")	Hokage=M
			if(Village=="Rain")	Amekoutei=M
			if(Village=="Rock")	Tsuchikage=M
			if(Village=="Sound")	Otokami=M
		if("Ban")//ServerSend(Type="Ban",Text="kind=key&key=thatguy&ip=100.00.00.00&id=1234&who=[usr.key]")
			switch(S["kind"])
				if("Key")
					Bans:Add(S["key"])
					Bans[S["key"]]="[S["address"]]"
					world << "<font color = red><b>(Server Info)</b></color>([world.realtime]) The key [S["key"]] has been Banned.</font>"
					for(var/mob/M in world)
						if(M.key == S["key"])
							M<<"You have been banned by [S["who"]] (Banned). If you wish to find out why or feel you've been improperly banned, please post in the Ban Appeal section of the forums. </br>http://s8.zetaboards.com/NarutoFinalFight/forum/37185/</br>Note:: You must join to see and post in this section."
							del(M)
				if("IP")
					IPBans:Add(S["ip"])
					for(var/mob/M in world)
						if("[M.client.address]"=="[S["ip"]]")
							world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [M] has been IP Banned by [S["who"]].</font>"
							del(M)
				if("ID")
					computer_bans[S["key"]]=S["id"]
					for(var/mob/M in world)
						if("[M.client.computer_id]"=="[S["id"]]")
							world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [M] has been <b>computer banned</b>.</font>"
		if("Unban")
			switch(S["kind"])
				if("Key")
					Bans:Remove(S["key"])
					TimeBans:Remove(S["key"])
					world<<"<font color = red><b>(Server Info)</b></color>([world.realtime]) [S["key"]] has been unbanned.</font>"
				if("IP")
					for(var/IP in IPBans)
						if("[IP]"=="[S["ip"]]")
							world<<"<font color = red><b>(Server Info)</b></color>([world.realtime])The IP:\"[IP]\" has been Unbanned(IP)</font>."
							del(IP)
*/

proc/GetScreenResolution(mob/M) // Yay dynamic HUDS?!
	var/POS = "[winget(M, "label","pos")]"
	var/COMA = findtext(POS,",",1,0)
	var/X = text2num(copytext(POS,1,COMA))
	var/Y = text2num(copytext(POS,COMA+1,0))
	M.client.view="[round(X/20)]x[round(Y/20)]"
mob
	var
		tmp
			statbox=0
			jutsutab=0
	verb
		ViewJutsuTab()
			set hidden=1
			if(usr.jutsutab == 0)
				usr.jutsutab = 1
				usr.RefreshJutsus()
				winset(src, null, {"
					mainwindow.JutsuTabChild.is-visible = "true";
				"})
			else
				if(usr.jutsutab)
					winset(src, null, {"
						mainwindow.JutsuTabChild.is-visible = "false";
					"})
					usr.jutsutab = 0



		RefreshJutsus()
			set hidden=1
			winset(src,"JutsuTab.Grid","cells=0x0")
			var/Row = 1
			src<<output("","Grid:1,1")
			for(var/obj/SkillCards/O in usr.LearnedJutsus)
				Row++
				src << output(O,"Grid:1,[Row]")




mob
	var
		tmp
			chattab=0
	verb
		ViewChatTab()
			set hidden=1
			if(usr.chattab == 0)
				usr.chattab = 1
				winset(src, null, {"
					mainwindow.ChatOut.is-visible = "true";
				"})
			else
				if(usr.chattab)
					winset(src, null, {"
						mainwindow.ChatOut.is-visible = "false";
					"})
					usr.chattab = 0


mob
	var
		tmp
			comandostab=0
	verb
		ViewComandoTab()
			set hidden=1
			if(usr.comandostab == 0)
				usr.comandostab = 1
				winset(src, null, {"
					mainwindow.Comandos.is-visible = "true";
				"})
			else
				if(usr.comandostab)
					winset(src, null, {"
						mainwindow.Comandos.is-visible = "false";
					"})
					usr.comandostab = 0