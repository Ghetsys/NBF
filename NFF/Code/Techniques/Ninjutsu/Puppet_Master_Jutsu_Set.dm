//There needs to be more things added into other parts of the code I.E. Death Proc.
mob/var/PuppetMastery=0 //I'd probably use this as the "Ninjutsu Knowledge" of Puppets. Lul.
mob/var/tmp/FrozenCount=0

obj/Puppet_Summoning_Scrolls
	icon='Icons/scrolls.dmi'
	icon_state="1"
	verb
		Rename()
			NamingPuppet
			var/characterfirstname=input(usr,"Pra qual Nome você gostaria de mudar a sua Marionete?","Name")
			if(length(characterfirstname)<1)
				alert(usr,"Ele deve ser maior que 1 letra!")
				goto NamingPuppet
			if(length(characterfirstname)>15)
				alert(usr,"Ele deve ser mais curto do que 15 letras!")
				goto NamingPuppet
			src.name=characterfirstname

	var
		BonusHealth=0
		BonusArmor=0
		BonusStrength
		tmp/Summoned=0
		tmp/Delay=0
		StunResister=0
		ExplodingReturn=0
		PuppetControlType=1
		Fast_Return=0
	Dragon
		PuppetControlType=1
		var
			AdjustableRoom=0
			AdjustableRoomCollapse=0
			FireBreathing=0
			IceBreathing=0
			Spikes=0
	Hawk
		PuppetControlType=1
		var
			SpikedHands=0
			Blades=0
			SpreadingSmokeScreen=0
			SpreadingPoison=0
	Talon
		PuppetControlType=2
		var
			SpikedHands=0
			Blades=0
			PoisonBlades=0
			KunaiProjectile=0
			KunaiAutoFire=0
		//	tmp/KunaiDelay=0
