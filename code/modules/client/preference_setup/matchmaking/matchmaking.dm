var/global/datum/matchmaker/matchmaker = new()

/hook/roundstart/proc/matchmaking()
	return TRUE

/datum/matchmaker
	var/list/families = list()
	var/list/relation_types = list()
	var/list/relations = list()

/datum/matchmaker/New()
	..()
	for(var/T in subtypesof(/datum/relation/))
		var/datum/relation/R = T
		relation_types[initial(R.name)] = T


/datum/matchmaker/proc/add_relations_to_notes()
	//Add families to notes
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		H.mind.store_memory("<big><b>Family:</b></big>\n")
		for(var/datum/relation/family/R in matchmaker.get_relationships(H.mind))
			to_world("This person is our relative: [R.connected_relation.relation_holder.current.name] But this doesnt work [R.connected_relation.relation_holder.current.name]")
			H.mind.store_memory("[R.connected_relation.relation_holder.current.name] is my [R.name].\n")

/datum/matchmaker/proc/do_matchmaking()
	var/list/to_warn = list()
	for(var/datum/relation/R in relations)
		if(!R.connected_relation && R.family_flag == 0)
			R.find_match()
		if(R.connected_relation && !R.finalized)
			to_warn |= R.relation_holder.current
	for(var/mob/M in to_warn)
		to_chat(M,"<span class='warning'>You have new connections. Use \"See Relationship Info\" to view and finalize them.</span>")

//This is where the families are made.  This is basically the big driver of everything.
/datum/matchmaker/proc/do_family_matchmaking()
	var/total_familes = round(GLOB.player_list.len * 0.2) + 1  // How many families we want Makes around 1 family per 4 people, and always at least on family
	var/list/player_list_copy = GLOB.player_list.Copy()
	//First setup families, and remove the family heads from the list
	while(families.len < total_familes)
		var/mob/living/carbon/human/pick_human = pick(GLOB.player_list)  //To make heads of families random (for now)
		var/datum/family/F = new /datum/family(pick_human)
		families |= F
		player_list_copy.Remove(pick_human)
	//Now that familes are created, add any left over humans to them
	for(var/mob/living/carbon/human/H in player_list_copy)
		var/datum/family/F = pick(families)
		F.add_member(H)
	/* //Prints familes and memebers
	for(var/datum/family/F in families)
		to_world("Families head: [F.family_head.mind] Families last name = [F.name] Memebers are:")
		for(var/mob/living/carbon/human/M in F.members)
			to_world("Member: [M.real_name]")
	*/
	//Testing stuff
	/*
	var/list/test_player_list = list("John Doe", "Jane Dane", "Harold buster", "Jame righter", "Matt James", "Tim Panda", "Stever Typing", "The doom", "Debbie Downer", "Frail Mike")
	total_familes = round(test_player_list.len * 0.2)  // How many families we want Makes around 1 family per 4 people
	for(var/H in test_player_list)
		if(families.len < total_familes) // If we aren't at our limit yet, we make five ned players head of house
			var/datum/family/F = new /datum/family/(pick(test_player_list))
			families |= F
		else							 // If we are at our limit, start adding people to familes
			var/datum/family/F = pick(families)
			F.add_member(H)
	//Prints familes
	for(var/datum/family/F in families)
		to_world("Families head: [F.family_head] Families last name = [F.name] Memebers are:")
		for(var/M in F.members)
			to_world("Member: [M]")
	*/

/datum/matchmaker/proc/get_relationships(datum/mind/M)
	. = list()
	for(var/datum/relation/R in relations)
		if(R.relation_holder == M && R.connected_relation)
			. += R

//Types of relations

/datum/relation
	var/name = "Acquaintance"
	var/desc = "You just know them."
	var/list/can_connect_to	//What relations (names) can matchmaking join us with? Defaults to own name.
	var/list/incompatible 	//If we have relation like this with the mob, we can't join
	var/datum/mind/relation_holder  //Whoever owns this relationship
	var/datum/relation/connected_relation  //Whatever relationship this is connected to
	var/info
	var/finalized
	var/open = 2			//If non-zero, allow connected_relation relations to form connections
	var/family_flag = 0 //So we don't show family relations in options

