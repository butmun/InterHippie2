// simulated/floor is currently plating by default, but there really should be an explicit plating type.
/turf/simulated/floor/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"
	layer = PLATING_LAYER

/turf/simulated/floor/bluegrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "bcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit
	light_range = 2
	light_power = 3
	light_color = COLOR_BLUE

/turf/simulated/floor/bluegrid/airless
	initial_gas = null

/turf/simulated/floor/greengrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit/green
	light_range = 2
	light_power = 3
	light_color = COLOR_GREEN

/turf/simulated/floor/blackgrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "rcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit/red
	light_range = 2
	light_power = 2
	light_color = COLOR_RED

/turf/simulated/floor/greengrid/airless
	initial_gas = null

/turf/simulated/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood"
	initial_flooring = /decl/flooring/wood

/turf/simulated/floor/wood/fancywooden
	name = "wooden floor"
	icon_state = "fancywood"
	initial_flooring = /decl/flooring/fancywood

/turf/simulated/floor/wood/thatch
	name = "wooden floor"
	icon_state = "thatch1"
	initial_flooring = /decl/flooring/thatch1

/turf/simulated/floor/wood/thatch2
	name = "wooden floor"
	icon_state = "thatch2"
	initial_flooring = /decl/flooring/thatch2

/turf/simulated/scorchedearth
	name = "scorched earth"
	icon = 'icons/turf/jungle.dmi'
	icon_state = "scorched"

/turf/simulated/floor/grass
	name = "grass patch"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass

/turf/simulated/floor/diona
	name = "biomass"
	icon = 'icons/turf/floors.dmi'
	initial_flooring = /decl/flooring/diona

/turf/simulated/floor/carpet
	name = "brown carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "brown"
	initial_flooring = /decl/flooring/carpet

/turf/simulated/floor/carpet/blue
	name = "blue carpet"
	icon_state = "blue1"
	initial_flooring = /decl/flooring/carpet/blue

/turf/simulated/floor/carpet/blue2
	name = "pale blue carpet"
	icon_state = "blue2"
	initial_flooring = /decl/flooring/carpet/blue2

/turf/simulated/floor/carpet/purple
	name = "purple carpet"
	icon_state = "purple"
	initial_flooring = /decl/flooring/carpet/purple

/turf/simulated/floor/carpet/orange
	name = "orange carpet"
	icon_state = "orange"
	initial_flooring = /decl/flooring/carpet/orange

/turf/simulated/floor/carpet/green
	name = "green carpet"
	icon_state = "green"
	initial_flooring = /decl/flooring/carpet/green

/turf/simulated/floor/carpet/red
	name = "red carpet"
	icon_state = "red"
	initial_flooring = /decl/flooring/carpet/red

/turf/simulated/floor/reinforced
	name = "reinforced floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "reinforced"
	initial_flooring = /decl/flooring/reinforced

/turf/simulated/floor/reinforced/airless
	initial_gas = null

/turf/simulated/floor/reinforced/airmix
	initial_gas = list("oxygen" = MOLES_O2ATMOS, "nitrogen" = MOLES_N2ATMOS)

/turf/simulated/floor/reinforced/nitrogen
	initial_gas = list("nitrogen" = ATMOSTANK_NITROGEN)

/turf/simulated/floor/reinforced/hydrogen
	initial_gas = list("hydrogen" = ATMOSTANK_HYDROGEN)

/turf/simulated/floor/reinforced/oxygen
	initial_gas = list("oxygen" = ATMOSTANK_OXYGEN)

/turf/simulated/floor/reinforced/phoron
	initial_gas = list("phoron" = ATMOSTANK_PHORON)

/turf/simulated/floor/reinforced/nitrogen/engine
	name = "engine floor"
	initial_gas = list("nitrogen" = MOLES_N2STANDARD)

/turf/simulated/floor/reinforced/phoron/fuel
	initial_gas = list("phoron" = ATMOSTANK_PHORON_FUEL)

/turf/simulated/floor/reinforced/hydrogen
	initial_gas = list("hydrogen" = ATMOSTANK_HYDROGEN)

/turf/simulated/floor/reinforced/hydrogen/fuel
	initial_gas = list("hydrogen" = ATMOSTANK_HYDROGEN_FUEL)

/turf/simulated/floor/reinforced/carbon_dioxide
	initial_gas = list("carbon_dioxide" = ATMOSTANK_CO2)

/turf/simulated/floor/reinforced/n20
	initial_gas = list("sleeping_agent" = ATMOSTANK_NITROUSOXIDE)


/turf/simulated/floor/cult
	name = "engraved floor"
	icon = 'icons/turf/flooring/cult.dmi'
	icon_state = "cult"
	initial_flooring = /decl/flooring/reinforced/cult

/turf/simulated/floor/cult/cultify()
	return

/turf/simulated/floor/tiled
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	initial_flooring = /decl/flooring/tiling

/turf/simulated/floor/tiled/dark
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel2"
	initial_flooring = /decl/flooring/tiling/dark

