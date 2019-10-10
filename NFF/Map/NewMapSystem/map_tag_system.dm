// Tag object for map locations
// Rather than setting the 'tag' variable on a turf,
// using an obj like this allows you to see tagged areas
// on the map more easily.
maptag
	icon = 'icons/maptag_marker.dmi'
	layer = 100

	// Maptags are objs (So they show on the map)
	parent_type = /obj

	// Make maptags completely invisible.
	// Since their sole purpose is to mark a location,
	// players don't need to ever interact with them.
	invisibility = 101

proc
	// Find the turf a maptag is on
	locate_tag(tag as text)
		// Find the maptag object
		var/maptag/tag_obj = locate(tag)

		// If the tag isn't there, something is obviously wrong
		// So crash the proc to get debug info
		if(!tag_obj)
			CRASH("Maptag not found: \"[tag]\"")

		// Return the turf the maptag object is on
		return tag_obj.loc