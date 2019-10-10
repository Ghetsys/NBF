var/list/tags = list("<font") // the list to ban html tags!
//////////////////////
//Do not touch the////
//Following code!/////
//////////////////////
client/var/
	const
		DENYMSG = "Foi negada a permissão a você de entrar, pois outra pessoa com o mesmo endereço IP éesta logado no servidor!"
		BOOTMSG = "Você foi bootado por usar duas contas no Ip!"
var/Banned_Ip_list[0]
var/log = 1
mob/proc/textfilter(T as text, var/list/L)
	for(var/O in L)
		if(findtext(T,O))
			return TRUE
mob/proc/spamcheck()
	if(src.spamcheck >= 5)
		return TRUE
	else
		src.spamcheck += 1
		spawn(10)
		src.spamcheck -= 1

proc/ipban(address)
	if(!Banned_Ip_list.Find(address) && address &&address!="localhost" &&address!="127.0.0.1")
		Banned_Ip_list.Add(address)



proc/scan(mob/M in world)
	var/mob/player
	for(player in world)
		if(player.client && player != M)
			return TRUE
			break
		else
			return
mob/proc/boot()
	del(src)
mob
	proc

		bannedwords()
			src << "Um administrador proibiu uma das palavras que você usou por algum motivo!"



mob/Admin
	verb
		Change_Icon(atom/M in world, arg as icon)
			set category = "Staff"
			set name = "Mudar Icone"
			M.icon = arg
		Change_Icon_State(mob/M in world, t as text)
			set category ="Staff"
			set name ="Mudar Icon state"
			var/answer = input(usr,"Mudar icon state para?") as text
			M.icon_state="[answer]"






mob/var/tried_to_repeat

var/Error_Message = "<tt><font color = red>"

client
	proc
		E_Spam(T)
			if(length(T) > 200) T = copytext(T, 1, 200) + " - - -"
			var/search = list("\n")
			for(var/c in search)
				var/pos = findtextEx(T,c)
				while(pos)
					T = "[copytext(T,1,pos)] [copytext(T,pos+1)]"
					pos = findtextEx(T,c,pos)

			T = html_encode(T)
			return T
/*var
	list
		profanity	 = list("Ass","Fuck","Bitch","Bastard","Niggar","Nigga")
		fix			 = list("***","****","*****","*******","******","*****")
#include <deadron/texthandling>
#include <deadron\test\Test.dme>
proc
	/*
	Use: scantext(textstring)
		Returns a filtered text string
		This is a fairly standard way to do it, there are probably more efficient ways out there but this works for me
	*/
	scantext(m as text)
		var/p
		m = " " + copytext(m,1) + " "
	// Profanity fixes
		// Scan through each of the words found in the profanity list and replace them
		// More checks can be added, see demo file for emoticons and slangs
		if(profanity.len)
			for(var/i=1,i<=profanity.len,i++)
				p = findtext(m,profanity[i])
				while(p)
					m = copytext(m,1,p) + fix[i] + copytext(m,p+length(profanity[i]))
					p = findtext(m,profanity[i])
		return m
proc
	wordfilter(m as text)
		var/temptext = m
		m = " [temptext] "

		var
			t = m
			removedl[0]
			removed[0]
			words = list("")

		for(var/w=1,w<=length(words),w++)
			var/f = findtext(t,words[w])

			while(f)

				removed += copytext(t,f,f+1)
				t = copytext(t,1,f) + copytext(t,f+1)
				var/next = findtext(t,words[w],f)
				for(var/a=1,a<=length(removedl),a++)
					if(removedl[a] <= f)
						f++
				removedl += f
				f = next
		m = t

	// Profanity
		if(profanity.len)
			for(var/p = 1, p <= length(profanity) , p++)
				m = dd_replacetext(m,profanity[p],fix[p])
		for(var/a=1,a<=length(removedl),a++)
			if(removedl[a] < length(m))
				m = copytext(m,1,removedl[a])+removed[a]+copytext(m,removedl[a])

	//Let's change i to I.
		m = dd_replaceText(m," i "," I ")*/