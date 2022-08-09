//Exists to handle a few global variables that change enough to justify this. Technically a parallax, but it exhibits a skybox effect.

#define RANDOM_RGB rgb(rand(0,255), rand(0,255), rand(0,255))

SUBSYSTEM_DEF(skybox)
	name = "Space skybox"
	init_order = SS_INIT_SKYBOX
	flags = SS_NO_FIRE
	var/background_color
	var/skybox_icon = 'icons/turf/skybox.dmi' //Path to our background. Lets us use anything we damn well please. Skyboxes need to be 736x736
	var/background_icon = "space"
	var/use_stars = TRUE
	var/use_overmap_details = TRUE
	var/star_path = 'icons/turf/stars.dmi'
	var/list/skybox_cache = list()
	var/list/space_appearance_cache

/datum/controller/subsystem/skybox/PreInit()
	build_space_appearances()

/datum/controller/subsystem/skybox/proc/build_space_appearances()
	space_appearance_cache = new(65)
	for (var/i in 0 to 64)
		var/mutable_appearance/dust = mutable_appearance('icons/turf/stars.dmi', "star_[i]")
		dust.plane = DUST_PLANE
		dust.alpha = 80
		dust.blend_mode = BLEND_ADD

		var/mutable_appearance/space = new /mutable_appearance(/turf/space)
		space.icon_state = "white"
		space.overlays += dust
		space_appearance_cache[i + 1] = space.appearance

/datum/controller/subsystem/skybox/Initialize(start_uptime)
	background_color = RANDOM_RGB

/datum/controller/subsystem/skybox/Recover()
	background_color = SSskybox.background_color
	skybox_cache = SSskybox.skybox_cache

/datum/controller/subsystem/skybox/proc/get_skybox(z)
	if(!skybox_cache["[z]"])
		skybox_cache["[z]"] = generate_skybox(z)
	return skybox_cache["[z]"]

/datum/controller/subsystem/skybox/proc/generate_skybox(z)
	var/star_state = "star_[rand(1, 64)]"
	var/image/res = image(skybox_icon)

	var/image/base = overlay_image(skybox_icon, background_icon, background_color)

	if(use_stars)
		var/mutable_appearance/space = new /mutable_appearance(/turf/space)
		var/image/stars = overlay_image(skybox_icon, star_state, flags = RESET_COLOR)
		space.overlays += stars

	res.overlays += base

	return res

/datum/controller/subsystem/skybox/proc/rebuild_skyboxes(var/list/zlevels)
	for(var/z in zlevels)
		skybox_cache["[z]"] = generate_skybox(z)

	for(var/client/C)
		C.update_skybox(1)

//Update skyboxes. Called by universes, for now.
/datum/controller/subsystem/skybox/proc/change_skybox(new_state, new_color, new_use_stars, new_use_overmap_details)
	var/need_rebuild = FALSE
	if(new_state != background_icon)
		background_icon = new_state
		need_rebuild = TRUE

	if(new_color != background_color)
		background_color = new_color
		need_rebuild = TRUE

	if(new_use_stars != use_stars)
		use_stars = new_use_stars
		need_rebuild = TRUE

	if(new_use_overmap_details != use_overmap_details)
		use_overmap_details = new_use_overmap_details
		need_rebuild = TRUE

	if(need_rebuild)
		skybox_cache.Cut()

		for(var/client/C)
			C.update_skybox(1)