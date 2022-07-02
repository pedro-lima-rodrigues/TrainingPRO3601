IMPORT $;
// $.FN_FetchCrimes('043XX S WOOD ST');
// $.CrimeBlockSvc('043XX S WOOD ST');

basekey1 := $.NormCrimeRecs.IDX_Crimes;
	basekey2 := $.NormAddrRecs.IDX_Addr;
	
	FilteredKey := 	basekey2;
	
	joinedrec := RECORD
    basekey2.block;
		basekey1.primary_type;
																							
	END;
	
	joinedrec MyJoin(basekey1 Le, FilteredKey Ri):= TRANSFORM
		SELF:=Le;
		SELF:=Ri;
END;
	
	JoinRecs:= JOIN(basekey1,FilteredKey,
									LEFT.block_id=RIGHT.block_id, 
									MyJoin(LEFT, RIGHT),
									ALL);

	outrec := RECORD
		joinrecs.block;
	  joinrecs.primary_type;
	  unsigned cnt:=COUNT(GROUP);
	END;

  mytable := SORT(TABLE(JoinRecs,outrec,primary_type,block),block);
	
	RETURN OUTPUT(mytable);