EXPORT File_Chicago_local := MODULE
	EXPORT rec_local := RECORD
			UNSIGNED local_id;
      STRING38 block;
      UNSIGNED1 communityarea;
      STRING3 district;
	END;
	// SHARED tbl_local := '~class::intro::plr::local';
	// EXPORT File := DATASET(tbl_local,rec_local,FLAT);
END;