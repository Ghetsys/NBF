mob/var/ConversusinThirdStageMastery=0
mob/var/ConversusinThirdStage=0
mob/var/AbleToGetConversusin=0
mob/var/tmp/Venatu=0
mob/var/tmp/EyesOfHell=0
mob/var/tmp/InSemideusChakraArm=0
mob/var/SemideusLeader=0
mob/var/SemideusMember=0


mob/var/tmp/NonExist=0
mob/proc/GhostParasite()
	if(src.GhostParasite)
		for(var/obj/SkillCards/NonExistance/P in src.LearnedJutsus)
			del(P)
		src<<"You relinquish your Ghost-like properties.."
		src.GhostParasite=0
	//	src.density=1
		return
	src.GhostParasite=1;
	src<<"You begin to acquire the spiritualistic properties of a spirit.."
	if(!(locate(/obj/SkillCards/NonExistance) in src.LearnedJutsus))
		src.LearnedJutsus+=new/obj/SkillCards/NonExistance
//	while(src.GhostParasite)
//		src.density=0;src.chakra-=100;sleep(20)
//	src.density=1

mob/proc/NonExist()//Kinda like Phase
	if(!src.GhostParasite)
		src<<"You need to be in Ghost Parasite mode to use this jutsu!"
		return
	if(src.NonExist)
		src<<"You begin to once again exist..."
		src.icon=src.Oicon
		src.overlays+=src.hair
		src.overlays+=usr.Overlays
		src.NonExist=0
		src.density=1
		return
	src.NonExist=1
	src<<"You begin to lose your humanity and fade away like a spirit..."
	src.Oicon=src.icon
	src.Overlays=src.overlays.Copy()
	src.icon=src.pic2()
	src.overlays=list()
//	var/BlendBy = 225-140//175
//	src.icon-=rgb(0,0,0,BlendBy)//Transperancy depends on NinKnow. Cap at 200.
	while(src.NonExist)
		src.density=0;src.chakra-=100;sleep(20)
	src.density=1























mob/proc/ConversusinBestialisAnguis()
	if(src.ConversusinEye)
		src<<"You release your mysterious cat like Eyes..";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.ConversusinEye=0;src.Focus=src.OldFocus;return
	else if(src.ConversusinSecondStage)
		src.ConversusinChargeUp=0
		src.ConversusinSecondStage=0
		src<<"You've turned off the second Stage.";return
	else
		usr.ChangeEyeStyle(usr.EyeStyle,255,215,0)
		var/image/I = new('Icons/Jutsus/CatDoujutsu.dmi');I.pixel_y=32;I.layer=6
		if(!(locate(/obj/SkillCards/ConversusinSecond) in src.LearnedJutsus))
			if(src.ConversusinMastery>=300)
				src.LearnedJutsus+=new/obj/SkillCards/ConversusinSecond
				src<<"<font color=yellow size=2>You have unlocked a stronger transformation!</font>"
		if(src.ConversusinMastery<=100)
			src.OldFocus=src.Focus;src.Focus*=1.1
			I.icon_state="Tomoe1"
			view()<<"[src]'s eyes pulse the color Yellow!"
		if(src.ConversusinMastery>100&&src.ConversusinMastery<=250)
			src.OldFocus=src.Focus;src.Focus*=1.15
			I.icon_state="Tomoe1"
			view()<<"[src]'s pupils become slanted, and their irises flash a bright yellow!"
		if(src.ConversusinMastery>=250)
			src.OldFocus=src.Focus;src.Focus*=1.25
			I.icon_state="Tomoe1"
			view()<<"[src]'s pupils become slanted, and their irises flash a bright yellow! The power of Dragons flow within him!"
			usr.overlays+='SageModeAura.dmi'
	//		if(src.ConversusinMastery>=300)
	//			src<<"You're able to go to a stronger stage of Bestialis Anguis. Hold Down Z for 45 seconds while standing still!"
		src.overlays+=I
		spawn(30)
			src.overlays-=I
			src.overlays-='SageModeAura.dmi'
		src.ConversusinEye=1
		while(src.ConversusinEye)
			var/A=src.ConversusinMastery
			if(A<1) A=1
			var/ChakraDrain=(src.Mchakra/(A*15))
			if(ChakraDrain>65)
				ChakraDrain=65
			if(ChakraDrain<10)
				ChakraDrain=10
			src.chakra-=ChakraDrain
			if(prob(5))
				src.ConversusinMastery+=pick(0.6,0.7,0.8,0.9,1)
			if(src.Charging&&prob(8))
				src.ConversusinMastery+=pick(0.8,0.9,1)
			sleep(25)
