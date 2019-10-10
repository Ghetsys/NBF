///////////////////////Mission System/////////////////////////////////////

//////////////WEAPON SCROLLS////////////////////////

mob/proc/scroll()
	var/obj/scroll/H = new();H.loc=locate(src.x,src.y-1,src.z)
obj/proc/CreateScroll()
	var/obj/scroll/H = new();H.loc=locate(src.x,src.y-1,src.z)
obj/scroll
	icon = 'Hawks Coding/ScrollIcons.dmi'
	icon_state="Scroll"
	layer = TURF_LAYER+1
	New()
		src.overlays+=/obj/Crator/Part1;src.overlays+=/obj/Crator/Part2
		..()
		spawn(1200) del(src)
	Part1
		icon_state="Part1"
		pixel_x=-32
	Part2
		icon_state="Part2"
		pixel_x=32