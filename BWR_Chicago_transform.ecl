IMPORT $,STD;

Chicago := $.File_Chicago_otimizado;

rec2 := RECORD
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

rec2 MyTransf(Chicago.Layout Le, UNSIGNED cnt) := TRANSFORM
  SELF.row_id := cnt;
  SELF.day := STD.Date.FromStringToDate(Le.date[1..10], '%d/%m/%Y');
  SELF.time := STD.Date.TimeFromParts((UNSIGNED)Le.date[12..13],(UNSIGNED)Le.date[15..16],(UNSIGNED)Le.date[18..19]);
  SELF := Le;
END;

newds := PROJECT(Chicago.File,MyTransf(LEFT,COUNTER));

newds;