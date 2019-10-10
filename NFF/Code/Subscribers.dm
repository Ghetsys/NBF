var/list/Subscribers=list()//Need to make this a list that is added to a file on the server and stores keys of subscribers and we will have to manually add the keys to it
mob/var/Subscriber=0
mob/var/ProSubscriber=0//Not sure but you can do this if you want to do something like how some companies do: Different levels of subscribtion such as Bronze, Silver, Gold, Platinum
mob/var/SubscriberTime=0//This will go up every once per age. It will show how long someone has been a subscriber by in game years
mob/var/tmp/HearMP3=0
proc //God this loading properly.
	SaveSubscriberStuff()
		var/savefile/F = new("World Save Files/Subscribers.sav")
		F["Subscribers"] << Subscribers
	LoadSubscriberStuff()
		world.log<<"Loaded Subscriber stuff."
		if(fexists("World Save Files/Subscribers.sav"))
			var/savefile/F = new("World Save Files/Subscribers.sav")
			F["Subscribers"]>>Subscribers
mob/Subscriber/verb/ToggleMp3()
	set name="Mute Mp3"
	text2file("(((((SPY)))))[time2text(world.timeofday/600)]:[usr] ([usr.key]) ([usr.client.computer_id] [usr.client.address]) used ToggleMp3 Verb","GM LOG.txt")
	if(usr.HearMP3)
		usr.HearMP3=0
		usr<<"You will now hear mp3s that are played with the mp3 verb."
	else
		usr.HearMP3=1
		usr<<"Mp3s that are played through with the mp3 verb are now muted to you and are silent."
mob/owner/verb/MakeSubscriberList() //This is if you want to manually add them to the list
	set category="Staff"
	alert(usr,"This is used to make someone a Subscriber Status on the Automated List Manually. Place their key information to register them as a Subscriber.")
	var/Subscribing=input(usr,"Type the name of the Key that you would like to make a subscriber. CASE SENSITIVE") as text
	if(locate(Subscribing) in Subscribers)
		usr<<"This key is already registered as a subscriber!"
		return
	Subscribers+=Subscribing
	usr<<"You have added the key [Subscribing] to the Subscribers list!"
mob/owner/verb/CheckSubscribers()
	set category="Staff"
	usr<<"This is the list of current Subscribers of Naruto Final Fight."
	usr<<"There are currently [Subscribers.len] Subscribers."
	var/i
	for(i=1,i<=Subscribers.len,i++)
		var/p=Subscribers[i]
		usr<<"[p] = [Subscribers[p]]"

mob/owner/verb/RemoveSubscription(mob/M in world)
	set category="Staff"
	var/Subscribed=M.key
	if(Subscribed in Subscribers)
		Subscribers-=Subscribed
	M.Subscriber=0
	M.SaveK()
	M<<"You have lost your Naruto Final Fight Subscription."
	usr<<"You have removed [M]'s Naruto Final Fight Subscription."
mob/owner/verb/MakeSubscriber(mob/M in world)
	set category="Staff"
	if(!M.client)
		usr<<"[M] isn't a player!"
		return
	if(!M.Subscriber)
		M.Subscriber=1
		M<<"You are now a subscriber of Naruto Final Fight! Thanks for supporting the game!"
		usr<<"[M] is now a Subscriber of Naruto Final Fight!"
		var/Subscribed=M.key
		if(!(locate(Subscribed in Subscribers)))
			Subscribers+=Subscribed
		M.SaveK()
	else
		usr<<"[M] is already a subscriber!"
mob/owner/verb/SaveSubscriptions()
	set category="Staff"
	SaveSubscriberStuff()
	usr<<"Subscriber stuff has been saved!"
//////////////////////////////////////
////////////Stuff done so Far/////////
//////////////////////////////////////
/*

 - When making a new Character as a subscriber you get 3 EXP+CD scrolls and 2 knowledge scrolls along with 150k yen (You can adjust these as you see fit Argon)

 - If you're a subscriber you can Import Byond Icons (So can Byond Members)

 - If you're a subscriber EXP Rate for most things in general has a slight increase to make things train slightly faster. (Argon look at this to see if you want to make it better)

 - If you're a subscriber Jutsu CD goes down just a little bit faster however the most noticable Jutsu CD that subscribers recieve is by doing active things such as killing people to lower CD. etc

 - Can get Subscribers to test the Bow and Arrow that I coded at some point in time

 - Can get Suscribers to test the Kunai Exploding Bomb that was coded at some point in time

 - Subscribers have a higher chance to successfully get Cursed Seal/Hydro Mode without getting wiped and Subscribers have a higher chance to get Hell Cursed Seal

 - Subscribers have a higher chance to get Mangekyou Sharingan on an Uchiha

 - Subscribers can toggle whether or not they want to hear the Mp3 Verb

 - Akimichis have a higher chance to get Gluttony and Aburames have a higher chance to get Nanos.

 - Subscribers that create an Shiroi or Kusakin don't lose the 10 Elemental Points at start for auto being born with their elements

 - Subscribers can automatically rebirth at age 75 instead of waiting until their death age if they want and if they choose not to it will ask again at age 80 to see if they have changed their mind

 - Subscribers can purchase Range Extenders and old NFF capes from Merchants

 - Subscribers can test the Paper Person Technique now added for Paper Style

*/


//////////////////////////////////////
///////////////////////Ideas//////////
//////////////////////////////////////
/*

[7:37:09 PM] Sasuna .: I can already think of a few things
[7:37:11 PM] Sasuna .: off the top of my head
[7:37:34 PM] Sasuna .: -500/1000 Ninjutsu Knowledge needed to get Sage mode
-15-20% less chance to get wiped by Cursed Seal...eh...
[7:37:35 PM] Sasuna .: still thiknin
[7:37:37 PM] Sasuna .: but yh u get dis
[7:37:47 PM] K.J.: yeah.
[7:37:47 PM] K.J.: hm
[7:37:50 PM] K.J.: enhanced MS chance?
[7:37:54 PM] K.J.: or 2op?
[7:37:58 PM] K.J.: Like
[7:38:07 PM] Sasuna .: Yes.
[7:38:09 PM] Sasuna .: That's nice.
[7:38:10 PM] Sasuna .: OH and
[7:38:11 PM] K.J.: Guarenteed CS/MS/al clan specials
[7:38:12 PM] Sasuna .: Idk maybe like
[7:38:15 PM] Sasuna .: Actually yes
[7:38:16 PM] Sasuna .: That's pro lol
[7:38:17 PM] K.J.: But not the reqs
[7:38:18 PM] Sasuna .: I like that
[7:38:22 PM] Sasuna .: That's nice.
[7:38:22 PM] K.J.: ^_^
[7:38:26 PM] Sasuna .: Maybe also like
[7:38:32 PM] Sasuna .: static +15-20% EXP increase?
[7:38:37 PM] Sasuna .: like when training
[7:38:38 PM] Sasuna .: etc
[7:38:39 PM] Sasuna .: etc

*/