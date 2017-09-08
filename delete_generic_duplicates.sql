DELETE FROM 
	-- table_name
WHERE id IN (
	SELECT 
		id
	FROM (
			SELECT 
				id,
				ROW_NUMBER() OVER (partition BY /*column*/, /*names*/, /*go here*/ ORDER BY id) AS rnum
			FROM twitch_stream_session
		) t
	WHERE t.rnum > 1
);
