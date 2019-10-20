mob/var/tmp
	Status=""
	StatusEffected=0
	FrozenBindedBy=""

obj/Jutsu
	var
		JutsuLevel=0
		Owner
		BaseChance=85
	Elemental
		var/Element=""
obj
	effect
		icon=null
		layer= MOB_LAYER+2
		density=0
		var/Owner
	undereffect
		icon=null
		layer= MOB_LAYER-1
		density=0
		var/Owner
		New()
			..()
			spawn(600)
				src.Owner=null
				src.loc=null
obj/Effects
	icon='Icons/Hud/Interact.dmi'
	layer=MOB_LAYER+3
	screen_loc="10,11"
	AMash
		icon_state="A"
	SMash
		icon_state="S"
	ASMash
		icon_state="AS"
	DMash
		icon_state="D"
	CMash
		icon_state="C"
	XMash
		icon_state="X"
	ZMash
		icon_state="Z"


//Blood Effects:
proc/Blood(dx,dy,dz)
	spawn()
		var/random=rand(1,13)
		if(random>5) return
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.icon='Blood.dmi'
		var/r=rand(1,7)
		flick("[r]",o)
		var/obj/x=new/obj/undereffect(locate(dx,dy,dz))
		spawn(9)
			o.loc=null
			if(!x)return
			x.icon='Blood.dmi'
			var/v=rand(1,7)
			x.pixel_x=rand(-8,8)
			x.pixel_y=rand(-8,8)
			x.icon_state="l[v]"
mob/proc/Bloody()
	spawn()
		var/random=rand(1,13)
		if(random>5) return
		var/obj/o=new/obj/effect(locate(src.x,src.y,src.z))
		o.icon='Blood.dmi'
		var/r=rand(1,7)
		flick("[r]",o)
		var/obj/undereffect/x=new/obj/undereffect(locate(src.x,src.y,src.z))
		x.Owner=src
		spawn(9)
			o.loc=null
			if(!x)return
			x.icon='Blood.dmi'
			var/v=rand(1,7)
			x.pixel_x=rand(-8,8)
			x.pixel_y=rand(-8,8)
			x.icon_state="l[v]"

/*How They Work:
Bloody() would be used like:
mob_based_ref.Bloody()
It would make that specific mob drop Blood. For example:
var/mob/M=src.Owner - Mob being referred as M.
M.Bloody()

src.Bloody() - The source gonig through it.


Blood() sets it to a certain location.
Blood(x_coordinate,y_coordinate,z_coordinate)
Blood(10,15,src.z)
*/

/*
Voice: Pretty easy. Just use it like:
src.Voice("Attack") or src.Voice("Hurt")
*/
mob/proc/Voice(Sequence)
	if(src.Voice==null)
		return
	if(Sequence=="Attack")
		var/X=rand(1,6)
		if(src.Voice=="Ichigo")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Attack6.wav',src)}
		if(src.Voice=="Link")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Attack6.wav',src)}
		if(src.Voice=="Gin")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Attack6.wav',src)}
		if(src.Voice=="Hitsugaya")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Attack6.wav',src)}
		if(src.Voice=="Aizen")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Attack6.wav',src)}
		if(src.Voice=="Naruto")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Attack6.wav',src)}
		if(src.Voice=="Sasuke")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Attack6.wav',src)}
		if(src.Voice=="Itachi")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Attack6.wav',src)}
		if(src.Voice=="Neji")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Attack6.wav',src)}
		if(src.Voice=="Orihime")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Attack6.wav',src)}
		if(src.Voice=="Soifon")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Attack6.wav',src)}
		if(src.Voice=="Rukia")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Attack1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Attack2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Attack3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Attack4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Attack5.wav',src)}
			if(X==6) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Attack6.wav',src)}
	if(Sequence=="Hurt")
		var/X=rand(1,5)
		if(src.Voice=="Ichigo")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Ichigo/Hurt5.wav',src)}
		if(src.Voice=="Link")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Link/Hurt5.wav',src)}
		if(src.Voice=="Aizen")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Aizen/Hurt5.wav',src)}
		if(src.Voice=="Gin")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Gin/Hurt5.wav',src)}
		if(src.Voice=="Hitsugaya")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Hitsugaya/Hurt5.wav',src)}
		if(src.Voice=="Naruto")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Naruto/Hurt5.wav',src)}
		if(src.Voice=="Itachi")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Itachi/Hurt5.wav',src)}
		if(src.Voice=="Sasuke")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Sasuke/Hurt5.wav',src)}
		if(src.Voice=="Neji")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Neji/Hurt5.wav',src)}
		if(src.Voice=="Orihime")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Orihime/Hurt5.wav',src)}
		if(src.Voice=="Soifon")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Soifon/Hurt5.wav',src)}
		if(src.Voice=="Rukia")
			if(X==1) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Hurt1.wav',src)}
			if(X==2) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Hurt2.wav',src)}
			if(X==3) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Hurt3.wav',src)}
			if(X==4) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Hurt4.wav',src)}
			if(X==5) {src.client.sound_system.PlaySound('SFX/PlayerVoices/Rukia/Hurt5.wav',src)}

//Just creates a Crator.
mob/proc/CreateCrator()
	var/obj/Crator/H = new();H.loc=locate(src.x,src.y,src.z)
mob/proc/CreatebigCrator()
	var/obj/Crator/H = new();H.loc=locate(src.x,src.y,src.z)
obj/proc/CreateCrator()
	var/obj/Crator/H = new();H.loc=locate(src.x,src.y,src.z)
obj/Crator
	icon = 'Icons/Crater.dmi'
	icon_state="1"
	layer = TURF_LAYER+1
	New()
		src.overlays+=/obj/Crator/Part1;src.overlays+=/obj/Crator/Part2
		..()
		spawn(1200) del(src)
	Part1
		icon_state="2"
		pixel_x=-32
	Part2
		icon_state="3"
		pixel_x=32
obj/BigCrator
	icon='Icons/Crater.dmi'
	icon_state="4"
	layer = TURF_LAYER+1
	New()
		src.overlays+=/obj/BigCrator/Part1;src.overlays+=/obj/BigCrator/Part2;src.overlays+=/obj/BigCrator/Part3
		..()
		spawn(1200) del(src)
	Part1
		icon_state="5"
		pixel_x=-32
	Part2
		icon_state="6"
		pixel_x=32
	Part3
		icon_state="7"
		pixel_x=64

