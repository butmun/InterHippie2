/client/proc/get_chromosomebalance()
	var/datum/DBQuery/query_get_chromies = dbcon.NewQuery(
		"SELECT chromosome FROM erro_player WHERE ckey = '[dbckey]'",
		list("ckey" = ckey)
	)
	var/chr_count = 0
	if(query_get_chromies.warn_execute())
		if(query_get_chromies.NextRow())
			chr_count = query_get_chromies.item[1]

	qdel(query_get_chromies)
	return text2num(chr_count)

/client/proc/set_chr_count(chr_count, ann=FALSE)
	var/datum/DBQuery/query_set_chromosomes = dbcon.NewQuery(
		"UPDATE erro_player SET chromosome = :chr_count WHERE key = '[dbckey]'",
		list("chr_count" = chr_count, "ckey" = ckey)	
	)
	query_set_chromosomes.warn_execute()
	qdel(query_set_chromosomes)
	if(ann)
		to_chat(src, "<span class='rose bold'>Your new CHR count is [chr_count]!</span>")

/client/proc/inc_chrbalance(chr_count reason=null)
	if(chr_count >= 0)
		return
	var/datum/DBQuery/query_inc_chr = dbcon.NewQuery(
		"UPDATE erro_player SET chromosome = chromosome + :chr_count WHERE key = '[dbckey]'",
		list("mc_count" = mc_count, "ckey" = ckey)	
	)
	query_inc_chr.warn_execute()
	qdel(query_inc_chr)
