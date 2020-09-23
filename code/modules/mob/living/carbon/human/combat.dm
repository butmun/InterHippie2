
/mob/living/carbon/human/proc/toggle_combat_mode()
	if(!ishuman(usr))
		return

	playsound_local(src, 'sound/effects/ui_toggle.ogg', 50, 0, 1)
	var/mob/living/carbon/human/C = usr
	if(!C.combat_mode)
		C.combat_mode = 1
		C.combat_icon.icon_state = "combat1"
		to_chat(src, "<span class='warning'>You toggle on combat mode.</span>")
	else
		combat_mode = 0
		C.combat_icon.icon_state = "combat0"
		to_chat(src, "<span class='danger'>You toggle off combat mode.</span>")

/mob/living/carbon/human/proc/toggle_dodge_parry()
	if(ishuman(usr))
		var/mob/living/carbon/human/E = usr
		if(E.defense_intent == I_DODGE)
			E.defense_intent = I_PARRY
			E.dodge_intent_icon.icon_state = "parry"
			to_chat(src, "<span class='danger'>You will now parry.</span>")
		else
			E.defense_intent = I_DODGE
			E.dodge_intent_icon.icon_state = "dodge"
			to_chat(src, "<span class='warning'>You will now dodge.</span>")

/mob/living/carbon/human/verb/dodgeparry_hotkey()
	set name = ".defense_intent"
	set hidden = 1

	toggle_dodge_parry()

/mob/living/carbon/human/verb/combatmode_hotkey()
	set name = ".combat_mode"
	set hidden = 1

	toggle_combat_mode()

//Going here till I find a better place for it.
/mob/living/proc/handle_combat_mode()//Makes it so that you can't regain stamina in combat mode.
	if(combat_mode)
		if(staminaloss < 90)
			adjustStaminaLoss(1)

/mob/living/proc/attempt_dodge()//Handle parry is an object proc and it's, its own thing.
	var/dodge_modifier = c_intent == I_DEFEND ? 4 : 0 //If they are in defend mode, they dodge more
	if (defense_intent != I_DODGE || lying && !buckled && !stat == 0)  // If they are not trying to dodge, lying down, or not buckled.
		return 0
	if(combat_mode || prob(35))//Todo, make use of the check_shield_arc proc to make sure you can't dodge from behind.
		if(staminaloss < 50 && statcheck(stats[STAT_DX], 10 - dodge_modifier, "We couldn't dodge in time!", "dex"))//You gotta be the master of dexterity to dodge every time.
			do_dodge()
			return	1
		else if(staminaloss >= 50 && statcheck(stats[STAT_DX], 14 - dodge_modifier, "I'm getting too exhausted to dodge!", "dex")) //It's harder to dodge when you're tired
			do_dodge()
			return	1
	else
		if(statcheck(stats[STAT_DX], 12, "I can't dodge something I'm not ready for!", "dex"))  //If you're not in combat mode, you're probably getting messed up
			do_dodge()
			return	1
	return 0  //If we fail everything

/mob/living/proc/do_dodge()
	var/lol = pick(GLOB.cardinal)//get a direction.
	adjustStaminaLoss(15)//add some stamina loss
	playsound(loc, 'sound/weapons/punchmiss.ogg', 80, 1)//play a sound
	step(src,lol)//move them
	visible_message("<b><big>[src.name] dodges out of the way!</big></b>")//send a message
	//be on our way

/mob/proc/surrender()//Surrending. I need to put this in a different file.
	if(!incapacitated())
		//Stun(5)  // THIS WAS NOT FUNNY AND I DID NOT LAUGH
		Weaken(10) // This is enabled however to give people an incentive not to fake surrender
		visible_message("<b>[src] surrenders!</b>")
		playsound(src, 'sound/effects/surrender.ogg', 50, 1)
		var/atom/movable/overlay/animation = new /atom/movable/overlay(loc)
		animation.icon_state = "blank"
		animation.icon = 'icons/mob/screen1.dmi'
		animation.master = src
		flick("attention", animation)

/mob/proc/mob_rest()
	var/getupchance = (!stunned && !weakened) || (rand(1,50) < stats[STAT_DX]/1.5)
	if(resting && getupchance)//The incapacitated proc includes resting for whatever fucking stupid reason I hate SS13 code so fucking much.
		visible_message("<span class='notice'>[usr] is trying to get up.</span>")
		if(do_after(src, 20 -  stat_to_modifier(stats[STAT_DX])* 3))
			resting = FALSE
			rest?.icon_state = "rest0"
			update_canmove()
		return

	else
		resting = TRUE
		update_canmove()
		//For stopping runtimes with NPCs
		rest?.icon_state = "rest1"
		fixeye?.icon_state = "fixeye"
		walk_to(src,0)

/mob/verb/mob_rest_hotkey()
	set name = ".mob_rest"
	set hidden = 1

	mob_rest()