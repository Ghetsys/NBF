var
	list
		LeafTerritory = list("")
		RainTerritory = list("")
		RockTerritory = list("")
		SoundTerritory = list("")




obj/ObjectTurfs
	density = 0
	var/Points = 0
	var/Counter = 0
	var/VillageConquered
	var/VillageConquering
	var/list/VillagersCapturing=list()
	var/mob/M
	var/Location
	New()
		..()
		spawn()
		//	if(src.z==4)
		//		world<<"Location is here."
		//		Location="here"
			while(src)
				sleep(2)
				for(M in oview(0,src))
					if(!(locate(M in VillagersCapturing)))
						if(VillageConquering!="")
							VillageConquering=""
							VillageConquering=M.Village
						VillagersCapturing+=M
					if(!(locate(M in loc)) && M in VillagersCapturing)
						VillagersCapturing-=M
						if(VillagersCapturing<=0)
							VillageConquering=""
							Points=0
					if(VillagersCapturing.len>=0&&VillageConquering!="")
						view(src)<<output("<font>You are conquering this land!</font>","Attack")
						Points += VillagersCapturing.len
						sleep(50)
