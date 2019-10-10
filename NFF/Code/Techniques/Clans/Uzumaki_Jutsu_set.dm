
//////Sarutobi Passives////////
mob/var
	WillOfFire=0 /////////////// The heart to never give up; boosts will power MAXLEVEL: 5
	JutsuMastery=0 //////////////Ability to master ninjutsu above the normal rate MAXLEVEL: 10
	HeartOfALeader=0 //////////////Sarutobi clan is known to influence the strongest of ninjas and unite them,  To shine above all else (+ cap/phy/con) for every point MAX LEVEL: 5
	MonkeyStyle=0 /////////////// ;
	NoLimit=0 ////////////////// Over Master Elemental Jutsus

/////Sarutobi Jutsus////////
	TPMark=0

/*mob/proc
	Hiraishin_No_Jutsu()
		for(var/obj/weapons/KunaiMark/X in world)
			if(!X||X.loc==null)
				//src<<'no.wav'
				return
			if(X.owner==src)
				src.SayJutsu(J)
				view()<<'teleport.ogg'
				Effect(src,"yellow flash","on",9)
				Effect(X,"yellow flash","on",9)
				//X.density=0
				src.loc=X.loc
				if(X.dir==NORTH)	src.dir=SOUTH
				if(X.dir==SOUTH)	src.dir=NORTH
				if(X.dir==EAST)	src.dir=WEST
				if(X.dir==WEST)	src.dir=EAST
				src.Clear("both")
				del(X)
				break*/