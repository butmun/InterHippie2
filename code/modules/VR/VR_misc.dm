/turf/unsimulated/wall/cyber
	name = "firewall"
	desc = "After all this time, you don't even see the lines of code anymore. You only see countless designs and endless perils."
	icon = 'icons/misc/cyberspace.dmi'
	icon_state = "beam1"
	light_range = 2
	light_power = 3

/turf/simulated/floor/fixed/cyber
	name = "code floor"
	desc = "This flooring does not, strictly, exist. It is only an aid in your quest for data, built by your deck"
	icon = 'icons/misc/cyberspace.dmi'
	icon_state = "shadow"
	light_range = 2
	light_power = 3

/turf/simulated/floor/cyber
	name = "black ice"
	desc = "Game over man, game over"
	icon = 'icons/misc/cyberspace.dmi'
	icon_state = "black_ice"
	light_range = 2
	light_power = 3

/turf/simulated/floor/cyber/Entered(var/mob/living/carbon/human/vrhuman/L)
	L.death()

/turf/simulated/floor/cyber/redice
	name = "red ice"
	desc = "Ouch!"
	icon_state = "red_ice"

/turf/simulated/floor/cyber/redice/Entered(var/mob/living/carbon/human/vrhuman/L)
	L.adjustBruteLoss(50)

/turf/unsimulated/wall/cyber/blueice
	name = "blue ice"
	desc = "Weak barriers, easily disposed of."
	icon_state = "ice"

/turf/unsimulated/wall/cyber/blueice/attack_hand(mob/user)
	ChangeTurf(/turf/simulated/floor/fixed/cyber)
	playsound(src,'sound/misc/ipick.ogg', 100)

/obj/item/weapon/disk/tech_disk/vr
	name = "Technical Design Disk"
	desc = "A design disk crammed to the brim with whatever the cybertechnician could get his grubby little hands on before he got booted out."

/obj/item/weapon/disk/tech_disk/vr/New()
	switch(roll(1,9))
		if(1)
			name = "Engineering Design Disk"
			desc += "\n This one contains engineering designs."
			var/datum/tech/engineering/sneed = new /datum/tech/engineering()
			stored = sneed
			stored.level = 5
		if(2)
			name = "Material Design Disk"
			desc += "\n This one contains esoteric material designs."
			var/datum/tech/materials/sneed = new /datum/tech/materials()
			stored = sneed
			stored.level = 5
		if(3)
			name = "Phoron Design Disk"
			desc += "\n This one contains designs related to the safe handling and manipulation of Phoron"
			var/datum/tech/phorontech/sneed = new /datum/tech/phorontech()
			stored = sneed
			stored.level = 5
		if(4)
			name = "Power Manipulation Design Disk"
			desc += "\n This one contains power manipulation and storage designs."
			var/datum/tech/powerstorage/sneed = new /datum/tech/powerstorage()
			stored = sneed
			stored.level = 5
		if(5)
			name = "Bluespace Design Disk"
			desc += "\n This one contains Bluespace designs."
			var/datum/tech/bluespace/sneed = new /datum/tech/bluespace()
			stored = sneed
			stored.level = 5
		if(6)
			name = "Biotechnological Design Disk"
			desc += "\n This one contains Biotech designs."
			var/datum/tech/biotech/sneed = new /datum/tech/biotech()
			stored = sneed
			stored.level = 5
		if(7)
			name = "Combat Systems Design Disk"
			desc += "\n This one contains Combat System designs."
			var/datum/tech/combat/sneed = new /datum/tech/combat()
			stored = sneed
			stored.level = 5
		if(8)
			name = "Electro-Magnetic Design Disk"
			desc += "\n This one contains Electro-Magnetic Spectrum designs."
			var/datum/tech/magnets/sneed = new /datum/tech/magnets()
			stored = sneed
			stored.level = 5
		if(9)
			name = "Data Theory Design Disk"
			desc += "\n This one contains Data Theory designs."
			var/datum/tech/programming/sneed = new /datum/tech/programming()
			stored = sneed
			stored.level = 5

/obj/item/weapon/implant/cyberdock
	name = "Cyberspace plug"
	desc = "A head-mounted Cyber-plug. Allows for direct brain-stem connection to any Cyberspace dock. Necessary for any exploration of Cyberspace."
	icon_state = "cyberport"
	var/points = 0

/obj/item/weapon/implanter/cyberdock
	name = "implanter (Cyber)"
	imp = /obj/item/weapon/implant/cyberdock

/obj/item/clothing/head/cyberdeck
	name = "Cyberspace Deck"
	icon_state = "cyberdeck"
	item_state = "cyberdeck"
	desc = "A Cyber-Deck used to filter out garbage data and to enhance the ability of the Cybertechnician to work in a place no man was meant to be."
	tint = TINT_BLIND

/obj/item/clothing/head/cyberdeck/equipped(mob/living/carbon/human/M, var/slot)
	if(slot == slot_head)
		M.adjustInteligence(3)

/obj/item/clothing/head/cyberdeck/dropped(mob/living/carbon/human/M)
	M.adjustInteligence(-3)
