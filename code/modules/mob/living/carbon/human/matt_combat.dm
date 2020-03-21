//Commented out debugging shit.
/*
/mob/living/carbon/human/verb/toggle_combat_mode()
	set name = "Toggle Combat Mode"
	set category = "Combat"

	if(combat_mode)
		combat_mode = 0
		to_chat(src, "You toggle off combat mode.")
	else
		combat_mode = 1
		to_chat(src, "You toggle on combat mode.")

/mob/living/carbon/human/verb/toggle_dodge_parry()
	set name = "Toggle Defense Intent"
	set category = "Combat"

	if(defense_intent == I_DODGE)
		defense_intent = I_PARRY
		to_chat(src, "You will now parry.")
	else
		defense_intent = I_DODGE
		to_chat(src, "You will now dodge.")
*/

//Going here till I find a better place for it.
/mob/living/proc/handle_combat_mode()//Makes it so that you can't regain stamina in combat mode.
	if(combat_mode)
		if(staminaloss < 25)
			adjustStaminaLoss(1)

/mob/living/proc/attempt_dodge()//Handle parry is an object proc and it's, its own thing.
	var/dodge_modifier = c_intent == I_DEFEND ? 4 : 0 //If they are in defend mode, they dodge more
	if (defense_intent != I_DODGE || lying)  // If they are not trying to dodge or are lying down
		return 0
	if(combat_mode)//Todo, make use of the check_shield_arc proc to make sure you can't dodge from behind.
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
	visible_message("<b><big>[src.name] dodges out of the way!!</big></b>")//send a message
	//be on our way


/mob/proc/surrender()//Surrending. I need to put this in a different file.
	if(!incapacitated())
		//Stun(5)  // THIS WAS NOT FUNNY AND I DID NOT LAUGH
		Weaken(10) // This is enabled however to give people an incentive not to fake surrender
		visible_message("<b>[src] surrenders!</b>")
		playsound(src, 'sound/effects/surrender.ogg', 50, 1)
		var/atom/movable/overlay/animation = new /atom/movable/overlay( loc )
		animation.icon_state = "blank"
		animation.icon = 'icons/mob/screen1.dmi'
		animation.master = src
		flick("attention", animation)

/mob/proc/mob_rest()
	var/getupchance = (!stunned && !weakened) || (rand(1,50) < stats[STAT_DX]/1.5)
	if(resting && getupchance)//The incapacitated proc includes resting for whatever fucking stupid reason I hate SS13 code so fucking much.
		visible_message("<span class='notice'>[usr] is trying to get up.</span>")
		if(do_after(src, 20 -  stat_to_modifier(stats[STAT_DX])*10 / 3))
			resting = 0
			rest.icon_state = "rest0"
		return

	else
		resting = 1
		rest.icon_state = "rest1"
