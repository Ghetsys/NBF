//Hell, Place Auto Events, or anything you can think of that can add more fun things to the game, Quests, Idc lol.





var/list/TeamRedTDM = list()
var/list/TeamBlueTDM = list()
var/list/ParticipatorsInTDM = list()
var/list/TDMDLevel=list()
var/list/TDMCLevel=list()
var/list/TDMBLevel=list()
var/list/TDMALevel=list()
var/list/TDMSLevel=list()
var/list/OutCast()
var/TotalPlayersTDM=0
mob/var/tmp/JoinedTDM = 0
mob/var/tmp/WaitingtoTDM = 0
var/TDMHosted=0
var/CurrentEvent=""
mob/owner/verb/HostTDM()//Should Also make it an Auto World/proc so it can be automated ;o
	set name="Evento: Morte por times"
	set category="Staff"
	if(CurrentEvent!="")
		usr<<"Você precisa esperar o evento de agora [CurrentEvent] terminar!";return
	CurrentEvent="Team Death Match"
	for(var/mob/M in OnlinePlayers)
		M.verbs += new/mob/Events/verb/JoinTDM()
	world<<"<font color = blue size = 2> <TT>A Team DeathMatch is being hosted! Press the Join Team Death Match verb inside your Commands Tab to join!</TT></font>"
	spawn(600)
		for(var/mob/A in ParticipatorsInTDM)
			A.health=A.maxhealth;A.stamina=A.maxstamina;A.chakra=A.Mchakra;A.resting=0
			A<<"O morte por time começara em breve."
	//	spawn(60)
		for(var/mob/C in OnlinePlayers)
			C.verbs -= new/mob/Events/verb/JoinTDM()
		world.SetTDM() //World Proc
mob/owner/verb/CheckTDMStuff()
	set name="Evento: Checar times no Morte por times"
	set category="Staff"
	usr<<"[ParticipatorsInTDM.len] são a quantidade de pessoas no evento."
	usr<<"[TDMDLevel.len] Ninjas Rank D."
	usr<<"[TDMCLevel.len] Ninjas Rank C."
	usr<<"[TDMBLevel.len] Ninjas Rank B."
	usr<<"[TDMALevel.len] Ninjas Rank A."
	usr<<"[TDMSLevel.len] Ninjas Rank S."
	usr<<"[TotalPlayersTDM] Foram criados em um Posto Lista adequada"
	return
mob/Events/verb/JoinTDM()
	set name="Entrar no evento Morte por Times"
	set category="Evento"
	if(usr.Frozen||usr.firing||usr.Mogu||usr.Dead||usr.knockedout)
		return
	if(usr.resting)
		usr<<"Pare de descançar primeiro.";return
	if(ParticipatorsInTDM.len>=20)
		usr<<"O evento Morte por Times esta cheio.";usr.verbs-=new/mob/Events/verb/JoinTDM()
		return
	if(usr in ParticipatorsInTDM)
		usr<<"Você já está no Evento!";usr.verbs-=new/mob/Events/verb/JoinTDM();return
	usr<<"O Evento Morto por time vai começar em breve! Sente-se forte!"
	world<<"<TT><font color=blue>[usr] Esta participando do Evento: Morte por Times!</font></TT>"
	ParticipatorsInTDM+=usr
world/proc/SetTDM()//Places the people who chose to join in Groups according to their ranks for balancing purposes
	for(var/mob/M in ParticipatorsInTDM)
		if(M.blevel=="D")
			TDMDLevel+=M;ParticipatorsInTDM-=M
		if(M.blevel=="C")
			TDMCLevel+=M;ParticipatorsInTDM-=M
		if(M.blevel=="B")
			TDMBLevel+=M;ParticipatorsInTDM-=M
		if(M.blevel=="A")
			TDMALevel+=M;ParticipatorsInTDM-=M
		if(M.blevel=="S")
			TDMSLevel+=M;ParticipatorsInTDM-=M
	world<<"A criação de equipes esta começando..."
	spawn(30)
		world.SetTDMTeams()