mob/proc/ConversusinBestialisAnguisSecondStage()
	if(src.ConversusinEye)
		src.Focus=src.OldFocus
		src.ConversusinEye=0
		src.ConversusinChargeUp=0
	else if(src.ConversusinSecondStage)
		src.ConversusinChargeUp=0
		src.ConversusinSecondStage=0
		src<<"You've turned off the second Stage...."
		return
	view()<<"[src] unleashes into a more powerful form, growing claws and a Dragon's tail!"
	src<<"You've unleashed the second stage of Conversusin: Bestialis Anguis!"
	src.stamina=src.maxstamina*1.5
	sleep(15)
	src.overlays+=""//Need to add the icon for Claws
	src<<"You've grown Claws! Your taijutsu damage now hurts vitality!"
	src.ConversusinSecondStage=1
	if(src.ConversusinSecondStageMastery>=300)
		src<<"You're able to go to the final stage of Bestialis Anguis. Hold Down Z for 45 seconds while standing still!"
	while(src.ConversusinSecondStage==1)
		if(src.ConversusinSecondStageMastery<=50)
			src.health-=50
		if(src.ConversusinSecondStageMastery>=50&&src.ConversusinSecondStageMastery<=125)
			src.health-=rand(25,35)
		if(src.ConversusinSecondStageMastery>125&&src.ConversusinSecondStageMastery<=175)
			src.health-=rand(20,30)
		if(src.ConversusinSecondStageMastery>175&&src.ConversusinSecondStageMastery<=250)
			src.health-=rand(10,15)
		if(src.ConversusinSecondStageMastery>250)
			src.health-=rand(2,5)
		if(prob(4))
			src.ConversusinSecondStageMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
		if(src.Charging&&prob(9))
			src.ConversusinSecondStageMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
		sleep(15)

mob/ConversusinVerb/verb
	EyesOnFire()
		set name = "Eyes of Hell"
		set category = "Transformation"
		set hidden=0
		if(src.ConversusinThirdStage==0)
			src<<"Bug.";return
		if(src.EyesOfHell==2)
			src<<"You release the hellfire...";src.EyesOfHell=0;return
		src<<"Your eyes burn like the fiery depths of hell..."
		src.EyesOfHell=2
	ConversusinThirdStageRelease()
		set name = "Release Third Stage"
		set category = "Transformation"
		set hidden=0
		if(src.ConversusinThirdStage)
			if(src.EyesOfHell!=0)
				src.EyesOfHell=0
			src.ConversusinBestialisAnguisThirdStage()
	Venatu()
		set name = "Venatu"
		set category = "Transformation"
		set hidden=0
		if(src.Venatu)
			src.Venatu=0
			src<<"You reduce your speed back to human levels."
			return
		if(src.ConversusinThirdStage)
			src.Venatu=1
			src<<"Your speed is increased dramatically!"
			src.VenatuDrain()
mob/proc/VenatuDrain()
	while(src.Venatu)
		(src.ChakraPool)-=(src.ChakraPool*0.02)
		if(src.ChakraPool<=0)
			src.ChakraPool=0
			src<<"Your Chakra Levels are too low! Your body rejects Venatu and your speed goes back to human levels."
			src.Venatu=0
			return
		sleep(10)



mob/proc/ConversusinBestialisAnguisThirdStage()
	if(src.ConversusinThirdStage)
		src.ConversusinThirdStage=0
		src.EyesOfHell=0
		src.Venatu=0
		src<<"You go back to your human form, losing all of your demonic qualities..."
		src.deathcount+=pick(0.5,1,1.5)
		src.health-=150
		src.stamina-=(src.maxstamina*0.25)
		src.verbs-=typesof(/mob/ConversusinVerb/verb)
		return
	if(src.ConversusinSecondStage)
		src.ConversusinSecondStage=0
	//	src.overlays-="";src.overlays-=""
		src<<"You release the second stage!"
//	if(src.ConversusinEye)
//		src<<"You release your mysterious cat like Eyes..";usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);src.ConversusinEye=0
//		src.ConversusinEye=0;
//		src.ConversusinChargeUp=0
	view()<<"[src] unleashes into a Demonic Being! Growing Horns and a set of Wings...."
	src.ConversusinThirdStage=1
	src.nin=src.Mnin*2.35
	src.chakra=(src.Mchakra*1.8)
	src.verbs+=typesof(/mob/ConversusinVerb/verb)
	//	src.overlays-="";src.overlays-="";src.overlays+="";src.overlays++//Space for all the icons
	while(ConversusinThirdStage)
		if(src.knockedout)
			view()<<"[src] faints causing them to lose their demonic appearance...."
			src.verbs-=typesof(/mob/ConversusinVerb/verb)
			src.ConversusinThirdStage=0
			src.EyesOfHell=0
			src.Venatu=0
			return
		if(src.ChakraPool>0)
			src.ChakraPool-=(pick(20,50)*(src.EyesOfHell+1))
		else
			src.health-=(pick(10,15)*(src.EyesOfHell+1))
		src.health-=(pick(10,15)*(src.EyesOfHell+1)) //This is to make sure that the boost applies properly
		src.stamina+=(src.maxstamina*0.01)
		if(src.stamina>=src.maxstamina)
			src.stamina=src.maxstamina
		sleep(15)


