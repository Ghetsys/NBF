mob/AkatMember/verb
/*	Astral(mob/M in world)
		set category = "Akatsuki"
		if(!src.AstralWindow)
			AstralWindow = 1
			var/obj/AstralWindow/AA=new();AA.screen_loc = "13,7";src.client.screen += AA;AA.Watch = M;AA.RSpot=list("x"=-3,"y"=3)
			var/obj/AstralWindow/AB=new();AB.screen_loc = "14,7";src.client.screen += AB;AB.Watch = M;AB.RSpot=list("x"=-2,"y"=3)
			var/obj/AstralWindow/AC=new();AC.screen_loc = "15,7";src.client.screen += AC;AC.Watch = M;AC.RSpot=list("x"=-1,"y"=3)
			var/obj/AstralWindow/AD=new();AD.screen_loc = "16,7";src.client.screen += AD;AD.Watch = M;AD.RSpot=list("x"=0,"y"=3)
			var/obj/AstralWindow/AE=new();AE.screen_loc = "17,7";src.client.screen += AE;AE.Watch = M;AE.RSpot=list("x"=1,"y"=3)
			var/obj/AstralWindow/AF=new();AF.screen_loc = "18,7";src.client.screen += AF;AF.Watch = M;AF.RSpot=list("x"=2,"y"=3)
			var/obj/AstralWindow/AG=new();AG.screen_loc = "19,7";src.client.screen += AG;AG.Watch = M;AG.RSpot=list("x"=3,"y"=3)

			var/obj/AstralWindow/BA=new();BA.screen_loc = "13,6";src.client.screen += BA;BA.Watch = M;BA.RSpot=list("x"=-3,"y"=2)
			var/obj/AstralWindow/BB=new();BB.screen_loc = "14,6";src.client.screen += BB;BB.Watch = M;BB.RSpot=list("x"=-2,"y"=2)
			var/obj/AstralWindow/BC=new();BC.screen_loc = "15,6";src.client.screen += BC;BC.Watch = M;BC.RSpot=list("x"=-1,"y"=2)
			var/obj/AstralWindow/BD=new();BD.screen_loc = "16,6";src.client.screen += BD;BD.Watch = M;BD.RSpot=list("x"=0,"y"=2)
			var/obj/AstralWindow/BE=new();BE.screen_loc = "17,6";src.client.screen += BE;BE.Watch = M;BE.RSpot=list("x"=1,"y"=2)
			var/obj/AstralWindow/BF=new();BF.screen_loc = "18,6";src.client.screen += BF;BF.Watch = M;BF.RSpot=list("x"=2,"y"=2)
			var/obj/AstralWindow/BG=new();BG.screen_loc = "19,6";src.client.screen += BG;BG.Watch = M;BG.RSpot=list("x"=3,"y"=2)

			var/obj/AstralWindow/CA=new();CA.screen_loc = "13,5";src.client.screen += CA;CA.Watch = M;CA.RSpot=list("x"=-3,"y"=1)
			var/obj/AstralWindow/CB=new();CB.screen_loc = "14,5";src.client.screen += CB;CB.Watch = M;CB.RSpot=list("x"=-2,"y"=1)
			var/obj/AstralWindow/CC=new();CC.screen_loc = "15,5";src.client.screen += CC;CC.Watch = M;CC.RSpot=list("x"=-1,"y"=1)
			var/obj/AstralWindow/CD=new();CD.screen_loc = "16,5";src.client.screen += CD;CD.Watch = M;CD.RSpot=list("x"=0,"y"=1)
			var/obj/AstralWindow/CE=new();CE.screen_loc = "17,5";src.client.screen += CE;CE.Watch = M;CE.RSpot=list("x"=1,"y"=1)
			var/obj/AstralWindow/CF=new();CF.screen_loc = "18,5";src.client.screen += CF;CF.Watch = M;CF.RSpot=list("x"=2,"y"=1)
			var/obj/AstralWindow/CG=new();CG.screen_loc = "19,5";src.client.screen += CG;CG.Watch = M;CG.RSpot=list("x"=3,"y"=1)

			var/obj/AstralWindow/DA=new();DA.screen_loc = "13,4";src.client.screen += DA;DA.Watch = M;DA.RSpot=list("x"=-3,"y"=0)
			var/obj/AstralWindow/DB=new();DB.screen_loc = "14,4";src.client.screen += DB;DB.Watch = M;DB.RSpot=list("x"=-2,"y"=0)
			var/obj/AstralWindow/DC=new();DC.screen_loc = "15,4";src.client.screen += DC;DC.Watch = M;DC.RSpot=list("x"=-1,"y"=0)
			var/obj/AstralWindow/DD=new();DD.screen_loc = "16,4";src.client.screen += DD;DD.Watch = M;DD.RSpot=list("x"=0,"y"=0)
			var/obj/AstralWindow/DE=new();DE.screen_loc = "17,4";src.client.screen += DE;DE.Watch = M;DE.RSpot=list("x"=1,"y"=0)
			var/obj/AstralWindow/DF=new();DF.screen_loc = "18,4";src.client.screen += DF;DF.Watch = M;DF.RSpot=list("x"=2,"y"=0)
			var/obj/AstralWindow/DG=new();DG.screen_loc = "19,4";src.client.screen += DG;DG.Watch = M;DG.RSpot=list("x"=3,"y"=0)

			var/obj/AstralWindow/EA=new();EA.screen_loc = "13,3";src.client.screen += EA;EA.Watch = M;EA.RSpot=list("x"=-3,"y"=-1)
			var/obj/AstralWindow/EB=new();EB.screen_loc = "14,3";src.client.screen += EB;EB.Watch = M;EB.RSpot=list("x"=-2,"y"=-1)
			var/obj/AstralWindow/EC=new();EC.screen_loc = "15,3";src.client.screen += EC;EC.Watch = M;EC.RSpot=list("x"=-1,"y"=-1)
			var/obj/AstralWindow/ED=new();ED.screen_loc = "16,3";src.client.screen += ED;ED.Watch = M;ED.RSpot=list("x"=0,"y"=-1)
			var/obj/AstralWindow/EE=new();EE.screen_loc = "17,3";src.client.screen += EE;EE.Watch = M;EE.RSpot=list("x"=1,"y"=-1)
			var/obj/AstralWindow/EF=new();EF.screen_loc = "18,3";src.client.screen += EF;EF.Watch = M;EF.RSpot=list("x"=2,"y"=-1)
			var/obj/AstralWindow/EG=new();EG.screen_loc = "19,3";src.client.screen += EG;EG.Watch = M;EG.RSpot=list("x"=3,"y"=-1)

			var/obj/AstralWindow/FA=new();FA.screen_loc = "13,2";src.client.screen += FA;FA.Watch = M;FA.RSpot=list("x"=-3,"y"=-2)
			var/obj/AstralWindow/FB=new();FB.screen_loc = "14,2";src.client.screen += FB;FB.Watch = M;FB.RSpot=list("x"=-2,"y"=-2)
			var/obj/AstralWindow/FC=new();FC.screen_loc = "15,2";src.client.screen += FC;FC.Watch = M;FC.RSpot=list("x"=-1,"y"=-2)
			var/obj/AstralWindow/FD=new();FD.screen_loc = "16,2";src.client.screen += FD;FD.Watch = M;FD.RSpot=list("x"=0,"y"=-2)
			var/obj/AstralWindow/FE=new();FE.screen_loc = "17,2";src.client.screen += FE;FE.Watch = M;FE.RSpot=list("x"=1,"y"=-2)
			var/obj/AstralWindow/FF=new();FF.screen_loc = "18,2";src.client.screen += FF;FF.Watch = M;FF.RSpot=list("x"=2,"y"=-2)
			var/obj/AstralWindow/FG=new();FG.screen_loc = "19,2";src.client.screen += FG;FG.Watch = M;FG.RSpot=list("x"=3,"y"=-2)

			var/obj/AstralWindow/GA=new();GA.screen_loc = "13,1";src.client.screen += GA;GA.Watch = M;GA.RSpot=list("x"=-3,"y"=-3)
			var/obj/AstralWindow/GB=new();GB.screen_loc = "14,1";src.client.screen += GB;GB.Watch = M;GB.RSpot=list("x"=-2,"y"=-3)
			var/obj/AstralWindow/GC=new();GC.screen_loc = "15,1";src.client.screen += GC;GC.Watch = M;GC.RSpot=list("x"=-1,"y"=-3)
			var/obj/AstralWindow/GD=new();GD.screen_loc = "16,1";src.client.screen += GD;GD.Watch = M;GD.RSpot=list("x"=0,"y"=-3)
			var/obj/AstralWindow/GE=new();GE.screen_loc = "17,1";src.client.screen += GE;GE.Watch = M;GE.RSpot=list("x"=1,"y"=-3)
			var/obj/AstralWindow/GF=new();GF.screen_loc = "18,1";src.client.screen += GF;GF.Watch = M;GF.RSpot=list("x"=2,"y"=-3)
			var/obj/AstralWindow/GG=new();GG.screen_loc = "19,1";src.client.screen += GG;GG.Watch = M;GG.RSpot=list("x"=3,"y"=-3)
		else
			for(var/obj/AstralWindow/W in src.client.screen)
				W.Watch = M
		usr << "Click the generated screen to turn off the window!"

*/
	Generate_Barrier_Seal()
		set category = "Akatsuki"
		if(!src.AkatBarrier)
			src.Handseals(15-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.ChakraDrain(45000)
			flick(src,"beastman")
			src.AkatBarrier=1
			var/obj/Akatsuki/BarrierSeal/S = new(src.loc);S.Owner=src
		else
			switch(input("Are you sure you wish to shut off your barrier?") in list("Yes","No"))
				if("No")
					return
			src.AkatBarrier=0



mob/var/tmp/AstralWindow=0
obj/AstralWindow
	layer = 9999999999999999999999999999999999999999
	var
		mob/Watch
		list/RSpot = list("x","y")
	Del()
		sleep(5)
		..()
	Click()
		usr.AstralWindow = 0
		for(var/obj/AstralWindow/W in usr.client.screen)
			spawn() del(W)
	New()
		..()
		spawn()
			if(RSpot["x"] == 3 || RSpot["x"] == -3 || RSpot["y"] == 3 || RSpot["y"] == -3)
				var/icon/Outline = icon('BaseSelectStuff.dmi');Outline.SwapColor(rgb(34,34,34,161),rgb(0,0,0,0))
				if(RSpot["x"] == 3)
					if(RSpot["y"] == 3)
						Outline = icon(Outline,"box4")
					else if(RSpot["y"] == -3)
						Outline = icon(Outline,"box1")
					else
						Outline = icon(Outline,"box8")
				else if(RSpot["x"] == -3)
					if(RSpot["y"] == 3)
						Outline = icon(Outline,"box3")
					else if(RSpot["y"] == -3)
						Outline = icon(Outline,"box2")
					else
						Outline = icon(Outline,"box6")
				else if(RSpot["y"] == 3)
					Outline = icon(Outline,"box7")
				else if(RSpot["y"] == -3)
					Outline = icon(Outline,"box5")
				src.overlays += Outline
			src.underlays += icon('white.dmi')
			while(src)
				if(src.Watch)
					var/turf/T = locate(src.Watch.x+RSpot["x"],src.Watch.y+RSpot["y"],src.Watch.z)
					if(T)
						src.icon = T.pic3()
					else
						src.icon = null
					if(RSpot["y"] == -3)
						if(RSpot["x"] == 1)
							src.maptext = "<font color=black><b>[src.Watch.x]</b></font>"
						if(RSpot["x"] == 2)
							src.maptext = "<font color=black><b>[src.Watch.y]</b></font>"
						if(RSpot["x"] == 3)
							src.maptext = "<font color=black><b>[src.Watch.z]</b></font>"
				else
					src.icon = null
				sleep(5)

turf
	proc/pic3()
		var/icon/i = icon(src.icon,src.icon_state,src.dir)
		for(var/o in src.overlays)
			i.Blend(icon(o:icon,o:icon_state,o:dir,1),ICON_OVERLAY)
		for(var/atom/o in src.contents)
			var/DIR = o.dir
			if(DIR == SOUTHWEST || DIR == NORTHWEST) DIR = WEST
			if(DIR == SOUTHEAST || DIR == NORTHEAST) DIR = EAST
			var/icon/i2 = icon(o.icon,o.icon_state,DIR,1)
			for(var/o2 in o.overlays)
				i2.Blend(icon(o2:icon,o:icon_state,DIR,1),ICON_OVERLAY)
			for(var/o2 in o.underlays)
				i2.Blend(icon(o2:icon,o:icon_state,DIR,1),ICON_UNDERLAY)
			i.Blend(i2,ICON_OVERLAY)
		return i




mob/var/tmp/AkatBarrier=0

obj/Akatsuki/BarrierSeal
	icon= 'summoncircle.dmi'
	icon_state="summon"
	var/Owner
	var/list
		Seals = list()		//
	New()
		..()
		src.icon_state="summon"
		spawn()
			sleep(11)
			var/mob/O = src.Owner
			if(src)
				src.icon_state=""
				var/Ring = getring(src,13)+(getring(src,14)-getring(src,13)) //To fill in the gaps...
				var/Circle = getcircle(src,14)
				var/found = 0
				var/list/Caught = list()
				for(var/turf/T in Circle)	//Don't want to create another barrier, if one's already set!
					for(var/obj/Akatsuki/BarrierSeal/P in T)
						if(P != src)
							found = 1
							src.Seals.Add(P)
					for(var/mob/C in T)	//Escape should be impossible! >:O
						if(!C.AkatsukiMember) Caught.Add(C)
				if(!found)
					for(var/turf/T in Ring)
						var/mob/AkatRingBarrier/B = new(T)
						B.SourceofSeal = src
				var/On=1
				while(On)
					if(!O) On=0
					if(!O.AkatBarrier || O.Dead || O.chakra<=0 ) On=0
					if(!On)
						break
					O.ChakraDrain(5000/(3*src.Seals.len+1))
					sleep(10)
				O.AkatBarrier=0
				del(src)
	Del()
		if(src.Seals.len)
			var/obj/Akatsuki/BarrierSeal/W = pick(src.Seals)
			for(var/mob/AkatRingBarrier/A in world)	//Add the barriers to a random seal in the list..
				if(A.SourceofSeal == src)
					A.SourceofSeal = W
			for(var/obj/Akatsuki/BarrierSeal/P in src.Seals)//Remove this seal from all the others.
				P.Seals.Remove(src)
				src.Seals.Remove(P)
			return ..()
		else
			for(var/mob/AkatRingBarrier/A in world)
				if(A.SourceofSeal == src)
					A.loc = null
			..()
mob
	AkatRingBarrier
		name = "Barrier"
		health=650
		Endurance = 1000
		maxhealth=650
		layer = 999999999999999999999999999999999999999999999999999999999999999999999999999
		Frozen=1
		density=0
		opacity = 1
		mouse_opacity = 2
		var/obj/Akatsuki/BarrierSeal/SourceofSeal
		Cross(atom/movable/O)
			if(ismob(O))
				if(O:AkatsukiMember)
					return ..()
				if(prob(30)) O << "A force prevents you from crossing!"
			return O.Bump(src)
		MouseDown()
			return
		Death(mob/M)
			if(src.health<1)
				viewers(src)<<"The barrier fades..."
				del(src)
			else
				return