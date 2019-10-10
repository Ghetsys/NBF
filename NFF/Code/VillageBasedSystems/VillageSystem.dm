mob/var/list/VillagePermits = list()
var/list/VillagesAtWar = list()

//Village Variables
var
	list
		RockAnbu = list("")
		LeafAnbu = list("")
		RainAnbu = list("")
		SoundAnbu = list("")
var
	LeafOnlyGeninDojo=1
	LeafAnbuArmorAmmount
	SoundOnlyGeninDojo
	SoundAnbuArmorAmmount
	RockOnlyGeninDojo
	RockAnbuArmorAmmount
	RainOnlyGeninDojo
	RainAnbuArmorAmmount
	Hokage
	Amekoutei
	Tsuchikage
	Otokami
	SoundVillageOfficial
	LeafVillageOfficial
	RainVillageOfficial
	RockVillageOfficial

	LeafVillagePool=1500000
	LeafInRecession=0  //We need a more efficient way to do this. Try asking DB about Params or something
	RockVillagePool=1500000
	RockInRecession=0  //I Couldn't for the life of me begin to understand them, but this is too many vars.
	SoundVillagePool=1500000
	LeafBedsWorking=1
	RockBedsWorking=1
	RainBedsWorking=1
	SoundBedsWorking=1
	LeafDebtToSound=0
	LeafDebtToRock=0
	LeafDebtToRain=0
	RockDebtToLeaf=0
	RockDebtToRain=0
	RockDebtToSound=0
	RainDebtToLeaf=0
	RainDebtToRock=0
	RainDebtToSound=0
	SoundDebtToLeaf=0
	SoundDebtToRain=0
	SoundDebtToRock=0
	SoundInRecession=0
	RainVillagePool=1500000
	RainInRecession=0
	LeafBedTime=2400
	LeafBedRate=2
	RockBedTime=2400
	RockBedRate=2
	RainBedTime=2400
	RainBedRate=2
	SoundBedTime=2400
	SoundBedRate=2
	LeafMTax=0
	LeafFTax=0
	LeafCTax=0
	LeafWTax=0
	RockMTax=0
	RockFTax=0
	RockCTax=0
	RockWTax=0
	RainMTax=0
	RainFTax=0
	RainCTax=0
	RainWTax=0
	SoundMTax=0
	SoundFTax=0
	SoundCTax=0
	SoundWTax=0
	LeafInDepression=0
	SoundInDepression=0
	RockInDepression=0
	RainInDepression=0
	RainVillageMissionFree=0
	LeafVillageMissionFree=0
	RockVillageMissionFree=0
	SoundVillageMissionFree=0

	LeafPayment=0
	SoundPayment=0
	RockPayment=0
	RainPayment=0
proc
	SaveVillageStuff()
		var/savefile/F = new("World Save Files/VillageStuff.sav")

		F["Rock Anbu"] << RockAnbu
		F["Leaf Anbu"] << LeafAnbu
		F["Rain Anbu"] << RainAnbu
		F["Sound Anbu"] << SoundAnbu
		F["Hokage"] << Hokage
		F["Leaf Village Official"] << LeafVillageOfficial
		F["LeafVillagePool"] << LeafVillagePool
		F["Leaf In Recession"] << LeafInRecession
		F["Leaf Debt To Sound"] << LeafDebtToSound
		F["Leaf Debt To Rain"] << LeafDebtToRain
		F["Leaf Debt To Rock"] << LeafDebtToRock
		F["Leaf Beds Working"] << LeafBedsWorking
		F["Rock Beds Working"] << RockBedsWorking
		F["Rain Beds Working"] << RainBedsWorking
		F["Sound Beds Working"] << SoundBedsWorking
		F["Rain Debt To Sound"] << RainDebtToSound
		F["Rain Debt To Leaf"] << RainDebtToLeaf
		F["Rain Debt To Rock"] << RainDebtToRock
		F["Rock Debt To Sound"] << RockDebtToSound
		F["Rock Debt To Rain"] << RockDebtToRain
		F["Rock Debt To Leaf"] << RockDebtToLeaf
		F["Sound Debt To Leaf"] << SoundDebtToLeaf
		F["Sound Debt To Rain"] << SoundDebtToRain
		F["Sound Debt To Rock"] << SoundDebtToRock
		F["Leaf Bed Time"] << LeafBedTime
		F["Leaf Bed Rate"] << LeafBedRate
		F["Rock Bed Time"] << RockBedTime
		F["Rock Bed Rate"] << RockBedRate
		F["Rain Bed Time"] << RainBedTime
		F["Rain Bed Rate"] << RainBedRate
		F["Sound Bed Time"] << SoundBedTime
		F["Sound Bed Rate"] << SoundBedRate
		F["LeafMTax"] << LeafMTax
		F["LeafFTax"] << LeafFTax
		F["LeafCTax"] << LeafCTax
		F["LeafWTax"] << LeafWTax
		F["Tsuchikage"] << Tsuchikage
		F["Rock Village Official"] << RockVillageOfficial
		F["RockVillagePool"] << RockVillagePool
		F["Rock In Recession"] << RockInRecession
		F["RockMTax"] << RockMTax
		F["RockFTax"] << RockFTax
		F["RockCTax"] << RockCTax
		F["RockWTax"] << RockWTax
		F["Amekoutei"] << Amekoutei
		F["Rain Village Official"] << RainVillageOfficial
		F["RainVillagePool"] << RainVillagePool
		F["Rain In Recession"] << RainInRecession
		F["RainMTax"] << RainMTax
		F["RainFTax"] << RainFTax
		F["RainCTax"] << RainCTax
		F["RainWTax"] << RainWTax
		F["Otokami"] << Otokami
		F["Sound Village Official"] << SoundVillageOfficial
		F["SoundVillagePool"] << SoundVillagePool
		F["Sound In Recession"] << SoundInRecession
		F["SoundMTax"] << SoundMTax
		F["SoundFTax"] << SoundFTax
		F["SoundCTax"] << SoundCTax
		F["SoundWTax"] << SoundWTax
		F["Leaf In Depression"] << LeafInDepression
		F["Rain In Depression"] << RainInDepression
		F["Sound In Depression"] << SoundInDepression
		F["Rock In Depression"] << RockInDepression
		F["Sound Village Mission Free"] << SoundVillageMissionFree
		F["Rain Village Mission Free"] << RainVillageMissionFree
		F["Leaf Village Mission Free"] << LeafVillageMissionFree
		F["Rock Village Mission Free"] << RockVillageMissionFree

	LoadVillageStuff()
		if(fexists("World Save Files/VillageStuff.sav"))
			var/savefile/F = new/savefile("World Save Files/VillageStuff.sav")
			F["Rock Anbu"] >> RockAnbu
			F["Leaf Anbu"] >> LeafAnbu
			F["Rain Anbu"] >> RainAnbu
			F["Sound Anbu"] >> SoundAnbu
			F["Hokage"] >> Hokage
			F["Leaf Village Official"] >> LeafVillageOfficial
			F["LeafVillagePool"] >> LeafVillagePool
			F["Leaf In Recession"] >> LeafInRecession
			F["Leaf Beds Working"] >> LeafBedsWorking
			F["Rock Beds Working"] >> RockBedsWorking
			F["Rain Beds Working"] >> RainBedsWorking
			F["Sound Beds Working"] >> SoundBedsWorking
			F["Leaf Debt To Sound"] >> LeafDebtToSound
			F["Leaf Debt To Rain"] >> LeafDebtToRain
			F["Leaf Debt To Rock"] >> LeafDebtToRock
			F["Rain Debt To Sound"] >> RainDebtToSound
			F["Rain Debt To Leaf"] >> RainDebtToLeaf
			F["Rain Debt To Rock"] >> RainDebtToRock
			F["Rock Debt To Sound"] >> RockDebtToSound
			F["Rock Debt To Rain"] >> RockDebtToRain
			F["Rock Debt To Leaf"] >> RockDebtToLeaf
			F["Sound Debt To Leaf"] >> SoundDebtToLeaf
			F["Sound Debt To Rain"] >> SoundDebtToRain
			F["Sound Debt To Rock"] >> SoundDebtToRock
			F["Leaf Bed Time"] >> LeafBedTime
			F["Leaf Bed Rate"] >> LeafBedRate
			F["Rock Bed Time"] >> RockBedTime
			F["Rock Bed Rate"] >> RockBedRate
			F["Rain Bed Time"] >> RainBedTime
			F["Rain Bed Rate"] >> RockBedRate
			F["Sound Bed Time"] >> SoundBedTime
			F["Sound Bed Rate"] >> SoundBedRate
			F["LeafMTax"] >> LeafMTax
			F["LeafFTax"] >> LeafFTax
			F["LeafCTax"] >> LeafCTax
			F["LeafWTax"] >> LeafWTax
			F["Tsuchikage"] >> Tsuchikage
			F["Rock Village Official"] >> RockVillageOfficial
			F["RockVillagePool"] >> RockVillagePool
			F["Rock In Recession"] >> RockInRecession
			F["RockMTax"] >> RockMTax
			F["RockFTax"] >> RockFTax
			F["RockCTax"] >> RockCTax
			F["RockWTax"] >> RockWTax
			F["Amekoutei"] >> Amekoutei
			F["Rain Village Official"] >> RainVillageOfficial
			F["RainVillagePool"] >> RainVillagePool
			F["Rain In Recession"] >> RainInRecession
			F["RainMTax"] >> RainMTax
			F["RainFTax"] >> RainFTax
			F["RainCTax"] >> RainCTax
			F["RainWTax"] >> RainWTax
			F["Otokami"] >> Otokami
			F["Sound Village Official"] >> SoundVillageOfficial
			F["SoundVillagePool"] >> SoundVillagePool
			F["Sound In Recession"] >> SoundInRecession
			F["SoundMTax"] >> SoundMTax
			F["SoundFTax"] >> SoundFTax
			F["SoundCTax"] >> SoundCTax
			F["SoundWTax"] >> SoundWTax
			F["Leaf In Depression"] >> LeafInDepression
			F["Rain In Depression"] >> RainInDepression
			F["Sound In Depression"] >> SoundInDepression
			F["Rock In Depression"] >> RockInDepression
			F["Sound Village Mission Free"] >> SoundVillageMissionFree
			F["Rain Village Mission Free"] >> RainVillageMissionFree
			F["Leaf Village Mission Free"] >> LeafVillageMissionFree
			F["Rock Village Mission Free"] >> RockVillageMissionFree
