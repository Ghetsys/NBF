/*Nifty Quake Effect Lib
  Will work if you use it as-is, but you can tear it apart if you want.
  It achieves a quake effect in much the same way bad movies do it--by jiggling
  the camera around.  In this case, the camera is client.eye.
  The code's pretty straightforward, so its not commented.

  Use this like so:
  Quake_Effect(mob/M, duration strength)
  where M is the mob who will see the effect (use a loop to do it to all mobs in view/range/etc)
  		duration is the number of ticks it will last for
  		strength is the amount of jigglage to the quake.  1 is good for most, but you can do whatever.
*/

proc
	Quake_Effect(mob/M,duration,strength=1)
		if(!M.client)return
		spawn(1)
			var/oldeye=M.client.eye
			var/x
			for(x=0;x<duration,x++)
				M.client.eye = get_steps(M,pick(NORTH,SOUTH,EAST,WEST),strength)
				sleep(1)
			M.client.eye=oldeye
mob/proc/Quake_Effect_Self(mob/M,duration,strength=1)
	if(!M.client)return
	spawn(1)
		var/oldeye=M.client.eye
		var/x
		for(x=0;x<duration,x++)
			M.client.eye = get_steps(M,pick(NORTH,SOUTH,EAST,WEST),strength)
			sleep(1)
		M.client.eye=oldeye