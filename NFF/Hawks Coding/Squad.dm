//Party System
mob
	var
		hasacrew=0
mob
	verb
		Partywindow()
			set hidden=1
			winset(usr,"Partywindow","is-visible=false")
			winset(usr,"Partywindow","is-visible=true")
			winset(usr,"Partywindow","child1.left=WSay")



var
	list
		parties=list()		//the global party list

	GRAPHICAL_DISPLAY=1		//if you choose to use the graphical display, or rearrange it, whatever the case may be
							//you'll want to enable this
mob/var
	/*
	Since this is basically a "typical rpg party system", it has the typical variables.

	partydatum - this is the variable that holds the current persons party, necessary

	gold       - this variable is for money, not necessary if you don't use currency, or don't want it.

	sp      - this is the players current sp, not necessary if you made an alternative to sps

	alertopen  - this is necessary, it makes it so players cannot use two verbs at once

	exp        - this variable is for the players current EXP value, if you use one, of course

	maxexp     - this variable is used to check for sp ups, against the current exp value
	*/
	partydatum
	alertopen

	/*
	These are just sample procs, if you use them, you should replace them with your current procs.

	sp_up() is just there for an example, although, for expgive, if you want to use party sharing correctly,
	you need to call partycheck() in such a manner shown below. if the proc returns 0, it will give a single player
	exp, but if it returns 1, it will automatically distribute the exp properly

	this is the same with goldgive()
	*/
//mob/proc
//	expgain(expz as num)
	//	if(!partycheck(src,expz))
		//	EXP += expz
	//		spUp()
//	goldgain(goldz as num)
	//	if(!partycheck(src,null,goldz))
		//	gold += goldz