world/proc/SetTDMTeams()
	var/list/SettingUpTDM=list()
	var/list/OutCastD=list()
	var/list/OutCastC=list()
	var/list/OutCastB=list()
	var/list/OutCastA=list()
	var/list/OutCastS=list()
	var/Number
	var/mob/Out
	if(TDMDLevel%2==1)
		Out=pick(TDMDLevel)
		OutCastD+=Out
		TDMDLevel-=Out
		TotalPlayersTDM++
		world<<"Por razões de equilíbrio, [Out] foi colocada na espera para D Ranking Ninja."
	if(TDMCLevel%2==1)
		Out=pick(TDMCLevel)
		OutCastC+=Out
		TDMCLevel-=Out
		TotalPlayersTDM++
		world<<"Por razões de equilíbrio, [Out] foi colocada na espera para C Ranking Ninja."
	if(TDMBLevel%2==1)
		Out=pick(TDMBLevel)
		OutCastB+=Out
		TDMBLevel-=Out
		TotalPlayersTDM++
		world<<"Por razões de equilíbrio, [Out] foi colocada na espera para B Ranking Ninja."
	if(TDMALevel%2==1)
		Out=pick(TDMALevel)
		OutCastA+=Out
		TDMALevel-=Out
		TotalPlayersTDM++
		world<<"Por razões de equilíbrio, [Out] foi colocada na espera para A Ranking Ninja."
	if(TDMSLevel%2==1)
		Out=pick(TDMSLevel)
		OutCastS+=Out
		TDMSLevel-=Out
		TotalPlayersTDM++
		world<<"Por razões de equilíbrio, [Out] foi colocada na espera para S Ranking Ninja."
	var/DPerTeam//=TDMDLevel.len/2
	var/CPerTeam//=TDMCLevel.len/2
	var/BPerTeam//=TDMBLevel.len/2
	var/APerTeam//=TDMALevel.len/2
	var/SPerTeam//=TDMSLevel.len/2
	DPerTeam=TDMDLevel.len/2
	CPerTeam=TDMCLevel.len/2
	BPerTeam=TDMBLevel.len/2
	APerTeam=TDMALevel.len/2
	SPerTeam=TDMSLevel.len/2
	for(var/mob/M in OnlinePlayers)
		if(M in TDMDLevel)
			TotalPlayersTDM++
			SettingUpTDM+=M
		if(M in TDMCLevel)
			TotalPlayersTDM++
			SettingUpTDM+=M
		if(M in TDMBLevel)
			TotalPlayersTDM++
			SettingUpTDM+=M
		if(M in TDMALevel)
			TotalPlayersTDM++
			SettingUpTDM+=M
		if(M in TDMSLevel)
			TotalPlayersTDM++
			SettingUpTDM+=M
	world<<"[DPerTeam] Ninjas Rank D classificado por time."
	sleep(15)
	world<<"[CPerTeam] Ninjas Rank C classificado por time"
	sleep(15)
	world<<"[BPerTeam] Ninjas Rank B classificado por time"
	sleep(15)
	world<<"[APerTeam] Ninjas Rank A classificado por time"
	sleep(15)
	world<<"[SPerTeam] Ninjas Rank S classificado por time"
	world<<"Número total de jogadores nesta Morte por Times são [TotalPlayersTDM]"//[SettingUpTDM.len]."
//	if(OutCast.len!=null)
	world<<"Valor atual daqueles que aguardam uma equipe para fins de equilíbrio: [OutCast.len]."
	Number=(DPerTeam+CPerTeam+BPerTeam+APerTeam+SPerTeam)
	world<<"Haverá [Number] Deputados por cada lado!"
	for(var/i=0;i<=(Number-1);i++)
		for(var/p=0;p<=DPerTeam;p++)
			var/mob/A
			A=pick(TDMDLevel)
			TDMDLevel-=A
			TeamRedTDM+=A
			p++
		for(var/q=0;q<=CPerTeam;q++)
			var/mob/B
			B=pick(TDMCLevel)
			TDMCLevel-=B
			TeamRedTDM+=B
			q++
		for(var/r=0;r<=BPerTeam;r++)
			var/mob/C
			C=pick(TDMBLevel)
			TDMBLevel-=C
			TeamRedTDM+=C
			r++
		for(var/s=0;s<=APerTeam;s++)
			var/mob/D
			D=pick(TDMALevel)
			TDMALevel-=D
			TeamRedTDM+=D
			s++
		for(var/t=0;t<=SPerTeam;t++)
			var/mob/E
			E=pick(TDMSLevel)
			TDMSLevel-=E
			TeamRedTDM+=E
			t++
		i++
	for(var/u=0;u<=(Number-1);u++)
		for(var/p=0;p<=DPerTeam;p++)
			var/mob/AA
			AA=pick(TDMDLevel)
			TDMDLevel-=AA
			TeamBlueTDM+=AA
			p++
		for(var/q=0;q<=CPerTeam;q++)
			var/mob/BB
			BB=pick(TDMCLevel)
			TDMCLevel-=BB
			TeamBlueTDM+=BB
			q++
		for(var/r=0;r<=BPerTeam;r++)
			var/mob/CC
			CC=pick(TDMBLevel)
			TDMBLevel-=CC
			TeamBlueTDM+=CC
			r++
		for(var/s=0;s<=APerTeam;s++)
			var/mob/DD
			DD=pick(TDMALevel)
			TDMALevel-=DD
			TeamBlueTDM+=DD
			s++
		for(var/t=0;t<=SPerTeam;t++)
			var/mob/EE
			EE=pick(TDMSLevel)
			TDMSLevel-=EE
			TeamBlueTDM+=EE
			t++
		u++
	world<<"Quantidade atual de pessoas no Time Vermelho: [TeamRedTDM.len]."
	world<<"Quantidade atual de pessoas no Time Azul: [TeamBlueTDM.len]."

