#define isWrench(A)      (A && A.iswrench())
#define isWelder(A)      (A && A.iswelder())
#define isCoil(A)        (A && A.iscoil())
#define isWirecutter(A)  (A && A.iswirecutter())
#define isScrewdriver(A) (A && A.isscrewdriver())
#define isMultitool(A)   (A && A.ismultitool())
#define isCrowbar(A)     (A && A.iscrowbar())
//snowflake code because yes
/atom/proc/iswrench()
	return FALSE

/atom/proc/iswelder()
	return FALSE

/atom/proc/iscoil()
	return FALSE

/atom/proc/iswirecutter()
	return FALSE

/atom/proc/isscrewdriver()
	return FALSE

/atom/proc/ismultitool()
	return FALSE

/atom/proc/iscrowbar()
	return FALSE

/obj/item/weapon/wrench/iswrench()
	return TRUE

/obj/item/weapon/weldingtool/iswelder()
	return TRUE

/obj/item/stack/cable_coil/iscoil()
	return TRUE

/obj/item/weapon/wirecutters/iswirecutter()
	return TRUE

/obj/item/weapon/screwdriver/isscrewdriver()
	return TRUE

/obj/item/device/multitool/ismultitool()
	return TRUE

/obj/item/weapon/crowbar/iscrowbar()
	return TRUE

/obj/item/psychic_power/tinker
	name = "psychokinetic crowbar"
	icon_state = "tinker"
	force = 1
	var/emulating = "Crowbar"

/obj/item/psychic_power/tinker/iscrowbar()
	return emulating == "Crowbar"

/obj/item/psychic_power/tinker/iswrench()
	return emulating == "Wrench"

/obj/item/psychic_power/tinker/isscrewdriver()
	return emulating == "Screwdriver"

/obj/item/psychic_power/tinker/iswirecutter()
	return emulating == "Wirecutters"

/obj/item/psychic_power/tinker/attack_self()

	if(!owner || loc != owner)
		return

	var/choice = input("Select a tool to emulate.","Power") as null|anything in list("Crowbar","Wrench","Screwdriver","Wirecutters","Dismiss")
	if(!choice)
		return

	if(!owner || loc != owner)
		return

	if(choice == "Dismiss")
		sound_to(owner, 'sound/effects/psi/power_fail.ogg')
		owner.drop_from_inventory(src)
		return

	emulating = choice
	name = "psychokinetic [lowertext(emulating)]"
	to_chat(owner, "<span class='notice'>You begin emulating \a [lowertext(emulating)].</span>")