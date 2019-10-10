mob/var/tmp
	Owner//Owner var used for telling the Owner.
	DoingHandseals=0//States you are doing Handseals at the moment

//This is designed for letting the Jutsu Engine known, it'll explain everything happening.
mob/var/tmp/HandsSlipped=0//States whether or not your Hands are slipped.
//When performing a Jutsus, it also uses this variable if there is a reason why you can't use a jutsu.
//This is the very reason you can't use two jutsu at the same time/multi-spam them.
//It's a 2.5 second delay between using jutsu basically.

//More explanation below.
mob/proc/Handseals(HandsealTime)//The Proc for making Handseals
	if(Chuunintime==1||WaitingRoom==1)
		if(src.TakingPartInChuunins==1)
			src<<"Você falhou na parte 1."
			world<<"[src] Foi disclassificado do Exame Chuunin por usar jutsus durante a Parte 1!"
			spawn() src.GotoVillageHospital()
			src.TakingPartInChuunins=0

	if(src.Kengan||src.DotonSpear||src.Phasing||src.InMirror||src.SetRightHand||src.SetLeftHand||src.SoundSpinningKick||src.knockedout||src.buyou||src.Mogu||src.FuuinjutsuHandseal||src.CastingGenjutsu||src.Status=="Asleep"||src.intank||src.Guarding||src.DoingHandseals||src.doingG||src.inso||src.Kaiten||src.resting||src.meditating||src.sphere||src.ingat||(src.firing&&!src.ManeCommand)||src.FrozenBind!=""&&src.FrozenBind!="Spider Web"&&src.FrozenBind!="Syrup"||src.doingG||src.Chidorion||src.Rasenganon||src.Shocked==1||src.BrokenArms)
		src.HandsSlipped=1;spawn(25)
			src.HandsSlipped=0
	if(src.LeftHandSheath||src.RightHandSheath)
		if(src.OneHandedSeals<1)
			src<<"Você precisa soltar seu armamento(s), para fazer os selos!"
			src.HandsSlipped=1;spawn(25)
				src.HandsSlipped=0
		else
			if(src.LeftHandSheath&&src.RightHandSheath)
				src<<"Você precisa soltar seu armamento(s), para fazer os selos!!"
				src.HandsSlipped=1;spawn(25)
					src.HandsSlipped=0
			else
				HandsealTime*=(4-src.OneHandedSeals)
/*As explained above, this basically says if any of those variables are on the user
will automatically slip their hands. As long as HandsSlipped variable is on, the user
can not perform ANY jutsu requiring handseals at all. This is why all Jutsu that
have handseals have lines like these;
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return

It's saying they perform the handseals, then if for any reason their HandsSlipped var
equals 1, they automatically stop the jutsu there.
*/
	if(src.GateIn=="Wound"||src.GateIn=="Limit"||src.GateIn=="View")
		src<<"<b>Você errou seus selos! Seus musculos estão rasgados e não é possivel fazer selos!</b>"
		src.HandsSlipped=1;spawn(25)
			src.HandsSlipped=0
	if(src.InGenjutsu!="")
		if(prob(50/(src.GenjutsuSight+1)))
			src<<"Algum Genjutsu pertubou seu chakra e você não conseguiu executar seu jutsu!"
			src.HandsSlipped=1;spawn(25)
				src.HandsSlipped=0
	if(src.HandsSlipped)
		return
/*
The progression for handseal based passives below. Nothing too special.
No one has to touch this really, unless the Passive System were to change.
*/
	else if(prob((src.HandsealsMastery+1)*25))
