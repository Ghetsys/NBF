#define RADAR_RANGE 25
//Odd number for better accuracy
mob/var/RadarRange=25
var/tmp/radar_ignoreNPC = 1
var/const/radar_startx = 11
var/const/radar_starty = 11
//The position, in form "[radar_startx],[radar_starty]", to start
//drawing the grid from the top-right.

/*
I wrote this because for some reason, I thought
range and them procedure return circles. :/

proc/getSquare(var/atom/center, var/diameter=12)
	if(!center) return 0
	if(!isturf(center)) center = center.loc //turfs only to avoid error by movement

	var/list/L = list()
	var/radius = diameter/2

	var/startx = max(1, center.x-radius)
	var/starty = max(1, center.y-radius)
	var/endx = min(world.maxx, center.x+radius)
	var/endy = min(world.maxy, center.y+radius)
	//was going to use block() for all of this, but I'd have to loop
	//through all of the turfs returned anyway
	for(var/g_x=startx to endx) for(var/g_y=starty to endy)
		var/turf/T = locate(g_x, g_y, center.z)
		for(var/mob/M in T)
			if(radar_ignoreNPC && !M.client) continue
			L += M
		sleep()
	return L
*/

client
	var/tmp/radar_size = 0 //This is set when drawGrid() is called.
	var/tmp/obj/Radar/grid/Radar_Grid = new
	var/tmp/obj/Radar/center/Radar_Center = new

	proc/drawGrid(var/tiles_squared=2) //1 = one tile, 2 = 64x64, 3 = 96x96, etc...
		//The following variables state where to draw from (starting from upper-left)
		if(!(src.Radar_Grid in src.screen)) src.screen += src.Radar_Grid
		if(!(src.Radar_Center in src.screen)) src.screen += src.Radar_Center
		src.Radar_Grid.screen_loc = "[radar_startx-tiles_squared+1],[radar_starty-tiles_squared+1] \
			to [radar_startx],[radar_starty]"
		src.radar_size = tiles_squared
		var/center = round(tiles_squared/2)-1
		var/off = (tiles_squared%2)?(-19):(-3)
		src.Radar_Center.screen_loc = "[radar_startx-center]:[off],[radar_starty-center]:[off]"

	proc/removeGrid() //Just in case you want to remove the grid.
		if(src.Radar_Grid in src.screen)
			src.screen -= src.Radar_Grid
			src.screen -= src.Radar_Center
			for(var/obj/Radar/blit/B in src.screen)
				del(B)

	proc/radarUpdate()
		var/list/reusables = list()
		var/list/mobs
		while(src && Radar_Grid && (Radar_Grid in src.screen))
			for(var/obj/Radar/blit/O in src.screen)
				reusables += O
				src.screen -= O
			mobs = orange(src.mob.RadarRange, src.mob)
			for(var/mob/M in mobs)
				if(radar_ignoreNPC && !M.client) continue
				var/obj/Radar/blit/O = locate(/obj/Radar/blit/) in reusables
				if(!O) O = new
				else reusables -= O
				var/scale = (radar_size * 32) / (src.mob.RadarRange * 64)
				var/px = (src.mob.x + src.mob.RadarRange - M.x) * 32 * scale
				var/py = (src.mob.y + src.mob.RadarRange - M.y) * 32 * scale
				if(M.Village=="Leaf")
					O.icon_state="blit1"
				if(M.Village=="Rain")
					O.icon_state="blit2"
				if(M.Village=="Rock")
					O.icon_state="blit3"
				if(M.Village=="Sound")
					O.icon_state="blit4"
				O.screen_loc = "[radar_startx-round(px/32)]:[-(px%32)+2],\
					[radar_starty-round(py/32)]:[-(py%32)+2]"
				src.screen += O
				//I have to deal with percentages because I can't figure this out. :O
				sleep()
			sleep(5)
			//Update every two seconds because updating upon movement when there
			//is a lot of movement going on will cause problems.  Besides, what
			//kind of game that needs a radar has people hardly moving?

obj/Radar
	layer = MOB_LAYER+999
	icon='NarutoStuff.dmi'
	Write() return 0
	grid
		icon_state = "grid"
	blit
		icon_state = "blit"
	center
		icon_state = "center"