obj/Puppet_Parts
	icon='Icons/scrolls.dmi'
	icon_state="gay scroll"
	var
		Amount=0
	verb
		Use()
			var/list/PuppetsList=list("")
			for(var/obj/Puppet_Summoning_Scrolls/A in usr.contents)
				PuppetsList+=A
			var/obj/Puppet_Summoning_Scrolls/AC = input("Qual Marionete Voce Gostaria de usar ") in PuppetsList + list("Cancelar")
			if(AC=="Cancelar")
				return
			if(AC.Summoned)
				usr<<"Voce nao pode sumonar 2 marionete ao mesmo tempo.";return
			if(src.name=="Structure Enhancer"||src.name=="Structure Enhancer Lite"||src.name=="Structure Enhancer Gold")
				if(AC.BonusArmor>800)
					usr<<"Você já atingiu o limite máximo para melhorar a estrutura de sua Marionete Talvez há outra coisa que você pode fazer.";return
				AC.BonusHealth+=Amount
			if(src.name=="Armor Enhancer"||src.name=="Armor Enhancer Lite"||src.name=="Armor Enhancer Gold")
				if(AC.BonusArmor>800)
					usr<<"Você já atingiu o limite máximo para melhorar a Armadura de sua marionete. Talvez haja alguma coisa que você pode fazer.";return

				if(AC.BonusArmor>100)
					Amount=Amount/2
				if(AC.BonusArmor>200)
					Amount=Amount/2
				if(AC.BonusArmor>300)
					Amount=Amount/2
				if(AC.BonusArmor>400)
					Amount=Amount/2
				if(AC.BonusArmor>500)
					Amount=Amount/2
				if(AC.BonusArmor>600)
					Amount=Amount/2
				if(AC.BonusArmor>700)
					Amount=Amount/2
				if(AC.BonusArmor>800)
					Amount=Amount/2
				if(AC.BonusArmor>900)
					Amount=Amount/2
				if(AC.BonusArmor>1000)
					Amount=Amount/2

				AC.BonusArmor+=Amount
			if(src.name=="Power Enhancer"||src.name=="Power Enhancer Lite"||src.name=="Power Enhancer Gold")
				if(AC.BonusStrength>1000)
					usr<<"Você já atingiu o limite máximo para aumentar a força da sua marionete. Talvez haja alguma coisa que você pode fazer.";return

				if(AC.BonusStrength>500)
					AC.BonusStrength+=Amount/4
				if(AC.BonusStrength>200)
					AC.BonusStrength+=Amount/2
				else
					AC.BonusStrength+=Amount

			if(src.name=="Spiked Arms")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/mob/Puppet/Hawk/ACC=AC;ACC.SpikedHands=1
				else if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/mob/Puppet/Talon/ACC=AC;ACC.SpikedHands=1
				else
					usr<<"Essa Marionete não suporta esse recurso.";return
			if(src.name=="Adjustable Room")
				src<<"Atualmente desativado, desculpe.";return
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon/))
					var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=AC;ACC.AdjustableRoom=1
				else
					usr<<"Essa Marionete não suporta esse recurso.";return
			if(src.name=="Light Blade Arms")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;ACC.Blades=1

				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC;ACC.Blades=1
				else
					usr<<"Essa Marionete não suporta esse recurso";return
			if(src.name=="Medium Blade Arms")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;ACC.Blades=2

				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC;ACC.Blades=2
				else
					usr<<"Essa Marionete não suporta esse recurso";return
			if(src.name=="Heavy Blade Arms")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;ACC.Blades=3
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC;ACC.Blades=3
				else
					usr<<"Essa Marionete não suporta esse recurso";return
			if(src.name=="Fast Return")
				usr<<"Agora você vai ser capaz de invocar a sua [AC] Marionete mais rapido"
				AC.Fast_Return=1
				del(src)
				return
			if(src.name=="Exploding Return")
				usr<<"Seu [AC] Marionete agora tem a capacidade de explodir uma vez que é destruída!"
				AC.ExplodingReturn=1
				del(src)//just started adding the return and del(src) statements 12/1/2012
				return
			if(src.name=="Stun Resister")
				AC.StunResister=1
				usr<<"Você colocou uma acessorio atordoamento em sua [AC] Marionete"
				del(src)
				return
			if(src.name=="Adjustable Capture Room")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon/))
					var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=AC;ACC.AdjustableRoom=1
				else
					usr<<"Este Marionete não suporta esse recurso.";return
			//	AC.AdjustableRoom=1
				usr<<"Você colocou a captura anexo quarto ajustável para o seu dragão! Quando o dragão se aproxima de um inimigo que vai colocá-los dentro dela!"
				del(src)
				return
			if(src.name=="Adjustable Capture Room Collapse")
				for(var/obj/Puppet_Summoning_Scrolls/Dragon/P in src.contents)
					if(istype(P,/obj/Puppet_Summoning_Scrolls/Dragon/))
						if(P.AdjustableRoom)
							var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=P;ACC.AdjustableRoomCollapse=1
						else
							usr<<"Você precisa aplicar o recurso de captura ajustável quarto antes que você possa aplicar esse!";return
				usr<<"Você colocou o ajustável apego Capturing quarto Implosion em seu dragão! Quando seu lojas Dragão alguém dentro deles imprensa X para liberar uma explosão prejudicar a pessoa no interior à custa de destruir o seu fantoche!"
				del(src)
				return
			if(src.name=="Kunai Projectile Attachment - Light")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC;ACC.KunaiProjectile=1;ACC.KunaiAutoFire=0
				else
					usr<<"Sua marionete nao suporta esse recurso.";return
			//	AC.AdjustableRoom=1
				usr<<"Vocês colocaram o acessório Luz Kunai projétil em seu Talon! Pressione A enquanto estiver usando o seu boneco de tê-lo liberar kunais em um ritmo lento! "
				del(src)
				return
			if(src.name=="Kunai Projectile Attachment - Medium")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC;
					if(ACC.KunaiProjectile==1&&ACC.KunaiAutoFire==0)
						ACC.KunaiProjectile=2;ACC.KunaiAutoFire=0
					else if(ACC.KunaiProjectile==0)
						usr<<"Você precisa ter o Anexo Kunai projétil no primeiro antes de poder aplicar este!";return
					else if(ACC.KunaiAutoFire!=0)
						usr<<"Você não é capaz de usar o acessório Kunai projétil com o acessório Rapid Fire!";return
				//	ACC.KunaiProjectile=1;ACC.KunaiAutoFire=0
				else
					usr<<"Essa Marionete não suporta esse recurso.";return
				usr<<"Você colocou o apego Medium Kunai projétil em seu Talon! Pressione A ao usar seu fantoche de tê-lo soltar um pouco mais forte kunais a uma taxa ligeiramente mais rápido!"
				del(src)
				return
			if(src.name=="Kunai Projectile Attachment - Strong")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC;
					if(ACC.KunaiProjectile==2&&ACC.KunaiAutoFire==0)
						ACC.KunaiProjectile=3;ACC.KunaiAutoFire=0
					else if(ACC.KunaiProjectile==0||ACC.KunaiProjectile==1)
						usr<<"Você precisa ter o Kunai projétil no primeiro antes de poder aplicar este!";return
					else if(ACC.KunaiAutoFire!=0)
						usr<<"Você não é capaz de usar o acessório Kunai projétil com o acessório Rapid Fire!";return
				//	ACC.KunaiProjectile=1;ACC.KunaiAutoFire=0
				else
					usr<<"Essa Marionete não suporta esse recurso.";return
				usr<<"Você colocou o forte apego Kunai projétil em seu Talon! Pressione A enquanto estiver usando o seu boneco de tê-lo liberar kunais muito mais forte em um ritmo muito mais rápido!"
				del(src)
				return
			if(src.name=="Kunai Rapid Projectile Attachment - Light")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC
					ACC.KunaiAutoFire=1;ACC.KunaiProjectile=0
				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr<<"Vocês colocaram o acessório Luz Kunai rápida projétil em seu Talon! Pressione A enquanto estiver usando o seu boneco de tê-lo de lançamento rápido kunais!"
				del(src)
				return
			if(src.name=="Kunai Rapid Projectile Attachment - Medium")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC
					if(ACC.KunaiAutoFire==1&&ACC.KunaiProjectile==0)
						ACC.KunaiAutoFire=2;ACC.KunaiProjectile=0
					else if(ACC.KunaiAutoFire!=0)
						usr<<"Você precisa ter o Anexo Luz Rapid Fire Kunai projétil no primeiro antes de poder aplicar este!";return
					else if(ACC.KunaiProjectile!=0)
						usr<<"Você não é capaz de usar o acessório Kunai Rapid Fire projétil com o acessório Kunai normal!";return
				else
					usr<<"Essa Marionete não suporta esse recurso. ";return
				usr<<"Vocês colocaram o acessório Medium rápida Kunai projétil em seu Talon! Pressione A enquanto estiver usando o seu boneco de tê-lo liberar muito mais kunais em um ritmo mais rápido!"
				del(src)
				return
			if(src.name=="Kunai Rapid Projectile Attachment - Strong")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon/))
					var/obj/Puppet_Summoning_Scrolls/Talon/ACC=AC
					if(ACC.KunaiAutoFire==2&&ACC.KunaiProjectile==0)
						ACC.KunaiAutoFire=3;ACC.KunaiProjectile=0
					else if(ACC.KunaiAutoFire!=2)
						usr<<"Você precisa ter o Médio Rapid Fire Kunai projétil no primeiro antes de poder aplicar este! ";return
					else if(ACC.KunaiProjectile!=0)
						usr<<"Você não é capaz de usar o acessório Kunai Rapid Fire projétil com o acessório Kunai normal!";return
				else
					usr<<"Este Puppet não suporta esse recurso.";return
				usr<<"Vocês colocaram o forte apego rápido Kunai projétil em seu Talon! Pressione A enquanto estiver usando o seu boneco de tê-lo liberar muito mais kunais em um ritmo muito mais rápido do que antes!"
				del(src)
				return
			if(src.name=="Poison Tipped Blades Attachment")
				usr<<"Perdão. Isso não esta funcionando! "
				del(src)
				return
			if(src.name=="Spreading SmokeScreen Attachment - Light")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;ACC.SpreadingSmokeScreen=1
					usr.LearnedJutsus+=new/obj/SkillCards/SpreadingSmokeScreenLight
				else
					usr<<"Essa marionete  não suporta esse recurso.";return
				usr<<"Você colocou a propagação Anexo SmokeScreen em seu falcão! Ao pressionar este skillcard você é capaz de lançar um pequeno campo de Cortina de Fumaça em torno de seu fantoche de inimigo parcialmente cego Ninja!"
				del(src)
				return
			if(src.name=="Spreading SmokeScreen Attachment - Medium")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;
					if(ACC.SpreadingSmokeScreen==1)
						ACC.SpreadingSmokeScreen=2
						for(var/obj/SkillCards/SpreadingSmokeScreenLight/P in usr.LearnedJutsus)
							del(P)
						usr.LearnedJutsus+=new/obj/SkillCards/SpreadingSmokeScreenMedium
					else
						usr<<"Você precisa ter o  SmokeScreen Luz no primeiro antes de poder aplicar este!";return
				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr<<"Você colocou uma versão muito mais forte sobre a disseminação de anexos SmokeScreen em seu falcão! Ao pressionar este skillcard mais recente você é capaz de liberar um maior campo de Cortina de Fumaça em torno de seu fantoche de inimigo parcialmente cego Ninja!"
				del(src)
				return
			if(src.name=="Spreading SmokeScreen Attachment - Strong")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;
					if(ACC.SpreadingSmokeScreen==2)
						ACC.SpreadingSmokeScreen=3
						for(var/obj/SkillCards/SpreadingSmokeScreenMedium/P in usr.LearnedJutsus)
							del(P)
						usr.LearnedJutsus+=new/obj/SkillCards/SpreadingSmokeScreenHeavy
					else
						usr<<"Você precisa ter o Anexo Medium SmokeScreen em primeiro antes de poder aplicar este!"; return
				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr << "Você colocou uma versão ainda mais forte sobre a disseminação de anexos SmokeScreen em seu falcão! Ao pressionar este skillcard mais recente você é capaz de liberar uma área ainda maior de Cortina de Fumaça em torno de seu fantoche de inimigo parcialmente cego Ninja!"
				del(src)
				return
			if(src.name=="Spreading Poison Attachment - Light")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;ACC.SpreadingPoison=1
					usr.LearnedJutsus+=new/obj/SkillCards/PuppetPoisonSpread
				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr << "Você colocou a propagação de anexos do veneno em seu falcão! Ao pressionar este skillcard você é capaz de lançar um pequeno campo de gás poisinous em torno de seu fantoche para prejudicar inimigo Ninja!"
				del(src)
				return
			if(src.name=="Spreading Poison Attachment - Medium")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;
					if(ACC.SpreadingPoison==1)
						ACC.SpreadingPoison=2
						for(var/obj/SkillCards/PuppetPoisonSpread/P in usr.LearnedJutsus)
							del(P)
						usr.LearnedJutsus+=new/obj/SkillCards/PuppetPoisonSpreadMedium
					else
						usr<<"Você precisa ter o Anexo Veneno Luz no primeiro antes de poder aplicar este! ";return
				usr << "Você colocou uma versão mais forte do Spread Anexo veneno em seu falcão! Ao pressionar este skillcard mais recente você é capaz de liberar um maior campo de gás poisinous em torno de seu fantoche para prejudicar inimigo Ninja!"
				del(src)
				return
			if(src.name=="Spreading Poison Attachment - Strong")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk/))
					var/obj/Puppet_Summoning_Scrolls/Hawk/ACC=AC;
					if(ACC.SpreadingPoison==2)
						ACC.SpreadingPoison=3
						for(var/obj/SkillCards/PuppetPoisonSpreadMedium/P in usr.LearnedJutsus)
							del(P)
						usr.LearnedJutsus+=new/obj/SkillCards/PuppetPoisonSpreadHeavy
					else
						usr << "Você precisa ter o Anexo Veneno Médio no primeiro antes de poder aplicar este!"; return
				usr<<"Você ter colocado uma versão ainda mais forte do Spread Anexo veneno em seu falcão! Ao pressionar este skillcard mais recente você é capaz de liberar um campo ainda maior de gás poisinous em torno de seu fantoche para prejudicar inimigo Ninja!"
				del(src)
				return
			if(src.name=="Adjustable Fire Attachment")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon/))
					var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=AC;ACC.FireBreathing=1
				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr<<"Você colocou o Anexo fogo sobre a boca do seu dragão! Se você pressionar Z enquanto controla o dragão que você vai lançar fogo! "
				del(src)
				return
			if(src.name=="Spreading Ice Attachment - Light")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon/))
					var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=AC;ACC.IceBreathing=1
				else
					usr<<"Essa marionete não suporta esse recurso..";return
				usr<<"Você colocou a Luz Anexo gelo na cabeça do seu dragão! Se você pressionar X enquanto controla o dragão que você vai lançar um pequeno fluxo de nitrogênio líquido!"
				del(src)
				return
			if(src.name=="Spreading Ice Attachment - Medium")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon/))
					var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=AC;
					if(ACC.IceBreathing==1)
						ACC.IceBreathing=2
					else if(ACC.IceBreathing==0)
						usr<<"Você precisa ter a Luz Anexo Ice Equipado para equipar esse apego!";return

				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr<<"Você colocou o Médio Anexo gelo na cabeça do seu dragão! Se você pressionar X enquanto controla o Dragão vai liberar um fluxo maior de nitrogênio líquido! "
				del(src)
				return
			if(src.name=="Spreading Ice Attachment - Strong")
				if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon/))
					var/obj/Puppet_Summoning_Scrolls/Dragon/ACC=AC;
					if(ACC.IceBreathing==2)
						ACC.IceBreathing=3
					else if(ACC.IceBreathing==2)
						usr<<"Você precisa ter o Anexo Ice Medium Equipado para equipar esse apego!";return

				else
					usr<<"Essa marionete não suporta esse recurso.";return
				usr<<"Vocês colocaram o forte apego Ice sobre a cabeça do seu dragão! Se você pressionar X enquanto controla o dragão que você vai lançar um grande fluxo de nitrogênio líquido! "
				del(src)
				return
			usr<<"[AC.BonusHealth] Bonus vida ."
			usr<<"[AC.BonusArmor] Bonus resistencia."
			usr<<"[AC.BonusStrength] Bonus força."
			del(src)
	Structure_Enhancer
		name="Structure Enhancer"
		Amount=50
	Structure_Enhancer_Lite
		name="Structure Enhancer Lite"
		Amount=100
	Structure_Enhancer_Gold
		name="Structure Enhancer Gold"
		Amount=500
	Armor_Enhancer
		name="Armor Enhancer"
		Amount=25
	Armor_Enhancer_Lite
		name="Armor Enhancer Lite"
		Amount=50
	Armor_Enhancer_Gold
		name="Armor Enhancer Gold"
		Amount=500
	Power_Enhancer
		name="Power Enhancer"
		Amount=50
	Power_Enhancer_Lite
		name="Power Enhancer Lite"
		Amount=100
	Power_Enhancer_Gold
		name="Power Enhancer Gold"
		Amount=200
	Spiked_Arms
		name="Spiked Arm Attachments"
	Adjustable_Room
		name="Adjustable Capture Room"
	Adjustable_Room_Collapse
		name="Adjustable Capture Room Collapse"
	FireRelease
		name="Adjustable Fire Attachment"
	Exploding_Return
		name="Exploding Return"
	Poison_Blades
		name="Poison Tipped Blades Attachment"
	Kunai_Attachment_Light
		name="Kunai Projectile Attachment - Light"
	Kunai_Attachment_Medium
		name="Kunai Projectile Attachment - Medium"
	Kunai_Attachment_Heavy
		name="Kunai Projectile Attachment - Strong"
	Kunai_Rapid_Attachment_Light
		name="Kunai Rapid Projectile Attachment - Light"
	Kunai_Rapid_Attachment_Medium
		name="Kunai Rapid Projectile Attachment - Medium"
	Kunai_Rapid_Attachment_Heavy
		name="Kunai Rapid Projectile Attachment - Strong"
	Poison_Spread_Light//Something for Hawk
		name="Spreading Poison Attachment - Light"
	Poison_Spread_Medium
		name="Spreading Poison Attachment - Medium"
	Poison_Spread_Heavy
		name="Spreading Poison Attachment - Strong"
	Ice_Spread_Light//Something for Dragon
		name="Spreading Ice Attachment - Light"
	Ice_Spread_Medium
		name="Spreading Ice Attachment - Medium"
	Ice_Spread_Heavy
		name="Spreading Ice Attachment - Strong"
	SmokeScreen_Spread_Attachment_Light
		name="Spreading SmokeScreen Attachment - Light"
	SmokeScreen_Spread_Attachment_Medium
		name="Spreading SmokeScreen Attachment - Medium"
	SmokeScreen_Spread_Attachment_Heavy
		name="Spreading SmokeScreen Attachment - Strong"
	Stun_Resister
	Fast_Return
	Light_Blade_Arms
	Medium_Blade_Arms
	Heavy_Blade_Arms

