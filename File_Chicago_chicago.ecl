﻿EXPORT File_Chicago_chicago := MODULE
	EXPORT rec_chicago := RECORD
		UNSIGNED row_id;
    UNSIGNED day;
    UNSIGNED time;
    UNSIGNED4 id;
    STRING9 casenumber;
    STRING38 block;
    STRING4 iucr;
    STRING33 primarytype;
    STRING60 description;
    STRING53 locationdescription;
    BOOLEAN arrest;
    BOOLEAN domestic;
    STRING4 beat;
    STRING3 district;
    UNSIGNED1 ward;
    UNSIGNED1 communityarea;
    STRING3 fbicode;
    UNSIGNED4 xcoordinate;
    UNSIGNED4 ycoordinate;
    UNSIGNED2 year;
    STRING22 updatedon;
    REAL8 latitude;
    REAL8 longitude;
    STRING29 location;
	END;
	EXPORT File := DATASET('~CLASS::plr::OUT::Chicago_chicago',Layout,FLAT);
	EXPORT IDX_LName_Fname := INDEX(File,{LastName,FirstName},{File},'~CLASS::hmw::KEY::Lname_Fname');
END;