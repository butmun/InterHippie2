//TOOLS
//The brander
/obj/item/weapon/brander
	name = "branding device"
	desc = "A special baton, heated red hot by electricity for branding heretics, and other criminals. Activate it to select the brand."
	icon_state = "brander"
	item_state = "baton"
	var/brand = "HERETIC"

/obj/item/weapon/brander/attack(mob/living/carbon/human/H, mob/living/user)
	var/obj/item/organ/external/head/O = locate() in H.organs
	if(O && !H.branded)
		if(!user.doing_something)
			user.doing_something = 1
			H.visible_message("<span class='danger'>[user] begins to brand [H]\'s face with the [src]!</span>",
								"<span class='danger'>[user] begins to brand you!</span>")
			if(do_after(user, 50))
				H.custom_pain("[pick("OH GOD IT BURNS SO BAD!", "OH GOD WHY!", "OH GOD YOUR FACE!")]", 250, affecting = O)
				H.branded = brand
				user.doing_something = 0
				playsound(H, 'sound/items/Welder2.ogg', 40, 1, -1)
				var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
				head.markings["brand"] = list("color" = "#330000", "datum" = new /datum/sprite_accessory/marking/brandface)
				H.force_update_limbs()
			else
				to_chat(user, "<span class='notice'>You fail in branding.</span>")
				user.doing_something = 0
				return

/obj/item/weapon/brander/attack_self(mob/user)
	..()
	var/input = input(user,"Select Brand Type", "Brands") as null|anything in list("HERETIC", "THIEF", "RAPIST", "CRIMINAL")
	if(input)
		brand = input

//The machine
/obj/machinery/arbiter_computer
	var/mob/living/suspect
	name = "Heretic scanner machine"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "arbiter_computer"
	density = 1
	anchored = 1

/obj/machinery/arbiter_computer/attackby(var/obj/item/I, var/mob/user)
	visible_message("<span class='notice'>The [src] beeps and wizzes.\"</span>")

/obj/machinery/arbiter_computer/attack_hand(mob/user as mob)
	..()
	visible_message("<span class='notice'>The [src] beeps: \"Scan the subject with a scanner, and then use the scanner on this machine for results.\"</span>")


/obj/machinery/arbiter_computer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return
