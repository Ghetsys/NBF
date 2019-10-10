mob/DemonTree	//Nice little easter egg xD
	name = "Demon Tree"
	icon='Tree.dmi'
	layer=MOB_LAYER+1
	GenjutsuKnowledge = 1000000
	GenjutsuMastery = 10
	gen = 120
	GenSkill = 40
	HandsealSpeed=60
	var/treetype = "Spring Green"
	DeadType
		treetype = "Dead"
	New(src.loc,AttackIT)
		src.overlays+=/obj/Trees1/GroundLevel1
		if(src.treetype=="Spring Green")
			src.overlays+=/obj/Trees1/a
			src.overlays+=/obj/Trees1/b
			src.overlays+=/obj/Trees1/c
			src.overlays+=/obj/Trees1/d
			src.overlays+=/obj/Trees1/e
			src.overlays+=/obj/Trees1/f
			src.overlays+=/obj/Trees1/g
			src.overlays+=/obj/Trees1/h
			src.overlays+=/obj/Trees1/i
		else if(src.treetype=="Dead")
			src.overlays+=/obj/Trees2/Leaf1
			src.overlays+=/obj/Trees2/Leaf2
			src.overlays+=/obj/Trees2/Leaf3

			src.overlays+=/obj/Trees2/Leaf4
			src.overlays+=/obj/Trees2/Leaf5
			src.overlays+=/obj/Trees2/Leaf6

			src.overlays+=/obj/Trees2/Leaf7
			src.overlays+=/obj/Trees2/Leaf8
			src.overlays+=/obj/Trees2/Leaf9
		..()
		/*spawn()
			var/list/IsIgnored = list("DemonicK","Linkred123","Itsnothim","RageFury33","CobraT1337","JyuonJoon","RokujinSanbi")
			var/startspot = src.loc	//XD don't want to be attacked be them. lmao...
			var/mob/attacking
			var/sentgenjutsu=0
			var/JustShunshined=0
			if(AttackIT)
				attacking = AttackIT
				src.target = attacking
			while(src)
				sleep(1)
				while(!attacking)
					sleep(10)
					var/list/pov=list()
					for(var/mob/M in view(6,src))
						if(M.client && !M.Dead && M.InGenjutsu=="" && !(M.key in IsIgnored) )
							pov += M
					if(pov.len)
						attacking = pick(pov)
						src.target = attacking
					src.CastingGenjutsu=0
				if(!src.CastingGenjutsu && !attacking.knockedout && !attacking.ImmuneToDeath)
					if(!sentgenjutsu)	//Hasn't sent the genjutsu yet,
						spawn()
							if(prob(10) || JustShunshined ) src.GenjutsuProc("Kokuangyo","Affect","Target",0,0,15,25,220,0)
							else if(prob(50)) src.GenjutsuProc("Blazing Burn","Affect","Target",0,0,15,50,220,0)
							else if(prob(40)) src.GenjutsuProc("Burizado","Affect","Target",0,0,10,75,200,0)
							else src.GenjutsuProc("Gyaku Bijon","Affect","Target",0,0,10,25,200,0)
							sentgenjutsu=1
							JustShunshined=0
					else	//They managed to cancle out the genjutus!?
						src.Shushin_Far_Behind(attacking)
						src.UseWire()
						sentgenjutsu=0;JustShunshined=1
						continue
				if(attacking.knockedout)
		//			if(src.z != attacking.z || get_dist(src,attacking) >= 10) //src.ShushinNear(attacking)
					src.target = attacking
					if(src.CastingGenjutsu)
						src.GenjutsuCanceling()
					if(attacking.StruggleAgainstDeath <= 0)
						attacking.Death(src)
				if(src.attacked && src.attacker != attacking.name)
					for(var/mob/M in range(6,src))
						if(M.name == src.attacker && M.client)
							if(!M.InGenjutsu && !(M.key in IsIgnored))
								var/oneattacking=0
								for(var/mob/DemonTree/D in world)
									if(D.target == M) oneattacking=1
								if(!oneattacking)
									var/Options
									for(var/turf/T in oview(10,src))
										if(!T.density && T in oview(6,M))
											Options += T
									var/turf/T = pick(Options)
									new /mob/DemonTree(T,M)	//Create a Demon Tree randomly in this area, to attack this tree's attacker! XD
							var/Options
							for(var/turf/T in oview(10,src))
								if(!T.density && get_dist(M,T) > 5)
									Options += T
							var/turf/T = pick(Options)
							src.loc = T
							src.overlays-='Icons/Jutsus/Shushin.dmi'
							src.overlays+='Icons/Jutsus/Shushin.dmi'
							src.useshushin=1
							spawn(10)
								src.useshushin=0
								src.shunshin=0
								src.overlays-='Icons/Jutsus/Shushin.dmi'
							break
				if(locate(/obj/Jutsu/Elemental/Katon) in range(2,src))
					var/Options=list()
					for(var/turf/T in oview(8,src))
						Options += T
					CHOOSE
					var/turf/T = pick(Options)
					if(locate(/obj/Jutsu/Elemental/Katon) in range(2,T) || T.density)
						Options -= T
						goto CHOOSE
					else
						src.loc = T
						src.overlays-='Icons/Jutsus/Shushin.dmi'
						src.overlays+='Icons/Jutsus/Shushin.dmi'
						src.useshushin=1
						spawn(10)
							src.useshushin=0
							src.shunshin=0
							src.overlays-='Icons/Jutsus/Shushin.dmi'
				if(attacking.Dead)
					if(AttackIT)
						src.loc = null
						return
					src.loc = startspot
					attacking = null
					src.target = null
				if(!src.StruggleAgainstDeath <= 0)
					src.Struggle += rand(5,20)
				if(src.Dead)
					src.loc = null
					return
*/