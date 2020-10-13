/decl/hierarchy/outfit/job/dreyfus/magistrate
	name = OUTFIT_JOB_NAME("Magistrate")
	l_ear = null
	uniform = null
	shoes = null
	id_type = /obj/item/weapon/card/id/dreyfus/gold
	id_slot = slot_wear_mask
	pda_type = /obj/item/device/pda/captain
	pda_slot = slot_wear_id
	head = null//FIT FOR A FUCKING retard
	suit = null

/decl/hierarchy/outfit/job/dreyfus/countess
	name = OUTFIT_JOB_NAME("Countess")
	l_ear = /obj/item/device/radio/headset/heads/captain
	uniform = /obj/item/clothing/under/dress/dress_countess
	shoes = /obj/item/clothing/shoes/dress
	id_type = /obj/item/weapon/card/id/dreyfus/gold
	pda_type = /obj/item/device/pda/captain
	gloves = /obj/item/clothing/gloves/white
	head = /obj/item/clothing/head/crown_countess//FIT FOR A FUCKING QUEEN
	r_pocket = /obj/item/weapon/reagent_containers/spray/pepper

/decl/hierarchy/outfit/job/dreyfus/adjoint
	name = OUTFIT_JOB_NAME("Directeur Adjoint")
	l_ear = /obj/item/device/radio/headset/heads/hop
	id_type = /obj/item/weapon/card/id/dreyfus/hop
	pda_type = /obj/item/device/pda/heads/hop

/decl/hierarchy/outfit/job/dreyfus/employe
	name = OUTFIT_JOB_NAME("Employe Administratif")
	l_ear = /obj/item/device/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/internalaffairs/plain/nt
	shoes = /obj/item/clothing/shoes/black
	l_hand = /obj/item/weapon/storage/briefcase
	//id_type = /obj/item/weapon/card/id/dreyfus/civilian/employe
	pda_type = /obj/item/device/pda/lawyer
/*
/decl/hierarchy/outfit/job/dreyfus/inge
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	belt = /obj/item/weapon/storage/belt/utility/full
	l_ear = /obj/item/device/radio/headset/headset_eng
	shoes = /obj/item/clothing/shoes/workboots
	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel_one = /obj/item/weapon/storage/backpack/satchel_eng
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/engi
	id_type = /obj/item/weapon/card/id/dreyfus/engineer
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
*/
/decl/hierarchy/outfit/job/dreyfus/inge/inge
	name = OUTFIT_JOB_NAME("Ingenieur")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/hazard
	r_pocket = /obj/item/device/t_scanner
	l_ear = /obj/item/device/radio/headset/headset_eng
	id_type = /obj/item/weapon/card/id/engineering
	pda_type = /obj/item/device/pda/engineering

/decl/hierarchy/outfit/job/dreyfus/ouvrier
	name = OUTFIT_JOB_NAME("Ouvrier")
	uniform = /obj/item/clothing/under/overalls
	id_type = /obj/item/weapon/card/id/dreyfus/cargo/ouvrier
	pda_type = /obj/item/device/pda/cargo
	l_ear = /obj/item/device/radio/headset/headset_cargo

/decl/hierarchy/outfit/job/science/superviseur
	name = OUTFIT_JOB_NAME("Superviseur")
	l_ear = null
	uniform = null
	shoes = null
	head = null
	suit = null
	id_type = /obj/item/weapon/card/id/science/head
	pda_type = /obj/item/device/pda/heads/rd

/decl/hierarchy/outfit/job/security/peacekeeper
	name = OUTFIT_JOB_NAME("Peacekeeper")
	l_ear = null
	uniform = null
	shoes = null
	head = null
	suit = null
	id_type = /obj/item/weapon/card/id/dreyfus/sec
	pda_type = /obj/item/device/pda/security

/*
/decl/hierarchy/outfit/job/security/peacekeeper/post_equip(var/mob/living/carbon/human/H)
	..()
	// Since we can have something other than the default uniform at this
	// point, check if we can actually attach the medal
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
	var/obj/item/clothing/accessory/storage/Lifchik = new()
		if(uniform.can_attach_accessory(Lifchik))
			uniform.attach_accessory(null, Lifchik)
		else
			qdel(Lifchik)
*/

/decl/hierarchy/outfit/job/security/head_peacekeeper
	name = OUTFIT_JOB_NAME("Head Peacekeeper")
	l_ear = null
	uniform = null
	shoes = null
	head = null
	suit = null
	id_type = /obj/item/weapon/card/id/dreyfus/hos
	pda_type = /obj/item/device/pda/heads/hos

/decl/hierarchy/outfit/job/cargo_kid
	name = OUTFIT_JOB_NAME("Cargo Kid")
	//uniform = /obj/item/clothing/under/child_jumpsuit
	//shoes = /obj/item/clothing/shoes/child_shoes
	id = /obj/item/weapon/card/id/dreyfus/cargo

/decl/hierarchy/outfit/job/cadet
	name = OUTFIT_JOB_NAME("Cadet")
	//uniform = /obj/item/clothing/under/child_jumpsuit
	//shoes = /obj/item/clothing/shoes/child_shoes
	id = /obj/item/weapon/card/id/dreyfus/sec

/decl/hierarchy/outfit/job/medassist
	name = OUTFIT_JOB_NAME("Medical Assistant")
//	uniform = /obj/item/clothing/under/child_jumpsuit
//	shoes = /obj/item/clothing/shoes/child_shoes
	id = /obj/item/weapon/card/id/medical

/decl/hierarchy/outfit/job/jr_upkeep
	name = OUTFIT_JOB_NAME("Junior Upkeeper")
//	uniform = /obj/item/clothing/under/child_jumpsuit
//	shoes = /obj/item/clothing/shoes/child_shoes
	id = /obj/item/weapon/card/id/dreyfus/engineer

//Raider outfit.
/decl/hierarchy/outfit/shipraiders
	name = "Raiders"
	head = /obj/item/clothing/head/helmet/siege
//	uniform = /obj/item/clothing/under/ert/raider
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/device/radio/headset/raider
	r_pocket = /obj/item/weapon/card/emag
	//belt = /obj/item/weapon/gun/projectile/pistol
	suit = /obj/item/clothing/suit/storage/vest/opvest
	//mask = /obj/item/clothing/mask/gas
//	gloves = /obj/item/clothing/gloves/thick/swat/combat
	//back = /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/bayonet
	//flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR