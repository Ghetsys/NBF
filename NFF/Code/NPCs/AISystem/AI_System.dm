/*Argon's notes:

This one is more effective, varies in looks and jutsu and more CPU efficient.
BTW make sure you add in the procs for the katon and earth jutsu as seen in the loops below.
I included these 3 new procs, Get_Behind, Shushin_Behind and Shushin_Far_Behind below.
Use them to give the NPC an advantage *wink*.
*/
mob
	var
		tmp/Pedestrian
		tmp/list/talkedtopeople
		Strong_NPC=0
		AOS=0 //Attack On Sight
		AWA=0 //Attack When Attacked
		AF=0 //Attack Foreigners
		walks=0 //Walks
		tmp/viewsight=3   //how far a monter can look for a player
		tmp/attacked=0
		tmp/def
		tmp/attacker
		tmp/FirstCommand=0
		UnderOrders=0
		tmp/list/reportedattacks
		NeedsFace
		part1p=0
		part2p=0
		HasFeatures=0
		tmp/deathTimer
	New()
		if(!src.client)
			if(!HasFeatures)
				src.RandomFace()
				HasFeatures=1
			if(!AOS)
				if(src.icon=='animals.dmi'&&src.name=="Bunny Rabbit(NPC)")
			//		spawn(1) src.RabbitLoop()
					return
			if(AOS)
				if(src.icon=='Wolf.dmi')
			//		spawn(1) src.WolfLoop()
					return
				var/randz=rand(1,3)
				if(randz==2)
					src.WeaponInRightHand="Kunai"
				if(src.name=="Masked Ninja(NPC)")
					src.WeaponInRightHand=""
					spawn(1)

					return

				if(src.name=="Uchiha, Argon")
					src.WeaponInRightHand=""
					view(src)<<"<font color = red><b> [src] Says: Time to Die...</font></br>"
					spawn(1)
						if(prob(50))
							src.LegendaryUchihas()
							return

					return

				return
			if(AWA)
				spawn(1) src.NewAWAProc()
				return

			if(deathTimer)
				spawn(1) src.DeathTimer()
		..()
	proc
		DeathTimer()
			set background = 1
			if(src.client)
				return
			sleep(15000)
			del(src)
			return

	proc
		RandomFace()
			set background = 1
			..()
			if(!src.client)
				if(src.name=="Masked Ninja(NPC)")
					src.icon=null;var/Base='Icons/New Base/Base.dmi';Base+=rgb(111,55,10);src.icon=Base
					src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix2;src.part1p=1
				if(src.name=="Xiveres Soul")
					src.overlays+='XiveresCloakUpdate.dmi'
				if(src.name=="Boss(NPC)")
					src.icon=null;var/Base='Icons/New Base/Base.dmi';Base+=rgb(180,106,12);src.icon=Base
					src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix2;src.part1p=1
				else if(src.name=="Uchiha, Argon")
					src.icon=null
					var/list/Q = list("Sharingan","Mangekyo","Goukakyuu","Housenka","Hikibou","Ryuuka","Mizurappa","Raikyuu","Reppushou","KazeDangan","Jibashi","Doryuudan","DoryoDango")
					var/b=12
					while(b>0)
						var/P=pick(Q);Q-=P;var/T = text2path("/obj/SkillCards/[P]")
						var/obj/SkillCards/A = new T
						A.Uses=rand(100,400);src.LearnedJutsus+=A
						b--
					var/obj/WEAPONS/Katana/K=new()
					src.WeaponInRightHand=K;src.RightHandSheath=1
					var/Base='Icons/New Base/Base.dmi';
					Base+=rgb(156,156,156);
					src.icon=Base
					src.overlays-='Icons/New Base/Clothing/Boxers.dmi';
					src.overlays+='Icons/New Base/Clothing/Boxers.dmi';
					src.overlays-='Icons/New Base/MaleEyes.dmi';
					src.overlays+='Icons/New Base/MaleEyes.dmi';
					src.tempmix2+='Icons/New Base/Eyes.dmi';
				//	src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=150//rand(1,150);
					var/oblue2=0//rand(1,150);
					var/ogreen2=0//rand(1,150);
					src.tempmix2+=rgb(ored2,ogreen2,oblue2);
					src.overlays+=src.tempmix2;
					src.part1p=1
					var/random = 'Icons/New Base/Hair/MadaraH.dmi'
					src.tempmix3=random
					src.overlays+='Icons/New Base/Clothing/Official Clothing/AKAS2.dmi'
					src.overlays+=src.tempmix3
					src.HasFeatures=1
					return
				else if(src.Pedestrian)
					var/randombase=rand(1,15);src.icon=null;var/Base='Icons/New Base/Base.dmi'
					if(randombase==1) Base+=rgb(156,156,156)
					if(randombase==2) Base+=rgb(255,165,72)
					if(randombase==3) Base+=rgb(245,155,62)
					if(randombase==4) Base+=rgb(235,145,52)
					if(randombase==5) Base+=rgb(225,135,42)
					if(randombase==6) Base+=rgb(225,135,42)
					if(randombase==7) Base+=rgb(200,126,32)
					if(randombase==8) Base+=rgb(190,116,22)
					if(randombase==9) Base+=rgb(180,106,12)
					if(randombase==10) Base+=rgb(170,96,02)
					if(randombase==11) Base+=rgb(111,55,0)
					if(randombase==12) Base+=rgb(101,45,0)
					if(randombase==13) Base+=rgb(91,35,0)
					if(randombase==14) Base+=rgb(81,25,0)
					if(randombase==15) Base+=rgb(95,95,95)
					src.icon=Base;src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix='Icons/New Base/Clothing/shirt.dmi'
					var/ored=rand(1,150);var/oblue=rand(1,150);var/ogreen=rand(1,150);src.tempmix+=rgb(ored,ogreen,oblue);src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix;src.overlays+=src.tempmix2;src.part1p=1
				if(src.NeedsFace&&src.part1p&&!src.tempmix3)
					if(src.rank=="IDK")
						src.Mchakra=rand(1000,4000);src.chakra=src.Mchakra;src.maxstamina=rand(1000,4000);src.stamina=src.maxstamina
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)!=2000)
							src.Mtai=rand(30,75);src.tai=src.Mtai;src.Mnin=rand(30,75);src.nin=src.Mnin;src.Mgen=rand(30,75);src.gen=src.Mgen;Age=rand(13,30)
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)<=105) src.rank="Wanna Be"
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)>105) src.rank="Genin";src.TaijutsuMastery=rand(1,3)
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)>180)
							src.rank="Chuunin";src.TaijutsuMastery=rand(4,6);src.HandsealsMastery=3;src.HandsealSpeed=20
							src.RunningSpeed=10;src.Acceleration=10
							src.Inferno=1;src.HousenkaExpert=1;src.RaikyuuExpert=2;src.Static=2;src.Electromagnetivity=1;src.ReppushouExpert=1;src.WindVelocity=3
							var/list/C = list("Goukakyuu","Housenka","Hikibou","Ryuuka","Mizurappa","Raikyuu","Reppushou","KazeDangan","Jibashi","Doryuudan","DoryoDango")
							var/b=rand(3,4)
							while(b>0)
								var/P=pick(C);C-=P;var/T = text2path("/obj/SkillCards/[P]")
								var/obj/SkillCards/A = new T
								A.Uses=rand(100,400);src.LearnedJutsus+=A
								b--
							if(prob(5)){var/obj/WEAPONS/Katana/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1}
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)>225)
							src.RunningSpeed=10;src.Acceleration=10
							src.Inferno=3;src.HousenkaExpert=2;src.RaikyuuExpert=3;src.Static=3;src.Electromagnetivity=3;src.ChidoriSenbonExpert=2;src.NagashiExpert=2;src.ReppushouExpert=2;src.WindVelocity=3;src.VacuumSphereExpert=2;src.DragonsRage=2;src.DragonTamer=3;
							src.rank="Jounin";src.TaijutsuMastery=rand(7,10);src.HandsealsMastery=3;src.HandsealSpeed=60;var/list/C = list("Goukakyuu","Housenka","Hikibou","Ryuuka","Mizurappa","KaryuuEndan","KatonHouka","Gouryuuka","Doryuudan","DoryoDango","YomiNuma","Doryuuheki","Reppushou","KazeDangan","VacuumWave","Kakeami","KazeKiri","KazeGai","MizuameNabara","Suiryuudan","Daikoudan","Senjikizame","Teppoudama","Raikyuu","Hinoko","Jibashi","Gian","IkazuchiKiba","ChidoriNagashi","ChidoriSenbon");var/b=rand(8,12)
							while(b>0)
								var/P=pick(C);C-=P;var/T = text2path("/obj/SkillCards/[P]");var/obj/SkillCards/A = new T
								A.Uses=rand(500,1000);src.LearnedJutsus+=A;b--
						if(prob(30)){var/obj/WEAPONS/Katana/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1}
						if(src.Village=="Leaf")
							if(prob(25)){src.Clan="Hyuuga";src.TaijutsuStyle="Jyuken";src.ChakraPercision=5;src.TenketsuAccuracy=20;src.SensoryRange=5;src.Rejection=5;src.bya=1}
						if(src.Village=="Sound")
							if(prob(25))
								if(prob(30)){var/obj/WEAPONS/Katana/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1}
								src.Clan="Uchiha";src.SharinganMastery=rand(40,1000);src.reflexNew=rand(1,4);spawn()
									src.Sharingan()
						src.name="[src.name]([src.rank])"
						if(src.Clan=="Hyuuga"||src.Clan=="Uchiha")
							src.name="[src.Clan] [src.name]"
						if(src.Anbu)
							src.rank="ANBU"
							src.name="[src.Village] ANBU"
					if(src.rank=="Jounin"||src.rank=="ANBU")
						if(src.RightHandSheath)
							src.Kenjutsu=100
							src.VitalSlash=5
							src.SlashStrength=10
							src.SpeedDice=10
							src.TaijutsuMastery=10
						if(src.Village=="Leaf")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
							if(src.Clan=="Hyuuga")
								src.ByakuganMastery=5001;src.TaijutsuMastery=10
								var/T=text2path("/obj/SkillCards/Kaiten");var/TT=text2path("/obj/SkillCards/KaitenKizu")
								var/obj/SkillCards/A = new T;src.LearnedJutsus+=A
								var/obj/SkillCards/B = new TT;src.LearnedJutsus+=B
						if(src.Village=="Rock")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi'
						if(src.Village=="Sound")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
						if(src.Village=="Rain")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi'
					if(src.rank=="SGuard")
						src.overlays+='Icons/New Base/Clothing/Official Clothing/soundoutfit.dmi'
					if(src.Clan=="Uchiha"&&(src.name!="Uchiha, Argon"||src.name!="Uchiha, Sasuna"))
						if(prob(50))
							src.overlays+='Icons/New Base/Clothing/Cloak.dmi'
						else
							src.overlays+='Icons/New Base/Clothing/SasukeShirt.dmi'
						src.overlays+='Icons/New Base/Clothing/Uchiha Crest.dmi'
					src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					var/random = pick('Icons/New Base/Hair/SasukeH.dmi','Icons/New Base/Hair/narutoH.dmi','Icons/New Base/Hair/JrockH.dmi','Icons/New Base/Hair/ExclusiveH.dmi','Icons/New Base/Hair/MadaraH.dmi','Icons/New Base/Hair/leeH.dmi','Icons/New Base/Hair/itachiH.dmi','Icons/New Base/Hair/inoH.dmi','Icons/New Base/Hair/WindH.dmi','Icons/New Base/Hair/hinaH.dmi','Icons/New Base/Hair/PainbodyH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/KiraH.dmi','Icons/New Base/Hair/KakashiH.dmi','Icons/New Base/Hair/BuzH.dmi','Icons/New Base/Hair/JiraiyaH2.dmi','Icons/New Base/Hair/RyuzakiH.dmi','Icons/New Base/Hair/OrochimaruH.dmi','Icons/New Base/Hair/SasukeTS.dmi','Icons/New Base/Hair/ShikamaruH.dmi','Icons/New Base/Hair/SleekH.dmi','Icons/New Base/Hair/SpikedPonytailH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/YannisH.dmi')
					src.tempmix3=random;var/ored2=rand(1,180);var/oblue2=rand(1,180);var/ogreen2=rand(1,180);src.tempmix3+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix3;src.NeedsFace=0;var/A=rand(1,5)
					if(A>=3)
						src.overlays+='Icons/New Base/Clothing/gloves.dmi'
					if(src.rank!="")
						var/B=rand(1,5)
						if(B==5)
							var/mask='Icons/New Base/Clothing/kakashi mask.dmi';var/ored5=rand(1,200);var/oblue5=rand(1,200);var/ogreen5=rand(1,200);mask+=rgb(ored5,ogreen5,oblue5);src.overlays+=mask
					var/C=rand(1,10)
					if(C==1)
						src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
					if(C==2)
						src.overlays+='Icons/New Base/Clothing/Turban.dmi'
					if(C==3)
						src.overlays+='Icons/New Base/Clothing/LEyePatch.dmi'
					if(C==4)
						src.overlays+='Icons/New Base/Clothing/REyePatch.dmi'
				if(src.name=="Masked Ninja(NPC)"||src.name=="Xiveres Soul")
					src.overlays+='Icons/New Base/Clothing/bandagesL.dmi';src.overlays+='Icons/New Base/Clothing/bandagesR.dmi'
					if(prob(50))
						src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
					if(prob(25))
						src.overlays+='Icons/New Base/Clothing/LEyePatch.dmi'
					if(prob(25))
						src.overlays+='Icons/New Base/Clothing/REyePatch.dmi'
					src.overlays+='Icons/New Base/Clothing/Turban.dmi'
				if(src.name=="Uchiha, Argon")
					var/random = 'Icons/New Base/Hair/MadaraH.dmi'

					src.tempmix3=random
				//	var/ored2=rand(1,180);
				//	var/oblue2=rand(1,180);
				//	var/ogreen2=rand(1,180);
			//		src.tempmix3+=rgb(ored2,ogreen2,oblue2);
					src.overlays+=src.tempmix3
				if(src.name=="Boss(NPC)")
					src.overlays+='Icons/New Base/Clothing/cloak3.dmi';src.overlays+='FumikoWear.dmi';src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
				if(src.rank=="Genin"||src.rank=="Chuunin"||src.rank=="Jounin")
					var/randomxzz=pick('Icons/New Base/Clothing/Headbands/headband.dmi','Icons/New Base/Clothing/Headbands/leetype.dmi','Icons/New Base/Clothing/Headbands/NejiHB.dmi','Icons/New Base/Clothing/Headbands/Bheadband.dmi','Icons/New Base/Clothing/Headbands/KakashiHeadband.dmi','Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi','Icons/New Base/Clothing/Headbands/HeadbandLeg.dmi','Icons/New Base/Clothing/Headbands/YamatoHeadband.dmi','Icons/New Base/Clothing/Headbands/KisameHeadband.dmi','Icons/New Base/Clothing/Headbands/HeadbandNeck.dmi','Icons/New Base/Clothing/Headbands/BandagedHeadband.dmi')
					src.overlays+=randomxzz
				if(src.rank=="ANBU")
					src.overlays+='XiveresCloak.dmi'
					var/randomxzz=pick('Icons/New Base/Clothing/Official Clothing/Ranbu.dmi','Icons/New Base/Clothing/Official Clothing/Banbu.dmi','Icons/New Base/Clothing/Official Clothing/Ganbu.dmi','Icons/New Base/Clothing/Official Clothing/ANBUMask.dmi','Icons/New Base/Clothing/Official Clothing/ANBUMask2.dmi')
					src.overlays+=randomxzz
				if(src.rank=="Chuunin"&&src.Clan!="Uchiha"||src.rank=="Jounin"&&src.Clan!="Uchiha")
					var/icon/AXAX='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
					if(src.Village=="Leaf")
						AXAX='Icons/New Base/Clothing/Official Clothing/LeafChuuninSuit.dmi'
					if(src.Village=="Rock")
						AXAX+=rgb(101,071,37)
					if(src.Village=="Sound")
						AXAX+=rgb(25,25,25)
					if(src.Village=="Rain")
						AXAX+=rgb(55,41,122)
					src.overlays+=AXAX
		NPCGuard()
			if(src.target)
				src.dir=get_dir(src,src.target)
			src.icon_state="Block"
			src.Guarding=1
			src.Endurance*=5
			spawn(rand(10,20))
				src.icon_state="running"
				src.Guarding=0
				src.Endurance=100
			if(!src.Dodging)
				if(src.FrozenBind!="")
					return
				src.Dodging=1
				spawn(15)
					src.Dodging=0
		NPC_Run()
			if(src.stamina>50)
				src.Running=1;src.icon_state="running";src.MoveDelay=0
			else
				src.Running=0;src.MoveDelay=1
				if(src.deathcount<10)
					src.stamina+=25
		NPC_Regeneration()
			if(src.Stun>0) src.Stun--;sleep(1)
			if(src.stamina<0)
				var/Drain=abs(src.stamina)
				src.stamina=0
				src.health-=Drain
			if(src.health<0)
				src.health=0
			if(src.ImmuneToDeath)
				src.health+=500
				src.stamina+=1000
			if(!src.knockedout&&prob(15))
				if(src.chakra<src.Mchakra) src.chakra+=rand(10,20)
				if(src.stamina<src.maxstamina) src.stamina+=rand(10,40)
		NPC_Struggle()
			src.Struggle+=pick(1,1.5)
			if(src.rank=="ANBU")
				src.Struggle++
			if(src.health<0)
				src.health=0
			if(src.stamina<0)
				src.stamina=0
		ArgonProc()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				mob/attack  //remeberd attacker
				random
			while(src.health>0)
				///////////////////
				//Target System
				///////////////////
				sleep(1)
				Target
				piv = list()
				random=rand(-10,15)
				while(piv.len<=0)    //if there's nobody in view
					sleep(20+random)
					if(src.target)
						piv+=src.target
						break
					for(var/mob/m in oview(5,src))

						if(m.client&&m.Village==src.Village&&m.target!=null&&m.target!="")
							var/mob/A=m.target;if(A.Village!=src.Village) piv+=A
						else if(m.target==src)
							piv+=m
				attack=pick(piv)
				//////////////////////
				//////////////////////
				while(attack&&get_dist(attack,src)<=src.viewsight&&!attack:knockedout&&attack:z==src.z&&!attack:Dead&&!src.Dead)
					//Switch Targets//
					if(src.target&&src.target!=attack)
						attack=src.target

					src.NPC_Run()
					src.NPC_Regeneration()
					///////////////////////////
					//Fighting
					///////////////////////////

					if(src.knockedout&&src.StruggleAgainstDeath>0||src.FrozenBind!="")
						src.NPC_Struggle()
					sleep(1)

				if(attack:Dead)
					piv.Remove(attack)
					if(piv.len>0)
						attack=pick(piv)
					else
						src.loc=initial(src.loc)
						src.health=initial(src.health)
						src.stamina=initial(src.stamina)
						src.chakra=initial(src.chakra)
						attack=null
				if(src.Status!="")
					spawn(30)
						src.Status=""
				if(!attack||get_dist(src,attack)>=src.viewsight)

					src.loc=initial(src.loc)
					src.health=initial(src.health)
					src.stamina=initial(src.stamina)
					src.chakra=initial(src.chakra)
					attack=null
					src.target=null
					goto Target
				if(!src.knockedout&&attack:knockedout&&attack:StruggleAgainstDeath<=0)
					src.dir=(get_dir(src,attack))
					src.AttackVerb(rand(1,4))
		NewAWAProc()
			set background = 1
			del(src)//ARGON PSL FIX
			if(src.client)return
			var
				list/piv  //piv=People In View
				mob/attack  //remeberd attacker
				random
			while(src.health>0)
				sleep(1)
				Target
				piv = list()
				random=rand(-10,15)
				while(piv.len<=0)    //if there's nobody in view
					sleep(20+random)
					if(src.walks&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
						step_rand(src)
					if(src.target)
						piv+=src.target
						break
					for(var/mob/m in oview(5,src))//for all mobs in view(excuding itself)
						if(src.name=="Xiveres Soul"&&m.XiveresLeader!=1&&m.XiveresMember!=1)
							piv+=m
						else if(m.AWA&&m.Village==src.Village&&m.target!=null&&m.target!="")//if M is a NPC in their village and has a target
							piv+=m.target  //fucking help them kill that bastard!
						else if(m.client&&m.Village==src.Village&&m.target!=null&&m.target!="")
							var/mob/A=m.target;if(A.Village!=src.Village) piv+=A
						else if(m.HasHiddenScroll&&m.Village!=src.Village||!src.walks&&ScrollIsIn==src.Village&&m.Village!=src.Village&&!(src.Village in m.VillagePermits))
							piv+=m  //Scroll Protection =D
						else if(src.rank=="ANBU"&&m.Village!=src.Village&&!(src.Village in m.VillagePermits))
							piv+=m
				attack=pick(piv)
				while(attack&&get_dist(attack,src)<=src.viewsight&&!attack:knockedout&&attack:z==src.z&&!attack:Dead&&!src.Dead)//if its in src's view
					if(src.stamina>50)
						src.Running=1;src.icon_state="running";src.MoveDelay=0
					else
						src.Running=0;src.MoveDelay=4
					if(src.target&&src.target!=attack)
						attack=src.target
					if(src.Stun>0) src.Stun--;sleep(1)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.stamina=0
						src.health-=Drain
					if(src.health<0)
						src.health=0
					if(src.ImmuneToDeath)
						src.health+=500
						src.stamina+=1000
					if(!src.knockedout&&prob(5))
						if(src.chakra<src.Mchakra) src.chakra+=rand(1,2)
						if(src.stamina<src.maxstamina) src.stamina+=rand(1,4)
					else if(src.rank=="ANBU"&&prob(35))
						src.chakra+=rand(10,20)
						src.stamina+=rand(30,40)
						src.health+=rand(15,25)
						if(prob(1)&&src.ThrowingStrength<15)
							src.ThrowingStrength+=rand(1,2)
						else if(prob(0.1)&&src.DragonsRage<2)
							src.DragonsRage++
						else if(prob(0.01))
							src.BlueFire=1
						else if(prob(2))
							var/ranom=rand(1,3)
							if(ranom==1)
								src.tai*=1.5
							if(ranom==2)
								src.nin*=1.5
							if(ranom==3)
								src.health+=300
						if(prob(2))
							src.TaijutsuMastery=10
					for(var/obj/Jutsu/Elemental/O in view(2,src))
						if(O.JutsuLevel>0&&O.Owner!=src&&O.Element=="Fuuton"&&!(istype(O,/obj/Jutsu/Elemental/Fuuton/WindScythe)))
							src.NPCGuard()
						if(O.JutsuLevel>0&&O.Owner!=src&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen&&!(istype(O,/obj/Jutsu/Elemental/Suiton/Owater)))
							step_away(src,O,2)
					if(src.health>src.maxhealth/4&&src.stamina>src.maxstamina/5&&!src.knockedout&&src.Status!="Asleep")
						if(get_dist(src,attack)==1&&prob(60))
							if(prob(50))
								src.dir=(get_dir(src,attack))
								src.AttackVerb(rand(3,8))
								if(prob(80))
									src.AttackVerb2(rand(3,8))
								if(prob(40))
									src.AttackVerb3()
								sleep(1)
							else if(prob(5+src.TaijutsuMastery)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
								src.FaceAtom(attack)
								var/R=pick(-45,45);var/D=turn(src.dir,R)
								src.dir=D;step(src,src.dir);src.FaceAtom(attack)
								sleep(1)
							else
								src.dir=(get_dir(src,attack))
								src.AttackVerb(rand(3,8))
						else
							if(prob(65)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
								if(prob(20))
									step_towards(src,attack)
								else
									step_to(src,attack)
							else if(src.x==attack:x||src.y==attack:y||(src.x-attack:x)==(src.y-attack:y)||(attack:x-src.x)==(attack:y-src.y))
								if(prob(10))
									var/OkToThrow=1
									for(var/mob/M in getline(src,attack))
										if(M!=attack&&M!=src) OkToThrow=0
									if(OkToThrow)
										src.FaceAtom(attack)
										src.KunaiThrowing()
								else if(src.rank=="Chuunin")
									src.FaceAtom(attack)
									for(var/obj/SkillCards/S in src.LearnedJutsus)
										if(!S.Delay)
											S.Activate(src)
											break
								else if(src.rank=="Jounin")
									if(prob(10))
										var/OkToThrow=1
										for(var/mob/M in getline(src,attack))
											if(M!=attack&&M!=src) OkToThrow=0
										if(OkToThrow)
											if(prob(80))
												var/b=rand(3,5)
												while(b>0)
													src.FaceAtom(attack)
													src.ShurikenThrow("Left")
													b--
													sleep(1)
											else
												src.WShurikenThrow()
									else
										src.FaceAtom(attack)
										for(var/obj/SkillCards/S in src.LearnedJutsus)
											if(!S.Delay)
												S.Activate(src)
												if(prob(50))
													break
								else if(src.rank=="ANBU")
									if(prob(20))
										var/OkToThrow=1
										for(var/mob/M in getline(src,attack))
											if(M!=attack&&M!=src) OkToThrow=0
										if(OkToThrow)
											if(prob(50))
												var/b=rand(3,5)
												while(b>0)
													src.FaceAtom(attack)
													src.ShurikenThrow("Left")
													b--
													sleep(1)
											else
												src.WShurikenThrow()
									else
										src.FaceAtom(attack)
										for(var/obj/SkillCards/S in src.LearnedJutsus)
											if(!S.Delay)
												S.Activate(src)
												if(prob(50))
													break
							else
								if(prob(25)&&get_dist(src,attack)>5&&src.rank=="Chuunin"||prob(40)&&get_dist(src,attack)>9&&src.rank=="Chuunin")
									src.Shushin_Near(attack)
								else if(prob(35)&&get_dist(src,attack)>5&&src.rank=="Jounin"||prob(55)&&get_dist(src,attack)>9&&src.rank=="Jounin")
									if(prob(50))
										src.Shushin_Near(attack)
									else if(prob(25))
										src.Shushin_Behind(attack)
								else if(prob(39)&&get_dist(src,attack)>5&&src.rank=="ANBU"||prob(55)&&get_dist(src,attack)>9&&src.rank=="ANBU")
									if(prob(50))
										src.Shushin_Near(attack)
									else if(prob(25))
										src.Shushin_Behind(attack)
								else if(src.rank=="ANBU"&&get_dist(src,attack)>25)
									src.loc=initial(src.loc)
									src.health=initial(src.health)
									src.stamina=initial(src.stamina)
									src.chakra=initial(src.chakra)
									attack=null
									src.target=null
								else if(prob(20))
									step_towards(src,attack)
								else
									step_to(src,attack)
					else if(!src.knockedout&&!src.Dead)
						if(prob(1)&&src.rank=="Chuunin"&&!src.firing)
							spawn() src.Kawa(400)
							step_away(src,attack,4)
						else if(prob(3)&&src.rank=="Jounin"&&!src.firing)
							spawn() src.Kawa2(100)
							step_away(src,attack,4)
						else if(prob(9)&&src.rank=="ANBU")
							spawn(10)
								src.health+=rand(500,700)
								src.stamina+=src.maxstamina/2
						else if(prob(90)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
							if(prob(30))
								if(prob(60))
									step_towards(src,attack)
								else
									step_to(src,attack)
								if(get_dist(src,attack)==1)
									if(prob(50))
										src.FaceAtom(attack)
										var/R=pick(-45,45);var/D=turn(src.dir,R)
										src.dir=D;step(src,src.dir);src.FaceAtom(attack)
										sleep(1)
									src.AttackVerb(rand(3,8))
									if(prob(80))
										src.AttackVerb2(rand(3,8))
									if(prob(40))
										src.AttackVerb3()
							else if(prob(45)&&src.chakra>50&&src.rank!="Genin")
								for(var/obj/SkillCards/S in src.LearnedJutsus)
									if(!S.Delay)
										S.Activate(src)
										break
							else
								var/blah
								src.dir=turn(get_dir(src,attack),pick(45,-45))
								for(blah=rand(3,6), blah>3, blah--)
									step(src,src.dir)
									sleep(1)


					else
						src.Struggle+=pick(1,1.5)
						if(src.rank=="ANBU")
							src.Struggle++
						if(src.health<0)
							src.health=0
						if(src.stamina<0)
							src.stamina=0
					sleep(3)
				if(src.Dead)
					if(src in HiredNinja)
						HiredNinja -= src
					return
				if(attack:Dead)
					piv.Remove(attack)
					if(piv.len>0)
						attack=pick(piv)
					else
						src.loc=initial(src.loc)
						src.health=initial(src.health)
						src.stamina=initial(src.stamina)
						src.chakra=initial(src.chakra)
						attack=null
				if(src.Status=="Asleep")
					if(prob(1))	viewers(src)<<"<font color = green>*[src.name] snores..</font>"
					spawn(100)
						src.Status=""
				if(!attack||get_dist(src,attack)>=src.viewsight)
					if(src.rank=="ANBU"&&get_dist(src,attack)>25)
						src.loc=initial(src.loc)
						src.health=initial(src.health)
						src.stamina=initial(src.stamina)
						src.chakra=initial(src.chakra)
						attack=null
					src.target=null
					goto Target
				if(!src.knockedout&&attack:knockedout&&attack:StruggleAgainstDeath<=0)
					src.dir=(get_dir(src,attack))
					src.AttackVerb(rand(1,4))
		Defense()
//			var/mob/attacker
			if(src.target)
				attacker=src.target
			else
				return

		RabbitLoop()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
			while(src.health>0&&src.z!=20)
				sleep(5)
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					step_rand(src)//take a random step
					sleep(src.MoveDelay*3)//wait walkspeed
					for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
						if(m.client&&m.key||m.AOS)
							piv+=m  //it adds that to people in view)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(get_dist(attack,src)<=viewsight)//if its in src's view
					sleep(11)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.health-=Drain
					walk_away(src,attack,20,0)
				spawn(50) src.RabbitLoop()
				return
			spawn(100) src.RabbitLoop()
			return
		WolfLoop()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
			while(src.health>0&&src.z!=20)
				sleep(2)
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					if(src.FrozenBind==""||src.FrozenBind==null)
						step_rand(src)//take a random step
						for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
							if(prob(15)&&m.icon=='Icons/NPCS/Wolf.dmi'&&get_dist(src,m)>3)
								step_to(src,m)
								break
						sleep(src.MoveDelay*5)//wait walkspeed
						for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
							if(m.client&&m.key||m.AOS&&m.icon!='Icons/NPCS/Wolf.dmi')
								piv+=m  //it adds that to people in view)
					else
						sleep(50)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(get_dist(attack,src)<=viewsight&&!attack:knockedout&&!attack:Dead)//if its in src's view
					sleep(1)
					if(src.Stun>0)
						src.Stun--
						sleep(1)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						if(src.name!="Fierce Wolf")
							src.health-=Drain
						else
							src.health-=Drain/4
					if(get_dist(src,attack)==1)
						if(prob(10))
							src.FaceAtom(attack)
							src.AttackVerb()
							if(src.name=="Fierce Wolf"||prob(30))
								src.AttackVerb2()
						var/random=rand(1,60)
						if(random>50)
							var/R=pick(-45,45,-90,90)
							var/D=turn(src.dir,R)
							src.dir=D
							if(src.FrozenBind==""||src.FrozenBind==null)
								step(src,src.dir)
					else
						if(src.FrozenBind==""||src.FrozenBind==null)
							step_to(src,attack,1)
				spawn(20) src.WolfLoop()
				return
			spawn(20) src.WolfLoop()
			return
		AosLoop()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				var/mob/target
			Start
			while(!target)
				sleep(1)
				piv = list()
				while(piv.len<=0&&!src.target)    //if there's nobody in view
					if(walks)
						step_rand(src)//take a random step
					sleep(src.MoveDelay*5)//wait walkspeed
					for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
						if(src.target==m||m.AOS&&m.Village!=src.Village&&!(src.Village in m.VillagePermits))
							piv+=m  //it adds that to people in view)
				if(!src.target)
					target=pick(piv)//pick a rand person 2 atk. remember them.
				else
					target=src.target
			while(target&&get_dist(target,src)<=viewsight&&src.health>0)//if its in src's view
				sleep(1)
				if(src.target!=target)
					target=src.target
				if(src.Stun>0)
					src.Stun--
					sleep(1)
				if(target.knockedout&&target.StruggleAgainstDeath>0)
					target=null
				if(src.stamina<0)
					var/Drain=abs(src.stamina)
					src.health-=Drain
				var/willitalk=rand(1,400)
				if(willitalk==50)
					if(src.health<=750)
						src.MeanTalk(target)
					else
						src.SmackTalk(target)
				if(get_dist(target,src)==1)//if it is right next to the person
					var/rando=rand(1,5)
					if(rando==5)
						src.dir=get_dir(src,target)
						src.AttackVerb()
				else if(get_dist(target,src)<=3&&!src.doingG)
					var/ran=rand(1,30)
					if(ran==5)
						src.dir=get_dir(src,target)
						src.Shushin_Behind(target)
						spawn(1) src.GoukakyuuNoJutsu(120)
				else if(get_dist(target,src)<=3&&src.doingG)
					var/rando=rand(1,5)
					if(rando==5)
						step_away(src,target,5)
				if(get_dist(target,src)==6&&!src.firing||get_dist(target,src)==5&&!src.firing)
					var/rando=rand(1,19)
					if(rando==4)
						src.dir=get_dir(src,target)
						src.Shushin_Far_Behind(target)
						src.Frozen=1
						spawn(1) src.KatonRyuuka()
						spawn(10) src.Frozen=0
					else if(src.nin>=50&&!src.firing)
						if(prob(4))
							if(prob(1))
								src.Get_Behind(target)
							var/random=rand(1,40)
							if(random==4)
								src.Frozen=1
								spawn(1) src.KKE()
								spawn(10) src.Frozen=0
				else if(get_dist(target,src)==10&&!src.firing)
					var/rando=rand(1,19)
					if(rando==4)
						src.dir=get_dir(src,target)
						src.Frozen=1
						src.firing=1
						spawn(1) src.KatonHousenkaNoJutsu(102)
						spawn(10)
							src.Frozen=0
							src.firing=0
							step_to(src,target) //step towards attacker
							src.Running=1
							sleep(src.MoveDelay)
				else //too far away to attack just yet
					step_towards(src,target) //step towards attacker
					src.Running=1
					sleep(src.MoveDelay*1.5)   //sleep walkspeed
			while(!src.target)
				sleep(11)
				step_rand(src)
			src.target=target
			goto Start

		RockANBU()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
			while(src.health>0&&src.z!=20)
				sleep(1)
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					if(walks)
						step_rand(src)//take a random step
					sleep(src.MoveDelay*5)//wait walkspeed
					for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
						if(m.client&&m.key!="DemonicK"&&m.Village!=src.Village||m.AOS&&m.Village!=src.Village)//if M is a player or hostile NPC
							piv+=m  //it adds that to people in view)
						if(m.Village==src.Village&&m.client)
							if(findtext(src.talkedtopeople,m.key)==0)
								src.talkedtopeople+=m.key
								var/message="Hello there, [m.name]."
								if(m.rank=="Tsuchikage")
									message = pick("Good day, Tsuchikage-sama!","T-Tsuchikage-sama, How are you today?","Tsuchikage-sama, I kicked a Leaf Puppy!","Good morning, sir.","You're awesome, [m.name], sir!","I only wish I was a good ass-kisser like some of the other NPCs in this village.")
								if(m.rank=="Special Jounin"||m.rank=="Jounin")
									message = pick("Hey there [m.FirstName]!","What's up, [m.FirstName]?","Yo [m.FirstName], we should kick some Leaf puppies sometime soon!","[m.FirstName], don't you just hate the Otokami, Kyrie Eleison?","[m.name], Don't tell anyone, but I heard that Argon is always watching us...always..")
									if(ScrollIsIn!=m.Village&&ScrollIsIn!="Not Currently Taken")
										message = "Yo, [m.name], stop being lazy and go get the scroll from the [ScrollIsIn] Village!"
								viewers(src)<<"<b><font color=red>[src.name] <font color = white>Says: [message]</font></b>"
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(get_dist(attack,src)<=viewsight)//if its in src's view
					sleep(1)
					if(src.Stun>0)
						src.Stun--
						sleep(1)
					if(attack:knockedout&&attack:StruggleAgainstDeath>0)
						attack=null
						sleep(20)
						piv = list()
						while(piv.len<=0)    //if there's nobody in view
							sleep(src.MoveDelay*2)
							for(var/mob/m in oview(2,src))//for all mobs in view(excuding itself)
								if(m.client&&m.StruggleAgainstDeath<=0&&m.key!="DemonicK"&&m.Village!=src.Village||m.AOS&&m.Village!=src.Village&&m.StruggleAgainstDeath<=0)//if M is a player or hostile NPC
									piv+=m  //it adds that to people in view)
						attack=pick(piv)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.health-=Drain
					if(get_dist(attack,src)==1)//if it is right next to the person
						var/rando=rand(1,100)
						if(rando>50)
							src.FaceAtom(attack)
							src.AttackVerb()
							src.AttackVerb2()
						if(rando==5&&!src.doingG&&!src.Frozen)
							flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
							if(Z==1)
								src.loc=locate(M.x,M.y-1,M.z)
							if(Z==2)
								src.loc=locate(M.x,M.y+1,M.z)
							if(Z==3)
								src.loc=locate(M.x-1,M.y,M.z)
							if(Z==4)
								src.loc=locate(M.x+1,M.y,M.z)
						if(rando==4&&!src.doingG&&!src.Frozen)
							flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
							if(Z==1)
								src.loc=locate(M.x,M.y-2,M.z)
							if(Z==2)
								src.loc=locate(M.x,M.y+2,M.z)
							if(Z==3)
								src.loc=locate(M.x-2,M.y,M.z)
							if(Z==4)
								src.loc=locate(M.x+2,M.y,M.z)
							spawn(1) src.DotonDoryoDangoz()
					else if(get_dist(attack,src)<=4)
						var/rando=rand(1,10)
						if(rando==5)
							step_away(src,attack,5)
						if(rando==3)
							step_away(src,attack,5)
						if(rando==1)
							src.DotonWall()
					else if(get_dist(attack,src)==6&&!src.firing&&!src.Frozen||get_dist(attack,src)==5&&!src.firing&&!src.Frozen)
						var/rando=rand(1,65)
						if(rando==4)
							if(src:x!=attack:x&&src.y!=attack:y)
								src.Shushin_Far_Behind(attack)
							src.FaceAtom(attack)
							src.Frozen=1
							spawn(1) src.DotonDoryuudanTechnique()
							spawn(20) src.Frozen=0
						else if(src.nin>=90&&!src.firing)
							if(prob(6))
								if(prob(10))
									src.Get_Behind(attack)
								src.Frozen=1
								spawn(1) src.TsuchiWana()
								spawn(10) src.Frozen=0;src.Shushin_Behind(attack)
					else if(get_dist(attack,src)==10&&!src.firing)
						var/rando=rand(1,20)
						if(rando==4||rando==3||rando==14||rando==13||rando==6||rando==5)
							src.Shushin_Far_Behind(attack)
							var/b=3
							while(b>0)
								var/obj/WEAPONS/Kunai/K = new()
								K.icon_state="Throwz"
								src.overlays-='Icons/New Base/Weapons/kunai.dmi'
								K.loc = src.loc
								K.dir=src.dir
								K.Percision=src.Percision
								K.Move_Delay=1
								if(src.ThrowingStrength==1)
									K.Move_Delay=0.8
								if(src.ThrowingStrength==2)
									K.Move_Delay=0.6
								if(src.ThrowingStrength==3)
									K.Move_Delay=0.4
								if(src.ThrowingStrength==4)
									K.Move_Delay=0.2
								if(src.ThrowingStrength==5)
									K.Move_Delay=0.1
								K.Owner=src
								walk(K,src.dir)
								b--
								sleep(1)
							step_to(src,attack)
					else //too far away to attack just yet
						step_towards(src,attack) //step towards attacker
						src.Running=1
						sleep(src.MoveDelay/2)   //sleep walkspeed
				if(walks&&!src.UnderOrders)
					step_rand(src)
				src.Running=0
				sleep(src.MoveDelay*4)
		LeafANBU()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
			while(src.health>0&&src.z!=20)
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					if(walks)
						step_rand(src)//take a random step
					sleep(src.MoveDelay*5)//wait walkspeed
					for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
						if(m.client&&m.key!="DemonicK"&&m.Village!=src.Village&&!m.LeafVillagePermit||m.AOS&&m.Village!=src.Village)//if M is a player or hostile NPC
							piv+=m  //it adds that to people in view)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(get_dist(attack,src)<=viewsight)//if its in src's view
				//	sleep(1)
					if(src.Stun>0)
						src.Stun--
						sleep(1)
					if(attack:knockedout&&attack:StruggleAgainstDeath>0)
						attack=null
						sleep(20)
						piv = list()
						while(piv.len<=0)    //if there's nobody in view
							sleep(src.MoveDelay*2)
							for(var/mob/m in oview(2,src))//for all mobs in view(excuding itself)
								if(m.client&&m.StruggleAgainstDeath<=0&&m.key!="DemonicK"&&m.Village!=src.Village||m.AOS&&m.Village!=src.Village&&m.StruggleAgainstDeath<=0)//if M is a player or hostile NPC
									piv+=m  //it adds that to people in view)
						attack=pick(piv)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.health-=Drain/4
					if(src.health<=300)
						var/rando=rand(1,1000)
						if(rando<=400)
							step_away(src,attack,12)
						if(rando==1000)
							view(src)<<"<font color = red><b>[src] <font color = white>Says: Damnit, this guy is too strong!</font></br>"
					else
						if(get_dist(attack,src)==1)//if it is right next to the person
							var/rando=rand(1,100)
							if(rando>50&&rando<75)
								src.FaceAtom(attack)
								src.AttackVerb()
							if(rando>=75)
								src.FaceAtom(attack)
								src.AttackVerb2()
							if(rando==10&&!src.doingG&&!src.Frozen)
								flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
								if(Z==1)
									src.loc=locate(M.x,M.y-1,M.z)
								if(Z==2)
									src.loc=locate(M.x,M.y+1,M.z)
								if(Z==3)
									src.loc=locate(M.x-1,M.y,M.z)
								if(Z==4)
									src.loc=locate(M.x+1,M.y,M.z)
							if(rando==9&&!src.doingG&&!src.Frozen)
								flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
								if(Z==1)
									src.loc=locate(M.x,M.y-3,M.z)
								if(Z==2)
									src.loc=locate(M.x,M.y+3,M.z)
								if(Z==3)
									src.loc=locate(M.x-3,M.y,M.z)
								if(Z==4)
									src.loc=locate(M.x+3,M.y,M.z)
						else if(get_dist(attack,src)<=3&&!src.doingG&&!src.Frozen)
							var/ran=rand(1,5)
							if(ran==5&&src.chakra>150)
								src.FaceAtom(attack)
								src.Shushin_Behind(attack)
								src.doingG=1
								src.chakra-=150
								spawn(50) src.doingG=0
								spawn(1) src.GoukakyuuNoJutsu(160)
							else
								step_rand(src)
						else if(get_dist(attack,src)<=3&&src.doingG&&src.health>300||get_dist(attack,src)<=3&&src.health<=300)
							var/rando=rand(1,5)
							if(rando==5)
								step_away(src,attack,5)
						else if(src.firing&&get_dist(src,attack)>=2)
							var/rando=rand(1,15)
							if(rando==5)
								flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
								if(Z==1)
									src.loc=locate(M.x,M.y-5,M.z)
								if(Z==2)
									src.loc=locate(M.x,M.y+5,M.z)
								if(Z==3)
									src.loc=locate(M.x-5,M.y,M.z)
								if(Z==4)
									src.loc=locate(M.x+5,M.y,M.z)
								sleep(20)
								src.firing=0
							else
								if(src.health<=300)
									var/randodf=rand(1,5)
									if(randodf==5)
										step_away(src,attack,5)

								else
									step_to(src,attack)
						else if(src.firing&&get_dist(src,attack)>=4)
							if(src.health>300)
								step_towards(src,attack)
							else
								step_away(src,attack)
						else if(get_dist(attack,src)==6&&!src.firing&&!src.Frozen&&src.health>300||get_dist(attack,src)==5&&!src.firing&&!src.Frozen&&src.health>300)
							var/rando=rand(1,10)
							if(rando==4)
								src.FaceAtom(attack)
								src.Shushin_Far_Behind(attack)
								src.Frozen=1
								spawn(1) src.KatonRyuuka()
								spawn(10) src.Frozen=0
							else if(src.nin>=70&&!src.firing)
								if(prob(6))
									if(prob(1))
										src.Get_Behind(attack)
									var/random=rand(1,50)
									if(random==4)
										src.Frozen=1
										spawn(1) src.KKE()
										spawn(10) src.Frozen=0
							else
								if(src.health>300)
									step_towards(src,attack)
						else if(get_dist(attack,src)>=7&&get_dist(attack,src)<=11&&!src.firing)
							var/rando=rand(1,100)
							if(rando<10)
								src.Shushin_Far_Behind(attack)
								var/b=rand(1,5)
								while(b>0)
									var/obj/WEAPONS/Shuriken/L = new()
									L.icon_state="throw"
									viewers(src)<<sound('SFX/Throw.wav',0)
									L.loc=src.loc
									L.pixel_x=rand(-5,5)
									L.pixel_y=rand(-5,5)
									L.dir = src.dir
									L.Move_Delay=0
									L.Owner=src
									walk(L,src.dir)
									b--
							//		sleep(5)
								step_to(src,attack,4)
						else if(src.z!=attack:z)
							spawn(2) LeafANBU()
							return
						else //too far away to attack just yet
							if(src.health>300)
								step_to(src,attack,9) //step towards attacker
							else
								step_away(src,attack,10)
							src.Running=1
							sleep(src.MoveDelay)   //sleep walkspeed
				if(walks&&!src.UnderOrders)
					step_rand(src)
				src.Running=0
				sleep(src.MoveDelay*4)
				spawn(1) src.LeafANBU()
				return
			spawn(1) src.LeafANBU()
			return
		UchihaLegends()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
			while(src.health>0&&src.z!=20)
				sleep(1)
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					if(walks)
						step_rand(src)//take a random step
					sleep(src.MoveDelay*5)//wait walkspeed
					for(var/mob/m in oview(src))//for all mobs in view(excuding itself)
						if(m.client&&m.key!="DemonicK"&&m.Village!=src.Village&&!m.LeafVillagePermit||m.AOS&&m.Village!=src.Village)//if M is a player or hostile NPC
							piv+=m  //it adds that to people in view)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(get_dist(attack,src)<=viewsight)//if its in src's view
					sleep(1)
					if(src.Stun>0)
						src.Stun--
						sleep(1)
					if(attack:knockedout&&attack:StruggleAgainstDeath>0)
						attack=null
						sleep(20)
						piv = list()
						while(piv.len<=0)    //if there's nobody in view
							sleep(src.MoveDelay*2)
							for(var/mob/m in oview(2,src))//for all mobs in view(excuding itself)
								if(m.client&&m.StruggleAgainstDeath<=0&&m.key!="DemonicK"&&m.Village!=src.Village||m.AOS&&m.Village!=src.Village&&m.StruggleAgainstDeath<=0)//if M is a player or hostile NPC
									piv+=m  //it adds that to people in view)
						attack=pick(piv)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.health-=Drain/4
					if(src.health<=300)
						var/rando=rand(1,1000)
						if(rando<=400)
							step_away(src,attack,12)
						if(rando==1000)
							view(src)<<"<font color = red><b>[src]<font color = white>Says: Damnit, this guy is too strong!</font></br>"
					else
						if(get_dist(attack,src)==1)//if it is right next to the person
							var/rando=rand(1,100)
							if(rando>50&&rando<75)
								src.FaceAtom(attack)
								src.AttackVerb()
							if(rando>=75)
								src.FaceAtom(attack)
								src.AttackVerb2()
							if(rando==10&&!src.doingG&&!src.Frozen)
								flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
								if(Z==1)
									src.loc=locate(M.x,M.y-1,M.z)
								if(Z==2)
									src.loc=locate(M.x,M.y+1,M.z)
								if(Z==3)
									src.loc=locate(M.x-1,M.y,M.z)
								if(Z==4)
									src.loc=locate(M.x+1,M.y,M.z)
							if(rando==9&&!src.doingG&&!src.Frozen)
								flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
								if(Z==1)
									src.loc=locate(M.x,M.y-3,M.z)
								if(Z==2)
									src.loc=locate(M.x,M.y+3,M.z)
								if(Z==3)
									src.loc=locate(M.x-3,M.y,M.z)
								if(Z==4)
									src.loc=locate(M.x+3,M.y,M.z)
						else if(get_dist(attack,src)<=3&&!src.doingG&&!src.Frozen)
							var/ran=rand(1,5)
							if(ran==5&&src.chakra>150)
								src.FaceAtom(attack)
								src.Shushin_Behind(attack)
								src.doingG=1
								src.chakra-=150
								spawn(50) src.doingG=0
								spawn(1) src.GoukakyuuNoJutsu(160)
							else
								step_rand(src)
						else if(get_dist(attack,src)<=3&&src.doingG&&src.health>300||get_dist(attack,src)<=3&&src.health<=300)
							var/rando=rand(1,5)
							if(rando==5)
								step_away(src,attack,5)
						else if(src.firing&&get_dist(src,attack)>=2)
							var/rando=rand(1,15)
							if(rando==5)
								flick("zan",src);var/mob/M=attack;var/Z=rand(1,4)
								if(Z==1)
									src.loc=locate(M.x,M.y-5,M.z)
								if(Z==2)
									src.loc=locate(M.x,M.y+5,M.z)
								if(Z==3)
									src.loc=locate(M.x-5,M.y,M.z)
								if(Z==4)
									src.loc=locate(M.x+5,M.y,M.z)
								sleep(20)
								src.firing=0
							else
								if(src.health<=300)
									var/randodf=rand(1,5)
									if(randodf==5)
										step_away(src,attack,5)

								else
									step_to(src,attack)
						else if(src.firing&&get_dist(src,attack)>=4)
							if(src.health>300)
								step_towards(src,attack)
							else
								step_away(src,attack)
						else if(get_dist(attack,src)==6&&!src.firing&&!src.Frozen&&src.health>300||get_dist(attack,src)==5&&!src.firing&&!src.Frozen&&src.health>300)
							var/rando=rand(1,10)
							if(rando==4)
								src.FaceAtom(attack)
								src.Shushin_Far_Behind(attack)
								src.Frozen=1
								spawn(1) src.KatonRyuuka()
								spawn(10) src.Frozen=0
							else if(src.nin>=70&&!src.firing)
								if(prob(6))
									if(prob(1))
										src.Get_Behind(attack)
									var/random=rand(1,50)
									if(random==4)
										src.Frozen=1
										spawn(1) src.KKE()
										spawn(10) src.Frozen=0
							else
								if(src.health>300)
									step_towards(src,attack)
						else if(get_dist(attack,src)>=7&&get_dist(attack,src)<=11&&!src.firing)
							var/rando=rand(1,100)
							if(rando<10)
								src.Shushin_Far_Behind(attack)
								var/b=rand(1,5)
								while(b>0)
									var/obj/WEAPONS/Shuriken/L = new()
									L.icon_state="throw"
									viewers(src)<<sound('SFX/Throw.wav',0)
									L.loc=src.loc
									L.pixel_x=rand(-5,5)
									L.pixel_y=rand(-5,5)
									L.dir = src.dir
									L.Move_Delay=0
									L.Owner=src
									walk(L,src.dir)
									b--
									sleep(5)
								step_to(src,attack,4)
						else if(src.z!=attack:z)
							spawn(2) LeafANBU()
							return
						else //too far away to attack just yet
							if(src.health>300)
								step_to(src,attack,9) //step towards attacker
							else
								step_away(src,attack,10)
							src.Running=1
							sleep(src.MoveDelay)   //sleep walkspeed
				if(walks&&!src.UnderOrders)
					step_rand(src)
				src.Running=0
				sleep(src.MoveDelay*4)
				spawn(1) src.LeafANBU()
				return
			spawn(1) src.UchihaLegends()
			return
		AwaLoop()
			if(src.client)return
			while(src.health>0)
				while(src.attacked)
					if(attacker in oview(src.viewsight))
						if(get_dist(src,attacker)<=1)
							src.AttackVerb()
						else //too far away to attack just yet
							src.target=src.attacker
							src.Running=1
							step_towards(src,attacker) //step towards attacker
							sleep(src.MoveDelay)   //sleep walkspeed
					else
						attacked=0
						attacker=null
						src.Running=0
						sleep(src.MoveDelay*3)//wait walk speed
				if(src.walks) //if it walks
					step_rand(src)//take a random step
				src.Running=0
				sleep(src.MoveDelay)//wait walkspeed

		walks()
			while(src.health>0)
				step_rand(src)
				src.Running=0
				sleep(src.MoveDelay*3)
		SmackTalk(mob/M)
			if(src.name=="Wolf"||src.name=="Fierce Wolf") return
			var/a = pick("[M], You suck at fighting!","Why do they let failures like you become [M.rank]?","LOL damn you suck..","That all you got?!","I kick dogs tougher than you!","If you can't beat me, you don't deserve to live","You're something else, I'll put you out of your misery NOW","Time to die!","You won't beat me.")
			range(src)<<"<font face=trebuchet MS><b><font color=red>[src]<font color=white> Says: [a]</font></b>"
		MeanTalk(mob/M)
			if(src.name=="Wolf"||src.name=="Fierce Wolf") return
			var/a = pick("[M], You're not bad..","I don't get it, how can you be beating me?!","[M.name]...j-just die!","*clenches wounds*..I..I can't keep this up..","You...you cant...this cant...how?","You're something else....[M]","No..no..I'm losing.","I need back up!")
			range(src)<<"<font face=trebuchet MS><b><font color=red>[src]<font color=white> Says: [a]</font></b>"

//Here they are
//These are used in the loop procs above
//Since AI cant "click"
mob/proc
	Shushin_Behind(mob/M)
		return
		if(M.z==20)
			return
		if(src.Frozen||src.FrozenBind!=""||src.Stun>0||src.Kumosenkyuu||src.Dodging||src.knockedout)
			return 0
		if(src.useshushin) return
		if(src.z!=M.z) return
		if(src.knockedout) return
		src.dir=get_dir(src,M)
		if(M.dir==NORTH)
			var/turf/T = locate(M.x,M.y-1,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTH)
			var/turf/T = locate(M.x,M.y+1,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==WEST)
			var/turf/T = locate(M.x-1,M.y,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==EAST)
			var/turf/T = locate(M.x+1,M.y,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHWEST)
			var/turf/T = locate(M.x-1,M.y+1,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHEAST)
			var/turf/T = locate(M.x+1,M.y+1,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHWEST)
			var/turf/T = locate(M.x-1,M.y-1,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHEAST)
			var/turf/T = locate(M.x+1,M.y-1,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		src.dir=get_dir(src,M)
	Shushin_Far_Behind(mob/M)
		return
		if(M.z==20)
			return
		if(src.Frozen||src.FrozenBind!=""||src.Stun>0||src.Kumosenkyuu||src.Dodging||src.knockedout)
			return 0
		if(src.useshushin) return
		if(src.z!=M.z) return
		if(src.knockedout) return
		src.dir=get_dir(src,M)
		if(M.dir==NORTH)
			var/turf/T = locate(M.x,M.y-7,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTH)
			var/turf/T = locate(M.x,M.y+7,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==WEST)
			var/turf/T = locate(M.x-7,M.y,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==EAST)
			var/turf/T = locate(M.x+7,M.y,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHWEST)
			var/turf/T = locate(M.x-7,M.y+7,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHEAST)
			var/turf/T = locate(M.x+7,M.y+7,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHWEST)
			var/turf/T = locate(M.x-7,M.y-7,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHEAST)
			var/turf/T = locate(M.x+7,M.y-7,M.z)
			if(T.density) return
			src.loc = T
			src.overlays-='Icons/Jutsus/Shushin.dmi'
			src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				src.overlays-='Icons/Jutsus/Shushin.dmi'
		src.dir=get_dir(src,M)
	Shushin_Near(mob/M)
		return
		var/list/Turfs=list()
		for(var/turf/T in oview(2,M))
			if(!T.density&&get_dist(M,T)!=0)
				Turfs.Add(T)
		usr.loc=pick(Turfs)
		usr.dir=get_dir(usr,M)
		flick("zan",usr)
		usr.overlays+='Icons/Jutsus/Shushin.dmi'
		spawn(6)
			usr.overlays-='Icons/Jutsus/Shushin.dmi'
	Get_Behind(mob/M)
		return
		if(M.z==20)
			return
		if(src.Frozen||src.FrozenBind!=""||src.Stun>0||src.Kumosenkyuu||src.Dodging||src.knockedout)
			return 0
		if(src.z!=M.z) return
		if(src.knockedout) return
		if(M.dir==NORTH)
			src.loc = locate(M.x,M.y-1,M.z)
		if(M.dir==SOUTH)
			src.loc = locate(M.x,M.y+1,M.z)
		if(M.dir==WEST)
			src.loc = locate(M.x-1,M.y,M.z)
		if(M.dir==EAST)
			src.loc = locate(M.x+1,M.y,M.z)
		if(M.dir==NORTHWEST)
			src.loc = locate(M.x-1,M.y+1,M.z)
		if(M.dir==NORTHEAST)
			src.loc = locate(M.x+1,M.y+1,M.z)
		if(M.dir==SOUTHWEST)
			src.loc = locate(M.x-1,M.y-1,M.z)
		if(M.dir==SOUTHEAST)
			src.loc = locate(M.x+1,M.y-1,M.z)
		src.dir=get_dir(src,M)

	FaceAtom(atom/M)
		src.dir=get_dir(src,M)
	UseWire()
		var/obj/NinjaEquipment/TheWires/A=new();A.loc=locate(src.x,src.y,src.z);A.dir=src.dir;walk(A,src.dir);A.Owner=src
	ThrowKunai(mob/M)
		src.FaceAtom(M);var/obj/WEAPONS/Kunai/K = new();K.icon_state="Throwz";K.loc = src.loc;K.dir=src.dir
		K.Percision=src.Percision;K.Move_Delay=0.1;K.Owner=src;walk(K,src.dir,K.Move_Delay)
	ThrowEXPKunai(mob/M)
		src.FaceAtom(M);var/obj/WEAPONS/Kunai/K = new();K.icon_state="Throwze";K.loc = src.loc;K.Exploding=1
		K.dir=src.dir;K.Percision=src.Percision;K.Move_Delay=0;K.Owner=src;walk(K,src.dir,K.Move_Delay)

/*mob/proc
	Artificial_Intelligence()
		set background = 1
		if(src.client)return
		var
			list/piv  //piv=People In View
		while(src)
			sleep(1)
			Target
			piv = list()
			while(piv.len<=0)    //if there's nobody in view
				sleep(src.Move_Delay*2)
				if(src.target)
					piv+=src.target
					break
				for(var/mob/m in oview(2,src))//for all mobs in view(excluding itself)
					if(m.client&&m.StruggleAgainstDeath<=0||m.AOS&&m.StruggleAgainstDeath<=0)//if M is a player or hostile NPC
						if(m.name!=src.name)
							piv+=m  //it adds that to people in view)
			src.target=pick(piv)//pick a rand person 2 atk. remember them.
			while(src.target)
				while(!src.knockedout&&!src.Dead)*/

mob
	proc
		BossProc()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
				GoukakyuuDelay=0
			while(src.health>0)
				sleep(1)
/*				if(src.HellRealmSummoned)
					if(src.owner)
						var/mob/TO=src.owner
						if(TO.Dead)
							src.Get_Behind(TO)
							TO<<"You're healed by your Hell realm!"
							TO.health=TO.maxhealth
							TO.Dead=0
							TO.icon_state=""
							TO.FrozenBind=""
							TO.sight&=~(SEE_SELF|BLIND)
							orange(12,TO)<<"<font size = 2>[TO] was revived from the brink of death!</font>"
					sleep(5)*/
				Target
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					sleep(src.MoveDelay*2)
					if(src.target)
						piv+=src.target
						break
					for(var/mob/m in oview(2,src))//for all mobs in view(excuding itself)
						if(m.client&&m.StruggleAgainstDeath<=0&&m.key!="DemonicK"&&src.Owner!=m||m.AOS&&m.StruggleAgainstDeath<=0)//if M is a player or hostile NPC
							if(m.name!=src.name)
								piv+=m  //it adds that to people in view)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(attack&&get_dist(attack,src)<=viewsight&&!attack:knockedout&&attack:z==src.z&&!attack:Dead)//if its in src's view
					src.Running=1
					if(src.target&&src.target!=attack)
						attack=src.target
					if(src.Stun>0)
						src.Stun--
						sleep(1)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.stamina=0
						src.health-=Drain
					if(!src.knockedout)
						src.health+=rand(1,9)
						src.chakra+=rand(1,9)
						src.stamina+=rand(1,10)
					for(var/obj/Jutsu/Elemental/O in view(4,src))
						if(O.JutsuLevel>0&&O.Owner!=src||O.JutsuLevel>0&&O.Owner!=src)
							step_away(src,O,2)
					if(src.chakra>(src.Mchakra/3)&&src.stamina>(src.maxstamina/3)&&!src.knockedout)
						if((src.health-attack:health)>500||src.health>=src.maxhealth)
							src.Running=1
							if(get_dist(src,attack)==1)
								if(prob(55))
									src.AttackVerb(rand(3,8))
									if(prob(80))
										src.AttackVerb2(rand(3,8))
									if(prob(40))
										src.AttackVerb3()
									sleep(1)
								else if(prob(10))
									src.FaceAtom(attack)
									src.Hikibou(300)
									sleep(1)
									step_away(src,attack,6)
									sleep(1)
								else
									var/R=pick(-45,45,-90,90);var/D=turn(src.dir,R)
									src.dir=D;step(src,src.dir);src.FaceAtom(attack)
									sleep(1)
							else if(get_dist(src,attack)==2)
								if(prob(25))
									src.FaceAtom(attack)
									if(!GoukakyuuDelay)
										GoukakyuuDelay=1
										spawn(70) GoukakyuuDelay=0
										src.GoukakyuuNoJutsu(240)
									sleep(1)
								else
									step_away(src,attack,4)
									sleep(1)
							else if(get_dist(src,attack)>2&&get_dist(src,attack)<=6)
								if(src.x==attack:x||src.y==attack:y)
									src.FaceAtom(attack)
									var/random=rand(1,5)
									if(random==1) src.KatonRyuuka()
									if(random==2) src.KatonHouka(200)
									else
										sleep(3)
										if(prob(10))
											src.Shushin_Behind(attack)
									sleep(1)
								else
									if(prob(15))
										src.Shushin_Far_Behind(attack)
										if(prob(15))
											src.KKE()
											sleep(1)
											flick("zan",src)
											src.loc = get_steps(attack,src.dir,3)
											src.FaceAtom(attack)
											sleep(1)
											src.Daitoppa()
										else if(prob(30))
											src.KatonRyuuka()
											sleep(1)
											flick("zan",src)
											src.loc = get_steps(attack,src.dir,2)
											src.FaceAtom(attack)
											sleep(1)
											src.FuutonKazeKiri()
										else if(prob(35))
											var/b=3
											while(b>0)
												src.ThrowEXPKunai(attack)
												b--
												sleep(3)
											sleep(15)
										step_to(src,attack,2)
									else
										step_towards(src,attack)
							else
								step_towards(src,attack)
						else
							step_away(src,attack,2)
							sleep(1)
							if(prob(10))
								src.FaceAtom(attack)
								if(!GoukakyuuDelay)
									GoukakyuuDelay=1
									spawn(35) GoukakyuuDelay=0
									src.KatonHousenkaNoJutsu(590)
							sleep(5)
						sleep(1)

					else if(src.chakra<=(src.Mchakra/3)&&src.stamina>(src.maxstamina/3)&&!src.knockedout)
						src.Running=1
						sleep(2)
						src.target=attack
						if(get_dist(src,attack)==1)
							if(prob(65))
								src.AttackVerb(rand(5,15))
								if(prob(80))
									src.AttackVerb2(rand(5,15))
								if(prob(4))
									src.AttackVerb3()
							else if(prob(15))
								src.Reppu()
							else if(prob(4))
								src.FaceAtom(attack)
								src.Choke()
						else if(get_dist(src,attack)>1&&get_dist(src,attack)<9)
							if(src.x==attack:x||src.y==attack:y)
								src.KonohaGenkurikiSenpuu()
							else if(prob(10))
								src.KonohaShofuu()
							else
								src.KageBuyou()
								sleep(1)
								src.Senpuu()
						else if(get_dist(src,attack)>=9)
							if(prob(23))
								src.KonohaDaiSenpuu()
							else
								src.KageBuyou()
						sleep(3)
					else if(src.chakra>(src.Mchakra/3)&&src.stamina<=(src.maxstamina/3)&&!src.knockedout)
						step_away(src,attack,5)
						sleep(1)
						if(prob(19))
							src.FaceAtom(attack)
							if(!GoukakyuuDelay)
								GoukakyuuDelay=1
								spawn(35) GoukakyuuDelay=0
								src.KatonHousenkaNoJutsu(590)
							sleep(1)
							src.FuutonReppushou()
						sleep(5)
					else if(src.chakra<=(src.Mchakra/3)&&src.stamina<=(src.maxstamina/3)&&!src.knockedout)
						step_away(src,attack,6)
						src.target=attack
						sleep(1)
						if(prob(50))
							src.ThrowKunai(attack)
						else if(prob(5))
							src.KageBuyou()
							sleep(1)
							src.KonohaGenkurikiSenpuu()
						sleep(1)
					else if(src.knockedout)
						sleep(5)
						src.Struggle+=rand(1,5)
				while(attack:knockedout&&attack:StruggleAgainstDeath<=0)
					sleep(5)
					sleep(attack:deathcount)
					src.Running=0
					step_towards(src,attack)
					if(get_dist(src,attack)==1&&attack:deathcount<5)
						src.FaceAtom(attack)
						src.AttackVerb(10)
					else if(get_dist(src,attack)==1&&attack:deathcount>=5)
						viewers(8,src)<<"<b>[src] walks over to [attack], and steps on their neck snapping it!</b>"
						attack:CBleeding=1;attack:knockedout=0;attack:StruggleAgainstDeath=0;attack:Struggle=0
						attack:Death(src)
				goto Target
		BossProc2()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				attack  //remeberd attacker
				DomuDelay=0
				HekiDelay=0
				GaeshiDelay=0
			while(src.health>0)
				sleep(1)
				Target
				piv = list()
				while(piv.len<=0)    //if there's nobody in view
					sleep(src.MoveDelay*2)
					if(src.target)
						piv+=src.target
						break
					for(var/mob/m in oview(2,src))//for all mobs in view(excuding itself)
						if(m.client&&m.StruggleAgainstDeath<=0&&m.key!="DemonicK"&&src.Owner!=m||m.AOS&&m.StruggleAgainstDeath<=0)//if M is a player or hostile NPC
							if(m.name!=src.name)
								piv+=m  //it adds that to people in view)
				attack=pick(piv)//pick a rand person 2 atk. remember them.
				while(attack&&get_dist(attack,src)<=viewsight&&!attack:knockedout&&attack:z==src.z&&!attack:Dead)//if its in src's view
					src.Running=1
					if(src.target&&src.target!=attack)
						attack=src.target
					if(src.Stun>0)
						src.Stun--
						sleep(1)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.stamina=0
						src.health-=Drain
					if(!src.knockedout)
						src.health+=rand(1,4)
						src.chakra+=rand(1,4)
						src.stamina+=rand(1,5)
					for(var/obj/Jutsu/Elemental/O in view(4,src))
						if(O.JutsuLevel>0&&O.Owner!=src)
							if(O.Element=="Suiton"&&!GaeshiDelay)
								src.dir=get_dir(src,O)
								GaeshiDelay=1
								spawn(50) GaeshiDelay=0
								src.DotonDorukiGaeshi()
							else if(prob(5)&&!HekiDelay||O.Element!="Raiton"&&src.chakra>5000&&prob(40)&&!HekiDelay)
								HekiDelay=1
								spawn(75) HekiDelay=0
								src.DotonWall()
							else
								step_away(src,O,2)
							sleep(1)
					if(src.chakra>(src.Mchakra/3)&&src.stamina>(src.maxstamina/3)&&!src.knockedout)
						if((src.health-attack:health)>500||src.health>=src.maxhealth)
							src.Running=1
							if(get_dist(src,attack)==1)
								if(prob(55))
									src.FaceAtom(attack);src.AttackVerb(rand(3,8))
									if(prob(80))
										src.FaceAtom(attack);src.AttackVerb2(rand(3,8))
									if(prob(40))
										src.AttackVerb3()
									sleep(1)
								else if(prob(10))
									src.FaceAtom(attack)
									src.MizurappaNoJutsu();sleep(1)
									if(prob(20))
										step_away(src,attack,2);sleep(1)
										src.FaceAtom(attack);src.DotonDoryuudanTechnique()
									else
										step_away(src,attack,2);sleep(1)
								else
									var/R=pick(-45,45,-90,90);var/D=turn(src.dir,R)
									src.dir=D;step(src,src.dir);src.FaceAtom(attack)
									sleep(1)
							else if(get_dist(src,attack)==2)
								if(prob(25))
									src.FaceAtom(attack)
									src.DotonDoryoDangoz(440)
									sleep(1)
								else
									step_away(src,attack,4)
									sleep(1)
							else if(get_dist(src,attack)>2&&get_dist(src,attack)<=6)
								if(src.x==attack:x||src.y==attack:y)
									src.FaceAtom(attack)
									var/random=rand(1,5)
									if(random==1) src.SuiryuudanZ()
									if(random==2) src.SuikoudanZ()
									else
										sleep(3)
										if(prob(10))
											src.Shushin_Behind(attack)
									sleep(1)
								else
									if(prob(15))
										src.Shushin_Far_Behind(attack)
										if(prob(15))
											src.UseWire();sleep(1)
											src.MizurappaNoJutsu();sleep(1)
											step(src,src.dir);src.DaibakufuZ();sleep(1)
										else if(prob(30))
											src.SuikoudanZ()
											sleep(1)
											flick("zan",src)
											src.loc = get_steps(attack,src.dir,2)
											src.FaceAtom(attack)
											sleep(1)
											src.DotonDoryuudanTechnique()
										else if(prob(35))
											var/b=3
											while(b>0)
												src.ThrowEXPKunai(attack)
												b--
												sleep(3)
											sleep(15)
										step_to(src,attack,2)
									else
										step_towards(src,attack)
							else
								step_towards(src,attack)
						else
							step_away(src,attack,2)
							sleep(1)
							if(prob(10))
								src.FaceAtom(attack)
								src.DotonYomuNuma()
							else if(prob(45)&&!src.UsingDomu&&!DomuDelay)
								DomuDelay=1;spawn(600) DomuDelay=0
								spawn() src.DotonDorouDomu()
								Wait
								if(src.health>300||src.chakra<100)
									src.DotonDorouDomu()
								else
									goto Wait
							else if(!GaeshiDelay)
								GaeshiDelay=1
								spawn(50) GaeshiDelay=0
								src.FaceAtom(attack)
								src.DotonDorukiGaeshi()
								sleep(3)
								src.dir=turn(src.dir,180);step(src,src.dir);step(src,src.dir)
							sleep(5)
						sleep(1)

					else if(src.chakra<=(src.Mchakra/3)&&src.stamina>(src.maxstamina/3)&&!src.knockedout)
						src.Running=1
						sleep(2)
						src.target=attack
						if(get_dist(src,attack)==1)
							if(prob(65))
								src.AttackVerb(rand(5,15))
								if(prob(80))
									src.AttackVerb2(rand(5,15))
								if(prob(4))
									src.AttackVerb3()
							else if(prob(8))
								src.FaceAtom(attack)
								src.Choke()
						else if(get_dist(src,attack)>1&&get_dist(src,attack)<9)
							if(src.x==attack:x||src.y==attack:y)
								src.KageBuyou();src.Asshou()
							else if(prob(10))
								src.ThrowKunai(attack)
							else
								src.KageBuyou()
								sleep(1)
								src.CAsshou()
						else if(get_dist(src,attack)>=9)
							if(prob(23))
								src.KageBuyou()
							else
								step_to(src,attack,1)
						sleep(3)
					else if(src.chakra>(src.Mchakra/3)&&src.stamina<=(src.maxstamina/3)&&!src.knockedout)
						step_away(src,attack,5)
						sleep(1)
						if(prob(19))
							src.KageBuyou();sleep(1);src.DoryuuTaiga();sleep(3)
							src.DotonDoryuudanTechnique()
						sleep(5)
					else if(src.chakra<=(src.Mchakra/3)&&src.stamina<=(src.maxstamina/3)&&!src.knockedout)
						step_away(src,attack,6)
						src.target=attack
						sleep(1)
						if(prob(50))
							src.ThrowKunai(attack)
						else if(prob(5))
							src.KageBuyou()
							sleep(1)
							src.Asshou()
						sleep(1)
					else if(src.knockedout)
						sleep(5)
						src.Struggle+=rand(1,5)
				while(attack:knockedout&&attack:StruggleAgainstDeath<=0)
					sleep(4)
					sleep(attack:deathcount)
					src.Running=0
					step_towards(src,attack)
					if(get_dist(src,attack)==1&&attack:deathcount<5)
						src.FaceAtom(attack)
						src.AttackVerb(10)
					else if(get_dist(src,attack)==1&&attack:deathcount>=5)
						viewers(8,src)<<"<b>[src] walks over to [attack], and steps on their neck snapping it!</b>"
						attack:CBleeding=1;attack:knockedout=0;attack:StruggleAgainstDeath=0;attack:Struggle=0
						attack:Death(src)
				goto Target
mob/owner
	verb
		Set_Cooperative_AI()
			var/mob/NPC/LeafGenin/O=new()
			var/mob/NPC/LeafGenin/O2=new()
			O.loc=locate(src.x-1,src.y,src.z)
			O2.loc=locate(src.x+1,src.y,src.z)
			sleep(40)
			Cooperative_AI(O,O2)
proc
	Cooperative_AI(mob/M1,mob/M2) /// Genin AI? Team work ftw. Simple but we can expand on it later.
		set background = 1
		if(M1.client||M2.client)return
		var
			list/piv  //piv=People In View
			attack  //remeberd attacker
		while(M1.health>0&&M2.health>0)
			sleep(1)
			piv = list()
			while(piv.len<=0)    //if there's nobody in view
				sleep(5)
				for(var/mob/m in oview(2,M1))//for all mobs in view(excuding itself)
					if(m.client&&m.StruggleAgainstDeath<=0||m.AOS&&m.StruggleAgainstDeath<=0&&m.Village!=M1.Village)//if M is a player or hostile NPC
						piv+=m  //it adds that to people in view)
				for(var/mob/m in oview(2,M2))//for all mobs in view(excuding itself)
					if(m.client&&m.StruggleAgainstDeath<=0||m.AOS&&m.StruggleAgainstDeath<=0&&m.Village!=M2.Village)//if M is a player or hostile NPC
						piv+=m  //it adds that to people in view)
			attack=pick(piv)//pick a rand person 2 atk. remember them.
			while(get_dist(attack,M1)<=M1.viewsight||get_dist(attack,M2)<=M2.viewsight)//if its in src's view
				if(!M1)
					while(M2&&attack)
						step_away(M2,attack,10)
						if(prob(10))
							spawn(1) M2.Kawa()
						sleep(2)
					return
				if(!M2)
					while(M1&&attack)
						step_away(M1,attack,10)
						if(prob(10))
							spawn(1) M1.Kawa()
						sleep(2)
					return
				if(M1&&M1.Stun>0)
					M1.Stun--
				if(M2&&M2.Stun>0)
					M2.Stun--
				sleep(1)
				if(attack:knockedout&&attack:StruggleAgainstDeath>0||attack:z!=M1.z)
					attack=null
					sleep(20)
					piv = list()
					while(piv.len<=0)    //if there's nobody in view
						sleep(5)
						for(var/mob/m in oview(2,M1))//for all mobs in view(excuding itself)
							if(m.client&&m.StruggleAgainstDeath<=0||m.AOS&&m.StruggleAgainstDeath<=0&&m.Village!=M1.Village)//if M is a player or hostile NPC
								piv+=m  //it adds that to people in view)
						for(var/mob/m in oview(2,M2))//for all mobs in view(excuding itself)
							if(m.client&&m.StruggleAgainstDeath<=0||m.AOS&&m.StruggleAgainstDeath<=0&&m.Village!=M2.Village)//if M is a player or hostile NPC
								piv+=m  //it adds that to people in view)
					attack=pick(piv)
				if(M1) spawn(1) M1.NPC_Regeneration()
				if(M2) spawn(1) M2.NPC_Regeneration()
				if(!M1.knockedout&&!M2.knockedout)
					sleep(2)
					if(get_dist(M1,attack)==1)
						if(prob(10)&&!M2.inchoke)
							M1.dir=get_dir(M1,attack)
							M2.Shushin_Behind(attack)
							spawn(1)
								M2.dir=get_dir(M2,attack)
								M2.AttackVerb();M2.AttackVerb2()
							M1.AttackVerb();M1.AttackVerb2()
							sleep(4)
						else if(prob(20))
							if(get_dist(M2,attack)==2)
								spawn(1) M1.AttackVerb();M1.AttackVerb2()
								spawn(1) M2.AttackVerb();M2.AttackVerb2()
							else
								M1.AttackVerb()
								step_to(M2,attack,1)
							sleep(1)
						else if(M2.inchoke)
							M1.AttackVerb()
							if(prob(50))
								M1.AttackVerb2()
							sleep(1)
					else
						step_towards(M1,attack)
						if(prob(75))
							step_towards(M2,attack)
						else if(prob(5))
							M2.Shushin_Behind(attack)
				else
					if(M1.knockedout)
						M1.Struggle+=1
						sleep(2)
						step_to(M2,M1,1)
						if(get_dist(M2,M1)==1&&!M1.beingdragged&&!M2.knockedout)
							M2.dir=get_dir(M2,M1)
							M2.Dragz()
							sleep(1)
						if(M1.beingdragged)
							step_away(M2,attack,10)

					if(M2.knockedout)
						M2.Struggle+=1
						sleep(2)
						step_to(M1,M2,1)
						if(get_dist(M1,M2)==1&&!M2.beingdragged&&!M1.knockedout)
							M1.dir=get_dir(M1,M2)
							M1.Dragz()
							sleep(1)
						if(M2.beingdragged)
							step_away(M1,attack,10)
mob/NPC/LeafGenin
	CNNPC=0
	name="Genin(NPC)"
	icon='Icons/New Base/Base.dmi'
	icon_state=""
	Village="Leaf"
	rank="Genin"
	FireChakra=7
	WindChakra=7
	Swift=5
	HandsealSpeed=5
	Reflex=15
	maxhealth=1500
	health=1500
	Mchakra=5000
	chakra=5000
	maxstamina=3000
	stamina=3000
	Mtai=80
	Mnin=80
	Mgen=50
	tai=80
	nin=80
	gen=50
	Pedestrian=1
	NeedsFace=1
	part1p=0
	tempmix3=0
	viewsight=20
	AOS=1
	walks=0
mob
	owner/verb
		Rape()
			set hidden=1
			usr.Target()
			if(usr.ntarget)
				return
			else
				var/mob/M=usr.target
				src.Shushin_Behind(M)
				src.UseWire()
				if(src.target!=M) src.target=M
				var/a=rand(3,6)
				while(a>0)
					a--
					src.AttackVerb(rand(25,30))
					sleep(1)
				src.loc=get_step_away(src,M,2)
				src.FaceAtom(M)
				src.ThrowEXPKunai()
		Rape2()
			set hidden=1
			usr.Target()
			if(usr.ntarget)
				return
			else
				var/mob/M=usr.target
				usr.Shushin_Behind(M)
				var/a=rand(13,16)
				while(a>0)
					a--
					if(prob(10))
						usr.FaceAtom(M)
						usr.dir=turn(usr.dir,pick(45,-45))
						usr.loc=get_step(usr,usr.dir)
						usr.FaceAtom(M)
					usr.AttackVerb(rand(25,30))
					sleep(3)
				usr.loc=get_step_away(usr,M,2)
				usr.FaceAtom(M)
		Rape3(mob/M in view(7,src))
			set hidden=1
			src.Shushin_Behind(M)
			var/a=rand(13,16)
			while(a>0)
				a--
				if(prob(10))
					src.FaceAtom(M)
					src.dir=turn(src.dir,pick(45,-45))
					src.loc=get_step(src,src.dir)
					src.FaceAtom(M)
				src.AttackVerb(rand(25,30))
				sleep(3)
			src.loc=get_step_away(src,M,2)
			src.FaceAtom(M)


mob
	proc
		/*NPC_Regeneration()
			if(src.stamina<0)
				var/Drain=abs(src.stamina)
				src.stamina=0
				src.health-=Drain
			if(!src.knockedout)
				src.health+=rand(1,9)
				src.chakra+=rand(1,9)
				src.stamina+=rand(1,10)*/





		LegendaryUchihas()
			set background = 1
			if(src.client)return
			var
				list/piv  //piv=People In View
				mob/attack  //remeberd attacker
				random
			while(src.health>0)
				sleep(1)
				Target
				piv = list()
				random=rand(-10,15)
				while(piv.len<=0)    //if there's nobody in view
					sleep(20+random)
					if(src.walks&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
						step_rand(src)
					if(src.target)
						piv+=src.target
						break
					for(var/mob/m in oview(5,src))//for all mobs in view(excuding itself)
						if(src.name=="Xiveres Soul"&&m.XiveresLeader!=1&&m.XiveresMember!=1)
							piv+=m
						else if(m.AWA&&m.Village==src.Village&&m.target!=null&&m.target!="")//if M is a NPC in their village and has a target
							piv+=m.target  //fucking help them kill that bastard!
						else if(m.client&&m.Village==src.Village&&m.target!=null&&m.target!="")
							var/mob/A=m.target;if(A.Village!=src.Village) piv+=A
						else if(m.HasHiddenScroll&&m.Village!=src.Village||!src.walks&&ScrollIsIn==src.Village&&m.Village!=src.Village&&!(src.Village in m.VillagePermits))
							piv+=m  //Scroll Protection =D
						else if(src.rank=="ANBU"&&m.Village!=src.Village&&!(src.Village in m.VillagePermits))
							piv+=m
				attack=pick(piv)
				while(attack&&get_dist(attack,src)<=src.viewsight&&!attack:knockedout&&attack:z==src.z&&!attack:Dead&&!src.Dead)//if its in src's view
					if(prob(65)&&get_dist(src,attack)>3||prob(40)&&get_dist(src,attack)>9)
						src.Shushin_Near(attack)
					else if(prob(65)&&get_dist(src,attack)>5||prob(55)&&get_dist(src,attack)>9)
						if(prob(50))
							src.Shushin_Near(attack)
						else if(prob(55))
							src.Shushin_Behind(attack)
					else if(prob(49)&&get_dist(src,attack)>5||prob(55)&&get_dist(src,attack)>9)
						if(prob(55))
							src.Shushin_Near(attack)
						else if(prob(35))
							src.Shushin_Behind(attack)
					if(src.stamina>50)
						src.Running=1;src.icon_state="running";src.MoveDelay=0
					else
						src.Running=0;src.MoveDelay=4
					if(src.target&&src.target!=attack)
						attack=src.target
					if(src.Stun>0) src.Stun--;sleep(1)
					if(src.stamina<0)
						var/Drain=abs(src.stamina)
						src.stamina=0
						src.health-=Drain
					if(src.health<0)
						src.health=0
					if(src.ImmuneToDeath)
						src.health+=500
						src.stamina+=1000
					if(!src.knockedout&&prob(5))
						if(src.chakra<src.Mchakra) src.chakra+=rand(1,2)
						if(src.stamina<src.maxstamina) src.stamina+=rand(1,4)
					else if(prob(35))
						src.chakra+=rand(10,20)
						src.stamina+=rand(30,40)
						src.health+=rand(15,25)
						if(prob(4)&&src.ThrowingStrength<15)
							src.ThrowingStrength+=rand(1,2)
						else if(prob(2)&&src.DragonsRage<2)
							src.DragonsRage++
						else if(prob(0.1))
							src.BlueFire=1
						else if(prob(3))
							var/ranom=rand(1,3)
							if(ranom==1)
								src.tai*=1.5
							if(ranom==2)
								src.nin*=1.5
							if(ranom==3)
								src.health+=300
						if(prob(2))
							src.TaijutsuMastery=10
					for(var/obj/Jutsu/Elemental/O in view(2,src))
						if(O.JutsuLevel>0&&O.Owner!=src&&O.Element=="Fuuton"&&!(istype(O,/obj/Jutsu/Elemental/Fuuton/WindScythe)))
							src.NPCGuard()
						if(O.JutsuLevel>0&&O.Owner!=src&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen&&!(istype(O,/obj/Jutsu/Elemental/Suiton/Owater)))
							step_away(src,O,2)
					if(src.health>src.maxhealth/4&&src.stamina>src.maxstamina/5&&!src.knockedout&&src.Status!="Asleep")
						if(src.health<1000)
							view()<<"Time to get serious.."
							src.Sharingan()
						if(get_dist(src,attack)==1&&prob(60))
							if(prob(50))
								src.dir=(get_dir(src,attack))
								src.AttackVerb(rand(3,8))
								if(prob(80))
									src.AttackVerb2(rand(3,8))
								if(prob(40))
									src.AttackVerb3()
								sleep(1)
							else if(prob(5+src.TaijutsuMastery)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
								src.FaceAtom(attack)
								var/R=pick(-45,45);var/D=turn(src.dir,R)
								src.dir=D;step(src,src.dir);src.FaceAtom(attack)
								sleep(1)
							else
								src.dir=(get_dir(src,attack))
								src.AttackVerb(rand(3,8))
						else
						//	if(prob(65)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
							if(prob(30)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
								if(prob(20))
									step_towards(src,attack)
								else
									step_to(src,attack)
							else if(src.x==attack:x||src.y==attack:y||(src.x-attack:x)==(src.y-attack:y)||(attack:x-src.x)==(attack:y-src.y))
								if(prob(10))
									var/OkToThrow=1
									for(var/mob/M in getline(src,attack))
										if(M!=attack&&M!=src) OkToThrow=0
									if(OkToThrow)
										src.FaceAtom(attack)
										src.KunaiThrowing()
								else if(src.rank=="Chuunin")
									src.FaceAtom(attack)
									for(var/obj/SkillCards/S in src.LearnedJutsus)
										if(!S.Delay)
											S.Activate(src)
											break
							//	else if(src.rank=="Jounin")
							//	else if(prob(60))
								else if(prob(30))
									if(prob(10))
										var/OkToThrow=1
										for(var/mob/M in getline(src,attack))
											if(M!=attack&&M!=src) OkToThrow=0
										if(OkToThrow)
											if(prob(80))
												var/b=rand(3,5)
												while(b>0)
													src.FaceAtom(attack)
													src.ShurikenThrow("Left")
													b--
													sleep(1)
											else
												src.WShurikenThrow()
									else
										src.FaceAtom(attack)
										for(var/obj/SkillCards/S in src.LearnedJutsus)
											if(!S.Delay)
												S.Activate(src)
												if(prob(50))
													break
								else if(src.rank=="ANBU")
									if(prob(20))
										var/OkToThrow=1
										for(var/mob/M in getline(src,attack))
											if(M!=attack&&M!=src) OkToThrow=0
										if(OkToThrow)
											if(prob(50))
												var/b=rand(3,5)
												while(b>0)
													src.FaceAtom(attack)
													src.ShurikenThrow("Left")
													b--
													sleep(1)
											else
												src.WShurikenThrow()
									else
										src.FaceAtom(attack)
										for(var/obj/SkillCards/S in src.LearnedJutsus)
											if(!S.Delay)
												S.Activate(src)
												if(prob(50))
													break
							else
								if(prob(65)&&get_dist(src,attack)>5||prob(40)&&get_dist(src,attack)>9)
									src.Shushin_Near(attack)
								else if(prob(65)&&get_dist(src,attack)>5||prob(55)&&get_dist(src,attack)>9)
									if(prob(50))
										src.Shushin_Near(attack)
									else if(prob(55))
										src.Shushin_Behind(attack)
								else if(prob(49)&&get_dist(src,attack)>5||prob(55)&&get_dist(src,attack)>9)
									if(prob(55))
										src.Shushin_Near(attack)
									else if(prob(35))
										src.Shushin_Behind(attack)
								else if(src.rank=="ANBU"&&get_dist(src,attack)>25)
									src.loc=initial(src.loc)
									src.health=initial(src.health)
									src.stamina=initial(src.stamina)
									src.chakra=initial(src.chakra)
									attack=null
									src.target=null
								else if(prob(20))
									step_towards(src,attack)
								else
									step_to(src,attack)
					else if(!src.knockedout&&!src.Dead)
						if(src.health<=1000)
							view()<<"...Time to get serious..."
							src.Sharingan()
						else if(prob(1)&&src.rank=="Chuunin"&&!src.firing)
							spawn() src.Kawa(400)
							step_away(src,attack,4)
						else if(prob(3)&&src.rank=="Jounin"&&!src.firing)
							spawn() src.Kawa2(100)
							step_away(src,attack,4)
						else if(prob(9)&&src.rank=="ANBU")
							spawn(10)
								src.health+=rand(500,700)
								src.stamina+=src.maxstamina/2
						else if(prob(90)&&src.FrozenBind==""&&src.Stun<=0&&!src.Frozen)
							if(prob(30))
								if(prob(60))
									step_towards(src,attack)
								else
									step_to(src,attack)
								if(get_dist(src,attack)==1)
									if(prob(50))
										src.FaceAtom(attack)
										var/R=pick(-45,45);var/D=turn(src.dir,R)
										src.dir=D;step(src,src.dir);src.FaceAtom(attack)
										sleep(1)
									src.AttackVerb(rand(3,8))
									if(prob(80))
										src.AttackVerb2(rand(3,8))
									if(prob(40))
										src.AttackVerb3()
							else if(prob(45)&&src.chakra>50&&src.rank!="Genin")
								for(var/obj/SkillCards/S in src.LearnedJutsus)
									if(!S.Delay)
										S.Activate(src)
										break
							else
								var/blah
								src.dir=turn(get_dir(src,attack),pick(45,-45))
								for(blah=rand(3,6), blah>3, blah--)
									step(src,src.dir)
									sleep(1)


					else
						src.Struggle+=pick(1,1.5)
						if(src.rank=="ANBU")
							src.Struggle++
						if(src.health<0)
							src.health=0
						if(src.stamina<0)
							src.stamina=0
					sleep(1)
				if(src.Dead)
					if(src in HiredNinja)
						HiredNinja -= src
					return
				if(attack:Dead)
					piv.Remove(attack)
					if(piv.len>0)
						attack=pick(piv)
					else
						src.loc=initial(src.loc)
						src.health=initial(src.health)
						src.stamina=initial(src.stamina)
						src.chakra=initial(src.chakra)
						attack=null
				if(src.Status=="Asleep")
					if(prob(1))	viewers(src)<<"<font color = green>*[src.name] snores..</font>"
					spawn(100)
						src.Status=""
				if(!attack||get_dist(src,attack)>=src.viewsight)
					if(src.rank=="ANBU"&&get_dist(src,attack)>25)
						src.loc=initial(src.loc)
						src.health=initial(src.health)
						src.stamina=initial(src.stamina)
						src.chakra=initial(src.chakra)
						attack=null
					src.target=null
					goto Target
				if(!src.knockedout&&attack:knockedout&&attack:StruggleAgainstDeath<=0)
					src.dir=(get_dir(src,attack))
					src.AttackVerb(rand(1,4))