/*
During the final stage of the transformation, the user would acquire both a pair of horns, and a set of wings. This would increase their chance of nullifying damage from 15 to 35%, and would increase the damage of their ninjutsu by 2.35x. The user also gains an additional 100 focus while in this form. This form would grant an additional two abilities, which could be found under a "Transformation" tab.
The abilities would be
	- Eyes on Fire: This would triple the drains on the player. While in this form, the user grants an additional +1 reflex, in addition to the 20 already in place from phase 1, along with a 50% chance to dodge attacks. While in this form, the user's punches have a 35% chance to cause internal bleeding, and a 15% chance to cause the target to enter the burned condition. A charged punch in this form would result in the user spewing flames from his/her mouth. Would essentially be a charged goukakyuu, though white in color, and dealing 450 stamina damage, and 150 vitality damage to those standing within it. Would also inflict a burned status.
	- Venatu: The Hunt: The user loses an additional 2% from their chakra reservoir while this mode is toggled on. It allows the user to teleport to an attacked target, similarly to gates.

While in this form, the user's chakra would be boosted a thousand fold. This form draws power from both the user's chakra reservoir, and vitality, resulting in a steady depletion of each. The form lasts until the user is KOed; if the user runs out of chakra reservoir, the drain for vitality becomes doubled. In addition to the massive chakra boost, the user's stamina is also slowly regenerated while in this form.
*/




mob/var/IndigoMastery=0
mob/var/tmp/IndigoBlock=0
mob/var/tmp/Indigo=0

mob/proc/IndigoIlluminate()
	if(!src.Indigo)
		src<<"You need Indigo on!";return
	else
		src<<"You focus your Indigo to see chakra."
		src.IlluminateOff()
		src.ChakraSight(0)
		src.Illuminate()
		src.ChakraSight(1)

mob/proc/IndigoEyes()
	if(src.Indigo)
		src<<"You release your Indigo."
		usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);
		src.Indigo=0;
		src.IlluminateOff();
		src.IndigoBlock=0
	//	src.GenjutsuCounterMode=0;
	//	src.SharCounter=0;
	//	src.CopyMode=0;
		src.ChakraSight(0);
		for(var/obj/SkillCards/IndigoIlluminate/Z in usr.LearnedJutsus)
			del(Z)
		src.UpdateInv()
		return
	else
		if(!src.Indigo)
			src.icon_state="1";
			usr.ChangeEyeStyle(usr.EyeStyle,111,0,255)
			var/image/I = new('Icons/Jutsus/IndigoDoujutsu.dmi');
			I.pixel_y=32;
			I.layer=6
			if(!(locate(/obj/SkillCards/IndigoIlluminate) in src.LearnedJutsus))
				src.LearnedJutsus+=new/obj/SkillCards/IndigoIlluminate
			if(src.IndigoMastery<60)
				view()<<"[src]'s eyes shine indigo!";
				I.icon_state="Tomoe1"
			if(src.IndigoMastery<130&&src.IndigoMastery>=60)
				view()<<"[src]'s eyes shine dark indigo!";
				I.icon_state="Tomoe1"
				src.HandsealSpeed=40
				src.IndigoBlock=1
			else if(src.IndigoMastery>=130)
				view()<<"[src]'s eyes shine darker indigo!";
				src.HandsealSpeed=40
				src.IndigoBlock=1
				I.icon_state="Tomoe1"
			else if(src.IndigoMastery>250)
				src.HandsealSpeed=40
				src.IndigoBlock=1
				view()<<"[src]'s eyes shines the darkest shade of indigo, revealing a dark indigo that resembles the most evil form of darkness and despair."
			//	src.LearnedJutsus+=new/obj/SkillCards/SharinganFocus
		//	if(src.IndigoMastery>=31)
		//		src<<"You can see through taijutsu techniques a lot better now!";usr.SharCounter=1
		//	if(src.IndigoMastery>=61)
		//		src.LearnedJutsus+=new/obj/SkillCards/SharinganIlluminate
		//		src<<"You can see through taijutsu techniques on a high level!";src.SharCounter=2
			src.UpdateInv()
			src.overlays+=I
			spawn(30)
				src.overlays-=I
				del(I)
			src.Indigo=1;
			src.Illuminate();
			sleep(30);
			src.ChakraSight(1)
			while(src.Indigo)
				var/A=src.IndigoMastery
				if(A<1) A=1
				var/ChakraDrain=(src.Mchakra/(A*15))
				if(ChakraDrain>65)
					ChakraDrain=65
				if(ChakraDrain<5)
					ChakraDrain=5
				src.chakra-=ChakraDrain
				if(prob(1))
					src.IndigoMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
				if(src.Charging&&prob(3))
					src.IndigoMastery+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
				sleep(25)


mob/special/verb
	AdminAnnounceRemoval()
		set name = "Admin Announce Removal"
		set category = "Staff"
		if(AnnounceTurnedOff==0)
			src<<"Admins can no longer use Announce. Take note that Owners may still use Announce."
			AnnounceTurnedOff=1
		else
			src<<"Admins are able to use Announce again."
			AnnounceTurnedOff=0
	Shunpo()
		set name = "Shunpo: Flash Step"
		set category = "Commands"
		if(BodyFlickerFlight==1)
			src<<"You have deactivated Shunpo."
			BodyFlickerFlight=0
		else
			src<<"You have activated Shunpo! Using Body Flicker now only takes one click and is activated as long as this mode is activated!"
			BodyFlickerFlight=1
