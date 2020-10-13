//Helpers for the pods
//If you want to make a new one
//Just copy paste the pod 1 code and change 1 for 2 and so on
/*
/datum/shuttle/autodock/ferry/escape_pod
	category = /datum/shuttle/autodock/ferry/escape_pod
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	var/number

/datum/shuttle/autodock/ferry/escape_pod/New()
	name = "Escape Pod [number]"
	dock_target = "escape_pod_[number]"
	arming_controller = "escape_pod_[number]_berth"
	waypoint_station = "escape_pod_[number]_start"
	landmark_transition = "escape_pod_[number]_internim"
	waypoint_offsite = "escape_pod_[number]_out"
	..()

/obj/effect/shuttle_landmark/escape_pod/
	var/number

/obj/effect/shuttle_landmark/escape_pod/start
	name = "Docked"

/obj/effect/shuttle_landmark/escape_pod/start/New()
	landmark_tag = "escape_pod_[number]_start"
	docking_controller = "escape_pod_[number]_berth"
	..()

/obj/effect/shuttle_landmark/escape_pod/transit
	name = "In transit"

/obj/effect/shuttle_landmark/escape_pod/transit/New()
	landmark_tag = "escape_pod_[number]_internim"
	..()

/obj/effect/shuttle_landmark/escape_pod/out
	name = "Escaped"

/obj/effect/shuttle_landmark/escape_pod/out/New()
	landmark_tag = "escape_pod_[number]_out"
	..()

//Actually pods

/datum/shuttle/autodock/ferry/escape_pod/escape_pod1
	shuttle_area = /area/shuttle/escape_pod1/station
	number = 1
/obj/effect/shuttle_landmark/escape_pod/start/pod1
	number = 1
/obj/effect/shuttle_landmark/escape_pod/out/pod1
	number = 1
/obj/effect/shuttle_landmark/escape_pod/transit/pod1
	number = 1
*/
//Rescue shuttle

/datum/shuttle/autodock/multi/antag/rescue
	name = "Rescue"
	warmup_time = 10
	destination_tags = list(
		"nav_specops_start",
		"nav_specops_xenoarch",
		"nav_specops_residen",
		"nav_specops_coupole",
		)
	shuttle_area = /area/shuttle/specops/centcom
	dock_target = "specops_shuttle_port"
	current_location = "nav_specops_start"
	landmark_transition = "nav_specops_transition"
	home_waypoint = "nav_specops_start"
	announcer = "CMA"
	arrival_message = "You guys fucked it all up. CMA units are on the way to fix you're mistake."
	departure_message = "The units."
/*
/datum/shuttle/autodock/multi/antag/mercenary
	name = "Mercenary"
	warmup_time = 0
	destination_tags = list(
		"nav_merc_dock",
		"nav_merc_north",
		"nav_merc_south",
		"nav_merc_east",
		"nav_merc_west"
		)
	shuttle_area = /area/syndicate_station/start
	dock_target = "merc_shuttle"
	current_location = "nav_merc_start"
	landmark_transition = "nav_merc_transition"
	announcer = "Alpha Sensor Array"
	home_waypoint = "nav_merc_start"
	arrival_message = "Attention, vessel detected entering station proximity."
	departure_message = "Attention, vessel detected leaving station proximity."
	*/
/obj/effect/shuttle_landmark/specops/start
	name = "Patrol Area"
	landmark_tag = "nav_specops_start"
	docking_controller = "specops_centcom_dock"
	base_area = /area/syndicate_mothership
	base_turf = /turf/simulated/floor/snow

/obj/effect/shuttle_landmark/specops/internim
	name = "In transit"
	landmark_tag = "nav_specops_transition"

/obj/effect/shuttle_landmark/specops/xenoarch
	name = "To the Xenoarcheology Airlock"
	landmark_tag = "nav_specops_xenoarch"

/obj/effect/shuttle_landmark/specops/coupole
	name =  "Near the Dome"
	landmark_tag = "nav_specops_coupole"

/obj/effect/shuttle_landmark/specops/residentiel
	name = "Near the Residential Access"
	landmark_tag = "nav_specops_residen"

