mob/var
	Organization=""
	OrganizationRank=""
	OrganizationID=0//10 ID Code



mob/proc/GiveOrganizationVerbs()
	if(!src.client)
		return
	if(src.OrganizationRank=="Lider"||src.OrganizationRank=="Co-Lider")
		src.verbs+=new/mob/Organization/Leader/verb/Announce()
		src.verbs+=new/mob/Organization/Leader/verb/SetRank()
	if(src.OrganizationRank=="Lider"||src.OrganizationRank=="Lider"||src.OrganizationRank=="Recruta")
		src.verbs+=new/mob/Organization/Leader/verb/Invite()
		src.verbs+=new/mob/Organization/Leader/verb/Boot()
	if(src.OrganizationRank=="Lider"||src.OrganizationRank=="Co-Lider"||src.OrganizationRank=="Recruta"||src.OrganizationRank=="Membro")
		src.verbs+=new/mob/Organization/Member/verb/Organization_Who()
		src.verbs+=new/mob/Organization/Member/verb/Organization_Say()
		src.verbs+=new/mob/Organization/Member/verb/Organization_Leave()
mob/Organization
	Leader
		verb
			Announce(msg as text)
				set name="Anunciar para Organização"
				set category = "Org"
				var/list/L = list("<")
				if(usr.ckey in MuteList)
					alert(usr,"Você esta mutado!");return
				for(var/H in L)
					if(findtext(msg,H))
						alert(usr,"Sem HTLM!");return
				if(length(msg)>=400)
					alert(usr,"Mensagem é Muito longa");return
				for(var/mob/M in world)
					if(M.Organization==src.Organization&&M.OrganizationID==src.OrganizationID)
						M<<"<font face=verdana><font size=2><b><center>Anuncio da organização:<center><font color=gray size = 2>[msg]</font>"
			SetRank()
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.Organization==src.Organization&&M.OrganizationID==src.OrganizationID)
						Menu.Add(M)
				var/mob/M = input("Quem você quer alterar o rank na Org?","Rank Org") as null | anything in Menu
				if(!M)return
				if(usr!=M&&M.OrganizationRank=="Lider")
					alert("Você não pode mudar o rank do Lider!");return
				var/NewRank=input(usr,"Você quer dar para [M]'s um Novo posto na Org?") in list("Lider","Co-Lider","Recruta","Membro","Cancelar")
				if(NewRank=="Lider"&&usr.OrganizationRank!="Lider")
					usr<<"Você não pode promover alguém a líder quando você não é o líder."
					return
				M.OrganizationRank=NewRank
				M.verbs-=/mob/Organization/Leader/verb/Invite;M.verbs-=/mob/Organization/Leader/verb/Boot
				M.verbs-=/mob/Organization/Leader/verb/SetRank;M.verbs-=/mob/Organization/Leader/verb/Announce
				M.verbs-=/mob/Organization/Member/verb/Organization_Leave;M.verbs-=/mob/Organization/Member/verb/Organization_Who;M.verbs-=/mob/Organization/Member/verb/Organization_Say
				M.GiveOrganizationVerbs()

			Invite(mob/M in world)
				set category = "Organization"
				set name = "Organization Invite"
				if(M.Organization!="")
					usr<<"[M] is already in an Organization.";return
				var/I = input(M,"Would you like to join [usr.Organization]?","Organization") in list("Yes","No")
				if(I=="Yes")
					M.Organization=usr.Organization;M.OrganizationID=usr.OrganizationID;M.OrganizationRank="Member"
					M.GiveOrganizationVerbs()
				if(I=="No")
					return
			Boot()
				set category="Organization"
				set name = "Organization Boot"
				var/list/Menu = list()
				for(var/mob/M in world)
					if(!M.client) continue
					if(M.key != usr.key)
						if(M.Organization==src.Organization&&M.OrganizationID==src.OrganizationID)
							Menu.Add(M)
				var/mob/M = input("Boot Who?","Organization Boot") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					if(M.OrganizationRank=="Leader")
						alert("You cannot boot the Leader!");return
					if(M.OrganizationRank=="Co-Leader"&&usr.rank!="Leader")
						alert("You don't have the authority to boot them!");return
					switch(alert("Would you like to Boot [M] from the Organization?","Organization Boot","Yes","No"))
						if("Yes")
							for(var/mob/X in world)
								if(X.Organization==src.Organization&&X.OrganizationID==src.OrganizationID)
									X << "<font color = #BB0EDA>Organization Information:</font> [M] has been Booted from the Organization!"
								M.Organization="";M.OrganizationRank="";M.OrganizationID=null
								M.verbs-=/mob/Organization/Leader/verb/Invite
								M.verbs-=/mob/Organization/Leader/verb/Boot
								M.verbs-=/mob/Organization/Leader/verb/SetRank
								M.verbs-=/mob/Organization/Leader/verb/Announce
								M.verbs-=/mob/Organization/Member/verb/Organization_Leave
								M.verbs-=/mob/Organization/Member/verb/Organization_Who
								M.verbs-=/mob/Organization/Member/verb/Organization_Say
						if("No")
							usr<<"You decided not to Boot [M]";return
	Member
		verb
			Organization_Leave()
				set category="Organization"
				switch(alert("Are you sure you'd like to leave the [usr.Organization] Organization?","Organization Boot","Yes","No"))
					if("Yes")
						for(var/mob/X in world)
							if(X.Organization==usr.Organization)//&&X.OrganizationID==usr.OrganizationID)
								X << "<font color = #BB0EDA>Organization Information:</font> [usr] has left the Organization!"
							usr.Organization="";usr.OrganizationRank="";usr.OrganizationID=null
							usr.verbs-=/mob/Organization/Leader/verb/Invite
							usr.verbs-=/mob/Organization/Leader/verb/Boot
							usr.verbs-=/mob/Organization/Leader/verb/SetRank
							usr.verbs-=/mob/Organization/Leader/verb/Announce
							usr.verbs-=/mob/Organization/Member/verb/Organization_Leave
							usr.verbs-=/mob/Organization/Member/verb/Organization_Who
							usr.verbs-=/mob/Organization/Member/verb/Organization_Say
					if("No")
						usr<<"You decided not to leave";return
			Organization_Who()
				set category="Organization"
				usr<<"<font color=#ffa500>Online [usr.Organization] Members -"
				for(var/mob/M in world)
					if(M.client&&M.Organization==src.Organization&&M.OrganizationID==src.OrganizationID)
						if(M:altername==null) usr<<"<font color=red>[M.FirstName]"
						else usr<<"<font color=red>[M:altername]"
			Organization_Say(msg as text)
				set category="Organization"
				var/list/L = list("<")
				if(usr.CantAlert)
					usr<<"You can't use this right now."
					return
				if(usr.ckey in MuteList)
					alert(usr,"You are muted!");return
				for(var/H in L)
					if(findtext(msg,H))
						alert(usr,"No HTML in text!");return
				if(length(msg)>=400)
					alert(usr,"Message is too long");return
				for(var/mob/M in world)
					if(M.client&&M.Organization==src.Organization&&M.OrganizationID==src.OrganizationID)
						M<<"<font size=2><font face=trebuchet MS><font color=#ffa500>(OrgSay)-(Rank:[usr.OrganizationRank]) <font size=1>[usr]<font color=#ffa500>: [msg]</font>"