mob/proc/Mystical_Hand_Technique_Advanced(Uses)
	if(src.firing||src.knockedout)
		return
	if(src.target)
		src.dir=get_dir(src,src.target)
	flick("throw",src)
	src.ChakraDrain(30000)
	src.ChakraPool-=200
	if(!src.client)
		spawn(3)
			src.health=0
			src.Death(src)
	if(src.HoldingR)
		for(var/mob/M in get_step(src,src.dir))
			M<<"[src] uses a large portion of his chakra to seep into your body..."
			src<<"You put your chakra into a large proportion and place it inside [M]!"
			if(M.client&&M.Dead&&!PermDeath&&!M.CBleeding)
				M.Dead=0
				M.icon_state=""
				M.FrozenBind=""
				M.sight&=~(SEE_SELF|BLIND)
				M.health=M.maxhealth
				M.stamina=M.maxstamina
				M.chakra=M.Mchakra*0.45
				orange(12,M)<<"<font size = 2>[M] was revived from the brink of death!</font>"
			src<<"Your body shuts down!"
			src.DeathStruggle(src,1)
	else
		for(var/mob/M in get_step(src,src.dir))
			M<<"[src] uses his chakra seeps into your body..."
			src<<"You begin to heal [M] by placing your chakra into their body...."
	//		var/Z=30+Uses
	//		if(Z>100)
	//			Z=100
	//		if(prob(Z))
			if(M.StruggleAgainstDeath>0)
//				if(prob(Uses/10))
				M.Struggle+=90
		//	var/randz=rand(1,2)
			var/heal=pick(550,600)
			if(src.ARank=="Healer")
				heal+=rand(50,100)
			if(Uses>300)
				heal+=pick(200,350)
		//	if(randz==1||src.ARank=="Healer")
		//	if((M.health<M.maxhealth)&&(M.stamina<M.maxstamina))
			M.health+=heal*1.5
			M.stamina+=heal*1.5
			src<<output("You healed [heal] health and Stamina.","Attack")
			if(M.Status!=""&&(src.Cure==1))
				M.Status=""
				M<<"[src] has cured your Ailment."
				return
			M.deathcount-=0.9
			src.deathcount+=0.3
			if(prob(40))
				M.deathcount-=0.8
				if(M.deathcount<0)
					M.deathcount=0
			if(M.chakra<M.Mchakra)
				M.chakra+=rand(400,550)
				if(M.chakra>=M.Mchakra)
					M.chakra=M.Mchakra
			if(M.health>M.maxhealth)
				M.health=M.maxhealth
			if(M.stamina>M.maxstamina)
				M.stamina=M.maxstamina
			if(M.Status=="")
				M.Status="HealingSensation";M.StatusEffected=10
			if(M.client&&M.Dead&&M.health>=M.maxhealth/2&&!PermDeath&&!M.CBleeding)
				M.Dead=0
				M.icon_state=""
				M.FrozenBind=""
				M.sight&=~(SEE_SELF|BLIND)
				orange(12,M)<<"<font size = 2>[M] was revived from the brink of death!</font>"
			if(M.screwed)
				if(prob(src.Focus*rand(-5,5)))
					M.screwed=0;M<<"Your nerves were healed.";src<<"You healed their nerves."
			if(M.CBleeding)
				if(prob(usr.Focus*rand(-5,5)))
					M.CBleeding=0;M<<"Your no longer bleeding.";src<<"Your healed their internal bleeding."

mob/proc/SemideusChakraArmReach()
//	var/Check=0
	if(src.firing||src.Frozen||src.knockedout)
		return
	else
		src.ChakraDrain(30000);
		flick("Attack2",src);src<<"You're frozen while this is on. Press Z to end the jutsu early. Click X to cause the jutsu to execute!"
		var/obj/Jutsu/SemideusChakraArmTip/A=new();A.Owner=src;A.dir=src.dir;A.nin=src.nin*1.5;A.Grabbed=1//A.MainHead=1
		if(src.dir==NORTH) A.loc=locate(src.x,src.y+1,src.z)
		if(src.dir==SOUTH) A.loc=locate(src.x,src.y-1,src.z)
		if(src.dir==EAST) A.loc=locate(src.x+1,src.y,src.z)
		if(src.dir==WEST) A.loc=locate(src.x-1,src.y,src.z)
		if(src.dir==NORTHEAST) A.loc=locate(src.x+1,src.y+1,src.z)
		if(src.dir==NORTHWEST) A.loc=locate(src.x-1,src.y+1,src.z)
		if(src.dir==SOUTHEAST) A.loc=locate(src.x+1,src.y-1,src.z)
		if(src.dir==SOUTHWEST) A.loc=locate(src.x-1,src.y-1,src.z)
		walk(A,src.dir);src.InSemideusChakraArm=1
		while(A)
			src.Frozen=1;src.icon_state="throw";sleep(1)
		src.Frozen=0;src.icon_state="running";src.InSemideusChakraArm=0;
