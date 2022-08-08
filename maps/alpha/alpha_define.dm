
/datum/map/alpha
	name = "Alpha"
	full_name = "Station Alpha"
	path = "alpha"

	lobby_icon = 'maps/alpha/alpha_lobby.dmi'

	station_levels = list(1,2,3)
	admin_levels = list(4)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3,5)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"5"=90) //Percentage of chance to get on this or that Z level as you drift through space.

	allowed_spawns = list("Cryogenic Storage")

	station_name  = "Stellar Fortress Alpha"
	station_short = "Alpha"
	dock_name     = "NAS Aeternum"
	boss_name     = "TetraCorp Board"
	boss_short    = "TTC-B"
	company_name  = "TetraCorp"
	company_short = "TTC"
	system_name = "Algol, Beta Persei"

	map_admin_faxes = list("TetraCorp Mail System")

	shuttle_docked_message = "The Spiteful has docked with the station. The nobles are awaited onboard."
	shuttle_leaving_dock = "The Spiteful has departed from home dock."
	shuttle_called_message = "A scheduled crew transfer shuttle Spiteful has been sent."
	shuttle_recall_message = "The Spiteful has been recalled. Continuous wasting of resources may result in the crew's termination."
	emergency_shuttle_docked_message = "The Spiteful has docked with the station. The nobles are awaited onboard."
	emergency_shuttle_leaving_dock = "The Spiteful emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "Spiteful emergency escape shuttle has been sent. It will arrive in approximately 10 minutes."
	emergency_shuttle_recall_message = "The Spiteful emergency escape shuttle has been recalled. Continuous wasting of resources may result in the crew's termination."

	evac_controller_type = /datum/evacuation_controller/shuttle


/datum/map/alpha/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,1,200, 200) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,1,64, 64)
	return 1

/datum/event_container/mundane
	available_events = list(
		// Severity level, event name, even type, base weight, role weights, one shot, min weight, max weight. Last two only used if set and non-zero
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing",			/datum/event/nothing,			100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "APC Damage",		/datum/event/apc_damage,		20, 	list(ASSIGNMENT_ENGINEER = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Brand Intelligence",/datum/event/brand_intelligence,10, 	list(ASSIGNMENT_JANITOR = 10),	1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Camera Damage",		/datum/event/camera_damage,		20, 	list(ASSIGNMENT_ENGINEER = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Economic News",		/datum/event/economic_event,	300),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Lost Carp",			/datum/event/carp_migration, 	20, 	list(ASSIGNMENT_SECURITY = 10), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Hacker",		/datum/event/money_hacker, 		0, 		list(ASSIGNMENT_ANY = 4), 1, 10, 25),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Money Lotto",		/datum/event/money_lotto, 		0, 		list(ASSIGNMENT_ANY = 1), 1, 5, 15),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mundane News", 		/datum/event/mundane_news, 		300),
		//new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Psionic Signal", 		/datum/event/minispasm, 		300),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Shipping Error",	/datum/event/shipping_error	, 	30, 	list(ASSIGNMENT_ANY = 2), 0),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Meteor Wave",		/datum/event/meteor_wave,		200, 	list(ASSIGNMENT_ANY = 10)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Sensor Suit Jamming",/datum/event/sensor_suit_jamming,50,	list(ASSIGNMENT_MEDICAL = 20, ASSIGNMENT_AI = 20), 1),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Trivial News",		/datum/event/trivial_news, 		400),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Vermin Infestation",/datum/event/infestation, 		100,	list(ASSIGNMENT_JANITOR = 100)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Wallrot",			/datum/event/wallrot, 			0,		list(ASSIGNMENT_ENGINEER = 30, ASSIGNMENT_GARDENER = 50)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Space Cold Outbreak",/datum/event/space_cold,		100,	list(ASSIGNMENT_MEDICAL = 20)),
	)
