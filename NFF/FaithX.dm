mob/verb
	CheckEventLog()
		set hidden=1
		usr.Events()
	CheckRulesLog()
		set hidden=1
	//	return
		usr.RuleGuide()
	//	usr.CurrentRules()
	CheckRPLog()
		set hidden=1
		usr.RPGuidelines()
	Ajudaaa()
		set hidden=1
		usr.GuiaParIniciantes()
	UpdateLogs()
		set hidden=1
		usr.UpdateLog()
	CheckWorldMap()
		set hidden=1
		usr.CheckMap()

mob/owner/verb
	Test()
		var/Test= {"
			<html>
				<head>
					<title>Name Goes Here</title>
					<style type="text/css">
						body {
							color: silver;
							background-color: black;
							font-family: Arial, Times, Tahoma, sans-serif
						}
						th {
							font-weight: bold;
							font-size: 13pt
						}
						tr {
							font-size: 12pt;
							padding: 2px. 10px, 2,px, 10px
						}
					</style>
				</head>
				<body>
					<tr align="left">
							<th>Description
							<th>They suck!
		"}
		usr << output("[Test]", "window1.browser2")


mob/proc/Events()
	if(!src.client)
		return
	var/updates = {"
		<html>
		<head>
		<title>Events</title>
		</head>
		<body bgcolor=#FFFFFF text=black>
		<center><h2>May 28th - June 1st</h2></center>
		</br><b>Special Event!</b>
		</br>There are new requirements for S-rank so not every noob in the book who AFK kills get it. Achieve S-rank (non-kages), and get a prize! Kages if you want to get in on this you need to get the reqs for S-rank. Ask me when I'm not busy if you have them. The reqs wilL NOT be revealed so don't fucking ask.
		</br>This is to make people who actually achieve S-rank, people to be feared. When you see S rank you should be like OSH--! Not, oh look an AFK spam killer..
		</br></br><b><u>Prizes:</u></b>
		</br>A custom jutsu of any type. Elemental, Ninjutsu, Taijutsu, Genjutsu, Clan, or anything you can think of within reasonable boundaries and subject to change depending on difficulty and balancing of it.
		</br>
		</br><b><u>Current Winners:</b></u>
		</br>Kaguya, Bone
		</br>Dracule
		</br>Uchiha, Masato
		</br>Ivel
		</br>Yotsuki, Midnight.
		</br></font>
		</body>
		</html>
		"}
	usr << browse("[updates]","size=576x576,window=Events")

mob/proc/UpdateLog()
	if(!src.client)
		return
	var/updates = {"
		<html>
		<head>
		<title>Update Log</title>
		</head>
		<body bgcolor=#FFFFFF text=black>
		<center><h2>May 28th - June 1st</h2></center>
		</br><b>Update Log!</b>
		</br>Blood system (click chakra resouvoir to view) How to work it: Basically you gain wounds through combat if you get hit by a technique that did devastating damage.
		Those wounds transfer over to blood loss then the wounds go back to zero.
		<br> Many bugs fixed
		<br> Chakra shuriken drain nerfed
		<br> Nui drain nerfed
		<br> couple run time errors fixed
		<br> Puppets unsummon should work
		<br> Prison/Fang should be fixed (Rage)
		<br> Sabaku gourd added
		<br> New weapon icons added
		<br> Two new clan in progress (lizard/poison)
		<br> sand buildings (4) A secret lies within the dead grounds of sand......


		<center><h2>December 12th - December 16th</h2></center>
		</br><b>The following were completed throughout the week and this weekend</b>
		<br>
		<br>
		<br>
		<ul>
		</br><li>Rearranged the Percentages and Actual Stat value in the Stats to look nicer </li>
		<br>
		<br><li> Fuuton Rasengan and Katon Rasengan given new Icons (much appreciated Fallen) </li>
		<br>
		<br><li> Some things for Inuzukas Changed/Buffed </li>
		<br>
		<br><li> Smoke Bombs now have a chance to make you lose Target </li>
		<br>
		<br><li> Weather Effect Icons Changed along with the Animations to be less Heavy on Computers that suck </li>
		<br>
		<br><li> Day And Night System implemented:
			<ul>
				<li> Changes as the Same time Weather Changes (It will be on it's own Time Schedule Shortly)</li>
				<li> Merchants won't sell you things at Night</li>
				<li> Night, Morning, and Day are the current Day and Nights added. (May add a few more soon? Possibly "True Night" Which is much darker)</li>
				<li> Can target at night, may remove if people dont' want to be able to target at night for a different style of "Night Fighters"</li>
			</ul>
		<br>
		<br><li> Iron Will now lowers potential willpower damage received</li>
		<br>
		<br><li> Kenjutsu Training Fixed </li>
		<br>
		<br><li> Iron Will trait won't affect Genin as much as it was doing so(was making Genins get up 6+7 times) </li>
		<br>
		<br><li> In your Stats tab your base stats are now shown also with the percent </li>
		<br>
		<br><li> Changed some VERY hidden thing since Yama felt it appropriate to tell people </li>
		<br>
		<br><li> Chance for Normal Weather Patterns increased even more </li>
		<br>
		<br><li> Mizuame Nabara/Syrup now looks a bit transparent to look more like actual Syrup </li>
		<br>
		<br><li> Fixed a few things that were going through three second rule ( There is probably more, But I will fix them as I am reported of them ;o!) </li>
		<br>
		<br><li> Rush Passive had to be nerfed BADLY LOL. </li>
		<br>
		<br><li> Kamui has a few more restrictions on the things that can be Kamui'd away (mostly objs) </li>
		<br>
		<br><li> Kamui can no longer work on someone who is on a different map as you </li>
		<br>
		<br><li> New Location added to the NFF Map: Uchiha Hideout ( Not going to add new maps, would rather fill up NFF"s already massively empty world with stuff) ((Going to start remapping as Fallen is now going to supply new icons for this)) </li>
		<br>
		<br><li> Tough Trait given a new distinction: Your body, being able to withstand more, isn't as hurt when waking up from knocking out, thus you heal a bit more when you come to
		<br>
		<br><li> Teppodama given slight handseal increase </li>
		<br>
		<br><li> New Hud </li>
		<br>
		<br><li> Since People liked the Old Hud, You can now choose between the Old Hud and the New Hud with the Change Hud Verbs located in the Commands Tab </li>
		<br>
		<br><li> Food in inventory now has it's proper icon for the food it is so it's not always a Cheeseburger </li>
		<br>
		<br><li> Half EXP Coded </li>
		<br>
		<br><li> Began to add Stat Ailment Icons that will appear in the corner of the screen once the Ailment is Active </li>
		<br>
		<br><li> Certain Rasengan given an increase in Cooldown, Chakra Usage, and place others on Cooldown </li>
		<br>
		<br><li> Akimichi Pills were nerfed </li>
		<br>
		<br><li> Added a Vet in Chuunin Arena Stand Area </li>
		<br>
		<br><li> Ketsueki Seal 1 Revamped: Now slowly regenerate your Chakra and you lose the regeneration once you're hit. Your Thirst goes up like crazy still at the start of the jutsu so if you're hit, tough luck. </li>
		</ul>




		<center><h2>December 17th - December 25th</h2></center>
		</br><b>The following were completed while the Game was Down. A much more detailed Update Log can be found on the Forums</b>
		<br>
		<br>
		<br>
		<ul>
		</br><li> Hoshigaki Create Samehade Changed: Text was Eh.</li>
		<br>
		<br><li> Hoshigaki Verbs should now Be SkillCards</li>
		<br>
		<br><li> Rain looks way too sexy</li>
		<br>
		<br><li> Mission Bug Fixed</li>
		<br>
		<br><li> Day Cycle lasts a LOT longer while Night Cycle doesn't last as long</li>
		<br>
		<br><li> Poison should be working again</li>
		<br>
		<br><li> Old Rule List that popped up for GM's Removed since it no longer matters</li>
		<br>
		<br><li> Housenkas Impact Damage nerfed since it was 80% vitality Damage</li>
		<br>
		<br><li> Village Elder given a much larger Village Morale Requirement</li>
		<br>
		<br><li> Anbu,Village Council, and Kage Ranks given Village Morale Requirements</li>
		<br>
		<br><li> Syrup Given a slightly larger amount of Transparency</li>
		<br>
		<br><li> Kenjutsu training rate back to it's previous rate from last wipe</li>
		<br>
		<br><li> Paper/Ink/Clay Seller Added in All Villages</li>
		<br>
		<br><li> New Verb added to Check your Elemental Knowledges</li>
		<br>
		<br><li> Few more Stat Attribute Icons implemented: Severe Bleeding and Stun</li>
		<br>
		<br><li> Armor System Built Upon a bit more:</li>
		<br>
		<br><li> Auto Reboot System Implemented</li>
		<br>
		<br><li> New AFK Check System Implemented:</li>
		<br>
		<br><li> Spectate Chuunin Verb for Chuunin+ Ranked Ninja Completed</li>
		<br>
		<br><li> Weather System Expanded Upon</li>
		<br>
		<br><li> Argon remapped Second Forest of Death making it look more natural and more like an actual forest</li>
		<br>
		<br><li> You will be able to run sooner when you get up from being knocked out</li>
		<br>
		<br><li> New Uchiha Feature: Sharingan Focus</li>
		<br>
		<br><li> Amaterasu Nerfed as I buffed it too hard, even if it's a Mangekyou Sharingan technique</li>
		<br>
		<br><li> Exploding Clone should only work with Clones now, specifically Tajuu</li>
		<br>
		<br><li> Majority of Basic Last Names given Revisions</li>
		<br>
		<br><li> Wind Trick can no longer move someone if they are in Mole</li>
		<br>
		<br><li> Sub Traits Revised</li>
		<br>
		<br><li> Sharingan Copy Bug finally fixed</li>
		<br>
		<br><li> Amount of Heaven and Earth Scrolls Changed in Forest Of Death</li>
		<br>
		<br><li> Attempting to hit with Rasengan lowers the damage of it, meaning if you attempt to strike, and miss, the damage will be reduced</li>
		<br>
		<br><li> Rasengan's rate that it loses charge is proportional to the Power of the Rasengan:</li>
		<br>
		<br><li> Arenas should no longer autofix themselves when people are choosing an arena to fight on or are challenging somebody and waiting during the 45 seconds</li>
		<br>
		<br><li> Equip verb now causes your Weight to automatically Update</li>
		<br>
		</ul>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>


		</br>
		</br></font>
		</body>
		</html>
		"}
	usr << browse("[updates]","size=600x600,window=Update Log")//576x576
mob/proc/CheckMap()
	if(!src.client)
		return//
	var/Link="http://z1.ifrm.com/1509/77/0/p1026776/worldmap.png"
	usr << browse({"<html><head><style type="text/css">table, td, th{border:1px solid white;border-collapse:collapse;}th{background-color:white;color:black;}</style></head><img src=[Link]></body></html>"},"window=NFF World Map")
mob/proc/CurrentRules()
	if(!src.client)
		return//
	var/Link="http://s8.zetaboards.com/NarutoFinalFight/topic/8347957/1/"
	usr << browse({"<html><head><style type="text/css">table, td, th{border:1px solid white;border-collapse:collapse;}th{background-color:white;color:black;}</style></head><img src=[Link]></body></html>"},"window=NFF Rules")




mob/var/tmp/target // the var to tell you your target

mob/proc/DeleteTarget()
	src.target=null
	if(!src.client)
		return
	for(var/image/x in src.client.images)
		if(x.icon=='Icons/target1.dmi'&&x.icon_state!="Number2")
			del(x)

mob
	proc
		Target()
			if(!src.target)
				src << "You need to target first"
				src.ntarget = 1
			else
				src.ntarget = 0

mob/var/tmp
	ntarget = 0




var/list/Winners
var/list/MatchUpList
var/list/CurrentFighters
var/Limit=0
mob
mob/owner/verb/ResetLists()
	Winners=null
	MatchUpList=null
	CurrentFighters=null
	contestants=list()
	SecondPartDeath=list()
mob/owner/verb/TestAutomaticTournament()
	world<<"<font size=3><b>Automatic Tournament Test Hosting Commencing now. Join using the tournament tab."
	Limit=0
	for(var/mob/M in world)
		M.verbs+=new /mob/Tournament/verb/Join
		spawn(300)
			M.verbs-=/mob/Tournament/verb/Join
	sleep(350)
	world<<"Test Tournament Commencing."
	AutomaticTournament()
mob/Tournament/verb/Join()
	set category="Tournament"
	if(Limit<24)
		src<<"This is a testing tournament and it may be a bit buggy but bear with us and please be patient. You are Frozen until your match starts."
		world<<"[src] joined the tournament."
		src.loc=locate(12,53,30)
		Limit+=1
		contestants+=src
		src.FrozenBind="WaitingForTournament"
		src.verbs-=/mob/Tournament/verb/Join
	else
		src<<"Sorry, because this is a testing tournament the limit is preset at 24 participants. You cannot join."
		src.verbs-=/mob/Tournament/verb/Join
		return


proc/AutomaticTournament()
	if(Limit<4)
		world<<"<font size=3><TT>Not enough participants in the Tournament. Tournament cancelled.</TT></font>"
		contestants=list();return
	if(!Winners)
		world<<"<font size=3><TT>Preparing Tournament set-up. Matching up players randomly.</TT></font>"
		var/list/L=list()
		Winners=list()
		for(var/mob/C in contestants)
			L.Add(C);
		for(var/mob/M in L)
			if(!M.Opponent)
				if(L.len>1)
					L.Remove(M);
					var/mob/PickedOpponent=pick(L)
					PickedOpponent.Opponent=M.ckey
					M.Opponent=PickedOpponent.ckey
					L.Remove(PickedOpponent);
					world<<"<font size=1><TT>[M] vs [PickedOpponent]</TT></font>"
				else
					Winners.Add(M);
					contestants.Remove(M);
					world<<"<font size=1><TT>[M] has no opponent and will move on to the next round.</TT></font>"
			sleep(1)
		world<<"<font size=3><TT>Tournament Set-Up complete.</TT></font>"
		AutomaticMatches()
		return
	else if(Winners.len>=1)
		world<<"Mark5";
		if(Winners.len<=1)
			var/mob/Winner=pick(Winners)
			world<<"<font size=3><TT>Tournament Completed. Congratulations to the winner, [Winner]. Prize: Ninja Cash.</TT></font>"
			Winner.NinjaCash+=50
		else
			contestants=null
			contestants=list()
			world<<"<font size=3><TT>Viewable Contestants Refreshed. Beginning Next Round.</TT></font>"
			MatchUpList=list();
			world<<"Mark6";
			for(var/mob/W in Winners)
				contestants+=W;
				Winners.Remove(W);
				MatchUpList.Add(W);
			var/list/K=list()
			for(var/mob/C in contestants)
				K.Add(C);
			for(var/mob/M in MatchUpList)
				if(MatchUpList.len>=1)
					var/mob/PickedOpponent=pick(K)
					PickedOpponent.Opponent=M.ckey
					M.Opponent=PickedOpponent.ckey
					MatchUpList.Remove(M);
					MatchUpList.Remove(PickedOpponent);
					world<<"<font size=1><TT>[M] vs [PickedOpponent]</TT></font>"
				/*else
					MatchUpList=null;MatchUpList=list();
					Winners=null;Winners=list();
					contestants=null;contestants=list()
					world<<"<font size=1><TT>[M] has no opponent and will move on to the next round.</TT></font>"
					sleep(11)
					world<<"<font size=3><TT>Tournament Completed. Congratulations to the winner, [M]. Prize: 25,000 Ryo.</TT></font>"
					M.Yen+=25000
					return*/
			if(contestants.len>1)
				world<<"<font size=3><TT>Preparing for the next round.</TT></font>"
				AutomaticMatches()
				return



proc/AutomaticMatches()
	world<<"<font size=3><TT>Randomly selecting next match.</TT></font>"
	if(contestants.len==0||!contestants.len)
		if(Winners.len>=1)
			AutomaticTournament()
			return
	if(!contestants.len)
		world<<"<font size=3><TT>All contestants have vanished magically. The tournament is cancelled.</TT></font>"
		return
	world<<"Mark1";
	var/mob/M=pick(contestants)
	var/mob/O
	for(var/mob/Opponent in contestants)
		if(Opponent.Opponent==M.ckey)
			O=Opponent
	world<<"Mark2";
	M.FrozenBind=""
	O.FrozenBind=""
	CurrentFighters=list();
	CurrentFighters.Add(M);CurrentFighters.Add(O);
	sleep(11)
	world<<"Mark3";
	world<<"<font size=3><TT>Match Selected. [M] vs [O]</TT></font>"
	sleep(25)
	world<<"<font size=3><TT>Randomly selecting Arena.</TT></font>"
	sleep(11)
	world<<"Mark4";
	if(prob(50))
		M.loc=locate(115,67,32)
		O.loc=locate(115,46,32)
	else
		M.loc=locate(141,67,32)
		O.loc=locate(141,46,32)
	world<<"<font size=3><TT>Arena Selected. Participants in place. Begin!</TT></font>"
	while(CurrentFighters.len>=2)
		sleep(300)
	if(CurrentFighters.len<=1)
		var/mob/Winner=pick(CurrentFighters)
		world<<"<font size=3><TT>[Winner] wins the match.</TT></font>"
		Winners.Add(Winner)
		if(Winner in contestants)
			contestants.Remove(Winner);
		CurrentFighters=null
		Winner.loc = locate(154,85,32)
		world<<"<font size=3><TT>Moving onto next match.</TT></font>"
		AutomaticMatches()
		return

//HONESTLY...I have no idea why this doesn't work.
//It will not go onto the next match even if someone wins when it should.
//I really don't get it. This constant loop in AutomaticMatches() proc should take care of everything
//regardless if someone loses/logs out/DCs/ or whatever. It doesn't though so I can't say for sure.
//
//You COULD always try calling Automatic Matches after someone wins in the Death Proc with a spawn() infront of it.
//But idk if that would work.


mob/GauntletJoin/verb
	JoinGauntlet()
		set category="Mission Alert"
		set name="Join"
		if(usr.rank=="Genin"||usr.rank=="Student")
			usr.verbs-=new/mob/ChuuninJoin/verb/JoinChuunin()
		else
			usr.verbs-=new/mob/ChuuninJoin/verb/JoinChuunin()
			usr<<"You embark to the hidden base!"
//			usr.loc=locate(0,0,0)
			sleep(50)
			usr<<"After a long journey you've found yourself in the deep underground of Sand! It's your time to shine, now."
			sleep(50)
			usr<<"Go north! But be careful, the ninja have created clever traps. Look out for the lava. The scroll is somewhere north!"
			usr.loc=locate(72,22,32)
			usr.CurrentMission="Gauntlet";usr.TimeLimit=45
proc/Gauntlet()
	var/Xo=pick("Leaf","Rain","Sound","Rock")
	for(var/mob/M in world)
		if(M.client&&M.Village==Xo)
			M<<"<font size=2><font color=red>Mission Alert: A masked ninja has proven resourceful and have stolen another Hidden Ninja Scroll from the Daimyo!? This is an S Rank Mission, we need you to obtain this jewel back! This requires the quickest of movements!!! We need Chuunins and up! Do you join this mission?"
			if(M.rank!="Genin"||M.rank!="Student")
				M.verbs+=new/mob/GauntletJoin/verb/JoinGauntlet()
				spawn(600)
					M.verbs-=new/mob/GauntletJoin/verb/JoinGauntlet()