mob/proc/SemideusChakraArmPush()
	if(src.firing||src.Frozen||src.knockedout)
		return
	else
		src.ChakraDrain(30000);
		src<<"You relase Chakra Arms all around your body to protect you!"
		var/obj/Jutsu/SemideusChakraArmTip/A=new();A.loc=src.loc;A.nin=src.nin;A.name="[src]";A.Owner=src;A.Move_Delay=0;walk(A,EAST,0);A.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/B=new();B.loc=src.loc;B.nin=src.nin;B.name="[src]";B.Owner=src;B.Move_Delay=0;walk(B,WEST,0);B.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/C=new();C.loc=src.loc;C.nin=src.nin;C.name="[src]";C.Owner=src;C.Move_Delay=0;walk(C,NORTH,0);C.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/D=new();D.loc=src.loc;D.nin=src.nin;D.name="[src]";D.Owner=src;D.Move_Delay=0;walk(D,SOUTH,0);D.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/E=new();E.loc=src.loc;E.nin=src.nin;E.name="[src]";E.Owner=src;E.Move_Delay=0;walk(E,NORTHEAST,0);E.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/F=new();F.loc=src.loc;F.nin=src.nin;F.name="[src]";F.Owner=src;F.Move_Delay=0;walk(F,NORTHWEST,0);F.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/G=new();G.loc=src.loc;G.nin=src.nin;G.name="[src]";G.Owner=src;G.Move_Delay=0;walk(G,SOUTHEAST,0);G.Pushing=1
		var/obj/Jutsu/SemideusChakraArmTip/H=new();H.loc=src.loc;H.nin=src.nin;H.name="[src]";H.Owner=src;H.Move_Delay=0;walk(H,SOUTHWEST,0);H.Pushing=1
obj/Jutsu/SemideusChakraArmTrail
	icon='ChakraArm.dmi'
	icon_state="Trail"
	density=0
	var/nin=100
	var/HeadingBack=0
	New()
		..()
		spawn()
			while(src)
				sleep(8)
		spawn(100)
			del(src)

obj/Jutsu/SemideusChakraArmTip
	icon='ChakraArm.dmi'
	icon_state="Tip"
	density=1
	layer=MOB_LAYER+1
	var/nin=100
	var/Grabbed=0
	var/Pushing=0
	proc
		Crush()
			var/mob/O=src.Owner
			O.ChakraDrain(40000)
			src.Grabbed=0
		//	src.MainHead=0
			walk(src,0)
			src.icon_state="Crush"
			for(var/mob/M in src.loc)
			//	M.Overlays+=src

				if(!M.Mogu)
					var/damage=(O.NinSkill+35)*1.5;M.DamageProc(damage,"Health",O)
					view(M)<<output("<font color=purple size=2>[M] has been crushed!([damage])</font>","Attack")
					spawn() M.Bloody()
					spawn() M.Bloody()
					spawn() M.Bloody()
					spawn() M.Bloody()
					spawn() src.SoundEngine('SFX/Slice.wav',10)
					spawn() src.SoundEngine('SFX/Slice.wav',10)
					spawn() src.SoundEngine('SFX/Slice.wav',10)
			//		spawn(20) M.Overlays-=src
	New()
		..()
		spawn()
			while(src)
				sleep(8)
		spawn(100)
			del(src)
	Move()
		var/obj/Jutsu/SemideusChakraArmTrail/L=new();L.loc=src.loc;L.dir=src.dir;L.HeadingBack=0;L.Owner=src.Owner;//L.JutsuLevel=src.JutsuLevel
		..()
	Bump(A)
		..()
		if(ismob(A))
			var/mob/M=A
			var/mob/O=src.Owner
			var/damage=O.NinSkill*2+35
			if(damage>300)
				damage=300
			if(src.Pushing==1)
				M.dir=src.dir
				M.HitBack(2,src.dir)
			view(M)<<output("<font color=purple size=2>[M] has been hit by the strange arm!([damage])</font>","Attack");src.Grabbed=1
			M.DamageProc(damage,"Health",O)
			spawn() M.Bloody()
			spawn() M.Bloody()
			spawn() M.Bloody()
			spawn() M.Bloody()
			spawn() src.SoundEngine('SFX/Slice.wav',10)
			spawn() src.SoundEngine('SFX/Slice.wav',10)
			spawn() src.SoundEngine('SFX/Slice.wav',10)
			src.loc=M.loc
			var/Length=9
			while(Length&&src.Grabbed)
			//	M.Stun+=1.5
				if(locate(A) in oview(1,O))
					return
				Length--
				M.dir=src.dir
				walk_to(src,O)
				sleep(2)
				walk_to(M,O)
				sleep(1)
		//		walk(src,0)
			var/lastin=3
			while(lastin)
				M.StunAdd(10);lastin--;sleep(11)
			M.Stun=0;del(src)
		if(istype(A,/obj/)&&src.Pushing==1)
			var/obj/ZZ=A
			if(istype(ZZ,/obj/Jutsu/Elemental/))
				var/obj/Jutsu/Elemental/ZZZ=ZZ
				del(ZZ)
				del(ZZZ)
