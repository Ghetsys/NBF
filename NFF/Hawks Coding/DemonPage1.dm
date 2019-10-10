mob/var
	TailState=0
	Bijuu=""
	BijuuMastery=0
mob/proc/ReleaseKyuubi(Control=0,Speed=0)
	if(Control)
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
		src.overlays-='Icons/New Base/kyuubi.dmi'
		src.overlays+='Icons/New Base/kyuubi.dmi'
		src.BijuuMastery+=(rand(1,4)*0.1)
		src<<"The power of the Nine tailed fox flows out from you!"
		spawn(20)
			src<<"You feel your wounds heal and your stamina regenerate!"
			if(src.stamina<=src.maxstamina)
				src.stamina+=src.maxstamina*0.50
			if(src.health<=src.maxhealth)
				src.health+=src.maxhealth*0.20
		src.TailState=0.5
		var/WearOffTime=90
		if(Speed)
			WearOffTime+=60
		src.tai=src.Mtai*1.3;src.nin=src.Mnin*1.3;src.gen=src.Mgen*1.3
		while(src.TailState==0.5&&WearOffTime>0)
			src.tai=src.Mtai*1.3;src.nin=src.Mnin*1.3;src.gen=src.Mgen*1.3
			src.chakra+=25
			WearOffTime--
			sleep(11)
		src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
		src.TailState=0
		src.overlays-='Icons/New Base/kyuubi.dmi'
		if(!(locate(/obj/SkillCards/Kyuubi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Kyuubi
				src<<"You feel like you can harness the power of the Nine Tailed Fox to an extent now.."
mob/proc/ReleaseJuubi(Control=0,Speed=0)
	if(Control)
		if(src.knockedout)
			return
		src<<"You begin to slip a bit of chakra from the Juubi"
		if(!Speed)
			src.icon_state="Power"
			var/X=rand(5,10)
			while(X>0)
				src.chakra+=100
				if(src.icon_state!="Power")
					src<<"You drop concentration!";X=0
				X--
				sleep(11)
			src.icon_state=""
		src.overlays-='Icons/Jutsus/Bijuu/Juubi.dmi'
		src.overlays+='Icons/Jutsus/Bijuu/Juubi.dmi'
		src.BijuuMastery+=(rand(1,4)*0.1)
		src<<"The power of the Ten Tailed Juubi flows out from you!"
		spawn(20)
			src.deathcount--
			src<<"You feel your wounds heal and your stamina regenerate!"
			if(src.stamina<=src.maxstamina)
				src.stamina+=src.maxstamina*0.25
			if(src.health<=src.maxhealth)
				src.health+=src.maxhealth*0.05
		src.TailState=0.5
		var/WearOffTime=90
		if(Speed)
			WearOffTime+=60
		src.tai=src.Mtai*1.2;src.nin=src.Mnin*1.2;src.gen=src.Mgen*1.2
		while(src.TailState==0.5&&WearOffTime>0)
			src.tai=src.Mtai*1.5;src.nin=src.Mnin*1.5;src.gen=src.Mgen*1.5
			src.chakra+=100
			WearOffTime--
			sleep(15)
		src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
		src.TailState=0
		src.overlays-='Icons/Jutsus/Bijuu/Juubi.dmi'
		if(!(locate(/obj/SkillCards/Juubi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Juubi
				src<<"You feel like you can harness the power of the Juubi to an extent now.."

mob/proc/ReleaseNibi(Control=0,Speed=0)
	if(Control)
		if(src.knockedout)
			return
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
		src.overlays-='Icons/New Base/cataura.dmi'
		src.overlays+='Icons/New Base/cataura.dmi'
		src.BijuuMastery+=(rand(1,4)*0.1)
		src<<"The power of the Two Tailed Cat flows out from you!"
		spawn(20)
			src<<"You feel your wounds heal and your stamina regenerate!"
			if(src.stamina<=src.maxstamina)
				src.stamina+=src.maxstamina*0.25
			if(src.health<=src.maxhealth)
				src.health+=src.maxhealth*0.25
		src.TailState=0.5
		var/WearOffTime=90
		if(Speed)
			WearOffTime+=60
		src.tai=src.Mtai*1.5;src.nin=src.Mnin*1.5;src.gen=src.Mgen*1
		while(src.TailState==0.5&&WearOffTime>0)
			src.tai=src.Mtai*1.5;src.nin=src.Mnin*1.5;src.gen=src.Mgen*1
			src.chakra+=15
			WearOffTime--
			sleep(11)
		src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
		src.TailState=0
		src.overlays-='Icons/New Base/cataura.dmi'
	else
		if(!src.Dead)
			return
		src<<"You feel an overwhelming amount of hatred amassing inside of you..."
		sleep(100)
		src.deathcount=0
		src.knockedout=0
		src.FrozenBind=""
		src.Dead=0
		src.BijuuMastery++
		src.overlays-='Icons/New Base/cataura.dmi'
		src.overlays+='Icons/New Base/cataura.dmi'
		src<<"The power of the Two Tailed Cat seeps out from you!"
		spawn(20)
			src<<"You feel your wounds heal and your stamina regenerate!"
			if(src.stamina<=src.maxstamina)
				src.stamina+=src.maxstamina*0.25
			if(src.health<=src.maxhealth)
				src.health+=src.maxhealth*0.25
		src.ImmuneToDeath=1
		spawn(100)
			src.ImmuneToDeath=0
		src.TailState=0.5
		var/WearOffTime=90
		src.tai=src.Mtai*1.5;src.nin=src.Mnin*1.5;src.gen=src.Mgen*1
		while(src.TailState==0.5&&WearOffTime>0)
			src.tai=src.Mtai*1.5;src.nin=src.Mnin*1.5;src.gen=src.Mgen*1
			src.chakra+=100
			if(!Control)
				src.health-=15
				src.stamina-=15
			WearOffTime--
			sleep(11)
		src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
		src.TailState=0
		src.overlays-='Icons/New Base/cataura.dmi'
		if(!(locate(/obj/SkillCards/Nibi) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Nibi
				src<<"You feel like you can harness the power of the Two Tailed Cat to an extent now.."


mob/proc/ReleaseRehiam(Control=0,Speed=0)
	if(Control)
		if(src.knockedout)
			return
		src<<"You begin to slip a bit of chakra from Rehiam!"
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
		src.overlays-='Icons/Jutsus/Bijuu/Rehiam.dmi'
		src.overlays+='Icons/Jutsus/Bijuu/Rehiam.dmi'
		src.BijuuMastery+=(rand(1,4)*0.1)
		src<<"The power of Rehiam flows out from you!"
		spawn(20)
			src<<"You feel your wounds heal and your stamina regenerate!"
			if(src.stamina<=src.maxstamina)
				src.stamina+=src.maxstamina*0.45

			if(src.health<=src.maxhealth)
				src.health+=src.maxhealth*0.45
		src.TailState=1
		var/WearOffTime=90
		if(Speed)
			WearOffTime+=60
		src.tai=src.Mtai*2;src.nin=src.Mnin*1.5;src.gen=src.Mgen*2
		while(src.TailState==0.5&&WearOffTime>0)
			src.tai=src.Mtai*2;src.nin=src.Mnin*1.5;src.gen=src.Mgen*2
			src.chakra+=100
			WearOffTime--
			sleep(11)
		src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
		src.TailState=0
		src.overlays-='Icons/Jutsus/Bijuu/Rehiam.dmi'
	else
		if(!src.Dead)
			return
		src<<"You feel an overwhelming amount of hatred amassing inside of you..."
		sleep(100)
		src.deathcount=0
		src.knockedout=0
		src.FrozenBind=""
		src.Dead=0
		src.BijuuMastery++
		src.overlays-='Icons/Jutsus/Bijuu/Rehiam.dmi'
		src.overlays+='Icons/Jutsus/Bijuu/Rehiam.dmi'
		src<<"The power of Rehiam bursts out from you!"
		spawn(20)
			src<<"You feel your wounds heal and your stamina regenerate!"
			if(src.stamina<=src.maxstamina)
				src.stamina+=src.maxstamina*0.75
			if(src.health<=src.maxhealth)
				src.health+=src.maxhealth*0.75
		src.ImmuneToDeath=1
		spawn(100)
			src.ImmuneToDeath=0
		src.TailState=1
		var/WearOffTime=90
		src.tai=src.Mtai*2;src.nin=src.Mnin*1.5;src.gen=src.Mgen*2
		while(src.TailState==0.5&&WearOffTime>0)
			src.tai=src.Mtai*2;src.nin=src.Mnin*1.5;src.gen=src.Mgen*2
			src.chakra+=100
			if(!Control)
				src.health-=15
				src.stamina-=15
			WearOffTime--
			sleep(11)
		src.tai=src.Mtai;src.nin=src.Mnin;src.gen=src.Mgen
		src.TailState=0
		src.overlays-='Rehiam.dmi'
		if(!(locate(/obj/SkillCards/Rehiam) in src.LearnedJutsus))
			if(src.BijuuMastery>=10)
				src.LearnedJutsus+=new /obj/SkillCards/Rehiam
				src<<"You feel like you can harness the power of Rehiam to an extent now.."