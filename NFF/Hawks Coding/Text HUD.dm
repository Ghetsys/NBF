mob/var/list/LowCpuHuds=list()

obj/HUD/ActualHUD/LowCpuHud
	icon='NewText.dmi'
	//layer=HUD_LAYER+1
	New(hudx,hudxpix,hudy,hudypix,letter)
		src.icon_state=letter
		src.screen_loc="[hudx]:[hudxpix],[hudy]:[hudypix]"

mob/proc/CreateHUDText(hudx,hudxpix,hudy,hudypix,varID,mobID,newID)
	if(!mobID)	mobID=src
	if(!newID)	newID=varID
	new/datum/LowCpuHudDatum(src,varID,hudx,hudxpix,hudy,hudypix,mobID,newID)

mob/proc/UpdateHUDText(var/varID)
	for(var/datum/LowCpuHudDatum/D in src.LowCpuHuds)	if(D.ID==varID)	D.Refresh()

datum/LowCpuHudDatum
	var/name;var/ID
	var/mob/srcID;var/mob/mobID
	var/x;var/xo;var/y;var/yo
	var/list/ThisHud=list()
	New(mob/SrcID,varID,hudx,hudxpix,hudy,hudypix,mob/MobID,newID)
		src.srcID=SrcID;src.name=varID;src.ID=newID
		src.mobID=MobID;srcID.LowCpuHuds+=src
		src.x=hudx;src.y=hudy
		src.xo=hudxpix;src.yo=hudypix
		src.Refresh()
	proc/Delete()
		if(!mobID || !srcID || !srcID.client)	return
		for(var/obj/HUD/ActualHUD/LowCpuHud/O in src.ThisHud)
			src.ThisHud-=O;del O
		del src
	proc/Hide()
		if(!mobID || !srcID || !srcID.client)	return
		for(var/obj/HUD/ActualHUD/LowCpuHud/O in src.ThisHud)	O.icon_state="invis"
	proc/Refresh()
		if(!mobID || !srcID || !srcID.client)	return
		var/word2write=mobID.vars["[name]"];word2write="[word2write]"
		if(src.ThisHud.len<length(word2write))	src.Create()
		for(var/obj/HUD/ActualHUD/LowCpuHud/O in src.ThisHud)	O.icon_state="invis"
		var/firstpos=0
		while(srcID)
			firstpos+=1
			if(firstpos>src.ThisHud.len)	return
			var/letter=copytext(word2write,firstpos,firstpos+1)
			if(!letter)	return
			var/obj/O=src.ThisHud[firstpos]
			if(O)	O.icon_state=letter
	proc/Create()
		if(!mobID || !srcID || !srcID.client)	return
		var/firstpos=0;var/Icon2Use
		for(var/obj/HUD/ActualHUD/LowCpuHud/O in src.ThisHud)
			src.ThisHud-=O;del O
		var/hudx=x;var/hudxpix=xo;var/hudy=y;var/hudypix=yo
		var/word2write=mobID.vars["[name]"]
		if(!isnum(word2write))	Icon2Use='NewText.dmi'
		word2write="[word2write]"
		while(srcID)
			firstpos+=1
			var/letter=copytext(word2write,firstpos,firstpos+1)
			if(!letter)	return
			var/obj/HUD/ActualHUD/LowCpuHud/O=new (hudx,hudxpix,hudy,hudypix,letter)
			if(Icon2Use)	O.icon=Icon2Use
			srcID.client.screen+=O;src.ThisHud+=O
			hudxpix+=8
			if(hudxpix>=24)
				hudx+=1;hudxpix=(20-hudxpix)*-1






//Some Notes About Using This System
//Make sure you set the player's client.view to a number
//Otherwise the calculations will be incorrect!
//ie: usr.client.view=5

//Current Functions:
//Use a > to drop to the next line

//Note: Program Not Functional With client.views Greater then 10

//You Shouldnt Need to Mod Anything In This File!
//unless maybe you change icons or something <.<

mob/proc/ShowBG()//this proc sets up the BG behind the text
	new/obj/OnScreenText/BG(src,1,1,"bl")
	new/obj/OnScreenText/BG(src,1,2,"tl")
	var/newx=2
	while(newx<=src.client.view*2)
		new/obj/OnScreenText/BG(src,newx,1,"bm")
		new/obj/OnScreenText/BG(src,newx,2,"tm")
		newx+=1
	new/obj/OnScreenText/BG(src,src.client.view*2+1,1,"br")
	new/obj/OnScreenText/BG(src,src.client.view*2+1,2,"tr")