////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
//Village Based Verbs
mob/var/VillageSayOn=1
mob/var/tried_to_repeat1
mob/var/tmp/spam1
mob/var/tmp/last1
mob/GainedAfterLogIn
	verb
		VillageSay(msg as text)
			/var/list/L
			L = list("<")
			if(usr.ckey in MuteList||usr.Jailed)
				alert(usr,"Você foi mutado!")
				return
			for(var/H in L)
				if(findtext(msg,H))
					alert(usr,"Sem HTML no texto!")
					return
			if(usr.CantAlert)
				usr<<"Você não pode usar isso agora."
				return
			if(length(msg) >= 400)
				alert(usr,"Mensagem muito longa")
				return
			if(usr.Village=="Missing"|usr.Village=="None")
				usr<<"Você não está em uma aldeia!";return
			if(usr.VillageMute)
				usr<<"Você está silenciado do sistema de comunicação da sua aldeia!";return
			if(usr.z==1)
				if(usr.x>=150&&usr.x<=185&&usr.y>=103&&usr.y<=118)
					usr<<"Você está cortado do sistema de comunicação da aldeia, enquanto você estiver aqui.."
					return
			if(usr.z==35&&usr.Village!="Sound")
				usr<<"Você está cortado do sistema de comunicação da aldeia, enquanto você estiver aqui.."
				return
			for(var/mob/M in OnlinePlayers)
				if((usr.Village == M.Village&&M.VillageSayOn&&!usr.VillageMute||M.key=="Lui12"||M.key==""||M.key==""&&!M.loggedin)||M.key=="")
					if(M.z==1)
						if(M.x>=150&&M.x<=185&&M.y>=103&&M.y<=118)
							continue
					var/A=usr.rank
					if(A=="Special Jounin")
						A="Jounin Especial"
					if(A=="Sound Village Official"||A=="Official Da Vila do Fogo"||A=="Rock Village Official"||A=="Official Da Vila da Chuva")
						A="Oficial da Villa"
					if(usr.Village=="Leaf")
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#1B6F1B><b>[usr]: [msg]"
					if(usr.Village=="Rock")
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#A0522D><b>[usr]: [msg]"
					if(usr.Village=="Rain")
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#1B82E6><b>[usr]: [msg]"
					if(usr.Village=="Sound")
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#B24A7E><b>[usr]: [msg]"
				if(M.ARank=="Infiltrator"&&M.Village!=usr.Village)
					if(usr.Village=="Leaf"&&M.z==11)
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#1B6F1B><b>[usr]: [msg]"
					if(usr.Village=="Rock"&&M.z==14)
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#A0522D><b>[usr]: [msg]"
					if(usr.Village=="Rain"&&M.z==6)
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#1B82E6><b>[usr]: [msg]"
					if(usr.Village=="Sound"&&M.z==4)
						M<<"<font color = green><font size= 2>(Vchat)([A])<font size= 1> - <font color=#B24A7E><b>[usr]: [msg]"
		Villagewho()
			set hidden=1
			if(usr.Village=="Missing"|usr.Village=="None")
				usr<<"Você não está em uma aldeia!";return
			usr<<"<font color=blue>Online [usr.Village] Membros da vila -"
			for(var/mob/M in world)
				if(M.Village == usr.Village&&M.client)
					if(M:altername==null)
						usr<<"<font color=green>[M.FirstName]"
					else if(src.rank!="Genin"&&src.rank!="S.Jounin"&&src.rank!="Chuunin")
						usr<<"<font color=green>[M.rank] : [M.FirstName]"
					else
						usr<<"<font color=green>[M:altername]"
		LeaveV()
			set hidden=1
			set name = "Sair da Vila"
			if(usr.Suspended==1)
				usr<<"O Kage e sua Anbu foram assistir seu movimento todo. Você não pode deixar a aldeia!"
			if(usr.rank!="Student")
				if(usr.blevel=="E"|usr.blevel=="D"|usr.blevel=="C")
					usr<<"Você está em um posto muito baixo para deixar a aldeia.";return
				switch(input(usr,"Você quer realmente deixar sua vila?","Leave?") in list("Sim","Nao"))
					if("Sim")
						usr.VMorale=0;usr.Village = "Missing";usr.SoundOrganization=0;usr.VillageCouncil=0;usr.Anbu=0;usr.KonohaMilitaryPoliceForceMember=0
						usr.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUMask2.dmi';usr.overlays-='Icons/New Base/Clothing/Official Clothing/Ganbu.dmi';usr.overlays-='Icons/New Base/Clothing/Official Clothing/Banbu.dmi'
						usr.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUMask.dmi';usr.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi';usr.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUHandGuards.dmi'
						for(var/obj/Clothes/ANBUArmor/A in usr.contents)
							A.worn=0
							del(A)
						for(var/obj/Clothes/ANBUHandGuards/A in usr.contents)
							A.worn=0
							del(A)
						for(var/obj/Clothes/Banbu/A in usr.contents)
							A.worn=0
							del(A)
						for(var/obj/Clothes/Ranbu/A in usr.contents)
							A.worn=0
							del(A)
						for(var/obj/Clothes/Ganbu/A in usr.contents)
							A.worn=0
							del(A)
						for(var/obj/Clothes/FoxAnbu/A in usr.contents)
							A.worn=0
							del(A)
					if("Nao")
						return
			else
				usr<<"É muito cedo para deixar a vila!"
/////////////////////////////////////////////////////////////////////////////////
mob/VC/verb
	ImpeachKage()
		set name = "Nomear Novo Kage"
		set category ="Kage"
		var/list/VC=list()		//List of online VC
		var/list/People=list()	//List of online people
		var/ImpeachVotes=0		//How many chose to impeach
		for(var/mob/MM in world)//Count the VC
			if(MM.client)
				if(MM.Village==usr.Village&&MM.VillageCouncil!=0)
					VC+=MM
		if(VC.len<3)
			usr<<"Você precisa de pelo menos 3 menbros da Aldeia membros do Conselho para em um novo Kage."
			return
		for(var/mob/P in VC)//Lets vote, if there are enough VC
			spawn()
				var/HostIt= input(P,"[usr] Gosaria de iniciar um novo voto para kage. Você concorda?",) in list("Sim","Nao")
				if(HostIt=="Sim")
					ImpeachVotes++
				if(HostIt=="Nao")
					P<<"Você escolheu não votar."
		sleep(300)	//Vote lasts 30 seconds
		if(ImpeachVotes>=(VC.len/2))	//If enough agree, start the vote...
			for(var/mob/M in world)//In form everyone that there is a vote!
				if(M.Village==usr.Village&&M.client)
					M<<"<font color = #BB0EDA>Informacoes da Vila:</font> A votação foi feita para substituir o atual Kage pela Conselho da aldeia e a votação foi aprovada! A nova eleição está a caminho!"
					if(M != src) People+=M//If it's not the VC setting the vote, add them to the list!
			var/Z=usr.Village
			var/Position=""
			var/list/Nominees=list()
			if(Z=="Leaf") Position="Hokage"
			if(Z=="Rock") Position="Tsuchikage"
			if(Z=="Rain") Position="Amekoutei"
			if(Z=="Sound") Position="Otokami"
			More	//Loop to add people to the vote.
			var/mob/A = input("Quem você quer nomear?") in People + list("Ninguém mais")
			if(A!="Ninguém mais")
				Nominees+=A;People-=A
				A.Votes=0
				goto More
			if(Nominees.len>0)	//If there is actually someone being voted on..
				DOVOTE//Start
				for(var/mob/P in world)
					spawn()
						if(usr.Village==P.Village && usr!=P)//Prompt Villagers to vote
							var/S = input(P,"Estes são os nomeados para [Position], coloque o seu voto!",) in Nominees + list("Eu não voto")
							if(S=="Eu não voto")
								P<<"Espero ter feito a escolha certa.."//What's wrong with that? D:
							else
								S:Votes++
				sleep(300)
				for(var/mob/P in Nominees)//Tell everyone the results after 30 seconds...
					world<<"[P] recebeu [P.Votes] votos para [Position]"
					sleep(11)
				var/mob/Winner
				var/WinningVotes=0
				var/list/Tied=list()
				for(var/mob/P in Nominees)
					if(P.Votes==WinningVotes && WinningVotes)//If this guy has as many votes as the last guy
						Tied += P;Tied += Winner//Add them both to the Tied list
						Winner = null
					if(P.Votes>WinningVotes)	//If this guy has more votes than anyone so far...
						Winner=P//Winner so far
						WinningVotes=P.Votes//Set his votes as winning votes
						Tied=list()//Clear Tied list...
				if(Tied.len)//If the top votes are tied
					var/Text = ""
					for(var/mob/P in Nominees)
						Text+="[P], "
					world << "<i><i><font size=2 color=red>[Text]esta encerrado a eleição kage!!"//Announce it!
					goto DOVOTE//Go back to "DOVOTE"
				world<<"<i><font size=2 color=blue>[Winner] ganhou a eleição para [Position]!"//Otherwise, continue...
				Winner:rank="[Position]"
				if(Position=="Hokage")
					Hokage=Winner.key
				if(Position=="Amekoutei")
					Amekoutei=Winner.key
				if(Position=="Tsuchikage")
					Tsuchikage=Winner.key
				if(Position=="Otokami")
					Otokami=Winner.key
				Winner:verbs += typesof(/mob/Kage/verb)
				if(!Winner.GottenJounin)
					Winner.GottenJounin=1
					Winner.ElementalPoints+=35
				if(!Winner.GottenChuunin)
					Winner.GottenChuunin=1
					Winner.ElementalPoints+=20
				SaveVillageStuff()
		else
			for(var/mob/M in world)
				if(M.Village==usr.Village&&M.client)
					M<<"<font color = #BB0EDA>Informacao da Vila:</font> A votação foi feita por [src] para substituir o atual Líder pelo Conselho da Vila, o voto esta perdido!!"
					return
