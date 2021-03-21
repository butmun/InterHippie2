/mob/living/simple_animal/mouse
	name = "mouse"
	real_name = "mouse"
	desc = "It's a small rodent."
	icon_state = "mouse_gray"
	item_state = "mouse_gray"
	icon_living = "mouse_gray"
	icon_dead = "mouse_gray_dead"
	speak = list("Squeek!","SQUEEK!","Squeek?")
	speak_emote = list("squeeks","squeaks")
	emote_hear = list("squeeks","squeaks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")
	attack_sound = 'sound/weapons/bite.ogg'
	pass_flags = PASS_FLAG_TABLE
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	maxHealth = 1
	health = 1
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stamps on"
	density = 0
	var/body_color //brown, gray and white, leave blank for random
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius
	universal_speak = 0
	universal_understand = 1
	holder_type = /obj/item/weapon/holder/mouse
	mob_size = MOB_MINISCULE
	possession_candidate = 1
	var/datum/disease2/disease/virus = null

	can_pull_size = ITEM_SIZE_TINY
	can_pull_mobs = MOB_PULL_NONE

/mob/living/simple_animal/mouse/Life()
	..()
	if(!stat && prob(speak_chance))
		for(var/mob/M in view())
			sound_to(M, 'sound/effects/mousesqueek.ogg')

	if(!ckey && stat == CONSCIOUS && prob(0.5))
		set_stat(UNCONSCIOUS)
		icon_state = "mouse_[body_color]_sleep"
		wander = 0
		speak_chance = 0
		//snuffles
	else if(stat == UNCONSCIOUS)
		if(ckey || prob(1))
			set_stat(CONSCIOUS)
			icon_state = "mouse_[body_color]"
			wander = 1
		else if(prob(5))
			audible_emote("snuffles.")

/mob/living/simple_animal/mouse/lay_down()
	..()
	icon_state = resting ? "mouse_[body_color]_sleep" : "mouse_[body_color]"

/mob/living/simple_animal/mouse/Initialize()
	. = ..()

	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

	if(name == initial(name))
		name = "[name] ([sequential_id(/mob/living/simple_animal/mouse)])"
	real_name = name

	if(prob(35))
		if(prob(5))
			virus = new (VIRUS_EXOTIC)
		else if(prob(10))
			virus = new (VIRUS_ENGINEERED)
		else if(prob(20))
			virus = new (VIRUS_COMMON)
		else
			virus = new (VIRUS_MILD)


	if(!body_color)
		body_color = pick( list("brown","gray","white") )
	icon_state = "mouse_[body_color]"
	item_state = "mouse_[body_color]"
	icon_living = "mouse_[body_color]"
	icon_dead = "mouse_[body_color]_dead"
	desc = "It's a small [body_color] rodent, often seen hiding in maintenance areas and making a nuisance of itself."

/mob/living/simple_animal/mouse/proc/splat()
	icon_dead = "mouse_[body_color]_splat"
	adjustBruteLoss(maxHealth)  // Enough damage to kill
	src.death()

/mob/living/simple_animal/mouse/UnarmedAttack(atom/A, proximity)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A

		if(hiding)
			to_chat(src, "<span class='warning'>You can't bite while you are hiding!</span>")
			return

		var/available_limbs = H.lying ? BP_ALL_LIMBS : BP_BELOW_GROIN
		var/obj/item/organ/external/limb
		for(var/L in shuffle(available_limbs))
			limb = H.get_organ(L)
			if(limb)
				break

		var/blocked = H.run_armor_check(limb.organ_tag, "melee")
		if(H.apply_damage(rand(2, 5), BRUTE, limb.organ_tag, blocked) && prob(70 - blocked))
			limb.germ_level += rand(75, 150)
			if(virus)
				infect_virus2(H, virus)
		visible_message(SPAN_DANGER("[src] bites [H]'s [organ_name_by_zone(H, limb.organ_tag)]!"),
						SPAN_WARNING("You bite [H]'s [organ_name_by_zone(H, limb.organ_tag)]!"))
		admin_attack_log(src, H, "Bit the victim", "Was bitten", "bite")
		setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		do_attack_animation(H)
		playsound(loc, attack_sound, 25, 1, 1)
		return
	return ..()

/mob/living/simple_animal/mouse/Crossed(AM as mob|obj)
	if( ishuman(AM) )
		if(!stat)
			var/mob/M = AM
			to_chat(M, "<span class='warning'>\icon[src] Squeek!</span>")
			sound_to(M, 'sound/effects/mousesqueek.ogg')
	..()

/mob/living/simple_animal/mouse/Destroy()
	virus = null
	return ..()

/*
 * Mouse types
 */

/mob/living/simple_animal/mouse/white
	body_color = "white"
	icon_state = "mouse_white"

/mob/living/simple_animal/mouse/gray
	body_color = "gray"
	icon_state = "mouse_gray"

/mob/living/simple_animal/mouse/brown
	body_color = "brown"
	icon_state = "mouse_brown"

/mob/living/simple_animal/mouse/black
	body_color = "black"
	icon_state = "mouse_black"


//TOM IS ALIVE! SQUEEEEEEEE~K :)
/mob/living/simple_animal/mouse/brown/Tom
	name = "Tom"
	desc = "Jerry the cat is not amused."

/mob/living/simple_animal/mouse/brown/Tom/New()
	..()
	// Change my name back, don't want to be named Tom (666)
	SetName(initial(name))
	real_name = name

/mob/living/simple_animal/mouse/plague
	name = "Plague Rat"
	body_color = "comical"
	icon_state = "mouse_comical"
	desc = "This is a comically large rat."
	health = 3
	maxHealth = 3
	mob_size = MOB_SMALL
	melee_damage_lower = 2
	melee_damage_upper = 4