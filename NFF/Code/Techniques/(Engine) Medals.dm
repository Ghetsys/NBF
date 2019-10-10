mob/proc
	AwardMedal(medal)
		var/hasmedalSharinganGain=world.GetMedal(medal,src)
		if(!hasmedalSharinganGain)
			world.SetMedal(medal,src)
			src<<"<font size=3><font color=yellow>Ganhou a Medalha de [medal]!"