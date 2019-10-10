mob/var/tmp/SealingBijuu=0
mob/var/tmp/AbleToLavaSummon=0
mob/var/tmp/BijuuTransforming=0
mob/var/tmp/SabakuInShukaku=0
mob/var/tmp/NibiResistance=0
obj/BijuuSealingRing
	icon='wskillcards.dmi'
	icon_state="Ring"
	layer=MOB_LAYER+1
	var/Bijuu
	var/SealedSomething=0
	verb
		Check_Ring()
			if(src.SealedSomething==1)
				usr<<"The ring glows bright with chakra.";return
			else
				usr<<"You sense no chakra in the ring."
		Resonate()
			for(var/mob/M in world)
				if(M.Bijuu == src.Bijuu && M.z == usr.z)
					var/dist=get_dist(M,usr)
					if(prob(20))
						usr << "Your [src] resonates! ([dist])"
						return
			usr << "Your ring doesn't detect anything..."
		Get()
			set src in oview(1)
			if(usr.AkatsukiMember||usr.AkatsukiLeader)
				src.loc = usr
			else
				usr<<"Nope."
		Drop()
			src.loc=locate(usr.x,usr.y-1,usr.z)
			usr.SaveK()
		Seal_Bijuu(mob/M in oview(1))
			if(!usr.AkatsukiLeader||!usr.AkatsukiMember)
				usr<<"You don't know how to use this ring, as you're not in Akatsuki.";return
			if(usr.SealingBijuu)
				usr<<"You're either already sealing or you need to wait for the delay!";return
			if(M.Bijuu==src.Bijuu)
				usr<<"You begin to seal the bijuu!"
				M<<"Your chakra is being sucked from you, you're being sealed!"
				usr.Frozen=1
				usr.firing=1
				usr.SealingBijuu=1
				usr<<"It'll take 3 minutes to seal the Bijuu!"
				sleep(1200)
				if(M in get_step(usr,usr.dir))
					if(!usr.SealingBijuu)
						return
					usr<<"It'll take 1 more minute."
					sleep(600)
					if(M in get_step(usr,usr.dir))
						if(!usr.SealingBijuu)
							return
						usr<<"You've successfully extracted the [M.Bijuu] from [M.name]!"
						M.Bijuu="";M.killer="Akatsuki"
						src.SealedSomething=1
						spawn()
							M.Reincarnate()
						usr.SealingBijuu=0
						usr.Frozen=0
						usr.firing=0
					else
						spawn(300)
							usr.SealingBijuu=0
						usr.Frozen=0
						usr.firing=0
				else
					spawn(300)
						usr.SealingBijuu=0
					usr.Frozen=0
					usr.firing=0
			else
				if(M.Bijuu=="")
					usr<<"They don't have a bijuu!";return
					return
				usr<<"This isn't the type of Bijuu designated to this ring!";return
	Ichibi_Ring
		Bijuu="Shukaku"
	Nibi_Ring
		Bijuu="Nibi"
	Sanbi_Ring
		Bijuu="Sanbi"
	Yonbi_Ring
		Bijuu="Yonbi"
	Gobi_Ring
		Bijuu="Gobi"
	Gobi2_Ring
		name="Gobi Ring"
		Bijuu="Gobi(2)"
	Rokubi_Ring
		Bijuu="Rokubi"
	Shichibi_Ring
		Bijuu="Shichibi"
	Nanabi_Ring
		Bijuu="Nanabi"
	Nanabi2_Ring
		name="Nanabi Ring"
		Bijuu="Nanabi(2)"
	Hachibi_Ring
		Bijuu="Hachibi"
	Hachibi2_Ring
		name="Hachibi Ring"
		Bijuu="Hachibi(2)"
	Kyuubi_Ring
		Bijuu="Kyuubi"
//Going to be in developement soon


mob/var/WokeUpFromBijuuTimes=0
obj/DemonCloakAura
	layer=MOB_LAYER+1
	var
		BijuuSet=""
	Powered
		icon='DemonAura0.dmi'
		Nibi
		Gobi
			New()
				src.icon+=rgb(215,215,215)
				..()
		Shichibi1
			New()
				src.icon+=rgb(215,0,0)
				..()
		Hachibi
			New()
				src.icon+=rgb(0,0,50)
				..()
		Hachibi2
			New()
				src.icon+=rgb(0,0,0)
				..()
	OneTailed
		icon='DemonAura1.dmi'
		Nibi
		Gobi
			New()
				src.icon+=rgb(215,215,215)
				..()
		Shichibi1
			New()
				src.icon+=rgb(215,0,0)
				..()
		Hachibi
			New()
				src.icon+=rgb(0,0,50)
				..()
		Hachibi2
			New()
				src.icon+=rgb(0,0,0)
				..()
	TwoTailed
		icon='DemonAura2.dmi'
		Nibi
		Gobi
			New()
				src.icon+=rgb(215,215,215)
				..()
		Shichibi1
			New()
				src.icon+=rgb(215,0,0)
				..()
		Hachibi
			New()
				src.icon+=rgb(0,0,50)
				..()
		Hachibi2
			New()
				src.icon+=rgb(0,0,0)
				..()
mob/proc/ReleaseAura(Tail,Demon)
	if(Demon=="Nibi")
		if(Tail==0)
			var/obj/DemonCloakAura/Powered/Nibi/A=new()
			A.icon+=rgb(204,51,255)
			src.overlays+=A
			src.TailState=0.5


		if(Tail==1)
			var/obj/DemonCloakAura/OneTailed/Nibi/A=new()
			A.icon+=rgb(204,51,255)
			src.overlays+=A
			src.TailState=1

		if(Tail==2)
			var/obj/DemonCloakAura/TwoTailed/Nibi/A=new()
			A.icon+=rgb(204,51,255)
			src.overlays+=A
			src.TailState=2
