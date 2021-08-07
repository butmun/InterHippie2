#define SKYBOX_MAX_BOUND 736

/obj/skybox
	name = "skybox"
	mouse_opacity = 0
	blend_mode = BLEND_MULTIPLY
	plane = SKYBOX_PLANE
	appearance_flags = TILE_BOUND | PIXEL_SCALE
//	invisibility = 101
	anchored = 1
	var/mob/owner
	var/image/image
	var/image/stars
	var/base_x_dim = 7
	var/base_y_dim = 7
	var/base_offset_x = -224 // -(world.view x dimension * world.icon_size)
	var/base_offset_y = -224 // -(world.view y dimension * world.icon_size)

/obj/skybox/stars
	name = "stars"
	icon = 'icons/turf/stars.dmi'
	mouse_opacity = 0
	blend_mode = BLEND_OVERLAY
	plane = DUST_PLANE
	appearance_flags = TILE_BOUND | PIXEL_SCALE | TILE_MOVER

/obj/skybox/stars/Initialize()
	icon_state = "star_[rand(1, 64)]"

/obj/skybox/Initialize()
	. = ..()
	var/mob/M = loc
	SSskybox.skyboxes += src
	owner = M
	loc = null
	SSskybox.skyboxes += src
	image = image('icons/turf/skybox.dmi', src, "space")
	overlays += image

	DoRotate()
	update_skybox()

/obj/skybox/proc/update_skybox()
	if(isnull(owner) || isnull(owner.client))
		qdel(src)
	else
		var/turf/T = get_turf(owner.client.eye)
		screen_loc = "CENTER:[-224-(T&&T.x)],CENTER:[-224-(T&&T.y)]"

/obj/skybox/proc/DoRotate()
	var/matrix/rotation = matrix()
	rotation.TurnTo(SSskybox.BGrot)
	appearance = rotation

/obj/skybox/Destroy()
	overlays.Cut()
	if(owner)
		if(owner.skybox == src)
			owner.skybox = null
		owner = null
	image = null
	stars = null
	SSskybox.skyboxes -= src
	return ..()

/mob
	var/obj/skybox/skybox
/mob/Move()
	. = ..()
	if(. && skybox)
		skybox.update_skybox()

/mob/forceMove()
	. = ..()
	if(. && skybox)
		skybox.update_skybox()

/mob/Login()
	if(!skybox)
		skybox = new(src)
		skybox.owner = src
	client.screen += skybox
	..()

/mob/Destroy()
	if(client)
		client.screen -= skybox
	QDEL_NULL(skybox)
	return ..()

/client
	var/obj/skybox/skybox

/client/proc/set_skybox_offsets(var/x_dim, var/y_dim)
	if(!skybox)
		update_skybox()
	if(skybox)
		skybox.base_x_dim = x_dim
		skybox.base_y_dim = y_dim
		skybox.base_offset_x = -((world.icon_size * skybox.base_x_dim)/2)
		skybox.base_offset_y = -((world.icon_size * skybox.base_y_dim)/2)

		// Check if the skybox needs to be scaled to fit large displays.
		var/new_max_tile_bound = max(skybox.base_x_dim, skybox.base_y_dim)
		var/old_max_tile_bound = SKYBOX_MAX_BOUND/world.icon_size
		if(new_max_tile_bound > old_max_tile_bound)
			var/matrix/M = matrix()
			M.Scale(1 + (new_max_tile_bound/old_max_tile_bound))
			skybox.transform = M
		else
			skybox.transform = null
		update_skybox()

/client/proc/update_skybox(rebuild)
	if(!skybox)
		skybox = new()
		screen += skybox
		rebuild = 1

	var/turf/T = get_turf(eye)
	if(T)
		if(rebuild)
			skybox.overlays.Cut()
			skybox.overlays += SSskybox.reinstate_skyboxes(T.z)
			screen |= skybox
		skybox.screen_loc = "CENTER:[-224 - T.x],CENTER:[-224 - T.y]"
		skybox.screen_loc = "CENTER:[skybox.base_offset_x - T.x],CENTER:[skybox.base_offset_y - T.y]"

#undef SKYBOX_MAX_BOUND
