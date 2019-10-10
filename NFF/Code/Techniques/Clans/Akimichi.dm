//Baika no Jutsu    Bubun Baika no Jutsu
///////////////////////////////////////////////////////
//Baika No Jutsu
//////////////////////////
mob/var/tmp/ChargingForBaikaNoJutsu=0
mob/var/tmp/BaikaCharged=0
mob/var/tmp/GatheredUpMeatTankCalories=0
mob/proc/BaikaNoJutsu()
	if(src.BaikaCharged>=1|src.ChargingForBaikaNoJutsu)
		return
	else
		src<<output("Hold down Z to begin charging your Baika No Jutsu! You will take away your calories for damage!","Attack")
		src.ChargingForBaikaNoJutsu=1
		while(src.ChargingForBaikaNoJutsu)
			src.ChakraDrain(5000-src.SizeMastery)
			if(prob(20))
				src.SizeMastery+=0.6
			sleep(25)
///////////////////////////////////////////////////////
//Bubun Baika no Jutsu
//////////////////////////
mob/var/tmp/BubunBaika=0
mob/proc/BubunBaika()
	var/A='Icons/New Base/BabunArm.dmi'
	A+=rgb(src.BaseR,src.BaseG,src.BaseB)
	if(src.BubunBaika)
		var/obj/SmokeCloud/S=new();S.loc=src.loc;src.BubunBaika=0;src<<output("Você sente seus braços diminuirem!","Attacks");src.overlays-=A;return
	if(src.BaikaCharged>=1|src.ChargingForBaikaNoJutsu)
		return
	else
		src.icon_state="handseal";sleep(11);src.icon_state=""
		var/obj/SmokeCloud/SS=new();SS.loc=src.loc
		src<<output("Você sente seus braços crescerem!","Attacks")
		src.overlays-=A
		src.overlays+=A
		src.BubunBaika=1
		src.Endurance+=200
		while(src.BubunBaika)
			src.ChakraDrain(2000)
			src.calories-=2
			if(src.calories<=0)
				src.intank=0;src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';src.firing=0
				src.GatheredUpMeatTankCalories=0
				for(var/obj/SkillCards/Nikudan/C in src.LearnedJutsus)
					C.Delay=1;spawn(250-usr.NinjutsuMastery)
						C.Delay=0
					C.overlays+='Icons/Jutsus/Skillcards2.dmi'
					spawn(250-usr.NinjutsuMastery)
						C.overlays-='Icons/Jutsus/Skillcards2.dmi'
			sleep(25)
		src.Endurance-=200
///////////////////////////////////////////////////////
//Nikudan Sensha
//////////////////////////
mob/var/tmp/intank=0
mob/proc/Nikudan()
	if(!src.BaikaCharged>=1)
		src<<output("Você precisa estar no Baika No Jutsu primeiro!","Attack");return
	else
		var/StaminaLoss=100
		src.stamina-=StaminaLoss
		src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';src.overlays+='Icons/Jutsus/AkimichiTechniques.dmi'
//		if(prob(50))
//			view()<<"<font size=1><font face=verdana><b><font color=white>[src]<font color=green> Says: Nikudan Sensha!"
		src.intank=1;src.firing=1;src.Constant()
		src.Endurance+=500
		while(src.intank)
			src.calories-=5
			if(!src.BaikaCharged||src.calories<=0)
				src.Normal();walk(usr,0);src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';src.firing=0
				for(var/obj/SkillCards/Nikudan/A in src.LearnedJutsus)
					A.Delay=1;spawn(250-src.NinjutsuMastery)
						A.Delay=0
					A.overlays+='Icons/Jutsus/Skillcards2.dmi'
					spawn(250-src.NinjutsuMastery)
						A.overlays-='Icons/Jutsus/Skillcards2.dmi'
				src.intank=0
				src.Endurance-=500
			sleep(11)
///////////////////////////////////////////////////////
//AkimachiSlam
//////////////////////////
mob/proc/AkimachiSlam()
	if(!src.BubunBaika)
		src<<"Você precisa estar no Bubun Baika no jutsu para usar isso";
		return
	if(src.calories<2000)
		src<<"Você não tem calorias o suficiente para usar isto.";
		return
	src<<"Você bate no chão e sente um pequeno terremoto"
	var/DD=(src.tai*1.2)*((src.SizeMastery/50)+1)
	var/RR=(src.SizeMastery/10)//Range of the move
	for(var/mob/M in oview(1,src))
		spawn()
			Quake_Effect(M,10,1)
			AttackEfx2(M.x,M.y,M.z)
			M.DamageProc(DD*0.5,"Stamina",src)
			if(M.Mogu)
				M.DamageProc(DD*0.7,"Stamina",src)
	for(var/mob/M in oview(RR,src))
		spawn()
			Quake_Effect(M,10,1)
			AttackEfx2(M.x,M.y,M.z)
			M.DamageProc(DD,"Stamina",src)
			if(M.Mogu)
				M.DamageProc(DD*2,"Stamina",src)

mob/var/tmp/Pill=""
obj/AkimichiPills
	icon = 'Icons/Food.dmi'
	Green
		icon_state = "7"
		verb/Eat()
			if(usr.Pill!="")
				return
			if(usr.knockedout||usr.Frozen)
				return
			if(usr.calories<1000)
				usr<<"Você não pode comer isso agora, você não tem calorias suficientes para queimar!";return
			usr.calories-=1000
			usr.chakra+=1500
			usr<<"Você come a primeira pílula!"
			usr.Frozen=1
			sleep(11)
			usr.Frozen=0
			usr<<"Você sente algo começando!"
			usr.hunger=0
			usr.Pill="Green"
			var/count=0
			for(var/obj/ReleaseThingy/A in usr.client.screen)
				count=1
			if(count==0)
				usr.client.screen+=new/obj/ReleaseThingy
			del(src)
	Yellow
		icon_state = "8"
		verb/Eat()
			if(usr.Pill!="Green")
				return
			if(usr.knockedout||usr.Frozen)
				return
			if(usr.calories<2000)
				usr<<"Você não pode comer isso agora, você não tem calorias suficientes para queimar!";return
			usr<<"Você come a segunda pílula!"
			usr.calories-=2000
			usr.chakra+=3000
			usr.Frozen=1
			sleep(11)
			usr.Frozen=0
			usr<<"Você sente algo começando!"
			usr.hunger=0
			usr.Pill="Yellow"
			var/count=0
			for(var/obj/ReleaseThingy/A in usr.client.screen)
				count=1
			if(count==0)
				usr.client.screen+=new/obj/ReleaseThingy
			del(src)
	Red
		icon_state = "9"
		verb/Eat()
			if(usr.Pill!="Yellow")
				return
			if(usr.knockedout||usr.Frozen)

				return
			if(usr.calories<3000)
				usr<<"Você não pode comer isso agora, você não tem calorias suficientes para queimar!";return
			usr<<"Você come a pílula de Pimenta!"
			usr.calories-=3000
			usr.chakra+=3000
			src.overlays+='Icons/Jutsus/AkimichiWings.dmi'
			usr.Frozen=1
			sleep(11)
			usr.Frozen=0
			usr<<"Você sente algo começando!"
			usr.hunger=0
			usr.Pill="Red"
			var/count=0
			for(var/obj/ReleaseThingy/A in usr.client.screen)
				src.overlays-='Icons/Jutsus/AkimichiWings.dmi'
				count=1
			if(count==0)
				usr.client.screen+=new/obj/ReleaseThingy
			del(src)