mob/var/tmp/BeingCarried=0
mob/proc/PoisonRelease(HowHeavy)//This is the Beginner Spread ;o!
	set background=1
	var/WhichRelease=HowHeavy
	var/z=0
//	var/c=src.loc
	var/d=0
	var/Check=0
	var/mob/Puppet/Hawk/A
	var/Location=0
//	if(src.ControllingPuppet2==1)//pixel_x
	if(WhichRelease=="Light")
		for(var/mob/Puppet/Hawk/P in oview(20,src))
			if(P.PoisonSpread==1&&P.Owner==usr)
				Check=1
				A=P
		if(Check&&A!=null)
			d=A.loc
			Location=d
			while(z<4)
				for(var/turf/T in oview(z,Location))
					if(get_dist(T,A)==z)
						var/n=rand(3,4)
						while(n>0)//a.pixel_x=rand(8,16);a.pixel_y=rand(10,18)
							var/obj/Poisonmist/a=new();a.Poison="Vit";a.PoisonLast=100;a.pixel_x=rand(15,20);a.pixel_y=rand(8,10)
							a.loc=T
							n--
				z++
				sleep(7)
		else
		//	src<<"Lolnope. [src] is the src. [usr] is the user. [A]. [A.Owner] is the Owner of the Current Hawk Puppet. This is the Value of Check: [Check]."
			return
	else if(WhichRelease=="Medium")
		for(var/mob/Puppet/Hawk/P in oview(20,src))
			if(P.PoisonSpread==2&&P.Owner==usr)
				Check=1
				A=P
		if(Check&&A!=null)
			d=A.loc
			Location=d
			while(z<5)
				for(var/turf/T in oview(z,Location))
					if(get_dist(T,A)==z)
						var/n=rand(6,7)
						while(n>0)//a.pixel_x=rand(8,16);a.pixel_y=rand(10,18)
							var/obj/Poisonmist/a=new();a.Poison="Vit";a.PoisonLast=100;a.pixel_x=rand(15,20);a.pixel_y=rand(8,10)
							a.loc=T
							n--
				z++
				sleep(7)
		else
		//	src<<"Lolnope. [src] is the src. [usr] is the user. [A]. [A.Owner] is the Owner of the Current Hawk Puppet. This is the Value of Check: [Check]."
			return
	else
		for(var/mob/Puppet/Hawk/P in oview(20,src))
			if(P.PoisonSpread==3&&P.Owner==usr)
				Check=1
				A=P
		if(Check&&A!=null)
			d=A.loc
			Location=d
			while(z<4)
				for(var/turf/T in oview(z,Location))
					if(get_dist(T,A)==z)
						var/n=rand(3,4)
						while(n>0)//a.pixel_x=rand(8,16);a.pixel_y=rand(10,18)
							var/obj/Poisonmist/a=new();a.Poison="Vit";a.PoisonLast=100;a.pixel_x=rand(15,20);a.pixel_y=rand(8,10)
							a.loc=T
							n--
				z++
				sleep(7)
		else
		//	src<<"Lolnope. [src] is the src. [usr] is the user. [A]. [A.Owner] is the Owner of the Current Hawk Puppet. This is the Value of Check: [Check]."
			return
