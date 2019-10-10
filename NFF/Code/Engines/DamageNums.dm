obj
	Supplemental
		DamageNum
			icon='DamageNums.dmi'
			density=0
			layer=5	//keeps it above the players and enemies
			New(var/r,var/g,var/b)
				spawn(10) del src	//auto delete just in case!
				for(var/v in CachedIcons)	if(v=="Damage[r][g][b]")
					src.icon=CachedIcons[v];return
				src.icon+=rgb(r,g,b)
				CachedIcons+="Damage[r][g][b]"
				CachedIcons["Damage[r][g][b]"]=src.icon
mob/proc/DamageShow(var/damage,var/VarR=200,VarG=0,VarB=0)	//input the amount, then rgb values to change color
	if(istext(damage))	//if your send the proc something like Block it will display that instead of #s
		var/obj/O=new/obj/Supplemental/DamageNum	//creates the new object
		O.loc=locate(src:x,src:y,src:z)	//locates it at the damaged person
		flick("[damage]",O)	//this flashes the Block icon state, or whichever u sent
		return	//then return because we dont want to show numbers
	damage=min(999999,damage)	//999,999 is the highest number BYOND can accurately track
	damage=num2text(damage)	//this converts the number to text so we can chop it up
	var/pxplus=-7	//offsets the damage by -7 pixels
	var/spot=0	//used for cutting out the text
	while(pxplus<(length(damage)*7)-7)	//this makes it show itll only display a max of 7 numbers
		spot+=1	//determines where we're cutting
		pxplus+=7	//bump the pixel display by 7 each # so they dont overlap
		var/obj/Supplemental/DamageNum/O=new()	//create the new number
		O.pixel_x+=pxplus	//offset the numbers pixel display
		O.loc=locate(src:x,src:y,src:z)	//locate it at the person being hurt
		O.icon+=rgb(VarR,VarG,VarB)	//changes the color of the damage so we can use the same icon for healing, criticals, etc
		flick("[copytext(damage,spot,spot+1)]",O)	//this flashes the cut number of damage for this obj