mob/var/tmp/HasAura = 0
mob/proc/CreateUchihaAura(Invisible=0,mob/PersonWhoCanSee) //Only necessary to define the mob if Invisible is 1. This replaces the aura creation in ChakraSight()
	if(Invisible)
		if(PersonWhoCanSee&&ismob(PersonWhoCanSee)) //Safety Check
			var/layer=FLY_LAYER+999999999999999991
			var/image/I=image('Icons/Jutsus/Uchiha Aura.dmi',src,"0,0",layer);var/image/I2=image('Icons/Jutsus/Uchiha Aura.dmi',src,"1,0",layer)
			var/image/I3=image('Icons/Jutsus/Uchiha Aura.dmi',src,"0,1",layer);var/image/I4=image('Icons/Jutsus/Uchiha Aura.dmi',src,"1,1",layer)
			I.pixel_x=-16;I2.pixel_x=16;I3.pixel_x=-16;I3.pixel_y=32;I4.pixel_x=16;I4.pixel_y=32
			PersonWhoCanSee<<I;PersonWhoCanSee<<I2;PersonWhoCanSee<<I3;PersonWhoCanSee<<I4
		else
			return
	else
		if(src.UchihaAuraOn>=2)
			return
		src.UchihaAuraOn++
		var/obj/Jutsu/Uchiha/UchihaAura/Part1/A=new();var/obj/Jutsu/Uchiha/UchihaAura/Part2/B=new()
		var/obj/Jutsu/Uchiha/UchihaAura/Part3/C=new();var/obj/Jutsu/Uchiha/UchihaAura/Part4/D=new();
		src.overlays+=A;usr.overlays+=B;usr.overlays+=C;usr.overlays+=D
mob/proc/RemoveUchihaAura()
	set background = 1
	var/obj/Jutsu/Uchiha/UchihaAura/Part1/A=new();var/obj/Jutsu/Uchiha/UchihaAura/Part2/B=new()
	var/obj/Jutsu/Uchiha/UchihaAura/Part3/C=new();var/obj/Jutsu/Uchiha/UchihaAura/Part4/D=new();
	src.overlays-=A;src.overlays-=B;src.overlays-=C;src.overlays-=D
	src.UchihaAuraOn--
	if(src.UchihaAuraOn<0) src.UchihaAuraOn=0
	for(var/client/CC in world)
		for(var/image/x in CC.images)
			spawn()
				if(x&&(x.layer==FLY_LAYER+999999999999999991)&&x.loc==src)
					del(x)
mob/proc/ChakraSight(OnOff)
	set background=1
	if(OnOff==1)
		for(var/mob/M in oview(20,src))//was in world
			if(M.client&&(M in OnlinePlayers)&&M!=src&&M.z==src.z&&M.Auraoff!=1 || M.HasAura)
				spawn()
					var/image/I
					if(M.ChakraColorR==100&&M.ChakraColorG==100&&M.ChakraColorB==255)
						if(M.Clan=="Kyomou")
							M.tempmix='Icons/Jutsus/ChakraAuraRed.dmi';M.tempmix+=rgb(M.TaiSkill,M.GenSkill,M.NinSkill)
							var/icon/Q=icon(M.tempmix)
							I=image(Q,M,"",FLY_LAYER+999999999999999991)

						else if(M.XiveresMember)
							M.tempmix='Icons/Jutsus/ChakraAura.dmi'
							M.tempmix+=rgb(51,0,102)
							var/icon/Q=icon(M.tempmix)
							I=image(Q,M,"",FLY_LAYER+999999999999999991)
						else if(M.Clan!="Basic"&&M.Clan!="Fuuma"&&M.Clan!="Yotsuki"&&M.Clan!="Satou"&&M.Clan!="Uchiha")
							M.tempmix='Icons/Jutsus/ChakraAuraBlue.dmi';M.tempmix+=rgb(M.TaiSkill,M.GenSkill,M.NinSkill)
							var/icon/Q=icon(M.tempmix)
							I=image(Q,M,"",FLY_LAYER+999999999999999991)
						else
							M.tempmix='Icons/Jutsus/ChakraAura.dmi'
							if(M.Clan=="Uchiha"&&src.UchihaMastery>99)
								if(M.mangekyou)
									M.tempmix=null
									I=null
									M.CreateUchihaAura(1,src)
								else
									M.tempmix+=rgb(M.TaiSkill*1.5,M.GenSkill,M.NinSkill*1.5)
									if(M.Clan=="Uchiha"&&src.UchihaMastery>99&&src.DarkFlames)
										M.tempmix+=rgb(0,0,50)
							else
								M.tempmix+=rgb(M.TaiSkill*6,M.GenSkill*6,M.NinSkill*6)
							var/icon/Q=icon(M.tempmix)
							I=image(Q,M,"",FLY_LAYER+999999999999999991)

					else if(M.ChakraColorR==255&&M.ChakraColorG==26&&M.ChakraColorB==198)
						I=image('Icons/Jutsus/ChakraAuraPink.dmi',M,"",FLY_LAYER+999999999999999991)
					else
						if(M.Clan=="Kyomou")
							M.tempmix='Icons/Jutsus/ChakraAuraRed.dmi'
						else
							M.tempmix='Icons/Jutsus/ChakraAura.dmi'
						M.tempmix+=rgb(M.ChakraColorR,M.ChakraColorG,M.ChakraColorB)
						var/icon/Q=icon(M.tempmix)
						I=image(Q,M,"",FLY_LAYER+999999999999999991)
					src << I
					while(I)
						if(M)
							var/Percentage=(M.chakra+1)/M.Mchakra
							Percentage=Percentage*100
							if(Percentage>50)
								I.icon_state=""
							if(Percentage<=50&&Percentage>25)
								I.icon_state="medium"
							if(Percentage<=25&&Percentage>5)
								I.icon_state="low"
							if(Percentage<=5)
								I.icon_state="none"
						sleep(20)
	if(src&&src.client&&OnOff==0)//was just onoff remove the src if needed
		if(src in OnlinePlayers)
			for(var/image/x in src.client.images)
				spawn(4)
					if(x&&(x.layer==FLY_LAYER+999999999999999991||x.icon=='Icons/Jutsus/ChakraAuraBlue.dmi'||x.icon=='Icons/Jutsus/ChakraAuraRed.dmi'||x.icon=='Icons/Jutsus/ChakraAuraPink.dmi'))
						del(x)
					if(!src)
						return

			//	sleep(1)//just added this 11/16/12


//Explosions
obj/Jutsu
	Explosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			spawn() src.SoundEngine('SFX/Bang.wav',10,50)
			..()
			overlays+=/obj/Jutsu/Explosion/A;overlays+=/obj/Jutsu/Explosion/B;overlays+=/obj/Jutsu/Explosion/C;overlays+=/obj/Jutsu/Explosion/D
			overlays+=/obj/Jutsu/Explosion/E;overlays+=/obj/Jutsu/Explosion/F;overlays+=/obj/Jutsu/Explosion/G;overlays+=/obj/Jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					spawn() src.CreateSmoke()
					for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
						spawn() W.BurnWire()
				for(var/mob/M in oview(1,src))
					spawn()
						if(M.SensoryRange>=5&&M.ByakuganMastery>1000&&!M.Frozen&&M.FrozenBind==""&&prob(40))
							step_away(M,src)
						else if(M&&!M.UsingDomu&&!M.Kaiten&&!M.sphere&&!M.SusanooIn)
							var/damage=M.maxstamina*0.25;var/damage2=M.maxhealth*0.30
							if(M.Mogu)
								damage=damage/2;damage2=damage2/2
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							var/Chakraz=M.ChakraArmor*0.01
							if(M)
								spawn()
									M.DamageProc(damage-(Chakraz*damage),"Stamina",src.Owner,"explosion","yellow")
								spawn()
									M.DamageProc(damage2-(Chakraz*damage),"Health",src.Owner,"explosion","red")
									M.HitBack(rand(5,8),rand(1,8))
				for(var/obj/O in oview(1,src))
					O.DamageProc(200)
			spawn(5)
				del(src)

		A
			icon_state="ExplodeTopLeft"
			pixel_x = -32
			pixel_y = 32
			layer=MOB_LAYER+1
		B
			icon_state="ExplodeTopMiddle"
			pixel_y = 32
			layer=MOB_LAYER+1
		C
			icon_state="ExplodeTopRight"
			pixel_x = 32
			pixel_y = 32
			layer=MOB_LAYER+1
		D
			icon_state="ExplodeMiddleLeft"
			pixel_x = -32
			layer=MOB_LAYER+1
		E
			icon_state="ExplodeMiddleRight"
			pixel_x = 32
			layer=MOB_LAYER+1
		F
			icon_state="ExplodeBottomLeft"
			pixel_x = -32
			pixel_y = -32
			layer=MOB_LAYER+1
		G
			icon_state="ExplodeBottomMiddle"
			pixel_y = -32
			layer=MOB_LAYER+1
		H
			icon_state="ExplodeBottomRight"
			pixel_x = 32
			pixel_y = -32
			layer=MOB_LAYER+1
	SmallExplosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="Explode"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			spawn()
				spawn()// src.SoundEngine('SFX/Bang.wav',10,100)
				while(src)
			//		src.CreateSmoke("Light")
		//			sleep(1)

					spawn(1)
						for(var/obj/NinjaEquipment/TheWires/A in oview(1,src))
		//					sleep(1)
							var/mob/USER=src.Owner
							var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=locate(A.x,A.y,A.z);AA.nin=USER.nin/1.2;AA.Owner=src.Owner;del(A)
					for(var/mob/M in oview(1,src))
						if(!M.UsingDomu&&!M.Kaiten&&!M.SusanooIn)
							var/mob/O=src.Owner;var/damage=O.nin*rand(1,2);var/Chakraz=M.ChakraArmor*0.01;damage=damage-(Chakraz*damage)
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							M.DamageProc(damage/1.5,"Health",O,"explosion","red")
							if(M)
								M.DamageProc(damage,"Stamina",O,"explosion","red")
						//	view(M)<<output("<font color=red>[M] has been hit by the explosion!</font>","Attack");sleep(5)
					for(var/obj/O in oview(1,src))
						O.DamageProc(50)
					sleep(1)
			spawn(5)
				del(src)
	C2Explosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			overlays+=/obj/Jutsu/Explosion/A;overlays+=/obj/Jutsu/Explosion/B;overlays+=/obj/Jutsu/Explosion/C;overlays+=/obj/Jutsu/Explosion/D
			overlays+=/obj/Jutsu/Explosion/E;overlays+=/obj/Jutsu/Explosion/F;overlays+=/obj/Jutsu/Explosion/G;overlays+=/obj/Jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					spawn() src.CreateSmoke()
					spawn() src.SoundEngine('SFX/Bang.wav',10.60)
					for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
						spawn() W.BurnWire()
				for(var/mob/M in oview(1,src))
					spawn()
						if(M.SensoryRange>=5&&M.ByakuganMastery>1000&&!M.aflagged&&!M.Frozen&&M.FrozenBind==""&&prob(40))
							step_away(M,src)
						else if(M&&!M.UsingDomu&&!M.Kaiten&&!M.sphere&&!M.SusanooIn)
							var/mob/O=src.Owner
							var/damage=M.maxstamina*(0.009*(O.ExplosiveMastery/20))
							var/damage2=M.maxhealth*(0.007*(O.ExplosiveMastery/20))
							if(M.Guarding)
								damage/=10
								damage2/=2
							if(M.Mogu)
								damage=damage/2
								damage2=damage2/2
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							view(M)<<output("<font color=red>[M] foi atingido pela explosão!</font>","Attack")
							var/Chakraz=M.ChakraArmor*0.01
							if(M)
								spawn()
									M.DamageProc(damage-(Chakraz*damage),"Stamina",src.Owner,"explosion","red")
								spawn()
									M.DamageProc(damage2-(Chakraz*damage),"Health",src.Owner,"explosion","red")
									M.HitBack(rand(5,8),rand(1,8))
				for(var/obj/O in oview(1,src))
					O.DamageProc(150)
			spawn(5)
				del(src)
	C3Explosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			spawn() src.SoundEngine('SFX/Bang.wav',100)
			..()
			overlays+=/obj/Jutsu/Explosion/A;overlays+=/obj/Jutsu/Explosion/B;overlays+=/obj/Jutsu/Explosion/C;overlays+=/obj/Jutsu/Explosion/D
			overlays+=/obj/Jutsu/Explosion/E;overlays+=/obj/Jutsu/Explosion/F;overlays+=/obj/Jutsu/Explosion/G;overlays+=/obj/Jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					for(var/obj/NinjaEquipment/TheWires/W in oview(1,src))
						spawn() W.BurnWire()
				for(var/mob/M in oview(1,src))
					spawn()
						if(M&&!M.UsingDomu&&!M.Kaiten&&!M.sphere&&!M.SusanooIn)
							var/damage=M.maxstamina*0.25;var/damage2=M.maxhealth*0.20;var/Chakraz=M.ChakraArmor*0.01
						//	view(M)<<output("<font color=red>[M] has been hit by the explosion!</font>","Attack")
							if(M)
								if(M.PaperStyleDance)
									M.PaperStyleDance=0
								M.DamageProc(damage-(Chakraz*damage),"Stamina",src.Owner,"explosion","yellow")
								if(M)
									M.DamageProc(damage2-(Chakraz*damage),"Health",src.Owner,"explosion","red")
				for(var/obj/O in oview(1,src))
					O.DamageProc(1000)
			spawn(5)
				del(src)
	StrongExplosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			spawn() src.SoundEngine('SFX/Bang.wav',100)
			..()
			overlays+=/obj/Jutsu/Explosion/A;overlays+=/obj/Jutsu/Explosion/B;overlays+=/obj/Jutsu/Explosion/C;overlays+=/obj/Jutsu/Explosion/D
			overlays+=/obj/Jutsu/Explosion/E;overlays+=/obj/Jutsu/Explosion/F;overlays+=/obj/Jutsu/Explosion/G;overlays+=/obj/Jutsu/Explosion/H
			spawn()
				sleep(1)
				for(var/mob/M in oview(1,src))
					spawn()
						if(M&&!M.UsingDomu&&!M.Kaiten&&!M.sphere&&!M.SusanooIn)
							var/damage=M.maxstamina*0.25;var/damage2=M.maxhealth*0.50;var/Chakraz=M.ChakraArmor*0.01
							view(M)<<output("<font color=red>[M] foi atingido por uma explosão!</font>","Attack")
							if(M)
								if(M.PaperStyleDance)
									M.PaperStyleDance=0
								M.DamageProc(damage-(Chakraz*damage),"Stamina",src.Owner,"explosion","yellow")
								if(M) M.DamageProc(damage2-(Chakraz*damage),"Health",src.Owner,"explosion","red")
				for(var/obj/O in oview(1,src))
					O.DamageProc(1000)
			spawn(5)
				del(src)
	C4Explosives
		name="Microscopic Explosives"
		icon='Icons/Jutsus/IwazukaTechniques.dmi'
		icon_state="C 4"
		invisibility=2
		New()
			..()
			spawn(1)
				var/mob/O=src.Owner
				while(src)
					sleep(3)
					for(var/mob/M in view(0,src))
						M.health-=(M.maxhealth/50)
						spawn(1) if(M.health<1) M.health=0;M.Death(O)
			spawn(200)
				del(src)

	C0Explosion
		icon='Icons/Jutsus/Explosion(1).dmi'
		icon_state="Explode"
		JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		var/nin=10
		Owner
		New()
			..()
			spawn()
				spawn() src.SoundEngine('SFX/Bang.wav',100)
				while(src)
					sleep(1)
