mob/proc/DoIHavePaper()
	var/HavePaper=0
	for(var/obj/RandomEquipment/Paper/A in src.contents)
		HavePaper=1;A.Ammount-=1;A.ReCheckAmount()
	if(!HavePaper)
		src<<"Você ficou sem papel."
		src.PaperStyleDance=0


mob/var/tmp/PaperStyleDance=0
obj/Jutsu/Paper
	icon='Icons/Jutsus/PaperObjects.dmi'
	JutsuLevel=1
	density=1

	Butterfly_Dance
		density=0
		layer=MOB_LAYER+1
		icon_state="butterflydance"
	Butterflies
		density=0
		layer=MOB_LAYER+1
		icon_state="butterfly"
		var/FirstSpawned
		New()
			..()
			spawn()
				while(src)
					if(src.FirstSpawned)
						step_rand(src)
						sleep(rand(2,4))
					else
						step_rand(src)
						for(var/mob/M in view(3,src))
							if(M.client)
								M<<"Existe um ninja de [M.Village] em [M.x],[M.y]."
						sleep(100)
			spawn(200)
				del(src)
	Person_Explosive
		density=0
		layer=MOB_LAYER+1
		icon_state="Person1"
		New()
			if(prob(50))
				icon_state="Person2"
			..()
			spawn()
				if(prob(40))
					icon_state="Person2"
			spawn(rand(200,350))
				del(src)
		DblClick()
			if(src.Owner==usr&&usr.Charging&&usr.PaperStyleDance)
				usr.chakra-=115
				src.Explode()
		proc
			Explode()
				var/obj/Jutsu/Explosion/K=new()
				K.loc=src.loc
				K.Owner=src.Owner
				for(var/obj/Jutsu/Paper/Person_Explosive/P in oview(1,src))
					if(prob(25))
						P.Explode()
				del(src)


	OffenciveButterflies
		density=0
		layer=MOB_LAYER+1
		icon_state="butterfly"
		var/FirstSpawned
		New()
			..()
			spawn()
				while(src)
					for(var/mob/A in view(2,src))
						if(A.client&&A!=src.Owner)
							A.DamageProc(5,"Health",src.Owner)
					if(src.FirstSpawned)
						step_rand(src)
						sleep(rand(3,4))
					else
						step_rand(src)
						for(var/mob/M in view(3,src))
							if(M.client&&M!=src.Owner)
								M.DamageProc(10,"Health",src.Owner)
						sleep(15)
			spawn(200)
				del(src)
	Shuriken
		icon_state="shuriken"
		var/Rating=1
		New()
			..()
			spawn(25)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					del(src)
				Rating=round(Rating/10)
				if(Rating<1) Rating=1
				if(Rating>13) Rating=13
				Rating=Rating*0.01
				var/damage=round(M.maxhealth*Rating)
				M.DamageProc(damage,"Health",O)
				if(damage>0)
					spawn() M.Bloody();M.Bloody();M.Bloody()
					view(M)<<output("<font color=#BB0000 size=2>[M] foi acertado pelo ataque de papel tirando!([damage]) de dano</font>","Attack")
				del(src)
	Spear
		icon_state="Spearthrow"
		New()
			..()
			flick("Spearthrowform",src)
			spawn(5)
				walk(src,src.dir)
		Bump(A)
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner
				if(M.Kaiten||M.sphere)
					del(src)
				var/damage=round(M.maxhealth*0.5,M.maxhealth*0.55)
				M.DamageProc(damage,"Health",O)
				spawn() M.Bloody();M.Bloody();M.Bloody()
				var/turf/X=src.loc
				spawn() src.CreateSmoke("Strong")
				spawn() X.PushBackOfEpicProportions(src.Owner)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)

mob/proc/PaperStyleDance(Uses)
	if(src.PaperStyleDance!=0)
		src<<"Você saiu da posição."
		src.PaperStyleDance=0
		for(var/obj/SkillCards/Paper_Mode/P in src.LearnedJutsus)
			if(!P.Delay)
				P.DelayIt(300,usr)
		return
	var/A=round(Uses/100)
	if(A<1)
		A=1
	src<<"Você entra no modo Controlador de papel"
	src<<"Guardando como agora se tornou uma tática de papel desaparecendo."
	src.PaperStyleDance=A
	if(A>5)
		src<<"Você Progrediu tanto no controle da Papel que você nem sequer têm que se proteger, ele só vai ter papel de você e você vai evitar qualquer acerto. "
	while(src.PaperStyleDance)
		src.chakra-=30
		src.DoIHavePaper()
		if(src.knockedout)
			src.PaperStyleDance=0
		sleep(100)
	src<<"Voce Saiu da posiçao."
