//MENU SYSTEM BY BIGRAGE, some awful code, some awful design, all as you love //Code edits/additions by AshtonFox

/datum/hud/new_player
	hud_shown = TRUE			//Used for the HUD toggle (F12)
	inventory_shown = FALSE
	hotkey_ui_hidden = FALSE

/datum/hud/new_player/FinalizeInstantiation(var/ui_style='icons/mob/screen1_White.dmi', var/ui_color = "#fffffe", var/ui_alpha = 255)
	adding = list()
	var/obj/screen/using

	using = new /obj/screen/new_player/selection/join_game()
	using.SetName("Join Game")
	adding += using

	using = new /obj/screen/new_player/selection/settings()
	using.SetName("Setup Character")
	adding += using

	if(check_rights(R_ADMIN))
		using = new /obj/screen/new_player/selection/observe()
		using.SetName("Observe")
		adding += using

	mymob.client.screen = list()
	mymob.client.screen += adding
	src.adding += using

/obj/screen/new_player
	icon = 'icons/misc/hudmenu.dmi'
	plane = HUD_PLANE
	layer = HUD_BASE_LAYER

/obj/screen/new_player/selection/join_game
	name = "Join Game"
	icon_state = "unready"
	screen_loc = "LEFT+2.1,CENTER-5"

/obj/screen/new_player/selection/settings
	name = "Setup"
	icon_state = "setup"
	screen_loc = "LEFT+6.8,CENTER-5"

/obj/screen/new_player/selection/observe
	name = "Observe"
	icon_state = "observe"
	screen_loc = "LEFT+11,CENTER-5"


//SELECTION

/obj/screen/new_player/selection/New(var/desired_loc)
	return ..()

/obj/screen/new_player/selection/join_game/New()
	var/mob/new_player/player = usr
	if(GAME_STATE <= RUNLEVEL_LOBBY)
		if(player.ready)
			icon_state = "ready"
		else
			icon_state = "unready"
	else
		icon_state = "joingame"

/obj/screen/new_player/selection/join_game/Click()
	var/mob/new_player/player = usr
	if(GAME_STATE <= RUNLEVEL_LOBBY)
		if(!player.ready)
			player.ready = 1
			icon_state = "ready"
		else
			player.ready = 0
			icon_state = "unready"
	else
		icon_state = "joingame"
		player.join_game()

/obj/screen/new_player/selection/manifest/Click()
	var/mob/new_player/player = usr
	player.ViewManifest()

/obj/screen/new_player/selection/observe/Click()
	var/mob/new_player/player = usr
	player.observe()

/obj/screen/new_player/selection/settings/Click()
	var/mob/new_player/player = usr
	player.setupcharacter()

/obj/screen/new_player/selection/changelog/Click()
	var/mob/new_player/player = usr
	player.client.changes()

/obj/screen/new_player/selection/poll/Click()
	var/mob/new_player/player = usr
	player.handle_player_polling()