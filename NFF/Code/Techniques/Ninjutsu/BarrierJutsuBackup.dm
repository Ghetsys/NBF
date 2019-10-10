
obj/Barrier
	icon='Icons/Jutsus/Barrier.dmi'
	icon_state = ""
	density=1
	New()
		..()
		spawn(600)//So just incase the user bugs after a minute it will delete
			del(src)
obj/BarrierC
	icon='Barrier.dmi'
	icon_state = ""
	density=1
	opacity=1;
	New()
		..()
		spawn(6000)//So just incase the user bugs after a hour it will delete
			del(src)

mob/proc/BarrierBlock()
	src.ChakraDrain(3000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	var/obj/Barrier/b = new();
	b.loc=get_step(src,src.loc);
	b.dir=src.dir;
	flick("M",b);step(b,b.dir);
	src<<"You hold up a barrier click z to release";
	while(src.icon_state=="handseal")
		src.ChakraDrain(2000)
		sleep(10);
	del(b);

mob/proc/BarrierWall()
	src.ChakraDrain(10000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	var/obj/Barrier/a = new();a.loc=get_step(src,turn(src.dir,45));a.dir=src.dir;flick("M",a);step(a,a.dir);
	var/obj/Barrier/b = new();b.loc=get_step(src,src.dir);b.dir=src.dir;flick("M",b);step(b,b.dir);
	var/obj/Barrier/c = new();c.loc=get_step(src,turn(src.dir,-45));c.dir=src.dir;flick("M",c);step(c,c.dir);
	src<<"You hold up a barrier click z to release";
	while(src.icon_state=="handseal")
		src.ChakraDrain(3000)
		sleep(10);
	del(a);del(b);del(c);
mob/proc/BarrierTrap()
	src.ChakraDrain(15000)
	src.Target()
	if(src.ntarget)
		return
	var/mob/M=src.target
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	var/obj/Barrier/a = new();a.loc=get_step(M,turn(M.dir,90));a.dir=turn(M.dir,180);
	var/obj/Barrier/b = new();b.loc=get_step(M,M.dir);b.dir=turn(M.dir,180);
	var/obj/Barrier/c = new();c.loc=get_step(M,turn(M.dir,-90));c.dir=turn(M.dir,180);
	var/obj/Barrier/d = new();d.loc=get_step(M,turn(M.dir,180));c.dir=turn(M.dir,180);
	src<<"You hold [M] in a barrier click z to release";
	while(src.icon_state=="handseal")
		src.ChakraDrain(25000)
		sleep(10);
	del(a);del(b);del(c);del(d);
mob/proc/BarrierShield()
	src.ChakraDrain(15000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	var/obj/Barrier/a = new();a.loc=get_step(src,turn(src.dir,90));a.dir=turn(src.dir,-90);
	var/obj/Barrier/b = new();b.loc=get_step(src,src.dir);b.dir=turn(src.dir,180);
	var/obj/Barrier/c = new();c.loc=get_step(src,turn(src.dir,-90));c.dir=turn(src.dir,180);
	var/obj/Barrier/d = new();d.loc=get_step(src,turn(src.dir,180));c.dir=turn(src.dir,90);
	src<<"You hold up a barrier click z to release";
	while(src.icon_state=="handseal")
		src.ChakraDrain(7500)
		sleep(10);
	del(a);del(b);del(c);del(d);

var/list/Blist=new;
mob/proc/BarrierContainment()
	src.ChakraDrain(10000)
	view(10)<<"[src] is preforming a Barrier Jutsu!"
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	//var/obj/Barrier/a = new();a.loc=get_step(src,turn(src.dir,45));a.dir=src.dir;flick("M",a);step(a,a.dir);
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
	var/i=4;
	while(i>0)

		for(var/turf/T in range(7,src))
			if(src.dir==NORTH||src.dir==SOUTH)
				if(T.y==src.y&&!T.density)
					var/obj/BarrierC/a = new();a.loc=T;a.dir=src.dir;a.density=0;Blist.Add(a);
					step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);
			if(src.dir==WEST||src.dir==EAST)
				if(T.x==src.x&&!T.density)
					var/obj/BarrierC/a = new();a.loc=T;a.dir=src.dir;a.density=0;Blist.Add(a);
					step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);step(a,a.dir);
		i--;src.dir=turn(src.dir,90);
	for(var/obj/BarrierC/b in Blist)
		b.density=1;
	src<<"You hold up a barrier click z to release";
	while(src.chakra>0)
		src.ChakraDrain(1500)
		sleep(10);
		if(src.icon_state=="handseal")
			break;
		if(src.knockedout)
			break
	for(var/obj/BarrierC/b in Blist)
		del(b);