//If the probability of their Handseal Mastery+1 x 25. In explanation if:
//I have 3 Handseal Mastery, it adds 1 and multiplies by 25 and that means I have
//100% chance of proper handseals compared to if I had 1.1, then I have 50.4% chance.
//This is how the math is done.
//Basically saying if it's in the probability of this number.
		src.firing=1
		if(!src.HandsealAgility)
			src.Frozen=1
		if(prob(10)&&src.HandsealSpeed<30&&src.HandsealsMastery>=3)
			src.HandsealSpeed+=pick(0.1,0.2)
		if(src.HandsealsMastery<3&&src.NinjutsuKnowledge>10)
			src.HandsealsMastery+=pick(0.1,0.2,0.3,0.4,0.5);if(src.HandsealsMastery>3) src.HandsealsMastery=3

		if(HandsealTime<0)//If it's a Negative time...
			HandsealTime=0//Just make it 0.
		if(HandsealTime>0&&src.shika)
			HandsealTime*=1.35
		if(HandsealTime>0&&src.Trait=="Speedy")
			HandsealTime*=0.4


		spawn(HandsealTime)//It spawns the handseal time.
			src.firing=0;src.Frozen=0//Remember difference between spawn and sleep is
//Sleep stops the whole process while spawn just makes it so you wait.
		src.icon_state="handseals"
		src<< sound('SFX/SEAL1.wav',1,0,1);sleep(HandsealTime);src<<sound(null,0,0,1)//src<<sound(0,0,1);
		if(prob(20))
			viewers()<<sound('SFX/SEAL2.wav',0,channel=8,volume=40);
		src.icon_state=""
		if(src.FrozenBind=="Shibari")
			src<<"Você foi capturado pela sombra paralisante, Suas mãos estão paradas!"
			src.HandsSlipped=1;spawn(25)
				src.HandsSlipped=0
//Above makes it so that they perform the handseals for the amount of sleep
//time with the SFX and afterwards it turns off the sound with the seal sound.
	else
		src.firing=1;src.HandsSlipped=1;spawn(HandsealTime)
			src.HandsSlipped=0;src.firing=0
		src<<"<b>Você errou o selos de mão!"
		src.icon_state = "";src.firing=0
		//Lol this part just says if it fails. It's an Else directly toward the if.


/*How to use the Handseal Proc:
When placing it in the jutsu it's simply two lines that you'll use all the time:
	src.Handseals(1-src.HandsealSpeed)
	if(src.HandsSlipped) return

	Unless the time that you do your handseals aren't affected by the passive
	always have -src.HandsealSpeed.

	src.Handseals(X-src.HandsealSpeed) is the number of centiseconds you're
	performing handseals.

	The maximum handseal speed can reach is 30.

	Every number you put in there are the amount of handseals. Houka requires 40
	handseals for example.


	Remember 10 Centiseconds is a second and for realism and gameplay, don't go too
	far with numbers. (focus+0.01)/2
*/
mob/proc/ChakraDrain(TheAmountDrained)
	TheAmountDrained=TheAmountDrained/((src.gen*0.5)+(usr.ChakraC*0.35))/1.2
	if(src.Trait3=="Unyielding")
		TheAmountDrained*=1.35
	if(src.Trait2=="Sound Mind"||src.Strong_NPC)
		TheAmountDrained*=0.65
	if(src.FuuinControlled)
		TheAmountDrained*=rand(5,6)
	if(src.Trait=="Powerful")
		TheAmountDrained*=1.15
	src.chakra-=TheAmountDrained
/*
How to use:
Realitively easy.

It simply takes away from the  "source's chakra" the amount Drained.

The only thing that's hard is maybe the math.

src.gen is basically your Control. The average control is about 40.
ChakraC is your Chakra Control that's learnable, so it's maximum is 100.

Then it drains it. So the TheAmountDrained var is just the plain number that's
continuasly buffered down until it becomes the actual amount drained.

For example:
src.ChakraDrain(2000) - The drain for Clone Jutsu.

2000/40/2 = 25
25/(100/5) = 1.25

1.25 Chakra Drained.


Compared to:
src.ChakraDrain(75000) - The drain for Swamp Jutsu.
75000/4/2=9375
9375/(100/5)=468
*/
mob/proc/StaminaDrain(Number=1)
	if(src.Trait=="Tough")
		Number*=0.7	///Tough Gets 30% lower stamina drain.
	if(src.calories>0)
		Number-=src.GenSkill
		if(Number<1)
			Number=1
		if(src.Trait2=="Sound Mind")
			Number*=0.8
		src.calories-=Number/2
	else
		var/StaminaLost=Number*1.5-src.GenSkill
		if(StaminaLost<10)
			StaminaLost=10
		if(src.Trait=="Powerful")
			StaminaLost*=1.15
		src.stamina-=StaminaLost