mob/proc/BeingCarried(mob/Puppet/Dragon/ByWhat)
	var/mob/M=ByWhat.Owner
//	var/mob/Puppet/Dragon/User=ByWhat
	view()<<"A marionete abre corpo revelando uma grande caixa como a área e empurrões [src] into it!"
	src<<"Pressione barra de espaço para Luta Out of the Box irregular afiada!"
	if(ByWhat.AdjustableRoomCollapsation)
		M<<"Pressione X para explodir a marionete  do dragão!"
//		view()<<"Press X to implode the Dragon puppet!"
//	ByWhat.CaughtInRoom+=src
//	var/OriginalLocation=0
//	var/tmp/list/BackUp=list()
//	BackUp=ByWhat.CaughtInRoom
	var/CarriedStruggle=180
//	OriginalLocation=src.loc
	var/LocationToDrop=0
	src.Oicon=src.icon
	src.Overlays=src.overlays.Copy()
	src.overlays=src.overlays.Remove(src.overlays)
//	src.icon=null;src.firing=1
	src.icon=null;src.firing=1;src.FrozenBind="PuppetCaptured";src.BeingCarried=1
	while(src.BeingCarried&&(CarriedStruggle>src.Struggle))
//		src.&= ~BLIND
		if(!ByWhat||ByWhat.loc==null)
			src.sight |= BLIND
	//		ByWhat.CaughtInRoom-=src
	//		BackUp-=src
			src.loc=LocationToDrop
			src.BeingCarried=0
			src.FrozenBind=""
			CarriedStruggle-=1
		//	src.loc=OriginalLocation
		if(!src.knockedout)
			src.health-=2;src.stamina-=3
		if(prob(18))
			src.Bloody()
		src.loc=LocationToDrop//ByWhat.loc
		if(ByWhat)
			LocationToDrop=ByWhat.loc
		//	ByWhat.CaughtInRoom-=src
//			BackUp-=src
		sleep(1)
	view()<<"[src] Interrompeu a marionete"
//	if(ByWhat)
//		ByWhat.CaughtInRoom-=src
//	else
//		BackUp-=src
//	src.sight &= ~BLIND
	src.sight &= ~BLIND
	src.overlays=null
	src.icon=src.Oicon
	src.overlays+=src.hair
	src.overlays+=src.Overlays
	src.firing=0
	src.BeingCarried=0
	src.FrozenBind=""
	spawn(950)
		if(istype(ByWhat,/mob/Puppet/Dragon))
			ByWhat.Carrying=0
			return
		else
			return
//		ByWhat.Carrying=0



mob/var/tmp/ControllingPuppet1=0
mob/var/tmp/ControllingPuppet2=0
turf
	Click()
		if(usr.ControllingPuppet2)
			for(var/mob/Puppet/K in oview(20,usr))
				if(K.Owner==usr&&K.ControlType=="Mouse")
					walk_to(K,src,,,2)//Can Actually modify this so that way You could have an attachment that makes it move faster!
		..()
mob/Puppet
	health=1500
	stamina=0
	chakra=1500
	Reflex=500
	var