/*
			S.owner=usr
			S.loc=locate(src.x,src.y,src.z)
			var/Length=6
			while(Length&&S.NoCatch)
				Length--
				var/obj/D=new/obj/DickFace(locate(S.x,S.y,S.z))
				D.dir=src.dir
				step(S,usr.dir)
				sleep(1)
				*/




/*
EisouTrail
		icon_state="GianTrail"
		density=1
		var/nin=100
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
		//			for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
		//				if(!Z.Electrocuted)
		//					Z.Electrocuted=1
		//					var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(100)
				del(src)
	EisouHead
		icon_state = "GianHead"
		density = 1
		JutsuLevel=1
		layer=MOB_LAYER+1
		var/nin=100
		var/MainHead=0
		proc
			Execute()
				var/mob/O=src.Owner
				O.ChakraDrain(40000)
				src.MainHead=0
				walk(src,0)
				for(var/turf/T in oview(1,src))
					spawn()
						var/obj/Jutsu/Elemental/Raiton/EisouHead/A=new();A.Owner=O;A.JutsuLevel=O.RaitonKnowledge;A.nin=O.ChidoriD/2;A.layer=MOB_LAYER+1
						A.loc=src;step_towards(A,T)
						if(A.dir==SOUTH)
							A.pixel_y= 16
						if(A.dir==NORTH)
							A.pixel_y= -16
						if(A.dir==EAST)
							A.pixel_x= -16
						if(A.dir==WEST)
							A.pixel_x= 16
						if(A.dir==NORTHEAST)
							A.pixel_y= -16;A.pixel_x= -16
						if(A.dir==NORTHWEST)
							A.pixel_y= -16;A.pixel_x= 16
						if(A.dir==SOUTHEAST)
							A.pixel_y = 16;A.pixel_x= -16
						if(A.dir==SOUTHWEST)
							A.pixel_y = 16;A.pixel_x= 16
				for(var/mob/M in src.loc)
					if(!M.Mogu)
						var/damage=500;M.DamageProc(damage,"Health",O)
						view(M)<<output("<font color=yellow size=2>[M] has been executed!([damage])</font>","Attack")
						spawn() M.Bloody()
						spawn() M.Bloody()
						spawn() M.Bloody()
						spawn() M.Bloody()
						spawn() src.SoundEngine('SFX/Slice.wav',10)
						spawn() src.SoundEngine('SFX/Slice.wav',10)
						spawn() src.SoundEngine('SFX/Slice.wav',10)
		New()
			..()
			spawn()
				while(src)
					sleep(8)
					src.SoundEngine('SFX/LightningSFX.wav',10)
					for(var/obj/Jutsu/Elemental/Doton/Z in src.loc)
						if((Z.JutsuLevel/2)>src.JutsuLevel) del(src)
						else del(Z)
					for(var/obj/Jutsu/Elemental/Suiton/Z in src.loc)
						if(!Z.Electrocuted)
							Z.Electrocuted=1
							var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();AA.loc=locate(src.x+1,src.y,src.z);AA.Owner=src.Owner

			spawn(100)
				del(src)
		Move()
			var/obj/Jutsu/Elemental/Raiton/EisouTrail/L=new();L.loc=src.loc;L.dir=src.dir;L.Owner=src.Owner;L.JutsuLevel=src.JutsuLevel
			if(!src.MainHead)
				L.layer=MOB_LAYER+1
			..()
		Bump(A)
			..()
			if(istype(A,/mob/Kibaku/))
				var/mob/Kibaku/M=A;M.Defused=1
			if(ismob(A))
				var/mob/M=A
				var/mob/O=src.Owner

				var/damage=src.nin

				if(damage>300)
					damage=300
				var/LightningChakra=LightningDamage(O)
				damage=round((damage)*((LightningChakra*0.02)+0.8));var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)
				if(M.RaiArmor)
					if((M.RaitonKnowledge-O.RaitonKnowledge)>damage)
						view(M)<<"[M]'s armor absorbed the shock!";del(src)
					else
						var/resistance=(M.RaitonKnowledge-O.RaitonKnowledge);if(resistance<50) resistance=50
						if((damage-resistance)<0) resistance=(damage-1)
						damage-=resistance
				if(O.Trait=="Old Powerful")
					damage+=(O.NinSkill*3)
				view(M)<<output("<font color=yellow size=2>[M] has been hit by ChidoriSpear!([damage])</font>","Attack")
				M.DamageProc(damage,"Health",O)
				spawn() M.Bloody()
				spawn() M.Bloody()
				spawn() M.Bloody()
				spawn() M.Bloody()
				spawn() src.SoundEngine('SFX/Slice.wav',10)
				spawn() src.SoundEngine('SFX/Slice.wav',10)
				spawn() src.SoundEngine('SFX/Slice.wav',10)

				src.loc=M.loc
				walk(src,0)
				var/lastin=3
				while(lastin)
					M.StunAdd(10);lastin--;sleep(11)
				M.Stun=0;del(src)
			if(istype(A,/obj/))
				var/obj/ZZ=A
				if(istype(A,/obj/Doors/))
					var/obj/O=A
					O.DamageProc(src.nin)
					del(src)
				if(istype(ZZ,/obj/Jutsu/Elemental/Doton/))
					var/obj/Jutsu/Elemental/Doton/ZAC=ZZ
					if((ZAC.JutsuLevel/2)>=src.JutsuLevel)
						del(src)
					else
						del(ZAC)
				if(istype(ZZ,/obj/Jutsu/Elemental/Suiton/))
					var/obj/Jutsu/Elemental/Suiton/ZAC=ZZ
					if(!ZAC.Electrocuted)
						ZAC.Electrocuted=1
						var/obj/Jutsu/Elemental/Raiton/Electrocute/AA=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/K=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/B=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/C=new();var/obj/Jutsu/Elemental/Raiton/Electrocute/D=new()
						AA.loc=locate(src.x+1,src.y,src.z);K.loc=src.loc;B.loc=locate(src.x-1,src.y,src.z);C.loc=locate(src.x,src.y+1,src.z);D.loc=locate(src.x,src.y-1,src.z)
						AA.nin=src.nin/2;K.nin=src.nin/2;B.nin=src.nin/2;C.nin=src.nin/2;D.nin=src.nin/2
						AA.Owner=src.Owner;K.Owner=src.Owner;B.Owner=src.Owner;C.Owner=src.Owner;D.Owner=src.Owner


	ChidoriEisou()
		var/Check=0
		if(src.firing)
			return
		else
			for(var/obj/SkillCards/Chidori/A in src.LearnedJutsus)
				if(A.Delay)
					Check=1
			if(Check==1)
				src.ChakraDrain(10000)
			src.ChakraDrain(30000);
			flick("Attack2",src);src<<"You're frozen while this is on. Press Z to end the jutsu early. Click X to cause the jutsu to execute!"
			var/obj/Jutsu/Elemental/Raiton/EisouHead/A=new();A.Owner=src;A.dir=src.dir;A.JutsuLevel=src.RaitonKnowledge;A.nin=src.nin*1.5;A.MainHead=1
			if(src.dir==NORTH) A.loc=locate(src.x,src.y+1,src.z)
			if(src.dir==SOUTH) A.loc=locate(src.x,src.y-1,src.z)
			if(src.dir==EAST) A.loc=locate(src.x+1,src.y,src.z)
			if(src.dir==WEST) A.loc=locate(src.x-1,src.y,src.z)
			if(src.dir==NORTHEAST) A.loc=locate(src.x+1,src.y+1,src.z)
			if(src.dir==NORTHWEST) A.loc=locate(src.x-1,src.y+1,src.z)
			if(src.dir==SOUTHEAST) A.loc=locate(src.x+1,src.y-1,src.z)
			if(src.dir==SOUTHWEST) A.loc=locate(src.x-1,src.y-1,src.z)
			walk(A,src.dir);src.InEisou=1
			while(A)
				src.Frozen=1;src.icon_state="throw";sleep(1)
			src.Frozen=0;src.icon_state="running";src.InEisou=0;src.overlays-='Icons/Jutsus/Chidori.dmi'
			*/