//					for(var/obj/NinjaEquipment/TheWires/A in oview(1,src))
//						sleep(1)
	//					var/mob/USER=src.Owner
	//					var/obj/Jutsu/Elemental/Katon/Goukakyuu/AA=new();AA.loc=locate(A.x,A.y,A.z);AA.nin=USER.nin/1.2;AA.Owner=src.Owner;del(A)
					for(var/mob/M in oview(1,src))
						if(!M.UsingDomu&&!M.Kaiten&&!M.SusanooIn)
							var/damage=src.nin*rand(10,15);
							if(M.PaperStyleDance)
								M.PaperStyleDance=0
							M.DamageProc(damage/2,"Health",src.Owner);if(M) M.DamageProc(damage,"Stamina",src.Owner)
							view(M)<<output("<font color=red>[M] foi atingido pela explosão!</font>","Attack");sleep(5)
					for(var/obj/O in oview(1,src))
						O.DamageProc(50)
			spawn(5)
				del(src)
/*
Smoke Creation System:
*/
obj/smoke
	icon='Icons/Jutsus/NarutoStuff.dmi'
	icon_state="Broken"
	layer=MOB_LAYER+1
	New()
		..()
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		spawn(1)
			src.pixel_x+=rand(1,16);src.pixel_y+=rand(1,16)
			if(src.dir==NORTHEAST)
				while(src)
					src.pixel_x+=rand(-1,8);src.pixel_y+=rand(-1,8)
					sleep(5)
			else if(src.dir==NORTHWEST)
				while(src)
					src.pixel_x+=rand(-8,1);src.pixel_y+=rand(-1,8)
					sleep(5)
			else if(src.dir==SOUTHEAST)
				while(src)
					src.pixel_x+=rand(-1,8);src.pixel_y+=rand(-8,1)
					sleep(5)
			else if(src.dir==SOUTHWEST)
				while(src)
					src.pixel_x+=rand(-8,1);src.pixel_y+=rand(-8,1)
					sleep(5)
		//HOPING this way the game only needs to do a single if() check,
			//Instead of checking per loop... If this makes no difference in lag
			//We'll just revert it back...
		/*	while(src)
				if(src.dir==NORTHEAST)
					src.pixel_x+=rand(-1,8);src.pixel_y+=rand(-1,8)
				if(src.dir==NORTHWEST)
					src.pixel_x+=rand(-8,1);src.pixel_y+=rand(-1,8)
				if(src.dir==SOUTHEAST)
					src.pixel_x+=rand(-1,8);src.pixel_y+=rand(-8,1)
				if(src.dir==SOUTHWEST)
					src.pixel_x+=rand(-8,1);src.pixel_y+=rand(-8,1)
				sleep(5)*/
		var/r=rand(10,30)
		spawn(r)
			del(src)
mob/proc/CreateSmoke(Range)
	var/z=1
	if(Range=="Light")
		z=rand(5,10) //(10,20)
	if(Range=="Medium")
		z=rand(7,12) //(15,25)
	if(Range=="Strong")
		z=rand(12,15) //(25,30)
	while(z>0)
		sleep(2)
		var/obj/s=new/obj/smoke
	//	s.loc=src.loc
		s.loc=src
		z--
obj/proc/CreateSmoke()
	var/z=rand(5,10) //(10,20)
	while(z>0)
		sleep(2)
		var/obj/s=new/obj/smoke
	//	s.loc=src.loc
		s.loc=src
		z--
turf/proc/CreateSmoke(Range)
	var/z=1
	if(Range=="Light")
		z=rand(5,10) //(10,20)
	if(Range=="Medium")
		z=rand(7,12) //(15,25)
	if(Range=="Strong")
		z=rand(15,20) //(25,30)
	while(z>0)
		sleep(2)
		var/obj/s=new/obj/smoke
	//	s.loc=src.loc
		s.loc=src
		z--

//Smoke Bomb
mob/proc/SmokeBomb(Range)
	set background=1
	var/z=1
	if(Range=="Light")
	//	z=rand(20,30)
		z=rand(15,20)
	if(Range=="Medium")
		z=rand(35,45)
	if(Range=="Strong")
		z=rand(55,70)
	while(z>0)
		var/obj/s=new/obj/SmokeA
		if(Range=="Strong")
			for(var/turf/T in oview(1,src))
				var/obj/a=new/obj/SmokeA
				a.loc=T
		sleep(2)
		s.loc=src.loc
		z--
mob/owner/verb/TestLargeSmokeBomb()
	src.LSmokeBomb()
mob/owner/verb/TestSmokeBomb()
	src.SSmokeBomb()
mob/proc/LSmokeBomb()
	set background=1
	var/z=0
	var/c=src.loc
	while(z<6)
		for(var/turf/T in oview(z,c))
			if(get_dist(T,src)==z)
				var/n=rand(10,15)
				while(n>0)
					sleep(2)
					var/obj/a=new/obj/SmokeA
					a.loc=T
					n--
		z++
		sleep(7)
