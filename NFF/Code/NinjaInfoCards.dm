mob/var
	ShowBuild = 1
	InfoCardVarient = "Default"
mob/proc/UpdateNinjaInfo()
	spawn()
		var/NAME = url_encode("[src.SecondName], [src.FirstName]")
		var/KEY = url_encode(src.key)
		var/Varient = url_encode(src.InfoCardVarient)
		var/Wins = src.challengeWins
		var/Loses = src.challengeLosses
		var/Elements = ""
		if(src.FireE)	Elements+="katon&"
		if(src.WaterE)	Elements+="suiton&"
		if(src.EarthE)	Elements+="doton&"
		if(src.LightningE)Elements+="raiton&"
		if(src.WindE)	Elements+="fuuton&"
		if(src.Clan=="Shiroi")	Elements+="hyuuton&"
		if(src.Clan=="Kusakin")	Elements+="mokuton&"
		src.pic()
		var/icon/I = icon(src.TIcon)
		src.TIcon=null
		var/IconInfo = ""
		var/y = 0
		while(y<32)
			var/x = 0
			while(x<32)
				var/Color = copytext(I.GetPixel(x+1,32-y),2)//Remove the "#" just to shorten it a bit.
				if(Color)
					IconInfo += "[x]x[y]=[Color=="FF0000"?"FE0000":Color]&"
					//Pure Red is darkened by an unnoticable ammount
				x++
			y++
		world.Export("http://theatrebox.net/NFF/Create.php?name=[NAME]&key=[KEY]&icon&[IconInfo]")
		world.Export("http://theatrebox.net/NFF/Create.php?name=[NAME]&key=[KEY]&infocard&varient=[Varient]&age=[src.Age]&kills=[src.kills]&deaths=[src.deaths]&wins=[Wins]&loses=[Loses]&bounty=[src.bounty]&village=[src.Village][src.Village==src.BeginningVillage?"":"ovillage=[src.BeginningVillage]&"]&[src.ShowBuild?"phy=[src.TaiSkill]&cap=[src.NinSkill]&con=[src.GenSkill]&":""][Elements]")



mob/GainedAfterLogIn/verb
	HideBuild()
		set name="Show/Hide Build"
		src<< url_encode(file2text(file("headband.dmi")))
		if(ShowBuild==1)
			ShowBuild=0;src<<"You are no longer showing your build, on your \"Ninja Info Card.\""
		else
			ShowBuild=1;src<<"You are now showing your build, on your \"Ninja Info Card.\""
	ShowMyInfoCard()
		set name = "See Info Card"
		var/HTML = {"<html><body style="background:#000;color:#FFF;">
		<center><img src="http://theatrebox.net/NFF/InfoCards/[usr.key]</center>
		Link to image: <input type=text value="http://theatrebox.net/NFF/InfoCards/[usr.key]">
		</body></html>"}
		src << browse(HTML,"window=NinjaInfoCards")




