turf
	mountain10
		name="Mountain10"
		density=0
		icon='Map/Turfs/turfs.dmi'
		icon_state="mountain10"


turf/dense
	Dense
		icon = 'Dense.dmi'
		icon_state = "Dense"
		density=0

turf/Landscapes/Dirt
	dirtedge9
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 9"
	dirtedge10
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 10"

	dirtedge11
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 11"
	dirtedge12
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 12"
	dirtedge1
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 1"
	dirtedge2
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 2"
	dirtedge3
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 3"
	dirtedge4
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 4"
	dirtedge5
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 5"
	dirtedge6
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 6"
	dirtedge7
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 7"
	dirtedge8
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirtedge 8"
	dirtP
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt"
	SideWalk
		icon = 'SideWalk.dmi'
		icon_state = "1"
	SideWalk2
		icon = 'SideWalk.dmi'
		icon_state = "SideWalk2"



	dirt1
		icon = 'Map/Turfs/Grass.dmi'
		icon_state = "dirt3"

	dirt2
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "dirt2"
	tree23
		icon='Bigtree.dmi'
		icon_state="1"
		layer=100


		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=100;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('SFX/StepInGrass.wav',0,0,0,50)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=10

turf/Buildings/Konoha/Residents
	building
		icon = 'Building.dmi'
		icon_state = "1"
		layer=40
	building2
		icon = 'Building2.dmi'
		icon_state = "1"
		layer=40

	building3
		icon = 'Building3.dmi'
		icon_state = "1"
		layer=40
	building4
		icon = 'Building4.dmi'
		icon_state = "1"
		layer=40
	building5
		icon = 'Building4.dmi'
		icon_state = "2"
		layer=40
	building6
		icon = 'Building4.dmi'
		icon_state = "3"
		layer=40
	building8
		icon = 'Building5.dmi'
		icon_state = "5"
		layer=40
	building9
		icon = 'Building5.dmi'
		icon_state = "6"
		layer=40
	Suna
		building10
			icon = 'Icons/SunaBuilding/SunaBuilding1.dmi'
			icon_state = "1"
			layer=40

		building11
			icon = 'Icons/SunaBuilding/SunaBuilding2.dmi'
			icon_state = "1"
			layer=40
		building12
			icon = 'Icons/SunaBuilding/SunaBuilding3.dmi'
			icon_state = "1"
			layer=40
		building13
			icon = 'Icons/SunaBuilding/SunaBuilding4.dmi'
			icon_state = "1"
			layer=40
	Konoha
		building10
			icon = 'SunaBuilding1.dmi'
			icon_state = "1"
			layer=40

		building11
			icon = 'Icons/SunaBuilding/SunaBuilding2.dmi'
			icon_state = "1"
			layer=40
		building12
			icon = 'Icons/SunaBuilding/SunaBuilding3.dmi'
			icon_state = "1"
			layer=40
		building13
			icon = 'Icons/SunaBuilding/SunaBuilding4.dmi'
			icon_state = "1"
			layer=40
turf/LandScape2/Mountain
	rightmountain1
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain1"

	rightmountain2
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain2"
	rightmountain3
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain3"
	rightmountain4
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain4"
	rightmountain5
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain5"
	rightmountain6
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain6"
	rightmountain7
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain7"
	rightmountain8
		icon = 'Map/Turfs/turfs.dmi'
		icon_state = "RigidMountain8"

//Building
	Tower
		icon = 'Icons/NewRockTower.dmi'
		icon_state = "1"
		layer=50
	Tower2
		icon = 'Icons/NewRockTower.dmi'
		icon_state = "2"
		layer=50
