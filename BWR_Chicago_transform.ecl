IMPORT $,STD;

Chicago := $.File_Chicago_otimizado;

rec2 := RECORD
    UNSIGNED row_id;
    UNSIGNED day;
    UNSIGNED time;
    Chicago.Layout AND NOT date;
END;

rec2 MyTransf(Chicago.Layout Le, UNSIGNED cnt) := TRANSFORM
  SELF.row_id := cnt;
  SELF.day := STD.Date.FromStringToDate(Le.Date[1..10],'%m/%d/%Y');
  SELF.time := STD.Date.TimeFromParts(IF(Le.Date[21..22]='PM',
  IF(Le.Date[12..13]='12',12,(UNSIGNED)Le.Date[12..13]+12),
  IF(Le.Date[12..13]='12',0,(UNSIGNED)Le.Date[12..13])),
  (UNSIGNED)Le.Date[15..16],
  (UNSIGNED)Le.Date[18..19]);
  SELF := Le;
END;

newds := PROJECT(Chicago.File,MyTransf(LEFT,COUNTER));

newds;