/datum/vec2
	var/x
	var/y

/datum/vec2/New(var/x, var/y)
	src.x = x
	src.y = y


/proc/screenloc2vec2(var/screenloc)
	var/list/xy = splittext(screenloc,",")
	var/list/xcomp = splittext(xy[1], ":")
	var/list/ycomp = splittext(xy[2], ":")
	return new/datum/vec2(text2num(xcomp[1]) + text2num(xcomp[2])/32, text2num(ycomp[1]) + text2num(ycomp[2])/32)