/*
How to Use:
Works the same exact way as Chakra Drain, just slightly more complicated since:
Stamina Drain goes through Calories before actually going to Stamina.

Average Physique is 70. Some examples of some Calorie Based Jutsu Drain are:
src.StaminaDrain(10) - Karakuri
src.StaminaDrain(100) - Senpuu
src.StaminaDrain(300) - Buyou
src.StaminaDrain(300) - Genruki Senpuu
*/
mob/var/tmp/StunDelay=0
mob/proc/StunAdd(Number=1)
	if(src.Stun>0)
		return
	else
		sleep(1)
		var/probability=100
		probability-=(src.LikeAMountain*15)
		if(src.Trait2=="Iron Will")
			probability-=50
		if(src.StunDelay!=0)
			probability=0
		if(prob(probability))
			if(src.client)
				src.client.screen+=new/obj/ReleaseThingyAilment/Stun
			src.Stun+=Number
			if(src.Trait!="Tough"&&prob(50))
				src.HandsSlipped=1
				spawn(25)
					src.HandsSlipped=0
			if(src.Stun>20)
				src.Stun=20

//Elemental Damage Plateau Effect
proc
	EarthDamage(mob/M)
		var/EarthChakra=0
		if(M)
			EarthChakra=M.EarthChakra
		if(EarthChakra>20)
			var/Difference=M.EarthChakra-20
			var/Divider=(M.EarthChakra/20)
			if(M.EarthChakra>30)
				Divider*=1.25
			EarthChakra=20
			EarthChakra+=(Difference/Divider)
		return EarthChakra
	FireDamage(mob/M)
		var/FireChakra=M.FireChakra
		if(FireChakra>20)
			var/Difference=M.FireChakra-20
			var/Divider=(M.FireChakra/20)
			if(M.FireChakra>30)
				Divider*=1.25
			FireChakra=20
			FireChakra+=(Difference/Divider)
		return FireChakra
	WaterDamage(mob/M)
		var/WaterChakra=M.WaterChakra
		if(WaterChakra>20)
			var/Difference=M.WaterChakra-20
			var/Divider=(M.WaterChakra/20)
			if(M.WaterChakra>30)
				Divider*=1.25
			WaterChakra=20
			WaterChakra+=(Difference/Divider)
		return WaterChakra*1.2
	WindDamage(mob/M)
		var/WindChakra=M.WindChakra
		if(WindChakra>20)
			var/Difference=M.WindChakra-20
			var/Divider=(M.WindChakra/20)
			if(M.WindChakra>30)
				Divider*=1.25
			WindChakra=20
			WindChakra+=(Difference/Divider)
		return WindChakra
	LightningDamage(mob/M)
		var/LightningChakra=M.LightningChakra
		if(LightningChakra>20)
			var/Difference=M.LightningChakra-20
			var/Divider=(M.LightningChakra/20)
			if(M.LightningChakra>30)
				Divider*=1.45
			LightningChakra=20
			LightningChakra+=(Difference/Divider)
		return LightningChakra