mob/proc/SSmokeBomb()
	set background=1
	var/z=0
	var/c=src.loc
	while(z<5)
		for(var/turf/T in oview(z,c))
			if(get_dist(T,src)==z)
				//var/n=rand(6,8)
				var/n=rand(4,5)
				while(n>0)
					sleep(3)
					var/obj/a=new/obj/SmokeBombA
					a.loc=T
					n--
		z++
		sleep(8)
obj/SmokeBombA
	icon='NarutoStuff.dmi'
	icon_state="SmokeR"
	layer=MOB_LAYER+1
	New()
		flick("SmokeA",src)
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		spawn(10)//was spawn(1) 11/16/12
			src.pixel_x+=rand(-16,16)
			src.pixel_y+=rand(-16,16)
			while(src)
				for(var/mob/M in src.loc)
					if(prob(50))
						if(M.target)
							M.DeleteTarget()
				if(src.dir==NORTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-1,8)
				if(src.dir==NORTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-1,8)
				if(src.dir==SOUTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-8,1)
				if(src.dir==SOUTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-8,1)
				sleep(11)
		var/r=rand(20,25)//was(70,120)
		spawn(r)
			del(src)
	Del()
		flick("SmokeD",src)
		sleep(1)
		..()

obj/SmokeA
	icon='NarutoStuff.dmi'
	icon_state="SmokeR"
	layer=MOB_LAYER+1
	New()
		flick("SmokeA",src)
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		spawn(10)//was spawn(1) 11/16/12
			src.pixel_x+=rand(-16,16)
			src.pixel_y+=rand(-16,16)
			while(src)
				if(src.dir==NORTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-1,8)
				if(src.dir==NORTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-1,8)
				if(src.dir==SOUTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-8,1)
				if(src.dir==SOUTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-8,1)
				sleep(10)
		var/r=rand(20,30)//was(70,120)
		spawn(r)
			del(src)
	Del()
		flick("SmokeD",src)
		sleep(1)
		..()

proc/AttackEfx(dx,dy,dz)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.loc=locate(dx,dy,dz)
		o.icon='AttackEfx.dmi'
		var/r=rand(1,3)
		flick("[r]",o)
		spawn(9)
			o.loc=null

proc/AttackEfx2(dx,dy,dz)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.loc=locate(dx,dy,dz)
		o.icon='AttackEfx.dmi'
		flick("bang",o)
		spawn(9)
			o.loc=null

proc/AttackEfx3(dx,dy,dz,D)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.loc=locate(dx,dy,dz)
		var/r=rand(7,10)
		o.icon='AttackEfx.dmi'
		o.icon_state="[r]"
		o.dir=D
		o.pixel_x=rand(-6,6)
		o.pixel_y=rand(-6,6)

	//	flick("[r]",o)
		spawn(5)
			o.loc=null

proc/AttackEfx4(dx,dy,dz,D)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.loc=locate(dx,dy,dz)
		var/r=rand(11,13)
		o.icon='AttackEfx.dmi'
		o.icon_state="[r]"
		o.dir=D
		o.pixel_x=rand(-6,6)
		o.pixel_y=rand(-6,6)
//		flick("[r]",o)//Just removed the flicks 4/2/2013
		spawn(4)
			o.loc=null

proc/WarpEfx(dx,dy,dz)

	var/obj/o=new/obj/effect(locate(dx,dy,dz))
	o.icon='Icons/Jutsus/MinatoWarp.dmi'
	o.pixel_x=rand(-1,1)
	o.pixel_y=rand(-1,1)
	flick("1",o)
	spawn(4)
		o.loc=null
proc/WarpEfx2(dx,dy,dz)

	var/obj/o=new/obj/effect(locate(dx,dy,dz))
	o.icon='Icons/Jutsus/MinatoWarp.dmi'
	o.pixel_x=rand(-1,1)
	o.pixel_y=rand(-1,1)
	flick("2",o)
	spawn(4)
		o.loc=null
proc/JyuukenEfx(dx,dy,dz)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.loc=locate(dx,dy,dz)
		o.icon='AttackEfx.dmi'
		var/r=rand(7,10)
		o.icon_state="[r]"
		flick(o.icon_state,o)
		spawn(8)
			o.loc=null

proc/BangAttackEfx(dx,dy,dz)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.icon='AttackEfx.dmi'
		flick("bang",o)
		spawn(9)
			o.loc=null
proc/SwordEfx(dx,dy,dz,dir)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.loc=locate(dx,dy,dz)
		o.icon='AttackEfx.dmi'
		o.dir=dir
		switch(dir)
			if(NORTH)
				o.pixel_y=16
			if(SOUTH)
				o.pixel_y=-22
			if(EAST)
				o.pixel_x=16
			if(WEST)
				o.pixel_x=-16
			if(NORTHEAST)
				o.pixel_y=16;o.pixel_x=16
			if(NORTHWEST)
				o.pixel_y=16;o.pixel_x=-16
			if(SOUTHEAST)
				o.pixel_y=-22;o.pixel_x=16
			if(SOUTHWEST)
				o.pixel_y=-22;o.pixel_x=-16
		flick("14",o)
		spawn(4)
			o.loc=null
			del(o)


mob/proc/SoundEngine(Sound,Range)//BaseRange=10
	set background=1
	for(var/mob/X in range(Range,src))
		if(X.ckey!=null&&src.client&&X.client)
			var/sound/A=sound(Sound,0,0,0)
			A.x=src.x-X.x;A.y=src.y-X.y
			A.falloff=2
			X<<A


turf/proc/SoundEngine(Sound,Range)//BaseRange=10
	for(var/mob/X in range(Range,src))
		if(X.ckey!=null)
			var/sound/A=sound(Sound,0,0,0)
			A.x=src.x-X.x;A.y=src.y-X.y
			A.falloff=2
			X<<A


obj/proc/SoundEngine2(Sound,Range,volume2)//BaseRange=10
	for(var/mob/X in range(Range,src))
		var/sound/A=sound(Sound,0,0,volume=volume2)
		A.x=src.x-X.x;A.y=src.y-X.y
		A.falloff=1//2
		X<<A
	sleep(1)

obj/proc/SoundEngine(Sound,Range,volume=40)
//	var/counta=Range*10
	var/countb=1
	var/countc=volume
	var/list/L = list()
	while(countb<10)
		var/list/S = range(countb)
		for(var/mob/X in L)
			S-=X
		S<<sound(Sound,0,0,0,countc)
		for(var/mob/X in S)
			L+=X
		countb++//;counta--
		sleep(4)

