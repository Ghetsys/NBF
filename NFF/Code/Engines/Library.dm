mob/owner/verb
	Aceitar_Livro()
		set category="Staff"
		var/Listing = list()
		for(var/Book/Book in PendingBooks)
			var/String = "[Book.name] - Livro de: [Book.Author] ([Book.AuthorKey])"
			Listing[String] = Book
		var/A = input("Quer aceitar esse livro?") in Listing + "Cancelar"
		if(A=="Cancelar")
			return
		var/Book/B = Listing[A]
		B.ReadBook(usr,,1)
/*
mob/Topic(href,href_list[])
	..()
	if(href_list["action"] == "AcceptABook")
	//Put this in the Topic proc.
	//Replace the above with simply if("AcceptABook")
	/*
	UnComment this part..
		if(usr.MemberRank!="Owner")
			return
	*/
		var/Choice = alert("Accept or Decline?","Accept?","Accept","Decline","Decide Later")
		var/Book/B = locate(href_list["Book"])
		switch(Choice)
			if("Decide Later")
				return
			if("Accept")
				PublishedBooks += B
				PendingBooks.Remove(B)
				world << "The Book, \"[B]\", by [B.Author], Has been Accepted!"
				B.Published = time2text(world.realtime,"MMM DD, YY")
			if("Decline")
				world << "The Book, \"[B]\", by [B.Author], Has been Declined!"
				PendingBooks.Remove(B)
				del(B)
		SaveBooks()

*/
var/list
	PublishedBooks=list()
	PendingBooks=list()