//		tmp/Carrying=null
		tmp/ExplodingReturn=0
		tmp/AdjustableRoomDelay=0
		CanUseAdjustableRoom=0
		PuppetOrigin
		StunResister=0
		ControlType="Keyboard"
		DamageAddOn=0
		BladedArms=0
		Fast_Return=0
	New()
		spawn()
			while(src)
				if(src.firing)
			//		spawn(30)
					src.firing=0
				if(src.StunResister)
					src.Stun=0
				if(istype(src,/mob/Puppet/Hawk/))
					sleep(40)
				else
					sleep(100)
		spawn()
			if(src.ControlType=="Mouse")
			//	var/mob/O = src.Owner
				while(src)
			//		if(!O.target)
				//		walk_towards(src,O)
					sleep(20)
			if(ControlType=="Keyboard")
				var/mob/O = src.Owner
				while(src)
					if(!O.target)
						walk(src,0)
					sleep(10)
	Click()
		if(src.Owner==usr&&usr.PuppetSwap)
			var/turf/A=src.loc
			usr.loc=src.loc
			src.loc=A
			for(var/mob/M in range(15,usr))
				if(M&&usr==M.target)
					M.target=src
					if(M&&M.client)
						for(var/image/x in M.client.images)
							if(x.icon=='target1.dmi'&&x.icon_state!="Number2")
								del(x)
						var/image/I = image('target1.dmi',src)
						M<<I
	Bump(A)
		if(ismob(A))
			var/mob/O = src.Owner
			var/mob/M = A
			if(M.Kaiten||M.sphere)
				return
			if(O==M)
				return
		//	if(src.CanUseAdjustableRoom)
		//		M.loc=src.loc
		//		M.BeingCarried(src)
			else
		//		if(istype(src,/mob/Puppet/Dragon/))
		//			var/mob/Puppet/Dragon/ASC=src
		//			if(ASC.AdjustableRoom&&!src.Carrying)
		//				spawn()	src.Carrying=1;M.BeingCarried(src)
				if(!src.firing)
					if(src.BladedArms==1&&src.WeaponInRightHand=="")
						var/obj/WEAPONS/Tanto/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1
					if(src.BladedArms==1&&src.WeaponInLeftHand=="")
						var/obj/WEAPONS/Tanto/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1

					if(src.BladedArms==2&&src.WeaponInRightHand=="")
						var/obj/WEAPONS/Katana/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1
					if(src.BladedArms==2&&src.WeaponInLeftHand=="")
						var/obj/WEAPONS/Katana/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1

					if(src.BladedArms==1&&src.WeaponInRightHand=="")
						var/obj/WEAPONS/Berserker/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1
					if(src.BladedArms==1&&src.WeaponInLeftHand=="")
						var/obj/WEAPONS/Berserker/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1

					var/ZX=rand(1,3)
					if(ZX==1)
				//		if(istype(src,/mob/Puppet/Talon/))
				//			if(src.PoisonedBlades)
				//				src.SliceHit(src,Power=5,PuppetPoison=1)
						if(istype(src,/mob/Puppet/Dragon))
							src.SliceHit(src,Power=5)
						else if(src.BladedArms==0)
							src.AttackVerb(30)
						else
							src.SliceHit(src,Power=10)
					if(ZX==2)
				//		if(istype(src,/mob/Puppet/Talon/))
				//			if(src.PoisonedBlades)
				//				src.SliceHit(src,Power=5,PuppetPoison=1)
						if(istype(src,/mob/Puppet/Dragon))
							src.SliceHit(src,Power=5)
						else if(src.BladedArms==0)
							src.AttackVerb(30)
						else
							src.SliceHit(src,Power=10)
					if(ZX==3)
				//		if(istype(src,/mob/Puppet/Talon/))
				//			if(src.PoisonedBlades)
				//				src.SliceHit(src,Power=5,PuppetPoison=1)
						if(istype(src,/mob/Puppet/Dragon))
							src.SliceHit(src,Power=5)
						else if(src.BladedArms==0)
							src.AttackVerb(30)
						else
							src.SliceHit(src,Power=10)
					src.firing=1
				else
					return

	Del()
		if(src.ExplodingReturn)
			var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=src.Owner
		else
			var/obj/SmokeCloud/S=new();S.loc=src.loc
		if(istype(src,/mob/Puppet/Dragon/))
			var/mob/Puppet/Dragon/C=src
			C.CaughtInRoom=null
		var/mob/O=src.Owner
		if(O)
			if(ControlType=="Keyboard")
				O.ControllingPuppet1=0
			//	O.firing=0;O.controlled=null
			if(ControlType=="Mouse")
				O.ControllingPuppet2=0
			if(O.firing)
				O.firing=0
		..()
	Dragon
		health=3000
		Mtai=100//was originally 300
		tai=100//was originally 300
		icon='Icons/Puppets/Dragon.dmi'
		var
			tmp/AdjustableRoom=0
			tmp/CanBreatheFire=0
			tmp/CanBreatheFireCoolDown=0
			tmp/CanBreatheIce=0
			tmp/CanBreatheIceCoolDown=0
			tmp/Carrying=0
			tmp/AdjustableRoomCollapsation=0
			tmp/list/CaughtInRoom=null
			tmp/PuppetFireBallDelay=0
			tmp/PuppetIceBallDelay=0
		Bump(A)
			if(ismob(A))
				var/mob/O = src.Owner
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				if(O==M)
					return
				if(src.AdjustableRoom&&src.Carrying!=1&&src.AdjustableRoomDelay==0)
					M.loc=src.loc
					M.BeingCarried(src)
					src.AdjustableRoomDelay=1
					src.Carrying=1
			..()
		verb
			ZRelease()
				..()
			G()
				if(src.AdjustableRoomCollapsation&&src.Carrying==1)
			//		src.Frozen=1
					view()<<"O Dragão marionete começa a deixar fora um fusível!"
				//	for(var/mob/C in CaughtInRoom)
				//		spawn()
				//			if(C.client)
				//				C<<"Quick! Get out!"
					sleep(20)
					var/obj/Jutsu/Explosion/K=new();K.loc=src.loc;K.Owner=src.Owner
					for(var/mob/M in src.loc)//in CaughtInRoom
						spawn()
							if(M.client)
								M.DamageProc(rand(300,500),"Health",src)
				//	src.Frozen=0
					del(src)
					return
				..()
	Hawk//Give this something called Wire Attachment tool which will allow it to place someone into a wire if it attackts them can also give it another attachment that shoots wires straight, and at 45 degree angles for a total of 3 shot!
		health=3000
		Mtai=175//was originally 300
		tai=175//was originally 300
		icon='Icons/Puppets/Hawk.dmi'
		ControlType="Keyboard"
		Running=1
		var
			tmp/SpikedHands=0
			PoisonSpread=0
			SmokeScreen=0
	Talon
		health=3000
		icon='Icons/Puppets/Talon.dmi'
		ControlType="Mouse"
		Running=0
		var
			tmp/PoisonedBlades=0
			tmp/SpikedHands=0
			tmp/CanThrowKunais=0
			tmp/CanThrowRapidKunais=0
			tmp/RapidKunaiDelay=0
			tmp/KunaiDelay=0
		Bump(A)
			if(ismob(A))
				var/mob/O = src.Owner
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				if(O==M)
					return
				else
					if(!src.firing)
						if(src.BladedArms==1&&src.WeaponInRightHand=="")
							var/obj/WEAPONS/Tanto/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1
						if(src.BladedArms==1&&src.WeaponInLeftHand=="")
							var/obj/WEAPONS/Tanto/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1
						if(src.BladedArms==2&&src.WeaponInRightHand=="")
							var/obj/WEAPONS/Katana/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1
						if(src.BladedArms==2&&src.WeaponInLeftHand=="")
							var/obj/WEAPONS/Katana/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1
						if(src.BladedArms==1&&src.WeaponInRightHand=="")
							var/obj/WEAPONS/Berserker/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1
						if(src.BladedArms==1&&src.WeaponInLeftHand=="")
							var/obj/WEAPONS/Berserker/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1
						var/ZX=rand(1,3)
						if(ZX==1)
							if(src.PoisonedBlades)
								src.SliceHit(src,Power=6,PuppetPoison=1)
							else if(src.BladedArms==0)
								src.AttackVerb(30)
							else
								src.SliceHit(src,Power=10)
						if(ZX==2)
							if(src.PoisonedBlades)
								src.SliceHit(src,Power=4,PuppetPoison=1)
							else if(src.BladedArms==0)
								src.AttackVerb(30)
							else
								src.SliceHit(src,Power=10)
						if(ZX==3)
							if(src.PoisonedBlades)
								src.SliceHit(src,Power=5,PuppetPoison=1)
							else if(src.BladedArms==0)
								src.AttackVerb(30)
							else
								src.SliceHit(src,Power=10)
						src.firing=1
					//	world<<"Talon has attacked."
			..()
		AttackVerb2()
			..()
		verb
			A2()
				..()
	RedSand1
		health=3000
		icon='Icons/Puppets/Talon.dmi'
		ControlType="Mouse"
		Running=0
		Bump(A)
			if(ismob(A))
				var/mob/O = src.Owner
				var/mob/M = A
				if(M.Kaiten||M.sphere)
					return
				if(O==M)
					return
				else
			..()
		AttackVerb2()
			..()
		verb
			A2()
				..()
mob/proc/ChooseHawkMode()
	for(var/mob/Puppet/Hawk/P in oview(10,src))
		if(P.Owner==src||P.Owner==usr)
			if(P.ControlType=="Keyboard")
				P.ControlType="Mouse"
				src.ControllingPuppet2=1
				src.ControllingPuppet1=0
				src<<"Tipo de Controle mudou para Mouse."
				return
			if(P.ControlType=="Mouse")
				P.ControlType="Keyboard"
				src.ControllingPuppet2=0
				src.ControllingPuppet1=1
				src<<"Tipo de Controle mudou para teclado."
				return


