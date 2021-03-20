#define num2screen(x) "[round(x)]:[round((x) * 32)%32]"
/datum/storage_ui/default
	var/list/is_seeing = new/list() //List of mobs which are currently seeing the contents of this item's storage
	var/list/client_uis = new/list()
	var/list/csu_persist = new/list()

/datum/client_storage_ui
	var/list/grid_boxes = new/list()
	var/list/grab_bar = new/list()
	var/list/item_underlays = new/list()
	var/obj/screen/close/close_button = new()
	var/client/client = null
	var/obj/item/weapon/storage/storage
	var/datum/client_storage_ui_persist/csup

/datum/client_storage_ui/New(var/client/C,var/datum/client_storage_ui_persist/ncsup,var/obj/item/weapon/storage/store)
	client = C
	storage = store
	close_button.master = store
	csup = ncsup

/datum/client_storage_ui_persist
	var/dragging = 0
	var/datum/vec2/held_at = new(0,0)
	var/datum/vec2/old_pos = new(0,0)
	var/tx = 2
	var/ty = 4
	var/obj/item/weapon/storage/storage

/obj/screen/storage/proc/update_screen()
	return

/obj/screen/storage/
	var/datum/client_storage_ui/csu

/obj/screen/storage/gridbox
	name = "storage"
	icon = 'icons/mob/screen1_small.dmi'
	icon_state = "grid"
	layer = HUD_BASE_LAYER - 0.1
	var/store_x = -1
	var/store_y = -1
	var/obj/screen/border_overlay

/obj/screen/storage/gridbox/New(var/datum/client_storage_ui/set_csu, var/obj/item/weapon/storage/storage, var/x, var/y)
	..()
	csu = set_csu
	loc = null
	master = storage
	store_x = x
	store_y = y

/obj/screen/storage/gridbox/proc/place_image(var/d, var/c, var/px, var/py)
	var/image/I = image('icons/mob/screen1_small.dmi', icon_state, dir = d, pixel_x = px, pixel_y = py)
	I.color = c
	return I

/obj/screen/storage/gridbox/MouseEntered()
	..()
	var/obj/item/weapon/storage/storage = master
	if(istype(storage))
		var/obj/item/I = usr.get_active_hand()
		if(I)
			border_overlay = new()
			border_overlay.icon_state = "blank"
			border_overlay.mouse_opacity = 0
			border_overlay.screen_loc = screen_loc

			// Draw the red overlay box
			var/c = "#FF0000"
			if(storage.can_be_inserted(I, usr, store_x, store_y, 1))
				c = "#00FF00"

			// Corners
			border_overlay.overlays += place_image("place_c", NORTH, c, 0                   , 0                   )
			border_overlay.overlays += place_image("place_c", WEST , c, 16 * (I.x_class - 1), 0                   )
			border_overlay.overlays += place_image("place_c", SOUTH, c, 0                   , 16 * (I.y_class - 1))
			border_overlay.overlays += place_image("place_c", EAST , c, 16 * (I.x_class - 1), 16 * (I.y_class - 1))

			// Vertical Borders
			for(var/y = 1 to I.y_class - 1)
				border_overlay.overlays += place_image("place_v", WEST, c, 0                   , 16 * (y - 0.5))
				border_overlay.overlays += place_image("place_v", EAST, c, 16 * (I.x_class - 1), 16 * (y - 0.5))

			// Horizontal
			for(var/x = 1 to I.x_class - 1)
				border_overlay.overlays += place_image("place_h", SOUTH, c, 16 * (x - 0.5), 0                   )
				border_overlay.overlays += place_image("place_h", NORTH, c, 16 * (x - 0.5), 16 * (I.y_class - 1))

			var/image/I_img = image(I)
			I_img.pixel_x = (-16) + I.x_class * 8
			I_img.pixel_y = (-16) + I.y_class * 8
			I_img.alpha = 127
			border_overlay.overlays += I_img

			usr.client.screen.Add(border_overlay)

/obj/screen/storage/gridbox/MouseExited()
	..()
	if(border_overlay)
		usr.client.screen -= border_overlay
		border_overlay.overlays.Cut()
		qdel(border_overlay)