Book
	parent_type = /obj
	var
		ID			//An Identification number.
		Author		//Character's name
		AuthorKey	//Author's key
		Contents	//The book's content!
		Attempted	//Day is was submitted
		Published	//Day it was accepted!
		Profit=0	//Amount the book has made!
	proc/ReadBook(mob/M,B,ToBeAccepted)
		M << browse({"<html><head>
		<link rel="stylesheet" type="text/css" href="http://s8.zetaboards.com/c/1808/8/css.css" />
		<title>[name]</title>
		</head>
		<body>
		<div id="wrap"><div class="category"><h2>[name]</h2></div>
		<div style="float:right;clear:both">Written By: [Author]</div>
		[Contents]
		</div>
		<center>Published [Published]</center>
		[ToBeAccepted?"<a href=\"byond://?src=\ref[M];action=AcceptABook;Book=\ref[src]\">Would You Like To Accept Or Decline This Book?</a>":""]
		</body>
		</html>"},"window=[B?"\ref[B]":"\ref[src]"];size=500x650")
obj/BookCopy
	var
		tmp/Book/Original
		ID
	verb/ReadBook()
		set name = "Ler"
		set category = "Comandos"
		set src in usr
		if(!Original)
			for(var/Book/B in PublishedBooks)
				if(B.ID == src.ID)
					src.Original = B
					break
			if(!Original)//Can't find the book?
				usr << "That's odd... It seems this book was erased... Oh well.."
				del(src)
				return
		Original.ReadBook(usr,src)
	verb/RipBook()
		set name = "Rip"
		usr<<"You destroy the book."
		del(src)
turf/BookShelf
	icon='Housestuffz.dmi'
	icon_state="book1"
	density=1
	layer=3
	verb/Command()
		set src in view(1)
		if(!(usr.Yen >= 50000))
			usr << "Not Enough Money!"
			return
		if(alert("Would you like to purchase a paperback book!? They only cost 50000 Yen!","Purchase A Paperback Book?","Yes","Nah")=="Yes")
			var/Listing = list()
			for(var/Book/Book in PublishedBooks)
				var/String = "[Book.name] - By: [Book.Author]"
				Listing[String] = Book
			var/A = input("Which book would you like to see?") in Listing + "Cancel"
			if(A=="Cancel")
				return
			var/Book/B = Listing[A]
			if(alert("Are you sure you'd like to purchase [B], By [B.Author]?","Purchase A Paperback Book?","Yes","Nevermind!")=="Yes")
				var/obj/BookCopy/C = new()
				C.name = B.name;C.ID=B.ID
				usr.Yen-=50000;B.Profit+=50000
				usr.contents += C
				SaveBooks()


world/New()
	..()
	LoadSubscriberStuff()
	setWeatherLoop()
	LoadBooks()


proc
	SaveBooks()
		var/savefile/load=new("World Save Files/TheLibrary.sav")
		load["PublishedBooks"]<<PublishedBooks
		load["PendingBooks"]<<PendingBooks

	/*LoadBooks()
		if(fexists("World Save Files/TheLibrary.sav"))
			var/savefile/load=new("World Save Files/TheLibrary.sav")
			load["PublishedBooks"]>>PublishedBooks
			load["PendingBooks"]>>PendingBooks

			*/

	LoadBooks()
		world.log<<"All books have been loaded."
		if(fexists("World Save Files/TheLibrary.sav"))
			var/savefile/load=new("World Save Files/TheLibrary.sav")
			load["PublishedBooks"]>>PublishedBooks
			load["PendingBooks"]>>PendingBooks
			for(var/Book/B in PublishedBooks)
				if(!B.ID)
					B.ID = PublishedBooks.Find

mob/NPC/Publisher
	name="Mina Haruko"
	icon='HakumeiGetsu.dmi'
	icon_state="Moon2"
	CNNPC=1
	Village="Sound"
	health = 9999999999999999999999999999999999999999999999
	New()
		..()
		spawn()
			src.icon=null
			var/Base='Base.dmi'
			var/Hair='MadaraH.dmi'
			var/Shirt='Shirt.dmi'
			var/Scarf='Scarf.dmi'
			Base+=rgb(235,145,52)
			Hair+=rgb(0,0,180)
			Shirt+=rgb(255,0,128)
			Scarf+=rgb(255,196,136)
			src.icon=Base
			src.overlays-='Boxers.dmi'
			src.overlays+='Boxers.dmi'
			src.overlays-='FemaleEyes.dmi'
			src.overlays+='FemaleEyes.dmi'
			src.overlays-='Eyes.dmi'
			src.overlays+='Eyes.dmi'
			src.overlays+=Shirt
			src.overlays+=Scarf
			src.overlays-='pants.dmi'
			src.overlays+='pants.dmi'
			src.overlays-='Cloths.dmi'
			src.overlays+='Cloths.dmi'
			src.overlays-=Hair
			src.overlays+=Hair
	verb/Command()
		set src in view(1)
		if(!(usr.Yen >= 999999))
			usr << "Sorry. I require 1,000,000 Yen to even think of publishing a book!"
			return
		usr.Yen-=1000000
	//	set hidden = 1
		if(alert("Ah, Hello there. Are you an artist, looking to publish a book?","Publish a Book?","Yes","Nah")=="Yes")
			var/bookname = input("Ah, splendid! And what is the name of your book?") as text
			var/BookText = input("Very well, I'll be taking your book now!\
			\nKeep in mind that there is sadly a character limit of 30000!") as message
			if(alert("Are you sure you'd like to publish this?","Publish a Book?","Yes","Nevermind")=="Yes")
				alert("Very well. In that case I'll check with an owner, and see what they think about it.\
				\nIn The mean time, check out any other book you might like in the Library!")
				alert("If your book was accepted you can find it in Blue, In the Uchiha House on the Bookshelves or most other Bookshelves around the Sound Village!")
				var/Book/B = new();B.name = bookname;B.Author = usr.name;B.AuthorKey = usr.key
				B.Attempted = time2text(world.realtime,"MMM DD, YY")
				B.Contents = BookText
				PendingBooks += B
				while(findtext(B.Contents,"\n"))
					var/loc = findtext(B.Contents,"\n")
					B.Contents = copytext(B.Contents,1,loc) + "<br>" + copytext(B.Contents,loc+1)
				SaveBooks()