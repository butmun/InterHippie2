//Defines for echo list index positions.
//ECHO_DIRECT and ECHO_ROOM are the only two that actually appear to do anything, and represent the dry and wet channels of the environment effects, respectively.
//The rest of the defines are there primarily for the sake of completeness. It might be worth testing on EAX-enabled hardware, and on future BYOND versions (I've tested with 511, 512, and 513)
#define ECHO_DIRECT 1
#define ECHO_DIRECTHF 2
#define ECHO_ROOM 3
#define ECHO_ROOMHF 4
#define ECHO_OBSTRUCTION 5
#define ECHO_OBSTRUCTIONLFRATIO 6
#define ECHO_OCCLUSION 7
#define ECHO_OCCLUSIONLFRATIO 8
#define ECHO_OCCLUSIONROOMRATIO 9
#define ECHO_OCCLUSIONDIRECTRATIO 10
#define ECHO_EXCLUSION 11
#define ECHO_EXCLUSIONLFRATIO 12
#define ECHO_OUTSIDEVOLUMEHF 13
#define ECHO_DOPPLERFACTOR 14
#define ECHO_ROLLOFFFACTOR 15
#define ECHO_ROOMROLLOFFFACTOR 16
#define ECHO_AIRABSORPTIONFACTOR 17
#define ECHO_FLAGS 18

//Defines for controlling how zsound sounds.
#define ZSOUND_DRYLOSS_PER_Z -2000 //Affects what happens to the dry channel as the sound travels through z-levels
#define ZSOUND_DISTANCE_PER_Z 2 //Affects the distance added to the sound per z-level travelled

//Sound environment defines. Reverb preset for sounds played in an area, see sound datum reference for more.
#define GENERIC 0
#define PADDED_CELL 1
#define ROOM 2
#define BATHROOM 3
#define LIVINGROOM 4
#define STONEROOM 5
#define AUDITORIUM 6
#define CONCERT_HALL 7
#define CAVE 8
#define ARENA 9
#define HANGAR 10
#define CARPETED_HALLWAY 11
#define HALLWAY 12
#define STONE_CORRIDOR 13
#define ALLEY 14
#define FOREST 15
#define CITY 16
#define MOUNTAINS 17
#define QUARRY 18
#define PLAIN 19
#define PARKING_LOT 20
#define SEWER_PIPE 21
#define UNDERWATER 22
#define DRUGGED 23
#define DIZZY 24
#define PSYCHOTIC 25

#define STANDARD_STATION STONEROOM
#define LARGE_ENCLOSED HANGAR
#define SMALL_ENCLOSED BATHROOM
#define TUNNEL_ENCLOSED CAVE
#define LARGE_SOFTFLOOR CARPETED_HALLWAY
#define MEDIUM_SOFTFLOOR LIVINGROOM
#define SMALL_SOFTFLOOR ROOM
#define ASTEROID CAVE
#define SPACE UNDERWATER

GLOBAL_LIST_INIT(pull_body_sound,list('sound/effects/pulling/pull_body1.ogg','sound/effects/pulling/pull_body2.ogg','sound/effects/pulling/pull_body3.ogg',
									'sound/effects/pulling/pull_body4.ogg','sound/effects/pulling/pull_body5.ogg','sound/effects/pulling/pull_body6.ogg',
									'sound/effects/pulling/pull_body7.ogg','sound/effects/pulling/pull_body8.ogg','sound/effects/pulling/pull_body9.ogg'))

GLOBAL_LIST_INIT(pull_box_sound,list('sound/effects/pulling/pull_box1.ogg','sound/effects/pulling/pull_box2.ogg','sound/effects/pulling/pull_box3.ogg',
									'sound/effects/pulling/pull_box4.ogg','sound/effects/pulling/pull_box5.ogg','sound/effects/pulling/pull_box6.ogg',
									'sound/effects/pulling/pull_box7.ogg','sound/effects/pulling/pull_box8.ogg','sound/effects/pulling/pull_box9.ogg',
									'sound/effects/pulling/pull_box10.ogg','sound/effects/pulling/pull_box11.ogg','sound/effects/pulling/pull_box12.ogg',
									'sound/effects/pulling/pull_box13.ogg','sound/effects/pulling/pull_box14.ogg','sound/effects/pulling/pull_box15.ogg',
									'sound/effects/pulling/pull_box16.ogg','sound/effects/pulling/pull_box17.ogg','sound/effects/pulling/pull_box18.ogg',
									'sound/effects/pulling/pull_box19.ogg','sound/effects/pulling/pull_box20.ogg','sound/effects/pulling/pull_box21.ogg'))

