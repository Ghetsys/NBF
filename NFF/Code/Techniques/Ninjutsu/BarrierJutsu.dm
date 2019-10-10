
obj/Barrier
//	icon='Barrier.dmi'
//	icon_state = ""
	icon='Icons/Jutsus/BarrierIcon.dmi'
	icon_state="BegBarrier"
	density=1
	New()
		..()
		spawn(600)//So just incase the user bugs after a minute it will delete
			del(src)
mob/proc/BarrierBlock()
	src.ChakraDrain(3000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
	var/obj/Barrier/b = new();
	b.loc=get_step(src,src.loc);
	b.dir=src.dir;
	flick("M",b);step(b,b.dir);
	src<<"Você criou uma barreira,aperte Z para desfaze-la";
	while(src.icon_state=="handseal")
		src.ChakraDrain(1500)
		src.firing=1
		sleep(10);
	src.firing=0
	del(b);

mob/proc/BarrierWall()
	src.ChakraDrain(10000)
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
	var/obj/Barrier/a = new();a.loc=get_step(src,turn(src.dir,45));a.dir=src.dir;flick("M",a);step(a,a.dir);
	var/obj/Barrier/b = new();b.loc=get_step(src,src.dir);b.dir=src.dir;flick("M",b);step(b,b.dir);
	var/obj/Barrier/c = new();c.loc=get_step(src,turn(src.dir,-45));c.dir=src.dir;flick("M",c);step(c,c.dir);
	src<<"Você criou uma barreira,aperte Z para desfaze-la";
	while(src.icon_state=="handseal")
		src.ChakraDrain(1500)
		src.firing=1
		sleep(10);
	src.firing=0
	del(a);del(b);del(c);

mob/proc/BarrierTrap()
	src.ChakraDrain(15000)
	//src.Target()
//	if(src.ntarget)
	//	return
	var/mob/M=src.target
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal"
	if(M.dir==NORTHEAST||M.dir==SOUTHEAST) M.dir=EAST
	if(M.dir==NORTHWEST||M.dir==SOUTHWEST) M.dir=WEST
	var/obj/Barrier/a = new();a.loc=get_step(M,turn(M.dir,90));a.dir=turn(M.dir,180);
	var/obj/Barrier/b = new();b.loc=get_step(M,M.dir);b.dir=turn(M.dir,180);
	var/obj/Barrier/c = new();c.loc=get_step(M,turn(M.dir,-90));c.dir=turn(M.dir,180);
	var/obj/Barrier/d = new();d.loc=get_step(M,turn(M.dir,180));c.dir=turn(M.dir,180);
	src<<"Você prendeu [M] Em uma barreira aperte Z para desfaze-la";
	while(src.icon_state=="handseal")
		src.ChakraDrain(1500)
		src.firing=1
		sleep(10);
	src.firing=0
	del(a);del(b);del(c);del(d);

mob/proc/BarrierShield()
	src.ChakraDrain(15000)
	view(10)<<"[src] esta fazendo um jutsu de barreira";
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
	src.Frozen=1;
	src.icon_state="handseal";
	var/i=4;
	while(i>0)
		for(var/turf/T in range(1,src))
			if(src.dir==NORTH||src.dir==SOUTH)
				if(T.y==src.y&&!T.density)
					var/obj/Barrier/a = new();a.loc=T;a.dir=src.dir;a.density=0;Blist.Add(a);
					step(a,a.dir);
			if(src.dir==WEST||src.dir==EAST)
				if(T.x==src.x&&!T.density)
					var/obj/Barrier/a = new();a.loc=T;a.dir=src.dir;a.density=0;Blist.Add(a);
					step(a,a.dir);
		i--;src.dir=turn(src.dir,90);
	sleep(3);
	for(var/obj/Barrier/b in Blist)
		b.density=1;
	src.Frozen=0;
	src<<"Você criou uma barreira, aperte Z para desfaze-la";
	while(src.icon_state=="handseal")
		src.ChakraDrain(1500)
		src.firing=1
		sleep(10);
	src.firing=0
	for(var/obj/Barrier/b in Blist)
		del(b);

obj/BarrierC
	icon='Barrier.dmi'
	icon_state = ""
	density=0;
	opacity=1;
	New()
		..()
		spawn(6000)//So just incase the user bugs after a hour it will delete
			del(src)

var/list/Blist=new;
mob/proc/BarrierContainment()
	src.ChakraDrain(10000)
	view(10)<<"[src] Esta fazendo um jutsu de barreira";
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return
	if(src.dir==NORTHEAST||src.dir==SOUTHEAST) src.dir=EAST
	if(src.dir==NORTHWEST||src.dir==SOUTHWEST) src.dir=WEST
	src.Frozen=1;
	src.icon_state="handseal"
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
	sleep(22);
	for(var/obj/BarrierC/b in Blist)
		b.density=1;
	src.Frozen=0;
	src<<"Você criou uma barreira, aperte Z para desfaze-la";
	while(src.chakra>0)
		src.ChakraDrain(1500)
		sleep(10);
		if(src.icon_state=="handseal")
			break;
	for(var/obj/BarrierC/b in Blist)
		del(b);