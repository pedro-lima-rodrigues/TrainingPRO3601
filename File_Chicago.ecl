EXPORT File_Chicago := MODULE
	EXPORT Layout := RECORD
		STRING ID;
		STRING CaseNumber;
		STRING Date;
		STRING Block;
		STRING IUCR;
		STRING PrimaryType;
		STRING Description;
		STRING LocationDescription;
		BOOLEAN Arrest;
		BOOLEAN Domestic;
		STRING Beat;
		STRING District;
		STRING Ward;
		STRING CommunityArea;
		STRING FBICode;
		STRING XCoordinate;
		STRING YCoordinate;
		STRING Year;
		STRING UpdatedOn;
		STRING Latitude;
		STRING Longitude;
		STRING Location;
		END;
	EXPORT File := DATASET('~class::intro::plr::crimes_-_2001_to_present.csv', Layout, csv(heading(1)));
END;