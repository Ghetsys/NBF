/*Tag Explosion:
Detonates all tags in the world, tag by tag.
*/
mob/proc/TagExplosion()
	src.ChakraDrain(15000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	for(var/obj/ExplodingTag/T in world)
		if(T.Owner==usr)
			if(T.tagset)
				spawn()
					T.Explode()


/*Rain of Tags:
User hurls at least 20 tags into the field. Holds still for a minute(chance for the opponent to run away). Then can blow them up.
*/
mob/proc/RainOfTags()
	set background=1
	if(!(locate(/obj/ExplodingTag) in usr.contents))
		usr<<"You need exploding tags to use this Jutsu!";
		return
	for(var/obj/ExplodingTag/O in usr.contents)
		if(O.ammount<=29)
			usr<<"You need at least 30 tags to use this Jutsu!"
			return
	src.ChakraDrain(65000)
	for(var/turf/Z in oview(7,src))
		if(prob(22))
			var/obj/ExplodingTag/B=new()
			B.loc=Z
			B.layer=usr.layer
			B.Owner=usr
			B.tagset=1
			B.icon_state="fire"
			for(var/obj/ExplodingTag/P in usr.contents)
				P.ammount-=1
				if(P.ammount<=0)
					P.ammount=0
					del(P)
	flick("zan",src)
	flick("zan",src)
	view()<<"[src] dispatches a large amount of tags!"
//	src.UpdateInv()