EXPORT File_Chicago_local := MODULE
	EXPORT rec_local := RECORD
			UNSIGNED local_id;
      STRING38 block;
      UNSIGNED1 communityarea;
      STRING3 district;
	END;
  EXPORT File := DATASET('~CLASS::plr::OUT::Chicago_local',Layout,FLAT);
	EXPORT IDX_LName_Fname := INDEX(File,{LastName,FirstName},{File},'~CLASS::hmw::KEY::Lname_Fname');
END;