/obj/screen/storage/gridbox/update_screen()
	screen_loc = "[num2screen(csu.csup.tx + (store_x - 1)/2)],[num2screen(csu.csup.ty + store_y/2)]"

/obj/screen/storage/gridbox/Click()
	if(!usr.canClick())
		return 1
	if(usr.stat || usr.paralysis || usr.stunned || usr.weakened)
		return 1
	if (istype(usr.loc,/obj/mecha)) // stops inventory actions in a mech
		return 1
	var/obj/item/weapon/storage/storage = master
	if(istype(storage))
		var/obj/item/I = usr.get_active_hand()
		if(I)
			if(storage.can_be_inserted(I, usr, store_x, store_y))
				storage.handle_item_insertion(I, store_x, store_y)
	return 1

/obj/screen/storage/dragbar
	name = "storage"
	icon = 'icons/mob/screen1_small.dmi'
	icon_state = "grab"
	layer = HUD_BASE_LAYER
	var/pos = 0

/obj/screen/storage/dragbar/New(var/datum/client_storage_ui/set_csu,var/ind,var/typ)
	..()
	loc = null
	csu = set_csu
	pos = ind
	icon_state = "grab"
	dir = typ

/datum/client_storage_ui_persist/proc/try_drag(params)
	if(!dragging)
		return 0
	var/p_list = params2list(params)
	if(p_list["screen-loc"])
		var/datum/vec2/new_held = screenloc2vec2(p_list["screen-loc"])
		tx = Clamp(old_pos.x + (new_held.x - held_at.x), 1.5, 15.5 - (storage.storage_slots_w/2))
		ty = Clamp(old_pos.y + (new_held.y - held_at.y), 1.5, 15 - (storage.storage_slots_h/2))
	storage.storage_ui.prepare_ui()
	storage.show_to(usr)

/client/MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)
	if(mob)
		for(var/obj/item/weapon/storage/stor in mob.s_active)
			var/datum/storage_ui/default/def = stor.storage_ui
			var/datum/client_storage_ui_persist/csup = def.csu_persist[src]
			if(csup)
				csup.try_drag(params)
	..()

/client/MouseUp(object,location,control,params)
	if(mob)
		for(var/obj/item/weapon/storage/stor in mob.s_active)
			var/datum/storage_ui/default/def = stor.storage_ui
			var/datum/client_storage_ui_persist/csup = def.csu_persist[src]
			if(csup && csup.dragging)
				csup.try_drag(params)
				csup.dragging = 0
				stor.storage_ui.prepare_ui()
				stor.show_to(usr)
	..()

/obj/screen/storage/dragbar/MouseDown(location,control,params)
	csu.csup.dragging = 1
	var/p_list = params2list(params)
	csu.csup.held_at = screenloc2vec2(p_list["screen-loc"])
	csu.csup.old_pos = new(csu.csup.tx, csu.csup.ty)

/obj/screen/storage/dragbar/update_screen()
	screen_loc = "[num2screen(csu.csup.tx + pos/2)],[num2screen(csu.csup.ty)]"

/obj/screen/storage/item_underlay
	name = "storage"
	icon = 'icons/mob/screen1_small.dmi'
	icon_state = "store_c"
	var/obj/stored
	var/xoff = 0
	var/yoff = 0

/obj/screen/storage/item_underlay/New(var/datum/client_storage_ui/set_csu, var/obj/I, var/typ, var/x_off, var/y_off)
	csu = set_csu
	stored = I
	xoff = x_off
	yoff = y_off
	icon_state = "store_[typ]"

/obj/screen/storage/item_underlay/Click()
	return stored.Click()

/obj/screen/storage/item_underlay/update_screen()
	var/datum/vec2/stored_at = csu.storage.stored_locations[stored]
	if(stored_at)
		screen_loc = "[num2screen(csu.csup.tx + (stored_at.x - 1)/2 + xoff/2)],[num2screen(csu.csup.ty + stored_at.y/2 + yoff/2)]"

/datum/storage_ui/default/New(var/storage)
	..()