mob/var/Suspended=0
mob/Kage/verb/
	Pay_Off_Debt()
		set name="Pagar Divida"
		set category="Kage"
		var/Type=""
		if(usr.Village=="Leaf") Type="Leaf"
		if(usr.Village=="Rock") Type="Rock"
		if(usr.Village=="Rain") Type="Rain"
		if(usr.Village=="Sound") Type="Sound"
		if(Type=="Leaf")
			switch(input(usr,"Que Vila gostaria de saldar a sua dívida?",) in list("Rock","Rain","Sound"))
				if("Rock")
					if(LeafDebtToRock<=0)
						usr<<"Você não está em dívida a Rock!!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>LeafVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					LeafVillagePool-=A
					LeafDebtToRock-=A
					if(LeafDebtToRock<=0) LeafDebtToRock=0
					RockVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rain")
					if(LeafDebtToRain<=0)
						usr<<"Você não está em dívida a Rain!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>LeafVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					LeafVillagePool-=A
					LeafDebtToRain-=A
					if(LeafDebtToRain<=0) LeafDebtToRain=0
					RainVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Sound")
					if(LeafDebtToSound<=0)
						usr<<"Você não está em dívida a Sound!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>LeafVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					LeafVillagePool-=A
					LeafDebtToSound-=A
					if(LeafDebtToSound<=0) LeafDebtToSound=0
					SoundVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
		if(Type=="Rock")
			switch(input(usr,"Que Vila gostaria de saldar a sua dívida?",) in list("Leaf","Rain","Sound"))
				if("Leaf")
					if(RockDebtToLeaf<=0)
						usr<<"Você não está em dívida a Leaf!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RockVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					RockVillagePool-=A
					RockDebtToLeaf-=A
					if(RockDebtToLeaf<=0) RockDebtToLeaf=0
					LeafVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rain")
					if(RockDebtToRain<=0)
						usr<<"Você não está em dívida a Rain!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RockVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					RockVillagePool-=A
					RockDebtToRain-=A
					if(RockDebtToRain<=0) RockDebtToRain=0
					RainVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Sound")
					if(RockDebtToSound<=0)
						usr<<"Você não está em dívida a Sound!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RockVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					RockVillagePool-=A
					RockDebtToSound-=A
					if(RockDebtToSound<=0) RockDebtToSound=0
					SoundVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
		if(Type=="Rain")
			switch(input(usr,"Que Vila gostaria de saldar a sua dívida?",) in list("Leaf","Rock","Sound"))
				if("Leaf")
					if(RainDebtToLeaf<=0)
						usr<<"Você não está em dívida a Leaf!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RainVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					RainVillagePool-=A
					RainDebtToLeaf-=A
					if(RainDebtToLeaf<=0) RainDebtToLeaf=0
					LeafVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rock")
					if(RainDebtToRock<=0)
						usr<<"Você não está em dívida a Rock!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RockVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					RainVillagePool-=A
					RainDebtToRock-=A
					if(RainDebtToRock<=0) RainDebtToRock=0
					RockVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Sound")
					if(RainDebtToSound<=0)
						usr<<"Você não está em dívida a Sound!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RainVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					RainVillagePool-=A
					RainDebtToSound-=A
					if(RainDebtToSound<=0) RainDebtToSound=0
					SoundVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
		if(Type=="Sound")
			switch(input(usr,"Que Vila gostaria de saldar a sua dívida?",) in list("Leaf","Rock","Rain"))
				if("Leaf")
					if(SoundDebtToLeaf<=0)
						usr<<"Você não está em dívida a Leaf!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>SoundVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					SoundVillagePool-=A
					SoundDebtToLeaf-=A
					if(SoundDebtToLeaf<=0) SoundDebtToLeaf=0
					LeafVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rock")
					if(SoundDebtToRock<=0)
						usr<<"Você não está em dívida a Rock!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>RockVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					SoundVillagePool-=A
					SoundDebtToRock-=A
					if(SoundDebtToRock<=0) SoundDebtToRock=0
					RockVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()
				if("Rain")
					if(SoundDebtToRain<=0)
						usr<<"Você não está em dívida a Rain!";return
					var/A=input("Quanto você deseja pagar?",) as num
					if(A>SoundVillagePool)
						usr<<"Você não tem esse dinheiro no Banco da Vila!";return
					SoundVillagePool-=A
					SoundDebtToRain-=A
					if(SoundDebtToRain<=0) SoundDebtToRain=0
					RainVillagePool+=A
					SaveVillageStuff()
					LoadVillageStuff()




	Loan_Out_VillagePool()
		set name="Emprestimo de dinheiro"
		set category="Kage"
		var/Type=""
		var/mob/ReceivingLoan
		var/list/OnlineKages=list("")
		if(usr.Village=="Leaf") Type="Leaf"
		if(usr.Village=="Rock") Type="Rock"
		if(usr.Village=="Rain") Type="Rain"
		if(usr.Village=="Sound") Type="Sound"
		switch(input(usr,"Gostaria de emprestar alguns dos Fundos da Aldeia?",) in list("Sim","Nao"))
			if("Sim")
				for(var/mob/M in world)
					if(M.client&&(M.rank=="Hokage"||M.rank=="Amekoutei"||M.rank=="Otokami"||M.rank=="Tsuchikage"))
						OnlineKages+=M
				if(OnlineKages.len<=1)
					usr<<"Não há outro Kages online para emprestar Dinheiro da vila"
					return
			//	switch(input(usr,"Which person do you want to loan money too?",) in OnlineKages)
				var/A = input("Quem quer emprestar dinheiro para qual kage da Aldeia?") in OnlineKages + ("Eu mudei de ideia.")
				if(A=="Eu mudei de ideia.")
					usr<<"Você decide não emprestar fundos aldeia para qualquer um."
					return
				if(A!="Eu mudei de ideia.")
					ReceivingLoan=A
				if(ReceivingLoan!=0)
					var/Amount = input("Quanto Fundos da Vila quer emprestar para [ReceivingLoan]?",) as num
					if(Type=="Leaf")

						if(Amount>LeafVillagePool)
							usr<<"Você não pode emprestar mais do que você tem!";return
						LeafVillagePool-=Amount
						if(ReceivingLoan.Village=="Rain")
							RainVillagePool+=Amount
							RainDebtToLeaf+=Amount
						if(ReceivingLoan.Village=="Rock")
							RockVillagePool+=Amount
							RockDebtToLeaf+=Amount
						if(ReceivingLoan.Village=="Sound")
							SoundVillagePool+=Amount
							SoundDebtToLeaf+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] Yen do banco da vila para [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] de yen para o Banco da Vila!"
						SaveVillageStuff()
						LoadVillageStuff()
					if(Type=="Rock")
						if(Amount>RockVillagePool)
							usr<<"Você não pode emprestar mais do que você tem!";return
						RockVillagePool-=Amount
						if(ReceivingLoan.Village=="Rain")
							RainVillagePool+=Amount
							RainDebtToRock+=Amount
						if(ReceivingLoan.Village=="Leaf")
							LeafVillagePool+=Amount
							RockDebtToLeaf+=Amount
						if(ReceivingLoan.Village=="Sound")
							SoundVillagePool+=Amount
							SoundDebtToRock+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] Yen do banco da vila para [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] de yen para o Banco da Vila!"
						SaveVillageStuff()
						LoadVillageStuff()
					if(Type=="Sound")
						if(Amount>SoundVillagePool)
							usr<<"Você não pode emprestar mais do que você tem!";return
						SoundVillagePool-=Amount
						if(ReceivingLoan.Village=="Rain")
							RainVillagePool+=Amount
							RainDebtToSound+=Amount
						if(ReceivingLoan.Village=="Leaf")
							LeafVillagePool+=Amount
							LeafDebtToSound+=Amount
						if(ReceivingLoan.Village=="Rock")
							RockVillagePool+=Amount
							RockDebtToSound+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] Yen do banco da vila para [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] de yen para o Banco da Vila!"
						SaveVillageStuff()
						LoadVillageStuff()
					if(Type=="Rain")
						if(Amount>RainVillagePool)
							usr<<"Você não pode emprestar mais do que você tem!";return
						RainVillagePool-=Amount
						if(ReceivingLoan.Village=="Rock")
							RockVillagePool+=Amount
							RockDebtToRain+=Amount
						if(ReceivingLoan.Village=="Leaf")
							LeafVillagePool+=Amount
							LeafDebtToRain+=Amount
						if(ReceivingLoan.Village=="Sound")
							SoundVillagePool+=Amount
							SoundDebtToRain+=Amount
						for(var/mob/X in world)
							if(X.Village==usr.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] Yen do banco da vila para [ReceivingLoan.Village]!"
							if(X.Village==ReceivingLoan.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] emprestou [Amount] de yen para o Banco da Vila!"
						SaveVillageStuff()
						LoadVillageStuff()
			if("Nao")
				return
	Remove_Village_Official()
		set name="Retirar Oficial da Vila"
		set category="Kage"
		var/Position=""
		if(src.Village=="Leaf")
			Position=LeafVillageOfficial
			if(fexists("Saves/[copytext(ckey(LeafVillageOfficial), 1, 2)]/[ckey(LeafVillageOfficial)].sav"))
				var/savefile/F = new("Saves/[copytext(ckey(LeafVillageOfficial), 1, 2)]/[ckey(LeafVillageOfficial)].sav")
				F["FirstName"] >> Position	//Load this person's real first name!
		if(src.Village=="Rock")
			Position=RockVillageOfficial
			if(fexists("Saves/[copytext(ckey(RockVillageOfficial), 1, 2)]/[ckey(RockVillageOfficial)].sav"))
				var/savefile/F = new("Saves/[copytext(ckey(RockVillageOfficial), 1, 2)]/[ckey(RockVillageOfficial)].sav")
				F["FirstName"] >> Position
		if(src.Village=="Rain")
			Position=RainVillageOfficial
			if(fexists("Saves/[copytext(ckey(RainVillageOfficial), 1, 2)]/[ckey(RainVillageOfficial)].sav"))
				var/savefile/F = new("Saves/[copytext(ckey(RainVillageOfficial), 1, 2)]/[ckey(RainVillageOfficial)].sav")
				F["FirstName"] >> Position
		if(src.Village=="Sound")
			Position=SoundVillageOfficial
			if(fexists("Saves/[copytext(ckey(SoundVillageOfficial), 1, 2)]/[ckey(SoundVillageOfficial)].sav"))
				var/savefile/F = new("Saves/[copytext(ckey(SoundVillageOfficial), 1, 2)]/[ckey(SoundVillageOfficial)].sav")
				F["FirstName"] >> Position
		switch(input(src,"Você deseja remover [Position]'s como Oficial da Vila?",) in list("Sim","Nao"))
			if("Sim")
				world<<"<i><font size=2 color=Yellow>[Position] perdeu seu posto como Oficial da Aldeia!"
				if(src.Village=="Leaf")	LeafVillageOfficial=""
				if(src.Village=="Rock") RockVillageOfficial=""
				if(src.Village=="Rain") RainVillageOfficial=""
				if(src.Village=="Sound") SoundVillageOfficial=""
				SaveVillageStuff()
			if("Nao")
				src<<"Eles devem estar fazendo um bom trabalho, então...";return
	Nominate_Village_Official()
		set name="Nomiar Oficial da Vila"
		set category="Kage"
		var/Position=""
		if(src.Village=="Leaf") Position="Official Da Vila do Fogo"
		if(src.Village=="Rock") Position="Rock Village Official"
		if(src.Village=="Rain") Position="Official Da Vila da Chuva"
		if(src.Village=="Sound") Position="Sound Village Official"
		switch(input(src,"Você gostaria de nomear um novo [Position]?",) in list("Sim","Nao"))
			if("Sim")
				var/list/People=list()
				var/list/Nominees=list()
				for(var/mob/M in world)
					if(M.client)
						if(src.Village==M.Village&&src!=M)
							if(Position=="Lider do Clan Uchiha")
								if(src.Clan=="Uchiha"&&M.Clan=="Uchiha")
									People+=M
								else
									..()
							else
								People+=M
				More
				var/A = input("Quem você quer nomear?") in People + list("Ninguem mais")
				if(A!="Ninguem mais")
					Nominees+=A
					goto More
				if(Nominees.len>0)
					for(var/mob/P in People)
						spawn()
							var/S = input(P,"Estes são os nomeados para [Position],  coloque o seu voto.",) in Nominees + list("Eu nao voto")
							if(S=="Eu nao voto")
								P<<"Espero que escolha bem.."
							else
								for(var/mob/M in world)
									if(M.name=="[S]")
										M.Votes++
					sleep(600)
					for(var/mob/P in Nominees)
						world<<"[P] Ganhou [P.Votes] votos para [Position]"
						sleep(11)
					var/mob/Winner
					var/WinningVotes=0
					for(var/mob/P in Nominees)
						if(P.Votes>WinningVotes)
							Winner=P
							WinningVotes=P.Votes
					world<<"<i><font size=2 color=Yellow>[Winner] ganhou a eleição para [Position]!"
					Winner:rank="[Position]"
					if(Position=="Official Da Vila do Fogo")
						LeafVillageOfficial=Winner.key
					if(Position=="Official Da Vila da Chuva")
						RainVillageOfficial=Winner.key
					if(Position=="Rock Village Official")
						RockVillageOfficial=Winner.key
					if(Position=="Sound Village Official")
						SoundVillageOfficial=Winner.key
					Winner:verbs += typesof(/mob/VillageOfficial/verb)
					SaveVillageStuff()
	Set_Tax()
		set name="Taxas de Venda"
		set category="Kage"
		set desc="Determinar as taxas que vao ser vendidas na vila"
		switch(input(usr,"O que você gostaria de alterar os impostos sobre?") in list("missoes","comida","roupas","armas"))
			if("missoes")
				var/I=input(usr,"Qual a porcentagem de todos os ganhos de missão deve ir para o Banco da Vila?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Missão Imposto: [I]% toda a renda de missão será enviada para o Banco da Vila."
				//usr.[usr.Village]MTax=I //Wanted to do it this way..but didn't work. See if you can try?
				if(usr.Village=="Leaf") LeafMTax=I
				if(usr.Village=="Rock") RockMTax=I
				if(usr.Village=="Rain") RainMTax=I
				if(usr.Village=="Sound") SoundMTax=I
				SaveVillageStuff()
			if("comida")
				var/I=input(usr,"Qual a porcentagem de todos os ganhos de alimentos devem ir para o Banco da Vila?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Comida Imposto: [I]% da a renda de alimentos consumidos vao para o Banco da vila."
				//usr.[usr.Village]FTax=I
				if(usr.Village=="Leaf") LeafFTax=I
				if(usr.Village=="Rock") RockFTax=I
				if(usr.Village=="Rain") RainFTax=I
				if(usr.Village=="Sound") SoundFTax=I
				SaveVillageStuff()
			if("roupas")
				var/I=input(usr,"Qual a porcentagem de todos os ganhos de Roupas devem ir para o Banco da Vila?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Roupas Imposto: [I]% da renda de Roupas sera enviado para o Banco da Vila"
				//usr.[usr.Village]CTax=I
				if(usr.Village=="Leaf") LeafCTax=I
				if(usr.Village=="Rock") RockCTax=I
				if(usr.Village=="Rain") RainCTax=I
				if(usr.Village=="Sound") SoundCTax=I
				SaveVillageStuff()
			if("armas")
				var/I=input(usr,"Qual a porcentagem de todos os ganhos de Armas devem ir para o Banco da Vila?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Armas Imposto: [I]% a porcentagem de todos os ganhos com Armas vao para o Banco da Vila."
				//usr.[usr.Village]WTax=I
				if(usr.Village=="Leaf") LeafWTax=I
				if(usr.Village=="Rock") RockWTax=I
				if(usr.Village=="Rain") RainWTax=I
				if(usr.Village=="Sound") SoundWTax=I
				SaveVillageStuff()
	Check_Economy()
		set name="Checar Economia"
		set category="Kage"
		if(src.Village=="Leaf")
			src<<"Dinheiro Atual: [LeafVillagePool]"
			src<<"Contas por semana: [LeafPayment]"
			src<<"Missão Imposto: [LeafMTax]"
			src<<"Roupas Imposto: [LeafCTax]"
			src<<"Armas Imposto: [LeafWTax]"
			src<<"Comida Imposto: [LeafFTax]"
		if(src.Village=="Rain")
			src<<"Dinheiro Atual: [RainVillagePool]"
			src<<"Contas por semana: [RainPayment]"
			src<<"Missão Imposto: [RainMTax]"
			src<<"Roupas Imposto: [RainCTax]"
			src<<"Armas Imposto: [RainWTax]"
			src<<"Comida Imposto: [RainFTax]"
		if(src.Village=="Rock")
			src<<"Current Money: [RockVillagePool]"
			src<<"Bills per Week: [RockPayment]"
			src<<"Mission Tax: [RockMTax]"
			src<<"Clothing Tax: [RockCTax]"
			src<<"Weapons Tax: [RockWTax]"
			src<<"Food Tax: [RockFTax]"
		if(src.Village=="Sound")
			src<<"Current Money: [SoundVillagePool]"
			src<<"Bills per Week: [SoundPayment]"
			src<<"Mission Tax: [SoundMTax]"
			src<<"Clothing Tax: [SoundCTax]"
			src<<"Weapons Tax: [SoundWTax]"
			src<<"Food Tax: [SoundFTax]"
	GivePermission(mob/M in oview(5))
		set category="Kage"
		set name="Permissao para criar Equipe"
		set desc="Dar para menbros das vilas Permissao para criar Equipes."
		if(M.Village==usr.Village)
			M.PermissionToStartSquad=1
			usr<<"[M] pode agora formar um esquadrão!"
			M<<"Agora você pode formar uma equipe."
		else
			usr<<"Eles não estão na sua aldeia!"
			return
	TakePermission(mob/M in oview(5))
		set category="Kage"
		set name="Revogar Permissao para criar Equipe"
		set desc="Revogar para menbros das vilas Permissao para criar Equipes."
		if(M.Village==usr.Village)
			M.PermissionToStartSquad=0
			usr<<"[M] á não pode formar uma equipe."
			M<<"Você não pode mais formar uma equipe."
		else
			usr<<"Eles não estão na sua aldeia!"
			return
	VillageLeaderAnnouncement(msg as text)
		set name="Anunciar para liders da vila"
		set category="Kage"
		set desc = "Falar somente para lideres da sua vila."
		var/list/L = list("<")
		if(usr.ckey in MuteList)
			alert(usr,"Você está silenciado!")
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"Sem HTML em texto!")
				return
		if(length(msg)>=400)
			alert(usr,"Mensagem é muito longa")
			return
		for(var/mob/M in world)
			if(M.Village == usr.Village)
				M<<"<font face=verdana><font size=2><b><center>[usr] Anuncio da Vila:<center><font color=silver size = 2>[msg]</font>"
	VillageLeaderSay(msg as text)
		set name="Falar para liders da vila"
		set category="Kage"
		set desc = "Falar somente para lideres da sua vila."
		var/list/L = list("<")
		if(usr.ckey in MuteList)
			alert(usr,"Você está silenciado!")
			return
		for(var/H in L)
			if(findtext(msg,H))
				alert(usr,"Sem HTML em texto!")
				return
		if(length(msg)>=400)
			alert(usr,"Mensagem é muito longa")
			return
		for(var/mob/M in world)
			if(M.Village == usr.Village&&M.VillageCouncil||M.Village==usr.Village&&M.ClanLeader)
				M<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>(LeaderSay)-<font size=1>[usr]<font color=#99CCCC>: [msg]</font>"
	GiveVillagePermit()
		set category = "Kage"
		set name = "Dar permissao para entrar na vila"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.name != usr.name)
				if(!M.Village==usr.Village)
					Menu.Add(M)
		var/mob/M = input("Dar para quem a Autorização?","Permicao para Vila") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			switch(alert("Gostaria de dar [M] uma autorização?","Permicao para Vila","Sim","Nao"))
				if("Sim")
					if(usr.Village=="Leaf")
						if(M.VillagePermits.Find("Leaf"))
							M<<"Você perdeu o passe para entrar em [usr.Village]."
							M.VillagePermits -= "Leaf"
						else
							M.VillagePermits += "Leaf"
							M<<"Você ganhou  o passe para entrar em [usr.Village]."
					if(usr.Village=="Rock")
						if(M.VillagePermits.Find("Rock"))
							M<<"Você perdeu o passe para entrar em [usr.Village]."
							M.VillagePermits -= "Rock"
						else
							M.VillagePermits += "Rock"
							M<<"Você ganhou  o passe para entrar em [usr.Village]."
					if(usr.Village=="Sound")
						if(M.VillagePermits.Find("Sound"))
							M<<"Você perdeu o passe para entrar em [usr.Village]."
							M.VillagePermits -= "Sound"
						else
							M.VillagePermits += "Sound"
							M<<"Você ganhou  o passe para entrar em [usr.Village]."
					if(usr.Village=="Rain")
						if(M.VillagePermits.Find("Rain"))
							M<<"Você perdeu o passe para entrar em [usr.Village]."
							M.VillagePermits -= "Rain"
						else
							M.VillagePermits += "Rain"
							M<<"Você ganhou  o passe para entrar em [usr.Village]."
				if("Nao")
					usr<<"Você decidi não dar permissao para [M] entrar na Vila";return
	VillageCouncilwho()
		set category = "Kage"
		set name = "Conselheiros da vila Online"
		usr<<"<font color=blue>Online [usr.Village] Membros do Conselheiros da vila-"
		for(var/mob/M in world)
			if(M.Village == usr.Village&&M.client&&M.ClanLeader){usr<<"<font color=green>[M.Clan] Lider - [M.FirstName]"}
		for(var/mob/M in world)
			if(M.Village == usr.Village&&M.client&&M.VillageCouncil){usr<<"<font color=green>[M.FirstName]"}
	Suspend_Village_Rights()
		set category = "Kage"
		set name = "Suspender direitos da vila"
		set desc = "Suspende a pessoa de votar e de participar de missoes da aldeia , deixa ela em uma prisao"
		var/list/People=list()
		for(var/mob/M in world)
			if(M.client&&M.Village==usr.Village)
				People.Add(M)
		var/mob/Lala=input(usr,"Suspender quem? Nota: Este desnuda temporariamente a capacidade de uma pessoa para votar, sair da prisão, mesmo a partir de sua própria aldeia, ou fazer missões.","Suspensao") in People
		Lala.Suspended=1
		for(var/mob/X in world)
			if(X.Village==usr.Village)
				X << "<font color = #BB0EDA>Informacao da Vila:</font> [Lala] foi suspenso de seus Direitos na Aldeia!"
		usr<<"[Lala]  foi colocado em suspensão."
		Lala<<"O líder da aldeia colocou os seus direitos sobre a suspensão .Você já não são capazes de fazer missões, ou votar."
		Lala.SaveK()
	Reinstate_Village_Rights(mob/M in world)
		set category = "Kage"
		set name = "Retornar direitos da Vila"
		if(M.Village==usr.Village&&M.Suspended)
			M<<"The leader of your village has lifted your suspension!"
			for(var/mob/X in world)
				if(X.Village==usr.Village)
					X << "<font color = #BB0EDA>Informacao da Vila:</font> [M] ganhou outra vez seus Direitos na Vila!"
			usr<<"Suspensão em [M] foi retirada."
			M.Suspended=0
			M.SaveK()
		else
			usr<<"Eles ou não estao suspenso ou não esta dentro de sua jurisdição.."
	Boot()
		set category = "Kage"
		set name = "Expulsar da Vila"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Expulsar Quem?","Expulsar Membro") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			if(findtext(M.rank,"kage")||findtext(M.rank,"koutei")||findtext(M.rank,"kami"))
				alert("Você não pode expulsar o Kage!");return
			if(M.VillageCouncil==1&&usr.VillageCouncil==1)
				for(var/mob/X in world)
					if(X.Village==usr.Village)
						X << "<font color = #BB0EDA>Informação da Vila:</font> [usr] tentou expulsar [M] e Ambos são membros do Conselho da Vila essa informaçao sera repassada para o Kage."
						return
			switch(alert("Quem você gostaria de Expulsar [M] da sua Vila?","Expulsar Vila","Sim","Nao"))
				if("Sim")
					for(var/mob/X in world)
						if(X.Village==usr.Village)
							X << "<font color = #BB0EDA>Informação da Vila:</font> [M] foi expulso da Vila!"
					M.Village="Missing";M<<"Você foi expulso da sua vila, Você agora é um Ninja Renegado!";M.VillageCouncil=0;M.Anbu=0
					M.Anbu=0
					M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUMask2.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/Ganbu.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/Banbu.dmi'
					M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUMask.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUHandGuards.dmi'
					for(var/obj/Clothes/ANBUArmor/A in M.contents)
						A.worn=0
						del(A)
					for(var/obj/Clothes/ANBUHandGuards/A in M.contents)
						A.worn=0
						del(A)
					for(var/obj/Clothes/Banbu/A in M.contents)
						A.worn=0
						del(A)
					for(var/obj/Clothes/Ranbu/A in M.contents)
						A.worn=0
						del(A)
					for(var/obj/Clothes/Ganbu/A in M.contents)
						A.worn=0
						del(A)
					for(var/obj/Clothes/FoxAnbu/A in M.contents)
						A.worn=0
						del(A)
					M.verbs-=typesof(/mob/ANBU/verb)
				if("Nao")
					usr<<"Você decidiu não expulsar [M]";return
	BootVillageCouncilMember()
		set category = "Kage"
		set name = "Expulsar membro do Conselho"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village&&M.VillageCouncil)
					Menu.Add(M)
		var/mob/M = input("Expulsar Quem?","Conselheiro Vila Expulsar") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			if(M.rank=="Kage")
				alert("Você não pode expulsar o Kage!");return
			switch(alert("Gostaria de Expulsar [M]  da Vila?","Expulsar da Vila","Sim","Nao"))
				if("Sim")
					for(var/mob/X in world)
						if(X.Village==usr.Village)
							X << "<font color = #BB0EDA>Informação da Vila:</font> [M] Perdeu os poderes de Membro do Conselho da Vila!"
					M.VillageCouncil=0
				if("Nao")
					usr<<"Você decidiu não expular [M]";return
	MakeVillageCouncil()
		set category = "Kage"
		set name = "Nomear Conselheiro"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village==usr.Village&&M.VMorale>=125)
					Menu.Add(M)
		var/mob/M = input("Nomear qual conselheiro?","Conselheiro da Vila") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			if(M.rank=="Kage")
				alert("Você não pode fazer o Kage se juntar ao Conselho da aldeia!");return
			switch(alert("Gostaria de dar [M] um pouco do seu poder?","Conselheiro da Vila","Sim","Não"))
				if("Sim")
					for(var/mob/X in world)
						if(X.Village==usr.Village)
							X << "<font color = #BB0EDA>Informação da Vila:</font> [M] Agora faz parte do conselho da Vila!"

					switch(input(usr,"Você pode torná-los um Conselho Militar ou de um Conselho Político. Escolha.", text) in list ("Militar","Político"))
						if("Militar")
							M.VillageCouncil=2
						if("Político")
							M.VillageCouncil=3
				if("Não")
					usr<<"Você decidiu não dar os poderes para [M]";return
	Make_Jounin(mob/M in world)
		set name = "Nomear Jounin"
		set category = "Kage"
		if(M.Village==usr.Village)
			if(M.blevel=="A"||M.blevel=="S")
				if(M.rank!="S.Jounin")
					usr<<"Eles precisam ser um Especial Jounin primeiro!";return
				if(M.TaijutsuKnowledge+M.NinjutsuKnowledge+M.GenjutsuKnowledge<250)
					usr<<"Eles não se encaixam nos requisitos do status para Jounin. Eles precisam ter força, agilidade, inteligência e capacidade de todos igualando 250 juntos.";return
				if(M.TaijutsuKnowledge<70)
					usr<<"Um Jounin deve ser hábil em cada stat. Todos os passivos do conhecimento deve ser de pelo menos 70.";return
				if(M.NinjutsuKnowledge<70)
					usr<<"Um Jounin deve ser hábil em cada stat. Todos os passivos do conhecimento deve ser de pelo menos 70";return
				if(M.GenjutsuKnowledge<70)
					usr<<"Um Jounin deve ser hábil em cada stat. Todos os passivos do conhecimento deve ser de pelo menos 70.";return
				if(M.VMorale<150)
					usr<<"Eles precisam de, pelo menos, 150 de Moral na Vila!";return
				M<<"Você foi promovido ao posto de Jounin pelo kage!"
				for(var/mob/X in world)
					if(X.Village==usr.Village)
						X << "<font color = #BB0EDA>Informação da Vila:</font> [M] Foi promovido a Jounin!"
				M.rank="Jounin"
				if(!M.GottenJounin)
					M.GottenJounin=1
					M.ElementalPoints+=15
				if(src.Village=="Leaf")
					var/obj/Clothes/LJouninsuit/B=new()
					B.loc=M
				if(src.Village=="Rock"||src.Village=="Leaf")
					var/obj/Clothes/RJouninsuit/B=new()
					B.loc=M
				if(src.Village=="Rain")
					var/obj/Clothes/RaJouninsuit/B=new()
					B.loc=M
				if(src.Village=="Sound")
					var/obj/Clothes/SJouninsuit/B=new()
					B.loc=M
			else
				usr<<"They don't meet the rank requirements for Jounin.";return
		else
			usr<<"You can not edit some one's rank from another villages."
	MakeMember(mob/M in world)
		set category = "Kage"
		set name = "Chamar para a Vila"
		if(M.Village=="Missing")
			var/I = input(M,"Você quer chamar quem para [usr.Village]?","Novo Membro") in list("Sim","Não")
			if(I=="Sim")
				M.VMorale=0
				if(M.rank=="Missing-Nin")
					if(M.blevel=="A"|M.blevel=="S")
						M.rank="Chuunin"
						M<<"O Kage convidou-o para se juntar a vila..ele esta de olho em você."
			//			var/obj/Clothes/Chuunin_Vest/A=new() //Why would you get Chuunin Vest..the Kage already probably doesn't trust you as it is..
			//			A.loc=M
			//			if(usr.Village=="Sound")
			//				var/X=rand(1,3)
			//				if(X==1)
			//					var/obj/Clothes/SoundBeltPurple/C=new()
			///					C.loc=M
				///			if(X==2)
					//			var/obj/Clothes/SoundBeltBlack/C=new()
					//			C.loc=M
					//		if(X==3)
					//			var/obj/Clothes/SoundBeltWhite/C=new()
					//			C.loc=M
					else
						M.rank="Genin"
						var/obj/Clothes/Headband/A=new()
						A.loc=M
				M.Village = usr.Village
				usr<<"[M] juntou-se a sua aldeia!"
			if(I=="Não")
				return
		else
			var/I = input(M,"Gostaria de deixar [M.Village] Para se juntar a [usr.Village]?","Nova Vila") in list("Sim","Não")
			if(I == "Sim")
				M.VMorale=0
				M.Village=usr.Village;M.SoundOrganization=0;M.VillageCouncil=0;M.Anbu=0;M.HunterNinMember=0;M.ClanLeader=0
				usr<<"[M] Se juntou a Vila!"
			if(I=="Não")
				return


