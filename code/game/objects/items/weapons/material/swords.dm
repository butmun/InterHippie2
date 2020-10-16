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
	force_divisor = 0.3
	thrown_force_divisor = 0.4
	block_chance = 30


/obj/item/weapon/material/sword/combat_knife
	name = "combat knife"
	desc = "For self defense, and self offense."
	icon_state = "combati"
	item_state = "knife"
	attack_verb = list("slashed")
	force_divisor = 0.2
	block_chance = 10
	w_class = ITEM_SIZE_SMALL
	drawsound = 'sound/items/unholster_knife.ogg'
	sharpness = 15
	weapon_speed_delay = 10
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"


/obj/item/weapon/material/sword/longsword
	name = "steel longsword"
	desc = "A long sword, used by knights."
	icon_state = "longsword"
	item_state = "longsword"
	force_divisor = 0.5
	block_chance = 50
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25
	weapon_speed_delay = 25
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/xomsword
	name = "old sword"
	desc = "A very odd looking sword made of some sort of metal."
	icon_state = "xomblade"
	item_state = "longsword"
	force_divisor = 0.3
	block_chance = 10
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 18
	weapon_speed_delay = 13
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/admin
	name = "godly sword"
	desc = "A sword used by the gods."
	icon_state = "admin"
	item_state = "longsword"
	force_divisor = 4.6
	block_chance = 100
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 100
	weapon_speed_delay = 5
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/bastard
	name = "bastard sword"
	desc = "A long bladed sword made of steel."
	icon_state = "bastard"
	item_state = "bastard"
	force_divisor = 0.4
	block_chance = 45
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 20
	weapon_speed_delay = 18
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/falchion
	name = "falchion sword"
	desc = "A falchion sword is a single handed sword."
	icon_state = "falchion"
	item_state = "falchion"
	force_divisor = 0.4
	block_chance = 60
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 22
	weapon_speed_delay = 16
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/scimitar
	name = "scimitar sword"
	desc = "A scimitar sword is a single handed sword."
	icon_state = "scimitar"
	item_state = "falchion"
	force_divisor = 0.5
	block_chance = 60
	w_class = ITEM_SIZE_NORMAL
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 24
	weapon_speed_delay = 15
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/zweihander
	name = "zweihander"
	desc = "A huge blade made of fine steel."
	icon_state = "zweihander"
	item_state = "longsword"
	force_divisor = 0.6
	block_chance = 5
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25
	weapon_speed_delay = 40
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/bonesword
	name = "bone sword"
	desc = "A medium sized sword made of flesh and bone."
	icon_state = "bonesword"
	item_state = "longsword"
	force_divisor = 0.3
	block_chance = 20
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 15
	weapon_speed_delay = 24
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/broadsword
	name = "broad sword"
	desc = "A huge two handed sword."
	icon_state = "broadsword"
	item_state = "longsword"
	force_divisor = 0.8
	block_chance = 10
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 20
	weapon_speed_delay = 60
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/greatsword
	name = "greatsword"
	desc = "A huge two handed sword."
	icon_state = "greatsword"
	item_state = "longsword"
	force_divisor = 0.9
	block_chance = 35
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 27
	weapon_speed_delay = 50
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/executioner
	name = "executioner sword"
	desc = "A sword used to decapitate heads.."
	icon_state = "greatsword"
	item_state = "longsword"
	force_divisor = 1.4
	block_chance = 0
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 30
	weapon_speed_delay = 90
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/siegesword
	name = "berserk sword"
	desc = "A rucky medium sized blade with a rusty handle. Mostly used by mercenaries & raiders."
	icon_state = "siegesword"
	item_state = "sabre"
	force_divisor = 0.6
	block_chance = 50
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 18
	weapon_speed_delay = 20
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/oldsabre
	name = "sabre"
	desc = "A fine bladed sabre."
	icon_state = "old_sabre"
	item_state = "sabre"
	force_divisor = 0.4
	block_chance = 30
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25
	weapon_speed_delay = 15
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/lacusia
	name = "lacusia"
	desc = "A common steel sword."
	icon_state = "lacusia"
	item_state = "sabre"
	force_divisor = 0.4
	block_chance = 50
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 20
	weapon_speed_delay = 14
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/siegesabre
	name = "sabre"
	desc = "A rugged sabre used by space raiders and the like."
	icon_state = "old_sabre"
	item_state = "sabre"
	force_divisor = 0.4
	block_chance = 30
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25
	weapon_speed_delay = 15
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/baroness
	name = "countess sword"
	desc = "A experimental sword."
	icon_state = "baroness"
	item_state = "sabre"
	force_divisor = 0.5
	block_chance = 50
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 28
	weapon_speed_delay = 24
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/silversword
	name = "silver longsword"
	desc = "A fancy silver bladed sword."
	icon_state = "silversword"
	item_state = "longsword"
	force_divisor = 0.5
	block_chance = 52
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 27
	weapon_speed_delay = 17
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/royal
	name = "royal sword"
	desc = "A decent sword with incravings of gold."
	icon_state = "royalsword"
	item_state = "longsword"
	force_divisor = 0.5
	block_chance = 50
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 20
	weapon_speed_delay = 22
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/blurdens
	name = "blurdens sword"
	desc = "A decent sword made of hard blue steel."
	icon_state = "blurdens_sword"
	item_state = "longsword"
	force_divisor = 0.6
	block_chance = 39
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 28
	weapon_speed_delay = 28
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/makeshiftspear
	name = "makeshift spear"
	desc = "A long pointy stick."
	icon_state = "makeshift_spear"
	item_state = "makeshift_spear"
	force_divisor = 0.2
	block_chance = 4
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharp = 1
	edge = 0
	sharpness = 9
	weapon_speed_delay = 10
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'

