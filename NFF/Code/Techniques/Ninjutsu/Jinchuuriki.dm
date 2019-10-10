obj/Kage_Ring
	icon='wskillcards.dmi'
	icon_state="Ring"
	layer=MOB_LAYER+1
	var
		ShukakuSealed=0
		NibiSealed=0
		SanbiSealed=0
		YonbiSealed=0
		GobiSealed=0
		RokubiSealed=0
		NanabiSealed=0
		ShichibiSealed=0
		HachibiSealed=0
		KyuubiSealed=0
	verb
		Check_Ring()
			if(src.ShukakuSealed==1)
				usr<<"The ring glows bright with the Shukakus chakra.";return
			if(src.NibiSealed==1)
				usr<<"The ring glows bright with the Nibis chakra.";return
			if(src.SanbiSealed==1)
				usr<<"The ring glows bright with the Sanbis chakra.";return
			if(src.YonbiSealed==1)
				usr<<"The ring glows bright with the Yonbis chakra.";return
			if(src.GobiSealed==1)
				usr<<"The ring glows bright with the Gobis chakra.";return
			if(src.RokubiSealed==1)
				usr<<"The ring glows bright with the Rokubis chakra.";return
			if(src.NanabiSealed==1)
				usr<<"The ring glows bright with the Nanabis chakra.";return
			if(src.ShichibiSealed==1)
				usr<<"The ring glows bright with the Shichibis chakra.";return
			if(src.HachibiSealed==1)
				usr<<"The ring glows bright with the Hachibis chakra.";return
			if(src.KyuubiSealed==1)
				usr<<"The ring glows bright with the Kyuubis chakra.";return
		Get()
			set src in oview(1)
			src.loc = usr
		Drop()
	//		src.loc=locate(usr.x,usr.y-1,usr.z)
			usr<<"You have disown the ability to seal Bijuus, the ring blows away with the wind...";del(src)
			usr.SaveK()
		Extract_Bijuu(mob/M in oview(1))
			if(usr.SealingBijuu)
				usr<<"You're either already extracting or you need to wait for the delay!";return
			if(M.Bijuu=="")
				usr<<"[M] is not a Jinchuuriki!";return
			else
				usr<<"You begin to extract the bijuu!"
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
						if(M.Bijuu=="Shukaku")
							src.ShukakuSealed=1
						if(M.Bijuu=="Nibi")
							src.NibiSealed=1
						if(M.Bijuu=="Sanbi")
							src.SanbiSealed=1
						if(M.Bijuu=="Yonbi")
							src.YonbiSealed=1
						if(M.Bijuu=="Gobi")
							src.GobiSealed=1
						if(M.Bijuu=="Rokubi")
							src.RokubiSealed=1
						if(M.Bijuu=="Nanabi")
							src.NanabiSealed=1
						if(M.Bijuu=="Shichibi")
							src.ShichibiSealed=1
						if(M.Bijuu=="Hachibi")
							src.HachibiSealed=1
						if(M.Bijuu=="Kyuubi")
							src.KyuubiSealed=1
						M.Bijuu=""
						spawn()
							M.Reincarnate()
						usr.SealingBijuu=0
						usr.Frozen=0
						usr.firing=0;return
					else
						spawn(300)
							usr.SealingBijuu=0
						usr.Frozen=0
						usr.firing=0;return
				else
					spawn(300)
						usr.SealingBijuu=0
					usr.Frozen=0
					usr.firing=0;return

		Seal_Bijuu(mob/M in oview(1))
			if(usr.SealingBijuu)
				usr<<"You're either already sealing or you need to wait for the delay!";return
			if(M.Bijuu=="")
				switch(input(usr,"Which Bijuu would you like to place into [M]'s body?", "Bijuu") in list ("Shukaku","Nibi","Sanbi","Yonbi","Gobi","Rokubi","Nanabi","Shichibi","Hachibi","Kyuubi"))
					if("Shukaku")
						if(M.Clan=="Sabaku")
							if(src.ShukakuSealed==0)
								usr<<"You do not have this Bijuu in your possession!";return
							else
								usr.Frozen=1
								usr.firing=1
								usr.SealingBijuu=1
								usr<<"You begin to seal the Shukaku into [M]'s body, this will take two minutes!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The sealing is half-way complete!"
									sleep(600)
									if(M in get_step(usr,usr.dir))
										if(!usr.SealingBijuu)
											return
										if(M.Clan=="Sabaku")
											usr<<"The Shukaku has been sealed into [M]'s body!"
											M.Bijuu="Shukaku"
											src.ShukakuSealed=0
											M<<"[usr] has sealed the Shukaku into your body!";return
										else
											usr<<"[M]'s body would not be able to control the Shukaku's abilities.";return
									else
										spawn(300)
											usr.SealingBijuu=0
										usr.Frozen=0
										usr.firing=0;return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
						else
							usr<<"[M]'s body would not be able to control the Shukaku's abilities.";return
					if("Nibi")
						if(src.NibiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr<<"This function of the ring has been disabled due to abuse.";return
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Nibi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Nibi has been sealed into [M]'s body!"
									M.Bijuu="Nibi"
									src.NibiSealed=0
									M<<"[usr] has sealed the Nibi into your body!";return

								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Sanbi")
						if(src.SanbiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You being to seal the Sanbi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Sanbi has been sealed into [M]'s body!"
									M.Bijuu="Sanbi"
									src.SanbiSealed=0
									M<<"[usr] has sealed the Sanbi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Yonbi")
						if(src.YonbiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Yonbi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Yonbi has been sealed into [M]'s body!"
									M.Bijuu="Yonbi"
									src.YonbiSealed=0
									M<<"[usr] has sealed the Yonbi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Gobi")
						if(src.GobiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Gobi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Gobi has been sealed into [M]'s body!"
									M.Bijuu="Gobi"
									src.GobiSealed=0
									M<<"[usr] has sealed the Gobi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Rokubi")
						if(src.RokubiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Rokubi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Rokubi has been sealed into [M]'s body!"
									M.Bijuu="Rokubi"
									src.RokubiSealed=0
									M<<"[usr] has sealed the Rokubi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Nanabi")
						if(src.NanabiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Nanabi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Nanabi has been sealed into [M]'s body!"
									M.Bijuu="Nanabi"
									src.NanabiSealed=0
									M<<"[usr] has sealed the Nanabi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Shichibi")
						if(src.ShichibiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Shichibi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Shichibi has been sealed into [M]'s body!"
									M.Bijuu="Shichibi"
									src.ShichibiSealed=0
									M<<"[usr] has sealed the Shichibi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Hachibi")
						if(src.HachibiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Hachibi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Hachibi has been sealed into [M]'s body!"
									M.Bijuu="Hachibi"
									src.HachibiSealed=0
									M<<"[usr] has sealed the Hachibi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
					if("Kyuubi")
						if(src.KyuubiSealed==0)
							usr<<"You do not have this Bijuu in your possession!";return
						else
							usr.Frozen=1
							usr.firing=1
							usr.SealingBijuu=1
							usr<<"You begin to seal the Kyuubi into [M]'s body, this will take two minutes!"
							sleep(600)
							if(M in get_step(usr,usr.dir))
								if(!usr.SealingBijuu)
									return
								usr<<"The sealing is half-way complete!"
								sleep(600)
								if(M in get_step(usr,usr.dir))
									if(!usr.SealingBijuu)
										return
									usr<<"The Kyuubi has been sealed into [M]'s body!"
									M.Bijuu="Kyuubi"
									src.KyuubiSealed=0
									M<<"[usr] has sealed the Kyuubi into your body!";return
								else
									spawn(300)
										usr.SealingBijuu=0
									usr.Frozen=0
									usr.firing=0;return
							else
								spawn(300)
									usr.SealingBijuu=0
								usr.Frozen=0
								usr.firing=0;return
			else
				usr<<"They have the [M.Bijuu] sealed inside of them already!";return