GLOBAL_LIST_INIT(pull_closet_sound,list('sound/effects/pulling/pull_closet1.ogg','sound/effects/pulling/pull_closet2.ogg','sound/effects/pulling/pull_closet3.ogg',
										'sound/effects/pulling/pull_closet4.ogg','sound/effects/pulling/pull_closet5.ogg','sound/effects/pulling/pull_closet6.ogg'))

GLOBAL_LIST_INIT(pull_glass_sound,list('sound/effects/pulling/pull_glass1.ogg','sound/effects/pulling/pull_glass2.ogg','sound/effects/pulling/pull_glass3.ogg',
										'sound/effects/pulling/pull_glass4.ogg','sound/effects/pulling/pull_glass5.ogg','sound/effects/pulling/pull_glass6.ogg',
										'sound/effects/pulling/pull_glass7.ogg','sound/effects/pulling/pull_glass8.ogg','sound/effects/pulling/pull_glass9.ogg',
										'sound/effects/pulling/pull_glass10.ogg'))

GLOBAL_LIST_INIT(pull_machine_sound,list('sound/effects/pulling/pull_machine1.ogg','sound/effects/pulling/pull_machine2.ogg','sound/effects/pulling/pull_machine3.ogg',
										'sound/effects/pulling/pull_machine4.ogg','sound/effects/pulling/pull_machine5.ogg','sound/effects/pulling/pull_machine6.ogg',
										'sound/effects/pulling/pull_machine7.ogg','sound/effects/pulling/pull_machine8.ogg','sound/effects/pulling/pull_machine9.ogg'))

GLOBAL_LIST_INIT(pull_stone_sound,list('sound/effects/pulling/pull_stone1.ogg','sound/effects/pulling/pull_stone2.ogg','sound/effects/pulling/pull_stone3.ogg',
										'sound/effects/pulling/pull_stone4.ogg','sound/effects/pulling/pull_stone5.ogg','sound/effects/pulling/pull_stone6.ogg',
										'sound/effects/pulling/pull_stone7.ogg','sound/effects/pulling/pull_stone8.ogg','sound/effects/pulling/pull_stone9.ogg',
										'sound/effects/pulling/pull_stone10.ogg','sound/effects/pulling/pull_stone11.ogg','sound/effects/pulling/pull_stone12.ogg',
										'sound/effects/pulling/pull_stone13.ogg','sound/effects/pulling/pull_stone14.ogg','sound/effects/pulling/pull_stone15.ogg',
										'sound/effects/pulling/pull_stone16.ogg','sound/effects/pulling/pull_stone17.ogg','sound/effects/pulling/pull_stone18.ogg',
										'sound/effects/pulling/pull_stone19.ogg','sound/effects/pulling/pull_stone20.ogg','sound/effects/pulling/pull_stone21.ogg',
										'sound/effects/pulling/pull_stone22.ogg','sound/effects/pulling/pull_stone23.ogg','sound/effects/pulling/pull_stone24.ogg',
										'sound/effects/pulling/pull_stone25.ogg','sound/effects/pulling/pull_stone26.ogg','sound/effects/pulling/pull_stone27.ogg',
										'sound/effects/pulling/pull_stone28.ogg','sound/effects/pulling/pull_stone29.ogg','sound/effects/pulling/pull_stone30.ogg',
										'sound/effects/pulling/pull_stone31.ogg'))