/////////////////////////////////
//Ichibi
mob/proc/ReleaseShukaku0(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Shukaku!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.health+=100
			if(src.health>src.maxhealth)
				src.health=src.maxhealth
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
	if(src.Clan=="Sabaku")
		src<<"As a Sabaku, your Clan Jutsu are dramatically strengthened while in this form!"
		src.SabakuInShukaku=1
	src.overlays-='ShukakuSand.dmi'
	src.overlays+='ShukakuSand.dmi'
	src.icon_state=""
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Shukaku!"
	view()<<"[src] releases into a resemblance of the One Tailed Beast Shukaku!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	if(src.BijuuMastery>=50)
		if(!(locate(/obj/SkillCards/ShukakuAirBullet) in src.LearnedJutsus))
			var/obj/SkillCards/ShukakuAirBullet/A=new();A.NonKeepable=1;src.LearnedJutsus+=A
	while(src.TailState==0.5)
		src.EnduranceAddOn=100
	//	src.deathcount-=0.04
		src.tai=src.Mtai*1.2
		src.nin=src.Mnin*2.20
		src.gen=src.Mgen*1.2
		src.chakra+=40
		if(!Control)
			src.health-=15
			src.stamina-=35
		sleep(11)
	src.EnduranceAddOn=0
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(src.TailState==0||src.TailState==1)
		src.overlays-='ShukakuSand.dmi'

/////////////////////////////////
//Artificial Nibi
//Partial Transformation 1
mob/var/tmp/ArtificialBijuu=""
mob/proc/ReleaseArtificialNibi0(Control,Speed=0,Tails=0)
	if(src.knockedout)
		return
	src.BijuuTransforming=1
	src<<"You begin to slip a bit of chakra from the Nibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Artificial Nibi!"
	src.BijuuTransforming=0
	src.ArtificialBijuu=""
	src.TailState=Tails
	while(src.TailState>0)
		if(src.TailState==0.5)
			src.tai=src.Mtai*1.05;src.nin=src.Mnin*1.65;src.gen=src.Mgen*1.05
			src.overlays+='Icons/New Base/cataura.dmi'
			src.NibiResistance=1
			src.ArtificialBijuu="Nibi"
		else if(src.TailState==1)
			src.tai=src.Mtai*1.1;src.nin=src.Mnin*1.95;src.gen=src.Mgen*1.1
			src.overlays+='Icons/Jutsus/Bijuu/DemonAura1.dmi'
			src.NibiResistance=2
			src.ArtificialBijuu="Nibi"
		else if(src.TailState==2)
			src.tai=src.Mtai*1.15;src.nin=src.Mnin*2.75;src.gen=src.Mgen*1.15
			src.overlays+='Icons/Jutsus/Bijuu/DemonAura2.dmi'
			src.ArtificialBijuu="Nibi"
			if(src.BijuuMastery>=120)
				var/obj/SkillCards/ArtificialNibiFlame/A=new();A.NonKeepable=1;src.LearnedJutsus+=A
			if(src.BijuuMastery>=400)
				var/obj/SkillCards/ArtificialNibiUnstoppableFlames/B=new();B.NonKeepable=1;src.LearnedJutsus+=B
			src.NibiResistance=3
		if(Tails!=src.TailState&&src.TailState!=0)
			Tails=src.TailState //Adjusting the initial proc's args for a change in the transformation without calling a new loop.					//Yay for efficiency!
		if(Speed)
			spawn(600)
				src.TailState=0
		while(src.TailState==Tails)
			if(src.icon_state!="dead")
				src.icon_state="beastman"
			src.chakra+=50*(src.TailState+1)
			if(!Control)
				src.health-=10*(src.TailState/2)
				src.stamina-=20*(src.TailState)
			sleep(11)
		sleep(5)
	//
	//Power Down Part
	//
	src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/ArtificialNibi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/ArtificialNibi1
	if(!(locate(/obj/SkillCards/ArtificialNibi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=150)
			src.LearnedJutsus+=new /obj/SkillCards/ArtificialNibi2
	src.NibiResistance=0
	src.ArtificialBijuu=""
	src.overlays-='Icons/New Base/cataura.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/DemonAura1.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/DemonAura2.dmi'

mob/proc/ArtificialNibiFlameProjectile()
	if(src.knockedout||src.ArtificialBijuu!="Nibi")
		return
	src<<"You open your mouth as a cindering artificial chakra begins to burn your throat.."
	sleep(4)
	var/obj/Jutsu/Elemental/Katon/Houka/F=new();F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin*10;walk(F,F.dir);F.JutsuLevel=10000;sleep(1)
	sleep(7)
	var/obj/Jutsu/Elemental/Katon/Houka/C=new();C.loc=src.loc;C.Owner=src;C.dir=src.dir;C.nin=src.nin*10;walk(C,C.dir);C.JutsuLevel=10000;sleep(1)
	sleep(4)
	var/obj/Jutsu/Elemental/Katon/Houka/S=new();S.loc=src.loc;S.Owner=src;S.dir=src.dir;S.nin=src.nin*10;walk(S,S.dir);S.JutsuLevel=10000;sleep(1)
	sleep(4)
	var/obj/Jutsu/Elemental/Katon/Houka/SS=new();SS.loc=src.loc;SS.Owner=src;SS.dir=src.dir;SS.nin=src.nin*10;walk(SS,SS.dir);SS.JutsuLevel=10000;sleep(1)
	sleep(4)
	var/obj/Jutsu/Elemental/Katon/Houka/SSS=new();SSS.loc=src.loc;SSS.Owner=src;SSS.dir=src.dir;SSS.nin=src.nin*10;walk(SSS,SSS.dir);SSS.JutsuLevel=10000;sleep(1)
	src.icon_state=""
/////////////////////////////////
//Nibi
//Partial Transformation 1
mob/proc/ReleaseNibi0(Control,Speed=0,Tails=0)
	if(src.knockedout)
		return
	src.BijuuTransforming=1
	src<<"You begin to slip a bit of chakra from the Nibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Nibi!"
	src.BijuuTransforming=0
	src.TailState=Tails
	while(src.TailState>0)
		if(src.TailState==0.5)
			src.tai=src.Mtai*1.05;src.nin=src.Mnin*1.65;src.gen=src.Mgen*1.05
			src.overlays+='Icons/New Base/cataura.dmi'
			src.NibiResistance=1
		else if(src.TailState==1)
			src.tai=src.Mtai*1.1;src.nin=src.Mnin*1.95;src.gen=src.Mgen*1.1
			src.overlays+='Icons/Jutsus/Bijuu/DemonAura1.dmi'
			src.NibiResistance=2
		else if(src.TailState==2)
			src.tai=src.Mtai*1.15;src.nin=src.Mnin*2.75;src.gen=src.Mgen*1.15
			src.overlays+='Icons/Jutsus/Bijuu/DemonAura2.dmi'
			if(src.BijuuMastery>=120)
				var/obj/SkillCards/NibiFlame/A=new();A.NonKeepable=1;src.LearnedJutsus+=A
			if(src.BijuuMastery>=400)
				var/obj/SkillCards/NibiUnstoppableFlames/B=new();B.NonKeepable=1;src.LearnedJutsus+=B
			src.NibiResistance=3
		if(Tails!=src.TailState&&src.TailState!=0)
			Tails=src.TailState //Adjusting the initial proc's args for a change in the transformation without calling a new loop.					//Yay for efficiency!
		if(Speed)
			spawn(600)
				src.TailState=0
		while(src.TailState==Tails)
			if(src.icon_state!="dead")
				src.icon_state="beastman"
			src.chakra+=50*(src.TailState+1)
			if(!Control)
				src.health-=10*(src.TailState/2)
				src.stamina-=20*(src.TailState)
			sleep(11)
		sleep(5)
	//
	//Power Down Part
	//
	src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Nibi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/Nibi1
	if(!(locate(/obj/SkillCards/Nibi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=150)
			src.LearnedJutsus+=new /obj/SkillCards/Nibi2
	src.NibiResistance=0
	src.overlays-='Icons/New Base/cataura.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/DemonAura1.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/DemonAura2.dmi'

mob/proc/NibiFlameProjectile()
	if(src.knockedout)
		return
	src<<"You open your mouth!"
//	src.icon_state="jutsu"
	sleep(5)
//	if(src.icon_state=="jutsu")
	var/obj/Jutsu/Elemental/Katon/Houka/F=new();F.loc=src.loc;F.Owner=src;F.dir=src.dir;F.nin=src.nin*10;walk(F,F.dir);F.JutsuLevel=src.KatonKnowledge;sleep(1)
	sleep(10)
	var/obj/Jutsu/Elemental/Katon/Houka/C=new();C.loc=src.loc;C.Owner=src;C.dir=src.dir;C.nin=src.nin*10;walk(C,C.dir);C.JutsuLevel=src.KatonKnowledge;sleep(1)
	sleep(5)
	var/obj/Jutsu/Elemental/Katon/Houka/S=new();S.loc=src.loc;S.Owner=src;S.dir=src.dir;S.nin=src.nin*10;walk(S,S.dir);S.JutsuLevel=src.KatonKnowledge;sleep(1)
	src.icon_state=""
/////////////////////////////////
//Sanbi


mob/proc/ReleaseSanbi0(Control,Speed=0,Tails=0)
	if(src.knockedout)
		return
	src.BijuuTransforming=1
	src<<"You begin to slip a bit of chakra from the Sanbi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Sanbi!"
	src.BijuuTransforming=0
	src.TailState=Tails
	while(src.TailState>0)
		if(src.TailState==0.5)
			src.tai=src.Mtai*1.05;src.nin=src.Mnin*1.05;src.gen=src.Mgen*1.5;src.chakra+=35;src.EnduranceAddOn=100
//			src.overlays+='Icons/New Base/cataura.dmi'
			src.overlays-='Icons/Jutsus/Bijuu/demonturtle.dmi'
			src.overlays+='Icons/Jutsus/Bijuu/demonturtle.dmi'
		else if(src.TailState==1)
			src.tai=src.Mtai*1.15;src.nin=src.Mnin*1.15;src.gen=src.Mgen*1.75;src.chakra+=35;src.EnduranceAddOn=500
			src.overlays+='Icons/Jutsus/Bijuu/demonturtle.dmi'
			src.overlays+='Icons/Jutsus/Bijuu/demonturtle.dmi'
			src.overlays-='demonturtletail1O.dmi'
			src.underlays-='demonturtletail1U.dmi'
			src.overlays+='demonturtletail1O.dmi'
			src.underlays+='demonturtletail1U.dmi'
			//src.overlays+='Icons/Jutsus/Bijuu/DemonAura1.dmi'
		else if(src.TailState==2)
			src.tai=src.Mtai*1.2;src.nin=src.Mnin*1.2;src.gen=src.Mgen*1.9;src.chakra+=35;src.EnduranceAddOn=850
			src.overlays-='demonturtle.dmi'
			src.overlays+='demonturtle.dmi'
			src.overlays-='demonturtletail1O.dmi'
			src.underlays-='demonturtletail1U.dmi'
			src.overlays+='demonturtletail1O.dmi'
			src.underlays+='demonturtletail1U.dmi'
			src.overlays-='demonturtletail2O.dmi'
			src.underlays-='demonturtletail2U.dmi'
			src.overlays+='demonturtletail2O.dmi'
			src.underlays+='demonturtletail2U.dmi'
			//src.overlays+='Icons/Jutsus/Bijuu/DemonAura2.dmi'
			if(src.BijuuMastery>=125)
				if(!(locate(/obj/SkillCards/SuitonRavashingWave) in src.LearnedJutsus))
					var/obj/SkillCards/SuitonRavashingWave/A=new();A.NonKeepable=1;src.LearnedJutsus+=A
		else if(src.TailState==3)
			src.tai=src.Mtai*1.25;src.nin=src.Mnin*1.25;src.gen=src.Mgen*2.25;src.chakra+=35;src.EnduranceAddOn=1000
			src.overlays-='demonturtle.dmi'
			src.overlays+='demonturtle.dmi'
			src.overlays-='demonturtletail1O.dmi'
			src.underlays-='demonturtletail1U.dmi'
			src.overlays+='demonturtletail1O.dmi'
			src.underlays+='demonturtletail1U.dmi'
			src.overlays-='demonturtletail2O.dmi'
			src.underlays-='demonturtletail2U.dmi'
			src.overlays+='demonturtletail2O.dmi'
			src.underlays+='demonturtletail2U.dmi'
		//	src.overlays+='Icons/Jutsus/Bijuu/DemonAura2.dmi'
		if(Tails!=src.TailState&&src.TailState!=0)
			Tails=src.TailState //Adjusting the initial proc's args for a change in the transformation without calling a new loop.					//Yay for efficiency!
		if(Speed)
			spawn(600)
				src.TailState=0//SuitonRavashingWave
		while(src.TailState==Tails)
			src.chakra+=50*(src.TailState+1)
			if(!Control)
				src.health-=10*(src.TailState/2)
				src.stamina-=20*(src.TailState)
			sleep(11)
		sleep(5)
	//
	//Power Down Part
	//
	src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen;src.EnduranceAddOn=0
	if(!(locate(/obj/SkillCards/Sanbi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi1
	if(!(locate(/obj/SkillCards/Sanbi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=150)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi2
	if(!(locate(/obj/SkillCards/Sanbi3) in src.LearnedJutsus))
		if(src.BijuuMastery>=300)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi3
//	src.overlays-='Icons/New Base/cataura.dmi'
//	src.overlays-='Icons/Jutsus/Bijuu/DemonAura1.dmi'
//	src.overlays-='Icons/Jutsus/Bijuu/DemonAura2.dmi'
	src.overlays-='demonturtle.dmi'
//	src.overlays+='demonturtle.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.underlays-='demonturtletail1U.dmi'
//	src.overlays+='demonturtletail1O.dmi'
//	src.underlays+='demonturtletail1U.dmi'
	src.overlays-='demonturtletail2O.dmi'
	src.underlays-='demonturtletail2U.dmi'
//	src.overlays+='demonturtletail2O.dmi'
//	src.underlays+='demonturtletail2U.dmi'

mob
	proc
		SuitonRavashingDestruction(Uses)
			src.ChakraDrain(50000)
			if((src.Bijuu=="Sanbi"&&(src.TailState==2||src.TailState==3))||(src.key=="CobraT1337"))
				src.icon_state="Jutsu";src.overlays-='water.dmi';src.overlays+='water.dmi';src.Frozen=1;src.firing=1
				spawn(20)
					src.Frozen=0;src.firing=0;src.overlays-='water.dmi'
				var/Distance=7
				for(var/turf/T in range(Distance,src))
					spawn()//walk(A,turn(get_dir(A,src),180))
						if(T.y==src.y)
							var/obj/Jutsu/Elemental/Suiton/WaterWave/A=new();A.name="[src]";A.Owner=src;A.nin=src.nin*3;A.JutsuLevel=src.SuitonKnowledge;A.loc=T;A.dir=NORTH;walk(A,NORTH)
					spawn()
						if(T.x==src.x)
							var/obj/Jutsu/Elemental/Suiton/WaterWave/B=new();B.name="[src]";B.Owner=src;B.nin=src.nin*3;B.JutsuLevel=src.SuitonKnowledge;B.loc=T;B.dir=EAST;walk(B,EAST)
					spawn()
						if(T.y==src.y)
							var/obj/Jutsu/Elemental/Suiton/WaterWave/C=new();C.name="[src]";C.Owner=src;C.nin=src.nin*3;C.JutsuLevel=src.SuitonKnowledge;C.loc=T;C.dir=SOUTH;walk(C,SOUTH)
					spawn()
						if(T.x==src.x)
							var/obj/Jutsu/Elemental/Suiton/WaterWave/D=new();D.name="[src]";D.Owner=src;D.nin=src.nin*3;D.JutsuLevel=src.SuitonKnowledge;D.loc=T;D.dir=WEST;walk(D,WEST)
					spawn(20)
						if(src.TailState==3)
							spawn()//walk(A,turn(get_dir(A,src),180))
								if(T.y==src.y)
									var/obj/Jutsu/Elemental/Suiton/WaterWave/A=new();A.name="[src]";A.Owner=src;A.nin=src.nin*3;A.JutsuLevel=src.SuitonKnowledge;A.loc=T;A.dir=NORTH;walk(A,NORTH)
							spawn()
								if(T.x==src.x)
									var/obj/Jutsu/Elemental/Suiton/WaterWave/B=new();B.name="[src]";B.Owner=src;B.nin=src.nin*3;B.JutsuLevel=src.SuitonKnowledge;B.loc=T;B.dir=EAST;walk(B,EAST)
							spawn()
								if(T.y==src.y)
									var/obj/Jutsu/Elemental/Suiton/WaterWave/C=new();C.name="[src]";C.Owner=src;C.nin=src.nin*3;C.JutsuLevel=src.SuitonKnowledge;C.loc=T;C.dir=SOUTH;walk(C,SOUTH)
							spawn()
								if(T.x==src.x)
									var/obj/Jutsu/Elemental/Suiton/WaterWave/D=new();D.name="[src]";D.Owner=src;D.nin=src.nin*3;D.JutsuLevel=src.SuitonKnowledge;D.loc=T;D.dir=WEST;walk(D,WEST)
			else
				src<<"You need to use more power from the Sanbi to use this!"
/*
mob/proc/ReleaseSanbi(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Sanbi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/demonturtle.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/demonturtle.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Sanbi!"
	src<<"Your skin hardens slightly!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.EnduranceAddOn=100
		src.tai=src.Mtai*1.05
		src.nin=src.Mnin*1.05
		src.gen=src.Mgen*1.5
		src.chakra+=35
		if(!Control)
			src.health-=15
			src.stamina-=35
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	src.EnduranceAddOn=0
	if(!(locate(/obj/SkillCards/Sanbi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=30)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi1
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/demonturtle.dmi'

mob/proc/ReleaseSanbi1(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Sanbi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays-='demonturtle.dmi'
	src.overlays+='demonturtle.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.underlays-='demonturtletail1U.dmi'
	src.overlays+='demonturtletail1O.dmi'
	src.underlays+='demonturtletail1U.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Sanbi!"
	src<<"Your skin hardens slightly!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.EnduranceAddOn=500
		src.tai=src.Mtai*1.15
		src.nin=src.Mnin*1.15
		src.gen=src.Mgen*1.75
		src.chakra+=50
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	src.EnduranceAddOn=0
	if(!(locate(/obj/SkillCards/Sanbi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=90)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi2
	if(src.TailState==0||src.TailState==2)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'


mob/proc/ReleaseSanbi2(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Sanbi, forming the second tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='demonturtle.dmi'
	src.overlays+='demonturtle.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.underlays-='demonturtletail1U.dmi'
	src.overlays+='demonturtletail1O.dmi'
	src.underlays+='demonturtletail1U.dmi'
	src.overlays-='demonturtletail2O.dmi'
	src.underlays-='demonturtletail2U.dmi'
	src.overlays+='demonturtletail2O.dmi'
	src.underlays+='demonturtletail2U.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Sanbi!"
	src<<"Your skin hardens to the near point of being unbreakable!"
	src.TailState=2
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==2)
		src.EnduranceAddOn=500
		src.tai=src.Mtai*1.2
		src.nin=src.Mnin*1.2
		src.gen=src.Mgen*1.9
		src.chakra+=75
		if(!Control)
			src.health-=30
			src.stamina-=60
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	src.EnduranceAddOn=0
	if(!(locate(/obj/SkillCards/Sanbi3) in src.LearnedJutsus))
		if(src.BijuuMastery>=120)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi3
	if(src.TailState==0||src.TailState==3)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'


mob/proc/ReleaseSanbi3(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Sanbi, forming the third tail!"
	src<<"Your skin hardens to the near point of being unbreakable!"
	src.TailState=3
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays-='demonturtle.dmi'
	src.overlays+='demonturtle.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.underlays-='demonturtletail1U.dmi'
	src.overlays+='demonturtletail1O.dmi'
	src.underlays+='demonturtletail1U.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Sanbi!"
	src<<"Your skin hardens slightly!"
//	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==3)
		src.EnduranceAddOn=750
		src.tai=src.Mtai*1.2
		src.nin=src.Mnin*1.2
		src.gen=src.Mgen*2.25
		src.chakra+=50
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	src.EnduranceAddOn=0
	if(!(locate(/obj/SkillCards/Sanbi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=60)
			src.LearnedJutsus+=new /obj/SkillCards/Sanbi2
	if(src.TailState==0||src.TailState==2)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
*/

////////////////////////////////
//Yonbi
//Partial Transformation 1
mob/proc/ReleaseYonbi(Control,Speed=0,Tails=0)
	if(src.knockedout)
		return
	src.BijuuTransforming=1
	src<<"You begin to slip a bit of chakra from the Yonbi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Yonbi!"
	src.BijuuTransforming=0
	src.TailState=Tails
	while(src.TailState>0)
		if(src.TailState==0.5)
			src.tai=src.Mtai*1.25;src.nin=src.Mnin*1.25;src.gen=src.Mgen*1.05
			src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
		else if(src.TailState==1)
			src.tai=src.Mtai*1.5;src.nin=src.Mnin*1.5;src.gen=src.Mgen*1.1
			src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		else if(src.TailState==2)
			src.tai=src.Mtai*1.9;src.nin=src.Mnin*1.9;src.gen=src.Mgen*1.2
			src.overlays+='Icons/Jutsus/Bijuu/kyuubi2.dmi'
			if(src.BijuuMastery>=250)
				if(!(locate(/obj/SkillCards/LavaRiver) in src.LearnedJutsus))
					var/obj/SkillCards/LavaRiver/A=new();A.NonKeepable=1;src.LearnedJutsus+=A;A.Uses=100
			if(src.BijuuMastery>=300)
				if(!(locate(/obj/SkillCards/LavaStream) in src.LearnedJutsus))
					var/obj/SkillCards/LavaStream/A=new();A.NonKeepable=1;src.LearnedJutsus+=A;A.Uses=100
		else if(src.TailState==3)
			src.tai=src.Mtai*2.25;src.nin=src.Mnin*2.25;src.gen=src.Mgen*1.35
			//src.overlays+='' Need an icon
			if(src.BijuuMastery>=390)
				if(!(locate(/obj/SkillCards/VolcanicLavaStream) in src.LearnedJutsus))
					var/obj/SkillCards/VolcanicLavaStream/A=new();A.NonKeepable=1;src.LearnedJutsus+=A;A.Uses=100
		else if(src.TailState==4)
			src.tai=src.Mtai*2.5;src.nin=src.Mnin*2.5;src.gen=src.Mgen*1.5
			//src.overlays+='' Need an icon
			if(src.BijuuMastery>=550)
				if(!(locate(/obj/SkillCards/VolcanicLavaCreation) in src.LearnedJutsus))
					var/obj/SkillCards/VolcanicLavaCreation/A=new();A.NonKeepable=1;src.LearnedJutsus+=A;A.Uses=100
		if(Tails!=src.TailState&&src.TailState!=0)
			Tails=src.TailState //Adjusting the initial proc's args for a change in the transformation without calling a new loop.
								//Yay for efficiency!
		if(Speed)
			spawn(600)
				src.TailState=0
		while(src.TailState==Tails)
			if(src.icon_state!="dead")
				src.icon_state="beastman"
			src.chakra+=50*(src.TailState+1)
			if(!Control)
				src.health-=10*(src.TailState/2)
				src.stamina-=20*(src.TailState)
			sleep(11)
		sleep(5)
	//
	//Power Down Part
	//
	src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Yonbi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/Yonbi1
	if(!(locate(/obj/SkillCards/Yonbi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=150)
			src.LearnedJutsus+=new /obj/SkillCards/Yonbi2
	if(!(locate(/obj/SkillCards/Yonbi3) in src.LearnedJutsus))
		if(src.BijuuMastery>=300)
			src.LearnedJutsus+=new /obj/SkillCards/Yonbi3
	if(!(locate(/obj/SkillCards/Yonbi4) in src.LearnedJutsus))
		if(src.BijuuMastery>=450)
			src.LearnedJutsus+=new /obj/SkillCards/Yonbi4
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'
///////////////////////////////////////////
//////////////////////////////////////////

obj/Jutsu/Elemental/Youton
	//Element="Youton"
	icon='Icons/lava.dmi'
obj/Jutsu/Elemental/Youton/Lava
	icon_state=""
	density=0
	layer=TURF_LAYER
	var/nin1=0
	New()
		..()
		spawn()
			while(src)
				src.SoundEngine2('SFX/LavaFlow.wav',7,80)
				for(var/mob/M in src.loc)
					var/mob/O=src.Owner
					if(M==O)
						return
					if(M.knockedout)
						return
					M.DamageProc(rand(50,100),"Health",O)
					M.DamageProc(rand(150,300),"Stamina",O)
					M.Running=0
				for(var/obj/Jutsu/Elemental/Suiton/A in src.loc)
					src.CreateSmoke("Light")
					del(src)
				sleep(11)
		spawn(300)
			del(src)
obj/Jutsu/Elemental/Youton/LavaWave
	icon_state="Icons/Waterfall"
	density=0
	layer=TURF_LAYER
	var/nin=10
	var/Edge=0
	var/FirstTile=0
	New()
		..()
		spawn(10)
			del(src)
	Del()
		var/obj/Jutsu/Elemental/Youton/Lava/L=new()
		L.loc=src.loc;L.Owner=src.Owner
		if(src.dir==NORTH) L.icon_state="[src.Edge-6]"
		if(src.dir==SOUTH) L.icon_state="[src.Edge+6]"
		if(src.dir==WEST) L.icon_state="[src.Edge-2]"
		if(src.dir==EAST) L.icon_state="[src.Edge+2]"
		..()
	Move()
		var/obj/Jutsu/Elemental/Youton/Lava/L=new()
		L.loc=src.loc;L.Owner=src.Owner
		if(src.dir==NORTH)
			if(!src.FirstTile)
				src.FirstTile=1;L.icon_state="[src.Edge]"
			else
				L.icon_state="[src.Edge-3]"
		if(src.dir==SOUTH)
			if(!src.FirstTile)
				src.FirstTile=1;L.icon_state="[src.Edge]"
			else
				L.icon_state="[src.Edge+3]"
		if(src.dir==WEST)
			if(!src.FirstTile)
				src.FirstTile=1;L.icon_state="[src.Edge]"
			else
				L.icon_state="[src.Edge-1]"
		if(src.dir==EAST)
			if(!src.FirstTile)
				src.FirstTile=1;L.icon_state="[src.Edge]"
			else
				L.icon_state="[src.Edge+1]"
		..()
mob/proc/Lavastream()
	var/ChakraLoss=1000;ChakraLoss-=src.GenSkill
	src.chakra-=ChakraLoss
	src.Handseals(15-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="Jutsu";src.Frozen=1;src.firing=1
	spawn(20)
		src.Frozen=0;src.firing=0;src.icon_state=""
	var/obj/Jutsu/Elemental/Youton/LavaWave/A=new();A.Owner=src;A.nin=src.nin;A.JutsuLevel=1
	var/obj/Jutsu/Elemental/Youton/LavaWave/B=new();B.Owner=src;B.nin=src.nin;B.JutsuLevel=1
	var/obj/Jutsu/Elemental/Youton/LavaWave/C=new();C.Owner=src;C.nin=src.nin;C.JutsuLevel=1
	var/obj/Jutsu/Elemental/Youton/LavaWave/D=new();D.Owner=src;D.nin=src.nin;D.JutsuLevel=1
	var/obj/Jutsu/Elemental/Youton/LavaWave/E=new();E.Owner=src;E.nin=src.nin;E.JutsuLevel=1
	if(src.dir==NORTH)
		A.loc=locate(src.x,src.y+1,src.z);A.dir=NORTH;A.Edge=8
		B.loc=locate(src.x-1,src.y+1,src.z);B.dir=NORTH;B.Edge=8
		C.loc=locate(src.x+1,src.y+1,src.z);C.dir=NORTH;C.Edge=8
		D.loc=locate(src.x-2,src.y+1,src.z);D.dir=NORTH;D.Edge=7
		E.loc=locate(src.x+2,src.y+1,src.z);E.dir=NORTH;E.Edge=9
	if(src.dir==SOUTH)
		A.loc=locate(src.x,src.y-1,src.z);A.dir=SOUTH;A.Edge=2
		B.loc=locate(src.x-1,src.y-1,src.z);B.dir=SOUTH;B.Edge=2
		C.loc=locate(src.x+1,src.y-1,src.z);C.dir=SOUTH;C.Edge=2
		D.loc=locate(src.x-2,src.y-1,src.z);D.dir=SOUTH;D.Edge=1
		E.loc=locate(src.x+2,src.y-1,src.z);E.dir=SOUTH;E.Edge=3
	if(src.dir==WEST)
		A.loc=locate(src.x-1,src.y,src.z);A.dir=WEST;A.Edge=6
		B.loc=locate(src.x-1,src.y-2,src.z);B.dir=WEST;B.Edge=9
		C.loc=locate(src.x-1,src.y-1,src.z);C.dir=WEST;C.Edge=6
		D.loc=locate(src.x-1,src.y+1,src.z);D.dir=WEST;D.Edge=6
		E.loc=locate(src.x-1,src.y+2,src.z);E.dir=WEST;E.Edge=3
	if(src.dir==EAST)
		A.loc=locate(src.x+1,src.y,src.z);A.dir=EAST;A.Edge=4
		B.loc=locate(src.x+1,src.y-2,src.z);B.dir=EAST;B.Edge=7
		C.loc=locate(src.x+1,src.y-1,src.z);C.dir=EAST;C.Edge=4
		D.loc=locate(src.x+1,src.y+1,src.z);D.dir=EAST;D.Edge=4
		E.loc=locate(src.x+1,src.y+2,src.z);E.dir=EAST;E.Edge=1
	walk(A,A.dir);walk(B,B.dir);walk(C,C.dir);walk(D,D.dir);walk(E,E.dir)
mob/proc/LavaRiver(Uses)
	var/ChakraLoss=1750;ChakraLoss-=src.GenSkill*2
	src.chakra-=ChakraLoss
	src.Handseals(70-src.HandsealSpeed)
	if(src.HandsSlipped) return
	src.icon_state="handseal";src.Frozen=1
	for(var/turf/T in oview(1))
		var/obj/Jutsu/Elemental/Youton/Lava/A=new()
		A.Owner=src;A.JutsuLevel=src.DotonKnowledge/5+src.KatonKnowledge/5;A.loc=T
	sleep(1)
	var/AZ=2
	var/HowFarItGoes=rand(5,10)
	if(HowFarItGoes>10)
		AZ=10
	else
		AZ=HowFarItGoes
	if(Uses>200)
		AZ+=1
	var/Z=1
	while(Z<AZ)
		for(var/turf/T in oview(Z,src))
			if(!(T in oview(Z-1)))
				var/obj/Jutsu/Elemental/Youton/Lava/A=new();A.Owner=src;A.JutsuLevel=src.DotonKnowledge/5+src.KatonKnowledge/5;A.loc=T
		Z++
		sleep(1)
	if(Z<AZ)
		src.icon_state="";src.Frozen=0
mob
	proc
		VolcanicLavaSprout()
			src.Handseals(65-src.HandsealSpeed)
			if(HandsSlipped) return
			for(var/turf/T in oview(7,src))
				if(prob(20))
					spawn(rand(1,20))
						var/obj/Jutsu/Elemental/Youton/Lava/A=new();A.Owner=src;A.JutsuLevel=src.DotonKnowledge/5+src.KatonKnowledge/5;A.loc=T
		VolcanicLavaCreation()
			var/T=0
			src.Handseals()
			if(HandsSlipped) return
			src.ChakraDrain(30000)
			src<<"You're building up your chakra!"
			spawn(10)
				src<<"You can now create lava where ever you click!"
				src.AbleToLavaSummon=1
			while(src.AbleToLavaSummon==1)
				T++
				sleep(10)
			if(T>6)
				if(src.AbleToLavaSummon==1)
					src<<"You ran out of time to create lava!"
					src.AbleToLavaSummon=0
					return


////////////////////////////////
//Gobi

mob/proc/ReleaseGobi(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Gobi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Gobi!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.tai=src.Mtai*1.5
		src.nin=src.Mnin*1
		src.gen=src.Mgen*1
		src.chakra+=50
		if(!Control)
			src.health-=15
			src.stamina-=35
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/GobiType2) in src.LearnedJutsus))
		if(src.BijuuMastery>=40)
			src.LearnedJutsus+=new /obj/SkillCards/GobiType2
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
////////////////////////////////
//Gobi2
mob/proc/ReleaseGobiType2(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Gobi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Gobi!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.tai=src.Mtai*1.75
		src.nin=src.Mnin*1.25
		src.gen=src.Mgen*1.25
		src.chakra+=50
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/GobiType21) in src.LearnedJutsus))
		if(src.BijuuMastery>=80)
			src.LearnedJutsus+=new /obj/SkillCards/GobiType21
	if(src.TailState==0||src.TailState==2)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'



mob/proc/ReleaseGobiType21(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Gobi, forming the second tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			if(src.TailState==2)
				src.chakra+=50
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src.icon_state=""
	src<<"You release the power of the Gobi!"
	src.TailState=2
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==2)
		src.tai=src.Mtai*2
		src.nin=src.Mnin*1.5
		src.gen=src.Mgen*1.5
		src.ChakraArmor=45
		src.chakra=src.Mchakra*2
		if(!Control)
			src.health-=35
			src.stamina-=65
		sleep(11)
	src.ChakraArmor=0
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'

/////////////////////////////////
//Rokubi 1
//Partial Transformation 1
mob/proc/ReleaseRokubi(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Rokubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Bijuu1.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Rokubi!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.tai=src.Mtai*1
		src.nin=src.Mnin*1.5
		src.gen=src.Mgen*1.5
		src.chakra+=35
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Rokubi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/Rokubi1
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
mob/proc/ReleaseRokubi1(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Rokubi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Rokubi!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.tai=src.Mtai*1.25
		src.nin=src.Mnin*1.75
		src.gen=src.Mgen*1.75
		src.chakra+=100
		src.ChakraArmor=35
		if(!Control)
			src.health-=35
			src.stamina-=65
		sleep(11)
	src.ChakraArmor=0
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Rokubi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=100)
			src.LearnedJutsus+=new /obj/SkillCards/Rokubi2
	if(src.TailState==0||src.TailState==2)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'


mob/proc/ReleaseRokubi2(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Rokubi, forming the second tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Rokubi!"
	src.TailState=2
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==2)
		src.tai=src.Mtai*1.5
		src.nin=src.Mnin*2
		src.gen=src.Mgen*2
		src.chakra+=100
		src.ChakraArmor=45
		if(!Control)
			src.health-=45
			src.stamina-=75
		sleep(11)
	src.ChakraArmor=0
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Rokubi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=200)
			src.LearnedJutsus+=new /obj/SkillCards/MeltingAcidWave
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'

////////////////////////////////
//Shichibi
mob/proc/ReleaseShichibi(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Shichibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Shichibi!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.tai=src.Mtai*1
		src.nin=src.Mnin*1
		src.gen=src.Mgen*1.5
		src.chakra+=35
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Shichibi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=30)
			src.LearnedJutsus+=new /obj/SkillCards/Shichibi1
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'

mob/proc/ReleaseShichibi1(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Shichibi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Shichibi!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.tai=src.Mtai*1.25
		src.nin=src.Mnin*1.25
		src.gen=src.Mgen*1.75
		src.chakra+=35
		if(!Control)
			src.health-=35
			src.stamina-=65
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'





/////////////////////////////////
//Nanabi 1
//Partial Transformation 1
mob/proc/ReleaseNanabi(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Nanabi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Nanabi!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.tai=src.Mtai*1
		src.nin=src.Mnin*1
		src.gen=src.Mgen*1
		src.chakra+=35
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/NanabiType2) in src.LearnedJutsus))
		if(src.BijuuMastery>=40)
			src.LearnedJutsus+=new /obj/SkillCards/NanabiType2
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'

/////////////////////////////////
//Nanabi 2
//Partial Transformation 1
mob/proc/ReleaseNanabiType2(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Nanabi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Nanabi!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.tai=src.Mtai*1.25
		src.nin=src.Mnin*1
		src.gen=src.Mgen*1.25
		src.chakra+=35
		if(!Control)
			src.health-=35
			src.stamina-=65
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/NanabiType2) in src.LearnedJutsus))
		if(src.BijuuMastery>=200)
			src.LearnedJutsus+=new /obj/SkillCards/FlameFest
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'


mob/proc/NanabiFlameFest(Uses)
	if(src.firing||src.Kaiten||src.TailState==0)
		return
	if(src.inso)
		src<<"Not while in Soutourou!";return
	else
		src.chakra-=1000
		src.Handseals(1-src.HandsealSpeed)
		if(src.HandsSlipped) return
		src.InvulnerableToFire=1
		spawn(20)
			src.InvulnerableToFire=0
		src<<"You heat the air around you with your intense chakra!"
		sleep(11)
		for(var/turf/T in oview(4,src))
			var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=T;K.nin=src.nin;K.Owner=src;K.icon_state="5";K.JutsuLevel=src.KatonKnowledge/4
/////////////////////////////////
//Hachibi 1
//Partial Transformation 1
mob/proc/ReleaseHachibi(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Hachibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Hachibi!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.tai=src.Mtai*1.5
		src.nin=src.Mnin*1
		src.gen=src.Mgen*1
		src.chakra+=35
		if(!Control)
			src.health-=15
			src.stamina-=25
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/HachibiType2) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/HachibiType2
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
/////////////////////////////////
//Hachibi 2
//Partial Transformation 1
obj/Overlay/RedAura
	icon='Icons/Jutsus/Bijuu/kyuubi.dmi'
	icon_state="1"
	layer=5
mob/proc/ReleaseHachibiType2(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Hachibi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=35
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Hachibi!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.tai=src.Mtai*1.75
		src.nin=src.Mnin*1.25
		src.gen=src.Mgen*1.25
		src.chakra+=35
		if(!Control)
			src.health-=25
			src.stamina-=35
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/HachibiType3) in src.LearnedJutsus))
		if(src.BijuuMastery>=100)
			src.LearnedJutsus+=new /obj/SkillCards/HachibiType3
	if(src.TailState==0||src.TailState==2)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'



mob/proc/ReleaseHachibiType3(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Hachibi, forming the second tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=35
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Hachibi!"
	src.TailState=2
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==2)
		src.tai=src.Mtai*2
		src.nin=src.Mnin*1.5
		src.gen=src.Mgen*1.5
		src.chakra+=65
		if(!Control)
			src.health-=35
			src.stamina-=45
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'


/////////////////////////////////
//Doragon 1
//Partial Transformation 1
mob/proc/ReleaseDoragon(Control,Speed)
	if(src.knockedout)
		return
	src<<"You begin to slip a bit of chakra from the Doragon!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Doragon!"
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.ChakraArmor=100
		src.health+=10000
		src.chakra+=10000
		src.stamina+=10000
		src.tai+=10000
		src.nin+=10000
		src.gen+=10000
		src.AgeEXP+=rand(3000,5000)
		sleep(50)
	src.ChakraArmor=0
	src.health=src.maxhealth
	src.chakra=src.Mchakra
	src.stamina=src.maxstamina
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(src.Age>=80)
		src<<"<font color=red size=2>Your body is getting tired. Be careful with this transformation.."
	if(src.Age>=90)
		src<<"<font color=red size=2>Your body is getting extremely tired. Be careful with this transformation.."
	if(src.Age>=100)
		src<<"<font color=red size=2>You've reached Age 100..you're body is giving out.."
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'





/////////////////////////////////
//Kyuubi
//Partial Transformation 1
mob/proc/ReleaseKyuubi0(Control,Speed)
	if(src.knockedout)
		return
		src<<"You begin to slip a bit of chakra from the Kyuubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
		src.icon_state=""
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src<<"You release the power of the Kyuubi!"
	src<<"The Kyuubi slightly heals you!"
	if(src.stamina<=src.maxstamina)
		src.stamina+=src.stamina*0.25
	if(src.health<=src.maxhealth)
		src.health+=src.health*0.25
	src.TailState=0.5
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==0.5)
		src.tai=src.Mtai*1.5
		src.nin=src.Mnin*1.5
		src.gen=src.Mgen*1.5
		src.chakra+=35
		if(src.BijuuMastery<=10)
			src.health-=15
			src.stamina-=35
		sleep(11)
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Kyuubi1) in src.LearnedJutsus))
		if(src.BijuuMastery>=50)
			src.LearnedJutsus+=new /obj/SkillCards/Kyuubi1
	if(src.TailState==0||src.TailState==1)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi.dmi'



