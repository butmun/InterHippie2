/obj/machinery/computer/arbiter_computer
	var/mob/living/suspect = null
	name = "IA Examination Object"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "arbiter_computer"
	density = 1
	anchored = 1
	var/obj/item/weapon/card/id/scan = null
	var/authenticated = null
	var/scanner_results = null
	var/rank = null

/obj/machinery/computer/arbiter_computer/attackby(var/obj/item/I, var/mob/user)
	..()

/obj/machinery/computer/arbiter_computer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return

/obj/machinery/computer/arbiter_computer/attack_hand(mob/user as mob)
	..()
	/*
	visible_message("<span class='notice'>The [src] beeps: \"Scan subject with arbiter scanner, and then use the scanner on this machine for results.\"</span>")
	//visible_message("<span class='notice'>The [src] beeps: \"Verina's current request is [SSverina.last_fire]\"</span>")
	var/list/visible_locations = SSverina.get_shrine_locations()
	visible_message("<span class='notice'>The [src] beeps: \"I have detected shrines in the following locations: [visible_locations.Join(", ")]\"</span>")
	*/
	ui_interact(user)

/obj/machinery/computer/arbiter_computer/hear_talk(mob/living/M as mob, msg, var/verb="says", datum/language/speaking=null)
	if (msg == accepted_prayer && M.religion_is_legal())
		if(istype(scan, /obj/item/weapon/card/id))  //We have an ID inside
			if(check_access(scan))
				if(scan.assignment == "Supervisor Agent" || scan.assignment == "IA Agent")
					visible_message("<span class='notice'>Welcome [scan.assignment].  Glory to science, and a blessing upon you.</span>")
					authenticated = 1
				else
					visible_message("<span class='notice'>This console cannot be used by feeble men.</span>")
		else
			visible_message("<span class='notice'>Please insert an ID card first.</span>")
			playsound(src, "sound/machines/buttonbeep.ogg", 25, 0, 1)
	else
		visible_message("<span class='notice'>Begone, fool!</span>")
	return

/obj/machinery/computer/arbiter_computer/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	/*
	var/list/visible_locations = SSverina.get_shrine_locations()
	var/dat = list()
	dat = text("Insert ID to confirm identity: <A href='?src=\ref[];choice=Confirm Identity'>----------</A><HR>", src)
	if (scan)
		dat = text("Speak the prayer to confirm identity: <A href='?src=\ref[];choice=Confirm Identity'>[]</A><HR>", src, scan.name)
	if (authenticated)
		if (SSverina.request_item )
			dat += text("Verina is currently demanding <b> [SSverina.request_amount] [SSverina.request_item]s </b>, in <b>[round(SSverina.request_time/60)] minutes! </b><HR>")
		else
			dat += text("Verina is currently satiated. <HR>")
		if(visible_locations.len > 0)
			dat += text("verina has detected shrines in the following locations: <strong>[visible_locations.Join(", ")]<strong> <HR>")
		dat += text("<A href='?src=\ref[];choice=Log Out'>{Log Out}</A>",src)
	user << browse(text("<HEAD><TITLE>Arbiter Records</TITLE></HEAD><TT>[]</TT>", dat), "window=arbiter_rec;size=600x400")
	onclose(user, "arbiter_rec")
	*/

/obj/machinery/computer/arbiter_computer/Topic(href, href_list)
	if(..())
		return 1
	if ((usr.contents.Find(src) || (in_range(src, usr) && istype(loc, /turf))) || (istype(usr, /mob/living/silicon)))
		usr.set_machine(src)
		switch(href_list["choice"])
			if("Confirm Identity")
				if (scan)
					if(istype(usr,/mob/living/carbon/human) && !usr.get_active_hand())
						usr.put_in_hands(scan)
					else
						scan.loc = get_turf(src)
					scan = null
				else
					var/obj/item/I = usr.get_active_hand()
					if (istype(I, /obj/item/weapon/card/id) && usr.unEquip(I))
						I.loc = src
						scan = I
			if("Log Out")
				authenticated = null
	add_fingerprint(usr)
	updateUsrDialog()
	return