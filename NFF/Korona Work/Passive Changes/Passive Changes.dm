/* Reflex Update/changes

There will be 3 levels of reflex 1 , 2 , 3

If the users physique is > then the opponent then the users has a 10% dodge rate

If the users reflex is 1 and opponent is 0 then the user has a +15% dodge rate

If the users reflex is 2 and opponent is 0 then the user has a +35% dodge rate

If the users reflex is 3 and the opponent is 0 then the user has a +50% dodge rate

Max dodge rate is 60%
-----------------------------------------------------------

Now it would work the same way for the opponent if they had more reflex.

Now if the user has 2 reflex and opponent has 1 then the difference is 1

so 2 - 1 = 1 so +15% dodge rate for user. The opponent would have a 0 dodge rate.

I think that is fairly clear. DO YOU THINK THIS IS A GOOD CHANGE?

Also 3 quests would be added to the game to increase reflex.


reflex 1 req = tai >= 15
reflex 2 req = tai >= 25
reflex 3 req = tai >= 35

*/

/*
mob/proc/DodgeCalculation(mob/M,Involvement="Taijutsu")
	var/UserHittingRatio=src.Reflex
	var/EnemyDodgingRatio=M.Reflex
	var/PlusAmount
	var/Constant=1.5 // Change if you need to


	if(UserHittingRatio>EnemyDodgingRatio)
		PlusAmount=round(EnemyDodgingRatio/UserHittingRatio)*100
		if(PlusAmount>90) PlusAmount=90

	if(UserHittingRatio<EnemyDodgingRatio)
		PlusAmount=round(UserHittingRatio/EnemyDodgingRatio)*100
		PlusAmount=100-PlusAmount
		PlusAmount=Constant*PlusAmount

	if(prob(PlusAmount)&&M.FrozenBind=="")
		M.Dodging=1



mob/proc/Dodge2()
	if(src.FrozenBind!=""||src.name=="Sand"&&!src.client)
		return
	src<<"You dodge the technique!"
	flick("zan",src)
	src.Dodging=0
	var/TheProbabilityOfReflexIncreasing=100
	var/HowMuchItDivides=(src.Reflex/100)*2
	TheProbabilityOfReflexIncreasing=TheProbabilityOfReflexIncreasing-HowMuchItDivides
	if(prob(TheProbabilityOfReflexIncreasing)&&src.Reflex<1000)
		src.Reflex+=pick(0.1,0.2,0.5)
mob/proc/Dodge()
	if(src.FrozenBind!=""||src.Frozen||src.resting||src.Stun>1)
		return
	src<<"You dodge the technique!"
	if(src.Dodging==2)
		var/TheProbabilityOfReflexIncreasing=50
		var/HowMuchItDivides=(src.Reflex/100)*2
		TheProbabilityOfReflexIncreasing=TheProbabilityOfReflexIncreasing-HowMuchItDivides
		if(prob(TheProbabilityOfReflexIncreasing)&&src.Reflex<1000)
			src.Reflex+=pick(0.1,0.2,0.5)
	if(src.Clan=="Hyuuga"&&src.bya)
		if(prob(5)&&src.Rejection<5)
			src.Rejection+=0.1
		if(prob(5)&&src.SensoryRange<5)
			src.SensoryRange+=0.1
	src.Dodging=0
	flick("zan",src)
	if(src.target)
		src.dir=get_dir(src,src.target)
		var/mob/M=src.target
		if(M.dir==NORTH)
			var/turf/T = locate(M.x,M.y+1,M.z)
			if(!T.density)
				src.loc=locate(M.x,M.y+1,M.z)
		if(M.dir==EAST)
			var/turf/T = locate(M.x+1,M.y,M.z)
			if(!T.density)
				src.loc=locate(M.x+1,M.y,M.z)
		if(M.dir==SOUTH)
			var/turf/T = locate(M.x,M.y-1,M.z)
			if(!T.density)
				src.loc=locate(M.x,M.y-1,M.z)
		if(M.dir==WEST)
			var/turf/T = locate(M.x-1,M.y,M.z)
			if(!T.density)
				src.loc=locate(M.x-1,M.y,M.z)
		if(M.dir==NORTHEAST)
			var/turf/T = locate(M.x+1,M.y+1,M.z)
			if(!T.density)
				src.loc=locate(M.x+1,M.y+1,M.z)
		if(M.dir==NORTHWEST)
			var/turf/T = locate(M.x-1,M.y+1,M.z)
			if(!T.density)
				src.loc=locate(M.x-1,M.y+1,M.z)
		if(M.dir==SOUTHEAST)
			var/turf/T = locate(M.x-1,M.y-1,M.z)
			if(!T.density)
				src.loc=locate(M.x-1,M.y-1,M.z)
		if(M.dir==SOUTHWEST)
			var/turf/T = locate(M.x+1,M.y-1,M.z)
			if(!T.density)
				src.loc=locate(M.x+1,M.y-1,M.z)
	else
		var/turf/T = locate(src.x+1,src.y,src.z)
		if(!T.density)
			src.loc=locate(src.x+1,src.y,src.z)
mob/proc/Quick()
	if(src.knockedout||src.Stun>0||src.FrozenBind!=""||src.Frozen)
		return
	flick("zan",src)
	var/turf/T=get_steps(src,src.dir,2)
	for(var/turf/LA in getline(src,T))
		for(var/atom/A in LA)
			if(A.density&&A!=src)
				return
		if(istype(LA,/turf/Buildings/zDensity))
			return
		else if(LA.density)
			return
		else
			usr.loc=LA
		sleep(0)
input

dodgerate
reflex1,2 3

*/
/*
mob/proc/DodgeCalculation(mob/M,Involvement="Taijutsu")
	var/UserHittingRatio=src.Reflex
	var/EnemyDodgingRatio=M.Reflex
	var/PlusAmount
	var/Constant=1.5 // Change if you need to
	if(UserHittingRatio>EnemyDodgingRatio)
		PlusAmount=round(EnemyDodgingRatio/UserHittingRatio)*100
		if(PlusAmount>90) PlusAmount=90
	if(UserHittingRatio<EnemyDodgingRatio)
		PlusAmount=round(UserHittingRatio/EnemyDodgingRatio)*100
		PlusAmount=100-PlusAmount
		PlusAmount=Constant*PlusAmount
	if(prob(PlusAmount)&&M.FrozenBind=="")
		M.Dodging=1
*/

\

mob/var/reflexOneQuest
mob/var/reflexNew=0
mob/var/tmp/dodgeRate= 0
mob/var/reflexQuestThreeCounter = 0

mob/proc/DodgeCalculation(mob/M,Involvement="Taijutsu")  //mob/M = Dodger. src = Attacker
	src.dodgeRate = 0

	if(src.shari)
		if(src.SharinganMastery>1)
			src.dodgeRate+=2
		if(src.SharinganMastery>30)
			src.dodgeRate+=2
		if(src.SharinganMastery>60)
			src.dodgeRate+=3
		if(src.SharinganMastery>200)
			src.dodgeRate+=3

	if(src.bya)
		if(src.ByakuganMastery>25)
			src.dodgeRate+=2
		if(src.ByakuganMastery>50)
			src.dodgeRate+=3
		if(src.ByakuganMastery>75)
			src.dodgeRate+=5
	if(src.shika)
		src.dodgeRate+=10
	if(src.Trait=="Speedy")
		src.dodgeRate += 15

	if(src.Trait2=="Sound Mind")
		src.dodgeRate -= 7
	src.dodgeRate += (src.reflexNew*15)


	//this is for M
	M.dodgeRate = 0

	if(M.tai>src.tai)
		M.dodgeRate += 10
	else
		src.dodgeRate += 10

	M.dodgeRate += (M.reflexNew*15)

	if(M.TaijutsuStyle=="Hansha")
		M.dodgeRate+=20
	if(M.shika)
		M.dodgeRate+=5
	if(M.Trait=="Speedy")
		M.dodgeRate+=15

	if(M.Trait2=="Sound Mind")
		M.dodgeRate-=7

	if(M.shari)
		if(M.SharinganMastery>1)
			M.dodgeRate+=2
		if(M.SharinganMastery>30)
			M.dodgeRate+=2
		if(M.SharinganMastery>60)
			M.dodgeRate+=3
		if(M.SharinganMastery>200)
			M.dodgeRate+=3

	if(M.bya)
		if(M.ByakuganMastery>25)
			M.dodgeRate+=2
		if(M.ByakuganMastery>50)
			M.dodgeRate+=3
		if(M.ByakuganMastery>75)
			M.dodgeRate+=5

	if(prob(10+max(((M.dodgeRate-src.dodgeRate)/2),-8)))
		if(!M.Dodging)
			M.Dodging = 1

mob/proc/Dodge()
	if(src.FrozenBind!=""||src.Frozen||src.resting||src.Stun>1)
		return
	if(src.Suiken)
		src<<"Você grosseiramente desvia da tecnica!"
	else
		src<<"Você esquivou da técnica!"
	if (src.Dodging==1)
		if(src.Clan=="Hyuuga"&&src.bya)
			if(prob(5)&&src.Rejection<5)
				src.Rejection+=0.1
			if(prob(5)&&src.SensoryRange<5)
				src.SensoryRange+=0.1
		src.Dodging=0
		flick("zan",src)
		if(src.target)
			src.dir=get_dir(src,src.target)
			var/mob/M=src.target
			if(M.dir==NORTH)
				var/turf/T = locate(M.x,M.y+1,M.z)
				if(!T.density)
					src.loc=locate(M.x,M.y+1,M.z)
			if(M.dir==EAST)
				var/turf/T = locate(M.x+1,M.y,M.z)
				if(!T.density)
					src.loc=locate(M.x+1,M.y,M.z)
			if(M.dir==SOUTH)
				var/turf/T = locate(M.x,M.y-1,M.z)
				if(!T.density)
					src.loc=locate(M.x,M.y-1,M.z)
			if(M.dir==WEST)
				var/turf/T = locate(M.x-1,M.y,M.z)
				if(!T.density)
					src.loc=locate(M.x-1,M.y,M.z)
			if(M.dir==NORTHEAST)
				var/turf/T = locate(M.x+1,M.y+1,M.z)
				if(!T.density)
					src.loc=locate(M.x+1,M.y+1,M.z)
			if(M.dir==NORTHWEST)
				var/turf/T = locate(M.x-1,M.y+1,M.z)
				if(!T.density)
					src.loc=locate(M.x-1,M.y+1,M.z)
			if(M.dir==SOUTHEAST)
				var/turf/T = locate(M.x-1,M.y-1,M.z)
				if(!T.density)
					src.loc=locate(M.x-1,M.y-1,M.z)
			if(M.dir==SOUTHWEST)
				var/turf/T = locate(M.x+1,M.y-1,M.z)
				if(!T.density)
					src.loc=locate(M.x+1,M.y-1,M.z)
		else
			var/turf/T = locate(src.x+1,src.y,src.z)
			if(!T.density)
				src.loc=locate(src.x+1,src.y,src.z)

mob/proc/Dodge2()
	if(src.FrozenBind!=""||src.name=="Sand"&&!src.client)
		return
	if(src.Suiken)
		src<<"Você grosseiramente desvia da tecnica!"
	else
		src<<"Você esquivou da técnica!"
	flick("zan",src)
	src.Dodging=0

mob/proc/Quickness()
	if(src.knockedout||src.Stun>0||src.FrozenBind!=""||src.Frozen||src.icon_state=="Power"||src.icon_state=="handseal")
		return
	if(src.z==1)
		return
	if(src.z==35)
		return
	flick("zan",src)
	var/turf/NewLoc=get_steps(src,src.dir,(1+round(src.runningspeed/10)))
	for(var/turf/T in getline(src,NewLoc))
		if(!T.density)
			src.loc=T
		else
			return
	src.loc=NewLoc
mob/proc/Quick()
	if(src.knockedout||src.Stun>0||src.FrozenBind!=""||src.Frozen)
		return
	if(src.z==1)
		return
	flick("zan",src)
	var/mob/M=src
	var/ex;var/ey
	if(M.dir==NORTH)
		for(var/turf/T in range(2,M))
			if(T.x==M.x&&T.y>M.y)
				if(T.density) return
		for(var/obj/O in range(2,M))
			if(O.x==M.x&&O.y>M.y)
				if(O.density) return
		for(var/mob/P in range(2,M))
			if(P.x==M.x&&P.y>M.y)
				if(P.density) return
	if(M.dir==SOUTH)
		for(var/turf/T in range(12,M))
			if(T.x==M.x&&T.y<M.y)
				if(T.density) return
		for(var/obj/O in range(2,M))
			if(O.x==M.x&&O.y<M.y)
				if(O.density) return
		for(var/mob/P in range(2,M))
			if(P.x==M.x&&P.y<M.y)
				if(P.density) return
	if(M.dir==EAST)
		for(var/turf/T in range(2,M))
			if(T.y==M.y&&T.x>M.x)
				if(T.density) return
		for(var/obj/O in range(2,M))
			if(O.y==M.y&&O.x>M.x)
				if(O.density) return
		for(var/mob/P in range(2,M))
			if(P.y==M.y&&P.x>M.x)
				if(P.density) return
	if(M.dir==WEST)
		for(var/turf/T in range(2,M))
			if(T.y==M.y&&T.x<M.x)
				if(T.density) return
		for(var/obj/O in range(2,M))
			if(O.y==M.y&&O.x<M.x)
				if(O.density) return
		for(var/mob/P in range(2,M))
			if(P.y==M.y&&P.x<M.x)
				if(P.density) return
	if(M.dir==NORTH)
		var/turf/T = locate(M.x,M.y+2,M.z)
		if(!T) return
		if(T.x > world.maxx) ex=world.maxx
		else ex = T.x
		if(T.y > world.maxy) ey=world.maxy
		else ey = T.y
		if(T.density)
			return
	if(M.dir==EAST)
		var/turf/T = locate(M.x+2,M.y,M.z)
		if(!T) return
		if(T.x > world.maxx) ex=world.maxx
		else ex = T.x
		if(T.y > world.maxy) ey=world.maxy
		else ey = T.y
		if(T.density)
			return
	if(M.dir==SOUTH)
		var/turf/T = locate(M.x,M.y-2,M.z)
		if(!T) return
		if(T.x > world.maxx) ex=world.maxx
		else ex = T.x
		if(T.y > world.maxy) ey=world.maxy
		else ey = T.y
		if(T.density)
			return
	if(M.dir==WEST)
		var/turf/T = locate(M.x-2,M.y,M.z)
		if(!T) return
		if(T.x > world.maxx) ex=world.maxx
		else ex = T.x
		if(T.y > world.maxy) ey=world.maxy
		else ey = T.y
		if(T.density)
			return
	if(M.dir==NORTHEAST)
		return
	if(M.dir==NORTHWEST)
		return
	if(M.dir==SOUTHEAST)
		return
	if(M.dir==SOUTHWEST)
		return
	src.loc=locate(ex,ey,M.z)



