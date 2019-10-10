//Village Messeging System
//Mitchell Quinn
// 10/15/2011


/*
Need to make it visable inside the Stat()
Need to add 4variables that display the message x
Need to add a command for kages to set the verb x

*/



var/global.leafVillageMessage
var/global.rainVillageMessage
var/global.soundVillageMessage
var/global.rockVillageMessage



mob/Kage/verb/KageMessage()
	set name = "Colocar Anuncio na Vila"
	set category = "Kage"

	if(usr.Village == "Leaf")
		switch(input(src, "Gostaria de colocar uma Mensagem?") in list ("Sim","Nao"))
			if("Sim")
				leafVillageMessage = input("Digite sua Mensagem.")
				return
			if("Nao")
				src<<"Sua mensagem na aldeia permanecerá o mesmo."
				return
	if(usr.Village == "Rain")
		switch(input(src, "Gostaria de colocar uma Mensagem?") in list ("Sim" , "Nao"))
			if("Sim")
				rainVillageMessage = input("Digite sua Mensagem.")
				return
			if("Nao")
				src<<"Sua mensagem na aldeia permanecerá o mesmo."
				return
	if(usr.Village == "Sound")
		switch(input(src, "Gostaria de colocar uma Mensagem?") in list ("Sim" , "Nao"))
			if("Sim")
				soundVillageMessage = input("Digite sua Mensagem.")
				return
			if("Nao")
				src<<"Sua mensagem na aldeia permanecerá o mesmo."
				return
	if(usr.Village == "Rock")
		switch(input(src, "Gostaria de colocar uma Mensagem?") in list ("Sim" , "Nao"))
			if("Sim")
				rockVillageMessage = input("Digite sua Mensagem.")
				return
			if("Nao")
				src<<"Sua mensagem na aldeia permanecerá o mesmo."
				return