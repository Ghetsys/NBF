mob/owner/verb/ChangeTimeOfDay()
	set category="Commands"
	set name="Time Of Day Alteration"
	if(Night==1)
		Night=0
		NightCounter=0
		Morning=1
		usr<<"You change Night to Morning."
		return
	if(Morning==1)
		MorningCounter=0
		Morning=0
		Day=1
		DayCounter=1
		usr<<"You change Morning to Day."
		return
	if(Day==1)
		DayCounter=0
		Day=0
		Night=1
		NightCounter=1
		usr<<"You change Day to Night."
		return
var
	Night=0
	TrueNight=0
	Morning=1
	Day=0
	DayCounter=0
	NightCounter=0
	MorningCounter=0

var/list
	OutsideMaps=list("2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","23","24","25","26","27","28","31","36","37")
	MapWeathers=list()

mob/var/tmp/WeatherSeen

//rain, blizzard, lightning perhaps?, hail, snow, and as a special, lava hail...

obj/Weather
	layer = 99
	screen_loc = "1,1 to 19,19"
	HeavyRain
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "heavyrain"

	Blizzard
		icon = 'Icons/Jutsus/GenjutsuTechniques.dmi'
		icon_state="Blizzard"
	HeavySnow
//		icon = 'Map/Turfs/Landscapes.dmi'
//		icon_state = "heavysnow"
//		icon = 'Map/Turfs/Landscapes.dmi'
//		icon_state = "heavysnow2"
		icon = 'Map/Turfs/FallenSnow.dmi'
		icon_state = "Heavy"
	Snow
	//	icon = 'Map/Turfs/Landscapes.dmi'
	//	icon_state = "snow"
//		icon = 'Map/Turfs/Landscapes.dmi'
//		icon_state = "snow2"
		icon = 'Map/Turfs/FallenSnow.dmi'
		icon_state = "Heavy"
	Rain
		icon = 'Map/Turfs/Landscapes.dmi'
		icon_state = "rain"
	LightningFlash
		icon = 'LightningFlash.dmi'
		icon_state = "Flash"
obj/DayAndNight
	layer=7
	screen_loc= "1,1 to 19,19"
	mouse_opacity=0
	HeavyRainOverlay
		icon='Code/Techniques/shading.dmi'
		icon_state="WeakRain"
	LittleLight //Used to represent the sun just coming up
		icon='Icons/Hud/Dawn2.dmi'
		icon_state="Dawn"
	Light
		icon='Icons/Hud/Dawn.dmi'
		icon_state="Dawn"
	Light2
		icon='Icons/Hud/DawnChange.dmi'
		icon_state="Dawn"
	Night
		layer=98
		icon='Code/Techniques/shading.dmi'
		icon_state="weaker"//was "weak"
	TrueNight
		icon='Code/Techniques/shading.dmi'
		icon_state="strong"
world/proc
	createLightning()
		spawn()
			while(1)
				sleep(rand(250,500))
				if(prob(70))
					for(var/mob/M in OnlinePlayers)
						if(MapWeathers["[M.z]"] == "Heavy Rain")
							var/obj/Weather/LightningFlash/R = new();M.client.screen += R
							spawn(10+(rand(0,15)))
								M.client.screen-=R
				if(prob(40))
				//	world<<"A lightning bolt has struck the earth!"
					for(var/mob/M in OnlinePlayers)
						if(MapWeathers["[M.z]"] == "Heavy Rain")

							//rand(M.x-7,M.x+7)			within a range of 7 tiles,
							//max(rand(M.x-7,M.x+7),1)			1 is the lowest
							//min(max(rand(M.x-7,M.x+7),1),world.maxx)	world.maxx is the highest it can go.
					//		M.LightningFadeEffect()
						//	M.WeatherFadeScreen()
							var/obj/Weather/LightningFlash/R = new();M.client.screen += R
							spawn(15+(rand(5,10)))
								M.client.screen-=R
							var/Rand=pick(1,2)
							if(Rand==1)
								M<<sound('SFX/ThunderStrike1.wav',0,0,7,90)
							else
								M<<sound('SFX/ThunderStrike2.wav',0,0,7,90)
							Lightning(locate(min(max(rand(M.x-7,M.x+7),1),world.maxx),min(max(rand(M.y-7,M.y+7),1),world.maxy),M.z))
							break
						if(MapWeathers["[M.z]"] == "Rain")
							if(prob(25))
								//rand(M.x-7,M.x+7)			within a range of 7 tiles,
								//max(rand(M.x-7,M.x+7),1)			1 is the lowest
								//min(max(rand(M.x-7,M.x+7),1),world.maxx)	world.maxx is the highest it can go.
						//		M.LightningFadeEffect()
							//	M.WeatherFadeScreen()
								var/obj/Weather/LightningFlash/R = new();M.client.screen += R
								spawn(10+(rand(5,7)))
									M.client.screen-=R
								var/Rand=pick(1,2)
								if(Rand==1)
									M<<sound('SFX/ThunderStrike1.wav',0,0,7,90)
								else
									M<<sound('SFX/ThunderStrike2.wav',0,0,7,90)
								Lightning(locate(min(max(rand(M.x-7,M.x+7),1),world.maxx),min(max(rand(M.y-7,M.y+7),1),world.maxy),M.z))
								break