mob/NPC
	Organization_Creator
		name="Organization Creator(NPC)"
		verb/Command()
			set src in oview(1)
			set name="Command"
			set hidden=1
			if(usr.Organization!="")
				usr<<"Ah, so I see you're in an Organization."
				if(usr.OrganizationRank=="Leader")
					switch(input(usr,"Would you like to set some settings.", text) in list ("Not in...LOL?","Cancel"))
						if("Not in...LOL?")
							usr<<"You're right...I really don't want to apply settings for your organization.";return
			switch(input(usr,"Would you like to start your own Organization? It's 10,000,000 Ryo.", text) in list ("Yes","No"))
				if("Yes")
					switch(input(usr,"Are you sure??",text) in list("Yes","No"))
						if("Yes")
							if(usr.Yen==10000000)
								usr.Yen-=10000000
								usr.Organization=input(usr,"What is your Organization Name?","Name")
						//		SetOrgID
								usr<<"Setting Organization ID..."
								usr.OrganizationID=rand(1,9999999999)
						//		for(var/mob/M in world)
						//			if(M.client&&M.OrganizationID==usr.OrganizationID)
						//				goto SetOrgID
								usr<<"Organization ID set."
								usr.OrganizationRank="Leader";usr.GiveOrganizationVerbs()
								usr<<"Saving...Do not log out.";usr.SaveK();usr<<"Saved."
							else
								usr<<"You don't have enough yen.";return