//Cargo shuttle

/datum/shuttle/autodock/ferry/supply/drone
	name = "Supply"
	location = 1
	warmup_time = 10
	shuttle_area = /area/supply/dock
	dock_target = "supply_shuttle"
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/centcom
	name = "Centcom"
	landmark_tag = "nav_cargo_start"
	docking_controller = "centcom_dock"

/obj/effect/shuttle_landmark/supply/station
	name = "Dock Station"
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"

/*
//Mining shuttle
/datum/shuttle/autodock/ferry/mining
	name = "Supply"
	location = 1
	warmup_time = 10
	shuttle_area = /area/supply/dock
	dock_target = "supply_shuttle"
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/mining/station
	name = "Station"
	landmark_tag = "nav_cargo_start"

/obj/effect/shuttle_landmark/mining/asteroid
	name = "minig"
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"
*/

//Emergency shuttle

/datum/shuttle/autodock/ferry/emergency/centcom
	name = "Escape"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/escape/centcom
	dock_target = "escape_shuttle"
	landmark_transition = "nav_escape_transition"
	waypoint_offsite = "nav_centcom_dock"
	waypoint_station = "nav_escape_dock"

/obj/effect/shuttle_landmark/escape/centcom
	name = "Centcom"
	landmark_tag = "nav_centcom_dock"
	docking_controller = "centcom_dock"

/obj/effect/shuttle_landmark/escape/internim
	name = "In transit"
	landmark_tag = "nav_escape_transition"

/obj/effect/shuttle_landmark/escape/station
	name = "Station"
	landmark_tag = "nav_escape_dock"
	docking_controller = "escape_dock"

//Commented out till I map these in.
//Merc

/datum/shuttle/autodock/multi/antag/mercenary
	name = "Mercenary"
	warmup_time = 0
	destination_tags = list(
		"nav_merc_dock",
		"nav_merc_north",
		"nav_merc_south",
		"nav_merc_east",
		"nav_merc_west"
		)
	shuttle_area = /area/syndicate_station/start
	dock_target = "merc_shuttle"
	current_location = "nav_merc_start"
	landmark_transition = "nav_merc_transition"
	announcer = "Alpha Sensor Array"
	home_waypoint = "nav_merc_start"
	arrival_message = "Attention, vessel detected entering station proximity."
	departure_message = "Attention, vessel detected leaving station proximity."

/obj/effect/shuttle_landmark/merc/start
	name = "Mercenary Base"
	landmark_tag = "nav_merc_start"
	docking_controller = "merc_base"
	base_area = /area/syndicate_mothership
	base_turf = /turf/simulated/floor/snow
/obj/effect/shuttle_landmark/merc/internim
	name = "In transit"
	landmark_tag = "nav_merc_transition"

/obj/effect/shuttle_landmark/merc/dock
	name = "Arrival Port"
	landmark_tag = "nav_merc_dock"
	docking_controller = "specops_dock_airlock"

/obj/effect/shuttle_landmark/merc/north
	name = "North of the Station"
	landmark_tag = "nav_merc_north"

/obj/effect/shuttle_landmark/merc/south
	name = "South of the Station"
	landmark_tag = "nav_merc_south"

/obj/effect/shuttle_landmark/merc/east
	name = "East of the Station"
	landmark_tag = "nav_merc_east"

/obj/effect/shuttle_landmark/merc/west
	name = "West of the Station"
	landmark_tag = "nav_merc_west"