mob/proc/PuppetMasterJutsu()
	var/list/PuppetsList=list("")
	for(var/obj/Puppet_Summoning_Scrolls/A in src.contents)
		PuppetsList+=A
	var/obj/Puppet_Summoning_Scrolls/AC = input("Qual marionete que gostaria de invocar ?") in PuppetsList + list("Cancel")
	if(AC=="Cancel")
		return
	if(AC.BonusArmor>1000)
		AC.BonusStrength=1000
	if(AC.BonusStrength>1000)
		AC.BonusStrength=1000
	if(AC.BonusHealth>1000)
		AC.BonusHealth=1000
	if(AC.Delay)
		src<<"Essa Marionete esta no Delay espere pra ivoncar novamente";return
	if(AC.Summoned)
		src<<"Você deve unsummon essa marionete para Sumonar outra";return

	if(AC.PuppetControlType==1&&src.ControllingPuppet1)
		src<<"Você já está controlando a Puppet utilizando o teclado.";return

	if(AC.PuppetControlType==2&&src.ControllingPuppet2)
		src<<"Você já está controlando a Puppet utilizando o mouse.";return

	if(AC.PuppetControlType==1)
		src.ControllingPuppet1=1
	if(AC.PuppetControlType==2)
		src.ControllingPuppet2=1

	if(istype(AC,/obj/Puppet_Summoning_Scrolls/Hawk))
		AC.Summoned=1;var/obj/Puppet_Summoning_Scrolls/Hawk/C=AC
		var/mob/Puppet/Hawk/A=new();A.health=1500+AC.BonusHealth;A.Owner=src;A.loc=locate(src.x,src.y-1,src.z)//A.loc=src.loc;
		A.PuppetOrigin=AC
		var/obj/SmokeCloud/S=new();S.loc=A.loc;src.controlled=A;src.firing=1
		if(C.SpreadingSmokeScreen==1)
			A.SmokeScreen=1
		if(C.SpreadingSmokeScreen==2)
			A.SmokeScreen=2
		if(C.SpreadingSmokeScreen==3)
			A.SmokeScreen=3
		if(C.SpikedHands)
			A.SpikedHands=1
		if(C.SpreadingPoison==1)
			A.PoisonSpread=1
		if(C.SpreadingPoison==2)
			A.PoisonSpread=2
		if(C.SpreadingPoison==3)
			A.PoisonSpread=3
		if(C.ExplodingReturn)
			A.ExplodingReturn=1
		if(C.StunResister)
			A.StunResister=1
		if(C.Blades)
			A.BladedArms=C.Blades
		A.Mtai+=AC.BonusStrength/13;A.tai=A.Mtai
		A.maxhealth+=AC.BonusHealth;A.health=A.maxhealth
		A.MEndurance+=AC.BonusArmor;A.Endurance=A.MEndurance
		A.name=AC.name
	else if(istype(AC,/obj/Puppet_Summoning_Scrolls/Talon))
		AC.Summoned=1;var/obj/Puppet_Summoning_Scrolls/Talon/C=AC
		var/mob/Puppet/Talon/A=new();A.Owner=src;A.health=1500+AC.BonusHealth;A.loc=locate(src.x,src.y-1,src.z)//A.loc=src.loc
		A.PuppetOrigin=AC
		var/obj/SmokeCloud/S=new();S.loc=A.loc//S.loc=src.loc
		if(C.SpikedHands)
			A.SpikedHands=1
		if(C.ExplodingReturn)
			A.ExplodingReturn=1
		if(C.StunResister)
			A.StunResister=1
		if(C.Blades)
			A.BladedArms=C.Blades
		if(C.PoisonBlades)
			A.PoisonedBlades=C.PoisonBlades
		if(C.KunaiProjectile==1)//Put =1 beacuse i can do ==2 for the Medium strength attachment etc
			A.CanThrowKunais=1
		if(C.KunaiProjectile==2)
			A.CanThrowKunais=2
		if(C.KunaiProjectile==3)
			A.CanThrowKunais=3
		if(C.KunaiAutoFire==1)
			A.CanThrowRapidKunais=1
		if(C.KunaiAutoFire==2)
			A.CanThrowRapidKunais=2
		if(C.KunaiAutoFire==3)
			A.CanThrowRapidKunais=3
		A.Mtai+=AC.BonusStrength/13;A.tai=A.Mtai
		A.maxhealth+=AC.BonusHealth;A.health=A.maxhealth
		A.MEndurance+=AC.BonusArmor;A.Endurance=A.MEndurance
		A.name=AC.name
	else if(istype(AC,/obj/Puppet_Summoning_Scrolls/Dragon))
		AC.Summoned=1;var/obj/Puppet_Summoning_Scrolls/Dragon/C=AC
		var/mob/Puppet/Dragon/A=new();A.Owner=src;A.health=1500+AC.BonusHealth;A.loc=locate(src.x,src.y-1,src.z)//A.loc=src.loc;
		A.PuppetOrigin=AC
		var/obj/SmokeCloud/S=new();S.loc=A.loc;src.controlled=A;src.firing=1
		if(C.AdjustableRoomCollapse)
			A.AdjustableRoomCollapsation=1
		if(C.FireBreathing)
			A.CanBreatheFire=1
		if(C.IceBreathing==1)
			A.CanBreatheIce=1
		if(C.IceBreathing==2)
			A.CanBreatheIce=2
		if(C.IceBreathing==3)
			A.CanBreatheIce=3
		if(C.AdjustableRoom)
			A.AdjustableRoom=1
			A.CanUseAdjustableRoom=1
		if(C.ExplodingReturn)
			A.ExplodingReturn=1
		if(C.StunResister)
			A.StunResister=1
		A.Mtai+=AC.BonusStrength/13;A.tai=A.Mtai
		A.maxhealth+=AC.BonusHealth;A.health=A.maxhealth
		A.MEndurance+=AC.BonusArmor;A.Endurance=A.MEndurance
		A.name=AC.name
	else
//		src.ControllingPuppet2=0;src.ControllingPuppet1=0
		src<<"Isso não é um fantoche Puppet Convocando tipo? Você encoutered um erro, por favor, poste isso em fóruns com o Puppet especificamente tentou ser convocado.";return
mob/var/tmp/PuppetSwap=0
mob/proc/PositionSwap()
	src<<"Clique na marionete que você gostaria de trocar."
	src.PuppetSwap=1
mob/proc/PuppetView()
	if(src.client.eye!=src)
		src.client.eye=src
	var/list/PuppetsList=list("")
	for(var/mob/Puppet/A in world)
		if(A.Owner==src)
			PuppetsList+=A
	var/mob/Puppet/AC = input("Qual marionete voce gostaria de ver?") in PuppetsList + list("Cancel")
	if(AC=="Cancel")
		return
	if(!AC)
		return
	src.client.eye=AC
mob/proc/PuppetReturn()
	if(src.knockedout)
		return
	if(src.client.eye!=src)
		src.client.eye=src
	var/list/PuppetsList=list("")
	for(var/mob/Puppet/A in world)
		if(A.Owner==src)
			PuppetsList+=A
	var/mob/Puppet/AC = input("Qual Marionete voce gostario q voltasse?") in PuppetsList + list("Cancel")
	if(AC=="Cancel")
		return
	if(!AC)
		return
	AC.loc=locate(src.x,src.y-1,src.z)//src.loc


mob/proc/ReturnPuppet(WhichOne="Keyboard")
	if(WhichOne=="Keyboard")
		src.ControllingPuppet1=0
	if(WhichOne=="Mouse")
		src.ControllingPuppet2=0
	for(var/mob/Puppet/A in world)
		if(A.ControlType==WhichOne&&A.Owner==src)
			var/obj/Puppet_Summoning_Scrolls/AC=A.PuppetOrigin;AC.Summoned=0
			AC.Delay=1
			var/Time=500
			if(A.Fast_Return)
				Time=250
			spawn(Time)
				AC.Delay=0
			del(A)

mob/proc/HawkSmokeScreen()//HawkSmokeScreen Beginner
	set background=1
	var/z=0
//	var/c=src.loc
	var/d=0
	var/Check=0
	var/mob/Puppet/Hawk/A
	var/Location=0