mob/proc/BloodLust()
	if(src.knockedout||src.Frozen||src.ImmuneToDeath)
		src.ImmuneToDeath=0
		return
	var/BloodLustCount=0
	var/BloodLustCheck1=0
	var/BloodLustCheck2=0
	var/BloodLustCheck3=0
	var/BloodLustCheck4=0
	var/BloodLustCheck5=0
	src.deathcount+=0.5
	src.ImmuneToDeath=1
	src<<"You become extremly bloodthirsty..."
	src.BloodLust=1
	src.nin=src.Mnin*1.4
	src.tai=src.Mtai*1.4
	src.gen=src.Mgen*1.4
	while(src.BloodLust)
		if(BloodLustCount>30&&BloodLustCheck1==0)
			src.deathcount+=0.1
			BloodLustCheck1=1
		if(BloodLustCount>60&&BloodLustCount<91)
			src.ImmuneToDeath=0
			src<<"You're capable of getting knocked out again."
		if(BloodLustCount>90&&BloodLustCheck2==0)
			src.deathcount+=0.1
			BloodLustCheck2=1
		if(BloodLustCount>120&&BloodLustCheck3==0)
			src.deathcount+=0.1
			BloodLustCheck3=1
		if(BloodLustCount>150&&BloodLustCheck4==0)
			src.deathcount+=0.1
			BloodLustCheck4=1
		if(BloodLustCount>180&&BloodLustCheck5==0)
			src.deathcount+=0.1
			BloodLustCheck5=1
		if(BloodLustCount>210)
			src.ImmuneToDeath=0
			src<<"You've caused enough damage for now..."
			src.BloodLust=0
			src.deathcount-=0.5
			src.nin=src.Mnin
			src.tai=src.Mtai
			src.gen=src.Mgen
			return
		BloodLustCount++
		sleep(8)
	src.ImmuneToDeath=0