party
	New()
		..()
		parties+=src
	Del()
		parties-=src
		..()
	var/tmp
		name				//the party name
		list
			members=new/list()
		mob/leader
		limit      = 4		//this is the limit to how many people can go in the party
		spres   = 150	//we could restrict our party so people 15 sps higher than us can't get in
		spreq   = 0		//we can restrict our party so people 15 sps lower than us can't get in
		expshare   = TRUE	//do we want to share exp with our party? change the value to FALSE if you want to disable it
		goldshare  = TRUE	//do we want to share gold in our party? change the value to FALSE if you want to disable it
		sharerange = 20		//this is measured in tiles, this is the range at which exp and gold are shared
	proc
		/*
		a lot of these are quite simple to figure out, and a lot of text strings, mostly, so I won't explain them
		amazingly great detail, but here's the rundown anyway:

		createparty(name,creator)   - the proc that handles creating the party, and giving leadershipness to creator
		changeleader(new)           - changes the leader from current to new
		ejectmember(loser)          - ejects loser from the party
		leaveparty(loser)           - used by loser to leave the party
		breakparty				    - disbands the party entirely
		partychat					- sends a message to the whole party
		joinparty					- called when an invitation is accepted to join the party
		partyloop(something)		- tells the whole party something, in <b><font color = green> style
		requestjoin					- this is how people ask to join the party
		updatestats					- updates only the stats in the grid!
		reorderparty				- updates EVERYTHING in the grid
		redobuttons					- reorders the buttons so ex-leaders don't have leader buttons and whatnot
		*/
		createparty(codename,mob/creator)
			if(usr.rank=="Gennin")	//Lol, did you purposly misspell Genin?
				usr<<  output("As a Gennin you cannot create a squad.![src].", "combat")
				return
			//creates the party under the codename
			else
				leader=creator
				for(var/party/p in parties)
					if(ckey(p.name)==ckey(codename))
						leader << "<b><font color = green>Your party, [codename], could not be created. It already exists."
						leader=null
						del src
				name=codename
				members+=leader
				leader.partydatum=src
				leader.hasacrew=1
				if(GRAPHICAL_DISPLAY)winset(leader,"Partywindow","title='The [codename] crew'")
				if(GRAPHICAL_DISPLAY)winset(leader,"Partywindow.leave","is-visible=true")
				if(GRAPHICAL_DISPLAY)winset(leader,"Partywindow.speak","is-visible=true")
				leader << "<b><font color = green>You are now the leader of the [codename] crew!</font></b>"
				redobuttons(null,leader)
				reorderparty()



		changeleader(newleader)
			//changes the party leader
			partyloop("Crew leader has changed from [leader] to [newleader].")
			redobuttons(leader,newleader)
			leader=newleader
			reorderparty()

		ejectmember(mob/byebye)
			//kicks noobs out of the party, if they're there of course. heh
			if(locate(byebye)in members)
				members-=byebye
				byebye.partydatum=null
				byebye.clearpartygrid()
				byebye << "<b><font color = green>You have been ejected from the party. ([name])"
				if(GRAPHICAL_DISPLAY)winset(byebye,"Partywindow","title=Party")
				if(GRAPHICAL_DISPLAY)winset(byebye,"Partywindow.leave","is-visible=false")
				if(GRAPHICAL_DISPLAY)winset(byebye,"Partywindow.speak","is-visible=false")
				partyloop("[byebye] was ejected from the party.")
				reorderparty()
				byebye.clearpartygrid()
			else leader << "<b><font color = green>[byebye] is not in the party.</font></b>"

		leaveparty(mob/abandoner)
			//makes abandoner leave the party
			abandoner << "<b><font color = green>You have left the [abandoner.partydatum] party.</font></b>"
			abandoner.partydatum=null
			abandoner.clearpartygrid()
			members-=abandoner
			if(abandoner.client)
				if(GRAPHICAL_DISPLAY)winset(abandoner,"Partywindow","title=Party")
				if(GRAPHICAL_DISPLAY)winset(abandoner,"Partywindow.leave","is-visible=false")
				if(GRAPHICAL_DISPLAY)winset(abandoner,"Partywindow.speak","is-visible=false")
				redobuttons(abandoner,null)
			partyloop("[abandoner] has left the party.")
			if(leader==abandoner)
				if(members.len>0)
					changeleader(pick(members))
				else
					partyloop("The party has been disbanded.")
					del src
			reorderparty()

		breakparty()
			//disbands the party
			partyloop("Your party has disbanded by [leader].")
			leader << "<b><font color = green>You disbanded the party. ([name])"
			for(var/mob/o in members)
				if(GRAPHICAL_DISPLAY)winset(o,"Partywindow","title=Party")
				if(GRAPHICAL_DISPLAY)winset(o,"Partywindow.leave","is-visible=false")
				if(GRAPHICAL_DISPLAY)winset(o,"Partywindow.speak","is-visible=false")
				redobuttons(o,null)
				o.clearpartygrid()
				members-=o
			del src

		partychat(init,text)
			//chats to the party
			partyloop("([name])[init]<font color = red>>><font color = green>[html_encode(text)]")

		joinparty(mob/newmember)
			//this is called when someone joins the party
			if(newmember.partydatum!="pending")return
			if(locate(newmember)in members)members-=newmember
			partyloop("[newmember] has joined the party! ([name])")
			members+=newmember
			newmember.partydatum=src
			if(GRAPHICAL_DISPLAY)winset(newmember,"Partywindow","title='The [name] party'")
			if(GRAPHICAL_DISPLAY)winset(newmember,"Partywindow.leave","is-visible=true")
			if(GRAPHICAL_DISPLAY)winset(newmember,"Partywindow.speak","is-visible=true")
			reorderparty()

		partyloop(text as text)
			//I didn't want to type out <b><font color = green> in every proc. so this was born
			members<<"<b><font color = green>[text]</font></b>"

		requestjoin(mob/wantstojoin)
			//this is called when someone requests to join a party
			if(members.len>=limit)               {wantstojoin<<"<b><font color = green>That party is currently full.</font></b>";wantstojoin.partydatum=null;return}
		//	if(wantstojoin.sp<spreq)       {wantstojoin<<"<b><font color = green>You are under that parties sp requirement.</font></b>";wantstojoin.partydatum=null;return}
			//if(wantstojoin.sp>spres)       {wantstojoin<<"<b><font color = green>You are over that parties sp restriction.</font></b>";wantstojoin.partydatum=null;return}
			if(wantstojoin.partydatum!="pending"){wantstojoin<<"<b><font color = green>You are already in a party.</font></b>";return}
			wantstojoin << "<b><font color = green>Your request has been sent to the leader of the party."
			switch(alert(leader,"[wantstojoin] wants to join the party, will you let them in?","Member request","Yes","No"))
				if("Yes")
					if(wantstojoin.partydatum!="pending"){leader << "<b><font color = green>[wantstojoin] joined another party before waiting for your response.";return}
					joinparty(wantstojoin)
					wantstojoin<<"<b><font color = green>Welcome to the party!</font></b>"
				else
					wantstojoin<<"<b><font color = green>[leader] rejected your request.</font></b>"
					wantstojoin.partydatum=null
		updatestats()
			//this is used to update stats on the grid, I made a seperate proc
			//because refreshing and showing the mob every time something changed was utterly painful to look at
			if(!GRAPHICAL_DISPLAY)return
			var/num=1
			var/col=1
			if(!members)return
			if(!members.len)return
			for(var/n=0 to members.len-1)
				//var/mob/m=members[++n]
				members << output("Partywindow.peoplegrid:[++num],[col]")
				col++
				if(num>1)num=0

		reorderparty()
			//this reorders the party as a whole, and reshows stats
			if(!GRAPHICAL_DISPLAY)return
			var/num=0
			var/col=1
			if(!members)return
			if(!members.len)return
			for(var/mob/o in members)o.clearpartygrid()
			for(var/n=0 to members.len-1)
				members << output(members[++n],"Partywindow.peoplegrid:[++num],[col]")
			//	var/mob/m=members[n]
				//members << output("sp [m.sp]","Partywindow.peoplegrid:[++num],[col]")
				col++
				if(num>1)num=0

		redobuttons(mob/oldldr,mob/newldr)
			// this is used to rearrange the buttons on the interface
			if(!GRAPHICAL_DISPLAY)return
			if(oldldr&&oldldr.client)
				winset(oldldr,"Partywindow.join","is-visible=true")
				winset(oldldr,"Partywindow.break","is-visible=false")
				winset(oldldr,"Partywindow.eject","is-visible=false")
				winset(oldldr,"Partywindow.change","is-visible=false")
				winset(oldldr,"Partywindow.invite","is-visible=false")
				winset(oldldr,"Partywindow.options","is-visible=false")
			if(newldr&&newldr.client)
				winset(newldr,"Partywindow.join","is-visible=false")
				winset(newldr,"Partywindow.break","is-visible=true")
				winset(newldr,"Partywindow.eject","is-visible=true")
				winset(newldr,"Partywindow.change","is-visible=true")
				winset(newldr,"Partywindow.invite","is-visible=true")
				winset(newldr,"Partywindow.options","is-visible=true")