//	if(src.ControllingPuppet2==1)//pixel_x
	for(var/mob/Puppet/Hawk/P in oview(20,src))
		if(P.SmokeScreen!=0&&P.Owner==usr)
			if(P.SmokeScreen==1)
				Check=1
				A=P
			if(P.SmokeScreen==2)
				Check=2
				A=P
			if(P.SmokeScreen==3)
				Check=3
	if(Check==1&&A!=null)
		d=A.loc
		Location=d
		while(z<4)
			for(var/turf/T in oview(z,Location))
				if(get_dist(T,A)==z)
					var/n=rand(6,8)
					while(n>0)//a.pixel_x=rand(8,16);a.pixel_y=rand(10,18)
						var/obj/SmokeScreen/a=new();
						a.loc=T
						n--
			z++
			sleep(7)
	else
	//	src<<"Lolnope. [src] is the src. [usr] is the user. [A]. [A.Owner] is the Owner of the Current Hawk Puppet. This is the Value of Check: [Check]."
		return
	if(Check==2&&A!=null)
		d=A.loc
		Location=d
		while(z<4)
			for(var/turf/T in oview(z,Location))
				if(get_dist(T,A)==z)
					var/n=rand(6,8)
					while(n>0)//a.pixel_x=rand(8,16);a.pixel_y=rand(10,18)
						var/obj/SmokeScreen/a=new();
						a.loc=T
						n--
			z++
			sleep(7)
	else
	//	src<<"Lolnope. [src] is the src. [usr] is the user. [A]. [A.Owner] is the Owner of the Current Hawk Puppet. This is the Value of Check: [Check]."
		return
	if(Check==3&&A!=null)
		d=A.loc
		Location=d
		while(z<4)
			for(var/turf/T in oview(z,Location))
				if(get_dist(T,A)==z)
					var/n=rand(6,8)
					while(n>0)//a.pixel_x=rand(8,16);a.pixel_y=rand(10,18)
						var/obj/SmokeScreen/a=new();
						a.loc=T
						n--
			z++
			sleep(7)
	else
	//	src<<"Lolnope. [src] is the src. [usr] is the user. [A]. [A.Owner] is the Owner of the Current Hawk Puppet. This is the Value of Check: [Check]."
		return
mob/Puppet/Dragon/proc/PuppetFireBall()
	if(src.PuppetFireBallDelay)
		return
	src.Frozen=1
	src.firing=1
	src.PuppetFireBallDelay=1
	view()<<"[src] começa a liberar um grande pólo de aço a partir de sua boca e um cheiro de gás ressoa..."
	sleep(15)
	var/obj/Jutsu/Elemental/Katon/Goukakyuu/K=new();K.Move_Delay=0;K.loc=src.loc;K.nin=75;K.Owner=src;step(K,src.dir);sleep(1);step(K,src.dir);K.icon_state="5";K.Owner=src;K.nin=75;K.JutsuLevel=1500
	var/obj/Jutsu/Elemental/Katon/GoukakyuuTail/Q=new();Q.layer=MOB_LAYER+1
	if(src.dir==SOUTH)
		Q.pixel_y = 16
	if(src.dir==NORTH)
		Q.pixel_y=-16;Q.layer=MOB_LAYER-1
	if(src.dir==WEST)
		Q.pixel_x=8
	if(src.dir==EAST)
		Q.pixel_x = -8
	Q.loc=src.loc;step(Q,src.dir);Q.JutsuLevel=src.KatonKnowledge;K.JutsuLevel=src.KatonKnowledge
	K.loc = get_steps(src,src.dir,9)
	for(var/turf/T in getcircle(K,4))
		var/obj/Jutsu/Elemental/Katon/Goukakyuu/KK=new();KK.Move_Delay=0;KK.loc=T;KK.nin=src.nin;KK.Owner=src;KK.JutsuLevel=src.KatonKnowledge
	for(var/mob/M in getcircle(K,4))
		M.DamageProc(src.nin,"Health",Q)
		view(M)<<output("<font color=red>[M] foi atingido pelo Goukakyuu!([src.nin])</font>","Attack")
	spawn(25)
		src.Frozen=0
		src.firing=1
	spawn(250)
		src.PuppetFireBallDelay=0
	return
mob/Puppet/Dragon/proc/PuppetIceBall(HowStrong)
	if(src.Frozen||src.firing)
		return
	var/WhichType=HowStrong
	var/X=src.x
	var/Y=src.y
	var/Z=src.z
	var/G=1
	var/H=0
	var/HC=0
	var/GC=6//Max length of the poison gas
	world<<"Testinggggggggggggggg"
	if(WhichType=="Light")
		src.firing=1;
		src.Frozen=1
	//	var/obj/PoisonTail/Q=new();Q.layer=MOB_LAYER+1
	//	if(src.dir==SOUTH)
	//		Q.pixel_y = 16
	//	if(src.dir==NORTH)
	//		Q.pixel_y=-16;Q.layer=MOB_LAYER-1
	//	if(src.dir==WEST)
	//		Q.pixel_x=8
	//	if(src.dir==EAST)
	//		Q.pixel_x = -8
	//	Q.loc=src.loc;step(Q,src.dir)
		if(src.dir==NORTH)
			//Place the Poison Exhale Icon here
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X+H,Y+G,Z);A.WhichType="Light"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==SOUTH)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X-H,Y-G,Z);A.WhichType="Light"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==WEST)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X-G,Y-H,Z);A.WhichType="Light"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==EAST)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X+G,Y+H,Z);A.WhichType="Light"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		src.firing=0;
		src.Frozen=0
	if(WhichType=="Medium")
		GC=8
		src.firing=1;
		src.Frozen=1
	//	var/obj/PoisonTail/Q=new();Q.layer=MOB_LAYER+1
	//	if(src.dir==SOUTH)
	//		Q.pixel_y = 16
	//	if(src.dir==NORTH)
	//		Q.pixel_y=-16;Q.layer=MOB_LAYER-1
	//	if(src.dir==WEST)
	//		Q.pixel_x=8
	//	if(src.dir==EAST)
	//		Q.pixel_x = -8
	//	Q.loc=src.loc;step(Q,src.dir)
		if(src.dir==NORTH)
			//Place the Poison Exhale Icon here
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X+H,Y+G,Z);A.WhichType="Medium"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==SOUTH)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X-H,Y-G,Z);A.WhichType="Medium"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==WEST)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X-G,Y-H,Z);A.WhichType="Medium"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==EAST)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X+G,Y+H,Z);A.WhichType="Medium"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		src.firing=0;
		src.Frozen=0
	if(WhichType=="Heavy")
		GC=10
		src.firing=1;
		src.Frozen=1
	//	var/obj/PoisonTail/Q=new();Q.layer=MOB_LAYER+1
	//	if(src.dir==SOUTH)
	//		Q.pixel_y = 16
	//	if(src.dir==NORTH)
	//		Q.pixel_y=-16;Q.layer=MOB_LAYER-1
	//	if(src.dir==WEST)
	//		Q.pixel_x=8
	//	if(src.dir==EAST)
	//		Q.pixel_x = -8
	//	Q.loc=src.loc;step(Q,src.dir)
		if(src.dir==NORTH)
			//Place the Poison Exhale Icon here
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X+H,Y+G,Z);A.WhichType="Heavy"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==SOUTH)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X-H,Y-G,Z);A.WhichType="Heavy"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==WEST)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X-G,Y-H,Z);A.WhichType="Heavy"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		if(src.dir==EAST)
			while(G<=GC)
				while(H<=HC)
					var/obj/IceBall/A=new();A.loc=locate(X+G,Y+H,Z);A.WhichType="Heavy"
					H++
				sleep(2)
				if(G>5)
					H=0
					HC+=1
					H=HC*(-1)
				else if(G==5)
					H=-3
					HC=3
				else if(G<3)
					H=0
					H-=G
					HC+=1
				else
					H=-2
					HC=2
				G++
		src.firing=0;
		src.Frozen=0
obj/SmokeScreen//Attachment for Hawk Puppet
	icon='NarutoStuff.dmi'
	icon_state="SmokeR"
	layer=MOB_LAYER+1
	New()
		flick("SmokeA",src)
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		spawn(10)//was spawn(1) 11/16/12
			src.pixel_x+=rand(-16,16)
			src.pixel_y+=rand(-16,16)
			while(src)
				for(var/mob/M in src.loc)
					if(M in OnlinePlayers)
						if(M.Status!="Ashed"&&!M.knockedout)
							M.Status="Ashed"
							M.StatusEffected=10
				if(src.dir==NORTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-1,8)
				if(src.dir==NORTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-1,8)
				if(src.dir==SOUTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-8,1)
				if(src.dir==SOUTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-8,1)
				sleep(10)
		var/r=rand(20,25)//was(70,120)
		spawn(r)
			del(src)
	Del()
		flick("SmokeD",src)
		sleep(2)
		..()
