/datum/religion/hasard
	name = HASARD // he travelled many places
	holy_item = new /obj/item/weapon/bikehorn()
	shrine = /obj/old_god_shrine/hasard_shrine
	whisper_lines = list("This is a game, just a game!", "TURN THE PC OFF, RIGHT NOW.", "HA-HA-HA-HA-HA!!!")
	offering_items = list(/obj/item/stack/teeth, /obj/item/weapon/flame/candle/, /obj/item/clothing/head/jester)

/datum/religion/hasard/generate_random_phrase()
		var/phrase = pick("Oh great [name] ", "Oh [name]. ", "[name], the God of Chaos! ")
		phrase += pick("You bathe the world in happiness. ", "You always return. ", "Every jester is at your mercy. ")
		phrase += pick("[name], bless us all. ", "[name], guide us all. ")
		phrase += "Amen"
		return phrase

/datum/old_god_spell/madness_combat
	name = "Madness"
	requirments =  list("NORTH" = /obj/item/weapon/flame/candle/,
						"EAST" = /obj/item/clothing/head/jester,
						"WEST" = /obj/item/clothing/shoes/jester,
						"SOUTH" = /obj/item/weapon/paper)
	old_god = HASARD

	spell_effect(var/mob/living/user, mob/living/carbon/C as mob, var/list/spell_components)
		var/obj/item/weapon/paper/target1_paper = spell_components["SOUTH"]
		var/mob/living/carbon/human/target = get_player_from_paper(target1_paper)
		if(!target)
			target = user
			to_chat(user, "<span class='danger'>Without a target, Hasard turns his mischief on you!</span>")
			playsound(target.loc, 'sound/effects/xom_laugh.ogg', 100, 0)
		if(prob(10))
			to_chat(target, "<span class='danger'>Your eyes burn horrificly! HASARD WHY!</span>")
			playsound('sound/effects/xom_laugh.ogg', 100, 0)
			target.disabilities |= BLIND
		if(prob(3))
			to_chat(target, "<span class='info'>You suddenly feel refreshed and calm. After you inspect yourself, you notice that all your injuries are now gone.</span>")
			playsound(target.loc, 'sound/effects/singlebeat.ogg', 100, 0)
			target.rejuvenate()
		if(prob(15))
			to_chat(target, "<span class='info'>You feel like one of your stats were improved.</span>")
			playsound(target.loc, 'sound/effects/singlebeat.ogg', 100, 0)
			target.stats += 1
		if(prob(1))
			to_chat(target, "<span class='danger'>HOLY SHIT!</span>")
			playsound(target.loc, 'sound/effects/xom_laugh.ogg', 100, 0)
			target.gib()
		if(prob(30))
			to_chat(target, "<span class='danger'>OH MY GOD! Nothing happened.</span>")
			playsound(target.loc, 'sound/effects/xom_laugh.ogg', 100, 0)
		if(prob(25))
			to_chat(target, "<span class='danger'>You feel your mouth opening on itself...and then...ARGH!</span>")
			playsound(target.loc, 'sound/effects/xom_laugh.ogg', 100, 0)
			target.say("I feel like that this station we're in is just a simulation, a game, it's just a game, and nothing is real...")
			target.apply_damage(rand(1, 3), BRUTE)
			target.organs_by_name["head"].pain += 30
		if(prob(40))
			to_chat(target, "<span class='danger'>You feel emptier.</span>")
			playsound('sound/effects/singlebeat.ogg', 100, 0)
			target.remove_blood(300)

	//We want to leave behind lit candles
	spell_consume(var/list/spell_components)
		for(var/O in spell_components)
			if(istype(spell_components[O],/obj/item/weapon/flame/candle/))
				spell_components[O].light("Xom")
		return

/obj/old_god_shrine/hasard_shrine
	name = "HILLARIOUS SHRINE"
	shrine_religion = HASARD
	icon_state = "xom"

/*
/datum/action/uncuff
	name = "Xom's Craziness"
	button_icon_state = "freedom"
	action_type = AB_GENERIC
	procname = "remove_cuffs_and_unbuckle"
*/