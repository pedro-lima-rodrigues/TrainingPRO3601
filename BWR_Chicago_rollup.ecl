IMPORT $;

// EXPORT BWR_Chicago_rollup := MODULE

  chicago := $.BWR_Chicago_transform;

  rec_local := RECORD
    UNSIGNED local_id := chicago.row_id;
    chicago.block;
    chicago.communityarea;
    chicago.district;
  END;

  tbl_local := TABLE(chicago,rec_local);
  // tbl_local;
  // count(tbl_local);
  // profileResults := STD.DataPatterns.Profile(tbl_local);
  // profileResults;
  tbl_local_ord := SORT(tbl_local,block);

  rec_local Normalizar(rec_local Le, rec_local Ri) := TRANSFORM
    SELF.local_id := if(Le.local_id<Ri.local_id,Le.local_id,Ri.local_id);
    SELF := Le;
  END;
  EXPORT BWR_Chicago_rollup := ROLLUP(tbl_local_ord,LEFT.block=RIGHT.block,
                                   Normalizar(LEFT,RIGHT));
  // tbl_local_norm;
  // count(tbl_local_norm);