/datum/storage_ui/default/Destroy()
	close_all()
	for(var/client/C in client_uis)
		var/datum/client_storage_ui/csu = client_uis[C]
		for(var/obj/screen/storage/gridbox/box in csu.grid_boxes)
			QDEL_NULL(box)
		csu.grid_boxes.Cut()
		for(var/obj/screen/storage/dragbar/bar in csu.grab_bar)
			QDEL_NULL(bar)
		csu.grab_bar.Cut()
		for(var/obj/screen/storage/item_underlay/und in csu.item_underlays)
			QDEL_NULL(und)
		csu.item_underlays.Cut()
		QDEL_NULL(csu.close_button)
		QDEL_NULL(csu)
	client_uis.Cut()
	for(var/client/C in csu_persist)
		QDEL_NULL(csu_persist[C])
	csu_persist.Cut()
	. = ..()

/datum/storage_ui/default/on_open(var/mob/user)
	if (user.s_active)
		user.s_active.close(user)
	// Do nothing for now.

/datum/storage_ui/default/after_close(var/mob/user)
	user.s_active = null

/datum/storage_ui/default/on_insertion(var/mob/user)
	if(user.s_active)
		user.s_active.show_to(user)

/datum/storage_ui/default/on_pre_remove(var/mob/user, var/obj/item/W)
	for(var/mob/M in range(1, storage.loc))
		if (M.s_active == storage)
			if (M.client)
				M.client.screen -= W

/datum/storage_ui/default/on_post_remove(var/mob/user)
	if(user.s_active)
		user.s_active.show_to(user)

/datum/storage_ui/default/on_hand_attack(var/mob/user)
	for(var/mob/M in range(1))
		if (M.s_active == storage)
			storage.close(M)

// I was doing this manually far too much.
// I'd make this a macro if they supported multiline.
/datum/storage_ui/default/proc/add_item_underlay(var/datum/client_storage_ui/csu, var/obj/O, var/typ, var/d, var/xoff, var/yoff)
	var/obj/screen/storage/item_underlay/next_underlay = new(csu, O, typ, xoff, yoff)
	next_underlay.dir = d
	csu.item_underlays += next_underlay
	next_underlay.update_screen()
	csu.client.screen += next_underlay

/datum/storage_ui/default/show_to(var/mob/user)
	if(user.s_active != storage)
		for(var/obj/item/I in storage)
			if(I.on_found(user))
				return
	if(user.s_active)
		user.s_active.hide_from(user)
	var/datum/client_storage_ui/csu = client_uis[user.client]
	if(csu)
		for(var/obj/screen/storage/gridbox/box in csu.grid_boxes)
			user.client.screen -= box
			QDEL_NULL(box)
		csu.grid_boxes.Cut()

		for(var/obj/screen/storage/dragbar/bar in csu.grab_bar)
			user.client.screen -= bar
			QDEL_NULL(bar)
		csu.grab_bar.Cut()

		for(var/obj/screen/storage/item_underlay/underlay in csu.item_underlays)
			user.client.screen -= underlay
			QDEL_NULL(underlay)
		csu.item_underlays.Cut()

		user.client.screen -= csu.close_button
		QDEL_NULL(csu.close_button)

		QDEL_NULL(csu)
	user.client.screen -= storage.contents

	var/datum/client_storage_ui_persist/csup = csu_persist[user.client]
	if(!csup)
		csup = new()
		csup.storage = storage
		csu_persist[user.client] = csup
	csu = new(user.client, csup, storage)
	client_uis[user.client] = csu

	neo_orient_objs()

	user.client.screen += storage.contents
	for(var/x = 1 to storage.storage_slots_w)
		for(var/y = 1 to storage.storage_slots_h)
			var/obj/screen/storage/gridbox/box = new(csu, storage, x, y)
			csu.grid_boxes += box
			box.update_screen()
			user.client.screen += box

	if(storage.storage_slots_w == 1)
		var/obj/screen/storage/dragbar/bar = new(csu,0,WEST)
		csu.grab_bar += bar
		bar.update_screen()
		user.client.screen += bar
	else
		var/obj/screen/storage/dragbar/bar = new(csu,0,SOUTH)
		csu.grab_bar += bar
		bar.update_screen()
		user.client.screen += bar
		bar = new(csu,storage.storage_slots_w - 1,EAST)
		csu.grab_bar += bar
		bar.update_screen()
		user.client.screen += bar
		for(var/x = 1 to storage.storage_slots_w - 2)
			bar = new(csu,x,NORTH)
			csu.grab_bar += bar
			bar.update_screen()
			user.client.screen += bar

	for(var/obj/O in storage.contents)
		// Start with corners.
		add_item_underlay(csu, O, "c", NORTH, 0            , 0            )
		add_item_underlay(csu, O, "c", WEST , O.x_class - 1, 0            )
		add_item_underlay(csu, O, "c", SOUTH, 0            , O.y_class - 1)
		add_item_underlay(csu, O, "c", EAST , O.x_class - 1, O.y_class - 1)

		// Borders.
		// VERTICAL
		for(var/y = 1 to O.y_class - 1)
			add_item_underlay(csu, O, "v", WEST, 0            , y - 0.5)
			add_item_underlay(csu, O, "v", EAST, O.x_class - 1, y - 0.5)
		// HORIZONTAL
		for(var/x = 1 to O.x_class - 1)
			add_item_underlay(csu, O, "h", SOUTH, x - 0.5, 0            )
			add_item_underlay(csu, O, "h", NORTH, x - 0.5, O.y_class - 1)

		// BAWKSES
		for(var/x = 1 to O.x_class - 1)
			for(var/y = 1 to O.y_class - 1)
				add_item_underlay(csu, O, "m", 0, x - 0.5, y - 0.5)

	csu.close_button.screen_loc = "[num2screen(csu.csup.tx + (storage.storage_slots_w - 1)/2)],[num2screen(csu.csup.ty)]"
	user.client.screen += csu.close_button

	is_seeing |= user
	user.s_active = storage

