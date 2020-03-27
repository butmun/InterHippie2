#define SLASH 1
#define STAB 2
#define BASH 3


/obj/item/weapon/material/sword
	name = "claymore"
	desc = "You use the sharp part on your foes. And the flat part on your lesser foes."
	icon_state = "claymore"
	item_state = "claymore"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_HUGE
	force_divisor = 0.2 // 30 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.2 // 10 when thrown with weight 20 (steel)
	sharp = 1
	edge = 1
	attack_verb = list("slashed", "sliced")
	hitsound = "slash_sound"
	var/atk_mode = SLASH
	block_chance = 40
	applies_material_colour = FALSE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25
	weapon_speed_delay = 20
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'


/obj/item/weapon/material/sword/attack_self(mob/user)
	..()
	if(atk_mode == SLASH)
		switch_intent(user,STAB)
	else if(atk_mode == STAB)
		switch_intent(user,BASH)
	else if(atk_mode == BASH)
		switch_intent(user,SLASH)



/obj/item/weapon/material/sword/proc/switch_intent(mob/user,var/intent)
	switch(intent)
		if(STAB)
			atk_mode = STAB
			to_chat(user, "You will now stab.")
			edge = 0
			sharp = 1
			attack_verb = list("stabbed")
			hitsound = "stab_sound"
			return
		if(BASH)
			atk_mode = BASH
			to_chat(user, "You will now bash with the hilt.")
			edge = 0
			sharp = 0
			attack_verb = list("bashed", "smacked")
			hitsound = "swing_hit"
			return

		if(SLASH)
			atk_mode = SLASH
			to_chat(user, "You will now slash.")
			attack_verb = list("slashed", "diced")
			hitsound = "slash_sound"
			return




/obj/item/weapon/material/sword/replica
	edge = 0
	sharp = 0
	force_divisor = 0.2
	thrown_force_divisor = 0.2

/obj/item/weapon/material/sword/katana
	name = "katana"
	desc = "Woefully underpowered in D20. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/weapon/material/sword/katana/replica
	edge = 0
	sharp = 0
	force_divisor = 0.2
	thrown_force_divisor = 0.2

/obj/item/weapon/material/sword/sabre
	name = "sabre"
	desc = "Like a claymore but for an officer."
	icon_state = "sabre"
	item_state = "sabre"
	force_divisor = 0.4
	thrown_force_divisor = 0.4
	block_chance = 50

/obj/item/weapon/material/sword/axe //Yep.
	name = "axe"
	desc = "A quite barbaric weapon made for delimbing people."
	icon_state = "sabre"
	item_state = "sabre"
	force_divisor = 0.1
	thrown_force_divisor = 0.1
	block_chance = 20
	sharpness = 35

/obj/item/weapon/material/sword/combat_knife
	name = "combat knife"
	desc = "For self defense, and self offense."
	icon_state = "combatknife"
	item_state = "knife"
	attack_verb = list("slashed")
	force_divisor = 0.3
	block_chance = 20
	w_class = ITEM_SIZE_SMALL
	drawsound = 'sound/items/unholster_knife.ogg'
	sharpness = 15
	weapon_speed_delay = 10
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"
