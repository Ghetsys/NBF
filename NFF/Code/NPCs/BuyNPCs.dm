var/list/HiredNinja = list()
proc/SaveHiredNinja()
	var/savefile/F = new("World Save Files/HiredNinja.sav")
	F["Ninja"] << HiredNinja
//proc/LoadHiredNinja()//Start this proc at world/New()
//	var/savefile/F = new("World Save Files/HiredNinja.sav")
//	F["Ninja"] >> HiredNinja
//	spawn()//Auto save, every minute.
//		while(1)
//			sleep(600)
//			SaveHiredNinja()



mob/owner/verb/Buy_Ninja()
	set category = "Kage"
	var/VoceTemCertza = alert(usr,"Voc� est� prestes a contratar um ninja. Voc� deseja continuar?",,"Sim","N�o")
	if(VoceTemCertza == "N�o")
		return
	PickRank
	var/NinjaOptions = list("Genin"=500000, "Chuunin" = 100000, "Jounin"=500000,"ANBU"=1000000)
	var/Option = input("Qual o rank do ninja que voc� gostaria de contratar?") in NinjaOptions + "N�o Importa"
	if(Option == "N�o Importa")
		return
	var/Amount = NinjaOptions[Option]
	var/AreYouSure = alert(usr,"Voc� selecionou a contrata��o de um [Option] Ninja rankiado, que ir� reduzir [Amount] do banco da vila. Voc� est� certo disso?",,"Sim","N�o")
	if(AreYouSure == "N�o")
		goto PickRank
	NinjaOptions = list("Ficar parado","Maravilha")
	var/Option2 = input("O que voc� deseja para esse ninja fazer?") in NinjaOptions

	var/mob/NPC/Hired = new(src.loc);Hired.Village = usr.Village
	Hired.name="[usr.Village] [Option] Ninja(NPC)"
	Hired.icon='Icons/New Base/Base.dmi';icon_state=""
	Hired.Clan=(usr.Village=="Leaf"?(prob(10)?"Hyuuga":"Basic"):(usr.Village=="Sound"?(prob(10)?"Uchiha":"Basic"):"Basic"))
	//Sound and Leaf village have a chance at those Clans... seeing as they're the only clans with NPC specific shit...
	Hired.rank=Option
	Hired.FireChakra=15;Hired.WaterChakra=15;Hired.EarthChakra=15;Hired.WindChakra=15;Hired.LightningChakra=15
	Hired.Swift=5;Hired.reflexNew=rand(1,3)
	Hired.maxhealth=1500;Hired.health=1500
	Hired.maxstamina = rand(3000,6000);Hired.stamina=Hired.maxstamina
	Hired.NeedsFace=1;Hired.tempmix3=0
	Hired.viewsight=10
	Hired.AWA=1
	walks=(Option2=="Wonder")	//If you picked Wonder, this sets to 1... otherwise, 0
	HiredNinja += src;SaveHiredNinja()
	/*
	if(usr.Village=="Leaf")
		LeafVillagePool -= Amount
		//You get the idea here...
	*/