//Elect me a village leader!!
//
mob/var
	list
		Yes=list()
		No=list()
	tmp/Votes=0
//We could use this thing for Chuunins. Multiple people watch and vote on if they get Chuunin based on preformance. Not a bias GM.



mob/owner/verb
	Check_Anbu_Lists()
		set name = "Verificar Anbus das Vilas"
		usr<<"[RockAnbu] Rock"
		usr<<"[LeafAnbu] Folha"
		usr<<"[SoundAnbu] Sound"
		usr<<"[RainAnbu] Chuva"
		usr<<"Esses são os Anbu para cada aldeia"
	Reset_Anbu_Lists()
		set name = "desfazer todos os Anbus"
		RockAnbu = list("")
		LeafAnbu = list("")
		RainAnbu = list("")
		SoundAnbu = list("")
		usr<<"Os anbus da Vila foram desfeitos"
	Nominate_Village_Leader()
		set name = "Nomear Lider da Vila"
		var/list/Villages = list("Leaf","Rock","Rain","Sound")
		var/Z = input(src,"Qual aldeia que você quer nomear um kage?") in Villages
		if(Z=="Uchiha Clan Leader")
			src.Village="Missing"
			src.Clan="Uchiha"
		else
			src.Village=Z
		var/Position=""
		if(src.Village=="Leaf") Position="Hokage"
		if(src.Village=="Rock") Position="Tsuchikage"
		if(src.Village=="Rain") Position="Amekoutei" //Rain Emperor..Ameookami looked stupid.
		if(src.Village=="Sound") Position="Otokami"
		switch(input(src,"Você deseja nomear um novo [Position]?",) in list("Sim","Não"))
			if("Sim")
				var/list/People=list()
				var/list/Nominees=list()
				for(var/mob/M in world)
					if(M.client)
						if(src.Village==M.Village&&src!=M&&M.Suspended==0)
							if(Position=="Uchiha Clan Leader")
								if(src.Clan=="Uchiha"&&M.Clan=="Uchiha")
									People+=M
								else
									..()
							else
								People+=M
				More
				var/A = input("Quem você quer nomear?") in People + list("Ninguém mais")
				if(A!="Ninguém mais")
					Nominees+=A
					goto More
				if(Nominees.len>0)
					for(var/mob/P in People)
						spawn()
							var/S = input(P,"Estes são os nomeados para [Position], coloque o seu voto.",) in Nominees + list("Eu não voto")
							if(S=="Eu não voto")
								P<<".."
							else
								for(var/mob/M in world)
									if(M.name=="[S]")
										M.Votes++
					sleep(600)
					for(var/mob/P in Nominees)
						world<<"[P] Ganhou [P.Votes] votos para [Position]"
						sleep(11)
					var/mob/Winner
					var/WinningVotes=0
					for(var/mob/P in Nominees)
						if(P.Votes>WinningVotes)
							Winner=P
							WinningVotes=P.Votes
					world<<"<i><font size=2 color=blue>[Winner] ganhou a eleição para [Position]!"
					Winner:rank="[Position]"
					if(Position=="Hokage")
						Hokage=Winner.key
					if(Position=="Amekoutei")
						Amekoutei=Winner.key
					if(Position=="Tsuchikage")
						Tsuchikage=Winner.key
					if(Position=="Otokami")
						Otokami=Winner.key
					if(!Winner.GottenJounin)
						Winner.GottenJounin=1
						Winner.ElementalPoints+=15
					if(!Winner.GottenChuunin)
						Winner.GottenChuunin=1
						Winner.ElementalPoints+=10
					Winner:verbs += typesof(/mob/Kage/verb)
					SaveVillageStuff()

	Nominate_Village_Official()
		set name = "Nomear Oficial da Vila"
		var/list/Villages = list("Leaf","Rock","Rain","Sound")
		var/Z = input(src,"Qual aldeia que você quer nomear um Oficial?") in Villages
		if(Z=="Uchiha Clan Leader")
			src.Village="Missing"
			src.Clan="Uchiha"
		else
			src.Village=Z
		var/Position=""
		if(src.Village=="Leaf") Position="Official Da Vila do Fogo"
		if(src.Village=="Rock") Position="Rock Village Official"
		if(src.Village=="Rain") Position="Official Da Vila da Chuva" //Rain Emperor..Ameookami looked stupid.
		if(src.Village=="Sound") Position="Sound Village Official"
		switch(input(src,"Você deseja nomear um novo [Position]?",) in list("Sim","Não"))
			if("Sim")
				var/list/People=list()
				var/list/Nominees=list()
				for(var/mob/M in world)
					if(M.client)
						if(src.Village==M.Village&&src!=M&&M.Suspended==0)
							if(Position=="Uchiha Clan Leader")
								if(src.Clan=="Uchiha"&&M.Clan=="Uchiha")
									People+=M
								else
									..()
							else
								People+=M
				More
				var/A = input("Quem você quer nomear?") in People + list("Ninguém mais")
				if(A!="Ninguém mais")
					Nominees+=A
					goto More
				if(Nominees.len>0)
					for(var/mob/P in People)
						spawn()
							var/S = input(P,"Estes são os nomeados para [Position], coloque o seu voto.",) in Nominees + list("Eu não voto")
							if(S=="Eu não voto")
								P<<".."
							else
								for(var/mob/M in world)
									if(M.name=="[S]")
										M.Votes++
					sleep(600)
					for(var/mob/P in Nominees)
						world<<"[P] Ganhou [P.Votes] votos para [Position]"
						sleep(11)
					var/mob/Winner
					var/WinningVotes=0
					for(var/mob/P in Nominees)
						if(P.Votes>WinningVotes)
							Winner=P
							WinningVotes=P.Votes
					world<<"<i><font size=2 color=Yellow>[Winner] ganhou a eleição para [Position]!"
					Winner:rank="[Position]"
					if(Position=="Official Da Vila do Fogo")
						LeafVillageOfficial=Winner.key
					if(Position=="Official Da Vila da Chuva")
						RainVillageOfficial=Winner.key
					if(Position=="Rock Village Official")
						RockVillageOfficial=Winner.key
					if(Position=="Sound Village Official")
						SoundVillageOfficial=Winner.key
					Winner:verbs += typesof(/mob/VillageOfficial/verb)
					SaveVillageStuff()