/datum/storage_ui/default/hide_from(var/mob/user)
	is_seeing -= user
	if(!user.client)
		return
	var/datum/client_storage_ui/csu = client_uis[user.client]
	if(csu)
		for(var/obj/screen/storage/gridbox/box in csu.grid_boxes)
			user.client.screen -= box
			QDEL_NULL(box)
		csu.grid_boxes.Cut()
		for(var/obj/screen/storage/dragbar/bar in csu.grab_bar)
			user.client.screen -= bar
			QDEL_NULL(bar)
		csu.grab_bar.Cut()
		for(var/obj/screen/storage/item_underlay/und in csu.item_underlays)
			user.client.screen -= und
			QDEL_NULL(und)
		csu.item_underlays.Cut()
		user.client.screen -= csu.close_button
		client_uis.Remove(csu)
		QDEL_NULL(csu)
	user.client.screen -= storage.contents
	if(user.s_active == storage)
		user.s_active = null

//Creates the storage UI
/datum/storage_ui/default/prepare_ui()
	neo_orient_objs()

/datum/storage_ui/default/close_all()
	for(var/mob/M in can_see_contents())
		storage.close(M)
		. = 1

/datum/storage_ui/default/proc/can_see_contents()
	var/list/cansee = list()
	for(var/mob/M in is_seeing)
		if(M.s_active == storage && M.client)
			cansee |= M
		else
			is_seeing -= M
	return cansee

//This proc draws out UI elements based on their 2D size and position
/datum/storage_ui/default/proc/neo_orient_objs()
	for(var/client/C in client_uis)
		var/datum/client_storage_ui/csu = client_uis[C]
		if(csu)
			var/tx = csu.csup.tx
			var/ty = csu.csup.ty

			for(var/obj/O in storage.contents)
				var/datum/vec2/stored_loc = storage.stored_locations[O]
				if(istype(stored_loc))
					var sx = tx
					var sy = ty

					sx += (stored_loc.x - 1)/2
					sy += (stored_loc.y) / 2

					sx -= 0.5
					sy -= 0.5

					sx += O.x_class / 4
					sy += O.y_class / 4

					O.screen_loc = "[num2screen(sx)],[num2screen(sy)]"
					O.hud_layerise()