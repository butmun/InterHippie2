//PUTTING RELIGIOUS RELATED STUFF IN IT'S ON MODULES FOLDER FROM NOW ON. - Matt

//PROCS

/datum/religion
	var/name = "NONE"
	var/favor = 0
	var/holy_item = null
	var/shrine = null
	var/followers = list()
	var/territories = list()
	var/datum/request/request = null
	var/selectable_requests = list()
	var/selectable_rewards = list()
	var/selectable_punishments = list()
	var/whisper_lines = list()
	var/offering_items = list(/obj/item/weapon/paper)

/datum/religion/New()
	selectable_requests =  subtypesof(/datum/request)
	selectable_rewards = subtypesof(/datum/reward)
	selectable_punishments = subtypesof(/datum/punishment/)

/datum/religion/machina
	name = "Deo Machina"
	holy_item = /obj/item/weapon/brander
	whisper_lines = list("Remeber the prayer.", "Verina provides.", "Follow the Arbiters.")
	offering_items = list(/obj/item/weapon/spacecash/bundle/c10)

/*
/datum/religion/narsie
	name = "Narsie"
	holy_item = /obj/item/weapon/book/tome
	favor = 0
*/

/* GENERAL RELIGION PROCS */

//Stupidly simplistic? Probably. But I'm too tired to write something more complex.
/mob/living/proc/religion_is_legal()
	if(religion != LEGAL_RELIGION)
		return 0
	return 1

//Reveals self as a heretic
/mob/living/proc/reveal_self()
	var/msg = ""
	if (religion_is_legal())  //Non-heretics will still deny
		msg = "I'm not one I swear it!"
	else
		msg = "Yes!  I'm a heretic!"
	agony_scream()
	say(NewStutter(msg))

/* LEGAL RELIIGON PROCS */
//PRAYER
var/accepted_prayer //The prayer that all those who are not heretics will have.

proc/generate_random_prayer()//This generates a new one.
	var/prayer = pick("Oh great AI. ", "Oh our Lord Verina. ", "Verina, our Lord and Saviour. ")
	prayer += pick("You bathe us in your glow. ", "You bathe our minds in you omniscient wisdom. ", "You bathe our [pick("outpost","kingdom","cities")] in your wealth. ")
	prayer += pick("Verina be praised. ", "Verina save us all. ", "Verina guide us all. ")
	prayer += "Amen."
	return prayer

/mob/living/proc/recite_prayer()
	set category = "Deo Machina"
	set name = "Recite the prayer"
	say(mind.prayer)


//Try to reveal a random heretic
/mob/living/proc/interrogate()
	set category = "Deo Machina"
	set name = "Interrogate"
	var/list/victims = list()
	for(var/mob/living/carbon/human/C in oview(1))
		victims += C
	var/mob/living/carbon/human/T = input(src, "Who will we interrogate?") as null|anything in victims
	if(!T) return
	if(!(T in view(1))) return
	say("[T] are you a heretic!?")
	if(prob((T.getHalLoss()/3) - T.stats[STAT_HT]))  //Higher con helps your resist torture
		T.reveal_self()
		return

//Reveals a random heretic
/mob/living/proc/reveal_heretics()
	var/msg = " is one of them!"
	var/name = ""
	if (religion_is_legal())  //Non-heretics will say nothing
		msg = "I dont know!"
		say(NewStutter(msg))
		return
	else
		name = pick(GLOB.all_religions[ILLEGAL_RELIGION].followers)  //Wow the datums saves us an entire for loop
		if(name)
			say(NewStutter("[name] is one of them!"))
		else
			say("I'm the only one!")

/* ILLEGAL RELIGION PROCS */
/datum/religion/proc/claim_territory(area/territory,var/claiming_religion)
	GLOB.all_religions[claiming_religion].territories |= territory.name
	return

/datum/religion/proc/lose_territory(area/territory,var/claiming_religion)
	GLOB.all_religions[claiming_religion].territories -= territory.name
	return

/datum/religion/proc/territory_claimed(area/territory, mob/user)
	for (var/name in GLOB.all_religions)
		if(territory.name in GLOB.all_religions[name].territories)
			return name
	return null

//This is general, and should be overloaded for ~flavor~
/datum/religion/proc/generate_random_phrase()
		var/phrase = pick("Oh great [name] ", "Oh our Lord [name]. ", "[name], our Lord and Saviour. ")
		phrase += pick("You bathe us in your glow. ", "You bathe our minds in you omniscient wisdom. ", "You bathe our [pick("outpost","kingdom","cities")] in your wealth. ")
		phrase += pick("[name] be praised. ", "[name] save us all. ", "[name] guide us all. ")
		phrase += "Amen."
		return phrase

/datum/religion/proc/whisper_to_followers()
	var/whisper_line = pick(whisper_lines)
	for(var/mob/living/carbon/human/player in GLOB.player_list)
		if(player.religion == name)
			playsound(player, "sound/effects/badmood[pick(1,4)].ogg",50,1)
			to_chat(player, "<span class='danger'>[whisper_line]</span>")