mob/proc/WeatherFadeScreen()
	var/obj/HUD/Fade/f = new //creates HUD
	if(client)
		client.screen+=f
		f.icon_state="out fast"
		sleep(2)//sleep(7)
		flick("in fast",f)
		spawn(1)//spawn(6)
			f.icon_state=""
			sleep(1)//sleep(2)
			client.screen-=f
	.=..()
world/proc
	setWeatherLoop()
		set background=1
	//	spawn(450)
	//		world<<"The proc has been called."
	//		world.log<<"The proc has been called."
	//	world.log<<"Seems legit."
		if(Morning==1)
			Morning=0
			for(var/mob/M in OnlinePlayers)
				M.client.screen-=/obj/DayAndNight/LittleLight
			Day=1
		else if(Day==1)
			DayCounter++
			if(DayCounter>3)
				DayCounter=0
				Day=0
				Night=1
		else if(Night==1)
			NightCounter++
			if(NightCounter>2)
				NightCounter=0
				Night=0
				Morning=1
				for(var/mob/M in OnlinePlayers)
					M.client.screen-=/obj/DayAndNight/Night

		for(var/MAP in OutsideMaps)
			spawn()
	//			while(1)
				if(MAP == "2")
			//		world<<"Test"
					MapWeathers[MAP] = pick(prob(65);"None",prob(15);"Heavy Rain",prob(5);"Snow",prob(15);"Rain")
				if(MAP == "3")
					MapWeathers[MAP] = pick(prob(70);"None",prob(25);"Rain",prob(5);"Snow")
				if(MAP == "4")
					MapWeathers[MAP] = pick(prob(70);"None",prob(18);"Rain",prob(10);"Heavy Rain",prob(7);"Snow",prob(5);"Heavy Snow")
				if(MAP == "5")
					MapWeathers[MAP] = pick(prob(55);"None",prob(5);"Heavy Rain",prob(15);"Snow",prob(25);"Heavy Snow")
				if(MAP == "6")
					MapWeathers[MAP] = pick(prob(20);"None",prob(50);"Rain",prob(30);"Heavy Rain")
				if(MAP == "7")
					MapWeathers[MAP] = pick(prob(50);"None",prob(50);"Rain")
				if(MAP in list("8","9"))
					MapWeathers[MAP] = "None"
				if(MAP == "10")
					MapWeathers[MAP] = pick(prob(25);"None",prob(45);"Rain",prob(20);"Heavy Rain",prob(10);"Snow")
				if(MAP == "11")
					MapWeathers[MAP] = pick(prob(65);"None",prob(15);"Rain",prob(15);"Heavy Rain",prob(5);"Snow")
				if(MAP == "12")
					MapWeathers[MAP] = pick(prob(80);"None",prob(10);"Heavy Rain",prob(10);"Rain")
				if(MAP == "13")
					MapWeathers[MAP] = pick(prob(80);"None",prob(15);"Heavy Rain",prob(5);"Snow")
				if(MAP == "14")
					MapWeathers[MAP] = pick(prob(65);"None",prob(20);"Snow",prob(15);"Heavy Snow")
				if(MAP == "15")
					MapWeathers[MAP] = pick(prob(50);"Heavy Rain",prob(50);"Rain")
				if(MAP == "16")
					MapWeathers[MAP] = pick(prob(10);"Heavy Snow",prob(40);"Rain",prob(50);"Heavy Rain")
				if(MAP in list("17","18"))
					MapWeathers[MAP] = "None"
				if(MAP == "19")
					MapWeathers[MAP] = pick(prob(50);"None",prob(20);"Heavy Rain",prob(30);"Snow")
				if(MAP == "23")
					MapWeathers[MAP] = "None"
				if(MAP == "24")
					MapWeathers[MAP] = pick(prob(60);"None",prob(25);"Heavy Rain",prob(15);"Rain")
				if(MAP == "25")
					MapWeathers[MAP] = pick(prob(60);"None",prob(25);"Rain",prob(10);"Heavy Rain",prob(5);"Snow")
				if(MAP == "26")
					MapWeathers[MAP] = pick(prob(10);"None",prob(45);"Rain",prob(45);"Heavy Rain")
				if(MAP == "27")
					MapWeathers[MAP] = "None"
				if(MAP == "28")
					MapWeathers[MAP] = pick(prob(20);"None",prob(65);"Rain",prob(15);"Heavy Rain")
				if(MAP == "31")
					MapWeathers[MAP] = pick(prob(50);"None",prob(40);"Rain",prob(10);"Snow")
				if(MAP == "36")
					MapWeathers[MAP] = pick(prob(55);"None",prob(20);"Rain",prob(25);"Snow")
				if(MAP == "37")
					MapWeathers[MAP] = "Rain"
						//chances at different weathers and such
			//		world.log << "Map [MAP] was set to [MapWeathers[MAP]]"