GLOBAL_LIST_INIT(pull_wood_sound,list('sound/effects/pulling/pull_wood1.ogg','sound/effects/pulling/pull_wood2.ogg','sound/effects/pulling/pull_wood3.ogg',
										'sound/effects/pulling/pull_wood4.ogg','sound/effects/pulling/pull_wood5.ogg','sound/effects/pulling/pull_wood6.ogg',
										'sound/effects/pulling/pull_wood7.ogg','sound/effects/pulling/pull_wood8.ogg','sound/effects/pulling/pull_wood9.ogg',
										'sound/effects/pulling/pull_wood10.ogg','sound/effects/pulling/pull_wood11.ogg','sound/effects/pulling/pull_wood12.ogg',
										'sound/effects/pulling/pull_wood13.ogg','sound/effects/pulling/pull_wood14.ogg','sound/effects/pulling/pull_wood15.ogg',
										'sound/effects/pulling/pull_wood16.ogg','sound/effects/pulling/pull_wood17.ogg','sound/effects/pulling/pull_wood18.ogg',
										'sound/effects/pulling/pull_wood19.ogg','sound/effects/pulling/pull_wood20.ogg','sound/effects/pulling/pull_wood21.ogg',
										'sound/effects/pulling/pull_wood22.ogg','sound/effects/pulling/pull_wood23.ogg','sound/effects/pulling/pull_wood24.ogg',
										'sound/effects/pulling/pull_wood25.ogg','sound/effects/pulling/pull_wood26.ogg','sound/effects/pulling/pull_wood27.ogg',
										'sound/effects/pulling/pull_wood28.ogg','sound/effects/pulling/pull_wood29.ogg','sound/effects/pulling/pull_wood30.ogg',
										'sound/effects/pulling/pull_wood31.ogg','sound/effects/pulling/pull_wood32.ogg','sound/effects/pulling/pull_wood33.ogg',
										'sound/effects/pulling/pull_wood34.ogg','sound/effects/pulling/pull_wood35.ogg','sound/effects/pulling/pull_wood36.ogg',
										'sound/effects/pulling/pull_wood37.ogg'))

