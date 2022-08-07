
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
	boss_name     = "King's Authority"
	boss_short    = "The Authority"
	company_name  = "The Kingdom of Jubilee"
	company_short = "Kingdom"
	system_name = "Algol, Beta Persei"

	map_admin_faxes = list("King's Authority Mail System")

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