world/proc/StartFFA()
	if(global.AutoFreeForAllCount >= 1)
	//	usr<<"There is already a FFA in progress."
		return
	world<<"<b><font size=2 color=blue>Um Evento : Sovrevivencia esta começando!</font></b>"
	global.AutoFreeForAllCount = 1
	world<<"<b><font size=2 color=blue>Va na aba Desafios , e escolha a opção para se juntar ao evento!</font></b>"
	sleep(600)
	world<<"<b><font size=2 color=blue>O evento começa em 2 minutos!</font></b>"
	sleep(600)
	world<<"<b><font size=2 color=blue>O evento começa em 1 Minuto!</font></b>"
	sleep(600)
	world<<"<b><font size=3 color=red>O evento começou , ate o ultimo sobrevivente!"
	global.AutoFreeForAllCount = 2
	world<<"<b><font size=2 color=blue>Existe [length(AutoFreeForAll)] Lutadores no Evento de sobrevivencia.</font></b>"
	global.AutoFreeForAllRewardBonus = 0
	global.AutoFreeForAllReward = 0
	global.AutoFreeForAllReward = length(AutoFreeForAll) * 7500
	world<<"<b><font size=2 color=green>A recompensa para este evento é [global.AutoFreeForAllReward] ryo.</font></b>"
	if(length(AutoFreeForAll) > 10)
		world<<"<b><font size=2 color=red>Uma recompensa adicional de 150 mil Ryo serão concedidos para este evento, devido à quantidade de participantes!</font></b>"
		global.AutoFreeForAllRewardBonus = 1

	for(var/mob/A in AutoFreeForAll)
		A.loc = locate(rand(120,135),rand(170,171), 21)
		A.deathcount=0
		A.health=A.maxhealth
		A.chakra=A.Mchakra
		A.stamina=A.maxstamina
		A.ChakraPool=A.MaxChakraPool
		contestants+=A
	return
//////////////////////////////////////////////////////

//Assassin Mode :D!!

//////////////////////////////////

mob/owner/verb/HostAssassin()
	set name="Evento: Assasino"
	set category="Staff"
	if(CurrentEvent!="")
		usr<<"Espere o evento atual acabar!";return
	for(var/mob/M in OnlinePlayers)
		M.verbs+=new/mob/Events/verb/JoinAssassin()
	world<<"<font size=2 color=blue> Um perigoso assassino foi localizado nos arredores de uma floresta ... Pressione o verbo caçar assassino localizado na aba Eventos, para enfrentar esse assassino!</font>"
	sleep(450)
	for(var/mob/C in OnlinePlayers)
		C.verbs-=new/mob/Events/verb/JoinAssassin()
	world.setAssassinEvent()

var/list/InAssassinEvent=list()

