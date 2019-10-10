mob/GainedAfterLogIn/verb/Send_File(mob/m in view(usr),F as file)
	set hidden=1
	switch(alert(m,"[usr] Está tentando-lhe enviar [F]. Você aceita o arquivo?","**Arquivo Transferido**","Sim","Não"))
		if("Yes")
			alert(usr,"[m] Aceitou o Arquivo","**Arquivo aceito**")
			m<<ftp(F)
		if("No")
			alert(usr,"[m] Negou o Arquivo","**Arquivo Negado**")
var
	Bugs = null//The var for the logging
	Sug = null
mob/GainedAfterLogIn/verb/Give_Cash()
//	for(var/mob/C in world)
//		if(C.key=="CobraT1337")
//			C<<"[usr] is using Give Cash Verb."
	usr.Target()
	if(usr.ntarget)
		return
	else
		var/mob/M=src.target
		var/give = input(usr,"Quando dinheiro você desejaria dar para [M]?") as num
		if(M==usr)
			usr<<"Você não pode fazer isso"
			return
		if(M.client)
			if(give>usr.Yen)
				usr<<"Você não tem tudo isso para dar"
				return
			if(give<=0)
				usr<<"Você não pode fazer isso."
				return
			if(give<usr.Yen)
				usr.Yen-=give
				usr.SaveK()
				sleep(11)
				usr<<"Transação concluida"
				M.Yen+=give
				M<<"[usr] lhe da [give] de dinheiro."
				M.SaveK()

	//			if(give>10000)
	//				for(var/client/C in world)
	//					if(C.key in Admin||C.key in OwnerGodsDude)
	//						C<<"Ryo Transaction: [usr] gave [M] [give] Ryo."
				give=0
			return
proc
	cuttext(msg as text)
		if(msg)
			if(length(msg)>400)
				msg = copytext(msg,1,400) + "...."
		return msg
mob/var/tmp/ImStuck=0
mob/GainedAfterLogIn/verb/TurnOffStartMusic()
	set name = "Musica de Inicio Off"
	set category = "Comandos"
	usr<<sound(null,channel=75)
	return
//mob/GainedAfterLogIn/verb/ChangeHudTest2()
//	set name="Change HUD - Classic"
//	set category="Commands"
//	usr.ChangeHudClassic()
//mob/GainedAfterLogIn/verb/ChangeHudTest()
//	set name="Change HUD - Swirl"
//	set category="Commands"
//	usr.ChangeHudSwirl()
mob/GainedAfterLogIn/verb/FixMeImStuck()
	set hidden=1
	if(usr.ImStuck)
		usr<<"Você só pode usar isso a cada 10 minutos."
		return
	if(usr.sphere)
		usr<<"Yeah,não."
		return
	if(usr.injail)
		usr<<"Você está na cadeia, idiota."
	if(usr.Jailed)
		return
	else
		usr.ImStuck=1
		spawn(6000)
			usr.ImStuck=0
		if(usr in InAssassinEvent || usr in Assassin)
			usr<<"Durante o evento de assassinar? LOL não."
			return
		if(usr.HasHiddenScroll)//Makes sure they never have the Hidden Ninja Scroll Ever
			usr<<"Cheater."
			for(var/obj/Hidden_Ninja_Scroll/H in usr.contents)
				H.loc=locate(usr.x,usr.y-1,usr.z)
			//	del(H)
			usr.DeathStruggle(usr,1)
			usr.JutsuDelay+=30000
			world<<"[usr] Tentou usar I'm stucky com a Hidden Scroll! (Como punimento ele teve 30000 de CD a mais)"
			return
		var/ZX=usr.x;var/ZY=usr.y;var/ZZ=usr.z
		view()<<"[src]  Começa a usar I'm stucky."
		usr<<"Fique parado por 30 segundos e você será transportado para o hospital.";sleep(300)
		if(ZX==usr.x&&ZY==usr.y&&ZZ==usr.z)
		//	usr.InDojo=0
			view()<<"[src] Foi teleportado via I'm stucky"
			usr.villageWarParticipating = 0
			usr.GotoVillageHospital()
mob/GainedAfterLogIn/verb/Help()
	set hidden=1
	switch(input(usr,"O que você precisa?","Opções",) in list("Creditos","Me concerte!","Informação do serve","Huds","Cancela"))
		if("Creditos")
			usr.Credits()
		if("Me concerte!")
			switch(input(usr,"O que você precisar ser concertado?","Ajuda",) in list("Restaura as dimensões da tela","Arma bugada","Cancela"))
				if("Restore Screen Dimensions")
					usr.ScreenY=19;usr.ScreenX=19;usr.OriginalY=19;usr.OriginalX=19
					usr.client.view="[usr.ScreenX]x[usr.ScreenY]"
					usr<<"Sua tela foi restaurada. Clique no cartão de opções no canto inferior esquerdo para confirmar."
				if("Arma ")
					usr<<"Você desequipa [usr.WeaponInLeftHand]."
					usr.WeaponInLeftHand=""
					usr<<"Você desequipa [usr.WeaponInRightHand]."
					usr.WeaponInRightHand=""
					for(var/obj/WEAPONS/k in src.contents)
						k.Equipped=0
		if("Informação do serve")
			var/calcLag = abs(world.cpu - 100)
			usr << "<strong>Server Hosted On: [world.system_type]</strong>"
			usr << "<strong>Server Efficiency: [calcLag]%</strong>"
			usr << "<strong>Server Port: [world.port]</strong>"
