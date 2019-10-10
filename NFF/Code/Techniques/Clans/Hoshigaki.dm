/*Hoshigaki not needed 2.0
mob/Hoshigaki/verb/CreateSameHade()
	var/CreatingSword=0
	if(CreatingSword)
		return
	CreatingSword=1
	usr<<"You begin to create the sword."
	sleep(100);CreatingSword=0
	usr.stamina-=2500
	var/obj/WEAPONS/Samehade/A=new();A.loc=usr
*/
mob/proc/SamehadeReturn()
	for(var/obj/WEAPONS/Samehade/A in src.contents)
		if(A.Equipped)
			src<<"Você ja esta com a samehada equipada!";return
		else
			if(prob(50))
				src<<"Você retornou a samehada para sua mão!"
				A.Equipped=1
				src.WeaponInLeftHand="Samehade"
				src.WeaponInRightHand="Samehade"