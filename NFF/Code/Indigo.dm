mob/var
	IndigoMember=0
	IndigoLeader=0
	IndigoRank="N/A"

obj/Clothes/IndigoCloak
//	icon='Icons/New Base/Clothing/Official Clothing/AKAS.dmi'
	icon='Icons/New Base/Clothing/Official Clothing/AKAS.dmi'//Just a place holder for now =_=
	name="Indigo Cloak"
	bodyarea="TorsoTop"
	ArmorAddOn=0
	layer=MOB_LAYER+1
	worn=0
	Wear()
		..()
obj/Clothes/IndigoHat
//	icon='Icons/New Base/Clothing/Official Clothing/AKAH.dmi'
	icon='Icons/New Base/Clothing/Official Clothing/AKAH.dmi'//Just a place holder for now =_=
	name="Indigo Hat"
	bodyarea="FaceTop"
	layer=MOB_LAYER+1
	worn=0
	Wear()
		if(src.worn == 1)
			src:worn = 0
			usr.name = usr.oname
			usr.overlays -= src.icon
			usr << "You remove the [src.name]."
			src.suffix = ""
		else
			src:worn = 1
			usr.oname = usr.name
			usr.name = "Indigo"
			usr.overlays += src.icon
			usr << "You wear the [src.name]."
			src.suffix = "Equipped"

mob/Indigo
	verb/IndigoInvite(mob/M in world)
		set category="Indigo"
		set name="Invite to Indigo"
		switch(input(M,"Would you like to join Indigo?","Join?","") in list ("Yes","No"))
			if("Yes")
				if(!M.IndigoMember&&!M.IndigoLeader)
					M.IndigoMember=1
					M.verbs+=typesof(/mob/IndigoMember/verb)
					var/obj/Clothes/IndigoCloak/A=new()
					A.Move(M)
					var/obj/Clothes/IndigoHat/A2=new()
					A2.Move(M)
				else
					usr<<"Cannot be done, they're already in the Organization."
			if("No")
				usr<<"[M] denied your invite."

	verb/IndigoBoot(mob/M in world)
		set category="Indigo"
		set name="Boot from Indigo"
		M.IndigoMember=0
		M.IndigoRank=""
		M.verbs-=typesof(/mob/IndigoMember/verb)
	verb/AssignARank(mob/M in world)
		set category="Indigo"
		set name="Assign Member Rank"
		var/Rank=input(usr,"What rank do you want to assign [M]?",) in list ("Demon","Protector")
		M.IndigoRank=Rank
		for(var/mob/X in world)
			if(X.IndigoMember)
				X<<"<font size=2><font face=trebuchet MS><font color=red>[M] is now Rank [Rank] in Indigo."
mob/IndigoMember
	verb/IndigoSay(msg as text)
		set category="Indigo"
		set name="Indigo Say"
		set desc = "Say something to every member of the Indigo"
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
			if(M.IndigoMember||M.IndigoLeader)
				M<<"<font face=trebuchet MS><font color=red size=2>(Indigo Say)</font><font size=1> - ([usr.IndigoRank]) - [usr.oname]</font><font face=trebuchet MS><font color=gray>: [msg]</font>"
	verb/IndigoWho()
		set category="Indigo"
		set name="Indigo Who"
		usr<<"<font color=red>Online Indigo Members -"
		for(var/mob/M in world)
			if(M.IndigoMember&&M.client){usr<<"<font color = gray>[M.oname]"}
	verb/Generate_Indigo_Seal()
		set category = "Indigo"
		if(!src.IndigoBarrier)
			src.Handseals(15-src.HandsealSpeed)
			if(src.HandsSlipped) return
			src.ChakraDrain(35000)
			flick(src,"beastman")
			src.IndigoBarrier=1
			var/obj/Indigo/BarrierSeal/S = new(src.loc);S.Owner=src
		else
			switch(input("Are you sure you wish to shut off your barrier?") in list("Yes","No"))
				if("No")
					return
			src.IndigoBarrier=0













mob/var/tmp/IndigoBarrier=0

obj/Indigo/BarrierSeal
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
					for(var/obj/Indigo/BarrierSeal/P in T)
						if(P != src)
							found = 1
							src.Seals.Add(P)
					for(var/mob/C in T)	//Escape should be impossible! >:O
						if(!C.IndigoMember) Caught.Add(C)
				if(!found)
					for(var/turf/T in Ring)
						var/mob/IndigoRingBarrier/B = new(T)
						B.SourceofSeal = src
				var/On=1
				while(On)
					if(!O) On=0
					if(!O.IndigoBarrier || O.Dead || O.chakra<=0 ) On=0
					if(!On)
						break
					O.ChakraDrain(7000/(2*src.Seals.len+1))
					sleep(10)
				O.IndigoBarrier=0
				del(src)
	Del()
		if(src.Seals.len)
			var/obj/Indigo/BarrierSeal/W = pick(src.Seals)
			for(var/mob/IndigoRingBarrier/A in world)	//Add the barriers to a random seal in the list..
				if(A.SourceofSeal == src)
					A.SourceofSeal = W
			for(var/obj/Indigo/BarrierSeal/P in src.Seals)//Remove this seal from all the others.
				P.Seals.Remove(src)
				src.Seals.Remove(P)
			return ..()
		else
			for(var/mob/IndigoRingBarrier/A in world)
				if(A.SourceofSeal == src)
					A.loc = null
			..()
mob
	IndigoRingBarrier
		name = "Barrier"
		health=3000
		Endurance = 1000
		maxhealth=3000
		layer = 999999999999999999999999999999999999999999999999999999999999999999999999999
		Frozen=1
		density=0
		opacity = 1
		mouse_opacity = 2
		var/obj/Indigo/BarrierSeal/SourceofSeal
		Cross(atom/movable/O)
			if(ismob(O))
				if(O:IndigoMember)
					return ..()
				if(prob(30)) O << "A force prevents you from crossing!"
			return O.Bump(src)
		MouseDown()
			return
		Death(mob/M)
			if(src.health<1)
				viewers(src)<<"The barrier fades..."
				src.loc=null
				del(src)
			else
				return