mob/proc/ShowText(var/text2show,var/list/textlist=new/list())
	src.showing_window=1
	var/hudx=1
	var/hudxo=-8
	var/hudyo=14
	var/FirstPos=0
	var/LastFirstPos=0
	var/WordCount=0
	for(var/obj/OnScreenText/O in src.client.screen)	del O
	src.ShowBG()
	new/obj/OnScreenText/Refresh(src,1,text2show,textlist)
	new/obj/OnScreenText/Refresh(src,2,text2show,textlist)
	while(1)
		hudxo+=8
		FirstPos+=1
		var/letter=copytext(text2show,FirstPos,FirstPos+1)
		var/obj/OnScreenText/Character/C=new/obj/OnScreenText/Character(hudx,hudxo,hudyo)
		C.icon_state=letter
		C.ID=WordCount
		src.client.screen+=C
		if(hudxo==24)//moves to next x and resets x offset, every 4 letters
			hudx+=1
			hudxo=-8
		if(letter==">")//checks the character for carriage returns
			hudx=usr.client.view*2+1
			hudxo=-8
			LastFirstPos=FirstPos+1
		if(hudx==usr.client.view*2+1 && hudxo==-8)//word wrappage!
			hudyo-=14
			hudx=1
			hudxo=-8
			FirstPos=LastFirstPos
			for(var/obj/OnScreenText/Character/C1 in src.client.screen)
				if(C1.ID==WordCount)	del C1
		if(letter==" ")
			WordCount+=1
			LastFirstPos=FirstPos
		if(hudyo<-28)//get any messages that didnt fit on the screen for later
			if(textlist.len>=1)//this re-orders the messages correctly
				var/list/templist=new/list()
				templist+=textlist
				textlist=new/list()
				var/newstring=copytext(text2show,FirstPos,length(text2show)+1)
				textlist+=newstring
				textlist+=templist
			else
				textlist+=copytext(text2show,FirstPos,length(text2show)+1)
			break
		if(letter=="")	break
	new/obj/OnScreenText/Next(src,textlist)


//required variables and objects reside below!!
mob/var
	textspeed=0
	showing_window=0
mob/proc
	ClearOnScreenText()
		for(var/obj/OnScreenText/O in src.client.screen)	del(O)
		for(var/obj/HUD/ActualHUD/Menu/Other/O in src.client.screen)	del(O)
obj/OnScreenText
	icon='text bg.dmi'
	layer=20
	New(mob/M,var/SX,var/SY,var/IS)
		src.icon_state=IS
		screen_loc = "[SX],[SY]"
		src.layer+=rand(1,5)
		M.client.screen+=src
	Character
		icon='NewText.dmi'
		layer=30
		var/ID=0
		New(var/newx,var/newxo,var/newyo)
			src.layer+=rand(1,5)
			src.screen_loc="[newx]:[newxo],2:[newyo]"
	Next
		icon_state="next"
		layer=40
		var/list/textlist=new/list()
		New(mob/M,var/list/nextTL)
			src.screen_loc="[M.client.view*2+1],1"
			src.textlist=nextTL
			M.client.screen+=src
		Click()
			if(src.textlist.len==0)//no more messages!
				usr.showing_window=0
				for(var/obj/OnScreenText/O in usr.client.screen)	del O
			else
				var/text2show
				for(var/O in src.textlist)
					text2show=O
					src.textlist-=O
					break
				usr.ShowText(text2show,src.textlist)
	Refresh
		var/text2show
		var/textlist
		layer=40
		mouse_opacity=2
		New(mob/M,var/newx,var/text2show2,var/textlist2)
			src.text2show=text2show2
			src.textlist=textlist2
			src.icon_state="refresh[newx]"
			src.screen_loc="[newx],1"
			M.client.screen+=src
		Click()
			usr.ShowText(src.text2show,src.textlist)
	BG
obj/HUD/ActualHUD/Menu/Other
	Character
		icon='NewText.dmi'
		New(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/IS)
			src.layer+=1
			src.icon_state=IS
			src.screen_loc = "[hudx]:[hudxpix],[hudy]:[hudypix]"

mob/proc/WriteLine(var/hudx,var/hudxpix,var/hudy,var/hudypix,var/word)
	var/firstpos=0
	word=uppertext(word)
	while(src)
		firstpos+=1
		var/letter=copytext(word,firstpos,firstpos+1)
		if(letter==" ")
			hudxpix+=8
			continue
		if(letter=="")
			return
		src.client.screen+=new/obj/HUD/ActualHUD/Menu/Other/Character(hudx,hudxpix,hudy,hudypix,letter)
		hudxpix+=8
		if(hudxpix>=24)
			hudxpix=(32-hudxpix)*-1
			hudx+=1