/*
for(var/obj/Music_Orb/O in view(usr)) //No real use, just to search out the object for the persepective, read the log-in note.
	for(var/mob/M in view(O)) //If you want an actual mob/obj to play this automatically rather than the player having to hit a verb use for(var/mob/M in view(src)).
		var/t = sound('ff6rhap.mid', volume=100) //Midi's aren't ideal for 'Perspective Hearing.' Waves are instead, but Midi's can be used. BYOND now features a volume control, which is really nice.
		t:x += O:x-M.x //The "X" value in sound is whether the object is to your left or right. The equation O:x-M.x determines this. EX: Your X is 5 and the srcs X is 3 (to your left obviously). 3-5 = -2, and since negative numbers are left with this variable, the sound will be played on your left speaker. Positive numbers are played on your right speaker.
		//t:y = [Enter Number Here] <== I excluded this because the "Y" value in sound is whether or not the object is above your head or below you. Negative numbers are below you, positive numbers are above you.
		t:z += O:y-M.y //"Z" determines if the source is ahead or behind you. Positive numbers are ahead, negative numbers are behind. So O:y-M.y is the proper equation, EX: O:y=5, M.y=2. 5-2=3, so the source is infront of you and will sound like it in your speakers.
		t:environment = 8 //This isn't really for perspective. This is actually used to create sound effects. This particular one creates a concert-like effect. I will list all of the numbers below.
		M << t //This will play the modified sound.

	*/










mob/var/DeathAvoidCount=0//Automatic DA System GFG


//If a Jutsu Name is not defined when calling the DamageProc, and the message Color is left "gray"
//Then the output message will be skipped all together. Thus allowing us to redo the Damage Procs
//As time allows. Game is free to be put up whenever you want, though I recommend a 12:00 AM EST 2013.


mob/proc/NewDamage(Damage,WhereItHits,WhoDidIt,JutsuName,MessageColor="gray",JutsuType)//DirectArmorHit) JutsuType="Ninjutsu" or Tai/Gen/Ken/Katon/etc.
	//MessageColor can be the name of a color or in #123abc format
	//var/DirectArmorDamage=DirectArmorHit
	var/mob/A=WhoDidIt
	var/mob/B=src.BloodPartner

	var/StartDamage=Damage
	if(StartDamage<1) StartDamage=1

	if(src.ImmuneToDeath||src.FrozenBind=="Dead"&&src.client)
		return
	if(WhoDidIt)
		if(WhoDidIt:client)
			if(WhoDidIt:inMei)
//	if(WhoDidIt:client&&WhoDidIt:inMei)
				view(10,WhoDidIt)<<"[WhoDidIt] capa jutsu foi desfeita!"
				WhoDidIt:icon=WhoDidIt:Oicon
				WhoDidIt:overlays+=WhoDidIt:hair
				WhoDidIt:overlays+=WhoDidIt:Overlays
				WhoDidIt:inMei=0

//	if(src.SusanooIn)
//		return
	if(src.EyesOfHell==2&&src.ConversusinThirdStage==1)
		if(prob(45))
			src<<"Você desvia do ataque!"
			return
	if(src.ConversusinEye==1)
		if(src.ConversusinMastery<=100)
			if(prob(15))
				src<<"Você desvia do ataque."
				return
		if(src.ConversusinMastery>100&&src.ConversusinMastery<=250)
			if(prob(18))
				src<<"Você desvia do ataque."
				return
		if(src.ConversusinMastery>250)
			if(prob(20))
				src<<"A força de seus olhos faz com que você se esquive do ataque."
				return
	if(src.ConversusinThirdStage==1)
		if(prob(30))
			src<<"As fases de ataque através de você...."
			return
	if(src.SatouDrunk)
		if(prob(src.Drunk*3+1)) //Wonder if I'm going to have to nerf this o_o....
			if(src.stamina>src.maxstamina*0.45)
				if(WhereItHits=="Health")
					WhereItHits="Stamina"
					if(prob(7))
						src.Drunk+=pick(0.1,0.15,0.18)
						if(src.Drunk>=10)
							src.Drunk=10
					src<<"Você está tão bêbado que você não sente qualquer dor feito a seus órgãos!"
