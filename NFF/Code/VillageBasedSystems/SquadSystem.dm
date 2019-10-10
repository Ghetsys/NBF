/////////////////////////////////////////////////////////////////////////////////////////
//Squads
//////////////////////////////////////////////////////////////////
var
	list/
		Guilds = list()
mob/var/party_count=0
mob/GainedAfterLogIn/
	verb
		CriarEsquad()
			set hidden=1
			set name="Criar Equipe"
			set desc="Precisa da Permis�o do kage para criar equipes."
			if(!usr.PermissionToStartSquad||usr.Village=="Missing")
				usr<<"Voc� n�o tem permiss�o para iniciar um Esquadr�o!"
				return
			var/list/L
			L = list("font size")

			if(usr.in_guild)
				usr<<"Voc� est� em uma Equipe j�!"
				return
			switch(alert("Tem certeza de que deseja criar uma Equipe?","Criar Equipe","Sim","N�o"))
				if("Sim")
					goto Create
				if("N�o")
					return
			Create
				var/savefile/F = new("World Save Files/Guilds.sav")
				var/new_guild_name = input("Como Voc� deseja chamar o seu time?","Nome Time") as text
				if(findtextEx("Guilds.txt","[new_guild_name]")==1)
					alert("J� existe uma equipe com esse nome.")
					return
				if(!new_guild_name)
					alert("O Nome da equipe n�o pode estar em branco.")
					return
				for(var/X in L)
					if(findtext(new_guild_name,X))
						alert("Voc� n�o pode mudar o tamanho da fonte.")
						return
				if(lentext(new_guild_name)>1000000)
					alert("N�o pode ser mais do que 1000000 letras!")
					goto Create
				switch(alert("Voc� deseja chamar o seu time de [new_guild_name]?","Time Nome","Sim","N�o"))
					if("Sim")
						goto Finalise
					if("N�o")
						goto Create
				Finalise
					text2file("(Equipe - Criada)-[time2text(world.realtime)]:[new_guild_name] : Lider-[src]","Guilds.txt")
					src.guild_name = new_guild_name
					src.guild_leader = 1
					src.guild_rank="Lider"
					src.in_guild=1
					Guilds.Add(new_guild_name)
					F["Guilds"] << Guilds
					src.Give_Guild_Verbs()
					src.verbs -= new/mob/GainedAfterLogIn/verb/CriarEsquad()
					src.party_count=1
mob/Guild_Leader
	verb
		Guild_Invite()
			set category = "Equipe"
			set name = "Chamar para Equipe"
			if(src.party_count>=4) return
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(!M.in_guild)
						Menu.Add(M)

			var/mob/M = input("Convidar quem?","Convidar Equipe") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(!M.Village==usr.Village)
					usr<<"Eles devem estar na mesma aldeia como voc�!";return
				switch(alert(M,"Voc� gostaria de se juntar [usr]'s Equipe?","Equipe","Sim","N�o"))

					if("Sim")
						M.guild_name = usr.guild_name
						M.guild_member = 1
						M.guild_rank = "Membro"
						M.in_guild = 1
						usr.party_count+=1
						M.Give_Guild_Verbs()
						M.verbs -= new/mob/GainedAfterLogIn/verb/CriarEsquad()

						for(var/mob/X in world)
							if(X.guild_name == usr.guild_name)
								X << "<font color = #BB0EDA>Squad Information:</font> [M] Se juntou a Equipe!"


					if("N�o")
						usr << "[M] recusou seu Convite de Equipe"
						return
		Squad_Boot()
			set category = "Equipe"
			set name = "Expulsar da Equipe"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.in_guild)
						if(M.guild_name == usr.guild_name)
							Menu.Add(M)

			var/mob/M = input("Expulsar Quem?","Expulsar da Equipe") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert("Voc� n�o pode expulsar o lider!")
					return
				switch(alert("Voc� quer expulsar [M] da Equipe?","Expulsar da Equipe","Sim","N�o"))

					if("Sim")
						M.Remove_Guild_Verbs()

						for(var/mob/X in world)
							if(X.guild_name == M.guild_name)
								X << "<font color = #BB0EDA>Informa��o da Equipe:</font> [M] foi expulso da Equipe!"

						M.guild_name = "None"
						M.guild_leader = 0
						M.guild_member = 0
						usr.party_count-=1

						M.guild_rank = ""
						M.in_guild = 0

						M.verbs += new/mob/GainedAfterLogIn/verb/CriarEsquad()

					if("N�o")
						usr << "Voc� decidiu n�o expulsar [M]"
						return

		Squad_Announce(T as text)
			set category = "Equipe"
			set name = "Anunciar para equipe"

			var/list/L
			L = list("font size")

			if(lentext(T) > 350)
				alert("Sua mensagem n�o pode ter mais que 350 letras!")
				return

			if(!T)
				alert("Sua mensagem n�o pode ser em branco.")
				return

			for(var/X in L)
				if(findtext(T,X))
					alert("Voc� n�o pode mudar a fonte.")
					return

			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					X << "<BR>----- Anuncio da Equipe -----<BR><font color=#000066>{<font color=#FFFFFF><font face = Arial>[src.guild_rank]<font color=#000066>}</font> [usr]: [T]<BR>"

