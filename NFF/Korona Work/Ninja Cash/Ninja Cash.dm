/*
Mitchell Quinn
Ninja Cash System

The idea for this system is basically to have a system that allows for editing people in a fair and balance way.


Everyone will have the oppertunity to get these upgrades it will basically be an npc who sells them.
*/

mob/var/NinjaCash = 0;
mob/var/CharacterCooldown = 0;


obj/NinjaCash
	ExpScroll
		icon='scrolls.dmi'
		icon_state="cash scroll"

		name="Pergaminio de Exp(25k)"
		/*Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return*/
		verb
			Pegar()
				set src in oview(1)
				usr<<"Você pegou o pergaminio."
				src.Move(usr)

			Usar()
				src.Utilize(usr)
			Largar()
				src.Dropping(usr)

		proc
			Utilize(mob/M)
				M=usr
				if(usr.JutsuDelay<0)
					usr.JutsuEXPCost+=(25000)
					usr<<"Você usou o Pergaminio de Experiencia, você ganhou experiencia no jutsu que esta aprendendo!"
					usr.SaveK()
					del(src)
				else
					usr<<"Melhor guardar o pergaminio para outro momento....."
					return
			Dropping(mob/M)
				src.loc=locate(usr.x,usr.y-1,usr.z)
				view(usr)<<"[usr] largou [src]."
				usr.SaveK()
				return


	CooldownScroll
		icon='scrolls.dmi'
		icon_state="cash scroll"

		name="Pergaminio Tempo de Recarga"
		/*Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return*/
		verb
			Pegar()
				set src in oview(1)
				usr<<"Você pegou o pergaminio."
				src.Move(usr)

			Usar()
				src.Utilize(usr)
			Largar()
				src.Dropping(usr)

		proc
			Utilize(mob/M)
				M=usr
				if(usr.JutsuDelay>0)
					usr.JutsuDelay-=(50000)
					usr<<"Seu Jutsu Aprendizagem foi reduzido!!"
					usr.SaveK()
					del(src)
				else
					usr<<"Melhor guardar o pergaminio para outro momento.."
					return
			Dropping(mob/M)
				src.loc=locate(usr.x,usr.y-1,usr.z)
				view(usr)<<"[usr] largou [src]."
				usr.SaveK()
				return

	CharacterBuildingScroll
		icon='scrolls.dmi'
		icon_state="cash scroll"

		name="Melhora de Pontos (+2SP, +5PJ)"
		/*Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return*/
		verb
			Pegar()
				set src in oview(1)
				usr<<"Você pegou o pergaminio."
				src.Move(usr)

			Usar()
				src.Utilize(usr)
			Largar()
				src.Dropping(usr)

		proc
			Utilize(mob/M)
				M=usr
				if(usr.CharacterCooldown==0)
					usr.CharacterCooldown=1
					usr.StartingPoints +=2
					usr.ElementalPoints+=5
					usr<<"Você usou o Pergaminio de Melhora dos pontos"
					usr.SaveK()
					del(src)
				else
					usr<<"Você ja usou o Pergaminio de Melhora dos pontos"
					return
			Dropping(mob/M)
				src.loc=locate(usr.x,usr.y-1,usr.z)
				view(usr)<<"[usr] largou [src]."
				usr.SaveK()
				return


	MangekyouEyeRestore
		icon='scrolls.dmi'
		icon_state="cash scroll"

		name="Mangekyou Olho restaurado"
		/*Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return*/
		verb
			Pegar()
				set src in oview(1)
				usr<<"Você pegou o pergaminio."
				src.Move(usr)

			Usar()
				src.Utilize(usr)
			Largar()
				src.Dropping(usr)

		proc
			Utilize(mob/M)
				M=usr
				if(usr.MUses > 0)
					usr.MUses = 0
					usr<<"Seus olhos foram restaurados."
					usr.SaveK()
					del(src)
				else
					usr<<"Você não precisa usar esse pergaminio."
					return
			Dropping(mob/M)
				src.loc=locate(usr.x,usr.y-1,usr.z)
				view(usr)<<"[usr] largou [src]."
				usr.SaveK()
				return



	NameChangeScroll
		icon='scrolls.dmi'
		icon_state="cash scroll"

		name="Name Change Scroll"
		/*Click()
			if(src in usr.contents)
				src.Utilize(usr)
			else
				usr<<"You need to pick the scroll up first!"
				return*/
		verb
			Pegar()
				set src in oview(1)
				usr<<"Você pegou o pergaminio."
				src.Move(usr)

			Usar()
				src.Utilize(usr)
			Largar()
				src.Dropping(usr)

		proc
			Utilize(mob/M)
				M=usr
				switch(input(usr,"[src]: Você quer mudar o seu nome?") in list ("Sim, eu quero mudar o meu nome.","Nao, eu gosto do meu nome"))
					if("Nao, eu gosto do meu nome")
						usr.SaveK()
						return
					if("Sim, eu quero mudar o meu nome.")
						usr.FirstName = input(usr,"Escolha um nome pro seu Personagem.","Seu nome",usr.FirstName)
						usr.SaveK()
						usr<<"Mudança de Nome Completa."
						return


			Dropping(mob/M)
				src.loc=locate(usr.x,usr.y-1,usr.z)
				view(usr)<<"[usr] largou [src]."
				usr.SaveK()
				return