mob/Events/verb/JoinAssassin()
	set name="Entrar no evento Caça ao Assasino"
	set category="Evento"
	if(usr.Frozen||usr.firing||usr.Mogu||usr.Dead||usr.knockedout)
		return
	if(usr.resting)
		usr<<"Pare de descançar primeiro.";return
	if(InAssassinEvent.len>=30)
		usr<<"A quantidade máxima de Ninja já foram encaminhados para caçar o assassino!";usr.verbs-=new/mob/Events/verb/JoinAssassin()
		return
	if(usr in InAssassinEvent)
		usr<<"Você ja esta no evento!";usr.verbs-=new/mob/Events/verb/JoinAssassin();return
	InAssassinEvent+=usr
	usr<<"A expedição vai começar em breve! Sente-se forte!"
	world<<"<font color=blue>[usr] será despachado para caçar o assassino!</font>"

mob/var/tmp/TheAssassin=0

world/proc/setAssassinEvent()
	for(var/mob/M in InAssassinEvent)
		M.health=M.maxhealth
		M.stamina=M.maxstamina
		M.chakra=M.Mchakra
		M.ChakraPool=M.MaxChakraPool
		M.resting=0
		M<<"<font color=green>Prepare-se para ir para a floresta..</font>"
	sleep(150)
	for(var/mob/L in InAssassinEvent)
		spawn()
			L.FadeScreen()
			L.loc=locate(rand(30,50),rand(30,90),37)
	world.startAssassinEvent()

var/list/Assassin = list()
mob/var/CantAlert=0
var/PrizeForAssassin
var/PrizeForNinja
world/proc/startAssassinEvent()
	var/mob/Assassin2=""
	for(var/mob/A in InAssassinEvent)
		Assassin2=pick(InAssassinEvent)
		Assassin+=Assassin2
		InAssassinEvent-=Assassin2
		break
	for(var/mob/L in Assassin)
		L<<"<font color=red> Está o poder Assasino..Você foi aumentado, juntamente com sua força de vontade, e seu aumento em sede de sangue permite matar pessoas dentro de um nocaute ... Matar todos aqui!</font>"
		L.TheAssassin=1
		L.CantAlert=1
	for(var/mob/Q in InAssassinEvent)
		Q<<"Todas as fontes de informação serão desligadas ... Se você encontrar o assassino, não haverá maneira de alertar alguém para ajudar.. ninguém!"
		Q<<"<font color=red> Matar o assassino irá resultar em um prêmio para você e um prêmio menor para os sobreviventes restantes...</font>"
		Q.CantAlert=1
	if(InAssassinEvent.len>=29)
		PrizeForAssassin="2 Ponto de Jutsus"
		PrizeForNinja="500k Yen"
	if(InAssassinEvent.len>=19&&InAssassinEvent.len<9)
		PrizeForAssassin="1 Ponto de Jutsus"
		PrizeForNinja="750k Yen"
	if(InAssassinEvent.len<=9)
		PrizeForAssassin="1 Pergaminio Colldown e um Pergaminio de EXP"
		PrizeForNinja="1 Million Yen"
	world.AssassinEvent()

world/proc/AssassinEvent()
	//Don't forget to make a check for if there is a chuunin exam currently
	CurrentEvent="Kill The Assassin"
	while(CurrentEvent=="Kill The Assassin")
		if(InAssassinEvent.len<=0)
			world<<"<font size=2 color=blue> O assassino matou todo o Ninja que tentou detê-lo...</font>"
			for(var/mob/O in Assassin)
				if(PrizeForAssassin=="2 Ponto de Jutsus")
					O.ElementalPoints+=2
					spawn()
						O.GotoVillageHospital()
				if(PrizeForAssassin=="1 Ponto de Jutsus")
					O.ElementalPoints+=1
					spawn()
						O.GotoVillageHospital()
			for(var/mob/A in world)
				if(A in OnlinePlayers)
					if(A.CantAlert)
						A.CantAlert=0
			CurrentEvent=""
			return
		if(Assassin.len<=0)
			world<<"<font size=2 color=blue> O Assasino foi morto...</font>"
			for(var/mob/I in InAssassinEvent)
				if(PrizeForNinja=="1 Million Yen")
					I.Yen+=1000000
					spawn()
						I.GotoVillageHospital()
				if(PrizeForNinja=="750k Yen")
					I.Yen+=750000
					spawn()
						I.GotoVillageHospital()
				if(PrizeForNinja=="500k Yen")
					I.Yen+=500000
					spawn()
						I.GotoVillageHospital()
			for(var/mob/F in world)
				if(F in OnlinePlayers)
					if(F.CantAlert)
						F.CantAlert=0
			CurrentEvent=""
			return
				//Don't Forget the Cooldown Scroll prize!
		sleep(30)

