mob/Guild_Verbs
	verb
		Squad_Chat(T as text)
			set category = "Equipe"
			set name = "Chat da Equipe"

			var/list/L
			L = list("font size")

			if(lentext(T) > 300)
				alert("Voc� n�o pode mandar mais que 300 letras!")
				return

			if(!T)
				alert("Sua mensagem n�o pode ser em branco.")
				return

			for(var/X in L)
				if(findtext(T,X))
					alert("Voc� n�o pode mudar a fonte da letra.")
					return

			for(var/mob/X in world)
				if(X.guild_name == usr.guild_name)
					X << {"<pre><strong><font color="#000066">{<font color="#FFFFFF"><font face = Arial>Squad<font color="#000066">}<font color="#000066">[src.guild_name]: {<font color="#FFFFFF"><font face = Arial>[src.guild_rank]<font color="#000066">}</font></font></font></strong></pre> [src.name] Fala:<font color = #CCCCCC> [T]"}


		Squad_Who()
			set category = "Equipe"
			set name = "Equipe Online"
			var/count = 0
			usr << "-------------------------------"
			for(var/mob/X in world)
				if(X.in_guild)
					if(X.guild_name == usr.guild_name)
						count += 1
						usr << "<font color=#000066>{<font color=#FFFFFF><font face = Arial>[X.guild_rank]<font color=#000066>}</font> [X]"
			usr << "Squad Members Online: [count]"
			usr << "-------------------------------"
		Mission_Join_Toggle()
			set category = "Equipe"
			set name = "Juntar as Missoes"
			if(usr.MissionJoinLaw)
				usr<<"Voc� desativ�-o."
				usr.MissionJoinLaw=0
				return
			else
				usr<<"Voc� lig�-o! Agora voc� ir� se juntar-se a cada Miss�o que seus companheiros de equipe pegarem."
				usr.MissionJoinLaw=1
				return
		Squad_Leave()
			set category = "Equipe"
			set name = "Deixar Equipe"
			if(!src.guild_leader)
				switch(alert("Tem certeza de que deseja deixar a Equipe [src.guild_name]?","Deixar Equipe","Sim","N�o"))

					if("Sim")
						src.Remove_Guild_Verbs()

						for(var/mob/X in world)
							if(X.guild_name == src.guild_name)
								X << "<font color = #BB0EDA>Informa��o da Equipe:</font> [src] deixou a Equipe!"

						src.guild_name = ""
						src.guild_leader = 0
						src.guild_member = 0

						src.guild_rank = ""
						src.in_guild = 0

						src.verbs += new/mob/GainedAfterLogIn/verb/CriarEsquad()

					if("N�o")
						return
			else
				switch(alert("Tem certeza de que deseja deletar a Equipe [src.guild_name]?","Deletar Equipe","Sim","N�o"))

					if("Sim")
						for(var/mob/M in world)
							if(M.guild_name==src.guild_name)
								M<< "<font color = #BB0EDA>Informa��o da Equipe:</font> [src] Acabou com a equipe: [src.guild_name]!"
						var/savefile/F = new("World Save Files/Guilds.sav")

						src.Remove_Guild_Verbs()


						for(var/mob/M in world)
							if(M.guild_name==src.guild_name)
								if(M==src.guild_leader)
									M.party_count-=1
						Guilds.Remove(src.guild_name)
						F["Guilds"] << Guilds
						text2file("(Equipe - Deletada)[time2text(world.realtime)]:[src.guild_name] : Lider-[src]","Guilds.txt")

						src.guild_name = ""
						src.guild_leader = 0
						src.guild_member = 0

						src.guild_rank = ""
						src.in_guild = 0



						src.verbs += new/mob/GainedAfterLogIn/verb/CriarEsquad()

					if("N�o")
						return

mob
	proc
		Give_Guild_Verbs()
			if(src.guild_leader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)

			if(src.guild_member)
				src.verbs += typesof(/mob/Guild_Verbs/verb)

		Remove_Guild_Verbs()
			if(src.guild_leader)
				src.verbs -= typesof(/mob/Guild_Leader/verb)
				src.verbs -= typesof(/mob/Guild_Verbs/verb)

			if(src.guild_member)
				src.verbs -= typesof(/mob/Guild_Verbs/verb)