mob/var/tmp/DotonSpearImpaling=0
mob/proc/Doton_Spear_Impalation(mob/M,Power)
	var/Drain=400-(src.DotonKnowledge/50)
	if(!src.DotonSpear)
		src<<"You need to have Doton Spear Activated to perform this attack.."
		return
	if(src.stamina<Drain)
		src<<"You don't have enough stamina to perform this attack.."
		return
	if(src.firing)
		return
	if(src.Kaiten)
		src<<"Not now!"
		return
	if(src.DotonSpear)
		src.stamina-=Drain;
		src.DotonSpearImpaling=2
//		src.Make_HC()
//		spawn(25)
//		for(var/obj/HyuugaCircle/H in world)
//			if(H.Owner==src)
//				del(H)
		var/HowFast=rand(1,2)
		var/Damage1Total=0
		var/Damage2Total=0
		var/CriticalDamage=0
		var/i=128;var/A=0
		while(i>0&&get_dist(M,src)<=1&&src.DotonSpear&&!M.knockedout)
			HowFast=rand(1,2)
			if(M.ImmuneToDeath)
				return
			M.FrozenBind="Palms"
			if(M&&(M.knockedout!=1)&&(M.sphere!=1)&&(M.Kaiten!=1))
				if(M.Status=="Asleep")
					M.Status=""
				if(src.knockedout||get_dist(M,src)>=2)
					i=0
				src.AttackDelay=1;src.dir=get_dir(src,M)
				src.JC++
				flick("Attack1",src)
				if(prob(20+(src.DotonKnowledge/10)+Power))
					M.StunAdd(5)
				if(M.JC>0)
					viewers()<<sound('SFX/Slice2.wav',0);
					M.dir=get_dir(M,src);
					flick("Attack1",M);spawn() M.Bloody()//AttackEfx3(M.x,M.y,M.z,M.dir)
					M.JC--
				else
					var/damage1=round(Power)
					M.stamina-=damage1/(M.Endurance/10)
					var/damage2=round((Power*1.45)/(5-(src.StanceMastery*0.026)))
					M.health-=damage2
					Damage1Total+=damage1
					Damage2Total+=damage2

					if(M.Guarding||M.NenkinOn)
						viewers()<<sound('SFX/Slice.wav',0)
						if(!M.NenkinOn)
							if(M.health>0)
								M.health-=((M.maxhealth*0.00005)*((src.DotonKnowledge/100)+(Power*2.2)))
							else
								M.health-=((M.maxhealth*0.00003)*((src.DotonKnowledge/100)+(Power*2)))
					else
						viewers()<<sound('SFX/Slice.wav',0)
						if(M.health)
							M.health-=((M.maxhealth*0.0001)*((src.DotonKnowledge/100)+(Power*2.2)))
						else
							M.health-=((M.maxhealth*0.00005)*((src.DotonKnowledge/100)+(Power*2.2)))
				if(A==2)
					view() << "<font color = #00ffff size = 1>[src] says: 2 Palms!</font>"
				if(A==6)
					view() << "<font color = #00ffff size = 1>[src] says: 4 Palms!</font>"
				if(A==14)
					view() << "<font color = #00ffff size = 1>[src] says: 8 Palms!</font>"
				if(A==30)
					view() << "<font color = #00ffff size = 1>[src] says: 16 Palms!</font>"
				if(A==62)
					view() << "<font color = #00ffff size = 1>[src] says: 32 Palms!</font>"
				if(A==126)
					view() << "<font color = #00ffff size = 1>[src] says: 64 Palms!</font>"
					if(prob(30))
						CriticalDamage=1
			//	if(A==254)
			//		view() << "<font color = #00ffff size = 1>[src] says: 128 Palms!</font>"
				A+=1
				i--
				if(M.KujakuMyouhouon)
					M.KujakuMyouhouon=0;M.controlled = null;M.client.perspective=MOB_PERSPECTIVE;M.client.eye = M;M.underlays -= 'Icons/Jutsus/Kujaku.dmi'
					for(var/mob/KujakuMyouhou/KujakuHead/P in world) if(P.Owner==M) del(P)
				if(istype(M,/mob/Bugs/)) del(M)
				if(src.DotonKnowledge>=2500)
					HowFast=pick(0,1)
					if(src.DotonKnowledge>3250||src.Trait=="Speedy")
						if(prob(70))
							HowFast=0
						else
							HowFast=1
			sleep(HowFast)
		spawn(50)
			src.JC=0
	//	M<<output("<font color=#00ffff>You were hit for [Damage1Total] stamina damage and [Damage2Total] vitality damage!</font>","Attack")
	//	view(10,src)<<output("<font color=#00ffff>[M] was hit for [Damage1Total] stamina damage and [Damage2Total] vitality damage!</font>","Attack")
		M.Stun=0;step(M,M.dir);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);sleep(1);step(M,M.dir);M.firing=0;src.AttackDelay=0;M.Death(src)
		if((M.JC<1)&&(CriticalDamage==1))
			M.Bloody();M.Bloody();M.Bloody()
			CriticalDamage=0
			M<<"<font color = red size = 1>[src] has impaled a vital spot causing severe damage!</font>"
			M.Bloody()
			M.health-=pick(100,250)
		src.JC=0
		src.AttackDelay=0
		M.FrozenBind=""
		src.DotonSpearImpaling=0