/datum/relation/New()
	..()
	if(!can_connect_to)
		can_connect_to = list(name)
	matchmaker.relations += src

/datum/relation/proc/get_candidates()
	.= list()
	for(var/datum/relation/R in matchmaker.relations)
		if(!valid_candidate(R.relation_holder) || !can_connect(R))
			continue
		. += R

/datum/relation/proc/valid_candidate(datum/mind/M)
	if(M == relation_holder)	//no, you NEED connected_relation people
		return FALSE

	if(!M.current)	//no extremely platonic relationships
		return FALSE

	var/datum/antagonist/special_role_data = get_antag_data(M.special_role)
	if(special_role_data && (special_role_data.flags & ANTAG_OVERRIDE_JOB))
		return FALSE

	return TRUE

/datum/relation/proc/can_connect(var/datum/relation/R)
	for(var/datum/relation/D in matchmaker.relations) //have to check all connections between us and them
		if(D.relation_holder == R.relation_holder && D.connected_relation && D.connected_relation.relation_holder == relation_holder)
			if(D.name in incompatible)
				return 0
	return (R.name in can_connect_to) && !(R.name in incompatible) && R.open

/datum/relation/proc/get_copy()
	var/datum/relation/R = new type
	R.relation_holder = relation_holder
	R.info = relation_holder.current && info
	R.open = 0
	return R

/datum/relation/proc/find_match()
	var/list/candidates = get_candidates()
	if(!candidates.len) //bwoop bwoop
		return 0
	var/datum/relation/R = pick(candidates)
	R.open--
	if(R.connected_relation)
		R = R.get_copy()
	connected_relation = R
	R.connected_relation = src
	return 1

/datum/relation/proc/sever()
	to_chat(relation_holder.current,"<span class='warning'>Your connection with [connected_relation.relation_holder] is no more.</span>")
	to_chat(connected_relation.relation_holder.current,"<span class='warning'>Your connection with [relation_holder] is no more.</span>")
	connected_relation.connected_relation = null
	matchmaker.relations -= connected_relation
	matchmaker.relations -= src
	qdel(connected_relation)
	connected_relation = null
	qdel(src)

//Finalizes and propagates info if both sides are done.
/datum/relation/proc/finalize()
	finalized = 1
	to_chat(relation_holder.current,"<span class='warning'>You have finalized a connection with [connected_relation.relation_holder].</span>")
	to_chat(connected_relation.relation_holder.current,"<span class='warning'>[relation_holder] has finalized a connection with you.</span>")
	if(connected_relation && connected_relation.finalized)
		to_chat(relation_holder.current,"<span class='warning'>Your connection with [connected_relation.relation_holder] is now confirmed!</span>")
		to_chat(connected_relation.relation_holder.current,"<span class='warning'>Your connection with [relation_holder] is now confirmed!</span>")
		var/list/candidates = filter_list(GLOB.player_list, /mob/living/carbon/human)
		candidates -= relation_holder.current
		candidates -= connected_relation.relation_holder.current
		for(var/mob/living/carbon/human/M in candidates)
			if(!M.mind || M.stat == DEAD || !valid_candidate(M.mind))
				candidates -= M
				continue
			var/datum/job/coworker = job_master.GetJob(M.job)
			if(coworker && relation_holder.assigned_job && connected_relation.relation_holder.assigned_job)
				if((coworker.department_flag & relation_holder.assigned_job.department_flag) || (coworker.department_flag & connected_relation.relation_holder.assigned_job.department_flag))
					candidates[M] = 5	//coworkers are 5 times as likely to know about your relations

		for(var/i=1 to 5)
			if(!candidates.len)
				break
			var/mob/M = pickweight(candidates)
			candidates -= M
			if(!M.mind.known_connections)
				M.mind.known_connections = list()
			if(prob(70))
				M.mind.known_connections += get_desc_string()
			else
				M.mind.known_connections += "[relation_holder] and [connected_relation.relation_holder] seem to know each connected_relation, but you're not sure on the details."

/datum/relation/proc/get_desc_string()
	return "[relation_holder] and [connected_relation.relation_holder] know each connected_relation."