//Makes a request, and tells all followers about it
/datum/religion/proc/request()
	request = pick(selectable_requests)
	//request = new request(name)
	request = new /datum/request/offering/(name)
	for(var/mob/living/carbon/human/player in GLOB.player_list)
		if(player.religion == name)
			playsound(player, "sound/effects/badmood[pick(1,4)].ogg",50,1)
			to_chat(player, "<span class='danger'>[request.message]</span>")

/datum/religion/proc/reward(var/mob/living/target)
	var/datum/reward/reward = pick(selectable_rewards)
	reward = new reward
	reward.do_reward(target)

/datum/religion/proc/punish(var/mob/living/target)
	var/datum/punishment/punishment = pick(selectable_punishments)
	punishment = new punishment
	punishment.do_punishment(target)

/datum/religion/proc/can_claim_for_gods(mob/user, atom/target)
	//Check the area for if there's another shrine already, or the arbiters have already claimed it with TODO:?????
	var/area/A = get_area(target)
	if(!A)
		to_chat(user, "<span class='warning'>The old god's refuse your petty offering</span>")
		return FALSE

	var/occupying_religion = territory_claimed(A, user)
	if(occupying_religion == ILLEGAL_RELIGION)
		to_chat(user,"<span class='danger'>There is already a shrine in this area!</span>")
		return FALSE

	if(occupying_religion)
		to_chat(user, "<span class='danger'>Something in the area is blocking your connection to the Old Gods!  FInd it and destory it!</span>")
		return FALSE

	// If you pass the gaunlet of checks, you're good to proceed
	return TRUE

/datum/religion/proc/spawn_item(mob/living/user, var/divisor = 0.1)
	var/turf/T = get_turf(user)
	var/datum/religion/user_religion = GLOB.all_religions[user.religion]
	for(var/obj/old_god_shrine/shrine in view(user, 5))
		//If we can see an allied shrine nearby, we have more chance to spawn a reward.
		if(shrine.shrine_religion.name == user_religion.name)
			divisor = 1
		if(prob(user_religion.favor * divisor))
			var/S = pick(GLOB.all_spells)
			var/reward = pick(GLOB.all_spells[S].requirments)
			var/obj/reward_obj = GLOB.all_spells[S].requirments[reward]
				new reward_obj(T)

/mob/living/proc/praise_god()
	set category = "Old God Magic"
	set name = "Praise god"

	var/datum/religion/user_religion = GLOB.all_religions[religion]
	//You need your god's item to do this
	if(!istype(get_active_hand(), user_religion.holy_item) && !istype(get_inactive_hand(), user_religion.holy_item))
		to_chat(src, "<span class='warning'>You can't praise god without your [user_religion.holy_item]!</span>")
		return
	var/timer = 30
	var/praise_sound = "sound/effects/Cultistemessage[pick(1,10)].ogg"
	if(!doing_something)
		var/self = "You raise your [user_religion.holy_item] and chant praise to your god."
		visible_message("<span class='warning'>\The [src] begins speaking praise for their god.</span>", "<span class='notice'>[self]</span>", "[src] praises their god! .")
		doing_something = 1
		if(do_after(src, timer))
			//These variables used to just be functions that returned a hard coded value.  So don't blame me, this is actually faster.
			user_religion.favor += 10
			playsound(get_turf(src), praise_sound,30,0)
			doing_something = 0
			user_religion.spawn_item(src)
			if(user_religion.request)
				if(user_religion.request.check_complete(src))
					user_religion.reward(src)
					user_religion.request = null
			return 1
		else
			to_chat(src, "<span class='notice'>Your prayer is interupted</span>")
			doing_something = 0
			return
		return 0
	else
		to_chat(src, "<span class='notice'>You are already doing something.</span>")
		return 0
	return 0


/mob/living/proc/make_shrine()
	set category = "Old God Magic"
	set name = "Create shrine"
	var/turf/T = get_turf(src)
	var/datum/religion/user_religion = GLOB.all_religions[religion]
	//You need your god's item to do this
	if(!istype(get_active_hand(), user_religion.holy_item) && !istype(get_inactive_hand(), user_religion.holy_item))
		to_chat(src, "<span class='warning'>You can't draw old god runes without your [user_religion.holy_item]!</span>")
		return
	//Need 30 favor to make a shrine
	if(user_religion.favor < 30)
		to_chat(src, "<span class='warning'>You don't feel devoted enough to your god.</span>")
		return
	var/self = "You deftly use your [user_religion.holy_item] to create the shrine."
	var/timer = 20
	if(user_religion.can_claim_for_gods(src,T) && !doing_something)
		visible_message("<span class='warning'>\The [src] quickly draws on the floor and begins to whisper quietly to themselves.</span>", "<span class='notice'>[self]</span>", "You hear scratching.")
		doing_something = 1
		if(do_after(src, timer))
			//These variables used to just be functions that returned a hard coded value.  So don't blame me, this is actually faster.
			new user_religion.shrine(T)
			doing_something = 0
			return 1
		doing_something = 0
	//If we somehow got here
	doing_something = 0
	return 0
