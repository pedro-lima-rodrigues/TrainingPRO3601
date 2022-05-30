IMPORT $;

EstaEntre := $.File_Chicago_otimizado.File.year>=2010 AND $.File_Chicago_otimizado.File.year<=2020;
recset := $.File_Chicago_otimizado.File(EstaEntre);

rec2 := RECORD
  recset.year;
  cnt := COUNT(GROUP);
END;

crosstab := SORT(TABLE(recset,rec2,year),year);
crosstab;

avg := AVE(crosstab,cnt);
ROUND(avg);