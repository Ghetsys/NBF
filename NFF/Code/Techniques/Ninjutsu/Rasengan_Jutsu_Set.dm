mob/var/tmp
	Rasenganon=0
	RasenganCharge=0
	RasenganD=0
	RasenganType=0
	DRasenganon=0
	DRasenganCounter=0
/*Rasengan:
Chargeable move designed to destroy an opponent from spiraling damage.
*/


mob/proc/SpirallingSpheres()
	if(src.Rasenganon==1)
		src.ChakraDrain(40000)
		src<<"Você utiliza o seu chakra Sennin para aumentar o poder do rasengan!"
		src.SageModeTime-=pick(20,25,35)
		src.RasenganD*=(pick(1.5,2,2.5))
	else
		src<<"Você precisa do rasengan na ordem para usar isso!"
mob/proc/Rasengan()
	if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing|src.Rasenganon)
		return
	else
		src<<"Segure Z para carregar o rasengan!";src.RasenganCharge=1;src.Rasenganon=1;src.RasenganType=0
		var/A='Icons/Jutsus/Rasengan2.dmi';src.overlays-=A;src.overlays+=A;flick("Power",A)
		while(src.Rasenganon)
			src.SoundEngine('SFX/RasCharge.wav',5,50)
			if(!src.RasenganCharge)
			//	src.RasenganD-=10
				src.RasenganD-=20
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					src.RasenganD=0
				if(src.RasenganD<=0)
					if(src.DRasenganCounter>0)
						src.DRasenganCounter=0;src.overlays-='Icons/Jutsus/Rasengan4.dmi'
					src.overlays-='Icons/Jutsus/Rasengan2.dmi';src<<"Your Rasengan ran out of energy!";src.Rasenganon=0
mob/proc/Rasenshuriken()
	if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing|src.Rasenganon)
		return
	else
		src<<"Segure Z para carregar o rasenshuriken!";src.RasenganCharge=1;src.Rasenganon=1;src.RasenganType=300
		var/A='Icons/Jutsus/Rasenshuriken.dmi';src.overlays-=A;src.overlays+=A;flick("Power",A)
		while(src.Rasenganon)
			src.SoundEngine('SFX/Rasenshuriken.mp3',5,50)
			if(!src.RasenganCharge)
			//	src.RasenganD-=10
				src.RasenganD-=20
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					src.RasenganD=0
				if(src.RasenganD<=0)
					if(src.DRasenganCounter>0)
						src.DRasenganCounter=0;src.overlays-='Icons/Jutsus/Rasenshuriken.dmi'
					src.overlays-='Icons/Jutsus/Rasenshuriken.dmi';src<<"Seu rasenshuriken ficou sem chakra...";src.Rasenganon=0
			sleep(8)
mob/proc/DoubleRasengan()
	if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing)
		return
	else
		if(src.Rasenganon&&!src.RasenganCharge)
			var/A='Icons/Jutsus/KatonRasengan.dmi'
			var/D='Icons/Jutsus/FuutonRasengan.dmi'
			src.overlays-='Icons/Jutsus/Rasengan5.dmi'
			src.overlays-='Icons/Jutsus/Rasengan6.dmi'
			var/B='Icons/Jutsus/Rasengan2.dmi'
			var/C='Icons/Jutsus/OdamaRasengan.dmi'
			var/E='Icons/Jutsus/Rasengan4.dmi'
			src.overlays-=B
			src.overlays+=B
			src.overlays-=A
			src.overlays-=D
			src.overlays-=C
			src.overlays+=E
			src<<"Você adiciona outro rasengan a sua mão!"
			src.DRasenganCounter=2
			src.SoundEngine('SFX/RasCharge.wav',7,75)
			src.RasenganType=50
			src.RasenganD=(src.RasenganD/1.25)//src.RasenganD*2
/*Giant Rasengan:
Increases the size of the current Rasengan causing it to do massive damage.
*/
mob/proc/Giant_Rasengan()
	if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing)
		return
	else
		if(src.Rasenganon&&!src.RasenganCharge)
			src.ChakraDrain(75000)
			var/A='Icons/Jutsus/KatonRasengan.dmi'
			var/D='Icons/Jutsus/FuutonRasengan.dmi'
			src.overlays-='Icons/Jutsus/Rasengan5.dmi'
			var/B='Icons/Jutsus/Rasengan2.dmi'
			var/C='Icons/Jutsus/OdamaRasengan.dmi'
			var/E='Icons/Jutsus/Rasengan4.dmi'
			src.overlays-=B
			src.overlays-=A
			src.overlays-=D
			src.overlays-=E
			src.overlays+=C
			src<<"O tamanho de seu Rasengan dobra de tamanho!"
			src.SoundEngine('SFX/RasCharge.wav',7,75)
			src.RasenganType+=0.5
			src.RasenganD=src.RasenganD*2

/*Fire Rasengan:
Fire based version.
*/
mob/proc/KRasengan()
	if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing|src.Rasenganon)
		return
	else
		src<<"Mantenha a tecla Z para carregar o seu Rasengan!";src.RasenganCharge=1;src.RasenganType=100;src.Rasenganon=1;
	//	var/A='Icons/Jutsus/KatonRasengan.dmi';
	//	src.overlays-=A;
	//	src.overlays+=A;
	//	flick("Power",A)
		src.overlays-='Icons/Jutsus/Rasengan6.dmi'
		src.overlays+='Icons/Jutsus/Rasengan6.dmi'
		while(src.Rasenganon)
			src.SoundEngine('SFX/RasCharge.wav',100)
			if(!src.RasenganCharge)
//				src.RasenganD-=10
				src.RasenganD-=20
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					src.RasenganD=0
				if(src.RasenganD<=0)
					src.overlays-='Icons/Jutsus/KatonRasengan.dmi';
					src.overlays-='Icons/Jutsus/Rasengan6.dmi'
					src<<"Your Rasengan ran out of energy!";
					src.Rasenganon=0
			sleep(8)
/*
/*Wind Rasengan:
Wind based version.
*/
*/
mob/proc/WRasengan()
	if(src.intank|src.Kaiten|src.sphere|src.inso|src.firing|src.Rasenganon)
		return
	else
		src<<"Segure Z para aumentar o poder do seu fuuton rasengan!";src.RasenganCharge=1;src.RasenganType=200;src.Rasenganon=1;var/A='Icons/Jutsus/Rasengan5.dmi';src.overlays-=A;src.overlays+=A;flick("Power",A)
		while(src.Rasenganon)
			src.SoundEngine('SFX/RasCharge.wav',50)
			src.RasenganD=src.RasenganD*1.5
			if(!src.RasenganCharge)
			//	src.RasenganD-=10
				src.RasenganD-=20
				for(var/obj/Jutsu/Kiriame/S2 in src.loc)
					src.RasenganD=0
				if(src.RasenganD<=0)
				//	src.overlays-='Icons/Jutsus/FuutonRasengan.dmi';
					src.overlays-='Icons/Jutsus/Rasengan5.dmi'
					src<<"Acabou a energia do seu rasengan!";
					src.Rasenganon=0
			sleep(8)
