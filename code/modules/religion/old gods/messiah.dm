/datum/religion/messiah
	name = MESSIAH
	holy_item = new /obj/item/crucifix()
	shrine = /obj/old_god_shrine/messiah_shrine
	whisper_lines = list("Father, son, ghost.", "Peace be with you, my humble servant.", "Turn the other cheek.")
	offering_items = list(/obj/item/weapon/flame/candle/, /obj/effect/decal/cleanable/blood/)

/datum/religion/messiah/generate_random_phrase()
		var/phrase = pick("Oh great [name] ", "Oh [name]. ", "[name], our Lord and Saviour. ")
		phrase += pick("You forgive our sins. ", "You will come again. ", "You bathe our [pick("outpost","kingdom","cities")] in your mercy. ")
		phrase += pick("Father son and holy ghost. ", "[name] save us all. ", "[name] guide us all. ")
		phrase += "Amen"
		return phrase

/datum/old_god_spell/imbue
	name = "Imbue"
	requirments =  list("NORTH" = /obj/item/weapon/flame/candle/,
						"EAST" = /obj/item/weapon/flame/candle/,
						"WEST" = /obj/item/weapon/flame/candle/,
						"SOUTH" = /obj/item/weapon/flame/candle/)
	old_god = MESSIAH

	spell_effect(var/mob/living/user)
		for(var/obj/item/crucifix/x in user.contents)
			x.empowered = TRUE
			x.update_icon()

	//We want to leave behind lit candles
	spell_consume(var/list/spell_components)
		for(var/O in spell_components)
			if(istype(spell_components[O],/obj/item/weapon/flame/candle/))
				spell_components[O].light("")
		return

/datum/old_god_spell/blind
	name = "Blind"
	requirments =  list("NORTH" = /obj/item/clothing/glasses/sunglasses/,
						"EAST" = /obj/item/weapon/flame/candle/,
						"WEST" = /obj/item/weapon/flame/candle/,
						"SOUTH" = /obj/item/weapon/paper)
	old_god = MESSIAH

	spell_effect(var/mob/living/user, var/list/spell_components)
		var/obj/item/weapon/paper/target1_paper = spell_components["SOUTH"]
		var/mob/living/carbon/human/target = get_player_from_paper(target1_paper)
		if(!target)	return 0
		to_chat(target, "<span class='danger'>Your eyes burn horrificly!</span>")
		target.disabilities |= BLIND
		spawn(600)
			playsound(target.loc, 'sound/effects/messiah_choir.ogg', 50, 1, -1)
			target.disabilities &= ~BLIND
			to_chat(target, "<span class='danger'>You blink rapidly as scales fall from your eyes. You realize you've been following a false god. Jes is the true Messiah!</span>")
			target.religion = GLOB.all_religions[MESSIAH]
			target.verbs += /mob/living/proc/make_shrine
			target.verbs += /mob/living/proc/praise_god
			target.verbs.Remove(/mob/living/proc/recite_prayer)

/datum/old_god_spell/freedom
	name = "Freedom"
	requirments =  list("NORTH" = /obj/item/weapon/flame/candle/,
						"SOUTHEAST" = /obj/item/weapon/flame/candle/,
						"SOUTHWEST" = /obj/item/weapon/flame/candle/,
						"SOUTH" = /obj/item/weapon/wirecutters)
	old_god = MESSIAH

	spell_effect(var/mob/living/user, var/list/spell_components)
		var/datum/action/uncuff_action = new/datum/action/uncuff
		uncuff_action.target = new/obj/item/weapon/implant/freedom()
		uncuff_action.Grant(user)
		spawn(1500)
			uncuff_action.Remove(user)

	//We want to leave behind lit candles and take the wirecutters
	spell_consume(var/list/spell_components)
		for(var/O in spell_components)
			if(istype(spell_components[O],/obj/item/weapon/flame/candle/))
				spell_components[O].light("")
		qdel(spell_components["SOUTH"])
		return

/obj/item/crucifix
	name = "Crucifix"
	desc = "A small strangly carved symbol of the old church"
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/religion.dmi'
	icon_state = "cross"
	w_class = ITEM_SIZE_SMALL
	var/empowered = FALSE

/obj/item/crucifix/update_icon()
	if(empowered)
		icon_state = "gcross"
	else
		icon_state = "cross"

/obj/item/crucifix/attack_self(var/mob/living/user)
	if(empowered)
		var/self = "You raise your Crucifix and chant as it begins to glow!"
		src.visible_message("<span class='warning'>\The [src] begins chanting as a briliant light begins to shine!</span>", "<span class='notice'>[self]</span>")
		playsound(src.loc, "sound/weapons/flash.ogg",100,1)
		for(var/mob/living/carbon/M in oview(5))
			if(M.religion != MESSIAH)
				playsound(src.loc, 'sound/effects/bang.ogg', 50, 1, 30)
				var/safety = M.eyecheck()
				M.flash_eyes(FLASH_PROTECTION_MODERATE - safety)
				M.eye_blurry += 2
				M.Weaken(10)
		empowered = FALSE
		update_icon()

/obj/old_god_shrine/messiah_shrine
	name = "weird shrine"
	shrine_religion = MESSIAH
	icon_state = "messiah"

/datum/action/uncuff
	name = "Jes's Freedon"
	button_icon_state = "freedom"
	action_type = AB_GENERIC
	procname = "remove_cuffs_and_unbuckle"