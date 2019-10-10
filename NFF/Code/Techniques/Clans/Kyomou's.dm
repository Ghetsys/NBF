//Mitchell Quinn
/*





*/

mob/var/kyomouCharge
mob/var/kyomouDischarged
mob/var/kyomouCreation=0.01
mob/var/kyomouDestruction=0.01



mob/proc
	kyomouCharge()
		src<<"You begin to charge your particles."
		sleep(100)
		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are charges 16%."
			//change icon to 1/6
		sleep(100)
		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are changed 33%."
			//change icon to 2/6
		sleep(100)

		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are changed 50%."
			//change icon to 3/6
		sleep(100)

		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are changed 66%."
			//change icon to 4/6
		sleep(100)

		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are changed 83%."
			//change icon to 5/6
		sleep(100)

		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are changed 100%."
			//change icon to 6/6
		sleep(100)
		if(src.KyomouDischarged == 1)
			return
		else
			src<<"Your Particles are overcharging."
			//change icon to overcharge.
		sleep(50)
			//use exploding


	particleDischarge()
		if(src.particleCharge == 1)
			src.KyomouDischarge = 1
			src.particleShield()
			sleep(100)
			src.KyomouDischarge = 0

		if(src.particleCharge == 2)
			src.KyomouDischarge = 1
			//use particle bunshin
			src.particleBunshin()
			sleep(100)
			src.KyomouDischarge = 0

		if(src.particleCharge == 3)
			src.KyomouDischarge = 1
			//use particle heal
			src.particleHealing()
			sleep(100)
			src.KyomouDischarge = 0

		if(src.particleCharge == 4)
			src.KyomouDischarge = 1
			//particle ball
			src.particleBall()
			sleep(100)
			src.KyomouDischarge = 0

		if(src.particleCharge == 5)
			src.KyomouDischarge = 1
			//particle wave
			src.particleWave()
			sleep(100)
			src.KyomouDischarge = 0

		if(src.particleCharge == 6)
			src.KyomouDischarge = 1
			//particle beam
			src.particleWave()
			sleep(100)
			src.KyomouDischarge = 0

	particleSheild()
		src<<"You surround yourself in particles protecting yourself from damage"


	particleBunshin()
		src<<"You create bunshins, click on one to trade places with them."


	particleHealing()
		var/healing
		src<<"Your particles infuse with your wounds healing them."
		healing = src.particleCreation * 75
		src<<"Your health and stamina has been increased by [healing]."
		src.health+= healing
		src.stamina+= healing
		if(src.particleCreation <=3)
			particleCreation+=0.01


	particleBall()
		src<<"You focus your particles into a condensed ball and launch it forward."


	particleWave()
		src<<"You focus your particles into a wave and launch it forward."


	particleBeam()
		src<<"You focus your particles into a beam."