/turf/simulated/floor/tiled/bright
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel3"
	initial_flooring = /decl/flooring/tiling/bright

/turf/simulated/floor/tiled/verybright
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel4"
	initial_flooring = /decl/flooring/tiling/verybright

/turf/simulated/floor/tiled/no0
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "n00"
	initial_flooring = /decl/flooring/tiling/no0

/turf/simulated/floor/tiled/no1
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "n01"
	initial_flooring = /decl/flooring/tiling/no1

/turf/simulated/floor/tiled/bleeky
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "bleeky2"
	initial_flooring = /decl/flooring/tiling/bleeky

/turf/simulated/floor/tiled/lev
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "lev"
	initial_flooring = /decl/flooring/tiling/lev

/turf/simulated/floor/tiled/purpleos
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "os11"
	initial_flooring = /decl/flooring/tiling/purpleos

/turf/simulated/floor/tiled/darkpurpleos
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "os12"
	initial_flooring = /decl/flooring/tiling/darkpurpleos

/turf/simulated/floor/tiled/cargo5
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "os7"
	initial_flooring = /decl/flooring/tiling/cargo5

/turf/simulated/floor/tiled/cargochess
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "os8"
	initial_flooring = /decl/flooring/tiling/cargochess

/turf/simulated/floor/tiled/barnew
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "os5"
	initial_flooring = /decl/flooring/tiling/barnew

/turf/simulated/floor/tiled/f2
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "F2"
	initial_flooring = /decl/flooring/tiling/f2

/turf/simulated/floor/tiled/f3
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "F3"
	initial_flooring = /decl/flooring/tiling/f3

/turf/simulated/floor/tiled/bar
	name = "bar floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "bar"
	initial_flooring = /decl/flooring/tiling/bar

/turf/simulated/floor/tiled/misc
	icon = 'icons/turf/flooring/misc.dmi'
	initial_flooring = /decl/flooring/tiling/misc
	icon_state = "steel"

/turf/simulated/floor/tiled/misc/sec
	icon_state = "sec_chess"
	initial_flooring = /decl/flooring/tiling/misc/sec

/turf/simulated/floor/tiled/misc/med
	icon_state = "tealwh_chess"
	initial_flooring = /decl/flooring/tiling/misc/med

/turf/simulated/floor/tiled/misc/cargo
	icon_state = "cargo_chess"
	initial_flooring = /decl/flooring/tiling/misc/cargo

/turf/simulated/floor/tiled/misc/blue
	icon_state = "blue_chess"
	initial_flooring = /decl/flooring/tiling/misc/blue

/turf/simulated/floor/tiled/misc/purple
	icon_state = "prwh_chess"
	initial_flooring = /decl/flooring/tiling/misc/purple

/turf/simulated/floor/tiled/ramp
	name = "foot ramp"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "ramptop"
	initial_flooring = /decl/flooring/reinforced/ramp

/turf/simulated/floor/tiled/ramp/bottom
	name = "foot ramp"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "rampbot"
	initial_flooring = /decl/flooring/reinforced/ramp/bottom

/turf/simulated/floor/tiled/bunker/
	name = "bunker floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "plating"
	initial_flooring = /decl/flooring/tiling/bunker/

/turf/simulated/floor/tiled/bunker/hydro
	name = "hydro floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "hydrofloor"
	initial_flooring = /decl/flooring/tiling/bunker/hydro

/turf/simulated/floor/tiled/bunker/showroom
	name = "showroom floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "showroomfloor"
	initial_flooring = /decl/flooring/tiling/bunker/showroom

/turf/simulated/floor/tiled/bunker/cafe
	name = "cafe floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "cafe"
	initial_flooring = /decl/flooring/tiling/bunker/cafe

/turf/simulated/floor/tiled/bunker/yellow
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "old_tile_cargo"
	initial_flooring = /decl/flooring/tiling/bunker/yellow

/turf/simulated/floor/tiled/bunker/black
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "old_tile_black"
	initial_flooring = /decl/flooring/tiling/bunker/black

/turf/simulated/floor/tiled/bunker/red
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "old_tile_red"
	initial_flooring = /decl/flooring/tiling/bunker/red

/turf/simulated/floor/tiled/bunker/polar
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "polar"
	initial_flooring = /decl/flooring/tiling/bunker/polar

/turf/simulated/floor/tiled/bunker/polar_white
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "polar_white"
	initial_flooring = /decl/flooring/tiling/bunker/polar_white

/turf/simulated/floor/tiled/bunker/polar_circuit
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "polar_circuit"
	initial_flooring = /decl/flooring/tiling/bunker/polar_circuit

/turf/simulated/floor/tiled/dark
	name = "dark floor"
	icon_state = "dark"
	initial_flooring = /decl/flooring/tiling/dark

/turf/simulated/floor/tiled/dark/airless
	initial_gas = null

/turf/simulated/floor/tiled/white
	name = "white floor"
	icon_state = "white"
	initial_flooring = /decl/flooring/tiling/white

