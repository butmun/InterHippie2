/***************************************
* Highly Visible and Dangerous Weapons *
***************************************/
/datum/uplink_item/item/visible_weapons
	category = /datum/uplink_category/visible_weapons

/datum/uplink_item/item/visible_weapons/revolver
	name = "Revolver, .357"
	item_cost = 60
	path = /obj/item/weapon/storage/backpack/satchel/syndie_kit/revolver

/datum/uplink_item/item/visible_weapons/sword
	name = "berserk sword"
	item_cost = 15
	antag_costs = list(MODE_MERCENARY = 10)
	path = /obj/item/weapon/material/sword/siegesword
