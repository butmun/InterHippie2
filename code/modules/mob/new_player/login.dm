/var/obj/effect/lobby_image = new/obj/effect/lobby_image()

/obj/effect/lobby_image
	name = "Interpost Hague" // god bless us
	desc = "This shouldn't be read."
	mouse_opacity = 0
	screen_loc = "WEST,SOUTH"

/obj/effect/lobby_image/Initialize()
	icon = GLOB.using_map.lobby_icon
	var/known_icon_states = icon_states(icon)
	for(var/lobby_screen in GLOB.using_map.lobby_screens)
		if(!(lobby_screen in known_icon_states))
			error("Lobby screen '[lobby_screen]' did not exist in the icon set [icon].")
			GLOB.using_map.lobby_screens -= lobby_screen

	if(GLOB.using_map.lobby_screens.len)
		icon_state = pick(GLOB.using_map.lobby_screens)
	else
		icon_state = known_icon_states[1]

	. = ..()

/mob/new_player/Login()
	..()
	update_Login_details()	//handles setting lastKnownIP and computer_id for use by the ban systems as well as checking for multikeying
	to_chat(src, "<h1 class='alert'>Story ID:</h1>")

	to_chat(src, "<div class='danger'>[game_id]</div>")

	if(GAME_STATE <= RUNLEVEL_LOBBY)
		to_world("<div class='playerjoinbox'><span class='notice'>LOBBY: [usr.key] comes.</span></div>")

	if(!mind)
		mind = new /datum/mind(key)
		mind.active = 1
		mind.current = src

	loc = null
	client.screen += lobby_image
	my_client = client
	set_sight(sight|SEE_TURFS|SEE_OBJS)
	GLOB.player_list |= src

	client.playtitlemusic()