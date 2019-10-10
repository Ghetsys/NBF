//=======================================================//
obj/Effect
	icon='Hawks Coding/ScrollIcons.dmi'
	layer=MOB_LAYER+5
	density=0
mob/verb/CallABC(var/Source as num,Path as text)
 set hidden=1
 if(!Source)
  var/ProcPath=text2path("/[Path]")
  if(ispath(ProcPath))
   call(ProcPath)()
 else
  call(src,Path)()
proc
	Effect(atom/A,iconstate,location,duration=10,rgbchange="no rgb",r=0,g=0,b=0,pixelval=null)
		var/obj/Effect/X = new()
		if(rgbchange=="rgb")
			X.icon*=rgb(r,g,b)
		spawn(duration+1)
			if(X)	del(X)
			return
		if(ismob(A))
			var/mob/M=A

			X.loc=M.loc
			if(location=="between2")
				if(M.dir==NORTH)	X.pixel_y+=15
				if(M.dir==SOUTH)	X.pixel_y-=15
				if(M.dir==EAST)	X.pixel_x+=15
				if(M.dir==WEST)	X.pixel_x-=15
		else if(isobj(A))
			var/obj/M = A
			X.loc=M.loc
			if(location=="between2")
				if(M.dir==NORTH)	X.pixel_y+=15
				if(M.dir==SOUTH)	X.pixel_y-=15
				if(M.dir==EAST)	X.pixel_x+=15
				if(M.dir==WEST)	X.pixel_x-=15
		else if(isturf(A))
			var/turf/M=A
			X.loc=M
			if(location=="between2")
				if(M.dir==NORTH)	X.pixel_y+=15
				if(M.dir==SOUTH)	X.pixel_y-=15
				if(M.dir==EAST)	X.pixel_x+=15
				if(M.dir==WEST)	X.pixel_x-=15
		if(location=="onNORTH")	X.dir=NORTH
		if(location=="onSOUTH")	X.dir=SOUTH
		if(location=="onEAST")	X.dir=EAST
		if(location=="onWEST")	X.dir=WEST
		if(location=="onRAND")
			X.pixel_x+=rand(-10,10)
			X.pixel_y+=rand(-10,10)
		if(location=="onPixelY")
			X.layer+=5
			X.pixel_y+=pixelval
		if(location=="onPixelX")
			X.layer+=5
			X.pixel_x+=pixelval
		if(location=="onTOP")
			X.layer+=5
			X.pixel_y+=rand(10,15)
			X.pixel_x+=rand(-10,10)
		flick("[iconstate]",X)
	Hitspark(atom/A,spark="Hit",duration=10)//,sound=1)
		var/obj/Effect/X = new()
		if(isturf(A))
			X.loc=A
		else
			X.loc=A.loc
		X.pixel_x+=rand(-10,10)
		X.pixel_y+=rand(-10,10)
		flick("[spark]Spark",X)

//===================Basic Commands======================//