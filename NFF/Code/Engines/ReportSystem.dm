var
	list/reports=list()
	number = 0
proc/Reports(type)
	switch(type)
		if("Load") if(fexists("ReportFile.sav"))
			var/savefile/E = new ("ReportFile.sav")
			E["reports"] >> reports
			E["number"] >> number
	//		world<<"Reports Loaded"
			if(!reports) reports=list()
		if("Save")
			var/savefile/E = new ("ReportFile.sav")
			E["reports"] << reports
			E["number"] << number
	//		world<<"Reports Saved."
//world/New()
//	Reports("Load")
//world/Del()
//	Reports("Save")

mob/owner
	verb
		View_Reports()
			if(src.key!="Lui12"||usr.key=="Ruusaku")
				src<<"Sua tentativa de visualizar este foi registado.";return
			winshow(src,"reportviewing",1)
		View()
			set name = ".Ver"
			if(src.key!="Lui12"||usr.key=="Ruusaku")
				src<<"Sua tentativa de visualizar este foi registado.";return
			var/br={"<html><body>"}
			var/dr={"</body></html>"}
			if(!reports.len)
				br+="Não existe relatorios aqui!"
			else
				var/X=input("Qual o relatório que gostaria de Rever?","Rever Relatorio") as null|anything in reports
				if(!X) return
				var/Reports/M = reports[X]
				for(var/x in M.vars -vars)
					br += "<br>[x] = [M.vars[x]]"
				winset(src, "reportviewing.viewing", "text=\"[M.NameID]\"")
			br+=dr
			src << browse(br,"window=reportbrowser")
			winset(src, "loadv", "text=")
		/*Delete_Reports(X in reports+"All")
			if(X=="All")
				for(var/x in reports)
					reports -= x
					global.number = 0
			else
				reports -= X */
		delete()
			set name = ".Deletar"
			if(src.key!="Lui12"||usr.key=="Ruusaku")
				src<<"Sua tentativa de visualizar este foi registado.";return
			if(usr.key!="Lui12"||usr.key=="Ruusaku")
				src<<"Sua tentativa de visualizar este foi registado.";return
			var/m=winget(src,"reportviewing.viewing","text")
			if(m in reports)
				if(alert("em certeza de que deseja excluir este relatório?","Delete this report","Sim","Não")=="Sim")
					winset(src, "loadv", "text=\"Deleting [m]...\"")
					var/Reports/M = reports[m]
					reports -= m
					del M
					src << browse(null,"window=reportbrowser")
					winset(src, "reportviewing.viewing", "text=\"O relatorio foi excluido!\"")
					winset(src, "loadv", "text=\"Deleted [m]!\"")
		deleteall()
			set name = ".Deletar Todos"
			if(alert("Você quer deletar todos os relatorios?","Deletar Todos Relatorios","Sim","Não")=="Sim")
				winset(src, "loadv", "text=\"Deleting all reports...\"")
				for(var/x in reports)
					reports -= x
					global.number = 0
				src << browse(null,"window=reportbrowser")
				winset(src, "reportviewing.viewing", "text=\"Todos os relatorios foram deletados!\"")
				winset(src, "loadv", "text=\"Deleted all reports!\"")
mob/var/tmp/SentReport=0
mob
	verb
		Report()
			set name = "Mandar Relatorio"
			set category = "Comandos"
			if(winget(client,"report","is-visible")=="false")
				winset(client,"report.key","text=\"[src.key]\"")
				winset(client,"report.ip","text=\"[src.client.address?src.client.address :(world.internet_address?world.internet_address :world.address)]\"")
				winset(client,"report.id","text=\"[src.client.computer_id]\"")
				winshow(client,"report",1)

		submit()
			set name = ".Mandar"
			if(src.SentReport>0)
				src<<"É muito cedo para enviar outro relatório!"
			//	spawn(10)
			//		winset(src, null, "command=.quit")
				return
			winset(src,"report.load","text=Submitting...;is-visible=true")
			if((src.Check(2))==FALSE)
				src.Check(1)
				return
			var/names = winget(src,"report.name","text")
			var/descs = winget(src,"report.desc","text")
			if(winget(src,"report.bug","is-checked")=="true")
				winset(src,"report.selected","text=Bug")
			else if(winget(src,"report.suggestion","is-checked")=="true")
				winset(src,"report.selected","text=Suggestion")
			else if(winget(src,"report.fix","is-checked")=="true")
				winset(src,"report.selected","text=Fix")
			var/types = winget(src,"report.selected","text")
			var/ip = "[src.client.address?src.client.address :(world.internet_address?world.internet_address :world.address)]"
			var/Reports/x = new(src.key,ip,src.client.computer_id,types,names,descs)
			if(x&&(x.NameID in reports))
				winset(src,"report.name","background-color=#fff")
				winset(src,"report.desc","background-color=#fff")
				winset(src,"report.load","text=Submitted!")
				src.SentReport=60
		clear()
			set name = ".Excluir"
			src.clearfields()
		clearv()
			set name = ".Excluir Vizualização"
			src.clearviewr()
	proc
		clearfields()
			winset(src,"report.bug","is-checked=true")
			winset(src,"report.Name","text=;background-color=#fff")
			winset(src,"report.desc","text=;background-color=#fff")
			winset(src,"report.selected","text=")
			winset(src,"report.load","text=")
		clearviewr()
			winset(src,"reportviewing.viewing","text =\"Clique em Exibir relatórios para ver a lista de relatórios!\"")
			src << browse(null,"window=reportbrowser")
			winset(src,"reportviewing.loadv","text=")
		Check(type)
			switch(type)
				if(1)
					if(!ckey(winget(src,"report.name","text")))
						winset(src,"report.load","text=\"Pink Box(es) Contem erros!\"")
						winset(src,"report.name","background-color=#ff69b4")
					if(!ckey(winget(src,"report.desc","text")))
						winset(src,"report.load","text=\"Pink Box(es) Contem erros!\"")
						winset(src,"report.desc","background-color=#ff69b4")
					for(var/X in reports)
						var/Reports/M = reports[X]
						if(M.Name == winget(src,"report.name","text"))
							winset(src,"report.desc","background-color=#ff69b4")
							winset(src,"report.load","text=\"Nome ja esta em uso!\"")
						if(M.Description == winget(src,"report.desc","text"))
							winset(src,"report.desc","background-color=#ff69b4")
							winset(src,"report.load","text=\"Esse bug ja foi reportado!!\"")
				if(2)
					if(!ckey(winget(src,"report.name","text"))) return FALSE
					if(!ckey(winget(src,"report.desc","text"))) return FALSE
					for(var/X in reports)
						var/Reports/M = reports[X]
						if(M.Name == winget(src,"report.name","text"))return FALSE
						if(M.Description == winget(src,"report.desc","text"))return FALSE
Reports
	var
		Key
		IP_Address
		Computer_ID
		NameID
		Name
		Number = 0
		Type
		Description
	New(keys,ips,ids,type,names,descs)
		src.Key = keys
		src.IP_Address = ips
		src.Computer_ID = ids
		src.Type = type
		src.Description = descs
		src.Number = ++global.number
		src.Name = names
		global.number = Number
		src.NameID = "[names] ([Number])"
		reports[src.NameID] = src
	//	for(var/x in src.vars)
	//		world << "[x] = [vars[x]]"