proc/partycheck(mob/ref,exp,aur)
	//this proc is called to check for other people in the party, when you get exp, or gold
	//it distributes the stuff automatically, so there's no need to do it manually
	if(ref.partydatum)
		var/party/p=ref.partydatum
		var/list/list=list()
		if(exp)
			for(var/mob/o in view(p.sharerange,ref))
				var/party/pp=o.partydatum
				if(pp)if(pp.name==p.name)list+=o
			exp=round(exp/list.len)
			if(!exp)exp=1
			for(var/mob/o in list)
			//	o.expgain(exp)
			//	o.spUp()
			return 1
		if(aur)
			for(var/mob/o in view(p.sharerange,ref))
				var/party/pp=o.partydatum
				if(pp)if(pp.name==p.name)list+=o
			aur=round(aur/list.len)
			if(!aur)aur=1
			for(var/mob/o in list)
				//o.gold+=aur
				var/sentenceend
				if(aur>1)sentenceend="s."
				else sentenceend="."
				o << "You got [aur] money[sentenceend]"
			return 1
	return 0
mob
	proc/clearpartygrid()
		//clears the party grid
		if(!GRAPHICAL_DISPLAY)return
		if(client)winset(src,"Partywindow.peoplegrid","cells=0,0")
	verb
		/*
		These are the verbs used in the interface.
		A simple rundown:
		optionsparty
			*allows you to set the party options, gold sharing, exp sharing, tile range to share, sp requirement,
			 sp restriction, or member limit
			*leader only
		inviteparty
		    *allows you to invite a member to the party
		    *leader only
		makeparty
			*allows you to make a party, if you aren't in one already
			*makes you the leader of the party
		joinparty
			*allows you to send a request to the leader of a party to join
			*anyone who isn't in a party can use it
		exitparty
			*quits the party, if you are in the party
			*anyone in the party can use it
			*if the leader quits, a new leader is chosen randomly
		chatparty
			*sends a message to everyone in the current party
			*anyone can chat (well I would hope?!)
		breakparty
			*break the current party, causing all members to leave and deleting the party
			*leader only
		changeleaderparty
			*changes the party leader to whomever is chosen
			*leader only
		ejectparty
			*eject a person from the party
			*leader only, can't eject self.
		*/
		optionsparty()
			set hidden=1
			if(alertopen)return
			if(!partydatum){src << "<b><i>You aren't in a party!";return}
			var/party/p=partydatum
			if(p.leader!=src){src << "<b><i>You aren't the party leader!";return}
			alertopen=1
			switch(input(src,"What options would you like to change?","Party options")in list("Gold sharing","Exp sharing","Sharing range","sp requirement","sp restriction","Member limit","Cancel"))
				if("Gold sharing")
					switch(alert(src,"Would you like to turn Gold sharing on or off?","Changing options","On","Off"))
						if("On") p.goldshare=TRUE
						if("Off")p.goldshare=FALSE
					p.partyloop("Gold sharing [p.goldshare ? "enabled" : "disabled"].")
				if("Exp sharing")
					switch(alert(src,"Would you like to turn exp sharing on or off?","Changing options","On","Off"))
						if("On") p.expshare=TRUE
						if("Off")p.expshare=FALSE
					p.partyloop("Exp sharing [p.expshare ? "enabled" : "disabled"].")
				if("Sharing range")
					var/x=round(input(src,"How many tiles away should your exp and Gold share?","Changing options",p.sharerange)as num)
					if(x<=1)x=1
					if(x>25)x=25
					p.sharerange=x
					p.partyloop("Exp/Gold share range changed to [x].")
				if("sp requirement")
					var/x=round(input(src,"What would you like the requirement for the party to be?","Changing options",p.spreq)as num)
					if(x<0)x=0
					if(x>150)x=150
					p.spreq=x
					p.partyloop("sp requirement changed to [x].")
				if("sp restriction")
					var/x=round(input(src,"What would you like the restriction for the party to be?","Changing options",p.spres)as num)
					if(x<0)x=0
					if(x>150)x=150
					p.spres=x
					p.partyloop("sp restriction changed to [x].")
				if("Member limit")
					var/x=round(input(src,"How many members would you like to allow?","Changing options",p.limit)as num)
					if(x<=1)x=2
					if(x>20)x=20
					if(x<p.members.len)x=p.members.len
					p.limit=x
					p.partyloop("Member limit changed to [x].")
				if("Cancel")
					alertopen=0
			alertopen=0
		inviteparty()
			set hidden=1
			if(alertopen)return
			if(!partydatum){src << "<b><i>You aren't in a party!";return}
			var/party/p=partydatum
			if(p.leader!=src){src << "<b><i>You aren't the party leader!";return}
			alertopen=1
			var/list/clients=list()
			for(var/client/c)clients+=c.mob
			var/mob/x=input("Who would you like to invite?","Invite member")in clients+"Cancel"-src
			if(x=="Cancel"){alertopen=0;return}
			if(x.partydatum){src << "<b><font color = green>[x] is already in a party!";alertopen=0;return}
			if(p.members.len>=p.limit){src<<"<b><font color = green>Your party is currently full.</font></b>";alertopen=0;return}
		//	if(x.sp<p.spreq){src<<"<b><font color = green>[x] is under your party's sp requirement.</font></b>";alertopen=0;return}
		//	if(x.sp>p.spres){src<<"<b><font color = green>[x] is over your party's sp restriction.</font></b>";alertopen=0;return}
			if(!partydatum){src << "<b><i>You aren't in a party!";alertopen=0;return}
			switch(alert(x,"[src] wants you to join the party [p], will you join?","Join request","Yes","No"))
				if("Yes")
					if(!p){x<<"<b><font color = green>The party was recently disbanded before you hit join.</font></b>";return}
					if(x.partydatum){src << "<b><font color = green>[x] joined another party before waiting for your response.";alertopen=0;return}
					x.partydatum="pending"
					p.joinparty(x)
					x<<"<b><font color = green>Welcome to the party!</font></b>"
			//		x.owner=src.owner
				else
					src<<"<b><font color = green>[x] rejected your request.</font></b>"
			alertopen=0
		makeparty()
			set hidden=1
			if(alertopen)return
			var/party/p = new
			if(partydatum)   {src << "<b><i>You are already in a crew!";return}
			alertopen=1
			var/x=input(src,"What would you like to call the crew?","Party name")as text
			if(lentext(x)<3){src << "<b><i>Crew name too short. Please try again with a longer name.";alertopen=0;return}
			p.createparty(x,src)
			alertopen=0

		joinparty()
			set hidden=1
			if(alertopen)return
			if(partydatum=="pending")   {src << "<b><i>You are already pending for a party.";return}
			if(partydatum)   {src << "<b><i>You are already in a party!";return}
			alertopen=1
			var/thename=input(src,"Which party would you like to join?","Join party")as text
			if(!thename){alertopen=0;return}
			partydatum="pending"
			for(var/party/p in parties)
				if(ckey(p.name)==ckey(thename))
					p.requestjoin(src)
					alertopen=0
					return
			src << "<b><i>There are no parties matching your search."
			partydatum=null
			alertopen=0

		exitparty()
			set hidden=1
			if(alertopen)return
			if(!partydatum)  {src << "<b><i>You aren't in a party!";return}
			alertopen=1
			var/party/p=partydatum
			p.leaveparty(src)
			alertopen=0

		chatparty()
			set hidden=1
			if(!partydatum)  {src << "<b><i>You aren't in a party!";return}
			var/party/p=partydatum
			var/text=input(src,"Tell your party what?","Party Chat")as text
			p.partychat(src,text)

		breakparty()
			set hidden=1
			if(alertopen)return
			if(!partydatum)  {src << "<b><i>You aren't in a party!";return}
			var/party/p=partydatum
			if(p.leader!=src){src << "<b><i>You aren't the party leader!";return}
			p.breakparty()

		changeleaderparty()
			set hidden=1
			if(alertopen)return
			if(!partydatum)  {src << "<b><i>You aren't in a party!";return}
			var/party/p=partydatum
			if(p.leader!=src){src << "<b><i>You aren't the party leader!";return}
			alertopen=1
			var/mob/choice=input(src,"Who would you like to pass leadership onto?","Pass leader")in p.members-src+"Cancel"
			if(choice=="Cancel"){alertopen=0;return}
			if(!choice.partydatum){src <<"<b><font color = green>[choice] isn't currently in a party.";return}
			if(choice.partydatum!=partydatum)src <<"<b><font color = green>[choice] isn't currently in your party!"
			p.changeleader(choice)
			alertopen=0

		ejectparty()
			set hidden=1
			if(alertopen)return
			alertopen=1
			if(!partydatum)  {src << "<b><i>You aren't in a party!";return}
			var/party/p=partydatum
			if(p.leader!=src){src << "<b><i>You aren't the party leader!";return}
			var/mob/choice=input(src,"Who would you like to eject from your party?","Eject member")in p.members+"Cancel"-src
			if(choice=="Cancel")return
			if(!choice.partydatum){src <<"<b><font color = green>[choice] isn't currently in a party";return}
			if(choice.partydatum!=partydatum)src <<"<b><font color = green>[choice] isn't currently in your party!"
			p.ejectmember(choice)
			alertopen=0
//Leaving for the sake of not letting this code go to waste xDknub indeed..
