#define SPAWN_PROTECTION_TIME 20
#define DEAD_DELETE_COUNTDOWN 20
#define BRAINLOSS_PER_DEATH 60
#define POINTS_FOR_CHEATER 10
#define CLEANUP_COOLDOWN 600
/mob/living/carbon/human/vrhuman
	var/obj/screen/vrhuman_shop
	var/obj/screen/vrhuman_exit
	var/obj/screen/vrhuman_main
	var/obj/screen/vrhuman_cleanup
	var/datum/mind/vr_mind
	var/died = FALSE
	var/obj/item/device/uplink/vr_uplink/vr_shop
	var/global/last_cleanup_time
	alpha = 127

/mob/living/carbon/human/vrhuman/Initialize()
	generate_random_body()
	equip_mob()
	name = "Traveller"
	real_name = name

/mob/living/carbon/human/vrhuman/LateInitialize()
	. = ..()
	generate_random_body()
	equip_mob()
	vr_shop = new(src)

/mob/living/carbon/human/vrhuman/proc/generate_random_body()
	gender = MALE
	name = "Traveller"
	real_name = name

	randomize_skin_color()

/mob/living/carbon/human/vrhuman/proc/equip_mob()
	equip_to_slot_or_del(new /obj/item/clothing/under/color/grey, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/black, slot_shoes)
	equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, slot_r_store)

/mob/living/carbon/human/vrhuman/updatehealth()
	..()
	if((getBruteLoss() + getFireLoss() + getOxyLoss()) >= 200)
		death()

/mob/living/carbon/human/vrhuman/death()
	if(died)
		return
	died = TRUE
	if(!vr_mind)
		qdel(src)
		return ..()
	vr_mind.thunder_points = 0
	vr_mind.transfer_to(vr_mind.thunderfield_owner)
	death_actions()
	return ..()

/mob/living/carbon/human/vrhuman/proc/death_actions()
	vr_mind.thunderfield_owner.adjustBrainLoss(BRAINLOSS_PER_DEATH)
	qdel(src)

/mob/living/carbon/human/vrhuman/Destroy()
	vr_mind = null
	return ..()

/mob/living/carbon/human/vrhuman/proc/exit_body()
	var/answer = alert(src, "Would you like to exit Cyberspace?", "Alert", "Yes", "No")
	if(answer == "Yes")
		vr_mind.transfer_to(vr_mind.thunderfield_owner)
		qdel(src)
	else
		return

/mob/living/carbon/human/vrhuman/verb/quit()
	set name = "Leave VR"
	set category = "IC"

	vr_mind.transfer_to(vr_mind.thunderfield_owner)
	qdel(src)

/mob/living/carbon/human/vrhuman/ghost()
	return

/mob/living/carbon/human/vrhuman/verb/OpenShopMenu()
	set name = "Open Shop"
	set category = "IC"

	vr_shop.trigger(src)

/mob/living/carbon/human/vrhuman/verb/try_cleanup() //to do
	if(world.time < (last_cleanup_time + CLEANUP_COOLDOWN))
		to_chat(src, SPAN_DANGER("Please wait!"))
		return
	last_cleanup_time = world.time
	for(var/turf/unsimulated/floor/self_cleaning/sc in GLOB.self_cleaning_list)
		sc.cleaner()

#undef SPAWN_PROTECTION_TIME
#undef DEAD_DELETE_COUNTDOWN
#undef BRAINLOSS_PER_DEATH
#undef POINTS_FOR_CHEATER
#undef CLEANUP_COOLDOWN