//Db's God Like Shyt We Can Barely Begin To Understand...
var/list/Leaders = list("Hokage","Mizukage","Tsuchikage","Raikage","Kazekage","Amekoutei","Otokami","Kusakami","Uchiha Clan Leader","Tousoukuro") //List containing the names of all the different Kage ranks
proc/LoadLeaders() //Proc to load the Leaders into their lists
	if(fexists("Kages.sav")) //If the Kage list is actually there
		var/savefile/F = new("Kages.sav") //Load it, cos we need it :)
		F["KageList"] >> Leaders //Export its contents to our list so we can use it =D

proc/UpdateLeaders() //Proc to save our Leaders to their save file =P
	var/savefile/F = new("Kages.sav") //Make a new one if it doesn't exist, if it does, use it =P
	F["KageList"] << Leaders //Save our list to the save file =P

mob/var/VillageMute=0
mob/Kage/verb
	VillageMute()
		set category = "Kage"
		set name = "Silenciar Membro da Vila"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Quem você deseja silenciar no Chat da Vila?","Silenciar") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			if(M.rank=="Hokage"||M.rank=="Tsuchikage"||M.rank=="Amekoutei"||M.rank=="Otokami")
				M<<"Você não pode silenciar o Kage!";return
			M<<"Você foi Silenciado!"
			for(var/mob/A in world)
				if(A.Village==M.Village)
					A<<"<font color = #BB0EDA>Informação da Vila:</font> [M] Agora esta Silenciado!"
			M.VillageMute=1
	VillageUnMute()
		set category = "Kage"
		set name = "Desilenciar Membro da Vila"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village&&M.VillageMute)
					Menu.Add(M)
		var/mob/M = input("Você quer deixar quem falar no chat da vila?","Char") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			M<<"Você agora pode falar no chat da vila!"
			for(var/mob/A in world)
				if(A.Village==M.Village)
					A<<"<font color = #BB0EDA>Informação da Vila:</font> [M] Agora pode falar no Chat!"
			M.VillageMute=0
	MakeANBU()
		set category = "Kage"
		set name = "Nomear Anbu"
		var/list/Menu = list()
		if(usr.Village=="Leaf")
			if(LeafAnbu.len>=5)
				usr<<"Você já tem 5 Anbus!"
				usr<<"Os Anbus atuais são: [LeafAnbu]"
				return
		if(usr.Village=="Rock")
			if(RockAnbu.len>=5)
				usr<<"Você já tem 5 Anbus!"
				return
		if(usr.Village=="Sound")
			if(SoundAnbu.len>=5)
				usr<<"Você já tem 5 Anbus!"
				return
		if(usr.Village=="Rain")
			if(RainAnbu.len>=5)
				usr<<"Você já tem 5 Anbus!"
				return
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.Village==usr.Village&&(M.rank=="S.Jounin"||M.rank=="Jounin")&&M.VMorale>=120)
				Menu.Add(M)
		var/mob/M = input("Quem você gostaria de nomear Anbu?","Anbu") as null | anything in Menu
		if(!M)
			return
		if(istype(M,/mob))
