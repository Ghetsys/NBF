/*mob/var/TIcon
atom
    proc/pic()
        var/icon/i = icon(src.icon,src.icon_state,SOUTH)
        for(var/o in src.overlays)
            i.Blend(icon(o:icon,o:icon_state,SOUTH),ICON_OVERLAY)
        for(var/o in src.underlays)
            i.Blend(icon(o:icon,o:icon_state,SOUTH),ICON_UNDERLAY)
        src:TIcon = i
*/

atom/var/TIcon
atom
	proc/pic()
		var/icon/i = icon(src.icon,src.icon_state,SOUTH)
		for(var/o in src.overlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,SOUTH):icon(o:icon,src:icon_state,SOUTH)),ICON_OVERLAY)
		for(var/o in src.underlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,SOUTH):icon(o:icon,src:icon_state,SOUTH)),ICON_UNDERLAY)
		src:TIcon = i
	proc/pic5()
		var/icon/i = icon(src.icon,src.icon_state,NORTH)
		for(var/o in src.overlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,NORTH):icon(o:icon,src:icon_state,NORTH)),ICON_OVERLAY)
		for(var/o in src.underlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,NORTH):icon(o:icon,src:icon_state,NORTH)),ICON_UNDERLAY)
		src:TIcon = i
	proc/pic6()
		var/icon/i = icon(src.icon,src.icon_state,EAST)
		for(var/o in src.overlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,EAST):icon(o:icon,src:icon_state,EAST)),ICON_OVERLAY)
		for(var/o in src.underlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,EAST):icon(o:icon,src:icon_state,EAST)),ICON_UNDERLAY)
		src:TIcon = i
	proc/pic7()
		var/icon/i = icon(src.icon,src.icon_state,WEST)
		for(var/o in src.overlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,WEST):icon(o:icon,src:icon_state,WEST)),ICON_OVERLAY)
		for(var/o in src.underlays)
			i.Blend((isicon( o )?icon(o,src:icon_state,WEST):icon(o:icon,src:icon_state,WEST)),ICON_UNDERLAY)
		src:TIcon = i


//This might come in handy in the near future...
//It takes your icon and defines its state, overlays, and underlays

//
//Masterdan's Angle Procs
//
proc/arctan(x)
	var/y=arcsin(x/sqrt(1+x*x))
	//if(usr) usr << "arctan([x]): y = [y]"
	if(x>=0) return y
	return -y

proc/arctan2(dy, dx)
	//if(usr) usr << "arctan2([dy], [dx]):"
	if(dy == 0)
		if(dx > 0)
			//if(usr) usr << "	return 0"
			return 0
		else if(dx == 0)
			//if(usr) usr << "	return 0"
			return 0
		else
			//if(usr) usr << "	return 180"
			return 180
	if(dx == 0)
		if(dy > 0)
			//if(usr) usr << "	return 90"
			return 90
		else if(dy == 0)
			//if(usr) usr << "	return 0"
			return 0
		else
			//if(usr) usr << "	return -90"
			return -90
	else
		var/angle = arctan(dy/dx)
		if(dx < 0)
			angle = 180 - angle
		if(dy < 0)
			angle = -angle
		//if(usr) usr << "	return [angle]"
		return angle

proc/get_real_angle(atom/A, atom/B)
	var/dx = B.x - A.x
	var/dy = B.y - A.y
	//if(usr) usr << "get_real_angle([A], [B]): dx=[dx], dy=[dy]"
	return arctan2(dy, dx)

proc
	dir2ref(d)
		switch(d)
			if(NORTH)//NORTH
				return 1
			if(NORTHEAST)//NORTHEAST
				return 2
			if(EAST)//EAST
				return 3
			if(SOUTHEAST)//SOUTHEAST
				return 4
			if(SOUTH)//SOUTH
				return 5
			if(SOUTHWEST)//SOUTHWEST
				return 6
			if(WEST)//WEST
				return 7
			if(NORTHWEST)//NORTHWEST
				return 8

	dir2angle(d)
		switch(d)
			if(NORTH)//NORTH
				return 90
			if(NORTHEAST)//NORTHEAST
				return 45
			if(EAST)//EAST
				return 0
			if(SOUTHEAST)//SOUTHEAST
				return -45
			if(SOUTH)//SOUTH
				return -90
			if(SOUTHWEST)//SOUTHWEST
				return -135
			if(WEST)//WEST
				return 180
			if(NORTHWEST)//NORTHWEST
				return 135

	angle2dir(angle)
		angle = normalize_angle(angle)
		switch(angle)
			if(-180 to -157.5, 157.5 to 180)
				return WEST
			if(-157.5 to -112.5)
				return SOUTHWEST
			if(-112.5 to -67.5)
				return SOUTH
			if(-67.5 to -22.5)
				return SOUTHEAST
			if(-22.5 to 22.5)
				return EAST
			if(22.5 to 67.5)
				return NORTHEAST
			if(67.5 to 112.5)
				return NORTH
			if(112.5 to 157.5)
				return NORTHWEST

	normalize_angle(angle)
		while(angle > 180)
			angle -= 360
		while(angle <= -180)
			angle += 360
		return angle
	limit_angle(angle)
		while(angle > 90)
			angle -= 45
		while(angle < 90)
			angle += 45
	dircount(sdir,fdir)
		var/x=sdir
		if(x==fdir)
			return 0
		var/c=0
		do
			x++
			if(x>8)
				x=1
			c++
		while(x!=fdir)

		return c