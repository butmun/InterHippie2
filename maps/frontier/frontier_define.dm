
/datum/map/frontier
	name = "Frontier"
	full_name = "Space Outpost Frontier"
	path = "frontier"

	lobby_icon = 'maps/frontier/frontier_lobby.dmi'

	station_levels = list(1,2,3,4)
	admin_levels = list(5)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"4"=1)

	allowed_spawns = list("Cryogenic Storage")

	station_name  = "Zvezda Array"
	station_short = "Frontier"
	dock_name     = "TCTM1-54 GR-32 ST"
	boss_name     = "TetraCorp Announcement Relay"
	boss_short    = "TetraCorp"
	company_name  = "TetraCorp Announcement Relay"
	company_short = "TRC"
	system_name = "Zvesda"

	id_hud_icons = 'maps/dreyfus/icons/assignment_hud.dmi'


	map_admin_faxes = list("TetraCorp Central Committee")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled."
	emergency_shuttle_docked_message = "The emergency escape shuttle 'Aqen' has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle 'Aqen' has departed from %dock_name%."
	emergency_shuttle_called_message = "The emergency escape shuttle 'Aqen' has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle 'Aqen' has been recalled."

	evac_controller_type = /datum/evacuation_controller/shuttle

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

/datum/map/frontier/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,3,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,3,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,2,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,4,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,1,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,2,64, 64)
	return 1