//--------------------------------------------------------------------------------------------------------
mob/proc/Credits()
	var/credittext = {"
		<html>
		<head>
		<title>Naruto: Final Fight</title>
		</head>
		<body bgcolor=#000000 text=#DDDDDD>
		<center><h2>Naruto:Final Fight</h2></center><hr>
		<p><strong>Founder:</strong> Raiketsii(SS10trunks) - This is dedicated to all those who helped me develop this game the past 3 years.<br>
		<p>
		<p>Special Thanks to all the GMs and previous owners, even you D-roc, who kept this game going for so long.
		<p>Previous Owners:Thank you For All Your Help, Im sorry that you are no longer here, but you were not forgotten
		<p>- D-roc(D-roc2k6)
		<p>- JohnnyBoy(JohnnyBoyBoss)
		<p>- Nurai(CuTiEAsHLEE) - might have mispelled that
		<p>-
		<p>- Current Owners -
		<p>- Faith(Generation) - You've been very helpful and despite our arguments I appreciate everything you did.
		<p>- Kaio(Zack101) - Game wouldn't be around right now and have progressed so much without you.
		<p>- Argon(DemonicK) - Thanks...and try Christianity out...PLEASE.
		<p>-
		<p>- Previous Staff -
		<p>- Iconners
		<p>- Kaio - active
		<p>- Herukoo
		<p>- Legendary Medic
		<p>- New Life
		<p>- Kanisaki
		<p>- Naraku
		<p>- I'm sure I forgot some but I'll add more as I remember them
		<p>-
		<p>- Mappers
		<p>- Kaio - Probably the best mapper we've ever had. - active
		<p>- Daddy - You were good but had a kid..we understood.
		<p>- If there are others...I'm sorry...but I forgot
		<p>-
		<p>- Coders
		<p>- D-roc
		<p>- Faith
		<p>- Yash
		<p>- JohnnyBoy
		<p>- Zig
		<p>- Argon - active
		<p>- Kaio - active
		<p>-
		<p>- Other GMs
		<p>- Doug
		<p>- Daddy
		<p>- Stone
		<p>- Phoenix
		<p>- Ayo
		<p>- Zaku
		<p>- Once Again Im Sure I May Have Left Out Some Names By Mistake...I Apologize
		<p>-
		<p>- Be Reminded that this is a dedication to the past GMs and Staff who built the game up to what it is now..Version 3
		<p>- And Now NAtS. Sorry it took so long to get here but Here's to <s>3</s> 5 years of coding, development, and fun.
		<br>
		</body>
		</html>
		"}
	usr << browse(credittext)
var
	worldC=1
	OOCEnabled=1
mob/var
	OOCon=1

mob/var/tmp/list/IgnoreList=list()
mob/GainedAfterLogIn/verb/IgnoreOOC()
	set name = "Ignorar Jogador"
	set category = "Comandos"
//	if(usr.key!="CobraT1337")
//		usr<<"Testing currently, will be released shortly."
//		return
	var/varPeople = list()
	for(var/mob/T in world)
		if(T.client)
			varPeople += T.key
	var/M = input(usr,"Selecione a conta cuja quer ignorar quando ele falar no OOC ou com você","Ignorar Jogador") in varPeople + list("Cancelar")
	var/mob/A=M
	if(M == "Cancelar")
		return
	usr<<"Tomas as mensagens de [A] Vão ser ignoradas."
	usr.IgnoreList+=A
mob/var/tmp/spam
mob/var/tmp/last
mob/GainedAfterLogIn/verb
	OOC(msg as text)
		set name = "OOC"
		set category = "Comandos"
		if(usr.CantAlert)
			usr<<"Você não pode usar isso agora."
			return
		if(!OOCEnabled)
			if(!src.GM)
				usr<<"OOC está desligado por enquanto."
				return
		if(usr.HandleName==null||usr.HandleName==""||(length(usr.HandleName)>20&&usr.key!="Lui12"))
			usr<<"Por favor, altere seu nome OOC.";return
		msg = client.E_Spam(msg)//spam protect
		if(msg == src.last)//if the thing they said last was the same thing
			usr << "Tentou repetir a mesma coisa!"//turns it into this
			src.tried_to_repeat += 1//tried to repeat here
			if(src.tried_to_repeat >= 1)//if they did it more than once
				src << "[Error_Message]Desculpe, sem spam."//they get a no spamming message
				src.spam += 1//spam goes up
				if(src.spam == 3)//if their spam is 3
					world << "[Error_Message][src] foi Obrigado a sair por espamar muito."//they get auto booted!
					src.spam=0
					del(src)
			return
		else
			src.spam=0
		var/list/L
		L = list("font size","font color")
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"não Desejado!")
				return
		if(usr.ckey in MuteList)
			alert(usr,"Você esta mutado!")
			return
		if(usr.client.computer_id==1190865046||usr.client.address=="66.169.133.113")
			msg = "some."
		if(usr.Jailed)
			alert(usr,"Você esta na jaula , não fale.")
			return
		if(findtext(msg,"byond://")||findtext(msg,"www.byond.com/games/"))
			usr<<"Se você quer anunciar, anuncie nossa Hub. www.byond.com/games/Lui12/NarutoCronicasShinobi"
			return
		if(!worldC)
			alert(usr,"O chat do Mundo esta desabilitado temporariamente.")
			return
		else //if it checks out
			if(spamcheck == TRUE)//if the player is spamming
				usr << "Taxa de Spam ultrapassado por favor, aguarde um momento e tente novamente!"//tell him to wait for a second
				return //stop it from sending
			else//if the message is ok to send
				usr.spamcheck()//check for spam
				msg=cuttext(msg)
				if(log)//if logging is turned on
					text2file("(((((OOC)))))[time2text(world.realtime)]:[usr] fala, [msg]","log.txt") // add it to the log
		if(usr.SilentMute)
			usr << "<font color = green><font size= 2>([usr.key])<font size= 1> - [usr.HandleName]:<font color=silver> [msg]"
		else
			for(var/mob/M in OnlinePlayers)
				if(usr.key in M.IgnoreList)
				//	world<<"[M] is in ignore list."
					M << "<font color = green><font size = 2>([usr.key])<font size = 1> - [usr.HandleName]:<font color = silver> Mensagem Ignorada"
				if(M.OOCon)
					if(!(usr.key in M.IgnoreList))
						M << "<font color = green><font size= 2>([usr.key])<font size= 1> - [usr.HandleName]:<font color=silver> [msg]"

			src.last = msg//makes last = t
	ToggleOOC()
		if(src.OOCon)
			src.OOCon=0
			src<<"Você deixa o OOC desligado."
			return
		else
			src<<"Você deixa o OOC ligado."
			src.OOCon=1
			return

mob/var/tmp/HelpSayToggle=1
mob/GainedAfterLogIn/verb/Toggle_Help_Say()
	if(usr.HelpSayToggle)
		if(usr.MemberRank=="Helper Lv.1"||usr.MemberRank=="Helper Lv.2"||usr.MemberRank=="Helper Lv.3")
			usr<<"Você não pode deixar o seu OOC de ajuda Desligado.";return
		usr.HelpSayToggle=0
		usr<<"Você deixa o seu OOC de ajuda desligado.";return
	else
		usr.HelpSayToggle=1;usr<<"Você deixa o OOC de ajuda ligado.";return

mob/GainedAfterLogIn/verb/Help_Say(msg as text)
	set desc = "Fale algo para as pessoas no jogo"
	set name = "OOC de ajuda"
	if(usr.CantAlert)
		usr<<"Você não pode usar isso agora."
		return
	if(usr.HandleName==null||usr.HandleName==""||length(usr.HandleName)>20)
		usr<<"Por favor mude seu nome no OOC.";return
	msg = client.E_Spam(msg)//spam protect
	if(msg == src.last)//if the thing they said last was the same thing
		usr << "I tried to repeat the same thing!"//turns it into this
		src.tried_to_repeat += 1//tried to repeat here
		if(src.tried_to_repeat >= 1)//if they did it more than once
			src << "[Error_Message]Sorry, No Spamming."//they get a no spamming message
			src.spam += 1//spam goes up
			if(src.spam == 3)//if their spam is 3
				world << "[Error_Message][src] has been auto-booted for spamming."//they get auto booted!
				src.spam=0
				del(src)
		return
	else
		src.spam=0
	var/list/L
	L = list("font size","font color")
	for(var/H in L)
		if(findtext(msg,H))
			alert(usr,"Não permetido!")
			return
	if(usr.ckey in MuteList)
		alert(usr,"Você está mudo!")
		return
	if(findtext(msg,"byond://")||findtext(msg,"www.byond.com/games/"))
		usr<<"Se você quer anunciar, anunciar nos fóruns. http://z8.invisionfree.com/NarutoFinalFight/index.php?act=idx"
		return
	if(!worldC)
		alert(usr,"Um adm Desligou o Chat do Mundo.")
		return
	else //if it checks out
		if(spamcheck == TRUE)//if the player is spamming
			usr << "Taxa de Spam ultrapassado por favor, aguarde um momento e tente novamente!"//tell him to wait for a second
			return //stop it from sending
		else//if the message is ok to send
			usr.spamcheck()//check for spam
			msg=cuttext(msg)
			if(log)//if logging is turned on
				text2file("(((((Help_Say)))))[time2text(world.realtime)]:[usr] Fala, [msg]","helpsaylog.txt") // add it to the log
	if(usr.SilentMute)
		usr<< "<font color = #8D7C9F><font size= 2>([usr.MemberRank])<font size= 1 color=#C9BACF> - [usr.key]: [msg]"
	else
		for(var/mob/M in world)
			if(M.HelpSayToggle)
				M << "<font color = #8D7C9F><font size= 2>([usr.MemberRank])<font size= 1 color=#C9BACF> - [usr.key]: [msg]"

		src.last = msg

var/A = list()

mob/GainedAfterLogIn
	verb
		Whisper(msg as text)
			if(usr.ckey in MuteList)
				return
			if(src.KBunshinOn)
				usr=src.controlled
			else
				usr=src
			if(!worldC)
				return
			else //if it checks out
				if(spamcheck == TRUE)//if the player is spamming
					usr << "Taxa de Spam ultrapassado por favor, aguarde um momento e tente novamente!"//tell him to wait for a second
					return //stop it from sending
				else//if the message is ok to send
					usr.spamcheck()//check for spam
					msg=cuttext(msg)
					for(var/mob/M in viewers(2,usr))
						if(istype(M,/mob/Clones/))
							var/mob/Clones/MX=M
							if(MX.CloneType=="KBunshin")
								var/mob/U=M.Owner
								if(findtext(usr.name,msg)) //If your name is in your text... (This is very sensitive, it must be their exact name.)
									if(U != usr)
										if(!(usr.name in U.namesknown)) //If they don't know your realname...
											U.namesknown += usr.name
								if(usr.TitleName!="")
									if(usr.name in U.namesknown)
										U<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr]<font color=white> Whispers: [html_encode(msg)]</font></b>"
									else
										U<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr.Village] Ninja<font color=white> Whispers: [html_encode(msg)]</font></b>"
								else
									if(usr.name in U.namesknown)
										U<<"<font face=trebuchet MS><b><font color=red>[usr]<font color=white> Whispers: [html_encode(msg)]</font></b>"
									else
										U<<"<font face=trebuchet MS><b><font color=red>[usr.Village] Ninja<font color=white> Whispers: [html_encode(msg)]</font></b>"
						else
							if(findtext(usr.name,msg)) //If your name is in your text... (This is very sensitive, it must be their exact name.)
								if(M != usr)
									if(!(usr.name in M.namesknown)) //If they don't know your realname...
										M.namesknown += usr.name
							if(usr.TitleName!="")
								if(usr.name in M.namesknown)
									M<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr]<font color=white> Whispers: [html_encode(msg)]</font></b>"
								else
									M<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr.Village] Ninja<font color=white> Whispers: [html_encode(msg)]</font></b>"

							else
								if(usr.name in M.namesknown)
									M<<"<font face=trebuchet MS><b><font color=red>[usr]<font color=white> Whispers: [html_encode(msg)]</font></b>"
								else
									M<<"<font face=trebuchet MS><b><font color=red>[usr.Village] Ninja<font color=white> Whispers: [html_encode(msg)]</font></b>"