/*Paper Shuriken:
Projectile Shuriken, increases in damage and quantity with use.
*/
mob/proc/Paper_Shuriken(Uses)
	if(!src.PaperStyleDance)
		src<<"Você precisa estar usando o Estilo dança de Papel!";return
	src.ChakraDrain(10000)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Paper/Shuriken/C=new()
	spawn(2)
		C.loc=src.loc;C.dir=src.dir;C.Owner=src;walk(C,C.dir);C.Rating=Uses
		if(Uses>100)
			var/obj/Jutsu/Paper/Shuriken/A=new();A.loc=src.loc;A.dir=src.dir;A.Owner=src;A.Rating=Uses;A.dir=turn(A.dir,45);step(A,A.dir);A.dir=src.dir;walk(A,A.dir);var/obj/Jutsu/Paper/Shuriken/B=new();B.loc=src.loc;B.dir=src.dir;B.Owner=src;B.Rating=Uses;B.dir=turn(B.dir,45);step(B,B.dir);B.dir=src.dir;walk(B,B.dir)
			if(Uses>500)
				var/obj/Jutsu/Paper/Shuriken/D=new();D.loc=src.loc;D.dir=src.dir;D.Owner=src;D.Rating=Uses;D.dir=turn(D.dir,45);step(D,D.dir);walk(D,D.dir);var/obj/Jutsu/Paper/Shuriken/E=new();E.loc=src.loc;E.dir=src.dir;E.Owner=src;E.Rating=Uses;E.dir=turn(E.dir,45);step(E,E.dir);walk(E,E.dir)
	flick("Attack1",src)

/*Paper Butterflies:
Releases Butterflies that reveal the locations of outside people.
*/
mob/proc/Paper_Butterflies(Uses)
	if(!src.PaperStyleDance)
		src<<"Você precisa estar usando o Estilo dança de Papel!";return
	src.ChakraDrain(10000)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	src<<"Pare de usar o  selo de mão"
//	spawn()
	var/AmountOfPaperButterflies=(Uses/10+1)
	if(Uses<1)
		Uses=1
	if(AmountOfPaperButterflies>50)
		AmountOfPaperButterflies=50
	while(AmountOfPaperButterflies>0)
		sleep(1)
		if(src.icon_state!="handseal"||!src.PaperStyleDance)
			AmountOfPaperButterflies=0
	//	var/obj/Jutsu/Paper/Butterflies/C=new();
		var/obj/Jutsu/Paper/OffenciveButterflies/C=new();
		C.Owner=src
		C.loc=src.loc //I indented one over from here
		C.FirstSpawned=1;
		spawn(15)//was 15
			C.FirstSpawned=0
		AmountOfPaperButterflies-=1
	while(src.icon_state=="handseal")
		src.ChakraDrain(3500)
		sleep(10)
	spawn(30)
		for(var/obj/Jutsu/Paper/Butterflies/A in world)
			if(A.Owner==src)
				del(A) //to here
		for(var/obj/Jutsu/Paper/Butterflies/A in world)
			if(A.Owner==src)
				del(A) //to here
/*Butterfly Dance:
A butterfly circles an opponent making it so that they're always targetted.
*/
mob/var/tmp/ButterflyDance=0
mob/proc/Butterfly_Dance()
	src.Target()
	if(src.ntarget)
		return
	src.ChakraDrain(10000)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/mob/M=src.target
	src<<"As Borboletas se reunirao em torno de [M]!";M<<"As Borboletas estao Ao seu redor"
	M.overlays-='Icons/Jutsus/PaperObjects2.dmi';M.overlays+='Icons/Jutsus/PaperObjects2.dmi';M.ButterflyDance=1
	spawn(600)
		if(M)
			src<<"As Borbolestas Desaparecerão";M<<"As Borbolestas Desaparecerão"
			M.overlays-='Icons/Jutsus/PaperObjects2.dmi';M.ButterflyDance=0
/*Butterfly Destruction:
Creates a mass torrent of butterflies that the user can double click to destroy.
*/
mob/var/ExplosionOn=0
mob/proc/Person_Explosion(Uses)
	var/BonusSize=(Uses/200)
	if(BonusSize>=5)
		BonusSize=5
	src.ChakraDrain(30000)
	src.Handseals(40-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/turf/T in view(5+BonusSize))//was Originally 30
		if(prob(45))
			var/obj/Jutsu/Paper/Person_Explosive/S=new()
			S.Owner=src
			S.loc=T
	ExplosionOn=1
	view()<<"[src] cria uma grande quantidade de papel no céu!"
	src<<"Mantenha apertando a tecla Z e de um  duplo clique sobre uma folha de papel para explodir! "
/*Divine Spear:
Shhots a hella powerful spear forward that will...destroy the enemy, kay lol.
*/
mob/proc/Divine_Spear()
	if(!src.PaperStyleDance)
		src<<"Você precisa estar usando o Estilo dança de Papel!";return
	src.ChakraDrain(50000)
	src.Handseals(5-src.HandsealSpeed)
	if(src.HandsSlipped) return
	var/obj/Jutsu/Paper/Spear/A=new();A.dir=src.dir;A.loc=src.loc;step(A,A.dir);A.Owner=src
	src.icon_state="handseal";src.Frozen=1;src.firing=1
	spawn(5)
		src.icon_state="";src.Frozen=0;src.firing=0