/turf/simulated/floor/tiled/white/monotile
	name = "floor"
	icon_state = "monotile"
	initial_flooring = /decl/flooring/tiling/mono

/turf/simulated/floor/tiled/monofloor
	name = "floor"
	icon_state = "steel_monofloor"
	initial_flooring = /decl/flooring/tiling/new_tile/monofloor

/turf/simulated/floor/tiled/white/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/tiled/freezer
	name = "tiles"
	icon_state = "freezer"
	initial_flooring = /decl/flooring/tiling/freezer

/turf/simulated/floor/tiled/techmaint
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "techmaint"
	initial_flooring = /decl/flooring/tiling/new_tile/techmaint

/turf/simulated/floor/tiled/monofloor
	name = "floor"
	icon_state = "monofloor"
	initial_flooring = /decl/flooring/tiling/new_tile/monofloor

/turf/simulated/floor/tiled/techfloor
	name = "floor"
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_state = "techfloor_gray"
	initial_flooring = /decl/flooring/tiling/tech

/turf/simulated/floor/tiled/monotile
	name = "floor"
	icon_state = "steel_monotile"
	initial_flooring = /decl/flooring/tiling/mono

/turf/simulated/floor/tiled/steel_grid
	name = "floor"
	icon_state = "steel_grid"
	initial_flooring = /decl/flooring/tiling/new_tile/steel_grid

/turf/simulated/floor/tiled/steel_ridged
	name = "floor"
	icon_state = "steel_ridged"
	initial_flooring = /decl/flooring/tiling/new_tile/steel_ridged

/turf/simulated/floor/tiled/old_tile
	name = "floor"
	icon_state = "tile_full"
	initial_flooring = /decl/flooring/tiling/new_tile

/turf/simulated/floor/tiled/old_cargo
	name = "floor"
	icon_state = "cargo_one_full"
	initial_flooring = /decl/flooring/tiling/new_tile/cargo_one

/turf/simulated/floor/tiled/kafel_full
	name = "floor"
	icon_state = "kafel_full"
	initial_flooring = /decl/flooring/tiling/new_tile/kafel

/turf/simulated/floor/tiled/techfloor/grid
	name = "floor"
	icon_state = "techfloor_grid"
	initial_flooring = /decl/flooring/tiling/tech/grid

/turf/simulated/floor/lino
	name = "lino"
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_state = "lino"
	initial_flooring = /decl/flooring/linoleum

//ATMOS PREMADES
/turf/simulated/floor/reinforced/airless
	name = "vacuum floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/airless
	name = "airless plating"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/tiled/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/bluegrid/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/greengrid/airless
	name = "airless floor"
	initial_gas = null
	temperature = TCMB

/turf/simulated/floor/greengrid/nitrogen
	initial_gas = list("nitrogen" = MOLES_N2STANDARD)

// Placeholders
/turf/simulated/floor/airless/lava
	name = "lava"
	icon = 'icons/turf/flooring/lava.dmi'
	icon_state = "lava"

/turf/simulated/floor/ice
	name = "ice"
	icon = 'icons/turf/snow.dmi'
	icon_state = "ice"

/turf/simulated/floor/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/simulated/floor/snow/New()
	icon_state = pick("snow[rand(1,12)]","snow0")
	..()

/turf/simulated/floor/dirty
	name = "dirt"
	icon = 'icons/turf/dirt.dmi'
	icon_state = "dirt1"

/turf/simulated/floor/dirty/New()
	dir = pick(GLOB.alldirs)
	..()

/turf/simulated/floor/dirty/update_dirt()
	return	// Dirt doesn't doesn't become dirty


/turf/simulated/floor/helldirt
	name = "fleshy surface"
	icon = 'icons/turf/dirt.dmi'
	icon_state = "hell_dirt"

/turf/simulated/floor/hellslate
	name = "rock slate"
	icon = 'icons/turf/dirt.dmi'
	icon_state = "slat"

/turf/simulated/floor/light
/turf/simulated/floor/airless/ceiling

/turf/simulated/floor/beach
	name = "beach"
	icon = 'icons/misc/beach.dmi'

/turf/simulated/floor/beach/sand
	name = "sand"
	icon_state = "sand"

/turf/simulated/floor/beach/sand/desert
	icon_state = "desert"
	has_resources = 1

/turf/simulated/floor/beach/sand/desert/New()
	icon_state = "desert[rand(0,5)]"
	..()

/turf/simulated/floor/beach/coastline
	name = "coastline"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "sandwater"

/turf/simulated/floor/beach/water
	name = "water"
	icon_state = "water"

/turf/simulated/floor/beach/water/update_dirt()
	return	// Water doesn't become dirty

/turf/simulated/floor/beach/water/ocean
	icon_state = "seadeep"

/turf/simulated/floor/beach/water/New()
	..()
	overlays += image("icon"='icons/misc/beach.dmi',"icon_state"="water5","layer"=MOB_LAYER+0.1)
