/*mob/proc
	Fumma_Mandara()
		src.Target()
		if(src.ntarget)
			return
		var/mob/M=src.target
		src.ChakraDrain(25000)
		if(M in oview(7))
			src.Handseals(35-src.HandsealSpeed)
			if(src.HandsSlipped) return
			var/obj/Jutsu/Fumma/Mandara/A=new();A.loc = locate(M.x,M.y,M.z);A.Owner=src;A.health=500;A.JutsuLevel=1
			src<<"The rocks form around [M]!";src.icon_state="bind";sleep(5);A.icon_state = "DoBind"
			sleep(310);M.FrozenBind="";M.EarthBindedBy=""