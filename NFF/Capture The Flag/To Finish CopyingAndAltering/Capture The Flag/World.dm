/* ALL RIGHTS RESERVED © 2005 Polaris8920, BYOND and DanTom.

This demo is meant as a demonstration of how a capture the flag game
can be built. You may not use this as your own, or imply that it is
your own in any way. Credit must be given where credit is due. If you
use parts of this, please give credit, and if you make a procedure
based on something in this demo, but not the code of this demo,
credit could maybe still be included.

   ~ Polaris8920
*/

world
	view=5
	name="Polaris8920's Capture the Flag Demo"
	New()
		..()
		//***Random Grasses***
		var/A=rand(3,5)
		while(A)
			var/icon/I=icon('Icons.dmi',"Grass")
			var
				xx=32
				yy=32
			while(yy)
				while(xx)
					var
						R=rand(50,100)
						G=rand(200,255)
						B=rand(50,100)
					I.DrawBox(rgb(R,G,B),xx,yy)
					xx--
				xx=32
				yy--
			Grasses+=I
			A--
		//***Random Dirt***
		var/D=rand(3,5)
		while(D)
			var/icon/I=icon('Icons.dmi',"Grass")
			var
				xx=32
				yy=32
			while(yy)
				while(xx)
					var
						R=rand(50,100)
						G=rand(0,50)
					I.DrawBox(rgb(R,G,0),xx,yy)
					xx--
				xx=32
				yy--
			Dirt+=I
			D--
		//***Random Walls***
		RandWall(1,85)
		RandWall(86,170)
		RandWall(171,255)
		RandReport()

var
	Grasses[0]
	WallIcon[0]
	Dirt[0]
	playingz=1
	playablez=list(1,3,4)
	znames=list("Maze","Submarine","The Trench")
	arenas=list(1,3,4)
	redlocx=list(2,7,4)
	redlocy=list(20,16,28)
	bluelocx=list(29,25,27)
	bluelocy=list(20,16,3)
	maxscore=100

obj
	icon='Icons.dmi'
	Number
		icon='Numbers.dmi'
		layer=MOB_LAYER+2
		Blue
		Red

turf
	icon='Icons.dmi'
	Grass
		icon_state="Grass"
		New()
			..()
			sleep(3)
			src.icon=pick(Grasses)
	Wall
		icon_state="Wall1"
		density=1
		opacity=1
		New()
			..()
			sleep(3)
			src.icon=pick(WallIcon)
	Metal
		icon_state="Metal"
	Sky
		icon_state="Sky"
	Dirt
		icon_state="Dirt"
		New()
			..()
			sleep(3)
			src.icon=pick(Dirt)
obj
	BlueOver
		icon_state="BlueOver"
		name=""
	RedOver
		icon_state="RedOver"
		name=""