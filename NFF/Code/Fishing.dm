mob/var/tmp/FishingRodType=""
mob/var/tmp/FishingRodEquipped=0
mob/var/FishingRodExpert=0

obj/BeginnerFishingRod
	name = "Beginner Fishing Rod"
	icon = 'FishingRod.dmi'
	icon_state="Beginner"
	var/tmp/ReelingIn=0
	var
		ReeledIn=0
		Equipped=0
		ReeledOut=1
		Wiggling=0
		Shaking=0
		Broken=0

	verb
		Equip()
			if(usr.FishingRodType!="")
				usr<<"You can't equip two fishing rods at once!";return
			if(src.Broken)
				usr<<"You can't equip a broken [src]!";return
			if(usr.FishingRodEquipped&&src.Equipped)
				if(src.ReeledOut)
					usr.Fishing=0
					usr<<"You try putting away the [src] while it's still in the water!"
					sleep(20)
					if(prob(70))
						usr<<"As you yank the wire of the [src] back torwards you it snaps!"
						src.Broken=1
						src.ReeledOut=0
						src.ReeledIn=0
						src.Equipped=0
						usr.FishingRodType=""
						return
					usr<<"You put away the [src] barely."
					usr.overlays-='Icons/New Base/Weapons/BFishingPole.dmi'
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
				if(src.ReeledIn)
					usr.Fishing=0
					usr<<"You begin to put away the [src] while it's put away properly."
					sleep(20)
					usr<<"You have put away your [src]."
					usr.overlays-='Icons/New Base/Weapons/BFishingPole.dmi'
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
			usr<<"You begin to equip the [src]."
			sleep(20)
			usr<<"You equip the [src]."
			usr.FishingRodType="Beginner"
			usr.FishingRodEquipped=1
			usr.overlays+='Icons/New Base/Weapons/BFishingPole.dmi'
			src.Equipped=1
		Reel()
			if(!src.ReeledOut)
				usr<<"How can you reel the Fishing Rod back in if it's not even out?"
				return
			if(src.ReelingIn)
				src.ReelingIn=0
				usr<<"You stop Reeling in the wire.";return
			if(!src.ReeledIn&&src.ReeledOut)
				usr<<"You begin to Reel In the Fishing Rod."
				src.ReelingIn=1
				spawn(50)
					usr<<"You have Reeled Back in the Fishing Rod!"
					src.ReeledIn=1
					src.ReeledOut=0
					src.ReelingIn=0
					return
		Inspect()
			if(src.Broken)
				usr<<"The wire of the Fishing Rod is completly gone. This Rod is broken.";return
			usr<<"It looks like a Fishing Rod that's used for Beginners!";return
		Drop()
			if(src.Equipped)
				usr<<"Unequip it first!";return
			usr.overlays-='Icons/New Base/Weapons/BFishingPole.dmi'
			src.loc=locate(usr.x,usr.y-1,usr.z)
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up a [src]"
obj/ModerateFishingRod
	name = "Fishing Rod"
	icon = 'FishingRod.dmi'
	icon_state="Moderate"
	var/tmp/ReelingIn=0
	var
		ReeledIn=0
		Equipped=0
		ReeledOut=1
		Wiggling=0
		Shaking=0
		Broken=0

	verb
		Equip()
			if(usr.FishingRodType!="")
				usr<<"You can't equip two fishing rods at once!";return
			if(src.Broken)
				usr<<"You can't equip a broken [src]!";return
			if(usr.FishingRodEquipped&&src.Equipped)
				if(src.ReeledOut)
					usr.Fishing=0
					usr<<"You try putting away the [src] while it's still in the water!"
					sleep(20)
					if(prob(70))
						usr<<"As you yank the wire of the [src] back torwards you it snaps!"
						src.Broken=1
						src.ReeledOut=0
						src.ReeledIn=0
						src.Equipped=0
						usr.FishingRodType=""
						usr.overlays-='Icons/New Base/Weapons/MFishingPole.dmi'
						return
					usr<<"You put away the [src] barely."
					usr.overlays-='Icons/New Base/Weapons/MFishingPole.dmi'
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
				if(src.ReeledIn)
					usr.Fishing=0
					usr<<"You begin to put away the [src] while it's put away properly."
					sleep(20)
					usr.overlays-='Icons/New Base/Weapons/MFishingPole.dmi'
					usr<<"You have put away your [src]."
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
			usr<<"You begin to equip the [src]."
			sleep(20)
			usr.overlays+='Icons/New Base/Weapons/MFishingPole.dmi'
			usr<<"You equip the [src]."
			usr.FishingRodType="Moderate"
			usr.FishingRodEquipped=1
			src.Equipped=1
		Reel()
			if(!src.ReeledOut)
				usr<<"How can you reel the Fishing Rod back in if it's not even out?"
				return
			if(src.ReelingIn)
				src.ReelingIn=0
				usr<<"You stop Reeling in the wire.";return
			if(!src.ReeledIn&&src.ReeledOut)
				usr<<"You begin to Reel In the Fishing Rod."
				src.ReelingIn=1
				spawn(50)
					usr<<"You have Reeled Back in the Fishing Rod!"
					src.ReeledIn=1
					src.ReeledOut=0
					src.ReelingIn=0
					return
		Inspect()
			if(src.Broken)
				usr<<"The wire of the Fishing Rod is completly gone. This Rod is broken.";return
			usr<<"It looks like a Fishing Rod that's used by the average fishermen.";return
		Drop()
			if(src.Equipped)
				usr<<"Unequip it first!";return
			usr.overlays-='Icons/New Base/Weapons/MFishingPole.dmi'
			src.loc=locate(usr.x,usr.y-1,usr.z)
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up a [src]"
obj/ExpertFishingRod
	name = "Expert Fishing Rod"
	icon = 'FishingRod.dmi'
	icon_state="Expert"
	var/tmp/ReelingIn=0
	var
		ReeledIn=0
		Equipped=0
		ReeledOut=1
		Wiggling=0
		Shaking=0
		Broken=0
	verb
		Equip()
			if(usr.FishingRodType!="")
				usr<<"You can't equip two fishing rods at once!";return
			if(src.Broken)
				usr<<"You can't equip a broken [src]!";return
			if(usr.FishingRodEquipped&&src.Equipped)
				if(src.ReeledOut)
					usr.Fishing=0
					usr<<"You try putting away the [src] while it's still in the water!"
					sleep(20)
					if(prob(70))
						usr.overlays-='Icons/New Base/Weapons/MAFishingPole.dmi'
						usr<<"As you yank the wire of the [src] back torwards you it snaps!"
						src.Broken=1
						src.ReeledOut=0
						src.ReeledIn=0
						src.Equipped=0
						usr.FishingRodType=""
						return
					usr.overlays-='Icons/New Base/Weapons/MAFishingPole.dmi'
					usr<<"You put away the [src] barely."
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
				if(src.ReeledIn)
					usr.Fishing=0
					usr<<"You begin to put away the [src] while it's put away properly."
					sleep(20)
					usr<<"You have put away your [src]."
					usr.overlays-='Icons/New Base/Weapons/MAFishingPole.dmi'
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
			usr<<"You begin to equip the [src]."
			usr.overlays+='Icons/New Base/Weapons/MAFishingPole.dmi'
			sleep(20)
			usr<<"You equip the [src]."
			usr.FishingRodType="Expert"
			usr.FishingRodEquipped=1
			src.Equipped=1
		Reel()
			if(!src.ReeledOut)
				usr<<"How can you reel the Fishing Rod back in if it's not even out?"
				return
			if(src.ReelingIn)
				src.ReelingIn=0
				usr<<"You stop Reeling in the wire.";return
			if(!src.ReeledIn&&src.ReeledOut)
				usr<<"You begin to Reel In the Fishing Rod."
				src.ReelingIn=1
				spawn(50)
					usr<<"You have Reeled Back in the Fishing Rod!"
					src.ReeledIn=1
					src.ReeledOut=0
					src.ReelingIn=0
					return
		Inspect()
			if(src.Broken)
				usr<<"The wire of the Fishing Rod is completly gone. This Rod is broken.";return
			usr<<"It looks like a Fishing Rod that's used by the expert fishermen.";return
		Drop()
			if(src.Equipped)
				usr<<"Unequip it first!";return
			usr.overlays-='Icons/New Base/Weapons/MAFishingPole.dmi'
			src.loc=locate(usr.x,usr.y-1,usr.z)
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up a [src]"
obj/BadassFishingRod
	name = "Badass Fishing Rod"
	icon = 'FishingRod.dmi'
	icon_state="Expert"
	var/tmp/ReelingIn=0
	var
		ReeledIn=0
		Equipped=0
		ReeledOut=1
		Wiggling=0
		Shaking=0
		Broken=0
	verb
		Equip()
			if(usr.FishingRodType!="")
				usr<<"You can't equip two fishing rods at once!";return
			if(src.Broken)
				usr<<"You can't equip a broken [src]!";return
			if(usr.FishingRodEquipped&&src.Equipped)
				if(src.ReeledOut)
					usr.Fishing=0
					usr<<"You try putting away the [src] while it's still in the water!"
					sleep(20)
					if(prob(70))
						usr.overlays-='Icons/New Base/Weapons/BAFishingPole.dmi'
						usr<<"As you yank the wire of the [src] back torwards you it snaps!"
						src.Broken=1
						src.ReeledOut=0
						src.ReeledIn=0
						src.Equipped=0
						usr.FishingRodType=""
						return
					usr.overlays-='Icons/New Base/Weapons/BAFishingPole.dmi'
					usr<<"You put away the [src] barely."
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
				if(src.ReeledIn)
					usr.Fishing=0
					usr<<"You begin to put away the [src] while it's put away properly."
					sleep(20)
					usr<<"You have put away your [src]."
					usr.overlays-='Icons/New Base/Weapons/BAFishingPole.dmi'
					usr.FishingRodEquipped=0
					usr.FishingRodType=""
					src.Equipped=0
					return
			usr<<"You begin to equip the [src]."
			sleep(20)
			usr<<"You equip the [src]."
			usr.overlays+='Icons/New Base/Weapons/BAFishingPole.dmi'
			usr.FishingRodType="Badass"
			usr.FishingRodEquipped=1
			src.Equipped=1
		Reel()
			if(!src.ReeledOut)
				usr<<"How can you reel the Fishing Rod back in if it's not even out?"
				return
			if(src.ReelingIn)
				src.ReelingIn=0
				usr<<"You stop Reeling in the wire.";return
			if(!src.ReeledIn&&src.ReeledOut)
				usr<<"You begin to Reel In the Fishing Rod."
				src.ReelingIn=1
				spawn(50)
					usr<<"You have Reeled Back in the Fishing Rod!"
					src.ReeledIn=1
					src.ReeledOut=0
					src.ReelingIn=0
					return
		Inspect()
			if(src.Broken)
				usr<<"The wire of the Fishing Rod is completly gone. This Rod is broken.";return
			usr<<"It looks like a Fishing Rod that's used by only a true Badass.";return
		Drop()
			if(src.Equipped)
				usr<<"Unequip it first!";return
			usr.overlays-='Icons/New Base/Weapons/BAFishingPole.dmi'
			src.loc=locate(usr.x,usr.y-1,usr.z)
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up a [src]"

/*mob
	proc
		Fishing(BonusTurfChance)
			var/UsingFishingRod=0
			var/UsingBeginner=0
			var/BeginnerRodCheck=0
			var/BeginnerRodCheckReadyToGo=0
			var/ModerateRodCheck=0
			var/ModerateRodCheckReadyToGo=0
			var/UsingModerate=0
			//var/ExpertRodCheck=0
			//var/ExpertRodCheckReadyToGo=0
			var/UsingExpert=0
			//var/BadAssRodCheck=0
			//var/BadAssRodCheckReadyToGo=0
			var/UsingBadAss=0
			var/FishStruggleSuccess=0
			//var/FishStruggleFailure=0
			var/FishFightTimer=8
			var/ButtonMashScore=0
			var/FishStruggle=0
			var/MiniGame2Fail=0
			FishStruggle=(50+pick(10,15,20,25))
			if(usr.key=="CobraT1337"||usr.key=="The Jefferson"||usr.key=="JyuonJoon"||usr.key=="Lnxerz"||usr.key=="Katon32"||usr.key=="Kjjones")
				if(usr.FishingRodType=="Beginner")
					for(var/obj/BeginnerFishingRod/P in usr.contents)
						if(P.Equipped)
							UsingBeginner=1
						if(P.ReeledOut)
							BeginnerRodCheck=1
						if(P.ReeledIn)
							BeginnerRodCheckReadyToGo=1
							P.ReeledIn=0
				if(usr.FishingRodType=="Moderate")
					for(var/obj/ModerateFishingRod/P in usr.contents)
						if(P.Equipped)
							UsingModerate=1
						if(P.ReeledOut)
							ModerateRodCheck=1
						if(P.ReeledIn)
							ModerateRodCheckReadyToGo=1
							P.ReeledIn=0
				if(usr.FishingRodType=="Expert")
					for(var/obj/ExpertFishingRod/P in usr.contents)
						if(P.Equipped)
							UsingExpert=1
						if(P.ReeledOut)
							ExpertRodCheck=1
						if(P.ReeledIn)
							ExpertRodCheckReadyToGo=1
							P.ReeledIn=0
				if(usr.FishingRodType=="BadAss")
					for(var/obj/BadassFishingRod/P in usr.contents)
						if(P.Equipped)
							UsingBadAss=1
						if(P.ReeledOut)
							BadAssRodCheck=1
						if(P.ReeledIn)
							BadAssRodCheckReadyToGo=1
							P.ReeledIn=0
				if(usr.Fishing)
					if(usr.Fishing&&!usr.FishingRodEquipped)
						usr<<"You remove your hands from the Water and stop trying to catch a fish."
						usr.Fishing=0
						return
					if(usr.Fishing&&UsingFishingRod&&UsingBeginner)
						usr<<"You stop Fishing."
						usr.Fishing=0
				else
					if(UsingBeginner)
						FishFightTimer+=rand(2,7)
						var/WhichMiniGame=pick(1,2)
						if(BeginnerRodCheck)
							usr<<"How can you expect to release your Rod when you left your line all the way out there?";return
						if(BeginnerRodCheckReadyToGo)
							usr<<"You throw your Fishing line out and into the water."
							oview()<<"[usr] throws their Beginner Fishing Rod into the water and waits for a fish to bite.";
							usr.Fishing=1
							for(var/obj/BeginnerFishingRod/P in usr.contents)
								if(P.Equipped)
									P.ReeledOut=1
							var/WaitingTime=0
							var/FishingLoc=0
							FishingLoc=usr.loc
							if(usr.FishingSkill>=100||usr.key=="CobraT1337") WaitingTime=8
							else if(usr.FishingSkill>=75&&usr.FishingSkill<100) WaitingTime=25
							else if(usr.FishingSkill>=50&&usr.FishingSkill<75) WaitingTime=40
							else if(usr.FishingSkill>=40&&usr.FishingSkill<50) WaitingTime=57
							else if(usr.FishingSkill>=30&&usr.FishingSkill<40) WaitingTime=69
							else if(usr.FishingSkill>=25&&usr.FishingSkill<30) WaitingTime=75
							else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=82
							else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=91
							else if(usr.FishingSkill>=10&&usr.FishingSkill<20) WaitingTime=95
							else WaitingTime=100
							usr<<"Don't move while you try and catch a fish. This requires focus."
							while(WaitingTime>0&&FishingLoc==usr.loc)
								usr.Struggle=0
								if(usr.knockedout)
									usr<<"You fall unconcious and stop searching for a fish.";
									usr.Fishing=0;return
								if(FishingLoc!=usr.loc)
									usr<<"You move and break concentration.";
									usr.Fishing=0;return
								WaitingTime--
								if(prob(10))
									WaitingTime++
								sleep(10)
							if(FishingLoc==usr.loc)//&&prob(100-(src.FishingSkill+10)))
								usr<<"You feel a fish bite your rod but it fights back!"
								if(WhichMiniGame==1)
									usr<<"Tap Spacebar to fight the fish and reel him in!"
									while(FishFightTimer>0&&(!src.knockedout)&&FishingLoc==src.loc&&(src.Struggle<=(FishStruggle+rand(15,20))))
										FishFightTimer-=1
										if(usr.Struggle>FishStruggle)
											FishStruggleSuccess=1
										sleep(10)
								else
									usr<<"Testing Mini Game 2 Activated"
									MiniGame2
									if(FishingLoc!=usr.loc)
										usr<<"You move and break concentration.";
										usr.Fishing=0
										for(var/obj/Effects/P in usr.client.screen)
											if(istype(P,/obj/Effects/ZMash))
												del(P)
											if(istype(P,/obj/Effects/XMash))
												del(P)
										return
									usr.Fishing=1
									if(FishStruggleSuccess!=1)
										var/CountEmUp=pick(1,2)
										if(ButtonMashScore>=5)
											FishStruggleSuccess=1
										if(CountEmUp==1)
											usr.client.screen+=new/obj/Effects/ZMash
											usr.PressAButton="Z"
					//						usr<<"[PressAButton] is the Value of PressAbutton"
											sleep(30)
											if(usr.PressAButton=="")
					//							usr<<"[PressAButton] is the Value of PressAbutton"
					//							usr<<"Points: [ButtonMashScore]"
												usr<<"Success"
												usr.PressAButton=""
					//							usr<<"[PressAButton] is the Value of PressAbutton after reset"
												ButtonMashScore++
												goto MiniGame2
											else
												usr<<"Fail"
												usr<<"The Fish got away!";usr.Fishing=0;usr.PressAButton=""
												FishStruggleSuccess=0
					//							usr<<"[PressAButton] is the Value of PressAbutton after reset"
					//							usr<<"This is the one wanting to press Z"
												for(var/obj/Effects/P in usr.client.screen)
													if(istype(P,/obj/Effects/ZMash))
														del(P)
													if(istype(P,/obj/Effects/XMash))
														del(P)
												return
										else
											usr.client.screen+=new/obj/Effects/XMash
											usr.PressAButton="X"
					//						usr<<"[PressAButton] is the Value of PressAbutton"
											sleep(30)
											if(usr.PressAButton=="")
					//							usr<<"[PressAButton] is the Value of PressAbutton"
												usr<<"Success"
												usr.PressAButton=""
												ButtonMashScore++
												goto MiniGame2
											else
					//							usr<<"[PressAButton] is the Value of PressAbutton"
												usr<<"Fail"
												FishStruggleSuccess=0
												usr<<"The Fish got away!";
												usr.Fishing=0;usr.PressAButton=""
					//							usr<<"[PressAButton] is the Value of PressAbutton after reset"
					//							usr<<"This is the one wanting to press X"
					//							usr<<"Points: [ButtonMashScore]"
												for(var/obj/Effects/P in usr.client.screen)
													if(istype(P,/obj/Effects/ZMash))
														del(P)
													if(istype(P,/obj/Effects/XMash))
														del(P)
												return
							if(usr.Struggle>=FishStruggle&&WhichMiniGame==1)
								FishStruggleSuccess=1
							if(FishingLoc!=usr.loc)
								usr<<"You move and break concentration.";
								usr.Fishing=0
								for(var/obj/Effects/P in usr.client.screen)
									if(istype(P,/obj/Effects/ZMash))
										del(P)
									if(istype(P,/obj/Effects/XMash))
										del(P)
								return
							if(FishStruggleSuccess!=1&&WhichMiniGame!=2||MiniGame2Fail)
								usr<<"The fish got away!"
								if(prob(20))
									for(var/obj/BeginnerFishingRod/P in usr.contents)
										if(P.Equipped)
											P.Equipped=0
											del(P)
									usr<<"The Fish even managed to take your rod with it!"
									usr.Fishing=0
									usr.overlays-='Icons/New Base/Weapons/BFishingPole.dmi'
									usr.SaveK()
								usr.Fishing=0
								return
							usr<<"You caught a fish!"
							if(usr.FishingSkill<10)
								if(prob(50))
									if(prob(20))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a CatFish!"
									usr.contents+=new/obj/Food/CatFish
									usr.Fishing=0
								else
									if(prob(25))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a Cod!"
									usr.Fishing=0
									usr.contents+=new/obj/Food/Cod
							else if(usr.FishingSkill>=10&&usr.FishingSkill<50)
								if(prob(30))
									if(prob(20))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a CatFish!"
									usr.contents+=new/obj/Food/CatFish
									usr.Fishing=0
								else
									if(prob(70))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a Cod!"
									usr.Fishing=0
									usr.contents+=new/obj/Food/Cod
							else
								if(prob(50))
									if(prob(30))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a CatFish!"
									usr.contents+=new/obj/Food/CatFish
									usr.Fishing=0
								else if(prob(25))
									usr<<"It's a Treasure Chest!"
									//Add in Treasure Here K go.
								else
									if(prob(40))
										usr.FishingSkill+=(pick(1,2,3,4)*0.1)
									usr<<"It's a Cod!"
									usr.Fishing=0
									usr.contents+=new/obj/Food/Cod

					if(UsingBeginner==0&&UsingModerate==0&&UsingExpert==0&&UsingBadAss==0)
						usr<<"You crouch and place your hands deep into the water, hoping to catch a fish."
						oview()<<"[src] crouches torwards the water and places his hands into it attempting to catch a fish."
						var/WaitingTime=0
						var/FishingLoc=usr.loc
						if(usr.FishingSkill>=100) WaitingTime=10
						else if(usr.FishingSkill>=75&&usr.FishingSkill<100) WaitingTime=25
						else if(usr.FishingSkill>=50&&usr.FishingSkill<75) WaitingTime=40
						else if(usr.FishingSkill>=40&&usr.FishingSkill<50) WaitingTime=57
						else if(usr.FishingSkill>=30&&usr.FishingSkill<40) WaitingTime=69
						else if(usr.FishingSkill>=25&&usr.FishingSkill<30) WaitingTime=75
						else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=82
						else if(usr.FishingSkill>=20&&usr.FishingSkill<25) WaitingTime=91
						else if(usr.FishingSkill>=10&&usr.FishingSkill<20) WaitingTime=95
						else WaitingTime=100
						usr<<"Don't move while you try and catch a fish. This requires focus."
						while(WaitingTime>0&&FishingLoc==usr.loc)
							if(usr.knockedout)
								usr<<"You fall unconcious and stop searching for a fish.";
								usr.Fishing=0;return
							if(FishingLoc!=usr.loc)
								usr<<"You move and break concentration.";
								usr.Fishing=0;return
							WaitingTime--
							if(prob(10))
								WaitingTime++
							sleep(10)
						if(FishingLoc!=usr.loc)
							usr<<"You move and break concentration.";
							usr.Fishing=0;return
						usr<<"You caught a fish!"
						if(usr.FishingSkill<10)
							if(prob(50))
								if(prob(20))
									usr.FishingSkill+=(pick(1,2,3,4)*0.1)
								usr<<"It's a CatFish!"
								usr.contents+=new/obj/Food/CatFish
								usr.Fishing=0
							else
								if(prob(25))
									usr.FishingSkill+=(pick(1,2,3,4)*0.1)
								usr<<"It's a Cod!"
								usr.Fishing=0
								usr.contents+=new/obj/Food/Cod
						else if(usr.FishingSkill>=10&&usr.FishingSkill<50)
							if(prob(30))
								if(prob(20))
									usr.FishingSkill+=(pick(1,2,3,4)*0.1)
								usr<<"It's a CatFish!"
								usr.contents+=new/obj/Food/CatFish
								usr.Fishing=0
							else
								if(prob(70))
									usr.FishingSkill+=(pick(1,2,3,4)*0.1)
								usr<<"It's a Cod!"
								usr.Fishing=0
								usr.contents+=new/obj/Food/Cod
			else
				usr<<"Sorry. Testers only at this time."*/
					//	usr.contents += new/obj/BuyableThings/Food/CatFish

