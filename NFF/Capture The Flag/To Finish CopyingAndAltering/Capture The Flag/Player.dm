client
	Click(mob/C)
		..()
		var/D=get_dir(mob,C)
		var/obj/Bullet/B = new()
		B.loc=locate(mob.x,mob.y,mob.z)
		B.pixel_y=rand(-15,15)
		B.creator=mob
		walk(B,D)
	North()
		if(!mob.movement)
			if(mob.spectator)
				if(mob.eyey != world.maxy)
					mob.eyey++
			else
				return 0
		else
			return ..()
	South()
		if(!mob.movement)
			if(mob.spectator)
				if(mob.eyey != 1)
					mob.eyey--
			else
				return 0
		else
			return ..()
	East()
		if(!mob.movement)
			if(mob.spectator)
				if(mob.eyex != world.maxx)
					mob.eyex++
			else
				return 0
		else
			return ..()
	West()
		if(!mob.movement)
			if(mob.spectator)
				if(mob.eyex != 1)
					mob.eyex--
			else
				return 0
		else
			return ..()

mob
	var
//Color Format: 1=Red 0=Blue
		color="None"
		flags[0]
		movement=0
		spectator=0
		returnarea=0
		hp=100
		eyex=5
		eyey=5
		watch
		kills=0
		scores=0
		deaths=0
	proc
		UpdateScore()
			var
				bt="[bluescore]"
				rt="[redscore]"
				obj/Number/Red/r1 = new()
				obj/Number/Red/r2 = new()
				obj/Number/Red/r3 = new()
				obj/Number/Red/r4 = new()
				obj/Number/Blue/b1 = new()
				obj/Number/Blue/b2 = new()
				obj/Number/Blue/b3 = new()
				obj/Number/Blue/b4 = new()
			var/icon/I = icon('Icons.dmi',"Grass")
			I.DrawBox(rgb(192,192,192),0,0,32,32)
			r3.screen_loc="11,4"
			b3.screen_loc="11,3"
			r3.icon=I
			b3.icon=I
			src.client.screen+=r3
			src.client.screen+=b3
			//**Red**
			r1.icon_state="[copytext(rt,1,2)]R"
			if(redscore >= 10)
				var/icon/B1 = icon('Icons.dmi',"Grass")
				B1.DrawBox(null,0,0,32,32)
				B1.DrawBox(rgb(192,192,192),18,0,32,32)
				r4.icon=B1
				r4.screen_loc="10,4"
				r4.layer=MOB_LAYER+1
				src.client.screen+=r4
				r2.icon_state="[copytext(rt,2,3)]R"
				r1.screen_loc="11:-14,4"
				r2.screen_loc="11:6,4"
				src.client.screen+=r1
				src.client.screen+=r2
			else
				r1.screen_loc="11:3,4"
				src.client.screen+=r1

			//**Blue**
			b1.icon_state="[copytext(bt,1,2)]B"
			if(bluescore >= 10)
				var/icon/B2 = icon('Icons.dmi',"Grass")
				B2.DrawBox(null,0,0,32,32)
				B2.DrawBox(rgb(192,192,192),18,0,32,32)
				b4.icon=B2
				b4.screen_loc="10,3"
				b4.layer=MOB_LAYER+1
				src.client.screen+=b4
				b2.icon_state="[copytext(bt,2,3)]B"
				b1.screen_loc="11:-14,3"
				b2.screen_loc="11:6,3"
				src.client.screen+=b1
				src.client.screen+=b2
			else
				b1.screen_loc="11:3,3"
				src.client.screen+=b1

/*mob
	verb
		Red(R as num)
			redscore=R
		Blue(B as num)
			bluescore=B*/
