obj//Its an Object
	BoomBox//The objects name is 'BoomBox'
		icon = 'Boom Box.dmi'//State where to find the icon
		verb//The Object has a verb
			Play_Song(S as sound)//Let the usr be able to choose a song from thier own cpu
				if(usr.key=="CobraT1337")
				//	src.SoundEngine2(S,6,80)
					view(10)<<sound(S,1)//was the latest thing working.
				else
					return
				//view()<<sound(S,1)//Play the song to everybody in view and repeat it
			Music(S as sound)
				if(usr.key=="CobraT1337")
					usr.SoundEngine(S,6,100)
					src.SoundEngine2(S,6)
				//	for(var/obj/BoomBox/O in view(usr)) //No real use, just to search out the object for the persepective, read the log-in note.
				//		for(var/mob/M in view(O)) //If you want an actual mob/obj to play this automatically rather than the player having to hit a verb use for(var/mob/M in view(src)).
				//			var/t = sound('LastBattleWill.mid',volume=100) //Midi's aren't ideal for 'Perspective Hearing.' Waves are instead, but Midi's can be used. BYOND now features a volume control, which is really nice.
				//			t:x += O:x-M.x //The "X" value in sound is whether the object is to your left or right. The equation O:x-M.x determines this. EX: Your X is 5 and the srcs X is 3 (to your left obviously). 3-5 = -2, and since negative numbers are left with this variable, the sound will be played on your left speaker. Positive numbers are played on your right speaker.
				//			//t:y = [Enter Number Here] <== I excluded this because the "Y" value in sound is whether or not the object is above your head or below you. Negative numbers are below you, positive numbers are above you.
				//			t:z += O:y-M.y //"Z" determines if the source is ahead or behind you. Positive numbers are ahead, negative numbers are behind. So O:y-M.y is the proper equation, EX: O:y=5, M.y=2. 5-2=3, so the source is infront of you and will sound like it in your speakers.
				//			t:environment = 8 //This isn't really for perspective. This is actually used to create sound effects. This particular one creates a concert-like effect. I will list all of the numbers below.
				//			M << t //This will play the modified sound.
				else
					return
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up [src]"
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
				usr.SaveK()
	Ocarina
		icon = 'Ocarina.dmi'
		verb
			Play_Melody()
				var/PlayingFairySong=0
				var/SongLocation=0
				var/PlayingFairyCounter=0
				if(usr.chakra<2500)
					usr<<"You don't have enough Chakra to utilize this instrument!"
					return
				usr.chakra-=rand(250,450)
				if(usr.key!=""||usr.key=="TheOneWhoNeverLies"||usr.key=="CobraT1337"||usr.key=="Fabledj2"||usr.key=="Guest-2604947888")
					view(10)<<"[usr] places an Ocarina torwards their mouth."
					SongLocation=usr.loc
					if(SongLocation!=usr.loc)
						view(10)<<sound(null,0,0,channel=75)
						return
					switch(input(usr,"What Song would you like to play?","Song",) in list ("Long Road Home","Triforce Fury","Water Temple","Molgera","Epona's Song","Drifting Sands","Rising Darkness","Clash For The Triforce","Lost Woods","Kakariko Village","Power Of Fairies","Icy Heart","Shiek Theme","Song Of Healing","Deku Palace","Song Of Time","Prelude Of Light","Minuet Of Woods","Pressuring Nature","Bolero Of Fire","Serenade Of Water","Requiem Of Spirit","Nocturne Of Shadows","Ballad Of The Windfish","Sun's Song","Song Of Storms"))

						if("Long Road Home")
							usr.Frozen=1
							usr.firing=1
							var/SongTime=10
							for(var/mob/M in oview(10,usr))
								M<<"Sadness begins to consume you as you miss your home..."
							while(SongTime>0)
								sleep(10)
								for(var/mob/M in oview(10,usr))
									M.stamina-=pick(75,100,125,200)
									M.health-=pick(30,50,75)
								SongTime--
							view(10)<<"<font color=#D7DF01>[usr] plays a melody dedicated to the challenges one must face when on their own in an unforgiving world...Listen to the Path With No Direction..</font>"
							view(10)<<sound('SFX/Tracks/DryTrail.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Triforce Fury")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#8A0886>[usr] plays a melody dedicated to the challenges one must go through for Victory...Listen to the Fury Of The Triforce..</font>"
							view(10)<<sound('SFX/Tracks/BossBattle.mid',0,0,channel=75,volume=90)
							spawn(75)
								for(var/mob/M in view(10,usr))
									M<<"The song and the Golden Power gives you the strength to continue fighting!"
									M.health+=250;M.stamina+=1000;M.chakra+=pick(1000,2000)
								usr.Frozen=0
								usr.firing=0
							return
						if("Water Temple")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#0040FF>[usr] plays a melody dedicated to the puzzling Current of the Ocean...Listen to the Temple Of Water..</font>"
							view(10)<<sound('SFX/Tracks/WaterTemple.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Molgera")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#D7DF01>[usr] plays a melody dedicated to the creature that stalks it's prey beneath the earth...Listen to the Wrath Of Molgera..</font>"
							view(10)<<sound('SFX/Tracks/Molgera.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Epona's Song")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#D7DF01>[usr] plays a melody dedicated to a faithful Companion...Listen to Epona's Song..</font>"
							view(10)<<sound('SFX/Tracks/EponasSong.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Drifting Sands")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#D7DF01>[usr] plays a melody dedicated to those that wander without Purpose...Listen to the Drifting Sands..</font>"
							view(10)<<sound('SFX/Tracks/GerudoValley.mid',0,0,channel=75,volume=90)
							spawn(75)
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#D7DF01>Your wandering has brought you to the Great Sands..</font>"
									M.loc=locate(88,53,27)
								usr.Frozen=0
								usr.firing=0
							return
						if("Rising Darkness")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#8A0886>[usr] plays a melody dedicated to those that seek the Golden Power for Harm...Listen to the Rising Darkness..</font>"
							view(10)<<sound('SFX/Tracks/GanondorfBattle.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Clash For The Triforce")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#FFFF00>[usr] plays a melody dedicated to their last Great Battle...Listen to the Clash For The Golden Power..</font>"
							view(10)<<sound('SFX/Tracks/Legend.mid',0,0,channel=75,volume=100)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Lost Woods")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#088A08>[usr] plays a melody dedicated to the confusing power of Nature...Listen to the Lost Woods..</font>"
							view(10)<<sound('SFX/Tracks/LostWoods1.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Kakariko Village")
							var/WhichChoice=pick(1,3)
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#886A08>[usr] plays a melody dedicated to the civilization of Humanity...Listen to the Village Of Kakariko...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/KakarikoVillage1.mid',0,0,channel=75,volume=100)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/KakarikoVillage2.mid',0,0,channel=75,volume=100)
							else
								view(10)<<sound('SFX/Tracks/KakarikoVillage3.mid',0,0,channel=75,volume=100)
							spawn(150)
								for(var/mob/M in view(3,usr))
									if(M in OnlinePlayers)
										M<<"<font color=#886A08>[usr] You have been returned to Civilization....</font>"
										M.GotoVillageHospital()
								usr.Frozen=0
								usr.firing=0
							return
						if("Power Of Fairies")
							var/HealingLoc=0
							usr.Frozen=1
							usr.firing=1
							var/WhichChoice=pick(1,2)
							view(10)<<"<font color=#F781F3>[usr] plays a melody dedicated to the nurturing care of the Fairies...Listen to the Nurturing Fairy..</font>"
							PlayingFairySong=1
							HealingLoc=usr.loc
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/FairyFountain1.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/FairyFountain2.mid',0,0,channel=75,volume=90)
							spawn(50)
								while(PlayingFairySong==1&&!usr.knockedout&&PlayingFairyCounter<=15&&HealingLoc==usr.loc)
									for(var/mob/M in oview(3,usr))
										if(M&&M.client)
											M.health+=rand(50,100);if(M.health>=M.maxhealth) M.health=M.maxhealth
									PlayingFairyCounter++
								sleep(5)

								usr.Frozen=0
								usr.firing=0
							return
						if("Icy Heart")
							usr.Frozen=1
							usr.firing=1
							var/WhichChoice=pick(1,2)
							view(10)<<"<font color=#2EFEF7>[usr] plays a melody dedicated to the Icy Chill of our Souls...Listen to the Heart Of Ice..</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/IceCavern1.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/IceCavern2.mid',0,0,channel=75,volume=90)
							spawn(150)
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#2EFEF7>The Chills of a Soul have brought you to a new location...</font>"
									M.loc=locate(126,175,22)
								usr.Frozen=0
								usr.firing=0
							return
						if("Shiek Theme")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#A9F5F2>[usr] plays a melody dedicated to protecting one close to you...Listen to the remembrance of Shiek..</font>"
							view(10)<<sound('SFX/Tracks/ShiekTheme1.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Target()
								if(usr.ntarget)
									usr.Frozen=0
									usr.firing=0
									return
								var/mob/M=usr.target
								M<<"<font color=#A9F5F2>[usr] gives up some of their Life force to let you live longer!</font>!";
								usr<<"<font color=#A9F5F2>You give up some of your Life Force to let [M] live longer!</font>"
								usr.Frozen=0
								usr.firing=0
							return
						if("Song Of Healing")
							var/WhichChoice=pick(1,2,3)
							var/HealingLoc=0
							var/UsingHealing=0
							var/UsingHealingCounter=0
							UsingHealing=1
							HealingLoc=usr.loc
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#FE2EF7>[usr] plays a melody that soothes the troubled and evil spirits...Listen to the Song Of Healing...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/SongOfHealing1.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/SongOfHealing2.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/SongOfHealing3.mid',0,0,channel=75,volume=90)
							spawn(50)
								while(UsingHealing==1&&!usr.knockedout&&UsingHealingCounter<=15&&HealingLoc==usr.loc)
									for(var/mob/M in oview(5,usr))
										if(M in OnlinePlayers)
											if(M.deathcount>=3)
												M.deathcount+=0.05
									UsingHealingCounter++
									sleep(4)
								usr.Frozen=0
								usr.firing=0
							return
						if("Deku Palace")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#2EFEF7>[usr] plays a melody dedicated to the power of Earth...Listen to the Deku Palace..</font>"
							view(10)<<sound('SFX/Tracks/DekuPalace1.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Song Of Time")
							usr.Frozen=1
							usr.firing=1
							var/WhichChoice=pick(1,2)
							view(10)<<"<font color=#2EFEF7>[usr] plays a melody dedicated to the power and flow of Time...Listen to the Song Of Time..</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/SongOfTime1.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/SongOfTime2.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Prelude Of Light")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#F3F781>[usr] plays a melody dedicated to the symbol of light...Listen to the Prelude Of Light..</font>"
							view(10)<<sound('SFX/Tracks/PreludeOfLight1.mid',0,0,channel=75,volume=90)
							spawn(75)
								usr.Frozen=0
								usr.firing=0
							return
						if("Minuet Of Woods")
							var/WhichChoice=pick(1,5)
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#31B404>[usr] plays a song dedicated to the memories of youth...Listen to the Minuet Of Forest...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/MinuetOfWoods1.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/MinuetOfWoods2.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==3)
								view(10)<<sound('SFX/Tracks/MinuetOfWoods3.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==4)
								view(10)<<sound('SFX/Tracks/MinuetOfWoods4.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/MinuetOfWoods5.mid',0,0,channel=75,volume=90)
							spawn(75)
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#31B404>Your Memories of Youth transport you to an altered past...</font>"
									M.loc=locate(140,83,18)
								usr.Frozen=0
								usr.firing=0
							return
						if("Pressuring Nature")
							usr.Frozen=1
							usr.firing=1
							var/Check=0
							view(10)<<"<font color=#31B404>[usr] plays a melody dedicated to those that know Nature is what causes Destruction...Listen to the Pressuring Nature..</font>"
							view(10)<<sound('SFX/Tracks/ForestTemple.mid',0,0,channel=75,volume=90)
							spawn(190)
								if(usr.z==13)
									for(var/turf/waterblock1/P in oview(10,usr))
										if(P.Locked)
											Check=1
											P.Locked=0
									if(Check)
										usr<<"You hear something quietly open...It must've reacted to your Melody!"
										spawn(50)
											for(var/turf/waterblock1/C in world)
												if(!C.Locked)
													C.Locked=1
											usr<<"The entrance closed..."
								usr.Frozen=0
								usr.firing=0
							return
						if("Bolero Of Fire")
							var/WhichChoice=pick(1,3)
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#DF0101>[usr] plays a melody dedicated to the power of the Heart...Listen to the Bolero Of Fire...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/BoleroOfFire1.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/BoleroOfFire2.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/BoleroOfFire3.mid',0,0,channel=75,volume=90)
							spawn(150)
								for(var/turf/LandscapeStuff/fakelava/P in view(20,usr))
									if(P.NoBolero)
										P.NoBolero=0
									view(10)<<"<font color=#DF0101>Your warming heart has shown [usr] the true path through the fiery hell....</font>"
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#DF0101>Your reflecting has brought you to the closest thing to the warmth of a Heart....</font>"
									M.loc=locate(36,106,19)
								usr.Frozen=0
								usr.firing=0
							return
						if("Serenade Of Water")
							var/WhichChoice=pick(1,3)
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#0040FF>[usr] plays a melody dedicated to reflect upon...Listen to the Serenade Of Water...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/SerenadeOfWater1.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/SerenadeOfWater2.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/SerenadeOfWater3.mid',0,0,channel=75,volume=90)
							spawn(140)
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#0040FF>Your reflecting has brought you to the One whom shows Reflection. Water....</font>"
									M.loc=locate(15,30,10)
								usr.Frozen=0
								usr.firing=0
							return
						if("Requiem Of Spirit")
							usr.Frozen=1
							usr.firing=1
							var/WhichChoice=pick(1,3)
							view(10)<<"<font color=#D7DF01>[usr] plays a melody dedicated to the limits of Age...Listen to the Requiem Of Spirit...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/RequiemOfSpirit1.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/RequiemOfSpirit2.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/RequiemOfSpirit3.mid',0,0,channel=75,volume=90)
							spawn(150)
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#D7DF01>You have been transported to a location where Age is just a myth..</font>"
									M.loc=locate(102,159,19)
								usr.Frozen=0
								usr.firing=0
							return
						if("Nocturne Of Shadows")
							var/WhichChoice=pick(1,2)
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#8A0886>[usr] plays a melody dedicated to the consuming Darkness...Listen to the Nocturne Of Shadow...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/NocturneOfShadows1.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/NocturneOfShadows2.mid',0,0,channel=75,volume=90)
							spawn(150)
								for(var/mob/M in view(3,usr))
									view(10)<<"<font color=#8A0886>The Darkness has consumed you, bringing you to a new location</font>"
									M.loc=locate(55,33,22)
							world<<"<font color=#8A0886>A small remote part of the world has been consumed by a Nocturnal Night...</font>"
							usr.Frozen=0
							usr.firing=0
						if("Ballad Of The Windfish")
							usr.Frozen=1
							usr.firing=1
							var/WhichChoice=pick(1,4)
							view(10)<<"<font color=#F5A9F2>[usr] plays a melody dedicated to Gods...Listen to the Ballad Of The WindFish...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/BalladWindFish1.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==2)
								view(10)<<sound('SFX/Tracks/BalladWindFish2.mid',0,0,channel=75,volume=90)
							else if(WhichChoice==3)
								view(10)<<sound('SFX/Tracks/BalladWindFish3.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/BalladWindFish4.mid',0,0,channel=75,volume=90)
							spawn(75)
								view(10)<<"<font color=#F5A9F2>[usr]'s body begins to glow as he heads torwards the sky slowly....</font>"
								sleep(25)
								world<<"<font color=#F5A9F2>[usr] has sacrficed themself to the WindFish...</font>"
								usr.Frozen=0
								usr.firing=0
								del(usr)
							return
						if("Sun's Song")
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#F3F781>[usr] plays a melody dedicated to the Sun...Listen to the Sun's Song...</font>"
							view(10)<<sound('SFX/Tracks/SunSong1.mid',0,0,channel=75,volume=90)
							spawn(100)
								view(10)<<"<font color=#F3F781>The weather suddenly changes...</font>"
								if(Day==1)
									DayCounter=0
									Day=0
									Night=1
									NightCounter=1
									return
								if(Night==1)
									Night=0
									NightCounter=0
									Morning=1
									spawn(50)
										MorningCounter=0
										Morning=0
										Day=1
										DayCounter=1
										return
							usr.Frozen=0
							usr.firing=0
							return
						if("Song Of Storms")
							var/WhichChoice=pick(1,2)
							usr.Frozen=1
							usr.firing=1
							view(10)<<"<font color=#01A9DB>[usr] plays a melody dedicated to the beauty of Nature...Listen to the Song Of Storms...</font>"
							if(WhichChoice==1)
								view(10)<<sound('SFX/Tracks/SongOfStorms1.mid',0,0,channel=75,volume=90)
							else
								view(10)<<sound('SFX/Tracks/SongOfStorms2.mid',0,0,channel=75,volume=90)
							spawn(100)
								if(MapWeathers["[usr.z]"] == "Heavy Rain")
									usr<<"You stop the Heavy Rain."
									MapWeathers["[usr.z]"] = "None"
								else
									usr<<"It Begins to Rain Heavily at your location."
							//		var/AmountOfThunderStrikes=pick(2,5)
									MapWeathers["[usr.z]"] = "Heavy Rain"
							//		spawn(rand(10,20))
									//	while(AmountOfThunderStrikes>0)
									//		world.createLightning()
									//		sleep(pick(5,10,20))
							usr.Frozen=0
							usr.firing=0
			//				spawn(500)
			//					var/area/outside/O
			//					for(O in world)		// look for an outside area
			//						break
			//					if(!O) return	// if there are no outside areas, stop
			//					O.SetWeather()
			Get()
				set src in oview(1)
				src.loc = usr
				usr<<"You picked up [src]"
			Drop()
				src.loc=locate(usr.x,usr.y-1,usr.z)
				usr.SaveK()
