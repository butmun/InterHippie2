/decl/hierarchy/outfit/job/cargo
	l_ear = null
	hierarchy_type = /decl/hierarchy/outfit/job/cargo

/decl/hierarchy/outfit/job/cargo/qm
	name = OUTFIT_JOB_NAME("Cargo")
	l_ear = null
	uniform = null
	shoes = null
	id_slot = slot_wear_amulet
	head = null
	suit = null
	id_type = /obj/item/weapon/card/id/cargo/head
	pda_type = /obj/item/device/pda/quartermaster
	pda_slot = slot_wear_id

/decl/hierarchy/outfit/job/cargo/cargo_tech
	name = OUTFIT_JOB_NAME("Cargo technician")
	l_ear = null
	uniform = null
	shoes = null
	id_slot = slot_wear_amulet
	head = null
	suit = null
	pda_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/cargo
	pda_type = /obj/item/device/pda/cargo

/decl/hierarchy/outfit/job/cargo/mining
	name = OUTFIT_JOB_NAME("Shaft miner")
	l_ear = null
	uniform = null
	shoes = null
	id_slot = slot_wear_amulet
	head = null
	suit = null
	id_type = /obj/item/weapon/card/id/cargo/mining
	pda_type = /obj/item/device/pda/shaftminer
	flags = OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/cargo/mining/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/cargo/mining/void
	name = OUTFIT_JOB_NAME("Shaft miner - Voidsuit")
	head = /obj/item/clothing/head/helmet/space/void/mining
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/void/mining