//			if(M.Village=="Leaf")
//				LeafAnbu+=M
//				SaveVillageStuff()
//				LoadVillageStuff()
//			if(M.Village=="Rock")
//				RockAnbu+=M
//				SaveVillageStuff()
//				LoadVillageStuff()
//			if(M.Village=="Sound")
//				SoundAnbu+=M
//				SaveVillageStuff()
//				LoadVillageStuff()
//			if(M.Village=="Rain")
//				RainAnbu+=M
//				SaveVillageStuff()
//				LoadVillageStuff()
			M.Anbu=1
			M<<"Você recebeu a patente de Anbu!"
			var/obj/Clothes/ANBUArmor/A=new()
			A.loc=M
			var/obj/Clothes/ANBUHandGuards/C=new()
			C.loc=M
			M.verbs+=typesof(/mob/ANBU/verb)
			var/random=rand(1,3)
			if(random==1)
				var/obj/Clothes/Banbu/B=new()
				B.loc=M
			if(random==2)
				var/obj/Clothes/Ranbu/R=new()
				R.loc=M
			if(random==3)
				var/obj/Clothes/Ganbu/G=new()
				G.loc=M
			if(random==4)
				var/obj/Clothes/FoxAnbu/H=new()
				H.loc=M
		//	for(var/mob/E in world)
		//		if(E.Village==M.Village)
		//			E<<"<font color = #BB0EDA>Village Information:</font> [M] is now an ANBU!"
	TakeANBU()
		set category = "Kage"
		set name = "Remover Anbu"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Quem você deseja remover da Anbu?","Anbu") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			M<<"Você foi rebaixado de Anbu!"
			for(var/mob/A in world)
				if(A.Village==M.Village)
					A<<"<font color = #BB0EDA>Informação da Vila:</font> [M] Não é mais um Anbu!"
			M.Anbu=0
			M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUMask2.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/Ganbu.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/Banbu.dmi'
			M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUMask.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi';M.overlays-='Icons/New Base/Clothing/Official Clothing/ANBUHandGuards.dmi'
			for(var/obj/Clothes/ANBUArmor/A in M.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/ANBUHandGuards/A in M.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/Banbu/A in M.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/Ranbu/A in M.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/Ganbu/A in M.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/FoxAnbu/A in M.contents)
				A.worn=0
				del(A)
			M.verbs-=typesof(/mob/ANBU/verb)
			if(M.Village=="Leaf")
				LeafAnbu-=M
				SaveVillageStuff()
				LoadVillageStuff()
			if(M.Village=="Rock")
				RockAnbu-=M
				SaveVillageStuff()
				LoadVillageStuff()
			if(M.Village=="Sound")
				SoundAnbu-=M
				SaveVillageStuff()
				LoadVillageStuff()
			if(M.Village=="Rain")
				RainAnbu-=M
				SaveVillageStuff()
				LoadVillageStuff()
	Nominate_Village_Leader()
		set name = "Nominate A Clan Leader"
		var/list/LeafClans = list("Kusakin","Nara","Hyuuga","Sabaku","Ketsueki","Inuzuka","Yotsuki","Kiro","Fuuma")
		var/list/RainClans = list("Kaguya","Shiroi","Hoshigaki","Aburame","Iwazuka","Akimichi","Kyomou","Kumojin","Satou")
		var/list/RockClans = list("Kiro","Satou","Sabaku","Iwazuka")
		var/list/SoundClans = list("Kaguya","Kumojin","Uchiha","Yotsuki")
		var/Z
		if(src.rank=="Hokage")
			Z = input(src,"Qual Clan?") in LeafClans
		if(src.rank=="Tsuchikage")
			Z = input(src,"Qual Clan??") in RockClans
		if(src.rank=="Otokami")
			Z = input(src,"Qual Clan??") in SoundClans
		if(src.rank=="Amekoutei")
			Z = input(src,"Qual Clan??") in RainClans
		var/Clan=Z
		var/Position="[Z] Líder do Clã"
		switch(input(src,"Você deseja nomear um novo [Position]?",) in list("Sim","Não"))
			if("Sim")
				var/list/People=list()
				for(var/mob/M in world)
					if(M.client)
						if(Clan==M.Clan&&M.Village==src.Village&&M.Suspended==0)
							People+=M
				var/mob/A = input("Quem você quer nomear?") in People + list("Cancelar")
				if(A != "Cancelar")

					var/Y=0
					var/N=0

					for(var/mob/P in People)
						spawn()
							P<<"[src] nomeou [A] para a posição de [Position]. Toda a gente do clan vote nos próximos 60 segundos. Em seguida, os votos serão computados."
							switch(input(P,"Você concorda e quer eleger [A] para [Position]?","[Position]?") in list("Sim","Não","Eu não vou votar"))
								if("Sim")
									P.Yes+=A
								if("Não")
									P.No+=A
								else
									P<<"."
					sleep(600)
					for(var/mob/P in People)
						if(A in P.Yes)
							Y++
							P.Yes-=A
						if(A in P.No)
							N++
							P.No-=A
					var/TotalP = People.len
					TotalP-=Y
					TotalP-=N
					if(Y>N)
						A.ClanLeader=1 //In our leaders list, let whatever the rank is equal the rankholders key, so the element Raikage in the leaders file now contains DarkBelthazor =D
						world<<"[A] was elected as the new [Position]! "
						for(var/mob/X in world)
							if(X.Village==A.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [A] foi eleito como o novo [Position]! (Resultado dos Votos:[Y] Sim - [N] Não: [TotalP] Nulo."


						//else
							//Something else later for other leaders?
					if(N>=Y)
						for(var/mob/X in world)
							if(X.Village==A.Village)
								X << "<font color = #BB0EDA>Informação da Vila:</font> [A] perdeu a eleição para o novo [Position]! (Resultado dos Votos:[Y] Sim - [N] Não: [TotalP] Nulo."
						return
	Nominate_New_Ninja()
		set name = "Convidar para aldeia(Voto)"
		switch(input(src,"Você deseja convidar alguém para a aldeia?",) in list("Sim","Não"))
			if("Sim")
				var/list/People=list()
				var/list/VC=list()
				var/mob/Nominee
				for(var/mob/M in world)
					if(M.client)
						if(src.Village!=M.Village&&src!=M)
							People+=M
				for(var/mob/MM in world)
					if(MM.client)
						if(src.Village==MM.Village&&MM.VillageCouncil!=0)
							VC+=MM
				if(VC.len<3)
					src<<"Você precisa de pelo menos 3 Membros do Conselho para botar alguém na aldeia."
					return
				var/A = input("Quem você quer nomear?") in People + list("Cancelar")
				if(A!="Cancelar")
					Nominee=A
				var/Choice=input(Nominee,"Você quer se juntar ao [src.Village] Vila?") in list("Sim","Não")
				if(Choice=="Não")
					src<<"[Nominee] não quer se juntar.";return
				Nominee.Votes=0
				for(var/mob/P in VC)
					spawn()
						var/S = input(P,"[src] Gostaríamos de convidar [Nominee] para a aldeia. O que você acha?",) in list("Sim","Não","Eu não voto")
						if(S=="Eu não voto")
							P<<"Communist."
						if(S=="Sim")
							Nominee.Votes++
						if(S=="Não")
							Nominee.Votes--
				sleep(300)
				for(var/mob/X in world)
					spawn()
						if(X.Village==src.Village)
							X << "<font color = #BB0EDA>Informação da Vila:</font> Convidado [Nominee]! (Resultados da Votação:[Nominee.Votes] fora [VC.len]. Querem , ele precisava de [round(VC.len/2)] Votos.</font>"
						if(Nominee.Votes>=round(VC.len/2))
							X<<"<font color = #BB0EDA>Informação da Vila:</font> [Nominee] Agora é um Membro da Vila!</font>"
							Nominee.Village=src.Village
//Leaf Village Org
mob/Hokage/verb/
	OpenLeafDojo()
		set category = "Kage"
		set name = "Permitir acesso do público ao Dojo"
		if(LeafOnlyGeninDojo)
			usr<<"Você fechou a entrada do Dojo!";LeafOnlyGeninDojo=1;
			SaveVillageStuff();LoadVillageStuff()
			return
		else
			usr<<"Você abriu a entrada do Dojo!";LeafOnlyGeninDojo=0;
			SaveVillageStuff();LoadVillageStuff()
			return
	MakePoliceForce()
		set category = "Kage"
		set name = "Nomear Policial da Vila"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Quem você gostaria de fazer da Polícia Militar da Força Estado?","Polícia") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			M<<"Você foi promovido ao posto da Polícia Militar pelo kage!"
			for(var/mob/A in world)
				if(A.Village==M.Village)
					A<<"<font color = #BB0EDA>Informação da Vila:</font> [M] é agora um membro da Força Policial!"
			M.KonohaMilitaryPoliceForceMember=1
			var/obj/Clothes/KonohaMilitaryCap/A=new()
			A.loc=M
			M.verbs+=typesof(/mob/KonohaMilitaryPoliceForceMember/verb)
	TakePoliceForce()
		set category = "Kage"
		set name = "Remover Policial da Vila"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Quem você deseja remover qual Membro da Polícia?","Polícia") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			M<<"Você foi rebaixado de Polícia Militar do Estado!"
			for(var/mob/A in world)
				if(A.Village==M.Village)
					A<<"<font color = #BB0EDA>Informação da Vila:</font> [M] não é mais um membro da força policial!"
			M.KonohaMilitaryPoliceForceMember=0
			M.overlays-='MilitaryCaps.dmi'
			for(var/obj/Clothes/KonohaMilitaryCap/A in src.contents)
				A.worn=0
				del(A)
			M.verbs-=typesof(/mob/KonohaMilitaryPoliceForceMember/verb)
//Police Force
mob/KonohaMilitaryPoliceForceMember/verb/TalkWithMembers(msg as text)
	set category="Oficial"
	set name="Chat Policial"
	var/list/L = list("<")
	for(var/H in L)
		if(findtext(msg,H))
			alert(usr,"Não coloque HTML em texto!");return
		if(length(msg)>=400)
			alert(usr,"Mensagem é muito longa");return
	for(var/mob/M in world)
		if(M.KonohaMilitaryPoliceForceMember&&M.client&&M.Village==usr.Village||findtext(M.rank,"kage")&&M.client&&M.Village==usr.Village||findtext(M.rank,"kami")&&M.client&&M.Village==usr.Village||findtext(M.rank,"koutei")&&M.client&&M.Village==usr.Village)
			M<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>(M.F.P. Chat)-<font size=1>[usr.oname]<font color=#eee8aa>: [msg]</font>"
mob/KonohaMilitaryPoliceForceMember/verb/MembersWho()
	set category="Oficial"
	set name="M.F.P. Online"
	usr<<"<font color=#eee8aa>Online [usr.Village] Militares da Força Policial Membros-"
	for(var/mob/M in world)
		if(M.KonohaMilitaryPoliceForceMember&&M.client&&M.Village==usr.Village){usr<<"<font color=green>[M.oname]"}
//ANBU
mob/ANBU/verb/TalkWithANBU(msg as text)
	set category="Oficial"
	set name="Chat Anbu"
	var/list/L = list("<")
	for(var/H in L)
		if(findtext(msg,H))
			alert(usr,"Não coloque HTML em texto!");return
		if(length(msg)>=400)
			alert(usr,"Mensagem é muito longa");return
	for(var/mob/M in world)
		if(M.Anbu&&M.client&&M.Village==usr.Village||findtext(M.rank,"kage")&&M.client&&M.Village==usr.Village||findtext(M.rank,"kami")&&M.client&&M.Village==usr.Village||findtext(M.rank,"koutei")&&M.client&&M.Village==usr.Village)
			M<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>(ANBU Chat)-<font size=1>[usr.oname]<font color=#eee8aa>: [msg]</font>"
mob/ANBU/verb/ANBUWho()
	set category="Official"
	set name="ANBU Online"
	usr<<"<font color=#eee8aa>Online [usr.Village] ANBU Membros -"
	for(var/mob/M in world)
		if(M.Anbu&&M.client&&M.Village==usr.Village){usr<<"<font color=green>[M.oname]"}
//Rain Village Org
mob/Amekoutei/verb/
	MakeHunterNin()
		set category = "Kage"
		set name = "Nomear Hunter-Nin"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Quem você deseja promover a Hunter-Nin? "," Hunter-Nin") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			M<<"Você foi promovido ao posto de Hunter-Nin pelo Amekoutei!"
//			for(var/mob/A in world)
//				if(A.Village==M.Village)
//					A<<"<font color = #BB0EDA>Village Information:</font> [M] is now an ANBU!"
			M.HunterNinMember=1
			M.verbs+=typesof(/mob/HunterNin/verb)
			var/obj/Clothes/HunterNinClothing/B=new()
			B.loc=M
			var/random=(rand(1,3))
			if(random==1)
				var/obj/Clothes/HunterNinMask/A=new()
				A.loc=M
			if(random==2)
				var/obj/Clothes/HunterNinMask3/A=new()
				A.loc=M
			if(random==3)
				var/obj/Clothes/HunterNinMask3/A=new()
				A.loc=M
	TakeHunterNin()
		set category = "Kage"
		set name = "Remover Hunter-Nin"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Quem você deseja remover Hunter-Nin?","Hunter-Nin") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			M<<"Você foi rebaixado de Hunter-Nin!"
			M.HunterNinMember=0
			M.overlays-='Hunter-NinMask.dmi'
			M.overlays-='Hunter-NinClothing.dmi'
			for(var/obj/Clothes/HunterNinClothing/A in src.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/HunterNinMask/A in src.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/HunterNinMask2/A in src.contents)
				A.worn=0
				del(A)
			for(var/obj/Clothes/HunterNinMask3/A in src.contents)
				A.worn=0
				del(A)

			M.verbs-=typesof(/mob/HunterNin/verb)
mob/HunterNin/verb/TalkWithHunterNin(msg as text)
	set category="Official"
	set name="Hunter-Nin Chat"
	var/list/L = list("<")
	for(var/H in L)
		if(findtext(msg,H))
			alert(usr,"o coloque HTML em texto!");return
		if(length(msg)>=400)
			alert(usr,"Mensagem é muito longa");return
	for(var/mob/M in world)
		if(M.HunterNinMember&&M.client&&M.Village==usr.Village||findtext(M.rank,"kage")&&M.client&&M.Village==usr.Village||findtext(M.rank,"kami")&&M.client&&M.Village==usr.Village||findtext(M.rank,"koutei")&&M.client&&M.Village==usr.Village)
			M<<"<font size=2><font face=trebuchet MS><font color=#CCFFFF>(Hunter-Nin Chat)-<font size=1>[usr.oname]<font color=#eee8aa>: [msg]</font>"
mob/HunterNin/verb/HunterNinWho()
	set category="Official"
	set name="Hunter-Nin Online"
	usr<<"<font color=#eee8aa>Online [usr.Village] Hunter-Nin Membros -"
	for(var/mob/M in world)
		if(M.HunterNinMember&&M.client&&M.Village==usr.Village){usr<<"<font color=green>[M.oname]"}

//Sound Village Org
mob/Otokami/verb/
	GiveSoundOrganization()
		set category = "Kage"
		set name = "Make Sound Organization"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village)
					Menu.Add(M)
		var/mob/M = input("Make who a Sound Organization?","Sound Organization") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			if(M.rank=="Otokami")
				alert("You cannot make the Otokami a Sound Organization Member!");return
			switch(alert("Would you like to make [M] a Sound Organization member?","Sound Organization","Yes","No"))
				if("Yes")
					for(var/mob/X in world)
						if(X.Village==usr.Village)
							X << "<font color = #BB0EDA>Village Information:</font> [M] is now apart of the Sound Organization!"
					M.SoundOrganization=1
					M.verbs += typesof(/mob/SoundOrganization/verb)
					var/obj/Clothes/SoundOutfit/A=new()
					A.loc=M
				if("No")
					usr<<"You decided not to give powers to [M]";return
	ChangeSoundOrganizationRank()
		set category = "Kage"
		set name = "Change SO Rank"
		var/list/Menu = list()
		for(var/mob/M in world)
			if(!M.client) continue
			if(M.key != usr.key)
				if(M.Village== usr.Village&&M.SoundOrganization)
					Menu.Add(M)
		var/mob/M = input("Who's Rank Number do you want to adjust?","Sound Organization") as null | anything in Menu
		if(!M)return
		if(istype(M,/mob))
			if(M.SoundOrganizationRank>=5&&src.rank!="Otokami")
				alert("You cannot alter the first 5!");return
			var/Question=input(usr,"What rank would you like to set them as?","Rank") as num
			if(Question>1000)
				usr<<"You can only reach 1000 at highest, they'll be set to the highest of 1000."
				Question=1000
			M.SoundOrganizationRank=Question
			if(M.SoundOrganizationRank>=5)
				var/obj/Clothes/SoundOutfit/A=new()
				A.loc=M
			var/obj/Clothes/SoundOrganizationSuit/B=new()
			B.loc=M
mob/SoundOrganization/verb/TalkWithSO(msg as text)
	set category="Official"
	set name="Sound Organization Say"
	var/list/L = list("<")
	if(usr.CantAlert)
		usr<<"You can't use this right now."
		return
	for(var/H in L)
		if(findtext(msg,H))
			alert(usr,"No HTML in text!");return
		if(length(msg)>=400)
			alert(usr,"Message is too long");return
	for(var/mob/M in world)
		if(M.SoundOrganization&&M.client&&M.Village==usr.Village||findtext(M.rank,"kage")&&M.client&&M.Village==usr.Village||findtext(M.rank,"kami")&&M.client&&M.Village==usr.Village||findtext(M.rank,"koutei")&&M.client&&M.Village==usr.Village)
			M<<"<font size=2><font face=trebuchet MS><font color=#33CCFF>(SO Say)([usr.SoundOrganizationRank])-<font size=1>[usr.oname]<font color=#eee8aa>: [msg]</font>"
mob/SoundOrganization/verb/SoundOrganizationWho()
	set category="Official"
	set name="Sound Organization Who"
	usr<<"<font color=#eee8aa>Online [usr.Village] Sound Organization Members -"
	for(var/mob/M in world)
		if(M.SoundOrganization&&M.client&&M.Village==usr.Village){usr<<"<font color=green>([M.SoundOrganizationRank])[M.oname]"}


















world/New() //When the world begins :O
	..() //Let it do it's usual crap, THEN!
	LoadLeaders() //Load our leaders!