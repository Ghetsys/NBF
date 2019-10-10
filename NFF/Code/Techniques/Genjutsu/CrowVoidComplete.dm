mob/proc/CrowVoidGenjutsu()
	if(src.firing==1||src.Kaiten==1)
		return
	if(1==1)//else
		//src.ChakraDrain(1000)
		//src.Handseals(1)
		src.icon_state="handseal"
		var/J=1
		var/F=1
		var/X=src.x
		var/Y=src.y
		var/Z=src.z
		var/K=1
		var/C=5;//Must be an odd number.
		var/G=-1*(C/2)
		var/H=G;
		var/Size=(src.GenjutsuKnowledge/100)+1
		var/obj/Voids/A=new()
		A.Ownner=src
		src.Frozen=1
		while(G<=C)
			while(H<=C)
				var/mob/npcs/AttackCrows/B=new();B.loc=locate(X+G,Y+H,Z);B.Ownner=usr
				H++
			H=-1*(C/2)
			G++
		while(J<Size+1)
			for(var/turf/D in oview(J,src))
				if(!(D in oview(J-1)))
					var/obj/BlueB/T=new();T.loc=D;T.Ownner=src
			J++
		while(F==1)
			for(var/mob/M in oview(Size,src))
				if(M==src)
					M.stamina-=0;
				if(istype(M,/mob/npcs/AttackCrows))
					M.stamina-=0;
				else
					M.stamina-=(src.GenSkill/10)*(src.MentalDamage+1);
					K+=1
					sleep(2)
					M.client.screen+=A
					for(var/mob/npcs/AttackCrows/B in view(Size,src))
						B.victomm=M;
				if(K==4)
					//view(M)<<output("<font color=purple>[M] the darkness begins to consume you.</font>","Attack")
					usr << output("<font color=purple>[M] the darkness begins to consume you.</font>", "output")
					K=0
			src.chakra-=1//Drain for the jutsu
			if(src.chakra<=0||src.knockedout==1||src.icon_state==""||src.Frozen==0)//Checks for if out of chakra
				if(chakra<=0)
					src.chakra=0;//if lower then zero sets it to zero so it not be in neg.
				sleep(2)
				src.icon_state=""
				src.Frozen=0
				for(A in world)
					if(A.Ownner==src)
						del(A)
				for(var/mob/npcs/AttackCrows/B in world)
					if(B.Ownner==usr)
						del(B)
				for(var/obj/BlueB/T in world)
					if(T.Ownner==usr)
						del(T)
				F=0;
			sleep(2)
	src.firing=0;

obj/BlueB
	icon='Blue.dmi'
	layer = MOB_LAYER-2
	var/Ownner

mob/proc/OvenGenjutsu()
	if(src.firing==1||src.Kaiten==1)
		return
	if(1==1)//else
		//src.ChakraDrain(1000)
		//src.Handseals(1)
		src.icon_state="handseal"
		var/X=1
		var/F=1
		var/Size=(src.GenjutsuKnowledge/100)+1
		var/K=1
		var/obj/OvanScreen/A=new()
		A.Ownner=src
		src.Frozen=1
		while(X<Size+1)
			for(var/turf/D in oview(X,src))
				if(!(D in oview(X-1)))
					var/obj/BlueB/T=new();T.loc=D;T.Ownner=src
			X++
		while(F==1)
			for(var/mob/M in oview(Size,src))
				M.health-=4;
				M.stamina-=(src.GenSkill/10)*(src.MentalDamage+1);
				K+=1
				M.client.screen+=A
				if(K==4)
					//view(M)<<output("<font color=purple>[M] has been poisoned.</font>","Attack")
					M << "<font color=red>[M] you feel the temperature increasing.</font.>"//output("<font color=red>[M] you feel the temperature increasing.</font>", "output")
					K=0
				sleep(1)
			src.chakra-=10//Drain for the jutsu
			if(src.chakra<=0||src.knockedout==1||src.icon_state==""||src.Frozen==0)//Checks for if out of chakra
				if(chakra<=0)
					src.chakra=0;//if lower then zero sets it to zero so it not be in neg.
				sleep(2)
				src.Frozen=0
				src.icon_state=""
				for(A in world)
					if(A.Ownner==src)
						del(A)
			//	M.client.screen-=A
				for(var/obj/BlueB/T in world)
					if(T.Ownner==usr)
						del(T)
				F=0;
			sleep(2)
	src.firing=0;
obj/Voids
	icon='Black.dmi'
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER-2
	var/Ownner
obj/OvanScreen
	icon='lava.dmi'
	screen_loc = "1,1 to 19,19"
	layer = MOB_LAYER-2
	var/Ownner
mob/npcs/AttackCrows
	icon='Crows.dmi'
	var/human = 1
	density=0
	NPC = 1
	health = 1000
	Running=1;
	layer = MOB_LAYER+2
	var/Ownner
	var/victomm
	New()
		..()
		spawn()
			while(src)
				spawn(8)
				if(usr.Running==1)
					icon_state="running"//put the running state here.
				else
					icon_state=""//put the walking state here.
				walk_rand(src,3)
				for(var/mob/M in oview(2,src))
					if((M!=src.Ownner)&&(!istype(M,/mob/npcs/AttackCrows)))
						M<<output("<font color=White>You have been bitten by a Crow.</font>","Attack")
						M.stamina-=(src.GenSkill/10)*(src.MentalDamage+1);
					if(src.victomm==M)
						src.icon='Crows.dmi'
					else
						src.icon='trans.dmi'
				sleep(2)
				if(health<=0)
					del(src)

//mob/verb/CrowVoid()
	//src.CrowVoidGenjutsu()