//First tail
mob/proc/ReleaseKyuubi1(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Kyuubi, forming the first tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			if(src.TailState==0.5)
				src.chakra+=50
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src.icon_state=""
	src<<"You release the power of the Kyuubi!"
	src.TailState=1
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==1)
		src.tai=src.Mtai*1.75
		src.nin=src.Mnin*1.75
		src.gen=src.Mgen*1.75
		src.ChakraArmor=25
		src.chakra=src.Mchakra*2
		if(!Control)
			src.health-=25
			src.stamina-=45
		sleep(11)
	src.ChakraArmor=0
	src.tai=src.Mtai
	src.nin=src.Mnin
	src.gen=src.Mgen
	if(!(locate(/obj/SkillCards/Kyuubi2) in src.LearnedJutsus))
		if(src.BijuuMastery>=100)
			src.LearnedJutsus+=new /obj/SkillCards/Kyuubi2
	if(src.TailState==0||src.TailState==2)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'


//Second tail
mob/proc/ReleaseKyuubi2(Control,Speed)
	if(src.knockedout)
		return
	src<<"You force more chakra from the Kyuubi, forming the second tail!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			if(src.TailState==1)
				src.chakra+=50
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(11)
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.overlays+='Icons/Jutsus/Bijuu/kyuubi2.dmi'
	src.BijuuMastery+=(rand(1,4)*0.1)
	src.icon_state=""
	src<<"You release the power of the Kyuubi!"
	src.TailState=2
	if(Speed)
		spawn(600)
			src.TailState=0
	while(src.TailState==2)
		src.tai=src.Mtai*2
		src.nin=src.Mnin*2
		src.gen=src.Mgen*2
		src.ChakraArmor=35
		src.chakra=src.Mchakra*2
		if(src.BijuuMastery<=30)
			src.health-=35
			src.stamina-=65
		sleep(11)
	src.ChakraArmor=0
	src.tai=src.Mtai
	if(src.TailState==0)
		src.overlays-='Icons/Jutsus/Bijuu/kyuubi2.dmi'




