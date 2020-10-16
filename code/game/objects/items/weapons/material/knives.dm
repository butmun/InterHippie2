/obj/item/weapon/material/butterfly
	name = "butterfly knife"
	desc = "A basic metal blade concealed in a lightweight plasteel grip. Small enough when folded to fit in a pocket."
	icon_state = "butterflyknife"
	item_state = null
	hitsound = null
	var/active = 0
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("patted", "tapped")
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 when thrown with weight 20 (steel)

/obj/item/weapon/material/butterfly/update_force()
	if(active)
		edge = 1
		sharp = 1
		..() //Updates force.
		throwforce = max(3,force-3)
		hitsound = 'sound/weapons/bladeslice.ogg'
		icon_state += "_open"
		w_class = ITEM_SIZE_NORMAL
		attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	else
		force = 3
		edge = 0
		sharp = 0
		hitsound = initial(hitsound)
		icon_state = initial(icon_state)
		w_class = initial(w_class)
		attack_verb = initial(attack_verb)

/obj/item/weapon/material/butterfly/switchblade
	name = "switchblade"
	desc = "A classic switchblade with gold engraving. Just holding it makes you feel like a gangster."
	icon_state = "switchblade"
	unbreakable = 1

/obj/item/weapon/material/butterfly/attack_self(mob/user)
	active = !active
	if(active)
		to_chat(user, "<span class='notice'>You flip out \the [src].</span>")
		playsound(user, 'sound/weapons/flipblade.ogg', 15, 1)
	else
		to_chat(user, "<span class='notice'>\The [src] can now be concealed.</span>")
	update_force()
	add_fingerprint(user)

/*
 * Kitchen knives
 */
/obj/item/weapon/material/knife
	name = "kitchen knife"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "knife"
	desc = "A general purpose Chef's Knife made by SpaceCook Incorporated. Guaranteed to stay sharp for years to come."
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	sharp = 1
	edge = 1
	force_divisor = 0.15 // 9 when wielded with hardness 60 (steel)
	matter = list(DEFAULT_WALL_MATERIAL = 12000)
	origin_tech = list(TECH_MATERIAL = 1)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	unbreakable = 1
	block_chance = 15

/obj/item/weapon/material/knife/hook
	name = "meat hook"
	desc = "A sharp, metal hook what sticks into things."
	icon_state = "hook_knife"
	item_state = "hook_knife"

/obj/item/weapon/material/knife/ritual
	name = "ritual knife"
	desc = "The unearthly energies that once powered this blade are now dormant."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	applies_material_colour = 0

/obj/item/weapon/material/knife/butch
	name = "butcher's cleaver"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "butch"
	desc = "A huge thing used for chopping and chopping up meat. This includes clowns and clown-by-products."
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/weapon/material/knife/lux
	name = "knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "luxknife"
	item_state = "knife1"
	desc = "A expensive knife with gold in it."
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/reaper
	name = "reaper knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "merc"
	item_state = "knife1"
	desc = "A very rare blade used by rugged souls in the galaxy."
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/reaper
	name = "small sword"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "smallsword"
	item_state = "knife1"
	desc = "A small sword made of steel."
	force_divisor = 0.40 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/test
	name = "knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "luxknife"
	item_state = "knife1"
	desc = "A expensive knife with gold in it."
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/bread
	name = "bread knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "breadknife"
	item_state = "knife1"
	desc = "A knife used to cut bread, or humans."
	force_divisor = 0.15 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/modern
	name = "knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "knife"
	item_state = "knife1"
	desc = "A knife, figure the rest."
	force_divisor = 0.20 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/bone
	name = "bone knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "boneknife"
	item_state = "knife1"
	desc = "A knife with handle of flesh and bone."
	force_divisor = 0.17 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/bonesickel
	name = "bone sickel"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bonesickel"
	item_state = "knife1"
	desc = "A sickel made of flesh and bone."
	force_divisor = 0.17 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/fishknife
	name = "fish knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fishknife"
	item_state = "knife1"
	desc = "A knife used to cut fish."
	force_divisor = 0.26 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/bowie
	name = "bowie knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bowieknife"
	item_state = "knife1"
	desc = "a military grade knife, looks quite sharp."
	force_divisor = 1 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/black
	name = "knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "blackknife"
	item_state = "knife1"
	desc = "a very black and weird knife, looks tacticool."
	force_divisor = 1 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/shaggy
	name = "makeshift knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "shaggy"
	item_state = "knife1"
	desc = "a makeshift shank, looks like shit."
	force_divisor = 0.30 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE

/obj/item/weapon/material/knife/tacti
	name = "tactical knife"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacti"
	desc = "a very small knife, fits in your hand."
	force_divisor = 0.20 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	applies_material_colour = FALSE