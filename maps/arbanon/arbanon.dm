#if !defined(using_map_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "arbanon_announcements.dm"
	#include "arbanon_areas.dm"


	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"
	#include "arbanon_gamemodes.dm"
	#include "arbanon_presets.dm"
	#include "arbanon_shuttles.dm"
	#include "arbanon_elevator.dm"

	#include "arbanon-1.dmm"
	#include "arbanon-2.dmm"
	#include "arbanon-3.dmm"
	#include "arbanon-4.dmm"
	#include "arbanon-5.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/marooned/marooned.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/hydro/hydro.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/icarus/icarus.dm"
	#include "../away/errant_pisces/errant_pisces.dm"

	#define using_map_DATUM /datum/map/arbanon

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring arbanon
#endif
