/*Meld Wire:
Turns all Wires dense.
*/
mob/proc/HariganeGappei()
	src.ChakraDrain(10000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/obj/NinjaEquipment/TheWires/A in world)
		if(A.Owner==src)
			A.density=1
	src<<"Você deixa as cordas densas!"

/*Escaping Skill:
Allows you to Escape from Wire Capture.
*/
mob/proc/Nawanuke()
	for(var/obj/NinjaEquipment/TheWires/A in src.loc)
		if(A.density)
			A.density=0;return
		src<<"Você se solta das cordas!"
		del(A)
	if(src.FrozenBind=="Wire")
		src.FrozenBind="";src.Stun=0;src.caughtby=""