//Ignore bottom
//This little formula was far more difficult to crack than I had anticipated.
//I had to go back to the basics in my old Algebra Notes.
proc/FindDirectionalIconState(obj/M,turf/T,Blah)
	//var/T is the CenterLocation
	//Number System Assuming 1=NorthWest iconstate, 2=North, 4=West, SouthWest=7, 8=South and so forth
	if(get_dist(T,M)==Blah)
		if(M.y!=T.y&&M.x!=T.x) //Assume the slope is not 0 or undefined.
			if((M.y-T.y)/(M.x-T.x)==1||(M.y-T.y)/(M.x-T.x)==(-1)) //if the slope is perfectly diagonal. m=(y2-y1)/(x2-x1) is the formula for slope. If m=1 or -1 then its a corner.
				if(get_dir(T,M)==SOUTHEAST)  //or ((M.y-T.y)/(M.x-T.x)==(-1)&&M.y<T.y&&M.x>T.x) //With this method the above line would not be necessary.
					M.icon_state="9"
				if(get_dir(T,M)==SOUTHWEST)
					M.icon_state="7"
				if(get_dir(T,M)==NORTHEAST)
					M.icon_state="3"
				if(get_dir(T,M)==NORTHWEST)
					M.icon_state="1"
			else if(((M.y-T.y)/(M.x-T.x))>1||((M.y-T.y)/(M.x-T.x))<(-1)) //if the slope is greater than 1, or less than -1, then the obj is on a slope that is more vertical than horizantal.
				if(M.y>T.y)
					M.icon_state="2"
				if(M.y<T.y)
					M.icon_state="8"
			else  //if the slope is less than 1 and greater than -1, then the obj's slope to the center is more horizantal than vertical.
				if(M.x>T.x)
					M.icon_state="6"
				if(M.x<T.x)
					M.icon_state="4"
		else  //The slope is either 0 or undefined.
			if(M.y>T.y)  //or (get_dir(T,M)==NORTH)
				M.icon_state="2"
			if(M.y<T.y)
				M.icon_state="8"
			if(M.x>T.x)
				M.icon_state="6"
			if(M.x<T.x)
				M.icon_state="4"

obj/proc
	SetInitialDisplacement(var/RangeMin=-8,var/RangeMax=8)
		src.pixel_x=rand(RangeMin,RangeMax);src.pixel_y=rand(RangeMin,RangeMax)
		var/InitialDisplacement="None"
		if(src.dir==WEST||src.dir==EAST)
			if(src.pixel_y>2){InitialDisplacement="Positive"}
			else if(src.pixel_y<-2){InitialDisplacement="Negative"}
		if(src.dir==NORTH||src.dir==SOUTH)
			if(src.pixel_x>2){InitialDisplacement="Positive"}
			else if(src.pixel_x<-2){InitialDisplacement="Negative"}
		return InitialDisplacement
//Jutsu Spread is called by the Object's Movement proc
obj/proc
	JutsuSpread(var/InitialDisplacement="None",var/MinPixelShift=2,var/MaxPixelShift=4)
		if(src.dir==WEST||src.dir==EAST)
			if(InitialDisplacement=="Positive")
				src.pixel_y+=rand(MinPixelShift,MaxPixelShift)
				if(src.pixel_y>=16)
					src.pixel_y-=32
					src.loc=get_step(src,NORTH)
					return 0
				else
					return 1
			else if(InitialDisplacement=="Negative")
				src.pixel_y-=rand(MinPixelShift,MaxPixelShift)
				if(src.pixel_y<=-16)
					src.pixel_y+=32
					src.loc=get_step(src,SOUTH)
					return 0
				else
					return 1
			else
				return 1
		else if(src.dir==NORTH||src.dir==SOUTH)
			if(InitialDisplacement=="Positive")
				src.pixel_x+=rand(MinPixelShift,MaxPixelShift)
				if(src.pixel_x>=16)
					src.pixel_x-=32
					src.loc=get_step(src,EAST)
					return 0
				else
					return 1
			else if(InitialDisplacement=="Negative")
				src.pixel_x-=rand(MinPixelShift,MaxPixelShift)
				if(src.pixel_x<=-16)
					src.pixel_x+=32
					src.loc=get_step(src,WEST)
					return 0
				else
					return 1
			else
				return 1
		else
			return 1