//	if(src.knockedout&&!src.StruggleAgainstDeath)
//		src.Death(A)
//		return//Just added 12/11/2012
	if(src.AOS)
		src.target=A
	if(src.AWA)
		if(A.client)
			if(A.Village!=src.Village)
				src.target=A
			else if(A.target==src)
				src.target=A
		else if(A.Village!=src.Village)
			src.target=A
	if(src.CastingGenjutsu)
		src.GenjutsuCanceling()
	if(src&&src.client&&src.InGenjutsu!="")
		if(src.InGenjutsu!="Kokuangyo"&&src.InGenjutsu!="HekiKonchuu Ishuu")
			if(src.InGenjutsu=="Gyaku Bijon")
				src.client:dir=NORTH
			if(src.InGenjutsu=="Burizado")
				for(var/obj/Genjutsu/Blizzard/R in src.client.screen)
					del(R)
			if(src.InGenjutsu=="Gravity")
				for(var/obj/Genjutsu/Gravity/G in src.client.screen)
					del(G)
			if(src.InGenjutsu=="Nemurihane")
				for(var/obj/Genjutsu/Feathers/G in src.client.screen)
					del(G)
				if(src.Status=="Asleep")
					src.Status="";src.StatusEffected=0
			if(src.InGenjutsu=="Blazing Burn")
				for(var/image/c in src.client.images)
					if(c.icon=='Icons/Jutsus/GenjutsuTechniques.dmi')
						del(c)
			if(src.InGenjutsu=="Vortex")
				for(var/obj/Vortex/Q in src.client.screen)
					del(Q)
			src.InGenjutsu=""

	if(src.IndigoBlock==1&&src.Guarding||src.PaperStyleDance==1&&src.Guarding||src.PaperStyleDance==2)
		src.chakra-=Damage/2;
		src<<"Você vira papel para evitar danos!";
		flick("zan",src);return
	if(src.SusanooIn)
		src.chakra-=Damage/8;return
	if(src.UsingHealthPack)
		src.UsingHealthPack=0
	if(src in WhoDidIt:Allies){Damage*=0.50}
	if(WhoDidIt:Trait=="Powerful"){Damage*=1.2}
	if(WhoDidIt:Strong_NPC){Damage*=1.2}

	if(WhoDidIt:Trait3=="Perseverance"){Damage*=0.80}
	if(src.ARank=="Combatant"){Damage*=0.85}
	if(WhoDidIt:ARank=="Combatant"){Damage*=1.07}
	if(WhoDidIt:ARank=="Leader"||WhoDidIt:ARank=="Co-Leader"){Damage*=1.13}
	if(src.Trait=="Tough"){Damage*=0.85}
	if(src.key=="TheUndyingOne"){Damage*=0.50}
	if(src.Trait3=="Perseverance"){Damage*=0.60}
	if(WhoDidIt:SecondName=="Uzumaki"){Damage*=0.95}
	if(WhoDidIt:PowerScrollBoost==1){Damage*=1.30}
	if(WhereItHits=="Health")
		if(src.GateIn=="Wound"){Damage*=0.75}
		if(src.GateIn=="Limit"){Damage*=0.5}
		if(src.GateIn=="View"){Damage*=0.3}
		if(src.Trait=="Hard-Worker"){Damage*=1.1}
		if(src.SecondName=="Momochi"){Damage*=1.1}
		if(src.SecondName=="Sarutobi"){Damage*=1.15}
		var/ArmorAddUpForM=0
		for(var/obj/Clothes/CA in src.contents)
			if(CA.worn&&CA.EquipmentType=="Armor")
				if(CA.Durability<=0) CA.Durability=0
				if(Damage>300&&WhereItHits=="Health"&&CA.Durability>0)
					CA.Durability-=1
					CA.ArmorCheck(src)
					if((Damage>400&&prob(35)&&WhereItHits=="Health"&&CA.Durability>0)||(Damage>450&&prob(38)&&WhereItHits=="Health"&&CA.Durability>0))
						CA.Durability-=1
						CA.ArmorCheck(src)
				if(Damage>750&&WhereItHits=="Stamina"&&CA.Durability>0)
					CA.Durability-=1
					CA.ArmorCheck(src)
					if((Damage>1250&&prob(35)&&WhereItHits=="Stamina"&&CA.Durability>0)||(Damage>1400&&prob(39)&&WhereItHits=="Health"&&CA.Durability>0))
						CA.Durability-=1
						CA.ArmorCheck(src)//src.ArmorCheck(CA in src.contents)
				if(prob(4)&&CA.Durability>0)
					CA.Durability-=1
					CA.ArmorCheck(src)
				ArmorAddUpForM+=CA.ArmorAddOn
		if(JutsuType=="Heat")//To help out Katon a bit
			ArmorAddUpForM/=2
		Damage-=(Damage*((ArmorAddUpForM)*0.01))  //Armor decreases damage done to the body.

		if(B&&src.BloodLink==1&&B in view(10,src))
			B.health-=Damage
			src<<"O estrago foi transferido para o seu parceiro de sangue [B] em vez de você!"
			B<<"Você tomou o dano de [src]!"
			B.Death(WhoDidIt)
		else
			src.health-=Damage
			if(JutsuName!=null)
				src<<output("<font color=[MessageColor]>Você foi atingido por [JutsuName] tirando [Damage] de Vitalidade! (Protegido de [100-(round(Damage/StartDamage)*100)]%)</font>","Attack")
				oview(10,src)<<output("<font color=[MessageColor]>[src] foi atingido por [JutsuName] tirando [Damage] de Vitalidade!</font>","Attack")
			else
				if(MessageColor!="gray")
					src<<output("<font color=[MessageColor]>Você foi atingido tirando [Damage] de Vitalidade! (Protegido de [100-(round(Damage/StartDamage)*100)]%)</font>","Attack")
					oview(10,src)<<output("<font color=[MessageColor]>[src] foi atingido tirando [Damage] de Vitalidade!</font>","Attack")
				else
					..() //No output, so we can redo the Damage Procs as we please and still put the game up.
		if(Damage>900-round(((A.Focus/2)-src.Buff))&&!src.knockedout&&!src.Guarding)
			if(src.Trait2=="Iron Will")
				src.deathcount+=0.25
			else if(src.Trait3=="Perseverance")
				src.deathcount+=0.65
			else
				src.deathcount+=0.5
		if(Damage>1400-round(((A.Focus/2)-src.Buff))&&!src.knockedout&&!src.Guarding)
			if(src.Trait2=="Iron Will")
				src.deathcount+=0.45
			else if(src.Trait3=="Perseverance")
				src.deathcount+=0.95
			else
				src.deathcount+=0.75
		//
	if(WhereItHits=="Stamina")
		if(istype(src,/mob/IndigoRingBarrier))
			src.health-=Damage
			src.Death(WhoDidIt)
			return
		if(istype(src,/mob/Bugs/Kekkai)||istype(src,/mob/Bugs/Swarm)||istype(src,/mob/Bugs/BugShield)||istype(src,/mob/Bugs/SpecialSwarm)||istype(src,/mob/Sand/SunaNoTate))
			src.health-=Damage
			src.Death(WhoDidIt)
			return
		if(src.GateIn=="Wound")
			Damage*=0.8
		if(src.GateIn=="Limit")
			Damage*=0.6
		if(src.GateIn=="View")
			Damage*=0.5
		if(src.SecondName=="Sarutobi")
			Damage*=1.3
		if(src.Trait=="Speedy")
			Damage*=1.15
		var/ArmorAddupForM=0
		for(var/obj/Clothes/CA in src.contents)
			if(CA.worn)
				ArmorAddupForM+=CA.ArmorAddOn
		if(JutsuType=="")
			Damage-=(ArmorAddupForM*2)  //Armor decreases external damage.
									//Not the same as Vitality because Endurance is already taken into account.
		if(Damage<0) Damage=0

		// wounding system

		if(B&&src.BloodLink==1&&(locate(B in view(10,src))))
			B.health-=Damage
			src<<"O estrago foi transferido para o seu parceiro de sangue [B] em vez de você!"
			B<<"Você tomou o dano de [src]!"
			B.Death(WhoDidIt)
		else
			src.stamina-=Damage
			if(!src.client&&src.stamina<0)
				src.stamina=0
				src.health+=src.stamina
			if(JutsuName!=null)
				src<<output("<font color=[MessageColor]>Você foi atingido por [JutsuName] tirando [Damage] de Energia! (Protegido de [(ArmorAddupForM*2)] damage)</font>","Attack")
				oview(10,src)<<output("<font color=[MessageColor]>[src] foi atingido por [JutsuName] tirando [Damage] de Energia damage!</font>","Attack")
			else
				if(MessageColor!="gray")
					src<<output("<font color=[MessageColor]>Você foi atingido tirando [Damage] de Energia! (Protegido de [(ArmorAddupForM*2)] damage)</font>","Attack")
					oview(10,src)<<output("<font color=[MessageColor]>[src] foi atingido tirando [Damage] de Energia!</font>","Attack")
				else
					..() //No output, so we can redo the Damage Procs as we please and still put the game up.
		if(Damage>900-round((A.Focus/2)-src.Buff)&&!src.knockedout&&!src.Guarding)
			if(src.Trait2=="Iron Will")
				src.deathcount+=0.05
			else if(src.Trait3=="Perseverance")
				src.deathcount+=0.25
			else
				src.deathcount+=0.1
		if(Damage>1500-round((A.Focus/2)-src.Buff)&&!src.knockedout&&!src.Guarding)
			if(src.Trait2=="Iron Will")
				src.deathcount+=0.10
			else if(src.Trait3=="Perseverance")
				src.deathcount+=0.45
			else
				src.deathcount+=0.25

		if(Damage>3000-round((A.Focus/2)-src.Buff)&&!src.knockedout&&!src.Guarding)
			if(src.Trait2=="Iron Will")
				src.deathcount+=0.25
			else if(src.Trait3=="Perseverance")
				src.deathcount+=0.7
			else
				src.deathcount+=0.5
	if(src.client)
		spawn() src.Voice("Hurt")
	if(src.Status=="Asleep")
		src.StatusEffected=0
	if(src.name!=A.name&&src.Age>12)
		A.ExpGain(src,Damage)
	if(src.Focus<50)
		if(src.icon_state=="handseal")
			src.icon_state=""
		if(Damage>rand(100,200))
			if(src.ZankuuSphere)
				src<<"Você perdeu a concentração do seu ataque!"
				src.ZankuuSphere=0
			if(src.Chidorion||src.Raikirion)
				src<<"Você perdeu a concentração do seu ataque!"
				src.overlays-='Icons/Jutsus/Chidori.dmi'
				src.ChidoriD=0
				src.Chidorion=0
				src.Raikirion=0
				src.Normal()
			if(src.Rasenganon)
				src<<"Você perdeu a concentração do seu ataque!"
				src.Rasenganon=0
				src.RasenganD=0
				src.overlays-='Icons/Jutsus/Rasengan2.dmi'
				src.overlays-='Icons/Jutsus/OdamaRasengan.dmi'
				src.overlays-='Icons/Jutsus/KatonRasengan.dmi'
				src.overlays-='Icons/Jutsus/FuutonRasengan.dmi'
				src.overlays-='Icons/Jutsus/Rasengan5.dmi'
				src.overlays-='Icons/Jutsus/Rasengan6.dmi'
				src.overlays-='Icons/Jutsus/Rasengan3.dmi'
				src.overlays-='Icons/Jutsus/Rasengan4.dmi'
	if(src.Focus<100)
		if(Damage>240)
			if(src.Shibari)
				for(var/obj/Nara/Shibari/K in world)
					if(K.Owner==src)
						del(K)
				for(var/obj/Nara/KageNui/K in world)
					if(K.Owner==src)
						del(K)
				src.Shibari=0
	if(src.Buff<1000)
		if(prob(1))
			src.Buff+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
	src.Death(WhoDidIt)
