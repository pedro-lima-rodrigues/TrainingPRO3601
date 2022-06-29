EXPORT NormAddrRecs := MODULE
  EXPORT Layout := RECORD
    UNSIGNED4 block_ID;
		STRING38 Block;
  END;
  EXPORT File := DATASET('~CLASS::plr::OUT::LookupBlock',Layout,THOR);
	EXPORT IDX_Addr := INDEX(File,{block},{block_id},'~chicago::plr::key::addr_block');
END;