//	/ 			sleep()
		spawn(rand(27000,36000)) world.setWeatherLoop()


mob/proc/CheckWeather()//Have this be called in the check proc
//	src<<"The number of Weather Maps inside the Outside maps List is [OutsideMaps.len]."
//	src<<"This is the weather that you should be seeing [src.WeatherSeen] ([MapWeathers["[src.z]"]])"
	if(src.key=="The Jefferson")
		return
	if(!("[src.z]" in OutsideMaps))
//		src<<"Your map location [src.z] doesn't match."
		if(src.WeatherSeen)
			for(var/obj/Weather/W in src.client.screen)
				del(W)
			for(var/obj/DayAndNight/W in src.client.screen)
				del(W)
			src.WeatherSeen = "Test"
		return
	if(src.WeatherSeen != MapWeathers["[src.z]"])
		src.WeatherSeen = MapWeathers["[src.z]"]
		for(var/obj/Weather/W in src.client.screen)
			del(W)
		if(Night==1)
			if(!(locate(/obj/DayAndNight/Night) in src.client.screen))
				var/obj/DayAndNight/Night/R = new();src.client.screen += R
			//	var/obj/DayAndNight/HeavyRainOverlay/P = new();src.client.screen += P
		if(Morning==1)
			if(!(locate(/obj/DayAndNight/LittleLight) in src.client.screen))
				var/obj/DayAndNight/LittleLight/R = new();src.client.screen += R
		if(src.WeatherSeen=="Heavy Rain")
			if(!(locate(/obj/Weather/HeavyRain) in src.client.screen))
				var/obj/Weather/HeavyRain/R = new();src.client.screen += R
		//	var/obj/DayAndNight/HeavyRainOverlay/P = new();src.client.screen += P
			if(src.CurrentMission=="Find Heavy Rain Climate"||src.CurrentMission=="Find Rain Climate")
				src.MissionComplete()
		if(src.WeatherSeen=="Heavy Snow")
			if(!(locate(/obj/Weather/HeavySnow) in src.client.screen))
				var/obj/Weather/HeavySnow/R = new();src.client.screen += R
		if(src.WeatherSeen=="Rain")
			if(!(locate(/obj/Weather/Rain) in src.client.screen))
				var/obj/Weather/Rain/R = new();src.client.screen += R
			if(src.CurrentMission=="Find Rain Climate"||src.CurrentMission=="Find Heavy Rain Climate")
				src.MissionComplete()
		if(src.WeatherSeen=="Snow")
			if(!(locate(/obj/Weather/Snow) in src.client.screen))
				var/obj/Weather/Snow/R = new();src.client.screen += R
		if(src.WeatherSeen=="Blizzard")
			var/obj/Weather/Blizzard/R = new();src.client.screen += R
		if(src.WeatherSeen=="None")
			return











