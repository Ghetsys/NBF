var/CraftMastery=0;
var/MiningMaster=0;
obj/Material
	var
		name=""
		PlacementWeight=0
		Amountof=0
	icon = 'Icons/scrolls.dmi'
	icon_state = "7"
	verb
		Get()
			set src in oview(1)
			src.loc = usr
			usr<<"You picked up [src]"
		Drop()
			src.loc=locate(usr.x,usr.y-1,usr.z)
		CraftArmor()
			usr.CreateArmor(src.name)
	Iron
		name="Iron"
		PlacementWeight=5
	Steal
		name="Steal"
		PlacementWeight=10
	Coal
		name="Coal"
		PlacementWeight=10
	Silver
		name="Silver"
		PlacementWeight=30
	Gold
		name="Gold"
		PlacementWeight=400
	Platinum
		name="Platinum"
		PlacementWeight=10
	Diamond
		name="Diamond"
		PlacementWeight=500
	Azure
		name="Azure"
		PlacementWeight=100
	Enton
		name="Enton"
		PlacementWeight=100
	SarutobiCloth
		name="SarutobiCloth"
		PlacementWeight=15
	SatakeCloth
		name="SatakeCloth"
		PlacementWeight=15
mob/proc/CreateArmor(Material)
	var/X=Material
		if(X=="Iron")
			var/obj/Clothes/Armor/Fe=new();
			Fe.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'//Change this to change the icon.
			Fe.name="Iron Armor"
			Fe.shirtred=172
			Fe.shirtgreen=172
			Fe.shirtblue=172
			Fe.PlacementWeight=100;
			Fe.ArmorAddOn=5;
			Fe.ArmorType="Iron";
			Fe.loc=usr
			if(prob(20))
				usr.CraftMastery+=.1
			if(usr.CraftMastery>100)
				usr.CraftMaster=100;

		if(X=="Steal")
			if(CraftMastery>=20)
				var/obj/Clothes/Armor/S=new();
				S.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				S.name="Steal Armor"
				S.shirtred=241
				S.shirtgreen=232
				S.shirtblue=255
				S.PlacementWeight=300;
				S.ArmorAddOn=15;
				S.ArmorType="Steal";
				S.loc=usr
				if(prob(20))
					usr.CraftMastery+=.2
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Steal armor."
		if(X=="Coal")
			if(CraftMastery>=25)
				var/obj/Clothes/Armor/C=new();
				C.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				C.name="Coal Armor"
				C.shirtred=0
				C.shirtgreen=0
				C.shirtblue=0
				C.PlacementWeight=100;
				C.ArmorAddOn=10;
				C.ArmorType="Coal";
				C.loc=usr
				if(prob(20))
					usr.CraftMastery+=.2
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Coal armor."
		if(X=="Silver")
			if(CraftMastery>=30)
				var/obj/Clothes/Armor/Si=new();
				S.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				S.name="Silver Armor"
				S.shirtred=0
				S.shirtgreen=0
				S.shirtblue=0
				Si.PlacementWeight=150;
				Si.ArmorAddOn=15;
				Si.ArmorType="Silver";
				Si.loc=usr
				if(prob(20))
					usr.CraftMastery+=.5
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Silver armor."
		if(X=="Gold")
			if(CraftMastery>=30)
				var/obj/Clothes/Armor/Au=new();
				Au.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				Au.name="Gold Armor"
				Au.shirtred=212
				Au.shirtgreen=175
				Au.shirtblue=55
				Au.PlacementWeight=200;
				Au.ArmorAddOn=15;
				Au.ArmorType="Gold";
				Au.loc=usr
				if(prob(20))
					usr.CraftMastery+=.5
				if(prob(10))
					usr.CraftMastery+=1
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Gold armor."
		if(X=="Platinum")
			if(CraftMastery>=40)
				var/obj/Clothes/Armor/P=new();
				P.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				P.name="Platinum Armor"
				P.shirtred=0
				P.shirtgreen=0
				P.shirtblue=0
				P.PlacementWeight=10;
				P.ArmorAddOn=25;
				P.ArmorType="Platinum";
				P.loc=usr
				if(prob(20))
					usr.CraftMastery+=1
				if(prob(10))
					usr.CraftMastery+=1
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Platinum armor."
		if(X=="Diamond")
			if(CraftMastery>=40)
				var/obj/Clothes/Armor/D=new();
				D.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				D.name="Diamon Armor"
				D.shirtred=255
				D.shirtgreen=255
				D.shirtblue=236
				D.PlacementWeight=10;
				D.ArmorAddOn=25;
				D.ArmorType="Diamond";
				D.loc=usr
				if(prob(20))
					usr.CraftMastery+=1
				if(prob(10))
					usr.CraftMastery+=1
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Diamon armor."
		if(X=="Azure")
			if(CraftMastery>=60)
				var/obj/Clothes/Armor/A=new();
				A.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				A.name="Azure Armor"
				A.shirtred=51
				A.shirtgreen=102
				A.shirtblue=153
				A.PlacementWeight=50;
				A.ArmorAddOn=30;
				A.ArmorType="Azure";
				A.loc=usr
				if(prob(20))
					usr.CraftMastery+=2
				if(prob(10))
					usr.CraftMastery+=5
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Azure armor."
		if(X=="Enton")
			if(CraftMastery>=60)
				var/obj/Clothes/Armor/E=new();
				E.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				E.name="Enton Armor"
				E.shirtred=0
				E.shirtgreen=0
				E.shirtblue=0
				E.PlacementWeight=50;
				E.ArmorAddOn=30;
				E.ArmorType="Enton";
				E.loc=usr
				if(prob(20))
					usr.CraftMastery+=3
				if(prob(10))
					usr.CraftMastery+=5
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Enton armor."
		if(X=="SarutobiCloth")
			if(CraftMastery>=80)
				var/obj/Clothes/Armor/SC=new();
				SC.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				SC.name="Sarutobi Armor"
				SC.shirtred=255
				SC.shirtgreen=153
				SC.shirtblue=0
				SC.PlacementWeight=30;
				SC.ArmorAddOn=30;
				SC.ArmorType="SarutobiCloth";
				SC.loc=usr
				if(prob(20))
					usr.CraftMastery+=1
				if(prob(2))
					usr.CraftMastery+=10
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Sarutobi Clan armor."

		if(X=="SatakeCloth")
			if(CraftMastery>=80)
				var/obj/Clothes/Armor/SaC=new();
				SaC.icon='Icons/New Base/Clothing/Official Clothing/ANBUArmor.dmi'
				SaC.name="Satake Armor"
				SaC.shirtred=51
				SaC.shirtgreen=102
				SaC.shirtblue=173
				SaC.PlacementWeight=30;
				SaC.ArmorAddOn=30;
				SaC.ArmorType="SatakeCloth";
				SaC.loc=usr
				if(prob(20))
					usr.CraftMastery+=1
				if(prob(2))
					usr.CraftMastery+=10
				if(usr.CraftMastery>100)
					usr.CraftMaster=100;
			else
				usr<<"You dont have enough mastery to craft Satake Clan armor."
