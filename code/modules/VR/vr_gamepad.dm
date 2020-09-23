#define RESPAWNS_FOR_PAYMENT 3
#define POINTS_FOR_CHEATER 10

/obj/machinery/gamepod
	name = "\improper gamepod"
	desc = "A gaming pod for wasting time."
	icon = 'icons/obj/machines/gamepod.dmi'
	icon_state = "gamepod_open"
	density = TRUE
	anchored = TRUE
	var/is_payed = FALSE
	var/mob/living/carbon/human/occupant = null
	var/datum/mind/occupant_mind
	var/test = 0

/obj/machinery/gamepod/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/card/emag))
		if(emagged)
			to_chat(user, SPAN_NOTICE("It is already broken."))
			return
		else
			to_chat(user, SPAN_NOTICE("You broke something."))
		emagged = TRUE
	else if(isScrewdriver(I))
		playsound(loc, 'sound/items/Screwdriver.ogg', 50, 1)
		if(!panel_open)
			panel_open = 1
			if(occupant)
				move_outside()
			to_chat(user, SPAN_NOTICE("You open the maintenance hatch of [src]."))
			return
		panel_open = 0
		to_chat(user, SPAN_NOTICE("You close the maintenance hatch of [src]."))
		return
	else if(isCrowbar(I))
		if(!panel_open)
			to_chat(user, SPAN_NOTICE("You must open the maintenance hatch first."))
			return
		playsound(loc, 'sound/items/Crowbar.ogg', 50, 1)
		to_chat(user, SPAN_NOTICE("You pry off the circutry."))
		var/obj/machinery/constructable_frame/machine_frame/M = new /obj/machinery/constructable_frame/machine_frame(loc)
		M.state = 2
		M.icon_state = "box_1"
		for(var/obj/item/T in component_parts)
			T.loc = src.loc
		qdel(src)
		return


/obj/machinery/gamepod/verb/get_inside()
	set name = "Enter Pod"
	set category = "Object"
	set src in oview(1)

	if(usr.stat != CONSCIOUS || !(ishuman(usr)))
		return

	move_inside(usr)
	to_chat(usr, SPAN_WARNING("Welcome to the informational highway."))

/obj/machinery/gamepod/MouseDrop_T(mob/target, mob/user)
	if(user != target || target.stat != CONSCIOUS || !(ishuman(target)))
		return

	move_inside(target)

/obj/machinery/gamepod/verb/change_destination()
	set name = "Change Target"
	set category = "Object"
	set hidden = 1

	//var/choice = input(usr, "")

/obj/machinery/gamepod/proc/move_inside(mob/living/carbon/human/H, mob/user)

	if(occupant)
		to_chat(user, SPAN_NOTICE("[src] is in use."))
		return

	if(!powered())
		return

	if(ishuman(usr))
		for(var/obj/item/weapon/implant/cyberdock/E in usr)
			test = test + 1
		if(test < 1)
			to_chat(usr, "You lack the necessary implant to get into the Cyberspace dock.")
			return

	icon_state = "gamepod"
	H.forceMove(src)
	occupant = H
	create_body()

/obj/machinery/gamepod/proc/create_body(mob/user)
	if(!GLOB.thunderfield_spawns_list.len)
		to_chat(user, SPAN_WARNING("The Cyberspace firewall is up and running, no luck getting in this day."))
		return
	if(!occupant.mind)//How that can even happen?
		return
	var/obj/effect/landmark/spawnpoint = pick(GLOB.thunderfield_spawns_list)
	//Here should be some checks for safety of new vrbody
	var/mob/living/carbon/human/vrhuman/vrbody = new /mob/living/carbon/human/vrhuman(spawnpoint.loc)

	if(emagged)
		occupant.mind.thunderfield_cheater = TRUE
		occupant.mind.thunder_points = POINTS_FOR_CHEATER
	occupant.mind.thunder_respawns = RESPAWNS_FOR_PAYMENT
	occupant.mind.thunderfield_owner = occupant
	vrbody.vr_mind = occupant.mind
	occupant_mind = occupant.mind //We need to store user's mind to return it to his original body in case of some problems
	occupant.mind.transfer_to(vrbody)
	vrbody.name = occupant.mind.name
	is_payed = FALSE

/obj/machinery/gamepod/verb/get_outside()
	set name = "Exit Pod"
	set category = "Object"
	set src in oview(1)

	if(usr != occupant || usr.stat != CONSCIOUS || !(ishuman(usr)))
		to_chat(usr, SPAN_NOTICE("You can't do that."))
		return
	move_outside()

/obj/machinery/gamepod/relaymove(mob/user)
	..()
	move_outside()

/obj/machinery/gamepod/proc/move_outside()
	if(occupant_mind) //We need to get player back
		if(occupant in src)
			occupant.dropInto(loc)
		to_chat(occupant, SPAN_WARNING("Temporary issues, VR aborted."))
		occupant_mind.thunderfield_cheater = FALSE
		occupant_mind = null
		occupant = null
	icon_state = "gamepod_open"


/obj/machinery/gamepod/emp_act()
	if(occupant)
		move_outside()
	..()

/obj/machinery/gamepod/power_change()
	. = ..()
	if(occupant && (stat & NOPOWER))
		move_outside()

/obj/machinery/gamepod/Destroy()
	if(occupant)
		move_outside()
	return ..()

#undef RESPAWNS_FOR_PAYMENT
#undef PRICE_PER_USE
#undef POINTS_FOR_CHEATER