/*					for(var/obj/Paper/Butterflies/B in viewers(8,usr))
						var/mob/U=B.Owner
						if(usr.TitleName!="")
							U<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
						else
							U<<"<font face=trebuchet MS><b><font color=red>[usr]<font color=white> Says: [html_encode(msg)]</font></b>"*/
					if(log)//if logging is turned on
						text2file("[time2text(world.realtime)]:[usr] Fala, [msg]","Saylog.txt") // add it to the log

		Say(msg as text)
			if(usr.CantAlert)
				usr<<"Você não pode usar isso agora."
				return
			if(usr.ckey in MuteList)
				return
			if(src.KBunshinOn)
				usr=src.controlled
			else
				usr=src
			if(!worldC)
				return
			else //if it checks out
				if(spamcheck == TRUE)//if the player is spamming
					usr <<"Whoa. Pare de falar tão rapido!"
				//	usr << "Spam rate exceeded please wait a moment and try again!"//tell him to wait for a second
					return //stop it from sending
				else//if the message is ok to send
					usr.spamcheck()//check for spam
					msg=cuttext(msg)
					if(usr.AFKChosenAnswer==""&&AFKChosenQuestion!=0)
						usr<<"Você enviou a sua resposta. Aguarde 30 segundos."
						usr.AFKChosenAnswer=msg
					//	AFKCheck-=usr
					var/number="3";var/px=16;var/py=18
					if(usr.dir==NORTH){number="4";px=-16}
					if(usr.dir==EAST){number="1";px=-8}
					if(usr.dir==WEST){number="2";px=8}
					var/image/I=image('Chat.dmi',icon_state=number,layer=5)
					I.pixel_x=px;I.pixel_y=py
					usr.overlays+=I
					spawn(10+round(length(msg)/5))
						usr.overlays-=I
					for(var/mob/M in viewers(8,usr))
						if(istype(M,/mob/Clones/))
							var/mob/Clones/MX=M
							if(MX.CloneType=="KBunshin")
								var/mob/U=M.Owner
								if(findtext(msg,usr.name)) //If your name is in your text
									if(U != usr)
										if(!(usr.name in U.namesknown)) //If they don't know your realname...
											U.namesknown += usr.name
								if(usr.TitleName!=""&&!usr.InHenge)
									if(usr.name in U.namesknown)
								//		U<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
										U<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>{[usr.TitleName]}[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
									else
									//	U<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr.Village] Ninja<font color=white> Says: [html_encode(msg)]</font></b>"
										U<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>{[usr.TitleName]}[usr.Village]<font color=white> Says: [html_encode(msg)]</font></b>"
								else
									if(usr.name in U.namesknown)
									//	U<<"<font face=trebuchet MS><b><font color=red>[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
										U<<"<font face=trebuchet MS><b><font color=red>[usr]<font color=[rgb(rand(250,254),0,0)]> Says: [html_encode(msg)]</font></b>"
									else if(!usr.InHenge)
										U<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>[usr.Village] Ninja<font color=white> Says: [html_encode(msg)]</font></b>"
									else
										U<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>[usr.name]<font color=white> Says: [html_encode(msg)]</font></b>"
						else
							if(findtext(msg,usr.name)) //If your name is in your text... (This is very sensitive, it must be their exact name.)
								if(M != usr)
									if(!(usr.name in M.namesknown)) //If they don't know your realname...
										M.namesknown += usr.name
							if(usr.TitleName!="")
								if(usr.name in M.namesknown)
									M<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>{[usr.TitleName]}[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
								else
									M<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>{[usr.TitleName]}[usr.Village] Ninja<font color=white> Says: [html_encode(msg)]</font></b>"

							else
								if(usr.name in M.namesknown)
									M<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
								else
									M<<"<font face=trebuchet MS><b><font color=[rgb(rand(250,254),0,0)]>[usr.Village]<font color=white> Says: [html_encode(msg)]</font></b>"
/*					for(var/obj/Paper/Butterflies/B in viewers(8,usr))
						var/mob/U=B.Owner
						if(usr.TitleName!="")
							U<<"<font face=trebuchet MS><b><font color=red>{[usr.TitleName]}[usr]<font color=white> Says: [html_encode(msg)]</font></b>"
						else
							U<<"<font face=trebuchet MS><b><font color=red>[usr]<font color=white> Says: [html_encode(msg)]</font></b>"*/
					for(var/mob/M in viewers(13,usr))
						if(M.Clan=="Inuzuka"&&usr in viewers(8+round(M.SuperHearing),M)&&!M in viewers(8,usr))
							if(findtext(usr.name,msg)) //If your name is in your text... (This is very sensitive, it must be their exact name.)
								if(M != usr)
									if(!(usr.name in M.namesknown)) //If they don't know your realname...
										M.namesknown += usr.name
							else
								if(usr.name in M.namesknown)
									M<<"<font face=trebuchet MS><b>You hear <font color=rgb(random(250,254),0,0)>[usr]<font color=white> Say: [html_encode(msg)]</font></b>"
								else
									M<<"<font face=trebuchet MS><b>You hear <font color=rgb(random(250,254),0,0)>[usr.Village]<font color=white> Say: [html_encode(msg)]</font></b>"
					if(log)//if logging is turned on
						text2file("[time2text(world.realtime)]:([usr.key])([usr.SecondName], [usr.FirstName]) [usr] says, [msg]","Saylog.txt") // add it to the log
						//you already have something for logging say o.o doesn't seem to work , like it saved once but never agai nlet me check

mob/GainedAfterLogIn/verb
	ChangeTitle()
		set hidden=1
		switch(input(src,"Você quer um Titulo?", text) in list ("Sim","Não"))
			if("Yes")
				NamingFirstName
				//First Name/Last Name
				var/characterfirstname=input(src,"Qual seu Titulo?","Name")
				if(length(characterfirstname)>12)
					alert(src,"Seu Titulo não pode ser Maior que 12 letras!")
					goto NamingFirstName
				else
					usr.TitleName=characterfirstname
					usr<<"Seu Titulo é agora [usr.TitleName]."
			if("Não")
				usr.TitleName=""
				usr<<"Agora você tem seu Titulo. você pode mudar as vezes de volta."
	ChangeOOC()
		set hidden=1
		switch(input(src,"Você quer mudar seu nome no OOC?", text) in list ("Sim","Não"))
			if("Sim")
				NamingFirstName
				//First Name/Last Name
				var/characterfirstname=input(src,"Qual seu Titulo?","Name")
				if(length(characterfirstname)>12)
					alert(src,"Seu Nome no OOC não pode ser maior que 12 letras!")
					goto NamingFirstName
				else
					usr.HandleName=characterfirstname
					usr<<"Seu nome no OOC é [usr.HandleName]."
mob/GainedAfterLogIn
	verb
		Emote(msg as text)
			if(usr.CantAlert)
				usr<<"Você não pode usar isso agora."
				return
			if(usr.ckey in MuteList)
				return
			if(!worldC)
				return
			else //if it checks out
				if(spamcheck == TRUE)//if the player is spamming
					usr << "Taxa ultrapassada de spam,espere um poco!"//tell him to wait for a second
					return //stop it from sending
				else//if the message is ok to send
					usr.spamcheck()//check for spam
					msg=cuttext(msg)
					var/Check=CheckEmote(msg,usr)
					if(Check==0) return	//if the CheckEmote() proc doesn't want people to see it ;O
					viewers(8,usr) << "<font color=cyan>*<font color=green> [usr] [html_encode(msg)] <font color=cyan>*"
					if(log)//if logging is turned on
						text2file("[time2text(world.realtime)]:[usr] says, [msg]","log.txt") // add it to the log
mob/GainedAfterLogIn/verb/Who()
	set hidden=1
	if(src.WhoDelay)
		return
	src.WhoDelay=1
	var/tmp
		html
		count
	var/const
		heading = {"
			<html>
				<head>
					<title>Playerlist</title>
					<style type="text/css">
						body {
							color: white;
							background-color: black;
							font-family: Arial, Times, Tahoma, sans-serif
						}
						th {
							font-weight: bold;
							font-size: 13pt
						}
						tr {
							font-size: 12pt;
							padding: 2px. 10px, 2,px, 10px
						}
					</style>
				</head>
				<body>
					<table border="0" width="500">
					<tr align="left">
							<th>Key
							<th>Name
							<th>Rank
		"}

	for(var/mob/M in world)
		if (M.client&&M.KeyVar==""&&M.key!="DemonicK"&&M.key!="TheIvelShadow"&&M.key!="DarkLinkofthePast"&&M.key!="XXSharingan123"&&M.key!="CobraT1337"&&M.loggedin) //Ivel requested silent login
			count += 1
			html += "<tr"
			if(M==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			else if(M.GM)
				html+=" style=\"color: yellow; font-weight: bold;\""
			html += "><td>"
			if(M.client.IsByondMember())
				html +="<img src='http://files.byondhome.com/Droc2k6/untitled.bmp'>"
			html += {"
						[M.key]
						<td>[M.HandleName]
						<td><b>[M.MemberRank]</b>
			"}

	html += {"
					<tr>
						<td colspan="5" style="padding-top: 10">
							<hr><b>Players Online: [count]</b>
					</table>
				</body>
			</html>
	"}
	var/count2=0
	for(var/mob/M in world)
		if (M.client&&M.key!="Roflcakesk"&&M.key!="Darkaizer"&&M.key!="DemonicK"&&!M.loggedin)
			count2 += 1
			html += "<tr"
			if(M==usr)
				html+=" style=\"color: red; font-weight: bold;\""
			else if(M.GM)
				html+=" style=\"color: yellow; font-weight: bold;\""
			html += "><td>"
			if(M.client.IsByondMember())
				html +="<img src='http://files.byondhome.com/Droc2k6/untitled.bmp'>"
			html += {"
						[M.key]
						<td>
						<td><b></b>
			"}

	html += {"
					<tr>
						<td colspan="5" style="padding-top: 10">
							<hr><b>Players Currently Not Logged in: [count2]</b>
					</table>
				</body>
			</html>
	"}
	usr << browse("[heading][html]","size=700x500,window=Players Online")
	spawn(50)
		src.WhoDelay=0
	html = null
	count = null

mob/var/tmp
	counting=0
mob/GainedAfterLogIn/verb/Countdown()
	set category = "Commands"
	set name = "Countdown"
	if(usr.counting)
		return
	usr.counting = 1
	view() << "<font color = yellow>[usr]:THREE"
	sleep(15)
	view() << "<font color = yellow>[usr]: TWO"
	sleep(15)
	view() << "<font color = yellow>[usr]: ONE"
	sleep(15)
	view() << "<font color = yellow>[usr]: GOOO"
	sleep(20)
	usr.counting=0
mob/GainedAfterLogIn/verb/Savenow()
	set hidden=1
	if(usr.cansave)
		var/firstletter=copytext(src.ckey, 1, 2)
		fdel("Saves/[firstletter]/[src.ckey].sav")
		var/savefile/F=new("Saves/[firstletter]/[src.ckey].sav")
		view(usr)<<"[src] salvou manualmente"
		usr.xco = usr.x
		usr.yco = usr.y
		usr.zco = usr.z
		usr.doingG = 0
		Write(F)
		spawn(10)usr<<"<font color=red><b>Your game has been saved!"
mob/GainedAfterLogIn
	verb
		Guide()
			set hidden=1
			var/tmp/html
			html = {"
			<html>
				<head>
					<style type="text/css">
						body {
							color: white;
							background-color: black;
							font-family: Arial, Times, Tahoma, sans-serif
						}
						th {
							font-weight: bold;
							font-size: 10pt
						}
						tr {
							font-size: 12pt;
							padding: 2px. 10px, 2,px, 10px
						}
					</style>
				</head>
			"}
			var/Stuffz = {"
				<html>
				<STYLE>BODY{font-family: Verdana}</STYLE>
				<head>
				<title>Student 101 Guide</title>
				</head>
				<body bgcolor=#f5f5f5 text=#000000>
				<center><h2>Guide To NFF</h2></center><hr>
				<br><center><font size=2>Remember, this guide is incomplete. We will continue to try to make this guide answer all questions.</b></center></font>
				<br><center>Head to the Forums to be answered on more specific topics. The guides on the forum are still in working.</center>
				<br>
				<br>
				<br><center><Font Size=6>Stats</Font></center>
				<br>This game ignores the ability of Stat System and it's calculations of your character's current stats are based ENTIRELY on your character's creation at the beginning. These stats you all gain at the beginning are called your Build. So then, I guess you might be wondering, "How do I get stronger?" In this game, strength is determined by another factor called "Skill."
				<br>After you answer your questions at the beginning and you determine your stats, you will have the ability to train and learn Jutsu. There are three important stats. These three stats are, "Vitality, Chakra and Stamina." These are the most important stats because they stats affect your life. If these things go down, it can hinder your battle skills.
				<br>Vitality is your inner-body. Your organs, and blood and all together. It is your last resort from knocking out, but if it ever reaches 0 you knock out anyways. Everyone starts out with 1500 Vitality points, no matter who you are except for certain exceptions. There are things to go by getting damage in Vitality, but it is primarily important to find things to protect this stat.
				<br>Chakra is your second important stat. This is basically your energy, or Ki. It is rotated around Chakra Control and it has no regeneration. It goes down the more you perform Jutsu and other techniques. To regenerate it simply hold down Z, it is based off of Chakra Control primarily speaking on how much you regenerate each second. If your chakra is below 0 and you continue to overuse it, it starts to take away your stamina so becareful how you use it.
				<br>Stamina is the final of these 3 stats and just as important as the rest. Everything uses Stamina, so it's not smart to use it up completely. Once your stamina reaches 0, you become slower and the more you continue to use it it begins to hit your Vitality.
				<br>Vitality will always be 1500 except for certain exceptions, because primarily all Ninja are all still Human. While Chakra and Stamina is different for every ninja. You can have between 900 to 10,000 Chakra. 900 of course being small. The highest chakra consumption from any jutsu is normally 200 though, making it make sense. While Stamina you can have between 1000,5000. Having both of these at high consuption is a highly unlikely situation, but it's pretty random what you start with.
				<br>Certain things can affect your chakra and stamina though to break the cap. You can not raise your base stat, but you can do things to go by it. Certain techniques work in certain ways of helping you enhance certain stats to defend these Stats.
				<br>
				<br>Now, the other three stats are also important. These three stats are, "Physique, Capacity and Control." These stats do something very important each and affect your damage in techniques. When you first create your character, you are given a series of questions. These questions determine, "Who" your character is. It also determined your stats within these. It is helpful to answer it truthfully so you can be designed in your own way but individually everyone would be different because of these questions.
				<br>You can not naturally train these stats itself to increase it base wise but you can use them to your advantage. Be sure to look at them, so you can know what your best at. Physique affects your physical damage such as Taijutsu Attacks and combos. Capacity affects your Ninjutsu type damage, while Control affects your Genjutsu attacks. These attacks are the elements of Ninja, and should be known by everyone. You must also look at the percentiles to know what to train in. If your Physique is low, then don't learn hand-to-hand combat techniques. If you like hand-to-hand, then remake for another Build.
				<br>You need to always remember, your character is Human. So try not to over-do yourself.
				<br>
				<br><center><Font Size=6>Training</Font></center>
				<br>So how do you train itself? In fact, what's the point of training. This game isn't just for fighting. It's a lot in traveling and searching, but this game does have training. In the top right corner of your stats lies a button called "SkillTree." By clicking this brings you to your Skill Tree that you can look at different cards. Jutsu Skill is the only one you will be able to primarily learn Jutsu from, that anyone can learn.
				<br>In the other skill trees are passives. Passives are mainly how you train, especially in different qualities. Instead of hitting a log for EXP, you perform your combos on your log to increase your Rush stat or Double Strike when you perform combos. By clicking on a passive, it will tell you how to increase it so be sure to listen up to it. It's important to continuasly check your passive's Skilltree so you know where and when you're at and how to continue to train and be stronger.
				<br>Some passives can affect your overall damage in certain techniques, while other passives can bring down some damages but there's a cap on a lot of them.
				<br>
				<br>After that, there's the matter of Jutsu. There are primarily three kind of Jutsu. Ninjutsu, Genjutsu and Taijutsu. Ninjutsu are techniques of mystical properties that require chakra(primarily speaking.) These techniques are in a wide variety of different things. Within Ninjutsu are also Chakra Nature attacks. Chakra Nature type attacks are basically Elements. They all have their weaknesses and advantages, making them an affective part of battle but it must always be remembered the Ninjutsu technique you're performing uses up chakra.
				<br>Genjutsu are Illusionary techniques. These techniques are made to confuse and make the enemy in daze. Genjutsu normally are effect based and should be used for primarily intelligence users because a lot of people can figure out they're in a Genjutsu and cancel out. If you can use it in your own advantage, you can make it their worst nightmare even if they know they're in a Genjutsu. Since Most Genjutsu never hits your health, it can hit your stamina.
				<br>Taijutsu on the other hand are Hand-To-Hand combat, normally up close. Because of this, Taijutsu techniques are the most dangerous to use but it can also be very powerful in disarming and harming an enemy. It can provide and rack up pretty high damage, but it mainly hits Stamina first before reaching Vitality. A strong enough punch can send a opponent flying though.
				<br>These three Jutsu styles affect your damage all together.
				<br>
				<br>To learn a Jutsu, you will be able to learn from a Teacher. Other than Teachers, you can learn certain techniques naturally because of a Kekkai Genkai or sometimes just because of your Clan. Other than those two factors, there will be scrolls and libraries to learn of Jutsu. Once you commence in learning a technique, it'll give you the EXP needed to learn that technique. Basically what you have to do is train enough Experience to finally learn that designated Jutsu. After you learn it, you have to wait that time in delay before you can learn another technique. For example, if you learn a technique worth 10,000 you have to wait 10,000 seconds to learn another one.
				<br>This is time online though, so be sure to stay online if you want to become a Jutsu hermit and learn thousands of techniques but it's also not recommended. After you learn a technique, the technique will pop up in your Jutsu tab as a SkillCard. Your Jutsu Tab is right next to your Skill Tree tab so it's easy to reach.
				<br>After learning a jutsu, if it's a Ninjutsu and Genjutsu technique you have to master it. By using any Jutsu 100 times, you'll master it otherwise it'll hinder you in battle commonly saying; "Jutsu Failed." In the time waiting for being able to learn another Jutsu, you should probably train the jutsu you learned and do other things.
				<br>Try to learn Jutsu that are right for you, there's always a description of the Jutsu when the teacher is recomending it to you.
				<br></body>
					</html>
					"}
			usr << browse("[Stuffz][html]","size=576x576,window=Student Info Guide 101")
mob/Spectator/verb
	Spectate_A_Player(mob/M in world)
		if(usr.client.eye!=usr)
			usr.client.eye=usr
			usr.client.perspective = MOB_PERSPECTIVE
			return
		else
			usr.client.eye=M
			world<<"<font green><TT>[usr.HandleName] is spectating [M].</font></TT>"
			usr.client.perspective = EYE_PERSPECTIVE|EDGE_PERSPECTIVE








mob/Warp
	verb/BaseTeleport()
		set category = "Akatsuki"
		set name = "Retorna a Base"
		usr.ChakraDrain(80000)
		usr.ChakraPool-=2000
		usr.ChakraPool/=2
		usr.Handseals(180-src.HandsealSpeed)
		if(usr.HandsSlipped) return
		view()<<"[usr] Teleporta Misteriosamente!"
		usr.loc=locate(182,150,33)
	verb/Warp()
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Warp"
		var/list/Members=list()
		for(var/mob/C in world)
			if(!C.client)
				continue
			else if(C.AkatsukiMember||C.AkatsukiLeader)
				Members.Add(C)
		if(Members.len<1)
			usr<<"Não tem nenhum outro membro a prender."
			return
		var/mob/M=input(usr,"Teleport to which person?") in Members
		usr<<"Você começa a se concentrar intensamente quanto você seqüência de seus sinais de mão..."
		var/ZX=usr.x;var/ZY=usr.y;var/ZZ=usr.z
		usr.Handseals(150)
		if(ZX!=usr.x||ZY!=usr.y||ZZ!=usr.z)
			usr<<"Sua concentração ficou ruim e seu teleporte falhou!"
			return
		if(usr.firing||usr.Kaiten == 1)
			return
		if(usr.inso == 1)
			usr<<"Não enquanto estiver em Soutourou!"
		if(usr.chakra <= 1500)
			usr<<"Você precisa de 1500 chakra!"
			return
		else
			var/Cdrain = rand(1500,1700)
			usr.chakra -= Cdrain
			usr.firing = 1
			usr.overlays += 'Warp.dmi'
			sleep(8)
			usr.loc = locate(M.x,M.y+1,M.z)
			usr.firing = 0
			usr.overlays -= 'Warp.dmi'
	verb/Warp2(varX as num, varY as num, varZ as num)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Location Warp"
		usr<<"Você começa a se concentrar intensamente quanto você seqüência de seus sinais de mão..."
		var/ZX=usr.x;var/ZY=usr.y;var/ZZ=usr.z
		usr.Handseals(150)
		if(ZX!=usr.x||ZY!=usr.y||ZZ!=usr.z)
			usr<<"Sua concentração ficou ruim e seu teleporte falhou!"
			return
		if(usr.firing||usr.Kaiten == 1)
			return
		if(src.KiriOpen)
			if(prob(10)) src<<"Você deveria esperar para usar isso denovo."
			return
		if(usr.inso == 1)
			usr<<"Não enquanto estiver em Soutourou!"
		if(usr.chakra <= 2000)
			usr<<"Você precisa de 2000 de Chakra!"
		else
			var/Cdrain = rand(2000,2100)
			src.KiriOpen=1
			spawn(800)
				src.KiriOpen=0
			usr.chakra -= Cdrain
			usr.firing = 1
			usr.overlays += 'Warp.dmi'
			sleep(8)
			if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
				varX = world.maxx
			else
				if(varX < 1) // if its less than one go to one since you cant have negative map points
					varX = 1
			if(varY > world.maxy)
				varY = world.maxy
			else
				if(varY < 1)
					varY = 1
			if(varZ > world.maxz)
				varZ = world.maxz
			else
				if(varZ < 1)
					varZ = 1
			usr.loc = locate(varX,varY,varZ)
			usr.firing = 0
			usr.overlays -= 'Warp.dmi'
	verb/Warp3(mob/M in world)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Warp Group"
		var/list/Members=list()
		for(var/mob/C in world)
			if(!C.client)
				continue
			else if(C.AkatsukiMember||C.AkatsukiLeader)
				Members.Add(C)
		if(Members.len<1)
			usr<<"Não há outros membros para se deformar."
			return
		usr<<"Você começa a se concentrar intensamente quanto você seqüência de seus sinais de mão..."
		var/ZX=usr.x;var/ZY=usr.y;var/ZZ=usr.z
		usr.Handseals(250)
		if(ZX!=usr.x||ZY!=usr.y||ZZ!=usr.z)
			usr<<"Sua concentração ficou ruim e seu teleporte falhou!"
			return
		if(usr.firing||usr.Kaiten == 1)
			return
		if(usr.inso == 1)
			usr<<"Não enquanto estiver em  Soutourou!"
		if(usr.chakra <= 2000)
			usr<<"Você precisa de pelo menos 2000 de chakra!"
			return
		else
			var/Cdrain = rand(1500,2000)
			usr.chakra -= Cdrain
			usr.firing = 1
			for(var/mob/K in view(1,usr))
				K.overlays += 'Warp.dmi'
				usr.chakra -= 2500
				spawn(7)
					K.loc = locate(M.x,M.y+1,M.z)
					K.overlays -= 'Warp.dmi'
					K.overlays -= 'Warp.dmi'
					K.firing = 0
	verb/Warp4(varX as num, varY as num, varZ as num)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Warp Group To Location"
		usr<<"Você começa a se concentrar intensamente quanto você seqüência de seus sinais de mão..."
		var/ZX=usr.x;var/ZY=usr.y;var/ZZ=usr.z
		usr.Handseals(250)
		if(ZX!=usr.x||ZY!=usr.y||ZZ!=usr.z)
			usr<<"Sua concentração ficou ruim e o teleporte falhou!"
			return
		if(usr.firing||usr.Kaiten == 1)
			return
		if(usr.inso == 1)
			usr<<"Não enquanto estive em Soutourou!"
		if(usr.chakra <= 3500)
			usr<<"Você não tem tudo isso de chakra!"
			return
		else
			var/Cdrain = rand(3500,40000)
			usr.chakra -= Cdrain
			usr.firing = 1
			if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
				varX = world.maxx
			else
				if(varX < 1) // if its less than one go to one since you cant have negative map points
					varX = 1
			if(varY > world.maxy)
				varY = world.maxy
			else
				if(varY < 1)
					varY = 1
			if(varZ > world.maxz)
				varZ = world.maxz
			else
				if(varZ < 1)
					varZ = 1
			for(var/mob/K in view(1,usr))
				K.overlays += 'Warp.dmi'
				usr.chakra-=4500
				spawn(7)
					K.loc = locate(varX,varY+1,varZ)
					K.overlays -= 'Warp.dmi'
					K.overlays -= 'Warp.dmi'
					K.firing = 0
			usr.loc = locate(varX,varY,varZ)

	verb/GetCoords(mob/M in world)
		usr<<"[M]'está no [M.z] z level. Isso é tudo que posso lhe falar."
mob/var/tmp/ScalpelDrainLess=0
mob/Daito/verb
	Target_Nearest()
		for(var/mob/M in range(10,usr))
			if(M!=usr&&M.client)
				var/image/I = image('Icons/target1.dmi',M)
				usr<<I
				usr.target=M
				usr.TargetPerm=1
				usr<<"<b>You target [M]</b>"
				break
			else
				continue
	Scapels()
		set name="Scalpels não vão drenar agora"
		if(usr.ScalpelDrainLess)
			usr<<"Scalpels vão drenar agora."
		else
			usr.ScalpelDrainLess=1
			usr<<"Usar Chakra scalpels não vão drenar mais agora!"
	GimmeMoney()
		set name="Give Money"
		usr.Yen=10000000
		//Finish later

////////////
//Minato
/*var/list/SealPlacedOn=list()
mob/var/tmp/
	SealPlaced=0
mob/MinatoWarp
	verb/MinatoWarp1()
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Flying Thunder God Technique"
		usr.Handseals()
		if(usr.firing||usr.Kaiten == 1)
			return
		else
			var/list/SealPlacedOn=list()
			if(SealPlacedOn.len>0)

			//	var/M=input(usr,"Which person do you wish to teleport to?","Flying Thunder God Technique") in M + list("Cancel")
			//	if(M=="Cancel")
			//		return
			view()<<"[src] vanishes in a flash of light."
			usr.firing = 1
			usr.overlays += 'MinatoWarp.dmi'
			sleep(7)
			var/mob/M=SealPlacedOn
			usr.loc = locate(M.x,M.y+1,M.z)
			usr.firing = 0
			usr.overlays -= 'MinatoWarp.dmi'
	verb/MinatoWarp2(varX as num, varY as num, varZ as num)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Location Warp"
		usr.Handseals()
		if(usr.firing||usr.Kaiten == 1)
			return
		if(src.KiriOpen)
			if(prob(10)) src<<"You must wait to use this again."
			return
		else
			view()<<"[src] vanishes in a flash of light."
			src.KiriOpen=1
			spawn(800)
				src.KiriOpen=0
			usr.firing = 1
			usr.overlays += 'MinatoWarp.dmi'
			sleep(7)
			if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
				varX = world.maxx
			else
				if(varX < 1) // if its less than one go to one since you cant have negative map points
					varX = 1
			if(varY > world.maxy)
				varY = world.maxy
			else
				if(varY < 1)
					varY = 1
			if(varZ > world.maxz)
				varZ = world.maxz
			else
				if(varZ < 1)
					varZ = 1
			usr.loc = locate(varX,varY,varZ)
			usr.firing = 0
			usr.overlays -= 'MinatoWarp.dmi'
	verb/MinatoWarp3(mob/M in world)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Warp Group"
		if(usr.firing||usr.Kaiten == 1)
			return
		else
			view()<<"[src] vanishes in a flash of light."
			usr.firing = 1
			for(var/mob/K in view(1,usr))
				K.overlays += 'MinatoWarp.dmi'
				spawn(7)
					K.loc = locate(M.x,M.y+1,M.z)
					K.overlays -= 'MinatoWarp.dmi'
					K.overlays -= 'MinatoWarp.dmi'
					K.firing = 0
	verb/MinatoWarp4(varX as num, varY as num, varZ as num)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Warp Group To Location"
		if(usr.firing||usr.Kaiten == 1)
			return
		else
			view()<<"[src] vanishes in a flash of light."
			for(var/mob/K in view(1,usr))
			usr.firing = 1
			if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
				varX = world.maxx
			else
				if(varX < 1) // if its less than one go to one since you cant have negative map points
					varX = 1
			if(varY > world.maxy)
				varY = world.maxy
			else
				if(varY < 1)
					varY = 1
			if(varZ > world.maxz)
				varZ = world.maxz
			else
				if(varZ < 1)
					varZ = 1
			usr.loc = locate(varX,varY,varZ)
			for(var/mob/K in view(1,usr))
				K.overlays += 'MinatoWarp.dmi'
				spawn(7)
					K.loc = locate(usr.x,usr.y+1,usr.z)
					K.overlays -= 'MinatoWarp.dmi'
					K.overlays -= 'MinatoWarp.dmi'
					K.firing = 0
	verb/MinatoWarp5(mob/M in world)
		set category = "Attacks"
		set name = "Space Time Ninjutsu: Village Warp"
		if(usr.firing||usr.Kaiten == 1)
			return
		else
			view()<<"[src] vanishes in a flash of light."
			usr.firing = 1
			for(var/mob/K in view(20,usr))
				K.overlays += 'MinatoWarp.dmi'
				spawn(7)
					K.loc = locate(M.x,M.y+1,M.z)
					K.overlays -= 'MinatoWarp.dmi'
					K.overlays -= 'MinatoWarp.dmi'
					K.firing = 0
	verb/PlaceSeal(mob/M in world)
		set category = "Attacks"
		set name = "Thunder God Seal"
		if(M in get_step(usr,usr.dir))
			src<<"You place a seal on [M]'s body without them noticing!"
			M.SealPlaced=1
			if(M.SealPlaced==1)
				SealPlacedOn+=M*/