mob/proc/Mining()
	var/turf/A
	var/Foundsomething=0;
	var/Searchloc=locate(src.x+1,src.y,src.z)
	for(turf/M in Searchloc)
		A=M;
	if(A.icon=='Landscapes.dmi'&&A.icon_state=="sand")
		src<<"You begin to mine [A]."
		var/G=rand(1,100)
		if(G==1&&src.MiningMastery>=70)
			src<<"You have found Sarutobi Cloth"
			src<<"This is a very rare material used to craft advance armor."
			var/obj/Material/SarutobiCloth/B=new();B.loc=usr
			Foundsomething=1;
		if(G==2&&src.MiningMastery>=80)
			src<<"You have found Satake Cloth"
			src<<"This is a very rare material used to craft advance armor."
			var/obj/Material/SatakeCloth/C=new();C.loc=usr
			Foundsomething=1;
		if(G<10&&MiningMastery>=40)
			src<<"You have found a diamond"
			var/obj/Material/Diamond/D=new();D.loc=usr
			Foundsomething=1;
		if(G>80&&MiningMastery>=20)
			src<<"You have found a piece of coal"
			var/obj/Material/Coal/Ca=new();Ca.loc=usr
			Foundsomething=1;
		if(Foundsomething==0)
			src<<"You didn't find any materical."
	if(A.name=="Mountain")
		src<<"You begin to mine [A.name]."
		var/H=rand(1,100)
		if(G==2&&src.MiningMastery>=80)
			src<<"You have found Azure Alloy"
			src<<"This is a very rare material used to craft advance equipment."
			var/obj/Material/Azure/C=new();C.loc=usr
			Foundsomething=1;
		if(G<10&&MiningMastery>=50)
			src<<"You have found a sheet of Platinum metal."
			var/obj/Material/Platinum/PP=new();PP.loc=usr
			Foundsomething=1;
		if(G>80&&MiningMastery>=20)
			src<<"You have found a piece of Coal"
			var/obj/Material/Coal/Ca=new();Ca.loc=usr
			Foundsomething=1;
		if(G<79&&G>15)
			src<<"You have found a piece of Iron"
			var/obj/Material/Iron/Fa=new();Fa.loc=usr
			Foundsomething=1;
		if(Foundsomething==0)
			src<<"You didn't find any materical."