obj/proc/DamageIt(Damage)
	src.health-=Damage
	if(src.health<=0)
		del(src)
//PROCEDIMENTO DE DANO
atom/movable/proc/DamageProc(Damage,WhereItHits,WhoDidIt,JutsuName,MessageColor="gray",JutsuType)
	if(isobj(src))
		src:DamageIt(Damage)
	if(ismob(src))
		if((src&&WhoDidIt)&&(WhoDidIt:NonExist||src:NonExist))
			src<<"...Um espírito não pode ser prejudicado...."
			WhoDidIt<<"Seu ataque deslizou para a direita através de [src] causando nenhum dano!"
			return
		if((src&&WhoDidIt)&&(WhoDidIt:Phasing||src:Phasing)&&(!src:knockedout))
			src<<"[WhoDidIt]'ataque deslizou através de você causando nenhum dano!"
			WhoDidIt<<"Seu ataque deslizou para a direita através [src] causando nenhum dano!"
			return
		src:NewDamage(Damage,WhereItHits,WhoDidIt,JutsuName,MessageColor,JutsuType)


mob/var/tmp/BeingHitBack=0
mob/proc/HitBack(Number,Direction)
	spawn()
		var/I=Number
		src.Strafe()
		while(I>0)
			var/probability=100
			if(src.Trait2=="Iron Will")
				probability-=40
			if(prob(probability-(src.LikeAStone*20)))
				src.BeingHitBack++
				step(src,Direction)
				if(src.knockedout)
					src.BeingHitBack=0
			I--
			sleep(1)
		src.Normal()
		src.BeingHitBack=0


obj/summoneffect
	icon='summoningeffect.dmi'
	density=0
obj/summoncircle
	icon='summoncircle.dmi'
	icon_state=""
	density=0
	layer=TURF_LAYER+1

mob/proc/CreateBubbles(Range)
	var/z=1
	if(Range=="Light")
		z=rand(1,3)
	if(Range=="Medium")
		z=rand(3,5)
	if(Range=="Strong")
		z=rand(5,10)
	while(z>0)
		sleep(1)
		var/obj/s=new/obj/Bubbles
	//	s.loc=src.loc
		s.loc=src.loc
		z--
obj/proc/CreateBubbles(Range)
	var/z=1
	if(Range=="Light")
		z=rand(1,3)
	if(Range=="Medium")
		z=rand(3,5)
	if(Range=="Strong")
		z=rand(5,10)
	while(z>0)
		sleep(1)
		var/obj/s=new/obj/Bubbles
	//	s.loc=src.loc
		s.loc=src.loc
		z--
obj/Bubbles
	icon='Icons/Jutsus/SuitonTechniques.dmi'
	icon_state="Bubbles"
	layer=MOB_LAYER+1
	New()
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		spawn(1)
			src.pixel_x+=rand(14,18)
			src.pixel_y+=rand(14,18)
			while(src&&src.loc!=null)
				if(src.dir==NORTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-1,8)
				if(src.dir==NORTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-1,8)
				if(src.dir==SOUTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-8,1)
				if(src.dir==SOUTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-8,1)
				sleep(5)
		var/r=rand(5,10)
		spawn(r)
			src.loc=null
			del(src)
//new procs you'll need.
proc
	getlineatoms(atom/M,atom/N)//Ultra-Fast Bresenham Line-Drawing Algorithm
		var/px=M.x		//starting x
		var/py=M.y
		var/line[] = list(locate(px,py,M.z))
		var/dx=N.x-px	//x distance
		var/dy=N.y-py
		var/dxabs=abs(dx)//Absolute value of x distance
		var/dyabs=abs(dy)
		var/sdx=sign(dx)	//Sign of x distance (+ or -)
		var/sdy=sign(dy)
		var/x=dxabs>>1	//Counters for steps taken, setting to distance/2
		var/y=dyabs>>1	//Bit-shifting makes me l33t.  It also makes getline() unnessecarrily fast.
		var/j			//Generic integer for counting
		if(dxabs>=dyabs)	//x distance is greater than y
			for(j=0;j<dxabs;j++)//It'll take dxabs steps to get there
				y+=dyabs
				if(y>=dxabs)	//Every dyabs steps, step once in y direction
					y-=dxabs
					py+=sdy
				px+=sdx		//Step on in x direction
				line+=locate(px,py,M.z)//Add the turf to the list
		else
			for(j=0;j<dyabs;j++)
				x+=dxabs
				if(x>=dyabs)
					x-=dyabs
					px+=sdx
				py+=sdy
				var/turf/T=locate(px,py,M.z)
				for(var/atom/A in T)
					line+=A
		return line