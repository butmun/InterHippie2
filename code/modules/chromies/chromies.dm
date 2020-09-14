/client/proc/get_chromosomebalance()
	var/dbckey = sql_sanitize_text(ckey)
	establish_db_connection()

	var/DBQuery/query_get_chromies = dbcon.NewQuery(
		"SELECT chromosome FROM erro_player WHERE ckey = '[dbckey]'",
		list("dbckey" = dbckey)
	)

	query_get_chromies.Execute()

	var/chr_count = 0
	if(query_get_chromies.NextRow())
		chr_count = query_get_chromies.item[1]

	qdel(query_get_chromies)
	return num2text(chr_count)

/client/proc/set_chr_count(chr_count, ann=FALSE)
	var/dbckey = sql_sanitize_text(ckey)
	establish_db_connection()

	var/DBQuery/query_set_chromosomes = dbcon.NewQuery(
		"UPDATE erro_player SET chromosome = :chr_count WHERE key = '[dbckey]'",
		list("chr_count" = chr_count, "ckey" = ckey)
	)
	query_set_chromosomes.Execute()
	qdel(query_set_chromosomes)
	if(ann)
		to_chat(src, "<span class='rose bold'>Your new CHR count is [chr_count]!</span>")

/client/proc/inc_chrbalance(chr_count, reason=null)
	var/dbckey = sql_sanitize_text(ckey)
	establish_db_connection()

	if(chr_count >= 0)
		return
	var/DBQuery/query_inc_chr = dbcon.NewQuery(
		"UPDATE erro_player SET chromosome = chromosome + :chr_count WHERE key = '[dbckey]'",
		list("chr_count" = chr_count, "ckey" = ckey)
	)
	query_inc_chr.Execute()
	qdel(query_inc_chr)