mob/proc/ReleaseBijuu()
	if(!src.Dead)
		return
	src<<"You feel an overwhelming amount of hatred amassing inside of you..."
	sleep(100)
	src.deathcount=0
	src.knockedout=0
	src.FrozenBind=""
	src.Dead=0
	src.BijuuMastery++
	if(src.Bijuu=="Shukaku")
		src<<"The power of the Shukaku explodes out of you!"
		src.overlays+='ShukakuSand.dmi'
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Nibi")
		src<<"The power of the Nibi seeps out from you!"
		src.overlays+='cataura1.dmi'
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Sanbi")
		src.overlays+='demonturtle.dmi'
		src.overlays+='demonturtletail1O.dmi'
		src.underlays+='demonturtletail1U.dmi'
		src<<"The power of the Sanbi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Yonbi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Yonbi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Gobi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Gobi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Rokubi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Rokubi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Shichibi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Shichibi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Nanabi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Nanabi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Doragon")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi.dmi'
		src<<"The power of the Doragon seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Hachibi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Hachibi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	if(src.Bijuu=="Kyuubi")
		src.overlays+='Icons/Jutsus/Bijuu/kyuubi1.dmi'
		src<<"The power of the Kyuubi seeps out from you!"
		if(prob(30))
			world<<"<b><font color=red>A great and sinister chakra can be felt in the distance!</n>"
		view()<<"<b>You feel an evil and intiminating chakra being released from [src]!"
	spawn(20)
		src<<"You feel your wounds heal and your stamina regenerate!"
		if(src.stamina<=src.maxstamina)
			src.stamina+=src.maxstamina*0.25
		if(src.health<=src.maxhealth)
			src.health+=src.maxhealth*0.25
	src.ImmuneToDeath=1
	spawn(100)
		src.ImmuneToDeath=0
	if(src.Bijuu=="Shukaku")
		src.TailState=0
	else
		src.TailState=1
	var/WearOffTime=90
	src.tai=src.Mtai*6;src.nin=src.Mnin*6;src.gen=src.Mgen*6
	while(src.TailState==1&&WearOffTime>0)
		src.tai=src.Mtai*6;src.nin=src.Mnin*6;src.gen=src.Mgen*6
		src.chakra+=100
		if(src.BijuuMastery<=20)
			src.health-=15
			src.stamina-=15
		WearOffTime--
		sleep(11)
	src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
	src.TailState=0
	src.underlays-='demonturtletail1U.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.overlays-='demonturtle.dmi'
	src.overlays-='cataura1.dmi'
	src.overlays-='ShukakuSand.dmi'
	src.overlays-='Icons/Jutsus/Bijuu/kyuubi1.dmi'
	if(src.Bijuu=="Shukaku")
		if(!(locate(/obj/SkillCards/Shukaku0) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Shukaku0
				src<<"You feel like you can harness the power of the Nibi to an extent now.."
	if(src.Bijuu=="Nibi")
		if(!(locate(/obj/SkillCards/Nibi0) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Nibi0
				src<<"You feel like you can harness the power of the Nibi to an extent now.."
	if(src.Bijuu=="Sanbi")
		if(!(locate(/obj/SkillCards/Sanbi0) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Sanbi0
				src<<"You feel like you can harness the power of the Sanbi to an extent now.."
	if(src.Bijuu=="Yonbi")
		if(!(locate(/obj/SkillCards/Yonbi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Yonbi
				src<<"You feel like you can harness the power of the Yonbi to an extent now.."
	if(src.Bijuu=="Gobi")
		if(!(locate(/obj/SkillCards/Gobi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Gobi
				src<<"You feel like you can harness the power of the Gobi to an extent now.."
	if(src.Bijuu=="Rokubi")
		if(!(locate(/obj/SkillCards/Rokubi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Rokubi
				src<<"You feel like you can harness the power of the Rokubi to an extent now.."
	if(src.Bijuu=="Shichibi")
		if(!(locate(/obj/SkillCards/Shichibi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Shichibi
				src<<"You feel like you can harness the power of the Shichibi to an extent now.."
	if(src.Bijuu=="Nanabi")
		if(!(locate(/obj/SkillCards/Nanabi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Nanabi
				src<<"You feel like you can harness the power of the Nanabi to an extent now.."
	if(src.Bijuu=="Doragon")
		if(!(locate(/obj/SkillCards/Doragon) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Doragon
				src<<"You feel like you can harness the power of the Doragon to an extent now.."
	if(src.Bijuu=="Hachibi")
		if(!(locate(/obj/SkillCards/Hachibi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Hachibi
				src<<"You feel like you can harness the power of the Hachibi to an extent now.."
	if(src.Bijuu=="Kyuubi")
		if(!(locate(/obj/SkillCards/Kyuubi0) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Kyuubi0
				src<<"You feel like you can harness the power of the Kyuubi to an extent now.."
// BEGIN_INTERNALS
// END_INTERNALS
// BEGIN_FILE_DIR
#define FILE_DIR .
#define FILE_DIR "8 Swords"
// END_FILE_DIR
// BEGIN_PREFERENCES
// END_PREFERENCES
// BEGIN_INCLUDE
// END_INCLUDE