GLOBAL_LIST_INIT(shatter_sound,list('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg'))
GLOBAL_LIST_INIT(explosion_sound,list('sound/effects/Explosion1.ogg','sound/effects/Explosion2.ogg'))
GLOBAL_LIST_INIT(spark_sound,list('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg'))
GLOBAL_LIST_INIT(rustle_sound,list('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg'))
GLOBAL_LIST_INIT(punch_sound,list('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'))
GLOBAL_LIST_INIT(clown_sound,list('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg'))
GLOBAL_LIST_INIT(jeseter_sound,list('sound/effects/jesterstep1.ogg','sound/effects/jesterstep2.ogg','sound/effects/jesterstep3.ogg'))
GLOBAL_LIST_INIT(swing_hit_sound,list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg'))
GLOBAL_LIST_INIT(far_fire_sound,list('sound/weapons/Distant_1.ogg','sound/weapons/Distant_2.ogg','sound/weapons/Distant_3.ogg','sound/weapons/Distant_4.ogg','sound/weapons/Distant_5.ogg'))
GLOBAL_LIST_INIT(hiss_sound,list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg'))
GLOBAL_LIST_INIT(page_sound,list('sound/effects/pageturn1.ogg', 'sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg'))
GLOBAL_LIST_INIT(fracture_sound,list('sound/effects/bonebreak1.ogg','sound/effects/bonebreak2.ogg','sound/effects/bonebreak3.ogg','sound/effects/bonebreak4.ogg'))
GLOBAL_LIST_INIT(lighter_sound,list('sound/items/lighter1.ogg','sound/items/lighter2.ogg','sound/items/lighter3.ogg'))
GLOBAL_LIST_INIT(keypress_sound,list('sound/machines/keyboard/keypress1.ogg','sound/machines/keyboard/keypress2.ogg','sound/machines/keyboard/keypress3.ogg','sound/machines/keyboard/keypress4.ogg'))
GLOBAL_LIST_INIT(keystroke_sound,list('sound/machines/keyboard/keystroke1.ogg','sound/machines/keyboard/keystroke2.ogg','sound/machines/keyboard/keystroke3.ogg','sound/machines/keyboard/keystroke4.ogg'))
GLOBAL_LIST_INIT(switch_sound,list('sound/machines/switch1.ogg','sound/machines/switch2.ogg','sound/machines/switch3.ogg','sound/machines/switch4.ogg'))
GLOBAL_LIST_INIT(button_sound,list('sound/machines/button1.ogg','sound/machines/button2.ogg','sound/machines/button3.ogg','sound/machines/button4.ogg'))
GLOBAL_LIST_INIT(flop_sound, list('sound/effects/bodyfall1.ogg','sound/effects/bodyfall2.ogg','sound/effects/bodyfall3.ogg','sound/effects/bodyfall4.ogg'))
GLOBAL_LIST_INIT(trauma_sound, list('sound/effects/gore/trauma1.ogg', 'sound/effects/gore/trauma2.ogg', 'sound/effects/gore/trauma3.ogg'))
GLOBAL_LIST_INIT(casing_sound, list('sound/weapons/guns/misc/casingfall1.ogg','sound/weapons/guns/misc/casingfall2.ogg','sound/weapons/guns/misc/casingfall3.ogg'))
GLOBAL_LIST_INIT(terminal_type, list('sound/machines/keypress1.ogg', 'sound/machines/keypress2.ogg', 'sound/machines/keypress3.ogg', 'sound/machines/keypress4.ogg'))
GLOBAL_LIST_INIT(keyboard_sound, list('sound/machines/terminal_button01.ogg', 'sound/machines/terminal_button02.ogg', 'sound/machines/terminal_button03.ogg',
							  'sound/machines/terminal_button04.ogg', 'sound/machines/terminal_button05.ogg', 'sound/machines/terminal_button06.ogg',
							  'sound/machines/terminal_button07.ogg', 'sound/machines/terminal_button08.ogg'))
GLOBAL_LIST_INIT(gun_sound, list('sound/weapons/gunshot.ogg', 'sound/weapons/gunshot2.ogg', 'sound/weapons/gunshot3.ogg', 'sound/weapons/gunshot4.ogg'))
GLOBAL_LIST_INIT(brifle, list('sound/weapons/newrifle.ogg', 'sound/weapons/newrifle2.ogg', 'sound/weapons/newrifle3.ogg'))
GLOBAL_LIST_INIT(bullet_hit_wall, list('sound/weapons/guns/misc/ric1.ogg', 'sound/weapons/guns/misc/ric2.ogg', 'sound/weapons/guns/misc/ric3.ogg', 'sound/weapons/guns/misc/ric4.ogg', 'sound/weapons/guns/misc/ric5.ogg'))
GLOBAL_LIST_INIT(stab_sound, list('sound/weapons/stab1.ogg', 'sound/weapons/stab2.ogg', 'sound/weapons/stab3.ogg'))
GLOBAL_LIST_INIT(slash_sound, list('sound/weapons/slash1.ogg','sound/weapons/slash2.ogg','sound/weapons/slash3.ogg'))
GLOBAL_LIST_INIT(blunt_swing, list('sound/weapons/blunt_swing1.ogg','sound/weapons/blunt_swing2.ogg','sound/weapons/blunt_swing3.ogg'))
GLOBAL_LIST_INIT(swing_sound, list('sound/weapons/swing_01.ogg', 'sound/weapons/swing_02.ogg', 'sound/weapons/swing_03.ogg'))
GLOBAL_LIST_INIT(chop_sound,list('sound/weapons/chop1.ogg','sound/weapons/chop2.ogg','sound/weapons/chop3.ogg'))
GLOBAL_LIST_INIT(truekeyboard_sound, list('sound/effects/keyboard/keyboard1.ogg', 'sound/effects/keyboard/keyboard2.ogg', 'sound/effects/keyboard/keyboard3.ogg', 'sound/effects/keyboard/keyboard4.ogg'))
GLOBAL_LIST_INIT(blood_sound, list('sound/effects/gore/blood1.ogg', 'sound/effects/gore/blood2.ogg', 'sound/effects/gore/blood3.ogg', 'sound/effects/gore/blood3.ogg', 'sound/effects/gore/blood4.ogg', 'sound/effects/gore/blood5.ogg', 'sound/effects/gore/blood6.ogg'))
GLOBAL_LIST_INIT(liquid_step_sound, list('sound/effects/footsteps/water1.ogg', 'sound/effects/footsteps/water2.ogg', 'sound/effects/footsteps/water3.ogg', 'sound/effects/footsteps/water4.ogg'))

/*
job music
*/
GLOBAL_VAR_INIT(generic_combat_music, pick(list('sound/music/combat_music.ogg','sound/music/bloodlust.ogg')))
GLOBAL_VAR_INIT(command_combat_music, pick(list('sound/music/noble_combat_01.ogg','sound/music/noble_combat_02.ogg','sound/music/noble_combat_03.ogg')))
GLOBAL_VAR_INIT(religion_combat_music, pick(list('sound/music/religion_combat_01.ogg','sound/music/religion_combat_02.ogg')))
GLOBAL_VAR_INIT(jester_combat_music, pick(list('sound/music/jester_combat_01.ogg','sound/music/jester_combat_02.ogg')))
GLOBAL_VAR_INIT(security_combat_music, pick(list('sound/music/security_combat_01.ogg','sound/music/security_combat_02.ogg')))

//We should look into making this shit work
/*
var/list/climb_sound = list(
	'sound/effects/ladder.ogg',
	'sound/effects/ladder2.ogg',
	'sound/effects/ladder3.ogg',
	'sound/effects/ladder4.ogg'
)

var/list/weld_sound = list(
	'sound/items/Welder.ogg',
	'sound/items/welding1.ogg',
	'sound/items/welding2.ogg',
	'sound/items/welding3.ogg',
	'sound/items/welding4.ogg'
)

var/list/gunshot_sound = list('sound/weapons/Gunshot.ogg',
	'sound/weapons/guns/fire/ltrifle_fire.ogg',
	'sound/weapons/guns/fire/m41_shoot.ogg',
	'sound/weapons/guns/fire/revolver_fire.ogg',
	'sound/weapons/guns/fire/sfrifle_fire.ogg',
	'sound/weapons/guns/fire/shotgunp_fire.ogg',
	'sound/weapons/guns/fire/smg_fire.ogg',
	'sound/weapons/guns/fire/sniper_fire.ogg'
)
/*var/list/gun_sound = list(
	'sound/weapons/Gunshot.ogg', 'sound/weapons/Gunshot2.ogg','sound/weapons/Gunshot3.ogg',
	'sound/weapons/Gunshot4.ogg'
)*/

var/list/gun_interact_sound = list(
	'sound/weapons/guns/interact/batrifle_cock.ogg',
	'sound/weapons/guns/interact/batrifle_magin.ogg',
	'sound/weapons/guns/interact/batrifle_magout.ogg',
	'sound/weapons/guns/interact/bullet_insert2.ogg',
	'sound/weapons/guns/interact/bullet_insert.ogg',
	'sound/weapons/guns/interact/hpistol_cock.ogg',
	'sound/weapons/guns/interact/hpistol_magin.ogg',
	'sound/weapons/guns/interact/hpistol_magout.ogg',
	'sound/weapons/guns/interact/lmg_close.ogg',
	'sound/weapons/guns/interact/lmg_cock.ogg',
	'sound/weapons/guns/interact/lmg_magin.ogg',
	'sound/weapons/guns/interact/lmg_magout.ogg',
	'sound/weapons/guns/interact/lmg_open.ogg',
	'sound/weapons/guns/interact/ltrifle_cock.ogg',
	'sound/weapons/guns/interact/ltrifle_magin.ogg',
	'sound/weapons/guns/interact/ltrifle_magout.ogg',
	'sound/weapons/guns/interact/m41_cocked.ogg',
	'sound/weapons/guns/interact/m41_reload.ogg',
	'sound/weapons/guns/interact/pistol_cock.ogg',
	'sound/weapons/guns/interact/pistol_magin.ogg',
	'sound/weapons/guns/interact/pistol_magout.ogg',
	'sound/weapons/guns/interact/rev_cock.ogg',
	'sound/weapons/guns/interact/rev_magin.ogg',
	'sound/weapons/guns/interact/rev_magout.ogg',
	'sound/weapons/guns/interact/rifle_boltback.ogg',
	'sound/weapons/guns/interact/rifle_boltforward.ogg',
	'sound/weapons/guns/interact/rifle_load.ogg',
	'sound/weapons/guns/interact/selector.ogg',
	'sound/weapons/guns/interact/sfrifle_cock.ogg',
	'sound/weapons/guns/interact/sfrifle_magin.ogg',
	'sound/weapons/guns/interact/sfrifle_magout.ogg',
	'sound/weapons/guns/interact/shotgun_insert.ogg',
	'sound/weapons/guns/interact/smg_cock.ogg',
	'sound/weapons/guns/interact/smg_magin.ogg',
	'sound/weapons/guns/interact/smg_magout.ogg'
)

var/list/short_equipement_sound = list(
	'sound/misc/inventory/short_1.ogg',
	'sound/misc/inventory/short_2.ogg',
	'sound/misc/inventory/short_3.ogg'
)

var/list/long_equipement_sound = list(
	'sound/misc/inventory/long_1.ogg',
	'sound/misc/inventory/long_2.ogg',
	'sound/misc/inventory/long_3.ogg'
)

//Sounds of earth, rock and stone
var/list/crumble_sound = list('sound/effects/crumble1.ogg',\
'sound/effects/crumble2.ogg',\
'sound/effects/crumble3.ogg',\
'sound/effects/crumble4.ogg',\
'sound/effects/crumble5.ogg')

//Heavy impact sounds, like a hammer or hard strike
var/list/thud_sound = list('sound/effects/impacts/thud1.ogg',\
'sound/effects/impacts/thud2.ogg',\
'sound/effects/impacts/thud3.ogg')

var/list/footstep_asteroid = list(\
		'sound/effects/footstep/asteroid1.ogg',\
		'sound/effects/footstep/asteroid2.ogg',\
		'sound/effects/footstep/asteroid3.ogg',\
		'sound/effects/footstep/asteroid4.ogg',\
		'sound/effects/footstep/asteroid5.ogg')

var/list/footstep_carpet = list(\
		'sound/effects/footstep/carpet1.ogg',\
		'sound/effects/footstep/carpet2.ogg',\
		'sound/effects/footstep/carpet3.ogg',\
		'sound/effects/footstep/carpet4.ogg',\
		'sound/effects/footstep/carpet5.ogg')

var/list/footstep_catwalk = list(\
		'sound/effects/footstep/catwalk1.ogg',\
		'sound/effects/footstep/catwalk2.ogg',\
		'sound/effects/footstep/catwalk3.ogg',\
		'sound/effects/footstep/catwalk4.ogg',\
		'sound/effects/footstep/catwalk5.ogg')

var/list/footstep_floor = list(\
		'sound/effects/footstep/floor1.ogg',\
		'sound/effects/footstep/floor2.ogg',\
		'sound/effects/footstep/floor3.ogg',\
		'sound/effects/footstep/floor4.ogg',\
		'sound/effects/footstep/floor5.ogg')

var/list/footstep_grass = list(\
		'sound/effects/footstep/grass1.wav',\
		'sound/effects/footstep/grass2.wav',\
		'sound/effects/footstep/grass3.wav',\
		'sound/effects/footstep/grass4.wav')

var/list/footstep_gravel = list(\
		'sound/effects/footstep/gravel1.wav',\
		'sound/effects/footstep/gravel2.wav',\
		'sound/effects/footstep/gravel3.wav',\
		'sound/effects/footstep/gravel4.wav')

var/list/footstep_hull = list(\
		'sound/effects/footstep/hull1.ogg',\
		'sound/effects/footstep/hull2.ogg',\
		'sound/effects/footstep/hull3.ogg',\
		'sound/effects/footstep/hull4.ogg',\
		'sound/effects/footstep/hull5.ogg')

var/list/footstep_plating =list(\
		'sound/effects/footstep/plating1.ogg',\
		'sound/effects/footstep/plating2.ogg',\
		'sound/effects/footstep/plating3.ogg',\
		'sound/effects/footstep/plating4.ogg',\
		'sound/effects/footstep/plating5.ogg')

var/list/footstep_tile = list(\
		'sound/effects/footstep/tile1.wav',\
		'sound/effects/footstep/tile2.wav',\
		'sound/effects/footstep/tile3.wav',\
		'sound/effects/footstep/tile4.wav')

var/list/footstep_wood = list(\
		'sound/effects/footstep/wood1.ogg',\
		'sound/effects/footstep/wood2.ogg',\
		'sound/effects/footstep/wood3.ogg',\
		'sound/effects/footstep/wood4.ogg',\
		'sound/effects/footstep/wood5.ogg')


var/list/rummage_sound = list(\
		'sound/effects/interaction/rummage1.ogg',\
		'sound/effects/interaction/rummage2.ogg',\
		'sound/effects/interaction/rummage3.ogg',\
		'sound/effects/interaction/rummage4.ogg',\
		'sound/effects/interaction/rummage5.ogg',\
		'sound/effects/interaction/rummage6.ogg')


/proc/footstep_sound(var/sound)
	var/toplay
	switch (sound)
		if ("asteroid")
			toplay = pick(footstep_asteroid)
		if ("carpet")
			toplay = pick(footstep_carpet)
		if ("catwalk")
			toplay = pick(footstep_catwalk)
		if ("floor")
			toplay = pick(footstep_floor)
		if ("grass")
			toplay = pick(footstep_grass)
		if ("gravel")
			toplay = pick(footstep_gravel)
		if ("hull")
			toplay = pick(footstep_hull)
		if ("plating")
			toplay = pick(footstep_plating)
		if ("tile")
			toplay = pick(footstep_tile)
		if ("wood")
			toplay = pick(footstep_wood)


	return toplay
*/

/proc/playsound(atom/source, soundin, vol as num, vary, extrarange as num, falloff, is_global, frequency, is_ambiance = 0,  ignore_walls = TRUE, zrange = 2, override_env, envdry, envwet, use_pressure = TRUE)
	if(isarea(source))
		error("[source] is an area and is trying to make the sound: [soundin]")
		return

	soundin = get_sfx(soundin) // same sound for everyone
	frequency = vary && isnull(frequency) ? get_rand_frequency() : frequency // Same frequency for everybody

	var/turf/turf_source = get_turf(source)
	var/maxdistance = (world.view + extrarange) * 2

 	// Looping through the player list has the added bonus of working for mobs inside containers
	var/list/listeners = GLOB.player_list
	if(!ignore_walls) //these sounds don't carry through walls
		listeners = listeners & hearers(maxdistance, turf_source)

	for(var/P in listeners)
		var/mob/M = P
		if(!M || !M.client)
			continue
		if(get_dist(M, turf_source) <= (world.view + extrarange) * 2)
			var/turf/T = get_turf(M)

			if(T && (T.z == turf_source.z || zrange && abs(T.z - turf_source.z) <= zrange))
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, is_global, extrarange, override_env, envdry, envwet, use_pressure)

var/const/FALLOFF_SOUNDS = 0.5

/mob/proc/playsound_local(var/turf/turf_source, soundin, vol as num, vary, frequency, falloff, is_global, extrarange, override_env, envdry, envwet, use_pressure = TRUE)
	if(!src.client || ear_deaf > 0)
		return

	var/sound/S = soundin
	if(!istype(S))
		soundin = get_sfx(soundin)
		S = sound(soundin)
		S.wait = 0 //No queue
		S.channel = 0 //Any channel
		S.volume = vol
		S.environment = -1
		if(frequency)
			S.frequency = frequency
		else if (vary)
			S.frequency = get_rand_frequency()

	//sound volume falloff with pressure
	var/pressure_factor = 1.0

	var/turf/T = get_turf(src)
	// 3D sounds, the technology is here!
	if(T && isturf(turf_source))
		//sound volume falloff with distance
		var/distance = get_dist(T, turf_source)

		S.volume -= max(distance - (world.view + extrarange), 0) * 2 //multiplicative falloff to add on top of natural audio falloff.

		var/datum/gas_mixture/hearer_env = T.return_air()
		var/datum/gas_mixture/source_env = turf_source.return_air()

		if(use_pressure)
			if (hearer_env && source_env)
				var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())

				if (pressure < ONE_ATMOSPHERE)
					pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
			else //in space
				pressure_factor = 0

			if (distance <= 1)
				pressure_factor = max(pressure_factor, 0.15)	//hearing through contact

			S.volume *= pressure_factor

		if (S.volume <= 0)
			return //no volume means no sound

		var/dx = turf_source.x - T.x // Hearing from the right/left
		S.x = dx
		var/dz = turf_source.y - T.y // Hearing from infront/behind
		S.z = dz
		var/dy = (turf_source.z - T.z) * ZSOUND_DISTANCE_PER_Z // Hearing from above/below. There is ceiling in 2d spessmans.
		S.y = (dy < 0) ? dy - 1 : dy + 1 //We want to make sure there's *always* at least one extra unit of distance. This helps normalize sound that's emitting from the turf you're on.
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)

		if(!override_env)
			envdry = abs(turf_source.z - T.z) * ZSOUND_DRYLOSS_PER_Z

	if(!is_global)

		if(istype(src,/mob/living/))
			var/mob/living/carbon/M = src
			if (istype(M) && M.hallucination_power > 50 && M.chem_effects[CE_MIND] < 1)
				S.environment = PSYCHOTIC
			else if (M.druggy)
				S.environment = DRUGGED
			else if (M.drowsyness)
				S.environment = DIZZY
			else if (M.confused)
				S.environment = DIZZY
			else if (M.stat == UNCONSCIOUS)
				S.environment = UNDERWATER
			else if (pressure_factor < 0.5)
				S.environment = SPACE
			else if (override_env)
				S.environment = override_env
			else
				var/area/A = get_area(src)
				S.environment = A.sound_env

		else if (pressure_factor < 0.5)
			S.environment = SPACE
		else
			var/area/A = get_area(src)
			S.environment = A.sound_env

	var/list/echo_list = new(18)
	echo_list[ECHO_DIRECT] = envdry
	echo_list[ECHO_ROOM] = envwet
	S.echo = echo_list

	sound_to(src, S)