/* sd_Alert( notes

/* sd_Alert library
	by Shadowdarke (shadowdarke@byond.com)

	sd_Alert() is a powerful and flexible alternative to the built in BYOND
	alert() proc. sd_Alert offers timed popups, unlimited buttons, custom
	appearance, and even the option to popup without stealing keyboard focus
	from the map or command line.

	Please see demo.dm for detailed examples.

FORMAT
	sd_Alert(who, message, title, buttons, default, duration, unfocus, \
		size, table, style, tag, select, flags)

ARGUMENTS
	who			- the client or mob to display the alert to.
	message		- text message to display
	title		- title of the alert box
	buttons		- list of buttons
					Default Value: list("Ok")
	default		- default button selestion
					Default Value: the first button in the list
	duration	- the number of ticks before this alert expires. If not
					set, the alert lasts until a button is clicked.
					Default Value: 0 (unlimited)
	unfocus		- if this value is set, the popup will not steal keyboard
					focus from the map or command line.
					Default Value: 1 (do not take focus)
	size		- size of the popup window in px
					Default Value: "300x200"
	table		- optional parameters for the HTML table in the alert
					Default Value: "width=100% height=100%" (fill the window)
	style		- optional style sheet information
	tag			- lets you specify a certain tag for this sd_Alert so you may manipulate it
					externally. (i.e. force the alert to close, change options and redisplay,
					reuse the same window, etc.)
	select		- if set, the buttons will be replaced with a selection box with a number of
					lines displayed equal to this value.
					Default value: 0 (use buttons)
	flags		- optional flags effecting the alert display. These flags may be ORed (|)
					together for multiple effects.
						SD_ALERT_SCROLL			= display a scrollbar
						SD_ALERT_SELECT_MULTI	= forces selection box display (instead of
													buttons) allows the user to select multiple
													choices.
						SD_ALERT_LINKS			= display each choice as a plain text link.
													Any selection box style overrides this flag.
						SD_ALERT_NOVALIDATE		= don't validate responses
					Default value: SD_ALERT_SCROLL
						(button display with scroll bar, validate responses)
RETURNS
	The text of the selected button, or null if the alert duration expired
	without a button click.

Version 1 changes (from version 0):
* Added the tag, select, and flags arguments, thanks to several suggestions from Foomer.
* Split the sd_Alert/Alert() proc into New(), Display(), and Response() to allow more
	customization by developers. Primarily developers would want to use Display() to change
	the display of active tagged windows

*/


#define SD_ALERT_SCROLL			1
#define SD_ALERT_SELECT_MULTI	2
#define SD_ALERT_LINKS			4
#define SD_ALERT_NOVALIDATE		8

proc/sd_Alert(client/who, message, title, buttons = list("Ok"),\
	default, duration = 0, unfocus = 1, size = "300x200", \
	table = "width=100% height=100%", style, tag, select, flags = SD_ALERT_SCROLL)

	if(ismob(who))
		var/mob/M = who
		who = M.client
	if(!istype(who)) CRASH("sd_Alert: Invalid target:[who] (\ref[who])")

	var/sd_alert/T = locate(tag)
	if(T)
		if(istype(T)) del(T)
		else CRASH("sd_Alert: tag \"[tag]\" is already in use by datum '[T]' (type: [T.type])")
	T = new(who, tag)
	if(duration)
		spawn(duration)
			if(T) del(T)
			return
	T.Display(message,title,buttons,default,unfocus,size,table,style,select,flags)
	. = T.Response()