obj/IceBall//Attachment for Dragon Puppet
	icon='NarutoStuff.dmi'
	icon_state="IceR"
	layer=MOB_LAYER+1
	var/WhichType="Light"
	New()
		flick("IceA",src)
		var/randz=rand(1,4)
		if(randz==1) src.dir=NORTHEAST
		if(randz==2) src.dir=NORTHWEST
		if(randz==3) src.dir=SOUTHEAST
		if(randz==4) src.dir=SOUTHWEST
		spawn(2)//was spawn(1) 11/16/12
			src.pixel_x+=rand(-16,16)
			src.pixel_y+=rand(-16,16)
			while(src)
			//	var/mob/O=src.Owner
				for(var/mob/M in src.loc)
					if(M in OnlinePlayers)
						M.FrozenCount++
						if(WhichType=="Light")
							M.health-=pick(15,20,25)
							M.stamina-=pick(30,50)
						else if(WhichType=="Medium")
							M.health-=pick(25,30)
							M.stamina-=pick(50,95)
						else
							M.health-=pick(38.5,57.5)
						if(M.FrozenCount>=5)
							var/obj/Jutsu/Elemental/Hyouton/IcePrison/A=new();A.loc=M.loc;A.Owner=src
							M.FrozenCount=-10
			//	for(var/turf/T in src)
			///		if(prob(20))
				//		var/obj/Jutsu/Elemental/Hyouton/IField/A=new();A.loc=T.loc
				//	world<<"[M]'s Frozen Count is [M.FrozenCount]."
				for(var/turf/T in oview(0,src))//src.loc)//L.dir = src.dir;L.Owner = src.Owner
				//		world<<"Attempting to create Water"
				//	var/obj/Jutsu/Elemental/Hyouton/IField/A=new();A.loc=A.dir=src.dir;A.Owner=src.Owner;
				//	if((locate(/obj/Jutsu/Elemental/Suiton/Owater) in T))
					if(prob(10))
						if(!(locate(/obj/Jutsu/Elemental/Hyouton/IField) in T))
							var/obj/Jutsu/Elemental/Hyouton/IField/AA=new/obj/Jutsu/Elemental/Hyouton/IField(locate(T.x,T.y,T.z))
							AA.layer=T.layer
							AA.Owner=src
				if(src.dir==NORTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-1,8)
				if(src.dir==NORTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-1,8)
				if(src.dir==SOUTHEAST)
					src.pixel_x+=rand(-1,8)
					src.pixel_y+=rand(-8,1)
				if(src.dir==SOUTHWEST)
					src.pixel_x+=rand(-8,1)
					src.pixel_y+=rand(-8,1)
				sleep(3)
		var/r=rand(50,100)//was(70,120)
		spawn(r)
			del(src)
	Del()
		flick("IceD",src)
		sleep(2)
		..()
mob/proc/SenbonLauncher(Size,Rounds)
//	var/R=Rounds
	if(Size>8) Size=8
	if(Rounds>8) Rounds=8
	var/mob/Puppet/Talon/A
	var/Check=0
//	var/Location=0
//	if(src.ControllingPuppet2==1)//pixel_x
	for(var/mob/Puppet/Talon/P in oview(20,src))
		if(P.Owner==usr)
			Check=1
			A=P
	var/rounds=Rounds//Number of rounds fired this number can be changed to smaller if to oped.
	while(rounds>0&&Check==1) //handseal icon state automatically freezes them because its coded that way				// and it allows the user to cancel the jutsu prematurely
		for(var/i=0, i<Size*2, i++)
			spawn()
				var/obj/PuppetSenbon/K=new();K.loc=A.loc;K.Owner=src;K.dir=A.dir;K.nin=src.nin;K.Move_Delay=0
				K.InitialDisplacement=K.SetInitialDisplacement(-12,12)
				walk(K,A.dir)
		rounds--;
		sleep(2);//delay btw rounds
obj/PuppetSenbon
	icon='Weapons.dmi'
	icon_state = "needles"
	density=1
	Move_Delay=0
	var/StunChance=0;
	var/nin=10
	var/Owner
	var/InitialDisplacement="None"
	New()
		..()
		spawn(80)
			del(src)
	Move()
		if(src.JutsuSpread(src.InitialDisplacement,4,8))
			..()
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			var/mob/O=src.Owner
			var/damage=120//O.SenbonMastery+(rand(10,30)+(src.nin*0.15))//If the user goes pure cap the move will do 100damage.
									   //The +28 insures the move does min of 28 damage.
			if(damage>120)//Caps the damage in case they use a nin buff transformation so move doesn't become oped.
				damage=120;
			var/random=(rand(6,8)/10)//Number changed if want to buff or nerf the damage.
									//The random is to give it that feel of not always hitting the same.
			damage*=random;//Damage multi is done this way because rand can only generate integers so random btw .6 and .8 cant be done.
						  //So rand(6,8)/10 is done instead then multiplied to damage.
			if(M.icon_state=="Block"&&prob(5*M.DeflectionZ))//Chance to block the incoming senbon
				view(M)<<output("<font>Você desviou do senbon!</font>","output")
				M.HitBack(1,src.dir)//Push back even though you blocked its still traveling fast enough
				del(src);
				return;
			if(M.Kaiten)
				view(M)<<output("<font>You deflect the senbon!</font>","output")
				del(src);
				return;
			if(src.StunChance==1&&prob(30))
				M.Stun=10;
			M.DamageProc(damage,"Health",O)
			view(M)<<output("<font>[M] Foi acertado pelo dano de ([damage]) damage!</font>","Attack")
			viewers()<<sound('HitStrong.wav',0,0,1)
			M.Bloody();M.Bloody();M.Bloody()
			M.HitBack(1,src.dir)//Push back effect because there being smacked with senbon.
			del(src)
		if(istype(A,/turf/))
			var/turf/T = A
			if(T.density)
				del(src)
turf/Click()
	if(usr.ControllingPuppet1)
		var/Check=0
		var/mob/USER=usr
		for(var/mob/Puppet/Dragon/P in oview(10,usr))
			if(P.Owner==usr)
				USER=P.Owner
				Check=1
		if(Check==1)
			walk_to(USER,src)
		//	world<<"The user of this proc is [usr]. The source is [src]. [USER] is the owner of the Dragon Puppet."
			return
		//	step_to(USER,T)
		//	sleep(50)
		//	USER.loc=T

		//	world<<"The user of this proc is [usr]. The source is [src]. [USER] is the owner of the Dragon Puppet."
			//	walk_to(USER,src)
			//	world<<"The user of this proc is [usr] and to double check it's [USER]. The source is [src]. [P] is the owner of the Dragon Puppet."

		/*
	for(var/mob/Puppet/Dragon/P in oview(10,usr))
		var/mob/A=P.Owner
		var/turf/Z=src
	//	walk_to(usr,src)//The user of this proc is Hoshigaki, Taku. The source is the beach. Hoshigaki, Taku is the owner of the Dragon Puppet.
		world<<"The user of this proc is [usr]. The source is [Z]. [A] is the owner of the Dragon Puppet."
//		usr.loc=src
		walk_to(usr,Z,,,)
	//	walk(usr,src,,)
		world<<"[usr] has moved to [src]."
		*/
	..()
//client/Click(object)
//	if(istype(object,/turf/))
//		var/turf/T=object
//		for(var/mob/M in world)
//		//	if(M==usr)
//			walk_to(T,M)
//	..()