IMPORT $;

rec_local := $.File_Chicago_local.rec_local;
rec_chicago := $.File_Chicago_chicago.rec_chicago;
tbl_local := $.BWR_Chicago_rollup;
tbl_chicago := $.BWR_Chicago_transform;

rec_crimes := RECORD
  RECORDOF(rec_chicago) AND NOT [block,communityarea,district];
	// UNSIGNED local_id;
  UNSIGNED local_id;
END;

rec_crimes Normalizar(rec_chicago Le, rec_local Ri) := TRANSFORM
  SELF := Le;
	// SELF.local_id := Ri.local_id;
  SELF := Ri;
END;

tbl_crimes := SORT(JOIN(tbl_chicago,tbl_local,LEFT.block=RIGHT.block,Normalizar(LEFT,RIGHT)),row_id);

tbl_crimes;