/client/proc/playtitlemusic()
	if(get_preference_value(/datum/client_preference/play_lobby_music) == GLOB.PREF_YES)
		GLOB.using_map.lobby_music.play_to(src)

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("pull_body")			soundin = pick(GLOB.pull_body_sound)
			if ("pull_box")				soundin = pick(GLOB.pull_box_sound)
			if ("pull_closet")			soundin = pick(GLOB.pull_closet_sound)
			if ("pull_glass")			soundin = pick(GLOB.pull_glass_sound)
			if ("pull_machine")			soundin = pick(GLOB.pull_machine_sound)
			if ("pull_stone")			soundin = pick(GLOB.pull_stone_sound)
			if ("pull_wood")			soundin = pick(GLOB.pull_wood_sound)
			if ("shatter") 				soundin = pick(GLOB.shatter_sound)
			if ("far_fire") 			soundin = pick(GLOB.far_fire_sound)
			if ("explosion") 			soundin = pick(GLOB.explosion_sound)
			if ("sparks") 				soundin = pick(GLOB.spark_sound)
			if ("blood_drip")			soundin = pick (GLOB.blood_sound)
			if ("liquid_step")			soundin = pick (GLOB.liquid_step_sound)
			if ("rustle") 				soundin = pick(GLOB.rustle_sound)
			if ("punch") 				soundin = pick(GLOB.punch_sound)
			if ("clownstep") 			soundin = pick(GLOB.clown_sound)
			if ("jesterstep")			soundin = pick(GLOB.jeseter_sound)
			if ("swing_hit") 			soundin = pick(GLOB.swing_hit_sound)
			if ("hiss") 				soundin = pick(GLOB.hiss_sound)
			if ("pageturn") 			soundin = pick(GLOB.page_sound)
			if ("fracture") 			soundin = pick(GLOB.fracture_sound)
			if ("light_bic") 			soundin = pick(GLOB.lighter_sound)
			if ("keyboard") 			soundin = pick(GLOB.keyboard_sound)
			if ("keystroke") 			soundin = pick(GLOB.keystroke_sound)
			if ("switch") 				soundin = pick(GLOB.switch_sound)
			if ("button") 				soundin = pick(GLOB.button_sound)
			if ("trauma") 				soundin = pick(GLOB.trauma_sound)
			if ("stab_sound") 			soundin = pick(GLOB.stab_sound)
			if ("casing_sound") 		soundin = pick(GLOB.casing_sound)
			if ("keypress") 			soundin = pick(GLOB.keypress_sound)
			if ("gunshot") 				soundin = pick(GLOB.gun_sound)
			if ("brifle") 				soundin = pick(GLOB.brifle)
			if ("hitwall") 				soundin = pick(GLOB.bullet_hit_wall)
			if ("slash_sound") 			soundin = pick(GLOB.slash_sound)
			if ("swing_sound") 			soundin = pick(GLOB.swing_sound)
			if ("blunt_swing") 			soundin = pick(GLOB.blunt_swing)
			if ("chop") 				soundin = pick(GLOB.chop_sound)
			if ("truekeyboard") 		soundin = pick(GLOB.truekeyboard_sound)
			if ("pratfall") 			soundin = pick(GLOB.flop_sound)
	return soundin
