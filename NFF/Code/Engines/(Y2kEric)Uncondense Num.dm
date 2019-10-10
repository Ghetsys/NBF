proc
	y2k_Uncondense_Num(num=0)
		set background = 1
		if(!isnum(num)) return 0
		var/num_text = "[num]"
		var/newNum = ""
		var/e_loc = findtext(num_text,"e")
		if(!e_loc) return num
		var/num_1 = copytext(num_text,1,e_loc)
		var/num_2 = copytext(num_text,e_loc+2,length(num_text)+1)
		var/newNum_1 = text2num(num_1)
		var/newNum_2 = text2num(num_2)
		var/multiply = ""
		for(var/loop = 1 to newNum_2)
			multiply += "0"
		multiply = text2num("1[multiply]")
		newNum = num2text(newNum_1*multiply,newNum_2+1)
		return newNum