/obj/item/weapon/material/sword/mace
	name = "steel mace"
	desc = "A blunt force weapon. You do not want to get hit with this."
	icon_state = "mace"
	item_state = "mace"
	hitsound = "bash1.ogg"
	force_divisor = 0.7
	block_chance = 20
	attack_verb = list("bashed", "smashed", "slammed", "smacked")
	w_class = ITEM_SIZE_NORMAL
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 0
	weapon_speed_delay = 18
	drop_sound = 'sound/items/drop_sword.ogg'
	sharp = 0
	edge = 0

/obj/item/weapon/material/sword/steelhammer
	name = "steel hammer"
	desc = "A blunt force weapon. You do not want to get hit with this."
	icon_state = "hammer"
	item_state = "mace"
	hitsound = "bash1.ogg"
	force_divisor = 0.8
	block_chance = 10
	attack_verb = list("bashed", "smashed", "slammed", "smacked")
	w_class = ITEM_SIZE_NORMAL
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 0
	weapon_speed_delay = 40
	drop_sound = 'sound/items/drop_sword.ogg'
	sharp = 0
	edge = 0

/obj/item/weapon/material/sword/club
	name = "steel club"
	desc = "A blunt force weapon. You do not want to get hit with this."
	icon_state = "steelclub2"
	item_state = "mace"
	force_divisor = 0.8
	block_chance = 30
	attack_verb = list("bashed", "smashed", "slammed", "smacked")
	hitsound = "bash1.ogg"
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 0
	weapon_speed_delay = 27
	drop_sound = 'sound/items/drop_sword.ogg'
	sharp = 0
	edge = 0

/obj/item/weapon/material/sword/shithook
	name = "a...what?"
	desc = "You can't really tell what this is."
	icon_state = "shithook"
	item_state = "shithook"
	force_divisor = 0
	force = 5
	block_chance = 80
	w_class = ITEM_SIZE_HUGE
	drawsound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 0
	weapon_speed_delay = 10
	parry_sounds = list('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'