sd_alert
	var
		client/target
		response
		list/validation

	Del()
		target << browse(null,"window=\ref[src]")
		..()

	New(who, tag)
		..()
		target = who
		src.tag = tag

	Topic(href,params[])
		if(usr.client != target) return
		response = params["clk"]

	proc/Display(message,title,list/buttons,default,unfocus,size,table,style,select,flags)
		if(unfocus) spawn() target << browse(null,null)
		if(istext(buttons)) buttons = list(buttons)
		if(!default) default = buttons[1]
		if(!(flags & SD_ALERT_NOVALIDATE)) validation = buttons.Copy()

		var/html = {"<head><title>[title]</title>[style]<script>\
		function c(x) {document.location.href='BYOND://?src=\ref[src];'+x;}\
		</script></head><body onLoad="fcs.focus();"\
		[(flags&SD_ALERT_SCROLL)?"":" scroll=no"]><table [table]><tr>\
		<td>[message]</td></tr><tr><th>"}

		if(select || (flags & SD_ALERT_SELECT_MULTI))	// select style choices
			html += {"<FORM ID=fcs ACTION='BYOND://?' METHOD=GET>\
				<INPUT TYPE=HIDDEN NAME=src VALUE='\ref[src]'>
				<SELECT NAME=clk SIZE=[select]\
				[(flags & SD_ALERT_SELECT_MULTI)?" MULTIPLE":""]>"}
			for(var/b in buttons)
				html += "<OPTION[(b == default)?" SELECTED":""]>\
					[html_encode(b)]</OPTION>"
			html += "</SELECT><BR><INPUT TYPE=SUBMIT VALUE=Submit></FORM>"
		else if(flags & SD_ALERT_LINKS)		// text link style
			for(var/b in buttons)
				var/list/L = list()
				L["clk"] = b
				var/html_string=list2params(L)
				var/focus
				if(b == default) focus = " ID=fcs"
				html += "<A[focus] href=# onClick=\"c('[html_string]')\">[html_encode(b)]</A>\
					<BR>"
		else	// button style choices
			for(var/b in buttons)
				var/list/L = list()
				L["clk"] = b
				var/html_string=list2params(L)
				var/focus
				if(b == default) focus = " ID=fcs"
				html += "<INPUT[focus] TYPE=button VALUE='[html_encode(b)]' \
					onClick=\"c('[html_string]')\"> "

		html += "</th></tr></table></body>"

		target << browse(html,"window=\ref[src];size=[size];can_close=0")

	proc/Response()
		var/validated
		while(!validated)
			while(target && !response)	// wait for a response
				sleep(2)

			if(response && validation)
				if(istype(response, /list))
					var/list/L = response - validation
					if(L.len) response = null
					else validated = 1
				else if(response in validation) validated = 1
				else response=null
			else validated = 1
		spawn(2) del(src)
		return response

mob/Login()
	..()
	spawn(5)
		if(sd_Alert(src, "Would you like to go through an automated tour of \
		sd_Alert features?<p>All of these demo sd_Alerts are available \
		through the demo commands.","Automated sd_Alert Tour", \
		list("Yes","No")) == "Yes")
			ok()
			many()
			symbols()
			timed()
			table()
			styled()
			select()
			converse()
			multiselect()
			sd_Alert(src, "Thanks for trying sd_Alert by Shadowdarke. If you have any comments \
				or suggestions, please post them on my \
				<a href=http://shadowdarke.byond.com/forum/forum.cgi?forum=3 target=_new>\
				library forum</a>.","Thanks! Enjoy sd_Alert!",list("Happy Alerting!"))

mob/verb
	converse()
		var/list/buttons = list("What was your relationship with Mr. Body.", \
			"Where were you at the time of the murder?", "You have lovely eyes.", \
			"Goodbye.")
		sd_Alert(src, "This sd_Alert uses plain text links with a little CSS to make it more \
			attractive.", "Text Link Style", buttons, pick(buttons),0,0,"600x200",,\
			"<STYLE>TH {text-align:left} A{text-decoration:none} A:hover{background:cyan}\
			</STYLE>",,,SD_ALERT_LINKS)

	ok()
		sd_Alert(src, "This is the default \"Ok\" button alert, called \
		with just three proc arguments.", "Default Ok Alert")

	many()
		var/list/buttons = list("You", "will", "probably", "never", "need",\
			"this", "many", "buttons", "in", "any", "of", "your", \
			"projects,", "but", "sd_Alert", "can", "handle", "these", \
			"and", "more", "if", "you", "do", "want", "so", "many.")
		sd_Alert(src, "This alert has dozens of buttons. sd_alert can set \
			any one of them as the default.", "Many Buttons", buttons, \
			pick(buttons),0,0,"600x200")

	multiselect()
		var/list/buttons = list("Selection 1", "Selection 2", "Selection 3", "Selection 4")
		sd_Alert(src, "This sd_Alert allows you to choose multiple items by hold CTRL as you \
			click them.", "Multiple Selection Style", buttons, \
			pick(buttons),0,0,"600x200",,,,4,SD_ALERT_SELECT_MULTI)

	select()
		var/list/buttons = list("Selection 1", "Selection 2", "Selection 3", "Selection 4")
		sd_Alert(src, "This is a selection style sd_Alert that displays your choices as a \
			selection box.", "Selection Style", buttons, \
			pick(buttons),0,0,"600x200",,,,1)

	styled()
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
			color:white;} TABLE {background:#CCCCCC} TD {background:#000033}\
			</style>"
		sd_Alert(src, "sd_Alerts even support custom style sheets. In \
		conjunction with the table options, you have complete control of \
		the appearance of sd_Alerts.","Style Sheet",,,,0,"400x150",,style)

	symbols()
		var/A = sd_Alert(src, "sd_Alert, though HTML based, can handle \
			symbols and spaces in your button names. It even supports \
			linebreaks which the standard alert() proc can not.", \
			"Symbol Test", list("@$%^$#!'=",\
			"multi-\nline\nbutton"))
		src << "You chose '[A]'."

	table()
		sd_Alert(src, "You may customize the table settings settings of \
		sd_Alerts to help customize the look.<p>This one even has a \
		javasript when you pass the mouse over it!","Table options",,,,0,\
		,"align=center border=1 cellspacing=0 \
		onMouseOver=\"bgColor='#ffff00'\" onMouseOut=\"bgColor='#ffffff'\"")

	tagged()
		sd_Alert(src, "This is a tagged alert, which means other procs may manipulate the \
			alert. Try the tagged_delete and tagged_update commands.<p>No matter how many \
			times you use this command, there will only be one sd_Alert at a time with this \
			tag. New ones will cause the old one to close with a null response.", "Tagged \
			Alert",,,,0,"300x300",,,"tagged")

	tagged_delete()
		var/sd_alert/A = locate("tagged")
		if(A) del(A)

	tagged_update()
		var/sd_alert/A = locate("tagged")
		if(A)
			A.Display("BYOND found the old alert and displayed this in its window. The \
			original proc is still waiting for its return value, but we changed the message \
			and updated the buttons.","Updated Tagged Alert",list("Ok","Another Option"),,0)
		else
			sd_Alert(src, "The tagged alert has already been closed. We'll open a new one.", \
				"New Tagged Alert",,,,0,,,,"tagged")


//sd_Alert(who, message, title, buttons, default, duration, unfocus, \
		size, table, style, tag, select, flags)

	timed()
		var/A = sd_Alert(src, "This alert will disappear in 20 seconds if \
			you don't click a button.", "Timed", , ,200,0)
		if(!A)
			src << "Time is up!"
		else
			src << "You clicked the Ok button! This was supposed to be a \
				timed alert test."

	unfocus()
		sd_Alert(src,"The worst thing about the bult in alert() command is \
		that is steals keyboard focus away from the map and command line. \
		If you are running from an enemy and get an alert, you're as good \
		as dead.<p>sd_Alerts give you the option to \"unfocus\" the alert. \
		That means the program displays your message without stealing \
		keyboard focus. This is an example of an unfocused sd_Alert. Go \
		ahead, type away on the command line and see. </small>","\"Unfocus\" alert"\
		,,,,,"600x300")
		*/