//Ninja
/*
//Ninja Shuttle.
/datum/shuttle/autodock/multi/antag/ninja
	name = "Ninja"
	warmup_time = 0
	destinations = list(
		"nav_ninja_adm",
		"nav_ninja_eng",
		"nav_ninja_asteroid",
		"nav_ninja_start"
		)
	shuttle_area = /area/syndicate_mothership/ninja
	current_location = "nav_ninja_start"
	landmark_transition = "nav_ninja_transition"
	announcer = "Colonial Magistrate Authority"
	arrival_message = "Attention, anomalous sensor reading detected entering station proximity."
	departure_message = "Attention, anomalous sensor reading detected leaving station proximity."

/obj/effect/shuttle_landmark/ninja/start
	name = "Away Asteroid Belt"
	landmark_tag = "nav_ninja_start"

/obj/effect/shuttle_landmark/ninja/internim
	name = "In transit"
	landmark_tag = "nav_ninja_transition"

/obj/effect/shuttle_landmark/ninja/civ
	name = "North of Administrative Deck"
	landmark_tag = "nav_ninja_adm"

/obj/effect/shuttle_landmark/ninja/eng
	name = "Southwest of Engineering"
	landmark_tag = "nav_ninja_eng"

/obj/effect/shuttle_landmark/ninja/asteroid
	name = "Asteroids on Industrial Deck"
	landmark_tag = "nav_ninja_asteroid"
*/
//Skipjack

/datum/shuttle/autodock/multi/antag/skipjack
    name = "Skipjack"
    warmup_time = 0
    destination_tags = list(
        "nav_skipjack_arrivals",
        "nav_skipjack_civ",
        "nav_skipjack_ind",
        "nav_skipjack_start"
        )
    shuttle_area =  /area/skipjack_station/start
    dock_target = "skipjack_shuttle"
    current_location = "nav_skipjack_start"
    landmark_transition = "nav_skipjack_transition"
    announcer = "ESIN Arbanon Sensor Array"
    home_waypoint = "nav_skipjack_start"
    arrival_message = "Attention, vessel detected entering station proximity."
    departure_message = "Attention, vessel detected leaving station proximity."

/obj/effect/shuttle_landmark/skipjack/start
    name = "Raider Outpost"
    landmark_tag = "nav_skipjack_start"
    docking_controller = "skipjack_base"

/obj/effect/shuttle_landmark/skipjack/internim
    name = "In transit"
    landmark_tag = "nav_skipjack_transition"

/obj/effect/shuttle_landmark/skipjack/arrivals
    name = "Arrivals"
    landmark_tag = "nav_skipjack_arrivals"

/obj/effect/shuttle_landmark/skipjack/civ
    name = "West of Civilian Deck"
    landmark_tag = "nav_skipjack_civ"

/obj/effect/shuttle_landmark/skipjack/ind
    name = "Mining Airlock"
    landmark_tag = "nav_skipjack_ind"

/area/shuttle/lift
  name = "Cargo Lift"
  icon_state = "shuttle3"

/obj/effect/shuttle_landmark/lift/top
	name = "Top Deck"
	landmark_tag = "nav_lift_top"
	base_area = /area/quartermaster/office
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/bottom
	name = "Lower Deck"
	landmark_tag = "nav_lift_bottom"
	base_area = /area/quartermaster/storage
	base_turf = /turf/simulated/floor/plating

/datum/shuttle/autodock/ferry/lift
	name = "Cargo Lift"
	shuttle_area = /area/shuttle/lift
	warmup_time = 3	//give those below some time to get out of the way
	waypoint_station = "nav_lift_top"
	waypoint_offsite = "nav_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/obj/machinery/computer/shuttle_control/lift
	name = "cargo lift controls"
	shuttle_tag = "Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0

/area/shuttle/lift2
  name = "Mining Lift"
  icon_state = "shuttle3"

/obj/effect/shuttle_landmark/lift2/top
	name = "Top Deck"
	landmark_tag = "nav_mine_lift_top"
	base_area = /area/quartermaster/storage
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift2/bottom
	name = "Lower Deck"
	landmark_tag = "nav_mine_lift_bottom"
	base_area = /area/quartermaster/miningdock
	base_turf = /turf/simulated/floor/plating

/datum/shuttle/autodock/ferry/lift2
	name = "Mining Lift"
	shuttle_area = /area/shuttle/lift2
	warmup_time = 6	//give those below some time to get out of the way
	waypoint_station = "nav_mine_lift_top"
	waypoint_offsite = "nav_mine_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/obj/machinery/computer/shuttle_control/lift2
	name = "mining lift controls"
	shuttle_tag = "Mining Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0